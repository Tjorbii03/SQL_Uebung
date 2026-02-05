# Anleitung für Linux & macOS: SQL-Übungsumgebung

Dieses Dokument erklärt, wie du die SQL-Übungsdatenbank unter Linux oder macOS einrichtest und nutzt.

---

### 1. `sqlite3` installieren

`sqlite3` ist ein einfaches, dateibasiertes SQL-Datenbanksystem, das ideal zum Lernen ist. Die meisten Linux-Distributionen und macOS haben es bereits vorinstalliert.

**Überprüfe die Installation**, indem du ein Terminal öffnest und diesen Befehl eingibst:
```bash
sqlite3 --version
```
Wenn eine Versionsnummer angezeigt wird (z.B. `3.37.2`), ist alles bereit. Andernfalls installiere es wie folgt:

- **Für Debian / Ubuntu / Mint:**
  ```bash
  sudo apt update
  sudo apt install sqlite3
  ```
- **Für Fedora / CentOS / RHEL:**
  ```bash
  sudo dnf install sqlite3
  ```
- **Für macOS (mit [Homebrew](https://brew.sh/index_de)):**
  ```bash
  brew install sqlite3
  ```

---

### 2. Datenbank erstellen

1.  **Navigiere zum Projektordner**:
    Öffne ein Terminal und wechsle in das Verzeichnis, in dem die SQL-Skripte (`02_Setup_Datenbank.sql` etc.) liegen.
    ```bash
    # Ersetze den Pfad durch den tatsächlichen Pfad zum Projektordner
    cd /pfad/zum/projekt/SQL
    ```

2.  **Datenbank aufsetzen**:
    Führe den folgenden Befehl aus. Er erstellt eine neue Datenbankdatei namens `Uebungsdatenbank.db` und füllt sie mit den Tabellen und Beispieldaten aus dem `02_Setup_Datenbank.sql`-Skript.
    ```bash
    sqlite3 Uebungsdatenbank.db < 02_Setup_Datenbank.sql
    ```
    Danach befindet sich eine neue Datei `Uebungsdatenbank.db` im Ordner. Dies ist deine lokale SQL-Datenbank.

---

### 3. Mit der Datenbank arbeiten

Um die SQL-Aufgaben zu lösen, musst du dich mit deiner Datenbank verbinden.

1.  **Starte die `sqlite3`-Kommandozeile**:
    ```bash
    sqlite3 Uebungsdatenbank.db
    ```
    Dein Terminal-Prompt ändert sich zu `sqlite>`.

2.  **Optimiere die Anzeige (Empfehlung)**:
    Damit die Abfrageergebnisse als saubere, lesbare Tabelle angezeigt werden, führe diese beiden Befehle aus:
    ```sql
    .header on
    .mode column
    ```

3.  **SQL-Abfragen ausführen**:
    Du kannst nun SQL-Befehle direkt eingeben. Jede Anweisung muss mit einem Semikolon (`;`) abgeschlossen werden.

    **Beispiel:**
    ```sql
    SELECT Vorname, Stadt FROM Kunden WHERE Stadt = 'Berlin';
    ```

4.  **Die `sqlite3`-Sitzung beenden**:
    Um zur normalen Kommandozeile zurückzukehren, gib `.quit` ein:
    ```sql
    .quit
    ```
    Die Datenbank-Datei `Uebungsdatenbank.db` bleibt erhalten. Du kannst dich jederzeit wieder mit ihr verbinden, um weiterzuüben.
