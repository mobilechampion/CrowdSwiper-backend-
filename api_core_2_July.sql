-- MySQL dump 10.13  Distrib 5.5.49, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: api_core_production
-- ------------------------------------------------------
-- Server version	5.5.49-0ubuntu0.14.04.1

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
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `total_view` int(11) DEFAULT '0',
  `score` int(11) DEFAULT '5',
  `approved` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_articles_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_3d31dad1cc` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (1,3,'yfig','cuihoj','2016-06-23 03:10:46','2016-07-02 06:03:48',6,5,1),(2,1,'Link Google','http://google.com','2016-06-23 08:53:16','2016-06-23 08:53:16',0,5,0),(3,2,'European-Union-referendum-UK-goes-to-the-polls','http://www.bbc.com/news/uk-politics-eu-referendum-36602702','2016-06-23 10:19:35','2016-07-01 18:00:58',2,5,1),(4,4,'test2','http://m.huffpost.com/us/entry/us_576b8f20e4b0c0252e786f59','2016-06-23 12:22:09','2016-06-23 12:22:09',0,5,0),(5,4,'test','http://m.huffpost.com/us/entry/us_576b8f20e4b0c0252e786f59','2016-06-23 12:22:42','2016-06-23 12:22:42',0,5,0),(6,1,'Google is a best search egine','http://google.com','2016-06-23 13:56:48','2016-06-23 13:56:48',0,5,0),(7,4,'test4','http://www.huffingtonpost.com/entry/caesar-goodson-verdict-freddie-gray_us_5761beace4b09c926cfe1477?section=','2016-06-23 15:16:53','2016-07-01 15:09:59',0,5,1),(8,9,'Nigeria Boko Haram: Scores of refugees starved to death - MSF','http://www.bbc.com/news/world-africa-36603419','2016-06-24 04:22:17','2016-07-01 15:09:59',0,5,1),(9,8,'Euro 2016: Wales v Northern Ireland, England v Iceland & Republic of Ireland v France in last 16','http://www.bbc.com/sport/football/36602266','2016-06-24 04:22:17','2016-07-01 15:09:59',0,5,1),(10,9,'Jamie Vardy: Leicester City striker agrees new contract','http://www.bbc.com/sport/football/36606270','2016-06-24 04:22:17','2016-07-01 18:00:51',1,5,1),(11,8,'First bid for McDonald\'s China franchises confirmed','http://www.bbc.com/news/business-36603779','2016-06-24 04:22:17','2016-07-01 15:10:01',0,5,1),(12,9,'US election: Donald Trump\'s five lines of attack on Clinton','http://www.bbc.com/news/world-us-canada-36592975','2016-06-24 04:22:17','2016-07-01 18:01:06',1,5,1),(13,8,'Gun-control protest sparks chaotic scenes in US Congress','http://www.bbc.com/news/world-us-canada-36598736','2016-06-24 04:22:17','2016-07-01 15:10:01',0,5,1),(14,8,'Kim says North Korean missiles can reach US in Pacific','http://www.bbc.com/news/world-asia-36603416','2016-06-24 04:22:17','2016-07-01 19:01:05',3,5,1),(15,3,'fuhj','dghjj','2016-06-24 15:52:55','2016-07-01 15:10:02',0,5,1),(16,4,'Market Roil at Brexit','http://www.bloomberg.com/news/articles/2016-06-23/pound-surge-builds-as-polls-show-u-k-to-remain-in-eu-yen-slips','2016-06-24 18:40:01','2016-07-01 16:32:20',1,5,1),(17,4,'Trump Aims ar Hillary - Brexit','http://www.breitbart.com/big-government/2016/06/24/brexit-2-0-populist-movement-worldwide-catches-fire-donald-trump-takes-aim-globalist-hillary-clinton/','2016-06-24 19:14:32','2016-07-01 18:56:06',1,5,1),(18,4,'David Cameron to Step Down','http://m.therightscoop.com/david-cameron-to-step-down-in-wake-of-brexit-vote/','2016-06-24 21:36:24','2016-07-01 18:01:02',1,5,1),(19,1,'queue Facebook','http://facebook.com','2016-06-25 15:03:57','2016-07-01 16:49:32',1,5,1),(20,1,'bing.com','http://bing.com','2016-06-26 08:51:08','2016-07-01 16:00:52',4,5,1),(21,3,'to queue','totototototo','2016-06-27 01:18:29','2016-07-01 18:41:55',2,5,1),(22,4,'Old People Voting Ban','http://www.breitbart.com/london/2016/06/27/media-calls-ban-old-people-voting-brexit-vote/','2016-06-27 16:39:20','2016-07-01 15:56:52',1,5,1),(23,4,'Brexit Market Uncertainty','http://www.bloomberg.com/news/articles/2016-06-27/germany-france-rule-out-eu-talks-until-u-k-files-to-leave-bloc','2016-06-27 20:06:24','2016-07-01 15:10:02',0,5,1),(24,4,'British Frantically Google what the EU is after Voting to Exit','https://www.washingtonpost.com/news/the-switch/wp/2016/06/24/the-british-are-frantically-googling-what-the-eu-is-hours-after-voting-to-leave-it/','2016-06-28 13:47:48','2016-07-01 15:10:02',0,5,1),(25,1,'Yahoo Japan','http://yahoo.co.jp','2016-07-01 16:01:45','2016-07-01 18:01:26',1,5,0);
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_favorites_on_user_id` (`user_id`),
  KEY `index_favorites_on_article_id` (`article_id`),
  CONSTRAINT `fk_rails_00f2e522fe` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  CONSTRAINT `fk_rails_d15744e438` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` VALUES (1,2,3,1,'2016-06-23 10:20:10','2016-06-23 10:20:10');
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
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
INSERT INTO `schema_migrations` VALUES ('20160618084356'),('20160620040039'),('20160621042520'),('20160622035525'),('20160624031027'),('20160625021141'),('20160701075110'),('20160701081505');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'email',
  `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmation_sent_at` datetime DEFAULT NULL,
  `unconfirmed_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nickname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tokens` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `total_submit_articles` int(11) DEFAULT '0',
  `total_homepage_articles` int(11) DEFAULT '0',
  `total_removed_articles` int(11) DEFAULT '0',
  `total_sent_invitations` int(11) DEFAULT '0',
  `total_register_invitations` int(11) DEFAULT '0',
  `total_days_as_member` int(11) DEFAULT '0',
  `birthday` datetime DEFAULT NULL,
  `political_persuasion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_uid_and_provider` (`uid`,`provider`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`),
  KEY `index_users_on_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'email','test@gmail.com','$2a$11$GjpEcrlO37DGiz/5i8bImOPyILEVuqe4Eh28b9eVlN1sGrsSkVGca',NULL,NULL,NULL,9,'2016-07-01 16:00:38','2016-07-01 13:53:02','116.107.153.55','116.107.153.55',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'test@gmail.com','{\"2Ce4HN7WzzdWZMUXSnrt3Q\":{\"token\":\"$2a$10$RVr4JoekzctuAy3H/s5tf.Sb.dPVndzJKK9iBM8fFTDIDYX4EgIjW\",\"expiry\":1467644469},\"gpkJVVbXuSXRP5dhOeyiBg\":{\"token\":\"$2a$10$dBhnefXH20NcQP/pHpDAi.Ep.ORBLMkh/UTc9ZpOX45BmN3wDiUqe\",\"expiry\":1467647307},\"H0W0IkEpVwlAKHHaevShiA\":{\"token\":\"$2a$10$EFnJrEF.jJvyxVXQhFXGS.WkNQVAJNXQ/9fV.G6yhHdLyl0kjgu22\",\"expiry\":1467648035},\"XGVgtjtpJht9dmmCFNBHbA\":{\"token\":\"$2a$10$UdQ3On6DJwhBtpU4/VPZYerRMoP3cZJd8f2yIuXqUaQ0wIJWVnnHK\",\"expiry\":1467648583},\"bK2MiSdUrjl8s4j5n3UuGg\":{\"token\":\"$2a$10$fAnUP.B015PH8uvSu6nrk.pmb21nbh20ugu1SN0.ZCLYkRDJnU84K\",\"expiry\":1467693275},\"-tgOEtmJOa0ctqLSa9Usew\":{\"token\":\"$2a$10$c3xC7bivvCs/tXzf3cXlTe33saeBvK/AIbaG5qFOBNPtYZzW4yrj6\",\"expiry\":1467714820},\"z5dOYANzdSXx2uzifVMtRg\":{\"token\":\"$2a$10$xsQwYntUeAGFa.lg7IKW.ObcajL4.K.rE.B1JgnWpOBN/gKueY0AC\",\"expiry\":1467881581},\"DOO_SJqpvC9D8diGgDw-UQ\":{\"token\":\"$2a$10$IKbpkjEimXIko57rcprre.PpMc5WoTXjcGiznZURY5GtkR1Gpqbji\",\"expiry\":1467899777},\"vLNy6I7RdN-aKDPQ9nkoHg\":{\"token\":\"$2a$10$5pXdmTkU45XjBLmVYz9uA.2IqxC7HFqsIeIBXhzMH5eTGg2626yKi\",\"expiry\":1468590782},\"q-Epy_wiQv4ICxmm6gtSaA\":{\"token\":\"$2a$10$CLHaV6QFOHT7pMg/ehZiOOHhGBUXn7s3JMny9itYMTVXV8NuTZ88i\",\"expiry\":1468598438}}','2016-06-20 15:01:09','2016-07-01 16:00:38',0,0,0,0,0,0,NULL,NULL),(2,'email','quyetdc.uet@gmail.com','$2a$11$CgyPH2G3we66xOUnknbNuOjIXIUkusmZLTaoMHM6VMuLSRQ656/nG',NULL,NULL,NULL,4,'2016-06-25 15:25:39','2016-06-24 04:16:40','117.0.221.124','113.160.58.242',NULL,NULL,NULL,NULL,NULL,NULL,'https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xpf1/v/t1.0-1/p50x50/13263828_1114127381983770_3408006743213385148_n.jpg_oh_570b356832380e8079bccf33aee046a7_oe_57F90943___gda___1475612716_62b3d0327cde880b6f1d87563578f511','quyetdc.uet@gmail.com','{\"NuF4YWGCSYRae8OyMT8mWw\":{\"token\":\"$2a$10$mY5CM.egq7.BJGb4y2GJd.OieYowpMgsFPUPRY5PRjOsmkzoqcX3S\",\"expiry\":1467645277},\"P5smLYODTxzA6P5O2avPlg\":{\"token\":\"$2a$10$QksESqtC.mL90m1fY2Pah.GR6wJANJFxusUuYzm7N8clR2p7AN0Ii\",\"expiry\":1467886578},\"qwmeL5sJH1g9met0WvMqJA\":{\"token\":\"$2a$10$CFxCg8Syx5li37TNuOEEqOnqP8r/XQyEYdfY1MtZNDFauJwIYZ3Ii\",\"expiry\":1467950592},\"RoH1dmEqibWqhcfzPAyuKw\":{\"token\":\"$2a$10$ZhsExohWfp8KNYrOzg4dUOWhiuF687p1wiWibm1UG27/mpEEukF/S\",\"expiry\":1467951400},\"1heZmwkiRnDeSqVF1LziaQ\":{\"token\":\"$2a$10$NuiP7bRtFCubw6aEWCve7eE0d29HL1dycNMshUL86KsMluWhgRyVK\",\"expiry\":1468077938}}','2016-06-20 15:14:36','2016-06-25 15:25:39',0,0,0,0,0,0,NULL,NULL),(3,'email','frankjin0403@hotmail.com','$2a$11$jXAbzBNp0uVzIOTFPwXlNeoQXVSqj4ptlcyYRYwlZs6W2SW1tNRjq',NULL,NULL,NULL,6,'2016-07-01 17:59:41','2016-06-28 23:55:56','104.200.145.243','172.98.87.249',NULL,NULL,NULL,NULL,NULL,NULL,'https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xap1/v/t1.0-1/p50x50/12928218_218193485211520_4335283789101838316_n.jpg_oh_29fb4472505abf668a4cfbe1e7621d0d_oe_57F60CB6___gda___1475450496_4e7e8ac3c192ba1185f703c71d2f4feb','frankjin0403@hotmail.com','{\"iLEAwHsV1qDYTrzeB6_XFw\":{\"token\":\"$2a$10$iE0Z9HOUH8A7QC5AfAg.yu9vYlczz9iPW4c1mFgkMAHw1kMfFgHmm\",\"expiry\":1467651188},\"9-pWwrDjcIXpy9fNPBP3FQ\":{\"token\":\"$2a$10$Yu.knyala36UPp/gSImejeLBzI7dYgSzMhX8WIYIo7zQSfbiEk9nq\",\"expiry\":1467861032},\"3SlBwbj5f1BNKAClyoB-Yw\":{\"token\":\"$2a$10$3pgNMoPr4ySmE4onoBjhr.3eJoW5J3/ED9H.aGpUUqgua1sIV0bNW\",\"expiry\":1467992881},\"Q4cpkEWubkYDB8zVXH7Yrg\":{\"token\":\"$2a$10$NfTacd1RCxKPh7qeAU4WU.4akUTQNTrANxPA58eJyMmJThKPgolFi\",\"expiry\":1468137261},\"hmEC-DK7-6AnuAom8a9t_Q\":{\"token\":\"$2a$10$CcoU1WAdAQ5sXFSjiJ5WmuBl1xd9VSEohIvsXdfNxS30qD64je1KW\",\"expiry\":1468199827},\"VGid-SiZSeCHnkA1xPaXSA\":{\"token\":\"$2a$10$fzFwpAhkJBM25Kjw0f5kGuCQcPaGT/7NBfppzCMcYsE5WowwhgAt6\",\"expiry\":1468367756},\"xlSctKQM5JJdgtXPpNP-0A\":{\"token\":\"$2a$10$kmV8QJNsNWoK3iwjI.WEAeFd.rUpxT3abm75zQXocl3rbSh5uCHUq\",\"expiry\":1468605581}}','2016-06-20 16:53:08','2016-07-01 17:59:41',0,0,0,0,0,0,NULL,NULL),(4,'email','wrightcolton@gmail.com','$2a$11$/bvY6dlxlYna0g5jsw5kweN5QYj.xdqfYKjLb1e7yCUVyVQsN0Qfe',NULL,NULL,NULL,5,'2016-06-24 18:38:29','2016-06-23 12:20:39','32.211.201.234','69.181.217.145',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'wrightcolton@gmail.com','{\"JLG5W1EK3dnGg0j2puRQDA\":{\"token\":\"$2a$10$riuozVAT0kIcfv6G2Dl4uOY4nbLB9vxYuCLAaSUPCeWP5yelLr/cK\",\"expiry\":1467657272},\"eVEa1aGSokFrZH750Q54Vg\":{\"token\":\"$2a$10$D166oG5uGEG4N6NU9AbW0.ntjjOx5ZmrHqTHer9Im.fuVyf/Woi3q\",\"expiry\":1467661652},\"UT6B8AW0RsCqOTMzLkDbmg\":{\"token\":\"$2a$10$9G2rPSYv4uYFjFJJgwtEueZ0CLW3RFqj0AKRVJP/JjsluYvHmhq5C\",\"expiry\":1467726402},\"NU2Yg7U1PkYYvFeH52OUYA\":{\"token\":\"$2a$10$pjklezKZAQGUhTVJgZ0YOO5Xv5ns95qo3vdYoCz67JxoooKgFoZde\",\"expiry\":1467770145},\"Qy38UUVOYVanJiHrkCl6Ug\":{\"token\":\"$2a$10$YPUZ77S5Xhg5c8SKiHKiSO0wxNGOGF4AIIgyfv9dexCLQ10dPMGKS\",\"expiry\":1467894039},\"33ejDQYRcNH7eEFs21NzzA\":{\"token\":\"$2a$10$0ZH3wZBGKAeNtMUPKi73FOvGxCrtzVLjikOYC1Cf..B8MtXr7WDi6\",\"expiry\":1468003109}}','2016-06-20 18:34:32','2016-06-24 18:38:29',0,0,0,0,0,0,NULL,NULL),(5,'facebook','1738257056412882','$2a$11$5ayaz0SjuaRV8qwztWlDe.DJAAhND/xIq7hwY5FTw9QZGms0dOW6G',NULL,NULL,NULL,3,'2016-06-22 14:10:22','2016-06-22 13:19:18','117.6.62.138','117.6.62.138',NULL,NULL,NULL,NULL,'Mary Jane Asia',NULL,'https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xtp1/v/t1.0-1/c8.0.50.50/p50x50/10592873_1508766546028602_277567223214898880_n.jpg?oh=879bdc63c184292eafde27507bd211f8&oe=57FCA123&__gda__=1476667540_667452d481a7875f194e6f9e6827dca1','1738257056412882@facebook.com','{}','2016-06-22 13:16:52','2016-06-22 14:10:22',0,0,0,0,0,0,NULL,NULL),(6,'facebook','257715257926009','$2a$11$.hK5uHHXDm7N4VpfToUp0uKOZJMLBmV0E7YYQnN6zxwkh8GCp73NS',NULL,NULL,NULL,3,'2016-06-23 03:27:12','2016-06-23 03:24:43','172.98.86.35','172.98.86.35',NULL,NULL,NULL,NULL,'Frank Jin',NULL,'https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xap1/v/t1.0-1/p50x50/12928218_218193485211520_4335283789101838316_n.jpg?oh=29fb4472505abf668a4cfbe1e7621d0d&oe=57F60CB6&__gda__=1475450496_4e7e8ac3c192ba1185f703c71d2f4feb','257715257926009@facebook.com','{}','2016-06-23 03:23:08','2016-06-23 03:27:12',0,0,0,0,0,0,NULL,NULL),(7,'google_auth2','robertpham001@gmail.com','$2a$11$9R/E3axOSjcMCwO0RcBsWOx9Ltq82V1LES7Ovy67ZUl1a0jwWZEBa',NULL,NULL,NULL,1,'2016-06-23 12:36:15','2016-06-23 12:36:15','117.6.62.138','117.6.62.138',NULL,NULL,NULL,NULL,'Youtuber Hotest',NULL,'https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg','robertpham001@gmail.com','{\"1QJ_QXww5h932cLILUGmMQ\":{\"token\":\"$2a$10$myUb2GDB8lXPvGQbuiDSW..Eg0C9le7NiLIgNKe9ARbwpeWxPu31m\",\"expiry\":1467894975}}','2016-06-23 12:36:15','2016-06-23 12:36:15',0,0,0,0,0,0,NULL,NULL),(8,'email','member1@example.com','$2a$11$5c12ibhEcjI6qbgk5z/n9eq8kzAVr6SIIp9eTH9XnTHpSTDx5Xqum',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'member1@example.com','{}','2016-06-24 04:22:16','2016-06-24 04:22:16',0,0,0,0,0,0,NULL,NULL),(9,'email','member2@example.com','$2a$11$LP3hFOVmSqmYivg0IcecmuGNb/J1BoWTdko2WvJeporp7kXaRgG2.',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'member2@example.com','{}','2016-06-24 04:22:17','2016-06-24 04:22:17',0,0,0,0,0,0,NULL,NULL),(10,'facebook','1738257056412882@facebook.com','$2a$11$ZqHWw8rTyrorAQbA7vqVEe52rSE5RLQNjQe/xzpPAr56MEuVRJTKa',NULL,NULL,NULL,1,'2016-06-24 04:23:06','2016-06-24 04:23:06','113.160.58.242','113.160.58.242',NULL,NULL,NULL,NULL,'Mary Jane Asia',NULL,'https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xtp1/v/t1.0-1/c8.0.50.50/p50x50/10592873_1508766546028602_277567223214898880_n.jpg?oh=879bdc63c184292eafde27507bd211f8&oe=57FCA123&__gda__=1476667540_667452d481a7875f194e6f9e6827dca1','1738257056412882@facebook.com','{\"WyHa95H-Zhp_bprXMzR0nw\":{\"token\":\"$2a$10$P2YZ7TLwwfVnu5yDERM6I.s5i2RFJ/G1fdI4vBdQwGokslfTHtabq\",\"expiry\":1467951786}}','2016-06-24 04:23:06','2016-06-24 04:23:06',0,0,0,0,0,0,NULL,NULL),(11,'facebook','quangpc@evolableasia.vn','$2a$11$OGxT7TDC67Ux2aWPgtjlSuUgfbD/1L0ADLYmsUaVrgPWz0pkx68s2',NULL,NULL,NULL,1,'2016-06-24 07:48:03','2016-06-24 07:48:03','118.70.133.151','118.70.133.151',NULL,NULL,NULL,NULL,'Mary Jane Asia',NULL,'https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xtp1/v/t1.0-1/c8.0.50.50/p50x50/10592873_1508766546028602_277567223214898880_n.jpg?oh=879bdc63c184292eafde27507bd211f8&oe=57FCA123&__gda__=1476667540_667452d481a7875f194e6f9e6827dca1','quangpc@evolableasia.vn','{\"HyrH-B9WQ0LoxEOjOw6n8w\":{\"token\":\"$2a$10$1SmgOqVzz.WCNIbquTgB6..skJ1vHBfOjpw45ycWFhA4wu6fBXPvK\",\"expiry\":1467964083}}','2016-06-24 07:48:03','2016-06-24 07:48:03',0,0,0,0,0,0,NULL,NULL),(12,'email','quyetdc90@gmail.com','$2a$11$dOK3pr95Snr/UwFKZsZSX.D/7QOZb3wpctJvLUSmXIrt8.wqhLdXm',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'quyetdc90@gmail.com','{\"eoxPdyrgwQ9NXJE5hN3YCA\":{\"token\":\"$2a$10$OOZB7K5sbKqAaN1Iw622ne34Y/7vYK.DxiI.DW1MX/tjaviz7EUbG\",\"expiry\":1468595741}}','2016-07-01 15:15:41','2016-07-01 15:15:41',0,0,0,0,0,0,'1990-06-09 00:00:00',NULL),(13,'email','tester1@gmail.com','$2a$11$Mml3Z/z0k1DCpqjg62hQ2e4MJC7OXVxjAbrRyu42SAFuqWOen1oQ2',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tester1@gmail.com','{\"Bd4J3FwVipZcGIJeMn3z_w\":{\"token\":\"$2a$10$RnyDxjqc2y6VGFUkGWTMn.f1PHpvPqFNZvbCmqjAIC37dqCHqUbVC\",\"expiry\":1468597153}}','2016-07-01 15:39:13','2016-07-01 15:39:13',0,0,0,0,0,0,'1992-01-07 00:00:00',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votes`
