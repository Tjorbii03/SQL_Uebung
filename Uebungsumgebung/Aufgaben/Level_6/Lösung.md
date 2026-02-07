### 6.1 Produkte pro Kategorie zählen

```sql
SELECT Kategorie, COUNT(*) AS 'Anzahl Produkte'
FROM Produkte
GROUP BY Kategorie;
```

### 6.2 Kunden pro Stadt

```sql
SELECT Stadt, COUNT(*) AS 'Anzahl Kunden'
FROM Kunden
GROUP BY Stadt;
```

### 6.3 Bewertungen pro Produkt

```sql
SELECT FK_ProduktID, COUNT(*) AS 'Anzahl Bewertungen'
FROM Produktbewertungen
GROUP BY FK_ProduktID;
```

### 6.4 Lagerbestand nach Regalnummer

```sql
SELECT Regalnummer, SUM(Anzahl) AS 'Gesamtbestand'
FROM Lagerbestand
GROUP BY Regalnummer;
```

### 6.5 Durchschnittliche Produktpreise pro Kategorie

```sql
SELECT Kategorie, AVG(Preis) AS 'Durchschnitt Preis'
FROM Produkte
GROUP BY Kategorie;
```
