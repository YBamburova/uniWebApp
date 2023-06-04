CREATE DATABASE IF NOT EXISTS `final_project` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `final_project`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: final_project
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE = @@TIME_ZONE */;
/*!40103 SET TIME_ZONE = '+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users`
(
    `id`                  int                                      NOT NULL AUTO_INCREMENT,
    `username`            varchar(255)                             NOT NULL,
    `name`                varchar(255)                             NOT NULL,
    `surname`             varchar(255)                             NOT NULL,
    `email`               varchar(255)                             NOT NULL,
    `password`            varchar(255)                             NOT NULL,
    `is_blocked`          tinyint(1)                               NOT NULL DEFAULT 0,
    `type`                enum ('student','admin')                 NOT NULL DEFAULT 'student',
    `educational_program` enum ('typical', 'modified', 'adaptive') NOT NULL DEFAULT 'typical',
    `support_level`       int                                      NOT NULL default 0,
    `additional_info`     varchar(255),
    PRIMARY KEY (`id`),
    UNIQUE KEY `idusers_UNIQUE` (`id`),
    UNIQUE KEY `login_UNIQUE` (`username`),
    UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 68
  DEFAULT CHARSET = utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users`
    DISABLE KEYS */;
INSERT INTO `users`
VALUES (1, 'ybamburova', 'Yuliana', 'Bamburova', 'ybamburova@mail.com', 'ybamburova', 0, 'admin',
        'typical', 0, null),
       (2, 'nazar', 'Nazar', 'Сrosseyed', 'nazarokulist@example.com', 'nazar', 0, 'student',
        'adaptive', 5, null),
       (3, 'proman', 'Pan', 'Roman', 'shelly.woods@example.com', 'proman', 0, 'student', 'typical',
        1, null),
       (4, 'vasyl', 'Vasyl', 'Simpson', 'heather.simpson@example.com', 'vasyl', 0,
        'student', 'typical', 2, null),
       (5, 'alexburke', 'Alex', 'Burke', 'alex.burke@example.com', 'TdthXZ8XwOkUaIq', 0, 'student',
        'typical', 3, null),
       (6, 'christyevans', 'Christy', 'Evans', 'christy.evans@example.com', 'TmYnCkucmZbnSe5', 0,
        'student', 'typical', 4, null);
/*!40000 ALTER TABLE `users`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passed_tests`
--

DROP TABLE IF EXISTS `passed_tests`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passed_tests`
(
    `id`         int NOT NULL AUTO_INCREMENT,
    `user_id`    int NOT NULL,
    `test_id`    int NOT NULL,
    `result`     int NOT NULL,
    `time_spent` int NOT NULL,
    PRIMARY KEY (`id`),
    KEY `id_idx` (`user_id`),
    KEY `id_idx1` (`test_id`),
    CONSTRAINT `id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 43
  DEFAULT CHARSET = utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passed_tests`
--

LOCK TABLES `passed_tests` WRITE;
/*!40000 ALTER TABLE `passed_tests`
    DISABLE KEYS */;
INSERT INTO `passed_tests`
VALUES (42, 63, 40, 100, 6);
/*!40000 ALTER TABLE `passed_tests`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question`
(
    `id`           int          NOT NULL AUTO_INCREMENT,
    `test_id`      int          NOT NULL,
    `text`         varchar(255) NOT NULL,
    `option1`      varchar(255) NOT NULL,
    `option2`      varchar(255) NOT NULL,
    `option3`      varchar(255) NOT NULL,
    `option4`      varchar(255) NOT NULL,
    `o1is_correct` tinyint(1)   NOT NULL DEFAULT 0,
    `o2is_correct` tinyint(1)   NOT NULL DEFAULT 0,
    `o3is_correct` tinyint(1)   NOT NULL DEFAULT 0,
    `o4is_correct` tinyint(1)   NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 49
  DEFAULT CHARSET = utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question`
    DISABLE KEYS */;
