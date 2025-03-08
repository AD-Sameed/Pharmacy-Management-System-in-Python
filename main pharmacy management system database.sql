CREATE DATABASE  IF NOT EXISTS `pharmacy` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pharmacy`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pharmacy
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `licenses`
--

DROP TABLE IF EXISTS `licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `licenses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `machine_id` varchar(255) NOT NULL,
  `license_key` varchar(255) NOT NULL,
  `activated` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licenses`
--

LOCK TABLES `licenses` WRITE;
/*!40000 ALTER TABLE `licenses` DISABLE KEYS */;
INSERT INTO `licenses` VALUES (2,'admin','4C-D5-77-5C-7E-E7','90521dce',1,'2024-10-21 05:05:29');
/*!40000 ALTER TABLE `licenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicine_daily_profit`
--

DROP TABLE IF EXISTS `medicine_daily_profit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicine_daily_profit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `medicine_id` int DEFAULT NULL,
  `medicine_name` varchar(255) DEFAULT NULL,
  `quantity_sold` int DEFAULT NULL,
  `total_sales` decimal(10,2) DEFAULT NULL,
  `total_cost` decimal(10,2) DEFAULT NULL,
  `profit_amount` decimal(10,2) DEFAULT NULL,
  `report_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_report_date` (`report_date`),
  KEY `idx_medicine_id` (`medicine_id`),
  CONSTRAINT `medicine_daily_profit_ibfk_1` FOREIGN KEY (`medicine_id`) REFERENCES `medicines` (`medicine_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine_daily_profit`
--

LOCK TABLES `medicine_daily_profit` WRITE;
/*!40000 ALTER TABLE `medicine_daily_profit` DISABLE KEYS */;
/*!40000 ALTER TABLE `medicine_daily_profit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicines`
--

DROP TABLE IF EXISTS `medicines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicines` (
  `medicine_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `quantity` int NOT NULL,
  `batch` varchar(50) DEFAULT NULL,
  `rack` varchar(50) DEFAULT NULL,
  `expiry` date NOT NULL,
  `store` date NOT NULL,
  `buying_price` decimal(10,2) NOT NULL,
  `selling_price` decimal(10,2) NOT NULL,
  `store_time` time NOT NULL,
  `supplier_id` int DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`medicine_id`),
  UNIQUE KEY `name` (`name`),
  KEY `supplier_id` (`supplier_id`),
  CONSTRAINT `medicines_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=12346 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicines`
--

LOCK TABLES `medicines` WRITE;
/*!40000 ALTER TABLE `medicines` DISABLE KEYS */;
INSERT INTO `medicines` VALUES (1,'asprin',40,'','','2024-10-22','2024-10-21',15.00,30.00,'10:40:15',1,'lgjslfgj','2024-10-21 10:40:15','2024-10-21 10:40:15');
/*!40000 ALTER TABLE `medicines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profit`
--

DROP TABLE IF EXISTS `profit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profit` (
  `profit_id` int NOT NULL AUTO_INCREMENT,
  `total_sales` decimal(10,2) NOT NULL,
  `total_cost` decimal(10,2) NOT NULL,
  `total_refunds` decimal(10,2) DEFAULT '0.00',
  `profit_amount` decimal(10,2) NOT NULL,
  `profit_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`profit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profit`
--

LOCK TABLES `profit` WRITE;
/*!40000 ALTER TABLE `profit` DISABLE KEYS */;
/*!40000 ALTER TABLE `profit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `returns`
--

DROP TABLE IF EXISTS `returns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `returns` (
  `return_id` int NOT NULL AUTO_INCREMENT,
  `sale_id` int NOT NULL,
  `medicine_id` int NOT NULL,
  `return_quantity` int NOT NULL,
  `refund_amount` decimal(10,2) NOT NULL,
  `return_reason` varchar(255) DEFAULT NULL,
  `return_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`return_id`),
  KEY `sale_id` (`sale_id`),
  KEY `medicine_id` (`medicine_id`),
  CONSTRAINT `returns_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`sale_id`) ON DELETE CASCADE,
  CONSTRAINT `returns_ibfk_2` FOREIGN KEY (`medicine_id`) REFERENCES `medicines` (`medicine_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `returns`
--

LOCK TABLES `returns` WRITE;
/*!40000 ALTER TABLE `returns` DISABLE KEYS */;
/*!40000 ALTER TABLE `returns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `sale_id` int NOT NULL AUTO_INCREMENT,
  `medicine_id` int NOT NULL,
  `quantity_sold` int NOT NULL,
  `selling_price` decimal(10,2) NOT NULL,
  `discount` decimal(5,2) DEFAULT '0.00',
  `total_price` decimal(10,2) NOT NULL,
  `amount_paid` decimal(10,2) NOT NULL,
  `change_given` decimal(10,2) DEFAULT '0.00',
  `sale_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `medicine_name` varchar(100) NOT NULL,
  PRIMARY KEY (`sale_id`),
  KEY `medicine_id` (`medicine_id`),
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`medicine_id`) REFERENCES `medicines` (`medicine_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shifted_medicines`
--

DROP TABLE IF EXISTS `shifted_medicines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shifted_medicines` (
  `shift_id` int NOT NULL AUTO_INCREMENT,
  `medicine_id` int NOT NULL,
  `medicine_name` varchar(100) NOT NULL,
  `quantity_shifted` int NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `shifted_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`shift_id`),
  KEY `medicine_id` (`medicine_id`),
  CONSTRAINT `shifted_medicines_ibfk_1` FOREIGN KEY (`medicine_id`) REFERENCES `medicines` (`medicine_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shifted_medicines`
--

LOCK TABLES `shifted_medicines` WRITE;
/*!40000 ALTER TABLE `shifted_medicines` DISABLE KEYS */;
/*!40000 ALTER TABLE `shifted_medicines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snapshot_medicines`
--

DROP TABLE IF EXISTS `snapshot_medicines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `snapshot_medicines` (
  `medicine_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `quantity` int NOT NULL,
  `batch` varchar(50) DEFAULT NULL,
  `rack` varchar(50) DEFAULT NULL,
  `expiry` date NOT NULL,
  `store` date NOT NULL,
  `buying_price` decimal(10,2) NOT NULL,
  `selling_price` decimal(10,2) NOT NULL,
  `store_time` time NOT NULL,
  `supplier_id` int DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`medicine_id`,`version`)
) ENGINE=InnoDB AUTO_INCREMENT=12346 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snapshot_medicines`
--

LOCK TABLES `snapshot_medicines` WRITE;
/*!40000 ALTER TABLE `snapshot_medicines` DISABLE KEYS */;
INSERT INTO `snapshot_medicines` VALUES (1,'asprin',40,'','','2024-10-22','2024-10-21',15.00,30.00,'10:40:15',1,'lgjslfgj','2024-10-21 10:40:15','2024-10-21 10:40:15',1);
/*!40000 ALTER TABLE `snapshot_medicines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `supplier_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `contact_person` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=556 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'saad','ali','23456',NULL,NULL,'2024-10-21 10:39:23','2024-10-21 10:39:23');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_medicines`
--

DROP TABLE IF EXISTS `transaction_medicines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_medicines` (
  `id` int NOT NULL AUTO_INCREMENT,
  `transaction_id` int NOT NULL,
  `medicine_name` varchar(255) NOT NULL,
  `sale_quantity` int NOT NULL,
  `bonus` int DEFAULT NULL,
  `pack` varchar(50) DEFAULT NULL,
  `batch` varchar(50) DEFAULT NULL,
  `trade_price` decimal(10,2) NOT NULL,
  `gross_amount` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `tax` decimal(10,2) DEFAULT NULL,
  `net_amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `transaction_id` (`transaction_id`),
  CONSTRAINT `transaction_medicines_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`transaction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_medicines`
--

LOCK TABLES `transaction_medicines` WRITE;
/*!40000 ALTER TABLE `transaction_medicines` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction_medicines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `supplier_id` int NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `paid_amount` decimal(10,2) NOT NULL,
  `remaining_amount` decimal(10,2) NOT NULL,
  `transaction_date` date NOT NULL,
  `grand_total` decimal(10,2) NOT NULL,
  `advance_tax` decimal(10,2) NOT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `supplier_id` (`supplier_id`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-21 11:31:45
