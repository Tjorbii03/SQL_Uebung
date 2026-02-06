# ✅ SQL Lösungen (uebung_v2.db)

Hier findest du die SQL-Statements zu den Übungsaufgaben.

---

## 🟢 Level 1: Basics
1. `SELECT * FROM Kunden;`
2. `SELECT Vorname, Nachname FROM Mitarbeiter;`
3. `SELECT * FROM Produkte WHERE Kategorie = 'Elektronik';`
4. `SELECT * FROM Produkte WHERE Kategorie = 'Elektronik' AND Preis < 100;`
5. `SELECT * FROM Bestellungen WHERE FK_MitarbeiterID IS NULL;`
6. `SELECT * FROM Mitarbeiter;`
7. `SELECT DISTINCT Stadt FROM Kunden;`
8. `SELECT Produktname FROM Produkte WHERE Kategorie = 'Bücher';`
9. `SELECT * FROM Mitarbeiter WHERE Abteilung = 'Vertrieb';`
10. `SELECT * FROM Bestellungen WHERE Status = 'Versandt';`
11. `SELECT Email FROM Kunden;`
12. `SELECT * FROM Produkte WHERE Preis = 49.00;`
13. `SELECT * FROM Mitarbeiter WHERE Gehalt > 3000;`
14. `SELECT * FROM Produktbewertungen WHERE Sterne = 5;`
15. `SELECT Bestelldatum FROM Bestellungen;`

---

## 🔵 Level 2: Sortieren, Wildcards & Eindeutigkeit
1. `SELECT * FROM Kunden ORDER BY Nachname ASC;`
2. `SELECT * FROM Mitarbeiter ORDER BY Gehalt DESC;`
3. `SELECT DISTINCT Stadt FROM Kunden;`
4. `SELECT * FROM Produkte WHERE Produktname LIKE 'K%';`
5. `SELECT * FROM Kunden WHERE Email LIKE '%.de';`
6. `SELECT * FROM Produkte WHERE Produktname LIKE '%Pro%';`
7. `SELECT * FROM Kunden ORDER BY RegistriertSeit DESC;`
8. `SELECT * FROM Produkte ORDER BY Preis ASC;`
9. `SELECT * FROM Kunden WHERE Nachname LIKE '%er';`
10. `SELECT * FROM Mitarbeiter WHERE Vorname LIKE 'S%';`
11. `SELECT * FROM Produkte WHERE Produktname LIKE '%Stuhl%';`
12. `SELECT * FROM Kunden WHERE Email LIKE '%.com';`
13. `SELECT * FROM Kunden LIMIT 5;`
14. `SELECT DISTINCT Abteilung FROM Mitarbeiter;`
15. `SELECT * FROM Produkte WHERE lower(Produktname) LIKE '%buch%';`

---

## 🟡 Level 3: Funktionen & Gruppen
1. `SELECT COUNT(*) AS Anzahl_Kunden FROM Kunden;`
2. `SELECT AVG(Gehalt) FROM Mitarbeiter;`
3. `SELECT MAX(Preis) FROM Produkte;`
4. `SELECT SUM(Anzahl) FROM Lagerbestand;`
5. `SELECT Kategorie, COUNT(*) FROM Produkte GROUP BY Kategorie;`
6. `SELECT Produktname, Preis, Preis * 1.19 AS Brutto_Preis FROM Produkte;`
7. `SELECT MIN(Preis) FROM Produkte WHERE Kategorie = 'Elektronik';`
8. `SELECT COUNT(*) FROM Bestellungen;`
9. `SELECT FK_ProduktID, COUNT(*) AS Anzahl_Bewertungen FROM Produktbewertungen GROUP BY FK_ProduktID;`
10. `SELECT AVG(Gehalt) FROM Mitarbeiter WHERE Abteilung = 'Vertrieb';`
11. `SELECT SUM(Gehalt) AS Gesamtgehaelter FROM Mitarbeiter;`
12. `SELECT Stadt, COUNT(*) AS Kundenanzahl FROM Kunden GROUP BY Stadt;`
13. `SELECT MIN(Preis) AS MinPreis, MAX(Preis) AS MaxPreis FROM Produkte;`
14. `SELECT Kategorie, COUNT(*) AS Produktanzahl FROM Produkte GROUP BY Kategorie;`
15. `SELECT MIN(Bestelldatum) AS ErsteBestellung, MAX(Bestelldatum) AS LetzteBestellung FROM Bestellungen;`

---

