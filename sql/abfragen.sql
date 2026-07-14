-- =====================================================================
-- ShopSphere Analytics Project
-- Block 1: SQL-Datenaufbereitung
-- Tool: sqliteonline.com
-- =====================================================================
-- Hinweis: Alle Abfragen basieren auf den 5 CSV-Tabellen (shopsphere_customers,
-- shopsphere_products, shopsphere_orders, shopsphere_order_items, shopsphere_marketing), 
-- die zuvor in sqliteonline.com importiert wurden. 
-- Jede Abfrage bereitet einen Datensatz für die spätere Visualisierung in Tableau (Block 2) vor.
-- =====================================================================

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
    c.customer_id AS customer_id,
    c.region AS region,
    c.acquisition_channel AS acquisition_channel,
    COUNT(o.order_id) AS orders_count,
    ROUND(SUM(o.net_amount), 2) AS total_spent
FROM shopsphere_orders o
JOIN shopsphere_customers c USING (customer_id)
GROUP BY c.customer_id, c.region, c.acquisition_channel
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
-- 1.4 Kunden, deren Gesamtausgaben über dem Durchschnitt aller Kunden  liegen (mittels Unterabfrage / CTE)
--     Frage: Wie viele sind es? Welcher Anteil am Gesamtumsatz?
-- ---------------------------------------------------------------------

WITH customer_totals AS (
    SELECT
        customer_id,
        SUM(o.net_amount) AS total_spent
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
    channel AS channel,
    ROUND(SUM(budget), 2) AS total_budget,
    ROUND(SUM(attributed_revenue), 2) AS total_attributed_revenue,
    ROUND(SUM(attributed_revenue) * 1.0 / SUM(budget), 2) AS roi
FROM shopsphere_marketing
GROUP BY channel
ORDER BY roi DESC;

-- ---------------------------------------------------------------------
