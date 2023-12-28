<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "drive-school";

$table = $_GET['table'];

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$data = array();
$result = $conn->query("SELECT * FROM $table");

while ($row = $result->fetch_assoc()) {
    $data[] = $row;
}

$conn->close();

echo json_encode($data);
?>
