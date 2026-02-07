# 📝 SQL Übungskatalog - Erweitert v3.0

**Datenbank-Struktur:**

- `Kunden`: KundenID, Vorname, Nachname, Email, Stadt, RegistriertSeit
- `Mitarbeiter`: MitarbeiterID, Vorname, Nachname, Abteilung, Gehalt
- `Produkte`: ProduktID, Produktname, Kategorie, Preis
- `Lagerbestand`: FK_ProduktID, Anzahl, Regalnummer
- `Bestellungen`: BestellID, FK_KundenID, FK_MitarbeiterID, Bestelldatum, Status
- `Bestellpositionen`: BestellpositionsID, FK_BestellID, FK_ProduktID, Menge
- `Produktbewertungen`: BewertungsID, FK_ProduktID, Sterne, Kommentar

---

## 🟢 Level 1: SELECT / FROM / WHERE - Basis (15 Aufgaben)

1. **Alle Kunden anzeigen**: Zeige alle Spalten aus der `Kunden` Tabelle.
2. **Mitarbeiter-Namen**: Zeige nur `Vorname` und `Nachname` aller Mitarbeiter.
3. **Elektronik-Produkte**: Liste alle Produkte der Kategorie 'Elektronik' auf.
4. **Günstige Elektronik**: Finde alle Elektronik-Produkte unter 100€.
5. **Bestellungen ohne Mitarbeiter**: Zeige Bestellungen ohne zugewiesenen Mitarbeiter (`FK_MitarbeiterID` ist NULL).
6. **Alle Mitarbeiter**: Zeige alle Spalten der Tabelle `Mitarbeiter`.
7. **Städte der Kunden**: Liste alle verschiedenen Städte auf, in denen Kunden wohnen.
8. **Bücher im Sortiment**: Zeige die Namen aller Produkte aus der Kategorie 'Bücher'.
9. **Vertriebsmitarbeiter**: Finde alle Mitarbeiter in der Abteilung 'Vertrieb'.
10. **Versandte Bestellungen**: Zeige alle Bestellungen mit dem Status 'Versandt'.
11. **Kontaktdaten**: Liste die Email-Adressen aller Kunden auf.
12. **Produkte mit genauem Preis**: Zeige alle Produkte, deren Preis genau 49.00€ beträgt.
13. **Gut verdienende Mitarbeiter**: Finde alle Mitarbeiter mit einem Gehalt über 3000€.
14. **Fünf-Stern-Bewertungen**: Zeige alle `Produktbewertungen` mit 5 Sternen.
15. **Alle Bestelldaten**: Liste alle Bestelldaten aus der Tabelle `Bestellungen` auf.

---

## 🔵 Level 2: Sortieren & Wildcards (15 Aufgaben)

1. **Kunden nach Nachnamen sortieren**: Liste alle Kunden alphabetisch nach Nachnamen.
2. **Mitarbeiter nach Gehalt sortieren**: Zeige Mitarbeiter sortiert nach Gehalt (höchstes zuerst).
3. **Einzigartige Kundenstadt**: Liste alle einzigartigen Städte der Kunden auf (`DISTINCT`).
4. **Produkte mit K am Anfang**: Finde Produkte, die mit 'K' beginnen.
5. **Deutsche E-Mail-Adressen**: Zeige Kunden mit '.de' Email-Endung.
6. **Produkte mit 'Pro' im Namen**: Finde Produkte, die 'Pro' im Namen enthalten.
7. **Neue Kunden zuerst**: Zeige alle Kunden, sortiert nach dem Registrierungsdatum (neueste zuerst).
8. **Produkte nach Preis**: Liste alle Produkte nach dem Preis auf, von günstig nach teuer.
9. **Namen die auf 'er' enden**: Finde alle Kunden, deren Nachname auf 'er' endet.
10. **Mitarbeiter mit 'S'**: Zeige alle Mitarbeiter, deren Vorname mit 'S' beginnt.
11. **Stühle im Sortiment**: Liste alle Produkte auf, die das Wort 'Stuhl' im Namen enthalten.
12. **Internationale E-Mails**: Finde alle Kunden mit einer '.com' Email-Endung.
13. **Erste 5 Kunden**: Zeige die ersten 5 Kunden in der Tabelle.
14. **Abteilungen**: Liste alle einzigartigen Abteilungen der Mitarbeiter auf.
15. **Bücher finden (case-insensitive)**: Finde alle Produkte, deren Name 'buch' enthält (unabhängig von Groß-/Kleinschreibung).

