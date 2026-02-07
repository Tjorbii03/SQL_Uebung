### 3.1 Kunden nach Nachnamen sortieren

```sql
SELECT * FROM Kunden ORDER BY Nachname ASC;
```

### 3.2 Mitarbeiter nach Gehalt sortieren

```sql
SELECT * FROM Mitarbeiter ORDER BY Gehalt DESC;
```

### 3.3 Einzigartige Kundenstadt

```sql
SELECT DISTINCT Stadt FROM Kunden;
```

### 3.4 Neue Kunden zuerst

```sql
SELECT * FROM Kunden ORDER BY RegistriertSeit DESC;
```

### 3.5 Produkte nach Preis

```sql
SELECT * FROM Produkte ORDER BY Preis ASC;
```

### 3.6 Abteilungen

```sql
SELECT DISTINCT Abteilung FROM Mitarbeiter;
```

### 3.7 Produkte mit K am Anfang

```sql
SELECT * FROM Produkte WHERE Produktname LIKE 'K%';
```

### 3.8 Deutsche E-Mail-Adressen

```sql
SELECT * FROM Kunden WHERE Email LIKE '%.de';
```

### 3.9 Produkte mit 'Pro' im Namen

```sql
SELECT * FROM Produkte WHERE Produktname LIKE '%Pro%';
```

### 3.10 Namen die auf 'er' enden

```sql
SELECT * FROM Kunden WHERE Nachname LIKE '%er';
```

### 3.11 Mitarbeiter mit 'S'

```sql
SELECT * FROM Mitarbeiter WHERE Vorname LIKE 'S%';
```

### 3.12 Stühle im Sortiment

```sql
SELECT * FROM Produkte WHERE Produktname LIKE '%Stuhl%';
```

### 3.13 Internationale E-Mails

```sql
SELECT * FROM Kunden WHERE Email LIKE '%.com';
```

### 3.14 Bücher finden (case-insensitive)

```sql
SELECT * FROM Produkte WHERE Produktname LIKE '%buch%' OR Produktname LIKE '%Buch%';
```
