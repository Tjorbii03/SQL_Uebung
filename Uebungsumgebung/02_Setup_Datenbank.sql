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

-- Zusätzliche Daten
INSERT INTO Kunden (Vorname, Nachname, Email, Stadt, RegistriertSeit) VALUES
('Laura', 'Pohl', 'laura@mail.com', 'Stuttgart', '2022-11-01'),
('Chris', 'Beck', 'chris@mail.com', 'Dortmund', '2022-12-01'),
('Tina', 'Fischer', 'tina@mail.de', 'Dresden', '2023-01-05'),
('Jan', 'Richter', 'jan@mail.com', 'Bremen', '2023-02-10'),
('Susanne', 'Graf', 'susanne@mail.de', 'Nürnberg', '2023-03-15'),
('Martin', 'Wolf', 'martin@mail.com', 'Hannover', '2023-04-20'),
('Heike', 'Sauer', 'heike@mail.de', 'Bochum', '2023-05-25'),
('Dirk', 'Lange', 'dirk@mail.com', 'Wuppertal', '2023-06-30');

INSERT INTO Mitarbeiter (Vorname, Nachname, Abteilung, Gehalt) VALUES
('Sandra', 'Vogel', 'Marketing', 3200.00),
('Frank', 'Sommer', 'IT', 4500.00),
('Petra', 'Winter', 'Buchhaltung', 3800.00),
('Uwe', 'Herbst', 'Lager', 2900.00);

INSERT INTO Produkte (Produktname, Kategorie, Preis) VALUES
('Gaming PC', 'Elektronik', 2100.00),
('Mechanische Tastatur', 'Elektronik', 150.00),
('Ergonomischer Bürostuhl', 'Möbel', 350.00),
('Design-Regal', 'Möbel', 180.00),
('Data Science Handbuch', 'Bücher', 55.00),
('Clean Code', 'Bücher', 40.00),
('Espressomaschine', 'Küche', 399.00),
('Standmixer', 'Küche', 89.00),
('Smartwatch', 'Elektronik', 250.00),
('Noise-Cancelling-Kopfhörer', 'Elektronik', 199.00);

INSERT INTO Lagerbestand VALUES (7, 100, 'A3'), (8, 80, 'A4'), (9, 20, 'D1'), (10, 30, 'D2'), (11, 15, 'C3'), (12, 5, 'C4'), (13, 50, 'A5'), (14, 25, 'B4'), (15, 40, 'E1'), (16, 8, 'E2'), (17, 30, 'E3'), (18, 20, 'F1'), (19, 12, 'F2'), (20, 22, 'G1');

INSERT INTO Bestellungen (FK_KundenID, FK_MitarbeiterID, Bestelldatum, Status) VALUES
(4, 2, '2023-10-12', 'Versandt'),
(6, 4, '2023-10-18', 'In Bearbeitung'),
(8, 1, '2023-11-05', 'Versandt'),
(9, 3, '2023-11-10', 'Offen'),
(10, 2, '2023-11-25', 'Storniert'),
(12, 4, '2023-12-08', 'Versandt'),
(14, 1, '2024-01-02', 'Offen'),
(15, 3, '2024-01-05', 'In Bearbeitung'),
(1, 1, '2024-01-06', 'Versandt'),
(2, 2, '2024-01-07', 'Versandt'),
(4, 3, '2024-01-08', 'Offen');

INSERT INTO Bestellpositionen (FK_BestellID, FK_ProduktID, Menge) VALUES
(5, 12, 1),
(6, 15, 2),
(7, 8, 1),
(7, 9, 1),
(8, 18, 1),
(9, 20, 1),
(10, 1, 1),
(11, 11, 3),
(12, 14, 1),
(13, 2, 2),
(14, 1, 1),
(14, 20, 1),
(15, 17, 1);

INSERT INTO Produktbewertungen (FK_ProduktID, Sterne, Kommentar) VALUES
(3, 4, 'Gute Tastatur, aber etwas laut.'),
(5, 5, 'Sehr bequem, den Preis wert.'),
(8, 5, 'Das beste Buch zum Thema!'),
(11, 2, 'Nach 2 Wochen defekt.'),
(12, 5, 'Perfekter Espresso!'),
(15, 4, 'Leise und effektiv.'),
(17, 5, 'Super Stuhl!'),
(20, 3, 'Guter Klang, aber der Akku ist schwach.');