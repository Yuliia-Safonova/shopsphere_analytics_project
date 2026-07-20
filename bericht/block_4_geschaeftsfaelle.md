# Block 4 – Strategische Geschäftsfälle

> Format je Frage: **Schlussfolgerung → Zahlen zur Bestätigung → Visualisierung → Empfehlung**

---

## Fall A: Wohin soll das Marketingbudget investiert werden?

### Frage 3
*Welcher Kanal bringt den höchsten Return pro investiertem Dollar (ROI)? Welcher den niedrigsten? Wohin fließt aktuell der größte Budgetanteil – und ist das sinnvoll?*

**Schlussfolgerung:**
Organic erzielt mit Abstand den höchsten ROI (8,02), Paid Search den niedrigsten (1,33). Der größte Budgetanteil fließt jedoch ausgerechnet in Paid Search und Social Ads – die beiden ineffizientesten Kanäle. Diese Budgetverteilung ist nicht sinnvoll.

**Zahlen:**

| Kanal | ROI (Faktor) | Budget |
|---|---|---|
| Organic | 8,02 | $20.4K |
| Email | 6,50 | $37.5K |
| Influencer | 4,62 | $112.3K |
| Referral | 3,57 | $73.8K |
| Social Ads | 2,06 | $286.5K |
| Paid Search | 1,33 | $451K |

**Visualisierung:** Sheet `Marketing` (Budget vs. Effizienz, Scatter-Chart)

**Empfehlung:**
Budgetanteile für Paid Search und Social Ads kritisch prüfen – siehe detaillierte Umverteilungsempfehlung in Frage 5.

---

### Frage 4
*Vergleichen Sie die Kanäle nicht nur nach Kampagnen-ROI, sondern auch nach langfristigem Kundenwert (LTV): Berechnen Sie die durchschnittlichen Ausgaben der Kunden in Abhängigkeit vom acquisition_channel. Stimmen die Erkenntnisse mit dem Kampagnen-ROI überein?*

**Schlussfolgerung:**
Nein, die Erkenntnisse stimmen nicht vollständig überein. Organic und Email sind kurzfristig am effizientesten (höchster ROI), während Influencer und Referral langfristig die wertvollsten Kunden liefern (höchster LTV) – trotz nur mittlerem ROI. Paid Search und Social Ads schneiden dagegen auf beiden Dimensionen am schlechtesten ab.

**Zahlen:**

| Kanal | LTV (Ø pro Kunde) | Kundenanzahl |
|---|---|---|
| Influencer | $1.985,73 | 357 |
| Referral | $1.791,82 | 266 |
| Organic | $1.316,13 | 721 |
| Email | $1.074,46 | 372 |
| Social Ads | $822,09 | 619 |
| Paid Search | $648,10 | 665 |

**Visualisierung:** Sheet `ROI vs. LTV` (Scatter-Chart mit Referenzlinien)

**Empfehlung:**
Budgetentscheidungen sollten den LTV genauso stark gewichten wie den kurzfristigen ROI, da beide Kennzahlen unterschiedliche, sich ergänzende Aspekte der Kanaleffizienz abbilden.

---

### Frage 5
*Ihre Empfehlung: Wie sollte das Budget neu verteilt werden? Begründen Sie dies mit Zahlen. Welche Risiken birgt Ihre Empfehlung?*

**Schlussfolgerung:**
Eine Kombination aus ROI- und LTV-Betrachtung liefert eine klare Priorisierung: Budget aus den schwächsten Kanälen (Paid Search, Social Ads) sollte in die stärksten (Organic, Email, Influencer, Referral) umverteilt werden.

**Zahlen:**
Paid Search und Social Ads vereinen zusammen $737,5K Budget (73% des Gesamtbudgets von $981,4K), liefern aber nur ROI 1,33 bzw. 2,06 und LTV $648 bzw. $822 – die schwächsten Werte auf beiden Dimensionen.

**Visualisierung:** Sheets `Marketing` und `ROI vs. LTV`

**Empfehlung:**
1. Budget aus Paid Search und Social Ads reduzieren und zu Organic sowie Email verschieben, die den höchsten unmittelbaren ROI liefern.
2. Investitionen in Influencer und Referral beibehalten oder leicht erhöhen – trotz mittlerem ROI erwirtschaften diese Kanäle die wertvollsten Langzeitkunden und stärken damit die zukünftige Umsatzbasis.

**Risiken:** Organic lässt sich nicht beliebig skalieren (kein direkt steuerbares Budget). Eine zu starke Kürzung von Paid Search und Social Ads könnte kurzfristig die Reichweite und Neukundenzahl verringern.

---

## Fall B: Welche Kategorien sind wirklich profitabel?

### Frage 6
*Vergleichen Sie die Kategorien anhand von drei Dimensionen: Umsatz, Marge, Retourenquote. Welche Kategorie erzeugt eine „Illusion von Umsatzvolumen" – hoher Umsatz, aber geringe tatsächliche Profitabilität?*

