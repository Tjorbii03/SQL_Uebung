# 📚 SQL Übungskatalog - Lösungen v3.0

---

## 🟢 Level 1: SELECT / FROM / WHERE - Basis (15 Lösungen)

### 1. Alle Kunden anzeigen

```sql
SELECT * FROM Kunden;
```

### 2. Mitarbeiter-Namen

```sql
SELECT Vorname, Nachname FROM Mitarbeiter;
```

### 3. Elektronik-Produkte

```sql
SELECT * FROM Produkte WHERE Kategorie = 'Elektronik';
```

### 4. Günstige Elektronik

```sql
SELECT * FROM Produkte WHERE Kategorie = 'Elektronik' AND Preis < 100;
```

### 5. Bestellungen ohne Mitarbeiter

```sql
SELECT * FROM Bestellungen WHERE FK_MitarbeiterID IS NULL;
```

### 6. Alle Mitarbeiter

```sql
SELECT * FROM Mitarbeiter;
```

### 7. Städte der Kunden

```sql
SELECT DISTINCT Stadt FROM Kunden;
```

### 8. Bücher im Sortiment

```sql
SELECT Produktname FROM Produkte WHERE Kategorie = 'Bücher';
```

### 9. Vertriebsmitarbeiter

```sql
SELECT * FROM Mitarbeiter WHERE Abteilung = 'Vertrieb';
```

### 10. Versandte Bestellungen

```sql
SELECT * FROM Bestellungen WHERE Status = 'Versandt';
```

### 11. Kontaktdaten

```sql
SELECT Email FROM Kunden;
```

### 12. Produkte mit genauem Preis

```sql
SELECT * FROM Produkte WHERE Preis = 49.00;
```

### 13. Gut verdienende Mitarbeiter

```sql
SELECT * FROM Mitarbeiter WHERE Gehalt > 3000;
```

### 14. Fünf-Stern-Bewertungen

```sql
SELECT * FROM Produktbewertungen WHERE Sterne = 5;
```

### 15. Alle Bestelldaten

```sql
SELECT * FROM Bestellungen;
```

---

## 🔵 Level 2: Sortieren & Wildcards (15 Lösungen)

### 1. Kunden nach Nachnamen sortieren

```sql
SELECT * FROM Kunden ORDER BY Nachname ASC;
```

### 2. Mitarbeiter nach Gehalt sortieren

```sql
SELECT * FROM Mitarbeiter ORDER BY Gehalt DESC;
```

### 3. Einzigartige Kundenstadt

```sql
SELECT DISTINCT Stadt FROM Kunden;
```

### 4. Produkte mit K am Anfang

```sql
SELECT * FROM Produkte WHERE Produktname LIKE 'K%';
```

### 5. Deutsche E-Mail-Adressen

```sql
SELECT * FROM Kunden WHERE Email LIKE '%.de';
```

### 6. Produkte mit 'Pro' im Namen

```sql
SELECT * FROM Produkte WHERE Produktname LIKE '%Pro%';
```

### 7. Neue Kunden zuerst

```sql
SELECT * FROM Kunden ORDER BY RegistriertSeit DESC;
```

### 8. Produkte nach Preis

```sql
SELECT * FROM Produkte ORDER BY Preis ASC;
```

### 9. Namen die auf 'er' enden

```sql
SELECT * FROM Kunden WHERE Nachname LIKE '%er';
```

### 10. Mitarbeiter mit 'S'

```sql
SELECT * FROM Mitarbeiter WHERE Vorname LIKE 'S%';
```

### 11. Stühle im Sortiment

```sql
SELECT * FROM Produkte WHERE Produktname LIKE '%Stuhl%';
```

### 12. Internationale E-Mails

```sql
SELECT * FROM Kunden WHERE Email LIKE '%.com';
```

### 13. Erste 5 Kunden

```sql
SELECT * FROM Kunden LIMIT 5;
```

### 14. Abteilungen

```sql
SELECT DISTINCT Abteilung FROM Mitarbeiter;
```

### 15. Bücher finden (case-insensitive)

```sql
SELECT * FROM Produkte WHERE Produktname LIKE '%buch%' OR Produktname LIKE '%Buch%';
```

---

## 🟡 Level 3: Selektion & Verknüpfung (10 Lösungen)

### 1. Mehrere WHERE-Bedingungen

