# 📝 SQL Übungskatalog (Erweitert: 1 - 35)

## 🟢 Level 1: Basics (1-5)
1. Zeige alle Spalten der Tabelle `Kunden`.
2. Zeige nur `Vorname` und `Nachname` aller Mitarbeiter.
3. Liste alle Produkte der Kategorie 'Elektronik' auf.
4. Finde Elektronik-Produkte unter 100€.
5. Zeige Bestellungen ohne zugewiesenen Mitarbeiter (`FK_MitarbeiterID` ist NULL).

## 🔵 Level 2: Sortierung & Wildcards (6-11)
6. Liste Kunden alphabetisch nach Nachnamen.
7. Zeige Mitarbeiter sortiert nach Gehalt (höchstes zuerst).
8. Liste alle einzigartigen Städte der Kunden auf (`DISTINCT`).
9. Produkte, die mit 'K' beginnen.
10. Kunden mit '.de' Email-Endung.
11. Produkte, die 'Pro' im Namen enthalten.

## 🟡 Level 3: Aggregation (12-17)
12. Gesamtanzahl der Kunden (`Anzahl_Kunden`).
13. Durchschnittsgehalt aller Mitarbeiter.
14. Der höchste Produktpreis im System.
15. Gesamte Artikelanzahl im Lager.
16. Anzahl der Produkte pro Kategorie.
17. Berechne den Brutto-Preis (Preis * 1.19) für alle Produkte.

## 🟠 Level 4: Joins (2 Tabellen) (18-22)
18. Zeige `BestellID` und den `Nachnamen` des Kunden.
19. Liste Produktnamen und ihre Regalnummern auf.
20. Zeige zu jeder Bestellung den Nachnamen des Mitarbeiters.
21. Zeige alle Produktnamen und ihre Sterne-Bewertungen.
22. Zeige Kunden aus 'Berlin', die bereits bestellt haben.

## 🔴 Level 5: Komplexe Joins & Logik (23-35)
23. **3-Wege-Join:** Zeige Kunden-Vorname, Bestelldatum und Produktname.
24. **4-Wege-Join:** Zeige Kunden-Nachname, BestellID, Produktname und Menge.
25. **Umsatz:** Berechne für jede `BestellID` den Gesamtwert (`Menge * Preis`).
26. **Stadt-Umsatz:** Welchen Gesamtumsatz hat jede Stadt generiert?
27. **Mitarbeiter-Umsatz:** Welcher Mitarbeiter hat insgesamt welchen Umsatz bearbeitet?
28. **Bestseller:** Welches Produkt wurde (gemessen an der Menge) am häufigsten verkauft?
29. **Interessen:** Welche Kunden (Email) haben Produkte aus der Kategorie 'Bücher' gekauft?
30. **Ladenhüter:** Welche Produkte wurden noch nie bestellt? (LEFT JOIN nutzen).
31. **Subquery:** Zeige alle Produkte, deren Preis über dem Durchschnittspreis aller Produkte liegt.
32. **Having:** Zeige nur Kategorien, die mehr als 2 Produkte enthalten.
33. **Zeit-Analyse:** Zeige alle Bestellungen, die im Oktober 2023 getätigt wurden.
34. **Inventar-Wert:** Berechne den Gesamtwert des Lagers pro Regalnummer.
35. **Profi-Check:** Liste Kunden auf, die mehr als 500€ Gesamtwert bestellt haben.