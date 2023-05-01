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
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player` (
  `player_name` varchar(60) NOT NULL,
  `player_ko_name` varchar(45) NOT NULL,
  `player_birth` date NOT NULL,
  `player_gender` varchar(10) NOT NULL,
  `player_position` varchar(3) NOT NULL,
  `player_profile` text,
  PRIMARY KEY (`player_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES ('Cha Du-Ri','차두리','1980-07-25','남성','DF',NULL),('Go Yo-Han','고요한','1988-06-06','남성','MF',NULL),('Hong Chul','홍철','1990-09-17','남성','DF',NULL),('Hong Jeong-Ho','홍정호','1989-08-12','남성','DF',NULL),('Hwang Hee-Chan','황희찬','1996-01-26','남성','FW',NULL),('Jang Hyun-Soo','장현수','1991-09-28','남성','DF',NULL),('Ji Dong-Won','지동원','1991-05-28','남성','FW',NULL),('Jo Hyeon-Woo','조현우','1991-09-25','남성','GK',NULL),('Jung Woo-Young','정우영','1989-12-14','남성','MF',NULL),('Ki Sung-Yueng','기성용','1989-01-24','남성','MF',NULL),('Kim Min-Jae','김민재','1996-11-15','남성','DF',NULL),('Kim Seung-Gyu','김승규','1990-09-30','남성','GK',NULL),('Kim Shin-Wook','김신욱','1988-04-14','남성','FW',NULL),('Kim Young-Gwon','김영권','1990-02-27','남성','DF',NULL),('Kim Young-Kwang','김영광','1992-06-15','남성','GK',NULL),('Koo Ja-Cheol','구자철','1989-02-27','남성','MF',NULL),('Kwak Tae-Hwi','곽태휘','1981-07-08','남성','DF',NULL),('Kwon Chang-Hoon','권창훈','1994-06-30','남성','MF',NULL),('Kwon Kyung-Won','권경원','1993-03-14','남성','DF',NULL),('Lee Chung-Yong','이청용','1988-07-02','남성','MF',NULL),('Lee Dong-Gook','이동국','1979-04-29','남성','FW',NULL),('Lee Jae-Sung','이재성','1992-08-10','남성','MF',NULL),('Lee Kang-In','이강인','2001-02-19','남성','MF',NULL),('Lee Keun-Ho','이근호','1985-04-11','남성','FW',NULL),('Lee Seung-Woo','이승우','1998-01-06','남성','FW',NULL),('Lee Yong','이용','1986-12-24','남성','DF',NULL),('Moon Seon-Min','문선민','1992-07-09','남성','FW',NULL),('Nam Tae-Hee','남태희','1991-06-27','남성','MF',NULL),('Park Chu-Young','박주영','1985-07-10','남성','FW',NULL),('Park Ji-Sung','박지성','1981-02-25','남성','MF',NULL),('Son Heung-Min','손흥민','1992-07-08','남성','FW',NULL),('Son Jun-Ho','손준호','1992-06-09','남성','MF',NULL),('Yoon Bit-Garam','윤빛가람','1993-02-20','남성','MF',NULL),('Yun Suk-Young','윤석영','1990-02-13','남성','DF',NULL);
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
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
