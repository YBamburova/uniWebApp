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
    `id`        int                      NOT NULL AUTO_INCREMENT,
    `username`  varchar(255)              NOT NULL,
    `name`      varchar(255)              NOT NULL,
    `surname`   varchar(255)             NOT NULL,
    `email`     varchar(255)              NOT NULL,
    `password`  varchar(255)              NOT NULL,
    `is_blocked` tinyint(1)               NOT NULL DEFAULT 0,
    `type`      enum ('student','admin') NOT NULL DEFAULT 'student',
    `educational_program`      enum ('typical', 'modified', 'adaptive') NOT NULL DEFAULT 'typical',
    `support_level` int           NOT NULL default 0,
    `additional_info` varchar(255),
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
VALUES (1, 'ybamburova', 'Yuliana', 'Bamburova', 'ybamburova@mail.com', 'ybamburova', 0, 'admin', 'typical', 0, null),
       (2, 'nazar', 'Nazar', 'Сrosseyed', 'nazarokulist@example.com', 'nazar', 0, 'student', 'adaptive', 5, null),
       (3, 'proman', 'Pan', 'Roman', 'shelly.woods@example.com', 'proman', 0, 'student', 'typical', 1, null),
       (4, 'vasyl', 'Vasyl', 'Simpson', 'heather.simpson@example.com', 'vasyl', 0,
        'student', 'typical', 2, null),
       (5, 'alexburke', 'Alex', 'Burke', 'alex.burke@example.com', 'TdthXZ8XwOkUaIq', 0, 'student', 'typical', 3, null),
       (6, 'christyevans', 'Christy', 'Evans', 'christy.evans@example.com', 'TmYnCkucmZbnSe5', 0, 'student', 'typical', 4, null);
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
    `id`          int                   NOT NULL AUTO_INCREMENT,
    `test_id`     int                   NOT NULL,
    `text`        varchar(255)          NOT NULL,
    `option1`     varchar(255)         NOT NULL,
    `option2`     varchar(255)         NOT NULL,
    `option3`     varchar(255)         NOT NULL,
    `option4`     varchar(255)         NOT NULL,
    `o1is_correct` tinyint(1)               NOT NULL DEFAULT 0,
    `o2is_correct` tinyint(1)               NOT NULL DEFAULT 0,
    `o3is_correct` tinyint(1)               NOT NULL DEFAULT 0,
    `o4is_correct` tinyint(1)               NOT NULL DEFAULT 0,
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
       (43, 32, 'ghdhgdhdghdghdghd', '++++++', 'fgsdgfsgfsd', 'gsdfgsdfgfsd', 'gsdfgsdfgsdf', 1, 0, 0,
        0),
       (44, 34, 'bbvbvbvb', '4242234', '4224243', '342424', '4234234423', 0, 0, 0, 1),
       (45, 32, 'fdsfsd', 'fdsfsdfsd', 'fsdfsd', 'fsdfsd', 'ffsdfsdfsd', 0, 0, 1, 0),
       (46, 40, 'What of the following is the default value of a local variable?', 'null', '0',
        'Depends upon the type of variable', 'Not assigned', 0, 0, 0, 1),
       (47, 40, 'What is the default value of float variable?', '0.0d', '0.0f', '0', 'not defined', 0, 1,
        0, 0),
       (48, 40, 'What is the default value of Object variable?', 'undefined', '0', 'null', 'not defined', 0,
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


DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course`
(
    `id`                 int         NOT NULL AUTO_INCREMENT,
    `name`               varchar(45) NOT NULL,
    `complexity`         int         NOT NULL,
    `content`            text         NOT NULL,
    `educational_program`      enum ('typical', 'modified', 'adaptive') NOT NULL DEFAULT 'typical',
    PRIMARY KEY (`id`),
    UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

DROP TABLE IF EXISTS `user_course`;
CREATE TABLE `user_course` (
                                    `user_id` int NOT NULL,
                                    `course_id` int NOT NULL,
                                    `started_date` timestamp null,
                                    `finished_date` timestamp null,
                                    PRIMARY KEY (`user_id`,`course_id`),
                                    KEY `user_id` (`user_id`),
                                    CONSTRAINT `user_course_ibfk_1`
                                        FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
                                    CONSTRAINT `user_course_ibfk_2`
                                        FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;