# Bericht – ShopSphere Analytics

> Antworten auf alle 13 Fragen des Projekts (Block 3–5) sowie die zentralen Handlungsempfehlungen für die CEO.
> Format je Geschäftsfrage: **Schlussfolgerung → Zahlen zur Bestätigung → Visualisierung → Empfehlung**

---

## Block 3 – Dashboard für die CEO

### Frage 1
*Beschreiben Sie die Logik des Aufbaus: Welche Geschichte erzählt das Dashboard von oben nach unten? Warum genau diese Reihenfolge?*

**Antwort:**
Das Dashboard `Geschäftsüberblick` folgt einer Logik von **grob nach fein, von deskriptiv zu diagnostisch**:

1. **Oben:** KPI-Karten (Gesamtumsatz, Anzahl Bestellungen, Ø Bestellwert, Retourenquote) plus die beiden Filter (Region, Jahr). Der Betrachter sieht zuerst die nackten Zahlen zum Geschäft als Ganzes, bevor er in Details geht.
2. **Mitte:** Saisonalität und Regionale Dynamik nebeneinander – beide beantworten die Frage „Wann und wo wächst das Geschäft?" auf Basis derselben Kennzahl (Umsatz über Zeit), einmal nach Monat, einmal nach Region.
3. **Unten:** Marketing (Budget vs. Effizienz) und Kategorien (Umsatz vs. Profitabilität) nebeneinander – beide gehen von „Wie viel Umsatz?" zu „Wie effizient/profitabel eigentlich?" über und leiten damit direkt zu den vertiefenden Fragen in Block 4 über.

Das zweite Dashboard `Kundenwert` ist bewusst separat gehalten: Es beantwortet nur eine einzige, aber strategisch zentrale Frage (Kundenkonzentration nach dem Pareto-Prinzip) und folgt derselben Logik im Kleinen – erst die Kernzahl (35 % / 150 Kunden) und eine Kernaussage in Textform, dann die belegende Visualisierung (Pareto-Kurve, danach der einfache Vergleich Top 5 % vs. Rest).

### Frage 2
*Welche 3 Erkenntnisse soll der Betrachter innerhalb der ersten 30 Sekunden erfassen?*

**Antwort:**

1. **Geschäftsgröße auf einen Blick:** $3.474.016,03 Gesamtumsatz bei 12.274 Bestellungen, Ø Bestellwert $283,04, Retourenquote 9,77 % – die vier KPI-Karten geben sofort ein Gefühl für die Größenordnung des Geschäfts.
2. **Wachstum ist saisonal und regional ungleich verteilt:** Umsatz erreicht seinen Höhepunkt im Dezember 2024, und Nordamerika sowie Südostasien wachsen deutlich stärker als der stagnierende Nahe Osten.
3. **Das Marketingbudget ist an der falschen Stelle konzentriert:** Organic liefert den höchsten ROI bei kleinem Budget, während der Großteil des Geldes in weniger effiziente Kanäle wie Paid Search fließt – ein sofort sichtbares Handlungsfeld für die Geschäftsführung.

---

## Block 4 – Strategische Geschäftsfälle

### Fall A: Wohin soll das Marketingbudget investiert werden?

#### Frage 3
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

#### Frage 4
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

#### Frage 5
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

### Fall B: Welche Kategorien sind wirklich profitabel?

#### Frage 6
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

#### Frage 7
*Gibt es einen „versteckten Diamanten" – eine Kategorie mit geringem Umsatz, aber ausgezeichneter Marge und niedriger Retourenquote? Was würden Sie damit empfehlen?*

**Schlussfolgerung:**
Beauty ist der klare "versteckte Diamant": bei vergleichsweise geringem Umsatz ($168.624) erzielt die Kategorie die höchste Marge (55%) bei niedriger Retourenquote (10,42%).

**Zahlen:**
Beauty: Umsatz $168.624 (zweitniedrigster Wert), Marge 55% (höchster Wert), Retourenquote 10,42% (dritt-niedrigster Wert).

**Visualisierung:** Sheet `Kategorien`, Annotation "Versteckte Diamanten"

**Empfehlung:**
Gezielte Marketinginvestition in Beauty, um das Umsatzvolumen bei gleichbleibend hoher Profitabilität zu steigern.

---

### Fall C: Rabatte und wertvolle Kunden

#### Frage 8
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

#### Frage 9
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

---

## Block 5 – Statistisches Denken: A/B-Experiment

> Kontext: Das Produktteam testet seit dem 1. Juni 2024 ein neues Checkout-Design. Die Hälfte der Bestellungen erhielt die alte Version (Variante A), die andere Hälfte die neue (Variante B). Für die Analyse werden ausschließlich Bestellungen mit `ab_variant = A` oder `ab_variant = B` berücksichtigt.

