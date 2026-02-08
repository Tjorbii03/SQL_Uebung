### 11.1 Umsatz pro Bestellung

```sql
SELECT b.BestellID, SUM(bp.Menge * p.Preis) AS 'Gesamtumsatz'
FROM Bestellungen b
INNER JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
INNER JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID
GROUP BY b.BestellID;

```

### 11.2 Umsatz pro Kunde

```sql
SELECT k.Vorname, k.Nachname, SUM(bp.Menge * p.Preis) AS 'Gesamtumsatz'
FROM Kunden k
INNER JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
INNER JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
INNER JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID
GROUP BY k.KundenID, k.Vorname, k.Nachname;

```

### 11.3 Produkte pro Kategorie mit Summe

```sql
SELECT p.Kategorie, COUNT(p.ProduktID) AS 'Anzahl Produkte', SUM(l.Anzahl) AS 'Gesamtbestand'
FROM Produkte p
INNER JOIN Lagerbestand l ON p.ProduktID = l.FK_ProduktID
GROUP BY p.Kategorie;

```

### 11.4 Durchschnittliche Bestellmenge

```sql
SELECT p.Produktname, AVG(bp.Menge) AS 'Durchschnittliche Menge'
FROM Produkte p
INNER JOIN Bestellpositionen bp ON p.ProduktID = bp.FK_ProduktID
GROUP BY p.Produktname;

```

### 11.5 Teuerste Bestellung berechnen

```sql
SELECT b.BestellID, SUM(bp.Menge * p.Preis) AS 'Umsatz'
FROM Bestellungen b
INNER JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
INNER JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID
GROUP BY b.BestellID
ORDER BY Umsatz DESC
LIMIT 1;

```

### 11.6 Produkte nach Verkaufsmenge

```sql
SELECT p.Produktname, SUM(bp.Menge) AS 'Verkaufte Gesamtmenge'
FROM Produkte p
INNER JOIN Bestellpositionen bp ON p.ProduktID = bp.FK_ProduktID
GROUP BY p.Produktname
ORDER BY SUM(bp.Menge) DESC;

```

### 11.7 Kategorien-Umsatz

```sql
SELECT p.Kategorie, SUM(bp.Menge * p.Preis) AS 'Umsatz'
FROM Produkte p
INNER JOIN Bestellpositionen bp ON p.ProduktID = bp.FK_ProduktID
GROUP BY p.Kategorie;

```

### 11.8 Mit HAVING-Klausel

```sql
SELECT k.Nachname, COUNT(b.BestellID) AS 'Anzahl'
FROM Kunden k
INNER JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
GROUP BY k.Nachname
HAVING COUNT(b.BestellID) > 5;

```

### 11.9 Mit HAVING-Klausel (Produkte)

```sql
SELECT p.Produktname, SUM(bp.Menge) AS 'Verkauft'
FROM Produkte p
INNER JOIN Bestellpositionen bp ON p.ProduktID = bp.FK_ProduktID
GROUP BY p.Produktname
HAVING SUM(bp.Menge) > 100;

```

### 11.10 Häufige Mitarbeiter

```sql
SELECT m.Vorname, m.Nachname, COUNT(b.BestellID) AS 'Bearbeitete Bestellungen'
FROM Mitarbeiter m
INNER JOIN Bestellungen b ON m.MitarbeiterID = b.FK_MitarbeiterID
GROUP BY m.MitarbeiterID, m.Vorname, m.Nachname
ORDER BY COUNT(b.BestellID) DESC;

```

### 11.11 Bestseller pro Kategorie

```sql
SELECT p.Kategorie, p.Produktname, SUM(bp.Menge) AS 'Menge'
FROM Produkte p
INNER JOIN Bestellpositionen bp ON p.ProduktID = bp.FK_ProduktID
GROUP BY p.Kategorie, p.Produktname
ORDER BY Menge DESC;

```

### 11.12 Lagerwert nach Kategorie

```sql
SELECT p.Kategorie, SUM(l.Anzahl * p.Preis) AS 'Lagerwert'
FROM Produkte p
INNER JOIN Lagerbestand l ON p.ProduktID = l.FK_ProduktID
GROUP BY p.Kategorie;

```

### 11.13 Mitarbeiter-Performance

```sql
SELECT m.Nachname, m.Abteilung, SUM(bp.Menge * p.Preis) AS 'Generierter Umsatz'
FROM Mitarbeiter m
INNER JOIN Bestellungen b ON m.MitarbeiterID = b.FK_MitarbeiterID
INNER JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
INNER JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID
GROUP BY m.MitarbeiterID, m.Nachname, m.Abteilung;

```

### 11.14 Bestellstati-Umsatz

```sql
SELECT b.Status, SUM(bp.Menge * p.Preis) AS 'Umsatz'
FROM Bestellungen b
INNER JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
INNER JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID
GROUP BY b.Status;

```

### 11.15 Durchschnittliche Bewertung pro Produkt

```sql
SELECT p.Produktname, AVG(pb.Sterne) AS 'Durchschnitt Sterne'
FROM Produkte p
LEFT JOIN Produktbewertungen pb ON p.ProduktID = pb.FK_ProduktID
GROUP BY p.Produktname;

```
