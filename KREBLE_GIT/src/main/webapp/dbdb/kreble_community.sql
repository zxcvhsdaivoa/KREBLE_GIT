-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: kreble
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `community`
--

DROP TABLE IF EXISTS `community`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `community` (
  `user_id` varchar(20) NOT NULL,
  `commu_no` int NOT NULL AUTO_INCREMENT,
  `category` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `commu_title` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `commu_write` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `commu_file` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `commu_readcount` int NOT NULL,
  `commu_wrday` datetime NOT NULL,
  PRIMARY KEY (`commu_no`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `userid` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community`
--

LOCK TABLES `community` WRITE;
/*!40000 ALTER TABLE `community` DISABLE KEYS */;
INSERT INTO `community` VALUES ('testid',20,'free','Pogba is the best','2345',NULL,0,'2023-04-05 16:22:40'),('testid',23,'debate','De Bruyne is the best','4567',NULL,0,'2023-04-05 16:22:40'),('testid',24,'qna','Lewandowski is the best','8901',NULL,0,'2023-04-05 16:22:40'),('testid',25,'free','제목입니다22','442740',NULL,0,'2023-04-05 16:35:41'),('testid',31,'free','제목입니다93','312835',NULL,0,'2023-04-05 16:35:43'),('testid',37,'free','제목입니다31','231117',NULL,0,'2023-04-05 16:35:44'),('testid',38,'free','제목입니다32','22984',NULL,0,'2023-04-05 16:35:44'),('testid',39,'free','제목입니다59','598579',NULL,0,'2023-04-05 16:35:44'),('testid',40,'free','제목입니다16','265795',NULL,0,'2023-04-05 16:35:44'),('testid',41,'free','제목입니다31','101967',NULL,0,'2023-04-05 16:35:44'),('testid',42,'free','제목입니다53','980950',NULL,1,'2023-04-05 16:35:44'),('testid',43,'free','제목입니다52','722911',NULL,0,'2023-04-05 16:35:44'),('testid',53,'free','제목입니다43','723566',NULL,0,'2023-04-05 16:36:01'),('testid',56,'free','제목입니다49','851180',NULL,1,'2023-04-05 16:36:02'),('testid',57,'free','제목입니다29','186505',NULL,11,'2023-04-05 16:36:02'),('testid',58,'free','ㄴㅁㅇㄹㄴㅇㅁㄹㄴㅇㅁㄹㄴㅇㅁ','홀어ㅜ호럴옿ㄴㄹ온ㄹㅇ','background-player2.png',1,'2023-04-19 15:01:24'),('testid',59,'free','ㄴㅇㅁㄹㄴㅇㅁㄹㄴㅇㅁ','ㅎㄴ웋ㄹ어ㅜ호르호러홀','null',0,'2023-04-19 15:01:33');
/*!40000 ALTER TABLE `community` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-19 17:10:33
