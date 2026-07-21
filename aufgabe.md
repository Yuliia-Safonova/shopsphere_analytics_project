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

---

## Block 1 – SQL: Datenaufbereitung

Zunächst die Arbeit mit den Daten mittels SQL. Schreiben Sie die Abfragen eigenständig (ohne fertige Syntax-Vorlagen). Speichern Sie die Abfragetexte – sie müssen abgegeben werden. Jede Abfrage bereitet Daten für die nachfolgende Visualisierung vor.

**1.1.** Berechnen Sie den gesamten Nettoumsatz (`net_amount`), die Anzahl der Bestellungen und den durchschnittlichen Bestellwert für jede REGION und jedes JAHR. Erforderlich ist ein JOIN von `orders` mit `customers`.

**1.2.** Finden Sie die Top-10-Kunden nach Gesamtausgaben. Geben Sie deren Region, Akquisitionskanal und die Anzahl der getätigten Bestellungen an.

**1.3.** Berechnen Sie für jede Produktkategorie: den Gesamtumsatz, die durchschnittliche Marge (`margin_pct`) und den Retourenanteil. Dafür müssen `order_items`, `products` und `orders` zusammengeführt werden.

**1.4.** Finden Sie mittels Unterabfrage die Kunden, deren Gesamtausgaben den durchschnittlichen Ausgabenwert über die gesamte Datenbank hinweg übersteigen. Wie viele sind es? Welchen Anteil am Gesamtumsatz haben sie?

**1.5.** Berechnen Sie für jeden Marketingkanal: das Gesamtbudget, den gesamten zugeschriebenen Umsatz und den ROI (Umsatz / Budget). Verwenden Sie die Tabelle `marketing`.

> 💡 **Tipp:** Speichern Sie die Ergebnisse dieser Abfragen als CSV – sie bilden die Grundlage für die Visualisierungen in Block 2. Eine gut vorbereitete SQL-Abfrage = eine saubere Visualisierung.

---

## Block 2 – Visualisierungen in Tableau

Erstellen Sie mindestens 5 Visualisierungen (mehr ist besser). Wählen Sie für jede Frage den passenden Diagrammtyp. Achten Sie auf aussagekräftige Titel, beschriftete Achsen und sinnvolle Farben.

**2.1. Saisonalität.** Liniendiagramm des Gesamtumsatzes nach Monaten über den gesamten Zeitraum. Gibt es saisonale Spitzen? Wann verdient das Unternehmen am meisten?

**2.2. Marketing: Budget vs. Effizienz.** Vergleichen Sie die Kanäle nach Budget und ROI. Tipp: Eine Dual-Axis- oder Scatter-Darstellung zeigt gut, ob das Budget sinnvoll verteilt ist.

**2.3. Kategorien: Volumen vs. Profitabilität.** Scatter- oder Bubble-Chart: Umsatz auf der X-Achse, Marge auf der Y-Achse, Punktgröße = Retourenanteil. Welche Kategorien sind „versteckte Diamanten"?

**2.4. Regionen im Zeitverlauf.** Multi-Line-Diagramm des Umsatzes nach Regionen über die Jahre. Welche Region wächst am schnellsten, welche stagniert?

**2.5. Kundenbeitrag (Pareto).** Visualisieren Sie, welchen Umsatzanteil die Top-Kunden erwirtschaften. Tipp: kumulatives Diagramm oder einfacher Vergleich „Top 5 % vs. Rest".

**2.6. (Kreativ).** Wählen Sie einen noch nicht untersuchten Datenausschnitt und erstellen Sie eine Visualisierung nach eigenem Ermessen. Überraschen Sie uns mit einem Insight.

> 💡 Wenden Sie die Prinzipien ehrlicher Grafiken an, die wir gelernt haben: Achse bei Null für Balkendiagramme, aussagekräftiger Titel statt „Sheet 1", Zurückhaltung bei unwichtigen Serien. Denken Sie daran: eine schlecht gestaltete Grafik ist ebenfalls eine Manipulation, auch wenn sie unbeabsichtigt ist.

---