INSERT INTO `question`
VALUES (33, 1, 'CPP', 'right', '---', '---', '---', 1, 0, 0, 0),
       (34, 1, 'question', 'right', 'wrong', 'wrong', 'right', 1, 0, 0, 1),
       (35, 1, 'question', 'right', 'right', 'wrong', 'wrong', 1, 1, 0, 0),
       (36, 1, 'запитання', 'правильна відповідь', 'неправильна відповідь', 'неправильна відповідь',
        'неправильна відповідь', 1, 0, 0, 0),
       (37, 2, 'rwerwe', '321312', '4214124124', '32423423', '4123321312', 0, 0, 1, 0),
       (38, 1, 'ugyhgfhgdhdg', 'hgfdhgdhdghgd', 'hgdhdg', 'hgfhgh', 'dhdhd', 1, 0, 0, 0),
       (39, 1, 'ппапаап', 'апаппаапап', 'паапапап', 'паапап', 'апапапапаап', 1, 1, 0, 0),
       (40, 2, 'опраоароа', 'ораоа', 'опренггк', 'гкгкг', 'кгкгкг', 1, 1, 0, 0),
       (41, 3, 'erqweqweqweqweqweqweqw', '+++++', '-----', '-----', '+++++', 1, 0, 0, 1),
       (42, 31, 'hgfhgdhdghdghdg', '+++++', '+++++', '_______', '_______', 1, 1, 0, 0),
       (43, 32, 'ghdhgdhdghdghdghd', '++++++', 'fgsdgfsgfsd', 'gsdfgsdfgfsd', 'gsdfgsdfgsdf', 1, 0,
        0,
        0),
       (44, 34, 'bbvbvbvb', '4242234', '4224243', '342424', '4234234423', 0, 0, 0, 1),
       (45, 32, 'fdsfsd', 'fdsfsdfsd', 'fsdfsd', 'fsdfsd', 'ffsdfsdfsd', 0, 0, 1, 0),
       (46, 40, 'What of the following is the default value of a local variable?', 'null', '0',
        'Depends upon the type of variable', 'Not assigned', 0, 0, 0, 1),
       (47, 40, 'What is the default value of float variable?', '0.0d', '0.0f', '0', 'not defined',
        0, 1,
        0, 0),
       (48, 40, 'What is the default value of Object variable?', 'undefined', '0', 'null',
        'not defined', 0,
        0, 1, 0);
/*!40000 ALTER TABLE `question`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic`
--
DROP TABLE IF EXISTS `topic`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `topic`
(
    `id`   int         NOT NULL AUTO_INCREMENT,
    `name` varchar(45) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic`
    DISABLE KEYS */;
INSERT INTO `topic`
VALUES (1, 'c++'),
       (2, 'java'),
       (3, 'javascript');
/*!40000 ALTER TABLE `topic`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests`
--

DROP TABLE IF EXISTS `tests`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests`
(
    `id`                 int         NOT NULL AUTO_INCREMENT,
    `name`               varchar(45) NOT NULL,
    `complexity`         int         NOT NULL,
    `number_of_requests` int         NOT NULL DEFAULT '0',
    `time_for_test`      int         NOT NULL,
    `topic`              int         NOT NULL DEFAULT '1',
    PRIMARY KEY (`id`),
    UNIQUE KEY `id_UNIQUE` (`id`),
    KEY `topic_idx` (`topic`),
    CONSTRAINT `topicID` FOREIGN KEY (`topic`) REFERENCES `topic` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 50
  DEFAULT CHARSET = utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests`
--

LOCK TABLES `tests` WRITE;
/*!40000 ALTER TABLE `tests`
    DISABLE KEYS */;
INSERT INTO `tests`
VALUES (40, 'Java Basics Quiz', 2, 3, 30, 2),
       (41, 'Java Array Quiz', 3, 0, 30, 2),
       (42, 'Java OOPs Quiz', 3, 0, 30, 2),
       (43, 'String Handling Quiz', 4, 0, 25, 2),
       (44, 'Exception Hand. Quiz', 5, 0, 25, 2),
       (45, 'Multithreading Quiz', 6, 0, 40, 2),
       (46, 'IO Quiz', 5, 0, 23, 2),
       (47, 'Collection Quiz', 6, 0, 45, 2),
       (48, 'JDBC Quiz', 6, 0, 35, 2),
       (49, 'Java Misc. Quiz', 6, 0, 50, 2);
