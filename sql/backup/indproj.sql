-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: localhost    Database: indproj
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `course_id` int NOT NULL AUTO_INCREMENT,
  `name` char(70) DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'Algebra',1),(2,'Linear Algebra',1),(3,'World History',2),(4,'Discreet Mathematics',1),(5,'Statistical Analysis',1),(6,'Geometry',1),(7,'Second World War',2),(8,'Christopher Columbus',2),(9,'Natural Numbers',1),(10,'Astrology - Test',4),(11,'demo1',5);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `decks`
--

DROP TABLE IF EXISTS `decks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `decks` (
  `deck_id` int NOT NULL AUTO_INCREMENT,
  `course_id` int DEFAULT NULL,
  `name` char(70) DEFAULT NULL,
  PRIMARY KEY (`deck_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `decks_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `decks`
--

LOCK TABLES `decks` WRITE;
/*!40000 ALTER TABLE `decks` DISABLE KEYS */;
INSERT INTO `decks` VALUES (1,2,'Linear Algebra test 1'),(2,2,'Linear Algebra test 2'),(3,3,'World History test 1'),(4,3,'Adding1 - Test'),(5,2,'Linear Algebra - Test 3'),(6,10,'Astrology - Test - Deck'),(7,11,'demo-deck');
/*!40000 ALTER TABLE `decks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `question_id` int NOT NULL AUTO_INCREMENT,
  `deck_id` int DEFAULT NULL,
  `question_text` text,
  `answer` text,
  PRIMARY KEY (`question_id`),
  KEY `deck_id` (`deck_id`),
  CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`deck_id`) REFERENCES `decks` (`deck_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,1,'What is 2 + 2?','4'),(2,1,'What is 30 + 2?','32'),(3,2,'What is 2 + 4?','6'),(4,3,'Who was the first President of the United States?','George Washington'),(5,4,'test1','test-1'),(6,4,'test2','test-2'),(7,2,'What is 3+3?','6'),(8,4,'test3','test-3'),(9,6,'testtest','test123'),(10,7,'what is the time?','15.19'),(11,6,'test123','try1-3');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjects` (
  `subject_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`subject_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (4,'Astrology'),(2,'History'),(1,'Mathematics'),(5,'protoype1');
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-21 11:55:39
