-- =====================================================================
-- ShopSphere Analytics Project — Block 5: A/B-Experiment
-- Autorin: Yuliia Safonova
-- Tool: sqliteonline.com (SQLite-Dialekt)
-- =====================================================================
-- Kontext: Checkout-Redesign-Experiment ab 1. Juni 2024.
-- Nur Bestellungen mit ab_variant IN ('A', 'B') werden berücksichtigt.
-- =====================================================================


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
