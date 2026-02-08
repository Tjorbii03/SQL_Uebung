### 9.1 Einfacher INNER JOIN - Bestellung + Kunde

```sql
SELECT b.BestellID, k.Nachname
FROM Bestellungen b
INNER JOIN Kunden k ON b.FK_KundenID = k.KundenID;

```

### 9.2 INNER JOIN - Produkt + Lagerbestand

```sql
SELECT p.Produktname, l.Regalnummer
FROM Produkte p
INNER JOIN Lagerbestand l ON p.ProduktID = l.FK_ProduktID;

```

### 9.3 INNER JOIN - Produkt + Bewertung

```sql
SELECT p.Produktname, pb.Sterne
FROM Produkte p
INNER JOIN Produktbewertungen pb ON p.ProduktID = pb.FK_ProduktID;

```

### 9.4 JOIN und Sortieren

```sql
SELECT b.BestellID, k.Vorname, b.Bestelldatum
FROM Bestellungen b
INNER JOIN Kunden k ON b.FK_KundenID = k.KundenID
ORDER BY b.Bestelldatum ASC;

```

### 9.5 JOIN mit Daten-Ausgabe

```sql
SELECT k.Vorname, k.Nachname, b.Bestelldatum, b.Status
FROM Kunden k
INNER JOIN Bestellungen b ON k.KundenID = b.FK_KundenID;

```

### 9.6 INNER JOIN mit WHERE

```sql
SELECT b.BestellID, m.Nachname
FROM Bestellungen b
INNER JOIN Mitarbeiter m ON b.FK_MitarbeiterID = m.MitarbeiterID;

```

### 9.7 INNER JOIN mit Filter

```sql
SELECT k.Vorname, k.Nachname, b.BestellID
FROM Kunden k
INNER JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
WHERE k.Stadt = 'Berlin';

```

### 9.8 JOIN mit Null-Werten

```sql
SELECT p.Produktname, l.Anzahl
FROM Produkte p
INNER JOIN Lagerbestand l ON p.ProduktID = l.FK_ProduktID
WHERE l.Anzahl > 0;

```

### 9.9 LEFT JOIN - Kunden ohne Bestellungen

```sql
SELECT k.Vorname, k.Nachname, b.BestellID
FROM Kunden k
LEFT JOIN Bestellungen b ON k.KundenID = b.FK_KundenID;

```

### 9.10 LEFT JOIN - Produkte ohne Lager

```sql
SELECT p.Produktname, l.Anzahl
FROM Produkte p
LEFT JOIN Lagerbestand l ON p.ProduktID = l.FK_ProduktID;

```

### 9.11 LEFT JOIN - Produkte ohne Bewertungen

```sql
SELECT p.Produktname, pb.Sterne
FROM Produkte p
LEFT JOIN Produktbewertungen pb ON p.ProduktID = pb.FK_ProduktID;

```

### 9.12 JOIN und ORDER BY

```sql
SELECT k.Vorname, k.Nachname, b.BestellID, b.Bestelldatum
FROM Kunden k
INNER JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
ORDER BY k.Nachname ASC, b.Bestelldatum ASC;

```

### 9.13 JOIN + Aggregation einfach

```sql
SELECT p.Produktname, COUNT(pb.BewertungsID) AS 'Anzahl Bewertungen'
FROM Produkte p
INNER JOIN Produktbewertungen pb ON p.ProduktID = pb.FK_ProduktID
GROUP BY p.Produktname;

```

### 9.14 JOIN von 3 Tabellen (einfach)

```sql
SELECT k.Vorname, k.Nachname, b.BestellID, p.Produktname
FROM Kunden k
INNER JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
INNER JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
INNER JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID;

```

### 9.15 JOIN mit Bedingung

```sql
SELECT b.BestellID, b.Bestelldatum, m.Vorname, m.Nachname
FROM Bestellungen b
INNER JOIN Mitarbeiter m ON b.FK_MitarbeiterID = m.MitarbeiterID
WHERE m.Abteilung = 'Vertrieb';

```
