<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "drive-school";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT courses.title, courses.description, courses.price, users.name AS teacherName
        FROM courses
        JOIN teachers ON courses.id_teacher = teachers.id_user
        JOIN users ON teachers.id_user = users.id";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $courses = array();

    while ($row = $result->fetch_assoc()) {
        $courses[] = $row;
    }

    header('Content-Type: application/json');
    echo json_encode($courses);
} else {
    echo "0 results";
}

$conn->close();
?>
