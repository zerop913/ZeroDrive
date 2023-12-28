<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "drive-school";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$tables = array();
$result = $conn->query("SHOW TABLES");

while ($row = $result->fetch_row()) {
    $tables[] = $row[0];
}

$conn->close();

echo json_encode($tables);
?>