---

## 🟡 Level 3: Selektion & Verknüpfung (10 Aufgaben)

1. **Mehrere WHERE-Bedingungen**: Zeige alle Kunden aus 'Berlin' oder 'Hamburg'.
2. **AND & OR kombinieren**: Zeige Elektronik-Produkte unter 100€ ODER Möbel über 300€.
3. **BETWEEN nutzen**: Zeige alle Produkte mit einem Preis zwischen 50€ und 200€.
4. **IN-Operator**: Zeige Mitarbeiter aus den Abteilungen 'Vertrieb', 'IT' oder 'Marketing'.
5. **Bestellungen mit zwei Bedingungen**: Zeige alle Bestellungen im Status 'Versandt' oder 'In Bearbeitung', sortiert nach Datum.
6. **LIMIT kombinieren**: Zeige die 10 teuersten Produkte.
7. **Mehrere Filterbedingungen**: Zeige Kunden, die sich 2023 registriert haben und aus 'Berlin' sind.
8. **Null-Prüfung**: Zeige alle Bestellungen, bei denen ein Mitarbeiter zugewiesen ist (NOT NULL).
9. **Sortierung mit LIMIT**: Zeige die 5 ältesten Kunden (nach Registrierungsdatum).
10. **Komplexe Bedingung**: Zeige Bestellungen mit Status 'Versandt' ODER Status 'In Bearbeitung', aber nur von Kunden aus Berlin.

---

## 🔴 Level 4: Aggregatsfunktionen - SUM, AVG, COUNT, MIN, MAX (15 Aufgaben)

1. **Gesamte Kundenanzahl**: Zähle die Gesamtanzahl der Kunden.
2. **Durchschnittsgehalt**: Berechne das Durchschnittsgehalt aller Mitarbeiter.
3. **Höchster Produktpreis**: Was ist der höchste Produktpreis im System?
4. **Gesamte Lageranzahl**: Berechne die Gesamtanzahl aller Artikel im Lager.
5. **Produkte pro Kategorie zählen**: Zeige jede Kategorie mit der Anzahl ihrer Produkte (mit GROUP BY).
6. **Summe aller Gehälter**: Berechne die Gesamtsumme aller Gehälter (monatlich).
7. **Günstigstes Elektronik-Produkt**: Was ist der niedrigste Preis eines Produkts in der Kategorie 'Elektronik'?
8. **Gesamtanzahl Bestellungen**: Wie viele Bestellungen wurden insgesamt aufgegeben?
9. **Kunden pro Stadt**: Zeige die Anzahl der Kunden pro Stadt (mit GROUP BY).
10. **Durchschnittsgehalt Vertrieb**: Was ist das Durchschnittsgehalt der Mitarbeiter in der Abteilung 'Vertrieb'?
11. **Teuerste und günstigste Produkt**: Zeige das teuerste und das günstigste Produkt mit ihren Preisen.
12. **Bewertungen pro Produkt**: Zähle die Anzahl der Bewertungen für jedes Produkt.
13. **Lagerbestand nach Regalnummer**: Zeige den Gesamtlagerbestand pro Regalnummer (mit GROUP BY).
14. **Durchschnittliche Produktpreise pro Kategorie**: Zeige jede Kategorie mit dem durchschnittlichen Produktpreis.
15. **Erste und letzte Bestellung**: Zeige das Datum der ersten und letzten Bestellung im System (MIN und MAX).

---

## 🟠 Level 5: JOINS mit 2 Tabellen (15 Aufgaben)

