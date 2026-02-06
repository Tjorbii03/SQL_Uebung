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
    cd /pfad/zum/projekt/Uebungsumgebung
    ```

2.  **Datenbank aufsetzen**:
    Führe den folgenden Befehl aus. Er erstellt eine neue Datenbankdatei namens `Uebungsdatenbank.db` und füllt sie mit den Tabellen und Beispieldaten aus dem `02_Setup_Datenbank.sql`-Skript.
    ```bash
    sqlite3 Uebungsdatenbank.db < 02_Setup_Datenbank.sql
    ```
    Danach befindet sich eine neue Datei `Uebungsdatenbank.db` im Ordner. Dies ist deine lokale SQL-Datenbank. der Pfeil (>) oder (<) beschreibt die Richtung aus welcher datei die neue erstellt werden soll

---

### 3. Mit der Datenbank arbeiten

Um die SQL-Aufgaben zu lösen, musst du dich mit deiner Datenbank verbinden.

1.  **Starte die `sqlite3`-Kommandozeile**:

    ```bash
    sqlite3 Uebungsdatenbank.db
    ```

    Dein Terminal-Prompt ändert sich zu `sqlite>`.

2.  **Optimiere die Anzeige (das ist keine Vorraussetzung, nur eine Empfehlung)**:
    Damit die Abfrageergebnisse als saubere, lesbare Tabelle angezeigt werden, führe diese beiden Befehle aus:

    ```sql
    .header on
    .mode column
    ```

3.  **Terminal bereinigen**
    Du kannst dein SQL Terminal bereinigen wenn dir der bildschirm zu voll wird:

    ```sql
    .shell clear
    ```

4.  **SQL-Abfragen ausführen**:
    Du kannst nun SQL-Befehle direkt eingeben. Jede Anweisung muss mit einem Semikolon (`;`) abgeschlossen werden.

    **Beispiel:**

    ```sql
    SELECT Vorname, Stadt FROM Kunden WHERE Stadt = 'Berlin';
    ```

5.  **Die `sqlite3`-Sitzung beenden**:
    Um zur normalen Kommandozeile zurückzukehren, gib `.quit` ein:
    ```sql
    .quit
    ```
    Die Datenbank-Datei `Uebungsdatenbank.db` bleibt erhalten. Du kannst dich jederzeit wieder mit ihr verbinden, um weiterzuüben.

**🛠️ Profi-Setup: Die Datenbank-Umgebung nutzen**
Für die, die nicht immer den gleichen Kram eingeben wollen:
In diesem Repository befinden sich Dateien, die dir das Leben mit der SQLite-Konsole deutlich erleichtern. Anstatt jedes Mal manuell die Anzeige zu optimieren, sorgen diese Skripte für eine schicke, tabellarische Ansicht und nützliche Zusatzinfos bei jedem Start.

**1. Die Konfigurationsdatei (`init.sql`)**
Diese Datei enthält die "Konfiguration" für dein Terminal. Du kannst die datei Öffnen
und selber die anpassungen vornehmen die für dich gut sind.

**2. Das Start Script**
Du bist Linux oder Mac nutzer, dann lösche bitte die `start_db.bat` Datei.

Damit die init.sql automatisch geladen wird, nutzt du am besten das Scrip. **Wichtig**: Du musst in den Dateien den absoluten Pfad zu deinem Projektverzeichnis einmalig anpassen, damit die Dateien gefunden werden, egal aus welchem Ordner du das Skript aufrufst.

_Hinweis:_
Unter Linux oder macOS muss man ein scrip immer ausführbar machen, das macht man mit:
`chmod +x /pfad/zu/deiner/Datei/start_db.sh`

**Hinweise**

- Wenn ihr eure lösung dokumentieren wollt empfehle ich eine .md datei und dann auch
  in der `init.sql` die ausgabe als markdown wählen
- Außerdem empfehle ich `.echo on`
