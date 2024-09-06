<?php
// Inkludiere die Datenbankverbindung
include 'mysql.php';

// Überprüfen, ob alle benötigten POST-Daten vorhanden sind
if (isset($_POST['card_set']) && isset($_POST['question_id']) && isset($_POST["difficulty"]) && isset($_POST['title']) && isset($_POST['question']) && isset($_POST['answer'])) {

    // Bereite die POST-Daten vor
    $card_set = $_POST['card_set'];
    $question_id = $_POST['question_id'];
    $difficulty = $_POST['difficulty'];
    $title = $_POST['title'];
    $question = $_POST['question'];
    $answer = $_POST['answer'];

    // Ordner für Bilder
    $target_dir = "../img/";

    // Verarbeitung des Fragen-Bilds
    if (isset($_FILES['qimage']) && $_FILES['qimage']['error'] == UPLOAD_ERR_OK) {
        $qimageFileType = strtolower(pathinfo($_FILES['qimage']['name'], PATHINFO_EXTENSION));
        $qimage = $target_dir . "Q" . $card_set . "-" . $question_id . "." . $qimageFileType;

        if (move_uploaded_file($_FILES['qimage']['tmp_name'], $qimage)) {
            // Bild wurde erfolgreich hochgeladen
        } else {
            echo "Fehler beim Hochladen des Fragen-Bilds.";
            $qimage = "none";
        }
    } else {
        $qimage = "none";
    }

    // Verarbeitung des Antwort-Bilds
    if (isset($_FILES['aimage']) && $_FILES['aimage']['error'] == UPLOAD_ERR_OK) {
        $aimageFileType = strtolower(pathinfo($_FILES['aimage']['name'], PATHINFO_EXTENSION));
        $aimage = $target_dir . "A" . $card_set . "-" . $question_id . "." . $aimageFileType;

        if (move_uploaded_file($_FILES['aimage']['tmp_name'], $aimage)) {
            // Bild wurde erfolgreich hochgeladen
        } else {
            echo "Fehler beim Hochladen des Antwort-Bilds.";
            $aimage = "none";
        }
    } else {
        $aimage = "none";
    }

    // Erstelle das SQL-Statement
    $sql = "INSERT INTO cards (card_set, question_id, difficulty, title, question, qimage, answer, aimage) 
            VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

    // Bereite das SQL-Statement vor
    $stmt = $conn->prepare($sql);
    if ($stmt === false) {
        die("Fehler bei der Vorbereitung des Statements: " . $conn->error);
    }

    // Binde die Parameter
    $stmt->bind_param("iiisssss", $card_set, $question_id, $difficulty, $title, $question, $qimage, $answer, $aimage);

    // Führe das Statement aus
    if ($stmt->execute()) {
        $stmt->close();
        loadLastPosted($card_set,$question_id);
    } else {
        echo "Fehler beim Einfügen des Eintrags: " . $stmt->error;
        $stmt->close();
    }


} else {
    echo "Alle erforderlichen Felder müssen ausgefüllt werden.";
}

// Schließe die Datenbankverbindung
$conn->close();

function loadLastPosted($card_set,$question_id){
    global $conn;

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
    }
    // Schließe das Statement
    $stmt->close();
}

?>
