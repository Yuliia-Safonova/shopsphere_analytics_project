# 🎓 Abschlussprojekt des Kurses
## ShopSphere: Analyse eines globalen Marktplatzes

**SQL · Visualisierung · Dashboards · Business-Analyse · Statistisches Denken**

---

## Datenquellen

| Tabelle | Referenz |
|---|---|
| Customers | shopsphere_customers |
| Products | shopsphere_products |
| Orders | shopsphere_orders |
| Order_items | shopsphere_order_items |
| Marketing | shopsphere_marketing |

---

## Ausgangslage (Briefing)

Willkommen im Team von **ShopSphere** – einem globalen Online-Marktplatz, der Produkte aus 7 Kategorien in 5 Weltregionen verkauft. Sie sind Data Analyst und wurden zu einer strategischen Sitzung mit der Geschäftsführung eingeladen.

Die CEO wendet sich an Sie:

> „Wir wachsen, aber ich verstehe unser Geschäft noch nicht vollständig. Wohin fließt das Marketingbudget, und arbeitet es effizient? Wer sind unsere wertvollsten Kunden? Welche Kategorien sind wirklich profitabel, und welche erzeugen nur die Illusion von Umsatzvolumen? Welche Regionen sind unsere Zukunft? Und ich habe gehört, das Produktteam hat ein Experiment beim Checkout gestartet – hat es funktioniert oder nicht? Ich brauche datengestützte Antworten und ein verständliches Dashboard für den Aufsichtsrat.“

Ihnen stehen 5 Datentabellen für den Zeitraum **2022–2024** zur Verfügung. Ihre Aufgabe ist es, einen vollständigen analytischen Zyklus zu durchlaufen: Daten mittels SQL extrahieren und zusammenführen, Visualisierungen und ein Dashboard in Tableau erstellen, strategische Geschäftsfragen beantworten und statistisches Denken auf das Experiment anwenden. Dies ist das Abschlussprojekt – zeigen Sie alles, was Sie gelernt haben.

> 💡 Dies ist der Höhepunkt des Kurses. Das Projekt ist bewusst umfangreicher als die vorherigen: Es verbindet SQL mit mehreren JOINs, Unterabfragen (Subqueries), Visualisierung, Dashboard-Design, Business-Interpretation und statistisches Denken. Perfektion ist nicht erforderlich – wichtig ist, einen kohärenten analytischen Gedankengang zu zeigen.

---

## Daten: 5 Tabellen

Alle Tabellen sind über Schlüssel miteinander verknüpft. Das Beziehungsschema (Entity-Relationship) ist eigenständig zu erstellen – das gehört zur Arbeit eines Analysten. CSV-Dateien für den SQL-Teil in sqliteonline.com importieren, anschließend für die Visualisierung in Tableau.

### `customers` – Kunden (3.000 Datensätze)

| Spalte | Beschreibung | Typ |
|---|---|---|
| `customer_id` * | Eindeutige Kunden-ID | Ganzzahl |
| `region` | Region (North America, Europe, Southeast Asia, Latin America, Middle East) | Text |
| `country` | Land | Text |
| `age` | Alter | Ganzzahl |
| `gender` | Geschlecht (M / F) | Text |
| `acquisition_channel` | Akquisitionskanal (wie der Kunde erstmals gewonnen wurde) | Text |
| `signup_date` | Registrierungsdatum | Datum |

### `products` – Produkte (250 Datensätze)

| Spalte | Beschreibung | Typ |
|---|---|---|
| `product_id` * | Eindeutige Produkt-ID | Ganzzahl |
| `category` | Kategorie (Electronics, Clothing, Beauty, Home & Kitchen, Sports, Books, Toys) | Text |
| `product_name` | Produktname | Text |
| `price` | Verkaufspreis, USD | Dezimalzahl |
| `cost` | Selbstkosten, USD (für die Margenberechnung) | Dezimalzahl |
| `margin_pct` | Marge, % (Profitabilität des Produkts) | Dezimalzahl |

