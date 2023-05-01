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
-- Table structure for table `rent_review`
--

DROP TABLE IF EXISTS `rent_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rent_review` (
  `review_num` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL,
  `review_title` varchar(50) NOT NULL,
  `review_content` mediumtext NOT NULL,
  `review_good` int NOT NULL DEFAULT '0',
  `review_readcount` int NOT NULL DEFAULT '0',
  `review_date` date NOT NULL,
  `review_rating` int NOT NULL,
  PRIMARY KEY (`review_num`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `rent_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rent_review`
--

LOCK TABLES `rent_review` WRITE;
/*!40000 ALTER TABLE `rent_review` DISABLE KEYS */;
INSERT INTO `rent_review` VALUES (1,'testid','test11','asdfgf',0,0,'2023-04-03',3),(2,'testid','후기게시판 오픈','바람직하게 이용합시다',0,0,'2023-04-03',5),(4,'y222','테스트트트트','테스트트트트',9,1,'2023-04-03',1),(5,'rkskek','가나다라','마바사',0,0,'2023-04-03',5),(6,'rkskek','잠실구장','ㅇㅇ 좋음',0,0,'2023-04-03',5),(7,'rmfotj','테스트 알바중','테스트테스트',0,0,'2023-04-03',1),(8,'testid','호텔 조식이 최고에요!','조용한 방과 더불어 정말 맛있는 조식을 먹을 수 있어서 좋았습니다. 다음에도 꼭 이용하고 싶네요.',0,0,'2023-04-05',4),(10,'testid','룸서비스가 좋네요','룸서비스 메뉴가 다양하고 맛도 좋아서 정말 좋았습니다. 다음에도 이용할 의향이 있습니다.',10,3,'2023-04-05',4),(12,'testid','가성비 최고!','가격대비 품질이 정말 좋습니다. 침대도 넓고 편안하고 객실 내부도 깨끗합니다. 추천합니다.',0,0,'2023-04-05',4),(14,'testid','조용하고 쾌적한 환경','조용한 환경에서 편안한 휴식을 취할 수 있습니다. 특히 객실 내부가 깨끗하고 청결해서 좋았습니다.',0,0,'2023-04-05',4),(15,'testid','편안한 침대','침대가 매우 편안해서 깊은 잠을 잘 수 있었습니다. 방도 깨끗하고 조용해서 좋았습니다.',0,0,'2023-04-05',5),(17,'testid','전망도 좋고 위치도 좋아요','바다를 바라볼 수 있는 전망이 정말 좋고, 주변에 맛집과 다양한 편의시설도 많습니다. 추천합니다.',0,0,'2023-04-05',5),(19,'testid','직원들이 친절해요','직원들이 매우 친절하고 문제 발생 시 빠르게 해결해주어서 감사합니다. 객실 내부도 깨끗하고 편안합니다.',2,1,'2023-04-05',5);
/*!40000 ALTER TABLE `rent_review` ENABLE KEYS */;
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
