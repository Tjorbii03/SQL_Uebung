### 5.1 Gesamte Kundenanzahl

```sql
SELECT COUNT(*) AS 'Anzahl Kunden' FROM Kunden;
```

### 5.2 Höchster Produktpreis

```sql
SELECT MAX(Preis) AS 'Höchster Preis' FROM Produkte;
```

### 5.3 Gesamtanzahl Bestellungen

```sql
SELECT COUNT(*) AS 'Gesamte Bestellungen' FROM Bestellungen;
```

### 5.4 Durchschnittsgehalt

```sql
SELECT AVG(Gehalt) AS 'Durchschnitt Gehalt' FROM Mitarbeiter;
```

### 5.5 Summe aller Gehälter

```sql
SELECT SUM(Gehalt) AS 'Gesamtgehalt' FROM Mitarbeiter;
```

### 5.6 Günstigstes Elektronik-Produkt

```sql
SELECT MIN(Preis) AS 'Günstigster Preis'
FROM Produkte
WHERE Kategorie = 'Elektronik';
```

### 5.7 Gesamte Lageranzahl

```sql
SELECT SUM(Anzahl) AS 'Gesamte Menge' FROM Lagerbestand;
```

### 5.8 Durchschnittsgehalt Vertrieb

```sql
SELECT AVG(Gehalt) AS 'Durchschnitt Gehalt'
FROM Mitarbeiter
WHERE Abteilung = 'Vertrieb';
```

### 5.9 Teuerste und günstigste Produkt

```sql
SELECT MAX(Preis) AS 'Teuerster Preis', MIN(Preis) AS 'Günstigster Preis'
FROM Produkte;
```

### 5.10 Erste und letzte Bestellung

```sql
SELECT MIN(Bestelldatum) AS 'Erste Bestellung', MAX(Bestelldatum) AS 'Letzte Bestellung'
FROM Bestellungen;
```
