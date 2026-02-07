### 7.1 Unterschiedliche Kategorien

```sql
SELECT DISTINCT Kategorie FROM Produkte;
```

### 7.2 Mitarbeiter-Abteilungen

```sql
SELECT DISTINCT Abteilung FROM Mitarbeiter;
```

### 7.3 Bestellstati

```sql
SELECT DISTINCT Status FROM Bestellungen;
```

### 7.4 Lager-Regale

```sql
SELECT DISTINCT Regalnummer FROM Lagerbestand;
```

### 7.5 Bewertungs-Sterne

```sql
SELECT DISTINCT Sterne FROM Produktbewertungen ORDER BY Sterne ASC;
```

### 7.6 Kategorien bestellt

```sql
SELECT DISTINCT p.Kategorie
FROM Produkte p
INNER JOIN Bestellpositionen bp ON p.ProduktID = bp.FK_ProduktID;
```

### 7.7 Kundenstädte mit Bestellungen

```sql
SELECT DISTINCT k.Stadt
FROM Kunden k
INNER JOIN Bestellungen b ON k.KundenID = b.FK_KundenID;
```

### 7.8 Mitarbeiter mit Bestellungen

```sql
SELECT DISTINCT m.Vorname, m.Nachname
FROM Mitarbeiter m
INNER JOIN Bestellungen b ON m.MitarbeiterID = b.FK_MitarbeiterID;
```

### 7.9 Produktkategorien im Lager

```sql
SELECT DISTINCT p.Kategorie
FROM Produkte p
INNER JOIN Lagerbestand l ON p.ProduktID = l.FK_ProduktID;
```

### 7.10 Kombinierte DISTINCT

```sql
SELECT DISTINCT k.Stadt, p.Kategorie
FROM Kunden k
INNER JOIN Bestellungen b ON k.KundenID = b.FK_KundenID
INNER JOIN Bestellpositionen bp ON b.BestellID = bp.FK_BestellID
INNER JOIN Produkte p ON bp.FK_ProduktID = p.ProduktID;
```