### `orders` – Bestellungen (~12.300 Datensätze) — Haupttabelle

| Spalte | Beschreibung | Typ |
|---|---|---|
| `order_id` * | Eindeutige Bestell-ID | Ganzzahl |
| `customer_id` | Kunden-ID → JOIN mit `customers` | Ganzzahl |
| `order_date` | Bestelldatum | Datum |
| `order_year` | Jahr (2022–2024) | Ganzzahl |
| `order_month` | Monat (1–12) | Ganzzahl |
| `device` | Gerät (Mobile, Desktop, Tablet) | Text |
| `channel` | Marketingkanal dieser Bestellung | Text |
| `discount_pct` | Rabatt auf die Bestellung, % | Ganzzahl |
| `gross_amount` | Betrag vor Rabatt, USD | Dezimalzahl |
| `discount_amount` | Rabattbetrag, USD | Dezimalzahl |
| `net_amount` | Nettobetrag der Bestellung, USD | Dezimalzahl |
| `free_shipping` | Kostenloser Versand (1 = ja, Schwelle 50 USD) | Ganzzahl |
| `ab_variant` | A/B-Test-Gruppe (A / B / leer, falls nicht im Experiment) | Text |
| `is_returned` | Wurde die Bestellung retourniert (1 / 0) | Ganzzahl |

### `order_items` – Bestellpositionen (~26.000 Datensätze)

| Spalte | Beschreibung | Typ |
|---|---|---|
| `item_id` * | Eindeutige Positions-ID | Ganzzahl |
| `order_id` | Bestell-ID → JOIN mit `orders` | Ganzzahl |
| `product_id` | Produkt-ID → JOIN mit `products` | Ganzzahl |
| `category` | Produktkategorie (zur Vereinfachung dupliziert) | Text |
| `quantity` | Anzahl der Einheiten | Ganzzahl |
| `unit_price` | Preis pro Einheit, USD | Dezimalzahl |
| `line_total` | Positionssumme = quantity × unit_price | Dezimalzahl |

### `marketing` – Marketingkampagnen (216 Datensätze)

| Spalte | Beschreibung | Typ |
|---|---|---|
| `campaign_id` * | Eindeutige Kampagnen-ID (Monat × Kanal) | Ganzzahl |
| `year` | Jahr | Ganzzahl |
| `month` | Monat | Ganzzahl |
| `channel` | Kanal (Organic, Paid Search, Social Ads, Influencer, Email, Referral) | Text |
| `budget` | Ausgegebenes Budget, USD | Dezimalzahl |
| `impressions` | Werbeeinblendungen (Impressions) | Ganzzahl |
| `clicks` | Klicks | Ganzzahl |
| `conversions` | Conversions (Käufe) | Ganzzahl |
| `attributed_revenue` | Dem Kanal zugeordneter Umsatz, USD | Dezimalzahl |

> ⚠️ **Hinweis:** Nicht alle Bestellungen besitzen einen `ab_variant` – das Experiment begann erst am **1. Juni 2024**. Für die A/B-Analyse (Block 5) sind ausschließlich Bestellungen zu filtern, bei denen `ab_variant = A` oder `ab_variant = B` ist.

---

## Projektstruktur

Das Projekt besteht aus 5 Blöcken. Jeder Block prüft ein anderes Kompetenzfeld. Zusammen decken sie den gesamten Kursinhalt ab.

1. **Block 1** – SQL: Datenaufbereitung (JOIN, Aggregationen, Unterabfragen)
2. **Block 2** – Visualisierungen in Tableau (mindestens 5)
3. **Block 3** – Interaktives Dashboard für die CEO
4. **Block 4** – Strategische Business Cases (3 vertiefende Fragestellungen)
5. **Block 5** – Statistisches Denken: Analyse des A/B-Experiments
