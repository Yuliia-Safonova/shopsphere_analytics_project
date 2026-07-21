-- =====================================================================
-- ShopSphere Analytics Project — Alle SQL-Abfragen
-- Autorin: Yuliia Safonova
-- Tool: sqliteonline.com (SQLite-Dialekt)
-- =====================================================================
-- Hinweis: Alle Abfragen basieren auf den 5 CSV-Tabellen (shopsphere_customers,
-- shopsphere_products, shopsphere_orders, shopsphere_order_items, shopsphere_marketing),
-- die zuvor in sqliteonline.com importiert wurden.
--
-- WICHTIGER TECHNISCHER HINWEIS:
-- Beim CSV-Import in sqliteonline.com wurden die Spaltennamen "acquisition_channel"
-- und "attributed_revenue" automatisch auf "acquisition_chan" bzw. "attributed_reven"
-- gekürzt (technische Zeichenlimitierung des Tools, keine Abweichung im Originaldatensatz).
-- In den betroffenen Abfragen werden diese Spalten daher per AS wieder auf ihren
-- ursprünglichen, vollständigen Namen umbenannt, um Konsistenz mit der Aufgabenstellung
-- und mit Tableau zu gewährleisten.
--
-- Gliederung dieser Datei:
--   BLOCK 1  — Datenaufbereitung (Fragen 1.1–1.5)
--   BLOCK 2  — Zusatzabfrage für die Kreativaufgabe 2.6
--   BLOCK 4  — Strategische Geschäftsfälle (Fragen 4, 8, 9 + Verifikation)
--   BLOCK 5  — A/B-Experiment (Fragen 10, 11)
-- Screenshots der jeweiligen Abfrageergebnisse: sql/ergebnisse/
-- =====================================================================


-- #######################################################################
-- BLOCK 1 — SQL: Datenaufbereitung
-- #######################################################################

-- ---------------------------------------------------------------------
-- 1.1 Netto-Umsatz, Bestellanzahl und durchschnittlicher Bestellwert pro REGION und JAHR
--     JOIN: shopsphere_orders <-> shopsphere_customers (über customer_id)
-- ---------------------------------------------------------------------

SELECT
    c.region  AS region,
    o.order_year AS order_year,
    COUNT(o.order_id) AS order_count,
    ROUND(SUM(o.net_amount), 2) AS total_spent,
    ROUND(AVG(o.net_amount), 2) AS avg_order_value
FROM shopsphere_orders o
JOIN shopsphere_customers c USING (customer_id)
GROUP BY c.region, o.order_year
ORDER BY c.region, o.order_year;

-- ---------------------------------------------------------------------
-- 1.2 Top-10-Kunden nach Gesamtausgaben
--     Ausgabe: Region, Akquisitionskanal, Anzahl Bestellungen
--     JOIN: shopsphere_orders <-> shopsphere_customers (über customer_id)
-- ---------------------------------------------------------------------

SELECT
    c.customer_id,
    c.region,
    c.acquisition_chan AS acquisition_channel,
    COUNT(o.order_id) AS orders_count,
    ROUND(SUM(o.net_amount), 2) AS total_spent
FROM shopsphere_orders o
JOIN shopsphere_customers c USING (customer_id)
GROUP BY c.customer_id, c.region, c.acquisition_chan
ORDER BY total_spent DESC
LIMIT 10;

-- ---------------------------------------------------------------------
-- 1.3 Pro Produktkategorie: Gesamtumsatz, durchschnittliche Marge (margin_pct) und Retourenquote
--     JOIN: shopsphere_order_items <-> shopsphere_products <-> shopsphere_orders
--     Anmerkung: Die Retourenquote wird auf Positionsebene berechnet -
--     ist die zugehörige Bestellung retourniert (is_returned = 1), zählt die Position als "retourniert".
-- ---------------------------------------------------------------------

SELECT
    oi.category AS category,
    ROUND(SUM(oi.line_total), 2) AS total_revenue,
    ROUND(AVG(p.margin_pct), 2) AS avg_margin_pct,
    ROUND(AVG(o.is_returned) * 100, 2) AS return_share_pct
FROM shopsphere_order_items oi
JOIN shopsphere_products p USING (product_id)
JOIN shopsphere_orders o USING (order_id)
GROUP BY oi.category
ORDER BY total_revenue DESC;

-- ---------------------------------------------------------------------
-- 1.4 Kunden, deren Gesamtausgaben über dem Durchschnitt aller Kunden liegen (mittels Unterabfrage / CTE)
--     Frage: Wie viele sind es? Welcher Anteil am Gesamtumsatz?
-- ---------------------------------------------------------------------

WITH customer_totals AS (
    SELECT
        customer_id,
        SUM(net_amount) AS total_spent
    FROM shopsphere_orders
    GROUP BY customer_id
)
SELECT
    COUNT(*) AS customers_above_avg,
    ROUND(SUM(total_spent), 2) AS revenue_above_avg,
    ROUND(SUM(total_spent) * 100.0 / (SELECT SUM(net_amount) FROM shopsphere_orders), 2) AS pct_of_total_revenue
FROM customer_totals
WHERE total_spent > (SELECT AVG(total_spent) FROM customer_totals);

