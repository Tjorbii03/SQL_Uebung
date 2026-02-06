@echo off
:: BESCHREIBUNG: Startet SQLite mit der init.sql Konfiguration (Windows)

:: ACHTUNG: Bitte hier deinen absoluten Pfad eintragen!
:: Beispiel: C:\Users\Name\Desktop\Projekt\datenbank.db
set DB_PATH="C:\DEIN\PFAD\deine_datenbank.db"
set INIT_PATH="C:\DEIN\PFAD\init.sql"

sqlite3.exe -init %INIT_PATH% %DB_PATH%
pause