```sql
SELECT * FROM Kunden WHERE Stadt = 'Berlin' OR Stadt = 'Hamburg';
```

### 2. AND & OR kombinieren

```sql
SELECT * FROM Produkte
WHERE (Kategorie = 'Elektronik' AND Preis < 100)
   OR (Kategorie = 'Möbel' AND Preis > 300);
```

### 3. BETWEEN nutzen

```sql
SELECT * FROM Produkte WHERE Preis BETWEEN 50 AND 200;
```

### 4. IN-Operator

```sql
SELECT * FROM Mitarbeiter WHERE Abteilung IN ('Vertrieb', 'IT', 'Marketing');
```

### 5. Bestellungen mit zwei Bedingungen

```sql
SELECT * FROM Bestellungen
WHERE Status IN ('Versandt', 'In Bearbeitung')
ORDER BY Bestelldatum ASC;
```

### 6. LIMIT kombinieren

```sql
SELECT * FROM Produkte ORDER BY Preis DESC LIMIT 10;
```

### 7. Mehrere Filterbedingungen

```sql
SELECT * FROM Kunden
WHERE Stadt = 'Berlin' AND YEAR(RegistriertSeit) = 2023;
```

### 8. Null-Prüfung

```sql
SELECT * FROM Bestellungen WHERE FK_MitarbeiterID IS NOT NULL;
```

### 9. Sortierung mit LIMIT

```sql
SELECT * FROM Kunden ORDER BY RegistriertSeit ASC LIMIT 5;
```

### 10. Komplexe Bedingung

```sql
SELECT * FROM Bestellungen
WHERE (Status = 'Versandt' OR Status = 'In Bearbeitung')
AND FK_KundenID IN (SELECT KundenID FROM Kunden WHERE Stadt = 'Berlin');
```

---

## 🔴 Level 4: Aggregatsfunktionen (15 Lösungen)

### 1. Gesamte Kundenanzahl

```sql
SELECT COUNT(*) AS 'Anzahl Kunden' FROM Kunden;
```

### 2. Durchschnittsgehalt

```sql
SELECT AVG(Gehalt) AS 'Durchschnitt Gehalt' FROM Mitarbeiter;
```

### 3. Höchster Produktpreis

```sql
SELECT MAX(Preis) AS 'Höchster Preis' FROM Produkte;
```

### 4. Gesamte Lageranzahl

```sql
SELECT SUM(Anzahl) AS 'Gesamte Menge' FROM Lagerbestand;
```

### 5. Produkte pro Kategorie zählen

```sql
SELECT Kategorie, COUNT(*) AS 'Anzahl Produkte'
FROM Produkte
GROUP BY Kategorie;
```

### 6. Summe aller Gehälter

```sql
SELECT SUM(Gehalt) AS 'Gesamtgehalt' FROM Mitarbeiter;
```

### 7. Günstigstes Elektronik-Produkt

```sql
SELECT MIN(Preis) AS 'Günstigster Preis'
FROM Produkte
WHERE Kategorie = 'Elektronik';
```

### 8. Gesamtanzahl Bestellungen

```sql
SELECT COUNT(*) AS 'Gesamte Bestellungen' FROM Bestellungen;
```

### 9. Kunden pro Stadt

```sql
SELECT Stadt, COUNT(*) AS 'Anzahl Kunden'
FROM Kunden
GROUP BY Stadt;
```

### 10. Durchschnittsgehalt Vertrieb

```sql
SELECT AVG(Gehalt) AS 'Durchschnitt Gehalt'
FROM Mitarbeiter
WHERE Abteilung = 'Vertrieb';
```

### 11. Teuerste und günstigste Produkt

```sql
SELECT MAX(Preis) AS 'Teuerster Preis', MIN(Preis) AS 'Günstigster Preis'
FROM Produkte;
```

### 12. Bewertungen pro Produkt

```sql
SELECT FK_ProduktID, COUNT(*) AS 'Anzahl Bewertungen'
FROM Produktbewertungen
GROUP BY FK_ProduktID;
```

### 13. Lagerbestand nach Regalnummer

```sql
SELECT Regalnummer, SUM(Anzahl) AS 'Gesamtbestand'
FROM Lagerbestand
GROUP BY Regalnummer;
```

### 14. Durchschnittliche Produktpreise pro Kategorie

