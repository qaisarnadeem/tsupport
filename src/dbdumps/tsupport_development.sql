-- MySQL dump 10.13  Distrib 5.5.53, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: tsupport_development
-- ------------------------------------------------------
-- Server version	5.5.53-0ubuntu0.14.04.1

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
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2017-02-22 07:54:40','2017-02-22 07:54:40');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ticket_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_comments_on_user_id` (`user_id`),
  KEY `index_comments_on_ticket_id` (`ticket_id`),
  CONSTRAINT `fk_rails_03de2dc08c` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_rails_e013b60ecb` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'Hi Customer 1,\n\nCould you please elaborate the problem a little more, so that we can have a clear understanding of the problem.\n\nBest,\nAgent 1',2,2,'2017-02-22 10:57:30','2017-02-22 10:57:30'),(2,'Hey,\n\nThe problem is that I am unable to open the file, which seems to be the setup file.',4,2,'2017-02-22 10:59:09','2017-02-22 10:59:09'),(3,'Please check if the file is in .zip format or in .rar?',2,2,'2017-02-22 11:00:00','2017-02-22 11:00:00'),(4,'Hi,\nPlease note that the laptop should be less than $1000.\n',5,3,'2017-02-22 11:04:27','2017-02-22 11:04:27'),(5,'Okay Customer 2, Do you have any brand preferences?',2,3,'2017-02-22 11:05:22','2017-02-22 11:05:22'),(6,'It is in .zip. format. ',4,2,'2017-02-22 11:08:59','2017-02-22 11:08:59'),(7,'Alright, please right click on the file and extract its contents. I hope that will resolve  the problem.',2,2,'2017-02-22 11:15:37','2017-02-22 11:15:37'),(8,'Worked like charm. Thanks a lot.',4,2,'2017-02-22 11:15:59','2017-02-22 11:15:59'),(9,'Happy to help.',2,2,'2017-02-22 11:19:12','2017-02-22 11:19:12'),(10,'Any brand would work.',5,3,'2017-02-22 11:20:40','2017-02-22 11:20:40'),(11,'Here are the suggestions for you.\n1) Apple MacBook 5K4M2LL/A 12-Inch.\n2) Microsoft Surface Pro 4 CR5-00001 12.3-inch.\n3) ASUS ZenBook UX305UA AS51 13.3-Inch.\n4) Apple MMGF2LL/A MacBook Air 13.3-Inch.\n5) ASUS F555UA-EH71 15.6-Inch.\n6) Lenovo Yoga 710 80U00006US 15.6-inch.\n7) Apple MacBook Air MJVE2LL/A 13.3-Inch.\n8) Dell XPS 9350-1340SLV 13.3-inch.',2,3,'2017-02-22 11:22:46','2017-02-22 11:22:46'),(12,'Thanks a lot for your suggestions. I\'d go for Apple MacBook Air.',5,3,'2017-02-22 11:23:27','2017-02-22 11:23:27'),(13,'We love that too. Happy working.',2,3,'2017-02-22 11:23:59','2017-02-22 11:23:59'),(14,'Hi, would you like a new charger (cost $10) or the existing to be repaired..? ',3,1,'2017-02-22 11:25:37','2017-02-22 14:22:54');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20160818150755'),('20170219081048'),('20170219082109'),('20170221074550');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `user_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `resolved_by_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_tickets_on_user_id` (`user_id`),
  KEY `index_tickets_on_status` (`status`),
  CONSTRAINT `fk_rails_538a036fb9` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES (1,'Request for charger upgrade','Hi, My laptop charger seems to heat up quite often these days. I need my laptop charger changed. \n\nPlease help.\n\nBest regards,\nCustomer 1',4,1,NULL,'2017-02-22 09:01:13','2017-02-22 11:24:38'),(2,'Installation problem','Hi,\n\nI am having problems in installation of Microsoft Office. \n\nPlease help me resolve the issue.\n\nBest regards,\nCustomer 1',4,2,2,'2017-02-22 09:08:17','2017-02-22 11:19:15'),(3,'Help required','Hi,\n\nI want to buy a new laptop. Please help me.\n\nBest regards,\nCustomer 2\n',5,2,2,'2017-02-22 09:09:50','2017-02-22 11:24:02'),(4,'Laptop exchange','Hi,\n\nI want my laptop exchanged, as my previous one is not working properly. \n\nRegards,\nCustomer 2',5,0,NULL,'2017-02-22 09:10:42','2017-02-22 09:10:42');
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(255) NOT NULL DEFAULT 'email',
  `uid` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmation_sent_at` datetime DEFAULT NULL,
  `unconfirmed_email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `tokens` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `role` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_uid_and_provider` (`uid`,`provider`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`),
  KEY `index_users_on_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'email','admin@tsupport.com','$2a$11$gtcHyOweeTKB6WBlQ0.XC.bXOsDPLK/OKLtNfftKWBwpJItN.Fjr.',NULL,NULL,NULL,11,'2017-02-22 14:26:12','2017-02-22 14:25:34','192.168.5.35','192.168.5.35',NULL,NULL,NULL,NULL,'Admin',NULL,NULL,'admin@tsupport.com','{\"1_fxv8zssTQ1MwdANFhn_Q\":{\"token\":\"$2a$10$uDyYOM6jLJsVWh4eBOMEDOLMdeic4HSvtnWG/yHNhdHZLrfFyxymK\",\"expiry\":1488960627,\"last_token\":\"$2a$10$tS5oxDh25cqc0HFzIswXH.AvGISC4QGT7W8RjHa7Dj3NhOhEMUJcu\",\"updated_at\":\"2017-02-22T13:10:27.929+05:00\"},\"CXDjHckmdmfunapoZaaymg\":{\"token\":\"$2a$10$6THmkuc.2D2yYmTI85uc9.7br1VvnEHffmLoIkFa48Akjm5lZDLAy\",\"expiry\":1488978736,\"last_token\":\"$2a$10$erz5xLkzRFBDmWfZGV.VleGNO79qBEZXW.hAVywMq29M/YVn5MqpS\",\"updated_at\":\"2017-02-22T18:12:16.512+05:00\"},\"0FcXvfMbW-9W1OwWJa0-cA\":{\"token\":\"$2a$10$vTNX.87xKmSXt6gJqVJZmOj63I5SKYlcKC8ixaXN8mePcpXglVdua\",\"expiry\":1488982101,\"last_token\":\"$2a$10$4DH.rpHdAtujLp4l45W8Qu1YdDJDzf2KDaYewWIlfXxBdkvcgVWtC\",\"updated_at\":\"2017-02-22T19:08:21.209+05:00\"},\"_xdd95d4SWHGzWpcAP4omA\":{\"token\":\"$2a$10$U3ohFqtE2aD0p2fufKyDC.rKqmw1QwpfMU8Zs1akSoHKSaQu08L/e\",\"expiry\":1488981652,\"last_token\":\"$2a$10$M/T08so0BEUeCvgTc92JlOnmM/97Iu5NOK72zSyWyCN4gZFACnGEe\",\"updated_at\":\"2017-02-22T19:00:52.890+05:00\"},\"OXo_Q0l3e2wN_gi4d3L3og\":{\"token\":\"$2a$10$KwomSE7JC3iWpFoIPHzTVOdbGbOYiq/B7UuxJ3JIfsoIoZ.ZuPal6\",\"expiry\":1488981860,\"last_token\":\"$2a$10$LcX3RH7f4aqZ192Yx58JY.qbDEsvR1XFLdtvofZe0UHZ0JK/Lxxwq\",\"updated_at\":\"2017-02-22T19:04:20.691+05:00\"},\"h7xyevqAtshEMAeYgvoPfg\":{\"token\":\"$2a$10$S3taK5CZsj.RyM0XaXNmLujoK2uVQbLFrEtbtcmYfTSVkXlYPFIzq\",\"expiry\":1488982104,\"last_token\":\"$2a$10$2H6KZO/RQIJd9KKetdeQGOe/HrnrPY4p.MqeR7h01eClgCdIY3EPy\",\"updated_at\":\"2017-02-22T19:08:24.501+05:00\"},\"fV7KtKU4hvtnoN6E793_hg\":{\"token\":\"$2a$10$85ZyGy.mp/RZt/6Lf6AOW.EFoTlaSVERIQv1ozxAQs9ZMIiZu6qy.\",\"expiry\":1488983190,\"last_token\":\"$2a$10$zXX0X6F7dHo.lQh29052j.7biLvoLWnIq9RUgJuMTkg7ROmdx9jki\",\"updated_at\":\"2017-02-22T19:26:33.995+05:00\"}}','2017-02-22 07:55:01','2017-02-22 14:26:33',2),(2,'email','agent1@tsupport.com','$2a$11$AY4JKNVBGSiJ73P1Wrw9IOhyDEZ6bgrch1xE/ySV1fsZ8I2XlrILW',NULL,NULL,NULL,1,'2017-02-22 09:11:01','2017-02-22 09:11:01','10.42.0.37','10.42.0.37',NULL,NULL,NULL,NULL,NULL,'Agent 1',NULL,'agent1@tsupport.com','{}','2017-02-22 08:57:16','2017-02-22 11:24:13',1),(3,'email','agent2@tsupport.com','$2a$11$nUewnFVlAgPTrpVURDk5B.GNKDqRMXSDQFMqEC6QNgUdOiuI/34cq',NULL,NULL,NULL,1,'2017-02-22 11:24:26','2017-02-22 11:24:26','10.42.0.37','10.42.0.37',NULL,NULL,NULL,NULL,NULL,'Agent 2',NULL,'agent2@tsupport.com','{\"8pnHt2Xpj5bga9xky7OE_A\":{\"token\":\"$2a$10$e3/FFTuzKWQaWH5TBlN.1.ubnMuJg/OVFGRfFBY8xIxdykLuowzKm\",\"expiry\":1488972533,\"last_token\":\"$2a$10$LItcUoImWK/r9p0TykSpp.uOXG/tw9j3vgInBJ/9nkfn4qYx3U0Fa\",\"updated_at\":\"2017-02-22T16:28:53.249+05:00\"}}','2017-02-22 08:57:46','2017-02-22 11:28:53',1),(4,'email','customer1@mailinator.com','$2a$11$0i.soqqThEQnOmoFSyI7Vu4GX5DxnVoIh7gAflrY2jsY5.0DjpSmi',NULL,NULL,NULL,5,'2017-02-22 13:58:59','2017-02-22 13:47:34','192.168.5.35','192.168.5.35',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'customer1@mailinator.com','{\"Zy1rO6fZc7GDUpkJqeVRzw\":{\"token\":\"$2a$10$LRsjXeskSippWgLVZqvlt.2pVf5LguD90mLZ0YwI03ce/eQ4AyBSe\",\"expiry\":1488972387,\"last_token\":\"$2a$10$1m2Uwq0Wv4QU/hAknjCKnObt1tDlA3xDiIQ6FvBbjVQvVU/ZGcZ2O\",\"updated_at\":\"2017-02-22T16:26:27.449+05:00\"},\"H7HF_k85w8i1oF02twO82Q\":{\"token\":\"$2a$10$wGaU0TmWAgdI9DwVfawvBeMvR92DIivSOIxAhuS9KwNI0ipWoSaPy\",\"expiry\":1488980898,\"last_token\":\"$2a$10$OMKJbLRNraO36ZwGGAzMfO5quaQ.CqKqXabQEY1tZaKbtNwUUaoA6\",\"updated_at\":\"2017-02-22T18:48:20.135+05:00\"}}','2017-02-22 08:59:23','2017-02-22 13:59:24',0),(5,'email','customer2@mailinator.com','$2a$11$Rf3twIFaxpBg148cW4Zr4eCpxlKPQI6w6ta0mvytcNV/4rxGzyWPO',NULL,NULL,NULL,2,'2017-02-22 11:20:18','2017-02-22 11:04:02','10.42.0.37','10.42.0.37',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'customer2@mailinator.com','{}','2017-02-22 09:08:52','2017-02-22 11:25:52',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-22 19:29:19
