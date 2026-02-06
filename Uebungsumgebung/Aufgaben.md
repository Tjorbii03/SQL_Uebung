# 📝 SQL Übungskatalog (Erweitert: 1 - 88)

## 🟢 Level 1: Basics (1-15)

1. Zeige alle Spalten der Tabelle `Kunden`.
2. Zeige nur `Vorname` und `Nachname` aller Mitarbeiter.
3. Liste alle Produkte der Kategorie 'Elektronik' auf.
4. Finde Elektronik-Produkte unter 100€.
5. Zeige Bestellungen ohne zugewiesenen Mitarbeiter (`FK_MitarbeiterID` ist NULL).
6. Zeige alle Spalten der Tabelle `Mitarbeiter`.
7. Liste alle verschiedenen Städte auf, in denen Kunden wohnen.
8. Zeige die Namen aller Produkte aus der Kategorie 'Bücher'.
9. Finde alle Mitarbeiter in der Abteilung 'Vertrieb'.
10. Zeige alle Bestellungen, die den Status 'Versandt' haben.
11. Liste die Email-Adressen aller Kunden auf.
12. Zeige alle Produkte, deren Preis genau 49.00 beträgt.
13. Finde alle Mitarbeiter mit einem Gehalt über 3000€.
14. Zeige alle `Produktbewertungen` mit 5 Sternen.
15. Liste alle Bestelldaten aus der Tabelle `Bestellungen` auf.

## 🔵 Level 2: Sortierung & Wildcards (1-15)

1. Liste Kunden alphabetisch nach Nachnamen.
2. Zeige Mitarbeiter sortiert nach Gehalt (höchstes zuerst).
3. Liste alle einzigartigen Städte der Kunden auf (`DISTINCT`).
4. Produkte, die mit 'K' beginnen.
5. Kunden mit '.de' Email-Endung.
6. Produkte, die 'Pro' im Namen enthalten.
7. Zeige alle Kunden, sortiert nach dem Registrierungsdatum (neueste zuerst).
8. Liste alle Produkte nach dem Preis auf, von günstig nach teuer.
9. Finde alle Kunden, deren Nachname auf 'er' endet.
10. Zeige alle Mitarbeiter, deren Vorname mit 'S' beginnt.
11. Liste alle Produkte auf, die das Wort 'Stuhl' im Namen enthalten.
12. Finde alle Kunden mit einer '.com' Email-Endung.
13. Zeige die ersten 5 Kunden in der Tabelle.
14. Liste alle einzigartigen Abteilungen der Mitarbeiter auf.
15. Finde alle Produkte, deren Name 'buch' enthält (unabhängig von Groß-/Kleinschreibung).

## 🟡 Level 3: Aggregation (1-15)

1. Gesamtanzahl der Kunden (`Anzahl_Kunden`).
2. Durchschnittsgehalt aller Mitarbeiter.
3. Der höchste Produktpreis im System.
4. Gesamte Artikelanzahl im Lager.
5. Anzahl der Produkte pro Kategorie.
6. Berechne den Brutto-Preis (Preis \* 1.19) für alle Produkte.
7. Was ist der niedrigste Preis eines Produkts in der Kategorie 'Elektronik'?
8. Wie viele Bestellungen wurden insgesamt aufgegeben?
9. Zähle die Anzahl der Bewertungen für jedes Produkt.
10. Was ist das Durchschnittsgehalt der 'Vertrieb'-Abteilung?
11. Berechne die Gesamtsumme aller Gehälter, die monatlich ausgezahlt werden.
12. Zeige die Anzahl der Kunden pro Stadt.
13. Was ist das teuerste und das günstigste Produkt?
14. Wie viele Produkte gibt es in jeder Kategorie?
15. Zeige das Datum der ersten und letzten Bestellung.

## 🟠 Level 4: Joins (2 Tabellen) (1-15)

1. Zeige `BestellID` und den `Nachnamen` des Kunden.
2. Liste Produktnamen und ihre Regalnummern auf.
3. Zeige zu jeder Bestellung den Nachnamen des Mitarbeiters.
4. Zeige alle Produktnamen und ihre Sterne-Bewertungen.
5. Zeige Kunden aus 'Berlin', die bereits bestellt haben.
6. Zeige zu jeder Bestellung den Vornamen des Kunden und den Status der Bestellung.
7. Liste alle Produkte auf, die im Lager eine Anzahl von 0 haben, und zeige ihre Namen.
8. Zeige die Kommentare zu den Produktbewertungen zusammen mit dem Produktnamen.
9. Welche Mitarbeiter haben Bestellungen für Kunden aus 'Hamburg' bearbeitet? Zeige die Nachnamen der Mitarbeiter.
10. Liste alle Bestellungen auf, die Produkte aus der Kategorie 'Möbel' enthalten. Zeige die BestellID.
11. Zeige den Vornamen des Kunden und das Bestelldatum für alle stornierten Bestellungen.
12. Welcher Mitarbeiter (Nachname) hat die Bestellung mit der `BestellID` 3 bearbeitet?
13. Liste die Namen aller Produkte auf, die eine 5-Sterne-Bewertung erhalten haben.
14. Zeige die Email-Adressen der Kunden, die 'Laptop Pro' bestellt haben.
15. Welche Produkte (Produktname) befinden sich im Regal 'A1'?

## 🔴 Level 5: Komplexe Joins & Logik (1-15)

1. **3-Wege-Join:** Zeige Kunden-Vorname, Bestelldatum und Produktname.
2. **4-Wege-Join:** Zeige Kunden-Nachname, BestellID, Produktname und Menge.
3. **Umsatz:** Berechne für jede `BestellID` den Gesamtwert (`Menge * Preis`).
4. **Stadt-Umsatz:** Welchen Gesamtumsatz hat jede Stadt generiert?
5. **Mitarbeiter-Umsatz:** Welcher Mitarbeiter hat insgesamt welchen Umsatz bearbeitet?
6. **Bestseller:** Welches Produkt wurde (gemessen an der Menge) am häufigsten verkauft?
7. **Interessen:** Welche Kunden (Email) haben Produkte aus der Kategorie 'Bücher' gekauft?
8. **Ladenhüter:** Welche Produkte wurden noch nie bestellt? (LEFT JOIN nutzen).
9. **Subquery:** Zeige alle Produkte, deren Preis über dem Durchschnittspreis aller Produkte liegt.
10. **Having:** Zeige nur Kategorien, die mehr als 2 Produkte enthalten.
11. **Zeit-Analyse:** Zeige alle Bestellungen, die im Oktober 2023 getätigt wurden.
12. **Inventar-Wert:** Berechne den Gesamtwert des Lagers pro Regalnummer.
13. **Profi-Check:** Liste Kunden auf, die mehr als 500€ Gesamtwert bestellt haben.
14. **CASE-Anweisung:** Gib eine Liste aller Produkte aus. Wenn der Preis unter 100€ liegt, soll 'Günstig' stehen, zwischen 100€ und 500€ 'Mittel', und darüber 'Teuer'.
15. **Self-Join (hypothetisch):** Finde Mitarbeiter, die in der gleichen Abteilung arbeiten. (Hinweis: Dafür müsste die Tabelle eine Beziehung zu sich selbst haben, was hier nicht der Fall ist, aber wir können es mit einem normalen Join auf dieselbe Tabelle simulieren).