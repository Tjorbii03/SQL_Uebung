## 🛠 datenbank- & tabellenverwaltung

| befehl              | beschreibung             | syntax-beispiel |
| ------------------- | ------------------------ | --------------- |
| **create database** | neue datenbank erstellen |                 |

| <br>`create database if not exists db_name;`

|
| <br>**use** | datenbank auswählen

| <br>`use db_name;`

|
| <br>**show databases** | alle datenbanken auflisten

| <br>`show databases;`

|
| <br>**drop table** | tabelle unwiderruflich löschen

| <br>`drop table tbl_name;`

|

### tabellen erstellen (`create table`)

eine neue tabelle mit spalten und datentypen definieren:

```sql
create table tbl_produkte (
  p_id integer not null,           -- ganzzahl, darf nie leer sein (wird als primärschlüssel genutzt)
  name varchar(50),                -- text mit max. 50 zeichen
  preis decimal(10,2),             -- dezimalzahl mit 10 ziffern, davon 2 nach dem komma (z.b. 99.99)
  primary key (p_id)               -- p_id als eindeutigen schlüssel festlegen (keine duplikate erlaubt)
);
```

**erklärung**: diese tabelle speichert produkte mit eindeutiger id, name und preis.

---

## 📊 daten abfragen & manipulieren

die basis-abfrage (`select`)

daten aus einer tabelle abfragen und filtern:

```sql
select [distinct] spalte              -- spalten auswählen (optional: distinct = nur unterschiedliche werte)
  from tbl_tabellenname               -- tabelle angeben, aus der daten gelesen werden
 where bedingung                      -- optional: nur zeilen, die bedingung erfüllen
 order by spalte [asc|desc]           -- optional: nach spalte sortieren (asc = aufsteigend, desc = absteigend)
 limit start, anzahl;                 -- optional: nur erste x zeilen zurückgeben
```

**beispiel**:

```sql
select name, preis
from tbl_produkte
where preis > 50
order by preis desc
limit 0, 10;  -- erste 10 teursten produkte über 50€
```

### datensätze verwalten

#### einfügen (`insert`)

neue datensätze in eine tabelle einfügen:

```sql
-- einzelner datensatz
insert into tbl_produkte (p_id, name, preis)
values (1, 'Laptop', 899.99);

-- mehrere datensätze gleichzeitig
insert into tbl_produkte (p_id, name, preis)
values
  (2, 'Maus', 29.99),
  (3, 'Tastatur', 79.99),
  (4, 'Monitor', 249.99);
```

#### aktualisieren (`update`)

bestehende datensätze ändern:

```sql
-- ein feld aktualisieren
update tbl_produkte
set preis = 749.99
where p_id = 1;

-- mehrere felder aktualisieren
update tbl_produkte
set preis = 89.99, name = 'Wireless Maus'
where name = 'Maus';

-- bedingung mit vergleichen
update tbl_produkte
set preis = preis * 0.9  -- 10% rabatt
where preis > 100;
```

#### löschen (`delete`)

datensätze aus einer tabelle entfernen:

```sql
-- einzelne datensätze löschen
delete from tbl_produkte
where p_id = 1;

-- mehrere datensätze mit bedingung löschen
delete from tbl_produkte
where preis < 30;

-- alle datensätze löschen (aber nicht die tabelle selbst!)
delete from tbl_produkte;
```

⚠️ **wichtig**: immer eine `where`-bedingung bei `delete` und `update` verwenden, um versehentliches löschen aller daten zu vermeiden!

---

## 🔗 tabellen verbinden (joins)

um daten aus mehreren tabellen zu kombinieren, nutzt du joins:

### join-typen

| join-typ       | beschreibung                                                             |
| -------------- | ------------------------------------------------------------------------ |
| **inner join** | gibt nur datensätze zurück, die in beiden tabellen vorhanden sind        |
| **left join**  | gibt alle datensätze der linken tabelle zurück, plus treffer der rechten |
| **right join** | gibt alle datensätze der rechten tabelle zurück, plus treffer der linken |
| **full join**  | gibt alle datensätze aus beiden tabellen zurück                          |

### join-beispiele

#### inner join - nur gemeinsame einträge

verbindet zwei tabellen und zeigt **nur** die zeilen, die in beiden tabellen vorkommen.

**einfaches beispiel** (mit kurznamen):

