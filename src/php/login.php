<?php
session_start();

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "drive-school";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $password = $_POST['password'];
    $email = $_POST['email'];

    if (empty($username) || empty($password) || empty($email)) {
        echo json_encode(array("status" => "error", "message" => "Все поля должны быть заполнены."));
        exit();
    }

    $get_password_query = "SELECT password FROM users WHERE username='$username'";
    $result = $conn->query($get_password_query);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $hashed_password = $row['password'];

        if (password_verify($password, $hashed_password)) {
            $_SESSION['username'] = $username;

            echo json_encode(array("status" => "success", "message" => "Добро пожаловать, $username!", "username" => $username));
        } else {
            echo json_encode(array("status" => "error", "message" => "Неправильный логин или пароль."));
        }
    } else {
        echo json_encode(array("status" => "error", "message" => "Неправильный логин или пароль."));
    }
}

$conn->close();
?>
