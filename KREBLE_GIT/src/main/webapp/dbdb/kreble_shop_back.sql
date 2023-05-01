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
-- Table structure for table `shop_back`
--

DROP TABLE IF EXISTS `shop_back`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_back` (
  `sb_name` varchar(10) NOT NULL,
  `sb_prd_id` varchar(20) NOT NULL COMMENT '판매자아이디',
  `sb_prd` varchar(10) NOT NULL,
  `sb_qunt` int NOT NULL,
  `sb_img` text NOT NULL,
  `sb_buy_id` varchar(20) NOT NULL COMMENT '구매자아이디',
  `sb_color` varchar(20) NOT NULL,
  `sb_price` int NOT NULL,
  `sb_total` int NOT NULL,
  KEY `sb_id_idx` (`sb_prd_id`),
  KEY `sb_prd_idx` (`sb_prd`),
  KEY `sb_buy_id_idx` (`sb_buy_id`),
  CONSTRAINT `sb_buy_id` FOREIGN KEY (`sb_buy_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sb_prd` FOREIGN KEY (`sb_prd`) REFERENCES `product` (`prd_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sb_prd_id` FOREIGN KEY (`sb_prd_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_back`
--

LOCK TABLES `shop_back` WRITE;
/*!40000 ALTER TABLE `shop_back` DISABLE KEYS */;
INSERT INTO `shop_back` VALUES ('유니폼2','rkskek','u0014',1,'u0014.jpg','rkskek','빨강',80000,80000),('유니폼','rkskek','u0007',1,'u0001.jpg','rkskek','검정',50000,50000),('기타','testid','e0009',1,'e0001.jpg','rkskek','회색',70000,70000),('기타용품','testid','e0011',1,'e0011.jpg','rkskek','노랑',20000,20000),('기타용품3','rmfotj','e0020',1,'e0020.jpg','rkskek','노랑',30000,30000),('수건','testid','e0003',1,'e0001.jpg','rkskek','검정',25000,25000),('축구공2','rkskek','b0014',1,'b0014.jpg','rkskek','파랑',15000,15000),('축구공','gkwlak','b0009',1,'b0001.jpg','rkskek','빨강',20000,20000),('축구화','rmfotj','s0004',1,'s0004.jpg','testid','노랑',150000,150000),('축구화','gkwlak','s0002',1,'s0002.jpg','testid','검정',100000,100000);
/*!40000 ALTER TABLE `shop_back` ENABLE KEYS */;
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