## Block 3 – Dashboard für die CEO

Fassen Sie die besten Visualisierungen in einem interaktiven Dashboard zusammen, das die CEO dem Aufsichtsrat präsentieren wird. Dies ist keine Sammlung von Diagrammen – es ist eine Geschichte über das Unternehmen.

**Pflichtelemente:**

- **KPI-Karten:** Gesamtumsatz, Anzahl der Bestellungen, durchschnittlicher Bestellwert, Retourenquote in %.
- **3–4 zentrale Visualisierungen** aus Block 2 (wählen Sie die wichtigsten aus, nicht alle).
- **Filter:** mindestens 2 (z. B. nach Region und Jahr), damit der Betrachter „stöbern" kann.
- **Titel und einheitlicher Stil:** abgestimmte Farben, Schriftarten, verständliche Bezeichnungen.

**Frage 1.** Beschreiben Sie die Logik des Aufbaus: Welche Geschichte erzählt das Dashboard von oben nach unten? Warum genau diese Reihenfolge?

**Frage 2.** Welche 3 Erkenntnisse soll der Betrachter innerhalb der ersten 30 Sekunden erfassen?

---

## Block 4 – Strategische Geschäftsfälle

Jetzt kommt der Hauptteil: Verwandeln Sie Daten in Entscheidungen. Antworten Sie ausführlich und untermauern Sie jede Schlussfolgerung mit Zahlen und Visualisierungen. Dies ist die Ebene, die einen Analysten von jemandem unterscheidet, der nur Diagramme erstellt.

### Fall A. Wohin sollte das Marketingbudget investiert werden?

Die CEO möchte das Marketingbudget im nächsten Jahr umverteilen.

**Frage 3.** Welcher Kanal bringt den meisten Gewinn pro investiertem Dollar (ROI)? Welcher am wenigsten? Wohin fließt aktuell der größte Teil des Budgets – und ist das sinnvoll?

**Frage 4.** Vergleichen Sie die Kanäle nicht nur nach dem Kampagnen-ROI, sondern auch nach dem langfristigen Kundenwert (LTV): Berechnen Sie die durchschnittlichen Kundenausgaben in Abhängigkeit vom `acquisition_channel`. Stimmen die Schlussfolgerungen mit dem Kampagnen-ROI überein?

**Frage 5.** Ihre Empfehlung: Wie sollte das Budget umverteilt werden? Begründen Sie dies mit Zahlen. Welche Risiken birgt Ihre Empfehlung?

### Fall B. Welche Kategorien sind wirklich profitabel?

Die Kategorie mit dem höchsten Umsatz ist nicht immer die profitabelste.

**Frage 6.** Vergleichen Sie die Kategorien anhand von drei Dimensionen: Umsatz, Marge, Retourenanteil. Welche Kategorie erzeugt eine „Illusion von Volumen" – hoher Umsatz, aber geringe tatsächliche Profitabilität?

**Frage 7.** Gibt es einen „versteckten Diamanten" – eine Kategorie mit geringem Umsatz, aber ausgezeichneter Marge und niedrigem Retourenanteil? Was würden Sie damit empfehlen zu tun?

### Fall C. Rabatte und wertvolle Kunden

Marketing liebt Rabatte, aber sind sie wirklich nützlich?

**Frage 8.** Vergleichen Sie Kunden, die überwiegend mit Rabatt kaufen (durchschnittlicher Rabatt > 20 %), mit den übrigen Kunden hinsichtlich der Bestellanzahl. „Binden" sich Kunden, die wegen Rabatten gekommen sind, oder kaufen sie einmal und verschwinden?

**Frage 9.** Berechnen Sie, welchen Umsatzanteil die Top-5-%-Kunden erwirtschaften. Wer sind diese Personen (Region, Akquisitionskanal)? Wie kann das Unternehmen sie halten?

---

## Block 5 – Statistisches Denken: A/B-Experiment

Das Produktteam testete ab dem 1. Juni 2024 ein neues Checkout-Design. Die Hälfte der Bestellungen erhielt die alte Version (Variante A), die andere Hälfte die neue (Variante B). Ihre Aufgabe ist es, das Ergebnis als Analyst zu bewerten – nicht einfach nur Durchschnittswerte zu berechnen.

