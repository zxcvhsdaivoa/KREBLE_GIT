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
-- Table structure for table `shop_reform`
--

DROP TABLE IF EXISTS `shop_reform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_reform` (
  `shop_renum` int NOT NULL AUTO_INCREMENT,
  `shop_recata` varchar(8) NOT NULL,
  `shop_retitle` varchar(45) NOT NULL,
  `shop_reid` varchar(20) NOT NULL,
  `shop_retrade` varchar(8) NOT NULL,
  `shop_requnt` int NOT NULL,
  `shop_redate` date NOT NULL,
  `shop_retext` text NOT NULL,
  PRIMARY KEY (`shop_renum`),
  KEY `shop_reid_idx` (`shop_reid`),
  CONSTRAINT `shop_reid` FOREIGN KEY (`shop_reid`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_reform`
--

LOCK TABLES `shop_reform` WRITE;
/*!40000 ALTER TABLE `shop_reform` DISABLE KEYS */;
INSERT INTO `shop_reform` VALUES (1,'유니폼','게시판테스트합니다','testid','거래완료',111,'2023-03-31','이게 퉤숫튜가 돼냐'),(2,'축구공','이거맞냐','testid','미체결',22,'2023-03-31','이거맞냐'),(3,'축구공','test2','rkskek','미체결',11,'2023-04-03','test2'),(5,'기타용품','기타용품','rmfotj','진행중',2,'2023-04-03','기타용품'),(11,'축구공','낚시입니다','gkwlak','미체결',1,'2023-04-03','gkwlak'),(12,'축구공','ㄹㅇ?','y222','미체결',222,'2023-04-03','이런거 필요함?'),(14,'축구공','제목51','testid','거래완료',436327,'2023-04-05','내용99'),(16,'유니폼','제목29','testid','거래중',232361,'2023-04-05','내용49'),(17,'기타용품','제목42','testid','미체결',642572,'2023-04-05','내용85'),(18,'축구화','제목26','testid','거래중',330969,'2023-04-05','내용97'),(22,'유니폼','제목82','testid','거래완료',592942,'2023-04-05','내용11'),(24,'기타용품','제목94','testid','미체결',456576,'2023-04-05','내용70'),(29,'유니폼','제목61','testid','거래중',448770,'2023-04-05','내용6'),(30,'기타용품','제목78','testid','미체결',232937,'2023-04-05','내용41'),(31,'축구화','제목69','testid','거래중',532013,'2023-04-05','내용68'),(35,'기타용품','제목15','testid','거래중',40381,'2023-04-05','내용29'),(41,'축구공','제목8','testid','거래중',581299,'2023-04-05','내용40'),(43,'축구공','제목입니다.','testid','미체결',424962,'2023-04-05','제목입니다.');
/*!40000 ALTER TABLE `shop_reform` ENABLE KEYS */;
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