/*!40000 ALTER TABLE `tests`
    ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `user_test`;
CREATE TABLE `user_test`
(
    `user_id` int NOT NULL,
    `test_id` int NOT NULL,
    PRIMARY KEY (`user_id`, `test_id`),
    KEY `user_id` (`user_id`),
    CONSTRAINT `user_test_ibfk_1`
        FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
    CONSTRAINT `user_test_ibfk_2`
        FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course`
(
    `id`                  int                                      NOT NULL AUTO_INCREMENT,
    `name`                varchar(45)                              NOT NULL,
    `complexity`          int                                      NOT NULL,
    `content`             text                                     NOT NULL,
    `educational_program` enum ('typical', 'modified', 'adaptive') NOT NULL DEFAULT 'typical',
    PRIMARY KEY (`id`),
    UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

insert into course (id, name, complexity, content, educational_program)
values (1, 'Course1', 3, '<html lang=""en"">
<body>
<h1>
РОЗВИТОК УВАГИ та СЛУХОВОГО СПРИЙНЯТТЯ
</h1>
<p>Розвиток уваги та слухового сприйняття є важливими навичками, які можна вдосконалити і тренувати. Нижче наведено декілька порад щодо розвитку цих навичок.</p>
<p><strong>1. Вправи на увагу:</strong></p>
<ul>
   <li>Займайтеся медитацією: Медитація може допомогти покращити зосередженість та увагу. Практикуйте щоденну медитацію протягом кількох хвилин, починаючи зі спроб тривалістю 5-10 хвилин і збільшуючи час поступово.</li>
   <li>Гра ""Знайди різницю"": Беріть дві малюнки або фотографії і шукайте відмінності між ними. Це допоможе тренувати увагу на деталі.</li>
   <li>Розвивайте свій пам\'ятовий апарат: Вчіть вірші, номери телефонів, список покупок та спробуйте відтворити їх з пам\'яті. Це сприятиме розвитку уваги та зосередженості.</li>
</ul>
<p><strong>2. Вправи на слухове сприйняття:</strong></p>
<ul>
   <li>Слухайте музику: Активне слухання музики, особливо класичної або інструментальної, може поліпшити ваше слухове сприйняття. Спробуйте розрізняти окремі інструменти або мелодійні лінії.</li>
   <li>Виконуйте аудіальні завдання: Записуйте аудіокниги або лекції та відтворюйте їх, намагаючись збагнути всі деталі і інформацію. Це допоможе поліпшити вашу здатність слухати та розуміти інформацію.</li>
   <li>Розвивайте фонематичну свідомість: Фонеми - це найменші звукові одиниці в мові. Виконуйте вправи, які допоможуть вам розрізняти та розпізнавати фонеми в словах.</li>
</ul>
<p>Важливо пам\'ятати, що розвиток цих навичок вимагає часу, терпіння та систематичності. Регулярні тренування допоможуть вам покращити увагу та слухове сприйняття.</p>
<iframe width=""560"" height=""315"" src=""https://www.youtube.com/embed/Kjvla93MdR0"" title=""YouTube video player"" frameborder=""0"" allow=""accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"" allowfullscreen></iframe>
</body>
</html>");', 'adaptive');
insert into course (id, name, complexity, content, educational_program)
values (2, 'Course2', 8, '<html lang=""en"">
<body>
<h1>
В якому вчинку живе добро?
</h1>
<p>Добро живе в різних вчинках, які роблять люди. Давайте розглянемо декілька прикладів:</p>
<p><strong>1. Допомогти іншим:</strong> Коли ми допомагаємо іншим людям, це є добрим вчинком. Наприклад, якщо ваш друг потребує допомоги з уроками, ви можете йому пояснити матеріал або поділитися своїми навичками. Це робить іншу людину щасливішою і є вчинком добра.</p>
<p><strong>2. Бути ввічливим і доброзичливим:</strong> Коли ми ставимося до інших з повагою, посміхаємося і висловлюємо добрі слова, це є добрим вчинком. Наприклад, ви можете сказати ""дякую"" або ""будь ласка"" та бути ввічливим у спілкуванні з родиною, друзями і навіть незнайомими людьми. Це робить навколишніх щасливішими і створює позитивну атмосферу.</p>
<p><strong>3. Поділитися з іншими:</strong> Коли ми ділимося своїми речами або часом з іншими, це є вчинком добра. Наприклад, якщо у вас є брат або сестра, і вони хочуть пограти з вашою улюбленою іграшкою, ви можете її позичити. Або ви можете поділитися своїм смачним сніданком з другом, який не має їжі. Це допомагає іншим людям і робить світ кращим місцем.</p>
<p>Це лише кілька прикладів, як добро може жити у вчинках людей. Коли ми робимо добрі вчинки, ми робимо світ навколо нас кращим і допомагаємо іншим людям почуватися щасливими. Пам\'ятайте, що кожен з нас може робити добрі вчинки і принести радість і добро іншим.</p>
<iframe width=""560"" height=""315"" src=""https://www.youtube.com/embed/TZ00jIhqa7M"" title=""YouTube video player"" frameborder=""0"" allow=""accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"" allowfullscreen></iframe>
</body>
</html>', 'typical');
insert into course (id, name, complexity, content, educational_program)
values (3, 'Course3', 5, '<html lang=""en"">
<body>
<h1>
Сонячна система
</h1>

<p>Сонячна система - це група планет, космічних тіл і зірок, які обертаються навколо нашої землі. Давайте познайомимося з ними!</p>
<p><strong>1. Сонце:</strong> Сонце - це найбільша зірка в нашій Сонячній системі. Воно надає нам світло і тепло. Сонце знаходиться посередині нашої Сонячної системи і всі інші планети обертаються навколо нього.</p>
<p><strong>2. Меркурій:</strong> Меркурій - це найближча планета до Сонця. Він маленький і дуже гарячий. Меркурій має короткий рік, бо він обертається навколо Сонця дуже швидко.</p>
<p><strong>3. Венера:</strong> Венера - це друга планета від Сонця. Вона відома своєю яскравою зовнішністю і називається ""вечірньою"" або ""ранковою зіркою"", оскільки її можна бачити на небі близько заходу або сходу Сонця.</p>
<p><strong>4. Земля:</strong> Земля - це наша планета, на якій живемо ми і всі інші живі організми. Вона має атмосферу, воду і життя. Земля також має одного природного супутника - Місяць.</p>
<p><strong>5. Марс:</strong> Марс - це ""Червона планета"". Він має червоний колір через свою поверхню з великою кількістю заліза. Марс вивчають, оскільки на ньому можуть бути умови для майбутнього проживання людей.</p>
<p><strong>6. Юпітер:</strong> Юпітер - це найбільша планета в Сонячній системі. Він має величезну гравітацію і багато великих газових штормів, таких як Великий Червоний Пляма.</p>
<p><strong>7. Сатурн:</strong> Сатурн відомий своїми красивими кільцями, що складаються з крижаних часток. Він має багато супутників і також є одним з найбільших планет у нашій Сонячній системі.</p>
<p><strong>8. Уран:</strong> Уран - це планета з наклоненою віссю обертання, що робить його особливим. Він має холодну атмосферу і кілька супутників.</p>
<p><strong>9. Нептун:</strong> Нептун - це остання планета у нашій Сонячній системі. Він відомий своєю синьою кольоровою смужкою і сильними вітрами. Нептун також має супутники і обертається далеко від Сонця.</p>
<p>Це лише кілька основних фактів про нашу Сонячну систему. Існує багато цікавих речей, які можна дізнатися про кожну планету і космічні тіла. Вивчайте науку і досліджуйте більше про чудову Сонячну систему, в якій ми живемо!</p>
<iframe width=""560"" height=""315"" src=""https://www.youtube.com/embed/PvcfJr-xe3k"" title=""YouTube video player"" frameborder=""0"" allow=""accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"" allowfullscreen></iframe>
</body>
</html>', 'modified');

DROP TABLE IF EXISTS `user_course`;
CREATE TABLE `user_course`
(
    `user_id`        int       NOT NULL,
    `course_id`      int       NOT NULL,
    `started_date`   timestamp null,
    `completed_date` timestamp null,
    PRIMARY KEY (`user_id`, `course_id`),
    KEY `user_id` (`user_id`),
    CONSTRAINT `user_course_ibfk_1`
        FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
    CONSTRAINT `user_course_ibfk_2`
        FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

insert into user_course (user_id, course_id)
values (2, 1);
insert into user_course (user_id, course_id)
values (3, 1);
insert into user_course (user_id, course_id)
values (4, 2);
insert into user_course (user_id, course_id)
values (5, 3);
insert into user_course (user_id, course_id)
values (6, 3);