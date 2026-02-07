### 3. Elektronik-Produkte

```sql
SELECT * FROM Produkte WHERE Kategorie = 'Elektronik';
```

### 4. Günstige Elektronik

```sql
SELECT * FROM Produkte WHERE Kategorie = 'Elektronik' AND Preis < 100;
```

### 7. Städte der Kunden

```sql
SELECT DISTINCT Stadt FROM Kunden;
```

### 8. Bücher im Sortiment

```sql
SELECT Produktname FROM Produkte WHERE Kategorie = 'Bücher';
```

### 9. Vertriebsmitarbeiter

```sql
SELECT * FROM Mitarbeiter WHERE Abteilung = 'Vertrieb';
```

### 10. Versandte Bestellungen

```sql
SELECT * FROM Bestellungen WHERE Status = 'Versandt';
```

### 12. Produkte mit genauem Preis

```sql
SELECT * FROM Produkte WHERE Preis = 49.00;
```

### 13. Gut verdienende Mitarbeiter

```sql
SELECT * FROM Mitarbeiter WHERE Gehalt > 3000;
```

### 14. Fünf-Stern-Bewertungen

```sql
SELECT * FROM Produktbewertungen WHERE Sterne = 5;
```

### 5. Bestellungen ohne Mitarbeiter

```sql
SELECT * FROM Bestellungen WHERE FK_MitarbeiterID IS NULL;
```
