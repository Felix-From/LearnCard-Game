<?php
// Inkludiere die Datenbankverbindung
include 'mysql.php';

// Überprüfen, ob die benötigten POST-Daten vorhanden sind
if (isset($_POST['card_set']) && isset($_POST['question_id'])) {

    // Bereite die POST-Daten vor
    $card_set = $_POST['card_set'];
    $question_id = $_POST['question_id'];

    // Erstelle das SQL-Statement
    $sql = "SELECT * FROM cards WHERE card_set = ? AND question_id = ?";

    // Bereite das SQL-Statement vor
    $stmt = $conn->prepare($sql);
    if ($stmt === false) {
        die("Fehler bei der Vorbereitung des Statements: " . $conn->error);
    }

    // Binde die Parameter
    $stmt->bind_param("si", $card_set, $question_id);

    // Führe das Statement aus
    $stmt->execute();

    // Hole die Ergebnisse
    $result = $stmt->get_result();

    // Überprüfe, ob Ergebnisse gefunden wurden
    if ($result->num_rows > 0) {
        // Ausgabe der Ergebnisse als JSON
        $data = $result->fetch_all(MYSQLI_ASSOC);
        echo json_encode($data);
    } else {
        echo json_encode(["message" => "Keine Einträge gefunden."]);
    }

    // Schließe das Statement
    $stmt->close();

} else {
    echo json_encode(["error" => "card_set und question_id müssen angegeben werden."]);
}

// Schließe die Datenbankverbindung
$conn->close();
?>
