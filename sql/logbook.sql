-- MariaDB dump 10.19  Distrib 10.11.8-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: logbook
-- ------------------------------------------------------
-- Server version	10.11.8-MariaDB-cll-lve

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `logbook`
--

/*!40000 DROP DATABASE IF EXISTS `logbook`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `logbook` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `logbook`;

--
-- Table structure for table `error_logs`
--

DROP TABLE IF EXISTS `error_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `error_logs` (
  `ErrorID` int(11) NOT NULL AUTO_INCREMENT,
  `Timestamp` datetime NOT NULL,
  `Module` varchar(50) NOT NULL,
  `Username` varchar(50) DEFAULT NULL,
  `Description` varchar(255) NOT NULL,
  `ErrorMessage` varchar(500) NOT NULL,
  PRIMARY KEY (`ErrorID`),
  INDEX (`Timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `error_logs`
--

LOCK TABLES `error_logs` WRITE;
/*!40000 ALTER TABLE `error_logs` DISABLE KEYS */;
INSERT INTO `error_logs` VALUES
(1, '2024-07-29 19:56:26', 'ContactForm', 'annett.vargas', 'Error saving message to DB', 'Table \'bitacora.hdj\' does not exist'),
(2, '2024-07-29 20:06:42', 'ContactForm', 'annett.vargas', 'Error saving message to DB', 'Table \'bitacora.bbdhew\' does not exist'),
(3, '2024-08-01 10:15:00', 'Login', 'john.smith', 'Failed DB connection', 'SQLSTATE[HY000] [1045] Access denied for user \'john\'@\'localhost\''),
(4, '2024-08-02 14:30:22', 'PaymentModule', 'maria.garcia', 'Timeout error', 'Server timeout while processing payment');
/*!40000 ALTER TABLE `error_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_messages`
--

DROP TABLE IF EXISTS `user_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_messages` (
  `MessageID` int(11) NOT NULL AUTO_INCREMENT,
  `Timestamp` datetime NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Email` varchar(254) NOT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `UserType` varchar(50) DEFAULT NULL,
  `MessageContent` text NOT NULL,
  PRIMARY KEY (`MessageID`),
  INDEX (`Timestamp`),
  INDEX (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_messages`
--

LOCK TABLES `user_messages` WRITE;
/*!40000 ALTER TABLE `user_messages` DISABLE KEYS */;
INSERT INTO `user_messages` VALUES
(1, '2024-08-10 09:15:00', 'Ann Doe', 'ann.doe@example.com', '+52-1-333-123-4567', 'Visitor', 'Hello, I have a question about your services.'),
(2, '2024-08-11 13:45:20', 'John Smith', 'john.smith@example.com', '+1-555-987-6543', 'Client', 'I need support with my account.'),
(3, '2024-08-12 16:30:10', 'Maria Garcia', 'maria.garcia@example.com', NULL, 'Partner', 'Can you provide the latest report?');
/*!40000 ALTER TABLE `user_messages` ENABLE KEYS */;
UNLOCK TABLES;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-20-19  7:46:07