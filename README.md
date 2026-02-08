# SQL-Übungsumgebung

Willkommen in der SQL-Übungsumgebung! Dieses Projekt bietet eine einfache und effektive Möglichkeit, grundlegende bis fortgeschrittene SQL-Kenntnisse zu erlernen und zu vertiefen.

Es verwendet `sqlite3`, eine leichtgewichtige, dateibasierte Datenbank, die keine komplexe Server-Installation erfordert.

---

## Empfohlene Arbeitsumgebung: Visual Studio Code

Für die beste Erfahrung mit diesem Projekt empfehle ich die Verwendung von **Visual Studio Code** zusammen mit einigen praktischen Erweiterungen.

### Empfohlene VS Code Extensions

1.  **SQLite Viewer** (`florian-klampfer.sqlite-viewer`)
    - **Zweck**: Erlaubt dir, die `Uebungsdatenbank.db` direkt in VS Code zu öffnen, die Tabellen zu durchsuchen und SQL-Abfragen auszuführen.
    - **Installation**:
      1.  Öffne VS Code.
      2.  Gehe zum Extensions-Tab (Ctrl+Shift+X).
      3.  Suche nach `florian-klampfer.sqlite-viewer` und klicke auf "Install".
    - **Benutzung**:
      - Nach der Installation, klicke mit der rechten Maustaste auf die `Uebungsdatenbank.db` Datei im Explorer und wähle "Open in SQLite Viewer".
      - Ein neuer Tab öffnet sich, in dem du die Datenbank inspizieren und Abfragen testen kannst.

2.  **Markdown All in One** (`yzhang.markdown-all-in-one`)
    - **Zweck**: Verbessert die Lesbarkeit und Bearbeitung der `.md`-Dateien (wie diese hier).
    - **Installation**:
      1.  Gehe zum Extensions-Tab.
      2.  Suche nach `yzhang.markdown-all-in-one` und klicke auf "Install".
    - **Benutzung**:
      - Öffne eine `.md`-Datei.
      - Verwende die Tastenkombination `Ctrl+Shift+V`, um eine Vorschau der Markdown-Datei zu öffnen.

---

## Projektstruktur

- `📂 Uebungsumgebung/`: Enthält alle Dateien, die du für die Übungen benötigst.
  - `📂 01_Theorie_und_Syntax/`: Eine kompakte Zusammenfassung der wichtigsten SQL-Befehle.
    - `📝Befehlsreferenz.md`
  - `⚙️ 02_Setup_Datenbank.sql`: Das Skript zum Erstellen der Datenbank.
  - `📝 Aufgaben.md`: Der Aufgabenkatalog.
  - `✅ Lösungen.md`: Die Lösungs-Skripte.

- `📂 Anleitungen/`: Enthält detaillierte Anleitungen zur Einrichtung.
  - [Anleitung für Windows](Anleitungen/Anleitung_Windows.md)
  - [Anleitung für Linux & macOS](Anleitungen/Anleitung_Linux_macOS.md)

---

## Erste Schritte

1.  **Lade das Projekt herunter** oder klone es über Git.
2.  Öffne den Ordner `Anleitungen` und folge der Anleitung für dein Betriebssystem, um die `Uebungsdatenbank.db` im Ordner `Uebungsumgebung` zu erstellen.
3.  Öffne die `Uebungsumgebung/01_Theorie_und_Syntax.md`, um die Grundlagen aufzufrischen.
4.  Beginne mit den `Uebungsumgebung/Aufgaben.md` und überprüfe deine Ergebnisse mit den `Uebungsumgebung/Lösungen.md`.
