### 10.1 3-Wege-JOIN (Basis)

```sql
SELECT k.Vorname, k.Nachname, b.Bestelldatum, m.Vorname AS 'Mitarbeiter Vorname', m.Nachname AS 'Mitarbeiter Nachname'
FROM Kunden k
INNER JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
INNER JOIN Mitarbeiter m ON b.FK_MitarbeiterID = m.MitarbeiterID;

```

### 10.2 3-Wege-JOIN mit WHERE

```sql
SELECT k.Vorname, k.Nachname, b.BestellID, m.Nachname
FROM Kunden k
INNER JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
INNER JOIN Mitarbeiter m ON b.FK_MitarbeiterID = m.MitarbeiterID
WHERE b.Status = 'Versandt';

```

### 10.3 4-Wege-JOIN (Basis)

```sql
SELECT k.Vorname, k.Nachname, b.BestellID, p.Produktname, bp.Menge
FROM Kunden k
INNER JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
INNER JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
INNER JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID;

```

### 10.4 3-Tabellen mit Sortierung

```sql
SELECT k.Vorname, k.Nachname, b.BestellID, m.Vorname AS 'Mitarbeiter'
FROM Kunden k
INNER JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
INNER JOIN Mitarbeiter m ON b.FK_MitarbeiterID = m.MitarbeiterID
ORDER BY k.Nachname ASC;

```

### 10.5 JOIN mit DISTINCT

```sql
SELECT DISTINCT p.Produktname
FROM Kunden k
INNER JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
INNER JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
INNER JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID
WHERE k.Stadt = 'Berlin';

```

### 10.6 LEFT JOIN in Mehrfach-JOIN

```sql
SELECT k.Vorname, k.Nachname, b.BestellID, m.Vorname AS 'Mitarbeiter'
FROM Kunden k
LEFT JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
LEFT JOIN Mitarbeiter m ON b.FK_MitarbeiterID = m.MitarbeiterID;

```

### 10.7 JOIN + WHERE + ORDER BY

```sql
SELECT bp.BestellpositionsID, p.Produktname, bp.Menge, p.Preis
FROM Bestellpositionen bp
INNER JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID
WHERE p.Kategorie = 'Elektronik'
ORDER BY p.Preis DESC;

```

### 10.8 3-Wege-JOIN mit Berechnung

```sql
SELECT p.Produktname, bp.Menge, p.Preis, (bp.Menge * p.Preis) AS 'Gesamtwert'
FROM Bestellpositionen bp
INNER JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID;

```

### 10.9 JOIN Kunde + Bestellung + Bestellposition + Produkt

```sql
SELECT k.Vorname, k.Nachname, b.BestellID, b.Bestelldatum, p.Produktname, bp.Menge
FROM Kunden k
INNER JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
INNER JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
INNER JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID;

```

### 10.10 JOIN mit Alias und mehreren Tabellen

```sql
SELECT k.Vorname AS 'Kunde', b.Bestelldatum, m.Vorname AS 'Mitarbeiter', p.Produktname
FROM Kunden k
INNER JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
INNER JOIN Mitarbeiter m ON b.FK_MitarbeiterID = m.MitarbeiterID
INNER JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
INNER JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID;

```

### 10.11 LEFT JOIN + INNER JOIN kombiniert

```sql
SELECT k.Vorname, k.Nachname, b.BestellID, p.Produktname
FROM Kunden k
LEFT JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
INNER JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
INNER JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID;

```

### 10.12 3-Wege-JOIN mit Abteilung

```sql
SELECT b.BestellID, k.Vorname, k.Nachname, m.Vorname AS 'Mitarbeiter', m.Abteilung
FROM Bestellungen b
INNER JOIN Kunden k ON b.FK_KundenID = k.KundenID
INNER JOIN Mitarbeiter m ON b.FK_MitarbeiterID = m.MitarbeiterID;

```

### 10.13 GROUP BY mit mehreren JOINs

```sql
SELECT p.Kategorie, COUNT(bp.BestellpositionsID) AS 'Anzahl verkauft'
FROM Produkte p
INNER JOIN Bestellpositionen bp ON p.ProduktID = bp.FK_ProduktID
GROUP BY p.Kategorie;

```

### 10.14 Komplexer JOIN mit mehreren Filtern

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

### 10.15 JOIN mit Bewertungen

```sql
SELECT b.BestellID, k.Vorname, k.Nachname, p.Produktname, pb.Sterne
FROM Bestellungen b
INNER JOIN Kunden k ON b.FK_KundenID = k.KundenID
INNER JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
INNER JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID
LEFT JOIN Produktbewertungen pb ON p.ProduktID = pb.FK_ProduktID;

```