--

DROP TABLE IF EXISTS `votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `votes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` float DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_votes_on_user_id` (`user_id`),
  KEY `index_votes_on_article_id` (`article_id`),
  CONSTRAINT `fk_rails_041a10f835` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  CONSTRAINT `fk_rails_c9b3bef597` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votes`
--

LOCK TABLES `votes` WRITE;
/*!40000 ALTER TABLE `votes` DISABLE KEYS */;
INSERT INTO `votes` VALUES (1,0.71875,1,19,'2016-06-25 15:18:32','2016-06-25 15:18:32'),(2,0.265625,3,3,'2016-06-26 07:55:03','2016-06-26 07:55:03'),(3,0.820312,3,17,'2016-06-26 08:06:53','2016-06-26 08:06:53'),(4,1,3,14,'2016-06-26 08:08:09','2016-06-26 08:08:09'),(5,0.882812,1,20,'2016-06-26 15:51:15','2016-06-26 15:55:35'),(6,1,3,20,'2016-06-27 01:18:00','2016-06-27 14:30:32'),(7,0.5,3,21,'2016-06-27 01:18:45','2016-06-29 00:41:16'),(8,1,4,12,'2016-06-27 16:42:11','2016-06-27 16:42:28'),(9,0.890625,4,16,'2016-06-27 16:45:29','2016-06-27 16:45:29'),(10,0.0898438,3,16,'2016-06-27 19:24:06','2016-06-27 19:24:06'),(11,0.761719,3,18,'2016-06-27 19:24:55','2016-06-27 19:25:12'),(12,1,4,21,'2016-06-27 20:02:44','2016-06-27 20:02:44'),(13,0.875,4,22,'2016-06-27 20:03:33','2016-06-27 20:07:27'),(14,0.460938,3,10,'2016-06-28 02:23:36','2016-06-28 02:24:08'),(15,0.859375,3,9,'2016-06-28 02:24:22','2016-06-28 02:24:22'),(16,0.996094,3,8,'2016-06-28 02:24:37','2016-06-28 02:24:37'),(17,0.0208333,4,24,'2016-06-28 13:49:15','2016-06-28 13:49:15'),(18,1,4,17,'2016-06-28 17:14:45','2016-06-28 17:14:45'),(19,0.279661,1,1,'2016-07-01 16:08:37','2016-07-01 16:08:37'),(20,0.65678,1,21,'2016-07-01 16:10:44','2016-07-01 16:10:44'),(21,0.224576,1,14,'2016-07-01 16:11:01','2016-07-01 16:11:01'),(22,0.822034,3,12,'2016-07-01 18:01:11','2016-07-01 18:01:11'),(23,1,3,25,'2016-07-01 18:02:17','2016-07-01 18:02:17');
/*!40000 ALTER TABLE `votes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-02  2:15:43
