-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Erstellungszeit: 06. Sep 2024 um 09:19
-- Server-Version: 10.5.23-MariaDB-0+deb11u1
-- PHP-Version: 8.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `learn_cards`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cards`
--

CREATE TABLE `cards` (
  `id` int(11) NOT NULL,
  `card_set` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `difficulty` int(11) NOT NULL,
  `title` varchar(512) NOT NULL,
  `question` varchar(4048) NOT NULL,
  `qimage` varchar(512) NOT NULL DEFAULT 'none',
  `answer` varchar(4048) NOT NULL,
  `aimage` varchar(512) NOT NULL DEFAULT '''none'''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `cards`
--

INSERT INTO `cards` (`id`, `card_set`, `question_id`, `difficulty`, `title`, `question`, `qimage`, `answer`, `aimage`) VALUES
(1, 1, 1, 1, 'Planen, Vorbereiten und Durchführung von Arbeitsaufgaben', 'Mit welchen Werkzeug kann man ein Projekt planen und überwachen?', 'none', 'Zum Beispiel mithilfe eines #Netzplans#, eines #Gantt-Diagramms# oder eines #Projektstrukturplans# können Projekte gemanagt und überwacht werden.', '../img/A1-1.jpg'),
(2, 1, 2, 1, 'Planen, Vorbereiten und Durchführung von Arbeitsaufgaben', 'Was ist ein Netzplan im Projektmanagement', 'none', 'Der Netzplan hilft bei der Terminplanung von Projekten und stell die Dauer von Vorgängen im Gesamtprojekt grafisch dar.\\r\\n\nSowohl die zeitliche Anordnung als auch logische Abhängigkeiten zwischen den einzelnen Vorgängen werden mithilfe von Rechtecken dargestellt. Alle Vorgänge im Projekt werden als Pfad mit Pfeilen verbunden.\n\\r\\n\nKritische Pfade und Pufferzeiten der einzelnen Vorgänge sowie Gesamtpufferzeiten sind im Netzplan jeweils gekennzeichnet.', '../img/A1-2.jpg'),
(3, 1, 3, 1, 'Planen, Vorbereiten und Durchführung von Arbeitsaufgaben', 'Was ist ein Gantt-Diagramm?', 'none', 'In einem #Gantt-Diagramm# werden alle Aktivitäten eines Projektes mit Hilfe einer Zeitachse dargestellt. Die Zeitachse wird horizontal in der ersten Zeile des Diagramms dargestellt. Alle Aktivitäten werden dann in den darunter liegenden Zeilen in der ersten Spalte benannt und zeitlich mit einem waagerechten Balken dargestellt. An der Länge der Balken kann die Dauer, der Beginn und das Ende der Aktivität erkannt werden. Sich überschneidende Aktivitäten werden durch überlappende Balken dargestellt. Eine Visualisierung des kritischen Pfades ist möglich. Abhängigkeiten zwischen den einzelnen Aktivitäten werden mit Hilfe von Pfeilen verdeutlicht.\r\n#Vorteil#\r\n- für kleine und mittlere Projekte sehr übersichtliche Darstellung der Aktivitäten.\r\n#Nachteil#\r\n- bei einer großen Anzahl von Aktivitäten wird die Darstellung schnell unübersichtlich.\r\n', 'none');
-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sets`
--

CREATE TABLE `sets` (
  `id` int(11) NOT NULL,
  `set_id` int(11) NOT NULL,
  `set_name` varchar(512) NOT NULL,
  `total_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `sets`
--

INSERT INTO `sets` (`id`, `set_id`, `set_name`, `total_count`) VALUES
(1, 1, 'u-form - IT-Berufe Abschlussprüfung Teil 1', 276);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `sets`
--
ALTER TABLE `sets`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `cards`
--
ALTER TABLE `cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT für Tabelle `sets`
--
ALTER TABLE `sets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
