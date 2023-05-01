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
-- Table structure for table `field_info`
--

DROP TABLE IF EXISTS `field_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `field_info` (
  `field_id` varchar(20) NOT NULL,
  `field_fullname` varchar(45) NOT NULL,
  `field_image` text NOT NULL,
  `field_price` int NOT NULL,
  `field_name` varchar(30) NOT NULL,
  `field_location` text NOT NULL,
  `field_map` text NOT NULL,
  `field_area` int NOT NULL,
  `field_usetime` text NOT NULL,
  `field_facility` varchar(80) DEFAULT NULL,
  `field_call` varchar(20) NOT NULL,
  PRIMARY KEY (`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_info`
--

LOCK TABLES `field_info` WRITE;
/*!40000 ALTER TABLE `field_info` DISABLE KEYS */;
INSERT INTO `field_info` VALUES ('i_000','[인천]인천대공원 축구장','rent9',15654,'인천대공원축구장','인천 남동구 무네미로 238','http://kko.to/otobXSAMue',68000,'3~4월,9~11월 22:00, 5~7월 - 8월 06:00~22:00 , 12~2월 08:00 - 16:00','인조잔디,숲체험원,정원,스케이트장,화장실','032-514-8746'),('s_000','[서울]잠실종합운동장','rent4',1,'잠실종합 운동장','서울 송파구 올림픽로 25','http://kko.to/RCVMoMWaAb',70115,'하절기(4~9월) : 조기 05:00~08:00, 주간 08:00~19:00, 야간 19:00~05:00 동절기(10~3월) : 조기 06:00~09:00, 주간 09:00~18:00,야간 18:00~06:00','주차장,천연잔디,샤워장,푸드코트,풋살장,종합 운동기구','02-2240-8802'),('s_001','[서울]노량진 축구장','rent5',1111,'노량진 축구장','서울 동작구 노들로 688 노량진수산시장','http://kko.to/NhBRcHmtbJ',111,'하절기(4~9월) : 조기 05:00~08:00, 주간 08:00~19:00, 야간 19:00~05:00 동절기(10~3월) : 조기 06:00~09:00, 주간 09:00~18:00,야간 18:00~06:00','주차장,샤워장,야간 조명,인조 잔디','111'),('s_002','[서울]월곡인조잔디 축구장','rent6',111,'월곡인조잔디 축구장','서울 성북구 화랑로13길 144 성북구민체육관','http://kko.to/TTUtr2NRxj',75023,'하절기(4~9월) : 조기 05:00~08:00, 주간 08:00~19:00, 야간 19:00~05:00 동절기(10~3월) : 조기 06:00~09:00, 주간 09:00~18:00,야간 18:00~06:00','인조잔디,풋살장,족구장,테니스장,주차장','02-053-1111'),('s_003','[서울]은평구립 축구장','rent7',123,'은평구립축구장','서울 은평구 진관1로 46','http://kko.to/hzruGdK6Tt',50122,'하절기(4~9월) : 조기 05:00~08:00, 주간 08:00~19:00, 야간 19:00~05:00 동절기(10~3월) : 조기 06:00~09:00, 주간 09:00~18:00,야간 18:00~06:00','인조찬디,주차장,공원,화장실','02-350-5304'),('s_004','[서울]천마공원 축구장','rent8',123458,'천마공원 축구장','서울 송파구 마천동 산1-5','http://kko.to/7BbvQocJp-',40985,'하절기(4~9월) : 조기 05:00~08:00, 주간 08:00~19:00, 야간 19:00~05:00 동절기(10~3월) : 조기 06:00~09:00, 주간 09:00~18:00,야간 18:00~06:00','인조잔디,화장실,야간 조명탑,공원','02-403-2395'),('s_005','[서울]창골 축구장','rent10',123415,'창골 축구장','서울 도봉구 해등로3길 48-11','http://kko.to/ABJ-ZpJiyL',39000,'하절기(4~9월) : 조기 05:00~08:00, 주간 08:00~19:00, 야간 19:00~05:00 동절기(10~3월) : 조기 06:00~09:00, 주간 09:00~18:00,야간 18:00~06:00','인조잔디,인근공원,음수대,테니스장,생태연못,화장실','02-901-5127');
/*!40000 ALTER TABLE `field_info` ENABLE KEYS */;
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