```sql
SELECT Kategorie, AVG(Preis) AS 'Durchschnitt Preis'
FROM Produkte
GROUP BY Kategorie;
```

### 15. Erste und letzte Bestellung

```sql
SELECT MIN(Bestelldatum) AS 'Erste Bestellung', MAX(Bestelldatum) AS 'Letzte Bestellung'
FROM Bestellungen;
```

---

## 🟠 Level 5: JOINS mit 2 Tabellen (15 Lösungen)

### 1. Einfacher INNER JOIN - Bestellung + Kunde

```sql
SELECT b.BestellID, k.Nachname
FROM Bestellungen b
INNER JOIN Kunden k ON b.FK_KundenID = k.KundenID;
```

### 2. INNER JOIN - Produkt + Lagerbestand

```sql
SELECT p.Produktname, l.Regalnummer
FROM Produkte p
INNER JOIN Lagerbestand l ON p.ProduktID = l.FK_ProduktID;
```

### 3. INNER JOIN mit WHERE

```sql
SELECT b.BestellID, m.Nachname
FROM Bestellungen b
INNER JOIN Mitarbeiter m ON b.FK_MitarbeiterID = m.MitarbeiterID;
```

### 4. INNER JOIN - Produkt + Bewertung

```sql
SELECT p.Produktname, pb.Sterne
FROM Produkte p
INNER JOIN Produktbewertungen pb ON p.ProduktID = pb.FK_ProduktID;
```

### 5. INNER JOIN mit Filter

```sql
SELECT k.Vorname, k.Nachname, b.BestellID
FROM Kunden k
INNER JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
WHERE k.Stadt = 'Berlin';
```

### 6. JOIN und Sortieren

```sql
SELECT b.BestellID, k.Vorname, b.Bestelldatum
FROM Bestellungen b
INNER JOIN Kunden k ON b.FK_KundenID = k.KundenID
ORDER BY b.Bestelldatum ASC;
```

### 7. JOIN mit Null-Werten

```sql
SELECT p.Produktname, l.Anzahl
FROM Produkte p
INNER JOIN Lagerbestand l ON p.ProduktID = l.FK_ProduktID
WHERE l.Anzahl > 0;
```

### 8. JOIN + Aggregation einfach

```sql
SELECT p.Produktname, COUNT(pb.BewertungsID) AS 'Anzahl Bewertungen'
FROM Produkte p
INNER JOIN Produktbewertungen pb ON p.ProduktID = pb.FK_ProduktID
GROUP BY p.Produktname;
```

### 9. JOIN von 3 Tabellen (einfach)

```sql
SELECT k.Vorname, k.Nachname, b.BestellID, p.Produktname
FROM Kunden k
INNER JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
INNER JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
INNER JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID;
```

### 10. JOIN mit Bedingung

```sql
SELECT b.BestellID, b.Bestelldatum, m.Vorname, m.Nachname
FROM Bestellungen b
INNER JOIN Mitarbeiter m ON b.FK_MitarbeiterID = m.MitarbeiterID
WHERE m.Abteilung = 'Vertrieb';
```

### 11. LEFT JOIN - Kunden ohne Bestellungen

```sql
SELECT k.Vorname, k.Nachname, b.BestellID
FROM Kunden k
LEFT JOIN Bestellungen b ON k.KundenID = b.FK_KundenID;
```

### 12. LEFT JOIN - Produkte ohne Lager

```sql
SELECT p.Produktname, l.Anzahl
FROM Produkte p
LEFT JOIN Lagerbestand l ON p.ProduktID = l.FK_ProduktID;
```

### 13. LEFT JOIN - Produkte ohne Bewertungen

```sql
SELECT p.Produktname, pb.Sterne
FROM Produkte p
LEFT JOIN Produktbewertungen pb ON p.ProduktID = pb.FK_ProduktID;
```

### 14. JOIN mit Daten-Ausgabe

```sql
SELECT k.Vorname, k.Nachname, b.Bestelldatum, b.Status
FROM Kunden k
INNER JOIN Bestellungen b ON k.KundenID = b.FK_KundenID;
```

### 15. JOIN und ORDER BY

```sql
SELECT k.Vorname, k.Nachname, b.BestellID, b.Bestelldatum
FROM Kunden k
INNER JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
ORDER BY k.Nachname ASC, b.Bestelldatum ASC;
```

---

