-- MySQL dump 10.13  Distrib 5.1.54, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: sakura_development
-- ------------------------------------------------------
-- Server version	5.1.54-1ubuntu4

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `author` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
INSERT INTO `announcements` VALUES (1,'We\'re back!','Okay, I\'m back. Sakura Shards has been on the line between a hiatus and complete death for the last few months due to my laziness and a lack of organization. I\'ve taken out a few things and will basically be solo\'ing this entire operation from now on. The system for this website is made to support other people though, so that might happen later on.\r<br />\r<br />Now for a list of changes. I have removed many things including the:\r<br />-Forums\r<br />-Group e-mail\r<br />-Hover buttons\r<br />-Accounts in general\r<br />\r<br />On the opposite side, this site now includes:\r<br />-An admin interface (ease-of-use for me and potential staffers)\r<br />-A search function (only searches downloads)\r<br />\r<br />It doesn\'t seem like much, but everything on this site took around one week to finish off.\r<br />\r<br />Will I be taking on Oresama Teacher again? I don\'t actually know. I still have the materials leftover from before we half-died, but it doesn\'t seem to really matter. The manga is out there, and the group that took over is doing a fair job. This may mean that I will be choosing another project and sticking with that until somebody comes to take it over again.','Mizuho','2011-10-12 23:18:51','2011-10-12 23:18:51');
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `body` text COLLATE utf8_unicode_ci,
  `author` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `announcement_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20111007191029'),('20111012062331'),('20111012164504'),('20111012181743'),('20111012183709');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uploads`
--

DROP TABLE IF EXISTS `uploads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uploads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `volume` int(11) DEFAULT NULL,
  `chapter` int(11) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uploads`
--

