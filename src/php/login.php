<?php
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

    // Проверка, чтобы поля не были пустыми
    if (empty($username) || empty($password) || empty($email)) {
        echo json_encode(array("status" => "error", "message" => "Все поля должны быть заполнены."));
        exit();
    }

    // Получение хешированного пароля из базы данных
    $get_password_query = "SELECT password FROM users WHERE username='$username'";
    $result = $conn->query($get_password_query);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $hashed_password = $row['password'];

        // Проверка пароля
        if (password_verify($password, $hashed_password)) {
            echo json_encode(array("status" => "success", "message" => "Добро пожаловать, $username!"));
        } else {
            echo json_encode(array("status" => "error", "message" => "Неправильный логин или пароль."));
        }
    } else {
        echo json_encode(array("status" => "error", "message" => "Неправильный логин или пароль."));
    }
}

$conn->close();
?>