## 🟠 Level 4: Joins (2 Tabellen)
1. `SELECT b.BestellID, k.Nachname FROM Bestellungen b JOIN Kunden k ON b.FK_KundenID = k.KundenID;`
2. `SELECT p.Produktname, l.Regalnummer FROM Produkte p JOIN Lagerbestand l ON p.ProduktID = l.FK_ProduktID;`
3. `SELECT b.BestellID, m.Nachname FROM Bestellungen b JOIN Mitarbeiter m ON b.FK_MitarbeiterID = m.MitarbeiterID;`
4. `SELECT p.Produktname, pb.Sterne FROM Produkte p JOIN Produktbewertungen pb ON p.ProduktID = pb.FK_ProduktID;`
5. `SELECT k.Vorname, k.Nachname FROM Kunden k JOIN Bestellungen b ON k.KundenID = b.FK_KundenID WHERE k.Stadt = 'Berlin';`
6. `SELECT b.BestellID, k.Vorname, b.Status FROM Bestellungen b JOIN Kunden k ON b.FK_KundenID = k.KundenID;`
7. `SELECT p.Produktname FROM Produkte p JOIN Lagerbestand l ON p.ProduktID = l.FK_ProduktID WHERE l.Anzahl = 0;`
8. `SELECT p.Produktname, pb.Kommentar FROM Produkte p JOIN Produktbewertungen pb ON p.ProduktID = pb.FK_ProduktID;`
9. `SELECT DISTINCT m.Nachname FROM Mitarbeiter m JOIN Bestellungen b ON m.MitarbeiterID = b.FK_MitarbeiterID JOIN Kunden k ON b.FK_KundenID = k.KundenID WHERE k.Stadt = 'Hamburg';`
10. `SELECT DISTINCT bp.FK_BestellID FROM Bestellpositionen bp JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID WHERE p.Kategorie = 'Möbel';`
11. `SELECT k.Vorname, b.Bestelldatum FROM Kunden k JOIN Bestellungen b ON k.KundenID = b.FK_KundenID WHERE b.Status = 'Storniert';`
12. `SELECT m.Nachname FROM Mitarbeiter m JOIN Bestellungen b ON m.MitarbeiterID = b.FK_MitarbeiterID WHERE b.BestellID = 3;`
13. `SELECT p.Produktname FROM Produkte p JOIN Produktbewertungen pb ON p.ProduktID = pb.FK_ProduktID WHERE pb.Sterne = 5;`
14. `SELECT k.Email FROM Kunden k JOIN Bestellungen b ON k.KundenID = b.FK_KundenID JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID WHERE p.Produktname = 'Laptop Pro';`
15. `SELECT p.Produktname FROM Produkte p JOIN Lagerbestand l ON p.ProduktID = l.FK_ProduktID WHERE l.Regalnummer = 'A1';`

---

## 🔴 Level 5: Komplexe Abfragen
1. 
```sql
SELECT k.Vorname, b.Bestelldatum, p.Produktname
FROM Kunden k
JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID;
```
2. 
```sql
SELECT k.Nachname, b.BestellID, p.Produktname, bp.Menge
FROM Kunden k
JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID;
```
3.
```sql
SELECT bp.FK_BestellID, SUM(bp.Menge * p.Preis) AS Summe
FROM Bestellpositionen bp
JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID
GROUP BY bp.FK_BestellID;
```
4.
```sql
SELECT k.Stadt, SUM(bp.Menge * p.Preis) AS Umsatz
FROM Kunden k
JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID
GROUP BY k.Stadt;
```
5.
```sql
SELECT m.Nachname, SUM(bp.Menge * p.Preis) AS Umsatz
FROM Mitarbeiter m
JOIN Bestellungen b ON m.MitarbeiterID = b.FK_MitarbeiterID
JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID
GROUP BY m.Nachname;
```
6.
```sql
SELECT p.Produktname, SUM(bp.Menge) AS Menge
FROM Produkte p
JOIN Bestellpositionen bp ON p.ProduktID = bp.FK_ProduktID
GROUP BY p.Produktname ORDER BY Menge DESC LIMIT 1;
```
7.
```sql
SELECT DISTINCT k.Email
FROM Kunden k
JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID
WHERE p.Kategorie = 'Bücher';
```
8.
```sql
SELECT p.Produktname
FROM Produkte p
LEFT JOIN Bestellpositionen bp ON p.ProduktID = bp.FK_ProduktID
WHERE bp.FK_ProduktID IS NULL;
```
9.
```sql
SELECT Produktname, Preis FROM Produkte 
WHERE Preis > (SELECT AVG(Preis) FROM Produkte);
```
10.
```sql
SELECT Kategorie, COUNT(*) FROM Produkte 
GROUP BY Kategorie HAVING COUNT(*) > 2;
```
11.
```sql
SELECT * FROM Bestellungen 
WHERE Bestelldatum LIKE '2023-10%';
```
12.
```sql
SELECT l.Regalnummer, SUM(l.Anzahl * p.Preis) AS Wert
FROM Lagerbestand l
JOIN Produkte p ON l.FK_ProduktID = p.ProduktID
GROUP BY l.Regalnummer;
```
13.
```sql
SELECT k.Vorname, k.Nachname, SUM(bp.Menge * p.Preis) AS Umsatz
FROM Kunden k
JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID
GROUP BY k.KundenID HAVING Umsatz > 500;
```
14.
```sql
SELECT Produktname, Preis,
       CASE
           WHEN Preis < 100 THEN 'Günstig'
           WHEN Preis >= 100 AND Preis <= 500 THEN 'Mittel'
           ELSE 'Teuer'
       END AS Preiskategorie
FROM Produkte;
```
15.
```sql
SELECT A.Vorname, A.Nachname, B.Vorname, B.Nachname, A.Abteilung
FROM Mitarbeiter A
JOIN Mitarbeiter B ON A.Abteilung = B.Abteilung AND A.MitarbeiterID <> B.MitarbeiterID;
```