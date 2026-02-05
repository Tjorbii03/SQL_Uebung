# SQL: Theorie und Syntax

Dieses Dokument bietet eine Übersicht über grundlegende und fortgeschrittene SQL-Befehle.

---

### 1. Grundlagen: Daten abfragen

#### `SELECT` / `FROM`
- **Zweck**: Wählt Spalten aus einer oder mehreren Tabellen aus.
- `SELECT *`: Wählt **alle** Spalten aus.
- `SELECT Spalte1, Spalte2`: Wählt nur die angegebenen Spalten aus.
- `FROM Tabelle`: Gibt die Tabelle an, aus der die Daten gelesen werden.

**Beispiel**:
```sql
-- Wählt nur Vorname und Stadt aus der Kundentabelle
SELECT Vorname, Stadt FROM Kunden;
```

#### `WHERE`
- **Zweck**: Filtert die Zeilen basierend auf einer oder mehreren Bedingungen.
- **Operatoren**: `=`, `!=` (oder `<>`), `>`, `<`, `>=`, `<=`
- **Bedingungen verknüpfen**:
    - `AND`: Beide Bedingungen müssen wahr sein.
    - `OR`: Mindestens eine der Bedingungen muss wahr sein.

**Beispiel**:
```sql
-- Wählt alle Produkte aus der Kategorie 'Elektronik', die mehr als 500 kosten
SELECT * FROM Produkte WHERE Kategorie = 'Elektronik' AND Preis > 500;

-- Wählt alle Kunden aus Berlin ODER Hamburg
SELECT * FROM Kunden WHERE Stadt = 'Berlin' OR Stadt = 'Hamburg';
```

---

### 2. Ergebnisse sortieren und eingrenzen

#### `ORDER BY`
- **Zweck**: Sortiert die Ergebnismenge nach einer oder mehreren Spalten.
- `ASC` (ascending): Aufsteigend (Standard, kann weggelassen werden).
- `DESC` (descending): Absteigend.

**Beispiel**:
```sql
-- Sortiert Produkte nach Preis (teuerste zuerst)
SELECT * FROM Produkte ORDER BY Preis DESC;

-- Sortiert Kunden nach Stadt und dann nach Nachname
SELECT * FROM Kunden ORDER BY Stadt ASC, Nachname ASC;
```

#### `DISTINCT`
- **Zweck**: Entfernt doppelte Zeilen aus der Ergebnismenge und zeigt nur einzigartige Werte an.

**Beispiel**:
```sql
-- Zeigt jede Stadt, in der Kunden wohnen, nur einmal an
SELECT DISTINCT Stadt FROM Kunden;
```

#### `LIKE` mit Wildcards
- **Zweck**: Sucht nach Mustern in Textspalten innerhalb einer `WHERE`-Klausel.
- `%`: Steht für null, ein oder beliebig viele Zeichen.
- `_`: Steht für genau ein einzelnes Zeichen.

**Beispiel**:
```sql
-- Findet alle Produkte, deren Name mit 'L' beginnt
SELECT * FROM Produkte WHERE Produktname LIKE 'L%';

-- Findet alle Kunden, deren Nachname 'meier' oder 'meyer' sein könnte
SELECT * FROM Kunden WHERE Nachname LIKE 'Me_er';
```

---

### 3. Aggregatsfunktionen und Gruppierung

- **Zweck**: Führen Berechnungen über eine Menge von Zeilen aus und geben einen einzelnen Wert zurück.

- **Wichtige Funktionen**:
    - `COUNT()`: Zählt die Anzahl der Zeilen.
    - `SUM()`: Berechnet die Summe der Werte in einer Spalte.
    - `AVG()`: Berechnet den Durchschnitt der Werte.
    - `MIN()`: Findet den kleinsten Wert.
    - `MAX()`: Findet den größten Wert.

