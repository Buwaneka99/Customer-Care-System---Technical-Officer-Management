-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: customer_care_system
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `agent`
--

DROP TABLE IF EXISTS `agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Email` varchar(45) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Contact` varchar(10) NOT NULL,
  `Date_of_Problem_arose` datetime DEFAULT CURRENT_TIMESTAMP,
  `Problerm` varchar(2500) NOT NULL,
  `Answered_Date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Technical_Officer_Answer` varchar(2500) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent`
--

LOCK TABLES `agent` WRITE;
/*!40000 ALTER TABLE `agent` DISABLE KEYS */;
INSERT INTO `agent` VALUES (1,'Buwa@gmail.con','Buwa','2225','2024-12-20 11:59:28','dsfg','2025-01-01 00:42:22',NULL),(2,'Nal@gmil.com','nal','0123456789','2024-12-29 00:00:00','adeingn','2024-12-31 03:34:37','Mr. Nal,\r\n\r\nYeh, I will solve that problem.'),(3,'wela@gmail.com','wel','3333333333','2024-12-30 01:37:10','qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqdddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd','2024-12-30 13:17:46','fuweg ity43iutyiu43t viu43yt3u45yu43 u4y743uq y76y743h5435 8765u435 4543654n rtry tyy4676 5y654ytrh try65ryrthwerty ey4rtyth eryy 5ryty 5ry4ytr y t4y4 654y 654u 6u ty t4y 64 u erg fhy u 54y drh ter h6 u dh yu 6r yr y64 u64yu65yut y46u65u6y5ey try6ruy 54654yurthdftu6 y64u654 u5ey54yu 5 y4 u64u4 u354y 54 764  5y 64 y5 yu43 y 654 u6u');
/*!40000 ALTER TABLE `agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Email` varchar(45) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Contact` varchar(10) NOT NULL,
  `Date_of_Problem_arose` datetime DEFAULT CURRENT_TIMESTAMP,
  `Problem` varchar(2500) NOT NULL,
  `Answered_Date` datetime DEFAULT NULL,
  `Technical_Officer_Answer` varchar(2500) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'buwa@gmail.com','buwa','34567','2024-12-20 16:49:18','fsgmhhdscvb nmg',NULL,'huef yuern j ierkmne teriui 9uijmt34 i'),(2,'nal@gmail.com','nal','0123456789','2024-12-30 20:46:01','dgdfhjih jiujhruer utitrht uuther retyeurtheru t tiuhtjr uyu terth kjtrjtrutter jerjhiuthe trjhyiuryjtrny tryjhtrjy trutrhiuhrtjy truutrijytrkjh t tjtrh jhtihjtrh kjjhkmtrmhj ktjihut hitrjh trhjtr h itrhlr mhoitrjkh klh trk hktrlh kjthkjtrh tr hit htrijhmktrh tr h thtro ih9tr ihlktr hhtdkjbd,mhr h iutrihtrohi trihurtkhmfghjtr hkltrjh itrouhi otrhoit iuh9oitrjhklfg fugnujikhlmdfgljhktjhkt bjifghkgm n,fg n fg oitrn',NULL,'dfgdfg   trpykoi otpiyotrkjyiuhdr ijtruoiytr uiuoiuoiyoitryuoirtyj iuoiyutr 9yur yoiuyoiutri ytriyuoi iuoiuyoitruyoirtu iuyitruoiyurt iuy iotruyoi truoiytr yiuy troiyuoiyu oitoiyutroiy troyuoirtuyktr utryutruiyurky d ut yiutriyurt yiutoiy oitruy98uydsmry 9iusy mtrh tr9iyuoitr yoitry9875490otmhkjlsrdhg ojuerygkjternyerutoy kjry esyiutryiuiuerit yoi5 yu t 3eteroigiteroy tiuoiteyy');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `summary`
--

DROP TABLE IF EXISTS `summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `summary` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Summary_Added_Date` datetime DEFAULT CURRENT_TIMESTAMP,
  `Type` varchar(10) NOT NULL,
  `Solved` int NOT NULL,
  `Tobe` int NOT NULL,
  `Updated_Date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Note` varchar(2500) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `summary`
--

LOCK TABLES `summary` WRITE;
/*!40000 ALTER TABLE `summary` DISABLE KEYS */;
INSERT INTO `summary` VALUES (1,'2024-12-11 00:00:00','Customers',10,33,'2025-01-01 01:27:20','ergh 342'),(2,'2024-12-11 00:00:00','Customers',10,33,'2025-01-01 14:32:36','ergh tt'),(3,'2024-12-11 00:00:00','Customers',10,33,'2025-01-01 14:34:39','ergh ff'),(4,'2024-12-18 00:00:00','Agent',10,77,'2025-01-01 14:33:35','dsfgf ee'),(5,'2024-12-02 00:00:00','Customer',10,55,'2025-01-01 14:35:23','Zxfhvbjnk ff'),(6,'2024-12-18 00:00:00','None',10,33,'2025-01-01 14:38:47','vbnm gg gg 44'),(7,'2024-12-19 00:00:00','None',10,33,NULL,'vbnm'),(8,'2024-12-19 00:00:00','None',10,33,NULL,'vbnm'),(9,'2024-12-18 00:00:00','None',6,5,NULL,'gg'),(10,'2024-12-11 00:00:00','Customer',6,33,NULL,'nnkn'),(11,'2024-12-16 00:00:00','Customer',10,5,NULL,'dty'),(12,'2024-12-16 00:00:00','Agent',10,22,NULL,'fghm\r\n'),(13,'2024-12-16 00:00:00','Customer',10,5,NULL,'sdfg'),(14,'2024-12-16 00:00:00','Customer',10,5,NULL,'sdfg'),(15,'2024-12-16 00:00:00','Agent',3,4,NULL,'sdvc'),(16,'2024-12-02 00:00:00','Agent',3,22,NULL,'2'),(17,'2024-12-02 00:00:00','Agent',10,33,NULL,'g'),(18,'2024-12-04 00:00:00','Customer',10,5,NULL,'dfgh'),(19,'2024-12-16 00:00:00','Customer',10,5,NULL,'sdfg'),(20,'2024-12-16 00:00:00','Customer',10,5,NULL,'sdfg'),(21,'2024-12-04 00:00:00','Customer',3,6,NULL,'huuhh'),(22,'2024-12-04 00:00:00','Customer',3,6,NULL,'huuhh'),(23,'2024-12-01 00:00:00','Agent',1,4,'2025-01-01 01:30:21','gvbnm niyamai sudda'),(24,'2024-12-01 00:00:00','Agent',3,4,'2025-01-01 14:20:48','gvbnm ferter67'),(25,'2024-12-01 00:00:00','Agent',3,4,NULL,'gvbnm'),(26,'2024-12-01 00:00:00','Agent',3,4,NULL,'gvbnm'),(27,'2024-12-01 00:00:00','Agent',3,4,NULL,'gvbnm'),(28,'2024-12-01 00:00:00','Agent',3,4,'2025-01-01 14:31:44','gvbnm new tt'),(29,'2024-12-02 00:00:00','Customer',3,4,NULL,'mkm'),(30,'2024-12-02 00:00:00','Customer',3,4,NULL,'mkm'),(31,'2024-12-02 00:00:00','Customer',3,4,NULL,'mkm'),(32,'2024-12-02 00:00:00','Customer',3,4,NULL,'mkm'),(33,'2024-12-02 00:00:00','Customer',3,4,NULL,'mkm'),(34,'2024-12-02 00:00:00','Customer',3,4,NULL,'mkm'),(35,'2024-12-02 00:00:00','Customer',5,4,'2025-01-01 01:29:51','mkm yeah'),(36,'2024-12-02 00:00:00','Customer',3,4,NULL,'mkm'),(37,'2024-12-02 00:00:00','Agent',5,5,NULL,'5555'),(38,'2024-12-02 00:00:00','Agent',5,5,NULL,'5555'),(39,'2024-12-02 00:00:00','Agent',5,5,NULL,'5555'),(40,'2024-12-02 00:00:00','Agent',5,5,NULL,'5555'),(41,'2024-12-04 00:00:00','Agent',6,6,NULL,'xcvbnm'),(42,'2024-12-04 00:00:00','Agent',6,6,NULL,'xcvbnm'),(43,'2024-12-05 00:00:00','Agent',2,2,NULL,'bfghj'),(44,'2024-12-05 00:00:00','Agent',2,2,NULL,'bfghj'),(45,'2024-12-04 00:00:00','Customer',10,3,NULL,'xdfghj'),(46,'2024-12-04 00:00:00','Customer',10,3,NULL,'xdfghj'),(47,'2024-12-04 00:00:00','Customer',10,3,NULL,'xdfghj'),(48,'2024-12-04 00:00:00','Customer',10,3,NULL,'xdfghj'),(49,'2024-12-04 00:00:00','Agent',10,10,NULL,'10'),(50,'2024-12-05 00:00:00','Customer',41,44,'2024-12-20 23:08:41','444'),(51,'2024-12-04 00:00:00','Agent',55,55,'2024-12-20 23:00:00','5555'),(52,'2024-12-11 00:00:00','Agent',11,11,NULL,'1111111'),(53,'2024-12-05 00:00:00','Agent',10,33,NULL,'3333'),(54,'2024-12-20 00:00:00','Customer',10,33,NULL,'wertyjk'),(55,'2024-12-29 15:53:44','Agent',10,33,NULL,'111');
/*!40000 ALTER TABLE `summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `technical_officer`
--

DROP TABLE IF EXISTS `technical_officer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `technical_officer` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Contact` varchar(10) NOT NULL,
  `Address` varchar(45) NOT NULL,
  `Email` varchar(25) NOT NULL,
  `Username` varchar(45) NOT NULL,
  `Password` varchar(16) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technical_officer`
--

LOCK TABLES `technical_officer` WRITE;
/*!40000 ALTER TABLE `technical_officer` DISABLE KEYS */;
INSERT INTO `technical_officer` VALUES (1,'Buwaneka Wijesinghe','0723456776','Sri Lanka','buwa@gmail.com','buwa','11'),(2,'Nalaka','0333225643','Jaffna','nal@gmail.com','nala','nal');
/*!40000 ALTER TABLE `technical_officer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-16  9:45:36
