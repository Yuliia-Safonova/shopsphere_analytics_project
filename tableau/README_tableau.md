# 📊 Tableau – ShopSphere Analytics

**Link zum Tableau-Workbook:** [ShopSphere_Analyse (CEO_Story)](https://public.tableau.com/views/ShopSphere_Analyse/CEO_Story)
**Link zum Tableau Public Profil:** [public.tableau.com/app/profile/yuliia.safonova](https://public.tableau.com/app/profile/yuliia.safonova)

Dieses Dokument beschreibt alle Tableau-Sheets, Dashboards und die Story. Statische Screenshots aller Visualisierungen liegen als Offline-Referenz im Unterordner [`visualisierungen/`](./visualisierungen/).

---

## Block 2 – Visualisierungen (6 Charts)

Alle Visualisierungen basieren auf den Ergebnissen der SQL-Abfragen aus Block 1 (`sql/abfragen.sql`) sowie direkten Verbindungen zur Tabelle `shopsphere_orders`.

| # | Chart | Sheet-Name | Kernaussage | Screenshot |
|---|---|---|---|---|
| 2.1 | Saisonalität | `Sezonalität` | Umsatz erreicht jährlich seinen Höhepunkt im Dezember – 2024 mit deutlich stärkerem Jahresendgeschäft | `visualisierungen/2.1_saisonalitaet.png` |
| 2.2 | Marketing: Budget vs. Effizienz | `Marketing` | Hohe Budgets, niedriger ROI – Organic am effizientesten | `visualisierungen/2.2_marketing.png` |
| 2.3 | Kategorien: Umsatz vs. Profitabilität | `Kategorien` | Electronics dominiert den Umsatz – Beauty die Marge | `visualisierungen/2.3_kategorien.png` |
| 2.4 | Regionen in der Dynamik | `Regionen` | Nordamerika und Südostasien wachsen am stärksten, Naher Osten stagniert auf niedrigem Niveau | `visualisierungen/2.4_regionen.png` |
| 2.5 | Kundenbeitrag (Pareto-Kurve) | `Pareto_Kundenumsatz`, `Kundenanteile` | Top 5% der Kunden erwirtschaften 35% des Gesamtumsatzes | `visualisierungen/2.5_pareto.png`, `visualisierungen/2.5_kundenanteile.png` |
| 2.6 | Kreativaufgabe: Versandschwelle | `Versandschwelle` | Kunden kaufen gezielt mehr, um die $50-Versandkostenfrei-Schwelle zu erreichen | `visualisierungen/2.6_versandschwelle.png` |

---

## Block 3 – Interaktive Dashboards für die Geschäftsführung

### Dashboard 1: `Geschäftsüberblick`
Zusammenfassung der wichtigsten Unternehmens-KPIs (Gesamtumsatz, Anzahl Bestellungen, Ø Bestellwert, Retourenquote) sowie vier zentrale Visualisierungen: Saisonalität, Regionale Dynamik, Marketing-Effizienz, Kategorien-Profitabilität.

**Interaktive Filter:**
- **Jahr** – wirkt kanalübergreifend auf Saisonalität und Regionale Dynamik (Data Blending über gemeinsames Jahr-Feld)
- **Region** – wirkt auf Regionale Dynamik

Screenshot: `visualisierungen/3.1_dashboard_geschaeftsueberblick.png`

### Dashboard 2: `Kundenwert`
Vertiefende Analyse der Kundenkonzentration nach dem Pareto-Prinzip: Anteil Top 5% am Umsatz, kumulative Umsatzkurve, Vergleich Top 5% vs. übrige Kunden.

Screenshot: `visualisierungen/3.2_dashboard_kundenwert.png`

---

## Block 4 – Zusätzliche Visualisierungen (Strategische Business Cases)

Ergänzende Charts zur Unterstützung der Antworten in `bericht/bericht.md`. Datengrundlage: SQL-Abfragen aus `sql/abfragen.sql` (Block 4).

| # | Chart | Sheet-Name | Kernaussage | Screenshot |
|---|---|---|---|---|
| 4.4 | Marketing-Effektivität: ROI vs. Kundenwert | `ROI vs. LTV` | Influencer und Referral liefern die wertvollsten Kunden trotz mittlerem ROI | `visualisierungen/4.4_roi_vs_ltv.png` |
| 4.8 | Rabattverhalten | `Rabattverhalten` | Rabatt-Käufer bestellen nur halb so oft wie übrige Kunden | `visualisierungen/4.8_rabattverhalten.png` |

---

## Block 5 – A/B-Experiment (Statistisches Denken)

Ergänzende Charts zur Unterstützung der Antworten in `bericht/bericht.md`. Datengrundlage: SQL-Abfragen aus `sql/abfragen.sql` (Block 5).

| # | Chart | Sheet-Name | Kernaussage | Screenshot |
|---|---|---|---|---|
| 5.10 | A/B-Test: Erster Blick | `AB_Test_Gesamt` | Variante B wirkt auf den ersten Blick leicht besser (+2%) | `visualisierungen/5.10_ab_test_gesamt.png` |
| 5.11 | A/B-Test nach Kundentyp | `AB_Test_Segmentiert` | Variante B wirkt fast ausschließlich bei Neukunden (+19%) – bei Bestandskunden kaum Effekt (+0,9%) | `visualisierungen/5.11_ab_test_segmentiert.png` |

---

## Story: `CEO_Story`

Zusammenhängende Präsentation für die Geschäftsführung mit 6 Seiten:

1. **Ausgangslage** – Projektkontext, Datenbasis (Zeitraum 2022–2024), zentrale Fragestellungen
2. **Geschäftsüberblick** – Dashboard 1
3. **Kundenwert** – Dashboard 2
4. **Versandschwelle** – Kreativaufgabe 2.6 mit verhaltensökonomischer Interpretation
5. **A/B-Test: Checkout-Redesign** – Ergebnisse aus Block 5, segmentiert nach Kundentyp (Sheets `AB_Test_Gesamt`, `AB_Test_Segmentiert`)
6. **Fazit & Empfehlungen** – 7 zentrale Erkenntnisse mit Handlungsempfehlungen, konsistent mit `bericht/bericht.md`

---

## Verwendete Prinzipien für ehrliche Visualisierungen

- Balkendiagramme: Y-Achse startet immer bei 0
- Titel = Erkenntnis (kein „Sheet 1")
- Sekundäre Datenreihen gedämpft dargestellt, Kernaussage farblich hervorgehoben
- Einheiten explizit in Achsenbeschriftungen (USD, %, Faktor)
- Referenzlinien (Durchschnittswerte) zur Einordnung von Ausreißern
