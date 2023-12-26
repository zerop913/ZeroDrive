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
    $name = $_POST['name'];
    $lastname = $_POST['lastname'];
    $patronymic = $_POST['patronymic'];
    $phone = $_POST['phone'];
    $email = $_POST['email'];
    $username = $_POST['username'];
    $password = $_POST['password'];
    $confirm_password = $_POST['confirm_password'];

    // Проверка обязательных полей
    if (empty($name) || empty($lastname) || empty($phone) || empty($email) || empty($username) || empty($password) || empty($confirm_password)) {
        echo json_encode(array("status" => "error", "message" => "Все поля должны быть заполнены."));
        exit();
    }

    // Проверка пароля
    if (strlen($password) < 8 || !preg_match('/\d/', $password) || !preg_match('/[a-zA-Z]/', $password)) {
        echo json_encode(array("status" => "error", "message" => "Пароль должен содержать не менее 8 символов, включая цифры и английские буквы."));
        exit();
    }

    // Проверка, чтобы пароль и подтверждение пароля совпадали
    if ($password !== $confirm_password) {
        echo json_encode(array("status" => "error", "message" => "Пароли не совпадают."));
        exit();
    }

    // Хеширование пароля
    $hashed_password = password_hash($password, PASSWORD_DEFAULT);

    // Проверка уникальности почты, логина и телефона
    $check_email = "SELECT * FROM users WHERE email='$email'";
    $check_username = "SELECT * FROM users WHERE username='$username'";
    $check_phone = "SELECT * FROM users WHERE phone='$phone'";

    $result_email = $conn->query($check_email);
    $result_username = $conn->query($check_username);
    $result_phone = $conn->query($check_phone);

    if ($result_email->num_rows > 0) {
        echo json_encode(array("status" => "error", "message" => "Пользователь с такой почтой уже существует."));
        exit();
    } elseif ($result_username->num_rows > 0) {
        echo json_encode(array("status" => "error", "message" => "Пользователь с таким логином уже существует."));
        exit();
    } elseif ($result_phone->num_rows > 0) {
        echo json_encode(array("status" => "error", "message" => "Пользователь с таким телефоном уже существует."));
        exit();
    }

    // Вставка данных в базу данных
    $insert_query = "INSERT INTO users (name, lastname, patronymic, phone, email, username, password) VALUES ('$name', '$lastname', '$patronymic', '$phone', '$email', '$username', '$hashed_password')";

    if ($conn->query($insert_query) === TRUE) {
        echo json_encode(array("status" => "success", "message" => "Регистрация успешна!"));
    } else {
        echo json_encode(array("status" => "error", "message" => "Ошибка: " . $insert_query . "<br>" . $conn->error));
    }
}

$conn->close();
?>