#### `GROUP BY`
- **Zweck**: Gruppiert Zeilen, die dieselben Werte in bestimmten Spalten haben, zu einer einzigen Zeile. Wird fast immer mit Aggregatsfunktionen verwendet.
- **Regel**: Wenn `SELECT` eine Aggregatsfunktion enthält, müssen alle anderen ausgewählten Spalten in der `GROUP BY`-Klausel aufgeführt werden.

**Beispiel**:
```sql
-- Zählt die Anzahl der Produkte pro Kategorie
SELECT Kategorie, COUNT(ProduktID) FROM Produkte GROUP BY Kategorie;

-- Berechnet den durchschnittlichen Preis pro Kategorie
SELECT Kategorie, AVG(Preis) FROM Produkte GROUP BY Kategorie;
```

#### `HAVING`
- **Zweck**: Filtert gruppierte Daten. `WHERE` filtert einzelne Zeilen *vor* der Gruppierung, `HAVING` filtert Gruppen *nach* der Gruppierung.

**Beispiel**:
```sql
-- Zeigt nur Kategorien mit mehr als 2 Produkten an
SELECT Kategorie, COUNT(ProduktID)
FROM Produkte
GROUP BY Kategorie
HAVING COUNT(ProduktID) > 2;
```

---

### 4. Daten aus mehreren Tabellen verbinden (`JOIN`)

- **Zweck**: Kombiniert Zeilen aus zwei oder mehr Tabellen basierend auf einer zugehörigen Spalte.

#### `INNER JOIN` (oder einfach `JOIN`)
- Gibt nur die Zeilen zurück, bei denen es in **beiden** Tabellen eine Übereinstimmung gibt.

**Beispiel**:
```sql
-- Kombiniert Bestellungen mit den zugehörigen Kundendaten
SELECT b.BestellID, k.Vorname, k.Nachname
FROM Bestellungen b
JOIN Kunden k ON b.FK_KundenID = k.KundenID;
```

#### `LEFT JOIN`
- Gibt **alle** Zeilen aus der linken Tabelle und die übereinstimmenden Zeilen aus der rechten Tabelle zurück. Wenn es keine Übereinstimmung gibt, sind die Spalten der rechten Tabelle `NULL`.

**Beispiel**:
```sql
-- Zeigt ALLE Kunden an und ihre Bestellungen, falls vorhanden
SELECT k.Vorname, k.Nachname, b.BestellID
FROM Kunden k
LEFT JOIN Bestellungen b ON k.KundenID = b.FK_KundenID;
-- Kunden ohne Bestellung haben hier NULL in der Spalte 'BestellID'
```

#### Mehrere `JOIN`s in einer Abfrage
- Man kann beliebig viele Tabellen verketten.

**Beispiel**:
```sql
-- Holt alle relevanten Informationen zu einer Bestellung
SELECT
    k.Vorname,          -- Aus Tabelle Kunden
    p.Produktname,      -- Aus Tabelle Produkte
    b.Menge,            -- Aus Tabelle Bestellungen
    p.Preis AS Einzelpreis
FROM Bestellungen b
JOIN Kunden k ON b.FK_KundenID = k.KundenID   -- 1. Join
JOIN Produkte p ON b.FK_ProduktID = p.ProduktID; -- 2. Join
```

---

### 5. Aliasse (`AS`)

- **Zweck**: Gibt einer Spalte oder einer Tabelle einen temporären, einfacheren Namen in der Abfrage.
- Verbessert die Lesbarkeit und ist bei `JOIN`s auf dieselbe Tabelle notwendig.

**Beispiel**:
```sql
-- 'k' wird zum Alias für 'Kunden', 'Anzahl' für 'COUNT(ProduktID)'
SELECT
    Kategorie,
    COUNT(ProduktID) AS Anzahl
FROM Produkte
GROUP BY Kategorie;

-- 'k' und 'b' als Aliasse für die Tabellen
SELECT k.Vorname, b.BestellID
FROM Kunden AS k
JOIN Bestellungen AS b ON k.KundenID = b.FK_KundenID;
```
