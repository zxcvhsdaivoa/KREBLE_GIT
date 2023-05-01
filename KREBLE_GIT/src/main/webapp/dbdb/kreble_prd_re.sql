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
-- Table structure for table `prd_re`
--

DROP TABLE IF EXISTS `prd_re`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prd_re` (
  `prd_re_num` int NOT NULL AUTO_INCREMENT,
  `prd_re_id` varchar(20) NOT NULL,
  `prd_re_text` text,
  `prd_re_sc` int NOT NULL DEFAULT '10',
  `prd_re_no` varchar(10) NOT NULL,
  PRIMARY KEY (`prd_re_num`),
  KEY `prd_re_id_idx` (`prd_re_id`),
  KEY `prd_re_no_idx` (`prd_re_no`),
  CONSTRAINT `prd_re_id` FOREIGN KEY (`prd_re_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `prd_re_no` FOREIGN KEY (`prd_re_no`) REFERENCES `product` (`prd_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prd_re`
--

LOCK TABLES `prd_re` WRITE;
/*!40000 ALTER TABLE `prd_re` DISABLE KEYS */;
INSERT INTO `prd_re` VALUES (1,'testid','첫 번째 댓글 내용',5,'u0007'),(2,'y222','두 번째 댓글 내용',3,'s0010'),(4,'gkwlak','네 번째 댓글 내용',1,'b0010'),(5,'testid','다섯 번째 댓글 내용',2,'u0008'),(6,'y222','여섯 번째 댓글 내용',10,'s0010'),(7,'rmfotj','일곱 번째 댓글 내용',6,'e0008'),(8,'gkwlak','여덟 번째 댓글 내용',6,'b0007'),(36,'testid','아홉 번째 댓글 내용',4,'u0010'),(37,'y222','열 번째 댓글 내용',4,'s0007'),(39,'gkwlak','열두 번째 댓글 내용',7,'b0010'),(40,'testid','열세 번째 댓글 내용',3,'u0010'),(41,'y222','열네 번째 댓글 내용',1,'s0008'),(42,'rmfotj','열다섯 번째 댓글 내용',10,'e0008'),(43,'gkwlak','열여섯 번째 댓글 내용',3,'b0010'),(44,'testid','열일곱 번째 댓글 내용',6,'u0008'),(45,'y222','열여덟 번째 댓글 내용',9,'s0008'),(47,'gkwlak','스무 번째 댓글 내용',8,'u0009'),(48,'testid','스물 하나 번째 댓글 내용',1,'e0008'),(49,'rmfotj','스물 둘 번째 댓글 내용',8,'s0009'),(50,'y222','스물 셋 번째 댓글 내용',9,'b0009'),(51,'rmfotj','스물 넷 번째 댓글 내용',2,'u0010'),(52,'gkwlak','스물 다섯 번째 댓글 내용',5,'s0009'),(66,'testid','댓글입니다1',8,'u0005'),(67,'rkskek','댓글입니다4',2,'b0009'),(68,'y222','댓글입니다3',1,'s0005'),(70,'testid','댓글입니다14',10,'u0005'),(71,'rkskek','댓글입니다10',1,'b0010'),(72,'y222','댓글입니다8',3,'s0008'),(73,'gkwlak','댓글입니다9',2,'u0006'),(74,'testid','댓글입니다16',2,'b0007'),(75,'rkskek','댓글입니다16',1,'s0006'),(76,'y222','댓글입니다13',7,'e0005'),(77,'gkwlak','댓글입니다20',8,'u0005'),(78,'testid','댓글입니다17',8,'b0007'),(79,'rkskek','댓글입니다16',8,'s0009'),(80,'y222','댓글입니다24',4,'u0009'),(81,'gkwlak','댓글입니다25',3,'b0007'),(82,'testid','댓글입니다18',9,'s0008'),(83,'rkskek','댓글입니다18',9,'e0005'),(84,'y222','댓글입니다24',10,'u0009'),(85,'gkwlak','댓글입니다28',3,'b0009'),(86,'testid','댓글입니다29',1,'s0009'),(87,'y222','댓글입니다25',9,'u0005'),(89,'testid','댓글입니다24',8,'s0006'),(90,'rkskek','댓글입니다28',8,'e0009'),(92,'gkwlak','댓글입니다27',4,'b0007'),(93,'testid','댓글입니다33',2,'s0005'),(94,'y222','댓글입니다36',6,'u0008'),(95,'gkwlak','댓글입니다36',1,'b0008'),(96,'testid','댓글입니다34',4,'s0008'),(97,'rkskek','댓글입니다37',4,'e0010'),(98,'y222','댓글입니다41',6,'u0010'),(99,'gkwlak','댓글입니다43',10,'b0005'),(100,'testid','댓글입니다36',8,'s0005'),(101,'rkskek','댓글입니다40',9,'e0009'),(102,'y222','댓글입니다43',10,'u0008'),(104,'rkskek','댓글입니다46',10,'s0008'),(105,'y222','댓글입니다49',2,'e0010'),(106,'testid','222',4,'u0020'),(107,'testid','ㅁㄴㅇㄴㅁㅇㅁㄴ',7,'u0020'),(108,'testid','12312312',7,'u0020'),(109,'testid','11111',10,'u0018'),(110,'testid','좃ㄱㄷ족ㄷ',9,'u0018'),(111,'testid','ㅇㅁ롱홍홈',2,'u0018'),(115,'testid','ㅇㄹㅇㅁㄹ',4,'u0018'),(116,'testid','ㄹㅎㄹㅇㅎㅁㅎ',10,'u0015'),(118,'testid','이러면?',5,'s0008'),(119,'testid','11111',6,'u0014'),(120,'testid','아니 품질검사도 안하고 판매하는거 실화인가?\r\n',10,'u0014'),(121,'testid','ㅁㄴㅇㅁㄴㅇ',2,'u0020');
/*!40000 ALTER TABLE `prd_re` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-19 17:10:32
