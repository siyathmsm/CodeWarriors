<?php
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'];
    $firstname = $_POST['firstname'];
    $lastname = $_POST['lastname'];
    $phoneno = $_POST['phoneno'];
    $profile_picture = $_FILES['profile_picture'];

    $target_dir = "uploads/";
    $target_file = $target_dir . basename($profile_picture["name"]);

    $host = 'localhost';
    $db = 'code_warriors';
    $user = 'root';
    $pass = '';

    try {
        $pdo = new PDO("mysql:host=$host;dbname=$db", $user, $pass);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        if (move_uploaded_file($profile_picture["tmp_name"], $target_file)) {
            $stmt = $pdo->prepare("INSERT INTO edit_profile (email, firstname, lastname, phoneno, profile_picture) VALUES (?, ?, ?, ?, ?)
                                   ON DUPLICATE KEY UPDATE firstname = VALUES(firstname), lastname = VALUES(lastname), phoneno = VALUES(phoneno), profile_picture = VALUES(profile_picture)");
            $stmt->execute([$email, $firstname, $lastname, $phoneno, $target_file]);

            echo "<script>alert('Profile updated successfully'); window.location.href = 'create_session.html';</script>";
        } else {
            echo "<script>alert('Error uploading file'); window.location.href = 'edit_profile.html';</script>";
        }
    } catch (PDOException $e) {
        die("Error: " . $e->getMessage());
    }
}
?>