### Frage 10
*Vergleichen Sie den durchschnittlichen Bestellwert (net_amount) zwischen den Gruppen A und B über alle Bestellungen des Experiments hinweg. Ist Variante B auf den ersten Blick besser?*

**Schlussfolgerung:**
Auf den ersten Blick ja: Variante B erzielt einen um rund 2% höheren durchschnittlichen Bestellwert als Variante A.

**Zahlen:**

| Variante | Bestellungen | Ø Bestellwert |
|---|---|---|
| A | 3.681 | $281,73 |
| B | 3.674 | $287,27 |

**Visualisierung:** Sheet `AB_Test_Gesamt`

---

### Frage 11
*Teilen Sie nun jede Gruppe in NEUE Kunden (erste Bestellung innerhalb von ~60 Tagen nach Registrierung) und WIEDERKEHRENDE Kunden auf. Vergleichen Sie den durchschnittlichen Bestellwert in den vier Untergruppen: A-neu, B-neu, A-wiederkehrend, B-wiederkehrend. Was fällt auf?*

**Schlussfolgerung:**
Der Effekt aus Frage 10 ist alles andere als gleichmäßig verteilt. Bei Bestandskunden ist der Unterschied zwischen A und B praktisch nicht vorhanden (+0,9%). Bei Neukunden dagegen ist der Effekt massiv: Variante B steigert den Bestellwert um satte 19%. Der positive Gesamteindruck aus Frage 10 wird also fast ausschließlich von den Neukunden getragen.

**Zahlen:**

| Gruppe | Bestellungen | Ø Bestellwert |
|---|---|---|
| A – Bestandskunde | 3.417 | $286,24 |
| B – Bestandskunde | 3.418 | $288,85 |
| A – Neukunde | 264 | $223,30 |
| B – Neukunde | 256 | $266,21 |

**Visualisierung:** Sheet `AB_Test_Segmentiert`

---

### Frage 12
*Hier verbirgt sich eine wichtige statistische Lektion. Möglicherweise hilft Variante B einer Gruppe, schadet aber einer anderen – und der Gesamtdurchschnitt verdeckt dies. Formulieren Sie: Für wen lohnt sich die Einführung von Variante B? Kann sie für alle aktiviert werden?*

**Schlussfolgerung:**
Variante B lohnt sich klar für Neukunden (+19%, $223,30 → $266,21) – für Bestandskunden liefert sie dagegen keinen praktisch relevanten Mehrwert (+0,9%). Eine pauschale Aktivierung für alle Kunden ist daher nicht zu empfehlen: Neukunden machen nur rund 7% aller Bestellungen im Experiment aus (520 von 7.355), ihr starker Effekt geht im Gesamtdurchschnitt fast unter – genau deshalb wirkt B in Frage 10 nur "leicht besser", obwohl sie für ein Segment einen sehr großen Unterschied macht.

**Zahlen:**
Effekt Neukunde: +19,2% ($42,91 Differenz) · Effekt Bestandskunde: +0,9% ($2,61 Differenz) · Anteil Neukunden am Experiment: ~7,1%

**Visualisierung:** Sheet `AB_Test_Segmentiert`

**Empfehlung:**
Variante B gezielt für Neukunden ausrollen. Für Bestandskunden liegt aktuell kein belastbarer Vorteil vor – hier sollte entweder bei Variante A geblieben oder ein separater, ausreichend langer Test angesetzt werden, bevor B flächendeckend aktiviert wird.

---

### Frage 13
*Erinnern Sie sich an die Lektion über Datenmanipulation. Wenn das Marketing Variante B der Geschäftsführung um jeden Preis „verkaufen" wollte – welche Zahlen würde es zeigen? Und wenn es sie „begraben" wollte? Wie sollte ein ehrlicher Analyst das Ergebnis präsentieren?*

**Antwort:**
Um B zu „verkaufen", würde Marketing den Gesamtdurchschnitt (+2%) zusammen mit der Neukunden-Zahl (+19%) präsentieren und den Eindruck erwecken, dieser Effekt gelte für die gesamte Kundenbasis. Um B zu „begraben", würde man umgekehrt ausschließlich die Bestandskunden-Zahl (+0,9%, kein relevanter Effekt) zeigen und daraus schließen, das neue Checkout-Design bringe nichts.

Ein ehrlicher Analyst zeigt beide Ebenen gemeinsam – den Gesamtdurchschnitt und die Segmentierung nach Kundentyp, inklusive Stichprobengrößen – und macht transparent, dass der Effekt stark ungleich verteilt ist. Das ist ein klassisches Beispiel für das **Simpson-Paradoxon**: Nur die Aufteilung in Untergruppen zeigt, wo der tatsächliche Nutzen liegt, und ermöglicht der Geschäftsführung eine informierte, segmentspezifische Entscheidung statt einer pauschalen Ja/Nein-Aussage.