-- ---------------------------------------------------------------------
-- 1.5 Pro Marketingkanal: Gesamtbudget, zugeordneter Umsatz und ROI
--     ROI = attributed_revenue / budget
-- ---------------------------------------------------------------------

SELECT
    channel,
    ROUND(SUM(budget), 2) AS total_budget,
    ROUND(SUM(attributed_reven), 2) AS total_attributed_revenue,
    ROUND(SUM(attributed_reven) * 1.0 / SUM(budget), 2) AS roi
FROM shopsphere_marketing
GROUP BY channel
ORDER BY roi DESC;


-- #######################################################################
-- BLOCK 2 — Zusatzabfrage für Aufgabe 2.6 (freies Thema)
-- Untersuchter Aspekt: Schwelleneffekt der kostenlosen Lieferung ($50)
-- Verteilung der Bestellanzahl je Dollar-Betrag im Bereich $30–$80,
-- inkl. Anteil der Bestellungen mit kostenloser Lieferung je Betragsstufe
-- #######################################################################

SELECT
    CAST(gross_amount AS INT) AS order_amount,
    COUNT(*) AS order_count,
    ROUND(AVG(free_shipping), 2) AS free_shipping_share
FROM shopsphere_orders
WHERE gross_amount BETWEEN 30 AND 80
GROUP BY CAST(gross_amount AS INT)
ORDER BY order_amount;


-- #######################################################################
-- BLOCK 4 — Strategische Business Cases
-- Fragen 3 und 6 nutzen die bereits vorhandenen Ergebnisse aus Block 1
-- (Abfragen 1.5 bzw. 1.3) und benötigen keine neuen Abfragen.
-- #######################################################################

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
--     Hinweis: 150 ist ein fester Wert (5% von 3.000 Kunden aus
--     Abfrage 1.4 bestätigt), daher direkt als LIMIT verwendet statt
--     einer dynamischen Unterabfrage.
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
-- 4.4 (Frage 9 – Verifikation) Unabhängige Bestätigung von Abfrage 4.3
--     Statt LIMIT wird hier ROW_NUMBER() über eine explizite Rangfolge
--     verwendet, um Kundenanzahl, Gesamtumsatz und Umsatzanteil der
--     Top-150-Kunden auf einem zweiten, unabhängigen Weg zu berechnen
--     und so das Ergebnis aus 4.3 gegenzuprüfen.
-- ---------------------------------------------------------------------
WITH customer_totals AS (
    SELECT
        customer_id,
        SUM(net_amount) AS total_spent
    FROM shopsphere_orders
    GROUP BY customer_id
),
ranked AS (
    SELECT
        customer_id,
        total_spent,
        ROW_NUMBER() OVER (ORDER BY total_spent DESC) AS rnk
    FROM customer_totals
)
SELECT
    COUNT(*) AS customer_count,
    ROUND(SUM(total_spent), 2) AS total_revenue,
    ROUND(SUM(total_spent) * 100.0 / (SELECT SUM(net_amount) FROM shopsphere_orders), 2) AS pct_of_total
FROM ranked
WHERE rnk <= 150;


-- #######################################################################
-- BLOCK 5 — Statistisches Denken: A/B-Experiment
-- Kontext: Checkout-Redesign-Experiment ab 1. Juni 2024.
-- Nur Bestellungen mit ab_variant IN ('A', 'B') werden berücksichtigt.
-- #######################################################################

-- ---------------------------------------------------------------------
-- 5.1 (Frage 10) Durchschnittlicher Bestellwert je A/B-Variante
--     Gesamtvergleich ohne Segmentierung ("erster Blick").
-- ---------------------------------------------------------------------
SELECT
    ab_variant,
    COUNT(*) AS order_count,
    ROUND(AVG(net_amount), 2) AS avg_order_value
FROM shopsphere_orders
WHERE ab_variant IN ('A', 'B')
GROUP BY ab_variant
ORDER BY ab_variant;


-- ---------------------------------------------------------------------
-- 5.2 (Frage 11) Durchschnittlicher Bestellwert je A/B-Variante,
--     segmentiert nach Neukunde vs. Bestandskunde.
--     "Neukunde" = erste Bestellung des Kunden UND innerhalb von
--     60 Tagen nach Registrierung (signup_date).
-- ---------------------------------------------------------------------
WITH customer_first_order AS (
    SELECT
        customer_id,
        MIN(order_date) AS first_order_date
    FROM shopsphere_orders
    GROUP BY customer_id
)
SELECT
    o.ab_variant,
    CASE
        WHEN o.order_date = cfo.first_order_date
             AND julianday(o.order_date) - julianday(c.signup_date) <= 60
        THEN 'Neukunde'
        ELSE 'Bestandskunde'
    END AS customer_type,
    COUNT(*) AS order_count,
    ROUND(AVG(o.net_amount), 2) AS avg_order_value
FROM shopsphere_orders o
JOIN shopsphere_customers c USING (customer_id)
JOIN customer_first_order cfo USING (customer_id)
WHERE o.ab_variant IN ('A', 'B')
GROUP BY o.ab_variant, customer_type
ORDER BY customer_type, o.ab_variant;
