-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: hiker_app
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `hiker_id` int NOT NULL,
  `hiking_event_id` int NOT NULL,
  `booking_date` date NOT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `payment_reference_no` varchar(50) DEFAULT NULL,
  `amount_paid` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `hiker_id` (`hiker_id`),
  KEY `hiking_event_id` (`hiking_event_id`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`hiker_id`) REFERENCES `hiker` (`hiker_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`hiking_event_id`) REFERENCES `hiking_event` (`hiking_event_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `camp`
--

DROP TABLE IF EXISTS `camp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camp` (
  `camp_id` int NOT NULL AUTO_INCREMENT,
  `camp_name` varchar(100) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `max_capacity` int DEFAULT NULL,
  PRIMARY KEY (`camp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camp`
--

LOCK TABLES `camp` WRITE;
/*!40000 ALTER TABLE `camp` DISABLE KEYS */;
/*!40000 ALTER TABLE `camp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `camp_participant`
--

DROP TABLE IF EXISTS `camp_participant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camp_participant` (
  `camp_id` int NOT NULL,
  `hiker_id` int NOT NULL,
  PRIMARY KEY (`camp_id`,`hiker_id`),
  KEY `hiker_id` (`hiker_id`),
  CONSTRAINT `camp_participant_ibfk_1` FOREIGN KEY (`camp_id`) REFERENCES `camp` (`camp_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `camp_participant_ibfk_2` FOREIGN KEY (`hiker_id`) REFERENCES `hiker` (`hiker_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camp_participant`
--

LOCK TABLES `camp_participant` WRITE;
/*!40000 ALTER TABLE `camp_participant` DISABLE KEYS */;
/*!40000 ALTER TABLE `camp_participant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount`
--

DROP TABLE IF EXISTS `discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount` (
  `discount_id` int NOT NULL AUTO_INCREMENT,
  `discount_type` varchar(50) NOT NULL,
  `discount_pct` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`discount_id`),
  UNIQUE KEY `discount_type` (`discount_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount`
--

LOCK TABLES `discount` WRITE;
/*!40000 ALTER TABLE `discount` DISABLE KEYS */;
/*!40000 ALTER TABLE `discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gear`
--

DROP TABLE IF EXISTS `gear`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gear` (
  `gear_id` int NOT NULL AUTO_INCREMENT,
  `gear_name` varchar(100) DEFAULT NULL,
  `total_quantity` int DEFAULT NULL,
  `borrowed_quantity` int DEFAULT '0',
  `rental_rate` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`gear_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gear`
--

LOCK TABLES `gear` WRITE;
/*!40000 ALTER TABLE `gear` DISABLE KEYS */;
INSERT INTO `gear` VALUES (51,'Tent',10,0,1000.00),(52,'Sleeping Bag',12,0,1001.00),(53,'Backpack',13,0,1002.00),(54,'Portable Stove',10,0,1003.00),(55,'Water FIlter',5,0,1004.00),(56,'Lantern',21,0,1005.00),(57,'Folding Chair',27,0,1006.00),(58,'Folding Table',11,0,1007.00),(59,'Trekking Pole',17,0,1008.00);
/*!40000 ALTER TABLE `gear` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gear_rental`
--

DROP TABLE IF EXISTS `gear_rental`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gear_rental` (
  `rental_id` int NOT NULL AUTO_INCREMENT,
  `gear_id` int NOT NULL,
  `hiker_id` int NOT NULL,
  `borrow_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `amount_due` decimal(10,2) DEFAULT NULL,
  `amount_paid` decimal(10,2) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`rental_id`),
  KEY `gear_id` (`gear_id`),
  KEY `hiker_id` (`hiker_id`),
  CONSTRAINT `gear_rental_ibfk_1` FOREIGN KEY (`gear_id`) REFERENCES `gear` (`gear_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `gear_rental_ibfk_2` FOREIGN KEY (`hiker_id`) REFERENCES `hiker` (`hiker_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gear_rental`
--

LOCK TABLES `gear_rental` WRITE;
/*!40000 ALTER TABLE `gear_rental` DISABLE KEYS */;
INSERT INTO `gear_rental` VALUES (13,51,11,'2025-11-01','2025-12-01','9999-01-01',30000.00,0.00,'UNPAID');
/*!40000 ALTER TABLE `gear_rental` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hiker`
--

DROP TABLE IF EXISTS `hiker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hiker` (
  `hiker_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `join_date` date DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `discount_id` int DEFAULT NULL,
  PRIMARY KEY (`hiker_id`),
  KEY `discount_id` (`discount_id`),
  CONSTRAINT `hiker_ibfk_1` FOREIGN KEY (`discount_id`) REFERENCES `discount` (`discount_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hiker`
--

LOCK TABLES `hiker` WRITE;
/*!40000 ALTER TABLE `hiker` DISABLE KEYS */;
INSERT INTO `hiker` VALUES (11,'Ryan','Paguila','2000-04-10','2020-04-01','M',NULL),(12,'Karl','Divinagracia','2000-04-11','2020-04-02','M',NULL),(13,'Hayden','Lazaro','2000-04-12','2020-04-03','M',NULL),(14,'Enzo','Atienza','2000-04-13','2020-04-04','M',NULL),(15,'Joshua ','Nacasabog','2000-04-14','2020-04-05','M',NULL),(16,'Marc','Bobadilla','2000-04-15','2020-04-06','M',NULL),(17,'Byron','Ang','2000-04-16','2020-04-07','M',NULL),(18,'Nathan','Trinidad','2000-04-17','2020-04-08','M',NULL),(19,'superman','batman','2000-04-18','2020-04-09','M',NULL),(110,'error','404','2000-04-19','2020-04-10','F',NULL);
/*!40000 ALTER TABLE `hiker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hiking_event`
--

DROP TABLE IF EXISTS `hiking_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hiking_event` (
  `hiking_event_id` int NOT NULL AUTO_INCREMENT,
  `camp_id` int DEFAULT NULL,
  `hiking_event_name` varchar(100) NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  `difficulty` varchar(50) DEFAULT NULL,
  `distance` decimal(6,2) DEFAULT NULL,
  `points` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `max_participants` int DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `commission_rate` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`hiking_event_id`),
  KEY `camp_id` (`camp_id`),
  CONSTRAINT `hiking_event_ibfk_1` FOREIGN KEY (`camp_id`) REFERENCES `camp` (`camp_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hiking_event`
--

LOCK TABLES `hiking_event` WRITE;
/*!40000 ALTER TABLE `hiking_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `hiking_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill`
--

DROP TABLE IF EXISTS `skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skill` (
  `skill_id` int NOT NULL AUTO_INCREMENT,
  `skill_name` varchar(100) NOT NULL,
  PRIMARY KEY (`skill_id`),
  UNIQUE KEY `skill_name` (`skill_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill`
--

LOCK TABLES `skill` WRITE;
/*!40000 ALTER TABLE `skill` DISABLE KEYS */;
/*!40000 ALTER TABLE `skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour_guide`
--

DROP TABLE IF EXISTS `tour_guide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tour_guide` (
  `tour_guide_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `sex` char(1) DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `years_of_experience` int DEFAULT '0',
  `commission_rate` decimal(5,2) DEFAULT '0.10',
  `rating` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`tour_guide_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour_guide`
--

LOCK TABLES `tour_guide` WRITE;
/*!40000 ALTER TABLE `tour_guide` DISABLE KEYS */;
/*!40000 ALTER TABLE `tour_guide` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour_guide_assignment`
--

DROP TABLE IF EXISTS `tour_guide_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tour_guide_assignment` (
  `tg_assignment_id` int NOT NULL AUTO_INCREMENT,
  `tour_guide_id` int NOT NULL,
  `hiking_event_id` int NOT NULL,
  `assigned_date` date DEFAULT NULL,
  `feedback_score` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`tg_assignment_id`),
  KEY `tour_guide_id` (`tour_guide_id`),
  KEY `hiking_event_id` (`hiking_event_id`),
  CONSTRAINT `tour_guide_assignment_ibfk_1` FOREIGN KEY (`tour_guide_id`) REFERENCES `tour_guide` (`tour_guide_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tour_guide_assignment_ibfk_2` FOREIGN KEY (`hiking_event_id`) REFERENCES `hiking_event` (`hiking_event_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour_guide_assignment`
--

LOCK TABLES `tour_guide_assignment` WRITE;
/*!40000 ALTER TABLE `tour_guide_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tour_guide_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour_guide_skill`
--

DROP TABLE IF EXISTS `tour_guide_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tour_guide_skill` (
  `tour_guide_id` int NOT NULL,
  `skill_id` int NOT NULL,
  PRIMARY KEY (`tour_guide_id`,`skill_id`),
  KEY `skill_id` (`skill_id`),
  CONSTRAINT `tour_guide_skill_ibfk_1` FOREIGN KEY (`tour_guide_id`) REFERENCES `tour_guide` (`tour_guide_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tour_guide_skill_ibfk_2` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`skill_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour_guide_skill`
--

LOCK TABLES `tour_guide_skill` WRITE;
/*!40000 ALTER TABLE `tour_guide_skill` DISABLE KEYS */;
/*!40000 ALTER TABLE `tour_guide_skill` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-01 16:38:31
