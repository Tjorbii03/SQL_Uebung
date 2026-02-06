#!/bin/bash
# BESCHREIBUNG: Startet SQLite mit der init.sql Konfiguration

# ACHTUNG: Bitte hier deinen absoluten Pfad eintragen!
# Beispiel: /home/user/mein_projekt/datenbank.db
DB_PATH="/DEIN/ABSOLUTER/PFAD/deine_datenbank.db"
INIT_PATH="/DEIN/ABSOLUTER/PFAD/init.sql"

sqlite3 -init "$INIT_PATH" "$DB_PATH"
