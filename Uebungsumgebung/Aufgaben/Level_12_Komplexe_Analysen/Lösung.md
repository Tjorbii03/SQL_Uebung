### 12.1 Umsatz pro Stadt

```sql
SELECT k.Stadt, SUM(bp.Menge * p.Preis) AS 'Gesamtumsatz'
FROM Kunden k
INNER JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
INNER JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
INNER JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID
GROUP BY k.Stadt
ORDER BY 'Gesamtumsatz' DESC;

```

### 12.2 Top 3 Kunden nach Umsatz

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

### 12.3 Lagerverkehrte Produkte (Ladenhüter)

```sql
SELECT p.Produktname
FROM Produkte p
LEFT JOIN Bestellpositionen bp ON p.ProduktID = bp.FK_ProduktID
WHERE bp.BestellpositionsID IS NULL;

```

### 12.4 Produktanalyse komplett

```sql
SELECT p.Produktname, p.Preis, l.Anzahl, COUNT(pb.BewertungsID) AS 'Anzahl Bewertungen', AVG(pb.Sterne) AS 'Durchschn. Sterne'
FROM Produkte p
LEFT JOIN Lagerbestand l ON p.ProduktID = l.FK_ProduktID
LEFT JOIN Produktbewertungen pb ON p.ProduktID = pb.FK_ProduktID
GROUP BY p.ProduktID, p.Produktname, p.Preis, l.Anzahl;

```

### 12.5 Kundenliste mit Details

```sql
SELECT k.Vorname, k.Nachname, k.Stadt, COUNT(b.BestellID) AS 'Anzahl Bestellungen', COALESCE(SUM(bp.Menge * p.Preis), 0) AS 'Gesamtumsatz'
FROM Kunden k
LEFT JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
LEFT JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
LEFT JOIN Produkte p ON b.BestellID = bp.FK_BestellID -- Korrektur: bp.FK_ProduktID = p.ProduktID
GROUP BY k.KundenID, k.Vorname, k.Nachname, k.Stadt
ORDER BY 'Gesamtumsatz' DESC;

```

### 12.6 Kategorie-Performance

```sql
SELECT p.Kategorie, COUNT(DISTINCT p.ProduktID) AS 'Anzahl Produkte', AVG(p.Preis) AS 'Durchschn. Preis', SUM(bp.Menge * p.Preis) AS 'Gesamtumsatz',
       (SELECT p2.Produktname FROM Produkte p2 INNER JOIN Bestellpositionen bp2 ON p2.ProduktID = bp2.FK_ProduktID WHERE p2.Kategorie = p.Kategorie GROUP BY p2.ProduktID ORDER BY SUM(bp2.Menge) DESC LIMIT 1) AS 'Bestseller'
FROM Produkte p
LEFT JOIN Bestellpositionen bp ON p.ProduktID = bp.FK_ProduktID
GROUP BY p.Kategorie;

```

### 12.7 Stornierungsanalyse

```sql
SELECT k.Vorname, k.Nachname, k.Email, COUNT(b.BestellID) AS 'Stornierungen'
FROM Kunden k
INNER JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
WHERE b.Status = 'Storniert'
GROUP BY k.KundenID, k.Vorname, k.Nachname, k.Email;

```

### 12.8 Lagerwert nach Regal

```sql
SELECT l.Regalnummer, COUNT(DISTINCT l.FK_ProduktID) AS 'Anzahl Produkte', AVG(p.Preis) AS 'Durchschn. Wert', SUM(l.Anzahl * p.Preis) AS 'Gesamtwert'
FROM Lagerbestand l
INNER JOIN Produkte p ON l.FK_ProduktID = p.ProduktID
GROUP BY l.Regalnummer;

```

### 12.9 Mitarbeiter-Performance detailliert

```sql
SELECT m.Vorname, m.Nachname, m.Abteilung, COUNT(DISTINCT b.BestellID) AS 'Anzahl Bestellungen', SUM(bp.Menge * p.Preis) AS 'Gesamtumsatz',
       AVG(bp.Menge * p.Preis) AS 'Durchschn. pro Bestellung'
FROM Mitarbeiter m
LEFT JOIN Bestellungen b ON m.MitarbeiterID = b.FK_MitarbeiterID
LEFT JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
LEFT JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID
GROUP BY m.MitarbeiterID, m.Vorname, m.Nachname, m.Abteilung;

```

### 12.10 Zeitliche Trends (Monatsumsatz)

```sql
SELECT STRFTIME('%Y-%m', b.Bestelldatum) AS 'Monat', COUNT(b.BestellID) AS 'Anzahl Bestellungen', SUM(bp.Menge * p.Preis) AS 'Gesamtumsatz'
FROM Bestellungen b
INNER JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
INNER JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID
GROUP BY STRFTIME('%Y-%m', b.Bestelldatum)
ORDER BY 'Monat' DESC;

```

### 12.11 Subquery (Produkte über Kategorieschnitt)

```sql
SELECT p.Produktname, p.Preis
FROM Produkte p
WHERE p.Preis > (SELECT AVG(p2.Preis) FROM Produkte p2 WHERE p2.Kategorie = p.Kategorie);

```

### 12.12 Komplexer Business-Report

```sql
SELECT
  (SELECT COUNT(*) FROM Kunden) AS 'Gesamtkunden',
  (SELECT COUNT(*) FROM Bestellungen) AS 'Gesamtbestellungen',
  (SELECT AVG(bp.Menge * p.Preis) FROM Bestellpositionen bp INNER JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID) AS 'Durchschn. Umsatz',
  (SELECT p.Kategorie FROM Produkte p INNER JOIN Bestellpositionen bp ON p.ProduktID = bp.FK_ProduktID GROUP BY p.Kategorie ORDER BY SUM(bp.Menge * p.Preis) DESC LIMIT 1) AS 'Top Kategorie',
  (SELECT m.Vorname FROM Mitarbeiter m LEFT JOIN Bestellungen b ON m.MitarbeiterID = b.FK_MitarbeiterID GROUP BY m.MitarbeiterID ORDER BY COUNT(b.BestellID) DESC LIMIT 1) AS 'Top Mitarbeiter';

```