1. **Einfacher INNER JOIN - Bestellung + Kunde**: Zeige `BestellID` und den `Nachnamen` des Kunden für jede Bestellung.
2. **INNER JOIN - Produkt + Lagerbestand**: Zeige Produktnamen und Regalnummern (einfache Verknüpfung).
3. **INNER JOIN mit WHERE**: Zeige zu jeder Bestellung den Nachnamen des zuständigen Mitarbeiters (nur Bestellungen mit Mitarbeiter).
4. **INNER JOIN - Produkt + Bewertung**: Zeige Produktnamen und Sterne-Bewertungen zusammen.
5. **INNER JOIN mit Filter**: Zeige die Namen von Kunden aus 'Berlin', die bestellt haben (BestellID auch anzeigen).
6. **JOIN und Sortieren**: Zeige Bestellungen mit Vornamen des Kunden, sortiert nach Bestelldatum.
7. **JOIN mit Null-Werten**: Zeige Produkte mit Lagerbestand, aber nur wenn die Anzahl nicht 0 ist.
8. **JOIN + Aggregation einfach**: Zeige Produktnamen und zähle ihre Bewertungen (mit COUNT).
9. **JOIN von 3 Tabellen (einfach)**: Zeige Kunde + Bestellung + Produkt (mit einfachen Tabellen).
10. **JOIN mit Bedingung**: Zeige alle Bestellungen von Mitarbeitern aus der Abteilung 'Vertrieb'.
11. **LEFT JOIN - Kunden ohne Bestellungen**: Zeige alle Kunden und ihre Bestellungen (auch wenn keine).
12. **LEFT JOIN - Produkte ohne Lager**: Zeige alle Produkte und ihren Lagerbestand (auch wenn 0).
13. **LEFT JOIN - Produkte ohne Bewertungen**: Zeige alle Produkte und ihre Sterne (auch wenn keine Bewertung).
14. **JOIN mit Daten-Ausgabe**: Zeige Kundennamen, Bestelldatum und Status für alle Bestellungen.
15. **JOIN und ORDER BY**: Zeige Kunden mit ihren Bestelldaten, sortiert nach Kundennamen und dann Bestelldatum.

---

## 🟠 Level 6: DISTINCT - Einzigartige Werte abfragen (10 Aufgaben)

1. **Unterschiedliche Kategorien**: Welche unterschiedlichen Produktkategorien existieren im Shop?
2. **Mitarbeiter-Abteilungen**: Zeige alle unterschiedlichen Abteilungen der Mitarbeiter.
3. **Bestellstati**: Welche unterschiedlichen Status-Werte haben Bestellungen?
4. **Kategorien bestellt**: Welche unterschiedlichen Produktkategorien wurden mindestens einmal bestellt? (mit JOIN)
5. **Lager-Regale**: Zeige alle Regalnummern, in denen Produkte lagern (DISTINCT).
6. **Kundenstädte mit Bestellungen**: Zeige alle einzigartigen Städte von Kunden, die bestellt haben (mit JOIN).
7. **Mitarbeiter mit Bestellungen**: Zeige die unterschiedlichen Mitarbeiter, die Bestellungen bearbeitet haben (mit DISTINCT).
8. **Bewertungs-Sterne**: Wie viele unterschiedliche Stern-Bewertungen (1-5) gibt es für Produkte?
9. **Produktkategorien im Lager**: Welche unterschiedlichen Kategorien von Produkten sind im Lagerbestand vorhanden? (mit JOIN)
10. **Kombinierte DISTINCT**: Zeige unterschiedliche Kombinationen von Stadt und Kategorie von Kunden, die Produkte bestellt haben.

---

## 🔴 Level 7: ALIASES - Spaltennamen umbenennen (12 Aufgaben)