## 🟠 Level 6: DISTINCT - Einzigartige Werte (10 Lösungen)

### 1. Unterschiedliche Kategorien

```sql
SELECT DISTINCT Kategorie FROM Produkte;
```

### 2. Mitarbeiter-Abteilungen

```sql
SELECT DISTINCT Abteilung FROM Mitarbeiter;
```

### 3. Bestellstati

```sql
SELECT DISTINCT Status FROM Bestellungen;
```

### 4. Kategorien bestellt

```sql
SELECT DISTINCT p.Kategorie
FROM Produkte p
INNER JOIN Bestellpositionen bp ON p.ProduktID = bp.FK_ProduktID;
```

### 5. Lager-Regale

```sql
SELECT DISTINCT Regalnummer FROM Lagerbestand;
```

### 6. Kundenstädte mit Bestellungen

```sql
SELECT DISTINCT k.Stadt
FROM Kunden k
INNER JOIN Bestellungen b ON k.KundenID = b.FK_KundenID;
```

### 7. Mitarbeiter mit Bestellungen

```sql
SELECT DISTINCT m.Vorname, m.Nachname
FROM Mitarbeiter m
INNER JOIN Bestellungen b ON m.MitarbeiterID = b.FK_MitarbeiterID;
```

### 8. Bewertungs-Sterne

```sql
SELECT DISTINCT Sterne FROM Produktbewertungen ORDER BY Sterne ASC;
```

### 9. Produktkategorien im Lager

```sql
SELECT DISTINCT p.Kategorie
FROM Produkte p
INNER JOIN Lagerbestand l ON p.ProduktID = l.FK_ProduktID;
```

### 10. Kombinierte DISTINCT

```sql
SELECT DISTINCT k.Stadt, p.Kategorie
FROM Kunden k
INNER JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
INNER JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
INNER JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID;
```

---

## 🔴 Level 7: ALIASES - Spaltennamen umbenennen (12 Lösungen)

### 1. Kundenname mit Alias

```sql
SELECT Vorname AS 'Erster Name', Nachname AS 'Familienname' FROM Kunden;
```

### 2. Produkt-Alias

```sql
SELECT Produktname AS Artikel, Preis AS Einzelpreis, Kategorie AS Warengruppe FROM Produkte;
```

### 3. Mitarbeiter-Alias

```sql
SELECT Vorname AS Mitarbeiter, Abteilung AS Bereich, Gehalt AS Monatssalär FROM Mitarbeiter;
```

### 4. Lagerbestand-Alias

```sql
SELECT Anzahl AS 'Im Lager', Regalnummer AS 'Regal-Nr' FROM Lagerbestand;
```

### 5. Bestellung-Alias

```sql
SELECT BestellID AS 'Bestell-Nr', Bestelldatum AS 'Datum', Status AS 'Zustand' FROM Bestellungen;
```

### 6. Alias mit Berechnung

```sql
SELECT Preis, Preis * 1.19 AS 'Brutto-Preis' FROM Produkte;
```

### 7. Alias in Aggregation

```sql
SELECT COUNT(*) AS 'Anzahl Kunden', AVG((SELECT Gehalt FROM Mitarbeiter)) AS 'Durchschn. Gehalt' FROM Kunden;
```

### 8. Alias in Bedingung

```sql
SELECT Kategorie, COUNT(*) AS 'Produkt-Anzahl'
FROM Produkte
GROUP BY Kategorie
HAVING COUNT(*) > 2;
```

### 9. JOIN mit TABLE-Alias

```sql
SELECT k.Vorname, b.BestellID
FROM Kunden AS k
JOIN Bestellungen AS b ON k.KundenID = b.FK_KundenID;
```

### 10. Kombinierte Aliases

```sql
SELECT k.Vorname AS 'Kundenname', k.Stadt AS 'Ort'
FROM Kunden k
INNER JOIN Bestellungen b ON k.KundenID = b.FK_KundenID;
```

### 11. Alias für Kategorien-Zählung

```sql
SELECT Kategorie AS 'Produktkategorie', COUNT(*) AS 'Anzahl Produkte'
FROM Produkte
GROUP BY Kategorie;
```

### 12. Komplexe Aliases mit JOIN

