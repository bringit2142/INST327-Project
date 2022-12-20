DROP DATABASE IF EXISTS `dmvpublicfigures`;
CREATE DATABASE  IF NOT EXISTS `dmvpublicfigures` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dmvpublicfigures`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: dmvpublicfigures
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `city_id` int NOT NULL,
  `city` varchar(45) NOT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Washington D.C'),(2,'Baltimore'),(3,'Portsmouth'),(4,'Arlington'),(5,'Dumfries'),(6,'Columbia'),(7,'Gaitherburg'),(8,'Silver Spring'),(9,'Alexandria'),(10,'Suitland');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gender` (
  `gender_id` int NOT NULL,
  `gender` varchar(45) NOT NULL,
  PRIMARY KEY (`gender_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gender`
--

LOCK TABLES `gender` WRITE;
/*!40000 ALTER TABLE `gender` DISABLE KEYS */;
INSERT INTO `gender` VALUES (1,'Male'),(2,'Female'),(3,'Non Binary');
/*!40000 ALTER TABLE `gender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `info` (
  `info_id` int NOT NULL,
  `state` varchar(45) NOT NULL,
  `hometown_id` int NOT NULL,
  `birthplace_id` int NOT NULL,
  `school_id` int NOT NULL,
  `person_id` int NOT NULL,
  PRIMARY KEY (`info_id`),
  KEY `fk_info_city2_idx` (`hometown_id`),
  KEY `fk_info_city3_idx` (`birthplace_id`),
  KEY `fk_info_school1_idx` (`school_id`),
  KEY `fk_info_person1_idx` (`person_id`),
  CONSTRAINT `fk_info_city2` FOREIGN KEY (`hometown_id`) REFERENCES `city` (`city_id`),
  CONSTRAINT `fk_info_city3` FOREIGN KEY (`birthplace_id`) REFERENCES `city` (`city_id`),
  CONSTRAINT `fk_info_person1` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`),
  CONSTRAINT `fk_info_school1` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
INSERT INTO `info` VALUES (1,'District of Columbia',1,1,1,1),(2,'Maryland',2,2,2,2),(3,'Maryland',2,2,3,3),(4,'District of Columbia',1,1,4,4),(5,'Virginia',3,3,2,5),(6,'Virginia',4,4,6,6),(7,'District of Columbia',1,1,7,7),(8,'District of Columbia',1,1,8,8),(9,'Maryland',2,2,9,9),(10,'Virginia',3,3,10,10),(11,'Virginia',5,5,11,11),(12,'District of Columbia',1,1,12,12),(13,'Maryland',6,6,13,13),(14,'Maryland',7,7,2,14),(15,'District of Columbia',1,1,14,15),(16,'Maryland',8,8,15,16),(17,'Virginia',9,9,13,17),(18,'Maryland',6,6,2,18),(19,'Maryland',10,10,16,19),(20,'Maryland',6,6,17,20),(21,'Maryland',2,2,7,21);
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `occupation`
--

DROP TABLE IF EXISTS `occupation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `occupation` (
  `occupation_id` int NOT NULL,
  `occupation_title` varchar(45) NOT NULL,
  PRIMARY KEY (`occupation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `occupation`
--

LOCK TABLES `occupation` WRITE;
/*!40000 ALTER TABLE `occupation` DISABLE KEYS */;
INSERT INTO `occupation` VALUES (1,'Television'),(2,'Swimmer'),(3,'Basketball player'),(4,'politician'),(5,'Rapper'),(6,'Comedian'),(7,'Soccer Player'),(8,'VP at Oculus'),(9,'Football player'),(10,'Singer'),(11,'Songwriter'),(12,'Filmmaker'),(13,'Lawyer'),(14,'Author'),(15,'Businessman'),(16,'Producer'),(17,'Entrepreneur'),(18,'Game Programmer');
/*!40000 ALTER TABLE `occupation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `occupation_count`
--

DROP TABLE IF EXISTS `occupation_count`;
/*!50001 DROP VIEW IF EXISTS `occupation_count`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `occupation_count` AS SELECT 
 1 AS `name`,
 1 AS `state`,
 1 AS `school`,
 1 AS `number_of_occupations`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `occupation_type`
--

DROP TABLE IF EXISTS `occupation_type`;
/*!50001 DROP VIEW IF EXISTS `occupation_type`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `occupation_type` AS SELECT 
 1 AS `name`,
 1 AS `age`,
 1 AS `occupation_title`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `person_id` int NOT NULL,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) DEFAULT NULL,
  `age` int NOT NULL,
  `birthday` date NOT NULL,
  `race_id` int NOT NULL,
  `gender_id` int NOT NULL,
  PRIMARY KEY (`person_id`),
  KEY `fk_person_race2_idx` (`race_id`),
  KEY `fk_person_gender2_idx` (`gender_id`),
  CONSTRAINT `fk_person_gender2` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`gender_id`),
  CONSTRAINT `fk_person_race2` FOREIGN KEY (`race_id`) REFERENCES `race` (`race_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'Jonathan ','Banks',75,'1947-01-31',1,1),(2,'Micheal','Phelps',37,'1985-06-30',1,1),(3,'Kevin','Durant',34,'1988-09-29',2,1),(4,'Albert','Gore jr.',74,'1978-03-31',1,1),(5,'Missy','Elliott',51,'1971-07-01',2,2),(6,'Sandra','Bullock',58,'1964-07-26',1,2),(7,'Jeffrey ','Wright',56,'1965-12-07',2,1),(8,'Samuel ','Jackson',73,'1948-12-21',2,1),(9,'Julie ','Bowen',52,'1970-03-03',1,2),(10,'Wanda','Sykes',58,'1964-03-07',2,2),(11,'Ali','Krieger',38,'1984-07-28',1,2),(12,'Katie ','Ledecky',25,'1997-03-17',1,2),(13,'Brendan ','Iribe',43,'1979-08-12',1,1),(14,'Robert (Logic)','Hall II',32,'1990-01-22',3,1),(15,'Olubowale (Wale)','Akintimehin',38,'1984-09-21',2,1),(16,'Victor ','Oladipo',30,'1992-05-04',2,1),(17,'Stefon ','Diggs',29,'1993-11-29',2,1),(18,'Brent ','Faiyaz',27,'1995-09-19',2,1),(19,'Cordae','Dunston',25,'1997-08-26',3,1),(20,'Edward ','Norton',53,'1969-08-18',1,1),(21,'Antonio','Bowens',45,'1977-05-24',3,3);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_career`
--

DROP TABLE IF EXISTS `person_career`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person_career` (
  `person_id` int NOT NULL,
  `occupation_id` int NOT NULL,
  `start_year` year NOT NULL,
  `end_year` year DEFAULT NULL,
  KEY `fk_person_career_occupation1_idx` (`occupation_id`),
  KEY `fk_person_career_person1_idx` (`person_id`),
  CONSTRAINT `fk_person_career_occupation1` FOREIGN KEY (`occupation_id`) REFERENCES `occupation` (`occupation_id`),
  CONSTRAINT `fk_person_career_person1` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_career`
--

LOCK TABLES `person_career` WRITE;
/*!40000 ALTER TABLE `person_career` DISABLE KEYS */;
INSERT INTO `person_career` VALUES (1,1,1974,NULL),(2,2,2000,NULL),(3,3,2007,NULL),(4,4,1993,2001),(5,5,1991,NULL),(6,1,1987,NULL),(7,1,1990,NULL),(8,1,1972,NULL),(9,1,1992,NULL),(10,6,1987,NULL),(11,7,2003,NULL),(12,2,2012,NULL),(13,8,2012,NULL),(14,5,2014,NULL),(15,5,2009,NULL),(16,3,2009,NULL),(17,9,2012,NULL),(18,5,2017,NULL),(19,5,2019,NULL),(20,1,1993,NULL),(10,1,1987,NULL),(5,10,1991,NULL),(5,11,1991,NULL),(14,10,2014,NULL),(14,11,2014,NULL),(20,12,1993,NULL),(4,13,1993,2001),(4,14,1993,2001),(4,15,1993,2001),(8,16,1972,NULL),(6,16,1987,NULL),(13,17,2012,NULL),(13,18,2012,NULL),(21,4,2021,NULL);
/*!40000 ALTER TABLE `person_career` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `person_occupation`
--

DROP TABLE IF EXISTS `person_occupation`;
/*!50001 DROP VIEW IF EXISTS `person_occupation`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `person_occupation` AS SELECT 
 1 AS `name`,
 1 AS `start_year`,
 1 AS `occupation_title`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `race`
--

DROP TABLE IF EXISTS `race`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `race` (
  `race_id` int NOT NULL,
  `race` varchar(45) NOT NULL,
  PRIMARY KEY (`race_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `race`
--

LOCK TABLES `race` WRITE;
/*!40000 ALTER TABLE `race` DISABLE KEYS */;
INSERT INTO `race` VALUES (1,'White'),(2,'Black'),(3,'Mixed');
/*!40000 ALTER TABLE `race` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school`
--

DROP TABLE IF EXISTS `school`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school` (
  `school_id` int NOT NULL,
  `school` varchar(90) NOT NULL,
  PRIMARY KEY (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school`
--

LOCK TABLES `school` WRITE;
/*!40000 ALTER TABLE `school` DISABLE KEYS */;
INSERT INTO `school` VALUES (1,'Indiana University Bloomington'),(2,'Did not attend'),(3,'The University of Texas at Austin'),(4,'Vanderbilt Law School'),(6,'East Carolina University'),(7,'New York University'),(8,'Morehouse College'),(9,'Brown University'),(10,'Hampton University'),(11,'Penn State University'),(12,'Stanford University'),(13,'University of Maryland'),(14,'Bowie State University'),(15,'Indiana University'),(16,'Towson University'),(17,'Yale University');
/*!40000 ALTER TABLE `school` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_media`
--

DROP TABLE IF EXISTS `social_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_media` (
  `social_id` int NOT NULL,
  `handle` varchar(45) DEFAULT NULL,
  `platform` varchar(45) DEFAULT NULL,
  `follower_count` int DEFAULT NULL,
  `person_id` int NOT NULL,
  PRIMARY KEY (`social_id`),
  KEY `fk_social_media_person2_idx` (`person_id`),
  CONSTRAINT `fk_social_media_person2` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_media`
--

LOCK TABLES `social_media` WRITE;
/*!40000 ALTER TABLE `social_media` DISABLE KEYS */;
INSERT INTO `social_media` VALUES (1,NULL,NULL,NULL,1),(2,'m_phelps00','Instagram',3400000,2),(3,'easymoneysniper','Instagram',13100000,3),(4,'algore','Instagram',171000,4),(5,'missymisdemeanorelliott','Instagram',4900000,5),(6,NULL,NULL,NULL,6),(7,'jfreewright','Instagram',142000,7),(8,'samuelljackson','Instagram',7800000,8),(9,'itsjuliebowen','Instagram',1700000,9),(10,'iamwandasykes','Instagram',748000,10),(11,'alikrieger','Instagram',905000,11),(12,'katieledecky','Instagram',576000,12),(13,NULL,NULL,NULL,13),(14,'logic','Instagram',6700000,14),(15,'wale','Instagram',4900000,15),(16,'victoroladipo','Instagram',1400000,16),(17,'stefondiggs','Instagram',1500000,17),(18,'brentfaiyaz','Instagram',3100000,18),(19,'cordae','Instagram',2400000,19),(20,'edwardnorton','Instagram',383000,20),(21,NULL,NULL,NULL,21);
/*!40000 ALTER TABLE `social_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `social_media_count`
--

DROP TABLE IF EXISTS `social_media_count`;
/*!50001 DROP VIEW IF EXISTS `social_media_count`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `social_media_count` AS SELECT 
 1 AS `name`,
 1 AS `age`,
 1 AS `state`,
 1 AS `handle`,
 1 AS `follower_count`,
 1 AS `average_follower_count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `state_born`
--

DROP TABLE IF EXISTS `state_born`;
/*!50001 DROP VIEW IF EXISTS `state_born`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `state_born` AS SELECT 
 1 AS `state`,
 1 AS `total_state_count`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `occupation_count`
--

/*!50001 DROP VIEW IF EXISTS `occupation_count`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `occupation_count` AS select concat(`person`.`fname`,' ',`person`.`lname`) AS `name`,`i`.`state` AS `state`,`s`.`school` AS `school`,count(`occupation`.`occupation_title`) AS `number_of_occupations` from ((((`person` join `info` `i` on((`person`.`person_id` = `i`.`person_id`))) join `person_career` on((`person`.`person_id` = `person_career`.`person_id`))) join `occupation` on((`person_career`.`occupation_id` = `occupation`.`occupation_id`))) join `school` `s` on((`i`.`school_id` = `s`.`school_id`))) group by `name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `occupation_type`
--

/*!50001 DROP VIEW IF EXISTS `occupation_type`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `occupation_type` AS select concat(`person`.`fname`,' ',`person`.`lname`) AS `name`,`person`.`age` AS `age`,`occupation`.`occupation_title` AS `occupation_title` from ((`person` join `person_career` on((`person`.`person_id` = `person_career`.`person_id`))) join `occupation` on((`person_career`.`occupation_id` = `occupation`.`occupation_id`))) where `person_career`.`occupation_id` in (select `occupation`.`occupation_id` from `occupation` where (`occupation`.`occupation_title` = 'Television')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `person_occupation`
--

/*!50001 DROP VIEW IF EXISTS `person_occupation`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `person_occupation` AS select concat(`person`.`fname`,' ',`person`.`lname`) AS `name`,`person_career`.`start_year` AS `start_year`,`occupation`.`occupation_title` AS `occupation_title` from ((`person` join `person_career` on((`person`.`person_id` = `person_career`.`person_id`))) join `occupation` on((`person_career`.`occupation_id` = `occupation`.`occupation_id`))) where (`person`.`age` <= 74) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `social_media_count`
--

/*!50001 DROP VIEW IF EXISTS `social_media_count`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `social_media_count` AS select concat(`person`.`fname`,' ',`person`.`lname`) AS `name`,`person`.`age` AS `age`,`info`.`state` AS `state`,`social_media`.`handle` AS `handle`,`social_media`.`follower_count` AS `follower_count`,round(avg(`social_media`.`follower_count`),0) AS `average_follower_count` from ((`person` join `social_media` on((`person`.`person_id` = `social_media`.`person_id`))) join `info` on((`person`.`person_id` = `info`.`person_id`))) where (`social_media`.`follower_count` is not null) group by `social_media`.`follower_count` with rollup */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `state_born`
--

/*!50001 DROP VIEW IF EXISTS `state_born`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `state_born` AS select `info`.`state` AS `state`,max(`count_table`.`state_count`) AS `total_state_count` from (`info` join (select `info`.`state` AS `state`,count(`info`.`person_id`) AS `state_count` from `info` group by `info`.`state`) `count_table` on((`info`.`state` = `count_table`.`state`))) group by `info`.`state` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-11 16:51:51
