# ✅ SQL Lösungen (uebung_v2.db)

Hier findest du die SQL-Statements zu den Übungsaufgaben.

---

## 🟢 Level 1: Basics
1. `SELECT * FROM Kunden;`
2. `SELECT Vorname, Nachname FROM Mitarbeiter;`
3. `SELECT * FROM Produkte WHERE Kategorie = 'Elektronik';`
4. `SELECT * FROM Produkte WHERE Kategorie = 'Elektronik' AND Preis < 100;`
5. `SELECT * FROM Bestellungen WHERE FK_MitarbeiterID IS NULL;`

---

## 🔵 Level 2: Sortieren, Wildcards & Eindeutigkeit
6. `SELECT * FROM Kunden ORDER BY Nachname ASC;`
7. `SELECT * FROM Mitarbeiter ORDER BY Gehalt DESC;`
8. `SELECT DISTINCT Stadt FROM Kunden;`
9. `SELECT * FROM Produkte WHERE Produktname LIKE 'K%';`
10. `SELECT * FROM Kunden WHERE Email LIKE '%.de';`
11. `SELECT * FROM Produkte WHERE Produktname LIKE '%Pro%';`

---

## 🟡 Level 3: Funktionen & Gruppen
12. `SELECT COUNT(*) AS Anzahl_Kunden FROM Kunden;`
13. `SELECT AVG(Gehalt) FROM Mitarbeiter;`
14. `SELECT MAX(Preis) FROM Produkte;`
15. `SELECT SUM(Anzahl) FROM Lagerbestand;`
16. `SELECT Kategorie, COUNT(*) FROM Produkte GROUP BY Kategorie;`
17. `SELECT Produktname, Preis, Preis * 1.19 AS Brutto_Preis FROM Produkte;`

---

## 🟠 Level 4: Joins (2 Tabellen)
18. `SELECT b.BestellID, k.Nachname FROM Bestellungen b JOIN Kunden k ON b.FK_KundenID = k.KundenID;`
19. `SELECT p.Produktname, l.Regalnummer FROM Produkte p JOIN Lagerbestand l ON p.ProduktID = l.FK_ProduktID;`
20. `SELECT b.BestellID, m.Nachname FROM Bestellungen b JOIN Mitarbeiter m ON b.FK_MitarbeiterID = m.MitarbeiterID;`
21. `SELECT p.Produktname, pb.Sterne FROM Produkte p JOIN Produktbewertungen pb ON p.ProduktID = pb.FK_ProduktID;`
22. `SELECT k.Vorname, k.Nachname FROM Kunden k JOIN Bestellungen b ON k.KundenID = b.FK_KundenID WHERE k.Stadt = 'Berlin';`

---

## 🔴 Level 5: Komplexe Abfragen
23. 
```sql
SELECT k.Vorname, b.Bestelldatum, p.Produktname
FROM Kunden k
JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID;
```
24. 
```sql
SELECT k.Nachname, b.BestellID, p.Produktname, bp.Menge
FROM Kunden k
JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID;
```
25.
```sql
SELECT bp.FK_BestellID, SUM(bp.Menge * p.Preis) AS Summe
FROM Bestellpositionen bp
JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID
GROUP BY bp.FK_BestellID;
```
26.
```sql
SELECT k.Stadt, SUM(bp.Menge * p.Preis) AS Umsatz
FROM Kunden k
JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID
GROUP BY k.Stadt;
```
27.
```sql
SELECT m.Nachname, SUM(bp.Menge * p.Preis) AS Umsatz
FROM Mitarbeiter m
JOIN Bestellungen b ON m.MitarbeiterID = b.FK_MitarbeiterID
JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID
GROUP BY m.Nachname;
```
28.
```sql
SELECT p.Produktname, SUM(bp.Menge) AS Menge
FROM Produkte p
JOIN Bestellpositionen bp ON p.ProduktID = bp.FK_ProduktID
GROUP BY p.Produktname ORDER BY Menge DESC LIMIT 1;
```
29.
```sql
SELECT DISTINCT k.Email
FROM Kunden k
JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID
WHERE p.Kategorie = 'Bücher';
```
30.
```sql
SELECT p.Produktname
FROM Produkte p
LEFT JOIN Bestellpositionen bp ON p.ProduktID = bp.FK_ProduktID
WHERE bp.FK_ProduktID IS NULL;
```
31.
```sql
SELECT Produktname, Preis FROM Produkte 
WHERE Preis > (SELECT AVG(Preis) FROM Produkte);
```
32.
```sql
SELECT Kategorie, COUNT(*) FROM Produkte 
GROUP BY Kategorie HAVING COUNT(*) > 2;
```

33.
```sql
SELECT * FROM Bestellungen 
WHERE Bestelldatum LIKE '2023-10%';
```
34.
```sql
SELECT l.Regalnummer, SUM(l.Anzahl * p.Preis) AS Wert
FROM Lagerbestand l
JOIN Produkte p ON l.FK_ProduktID = p.ProduktID
GROUP BY l.Regalnummer;
```
35.
```sql
SELECT k.Vorname, k.Nachname, SUM(bp.Menge * p.Preis) AS Umsatz
FROM Kunden k
JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID
GROUP BY k.KundenID HAVING Umsatz > 500;
```