```sql
SELECT p.Produktname AS Produkt, l.Anzahl AS 'Lagerbestand', l.Regalnummer AS 'Standort'
FROM Produkte p
INNER JOIN Lagerbestand l ON p.ProduktID = l.FK_ProduktID;
```

---

## 🔴 Level 8: Verbundtabellen mit 2+ JOINs (15 Lösungen)

### 1. 3-Wege-JOIN (Basis)

```sql
SELECT k.Vorname, k.Nachname, b.Bestelldatum, m.Vorname AS 'Mitarbeiter Vorname', m.Nachname AS 'Mitarbeiter Nachname'
FROM Kunden k
INNER JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
INNER JOIN Mitarbeiter m ON b.FK_MitarbeiterID = m.MitarbeiterID;
```

### 2. 3-Wege-JOIN mit WHERE

```sql
SELECT k.Vorname, k.Nachname, b.BestellID, m.Nachname
FROM Kunden k
INNER JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
INNER JOIN Mitarbeiter m ON b.FK_MitarbeiterID = m.MitarbeiterID
WHERE b.Status = 'Versandt';
```

### 3. 4-Wege-JOIN (Basis)

```sql
SELECT k.Vorname, k.Nachname, b.BestellID, p.Produktname, bp.Menge
FROM Kunden k
INNER JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
INNER JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
INNER JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID;
```

### 4. 3-Tabellen mit Sortierung

```sql
SELECT k.Vorname, k.Nachname, b.BestellID, m.Vorname AS 'Mitarbeiter'
FROM Kunden k
INNER JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
INNER JOIN Mitarbeiter m ON b.FK_MitarbeiterID = m.MitarbeiterID
ORDER BY k.Nachname ASC;
```

### 5. JOIN mit DISTINCT

```sql
SELECT DISTINCT p.Produktname
FROM Kunden k
INNER JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
INNER JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
INNER JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID
WHERE k.Stadt = 'Berlin';
```

### 6. LEFT JOIN in Mehrfach-JOIN

```sql
SELECT k.Vorname, k.Nachname, b.BestellID, m.Vorname AS 'Mitarbeiter'
FROM Kunden k
LEFT JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
LEFT JOIN Mitarbeiter m ON b.FK_MitarbeiterID = m.MitarbeiterID;
```

### 7. JOIN + WHERE + ORDER BY

```sql
SELECT bp.BestellpositionsID, p.Produktname, bp.Menge, p.Preis
FROM Bestellpositionen bp
INNER JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID
WHERE p.Kategorie = 'Elektronik'
ORDER BY p.Preis DESC;
```

### 8. 3-Wege-JOIN mit Berechnung

```sql
SELECT p.Produktname, bp.Menge, p.Preis, (bp.Menge * p.Preis) AS 'Gesamtwert'
FROM Bestellpositionen bp
INNER JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID;
```

### 9. JOIN Kunde + Bestellung + Bestellposition + Produkt

```sql
SELECT k.Vorname, k.Nachname, b.BestellID, b.Bestelldatum, p.Produktname, bp.Menge
FROM Kunden k
INNER JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
INNER JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
INNER JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID;
```

### 10. JOIN mit Alias und mehreren Tabellen

```sql
SELECT k.Vorname AS 'Kunde', b.Bestelldatum, m.Vorname AS 'Mitarbeiter', p.Produktname
FROM Kunden k
INNER JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
INNER JOIN Mitarbeiter m ON b.FK_MitarbeiterID = m.MitarbeiterID
INNER JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
INNER JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID;
```

### 11. LEFT JOIN + INNER JOIN kombiniert

```sql
SELECT k.Vorname, k.Nachname, b.BestellID, p.Produktname
FROM Kunden k
LEFT JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
INNER JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
INNER JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID;
```

### 12. 3-Wege-JOIN mit Abteilung

```sql
SELECT b.BestellID, k.Vorname, k.Nachname, m.Vorname AS 'Mitarbeiter', m.Abteilung
FROM Bestellungen b
INNER JOIN Kunden k ON b.FK_KundenID = k.KundenID
INNER JOIN Mitarbeiter m ON b.FK_MitarbeiterID = m.MitarbeiterID;
```

### 13. GROUP BY mit mehreren JOINs

```sql
SELECT p.Kategorie, COUNT(bp.BestellpositionsID) AS 'Anzahl verkauft'
FROM Produkte p
INNER JOIN Bestellpositionen bp ON p.ProduktID = bp.FK_ProduktID
GROUP BY p.Kategorie;
```

