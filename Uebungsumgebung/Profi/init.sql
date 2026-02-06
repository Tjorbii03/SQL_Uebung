/* ============================================================
   SQLITE PROFI-KONFIGURATION (init.sql)
   Anleitung: Entferne das '--' vor einem Befehl, um ihn zu aktivieren.
   ============================================================ */

/* --- OPTIK & DARSTELLUNG --- */
.headers on           -- Zeigt Spaltennamen über den Daten an
.mode box             -- Aktiviert moderne Tabellenrahmen (Unicode)
-- .mode columns      -- Klassische Spaltenansicht (Alternative zu 'box')
-- .mode markdown     -- Ergebnisse direkt als GitHub-Tabelle ausgeben

/* --- DATEN-HANDLING --- */
.nullvalue "[NULL]"   -- Zeigt [NULL] an, damit man leere Felder von Leerstrings unterscheidet
-- .emptyvalue "[EMPTY]" -- Kennzeichnet komplett leere Tabellen

/* --- PERFORMANCE & FEEDBACK --- */
.timer on             -- Zeigt nach jeder Abfrage die benötigte Zeit an (ms)
-- .stats on          -- Zeigt CPU- und Speicherverbrauch der Abfrage
-- .echo on           -- Zeigt den eingegebenen SQL-Befehl vor dem Ergebnis nochmal an

/* --- SYSTEM-EINSTELLUNGEN --- */
.dbconfig defensive on -- Schutzmodus: Verhindert versehentliches Löschen von Systemtabellen
.prompt "sqlite> " "   ...> " -- Ein übersichtlicherer Eingabe-Prompt
