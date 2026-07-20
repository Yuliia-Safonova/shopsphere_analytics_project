-- =====================================================================
-- ShopSphere Analytics Project — Block 4: Strategische Business Cases
-- Autorin: Yuliia Safonova
-- Tool: sqliteonline.com (SQLite-Dialekt)
-- =====================================================================
-- Hinweis: Fragen 3 und 6 nutzen die bereits vorhandenen Ergebnisse aus
-- Block 1 (Abfragen 1.5 bzw. 1.3) und benötigen keine neuen Abfragen.
-- Unten folgen 4 Abfragen für Fragen 4, 8 und 9 sowie eine unabhängige
-- Verifikationsabfrage (4.4) zur Bestätigung von Frage 9.
-- =====================================================================


-- ---------------------------------------------------------------------
-- 4.1 (Frage 4) LTV pro Akquisitionskanal
--     Durchschnittliche Gesamtausgaben eines Kunden, gruppiert nach
--     acquisition_chan. Aggregation auf Kundenebene (nicht Bestellebene),
--     damit Kanäle mit vielen kleinen Bestellungen das Bild nicht verzerren.
-- ---------------------------------------------------------------------
WITH customer_totals AS (
    SELECT
        customer_id,
        SUM(net_amount) AS total_spent
    FROM shopsphere_orders
    GROUP BY customer_id
)
SELECT
    c.acquisition_chan,
    COUNT(*) AS customer_count,
    ROUND(AVG(ct.total_spent), 2) AS avg_ltv
FROM customer_totals ct
JOIN shopsphere_customers c USING (customer_id)
GROUP BY c.acquisition_chan
ORDER BY avg_ltv DESC;


-- ---------------------------------------------------------------------
-- 4.2 (Frage 8) Rabatt-Käufer vs. übrige Kunden
--     Kunden mit durchschnittlichem Rabatt > 20% vs. Rest,
--     verglichen nach Anzahl Bestellungen pro Kunde.
-- ---------------------------------------------------------------------
WITH customer_discount AS (
    SELECT
        customer_id,
        AVG(discount_pct) AS avg_discount,
        COUNT(order_id) AS order_count
    FROM shopsphere_orders
    GROUP BY customer_id
)
SELECT
    CASE
        WHEN avg_discount > 20 THEN 'Rabatt-Käufer (>20%)'
        ELSE 'Übrige Kunden'
    END AS customer_segment,
    COUNT(*) AS customer_count,
    ROUND(AVG(order_count), 2) AS avg_orders_per_customer
FROM customer_discount
GROUP BY customer_segment;


-- ---------------------------------------------------------------------
-- 4.3 (Frage 9) Top-5%-Kunden nach Region und Akquisitionskanal
--     Dieselbe Kundengruppe wie im Pareto-Chart aus Block 2
--     (150 von 3.000 Kunden = Top 5%), aufgeschlüsselt nach Herkunft.
--     Hinweis: 150 ist ein fester, mehrfach unabhängig bestätigter Wert
--     (Pareto-Kurve in Tableau, Block 2, sowie Tableau-Set
--     "Top-150_customers"), daher direkt als LIMIT verwendet statt
--     einer dynamischen Unterabfrage. Zusätzliche SQL-seitige
--     Verifikation siehe Abfrage 4.4 unten.
-- ---------------------------------------------------------------------
WITH customer_totals AS (
    SELECT
        customer_id,
        SUM(net_amount) AS total_spent
    FROM shopsphere_orders
    GROUP BY customer_id
),
top5_customers AS (
    SELECT customer_id, total_spent
    FROM customer_totals
    ORDER BY total_spent DESC
    LIMIT 150
)
SELECT
    c.region,
    c.acquisition_chan,
    COUNT(*) AS customer_count,
    ROUND(SUM(t.total_spent), 2) AS total_revenue
FROM top5_customers t
JOIN shopsphere_customers c USING (customer_id)
GROUP BY c.region, c.acquisition_chan
ORDER BY total_revenue DESC;


-- ---------------------------------------------------------------------
-- 4.4 (Zusatzcheck) Unabhängige Verifikation von Frage 9
--     Alternative Berechnung mittels ROW_NUMBER() statt LIMIT,
--     zur Bestätigung der Top-150-Kunden-Kennzahlen aus Abfrage 4.3.
--     Ergebnis: 150 Kunden, $1.218.211,48, 35,07% – identisch zu 4.3.
-- ---------------------------------------------------------------------
WITH customer_totals AS (
    SELECT customer_id, SUM(net_amount) AS total_spent
    FROM shopsphere_orders
    GROUP BY customer_id
),
ranked AS (
    SELECT customer_id, total_spent,
           ROW_NUMBER() OVER (ORDER BY total_spent DESC) AS rnk
    FROM customer_totals
)
SELECT
    COUNT(*) AS customer_count,
    ROUND(SUM(total_spent), 2) AS total_revenue,
    ROUND(SUM(total_spent) * 100.0 / (SELECT SUM(net_amount) FROM shopsphere_orders), 2) AS pct_of_total
FROM ranked
WHERE rnk <= 150;