### 14. Komplexer JOIN mit mehreren Filter

```sql
SELECT b.BestellID, k.Vorname, m.Vorname AS 'Mitarbeiter', p.Produktname
FROM Bestellungen b
INNER JOIN Kunden k ON b.FK_KundenID = k.KundenID
INNER JOIN Mitarbeiter m ON b.FK_MitarbeiterID = m.MitarbeiterID
INNER JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
INNER JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID
WHERE k.Stadt = 'Berlin'
  AND m.Abteilung = 'Vertrieb'
  AND p.Preis > 100;
```

### 15. JOIN mit Bewertungen

```sql
SELECT b.BestellID, k.Vorname, k.Nachname, p.Produktname, pb.Sterne
FROM Bestellungen b
INNER JOIN Kunden k ON b.FK_KundenID = k.KundenID
INNER JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
INNER JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID
LEFT JOIN Produktbewertungen pb ON p.ProduktID = pb.FK_ProduktID;
```

---

## 🔴 Level 9: Komplexe Abfragen mit JOINS & Aggregation (15 Lösungen)

### 1. Umsatz pro Bestellung

```sql
SELECT b.BestellID, SUM(bp.Menge * p.Preis) AS 'Gesamtumsatz'
FROM Bestellungen b
INNER JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
INNER JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID
GROUP BY b.BestellID;
```

### 2. Umsatz pro Kunde

```sql
SELECT k.Vorname, k.Nachname, SUM(bp.Menge * p.Preis) AS 'Gesamtumsatz'
FROM Kunden k
INNER JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
INNER JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
INNER JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID
GROUP BY k.KundenID, k.Vorname, k.Nachname
ORDER BY 'Gesamtumsatz' DESC;
```

### 3. Produkte pro Kategorie mit Summe

```sql
SELECT p.Kategorie, COUNT(DISTINCT p.ProduktID) AS 'Anzahl Produkte', SUM(l.Anzahl) AS 'Gesamtlagerbestand'
FROM Produkte p
LEFT JOIN Lagerbestand l ON p.ProduktID = l.FK_ProduktID
GROUP BY p.Kategorie;
```

### 4. Durchschnittliche Bestellmenge

```sql
SELECT AVG(bp.Menge) AS 'Durchschn. Menge'
FROM Bestellpositionen bp;
```

### 5. Teuerste Bestellung berechnen

```sql
SELECT b.BestellID, SUM(bp.Menge * p.Preis) AS 'Gesamtwert'
FROM Bestellungen b
INNER JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
INNER JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID
GROUP BY b.BestellID
ORDER BY 'Gesamtwert' DESC
LIMIT 1;
```

### 6. Produkte nach Verkaufsmenge

```sql
SELECT p.Produktname, COUNT(bp.BestellpositionsID) AS 'Verkauft X-Mal'
FROM Produkte p
INNER JOIN Bestellpositionen bp ON p.ProduktID = bp.FK_ProduktID
GROUP BY p.ProduktID, p.Produktname
ORDER BY 'Verkauft X-Mal' DESC;
```

### 7. Kategorien-Umsatz

```sql
SELECT p.Kategorie, SUM(bp.Menge * p.Preis) AS 'Gesamtumsatz'
FROM Produkte p
INNER JOIN Bestellpositionen bp ON p.ProduktID = bp.FK_ProduktID
GROUP BY p.Kategorie
ORDER BY 'Gesamtumsatz' DESC
LIMIT 1;
```

### 8. Mit HAVING-Klausel

```sql
SELECT k.Vorname, k.Nachname, SUM(bp.Menge * p.Preis) AS 'Gesamtumsatz'
FROM Kunden k
INNER JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
INNER JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
INNER JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID
GROUP BY k.KundenID, k.Vorname, k.Nachname
HAVING SUM(bp.Menge * p.Preis) > 500;
```

### 9. Mit HAVING-Klausel (Produkte)

```sql
SELECT p.Produktname, COUNT(bp.BestellpositionsID) AS 'Verkauft X-Mal'
FROM Produkte p
INNER JOIN Bestellpositionen bp ON p.ProduktID = bp.FK_ProduktID
GROUP BY p.ProduktID, p.Produktname
HAVING COUNT(bp.BestellpositionsID) > 2;
```