1. **Kundenname mit Alias**: Zeige `Vorname AS 'Erster Name'` und `Nachname AS 'Familienname'` aller Kunden.
2. **Produkt-Alias**: Zeige `Produktname AS Artikel, Preis AS Einzelpreis, Kategorie AS Warengruppe`.
3. **Mitarbeiter-Alias**: Zeige `Vorname AS Mitarbeiter, Abteilung AS Bereich, Gehalt AS Monatssalär` aller Mitarbeiter.
4. **Lagerbestand-Alias**: Zeige `Anzahl AS 'Im Lager', Regalnummer AS 'Regal-Nr'` für alle Lagerbestände.
5. **Bestellung-Alias**: Zeige `BestellID AS 'Bestell-Nr', Bestelldatum AS 'Datum', Status AS 'Zustand'`.
6. **Alias mit Berechnung**: Zeige `Preis * 1.19 AS 'Brutto-Preis', Preis AS 'Netto-Preis'` für Produkte.
7. **Alias in Aggregation**: Zeige `COUNT(*) AS 'Anzahl Kunden', AVG(Gehalt) AS 'Durchschn. Gehalt'`.
8. **Alias in Bedingung**: Zeige Kategorien mit `COUNT(*) AS 'Produkt-Anzahl'` und filter nur die mit mehr als 2 Produkten.
9. **JOIN mit TABLE-Alias**: Verwende `FROM Kunden AS k JOIN Bestellungen AS b` und zeige k.Vorname, b.BestellID.
10. **Kombinierte Aliases**: Zeige Kunden mit `Vorname AS 'Kundenname', Stadt AS 'Ort'` für Kunden mit Bestellungen.
11. **Alias für Kategorien-Zählung**: Zeige `Kategorie AS 'Produktkategorie', COUNT(*) AS 'Anzahl Produkte'`.
12. **Komplexe Aliases mit JOIN**: Zeige `p.Produktname AS Produkt, l.Anzahl AS 'Lagerbestand', l.Regalnummer AS 'Standort'`.

---

## 🔴 Level 8: Verbundtabellen mit 2+ JOINs aus 3+ Tabellen (15 Aufgaben)

1. **3-Wege-JOIN (Basis)**: Zeige Kundennamen, Bestelldatum und Mitarbeitername für Bestellungen.
2. **3-Wege-JOIN mit WHERE**: Zeige Kunden, Bestellungen und Mitarbeiter nur für Bestellungen im Status 'Versandt'.
3. **4-Wege-JOIN (Basis)**: Zeige Kundennamen, BestellID, Produktnamen und Menge.
4. **3-Tabellen mit Sortierung**: Zeige Kunde + Bestellung + Mitarbeiter, sortiert nach Kundennamen.
5. **JOIN mit DISTINCT**: Zeige unterschiedliche Produkte, die Kunden aus Berlin bestellt haben.
6. **LEFT JOIN in Mehrfach-JOIN**: Zeige alle Kunden mit ihren Bestellungen (auch ohne) und Mitarbeitern.
7. **JOIN + WHERE + ORDER BY**: Zeige Bestellpositionen mit Produktnamen, nur für Kategorie 'Elektronik', sortiert nach Preis.
8. **3-Wege-JOIN mit Berechnung**: Zeige Produktname, Menge, Preis und berechneten Gesamtwert (Menge \* Preis).
9. **JOIN Kunde + Bestellung + Bestellposition + Produkt**: Zeige was jeder Kunde genau wann bestellt hat (mit Mengen).
10. **JOIN mit Alias und mehreren Tabellen**: Verwende Aliases (k, b, m, p) und zeige Kundennamen, Bestelldatum, Mitarbeitername, Produktnamen.
11. **LEFT JOIN + INNER JOIN kombiniert**: Zeige alle Kunden, ihre Bestellungen (auch ohne) und nur die mit Produkten.
12. **3-Wege-JOIN mit Abteilung**: Zeige für jede Bestellung: Kundennamen, Mitarbeiternamen und dessen Abteilung.
13. **GROUP BY mit mehreren JOINs**: Zeige pro Kategorie die Anzahl verkauften Produkte (mit COUNT).
14. **Komplexer JOIN mit mehreren Filter**: Zeige Bestellungen von Berliner Kunden, bearbeitet von Vertriebsmitarbeitern, mit Produkten über 100€.
15. **JOIN mit Bewertungen**: Zeige Bestellungen mit Kundennamen, Produktnamen und deren Bewertungen/Sterne (mit LEFT JOIN auf Bewertungen).

---

## 🔴 Level 9: Komplexe Abfragen mit JOINS & Aggregation (15 Aufgaben)

