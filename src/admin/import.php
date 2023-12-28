<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "drive-school";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$response = ['success' => false, 'error' => '', 'table' => []];

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $file = $_FILES["file"];

    if ($file["error"] === UPLOAD_ERR_OK) {
        $content = file_get_contents($file["tmp_name"]);
        $rows = explode("\n", $content);

        foreach ($rows as $row) {
            $data = explode(",", $row);
            $lastname = trim($data[0]);
            $name = trim($data[1]);
            $patronymic = trim($data[2]);
            $phone = trim($data[3]);
            $email = trim($data[4]);
            $username = trim($data[5]);
            $password = trim($data[6]);

            $checkQuery = "SELECT * FROM `users` WHERE `phone`='$phone' OR `email`='$email' OR `username`='$username'";
            $checkResult = $conn->query($checkQuery);

            if ($checkResult->num_rows == 0) {
                $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

                $insertQuery = "INSERT INTO `users` (`lastname`, `name`, `patronymic`, `phone`, `email`, `username`, `password`) VALUES ('$lastname', '$name', '$patronymic', '$phone', '$email', '$username', '$hashedPassword')";
                $conn->query($insertQuery);

                $getUserQuery = "SELECT * FROM `users` WHERE `phone`='$phone'";
                $userResult = $conn->query($getUserQuery);

                if ($userResult->num_rows > 0) {
                    $user = $userResult->fetch_assoc();
                    $response['table'][] = $user;
                }
            } else {
                $response['error'] = "Пользователь с таким же телефоном, электронной почтой или именем пользователя уже существует";
                break;
            }
        }

        $response['success'] = true;
    } else {
        $response['error'] = "Ошибка при загрузке файла";
    }
}

$conn->close();
echo json_encode($response);
?>