### 10. Häufige Mitarbeiter

```sql
SELECT m.Vorname, m.Nachname, COUNT(b.BestellID) AS 'Bestellungen bearbeitet'
FROM Mitarbeiter m
INNER JOIN Bestellungen b ON m.MitarbeiterID = b.FK_MitarbeiterID
GROUP BY m.MitarbeiterID, m.Vorname, m.Nachname
HAVING COUNT(b.BestellID) > 1;
```

### 11. Bestseller pro Kategorie

```sql
SELECT p.Kategorie, p.Produktname, SUM(bp.Menge) AS 'Gesamtmenge verkauft'
FROM Produkte p
INNER JOIN Bestellpositionen bp ON p.ProduktID = bp.FK_ProduktID
GROUP BY p.Kategorie, p.ProduktID, p.Produktname
ORDER BY p.Kategorie, 'Gesamtmenge verkauft' DESC;
```

### 12. Lagerwert nach Kategorie

```sql
SELECT p.Kategorie, SUM(l.Anzahl * p.Preis) AS 'Lagerwert'
FROM Produkte p
INNER JOIN Lagerbestand l ON p.ProduktID = l.FK_ProduktID
GROUP BY p.Kategorie;
```

### 13. Mitarbeiter-Performance

```sql
SELECT m.Vorname, m.Nachname, COUNT(b.BestellID) AS 'Anzahl Bestellungen', SUM(bp.Menge * p.Preis) AS 'Gesamtumsatz'
FROM Mitarbeiter m
LEFT JOIN Bestellungen b ON m.MitarbeiterID = b.FK_MitarbeiterID
LEFT JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
LEFT JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID
GROUP BY m.MitarbeiterID, m.Vorname, m.Nachname;
```

### 14. Bestellstati-Umsatz

```sql
SELECT b.Status, SUM(bp.Menge * p.Preis) AS 'Gesamtumsatz'
FROM Bestellungen b
INNER JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
INNER JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID
GROUP BY b.Status;
```

### 15. Durchschnittliche Bewertung pro Produkt

```sql
SELECT p.Produktname, COUNT(pb.BewertungsID) AS 'Anzahl Bewertungen', AVG(pb.Sterne) AS 'Durchschn. Sterne'
FROM Produkte p
LEFT JOIN Produktbewertungen pb ON p.ProduktID = pb.FK_ProduktID
GROUP BY p.ProduktID, p.Produktname;
```

---

## 🔥 Level 10: PROFI-LEVEL (12 Lösungen)

### 1. Umsatz pro Stadt

```sql
SELECT k.Stadt, SUM(bp.Menge * p.Preis) AS 'Gesamtumsatz'
FROM Kunden k
INNER JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
INNER JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
INNER JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID
GROUP BY k.Stadt
ORDER BY 'Gesamtumsatz' DESC;
```

### 2. Top 3 Kunden nach Umsatz

```sql
SELECT k.Vorname, k.Nachname, SUM(bp.Menge * p.Preis) AS 'Gesamtumsatz'
FROM Kunden k
INNER JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
INNER JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
INNER JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID
GROUP BY k.KundenID, k.Vorname, k.Nachname
ORDER BY 'Gesamtumsatz' DESC
LIMIT 3;
```

### 3. Lagerverkehrte Produkte

```sql
SELECT p.Produktname
FROM Produkte p
LEFT JOIN Bestellpositionen bp ON p.ProduktID = bp.FK_ProduktID
WHERE bp.BestellpositionsID IS NULL;
```

### 4. Produktanalyse komplett

```sql
SELECT p.Produktname, p.Preis, l.Anzahl, COUNT(pb.BewertungsID) AS 'Anzahl Bewertungen', AVG(pb.Sterne) AS 'Durchschn. Sterne'
FROM Produkte p
LEFT JOIN Lagerbestand l ON p.ProduktID = l.FK_ProduktID
LEFT JOIN Produktbewertungen pb ON p.ProduktID = pb.FK_ProduktID
GROUP BY p.ProduktID, p.Produktname, p.Preis, l.Anzahl;
```

### 5. Kundenliste mit Details