```sql
-- k = kurzname für tbl_kunden, b = kurzname für tbl_bestellungen
select k.name, b.bestellnr, b.datum
from tbl_kunden as k
inner join tbl_bestellungen as b on k.k_id = b.k_id;
```

**gleiche abfrage** (aber mit vollständigen spaltennamen, leichter lesbar):

```sql
select tbl_kunden.name, tbl_bestellungen.bestellnr, tbl_bestellungen.datum
from tbl_kunden
inner join tbl_bestellungen on tbl_kunden.k_id = tbl_bestellungen.k_id;
```

**was passiert**:

- die beiden tabellen werden über die gemeinsame `k_id` verbunden
- `k.name` = "name aus der kunden-tabelle"
- `b.bestellnr` = "bestellnummer aus der bestellungen-tabelle"
- `on k.k_id = b.k_id` bedeutet: "verbinde zeilen wo die kundenid gleich ist"
- kunden ohne bestellungen werden **nicht angezeigt** (weil inner join nur übereinstimmungen zeigt)
- jede bestellung wird mit ihrem kundennamen angezeigt

#### left join - alle aus der linken tabelle

zeigt **alle** datensätze aus der linken tabelle (erste genannt tabelle) und versucht sie mit der rechten zu verbinden.

**einfaches beispiel**:

```sql
select k.name, b.bestellnr, b.datum
from tbl_kunden as k
left join tbl_bestellungen as b on k.k_id = b.k_id;
```

**was passiert**:

- **alle** kunden werden angezeigt (auch die ohne bestellungen)
- wenn ein kunde bestellungen hat, werden die bestellungsdaten angezeigt
- wenn ein kunde **keine** bestellungen hat, sind die spalten `bestellnr` und `datum` leer (null)
- hilfreich um z.b. zu finden: "welche kunden haben noch nie bestellt?"

**beispiel ergebnis**:

```
name          | bestellnr  | datum
------------- | ---------- | ----------
Max Müller    | 001        | 2024-01-15
Max Müller    | 002        | 2024-02-10
Ana Schmidt   | NULL       | NULL        ← diese kundin hat nie bestellt
John Doe      | 003        | 2024-01-20
```

#### right join - alle aus der rechten tabelle

zeigt **alle** datensätze aus der rechten tabelle (zweite genannt tabelle) und versucht sie mit der linken zu verbinden.

**einfaches beispiel**:

```sql
select k.name, b.bestellnr, b.datum
from tbl_kunden as k
right join tbl_bestellungen as b on k.k_id = b.k_id;
```

**was passiert**:

- **alle** bestellungen werden angezeigt
- wenn die bestellung einem bekannten kunden zugeordnet ist, wird der kundenname angezeigt
- wenn die bestellung **keinem** bekannten kunden zugeordnet ist, sind die kundenspalten leer (null)

**hinweis**: right join ist selten nötig. meistens kann man die tabellen in der `from`-klausel einfach tauschen und left join verwenden.

#### full join - alles kombinieren

zeigt **alle** datensätze aus beiden tabellen. (⚠️ nicht in allen datenbanken unterstützt, z.b. mysql!)

**einfaches beispiel**:

```sql
select k.name, b.bestellnr, b.datum
from tbl_kunden as k
full join tbl_bestellungen as b on k.k_id = b.k_id;
```

**was passiert**:

- **alle** kunden und **alle** bestellungen werden angezeigt
- kunden mit bestellungen: zeigen ihre daten zusammen
- kunden ohne bestellungen: zeigen ihre daten mit leeren bestellungsspalten (null)
- bestellungen von unbekannten kunden: zeigen die bestellungsdaten mit leeren kundenspalten (null)

**wenn deine datenbank full join nicht unterstützt** (z.b. mysql), kannst du es so machen:

```sql
-- left join kombiniert mit right join
select k.name, b.bestellnr, b.datum
from tbl_kunden as k
left join tbl_bestellungen as b on k.k_id = b.k_id
union
select k.name, b.bestellnr, b.datum
from tbl_kunden as k
right join tbl_bestellungen as b on k.k_id = b.k_id;
```

### alias für bessere lesbarkeit

verwende kurze namen (alias) für tabellen zur besseren lesbarkeit. kurze namen sparen tipparbeit:

