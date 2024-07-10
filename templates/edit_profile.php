<?php
session_start();
include 'edit_profile_add.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'];
    $firstname = $_POST['firstname'];
    $lastname = $_POST['lastname'];
    $phoneno = $_POST['phoneno'];

    $host = 'localhost';
    $db = 'code_warriors';
    $user = 'root';
    $pass = '';

    try {
        $pdo = new PDO("mysql:host=$host;dbname=$db", $user, $pass);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // Select the email from the database
        $stmt = $pdo->prepare("SELECT * FROM register_lecturer WHERE email = ?");
        $stmt->execute([$email]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        // Verify the email and update the details if email exists
        if ($row) {
            $stmt_update = $pdo->prepare("UPDATE register_lecturer SET firstname = ?, lastname = ?, phoneno = ? WHERE email = ?");
            $stmt_update->execute([$firstname, $lastname, $phoneno, $email]);

            echo "<script>alert('Profile updated successfully'); window.location.href = 'create_session.html';</script>";
        } else {
            echo "<script>alert('Email not found'); window.location.href = 'edit_profile.html';</script>";
        }
    } catch (PDOException $e) {
        die("Error: " . $e->getMessage());
    }
}
?>