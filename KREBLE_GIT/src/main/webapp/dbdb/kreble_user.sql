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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` varchar(20) NOT NULL,
  `user_nick` varchar(40) DEFAULT NULL,
  `user_name` varchar(20) NOT NULL,
  `user_pass` varchar(20) NOT NULL,
  `user_call` varchar(15) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_adr` text NOT NULL,
  `user_gender` varchar(10) NOT NULL,
  `user_birth` date NOT NULL,
  `user_join` date NOT NULL,
  `user_cash` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('asdf122','임시닉네임1234','1111','111','010-1111-1111','1111111111@naver.com','28456충북 청주시 흥덕구 1순환로 384충북 청주시 흥덕구 신봉동 28-21 (신봉동)','남','2023-04-19','2023-04-19',0),('asdf66','asdgf','aaggg','11','1234567','asd@111','asdf1111','W','2023-04-03','2023-04-03',10000000),('gkwlak','gkwlak','gkwlak','gkwlak','010gkwl','gkwlE','testC','W','2023-02-02','2023-03-31',10000000),('rkskek','rkskek','rkskek','rkskek','010rksk','rkskem','teatB','M','2023-02-02','2023-03-31',10000000),('rmfotj','rmfotj','rmfotj','rmfotj','010rmfo','rmfoE','testD','W','2023-03-31','2023-03-31',10000000),('testid','test','testN','11','010test','testE','testA','M','2023-03-31','2023-03-31',10000000),('y222','y222','222','222','010-1-222','223qqq@naver.com','63308제주특별자치도 제주시 첨단로 4제주특별자치도 제주시 영평동 2009-711 (영평동)','남','2023-04-03','2023-04-03',10000000);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
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
