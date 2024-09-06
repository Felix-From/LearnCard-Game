<?php
// Datenbankverbindung
$servername = "localhost";
$username = "username";
$password = "xxxxxxxxxx";
$dbname = "learn_cards";

// Erstelle Verbindung
$conn = new mysqli($servername, $username, $password, $dbname);

// Überprüfe die Verbindung
if ($conn->connect_error) {
    die("Verbindung fehlgeschlagen: " . $conn->connect_error);
}
?>