```sql
SELECT k.Vorname, k.Nachname, k.Stadt, COUNT(b.BestellID) AS 'Anzahl Bestellungen', COALESCE(SUM(bp.Menge * p.Preis), 0) AS 'Gesamtumsatz'
FROM Kunden k
LEFT JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
LEFT JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
LEFT JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID
GROUP BY k.KundenID, k.Vorname, k.Nachname, k.Stadt
ORDER BY 'Gesamtumsatz' DESC;
```

### 6. Kategorie-Performance

```sql
SELECT p.Kategorie, COUNT(DISTINCT p.ProduktID) AS 'Anzahl Produkte', AVG(p.Preis) AS 'Durchschn. Preis', SUM(bp.Menge * p.Preis) AS 'Gesamtumsatz',
       (SELECT p2.Produktname FROM Produkte p2 INNER JOIN Bestellpositionen bp2 ON p2.ProduktID = bp2.FK_ProduktID WHERE p2.Kategorie = p.Kategorie GROUP BY p2.ProduktID ORDER BY SUM(bp2.Menge) DESC LIMIT 1) AS 'Bestseller'
FROM Produkte p
LEFT JOIN Bestellpositionen bp ON p.ProduktID = bp.FK_ProduktID
GROUP BY p.Kategorie;
```

### 7. Stornierungsanalyse

```sql
SELECT k.Vorname, k.Nachname, k.Email, COUNT(b.BestellID) AS 'Stornierungen'
FROM Kunden k
INNER JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
WHERE b.Status = 'Storniert'
GROUP BY k.KundenID, k.Vorname, k.Nachname, k.Email;
```

### 8. Lagerwert nach Regal

```sql
SELECT l.Regalnummer, COUNT(DISTINCT l.FK_ProduktID) AS 'Anzahl Produkte', AVG(p.Preis) AS 'Durchschn. Wert', SUM(l.Anzahl * p.Preis) AS 'Gesamtwert'
FROM Lagerbestand l
INNER JOIN Produkte p ON l.FK_ProduktID = p.ProduktID
GROUP BY l.Regalnummer;
```

### 9. Mitarbeiter-Performance detailliert

```sql
SELECT m.Vorname, m.Nachname, m.Abteilung, COUNT(DISTINCT b.BestellID) AS 'Anzahl Bestellungen', SUM(bp.Menge * p.Preis) AS 'Gesamtumsatz',
       AVG(bp.Menge * p.Preis) AS 'Durchschn. pro Bestellung'
FROM Mitarbeiter m
LEFT JOIN Bestellungen b ON m.MitarbeiterID = b.FK_MitarbeiterID
LEFT JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
LEFT JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID
GROUP BY m.MitarbeiterID, m.Vorname, m.Nachname, m.Abteilung;
```

### 10. Zeitliche Trends

```sql
SELECT STRFTIME('%Y-%m', b.Bestelldatum) AS 'Monat', COUNT(b.BestellID) AS 'Anzahl Bestellungen', SUM(bp.Menge * p.Preis) AS 'Gesamtumsatz'
FROM Bestellungen b
INNER JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
INNER JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID
GROUP BY STRFTIME('%Y-%m', b.Bestelldatum)
ORDER BY 'Monat' DESC;
```

### 11. Subquery

```sql
SELECT p.Produktname, p.Preis
FROM Produkte p
WHERE p.Preis > (SELECT AVG(p2.Preis) FROM Produkte p2 WHERE p2.Kategorie = p.Kategorie);
```

### 12. Komplexer Business-Report

```sql
SELECT
  (SELECT COUNT(*) FROM Kunden) AS 'Gesamtkunden',
  (SELECT COUNT(*) FROM Bestellungen) AS 'Gesamtbestellungen',
  (SELECT AVG(bp.Menge * p.Preis) FROM Bestellpositionen bp INNER JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID) AS 'Durchschn. Umsatz',
  (SELECT p.Kategorie FROM Produkte p INNER JOIN Bestellpositionen bp ON p.ProduktID = bp.FK_ProduktID GROUP BY p.Kategorie ORDER BY SUM(bp.Menge * p.Preis) DESC LIMIT 1) AS 'Top Kategorie',
  (SELECT m.Vorname FROM Mitarbeiter m LEFT JOIN Bestellungen b ON m.MitarbeiterID = b.FK_MitarbeiterID GROUP BY m.MitarbeiterID ORDER BY COUNT(b.BestellID) DESC LIMIT 1) AS 'Top Mitarbeiter';
```
