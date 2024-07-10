<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "code_warriors";

    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Get the question type and answers from the POST request
    $question_type = isset($_POST['question_type']) ? $_POST['question_type'] : 'type1';
    $answers = isset($_POST['answers']) ? $_POST['answers'] : [];

    // Prepare and bind
    $stmt = $conn->prepare("INSERT INTO answers (question_type, q1, q2, q3, q4, q5) VALUES (?, ?, ?, ?, ?, ?)");
    $stmt->bind_param(
        "ssssss",
        $question_type,
        $answers['q1'],
        $answers['q2'],
        $answers['q3'],
        $answers['q4'],
        $answers['q5']
    );

    if ($stmt->execute()) {
        header('Location: success_answer.html');
        exit;
    } else {
        $response = ["status" => "error", "message" => "Failed to submit answers: " . $stmt->error];
    }

    $stmt->close();
    $conn->close();

    echo json_encode($response);
}
?>