**Frage 10.** Vergleichen Sie den durchschnittlichen Bestellwert (`net_amount`) zwischen den Gruppen A und B über alle Bestellungen des Experiments hinweg. Ist Variante B auf den ersten Blick besser?

**Frage 11.** Gehen Sie nun tiefer. Teilen Sie jede Gruppe in NEUE Kunden (erste Bestellung innerhalb von ca. 60 Tagen nach der Registrierung) und WIEDERKEHRENDE Kunden auf. Vergleichen Sie den durchschnittlichen Bestellwert in den vier Untergruppen: A-neu, B-neu, A-wiederkehrend, B-wiederkehrend. Was stellen Sie fest?

**Frage 12.** Hier verbirgt sich eine wichtige statistische Lektion. Möglicherweise hilft Variante B einer Gruppe, schadet aber einer anderen – und der Gesamtdurchschnitt verdeckt dies. Formulieren Sie: Für wen lohnt sich die Einführung von Variante B? Kann sie für alle aktiviert werden?

**Frage 13.** Erinnern Sie sich an die Lektion über Datenmanipulation. Wenn das Marketing Variante B der Geschäftsführung um jeden Preis „verkaufen" wollte – welche Zahlen würde es zeigen? Und wenn es sie „begraben" wollte? Wie sollte ein ehrlicher Analyst das Ergebnis präsentieren?

> 💡 **Hinweis:** Dies ist ein Beispiel für das **Simpson-Paradoxon** – eine Schlussfolgerung auf Basis von Gesamtdaten kann sich ins Gegenteil verkehren, sobald die Daten in Untergruppen aufgeteilt werden. Die wichtigste Fähigkeit eines Analysten ist nicht, Durchschnittswerte zu berechnen, sondern zu wissen, wann man ihnen nicht vertrauen darf.

---

## Abgabe

- Datei mit den SQL-Abfragen (Block 1) – Texte aller Abfragen (Word-Dokument, Google Doc oder PDF möglich)
- Link zu Tableau Public mit den Visualisierungen und dem Dashboard (Blöcke 2–3)
- Dokument mit den Antworten auf alle 13 Fragen (Blöcke 4–5) – mit Verweisen auf Zahlen und Screenshots von Diagrammen, die die Schlussfolgerungen belegen (falls vorhanden; falls keine Diagramme vorliegen, genügt eine reine Textantwort)
- Kurzer Zusammenfassungsabschnitt: 3–5 Hauptempfehlungen für die CEO (dieser Abschnitt soll im selben Dokument wie der vorherige Punkt verfasst werden)

> 💡 Format der Antworten auf die Geschäftsfragen: klare Schlussfolgerung → belegende Zahlen → Visualisierung → Empfehlung. Vermeiden Sie „Füllwörter" – das Management schätzt Prägnanz und Beweise.

---

## Ungefährer Zeitplan für 2 Wochen

- **Woche 1:** Kennenlernen der Daten, SQL-Abfragen (Block 1), erste Visualisierungen (Block 2).
- **Woche 2:** Dashboard (Block 3), Geschäftsfälle (Block 4), A/B-Analyse (Block 5), Ausarbeitung und Zusammenfassung.

---

## Bewertungskriterien

| Kriterium | Punkte |
|---|---|
| Block 1. SQL: korrekte JOINs, Aggregationen, Unterabfrage | 20 |
| Block 2. Visualisierungen: korrekte Typen, Gestaltung | 20 |
| Block 3. Dashboard: Aufbau, Interaktivität, Stil | 15 |
| Block 4. Geschäftsfälle: Analysetiefe und Empfehlungen | 25 |
| Block 5. A/B-Analyse: Erkennen des Simpson-Paradoxons | 15 |
| Gesamtpräsentation und Zusammenfassung | 5 |

*Dies ist Ihre Chance, alles zu zeigen, was Sie gelernt haben. Viel Erfolg!*
