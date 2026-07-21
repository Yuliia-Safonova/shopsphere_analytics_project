# 📊 Tableau-Visualisierungen & Dashboard – ShopSphere Analytics

**Link zum Tableau-Workbook:** [ShopSphere_Analyse (CEO_Story)](https://public.tableau.com/views/ShopSphere_Analyse/CEO_Story)
**Link zum Tableau Public Profil:** [public.tableau.com/app/profile/yuliia.safonova](https://public.tableau.com/app/profile/yuliia.safonova)

---

## Block 2 – Visualisierungen (6 Charts)

Alle Visualisierungen basieren auf den Ergebnissen der SQL-Abfragen aus Block 1 (`sql/abfragen.sql`) sowie direkten Verbindungen zur Tabelle `shopsphere_orders`.

| # | Chart | Sheet-Name | Kernaussage |
|---|---|---|---|
| 2.1 | Saisonalität | `Sezonalität` | Umsatz erreicht jährlich seinen Höhepunkt im Dezember – 2024 mit deutlich stärkerem Jahresendgeschäft |
| 2.2 | Marketing: Budget vs. Effizienz | `Marketing` | Hohe Budgets, niedriger ROI – Organic am effizientesten |
| 2.3 | Kategorien: Umsatz vs. Profitabilität | `Kategorien` | Electronics dominiert den Umsatz – Beauty die Marge |
| 2.4 | Regionen in der Dynamik | `Regionen` | Nordamerika und Südostasien wachsen am stärksten, Naher Osten stagniert auf niedrigem Niveau |
| 2.5 | Kundenbeitrag (Pareto) | `Pareto_Kundenumsatz`, `Kundenanteile` | Die Top 5% der Kunden erwirtschaften 35% des Gesamtumsatzes |
| 2.6 | Kreativaufgabe: Versandschwelle | `Versandschwelle` | Kunden kaufen gezielt mehr, um die $50-Versandkostenfrei-Schwelle zu erreichen |

---

## Block 3 – Interaktive Dashboards für die Geschäftsführung

### Dashboard 1: `Geschäftsüberblick`
Zusammenfassung der wichtigsten Unternehmens-KPIs (Gesamtumsatz, Anzahl Bestellungen, Ø Bestellwert, Retourenquote) sowie vier zentrale Visualisierungen: Saisonalität, Regionale Dynamik, Marketing-Effizienz, Kategorien-Profitabilität.

**Interaktive Filter:**
- **Jahr** – wirkt kanalübergreifend auf Saisonalität und Regionale Dynamik (Data Blending über gemeinsames Jahr-Feld)
- **Region** – wirkt auf Regionale Dynamik

### Dashboard 2: `Kundenwert`
Vertiefende Analyse der Kundenkonzentration nach dem Pareto-Prinzip: Anteil Top 5% am Umsatz, kumulative Umsatzkurve, Vergleich Top 5% vs. übrige Kunden.

---

## Block 4 – Zusätzliche Visualisierungen (Strategische Business Cases)

Ergänzende Charts zur Unterstützung der Antworten in `bericht/block_4_geschaeftsfaelle.md`. Datengrundlage: SQL-Abfragen aus `sql/abfragen_block4.sql`.

| # | Chart | Sheet-Name | Kernaussage |
|---|---|---|---|
| 4.4 | Marketing-Effektivität: ROI vs. Kundenwert | `ROI vs. LTV` | Influencer und Referral liefern die wertvollsten Kunden trotz mittlerem ROI |
| 4.8 | Rabattverhalten | `Rabattverhalten` | Rabatt-Käufer bestellen nur halb so oft wie übrige Kunden |

---

## Block 5 – A/B-Experiment (Statistisches Denken)

Ergänzende Charts zur Unterstützung der Antworten in `bericht/block_5_ab_test.md`. Datengrundlage: SQL-Abfragen aus `sql/abfragen_block5.sql`.

| # | Chart | Sheet-Name | Kernaussage |
|---|---|---|---|
| 5.10 | A/B-Test: Erster Blick | `AB_Test_Gesamt` | Variante B wirkt auf den ersten Blick leicht besser (+2%) |
| 5.11 | A/B-Test nach Kundentyp | `AB_Test_Segmentiert` | Variante B wirkt fast ausschließlich bei Neukunden (+19%) – bei Bestandskunden kaum Effekt (+0,9%) |

---

## Story: `CEO_Story`

Zusammenhängende Präsentation für die Geschäftsführung mit 6 Seiten:

1. **Ausgangslage** – Projektkontext, Datenbasis, zentrale Fragestellungen
2. **Geschäftsüberblick** – Dashboard 1
3. **Kundenwert** – Dashboard 2
4. **Versandschwelle** – Kreativaufgabe 2.6 mit verhaltensökonomischer Interpretation
5. **Fazit & Empfehlungen** – zentrale Erkenntnisse mit Handlungsempfehlungen aus Block 4 & 5
6. **A/B-Test** – Checkout-Redesign, Ergebnisse aus Block 5 (Sheets `AB_Test_Gesamt`, `AB_Test_Segmentiert`)

---

## Verwendete Prinzipien für ehrliche Visualisierungen

- Balkendiagramme: Y-Achse startet immer bei 0
- Titel = Erkenntnis (kein "Sheet 1")
- Sekundäre Datenreihen gedämpft dargestellt, Kernaussage farblich hervorgehoben
- Einheiten explizit in Achsenbeschriftungen (USD, %, Faktor)
- Referenzlinien (Durchschnittswerte) zur Einordnung von Ausreißern
