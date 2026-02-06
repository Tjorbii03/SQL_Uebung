# Anleitung für Windows: SQL-Übungsumgebung

Dieses Dokument erklärt, wie du die SQL-Übungsdatenbank unter Windows einrichtest und nutzt.

---

### 1. `sqlite3` für Windows herunterladen

Im Gegensatz zu Linux/macOS ist `sqlite3` bei Windows nicht vorinstalliert. Du musst es manuell hinzufügen.

1.  **Download-Seite öffnen**:
    Besuche die offizielle SQLite-Download-Seite: [https://www.sqlite.org/download.html](https://www.sqlite.org/download.html)

2.  **Precompiled Binaries for Windows**:
    Scrolle nach unten zum Abschnitt **"Precompiled Binaries for Windows"**. Lade die `.zip`-Datei für `sqlite-tools` herunter. Der Dateiname sieht typischerweise so aus: `sqlite-tools-win32-x86-xxxxxxx.zip`.

3.  **Dateien entpacken**:
    - Erstelle einen neuen, leicht zugänglichen Ordner, z.B. `C:\sqlite`.
    - Entpacke die heruntergeladene `.zip`-Datei. Du erhältst eine `sqlite3.exe`.
    - Verschiebe die `sqlite3.exe` in den Ordner `C:\sqlite`.

4.  **Zu `Path` hinzufügen (WICHTIG!)**:
    Damit du `sqlite3` von überall in der Kommandozeile aufrufen kannst, musst du den Ordner zum Systempfad (`Path`) hinzufügen.
    - Öffne das Startmenü und suche nach `Umgebungsvariablen für dieses Konto bearbeiten`.
    - Wähle in der oberen Liste die Variable `Path` aus und klicke auf `Bearbeiten...`.
    - Klicke auf `Neu` und füge den Pfad zu deinem `sqlite3`-Ordner hinzu: `C:\sqlite`.
    - Bestätige alle Fenster mit `OK`.

5.  **Installation überprüfen**:
    Öffne eine **neue** Kommandozeile (CMD oder PowerShell) und gib ein:
    ```cmd
    sqlite3 --version
    ```
    Wenn eine Versionsnummer angezeigt wird, war die Einrichtung erfolgreich!

---

### 2. Datenbank erstellen

1.  **Navigiere zum Projektordner**:
    Öffne die Kommandozeile (CMD oder PowerShell) und wechsle in das Verzeichnis, in dem die SQL-Skripte (`02_Setup_Datenbank.sql` etc.) liegen.

    ```cmd
    # Ersetze den Pfad durch den tatsächlichen Pfad zum Projektordner
    cd C:\Pfad\zum\Projekt\SQL
    ```

2.  **Datenbank aufsetzen**:
    Führe den folgenden Befehl aus. Er erstellt `Uebungsdatenbank.db` und füllt sie mit Daten.
    ```cmd
    sqlite3 Uebungsdatenbank.db < 02_Setup_Datenbank.sql
    ```
    Danach befindet sich eine neue Datei `Uebungsdatenbank.db` im Ordner.

---

### 3. Mit der Datenbank arbeiten

1.  **Starte die `sqlite3`-Kommandozeile**:

    ```cmd
    sqlite3 Uebungsdatenbank.db
    ```

    Dein Kommandozeilen-Prompt ändert sich zu `sqlite>`.

2.  **Optimiere die Anzeige (Empfehlung)**:
    Für eine tabellarische Ansicht der Ergebnisse:

    ```sql
    .header on
    .mode column
    ```

3.  **Terminal bereinigen**
    Du kannst dein SQL Terminal bereinigen wenn dir der bildschirm zu voll wird:

    ```sql
    .shell cls
    ```

4.  **SQL-Abfragen ausführen**:
    Jede Anweisung muss mit einem Semikolon (`;`) enden.

    ```sql
    SELECT Vorname, Stadt FROM Kunden WHERE Stadt = 'Berlin';
    ```

5.  **Die `sqlite3`-Sitzung beenden**:
    ```sql
    .quit
    ```
    Die Datenbank `Uebungsdatenbank.db` bleibt gespeichert.

**🛠️ Profi-Setup: Die Datenbank-Umgebung nutzen**
Für die, die nicht immer den gleichen Kram eingeben wollen:
In diesem Repository befinden sich Dateien, die dir das Leben mit der SQLite-Konsole deutlich erleichtern. Anstatt jedes Mal manuell die Anzeige zu optimieren, sorgen diese Skripte für eine schicke, tabellarische Ansicht und nützliche Zusatzinfos bei jedem Start.

**1. Die Konfigurationsdatei (`init.sql`)**
Diese Datei enthält die "Konfiguration" für dein Terminal. Du kannst die datei Öffnen
und selber die anpassungen vornehmen die für dich gut sind.

**2. Das Start Script**
Du bist Windows nutzer, dann lösche bitte die `start_db.sh` datei.

Damit die init.sql automatisch geladen wird, nutzt du am besten das Scrip. **Wichtig**: Du musst in den Dateien den absoluten Pfad zu deinem Projektverzeichnis einmalig anpassen, damit die Dateien gefunden werden, egal aus welchem Ordner du das Skript aufrufst.

**Hinweise**

- Wenn ihr eure lösung dokumentieren wollt empfehle ich eine .md datei und dann auch
  in der `init.sql` die ausgabe als markdown wählen
- Außerdem empfehle ich `.echo on`
