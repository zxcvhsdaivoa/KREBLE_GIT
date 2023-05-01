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
-- Table structure for table `mysquad`
--

DROP TABLE IF EXISTS `mysquad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mysquad` (
  `user_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `mysquad_no` int NOT NULL AUTO_INCREMENT,
  `mysquad_name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `fomation` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `director` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `player1` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `player2` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `player3` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `player4` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `player5` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `player6` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `player7` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `player8` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `player9` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `player10` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `player11` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `disclose` varchar(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'no',
  `make_date` date NOT NULL,
  `view_count` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`mysquad_no`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mysquad`
--

LOCK TABLES `mysquad` WRITE;
/*!40000 ALTER TABLE `mysquad` DISABLE KEYS */;
INSERT INTO `mysquad` VALUES ('testid',26,'f87579ecba','4-3-3','Guus Hiddink','Lee Chung-Yong','Lee Chung-Yong','Park Chu-Young','Kwon Chang-Hoon','Hwang Hee-Chan','Kwak Tae-Hwi','Ji Dong-Won','Jang Hyun-Soo','Lee Jae-Sung','Koo Ja-Cheol','Kim Seung-Gyu','yes','2023-04-12',48),('testid',27,'3a3e654bc1','4-2-2-2','Paulo Bento','Kim Shin-Wook','Lee Yong','Ki Sung-Yueng','Cha Du-Ri','Park Chu-Young','Kim Min-Jae','Lee Jae-Sung','Hwang Hee-Chan','Lee Yong','Hwang Hee-Chan','Jo Hyeon-Woo','yes','2023-04-12',2),('testid',28,'18abdfa5b0','4-2-2-2','Cha Bum-Kun','Kim Young-Gwon','Cha Du-Ri','Hong Chul','Yoon Bit-Garam','Park Ji-Sung','Kim Young-Gwon','Hong Jeong-Ho','Koo Ja-Cheol','Park Ji-Sung','Park Ji-Sung','Jo Hyeon-Woo','no','2023-04-12',56),('gkwlak',29,'089e2adedf','4-3-3','Cha Bum-Kun','Hwang Hee-Chan','Cha Du-Ri','Ji Dong-Won','Kim Young-Gwon','Lee Chung-Yong','Ji Dong-Won','Kim Young-Gwon','Hong Jeong-Ho','Hong Chul','Lee Chung-Yong','Kim Seung-Gyu','no','2023-04-12',79),('rmfotj',30,'4a407996b7','4-1-2-3','Park Hang-Seo','Lee Jae-Sung','Ji Dong-Won','Hong Chul','Hwang Hee-Chan','Lee Keun-Ho','Hong Jeong-Ho','Yun Suk-Young','Son Heung-Min','Lee Dong-Gook','Lee Yong','Jo Hyeon-Woo','yes','2023-04-12',46),('rmfotj',31,'463761fb94','4-2-3-1','Park Hang-Seo','Kwon Kyung-Won','Ki Sung-Yueng','Nam Tae-Hee','Lee Keun-Ho','Lee Keun-Ho','Kwon Kyung-Won','Kim Min-Jae','Park Chu-Young','Yun Suk-Young','Cha Du-Ri','Kim Seung-Gyu','no','2023-04-12',74),('gkwlak',32,'92d2e5d599','4-2-3-1','Park Hang-Seo','Cha Du-Ri','Kim Young-Gwon','Son Jun-Ho','Park Chu-Young','Cha Du-Ri','Lee Keun-Ho','Kim Min-Jae','Kim Young-Gwon','Lee Kang-In','Lee Dong-Gook','Kim Young-Kwang','yes','2023-04-12',24),('gkwlak',33,'224a38b453','4-1-2-3','Shin Tae-Yong','Ji Dong-Won','Lee Dong-Gook','Go Yo-Han','Jung Woo-Young','Lee Seung-Woo','Park Ji-Sung','Nam Tae-Hee','Jung Woo-Young','Kim Min-Jae','Son Heung-Min','Kim Young-Kwang','yes','2023-04-12',67),('testid',34,'d738b3c2e5','4-2-2-2','Guus Hiddink','Nam Tae-Hee','Cha Du-Ri','Go Yo-Han','Lee Yong','Park Chu-Young','Go Yo-Han','Hwang Hee-Chan','Go Yo-Han','Cha Du-Ri','Yun Suk-Young','Kim Young-Kwang','yes','2023-04-12',41);
/*!40000 ALTER TABLE `mysquad` ENABLE KEYS */;
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
