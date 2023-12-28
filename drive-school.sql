SET
  SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

START TRANSACTION;

SET
  time_zone = "+00:00";

CREATE TABLE `attendance` (
  `id` int NOT NULL,
  `id_course` int NOT NULL,
  `id_student` int NOT NULL,
  `date` date NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

INSERT INTO
  `attendance` (`id`, `id_course`, `id_student`, `date`)
VALUES
  (1, 1, 11, '2023-01-15'),
  (2, 2, 12, '2023-02-20'),
  (3, 3, 13, '2023-03-25'),
  (4, 4, 14, '2023-04-30'),
  (5, 5, 15, '2023-06-05'),
  (6, 6, 16, '2023-07-10'),
  (7, 7, 17, '2023-08-15'),
  (8, 8, 18, '2023-09-20'),
  (9, 9, 19, '2023-10-25'),
  (10, 10, 20, '2023-11-30');

CREATE TABLE `cars` (
  `id` int NOT NULL,
  `make` varchar(30) NOT NULL,
  `model` varchar(30) NOT NULL,
  `year` int NOT NULL,
  `number` varchar(6) NOT NULL,
  `condition` varchar(20) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

INSERT INTO
  `cars` (
    `id`,
    `make`,
    `model`,
    `year`,
    `number`,
    `condition`
  )
VALUES
  (1, 'Toyota', 'Camry', 2020, 'ABC123', 'Хорошее'),
  (2, 'Ford', 'Focus', 2018, 'XYZ789', 'Отличное'),
  (3, 'Honda', 'Civic', 2019, 'DEF456', 'Хорошее'),
  (
    4,
    'Chevrolet',
    'Malibu',
    2021,
    'GHI789',
    'Отличное'
  ),
  (5, 'Nissan', 'Altima', 2017, 'JKL012', 'Хорошее'),
  (
    6,
    'Hyundai',
    'Elantra',
    2022,
    'MNO345',
    'Отличное'
  ),
  (
    7,
    'Volkswagen',
    'Jetta',
    2020,
    'PQR678',
    'Хорошее'
  ),
  (8, 'Kia', 'Optima', 2019, 'STU901', 'Отличное'),
  (9, 'Mazda', 'Mazda6', 2021, 'VWX234', 'Хорошее'),
  (
    10,
    'Subaru',
    'Legacy',
    2018,
    'YZA567',
    'Отличное'
  );

CREATE TABLE `contracts` (
  `id` int NOT NULL,
  `id_course` int NOT NULL,
  `id_student` int NOT NULL,
  `date_of_conclusion` date NOT NULL,
  `sum_of_payment` int NOT NULL,
  `id_status` int NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

INSERT INTO
  `contracts` (
    `id`,
    `id_course`,
    `id_student`,
    `date_of_conclusion`,
    `sum_of_payment`,
    `id_status`
  )
VALUES
  (1, 1, 11, '2023-01-10', 40000, 2),
  (2, 2, 12, '2023-02-15', 20000, 1),
  (3, 3, 13, '2023-03-20', 15000, 2),
  (4, 4, 14, '2023-04-25', 45000, 1),
  (5, 5, 15, '2023-05-30', 37000, 2),
  (6, 6, 16, '2023-06-05', 17000, 1),
  (7, 7, 17, '2023-07-10', 9000, 2),
  (8, 8, 18, '2023-08-15', 12000, 1),
  (9, 9, 19, '2023-09-20', 23000, 2),
  (10, 10, 20, '2023-10-25', 8000, 1);

CREATE TABLE `courses` (
  `id` int NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `price` int NOT NULL,
  `id_teacher` int NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

INSERT INTO
  `courses` (
    `id`,
    `title`,
    `description`,
    `price`,
    `id_teacher`
  )
VALUES
  (
    1,
    'Основной курс вождения',
    'Изучите основы вождения',
    40000,
    1
  ),
  (
    2,
    'Курс безопасности движения',
    'Научитесь безопасному движению',
    20000,
    2
  ),
  (
    3,
    'Курс дефенсивного вождения',
    'Получите навыки дефенсивного вождения',
    15000,
    3
  ),
  (
    4,
    'Продвинутый курс вождения',
    'Улучшите свои навыки вождения',
    45000,
    4
  ),
  (
    5,
    'Городской курс вождения',
    'Овладейте навыками вождения в городе',
    37000,
    5
  ),
  (
    6,
    'Трассовый курс вождения',
    'Научитесь водить по трассе',
    17000,
    6
  ),
  (
    7,
    'Курс парковки',
    'Получите уверенность в парковке',
    9000,
    7
  ),
  (
    8,
    'Ночной курс вождения',
    'Освоите навыки вождения в темноте',
    12000,
    8
  ),
  (
    9,
    'Зимний курс вождения',
    'Научитесь водить в зимних условиях',
    23000,
    9
  ),
  (
    10,
    'Курс вождения вне дорог',
    'Изучите вождение вне дорог',
    8000,
    10
  );

CREATE TABLE `exams` (
  `id` int NOT NULL,
  `id_course` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `result` int NOT NULL,
  `id_student` int NOT NULL,
  `id_car` int NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

INSERT INTO
  `exams` (
    `id`,
    `id_course`,
    `type`,
    `date`,
    `result`,
    `id_student`,
    `id_car`
  )
VALUES
  (1, 1, 'Теоретический', '2023-02-01', 4, 11, 1),
  (2, 2, 'Практический', '2023-03-05', 6, 12, 2),
  (3, 3, 'Теоретический', '2023-04-10', 2, 13, 3),
  (4, 4, 'Практический', '2023-05-15', 4, 14, 4),
  (5, 5, 'Теоретический', '2023-06-20', 1, 15, 5),
  (6, 6, 'Практический', '2023-07-25', 0, 16, 6),
  (7, 7, 'Теоретический', '2023-08-30', 1, 17, 7),
  (8, 8, 'Практический', '2023-10-05', 1, 18, 8),
  (9, 9, 'Теоретический', '2023-11-10', 0, 19, 9),
  (10, 10, 'Практический', '2023-12-15', 5, 20, 10);

CREATE TABLE `status` (
  `id` int NOT NULL,
  `title` varchar(50) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

INSERT INTO
  `status` (`id`, `title`)
VALUES
  (1, 'Активен'),
  (2, 'Завершен'),
  (3, 'Отменен');

CREATE TABLE `students` (
  `id_user` int NOT NULL,
  `group` int NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

INSERT INTO
  `students` (`id_user`, `group`)
VALUES
  (11, 101),
  (12, 101),
  (13, 101),
  (14, 101),
  (15, 101),
  (16, 102),
  (17, 102),
  (18, 102),
  (19, 102),
  (20, 102);

CREATE TABLE `teachers` (
  `id_car` int NOT NULL,
  `specialization` varchar(50) NOT NULL,
  `id_user` int NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

INSERT INTO
  `teachers` (`id_car`, `specialization`, `id_user`)
VALUES
  (1, 'Инструктор по вождению', 1),
  (2, 'Инструктор по безопасности движения', 2),
  (3, 'Инструктор по безопасному вождению', 3),
  (4, 'Инструктор по продвинутому вождению', 4),
  (5, 'Инструктор по городскому вождению', 5),
  (6, 'Инструктор по трассовому вождению', 6),
  (7, 'Инструктор по парковочным навыкам', 7),
  (8, 'Инструктор по ночному вождению', 8),
  (9, 'Инструктор по зимнему вождению', 9),
  (10, 'Инструктор по вождению вне дорог', 10);

CREATE TABLE `users` (
  `id` int NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `patronymic` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(60) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

INSERT INTO
  `users` (
    `id`,
    `lastname`,
    `name`,
    `patronymic`,
    `phone`,
    `email`,
    `username`,
    `password`
  )
VALUES
  (
    1,
    'Иванов',
    'Иван',
    'Иванович',
    '+78875877979',
    'ivanov@example.com',
    'ivanov_ivan',
    '$2y$10$77I0.FFAo7t5b1u0hrJzguXKbUAWpi67IPO.XdjLHOaHGCkC0EJC2'
  ),
  (
    2,
    'Петров',
    'Петр',
    'Петрович',
    '+79074677149',
    'petrov@example.com',
    'petrov_petr',
    '$2y$10$tFxGz7CdOfvteE7PrnUEHuvwlQTj3SnR83.3frxl985qkIhki6Uma'
  ),
  (
    3,
    'Сидорова',
    'Елена',
    'Александровна',
    '+76028852255',
    'sidorova@example.com',
    'sidorova_elena',
    '$2y$10$tgJG3f2AiRtH737/oTSQh.hTlkkPkrL32OCxsuTza7y77Vu/X56NO'
  ),
  (
    4,
    'Козлов',
    'Андрей',
    'Николаевич',
    '+71788500244',
    'kozlov@example.com',
    'kozlov_andrey',
    '$2y$10$Np9r8FcKR.pXWi7PuG/vheyP30qS3zZPzg6mcnH0rknNE9mgctWV6'
  ),
  (
    5,
    'Михайлова',
    'Ольга',
    'Сергеевна',
    '+76512674431',
    'mikhailova@example.com',
    'mikhailova_olga',
    '$2y$10$1ppLnkx5mXksaYIsEogDj./885oVFIia8/oql4yTBs0M1K81b0i3e'
  ),
  (
    6,
    'Кузнецов',
    'Дмитрий',
    'Игоревич',
    '+74238678193',
    'kuznetsov@example.com',
    'kuznetsov_dmitry',
    '$2y$10$XMQMpbGmLnTMKl0nQGkXNuxTIpKI2B47Vk309I3.cdzxvdYCYHf2u'
  ),
  (
    7,
    'Васнецов',
    'Владимир',
    'Алексеевич',
    '+75116541982',
    'vasnetsov@example.com',
    'vasnetsov_vladimir',
    '$2y$10$7C5MaznvgK9HwnwefpDYgeR7/za8VMT2hTiA6.ocjhcwv7lmvyV22'
  ),
  (
    8,
    'Смирнова',
    'Мария',
    'Дмитриевна',
    '+76144990728',
    'smirnova@example.com',
    'smirnova_maria',
    '$2y$10$h7s8UQ6tXPALiXrBNQi4ru4/PeVSFNemRI2G8CWGFxyMBy5.msSnS'
  ),
  (
    9,
    'Алексеев',
    'Сергей',
    'Павлович',
    '+77258489482',
    'alexeev@example.com',
    'alexeev_sergey',
    '$2y$10$p7krFJTbI5QXgAK2Q3pgGejYTpwg0Q2LZaHplMwCyQv/wcQ6foNvy'
  ),
  (
    10,
    'Николаев',
    'Николай',
    'Игоревич',
    '+75805310872',
    'nikolaev@example.com',
    'nikolaev_nikolay',
    '$2y$10$lbQnik593Rb9kOYzKtZbEuKyPhSvmrSUQ71lp2SLUemeOxK.dWFl.'
  ),
  (
    11,
    'Соколов',
    'Александр',
    'Александрович',
    '+79047344527',
    'sokolov@example.com',
    'sokolov_alex',
    '$2y$10$dEz.6RxOAILKLs0K8dJNtOBIxiY/iQC5RXm8gFhXnCvg.DqYIPsNW'
  ),
  (
    12,
    'Федорова',
    'Татьяна',
    'Игоревна',
    '+79501607405',
    'fedorova@example.com',
    'fedorova_tanya',
    '$2y$10$M/6be/DrRBaPtMPVRVQi3ua/ydf3BRJoi4PfhqBGTQvEc3hPMiKMy'
  ),
  (
    13,
    'Белов',
    'Артем',
    'Сергеевич',
    '+79023116154',
    'belov@example.com',
    'belov_artem',
    '$2y$10$oH5Q/yv0MmU5jk2fHMsJgOQgwcNNtgjLcwE3OFNKsc6LovIQ.TEf.'
  ),
  (
    14,
    'Крылов',
    'Владислав',
    'Петрович',
    '+79387096610',
    'krylov@example.com',
    'krylov_vlad',
    '$2y$10$vHUUUcNj5/dvx8VhaLs4GuoN3DOfwSsdp3Tg3SJ.5ti6AAzSCi58q'
  ),
  (
    15,
    'Павлова',
    'Екатерина',
    'Алексеевна',
    '+79308553842',
    'pavlova@example.com',
    'pavlova_katya',
    '$2y$10$KBiCRBHml6WuRALvztRyceKWjZ9QeLiBpFOlWTFSYuNTCOM7l6eZ6'
  ),
  (
    16,
    'Воронов',
    'Никита',
    'Игоревич',
    '+79010155036',
    'voronov@example.com',
    'voronov_nik',
    '$2y$10$LIaDzzDkWccOzRH7FnQKT.5Xu1YNr2.9VoSra7duy2AExvpZNxr7y'
  ),
  (
    17,
    'Андреева',
    'София',
    'Дмитриевна',
    '+79707255926',
    'andreeva@example.com',
    'andreeva_sofia',
    '$2y$10$Q1tNgH3PP6msdcK3XP9M6ug51M1mhs5lYwmu5hLsqQEn2ezQua.lO'
  ),
  (
    18,
    'Кузьмин',
    'Даниил',
    'Владимирович',
    '+79025937344',
    'kuzmin@example.com',
    'kuzmin_dan',
    '$2y$10$gUok6qFCYtJCtETiM7a/Ge/V2OXR3VMhBbs/tSVx0vZv1jWxn2oCC'
  ),
  (
    19,
    'Лебедева',
    'Анна',
    'Сергеевна',
    '+79502353441',
    'lebedeva@example.com',
    'lebedeva_anna',
    '$2y$10$KGiydmRqXMRUyHYVqDrGWuJSMn9VrEKpkdizCTWJv65IlrKf27wYG'
  ),
  (
    20,
    'Григорьев',
    'Иван',
    'Васильевич',
    '+79500254869',
    'grigoriev@example.com',
    'grigoriev_ivan',
    '$2y$10$ZIyM8j7oGoYK3yAJJbZWBOlVEJvkuKRDlRhHGzeyZMib0XNeclyQe'
  ),
  (
    21,
    'Смолин',
    'Иван',
    'Григорьевич',
    '+79506843143',
    'ivansmolin913@gmail.com',
    'admin',
    '$2y$10$QsN1y2RWCxP2DmluFKY2.ul.WVWibGmJxKfe8cqGBxl6z7GUnVfRi'
  );

ALTER TABLE
  `attendance`
ADD
  PRIMARY KEY (`id`),
ADD
  KEY `attendance_fk0` (`id_course`),
ADD
  KEY `attendance_fk1` (`id_student`);

ALTER TABLE
  `cars`
ADD
  PRIMARY KEY (`id`);

ALTER TABLE
  `contracts`
ADD
  PRIMARY KEY (`id`),
ADD
  KEY `contracts_fk0` (`id_course`),
ADD
  KEY `contracts_fk1` (`id_student`),
ADD
  KEY `contracts_fk2` (`id_status`);

ALTER TABLE
  `courses`
ADD
  PRIMARY KEY (`id`),
ADD
  KEY `courses_fk0` (`id_teacher`);

ALTER TABLE
  `exams`
ADD
  PRIMARY KEY (`id`),
ADD
  KEY `exams_fk0` (`id_course`),
ADD
  KEY `exams_fk1` (`id_student`),
ADD
  KEY `exams_fk2` (`id_car`);

ALTER TABLE
  `status`
ADD
  PRIMARY KEY (`id`);

ALTER TABLE
  `students`
ADD
  PRIMARY KEY (`id_user`);

ALTER TABLE
  `teachers`
ADD
  PRIMARY KEY (`id_user`),
ADD
  KEY `teachers_fk0` (`id_car`);

ALTER TABLE
  `users`
ADD
  PRIMARY KEY (`id`);

ALTER TABLE
  `attendance`
MODIFY
  `id` int NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 11;

ALTER TABLE
  `cars`
MODIFY
  `id` int NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 11;

ALTER TABLE
  `contracts`
MODIFY
  `id` int NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 11;

ALTER TABLE
  `courses`
MODIFY
  `id` int NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 11;

ALTER TABLE
  `exams`
MODIFY
  `id` int NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 11;

ALTER TABLE
  `status`
MODIFY
  `id` int NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 4;

ALTER TABLE
  `users`
MODIFY
  `id` int NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 22;

ALTER TABLE
  `attendance`
ADD
  CONSTRAINT `attendance_fk0` FOREIGN KEY (`id_course`) REFERENCES `courses` (`id`),
ADD
  CONSTRAINT `attendance_fk1` FOREIGN KEY (`id_student`) REFERENCES `students` (`id_user`);

ALTER TABLE
  `contracts`
ADD
  CONSTRAINT `contracts_fk0` FOREIGN KEY (`id_course`) REFERENCES `courses` (`id`),
ADD
  CONSTRAINT `contracts_fk1` FOREIGN KEY (`id_student`) REFERENCES `students` (`id_user`),
ADD
  CONSTRAINT `contracts_fk2` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`);

ALTER TABLE
  `courses`
ADD
  CONSTRAINT `courses_fk0` FOREIGN KEY (`id_teacher`) REFERENCES `teachers` (`id_user`);

ALTER TABLE
  `exams`
ADD
  CONSTRAINT `exams_fk0` FOREIGN KEY (`id_course`) REFERENCES `courses` (`id`),
ADD
  CONSTRAINT `exams_fk1` FOREIGN KEY (`id_student`) REFERENCES `students` (`id_user`),
ADD
  CONSTRAINT `exams_fk2` FOREIGN KEY (`id_car`) REFERENCES `cars` (`id`);

ALTER TABLE
  `students`
ADD
  CONSTRAINT `students_fk0` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

ALTER TABLE
  `teachers`
ADD
  CONSTRAINT `teachers_fk0` FOREIGN KEY (`id_car`) REFERENCES `cars` (`id`),
ADD
  CONSTRAINT `teachers_fk1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

COMMIT;