> 💡 **Hinweis:** Dies ist ein Beispiel für das **Simpson-Paradoxon** – eine Schlussfolgerung auf Basis von Gesamtdaten kann sich ins Gegenteil verkehren, sobald die Daten in Untergruppen aufgeteilt werden. Die wichtigste Fähigkeit eines Analysten ist nicht, Durchschnittswerte zu berechnen, sondern zu wissen, wann man ihnen nicht vertrauen darf.

---

## Zusammenfassung – Zentrale Empfehlungen für die CEO

### Empfehlung 1: Marketingbudget umschichten – von Paid Search/Social Ads zu Organic/Email

Paid Search und Social Ads vereinen zusammen $737,5K (73% des Gesamtbudgets von $981,4K), liefern aber den niedrigsten ROI (1,33 bzw. 2,06) und den niedrigsten Kundenwert (LTV $648 bzw. $822). Organic (ROI 8,02) und Email (ROI 6,50) sind massiv unterfinanziert im Verhältnis zu ihrer Effizienz. Budget aus den beiden schwächsten Kanälen sollte gezielt zu Organic und Email verschoben werden.

### Empfehlung 2: Kanalentscheidungen an ROI **und** LTV ausrichten, nicht nur an kurzfristigem ROI

Influencer und Referral erzielen trotz nur mittlerem Kampagnen-ROI den höchsten langfristigen Kundenwert ($1.985 bzw. $1.792 LTV). Diese Kanäle sollten mindestens auf aktuellem Niveau gehalten oder leicht ausgebaut werden, da sie die wertvollste Kundenbasis für die Zukunft aufbauen.

### Empfehlung 3: Erfolgsmessung der Kategorien von Umsatz auf Marge und Retouren umstellen

Electronics erzeugt mit $2,1 Mio. Umsatz eine „Illusion von Erfolg" – bei niedrigster Marge (12%) und höchster Retourenquote (15,62%) aller Kategorien. Beauty dagegen ist ein „versteckter Diamant": geringer Umsatz ($168,6K), aber höchste Marge (55%) und niedrige Retourenquote (10,42%). Empfehlung: gezielte Marketinginvestition in Beauty, kritische Prüfung der Electronics-Strategie (Produktmix, Retourenursachen).

### Empfehlung 4: Rabatte gezielt zur Neukundengewinnung einsetzen, VIP-Programm für Top-Kunden aufbauen

Rabattgetriebene Kunden (Ø Rabatt > 20%) bestellen nur 2,17-mal im Schnitt – weniger als halb so oft wie übrige Kunden (4,35). Rabatte binden also nicht, sondern ziehen eher Einmalkäufer an. Parallel erwirtschaften die Top-5%-Kunden (150 von 3.000) 35,07% des Gesamtumsatzes und konzentrieren sich auf Europe, North America und Southeast Asia sowie auf die Kanäle Influencer und Organic. Ein VIP-Programm sollte gezielt auf dieses Profil ausgerichtet werden.

### Empfehlung 5: Neues Checkout-Design (Variante B) gezielt für Neukunden ausrollen

Der A/B-Test zeigt auf Gesamtebene nur einen leichten Vorteil für Variante B (+2%). Segmentiert nach Kundentyp zeigt sich jedoch ein klares Simpson-Paradoxon: Bei Neukunden steigert B den durchschnittlichen Bestellwert um 19% ($223,30 → $266,21), bei Bestandskunden ist der Effekt praktisch null (+0,9%). Empfehlung: Variante B zunächst gezielt für Neukunden aktivieren statt pauschal für alle.

---

### Wichtigste Risiken und offene Fragen

- **Organic ist nicht beliebig skalierbar.** Der Kanal hat kein direkt steuerbares Budget – eine reine Umschichtung dorthin stößt an natürliche Grenzen.
- **Reichweitenrisiko bei Kürzung von Paid Search/Social Ads.** Beide Kanäle liefern trotz niedriger Effizienz einen großen Teil der Neukunden-Reichweite; zu starke Kürzungen könnten das Neukundenwachstum bremsen.
- **Stichprobengröße im A/B-Test für Neukunden ist klein** (520 von 7.355 Bestellungen im Experiment, ca. 7%). Vor einem vollständigen Rollout von Variante B für dieses Segment empfiehlt sich ein längerer bzw. breiterer Test zur Absicherung des Effekts.
- **Middle East und Latin America sind unter den Top-5%-Kunden deutlich unterrepräsentiert.** Unklar, ob dies eine Marktchance, ein Kanal-Mix-Problem oder ein strukturelles Merkmal dieser Regionen ist – weitere Analyse empfohlen, bevor Budget dorthin verschoben oder von dort abgezogen wird.
- **Electronics bleibt trotz geringer Marge umsatzstärkste Kategorie.** Eine Reduzierung des Fokus birgt kurzfristiges Umsatzrisiko; Empfehlung 3 zielt auf Optimierung (Retourenursachen, Produktmix), nicht auf Rückzug aus der Kategorie.
