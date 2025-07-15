-- MariaDB dump 10.19  Distrib 10.11.8-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: awococado
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
-- Current Database: `awococado`
--

/*!40000 DROP DATABASE IF EXISTS `awococado`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `awococado` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `awococado`;

--
-- Table structure for table `auditors`
--

DROP TABLE IF EXISTS `auditors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditors` (
  `AuditorID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Specialty` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`AuditorID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditors`
--

LOCK TABLES `auditors` WRITE;
/*!40000 ALTER TABLE `auditors` DISABLE KEYS */;
INSERT INTO `auditors` VALUES
(1, 'John Smith', 'Financial Audit', 'john.smith@example.com', '+1-555-1234'),
(2, 'Maria Garcia', 'Compliance', 'maria.garcia@example.com', '+52-55-9876-5432'),
(3, 'Chen Wei', 'Internal Audit', 'chen.wei@example.com', '+86-10-1234-5678'),
(4, 'Aisha Khan', 'Quality Control', 'aisha.khan@example.com', '+91-22-8765-4321'),
(5, 'Luis Perez', 'Risk Assessment', 'luis.perez@example.com', '+52-33-1234-5678');
/*!40000 ALTER TABLE `auditors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banks`
--

DROP TABLE IF EXISTS `banks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banks` (
  `BankID` int(11) NOT NULL AUTO_INCREMENT,
  `BankNameID` int(11) NOT NULL,
  `AccountNumber` varchar(30) NOT NULL,
  `Clabe` varchar(25) NOT NULL,
  `BankType` varchar(1) NOT NULL,
  `Date` date DEFAULT NULL,
  `Balance` float DEFAULT NULL,
  PRIMARY KEY (`BankID`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banks`
--

LOCK TABLES `banks` WRITE;
/*!40000 ALTER TABLE `banks` DISABLE KEYS */;
INSERT INTO `banks` VALUES
(1, 101, '12345678901234567890', '012345678901234567', 'P', '2023-01-01', 15000.50),
(2, 102, '09876543210987654321', '987654321098765432', 'A', '2023-06-15', 250000.00),
(3, 103, '11223344556677889900', '123456789012345678', 'P', '2024-03-20', 5000.75),
(4, 104, '99887766554433221100', '987654321098765432', 'P', '2023-11-10', 75000.00),
(5, 105, '55667788990011223344', '456789012345678901', 'A', '2024-01-30', 120000.00);
/*!40000 ALTER TABLE `banks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificate_cancellations`
--

DROP TABLE IF EXISTS `certificate_cancellations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificate_cancellations` (
  `CancellationID` int(11) NOT NULL AUTO_INCREMENT,
  `CertificateID` int(11) NOT NULL,
  `CancellationDate` date NOT NULL,
  `Reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CancellationID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificate_cancellations`
--

LOCK TABLES `certificate_cancellations` WRITE;
/*!40000 ALTER TABLE `certificate_cancellations` DISABLE KEYS */;
INSERT INTO `certificate_cancellations` VALUES
(1, 10, '2024-04-01', 'Duplicate certificate issued'),
(2, 12, '2024-05-15', 'Certificate revoked due to fraud'),
(3, 14, '2024-06-20', 'Expiration date correction'),
(4, 15, '2024-07-10', 'User requested cancellation'),
(5, 18, '2024-07-22', 'Certificate invalidated by authority');
/*!40000 ALTER TABLE `certificate_cancellations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates`
--

DROP TABLE IF EXISTS `certificates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates` (
  `CertificateID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `CertificateName` varchar(150) NOT NULL,
  `IssueDate` date NOT NULL,
  `ExpiryDate` date DEFAULT NULL,
  PRIMARY KEY (`CertificateID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates`
--

LOCK TABLES `certificates` WRITE;
/*!40000 ALTER TABLE `certificates` DISABLE KEYS */;
INSERT INTO `certificates` VALUES
(10, 1, 'Project Management Professional', '2023-01-10', '2026-01-10'),
(11, 2, 'Certified Financial Analyst', '2022-05-05', '2025-05-05'),
(12, 3, 'Information Security Certified', '2023-09-15', '2026-09-15'),
(13, 4, 'Quality Assurance Expert', '2021-11-20', NULL),
(14, 5, 'Risk Management Specialist', '2024-02-28', '2027-02-28');
/*!40000 ALTER TABLE `certificates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contribution_cancellations`
--

DROP TABLE IF EXISTS `contribution_cancellations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contribution_cancellations` (
  `CancellationID` int(11) NOT NULL AUTO_INCREMENT,
  `ContributionID` int(11) NOT NULL,
  `CancellationDate` date NOT NULL,
  `Reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CancellationID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contribution_cancellations`
--

LOCK TABLES `contribution_cancellations` WRITE;
/*!40000 ALTER TABLE `contribution_cancellations` DISABLE KEYS */;
INSERT INTO `contribution_cancellations` VALUES
(1, 100, '2024-03-15', 'Duplicate contribution entry'),
(2, 102, '2024-04-10', 'Contribution amount incorrect'),
(3, 105, '2024-05-25', 'User revoked contribution'),
(4, 107, '2024-06-05', 'System error detected'),
(5, 110, '2024-07-01', 'Contribution cancelled by admin');
/*!40000 ALTER TABLE `contribution_cancellations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `CountryID` int(11) NOT NULL AUTO_INCREMENT,
  `CountryName` varchar(100) NOT NULL,
  `CountryCode` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`CountryID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES
(1, 'Mexico', 'MX'),
(2, 'United States', 'US'),
(3, 'Canada', 'CA'),
(4, 'Germany', 'DE'),
(5, 'Japan', 'JP');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fees`
--

DROP TABLE IF EXISTS `fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fees` (
  `FeeID` int(11) NOT NULL AUTO_INCREMENT,
  `FeeName` varchar(100) NOT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`FeeID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Dumping data for table `fees`
--

LOCK TABLES `fees` WRITE;
/*!40000 ALTER TABLE `fees` DISABLE KEYS */;
INSERT INTO `fees` VALUES
(1, 'Registration Fee', 50.00, 'Fee for registering a new account'),
(2, 'Service Fee', 25.50, 'Monthly service charge'),
(3, 'Late Payment Fee', 15.00, 'Fee for late payment'),
(4, 'Cancellation Fee', 30.00, 'Fee for cancelling service'),
(5, 'Processing Fee', 10.00, 'Fee for processing requests');
/*!40000 ALTER TABLE `fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipality`
--

DROP TABLE IF EXISTS `municipality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `municipality` (
  `MunicipalityID` int(11) NOT NULL AUTO_INCREMENT,
  `MunicipalityName` varchar(100) NOT NULL,
  `StateID` int(11) NOT NULL,
  PRIMARY KEY (`MunicipalityID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipality`
--

LOCK TABLES `municipality` WRITE;
/*!40000 ALTER TABLE `municipality` DISABLE KEYS */;
INSERT INTO `municipality` VALUES
(1, 'New York', 1),
(2, 'Chicago', 2),
(3, 'Houston', 3),
(4, 'Los Angeles', 4),
(5, 'Miami', 5);
/*!40000 ALTER TABLE `municipality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `origin_details`
--

DROP TABLE IF EXISTS `origin_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `origin_details` (
  `OriginID` int(11) NOT NULL AUTO_INCREMENT,
  `OriginName` varchar(100) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`OriginID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `origin_details`
--

LOCK TABLES `origin_details` WRITE;
/*!40000 ALTER TABLE `origin_details` DISABLE KEYS */;
INSERT INTO `origin_details` VALUES
(1, 'Local Farm', 'Originates from local agricultural farms'),
(2, 'Import', 'Products imported from foreign sources'),
(3, 'Wholesale Distributor', 'Originates from wholesale distributors'),
(4, 'Organic Certified', 'Certified organic agricultural products'),
(5, 'Direct Producer', 'Directly sourced from producers and farmers');
/*!40000 ALTER TABLE `origin_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packers`
--

DROP TABLE IF EXISTS `packers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `packers` (
  `PackerID` int(11) NOT NULL AUTO_INCREMENT,
  `PackerName` varchar(100) NOT NULL,
  `ContactName` varchar(100) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PackerID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packers`
--

LOCK TABLES `packers` WRITE;
/*!40000 ALTER TABLE `packers` DISABLE KEYS */;
INSERT INTO `packers` VALUES
(1, 'Central Packing', 'John Perez', '333-123-4567', '123 Main St, New York, NY'),
(2, 'PackCo', 'Anna Martinez', '444-987-6543', '67 Elm St, Chicago, IL'),
(3, 'LogiPack', 'Charles Lopez', '555-321-7890', '789 Oak Ave, Los Angeles, CA'),
(4, 'FreshPack', 'Mary Gomez', '222-765-4321', '456 Maple Blvd, Houston, TX'),
(5, 'QuickPack', 'Louis Hernandez', '666-234-5678', '101 Moon St, Miami, FL');
/*!40000 ALTER TABLE `packers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `PaymentID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `Amount` float NOT NULL,
  `PaymentDate` date NOT NULL,
  `PaymentMethod` varchar(50) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`PaymentID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES
(1, 1, 150.75, '2024-01-15', 'Credit Card', 'Completed'),
(2, 2, 200.00, '2024-02-10', 'Bank Transfer', 'Pending'),
(3, 1, 99.99, '2024-03-05', 'PayPal', 'Completed'),
(4, 3, 50.00, '2024-04-20', 'Cash', 'Completed'),
(5, 4, 300.00, '2024-05-30', 'Credit Card', 'Failed');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regulations`
--

DROP TABLE IF EXISTS `regulations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regulations` (
  `RegulationID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) NOT NULL,
  `Description` text DEFAULT NULL,
  `EffectiveDate` date DEFAULT NULL,
  PRIMARY KEY (`RegulationID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regulations`
--

LOCK TABLES `regulations` WRITE;
/*!40000 ALTER TABLE `regulations` DISABLE KEYS */;
INSERT INTO `regulations` VALUES
(1, 'Data Privacy Policy', 'Regulations concerning user data protection.', '2023-01-01'),
(2, 'Financial Reporting Standards', 'Rules for financial statement preparation.', '2022-07-15'),
(3, 'Environmental Compliance', 'Requirements for environmental impact.', '2024-02-01'),
(4, 'Workplace Safety', 'Safety protocols for employees.', '2021-11-30'),
(5, 'Transport Regulations', 'Standards for transport operations.', '2023-09-10');
/*!40000 ALTER TABLE `regulations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `states` (
  `StateID` int(11) NOT NULL AUTO_INCREMENT,
  `CountryID` int(11) NOT NULL,
  `StateName` varchar(100) NOT NULL,
  PRIMARY KEY (`StateID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES
(1, 1, 'California'),
(2, 1, 'Texas'),
(3, 2, 'Ontario'),
(4, 2, 'Quebec'),
(5, 3, 'New South Wales');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transport_modes`
--

DROP TABLE IF EXISTS `transport_modes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transport_modes` (
  `TransportModeID` int(11) NOT NULL AUTO_INCREMENT,
  `ModeName` varchar(100) NOT NULL,
  `Description` text DEFAULT NULL,
  PRIMARY KEY (`TransportModeID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transport_modes`
--

LOCK TABLES `transport_modes` WRITE;
/*!40000 ALTER TABLE `transport_modes` DISABLE KEYS */;
INSERT INTO `transport_modes` VALUES
(1, 'Air', 'Transportation by airplanes or helicopters'),
(2, 'Sea', 'Transportation via ships and boats'),
(3, 'Road', 'Transportation using trucks, cars, and buses'),
(4, 'Rail', 'Transportation by trains and subways'),
(5, 'Pipeline', 'Transportation of liquids and gases via pipelines');
/*!40000 ALTER TABLE `transport_modes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `UserRoleID` int(11) NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(100) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`UserRoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES
(1, 'Administrator', 'Full access to all system features'),
(2, 'Editor', 'Can edit content but has limited admin rights'),
(3, 'Viewer', 'Read-only access to system data'),
(4, 'Auditor', 'Access to audit and reporting features'),
(5, 'Guest', 'Limited access for guest users');
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `PasswordHash` varchar(255) NOT NULL,
  `UserRoleID` int(11) NOT NULL,
  `CreatedDate` date NOT NULL,
  `LastLogin` datetime DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1, 'john.doe', 'john.doe@example.com', 'hashedpassword123', 1, '2024-01-01', '2024-07-01 10:00:00'),
(2, 'jane.smith', 'jane.smith@example.com', 'hashedpassword456', 2, '2024-02-15', '2024-07-02 14:30:00'),
(3, 'michael.brown', 'michael.brown@example.com', 'hashedpassword789', 3, '2024-03-10', NULL),
(4, 'emily.jones', 'emily.jones@example.com', 'hashedpassword012', 4, '2024-04-05', '2024-07-05 08:45:00'),
(5, 'guest.user', 'guest.user@example.com', 'hashedpassword345', 5, '2024-05-20', NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
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