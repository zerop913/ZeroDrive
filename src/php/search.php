<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "drive-school";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$query = $_GET['query'];
$filter = $_GET['filter'];

if ($query === 'all') {
    $sql = "SELECT users.lastname, users.name, users.patronymic, cars.make, cars.model, cars.number
            FROM users
            JOIN teachers ON users.id = teachers.id_user
            JOIN cars ON teachers.id_car = cars.id";
} else {
    if ($filter === 'fio') {
        $sql = "SELECT users.lastname, users.name, users.patronymic, cars.make, cars.model, cars.number
                FROM users
                JOIN teachers ON users.id = teachers.id_user
                JOIN cars ON teachers.id_car = cars.id
                WHERE users.lastname LIKE '%$query%'";
    } elseif ($filter === 'number') {
        $sql = "SELECT users.lastname, users.name, users.patronymic, cars.make, cars.model, cars.number
                FROM users
                JOIN teachers ON users.id = teachers.id_user
                JOIN cars ON teachers.id_car = cars.id
                WHERE cars.number LIKE '%$query%'";
    } else {
        $sql = "SELECT users.lastname, users.name, users.patronymic, cars.make, cars.model, cars.number
                FROM users
                JOIN teachers ON users.id = teachers.id_user
                JOIN cars ON teachers.id_car = cars.id
                WHERE users.lastname LIKE '%$query%'
                OR cars.number LIKE '%$query%'";
    }
}

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo "<div class='bg-white p-6 rounded-md shadow-md mb-8 search-card cursor-pointer'>
                <p class='font-daysOne text-2xl mb-4'>{$row['lastname']} {$row['name']} {$row['patronymic']}</p>
                <p class='font-rubikR text-lg text-[#F3B616]'>Марка: {$row['make']}</p>
                <p class='font-rubikR text-lg'>Модель: {$row['model']}</p>
                <p class='font-rubikR text-lg'>Номер машины: {$row['number']}</p>
              </div>";
    }
} else {
    echo '<p class="text-red-500 mt-8">Ничего не найдено</p>';
}

$conn->close();
?>