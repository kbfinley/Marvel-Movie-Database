CREATE DATABASE  IF NOT EXISTS `marvel_movies` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `marvel_movies`;
-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: localhost    Database: marvel_movies
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
-- Table structure for table `actors`
--

DROP TABLE IF EXISTS `actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actors` (
  `actor_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `gender_id` int NOT NULL,
  PRIMARY KEY (`actor_id`),
  KEY `fk_Actors_Gender1_idx` (`gender_id`),
  CONSTRAINT `fk_Actors_Gender1` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`gender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actors`
--

LOCK TABLES `actors` WRITE;
/*!40000 ALTER TABLE `actors` DISABLE KEYS */;
INSERT INTO `actors` VALUES (1,'Robert','Downey Jr.',2),(2,'Mark','Ruffalo',2),(3,'Chris','Hemsworth',2),(4,'Chris','Evans',2),(5,'Sebastian','Stan',2),(6,'Chris','Pratt',2),(7,'Paul','Rudd',2),(8,'Benedict','Cumberbatch',2),(9,'Tom','Holland',2),(10,'Chadwick','Boseman',2),(11,'Evangeline','Lilly',1),(12,'Brie','Larson',1),(13,'Scarlett','Johansson',1),(14,'Simu','Liu',2),(15,'Angelina','Jolie',1);
/*!40000 ALTER TABLE `actors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directors`
--

DROP TABLE IF EXISTS `directors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directors` (
  `director_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `gender_id` int NOT NULL,
  PRIMARY KEY (`director_id`),
  KEY `fk_Directors_Gender1_idx` (`gender_id`),
  CONSTRAINT `fk_Directors_Gender1` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`gender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directors`
--

LOCK TABLES `directors` WRITE;
/*!40000 ALTER TABLE `directors` DISABLE KEYS */;
INSERT INTO `directors` VALUES (1,'Jon','Favreau',2),(2,'Louis','Leterrier',2),(3,'Kenneth','Branagh',2),(4,'Joe','Johnston',2),(5,'Joss','Whedon',2),(6,'Alan','Taylor',2),(7,'Shane','Black',2),(8,'Anthony','Russo',2),(9,'James','Gunn',2),(10,'Peyton','Reed',2),(11,'Scott','Derrickson',2),(12,'Jon','Watts',2),(13,'Taika','Waititi',2),(14,'Ryan','Coogler',2),(15,'Anna','Boden',1),(16,'Cate','Shortland',1),(17,'Destin','Cretton',2),(18,'Chloe','Zhao',1),(19,'Sam','Raimi',2);
/*!40000 ALTER TABLE `directors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gender` (
  `gender_id` int NOT NULL AUTO_INCREMENT,
  `gender` varchar(6) NOT NULL,
  PRIMARY KEY (`gender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gender`
--

LOCK TABLES `gender` WRITE;
/*!40000 ALTER TABLE `gender` DISABLE KEYS */;
INSERT INTO `gender` VALUES (1,'Female'),(2,'Male');
/*!40000 ALTER TABLE `gender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_directors`
--

DROP TABLE IF EXISTS `movie_directors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_directors` (
  `director_id` int NOT NULL,
  `movie_id` int NOT NULL,
  KEY `fk_Movie Directors_Directors1_idx` (`director_id`),
  KEY `fk_Movie Directors_Movies1_idx` (`movie_id`),
  CONSTRAINT `fk_Movie Directors_Directors1` FOREIGN KEY (`director_id`) REFERENCES `directors` (`director_id`),
  CONSTRAINT `fk_Movie Directors_Movies1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_directors`
--

LOCK TABLES `movie_directors` WRITE;
/*!40000 ALTER TABLE `movie_directors` DISABLE KEYS */;
INSERT INTO `movie_directors` VALUES (1,1),(2,2),(1,3),(3,4),(4,5),(5,6),(6,7),(7,8),(8,9),(9,10),(5,11),(10,12),(8,13),(11,14),(9,15),(12,16),(13,17),(10,18),(8,19),(14,20),(8,21),(12,22),(15,23),(16,24),(17,25),(12,26),(18,27),(19,28),(13,29);
/*!40000 ALTER TABLE `movie_directors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `movie_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `popularity` int unsigned NOT NULL,
  `release year` int unsigned NOT NULL,
  `runtime` time NOT NULL,
  `budget` decimal(15,2) unsigned NOT NULL,
  `revenue` decimal(15,2) unsigned NOT NULL,
  `superhero_id` int NOT NULL,
  PRIMARY KEY (`movie_id`),
  KEY `fk_Movies_Superheroes1_idx` (`superhero_id`),
  CONSTRAINT `fk_Movies_Superheroes1` FOREIGN KEY (`superhero_id`) REFERENCES `superheroes` (`superhero_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'Iron Man',94,2008,'02:06:00',140000000.00,585800000.00,1),(2,'The Incredible Hulk',67,2008,'01:52:00',150000000.00,264800000.00,2),(3,'Iron Man 2',71,2010,'02:05:00',170000000.00,623900000.00,1),(4,'Thor',77,2011,'01:54:00',150000000.00,449300000.00,3),(5,'Captain America: The First Avenger',79,2011,'02:04:00',140000000.00,370600000.00,4),(6,'The Avengers',91,2012,'02:23:00',220000000.00,1519000000.00,1),(7,'Thor: The Dark World',66,2013,'01:52:00',150000000.00,644800000.00,3),(8,'Iron Man 3',79,2013,'02:10:00',200000000.00,1215000000.00,1),(9,'Captain America: The Winter Soldier',90,2014,'02:16:00',170000000.00,714400000.00,4),(10,'Guardians of the Galaxy',92,2014,'02:02:00',200000000.00,773300000.00,6),(11,'Avengers: Age of Ultron',76,2015,'02:21:00',365000000.00,1403000000.00,1),(12,'Ant-Man',83,2015,'01:58:00',130000000.00,519300000.00,7),(13,'Captain America: Civil War',90,2016,'02:28:00',250000000.00,1153000000.00,4),(14,'Doctor Strange',89,2016,'01:55:00',200000000.00,677800000.00,8),(15,'Guardians of the Galaxy Vol.2',85,2017,'02:17:00',200000000.00,863800000.00,6),(16,'Spider-Man: Homecoming',92,2017,'02:13:00',175000000.00,880200000.00,9),(17,'Thor: Ragnarok',93,2017,'02:10:00',180000000.00,854000000.00,3),(18,'Ant-Man and The Wasp',87,2018,'01:58:00',130000000.00,622700000.00,11),(19,'Avengers: Infinity War',85,2018,'02:29:00',316000000.00,2048000000.00,1),(20,'Black Panther',96,2018,'02:15:00',200000000.00,1344000000.00,10),(21,'Avengers: Endgame',94,2019,'03:02:00',356000000.00,2798000000.00,1),(22,'Spider-Man: Far From Home',90,2019,'02:10:00',160000000.00,1132000000.00,9),(23,'Captain Marvel',79,2019,'02:04:00',152000000.00,1128000000.00,12),(24,'Black Widow',79,2021,'02:13:00',200000000.00,379800000.00,13),(25,'Shang-Chi and The Legend of the Ten Rings',91,2021,'02:12:00',150000000.00,432200000.00,14),(26,'Spider-Man: No Way Home',93,2021,'02:28:00',200000000.00,1916000000.00,9),(27,'Eternals',47,2021,'02:37:00',200000000.00,402100000.00,15),(28,'Doctor Strange in the Multiverse of Madness',74,2022,'02:06:00',200000000.00,955800000.00,8),(29,'Thor: Love and Thunder',64,2022,'01:59:00',250000000.00,760700000.00,3);
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `powers`
--

DROP TABLE IF EXISTS `powers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `powers` (
  `power_id` int NOT NULL AUTO_INCREMENT,
  `power` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`power_id`),
  UNIQUE KEY `power_UNIQUE` (`power`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `powers`
--

LOCK TABLES `powers` WRITE;
/*!40000 ALTER TABLE `powers` DISABLE KEYS */;
INSERT INTO `powers` VALUES (12,'Assassin'),(8,'Conjur Myriad Spells'),(6,'Fly Faster than the Speed of Light'),(3,'Hammer'),(14,'Immortal'),(11,'Immunity to Toxins and Poisons'),(13,'Rings'),(4,'Shield'),(7,'Size Manipulation'),(9,'Spider Abilities'),(5,'Super Soldier'),(2,'Super Strength'),(1,'Super Suit'),(10,'Vibranium Body Armor');
/*!40000 ALTER TABLE `powers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `superhero_powers`
--

DROP TABLE IF EXISTS `superhero_powers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `superhero_powers` (
  `superhero_id` int NOT NULL,
  `power_id` int NOT NULL,
  KEY `fk_Superhero Powers_Superheroes1_idx` (`superhero_id`),
  KEY `fk_Superhero Powers_Powers1_idx` (`power_id`),
  CONSTRAINT `fk_Superhero Powers_Powers1` FOREIGN KEY (`power_id`) REFERENCES `powers` (`power_id`),
  CONSTRAINT `fk_Superhero Powers_Superheroes1` FOREIGN KEY (`superhero_id`) REFERENCES `superheroes` (`superhero_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `superhero_powers`
--

LOCK TABLES `superhero_powers` WRITE;
/*!40000 ALTER TABLE `superhero_powers` DISABLE KEYS */;
INSERT INTO `superhero_powers` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,7),(12,11),(13,12),(14,13),(15,14);
/*!40000 ALTER TABLE `superhero_powers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `superheroes`
--

DROP TABLE IF EXISTS `superheroes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `superheroes` (
  `superhero_id` int NOT NULL AUTO_INCREMENT,
  `actor_id` int NOT NULL,
  `gender_id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`superhero_id`),
  KEY `fk_Superheroes_Actors1_idx` (`actor_id`),
  KEY `fk_Superheroes_Gender1_idx` (`gender_id`),
  CONSTRAINT `fk_Superheroes_Actors1` FOREIGN KEY (`actor_id`) REFERENCES `actors` (`actor_id`),
  CONSTRAINT `fk_Superheroes_Gender1` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`gender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `superheroes`
--

LOCK TABLES `superheroes` WRITE;
/*!40000 ALTER TABLE `superheroes` DISABLE KEYS */;
INSERT INTO `superheroes` VALUES (1,1,2,'Iron Man'),(2,2,2,'Hulk'),(3,3,2,'Thor'),(4,4,2,'Captain America'),(5,5,2,'Winter Soldier'),(6,6,2,'Star Lord'),(7,7,2,'Ant-Man'),(8,8,2,'Doctor Strange'),(9,9,2,'Spider-Man'),(10,10,2,'Black Panther'),(11,11,1,'Wasp'),(12,12,1,'Captain Marvel'),(13,13,1,'Black Widow'),(14,14,2,'Shang-Chi'),(15,15,1,'Thena');
/*!40000 ALTER TABLE `superheroes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'marvel_movies'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-01 10:43:03
