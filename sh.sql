-- MySQL dump 10.13  Distrib 8.0.26, for macos11.4 (arm64)
--
-- Host: localhost    Database: smart_home
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `Device`
--

DROP TABLE IF EXISTS `Device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Device` (
  `id_device` int NOT NULL AUTO_INCREMENT,
  `id_room` int NOT NULL,
  `device_name` varchar(255) NOT NULL DEFAULT 'my new device',
  `device_desc` varchar(255) DEFAULT 'device desc',
  `id_device_status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_device`),
  KEY `id_room` (`id_room`),
  KEY `id_device_status` (`id_device_status`),
  CONSTRAINT `device_ibfk_1` FOREIGN KEY (`id_room`) REFERENCES `Room` (`id_room`),
  CONSTRAINT `device_ibfk_2` FOREIGN KEY (`id_device_status`) REFERENCES `DeviceStatus` (`id_device_status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Device`
--

LOCK TABLES `Device` WRITE;
/*!40000 ALTER TABLE `Device` DISABLE KEYS */;
INSERT INTO `Device` VALUES (1,1,'Light','device desc',2),(2,1,'Fan','device desc',2);
/*!40000 ALTER TABLE `Device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DeviceStatus`
--

DROP TABLE IF EXISTS `DeviceStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DeviceStatus` (
  `id_device_status` int NOT NULL AUTO_INCREMENT,
  `status` varchar(255) NOT NULL,
  `status_desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_device_status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DeviceStatus`
--

LOCK TABLES `DeviceStatus` WRITE;
/*!40000 ALTER TABLE `DeviceStatus` DISABLE KEYS */;
INSERT INTO `DeviceStatus` VALUES (1,'ON','Device ON'),(2,'OFF','Device OFF');
/*!40000 ALTER TABLE `DeviceStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `House`
--

DROP TABLE IF EXISTS `House`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `House` (
  `id_house` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `house_name` varchar(255) NOT NULL DEFAULT 'my new house',
  `house_desc` varchar(255) DEFAULT 'house desc',
  PRIMARY KEY (`id_house`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `house_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `User` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `House`
--

LOCK TABLES `House` WRITE;
/*!40000 ALTER TABLE `House` DISABLE KEYS */;
INSERT INTO `House` VALUES (1,1,'House','house desc');
/*!40000 ALTER TABLE `House` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Room`
--

DROP TABLE IF EXISTS `Room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Room` (
  `id_room` int NOT NULL AUTO_INCREMENT,
  `id_house` int NOT NULL,
  `room_name` varchar(255) NOT NULL DEFAULT 'my new room',
  `room_desc` varchar(255) DEFAULT 'room desc',
  PRIMARY KEY (`id_room`),
  KEY `id_house` (`id_house`),
  CONSTRAINT `room_ibfk_1` FOREIGN KEY (`id_house`) REFERENCES `House` (`id_house`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Room`
--

LOCK TABLES `Room` WRITE;
/*!40000 ALTER TABLE `Room` DISABLE KEYS */;
INSERT INTO `Room` VALUES (1,1,'Master Room','room desc');
/*!40000 ALTER TABLE `Room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_first_name` varchar(255) NOT NULL,
  `user_last_name` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'dea','mail','daniel','espinosa','123');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-18 23:03:52
