
# LernKarten Game

Dieses Projekt ist ein webbasiertes Lernkartenspiel, mit dem Benutzer Kartensätze durchsehen, Fragen beantworten und Antworten anzeigen können. Es enthält zudem Funktionen zum Erstellen und Überprüfen von Karteneinträgen. Das System verwendet HTML, PHP und JavaScript, um Kartendaten zu verarbeiten und darzustellen.

## Features

- **Karten anzeigen**: Benutzer können Fragen durchsehen und Antworten anzeigen, indem sie Karten umdrehen.
- **Karteneinträge erstellen**: Es gibt Formulare zum Hinzufügen neuer Karten.
- **Karteneinträge prüfen**: Benutzer können Karteneinträge basierend auf der Fragen-ID und dem Kartensatz abfragen.
- **Benutzerdefinierte Formatierungen**: Antworten und Fragen unterstützen Linebreaks sowie fettgedruckten Text durch Eingabe von `#Wort#`. Hochgeladene Bilder können ebenfalls dargestellt werden.

## Vorraussetzungen
- Webserver (Apache, Nginx etc.)
- PHP 7.x oder höher
- MySQL-Datenbank (importiere `learn_cards.sql` in deine Datenbank)
- Optional: XAMPP für die lokale Entwicklung


## Verzeichnisstruktur

```bash
LEARNCARD-GAME
│   index.html            # Hauptspiel-Seite
│   learn_cards.sql        # SQL-Datei für die Kartendatenbank
│
├───AddCards
│       addCard.html       # Formular zum Hinzufügen von Karten
│       index.html         # Index-Seite für Kartenerstellung
│       insert_card.php    # PHP zum Einfügen neuer Karten in die Datenbank
│       mysql.php          # MySQL Verbindungsdetails
│       queryCard.html     # Formular zum Abfragen von Karten
│       query_card.php     # PHP-Skript für Kartenabfragen
│
├───fonts                  # Schriftarten, einschließlich FontAwesome
│       Braille_deutsch.ttf
│       fontawesome-webfont.eot
│       ...
│
├───img                    # Bilder für Karten
│       A1-1.jpg
│       Hase1.png
│       ...
│
├───less                   # Less-Dateien für das CSS-Styling
│       animated.less
│       font-awesome.less
│       ...
│
├───scripts                # Skripte für das Spiel
│       mysql.php          # MySQL Verbindungsdetails (Duplikat)
│       query_card.php     # PHP-Skript für Kartenabfragen
│       script.js          # Haupt-JavaScript für das Spiel
│
├───scss                   # SCSS-Dateien für das Styling
│       font-awesome.scss
│       _core.scss
│       ...
│
└───styles                 # CSS-Dateien für das Projekt
        font-awesome.min.css
        style.css          # Haupt-CSS-Datei für das Layout
```

## Installation

1. **Clone das Repository**:

    ```bash
    git clone GITHUB LINK
    ```

2. **Abhängigkeiten installieren**:
   Du benötigst einen lokalen oder entfernten Webserver mit PHP-Unterstützung, z. B. XAMPP, LAMP oder einen Cloud-Hoster wie Heroku. Stelle sicher, dass der Server PHP und eine Datenbank (z. B. MySQL) unterstützt, falls nötig.

3. **MySQL-Datenbank einrichten**:
    Importiere die `learn_cards.sql` in deine MySQL-Datenbank. Diese Datei enthält die Tabellenstruktur für die Karteneinträge.

    ```sql
    mysql -u benutzername -p datenbankname < learn_cards.sql
    ```

4. **Konfiguriere die MySQL-Verbindung**:
   Passe die Datenbankzugangsdaten in der Datei `AddCards/mysql.php` sowie in `scripts/mysql.php` an deine Umgebung an.

5. **Projekt auf deinem Server hosten**:
   Kopiere alle Dateien in das Webverzeichnis deines Servers. Stelle sicher, dass die PHP-Dateien korrekt verarbeitet werden.

6. **Starte den Webserver**:
   Stelle sicher, dass der Webserver läuft und auf den entsprechenden Ordner zeigt.

## Nutzung

### Spielseite (`index.html`)

- **Beschreibung**: Die Hauptseite zeigt die Karten des Spiels an. Nutzer können durch die Fragen navigieren, die Karten drehen, um die Antwort zu sehen, und zur nächsten Frage wechseln.
- **Besondere Features**:
  - Fragen und Antworten unterstützen benutzerdefinierte Formatierung.
  - Bilder, die zu Fragen oder Antworten hinzugefügt wurden, können durch Anklicken vergrößert werden.
  
### Karten hinzufügen (`AddCards/addCard.html`)

- **Beschreibung**: Diese Seite erlaubt es, neue Karteneinträge hinzuzufügen.
- **Felder**:
  - `Kartensatz`: Der Kartensatz, zu dem die Frage gehört.
  - `Fragen-ID`: Die eindeutige ID der Frage.
  - `Titel`: Der Titel der Karte.
  - `Frage`: Die Frage selbst (Unterstützt Linebreaks und Fettdruck).
  - `Antwort`: Die zugehörige Antwort (ebenfalls mit Linebreaks und Fettdruck).
  - Optional: Hochladen von Frage- und Antwortbildern.

### Karten abfragen (`AddCards/queryCard.html`)

- **Beschreibung**: Auf dieser Seite können Nutzer Karteneinträge basierend auf Kartensatz und Frage-ID abfragen.
- **Felder**:
  - `Kartensatz`: Der Kartensatz, zu dem die Karte gehört.
  - `Fragen-ID`: Die ID der Frage.

## Kartenlogik

Die Kartenlogik wird durch das JavaScript in `script.js` gesteuert:

- **flipCard()**: Dreht die Karte um, um zwischen Frage und Antwort zu wechseln.
- **nextQuestion()**: Lädt die nächste Frage.
- **Custom Formatting**: Linebreaks in Fragen und Antworten werden durch Eingabe von `\n` automatisch erkannt, und Wörter zwischen `#` werden fettgedruckt dargestellt.
- **Bildvergrößerung**: Durch Anklicken der Bilder auf der Karte können diese vergrößert angezeigt werden.
