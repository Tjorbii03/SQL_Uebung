-- Erweitertes SQL-Skript für die Übungsdatenbank v2.0
PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS Produktbewertungen;
DROP TABLE IF EXISTS Lagerbestand;
DROP TABLE IF EXISTS Bestellpositionen;
DROP TABLE IF EXISTS Bestellungen;
DROP TABLE IF EXISTS Produkte;
DROP TABLE IF EXISTS Mitarbeiter;
DROP TABLE IF EXISTS Kunden;

-- Kunden
CREATE TABLE Kunden (
    KundenID INTEGER PRIMARY KEY AUTOINCREMENT,
    Vorname TEXT NOT NULL,
    Nachname TEXT NOT NULL,
    Email TEXT UNIQUE NOT NULL,
    Stadt TEXT,
    RegistriertSeit DATE DEFAULT CURRENT_DATE
);

-- Mitarbeiter (NEU)
CREATE TABLE Mitarbeiter (
    MitarbeiterID INTEGER PRIMARY KEY AUTOINCREMENT,
    Vorname TEXT,
    Nachname TEXT,
    Abteilung TEXT,
    Gehalt DECIMAL(10,2)
);

-- Produkte
CREATE TABLE Produkte (
    ProduktID INTEGER PRIMARY KEY AUTOINCREMENT,
    Produktname TEXT NOT NULL,
    Kategorie TEXT NOT NULL,
    Preis DECIMAL(10, 2) NOT NULL
);

-- Lagerbestand (NEU - 1:1 oder 1:n Beziehung)
CREATE TABLE Lagerbestand (
    FK_ProduktID INTEGER PRIMARY KEY,
    Anzahl INTEGER DEFAULT 0,
    Regalnummer TEXT,
    FOREIGN KEY (FK_ProduktID) REFERENCES Produkte(ProduktID)
);

-- Bestellungen
CREATE TABLE Bestellungen (
    BestellID INTEGER PRIMARY KEY AUTOINCREMENT,
    FK_KundenID INTEGER NOT NULL,
    FK_MitarbeiterID INTEGER, -- Welcher Mitarbeiter hat die Bestellung bearbeitet?
    Bestelldatum DATE NOT NULL,
    Status TEXT DEFAULT 'Offen',
    FOREIGN KEY (FK_KundenID) REFERENCES Kunden(KundenID),
    FOREIGN KEY (FK_MitarbeiterID) REFERENCES Mitarbeiter(MitarbeiterID)
);

-- Bestellpositionen
CREATE TABLE Bestellpositionen (
    BestellpositionsID INTEGER PRIMARY KEY AUTOINCREMENT,
    FK_BestellID INTEGER NOT NULL,
    FK_ProduktID INTEGER NOT NULL,
    Menge INTEGER NOT NULL,
    FOREIGN KEY (FK_BestellID) REFERENCES Bestellungen(BestellID),
    FOREIGN KEY (FK_ProduktID) REFERENCES Produkte(ProduktID)
);

-- Produktbewertungen (NEU)
CREATE TABLE Produktbewertungen (
    BewertungsID INTEGER PRIMARY KEY AUTOINCREMENT,
    FK_ProduktID INTEGER,
    Sterne INTEGER CHECK (Sterne BETWEEN 1 AND 5),
    Kommentar TEXT,
    FOREIGN KEY (FK_ProduktID) REFERENCES Produkte(ProduktID)
);

-- DATEN EINFÜGEN
INSERT INTO Kunden (Vorname, Nachname, Email, Stadt, RegistriertSeit) VALUES
('Max', 'Mustermann', 'max@mail.de', 'Berlin', '2023-01-10'),
('Erika', 'Schmidt', 'erika@mail.de', 'Hamburg', '2023-02-15'),
('Hans', 'Meier', 'hans@mail.de', 'Berlin', '2023-03-20'),
('Sabine', 'Weber', 'sabine@mail.de', 'München', '2023-04-25'),
('Peter', 'Klein', 'peter@mail.de', 'Hamburg', '2023-05-30'),
('Anna', 'Schulz', 'anna@mail.de', 'Köln', '2023-06-05'),
('Tom', 'Bauer', 'tom@mail.de', 'Frankfurt', '2023-07-12'),
('Julia', 'Wagner', 'julia@mail.de', 'Leipzig', '2023-08-19');

INSERT INTO Mitarbeiter (Vorname, Nachname, Abteilung, Gehalt) VALUES
('Klaus', 'Diesel', 'Vertrieb', 3500.00),
('Monika', 'Lenz', 'Lager', 2800.00),
('Stefan', 'Raab', 'Vertrieb', 3600.00);

INSERT INTO Produkte (Produktname, Kategorie, Preis) VALUES
('Laptop Pro', 'Elektronik', 1299.00), ('Wireless Maus', 'Elektronik', 49.00),
('Tastatur', 'Elektronik', 89.00), ('Monitor 4K', 'Elektronik', 350.00),
('Schreibtisch', 'Möbel', 450.00), ('Bürostuhl', 'Möbel', 299.00),
('SQL Guide', 'Bücher', 30.00), ('Python Kochbuch', 'Bücher', 45.00),
('Kaffeemaschine', 'Küche', 120.00), ('Toaster', 'Küche', 35.00);

INSERT INTO Lagerbestand VALUES (1, 5, 'A1'), (2, 50, 'B2'), (3, 20, 'B3'), (4, 10, 'A2'), (5, 2, 'C1'), (6, 0, 'C2');

INSERT INTO Bestellungen (FK_KundenID, FK_MitarbeiterID, Bestelldatum, Status) VALUES
(1, 1, '2023-10-01', 'Versandt'), (2, 1, '2023-10-05', 'Versandt'), (3, 3, '2023-10-10', 'Offen'),
(1, 3, '2023-11-15', 'Versandt'), (5, 1, '2023-11-20', 'Storniert'), (7, 1, '2023-12-01', 'Versandt');

INSERT INTO Bestellpositionen (FK_BestellID, FK_ProduktID, Menge) VALUES
(1,1,1), (1,2,1), (2,7,2), (3,5,1), (3,6,1), (4,3,1), (4,4,1), (6,1,1), (6,10,2);

INSERT INTO Produktbewertungen (FK_ProduktID, Sterne, Kommentar) VALUES
(1, 5, 'Top Gerät!'), (1, 4, 'Etwas teuer'), (2, 5, 'Super Maus'), (7, 3, 'Zu theoretisch');