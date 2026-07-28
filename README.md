# 🛍️ ShopSphere – Analyse eines globalen Marktplatzes

Abschlussprojekt im Bereich Data Analytics: End-to-End-Analyse eines fiktiven, globalen E-Commerce-Marktplatzes – von der SQL-Datenaufbereitung über Tableau-Visualisierungen bis hin zu strategischen Business-Empfehlungen und statistischer Auswertung eines A/B-Experiments.

**🔗 [Zur vollständigen Projektpräsentation (Kapitel 1 & 2)](https://yuliia-safonova.github.io/shopsphere_analytics_project/presentation/)**

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

Eine vollständige Beschreibung aller Tabellen und Spalten befindet sich in [`aufgabe.md`](./aufgabe.md). Das Beziehungsschema der 5 Tabellen ist in [`daten/er_diagramm.png`](./daten/er_diagramm.png) dokumentiert.

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
├── bericht/
│   └── bericht.md                 ← Antworten auf alle 13 Fragen (Block 3–5) + 8 Handlungsempfehlungen für die CEO
│
├── daten/
│   ├── er_diagramm.png            ← Entity-Relationship-Diagramm aller 5 Tabellen
│   ├── shopsphere_customers.csv
│   ├── shopsphere_marketing.csv
│   ├── shopsphere_order_items.csv
│   ├── shopsphere_orders.csv
│   └── shopsphere_products.csv
│
├── presentation/
│   └── index.html                 ← Bilinguale (DE/UA) Projektpräsentation: Kapitel 1 (ShopSphere) & Kapitel 2 (CoffeeTime-Prognose) als eine Geschichte
│
├── sql/
│   ├── ergebnisse/                ← Screenshots der SQL-Abfrageergebnisse (sqliteonline.com)
│   └── abfragen.sql               ← alle SQL-Abfragen (Block 1, 2.5, 2.6, 4, 5), gegliedert nach Block, kommentiert
│
├── tableau/
│   ├── visualisierungen/          ← Screenshots aller Tableau-Grafiken, Dashboards & Charts
│   ├── README_tableau.md          ← Link zum Workbook, alle Sheets, Dashboards, Story-Aufbau
│   └── ShopSphere_Analyse.twbx    ← Tableau-Workbook (Packaged Workbook, inkl. Daten) zum lokalen Öffnen in Tableau
│
├── README.md                      ← diese Datei
└── aufgabe.md                     ← vollständige Aufgabenstellung
```

---

## 🛠️ Verwendete Tools

- **SQL** (sqliteonline.com) – Datenextraktion, JOINs, Aggregationen, Subqueries
- **Tableau Public** – Visualisierungen, interaktive Dashboards und Story
- **Lucidchart** – Entity-Relationship-Diagramm
- **Markdown** – Dokumentation und Ergebnisberichte

---

## ✅ Fortschritt

| Block | Status |
|---|---|
| Block 1 – SQL: Datenaufbereitung | ✅ abgeschlossen |
| Block 2 – Visualisierungen in Tableau | ✅ abgeschlossen (6 Charts, siehe `tableau/README_tableau.md`) |
| Block 3 – Interaktive Dashboards + Story für die CEO | ✅ abgeschlossen (3 Dashboards + Story `CEO_Story`, Antworten siehe `bericht/bericht.md`) |
| Block 4 – Strategische Geschäftsfälle | ✅ abgeschlossen (siehe `bericht/bericht.md`) |
| Block 5 – A/B-Experiment | ✅ abgeschlossen (siehe `bericht/bericht.md`) |

## 📊 Ergebnisse

Die vollständige Analyse liefert datengestützte Antworten auf alle Ausgangsfragen der Geschäftsführung:

- **Marketing-Effizienz:** Organic (ROI 8,02) und Email (ROI 6,50) sind die effizientesten Kanäle, erhalten aber nur einen Bruchteil des Budgets – 75% fließen in die ineffizientesten Kanäle Paid Search und Social Ads. Die Rangfolge bleibt auch nach Bereinigung um Retouren unverändert.
- **Wertvollste Kunden:** Die Top 5% der Kunden (150 von 3.000) erwirtschaften 35,07% des Gesamtumsatzes, konzentriert in Europe, North America und Southeast Asia sowie über die Kanäle Influencer und Organic.
- **Kategorien-Profitabilität:** Electronics dominiert den Umsatz, aber mit der niedrigsten Marge (12%) und höchsten Retourenquote (15,62%). Beauty ist der „versteckte Diamant" mit der höchsten Marge (55%).
- **Rabattverhalten:** Rabattgetriebene Kunden binden sich nicht – sie bestellen nur halb so oft wie übrige Kunden.
- **Versandschwelle:** Kunden passen ihr Kaufverhalten gezielt an, um die $50-Schwelle für kostenlosen Versand zu erreichen – die Bestellhäufigkeit steigt an dieser Schwelle um 117%.
- **A/B-Test (Checkout-Redesign):** Das neue Design zeigt im Gesamtdurchschnitt nur +2%, entfaltet aber bei Neukunden einen starken Effekt von +19% (Simpson-Paradoxon) – eine gezielte statt pauschale Einführung wird empfohlen.
- **Regionales Wachstum:** Nordamerika und Südostasien wachsen deutlich stärker als der stagnierende Nahe Osten; Middle East und Latin America sind zudem unter den Top-5%-Kunden klar unterrepräsentiert.

Alle Antworten und die 8 zentralen Handlungsempfehlungen für die CEO: [`bericht/bericht.md`](./bericht/bericht.md).

Interaktives Tableau-Workbook mit allen Charts, Dashboards und der CEO-Story: [ShopSphere_Analyse auf Tableau Public](https://public.tableau.com/views/ShopSphere_Analyse/CEO_Story). Das vollständige Packaged Workbook (`.twbx`, inklusive Daten) liegt zusätzlich lokal unter [`tableau/ShopSphere_Analyse.twbx`](./tableau/ShopSphere_Analyse.twbx) – kann direkt in Tableau Desktop oder Tableau Reader geöffnet werden.

Die vollständige, bilinguale (DE/UA) Projektpräsentation – inklusive des zweiten Abschlussprojekts (CoffeeTime-Umsatzprognose mit linearer Regression) – ist hier verfügbar: **[Live-Demo](https://yuliia-safonova.github.io/shopsphere_analytics_project/presentation/)**.

---

## 👤 Autorin

**Yuliia Safonova**
Data Analyst | Career Changer aus Sales & Retail Management
Tableau-Workbook: [ShopSphere_Analyse](https://public.tableau.com/views/ShopSphere_Analyse/CEO_Story) · Portfolio: [Tableau Public Profil](https://public.tableau.com/app/profile/yuliia.safonova) · [Projektpräsentation](https://yuliia-safonova.github.io/shopsphere_analytics_project/presentation/)

---

*Dieses Projekt ist Teil eines Data-Analytics-Portfolios für den deutschen Arbeitsmarkt.*