1. **Umsatz pro Bestellung**: Berechne für jede BestellID die Summe (Menge \* Preis aus Bestellpositionen).
2. **Umsatz pro Kunde**: Welcher Kunde hat insgesamt welchen Umsatz generiert? (mit SUM und mehreren JOINs).
3. **Produkte pro Kategorie mit Summe**: Zeige jede Kategorie mit Anzahl Produkte und Gesamtlagerbestand.
4. **Durchschnittliche Bestellmenge**: Was ist die durchschnittliche Menge pro Bestellposition?
5. **Teuerste Bestellung berechnen**: Welche BestellID hat den höchsten Gesamtwert (Menge \* Preis)?
6. **Produkte nach Verkaufsmenge**: Zeige Produkte, sortiert nach wie oft sie verkauft wurden (mit COUNT).
7. **Kategorien-Umsatz**: Welche Produktkategorie hat insgesamt den höchsten Umsatz gemacht?
8. **Mit HAVING-Klausel**: Zeige nur Kunden, deren Gesamtumsatz über 500€ liegt.
9. **Mit HAVING-Klausel (Produkte)**: Zeige nur Produkte, die mehr als 2-mal bestellt wurden.
10. **Häufige Mitarbeiter**: Zeige Mitarbeiter, die mehr als 1 Bestellung bearbeitet haben (mit HAVING).
11. **Bestseller pro Kategorie**: Zeige pro Kategorie das meistverkaufte Produkt (nach Menge).
12. **Lagerwert nach Kategorie**: Berechne den Gesamtwert des Lagers pro Kategorie (Preis \* Anzahl).
13. **Mitarbeiter-Performance**: Zeige pro Mitarbeiter wie viele Bestellungen er bearbeitet hat und deren Gesamtumsatz.
14. **Bestellstati-Umsatz**: Zeige pro Bestellstatus (Versandt, Offen, etc.) den Gesamtumsatz.
15. **Durchschnittliche Bewertung pro Produkt**: Zeige pro Produkt die Anzahl Bewertungen und Durchschnittssterne (mit AVG).

---

## 🔥 Level 10: PROFI-LEVEL - Mehrfach-JOINs & Advanced Queries (12 Aufgaben)

1. **Umsatz pro Stadt**: Welche Stadt hat insgesamt welchen Umsatz erzielt? (mit mehreren JOINs und GROUP BY).
2. **Top 3 Kunden nach Umsatz**: Zeige die 3 besten Kunden mit Namen und Gesamtumsatz (mit LIMIT).
3. **Lagerverkehrte Produkte**: Welche Produkte sind im Lager, wurden aber noch nie bestellt? (mit LEFT JOIN).
4. **Produktanalyse komplett**: Für jedes Produkt zeige: Name, Preis, Lagerbestand, Anzahl Bewertungen, Durchschnittssterne.
5. **Kundenliste mit Details**: Zeige pro Kunde: Name, Stadt, Anzahl Bestellungen, Gesamtumsatz (mit mehreren JOINs).
6. **Kategorie-Performance**: Zeige pro Kategorie: Anzahl Produkte, Durchschnittspreis, Gesamtumsatz, Bestseller.
7. **Stornierungsanalyse**: Welche Kunden haben stornierte Bestellungen? Zeige Name, Email, Anzahl Stornierungen.
8. **Lagerwert nach Regal**: Zeige pro Regalnummer: Anzahl Produkte, Durchschnittswert pro Produkt, Gesamtwert.
9. **Mitarbeiter-Performance detailliert**: Zeige pro Mitarbeiter: Name, Abteilung, Anzahl Bestellungen, Gesamtumsatz, Durchschnitt pro Bestellung.
10. **Zeitliche Trends**: Zeige pro Monat die Anzahl Bestellungen und Gesamtumsatz (gruppiert nach Monat).
11. **Subquery**: Zeige alle Produkte, deren Preis über dem Durchschnittspreis ihrer Kategorie liegt.
12. **Komplexer Business-Report**: Erstelle einen Report mit: Gesamtkunden, Gesamtbestellungen, Durchschnitt-Umsatz, Top-Kategorie, Top-Mitarbeiter.
