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
GROUP BY k.KundenID, k.Vorname, k.Nachname
ORDER BY 'Gesamtumsatz' DESC;

```

### 11.3 Produkte pro Kategorie mit Summe

```sql
SELECT p.Kategorie, COUNT(DISTINCT p.ProduktID) AS 'Anzahl Produkte', SUM(l.Anzahl) AS 'Gesamtlagerbestand'
FROM Produkte p
LEFT JOIN Lagerbestand l ON p.ProduktID = l.FK_ProduktID
GROUP BY p.Kategorie;

```

### 11.4 Durchschnittliche Bestellmenge

```sql
SELECT AVG(bp.Menge) AS 'Durchschn. Menge'
FROM Bestellpositionen bp;

```

### 11.5 Teuerste Bestellung berechnen

```sql
SELECT b.BestellID, SUM(bp.Menge * p.Preis) AS 'Gesamtwert'
FROM Bestellungen b
INNER JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
INNER JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID
GROUP BY b.BestellID
ORDER BY 'Gesamtwert' DESC
LIMIT 1;

```

### 11.6 Produkte nach Verkaufsmenge

```sql
SELECT p.Produktname, COUNT(bp.BestellpositionsID) AS 'Verkauft X-Mal'
FROM Produkte p
INNER JOIN Bestellpositionen bp ON p.ProduktID = bp.FK_ProduktID
GROUP BY p.ProduktID, p.Produktname
ORDER BY 'Verkauft X-Mal' DESC;

```

### 11.7 Kategorien-Umsatz

```sql
SELECT p.Kategorie, SUM(bp.Menge * p.Preis) AS 'Gesamtumsatz'
FROM Produkte p
INNER JOIN Bestellpositionen bp ON p.ProduktID = bp.FK_ProduktID
GROUP BY p.Kategorie
ORDER BY 'Gesamtumsatz' DESC
LIMIT 1;

```

### 11.8 Mit HAVING-Klausel

```sql
SELECT k.Vorname, k.Nachname, SUM(bp.Menge * p.Preis) AS 'Gesamtumsatz'
FROM Kunden k
INNER JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
INNER JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
INNER JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID
GROUP BY k.KundenID, k.Vorname, k.Nachname
HAVING SUM(bp.Menge * p.Preis) > 500;

```

### 11.9 Mit HAVING-Klausel (Produkte)

```sql
SELECT p.Produktname, COUNT(bp.BestellpositionsID) AS 'Verkauft X-Mal'
FROM Produkte p
INNER JOIN Bestellpositionen bp ON p.ProduktID = bp.FK_ProduktID
GROUP BY p.ProduktID, p.Produktname
HAVING COUNT(bp.BestellpositionsID) > 2;

```

### 11.10 Häufige Mitarbeiter

```sql
SELECT m.Vorname, m.Nachname, COUNT(b.BestellID) AS 'Bestellungen bearbeitet'
FROM Mitarbeiter m
INNER JOIN Bestellungen b ON m.MitarbeiterID = b.FK_MitarbeiterID
GROUP BY m.MitarbeiterID, m.Vorname, m.Nachname
HAVING COUNT(b.BestellID) > 1;

```

### 11.11 Bestseller pro Kategorie

```sql
SELECT p.Kategorie, p.Produktname, SUM(bp.Menge) AS 'Gesamtmenge verkauft'
FROM Produkte p
INNER JOIN Bestellpositionen bp ON p.ProduktID = bp.FK_ProduktID
GROUP BY p.Kategorie, p.ProduktID, p.Produktname
ORDER BY p.Kategorie, 'Gesamtmenge verkauft' DESC;

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
SELECT m.Vorname, m.Nachname, COUNT(b.BestellID) AS 'Anzahl Bestellungen', SUM(bp.Menge * p.Preis) AS 'Gesamtumsatz'
FROM Mitarbeiter m
LEFT JOIN Bestellungen b ON m.MitarbeiterID = b.FK_MitarbeiterID
LEFT JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
LEFT JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID
GROUP BY m.MitarbeiterID, m.Vorname, m.Nachname;

```

### 11.14 Bestellstati-Umsatz

```sql
SELECT b.Status, SUM(bp.Menge * p.Preis) AS 'Gesamtumsatz'
FROM Bestellungen b
INNER JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
INNER JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID
GROUP BY b.Status;

```

### 11.15 Durchschnittliche Bewertung pro Produkt

```sql
SELECT p.Produktname, COUNT(pb.BewertungsID) AS 'Anzahl Bewertungen', AVG(pb.Sterne) AS 'Durchschn. Sterne'
FROM Produkte p
LEFT JOIN Produktbewertungen pb ON p.ProduktID = pb.FK_ProduktID
GROUP BY p.ProduktID, p.Produktname;

```
