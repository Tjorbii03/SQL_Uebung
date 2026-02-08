### 10.1 3-Wege-JOIN (Basis)

```sql
SELECT k.Vorname, k.Nachname, b.BestellID, p.Produktname
FROM Kunden k
INNER JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
INNER JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
INNER JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID;

```

### 10.2 3-Tabellen mit Sortierung

```sql
SELECT k.Nachname, b.Bestelldatum, p.Produktname
FROM Kunden k
INNER JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
INNER JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
INNER JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID
ORDER BY b.Bestelldatum DESC;

```

### 10.3 JOIN Kunde + Bestellung + Bestellposition + Produkt

```sql
SELECT k.KundenID, b.BestellID, bp.Menge, p.Produktname
FROM Kunden k
INNER JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
INNER JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
INNER JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID;

```

### 10.4 3-Wege-JOIN mit WHERE

```sql
SELECT b.BestellID, p.Produktname, bp.Menge
FROM Bestellungen b
INNER JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
INNER JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID
WHERE p.Kategorie = 'Elektronik';

```

### 10.5 4-Wege-JOIN (Basis)

```sql
SELECT k.Nachname, b.BestellID, p.Produktname, m.Nachname AS Mitarbeiter
FROM Kunden k
INNER JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
INNER JOIN Mitarbeiter m ON b.FK_MitarbeiterID = m.MitarbeiterID
INNER JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
INNER JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID;

```

### 10.6 JOIN mit DISTINCT

```sql
SELECT DISTINCT k.Vorname, k.Nachname
FROM Kunden k
INNER JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
INNER JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
INNER JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID
WHERE p.Produktname = 'Laptop';

```

### 10.7 LEFT JOIN in Mehrfach-JOIN

```sql
SELECT p.Produktname, bp.Menge, l.Regalnummer
FROM Produkte p
LEFT JOIN Bestellpositionen bp ON p.ProduktID = bp.FK_ProduktID
LEFT JOIN Lagerbestand l ON p.ProduktID = l.FK_ProduktID;

```

### 10.8 JOIN + WHERE + ORDER BY

```sql
SELECT k.Nachname, b.BestellID, b.Bestelldatum
FROM Kunden k
INNER JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
WHERE b.Status = 'Versandt'
ORDER BY b.Bestelldatum ASC;

```

### 10.9 3-Wege-JOIN mit Berechnung

```sql
SELECT b.BestellID, p.Produktname, (bp.Menge * p.Preis) AS Gesamtpreis
FROM Bestellungen b
INNER JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
INNER JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID;

```

### 10.10 JOIN mit Alias und mehreren Tabellen

```sql
SELECT b.BestellID, m.Nachname AS Bearbeiter, k.Nachname AS Käufer
FROM Bestellungen b
JOIN Mitarbeiter m ON b.FK_MitarbeiterID = m.MitarbeiterID
JOIN Kunden k ON b.FK_KundenID = k.KundenID;

```

### 10.11 3-Wege-JOIN mit Abteilung

```sql
SELECT m.Vorname, m.Nachname, b.BestellID
FROM Mitarbeiter m
INNER JOIN Bestellungen b ON m.MitarbeiterID = b.FK_MitarbeiterID
WHERE m.Abteilung = 'Sales';

```

### 10.12 LEFT JOIN + INNER JOIN kombiniert

```sql
SELECT k.Nachname, b.BestellID, p.Produktname
FROM Kunden k
LEFT JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
INNER JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
INNER JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID;

```

### 10.13 GROUP BY mit mehreren JOINs

```sql
SELECT k.Nachname, COUNT(b.BestellID) AS AnzahlBestellungen
FROM Kunden k
LEFT JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
GROUP BY k.Nachname;

```

### 10.14 Komplexer JOIN mit mehreren Filtern

```sql
SELECT b.BestellID, k.Nachname, p.Produktname
FROM Bestellungen b
JOIN Kunden k ON b.FK_KundenID = k.KundenID
JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID
WHERE k.Stadt = 'Hamburg' AND p.Preis > 100;

```

### 10.15 JOIN mit Bewertungen

```sql
SELECT p.Produktname, pb.Sterne, k.Vorname
FROM Produkte p
INNER JOIN Produktbewertungen pb ON p.ProduktID = pb.FK_ProduktID
INNER JOIN Kunden k ON pb.FK_KundenID = k.KundenID;

```
