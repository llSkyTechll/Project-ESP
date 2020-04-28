CREATE DATABASE  IF NOT EXISTS `devenirdisciple.org` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `devenirdisciple.org`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: devenirdisciple.org
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.10-MariaDB

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `adminId` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(500) NOT NULL DEFAULT '',
  PRIMARY KEY (`adminId`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'eric.larivière1999@hotmail.com','admin01'),(2,'Alexandre.Reny98@gmail.com','admin01!');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendarevent`
--

DROP TABLE IF EXISTS `calendarevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendarevent` (
  `eventId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `date` varchar(100) NOT NULL DEFAULT '',
  `descr` varchar(500) NOT NULL DEFAULT '',
  `color` varchar(50) NOT NULL DEFAULT '',
  `icon` varchar(50) NOT NULL DEFAULT '',
  `communityId` int(11) DEFAULT NULL,
  PRIMARY KEY (`eventId`),
  KEY `FK_communityId` (`communityId`),
  CONSTRAINT `FK_communityId` FOREIGN KEY (`communityId`) REFERENCES `communaute` (`communauteid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendarevent`
--

LOCK TABLES `calendarevent` WRITE;
/*!40000 ALTER TABLE `calendarevent` DISABLE KEYS */;
INSERT INTO `calendarevent` VALUES (10,'Test','04/22/2020 08:27 am','','fc-bg-lightgreen','calendar',16),(11,'Test','04/29/2020 08:35 am','','fc-bg-lightgreen','group',16),(13,'Test','04/29/2020 08:35 am','test','fc-bg-lightgreen','group',16),(14,'Test','04/09/2020 10:40 am - 04/16/2020 11:59 pm','Test','fc-bg-default','circle',16);
/*!40000 ALTER TABLE `calendarevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communaute`
--

DROP TABLE IF EXISTS `communaute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communaute` (
  `communauteid` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL DEFAULT '',
  `paroisseid` int(11) NOT NULL DEFAULT 0,
  `menuid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`communauteid`),
  KEY `FK_Paroisse` (`paroisseid`),
  KEY `FK_Menuidcommunaute` (`menuid`),
  CONSTRAINT `FK_Menuidcommunaute` FOREIGN KEY (`menuid`) REFERENCES `menu` (`menuId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Paroisse` FOREIGN KEY (`paroisseid`) REFERENCES `paroisse` (`paroisseid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communaute`
--

LOCK TABLES `communaute` WRITE;
/*!40000 ALTER TABLE `communaute` DISABLE KEYS */;
INSERT INTO `communaute` VALUES (1,'Saint-Benjamin',1,10),(2,'Saint-Côme',1,11),(3,'Sainte-Aurélie',1,12),(4,'Saint-Gédéon',2,13),(5,'Saint-Georges',1,14),(6,'Saint-Jean-de-la-Lande',1,15),(7,'Saint-Ludger',2,16),(8,'Saint-Martin',2,17),(9,'Saint-Philibert',1,18),(10,'Saint-Prosper',1,19),(11,'Saint-René-Goupil',1,20),(12,'Saint-Robert-Bellarmin',2,21),(13,'Saint-Simon',1,22),(14,'Saint-Théophile',2,23),(15,'Saint-Zacharie',1,24),(16,'Assomption de la BVM',1,39),(17,'Notre-Dame-de-la-Providence',1,40);
/*!40000 ALTER TABLE `communaute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formulairebenevolat`
--

DROP TABLE IF EXISTS `formulairebenevolat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formulairebenevolat` (
  `formulaireid` int(11) NOT NULL AUTO_INCREMENT,
  `prenom` varbinary(1000) NOT NULL DEFAULT '',
  `nom` varbinary(1000) NOT NULL DEFAULT '',
  `adresse` varbinary(1000) NOT NULL DEFAULT '',
  `telephone` varbinary(1000) NOT NULL DEFAULT '',
  `cellulaire` varbinary(1000) NOT NULL DEFAULT '',
  `courriel` varbinary(1000) NOT NULL DEFAULT '',
  `benevolat1` varchar(500) NOT NULL DEFAULT '',
  `benevolat2` varchar(500) NOT NULL DEFAULT '',
  `benevolat3` varchar(500) NOT NULL DEFAULT '',
  `benevolat4` varchar(500) NOT NULL DEFAULT '',
  `paroisseid` int(11) NOT NULL DEFAULT 0,
  `communauteid` int(11) NOT NULL DEFAULT 0,
  `lundiam` tinyint(4) NOT NULL DEFAULT 0,
  `lundipm` tinyint(4) NOT NULL DEFAULT 0,
  `lundisoiree` tinyint(4) NOT NULL DEFAULT 0,
  `mardiam` tinyint(4) NOT NULL DEFAULT 0,
  `mardipm` tinyint(4) NOT NULL DEFAULT 0,
  `mardisoiree` tinyint(4) NOT NULL DEFAULT 0,
  `mercrediam` tinyint(4) NOT NULL DEFAULT 0,
  `mercredipm` tinyint(4) NOT NULL DEFAULT 0,
  `mercredisoiree` tinyint(4) NOT NULL DEFAULT 0,
  `jeudiam` tinyint(4) NOT NULL DEFAULT 0,
  `jeudipm` tinyint(4) NOT NULL DEFAULT 0,
  `jeudisoiree` tinyint(4) NOT NULL DEFAULT 0,
  `vendrediam` tinyint(4) NOT NULL DEFAULT 0,
  `vendredipm` tinyint(4) NOT NULL DEFAULT 0,
  `vendredisoiree` tinyint(4) NOT NULL DEFAULT 0,
  `samediam` tinyint(4) NOT NULL DEFAULT 0,
  `samedipm` tinyint(4) NOT NULL DEFAULT 0,
  `samedisoiree` tinyint(4) NOT NULL DEFAULT 0,
  `dimancheam` tinyint(4) NOT NULL DEFAULT 0,
  `dimanchepm` tinyint(4) NOT NULL DEFAULT 0,
  `dimanchesoiree` tinyint(4) NOT NULL DEFAULT 0,
  `key` varbinary(1000) NOT NULL DEFAULT '0',
  `iv` varbinary(1000) NOT NULL DEFAULT '0',
  PRIMARY KEY (`formulaireid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formulairebenevolat`
--

LOCK TABLES `formulairebenevolat` WRITE;
/*!40000 ALTER TABLE `formulairebenevolat` DISABLE KEYS */;
INSERT INTO `formulairebenevolat` VALUES (1,'GAecdq0BhnH27WAH0Vb6+oyVvnDNuf7qe+9ffXuqE2Q=','NuROQltZkTxjciE3pIBZXhYaOiuSMONH/XyHMnhzLWc=','j9ZhixIe/aSvzcQCeVa3kajwOyqO6NO3lXbBEK/4GWg=','1oxW5u+PG2xo1LneJ3WRfP6O0wgzHUgXGNigPLje3Ks=','567QfQTLU1FADKzLuhkrDg9qHh2zHj/MSQq52t++C+w=','3OKO2sy9mguIf5vWZIAExf6YfrqPQhLXBUiR8B8ezHOCF0t757sS6XmixVjzF9DA','','','','',0,0,1,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'oj\��\��0��k�\�v\�n{�F\�\�<�B�P\ZU*8','?ت��d�\0u��1�');
/*!40000 ALTER TABLE `formulairebenevolat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `menuId` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` varchar(45) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `redirectionPath` varchar(500) NOT NULL DEFAULT '',
  `sequence` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`menuId`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'0','Accueil','Accueil/Accueil.php',1),(2,'0','Paroisses-Communautés','ParoissesCommunaute/ParoissesCommunaute.php',2),(3,'0','Sacrements','Sacrements/Sacrements.php',3),(4,'0','Chemins de foi','CheminsDeFoi/CheminsDeFoi.php',4),(5,'0','Funérailles','Funerailles/Funerailles.php',5),(6,'0','Feuillets','Feuillets/Feuillets.php',6),(7,'0','Financement','Financement/Financement.php',7),(8,'2','St-Georges-de-Sartigan','ParoissesCommunaute/ParoissesCommunaute.php',2),(9,'2','Saint-Jean-Paul II','ParoissesCommunaute/ParoissesCommunaute.php',1),(10,'8','Saint-Benjamin','ParoissesCommunaute/ParoissesCommunaute.php',0),(11,'8','Saint-Côme','ParoissesCommunaute/ParoissesCommunaute.php',0),(12,'8','Sainte-Aurélie','ParoissesCommunaute/ParoissesCommunaute.php',0),(13,'9','Saint-Gédéon','ParoissesCommunaute/ParoissesCommunaute.php',0),(14,'8','Saint-Georges','ParoissesCommunaute/ParoissesCommunaute.php',0),(15,'8','Saint-Jean-de-la-Lande','ParoissesCommunaute/ParoissesCommunaute.php',0),(16,'9','Saint-Ludger','ParoissesCommunaute/ParoissesCommunaute.php',0),(17,'9','Saint-Martin','ParoissesCommunaute/ParoissesCommunaute.php',0),(18,'8','Saint-Philibert','ParoissesCommunaute/ParoissesCommunaute.php',0),(19,'8','Saint-Prosper','ParoissesCommunaute/ParoissesCommunaute.php',0),(20,'8','Saint-René-Goupil','ParoissesCommunaute/ParoissesCommunaute.php',0),(21,'9','Saint-Robert-Bellarmin','ParoissesCommunaute/ParoissesCommunaute.php',0),(22,'8','Saint-Simon','ParoissesCommunaute/ParoissesCommunaute.php',0),(23,'9','Saint-Théophile','ParoissesCommunaute/ParoissesCommunaute.php',0),(24,'8','Saint-Zacharie','ParoissesCommunaute/ParoissesCommunaute.php',0),(25,'3','Baptême','Sacrements/Sacrements.php',1),(26,'3','Premier pardon - réconciliation','Sacrements/Sacrements.php',2),(27,'3','Première communion','Sacrements/Sacrements.php',3),(28,'3','Confirmation','Sacrements/Sacrements.php',4),(29,'3','Mariage','TemplateText.php',5),(30,'3','Onction des malades','Sacrements/Sacrements.php',6),(31,'3','Initiation chrétienne des adultes','Sacrements/Sacrements.php',7),(32,'4','Liturgie','CheminsDeFoi/CheminsDeFoi.php',1),(33,'4','Enfants','CheminsDeFoi/CheminsDeFoi.php',2),(34,'4','Pastorale jeunesse','CheminsDeFoi/CheminsDeFoi.php',3),(35,'4','Équipes de fraternité','CheminsDeFoi/CheminsDeFoi.php',4),(36,'4','Croissance spirituelle','CheminsDeFoi/CheminsDeFoi.php',5),(37,'4','Comité Création Verte','CheminsDeFoi/CheminsDeFoi.php',6),(39,'8','Assomption de la BVM','ParoissesCommunaute/ParoissesCommunaute.php',0),(40,'8','Notre-Dame-de-la-Providence','ParoissesCommunaute/ParoissesCommunaute.php',0),(41,'32','Liturgie et thèmes liturgiques','TemplateText.php',1),(42,'32','Servants de messes','CheminsDeFoi/CheminsDeFoi.php',2),(43,'33','Éveil à la foi','CheminsDeFoi/CheminsDeFoi.php',1),(44,'33','Brebis de Jésus','CheminsDeFoi/CheminsDeFoi.php',2),(45,'33','Catéchèse','CheminsDeFoi/CheminsDeFoi.php',3),(46,'43','Agnelets','CheminsDeFoi/CheminsDeFoi.php',1),(47,'43','Liens intéressants','CheminsDeFoi/CheminsDeFoi.php',2),(48,'43','P\'tite Pasto','CheminsDeFoi/CheminsDeFoi.php',3),(49,'36','Catéchèse des adultes','CheminsDeFoi/CheminsDeFoi.php',1),(50,'36','Cellules paroissiales d\'évangélisation','CheminsDeFoi/CheminsDeFoi.php',2),(51,'36','Chapelles d\'adoration','CheminsDeFoi/CheminsDeFoi.php',3),(52,'36','Curcillo','CheminsDeFoi/CheminsDeFoi.php',4),(53,'36','Groupes de prière','CheminsDeFoi/CheminsDeFoi.php',5);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagecontenttemplatetext`
--

DROP TABLE IF EXISTS `pagecontenttemplatetext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagecontenttemplatetext` (
  `pageContentTemplateTextId` int(11) NOT NULL AUTO_INCREMENT,
  `menuid` int(11) NOT NULL DEFAULT 0,
  `image` varchar(200) NOT NULL DEFAULT '',
  `title` varchar(5000) NOT NULL DEFAULT '',
  `header` varchar(5000) NOT NULL DEFAULT '',
  `subtitle` varchar(5000) NOT NULL DEFAULT '',
  `content` longtext NOT NULL DEFAULT '',
  PRIMARY KEY (`pageContentTemplateTextId`),
  KEY `FK_pageContentMenuid` (`menuid`),
  CONSTRAINT `FK_pageContentMenuid` FOREIGN KEY (`menuid`) REFERENCES `menu` (`menuId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagecontenttemplatetext`
--

LOCK TABLES `pagecontenttemplatetext` WRITE;
/*!40000 ALTER TABLE `pagecontenttemplatetext` DISABLE KEYS */;
INSERT INTO `pagecontenttemplatetext` VALUES (1,41,'',' \n             \n             \n            test title 2\n          \n          ',' \n             \n            test header 3',' \n             \n             \n            test subtitle 2\n          \n          ',' \n             \n             \n            test content 2\n          \n          '),(2,29,'','<p class=\"MsoNormal\" align=\"center\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;text-align:center;line-height:normal\"><b><span style=\"font-size:12.0pt;\nfont-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\nmso-fareast-language:FR-CA\">Guide pour préparer son mariage</span></b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\"><o:p></o:p></span></p> \n            \n          ',' \n            \n          ',' \n            \n          ','<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Avant le\nMariage</span></b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\"><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Dès qu’un\nprojet de mariage se fait sentir, les futurs époux doivent consulter la\nparoisse de leur choix dans un délai d’au moins 6 mois à un an avant le\nmariage. C’est la première étape avant de réserver la salle de noces ou toute\nautre démarche. Nous devons conjuguer toutes nos demandes et vérifier la\ndisponibilité du ministre (Prêtre, diacre ou laïc engagé).<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Choix de l’église</span></b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\"><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Par\ntradition, il était fréquent que le mariage se célébrait dans l’église de la paroisse\nd’origine de la future mariée. Aujourd’hui, c’est souvent dans la communauté de\nrésidence qu’il se célèbre. Autrement, il faut vérifier dans la tierce paroisse\ndes disponibilités.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Préparation\nau mariage</span></b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\"><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Ici au\nQuébec, nous demandons que chaque couple s’inscrive à une session de\npréparation au mariage. Il existe différentes formes selon la disponibilité du\ncouple&nbsp;: session de fin de semaine intensive, soirées, couple\naccompagnateur, etc. Vous trouverez ici le calendrier des sessions de cette\nannée ainsi que d’autres informations&nbsp;: </span><a href=\"https://www.ecdq.org/sacrements/mariage/sessions-de-preparation-au-sacrement-du-mariage/\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">https://www.ecdq.org/sacrements/mariage/sessions-de-preparation-au-sacrement-du-mariage/</span></a><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\"><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Nécessité\nde la confirmation?<o:p></o:p></span></b></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA;\nmso-bidi-font-weight:bold\">Le mariage est un sacrement pour les inités à la foi\nchrétienne. Il est donc normal d’avoir terminé son initiation chrétienne pour\nse marier, y compris le sacrement de la confirmation. Vous trouverez des\néléments de réflexion intéressants ici&nbsp;: </span><a href=\"https://www.ecdq.org/wp-content/uploads/2016/05/Se-marier-en-eglise.pdf\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;mso-fareast-language:FR-CA;mso-bidi-font-weight:bold\">https://www.ecdq.org/wp-content/uploads/2016/05/Se-marier-en-eglise.pdf</span></a><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;mso-fareast-language:FR-CA;mso-bidi-font-weight:bold\"><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA;\nmso-bidi-font-weight:bold\">Soyez sans crainte! Des dispositions simples\npourront vous permettre de cheminer sans inquiétude ni retarder la célébration\nde votre mariage.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA;\nmso-bidi-font-weight:bold\">À ce moment, veuillez consulter la page de\nl’initiation chrétienne des adultes <span style=\"background:lime;mso-highlight:\nlime\">Bouton vers la page de l’initiation chrétienne des adultes.</span><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Les\nrencontres avec le ministre</span></b><span style=\"font-size:12.0pt;font-family:\n&quot;Times New Roman&quot;,serif;mso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:\nFR-CA\"><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Après\navoir communiqué votre projet à la paroisse, nous allons fixer la date de votre\nmariage et vous demander de vous inscrire à une session de préparation au\nmariage. Celui qui vous accompagnera dans votre démarche vous proposera\nquelques rendez-vous.<o:p></o:p></span></p>\n\n<ol start=\"1\" type=\"1\">\n <li class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\n     line-height:normal;mso-list:l0 level1 lfo1;tab-stops:list .5in\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:\n     &quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Par téléphone ou en\n     personne, nous prendrons les informations de base.<o:p></o:p></span></li>\n <li class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\n     line-height:normal;mso-list:l0 level1 lfo1;tab-stops:list .5in\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:\n     &quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Une rencontre se fera pour\n     discuter de votre projet et pour faire connaissance. Nous ferons aussi le\n     tour de votre parcours religieux, de votre vie de foi (votre initiation chrétienne,\n     baptême, réconciliation, eucharistie, confirmation). Nous proposerons de\n     faire le choix entre un mariage sans eucharistie ou avec eucharistie. Nous\n     entamerons l’enquête prénuptiale (il s’agit ici d’une quête d’informations\n     qui se déroule dans un climat de confiance et de connaissance mutuelle).<o:p></o:p></span></li>\n <li class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\n     line-height:normal;mso-list:l0 level1 lfo1;tab-stops:list .5in\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:\n     &quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">À la deuxième rencontre ou\n     une autre subséquente, nous porterons un regard sur votre\n     célébration&nbsp;: le déroulement, le choix des textes bibliques, etc.\n     Nous fixerons la date de la pratique (si nécessaire). Nous vous donnerons\n     les instructions pour le jour «J».<o:p></o:p></span></li>\n <li class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\n     line-height:normal;mso-list:l0 level1 lfo1;tab-stops:list .5in\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:\n     &quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Le grand jour.<o:p></o:p></span></li>\n</ol>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nmargin-left:.25in;line-height:normal\"><b><span style=\"font-size:12.0pt;\nfont-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\nmso-fareast-language:FR-CA\">Mariage avec ou sans Eucharistie</span></b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\"><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nmargin-left:.25in;line-height:normal\"><span style=\"font-size:12.0pt;font-family:\n&quot;Times New Roman&quot;,serif;mso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:\nFR-CA\">La seule différence est que dans le mariage sans eucharistie, il n’y a\npas la partie de la liturgie eucharistique. Ce n’est pas moins un mariage que\nl’autre forme. Compte-tenu de la baisse significative de la fréquentation de la\nmesse, et donc, du sens de l’eucharistie, nous estimons plus respectueux pour\nle couple, vos amis et pour l’Église de ne pas imposer cela dans le cadre de la\ncélébration du mariage. Une bonne discussion avec le ministre qui vous\naccompagne vous aidera à prendre la bonne décision.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nmargin-left:.25in;line-height:normal\"><b><span style=\"font-size:12.0pt;\nfont-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\nmso-fareast-language:FR-CA\">Quelques consignes</span></b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\"><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nmargin-left:.5in;line-height:normal\"><span style=\"font-size:12.0pt;font-family:\n&quot;Times New Roman&quot;,serif;mso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:\nFR-CA\">-&nbsp; Obtenir tous les documents nécessaires&nbsp;: <o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nmargin-left:70.8pt;line-height:normal\"><span style=\"font-size:12.0pt;\nfont-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\nmso-fareast-language:FR-CA\">- le certificat de baptême, celui de la paroisse\nd’origine doit être récent de 6 mois; <o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nmargin-left:70.8pt;line-height:normal\"><span style=\"font-size:12.0pt;\nfont-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\nmso-fareast-language:FR-CA\">- le certificat de naissance de l’état civil; <o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nmargin-left:70.8pt;line-height:normal\"><span style=\"font-size:12.0pt;\nfont-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\nmso-fareast-language:FR-CA\">- tous autres documents (divorce, déclaration de\nnullité, etc.).<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nmargin-left:.5in;line-height:normal\"><span style=\"font-size:12.0pt;font-family:\n&quot;Times New Roman&quot;,serif;mso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:\nFR-CA\">-&nbsp; Une tenue vestimentaire appropriée dans l’église qui est,\nrappelons-le, un lieu sacré, est importante pour vous et vos invités.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nmargin-left:.5in;line-height:normal\"><span style=\"font-size:12.0pt;font-family:\n&quot;Times New Roman&quot;,serif;mso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:\nFR-CA\">-&nbsp; La participation active de l’assemblée est requise ainsi que le\nrespect pour le lieu.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nmargin-left:.5in;line-height:normal\"><span style=\"font-size:12.0pt;font-family:\n&quot;Times New Roman&quot;,serif;mso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:\nFR-CA\">-&nbsp; Une attention spéciale sera portée, à l’église, <b>pas de gomme,\nde nourriture, de breuvage</b>.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Les\nintervenants lors de notre mariage</span></b><span style=\"font-size:12.0pt;\nfont-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\nmso-fareast-language:FR-CA\"><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Quel rôle\npeuvent jouer les différents intervenants à notre mariage?<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Les\nparents&nbsp;:</span></b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\"> Souvent,\nl’un deux est choisi comme témoin, ce qui n’est pas obligatoire. Des places\nleur sont réservées, s’ils sont divorcés ou séparés, vous devrez en discuter\navec votre ministre sur la place qu’ils occuperont dans la célébration.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Les\nenfants</span></b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\"> (s’il y\na lieu)&nbsp;: S’ils ont moins de 5 ans il est souhaitable qu’une personne\nfamilière puisse les prendre en charge. Pour les plus grands, ils peuvent être\nimpliqués dans la célébration soit en faisant la lecture des prières\nuniverselles, soit en apportant les alliances à l’autel et/ou soit pour le\nservice à l’autel. S’ils sont âgés de plus de 16 ans, ils peuvent être témoins\nà la signature des registres.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Les\ninvités&nbsp;</span></b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">: Ils\nparticipent activement à la célébration dans le respect, l’écoute, le\nrecueillement et la prière.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Le\ncortège</span></b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\"> (filles\net garçons d’honneur, page et bouquetière)&nbsp;: Ces personnes peuvent\nintervenir et contribuer à donner un sens à la célébration. «Entrer en cortège\ndans l’église, c’est marcher à la rencontre de Dieu qui vous invite». On veillera\nà ce que la marche se déroule paisiblement, accompagnée d’une musique adaptée\nau lieu sacré.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Les\ntémoins officiels&nbsp;:</span></b><span style=\"font-size:12.0pt;font-family:\n&quot;Times New Roman&quot;,serif;mso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:\nFR-CA\"> Le choix des témoins est abordé lors de l’enquête prénuptiale.\nRappelons que deux témoins sont nécessaires&nbsp;: «hommes ou femmes, catholiques\nou non, majeurs ou mineurs (16 ans minimum)».<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Les\nlecteurs&nbsp;:</span></b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\"> Bien que\ndes enfants puissent faire des lectures, il faut s’assurer de leurs capacités à\nle faire publiquement et au micro. L’Écriture occupe une place importante dans\nla cérémonie.&nbsp; Si la famille ne peut trouver de lecteur, la paroisse,\nprévenue à l’avance s’en occupera.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Les\nservants de messe</span></b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\"> (s’il y\na lieu)&nbsp;: S’il y a eucharistie, deux servants de messe sont requis. Des\njeunes ou un couple d’amis peuvent effectuer cette tâche s’ils ont l’expérience\net/ou se sentent à l’aise de l’accomplir. Si non, la paroisse s’en occupe.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Les\npréposés à l’accueil&nbsp;:</span></b><span style=\"font-size:12.0pt;font-family:\n&quot;Times New Roman&quot;,serif;mso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:\nFR-CA\"> Cette tâche est normalement confiée aux garçons d’honneur. Ils\ncontribuent à ce que tous prennent place avant le début de la célébration et\ns’assurent de bien diriger les familles.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Les\nmusiciens, choristes et techniciens&nbsp;:</span></b><span style=\"font-size:\n12.0pt;font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\nmso-fareast-language:FR-CA\"> Sujet très délicat, il est souvent source de\nmésententes. Une prémisse importante à considérer&nbsp;: nous sommes dans une\ncélébration liturgique&nbsp;et nous devons rappeler le <b><i>caractère sacré</i></b>\ndu mariage chrétien. Qui dit «liturgie» dit prière à Dieu.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Le choix\nmusical doit être conforme à la <b><i>musique sacrée et liturgique</i></b>. Le\nprogramme de chants doit être approuvé par le ministre. Le mariage n’est pas un\nspectacle alors, il faut y aller avec sobriété. Pour les chants profanes (ou\npopulaires), nous vous suggérons de les faire jouer à la noce.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">La\nparoisse fournit une liste de musiciens et de chanteurs/chanteuses qui ont\nl’expérience des liturgies et sauront vous faire de belles suggestions de\nchants appropriés.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Les\nspécialistes de l’image</span></b><span style=\"font-size:12.0pt;font-family:\n&quot;Times New Roman&quot;,serif;mso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:\nFR-CA\"> (photo et vidéo)&nbsp;: Il est important de choisir un photographe\nofficiel qui sera le <b><i>seul à se déplacer pendant la cérémonie</i></b>. Il\nse doit d’être discret dans ses déplacements, afin de ne pas perturber le\nclimat de prière. L’accès au sanctuaire (le chœur) lui est interdit.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Pour la\nvidéo, s’entendre avec le ministre lors de la pratique pour le lieu où il doit\ns’installer.<o:p></o:p></span></p>\n\n<div class=\"MsoNormal\" align=\"center\" style=\"margin-bottom:0in;margin-bottom:.0001pt;\ntext-align:center;line-height:normal\"><span style=\"font-size:12.0pt;font-family:\n&quot;Times New Roman&quot;,serif;mso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:\nFR-CA\">\n\n<hr size=\"2\" width=\"100%\" align=\"center\">\n\n</span></div>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Pour\ntoutes autres informations, veuillez remplir ce formulaire <span style=\"background:lime;mso-highlight:lime\">Bouton formulaire en annexe</span><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Vous\npouvez aussi communiquer avec le siège social de votre paroisse <span style=\"background:lime;mso-highlight:lime\">Bouton avec lien pour la page\nContactez-nous</span><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Finalement,\nvous pouvez aussi communiquer avec l’abbé Michel Paré, au 418-228-2084 poste\n226<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p> \n            \n          ');
/*!40000 ALTER TABLE `pagecontenttemplatetext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paroisse`
--

DROP TABLE IF EXISTS `paroisse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paroisse` (
  `paroisseid` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`paroisseid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paroisse`
--

LOCK TABLES `paroisse` WRITE;
/*!40000 ALTER TABLE `paroisse` DISABLE KEYS */;
INSERT INTO `paroisse` VALUES (1,'Paroisse St-Georges-de-Sartigan'),(2,'Paroisse Saint-Jean-Paul II');
/*!40000 ALTER TABLE `paroisse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'devenirdisciple.org'
--

--
-- Dumping routines for database 'devenirdisciple.org'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddEvent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddEvent`(IN inName NVARCHAR(100), IN inDate NVARCHAR(100), IN inDescr NVARCHAR(500), IN inColor NVARCHAR(50), IN inIcon NVARCHAR(50), IN inCommunityID INT(11))
BEGIN
	INSERT INTO calendarevent (name, date, descr, color, icon, communityId)
    VALUES (inName, inDate, inDescr, inColor, inIcon, inCommunityID);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConnexionAdmin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConnexionAdmin`(IN inEmail NVARCHAR(100), IN inPassword NVARCHAR(500), OUT AdminId INT)
BEGIN
	SET AdminId = 0;
	SET AdminId = (SELECT admin.adminId FROM admin WHERE admin.email = inEmail COLLATE utf8_general_ci AND admin.password LIKE BINARY inPassword);

    SELECT IF(ISNULL(AdminId) = 0, AdminId, 0) AS AdminId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `FormulaireBenevolatSave` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `FormulaireBenevolatSave`(IN inEmail VARBINARY(1000), IN inFirstName VARBINARY(1000), IN inLastName VARBINARY(1000), IN inAdresse VARBINARY(1000), IN inTelephone VARBINARY(1000),
																	  IN inCellulaire VARBINARY(1000), IN inBenevolat1 VARCHAR(500), IN inBenevolat2 VARCHAR(500), IN inBenevolat3 VARCHAR(500), IN inBenevolat4 VARCHAR(500),
                                                                      IN inParoisseId INT(11), IN inCommunauteId INT(11),IN inLundiAM TINYINT(4), IN inLundiPM TINYINT(4), IN inLundiSOIR TINYINT(4), IN inMardiAM TINYINT(4), IN inMardiPM TINYINT(4), IN inMardiSOIR TINYINT(4), IN inMercrediAM TINYINT(4), IN inMercrediPM TINYINT(4), IN inMercrediSOIR TINYINT(4),
																	  IN inJeudiAM TINYINT(4), IN inJeudiPM TINYINT(4), IN inJeudiSOIR TINYINT(4), IN inVendrediAM TINYINT(4), IN inVendrediPM TINYINT(4), IN inVendrediSOIR TINYINT(4), IN inSamediAM TINYINT(4), IN inSamediPM TINYINT(4), IN inSamediSOIR TINYINT(4),
                                                                      IN inDimancheAM TINYINT(4), IN inDimanchePM TINYINT(4), IN inDimancheSOIR TINYINT(4), IN inKey VARBINARY(1000), IN inIV VARBINARY(1000))
BEGIN
	INSERT INTO formulairebenevolat
	(`prenom`,
	`nom`,
	`adresse`,
	`telephone`,
	`cellulaire`,
	`courriel`,
	`benevolat1`,
	`benevolat2`,
	`benevolat3`,
	`benevolat4`,
	`paroisseid`,
    `communauteid`,
	`lundiam`,
	`lundipm`,
	`lundisoiree`,
	`mardiam`,
	`mardipm`,
	`mardisoiree`,
	`mercrediam`,
	`mercredipm`,
	`mercredisoiree`,
	`jeudiam`,
	`jeudipm`,
	`jeudisoiree`,
	`vendrediam`,
	`vendredipm`,
	`vendredisoiree`,
	`samediam`,
	`samedipm`,
	`samedisoiree`,
	`dimancheam`,
	`dimanchepm`,
	`dimanchesoiree`,
    `key`,
    `iv`)
	VALUES
	(inFirstName,
	inLastName,
	inAdresse,
	inTelephone,
	inCellulaire,
	inEmail,
	inBenevolat1,
	inBenevolat2,
	inBenevolat3,
	inBenevolat4,
	inParoisseId,
    inCommunauteId,
	inLundiAM,
	inLundiPM,
	inLundiSOIR,
	inMardiAM,
	inMardiPM,
	inMardiSOIR,
	inMercrediAM,
	inMercrediPM,
	inMercrediSOIR,
	inJeudiAM,
	inJeudiPM,
	inJeudiSOIR,
	inVendrediAM,
	inVendrediPM,
	inVendrediSOIR,
	inSamediAM,
	inSamediPM,
	inSamediSOIR,
	inDimancheAM,
	inDimanchePM,
	inDimancheSOIR,
    inKey,
    inIV);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllCommunauteOrderParoisse` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllCommunauteOrderParoisse`()
BEGIN
	SELECT nom, paroisseid, communauteid FROM communaute ORDER BY paroisseid, nom, communauteid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllEvents` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllEvents`(IN inCommunityId INT(11))
BEGIN
	SELECT eventId, name, descr, date, color, icon, communityId FROM calendarevent WHERE communityId = inCommunityId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllParoisse` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllParoisse`()
BEGIN
	SELECT nom, paroisseid FROM paroisse ORDER BY nom, paroisseid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetCommunityID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCommunityID`(IN inMenuID INT(11))
BEGIN
	SELECT communauteid, nom FROM communaute WHERE menuid = inMenuID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetMenus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetMenus`(IN inParentid INT(11))
BEGIN
  SELECT menu.menuId, menu.name, menu.redirectionPath FROM menu WHERE parentId = inParentid ORDER BY sequence, name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetPageContentTemplateText` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetPageContentTemplateText`(IN inMenuId INT(11))
BEGIN
	SELECT pagecontenttemplatetextid, menuid, image, title, header, subtitle, content FROM pagecontenttemplatetext WHERE menuid = inMenuId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SavePageContentTemplateText` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SavePageContentTemplateText`(IN inContentId INT(11), IN inMenuId INT(11), IN inTitle NVARCHAR(5000), IN inHeader NVARCHAR(5000), IN inSubtitle NVARCHAR(5000), IN inContent LONGTEXT)
BEGIN
	INSERT INTO pagecontenttemplatetext(menuid, title, header, subtitle, content) SELECT inMenuId, inTitle, inHeader, inSubtitle, inContent WHERE inContentId = 0;
    
    UPDATE pagecontenttemplatetext SET title = inTitle, header = inHeader, subtitle = inSubtitle, content = inContent WHERE menuid = inMenuId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-28 13:59:26
