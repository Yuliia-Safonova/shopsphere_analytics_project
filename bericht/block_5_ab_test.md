# Block 5 – Statistisches Denken: A/B-Experiment

> Kontext: Das Produktteam testet seit dem 1. Juni 2024 ein neues Checkout-Design. Die Hälfte der Bestellungen erhielt die alte Version (Variante A), die andere Hälfte die neue (Variante B). Für die Analyse werden ausschließlich Bestellungen mit `ab_variant = A` oder `ab_variant = B` berücksichtigt.

---

### Frage 10
*Vergleichen Sie den durchschnittlichen Bestellwert (net_amount) zwischen den Gruppen A und B über alle Bestellungen des Experiments hinweg. Ist Variante B auf den ersten Blick besser?*

**Schlussfolgerung:**
Auf den ersten Blick ja: Variante B zeigt einen leicht höheren durchschnittlichen Bestellwert als Variante A.

**Zahlen:**

| Variante | Anzahl Bestellungen | Ø Bestellwert |
|---|---|---|
| A | 3.681 | $281,73 |
| B | 3.674 | $287,27 |

Differenz: +$5,54 (+1,97 %)

**Visualisierung:** Sheet `AB_Test_Gesamt` (einfacher Vergleich A vs. B)

---

### Frage 11
*Teilen Sie nun jede Gruppe in NEUE Kunden (erste Bestellung innerhalb von ~60 Tagen nach Registrierung) und WIEDERKEHRENDE Kunden auf. Vergleichen Sie den durchschnittlichen Bestellwert in den vier Untergruppen: A-neu, B-neu, A-wiederkehrend, B-wiederkehrend. Was fällt auf?*

**Schlussfolgerung:**
Der Gesamteffekt aus Frage 10 verteilt sich extrem ungleich auf die beiden Kundentypen. Bei Bestandskunden ist der Unterschied zwischen A und B minimal, bei Neukunden dagegen groß.

**Zahlen:**

| Segment | Variante | Anzahl Bestellungen | Ø Bestellwert |
|---|---|---|---|
| Bestandskunde | A | 3.417 | $286,24 |
| Bestandskunde | B | 3.418 | $288,85 |
| Neukunde | A | 264 | $223,30 |
| Neukunde | B | 256 | $266,21 |

- Bestandskunden: +$2,61 (**+0,91 %**) – Unterschied bewegt sich im Rahmen normaler Schwankungen
- Neukunden: +$42,91 (**+19,21 %**) – deutlicher, substanzieller Anstieg

**Visualisierung:** Sheet `AB_Test_Segmentiert` (gruppierter Bar-Chart nach Kundentyp)

---

### Frage 12
*Hier verbirgt sich eine wichtige statistische Lektion. Möglicherweise hilft Variante B einer Gruppe, schadet aber einer anderen – und der Gesamtdurchschnitt verdeckt dies. Formulieren Sie: Für wen lohnt sich die Einführung von Variante B? Kann sie für alle aktiviert werden?*

**Schlussfolgerung:**
Variante B verbessert beide Gruppen – es gibt also keine Umkehrung des Trends wie beim klassischen Simpson-Paradoxon (dazu mehr in Frage 13). Allerdings in völlig unterschiedlichem Ausmaß: Neukunden zeigen einen Anstieg von 19,21 %, Bestandskunden nur 0,91 % – ein Wert, der im Rahmen normaler Schwankungen liegen könnte. Da keine Gruppe durch B benachteiligt wird, kann B grundsätzlich für alle Kunden aktiviert werden. Der erwartete Umsatzeffekt beruht jedoch fast ausschließlich auf dem Verhalten von Neukunden – bei Bestandskunden sollte kein signifikanter Effekt erwartet werden.

**Zahlen:** siehe Frage 11

**Visualisierung:** Sheet `AB_Test_Segmentiert`

---

### Frage 13
*Erinnern Sie sich an die Lektion über Datenmanipulation. Wenn das Marketing Variante B der Geschäftsführung um jeden Preis „verkaufen" wollte – welche Zahlen würde es zeigen? Und wenn es sie „begraben" wollte? Wie sollte ein ehrlicher Analyst das Ergebnis präsentieren?*

**Antwort:**

**Verkaufsargument für B ("B verkaufen"):** Marketing würde die 19,21 % Steigerung bei Neukunden isoliert präsentieren, ohne zu erwähnen, dass diese Gruppe nur 7 % aller Bestellungen im Experiment ausmacht (520 von 7.355).

**Gegenargument ("B begraben"):** Ein Kritiker würde stattdessen nur die Bestandskunden-Gruppe zeigen (+0,91 %, kaum von normalen Schwankungen zu unterscheiden) und daraus schließen, B bringe keinen echten Nutzen.

**Ehrliche Darstellung:** Beide Ebenen – Gesamtdurchschnitt UND Teilgruppen – müssen gemeinsam gezeigt werden, inklusive Stichprobengrößen. Nur so wird sichtbar, dass der Gesamteffekt hauptsächlich von einer kleinen, aber stark reagierenden Neukundengruppe getragen wird.

---

> 💡 **Hinweis zur Einordnung:** Die gefundene Struktur ist strenggenommen **kein klassisches Simpson-Paradoxon** – dafür müsste sich die Richtung des Effekts zwischen Gesamtwert und Teilgruppen umkehren (A > B in einer Teilgruppe). Hier verbessert B beide Segmente, jedoch in stark unterschiedlichem Ausmaß. Es handelt sich um einen **verdeckten heterogenen Behandlungseffekt**: Eine kleine, stark reagierende Untergruppe (Neukunden) prägt den Gesamtdurchschnitt überproportional, während die große Mehrheitsgruppe (Bestandskunden) kaum reagiert. Die zentrale Lektion bleibt dieselbe wie beim Simpson-Paradoxon: Ein einzelner Durchschnittswert kann eine sehr uneinheitliche Realität verdecken – die wichtigste Fähigkeit eines Analysten ist zu wissen, wann man Durchschnittswerten nicht vertrauen darf.
