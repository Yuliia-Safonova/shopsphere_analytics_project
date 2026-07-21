# 🛍️ ShopSphere – Analyse eines globalen Marktplatzes

Abschlussprojekt im Bereich Data Analytics: End-to-End-Analyse eines fiktiven, globalen E-Commerce-Marktplatzes – von der SQL-Datenaufbereitung über Tableau-Visualisierungen bis hin zu strategischen Business-Empfehlungen und statistischer Auswertung eines A/B-Experiments.

---

## 📌 Projektbeschreibung

ShopSphere ist ein globaler Online-Marktplatz, der Produkte aus 7 Kategorien in 5 Weltregionen verkauft. Die Geschäftsführung benötigt datengestützte Antworten auf zentrale strategische Fragen:

- Wie effizient wird das Marketingbudget eingesetzt?
- Wer sind die wertvollsten Kunden?
- Welche Produktkategorien sind wirklich profitabel?
- Welche Regionen wachsen am stärksten?
- Hat das neue Checkout-Design (A/B-Test) tatsächlich funktioniert?

Ziel dieses Projekts ist es, den vollständigen analytischen Zyklus zu durchlaufen: Datenaufbereitung mit SQL, Visualisierung und Dashboard-Entwicklung in Tableau, strategische Business-Analyse sowie statistisches Denken anhand eines realen A/B-Test-Szenarios.

---

## 🗂️ Datengrundlage

Der Datensatz umfasst 5 miteinander verknüpfte Tabellen für den Zeitraum 2022–2024:

| Tabelle | Beschreibung | Umfang |
|---|---|---|
| `customers` | Kundenstammdaten (Region, Land, Akquisitionskanal etc.) | 3.000 Datensätze |
| `products` | Produktkatalog (Kategorie, Preis, Marge) | 250 Datensätze |
| `orders` | Bestellungen (Haupttabelle) | ~12.300 Datensätze |
| `order_items` | Einzelne Bestellpositionen | ~26.000 Datensätze |
| `marketing` | Marketingkampagnen nach Kanal und Monat | 216 Datensätze |

Eine vollständige Beschreibung aller Tabellen und Spalten befindet sich in [`aufgabe.md`](./aufgabe.md).

---

## 🧭 Projektstruktur

Das Projekt gliedert sich in 5 Blöcke:

1. **SQL – Datenaufbereitung**: JOINs, Aggregationen, Unterabfragen
2. **Visualisierungen in Tableau**: mindestens 5 aussagekräftige Grafiken
3. **Interaktive Dashboards** für die Geschäftsführung + Story
4. **Strategische Business Cases**: Marketing-ROI, Kategorien-Profitabilität, Rabatte & Kundenwert
5. **Statistisches Denken**: Auswertung eines A/B-Experiments (Simpson-Paradoxon)

---

## 📁 Repository-Struktur

```
shopsphere_analytics_project/
│
├── README.md                      ← diese Datei
├── aufgabe.md                     ← vollständige Aufgabenstellung
│
├── daten/                         ← Rohdaten (CSV)
│   ├── shopsphere_customers.csv
│   ├── shopsphere_products.csv
│   ├── shopsphere_orders.csv
│   ├── shopsphere_order_items.csv
│   └── shopsphere_marketing.csv
│
├── sql/
│   ├── abfragen.sql               ← SQL-Abfragen aus Block 1 sowie Zusatzabfrage aus Block 2 (Aufgabe 2.6), kommentiert
│   ├── abfragen_block4.sql        ← SQL-Abfragen aus Block 4 (Fragen 4, 8, 9) inkl. unabhängiger Verifikationsabfrage
│   ├── abfragen_block5.sql        ← SQL-Abfragen aus Block 5 (Fragen 10, 11)
│   └── ergebnisse/                ← Screenshots der SQL-Abfrageergebnisse (sqliteonline.com)
│
├── bericht/                       ← Antworten und Schlussfolgerungen je Block
│   ├── block_4_geschaeftsfaelle.md
│   ├── block_5_ab_test.md
│   └── zusammenfassung.md         ← 5 zentrale Empfehlungen für die CEO
│
└── tableau/
    ├── README_tableau.md          ← Link zum Tableau-Workbook, Übersicht der Blätter, Dashboards & Story
    └── visualisierungen/          ← Screenshots aller Tableau-Grafiken, Dashboards & Charts
        └── README_visual.md       ← Übersicht aller Screenshots mit Kernaussagen
```

