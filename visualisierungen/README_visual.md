# 🖼️ Visualisierungen – ShopSphere Analytics

Statische Screenshots aller Tableau-Visualisierungen aus Block 2 und der
Dashboards aus Block 3. Dient als Offline-Referenz zusätzlich zum
Live-Workbook auf Tableau Public (siehe `tableau/README_tableau.md`).

---

## Block 2 – Einzelne Visualisierungen

| Datei | Aufgabe | Kernaussage |
|---|---|---|
| `2_1_saisonalitaet.png` | 2.1 Saisonalität | Umsatz erreicht jährlich seinen Höhepunkt im Dezember – 2024 mit deutlich stärkerem Jahresendgeschäft |
| `2_2_marketing.png` | 2.2 Marketing: Budget vs. Effizienz | Hohe Budgets, niedriger ROI – Organic am effizientesten |
| `2_3_kategorien.png` | 2.3 Kategorien: Umsatz vs. Profitabilität | Electronics dominiert den Umsatz – Beauty die Marge |
| `2_4_regionen.png` | 2.4 Regionen in der Dynamik | Nordamerika und Südostasien wachsen am stärksten, Naher Osten stagniert auf niedrigem Niveau |
| `2_5_pareto.png` | 2.5 Kundenbeitrag (Pareto-Kurve) | Top 5% der Kunden erwirtschaften 35% des Gesamtumsatzes |
| `2_5_kundenanteile.png` | 2.5 Kundenbeitrag (Top 5% vs. Rest) | Top 5% vs. übrige 95% im direkten Vergleich |
| `2_6_versandschwelle.png` | 2.6 Kreativaufgabe: Versandschwelle | Kunden kaufen gezielt mehr, um die $50-Versandkostenfrei-Schwelle zu erreichen |

---

## Block 3 – Interaktive Dashboards

| Datei | Dashboard | Inhalt |
|---|---|---|
| `dashboard_geschaeftsueberblick.png` | Geschäftsüberblick | KPI-Übersicht + 4 zentrale Charts (Saisonalität, Regionen, Marketing, Kategorien), Filter: Region & Jahr |
| `dashboard_kundenwert.png` | Kundenwert-Analyse | KPI-Übersicht + Pareto-Kurve + Top 5% vs. Rest |

---

## Block 4 – Zusätzliche Visualisierungen (Strategische Business Cases)

| Datei | Frage(n) | Kernaussage |
|---|---|---|
| `4_3-4_roi_vs_ltv.png` | Frage 3–4: Marketing-Effizienz | ROI vs. Kundenlebenswert je Kanal – Influencer und Referral liefern die wertvollsten Kunden trotz mittlerem ROI |
| `4_8_rabattverhalten.png` | Frage 8: Rabattverhalten | Rabatt-Käufer bestellen nur halb so oft wie übrige Kunden |

---

## ⚠️ Zu aktualisierende Screenshots

Folgende 3 Screenshots müssen nach der Korrektur der Tableau-Formel
`customer_rank_%` (COUNT → COUNTD) neu erstellt werden, da sie noch den
fehlerhaften Wert "63%" statt korrekt "35%" zeigen:

- `2_5_pareto.png`
- `2_5_kundenanteile.png`
- `dashboard_kundenwert.png`

Referenzwert (aus SQL verifiziert, siehe `bericht/block_4_geschaeftsfaelle.md`,
Frage 9): **150 Kunden, $1.218.211,48, 35,07% des Gesamtumsatzes.**

## Hinweis

Diese Screenshots sind statische Momentaufnahmen. Für die interaktive
Version (mit funktionierenden Filtern) siehe das Live-Workbook auf
Tableau Public, verlinkt in `tableau/README_tableau.md`.
