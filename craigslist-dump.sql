-- MySQL dump 10.13  Distrib 5.7.17, for osx10.12 (x86_64)
--
-- Host: localhost    Database: craigslist
-- ------------------------------------------------------
-- Server version	5.7.17

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
-- Current Database: `craigslist`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `craigslist` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `craigslist`;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `userid` int(6) unsigned zerofill NOT NULL,
  `adminid` int(6) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (000001,1),(000002,2),(000003,3);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_profile_info`
--

DROP TABLE IF EXISTS `c_profile_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_profile_info` (
  `cprofileid` int(6) unsigned zerofill NOT NULL,
  `isapproved` varchar(50) DEFAULT 'PENDING',
  `dateapproved` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_profile_info`
--

LOCK TABLES `c_profile_info` WRITE;
/*!40000 ALTER TABLE `c_profile_info` DISABLE KEYS */;
INSERT INTO `c_profile_info` VALUES (000001,'1','2017-11-27'),(000002,'1','2017-11-27'),(000003,'1','2017-11-27'),(000004,'1','2017-11-27'),(000005,'1','2017-11-27'),(000006,'1','2017-11-27'),(000007,'1','2017-11-27'),(000008,'1','2017-11-27'),(000009,'1','2017-11-27'),(000010,'0','2017-11-27'),(000011,'0','2017-11-27'),(000012,'0','2017-11-27'),(000013,'0','2017-11-27'),(000014,'0','2017-11-27'),(000015,'0','2017-11-27'),(000016,'0','2017-11-27'),(000017,'0','2017-11-27'),(000018,'0','2017-11-27'),(000019,'0','2017-11-27'),(000020,'1','2017-11-27');
/*!40000 ALTER TABLE `c_profile_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_user_c_profile`
--

DROP TABLE IF EXISTS `c_user_c_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_user_c_profile` (
  `userid` int(6) unsigned zerofill NOT NULL,
  `cprofileid` int(6) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `contactno` varchar(15) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `datecreated` date NOT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `c_user_c_profile_cprofileid_uk` (`cprofileid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_user_c_profile`
--

LOCK TABLES `c_user_c_profile` WRITE;
/*!40000 ALTER TABLE `c_user_c_profile` DISABLE KEYS */;
INSERT INTO `c_user_c_profile` VALUES (000054,000001,'RuCorp','111522811','Metro Manila','2017-11-27'),(000055,000002,'Blizzard',NULL,NULL,'2017-11-27'),(000056,000003,'Bethesda',NULL,NULL,'2017-11-27'),(000057,000004,'Google','ewan','???????????','2017-11-27'),(000058,000005,'Twitter',NULL,NULL,'2017-11-27'),(000059,000006,'Tesla',NULL,NULL,'2017-11-27'),(000060,000007,'Ubisoft',NULL,NULL,'2017-11-27'),(000061,000008,'Riot Games',NULL,NULL,'2017-11-27'),(000062,000009,'UPLB',NULL,NULL,'2017-11-27'),(000063,000010,'alphabet',NULL,NULL,'2017-11-27'),(000064,000011,'ABS-CBN',NULL,NULL,'2017-11-27'),(000065,000012,'GMA Network',NULL,NULL,'2017-11-27'),(000066,000013,'Chevrolet',NULL,NULL,'2017-11-27'),(000067,000014,'Bugatti',NULL,NULL,'2017-11-27'),(000068,000015,'Figaro',NULL,NULL,'2017-11-27'),(000069,000016,'Starbucks',NULL,NULL,'2017-11-27'),(000070,000017,'Tara',NULL,NULL,'2017-11-27'),(000071,000018,'Lomi Batangas',NULL,NULL,'2017-11-27'),(000072,000019,'siomai',NULL,NULL,'2017-11-27'),(000073,000020,'RuCorp 2',NULL,NULL,'2017-11-27');
/*!40000 ALTER TABLE `c_user_c_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_user_submits_c_profile`
--

DROP TABLE IF EXISTS `c_user_submits_c_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_user_submits_c_profile` (
  `cprofileid` int(6) unsigned zerofill NOT NULL,
  `datesubmitted` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_user_submits_c_profile`
--

LOCK TABLES `c_user_submits_c_profile` WRITE;
/*!40000 ALTER TABLE `c_user_submits_c_profile` DISABLE KEYS */;
INSERT INTO `c_user_submits_c_profile` VALUES (000001,'2017-11-27'),(000002,'2017-11-27'),(000003,'2017-11-27'),(000004,'2017-11-27'),(000005,'2017-11-27'),(000006,'2017-11-27'),(000007,'2017-11-27'),(000008,'2017-11-27'),(000009,'2017-11-27'),(000010,'2017-11-27'),(000011,'2017-11-27'),(000012,'2017-11-27'),(000013,'2017-11-27'),(000014,'2017-11-27'),(000015,'2017-11-27'),(000016,'2017-11-27'),(000017,'2017-11-27'),(000018,'2017-11-27'),(000019,'2017-11-27'),(000020,'2017-11-27');
/*!40000 ALTER TABLE `c_user_submits_c_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job` (
  `jobid` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `salary` decimal(7,2) NOT NULL,
  `description` varchar(100) NOT NULL,
  `dateposted` date NOT NULL,
  `position` varchar(50) NOT NULL,
  `cprofileid` int(6) unsigned zerofill NOT NULL,
  PRIMARY KEY (`jobid`),
  KEY `job_cprofileid_fk` (`cprofileid`),
  CONSTRAINT `job_cprofileid_fk` FOREIGN KEY (`cprofileid`) REFERENCES `c_user_c_profile` (`cprofileid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (00000000001,10.00,'tagalinis ng banyo','2017-11-27','Janitor',000001);
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_search_tag`
--

DROP TABLE IF EXISTS `job_search_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_search_tag` (
  `jobid` int(11) unsigned zerofill NOT NULL,
  `searchtag` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_search_tag`
--

LOCK TABLES `job_search_tag` WRITE;
/*!40000 ALTER TABLE `job_search_tag` DISABLE KEYS */;
INSERT INTO `job_search_tag` VALUES (00000000001,'janitor'),(00000000001,'banyo'),(00000000001,'tae');
/*!40000 ALTER TABLE `job_search_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `js_profile_applies_for_job`
--

DROP TABLE IF EXISTS `js_profile_applies_for_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `js_profile_applies_for_job` (
  `jsprofileid` int(6) unsigned zerofill NOT NULL,
  `jobid` int(11) unsigned zerofill NOT NULL,
  `dateapplied` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `js_profile_applies_for_job`
--

LOCK TABLES `js_profile_applies_for_job` WRITE;
/*!40000 ALTER TABLE `js_profile_applies_for_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `js_profile_applies_for_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `js_profile_educbackground`
--

DROP TABLE IF EXISTS `js_profile_educbackground`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `js_profile_educbackground` (
  `jsprofileid` int(6) unsigned zerofill NOT NULL,
  `educbackground` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `js_profile_educbackground`
--

LOCK TABLES `js_profile_educbackground` WRITE;
/*!40000 ALTER TABLE `js_profile_educbackground` DISABLE KEYS */;
INSERT INTO `js_profile_educbackground` VALUES (000024,'Ninja Academy'),(000025,'Ninja Academy'),(000026,'UPLB'),(000027,'UPLB'),(000028,'UPLB'),(000030,'UPLB'),(000031,'Harvard'),(000031,'Harvard'),(000032,'UPD'),(000033,'Harvard'),(000034,'HighSchool'),(000001,'UPLB'),(000004,'Harvard'),(000005,'UPLB'),(000006,'UCLA'),(000007,'FEU'),(000009,'Univ. of Cebu'),(000010,'University of Virginia'),(000010,'Virginia National High'),(000011,'UPLB'),(000012,'UP Manila'),(000013,'UPLB'),(000014,'Meycauayan College'),(000015,'Letran Laguna'),(000016,'LSPU'),(000017,'UPLB'),(000018,'UPLB'),(000019,'UPLB'),(000020,'Washington Univ.'),(000021,'UPLB'),(000022,'UPLB'),(000023,'Ninja Academy'),(000029,'UPLB'),(000002,'UCLA'),(000003,'Yale');
/*!40000 ALTER TABLE `js_profile_educbackground` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `js_profile_info`
--

DROP TABLE IF EXISTS `js_profile_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `js_profile_info` (
  `jsprofileid` int(6) unsigned zerofill NOT NULL,
  `datecreated` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `js_profile_info`
--

LOCK TABLES `js_profile_info` WRITE;
/*!40000 ALTER TABLE `js_profile_info` DISABLE KEYS */;
INSERT INTO `js_profile_info` VALUES (000001,'2017-11-27'),(000002,'2017-11-27'),(000003,'2017-11-27'),(000004,'2017-11-27'),(000005,'2017-11-27'),(000006,'2017-11-27'),(000007,'2017-11-27'),(000008,'2017-11-27'),(000009,'2017-11-27'),(000010,'2017-11-27'),(000011,'2017-11-27'),(000012,'2017-11-27'),(000013,'2017-11-27'),(000014,'2017-11-27'),(000015,'2017-11-27'),(000016,'2017-11-27'),(000017,'2017-11-27'),(000018,'2017-11-27'),(000019,'2017-11-27'),(000020,'2017-11-27'),(000021,'2017-11-27'),(000022,'2017-11-27'),(000023,'2017-11-27'),(000024,'2017-11-27'),(000025,'2017-11-27'),(000026,'2017-11-27'),(000027,'2017-11-27'),(000028,'2017-11-27'),(000029,'2017-11-27'),(000030,'2017-11-27'),(000031,'2017-11-27'),(000032,'2017-11-27'),(000033,'2017-11-27'),(000034,'2017-11-27'),(000035,'2017-11-27'),(000036,'2017-11-27'),(000037,'2017-11-27'),(000038,'2017-11-27'),(000039,'2017-11-27'),(000040,'2017-11-27'),(000041,'2017-11-27'),(000042,'2017-11-27'),(000043,'2017-11-27'),(000044,'2017-11-27'),(000045,'2017-11-27'),(000046,'2017-11-27'),(000047,'2017-11-27'),(000048,'2017-11-27'),(000049,'2017-11-27'),(000050,'2017-11-27');
/*!40000 ALTER TABLE `js_profile_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `js_profile_interest`
--

DROP TABLE IF EXISTS `js_profile_interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `js_profile_interest` (
  `jsprofileid` int(6) unsigned zerofill NOT NULL,
  `interest` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `js_profile_interest`
--

LOCK TABLES `js_profile_interest` WRITE;
/*!40000 ALTER TABLE `js_profile_interest` DISABLE KEYS */;
INSERT INTO `js_profile_interest` VALUES (000024,'Peace'),(000025,'culinary'),(000026,'Python'),(000027,'Bball'),(000028,'cmsc 11'),(000030,'Fun games'),(000031,'Graphic Design'),(000031,'JavaScript'),(000032,'Security Systems'),(000033,'Coding'),(000034,'back-end developer'),(000001,'Java'),(000004,'Mobile apps'),(000005,'SAIS'),(000006,'Guns'),(000007,'Furniture'),(000009,'Cooking'),(000010,'Interior Design'),(000011,'Transcription'),(000011,'Programming'),(000011,'Web Design'),(000012,'Programming'),(000012,'Web Design'),(000012,'Computer Science'),(000013,'Databases'),(000013,'Big Data'),(000013,'Information Technology'),(000014,'Sneakers'),(000015,'laptops'),(000016,'Java'),(000017,'Anime'),(000018,'cmsc127'),(000019,'cmsc 131'),(000020,'culinary'),(000021,'cmsc 127'),(000022,'cmsc 56'),(000023,'sasuke-kun'),(000029,'Security'),(000002,'Grapic design'),(000003,'Java');
/*!40000 ALTER TABLE `js_profile_interest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `js_profile_workbackground`
--

DROP TABLE IF EXISTS `js_profile_workbackground`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `js_profile_workbackground` (
  `jsprofileid` int(6) unsigned zerofill NOT NULL,
  `workbackground` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `js_profile_workbackground`
--

LOCK TABLES `js_profile_workbackground` WRITE;
/*!40000 ALTER TABLE `js_profile_workbackground` DISABLE KEYS */;
INSERT INTO `js_profile_workbackground` VALUES (000024,'Missing nin'),(000025,'Missing nin'),(000026,'Assistan Professor'),(000027,'Instructor'),(000028,'Assistan Professor'),(000030,'ICS Director'),(000031,'Developer'),(000031,'Developer'),(000032,'software engineer'),(000033,'Engineer'),(000034,'Bartender'),(000001,'Google'),(000004,'Samsung'),(000005,'eUP'),(000006,'Yahoo!'),(000009,'Tita  joans eatery'),(000010,'Interior Designer at HouseM'),(000011,'Transcrier at Quicktate'),(000012,'Freelance Programming'),(000013,'Research Assistant at UPLB'),(000014,'Pro-Basketball Player'),(000015,'High school Teacer'),(000016,'SM'),(000017,'Professor'),(000018,'Instructor'),(000019,'Instructor'),(000020,'Doctor'),(000021,'Instructor'),(000022,'Instructor'),(000023,'Hokage'),(000029,'Professor'),(000002,'Yahoo!'),(000003,'Apple');
/*!40000 ALTER TABLE `js_profile_workbackground` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `js_user_js_profile`
--

DROP TABLE IF EXISTS `js_user_js_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `js_user_js_profile` (
  `userid` int(6) unsigned zerofill NOT NULL,
  `jsprofileid` int(6) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `contactno` varchar(15) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `datecreated` date NOT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `js_user_js_profile_jsprofileid_uk` (`jsprofileid`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `js_user_js_profile`
--

LOCK TABLES `js_user_js_profile` WRITE;
/*!40000 ALTER TABLE `js_user_js_profile` DISABLE KEYS */;
INSERT INTO `js_user_js_profile` VALUES (000004,000001,'Jason Garcia','1124467790','Los Banos, Laguna','2017-11-27'),(000005,000002,'Gordon Philadelphia','987654321','Walkinghood, South Dakota','2017-11-27'),(000006,000003,'Joshua Cortex','924879268','Tiger, Vemont','2017-11-27'),(000007,000004,'Felix Griper','972611112','Sta. Rosa, Laguna','2017-11-27'),(000008,000005,'Steward Jensen','926123123','Los Banos, Laguna','2017-11-27'),(000009,000006,'Jennifer Westly','926423176','San Pablo, Laguna','2017-11-27'),(000010,000007,'Casey Cartella','251280589','Doodletown, Alabama','2017-11-27'),(000011,000008,'Felix Varden','205970162','Canary, Alabama','2017-11-27'),(000012,000009,'Selena Xerxes','831142024','Drain, California','2017-11-27'),(000013,000010,'Apple Montana','805990152','Zunkerville, California','2017-11-27'),(000014,000011,'Stella Cinderella','904156022','Painted Post, Florida','2017-11-27'),(000015,000012,'Gracie Von Styles','319809483','Los Banos, Laguna','2017-11-27'),(000016,000013,'Barnie Cordon','319390999','Checkerboard, Iowa','2017-11-27'),(000017,000014,'Jake D. Doug','3134853370','Neon, Michigan','2017-11-27'),(000018,000015,'Faith Malou','603600199','Eden Prairie, New Hampshire','2017-11-27'),(000019,000016,'Leo Nardo','319809483','Cutshin, Iowa','2017-11-27'),(000020,000017,'Reginald Recario','1236543980','Los Banos, Laguna','2017-11-27'),(000021,000018,'Maria Aguirre','1325649111','Los Banos, Laguna','2017-11-27'),(000022,000019,'Kendal Jaen','1239876541','Los Banos, Laguna','2017-11-27'),(000023,000020,'Hannibal Lecturer','813675821','Burnt House, Florida','2017-11-27'),(000024,000021,'Kat Loren Tan','1243257650','Los Banos, Laguna','2017-11-27'),(000025,000022,'Ivy Aguila','1231231115','Los Banos, Laguna','2017-11-27'),(000026,000023,'Naruto Uzumaki','423754999','Konoha','2017-11-27'),(000027,000024,'Sasuke Uchiha','924879262','Village hidden in the leaf','2017-11-27'),(000028,000025,'Itachi Uchiha','929629262','Village hidden in the leaf','2017-11-27'),(000029,000026,'Roi Aguila','939262487','Lipa, Batangas','2017-11-27'),(000030,000027,'Gerald Emalada','1234567891','Pagsanjan, Laguna','2017-11-27'),(000031,000028,'JM Bawagan','1324567892','Los banos, laguna','2017-11-27'),(000032,000029,'JAC Hermcilia','1234567890','Los Banos, Laguna','2017-11-27'),(000033,000030,'Jaime Samaniego','1234567892','Calamba Laguna','2017-11-27'),(000034,000031,'John Doe','1234567891','Bay, Laguna','2017-11-27'),(000035,000032,'Jane Doe','1234567895','Sta. Cruz, Manila','2017-11-27'),(000036,000033,'Timmy Turner','12345897','Land of the free','2017-11-27'),(000037,000034,'Jimmy Neutron','1234567896','Amityville','2017-11-27'),(000038,000035,'Jonny Depp','316121678','Purdy, Kansas','2017-11-27'),(000039,000036,'Miyah Queliste','765152965','Los Banos, Laguna','2017-11-27'),(000040,000037,'Jai Unson','240262976','Ong, Maryland','2017-11-27'),(000041,000038,'Jeff Neri','808172179','Passover, Hawaii','2017-11-27'),(000042,000039,'Moesha Pangilinan','256833357','Canary, Alabama','2017-11-27'),(000043,000040,'Jelo Reyes','432999811','Sta. Rosa, Laguna','2017-11-27'),(000044,000041,'Marc Saulo','143998123','Bonanza, Colorado','2017-11-27'),(000045,000042,'Drea Alarcon','302521947','Frick, Delaware','2017-11-27'),(000046,000043,'Summer Viray','4109352689','Cherry Box, Maryland','2017-11-27'),(000047,000044,'Jay Nicolas','432612342','Los Banos, Laguna','2017-11-27'),(000048,000045,'Rafi Valencia','432765111','Los Banos, Laguna','2017-11-27'),(000049,000046,'Kyle Fabcon','240279862','Thunderbolt, Maryland','2017-11-27'),(000050,000047,'Rainier Samar','432111455','Pelican, Florida','2017-11-27'),(000051,000048,'Jaeson Cho','603886862','Plymouth, New Hampshire','2017-11-27'),(000052,000049,'Elmer Merto','740343948','Foxtrap, Ohio','2017-11-27'),(000053,000050,'Oppar Garcia','605329823','Kid Valley, South Dakota','2017-11-27');
/*!40000 ALTER TABLE `js_user_js_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userid` int(6) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `type` int(1) NOT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `user_email_uk` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (000001,'Amazing!','keithmanalodi@gmail.com',3),(000002,'thekeyofawesome','petmarutherbelleza@gmail.com',3),(000003,'pogiako','nicolordunson@gmail.com',3),(000004,'howlongaremyarms','killersasuke21@gmail.com',1),(000005,'123ilovemusic','itsyourgordon@gmail.com',1),(000006,'apple22cider','hyperjosh1@gmail.com',1),(000007,'icanthelpfallinginlove','felixofall@gmail.com',1),(000008,'cashmeouside','stewgood4u@yahoo.com',1),(000009,'farfaraway','thewildwildwest@hotmail.com',1),(000010,'caseysmomhasgotit','caseysnothere@gmail.com',1),(000011,'ibelieveinmyself','felixtothemoon@yahoo.com',1),(000012,'wakemeup','imdarealxerxes@yahoo.com',1),(000013,'yagirltheapplester','itssssapple@gmail.com',1),(000014,'applebottomjeans','stellacinderella@gmail.com',1),(000015,'gvstyles','gvstyles@hotmail.com',1),(000016,'creativityatitsbest','babarnie@hotmail.com',1),(000017,'barkbark','notfinnsdog@yahoo.com',1),(000018,'narutolover','faithmlu@gmail.com',1),(000019,'picassosucks','leothepainter@yahoo.com',1),(000020,'screw124','sirreggie@yahoo.com',1),(000021,'thisisbestproject','marialb@yahoo.com',1),(000022,'131parinmganoob','notkendalljenner@gmail.com',1),(000023,'donteatmeat','thetruevegetarian@gmail.com',1),(000024,'101010','tantantan1010@yahoo.com',1),(000025,'iamcmsc56','ivyaaaaa@yahoo.com',1),(000026,'sasuke','rasengan22@gmail.com',1),(000027,'itachiuchiha','chidori@yahoo.com',1),(000028,'naruto','amaterasu@gmail.com',1),(000029,'roiaguila','roiaguila@gmail.com',1),(000030,'sirgerald','sirg@gmail.com',1),(000031,'jmbawag','jmbawag@yahoo.com',1),(000032,'jacattacc','jacherm@gmail.com',1),(000033,'cmsc141','jsamaniego@gmail.com',1),(000034,'johnd','johnd@gmail.com',1),(000035,'janed','janed@gmai.com',1),(000036,'timmyt','timmyt@yahoo.com',1),(000037,'jimmyn','jimmyn@gmail.com',1),(000038,'deppjn','deppjn@gmail.com',1),(000039,'miyahq','miyahq@gmail.com',1),(000040,'jaiunson','jaiunson@gmail.com',1),(000041,'jeffneri','jeffneri@gmail.com',1),(000042,'moepangiinan','moepangilinana@gmail.com',1),(000043,'jelor','jelor@yahoo.com',1),(000044,'marcs','marcs@hotmail.com',1),(000045,'dreaa','dreaa@gmail.com',1),(000046,'summerv','summerv@gmail.com',1),(000047,'jayn','jayn@gmail.com',1),(000048,'rafiel','rafielv@gmail.com',1),(000049,'kylefab','kylefab@gmail.com',1),(000050,'rainsamar','rainsamar@gmail.com',1),(000051,'jaecho','jaecho@gmail.com',1),(000052,'elmerto','elmerto@gmail.com',1),(000053,'oppar','oppar@gmail.com',1),(000054,'rucorp','rucorpph@gmail.com',2),(000055,'blizzard','blizzard@gmail.com',2),(000056,'bethesda','bethesda@gmail.com',2),(000057,'google','google@gmail.com',2),(000058,'twittercom','twitter@gmail.com',2),(000059,'nikola','tesla@gmail.com',2),(000060,'ubisoft','ubisoft@gmail.com',2),(000061,'djfsaklhdgsk','riotgames@gmail.com',2),(000062,'kdsha','upbl@gmail.com',2),(000063,'dsakjhgjlkdsh','alphabet@gmail.com',2),(000064,'dslak;','abscbn@gmail.com',2),(000065,'dskaflhdgsa;','gma@gmail.com',2),(000066,'chvdjkahg','chevy@gmail.com',2),(000067,'flkdsj;','bugatti@gmail.com',2),(000068,'flkdsj','figaro@gmail.com',2),(000069,'fdskljlk','sb@gmail.com',2),(000070,'fkdlsajlkf','tara@gmail.com',2),(000071,'lksdjfalk','lomi@gmail.com',2),(000072,'dkfsjah','siomai@gmail.com',2),(000073,'ruccorp','rucorpph2@gmail.com',2);
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

-- Dump completed on 2017-12-01 13:30:29
