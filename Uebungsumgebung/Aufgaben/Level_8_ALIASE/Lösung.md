### 8.1 Kundenname mit Alias

```sql
SELECT Vorname AS 'Erster Name', Nachname AS 'Familienname' FROM Kunden;
```

### 8.2 Produkt-Alias

```sql
SELECT Produktname AS Artikel, Preis AS Einzelpreis, Kategorie AS Warengruppe FROM Produkte;
```

### 8.3 Mitarbeiter-Alias

```sql
SELECT Vorname AS Mitarbeiter, Abteilung AS Bereich, Gehalt AS Monatssalär FROM Mitarbeiter;
```

### 8.4 Lagerbestand-Alias

```sql
SELECT Anzahl AS 'Im Lager', Regalnummer AS 'Regal-Nr' FROM Lagerbestand;
```

### 8.5 Bestellung-Alias

```sql
SELECT BestellID AS 'Bestell-Nr', Bestelldatum AS 'Datum', Status AS 'Zustand' FROM Bestellungen;
```

### 8.6 Alias mit Berechnung

```sql
SELECT Preis, Preis * 1.19 AS 'Brutto-Preis' FROM Produkte;
```

### 8.7 Alias in Aggregation

```sql
SELECT COUNT(*) AS 'Anzahl Kunden', AVG((SELECT Gehalt FROM Mitarbeiter)) AS 'Durchschn. Gehalt' FROM Kunden;
```

### 8.8 JOIN mit TABLE-Alias

```sql
SELECT k.Vorname, b.BestellID
FROM Kunden AS k
JOIN Bestellungen AS b ON k.KundenID = b.FK_KundenID;
```

### 8.9 Kombinierte Aliases

```sql
SELECT k.Vorname AS 'Kundenname', k.Stadt AS 'Ort'
FROM Kunden k
INNER JOIN Bestellungen b ON k.KundenID = b.FK_KundenID;
```

### 8.10 Alias für Kategorien-Zählung

```sql
SELECT Kategorie AS 'Produktkategorie', COUNT(*) AS 'Anzahl Produkte'
FROM Produkte
GROUP BY Kategorie;
```

### 8.11 Komplexe Aliases mit JOIN

```sql
SELECT p.Produktname AS Produkt, l.Anzahl AS 'Lagerbestand', l.Regalnummer AS 'Standort'
FROM Produkte p
INNER JOIN Lagerbestand l ON p.ProduktID = l.FK_ProduktID;
```

### 8.12 Alias in Bedingung

```sql
SELECT Kategorie, COUNT(*) AS 'Produkt-Anzahl'
FROM Produkte
GROUP BY Kategorie
HAVING COUNT(*) > 2;
```