LOCK TABLES `uploads` WRITE;
/*!40000 ALTER TABLE `uploads` DISABLE KEYS */;
INSERT INTO `uploads` VALUES (1,'High Jump Runaway!',1,1,'http://www.mediafire.com/download.php?zyz0tnjuwim','2011-10-12 22:46:45','2011-10-12 22:46:45'),(2,'Kaichou wa Maid-sama',8,33,'http://www.mediafire.com/download.php?1ww4arzwjjg','2011-10-12 22:47:19','2011-10-12 22:47:19'),(3,'Kaichou wa Maid-sama',8,34,'http://www.mediafire.com/download.php?hgmnjl4ddqn','2011-10-12 22:47:41','2011-10-12 22:47:41'),(4,'Lapis Lazuli no Oukan',1,4,'http://www.4shared.com/file/103239678/c00158d8/Sakura_Shards_Lapis_Lazuli_no_Oukan_v001_c035.html','2011-10-12 22:48:00','2011-10-12 22:48:00'),(5,'Tsukiyo no Fromage',1,1,'http://www.sakura-shards.net/dl/%5BSakura_Shards%5D_Tsukiyo_no_Fromage_v001_c001.rar','2011-10-12 22:48:23','2011-10-12 22:48:23'),(6,'Tsukiyo no Fromage',1,2,'http://www.sakura-shards.net/dl/%5BSakura_Shards%5D_Tsukiyo_no_Fromage_v001_c002.rar','2011-10-12 22:48:38','2011-10-12 22:48:38'),(7,'Tsukiyo no Fromage',1,3,'http://www.sakura-shards.net/dl/%5BSakura_Shards%5D_Tsukiyo_no_Fromage_v001_c003.rar','2011-10-12 22:48:50','2011-10-12 22:48:50'),(8,'Tsukiyo no Fromage',1,4,'http://www.sakura-shards.net/dl/%5BSakura_Shards%5D_Tsukiyo_no_Fromage_v001_c004.rar','2011-10-12 22:49:07','2011-10-12 22:49:07'),(9,'Oresama Teacher',1,1,'http://www.mediafire.com/download.php?ey1tmdgdmze','2011-10-12 22:49:25','2011-10-12 22:49:25'),(10,'Oresama Teacher',2,6,'http://www.mediafire.com/download.php?2mndjcgkjdy','2011-10-12 22:49:36','2011-10-12 22:49:36'),(11,'Oresama Teacher',2,7,'http://www.mediafire.com/download.php?nzdmfnmzgy5','2011-10-12 22:49:48','2011-10-12 22:49:48'),(12,'Oresama Teacher',2,9,'http://www.mediafire.com/download.php?im2xvdhidd0','2011-10-12 22:50:02','2011-10-12 22:50:02'),(13,'Oresama Teacher',2,10,'http://www.mediafire.com/download.php?e3xrznzznmi','2011-10-12 22:50:16','2011-10-12 22:50:16'),(14,'Oresama Teacher',2,11,'http://www.mediafire.com/download.php?zjedj0y3md3','2011-10-12 22:50:33','2011-10-12 22:51:35'),(15,'Oresama Teacher',3,12,'http://www.mediafire.com/download.php?joyowlkukn2','2011-10-12 22:51:49','2011-10-12 22:51:49'),(16,'Oresama Teacher',3,13,'http://www.mediafire.com/download.php?wufdx0tyjij','2011-10-12 22:52:08','2011-10-12 22:52:08'),(17,'Oresama Teacher',3,14,'http://www.mediafire.com/download.php?0grtjz0qwyo','2011-10-12 22:52:26','2011-10-12 22:52:26'),(18,'Oresama Teacher',3,15,'http://www.mediafire.com/download.php?qcimgad2jhz','2011-10-12 22:52:39','2011-10-12 22:52:39'),(19,'Oresama Teacher',3,16,'http://www.mediafire.com/download.php?nljkjj5m4zm','2011-10-12 22:52:55','2011-10-12 22:52:55'),(20,'Oresama Teacher',3,17,'http://www.mediafire.com/download.php?eteyrmzhyzb','2011-10-12 22:53:05','2011-10-12 22:53:05'),(21,'Oresama Teacher',4,18,'http://www.mediafire.com/download.php?ncqwezmz3vm','2011-10-12 22:53:18','2011-10-12 22:53:18'),(22,'Oresama Teacher',4,19,'http://www.mediafire.com/download.php?uzjweawz0jn','2011-10-12 22:53:35','2011-10-12 22:53:35'),(23,'Oresama Teacher',4,20,'http://www.sakura-shards.net/dl/%5BSakura_Shards%5D_Oresama_Teacher_v004_c003_(c20).rar','2011-10-12 22:53:42','2011-10-12 22:53:42'),(24,'Oresama Teacher',4,21,'http://www.mediafire.com/download.php?lnnytiqtml0','2011-10-12 22:53:54','2011-10-12 22:53:54'),(25,'Oresama Teacher',4,22,'http://www.mediafire.com/download.php?zhm011tymkj','2011-10-12 22:54:11','2011-10-12 22:54:11'),(26,'Oresama Teacher',4,23,'http://www.mediafire.com/download.php?dt0mdayjwnt','2011-10-12 22:54:23','2011-10-12 22:54:23'),(27,'Oresama Teacher',5,24,'http://www.sakura-shards.net/dl/%5BSakura_Shards%5D_Oresama_Teacher_v005_c001_(c24).rar','2011-10-12 22:54:37','2011-10-12 22:54:37'),(28,'Oresama Teacher',5,25,'http://www.sakura-shards.net/dl/%5BSakura_Shards%5D_Oresama_Teacher_v005_c002(c25).rar','2011-10-12 22:54:53','2011-10-12 22:54:53'),(29,'Oresama Teacher',5,26,'http://www.sakura-shards.net/dl/%5BSakura_Shards%5D_Oresama_Teacher_v005_c003_%28c26%29.rar','2011-10-12 22:55:05','2011-10-12 22:55:05');
/*!40000 ALTER TABLE `uploads` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-10-12 16:52:31
