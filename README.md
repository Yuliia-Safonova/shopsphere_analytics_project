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
3. **Interaktives Dashboard** für die Geschäftsführung
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
│   └── abfragen.sql               ← alle SQL-Abfragen aus Block 1, kommentiert
│
├── notebooks/                     ← optionale .ipynb-Dateien (z. B. für Block 5)
│
├── bericht/                       ← Antworten und Schlussfolgerungen je Block
│   ├── block_4_geschaeftsfaelle.md
│   ├── block_5_ab_test.md
│   └── zusammenfassung.md         ← 3–5 zentrale Empfehlungen für die CEO
│
├── visualisierungen/              ← Screenshots der Tableau-Grafiken
│
└── dashboard/
    └── README.md                  ← Link zum Tableau-Dashboard + Beschreibung der Komposition
```

---

## 🛠️ Verwendete Tools

- **SQL** (sqliteonline.com) – Datenextraktion, JOINs, Aggregationen, Subqueries
- **Tableau Public** – Visualisierungen und interaktives Dashboard
- **Python / Jupyter Notebook** *(optional)* – vertiefende statistische Analyse
- **Markdown** – Dokumentation und Ergebnisberichte

---

## 📊 Ergebnisse

*Wird nach Fertigstellung ergänzt: Links zum Tableau-Dashboard, zentrale Erkenntnisse und Business-Empfehlungen.*

---

## 👤 Autorin

**Yuliia Safonova**
Data Analyst | Career Changer aus Sales & Retail Management
Portfolio: [Tableau Public](https://public.tableau.com/app/profile/yuliia.safonova)

---

*Dieses Projekt ist Teil eines Data-Analytics-Portfolios für den deutschen Arbeitsmarkt.*
