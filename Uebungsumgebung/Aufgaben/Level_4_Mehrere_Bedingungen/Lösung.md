### 1. Mehrere WHERE-Bedingungen

```sql
SELECT * FROM Kunden WHERE Stadt = 'Berlin' OR Stadt = 'Hamburg';
```

### 4. IN-Operator

```sql
SELECT * FROM Mitarbeiter WHERE Abteilung IN ('Vertrieb', 'IT', 'Marketing');
```

### 8. Null-Prüfung

```sql
SELECT * FROM Bestellungen WHERE FK_MitarbeiterID IS NOT NULL;
```

### 2. AND & OR kombinieren

```sql
SELECT * FROM Produkte
WHERE (Kategorie = 'Elektronik' AND Preis < 100)
   OR (Kategorie = 'Möbel' AND Preis > 300);
```

### 3. BETWEEN nutzen

```sql
SELECT * FROM Produkte WHERE Preis BETWEEN 50 AND 200;
```

### 7. Mehrere Filterbedingungen

```sql
SELECT * FROM Kunden
WHERE Stadt = 'Berlin' AND YEAR(RegistriertSeit) = 2023;
```

### 6. LIMIT kombinieren

```sql
SELECT * FROM Produkte ORDER BY Preis DESC LIMIT 10;
```

### 9. Sortierung mit LIMIT

```sql
SELECT * FROM Kunden ORDER BY RegistriertSeit ASC LIMIT 5;
```

### 10. Komplexe Bedingung

```sql
SELECT * FROM Bestellungen
WHERE (Status = 'Versandt' OR Status = 'In Bearbeitung')
AND FK_KundenID IN (SELECT KundenID FROM Kunden WHERE Stadt = 'Berlin');
```