```sql
-- alias definieren mit "as"
select k.k_id, k.name, r.rechnungsnr, r.datum
from tbl_kunden as k  -- k ist kurzname für tbl_kunden
join tbl_rechnung as r on k.k_id = r.k_id;  -- r ist kurzname für tbl_rechnung, "on" verbindet über die id

-- oder ohne "as" (funktioniert auch):
select k.k_id, k.name, r.rechnungsnr, r.datum
from tbl_kunden k
join tbl_rechnung r on k.k_id = r.k_id;
```

**erklärung der on-bedingung**: `on k.k_id = r.k_id` bedeutet "verbinde die beiden tabellen dort, wo die kundenid in beiden tabellen übereinstimmt"

## 🔢 funktionen & operatoren

### aggregatfunktionen

funktionen, die mehrere zeilen zu einem ergebnis kombinieren:

| funktion        | bedeutung                               | beispiel                                                  |
| --------------- | --------------------------------------- | --------------------------------------------------------- |
| `count()`       | zählt die zeilen/datensätze             | `select count(*) from tbl_produkte;` → gibt anzahl zurück |
| `count(spalte)` | zählt nur nicht-leere einträge          | `select count(beschreibung) from tbl_produkte;`           |
| `avg()`         | berechnet den durchschnitt einer spalte | `select avg(preis) from tbl_produkte;` → mittlerer preis  |
| `min()`         | findet den kleinsten wert               | `select min(preis) from tbl_produkte;` → günstigstes      |
| `max()`         | findet den größten wert                 | `select max(preis) from tbl_produkte;` → teuerster        |
| `sum()`         | addiert alle werte einer spalte         | `select sum(menge) from tbl_bestellungen;` → total        |

**beispiele**:

```sql
-- wie viele produkte haben wir?
select count(*) as anzahl_produkte from tbl_produkte;

-- wie ist der durchschnittliche preis?
select avg(preis) as durchschnittspreis from tbl_produkte;

-- welches ist das teuerste und günstigste produkt?
select min(preis) as guentigstes, max(preis) as teuerste from tbl_produkte;
```

### wichtige where-bedingungen

bedingungen um daten zu filtern:

| bedingung       | beschreibung                  | code-beispiel                                  |
| --------------- | ----------------------------- | ---------------------------------------------- |
| **=**           | genau gleich                  | `where preis = 99.99`                          |
| **<>, !=**      | nicht gleich                  | `where status <> 'archiviert'`                 |
| **>**           | größer als                    | `where preis > 50`                             |
| **<**           | kleiner als                   | `where alter < 18`                             |
| **>=, <=**      | größer/kleiner oder gleich    | `where preis >= 100` oder `alter <= 65`        |
| **like**        | text-vergleich mit wildcards  | `where name like "m%"` (m am anfang)           |
| **like**        | mit % überall                 | `where name like "%schmidt"` (schmidt am ende) |
| **like**        | mit % überall                 | `where email like "%@gmail.com"` (enthält)     |
| **between**     | werte in einem bereich        | `where preis between 10 and 100` (10 bis 100)  |
| **in**          | wert in liste enthalten       | `where abteilung in ("it", "hr", "verkauf")`   |
| **is null**     | auf leere werte prüfen        | `where beschreibung is null`                   |
| **is not null** | auf nicht-leere werte prüfen  | `where beschreibung is not null`               |
| **and**         | beide bedingungen erfüllen    | `where preis > 50 and kategorie = "buch"`      |
| **or**          | eine der bedingungen erfüllen | `where status = "neu" or preis < 20`           |
| **not**         | bedingung umkehren            | `where not (kategorie = "archiv")`             |

**beispiele**:

```sql
-- alle produkte über 50€
select * from tbl_produkte where preis > 50;

-- alle kunden mit names beginnend mit 'm'
select * from tbl_kunden where name like "m%";

-- alle bestellungen zwischen januar und märz
select * from tbl_bestellungen where datum between "2024-01-01" and "2024-03-31";

-- alle produkte die nicht archiviert sind
select * from tbl_produkte where status != 'archiviert';

-- produkte die teuer sind UND in kategorie elektronik
select * from tbl_produkte where preis > 500 and kategorie = "elektronik";

-- produkte die günstig ODER beliebt sind
select * from tbl_produkte where preis < 20 or popularitaet > 1000;
```