**Schlussfolgerung:**
Electronics erwirtschaftet mit $2,1 Mio. den mit Abstand höchsten Umsatz, aber die niedrigste Marge (12%) und die höchste Retourenquote (15,62%) aller Kategorien. Der große Umsatz erzeugt somit eine Illusion von Erfolg – die tatsächliche Profitabilität ist gering.

**Zahlen:**

| Kategorie | Umsatz | Marge | Retourenquote |
|---|---|---|---|
| Electronics | $2.097.901 | 12% | 15,62% |
| Home & Kitchen | $576.135 | 35% | 10,34% |
| Sports | $343.115 | 30% | 8,56% |
| Clothing | $248.601 | 45% | 16,12% |
| Beauty | $168.624 | 55% | 10,42% |
| Toys | $140.506 | 40% | 8,99% |
| Books | $90.758 | 25% | 8,28% |

**Visualisierung:** Sheet `Kategorien` (Bubble-Chart: Umsatz vs. Marge, Größe = Retourenquote)

**Empfehlung:**
Erfolgsmessung nicht allein am Umsatzvolumen ausrichten, sondern Marge und Retourenquote als gleichwertige Steuerungsgrößen etablieren.

---

### Frage 7
*Gibt es einen „versteckten Diamanten" – eine Kategorie mit geringem Umsatz, aber ausgezeichneter Marge und niedriger Retourenquote? Was würden Sie damit empfehlen?*

**Schlussfolgerung:**
Beauty ist der klare "versteckte Diamant": bei vergleichsweise geringem Umsatz ($168.624) erzielt die Kategorie die höchste Marge (55%) bei niedriger Retourenquote (10,42%).

**Zahlen:**
Beauty: Umsatz $168.624 (zweitniedrigster Wert), Marge 55% (höchster Wert), Retourenquote 10,42% (dritt-niedrigster Wert).

**Visualisierung:** Sheet `Kategorien`, Annotation "Versteckte Diamanten"

**Empfehlung:**
Gezielte Marketinginvestition in Beauty, um das Umsatzvolumen bei gleichbleibend hoher Profitabilität zu steigern.

---

## Fall C: Rabatte und wertvolle Kunden

### Frage 8
*Vergleichen Sie Kunden, die überwiegend mit Rabatt kaufen (durchschnittlicher Rabatt > 20 %), mit den übrigen Kunden hinsichtlich der Bestellanzahl. Binden sich rabattgetriebene Kunden an das Unternehmen, oder kaufen sie einmalig und verschwinden?*

**Schlussfolgerung:**
Rabattgetriebene Kunden binden sich nicht an das Unternehmen. Kunden mit durchschnittlichem Rabatt über 20% bestellen im Schnitt nur 2,17 Mal – weniger als halb so oft wie die übrigen Kunden (4,35 Bestellungen).

**Zahlen:**

| Segment | Kundenanzahl | Ø Bestellungen pro Kunde |
|---|---|---|
| Rabatt-Käufer (>20%) | 352 | 2,17 |
| Übrige Kunden | 2.648 | 4,35 |

**Visualisierung:** Sheet `Rabattverhalten` (Bar-Chart)

**Empfehlung:**
Rabattaktionen sollten nicht als Instrument zur Kundenbindung, sondern gezielt zur Neukundengewinnung eingesetzt werden.

---

### Frage 9
*Berechnen Sie, welchen Umsatzanteil die Top-5 %-Kunden ausmachen. Wer sind diese Kunden (Region, Akquisitionskanal)? Wie kann das Unternehmen sie binden?*

**Schlussfolgerung:**
Die 150 wertvollsten Kunden (Top 5% von 3.000) erwirtschaften 35,07% des Gesamtumsatzes. Sie verteilen sich relativ gleichmäßig auf Europe, North America und Southeast Asia, während Middle East und Latin America deutlich unterrepräsentiert sind. Nach Akquisitionskanal dominieren Influencer und Organic – konsistent mit den LTV-Ergebnissen aus Frage 4.

**Zahlen:**

Gesamt: 150 Kunden, $1.218.211,48 Umsatz, 35,07% des Gesamtumsatzes ($3.474.016,03)

*Nach Region:*

| Region | Kunden | Umsatz |
|---|---|---|
| Europe | 42 | $355.478,96 |
| North America | 42 | $343.510,09 |
| Southeast Asia | 38 | $344.602,53 |
| Latin America | 15 | $80.770,55 |
| Middle East | 13 | $93.849,35 |

*Nach Akquisitionskanal:*

| Channel | Kunden | Umsatz |
|---|---|---|
| Influencer | 36 | $344.087,23 |
| Organic | 34 | $295.884,58 |
| Referral | 22 | $198.320,70 |
| Social Ads | 22 | $143.470,87 |
| Paid Search | 19 | $120.683,91 |
| Email | 17 | $115.764,19 |

**Visualisierung:** Dashboard `Kundenwert`, Sheet `Pareto_Kundenumsatz`

**Empfehlung:**
Ein VIP-Programm sollte gezielt auf Kunden aus Europe, North America und Southeast Asia sowie auf Influencer- und Organic-Neukunden ausgerichtet werden, da hier die größte Konzentration wertvoller Kunden liegt.