---

## 🛠️ Verwendete Tools

- **SQL** (sqliteonline.com) – Datenextraktion, JOINs, Aggregationen, Subqueries
- **Tableau Public** – Visualisierungen, interaktive Dashboards und Story
- **Markdown** – Dokumentation und Ergebnisberichte

---

## ✅ Fortschritt

| Block | Status |
|---|---|
| Block 1 – SQL: Datenaufbereitung | ✅ abgeschlossen |
| Block 2 – Visualisierungen in Tableau | ✅ abgeschlossen (6 Charts, siehe `tableau/visualisierungen/README_visual.md`) |
| Block 3 – Interaktive Dashboards + Story für die CEO | ✅ abgeschlossen (2 Dashboards + Story `CEO_Story`, siehe `tableau/README_tableau.md`) |
| Block 4 – Strategische Geschäftsfälle | ✅ abgeschlossen (siehe `bericht/block_4_geschaeftsfaelle.md`) |
| Block 5 – A/B-Experiment | ✅ abgeschlossen (siehe `bericht/block_5_ab_test.md`) |

## 📊 Ergebnisse

Die vollständige Analyse liefert datengestützte Antworten auf alle Ausgangsfragen der Geschäftsführung:

- **Marketing-Effizienz:** Organic (ROI 8,02) und Email (ROI 6,50) sind die effizientesten Kanäle, erhalten aber nur einen Bruchteil des Budgets – 73% fließen in die ineffizientesten Kanäle Paid Search und Social Ads.
- **Wertvollste Kunden:** Die Top 5% der Kunden (150 von 3.000) erwirtschaften 35% des Gesamtumsatzes, konzentriert in Europe, North America und Southeast Asia sowie über die Kanäle Influencer und Organic.
- **Kategorien-Profitabilität:** Electronics dominiert den Umsatz, aber mit der niedrigsten Marge (12%) und höchsten Retourenquote (15,62%). Beauty ist der „versteckte Diamant" mit der höchsten Marge (55%).
- **Rabattverhalten:** Rabattgetriebene Kunden binden sich nicht – sie bestellen nur halb so oft wie übrige Kunden.
- **A/B-Test (Checkout-Redesign):** Das neue Design zeigt im Gesamtdurchschnitt nur +2%, entfaltet aber bei Neukunden einen starken Effekt von +19% (Simpson-Paradoxon) – eine gezielte statt pauschale Einführung wird empfohlen.

Alle 5 zentralen Handlungsempfehlungen für die CEO: [`bericht/zusammenfassung.md`](./bericht/zusammenfassung.md).

Interaktives Tableau-Workbook mit allen Charts, Dashboards und der CEO-Story: [ShopSphere_Analyse auf Tableau Public](https://public.tableau.com/views/ShopSphere_Analyse/CEO_Story).

---

## 👤 Autorin

**Yuliia Safonova**
Data Analyst | Career Changer aus Sales & Retail Management
Tableau-Workbook: [ShopSphere_Analyse](https://public.tableau.com/views/ShopSphere_Analyse/CEO_Story) · Portfolio: [Tableau Public Profil](https://public.tableau.com/app/profile/yuliia.safonova)

---

*Dieses Projekt ist Teil eines Data-Analytics-Portfolios für den deutschen Arbeitsmarkt.*
