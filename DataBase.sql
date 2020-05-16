CREATE DATABASE  IF NOT EXISTS `devenirdisciple.org` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `devenirdisciple.org`;
-- MariaDB dump 10.17  Distrib 10.4.10-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: devenirdisciple.org
-- ------------------------------------------------------
-- Server version	10.4.10-MariaDB

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
-- Table structure for table `accueil`
--

DROP TABLE IF EXISTS `accueil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accueil` (
  `accueilId` int(11) NOT NULL AUTO_INCREMENT,
  `imageHomeliePath` varchar(200) DEFAULT NULL,
  `imageTemoignagePath` varchar(200) DEFAULT NULL,
  `videoBienvenuePath` varchar(200) DEFAULT NULL,
  `imageFormulairePath` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`accueilId`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accueil`
--

LOCK TABLES `accueil` WRITE;
/*!40000 ALTER TABLE `accueil` DISABLE KEYS */;
INSERT INTO `accueil` VALUES (1,'../Ressource/Image/Bouton Homélie curé 01.jpg','../Ressource/Image/Bouton Témoignage 03.jpg','../Ressource/Video/Accueil curé.mov','../Ressource/Image/Bouton Bénévolat 02.jpg');
/*!40000 ALTER TABLE `accueil` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendarevent`
--

LOCK TABLES `calendarevent` WRITE;
/*!40000 ALTER TABLE `calendarevent` DISABLE KEYS */;
INSERT INTO `calendarevent` VALUES (10,'Test','04/22/2020 08:27 am','','fc-bg-lightgreen','calendar',16),(11,'Test','04/29/2020 08:35 am','','fc-bg-lightgreen','group',16),(13,'Test','04/29/2020 08:35 am','test','fc-bg-lightgreen','group',16),(14,'Test','04/09/2020 10:40 am - 04/16/2020 11:59 pm','Test','fc-bg-default','circle',16),(15,'Test affichage Éric','05/13/2020 02:44 pm','test affichage','fc-bg-default','circle',4);
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
-- Table structure for table `communityschedule`
--

DROP TABLE IF EXISTS `communityschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communityschedule` (
  `scheduleid` int(11) NOT NULL AUTO_INCREMENT,
  `schedule` longtext NOT NULL DEFAULT '',
  `communityid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`scheduleid`),
  KEY `FK_community` (`communityid`),
  CONSTRAINT `FK_community` FOREIGN KEY (`communityid`) REFERENCES `communaute` (`communauteid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communityschedule`
--

LOCK TABLES `communityschedule` WRITE;
/*!40000 ALTER TABLE `communityschedule` DISABLE KEYS */;
INSERT INTO `communityschedule` VALUES (1,'<ul><li><p>Lnndi de 9h à 12h30 et de 13h30 à 16h</p></li><li><p>Mardi de 9h à 12h30 et de 13h30 à 16h</p></li><li><p>Mercredi de 9h à 12h30 et de 13h30 à 16h</p></li><li><p>Jeudi de 9h à 12h30 et de 13h30 à 16h</p></li><li><p>Vendredi de 9h à 12h30 et de 13h30 à 16h</p></li><li><p>Samedi de 9h à 12h30 et de 13h30 à 16h</p></li></ul>',16),(2,'<p class=\"MsoListParagraphCxSpFirst\" style=\"text-indent:-.25in;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:\nSymbol\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span></span><!--[endif]--><span lang=\"EN-US\">Lundi\nde 8h à 15h</span><o:p></o:p></p>\n\n<p class=\"MsoListParagraphCxSpLast\" style=\"text-indent:-.25in;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:\nSymbol\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span></span><!--[endif]--><span lang=\"EN-US\">Jeudi\nde 12h à 17h</span><o:p></o:p></p>',4);
/*!40000 ALTER TABLE `communityschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feuillet`
--

DROP TABLE IF EXISTS `feuillet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feuillet` (
  `feuilletId` int(11) NOT NULL AUTO_INCREMENT,
  `pdfPath` varchar(200) DEFAULT NULL,
  `pdfName` varchar(100) DEFAULT NULL,
  `Actif` tinyint(4) DEFAULT NULL,
  `orderDisplay` int(11) DEFAULT NULL,
  `size` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`feuilletId`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feuillet`
--

LOCK TABLES `feuillet` WRITE;
/*!40000 ALTER TABLE `feuillet` DISABLE KEYS */;
/*!40000 ALTER TABLE `feuillet` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formulairebenevolat`
--

LOCK TABLES `formulairebenevolat` WRITE;
/*!40000 ALTER TABLE `formulairebenevolat` DISABLE KEYS */;
/*!40000 ALTER TABLE `formulairebenevolat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formulairecontact`
--

DROP TABLE IF EXISTS `formulairecontact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formulairecontact` (
  `formulaireid` int(11) NOT NULL AUTO_INCREMENT,
  `prenom` varbinary(1000) NOT NULL DEFAULT '',
  `nom` varbinary(1000) NOT NULL DEFAULT '',
  `courriel` varbinary(1000) NOT NULL DEFAULT '',
  `telephone` varbinary(1000) NOT NULL DEFAULT '',
  `message` varchar(8000) NOT NULL DEFAULT '',
  `key` varbinary(1000) NOT NULL DEFAULT '',
  `iv` varbinary(1000) NOT NULL DEFAULT '',
  PRIMARY KEY (`formulaireid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formulairecontact`
--

LOCK TABLES `formulairecontact` WRITE;
/*!40000 ALTER TABLE `formulairecontact` DISABLE KEYS */;
/*!40000 ALTER TABLE `formulairecontact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formulaireenfant`
--

DROP TABLE IF EXISTS `formulaireenfant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formulaireenfant` (
  `formulaireid` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varbinary(1000) NOT NULL DEFAULT '',
  `adresse` varbinary(1000) NOT NULL DEFAULT '',
  `codepostal` varbinary(1000) NOT NULL DEFAULT '',
  `courriel` varbinary(1000) NOT NULL DEFAULT '',
  `datenaissance` varbinary(1000) NOT NULL DEFAULT '',
  `nompere` varbinary(1000) NOT NULL DEFAULT '',
  `telpere` varbinary(1000) NOT NULL DEFAULT '',
  `nommere` varbinary(1000) NOT NULL DEFAULT '',
  `telmere` varbinary(1000) NOT NULL DEFAULT '',
  `bapteme` varchar(500) NOT NULL DEFAULT '',
  `pardon` varchar(500) NOT NULL DEFAULT '',
  `eucharistie` varchar(500) NOT NULL DEFAULT '',
  `allergies` varchar(500) NOT NULL DEFAULT '',
  `paroisseid` int(11) NOT NULL DEFAULT 0,
  `communauteid` int(11) NOT NULL DEFAULT 0,
  `initiation` tinyint(4) NOT NULL DEFAULT 0,
  `ptitepasto` tinyint(4) NOT NULL DEFAULT 0,
  `agnelets` tinyint(4) NOT NULL DEFAULT 0,
  `premierpardon` tinyint(4) NOT NULL DEFAULT 0,
  `premierecommunion` tinyint(4) NOT NULL DEFAULT 0,
  `confirmation` tinyint(4) NOT NULL DEFAULT 0,
  `brebis` tinyint(4) NOT NULL DEFAULT 0,
  `key` varbinary(1000) NOT NULL DEFAULT '0',
  `iv` varbinary(1000) NOT NULL DEFAULT '0',
  PRIMARY KEY (`formulaireid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formulaireenfant`
--

LOCK TABLES `formulaireenfant` WRITE;
/*!40000 ALTER TABLE `formulaireenfant` DISABLE KEYS */;
INSERT INTO `formulaireenfant` VALUES (15,'yQ1+q+LwqV9UQAfEr3LU2jt2hRMCqzgjSSLXT+YLfBc=','PWd1CTsWQAr5AlCAhjKDdSv2txXMOOVIJWGZ1HP2SQE=','Kh95MemWAeH5s032NLaS3AGIwz7Y+1eiTypIDvxhh8s=','4qouxtQtBay/ue/vVaJ4lmiw8dbBm3NV47N8B4lPcib1EgByNch3U4EpYcBY4VMo','TzkM+xb40gL5PppC+WIls/BXCE3u57jlc7nm1aL1208=','ADjslrEdLYPCcgpjmLjU75o2wA/76gj6OSlfBHgArUI=','HPWWUYXJJrGJ6/RsVMwV52+6D0x4EP5XsEWtbdAlIYk=','ZhLBT7MrLYQyxeXxx7pxP2JuNH8ARQIrWmVxwTvB/XI=','ZhLBT7MrLYQyxeXxx7pxP2JuNH8ARQIrWmVxwTvB/XI=','test','test','test','test',2,4,1,1,0,0,1,0,0,'/�<�lMZ\"�uq�s�|��P����WE�~3��','�(H�;K�e�VO��:�');
/*!40000 ALTER TABLE `formulaireenfant` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'0','Accueil','Accueil/Accueil.php',1),(2,'0','Paroisses-Communautés','ParoissesCommunaute/ParoissesCommunaute.php',3),(3,'0','Sacrements','Sacrements/Sacrements.php',4),(4,'0','Chemins de foi','CheminsDeFoi/CheminsDeFoi.php',5),(5,'0','Funérailles','Funerailles/Funerailles.php',6),(6,'0','Feuillets','Feuillets/Feuillets.php',7),(7,'0','Financement','Financement/Financement.php',8),(8,'2','St-Georges-de-Sartigan','ParoissesCommunaute/ParoissesCommunaute.php',2),(9,'2','Saint-Jean-Paul II','ParoissesCommunaute/ParoissesCommunaute.php',1),(10,'8','Saint-Benjamin','ParoissesCommunaute/ParoissesCommunaute.php',0),(11,'8','Saint-Côme','ParoissesCommunaute/ParoissesCommunaute.php',0),(12,'8','Sainte-Aurélie','ParoissesCommunaute/ParoissesCommunaute.php',0),(13,'9','Saint-Gédéon','ParoissesCommunaute/ParoissesCommunaute.php',0),(14,'8','Saint-Georges','ParoissesCommunaute/ParoissesCommunaute.php',0),(15,'8','Saint-Jean-de-la-Lande','ParoissesCommunaute/ParoissesCommunaute.php',0),(16,'9','Saint-Ludger','ParoissesCommunaute/ParoissesCommunaute.php',0),(17,'9','Saint-Martin','ParoissesCommunaute/ParoissesCommunaute.php',0),(18,'8','Saint-Philibert','ParoissesCommunaute/ParoissesCommunaute.php',0),(19,'8','Saint-Prosper','ParoissesCommunaute/ParoissesCommunaute.php',0),(20,'8','Saint-René-Goupil','ParoissesCommunaute/ParoissesCommunaute.php',0),(21,'9','Saint-Robert-Bellarmin','ParoissesCommunaute/ParoissesCommunaute.php',0),(22,'8','Saint-Simon','ParoissesCommunaute/ParoissesCommunaute.php',0),(23,'9','Saint-Théophile','ParoissesCommunaute/ParoissesCommunaute.php',0),(24,'8','Saint-Zacharie','ParoissesCommunaute/ParoissesCommunaute.php',0),(25,'3','Baptême','InformationPages/TemplateText.php',1),(26,'3','Premier pardon - réconciliation','InformationPages/TemplateAvecFormulaireEnfant.php',2),(27,'3','Première communion','InformationPages/TemplateAvecFormulaireEnfant.php',3),(28,'3','Confirmation','InformationPages/TemplateAvecFormulaireEnfant.php',4),(29,'3','Mariage','InformationPages/TemplateText.php',5),(30,'3','Onction des malades','InformationPages/TemplateText.php',6),(31,'3','Initiation chrétienne des adultes','InformationPages/TemplateText.php',7),(32,'4','Liturgie','CheminsDeFoi/CheminsDeFoi.php',1),(33,'4','Enfants','CheminsDeFoi/CheminsDeFoi.php',2),(34,'4','Pastorale jeunesse','InformationPages/TemplateText.php',3),(35,'4','Équipes de fraternité','InformationPages/TemplateText.php',4),(36,'4','Croissance spirituelle','InformationPages/TemplateText.php',5),(37,'4','Comité Création Verte','InformationPages/TemplateText.php',6),(39,'8','Assomption de la BVM','ParoissesCommunaute/ParoissesCommunaute.php',0),(40,'8','Notre-Dame-de-la-Providence','ParoissesCommunaute/ParoissesCommunaute.php',0),(41,'32','Liturgie et thèmes liturgiques','InformationPages/TemplateText.php',1),(42,'32','Servants de messes','InformationPages/TemplateText.php',2),(43,'33','Éveil à la foi','CheminsDeFoi/CheminsDeFoi.php',1),(44,'33','Brebis de Jésus','InformationPages/TemplateText.php',2),(45,'33','Catéchèse','InformationPages/TemplateAvecFormulaireEnfant.php',3),(46,'43','Agnelets','InformationPages/TemplateText.php',1),(47,'43','Liens intéressants','InformationPages/TemplateText.php',2),(48,'43','P\'tite Pasto','InformationPages/TemplateAvecFormulaireEnfant.php',3),(49,'36','Catéchèse des adultes','InformationPages/TemplateText.php',1),(50,'36','Cellules paroissiales d\'évangélisation','InformationPages/TemplateText.php',2),(51,'36','Chapelles d\'adoration','InformationPages/TemplateText.php',3),(52,'36','Curcillo','InformationPages/TemplateText.php',4),(53,'36','Groupes de prière','InformationPages/TemplateText.php',5),(54,'7','Campagne','InformationPages/TemplateText.php',1),(55,'7','Autres activités','InformationPages/TemplateText.php',2),(56,'7','Magasin','InformationPages/TemplateText.php',3),(57,'7','Mario Pelchat et les prêtres','InformationPages/TemplateText.php',4),(58,'36','Déjeuners de la Parole','InformationPages/TemplateText.php',6),(59,'0','Salle de nouvelles','Nouvelles/Nouvelles.php',2);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nouvelles`
--

DROP TABLE IF EXISTS `nouvelles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nouvelles` (
  `nouvellesId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `descrSomm` varchar(100) DEFAULT NULL,
  `descrTot` longtext DEFAULT NULL,
  `dateDebut` int(11) DEFAULT NULL,
  `dateFin` int(11) DEFAULT NULL,
  `actif` tinyint(1) DEFAULT NULL,
  `imagePath` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`nouvellesId`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nouvelles`
--

LOCK TABLES `nouvelles` WRITE;
/*!40000 ALTER TABLE `nouvelles` DISABLE KEYS */;
INSERT INTO `nouvelles` VALUES (20,'nouvelle1','somm','total',1588219200,1588219200,1,'../Ressource/Image/Salle_de_nouvelles.jpg'),(21,'nouvelle2','somm','total',1588252052,1585713600,1,'../Ressource/Image/Les_activite_dans_nos_communautes.jpg'),(22,'nouvelle3','somm','total',1588252052,1588252630,1,'../Ressource/Image/Campagne_de_financement.jpg'),(23,'nouvelle4','somm','total',1588252052,1588252630,1,'../Ressource/Image/Nos_Paroisses_apres_la_Pandemie.jpg'),(38,'titleap2','pee','pett',1589342400,1589342400,1,'../Ressource/Image/Notre_communaute_numerique.jpg');
/*!40000 ALTER TABLE `nouvelles` ENABLE KEYS */;
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
  `title` longtext NOT NULL DEFAULT '',
  `header` longtext NOT NULL DEFAULT '',
  `subtitle` longtext NOT NULL DEFAULT '',
  `content` longtext NOT NULL DEFAULT '',
  PRIMARY KEY (`pageContentTemplateTextId`),
  KEY `FK_pageContentMenuid` (`menuid`),
  CONSTRAINT `FK_pageContentMenuid` FOREIGN KEY (`menuid`) REFERENCES `menu` (`menuId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagecontenttemplatetext`
--

LOCK TABLES `pagecontenttemplatetext` WRITE;
/*!40000 ALTER TABLE `pagecontenttemplatetext` DISABLE KEYS */;
INSERT INTO `pagecontenttemplatetext` VALUES (1,41,'','','','','<p class=\"MsoNormal\" style=\"margin-bottom: 0.0001pt; line-height: 16.8pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:#222222;mso-fareast-language:\nFR-CA\">La&nbsp;<b>liturgie catholique</b>&nbsp;est l\'ensemble des&nbsp;</span><span style=\"color:black;mso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/Rites_de_l%27%C3%89glise_catholique\" title=\"Rites de l\'Église catholique\"><span style=\"font-size:12.0pt;font-family:\n&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;color:black;\nmso-color-alt:windowtext;mso-fareast-language:FR-CA\">rites</span></a></span><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:#222222;mso-fareast-language:FR-CA\">&nbsp;et des\ncérémonies développés au cours de l\'histoire par </span><span style=\"font-size:\n12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\ncolor:black;mso-color-alt:windowtext;mso-fareast-language:FR-CA\">l\'</span><span style=\"color:black;mso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/%C3%89glise_catholique\" title=\"Église catholique\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;\nmso-fareast-language:FR-CA\">Église catholique</span></a></span><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:#222222;mso-fareast-language:FR-CA\">. Mis en œuvre au\ncours d\'une célébration religieuse, ces rites expriment l\'adoration rendue par </span><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;mso-fareast-language:\nFR-CA\">les&nbsp;</span><span style=\"color:black;mso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/Fid%C3%A8le\" title=\"Fidèle\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;mso-fareast-language:\nFR-CA\">fidèles</span></a></span><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;\nmso-fareast-language:FR-CA\">&nbsp;au&nbsp;</span><span style=\"color:black;\nmso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/Dieu\" title=\"Dieu\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;\nmso-fareast-language:FR-CA\">Dieu</span></a></span><span style=\"font-size:12.0pt;\nfont-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\ncolor:black;mso-color-alt:windowtext;mso-fareast-language:FR-CA\">&nbsp;unique\net&nbsp;</span><span style=\"color:black;mso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/Trinit%C3%A9_(th%C3%A9ologie)\" title=\"Trinité (théologie)\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;\nmso-fareast-language:FR-CA\">trinitaire</span></a></span><span style=\"font-size:\n12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\ncolor:#222222;mso-fareast-language:FR-CA\">.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom: 0.0001pt; line-height: 16.8pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:#222222;mso-fareast-language:\nFR-CA\">Les rites liturgiques, même si ce n\'est pas dans tous leurs détails, ont\nleur origine dans </span><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;\nmso-fareast-language:FR-CA\">le&nbsp;</span><span style=\"color:black;mso-color-alt:\nwindowtext\"><a href=\"https://fr.wikipedia.org/wiki/Nouveau_Testament\" title=\"Nouveau Testament\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;\nmso-fareast-language:FR-CA\">Nouveau Testament</span></a></span><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;mso-fareast-language:\nFR-CA\">. Les rites et les cérémonies sont régis et administrés par les\nautorités de l’Église catholique. </span><span style=\"font-size:12.0pt;\nfont-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\nmso-fareast-language:FR-CA\"><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom: 0.0001pt; line-height: 16.8pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;\nmso-fareast-language:FR-CA\">Le mot&nbsp;</span><span style=\"color:black;\nmso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/Liturgie\" title=\"Liturgie\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;\nmso-fareast-language:FR-CA\">liturgie</span></a></span><span style=\"font-size:\n12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\ncolor:black;mso-color-alt:windowtext;mso-fareast-language:FR-CA\">&nbsp;désigne\ndonc, littéralement, l\'action populaire pour honorer Dieu.</span><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\"><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom: 0.0001pt; line-height: 16.8pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;\nmso-fareast-language:FR-CA\">La liturgie est, en effet, sacrée</span><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:#222222;mso-fareast-language:FR-CA\">. <o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom: 0.0001pt; line-height: 16.8pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:#222222;mso-fareast-language:\nFR-CA\">La liturgie est donc un ensemble d’actes</span><span style=\"font-size:\n12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\ncolor:black;mso-color-alt:windowtext;mso-fareast-language:FR-CA\">, de&nbsp;</span><span style=\"color:black;mso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/Symbole\" title=\"Symbole\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;mso-fareast-language:\nFR-CA\">symboles</span></a></span><span style=\"font-size:12.0pt;font-family:\n&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;color:black;\nmso-color-alt:windowtext;mso-fareast-language:FR-CA\">&nbsp;et de paroles par\nlesquels l’Église aide les hommes à rendre un&nbsp;</span><span style=\"color:black;mso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/Culte\" title=\"Culte\"><span style=\"font-size:\n12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\ncolor:black;mso-color-alt:windowtext;mso-fareast-language:FR-CA\">culte</span></a></span><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;mso-fareast-language:\nFR-CA\">&nbsp;à&nbsp;</span><span style=\"color:black;mso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/Dieu\" title=\"Dieu\"><span style=\"font-size:\n12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\ncolor:black;mso-color-alt:windowtext;mso-fareast-language:FR-CA\">Dieu</span></a></span><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;mso-fareast-language:\nFR-CA\">&nbsp;et transmet la connaissance de Dieu aux hommes. On peut dire que\nla liturgie met l’homme en contact avec&nbsp;</span><span style=\"color:black;\nmso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/Dieu\" title=\"Dieu\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;\nmso-fareast-language:FR-CA\">Dieu</span></a></span><span style=\"font-size:12.0pt;\nfont-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\ncolor:black;mso-color-alt:windowtext;mso-fareast-language:FR-CA\">. </span><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:#222222;mso-fareast-language:FR-CA\">D\'autre part, la\nliturgie est une prière commune, officielle et publique, soumise à des normes.\nElle met en œuvre un code rituel&nbsp;: ni le célébrant, ni les assistants ne\npeuvent faire ce qu\'ils veulent. Ce n\'est pas du théâtre, mais il y a bien une\nmise en scène. Il s\'agit de faire ceci ou cela, de telle et telle manière, à\ntel et tel moment. La personne qui participe à une liturgie n\'interprète pas un\nrôle&nbsp;: dans cette prière, elle est pleinement elle-même. Elle investit la\nliturgie avec tout ce qu\'elle est, y compris son corps.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom: 0.0001pt; line-height: 16.8pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;\nmso-fareast-language:FR-CA\">La célébration des&nbsp;</span><span style=\"color:black;mso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/Sacrement\" title=\"Sacrement\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;mso-fareast-language:\nFR-CA\">sacrements</span></a></span><span style=\"font-size:12.0pt;font-family:\n&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;color:black;\nmso-color-alt:windowtext;mso-fareast-language:FR-CA\">&nbsp;(</span><span style=\"color:black;mso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/Messe\" title=\"Messe\"><span style=\"font-size:\n12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\ncolor:black;mso-color-alt:windowtext;mso-fareast-language:FR-CA\">Eucharistie</span></a></span><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;mso-fareast-language:\nFR-CA\">,&nbsp;</span><span style=\"color:black;mso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/Bapt%C3%AAme\" title=\"Baptême\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;mso-fareast-language:\nFR-CA\">baptême</span></a></span><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;\nmso-fareast-language:FR-CA\">, etc.) tout comme la&nbsp;</span><span style=\"color:black;mso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/Liturgie_des_Heures\" title=\"Liturgie des Heures\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;\nmso-fareast-language:FR-CA\">Liturgie des Heures</span></a></span><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;mso-fareast-language:\nFR-CA\">&nbsp;font partie de la liturgie. En revanche, une récitation de\nla&nbsp;</span><span style=\"color:black;mso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/Pri%C3%A8re\" title=\"Prière\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;mso-fareast-language:\nFR-CA\">prière</span></a></span><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;\nmso-fareast-language:FR-CA\">&nbsp;du&nbsp;</span><span style=\"color:black;\nmso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/Rosaire\" title=\"Rosaire\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;\nmso-fareast-language:FR-CA\">rosaire</span></a></span><span style=\"font-size:\n12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\ncolor:black;mso-color-alt:windowtext;mso-fareast-language:FR-CA\">&nbsp;entre\npersonnes privées, y compris quand elles sont réunies dans un lieu de&nbsp;</span><span style=\"color:black;mso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/Culte\" title=\"Culte\"><span style=\"font-size:\n12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\ncolor:black;mso-color-alt:windowtext;mso-fareast-language:FR-CA\">culte</span></a></span><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;mso-fareast-language:\nFR-CA\">&nbsp;et accompagnée par un&nbsp;</span><span style=\"color:black;\nmso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/Pr%C3%AAtre_catholique\" title=\"Prêtre catholique\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;\nmso-fareast-language:FR-CA\">prêtre</span></a></span><span style=\"font-size:\n12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\ncolor:black;mso-color-alt:windowtext;mso-fareast-language:FR-CA\">&nbsp;ou\nun&nbsp;</span><span style=\"color:black;mso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/Diacre_(catholicisme)\" title=\"Diacre (catholicisme)\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;\nmso-fareast-language:FR-CA\">diacre</span></a></span><span style=\"font-size:\n12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\ncolor:black;mso-color-alt:windowtext;mso-fareast-language:FR-CA\">, n\'est pas\nconsidérée comme un rite liturgique.</span><span style=\"font-size:12.0pt;\nfont-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\nmso-fareast-language:FR-CA\"><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom: 0.0001pt; line-height: 16.8pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;\nmso-fareast-language:FR-CA\">Le point culminant de la liturgie catholique est la\nfête de&nbsp;</span><span style=\"color:black;mso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/P%C3%A2ques\" title=\"Pâques\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;mso-fareast-language:\nFR-CA\">Pâques</span></a></span><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;\nmso-fareast-language:FR-CA\">, fête de la&nbsp;</span><span style=\"color:black;\nmso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/R%C3%A9surrection\" title=\"Résurrection\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;mso-fareast-language:\nFR-CA\">résurrection</span></a></span><span style=\"font-size:12.0pt;font-family:\n&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;color:black;\nmso-color-alt:windowtext;mso-fareast-language:FR-CA\">&nbsp;de&nbsp;</span><span style=\"color:black;mso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/J%C3%A9sus_de_Nazareth\" title=\"Jésus de Nazareth\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;\nmso-fareast-language:FR-CA\">Jésus</span></a></span><span style=\"font-size:12.0pt;\nfont-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\ncolor:black;mso-color-alt:windowtext;mso-fareast-language:FR-CA\">. La\nrésurrection de Jésus est aussi célébrée chaque&nbsp;</span><span style=\"color:black;mso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/Dimanche\" title=\"Dimanche\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;mso-fareast-language:\nFR-CA\">dimanche</span></a></span><span style=\"font-size:12.0pt;font-family:\n&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;color:black;\nmso-color-alt:windowtext;mso-fareast-language:FR-CA\">, et chaque&nbsp;</span><span style=\"color:black;mso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/Semaine\" title=\"Semaine\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;mso-fareast-language:\nFR-CA\">semaine</span></a></span><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;\nmso-fareast-language:FR-CA\">&nbsp;est couronnée liturgiquement par le </span><span style=\"color:black;mso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/Dimanche\" title=\"Dimanche\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;mso-fareast-language:\nFR-CA\">dimanche</span></a></span><span style=\"font-size:12.0pt;font-family:\n&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;color:#222222;\nmso-fareast-language:FR-CA\">.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom: 0.0001pt; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:9.0pt;font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:#222222;mso-fareast-language:\nFR-CA\"><o:p>&nbsp;</o:p></span></p>\n\n<div style=\"border-top: none; border-right: none; border-left: none; border-image: initial; border-bottom: 1pt solid rgb(162, 169, 177); padding: 0in; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">\n\n<p class=\"MsoNormal\" align=\"center\" style=\"margin-bottom: 0.0001pt; text-align: center; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: none; padding: 0in;\"><b><u><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-fareast-language:FR-CA\">Cinq branches de la\nliturgie catholique<o:p></o:p></span></u></b></p>\n\n<p class=\"MsoNormal\" align=\"center\" style=\"margin-bottom: 0.0001pt; text-align: center; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: none; padding: 0in;\"><b><u><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-fareast-language:FR-CA\"><o:p><span style=\"text-decoration-line: none;\">&nbsp;</span></o:p></span></u></b></p>\n\n</div>\n\n<div style=\"border-top: none; border-right: none; border-left: none; border-image: initial; border-bottom: 1pt dotted rgb(170, 170, 170); padding: 0in; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">\n\n<p class=\"MsoNormal\" style=\"margin-bottom: 0.0001pt; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: none; padding: 0in;\"><b><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-fareast-language:FR-CA\">Les sacrements<o:p></o:p></span></b></p>\n\n</div>\n\n<p class=\"MsoNormal\" style=\"margin: 0in 0in 0.0001pt 27pt; line-height: 16.8pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;mso-fareast-language:\nFR-CA\">Les&nbsp;</span><span style=\"color:black;mso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/Sacrement\" title=\"Sacrement\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;mso-fareast-language:\nFR-CA\">sacrements</span></a></span><span style=\"font-size:12.0pt;font-family:\n&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;color:black;\nmso-color-alt:windowtext;mso-fareast-language:FR-CA\">&nbsp;sont une forme\nparticulière de la prière de l\'Église. Dieu agit directement au travers\ndes&nbsp;</span><span style=\"color:black;mso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/Sacrement\" title=\"Sacrement\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;mso-fareast-language:\nFR-CA\">sacrements</span></a></span><span style=\"font-size:12.0pt;font-family:\n&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;color:black;\nmso-color-alt:windowtext;mso-fareast-language:FR-CA\">&nbsp;auprès des hommes.\nChaque sacrement est normalisé et ces normes sont promulguées dans des livres\nliturgiques spécifiques à chacun.</span><span style=\"font-size:12.0pt;\nfont-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\nmso-fareast-language:FR-CA\"><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin: 0in 0in 0.0001pt 27pt; line-height: 16.8pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;mso-fareast-language:\nFR-CA\">Les&nbsp;</span><span style=\"color:black;mso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/Sacrement\" title=\"Sacrement\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;mso-fareast-language:\nFR-CA\">sacrements</span></a></span><span style=\"font-size:12.0pt;font-family:\n&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;color:black;\nmso-color-alt:windowtext;mso-fareast-language:FR-CA\">, sont des signes de\nl’action de&nbsp;</span><span style=\"color:black;mso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/Dieu\" title=\"Dieu\"><span style=\"font-size:\n12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\ncolor:black;mso-color-alt:windowtext;mso-fareast-language:FR-CA\">Dieu</span></a></span><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;mso-fareast-language:\nFR-CA\">&nbsp;dans la vie d’un croyant et de l’Église. </span><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\"><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin: 0in 0in 0.0001pt 27pt; line-height: 16.8pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;mso-fareast-language:\nFR-CA\">L’Église distingue également des&nbsp;</span><span style=\"color:black;\nmso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/Sacramental\" title=\"Sacramental\"><i><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;\nmso-fareast-language:FR-CA\">sacramentaux</span></i></a></span><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;mso-fareast-language:\nFR-CA\">, comme les&nbsp;</span><span style=\"color:black;mso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/B%C3%A9n%C3%A9diction\" title=\"Bénédiction\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;mso-fareast-language:\nFR-CA\">bénédictions</span></a></span><span style=\"font-size:12.0pt;font-family:\n&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;color:black;\nmso-color-alt:windowtext;mso-fareast-language:FR-CA\">&nbsp;d’une maison,\nd’un&nbsp;</span><span style=\"color:black;mso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/Rosaire\" title=\"Rosaire\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;mso-fareast-language:\nFR-CA\">rosaire</span></a></span><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;\nmso-fareast-language:FR-CA\">, de catéchistes, les funérailles chrétiennes.</span><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\"><o:p></o:p></span></p>\n\n<div style=\"border-top: none; border-right: none; border-left: none; border-image: initial; border-bottom: 1pt dotted rgb(170, 170, 170); padding: 0in; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">\n\n<p class=\"MsoNormal\" style=\"margin-bottom: 0.0001pt; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: none; padding: 0in;\"><b><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-fareast-language:FR-CA\">La messe</span></b><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:#222222;mso-fareast-language:FR-CA\">.<o:p></o:p></span></p>\n\n</div>\n\n<p class=\"MsoNormal\" style=\"margin: 0in 0in 0.0001pt 27pt; line-height: 16.8pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;mso-fareast-language:\nFR-CA\">Dans le cas de la messe, la liturgie se fait à la fois action de Dieu\nauprès des hommes et action de grâce des hommes auprès de Dieu. Le&nbsp;</span><span style=\"color:black;mso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/Missel\" title=\"Missel\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;mso-fareast-language:\nFR-CA\">missel</span></a></span><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;\nmso-fareast-language:FR-CA\">&nbsp;est le livre utilisé par les&nbsp;</span><span style=\"color:black;mso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/Pr%C3%AAtre_catholique\" title=\"Prêtre catholique\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;\nmso-fareast-language:FR-CA\">prêtres</span></a></span><span style=\"font-size:\n12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\ncolor:black;mso-color-alt:windowtext;mso-fareast-language:FR-CA\">. Ils y\ntrouvent l\'ordonnancement des&nbsp;</span><span style=\"color:black;mso-color-alt:\nwindowtext\"><a href=\"https://fr.wikipedia.org/wiki/Pri%C3%A8re\" title=\"Prière\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;mso-fareast-language:\nFR-CA\">prières</span></a></span><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;\nmso-fareast-language:FR-CA\">&nbsp;publiques de l\'Église en présence de&nbsp;</span><span style=\"color:black;mso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/Fid%C3%A8le\" title=\"Fidèle\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;mso-fareast-language:\nFR-CA\">fidèles</span></a></span><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;\nmso-fareast-language:FR-CA\">. L\'utilité de ces prières sont la gloire de Dieu,\nmais aussi l\'édification des fidèles.</span><span style=\"font-size:12.0pt;\nfont-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\nmso-fareast-language:FR-CA\"><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin: 0in 0in 0.0001pt 27pt; line-height: 16.8pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;mso-fareast-language:\nFR-CA\">La messe est la réactualisation non sanglante du sacrifice du Christ. </span><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\"><o:p></o:p></span></p>\n\n<div style=\"border-top: none; border-right: none; border-left: none; border-image: initial; border-bottom: 1pt dotted rgb(170, 170, 170); padding: 0in; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">\n\n<p class=\"MsoNormal\" style=\"margin-bottom: 0.0001pt; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: none; padding: 0in;\"><b><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-fareast-language:FR-CA\">Les célébrations\nliturgiques autres que les messes<o:p></o:p></span></b></p>\n\n</div>\n\n<div style=\"border-top: none; border-right: none; border-left: none; border-image: initial; border-bottom: 1pt dotted rgb(170, 170, 170); padding: 0in; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; margin-left: 27pt; margin-right: 0in;\">\n\n<p class=\"MsoNormal\" style=\"margin-bottom: 0.0001pt; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: none; padding: 0in;\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;mso-fareast-language:\nFR-CA\">La consécration ou&nbsp;</span><span style=\"color:black;mso-color-alt:\nwindowtext\"><a href=\"https://fr.wikipedia.org/wiki/D%C3%A9dicace_(c%C3%A9r%C3%A9monie)\" title=\"Dédicace (cérémonie)\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;\nmso-fareast-language:FR-CA\">dédicace</span></a></span><span style=\"font-size:\n12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\ncolor:black;mso-color-alt:windowtext;mso-fareast-language:FR-CA\">&nbsp;d\'une&nbsp;</span><span style=\"color:black;mso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/%C3%89glise_(%C3%A9difice)\" title=\"Église (édifice)\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;\nmso-fareast-language:FR-CA\">église</span></a></span><span style=\"font-size:\n12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\ncolor:black;mso-color-alt:windowtext;mso-fareast-language:FR-CA\">&nbsp;; les\nassemblées et veillées de prière, les plus importantes étant celles de&nbsp;</span><span style=\"color:black;mso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/No%C3%ABl\" title=\"Noël\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;mso-fareast-language:\nFR-CA\">Noël</span></a></span><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;\nmso-fareast-language:FR-CA\">&nbsp;et la&nbsp;</span><span style=\"color:black;\nmso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/Vigile_pascale\" title=\"Vigile pascale\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;\nmso-fareast-language:FR-CA\">vigile pascale</span></a></span><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;mso-fareast-language:\nFR-CA\">&nbsp;; le&nbsp;</span><span style=\"color:black;mso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/Chemin_de_croix\" title=\"Chemin de croix\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;mso-fareast-language:\nFR-CA\">chemin de croix</span></a></span><span style=\"font-size:12.0pt;\nfont-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\ncolor:black;mso-color-alt:windowtext;mso-fareast-language:FR-CA\">, effectué le\nVendredi Saint, qui rappelle les souffrances du Christ au cours de sa&nbsp;</span><span style=\"color:black;mso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/La_Passion\" title=\"La Passion\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;mso-fareast-language:\nFR-CA\">Passion</span></a></span><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;\nmso-fareast-language:FR-CA\">&nbsp;; &nbsp;l’office de l’après-midi du&nbsp;</span><span style=\"color:black;mso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/Vendredi_saint\" title=\"Vendredi saint\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;mso-fareast-language:\nFR-CA\">Vendredi saint</span></a></span><span style=\"font-size:12.0pt;\nfont-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\ncolor:black;mso-color-alt:windowtext;mso-fareast-language:FR-CA\">&nbsp;qui\nn\'est, en fait, pas une messe.</span><span style=\"font-size:12.0pt;font-family:\n&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:\nFR-CA\"><o:p></o:p></span></p>\n\n</div>\n\n<div style=\"border-top: none; border-right: none; border-left: none; border-image: initial; border-bottom: 1pt dotted rgb(170, 170, 170); padding: 0in; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">\n\n<p class=\"MsoNormal\" style=\"margin-bottom: 0.0001pt; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: none; padding: 0in;\"><b><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-fareast-language:FR-CA\">L\'Office divin</span></b><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:#222222;mso-fareast-language:FR-CA\"><o:p></o:p></span></p>\n\n</div>\n\n<p class=\"MsoNormal\" style=\"margin: 0in 0in 0.0001pt 27pt; line-height: 16.8pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;mso-fareast-language:\nFR-CA\">L\'Office Divin (ou&nbsp;</span><span style=\"color:black;mso-color-alt:\nwindowtext\"><a href=\"https://fr.wikipedia.org/wiki/Liturgie_des_Heures\" title=\"Liturgie des Heures\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;\nmso-fareast-language:FR-CA\">Liturgie des Heures</span></a></span><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;mso-fareast-language:\nFR-CA\">) est une louange rendue à&nbsp;</span><span style=\"color:black;\nmso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/Dieu\" title=\"Dieu\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;\nmso-fareast-language:FR-CA\">Dieu</span></a></span><span style=\"font-size:12.0pt;\nfont-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\ncolor:black;mso-color-alt:windowtext;mso-fareast-language:FR-CA\">&nbsp;seul par\nla prière commune de l’Église catholique. Sa seule «&nbsp;utilité&nbsp;» est la\ngloire de Dieu. C\'est un dialogue d\'amour entre Dieu et son peuple, en\nutilisant les mots de Dieu contenus dans l\'</span><span style=\"color:black;\nmso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/Bible\" title=\"Bible\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;\nmso-fareast-language:FR-CA\">Écriture Sainte</span></a></span><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;mso-fareast-language:\nFR-CA\">. </span><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\"><o:p></o:p></span></p>\n\n<div style=\"border-top: none; border-right: none; border-left: none; border-image: initial; border-bottom: 1pt dotted rgb(170, 170, 170); padding: 0in; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">\n\n<p class=\"MsoNormal\" style=\"margin-bottom: 0.0001pt; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: none; padding: 0in;\"><b><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;mso-fareast-language:\nFR-CA\">Dévotions catholiques</span></b><span style=\"font-size:12.0pt;\nfont-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\ncolor:black;mso-color-alt:windowtext;mso-fareast-language:FR-CA\">]</span><b><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\"><o:p></o:p></span></b></p>\n\n</div>\n\n<p class=\"MsoNormal\" style=\"margin: 0in 0in 0.0001pt 27pt; line-height: 16.8pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;mso-fareast-language:\nFR-CA\">Les&nbsp;</span><span style=\"color:black;mso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/D%C3%A9votions_catholiques\" title=\"Dévotions catholiques\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;\nmso-fareast-language:FR-CA\">dévotions catholiques</span></a></span><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;mso-fareast-language:\nFR-CA\">&nbsp;sont des types de prières (telles que celle dédiée, par exemple,\nau&nbsp;</span><span style=\"color:black;mso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/D%C3%A9votion_au_Pr%C3%A9cieux_Sang\" title=\"Dévotion au Précieux Sang\"><span style=\"font-size:12.0pt;font-family:\n&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;color:black;\nmso-color-alt:windowtext;mso-fareast-language:FR-CA\">Précieux Sang</span></a></span><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;mso-fareast-language:\nFR-CA\">) qui n\'ont pas été élaborées officiellement par l\'Église mais sont\nissues de pratiques développées par des particuliers (ou groupe de\nparticuliers). Cependant, nombre d\'entre elles sont officiellement approuvées\npar l\'Église catholique.</span><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\"><o:p></o:p></span></p>\n\n<div style=\"border-top: none; border-right: none; border-left: none; border-image: initial; border-bottom: 1pt solid rgb(162, 169, 177); padding: 0in; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">\n\n<p class=\"MsoNormal\" style=\"margin-bottom: 0.0001pt; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: none; padding: 0in;\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-fareast-language:FR-CA\"><o:p>&nbsp;</o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"center\" style=\"margin-bottom: 0.0001pt; text-align: center; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: none; padding: 0in;\"><b><i><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-fareast-language:\nFR-CA\">Les liturgies catholiques<o:p></o:p></span></i></b></p>\n\n</div>\n\n<div style=\"border-top: none; border-right: none; border-left: none; border-image: initial; border-bottom: 1pt dotted rgb(170, 170, 170); padding: 0in; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">\n\n<p class=\"MsoNormal\" style=\"margin-bottom: 0.0001pt; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: none; padding: 0in;\"><b><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-fareast-language:FR-CA\">Le rite<o:p></o:p></span></b></p>\n\n</div>\n\n<p class=\"MsoNormal\" style=\"margin: 0in 0in 0.0001pt 27pt; line-height: 16.8pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:black;mso-color-alt:windowtext;mso-fareast-language:\nFR-CA\">La notion de liturgie est parfois confondue avec celle de\n«&nbsp;rite&nbsp;», désignant les différentes manières de célébrer publiquement\nles mystères de la religion en tant qu\'elles se différencient selon des\ncritères ecclésiologiques, géographiques, culturels ou linguistiques, selon une\ntradition pluri-séculaire. De nos jours, on emploie équivalemment le terme\n«&nbsp;rite&nbsp;». </span><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\"><o:p></o:p></span></p>\n\n<p style=\"margin: 0in 0in 0.0001pt 27pt; line-height: 16.8pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-family:&quot;Arial&quot;,sans-serif;color:black;mso-color-alt:windowtext\">La\nliturgie essaie de répondre à la quête du<span class=\"apple-converted-space\">&nbsp;</span></span><span style=\"color:black;mso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/Beau\" title=\"Beau\"><span style=\"font-family:\n&quot;Arial&quot;,sans-serif\">beau</span></a></span><span class=\"apple-converted-space\"><span style=\"font-family:&quot;Arial&quot;,sans-serif;color:black;mso-color-alt:windowtext\">&nbsp;</span></span><span style=\"font-family:&quot;Arial&quot;,sans-serif;color:black;mso-color-alt:windowtext\">avec\nla<span class=\"apple-converted-space\">&nbsp;</span></span><span style=\"color:\nblack;mso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/Musique_sacr%C3%A9e\" title=\"Musique sacrée\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">musique</span></a></span><span style=\"font-family:&quot;Arial&quot;,sans-serif;color:black;mso-color-alt:windowtext\">,\nles objets, les<span class=\"apple-converted-space\">&nbsp;</span></span><span style=\"color:black;mso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/V%C3%AAtement_liturgique\" title=\"Vêtement liturgique\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">vêtements\nliturgiques</span></a></span><span style=\"font-family:&quot;Arial&quot;,sans-serif;\ncolor:black;mso-color-alt:windowtext\">, les<span class=\"apple-converted-space\">&nbsp;</span></span><span style=\"color:black;mso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/Geste\" title=\"Geste\"><span style=\"font-family:\n&quot;Arial&quot;,sans-serif\">gestes</span></a></span><span class=\"apple-converted-space\"><span style=\"font-family:&quot;Arial&quot;,sans-serif;color:black;mso-color-alt:windowtext\">&nbsp;</span></span><span style=\"font-family:&quot;Arial&quot;,sans-serif;color:black;mso-color-alt:windowtext\">et\nles<span class=\"apple-converted-space\">&nbsp;</span></span><span style=\"color:black;mso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/%C5%92uvre_d%27art\" title=\"Œuvre d\'art\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">œuvres d\'art</span></a></span><span style=\"font-family:&quot;Arial&quot;,sans-serif;color:black;mso-color-alt:windowtext\">.\nAvec ces signes, ces objets, ces créations artistiques, la liturgie n\'essaie\npas seulement à atteindre un<span class=\"apple-converted-space\">&nbsp;</span></span><span style=\"color:black;mso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/Esth%C3%A9tique\" title=\"Esthétique\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">esthétisme</span></a></span><span style=\"font-family:&quot;Arial&quot;,sans-serif;color:black;mso-color-alt:windowtext\"> particulier.\nDe même, elle ne considère pas la beauté d\'une musique ou d\'un vêtement comme\nune<span class=\"apple-converted-space\">&nbsp;</span></span><span style=\"color:black;mso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/D%C3%A9coration_(art)\" title=\"Décoration (art)\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">décoration</span></a></span><span class=\"apple-converted-space\"><span style=\"font-family:&quot;Arial&quot;,sans-serif;\ncolor:black;mso-color-alt:windowtext\">&nbsp;</span></span><span style=\"font-family:&quot;Arial&quot;,sans-serif;color:black;mso-color-alt:windowtext\">supplémentaire.\nMais par leur beauté, ces signes, ces objets, ces créations artistiques doivent\naider les<span class=\"apple-converted-space\">&nbsp;</span></span><span style=\"color:black;mso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/Croyant\" title=\"Croyant\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">croyants</span></a></span><span class=\"apple-converted-space\"><span style=\"font-family:&quot;Arial&quot;,sans-serif;\ncolor:black;mso-color-alt:windowtext\">&nbsp;</span></span><span style=\"font-family:&quot;Arial&quot;,sans-serif;color:black;mso-color-alt:windowtext\">à accéder\nà Dieu qui est Beauté suprême. La liturgie essaie de répondre à la quête du<span class=\"apple-converted-space\">&nbsp;</span></span><span style=\"color:black;\nmso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/Bont%C3%A9\" title=\"Bonté\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">bon</span></a></span><span class=\"apple-converted-space\"><span style=\"font-family:&quot;Arial&quot;,sans-serif;\ncolor:black;mso-color-alt:windowtext\">&nbsp;</span></span><span style=\"font-family:&quot;Arial&quot;,sans-serif;color:black;mso-color-alt:windowtext\">en\nfaisant rencontrer la<span class=\"apple-converted-space\">&nbsp;</span></span><span style=\"color:black;mso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/Personne\" title=\"Personne\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">personne</span></a></span><span class=\"apple-converted-space\"><span style=\"font-family:&quot;Arial&quot;,sans-serif;\ncolor:black;mso-color-alt:windowtext\">&nbsp;</span></span><span style=\"font-family:&quot;Arial&quot;,sans-serif;color:black;mso-color-alt:windowtext\">et\nle<span class=\"apple-converted-space\">&nbsp;</span></span><span style=\"color:\nblack;mso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/Myst%C3%A8re_(christianisme)\" title=\"Mystère (christianisme)\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">mystère\ndivin</span></a></span><span style=\"font-family:&quot;Arial&quot;,sans-serif;color:black;\nmso-color-alt:windowtext\">. En effet, c\'est seulement Dieu qui peut répondre\nvéritablement à la question<span class=\"apple-converted-space\">&nbsp;</span></span><span style=\"color:black;mso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/Morale\" title=\"Morale\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">morale</span></a></span><span style=\"font-family:&quot;Arial&quot;,sans-serif;color:black;mso-color-alt:windowtext\">&nbsp;:\n«&nbsp;Que dois-je faire&nbsp;?&nbsp;». La liturgie n\'est pas une évasion de la<span class=\"apple-converted-space\">&nbsp;</span></span><span style=\"color:black;\nmso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/R%C3%A9alit%C3%A9\" title=\"Réalité\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">réalité</span></a></span><span style=\"font-family:&quot;Arial&quot;,sans-serif;color:black;mso-color-alt:windowtext\">,\nmais un <i><u>rentrer</u></i> dans la\nréalité même, puisque les différentes conditions de la réalité poussent l\'homme\nà poser des actes. Ainsi, la rencontre avec le<span class=\"apple-converted-space\">&nbsp;</span></span><span style=\"color:black;\nmso-color-alt:windowtext\"><a href=\"https://fr.wikipedia.org/wiki/J%C3%A9sus-Christ\" title=\"Jésus-Christ\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">Christ</span></a></span><span class=\"apple-converted-space\"><span style=\"font-family:&quot;Arial&quot;,sans-serif;\ncolor:black;mso-color-alt:windowtext\">&nbsp;</span></span><span style=\"font-family:&quot;Arial&quot;,sans-serif;color:black;mso-color-alt:windowtext\">par\nla liturgie donne à l\'homme la possibilité d\'agir correctement dans la réalité.</span><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p>'),(2,29,'','<p class=\"MsoNormal\" align=\"center\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;text-align:center;line-height:normal\"><b><span style=\"font-size:12.0pt;\nfont-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\nmso-fareast-language:FR-CA\">Guide pour préparer son mariage</span></b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\"><o:p></o:p></span></p> \n            \n          ',' \n            \n          ',' \n            \n          ','<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Avant le\nMariage</span></b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\"><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Dès qu’un\nprojet de mariage se fait sentir, les futurs époux doivent consulter la\nparoisse de leur choix dans un délai d’au moins 6 mois à un an avant le\nmariage. C’est la première étape avant de réserver la salle de noces ou toute\nautre démarche. Nous devons conjuguer toutes nos demandes et vérifier la\ndisponibilité du ministre (Prêtre, diacre ou laïc engagé).<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Choix de l’église</span></b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\"><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Par\ntradition, il était fréquent que le mariage se célébrait dans l’église de la paroisse\nd’origine de la future mariée. Aujourd’hui, c’est souvent dans la communauté de\nrésidence qu’il se célèbre. Autrement, il faut vérifier dans la tierce paroisse\ndes disponibilités.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Préparation\nau mariage</span></b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\"><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Ici au\nQuébec, nous demandons que chaque couple s’inscrive à une session de\npréparation au mariage. Il existe différentes formes selon la disponibilité du\ncouple&nbsp;: session de fin de semaine intensive, soirées, couple\naccompagnateur, etc. Vous trouverez ici le calendrier des sessions de cette\nannée ainsi que d’autres informations&nbsp;: </span><a href=\"https://www.ecdq.org/sacrements/mariage/sessions-de-preparation-au-sacrement-du-mariage/\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">https://www.ecdq.org/sacrements/mariage/sessions-de-preparation-au-sacrement-du-mariage/</span></a><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\"><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Nécessité\nde la confirmation?<o:p></o:p></span></b></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA;\nmso-bidi-font-weight:bold\">Le mariage est un sacrement pour les inités à la foi\nchrétienne. Il est donc normal d’avoir terminé son initiation chrétienne pour\nse marier, y compris le sacrement de la confirmation. Vous trouverez des\néléments de réflexion intéressants ici&nbsp;: </span><a href=\"https://www.ecdq.org/wp-content/uploads/2016/05/Se-marier-en-eglise.pdf\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;mso-fareast-language:FR-CA;mso-bidi-font-weight:bold\">https://www.ecdq.org/wp-content/uploads/2016/05/Se-marier-en-eglise.pdf</span></a><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;mso-fareast-language:FR-CA;mso-bidi-font-weight:bold\"><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA;\nmso-bidi-font-weight:bold\">Soyez sans crainte! Des dispositions simples\npourront vous permettre de cheminer sans inquiétude ni retarder la célébration\nde votre mariage.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA;\nmso-bidi-font-weight:bold\">À ce moment, veuillez consulter la page de\nl’initiation chrétienne des adultes <span style=\"background:lime;mso-highlight:\nlime\">Bouton vers la page de l’initiation chrétienne des adultes.</span><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Les\nrencontres avec le ministre</span></b><span style=\"font-size:12.0pt;font-family:\n&quot;Times New Roman&quot;,serif;mso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:\nFR-CA\"><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Après\navoir communiqué votre projet à la paroisse, nous allons fixer la date de votre\nmariage et vous demander de vous inscrire à une session de préparation au\nmariage. Celui qui vous accompagnera dans votre démarche vous proposera\nquelques rendez-vous.<o:p></o:p></span></p>\n\n<ol start=\"1\" type=\"1\">\n <li class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\n     line-height:normal;mso-list:l0 level1 lfo1;tab-stops:list .5in\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:\n     &quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Par téléphone ou en\n     personne, nous prendrons les informations de base.<o:p></o:p></span></li>\n <li class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\n     line-height:normal;mso-list:l0 level1 lfo1;tab-stops:list .5in\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:\n     &quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Une rencontre se fera pour\n     discuter de votre projet et pour faire connaissance. Nous ferons aussi le\n     tour de votre parcours religieux, de votre vie de foi (votre initiation chrétienne,\n     baptême, réconciliation, eucharistie, confirmation). Nous proposerons de\n     faire le choix entre un mariage sans eucharistie ou avec eucharistie. Nous\n     entamerons l’enquête prénuptiale (il s’agit ici d’une quête d’informations\n     qui se déroule dans un climat de confiance et de connaissance mutuelle).<o:p></o:p></span></li>\n <li class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\n     line-height:normal;mso-list:l0 level1 lfo1;tab-stops:list .5in\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:\n     &quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">À la deuxième rencontre ou\n     une autre subséquente, nous porterons un regard sur votre\n     célébration&nbsp;: le déroulement, le choix des textes bibliques, etc.\n     Nous fixerons la date de la pratique (si nécessaire). Nous vous donnerons\n     les instructions pour le jour «J».<o:p></o:p></span></li>\n <li class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\n     line-height:normal;mso-list:l0 level1 lfo1;tab-stops:list .5in\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:\n     &quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Le grand jour.<o:p></o:p></span></li>\n</ol>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nmargin-left:.25in;line-height:normal\"><b><span style=\"font-size:12.0pt;\nfont-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\nmso-fareast-language:FR-CA\">Mariage avec ou sans Eucharistie</span></b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\"><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nmargin-left:.25in;line-height:normal\"><span style=\"font-size:12.0pt;font-family:\n&quot;Times New Roman&quot;,serif;mso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:\nFR-CA\">La seule différence est que dans le mariage sans eucharistie, il n’y a\npas la partie de la liturgie eucharistique. Ce n’est pas moins un mariage que\nl’autre forme. Compte-tenu de la baisse significative de la fréquentation de la\nmesse, et donc, du sens de l’eucharistie, nous estimons plus respectueux pour\nle couple, vos amis et pour l’Église de ne pas imposer cela dans le cadre de la\ncélébration du mariage. Une bonne discussion avec le ministre qui vous\naccompagne vous aidera à prendre la bonne décision.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nmargin-left:.25in;line-height:normal\"><b><span style=\"font-size:12.0pt;\nfont-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\nmso-fareast-language:FR-CA\">Quelques consignes</span></b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\"><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nmargin-left:.5in;line-height:normal\"><span style=\"font-size:12.0pt;font-family:\n&quot;Times New Roman&quot;,serif;mso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:\nFR-CA\">-&nbsp; Obtenir tous les documents nécessaires&nbsp;: <o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nmargin-left:70.8pt;line-height:normal\"><span style=\"font-size:12.0pt;\nfont-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\nmso-fareast-language:FR-CA\">- le certificat de baptême, celui de la paroisse\nd’origine doit être récent de 6 mois; <o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nmargin-left:70.8pt;line-height:normal\"><span style=\"font-size:12.0pt;\nfont-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\nmso-fareast-language:FR-CA\">- le certificat de naissance de l’état civil; <o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nmargin-left:70.8pt;line-height:normal\"><span style=\"font-size:12.0pt;\nfont-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\nmso-fareast-language:FR-CA\">- tous autres documents (divorce, déclaration de\nnullité, etc.).<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nmargin-left:.5in;line-height:normal\"><span style=\"font-size:12.0pt;font-family:\n&quot;Times New Roman&quot;,serif;mso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:\nFR-CA\">-&nbsp; Une tenue vestimentaire appropriée dans l’église qui est,\nrappelons-le, un lieu sacré, est importante pour vous et vos invités.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nmargin-left:.5in;line-height:normal\"><span style=\"font-size:12.0pt;font-family:\n&quot;Times New Roman&quot;,serif;mso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:\nFR-CA\">-&nbsp; La participation active de l’assemblée est requise ainsi que le\nrespect pour le lieu.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nmargin-left:.5in;line-height:normal\"><span style=\"font-size:12.0pt;font-family:\n&quot;Times New Roman&quot;,serif;mso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:\nFR-CA\">-&nbsp; Une attention spéciale sera portée, à l’église, <b>pas de gomme,\nde nourriture, de breuvage</b>.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Les\nintervenants lors de notre mariage</span></b><span style=\"font-size:12.0pt;\nfont-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\nmso-fareast-language:FR-CA\"><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Quel rôle\npeuvent jouer les différents intervenants à notre mariage?<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Les\nparents&nbsp;:</span></b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\"> Souvent,\nl’un deux est choisi comme témoin, ce qui n’est pas obligatoire. Des places\nleur sont réservées, s’ils sont divorcés ou séparés, vous devrez en discuter\navec votre ministre sur la place qu’ils occuperont dans la célébration.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Les\nenfants</span></b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\"> (s’il y\na lieu)&nbsp;: S’ils ont moins de 5 ans il est souhaitable qu’une personne\nfamilière puisse les prendre en charge. Pour les plus grands, ils peuvent être\nimpliqués dans la célébration soit en faisant la lecture des prières\nuniverselles, soit en apportant les alliances à l’autel et/ou soit pour le\nservice à l’autel. S’ils sont âgés de plus de 16 ans, ils peuvent être témoins\nà la signature des registres.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Les\ninvités&nbsp;</span></b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">: Ils\nparticipent activement à la célébration dans le respect, l’écoute, le\nrecueillement et la prière.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Le\ncortège</span></b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\"> (filles\net garçons d’honneur, page et bouquetière)&nbsp;: Ces personnes peuvent\nintervenir et contribuer à donner un sens à la célébration. «Entrer en cortège\ndans l’église, c’est marcher à la rencontre de Dieu qui vous invite». On veillera\nà ce que la marche se déroule paisiblement, accompagnée d’une musique adaptée\nau lieu sacré.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Les\ntémoins officiels&nbsp;:</span></b><span style=\"font-size:12.0pt;font-family:\n&quot;Times New Roman&quot;,serif;mso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:\nFR-CA\"> Le choix des témoins est abordé lors de l’enquête prénuptiale.\nRappelons que deux témoins sont nécessaires&nbsp;: «hommes ou femmes, catholiques\nou non, majeurs ou mineurs (16 ans minimum)».<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Les\nlecteurs&nbsp;:</span></b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\"> Bien que\ndes enfants puissent faire des lectures, il faut s’assurer de leurs capacités à\nle faire publiquement et au micro. L’Écriture occupe une place importante dans\nla cérémonie.&nbsp; Si la famille ne peut trouver de lecteur, la paroisse,\nprévenue à l’avance s’en occupera.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Les\nservants de messe</span></b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\"> (s’il y\na lieu)&nbsp;: S’il y a eucharistie, deux servants de messe sont requis. Des\njeunes ou un couple d’amis peuvent effectuer cette tâche s’ils ont l’expérience\net/ou se sentent à l’aise de l’accomplir. Si non, la paroisse s’en occupe.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Les\npréposés à l’accueil&nbsp;:</span></b><span style=\"font-size:12.0pt;font-family:\n&quot;Times New Roman&quot;,serif;mso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:\nFR-CA\"> Cette tâche est normalement confiée aux garçons d’honneur. Ils\ncontribuent à ce que tous prennent place avant le début de la célébration et\ns’assurent de bien diriger les familles.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Les\nmusiciens, choristes et techniciens&nbsp;:</span></b><span style=\"font-size:\n12.0pt;font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\nmso-fareast-language:FR-CA\"> Sujet très délicat, il est souvent source de\nmésententes. Une prémisse importante à considérer&nbsp;: nous sommes dans une\ncélébration liturgique&nbsp;et nous devons rappeler le <b><i>caractère sacré</i></b>\ndu mariage chrétien. Qui dit «liturgie» dit prière à Dieu.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Le choix\nmusical doit être conforme à la <b><i>musique sacrée et liturgique</i></b>. Le\nprogramme de chants doit être approuvé par le ministre. Le mariage n’est pas un\nspectacle alors, il faut y aller avec sobriété. Pour les chants profanes (ou\npopulaires), nous vous suggérons de les faire jouer à la noce.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">La\nparoisse fournit une liste de musiciens et de chanteurs/chanteuses qui ont\nl’expérience des liturgies et sauront vous faire de belles suggestions de\nchants appropriés.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Les\nspécialistes de l’image</span></b><span style=\"font-size:12.0pt;font-family:\n&quot;Times New Roman&quot;,serif;mso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:\nFR-CA\"> (photo et vidéo)&nbsp;: Il est important de choisir un photographe\nofficiel qui sera le <b><i>seul à se déplacer pendant la cérémonie</i></b>. Il\nse doit d’être discret dans ses déplacements, afin de ne pas perturber le\nclimat de prière. L’accès au sanctuaire (le chœur) lui est interdit.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Pour la\nvidéo, s’entendre avec le ministre lors de la pratique pour le lieu où il doit\ns’installer.<o:p></o:p></span></p>\n\n<div class=\"MsoNormal\" align=\"center\" style=\"margin-bottom:0in;margin-bottom:.0001pt;\ntext-align:center;line-height:normal\"><span style=\"font-size:12.0pt;font-family:\n&quot;Times New Roman&quot;,serif;mso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:\nFR-CA\">\n\n<hr size=\"2\" width=\"100%\" align=\"center\">\n\n</span></div>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Pour\ntoutes autres informations, veuillez remplir ce formulaire <span style=\"background:lime;mso-highlight:lime\">Bouton formulaire en annexe</span><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Vous\npouvez aussi communiquer avec le siège social de votre paroisse <span style=\"background:lime;mso-highlight:lime\">Bouton avec lien pour la page\nContactez-nous</span><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Finalement,\nvous pouvez aussi communiquer avec l’abbé Michel Paré, au 418-228-2084 poste\n226<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p> \n            \n          '),(3,25,'','<p class=\"MsoNormal\" align=\"center\" style=\"text-align:center\"><b><span style=\"font-size:14.0pt;mso-bidi-font-size:11.0pt;line-height:\n115%\">Le baptême<o:p></o:p></span></b></p> \n            \n          ',' \n            \n          ',' \n            \n          ','<p class=\"MsoNormal\"><span style=\"font-size:12.0pt;mso-bidi-font-size:11.0pt;\nline-height:115%\">Le baptême est le premier des sacrements. &nbsp;Il est la porte d’entrée qui ouvre à tous les\nautres.&nbsp; Le baptême nous introduit dans\ndes réalités nouvelles&nbsp;: <o:p></o:p></span></p>\n\n<p class=\"MsoListParagraphCxSpFirst\" style=\"margin-left:53.4pt;mso-add-space:\nauto;text-indent:-.25in;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:115%;mso-bidi-font-family:\n&quot;Times New Roman&quot;;mso-bidi-theme-font:minor-latin\">1.<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span style=\"font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:115%\">Une réalité\nd’amour qui s’exprime de la manière suivante&nbsp;: «&nbsp;Jésus t’aime, Il t’a\nsauvé, Il est vivant&nbsp;»<o:p></o:p></span></p>\n\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-left:53.4pt;mso-add-space:\nauto;text-indent:-.25in;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:115%;mso-bidi-font-family:\n&quot;Times New Roman&quot;;mso-bidi-theme-font:minor-latin\">2.<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span style=\"font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:115%\">une naissance\nà de nouveaux liens de fraternité comme membre de l’Église,<o:p></o:p></span></p>\n\n<p class=\"MsoListParagraphCxSpLast\" style=\"margin-left:53.4pt;mso-add-space:auto;\ntext-indent:-.25in;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:115%;mso-bidi-font-family:\n&quot;Times New Roman&quot;;mso-bidi-theme-font:minor-latin\">3.<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span style=\"font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:115%\">une participation\nà la résurrection du Christ.&nbsp; <o:p></o:p></span></p>\n\n<p class=\"MsoNormal\"><span style=\"font-size:12.0pt;mso-bidi-font-size:11.0pt;\nline-height:115%\">Il n’y a pas d’âge particulier pour être baptisé.&nbsp; L’Église baptise des nouveau-nés, des enfants\nd’âge scolaire, des jeunes et des adultes.&nbsp;\n<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\"><span style=\"font-size:12.0pt;mso-bidi-font-size:11.0pt;\nline-height:115%\">-<u>Pour les nouveau-nés</u>, la démarche est la suivante&nbsp;:\n<o:p></o:p></span></p>\n\n<p class=\"MsoListParagraphCxSpFirst\" style=\"margin-left:14.2pt;mso-add-space:\nauto\">Elle comporte deux rencontres.&nbsp;\nDans chacune de celles-ci, étant donné que les deux parents sont invités\nà s’impliquer activement, vous êtes priés à venir sans les enfants, autant que\npossible.<o:p></o:p></p>\n\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-left:14.2pt;mso-add-space:\nauto\"><o:p>&nbsp;</o:p></p>\n\n<table class=\"MsoTableGrid\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" style=\"margin-left: 14.2pt; border: none;\">\n <tbody><tr>\n  <td width=\"626\" valign=\"top\" style=\"width:469.7pt;border:solid windowtext 1.0pt;\n  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt\">\n  <p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-top:0in;margin-right:0in;\n  margin-bottom:0in;margin-left:28.35pt;margin-bottom:.0001pt;mso-add-space:\n  auto;line-height:normal\"><o:p>&nbsp;</o:p></p>\n  <p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-top:0in;margin-right:0in;\n  margin-bottom:0in;margin-left:28.35pt;margin-bottom:.0001pt;mso-add-space:\n  auto;line-height:normal\">La première est une rencontre de groupe dans\n  laquelle les parents sont amenés à vivre un temps de relecture de leur\n  histoire de foi.&nbsp; Au cours de cette\n  première rencontre, il y a des partages en couple et des partages en groupe. <o:p></o:p></p>\n  <p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-top:0in;margin-right:0in;\n  margin-bottom:0in;margin-left:28.35pt;margin-bottom:.0001pt;mso-add-space:\n  auto;line-height:normal\"><o:p>&nbsp;</o:p></p>\n  <p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-top:0in;margin-right:0in;\n  margin-bottom:0in;margin-left:28.35pt;margin-bottom:.0001pt;mso-add-space:\n  auto;line-height:normal\"><span style=\"background:lime;mso-highlight:lime\">Noms\n  des documents pour télécharger les «&nbsp;Huit documents premières\n  rencontre&nbsp;»:<o:p></o:p></span></p>\n  <p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-top:0in;margin-right:0in;\n  margin-bottom:0in;margin-left:46.35pt;margin-bottom:.0001pt;mso-add-space:\n  auto;text-indent:-.25in;line-height:normal;mso-list:l1 level1 lfo2\"><!--[if !supportLists]--><span style=\"mso-ascii-font-family:&quot;Times New Roman&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;;\n  mso-hansi-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:&quot;Times New Roman&quot;;\n  background:lime;mso-highlight:lime\">-<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n  </span></span><!--[endif]--><span style=\"background:lime;mso-highlight:\n  lime\">Feuillet pour choix de référence<o:p></o:p></span></p>\n  <p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-top:0in;margin-right:0in;\n  margin-bottom:0in;margin-left:46.35pt;margin-bottom:.0001pt;mso-add-space:\n  auto;text-indent:-.25in;line-height:normal;mso-list:l1 level1 lfo2\"><!--[if !supportLists]--><span style=\"mso-ascii-font-family:&quot;Times New Roman&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;;\n  mso-hansi-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:&quot;Times New Roman&quot;;\n  background:lime;mso-highlight:lime\">-<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n  </span></span><!--[endif]--><span style=\"background:lime;mso-highlight:\n  lime\">…<o:p></o:p></span></p>\n  <p class=\"MsoListParagraphCxSpLast\" style=\"margin-top:0in;margin-right:0in;\n  margin-bottom:0in;margin-left:28.35pt;margin-bottom:.0001pt;mso-add-space:\n  auto;line-height:normal\"><o:p>&nbsp;</o:p></p>\n  <p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;text-indent:\n  28.35pt;line-height:normal\">Pour découvrir les réflexions des évêques du\n  Québec sur le parrainage&nbsp;:<o:p></o:p></p>\n  <p class=\"MsoNormal\" style=\"margin-top:0in;margin-right:0in;margin-bottom:0in;\n  margin-left:28.35pt;margin-bottom:.0001pt;line-height:normal\"><a href=\"https://evequescatholiques.quebec/fr/news-item/note-theologique-et-pastorale-etre-parrain-ou-marraine-accompagner-dans-la-foi-chretienne-\">https://evequescatholiques.quebec/fr/news-item/note-theologique-et-pastorale-etre-parrain-ou-marraine-accompagner-dans-la-foi-chretienne-<o:p></o:p></a></p>\n  <p class=\"MsoListParagraphCxSpFirst\" style=\"margin-top:0in;margin-right:0in;\n  margin-bottom:0in;margin-left:28.35pt;margin-bottom:.0001pt;mso-add-space:\n  auto;line-height:normal\"><o:p>&nbsp;</o:p></p>\n  <p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-top:0in;margin-right:0in;\n  margin-bottom:0in;margin-left:28.35pt;margin-bottom:.0001pt;mso-add-space:\n  auto;line-height:normal\">Suggestions pour l’éveil à la foi&nbsp;:<o:p></o:p></p>\n  <p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-top:0in;margin-right:0in;\n  margin-bottom:0in;margin-left:28.35pt;margin-bottom:.0001pt;mso-add-space:\n  auto;line-height:normal\">&nbsp;&nbsp;\n  https://www.prierenfamille.com/<o:p></o:p></p>\n  <p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-top:0in;margin-right:0in;\n  margin-bottom:0in;margin-left:28.35pt;margin-bottom:.0001pt;mso-add-space:\n  auto;line-height:normal\">&nbsp;&nbsp;\n  https://officedecatechese.qc.ca/productions/familles/rythme.html<o:p></o:p></p>\n  <p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-top:0in;margin-right:0in;\n  margin-bottom:0in;margin-left:28.35pt;margin-bottom:.0001pt;mso-add-space:\n  auto;line-height:normal\">&nbsp; https://www.ecdq.org/pastorale/famille/<o:p></o:p></p>\n  <p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-top:0in;margin-right:0in;\n  margin-bottom:0in;margin-left:28.35pt;margin-bottom:.0001pt;mso-add-space:\n  auto;line-height:normal\">&nbsp; https://www.ecdq.org/pastorale/famille/coffre-a-outils/<o:p></o:p></p>\n  <p class=\"MsoListParagraphCxSpLast\" style=\"margin:0in;margin-bottom:.0001pt;\n  mso-add-space:auto;line-height:normal\"><o:p>&nbsp;</o:p></p>\n  </td>\n </tr>\n</tbody></table>\n\n<p class=\"MsoListParagraphCxSpFirst\" style=\"margin-left:14.2pt;mso-add-space:\nauto\"><o:p>&nbsp;</o:p></p>\n\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-left:14.2pt;mso-add-space:\nauto\"><o:p>&nbsp;</o:p></p>\n\n<table class=\"MsoTableGrid\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" style=\"margin-left: 14.2pt; border: none;\">\n <tbody><tr>\n  <td width=\"626\" valign=\"top\" style=\"width:469.7pt;border:solid windowtext 1.0pt;\n  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt\">\n  <p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-top:0in;margin-right:0in;\n  margin-bottom:0in;margin-left:28.35pt;margin-bottom:.0001pt;mso-add-space:\n  auto;line-height:normal\"><o:p>&nbsp;</o:p></p>\n  <p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-top:0in;margin-right:0in;\n  margin-bottom:0in;margin-left:28.35pt;margin-bottom:.0001pt;mso-add-space:\n  auto;line-height:normal\">Une deuxième rencontre avec le ministre du\n  baptême.&nbsp; Cette dernière consiste en\n  une catéchèse sur le baptême et une préparation immédiate à la célébration.<o:p></o:p></p>\n  <p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-top:0in;margin-right:0in;\n  margin-bottom:0in;margin-left:28.35pt;margin-bottom:.0001pt;mso-add-space:\n  auto;line-height:normal\"><o:p>&nbsp;</o:p></p>\n  <p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-top:0in;margin-right:0in;\n  margin-bottom:0in;margin-left:28.35pt;margin-bottom:.0001pt;mso-add-space:\n  auto;line-height:normal\"><span style=\"background:lime;mso-highlight:lime\">Noms\n  du document pour télécharger ce document&nbsp;: <o:p></o:p></span></p>\n  <p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-top:0in;margin-right:0in;\n  margin-bottom:0in;margin-left:46.35pt;margin-bottom:.0001pt;mso-add-space:\n  auto;text-indent:-.25in;line-height:normal;mso-list:l1 level1 lfo2\"><!--[if !supportLists]--><span style=\"mso-ascii-font-family:&quot;Times New Roman&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;;\n  mso-hansi-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:&quot;Times New Roman&quot;;\n  background:lime;mso-highlight:lime\">-<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n  </span></span><!--[endif]--><span style=\"background:lime;mso-highlight:\n  lime\">Feuillet pour choix de textes<o:p></o:p></span></p>\n  <p class=\"MsoListParagraphCxSpLast\" style=\"margin:0in;margin-bottom:.0001pt;\n  mso-add-space:auto;line-height:normal\"><o:p>&nbsp;</o:p></p>\n  </td>\n </tr>\n</tbody></table>\n\n<p class=\"MsoListParagraphCxSpFirst\" style=\"margin-left:14.2pt;mso-add-space:\nauto\"><o:p>&nbsp;</o:p></p>\n\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-left:14.2pt;mso-add-space:\nauto\"><o:p>&nbsp;</o:p></p>\n\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-left:14.2pt;mso-add-space:\nauto\">Pour s’inscrire&nbsp;: <span style=\"background:lime;mso-highlight:lime\">Bouton\nvers le formulaire d’inscription (annexe 1)</span><o:p></o:p></p>\n\n<p class=\"MsoListParagraphCxSpLast\" style=\"margin-left:14.2pt;mso-add-space:auto\"><o:p>&nbsp;</o:p></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt\">Une fois\nl’inscription confirmée, communiquez avec le secrétariat [coordonnées] pour\nchoisir la date, l’heure et le lieu de la première rencontre. <span style=\"background:lime;mso-highlight:lime\">Lien vers la page «&nbsp;Contactez-nous&nbsp;»</span><o:p></o:p></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt\"><o:p>&nbsp;</o:p></p>\n\n<p class=\"MsoNormal\">Pour d’autres informations&nbsp;: <span style=\"background:\nlime;mso-highlight:lime\">bouton contactez-nous</span><o:p></o:p></p>\n\n<p class=\"MsoNormal\">Pour certaines questions d’ordre général, on peut consulter\ncette foire aux questions&nbsp;:<o:p></o:p></p>\n\n<p class=\"MsoNormal\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; https://www.ecdq.org/ressources/foire-aux-questions-faq/<o:p></o:p></p>\n\n<p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p>\n\n<p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p>\n\n<p class=\"MsoNormal\"><span style=\"font-size:12.0pt;mso-bidi-font-size:11.0pt;\nline-height:115%\">-<u>Pour les enfants en âge de scolarité</u>, <span style=\"background:lime;mso-highlight:lime\">bouton vers un formulaire (annexe 2)</span><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\nnormal\"><span style=\"font-size:12.0pt;mso-bidi-font-size:11.0pt\">Pour d’autres\ninformations, contactez Denis Vallée<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\nnormal\"><span style=\"font-size:12.0pt;mso-bidi-font-size:11.0pt\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Facebook&nbsp;: &nbsp;&nbsp;&nbsp;&nbsp; Denis Vallée Pasto<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;text-indent:\n35.4pt;line-height:normal\"><span style=\"font-size:12.0pt;mso-bidi-font-size:\n11.0pt\">Courriel&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><a href=\"mailto:dvallee@dd.org\"><span style=\"font-size:12.0pt;mso-bidi-font-size:\n11.0pt\">dvallee@dd.org</span></a><span style=\"font-size:12.0pt;mso-bidi-font-size:\n11.0pt\"><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\nnormal\"><span style=\"font-size:12.0pt;mso-bidi-font-size:11.0pt\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Téléphone&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp; 418-228-2558 poste 31<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\nnormal\"><span style=\"font-size:12.0pt;mso-bidi-font-size:11.0pt\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></span></p>\n\n<p class=\"MsoNormal\"><span style=\"font-size:12.0pt;mso-bidi-font-size:11.0pt;\nline-height:115%\"><o:p>&nbsp;</o:p></span></p>\n\n<p class=\"MsoNormal\"><span style=\"font-size:12.0pt;mso-bidi-font-size:11.0pt;\nline-height:115%\"><o:p>&nbsp;</o:p></span></p>\n\n<p class=\"MsoNormal\"><span style=\"font-size:12.0pt;mso-bidi-font-size:11.0pt;\nline-height:115%\">-Pour les adultes et les jeunes de 16 ans et plus, la\ndémarche est celle du catéchuménat.&nbsp; <span style=\"background:lime;mso-highlight:lime\">Bouton vers la fenêtre de\nl’initiation chrétienne des adultes</span><o:p></o:p></span></p> \n            \n          '),(4,26,'',' \n            \n          ',' \n            \n          ',' \n            \n          ','<p class=\"MsoNormal\"><b><u><span style=\"font-size:12.0pt;line-height:115%;font-family:&quot;Arial&quot;,sans-serif\">Le\nPremier Pardon / la Première Réconciliation<o:p></o:p></span></u></b></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\nnormal\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif\">Le\nsacrement du pardon ou de la réconciliation est destiné à rétablir l’amitié\navec Dieu qui a été brisée ou blessée par le péché. Il est possible de recevoir\net de célébrer le sacrement du pardon en rencontrant un prêtre à l’église ou\nailleurs.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\nnormal\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif\"><o:p>&nbsp;</o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\nnormal\"><b><i><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif\">Conditions<o:p></o:p></span></i></b></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\nnormal\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif\">Trois\nconditions sont requises pour recevoir le pardon du Seigneur par un prêtre:<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\nnormal\"><i><span style=\"font-size:12.0pt;\nfont-family:&quot;Arial&quot;,sans-serif\">la contrition</span></i><span style=\"font-size:\n12.0pt;font-family:&quot;Arial&quot;,sans-serif\"> : avoir le regret de ses fautes et la\nvolonté de s’appliquer à ne plus les commettre;<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\nnormal\"><i><span style=\"font-size:12.0pt;\nfont-family:&quot;Arial&quot;,sans-serif\">la satisfaction</span></i><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif\"> : s’engager à réparer,\nautant que possible, le tort causé par le péché;<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\nnormal\"><i><span style=\"font-size:12.0pt;\nfont-family:&quot;Arial&quot;,sans-serif\">la confession</span></i><span style=\"font-size:\n12.0pt;font-family:&quot;Arial&quot;,sans-serif\"> : avouer ses fautes à un prêtre.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\nnormal\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif\"><o:p>&nbsp;</o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\nnormal\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif\">Pour\nvivre votre premier des Pardons/Réconciliation, un temps d’initiation est\nnécessaire&nbsp;:<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\nnormal\"><i><span style=\"font-size:12.0pt;\nfont-family:&quot;Arial&quot;,sans-serif\"><o:p>&nbsp;</o:p></span></i></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\nnormal\"><i><span style=\"font-size:12.0pt;\nfont-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\ncolor:#222222;background:yellow;mso-highlight:yellow;mso-fareast-language:FR-CA\">L’initiation,\nc’est ce temps&nbsp;pendant lequel une personne découvre progressivement la foi\nen Jésus Christ, c’est la&nbsp;période qui permet que&nbsp;cette foi devienne\nprogressivement celle de la personne qui est en train d’être initiée. Il s’agit&nbsp;donc\nd’un processus de lente maturation qui conduit une personne à pouvoir dire : «\nJésus Christ et son Évangile, sa mort et sa résurrection donnent désormais sens\nà ma vie, c’est pourquoi je souhaite être intégrée au groupe de ses disciples,\nl’Église.­­ »</span></i><i><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:#222222;mso-fareast-language:FR-CA\"><o:p></o:p></span></i></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\nnormal\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif\"><o:p>&nbsp;</o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\nnormal\"><u><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif\">Informations<o:p></o:p></span></u></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\nnormal\"><u><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif\"><o:p><span style=\"text-decoration-line: none;\">&nbsp;</span></o:p></span></u></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\nnormal\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif\">Pour\nrecevoir et célébrer le sacrement du pardon, veuillez communiquer avec nous.&nbsp; </span><b><i><span style=\"font-family:&quot;Arial&quot;,sans-serif;\ncolor:#222222;background:lime;mso-highlight:lime\">Bouton vers le formulaire</span></i></b><b><i><span style=\"font-family:&quot;Arial&quot;,sans-serif;color:#222222\"><o:p></o:p></span></i></b></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\nnormal\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif\"><o:p>&nbsp;</o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\nnormal\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif\"><o:p>&nbsp;</o:p></span></p>\n\n<p class=\"MsoNormal\"><span style=\"font-size:12.0pt;mso-bidi-font-size:11.0pt;\nline-height:115%\">-Pour les adultes et les jeunes de 16 ans et plus, veuillez\nconsulter la page de l’initiation chrétienne des adultes.&nbsp; <span style=\"background:lime;mso-highlight:\nlime\">Bouton vers la fenêtre de l’initiation chrétienne des adultes</span></span><o:p></o:p></p> \n            \n          '),(5,27,'',' \n            \n          ',' \n            \n          ',' \n            \n          ','<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\nnormal\"><b><u><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:#056181;mso-font-kerning:18.0pt;\nmso-fareast-language:FR-CA\">La première communion</span></u></b><b><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:#056181;mso-font-kerning:18.0pt;mso-fareast-language:\nFR-CA\"> / L’eucharistie – sacrement d’initiation<o:p></o:p></span></b></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\nnormal;mso-outline-level:1\"><b><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:#056181;mso-font-kerning:18.0pt;\nmso-fareast-language:FR-CA\"><o:p>&nbsp;</o:p></span></b></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\nnormal\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:#222222;mso-fareast-language:\nFR-CA\">Quand on réfléchit à ce qu’est l’eucharistie, on réalise que ce\nsacrement est le sommet de la vie chrétienne&nbsp;: non pas un geste qui arrive\nune seule fois, comme le baptême ou la confirmation, mais l’invitation faite\npar Jésus Christ à se retrouver, ensemble, régulièrement, autour de la\n«&nbsp;table familiale&nbsp;».<o:p></o:p></span></p>\n\n<p style=\"margin: 0in 0in 0.0001pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-family:&quot;Arial&quot;,sans-serif;color:#222222\">La «&nbsp;première\ncommunion&nbsp;», qu’on est habitués à considérer surtout comme une belle fête\nd’enfants, trouve son sens profond quand on la considère comme la première DES\ncommunions.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\nnormal\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:#222222;mso-fareast-language:\nFR-CA\"><o:p>&nbsp;</o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\nnormal\"><i><span style=\"font-size:12.0pt;\nfont-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\nmso-fareast-language:FR-CA\">Conditions&nbsp;:<o:p></o:p></span></i></p>\n\n<p class=\"MsoListParagraphCxSpFirst\" style=\"margin-bottom:0in;margin-bottom:.0001pt;\nmso-add-space:auto;text-indent:-.25in;line-height:normal;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\nArial;mso-fareast-language:FR-CA\">-<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><i><span style=\"font-size:12.0pt;font-family:\n&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:\nFR-CA\">Avoir vécu son premier des pardons, sa première des réconciliations<o:p></o:p></span></i></p>\n\n<p class=\"MsoListParagraphCxSpLast\" style=\"margin-bottom:0in;margin-bottom:.0001pt;\nmso-add-space:auto;text-indent:-.25in;line-height:normal;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\nArial;mso-fareast-language:FR-CA\">-<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><i><span style=\"font-size:12.0pt;font-family:\n&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:\nFR-CA\">Avoir vécu un temps d’initiation<o:p></o:p></span></i></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\nnormal\"><i><span style=\"font-size:12.0pt;\nfont-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\ncolor:#222222;background:yellow;mso-highlight:yellow;mso-fareast-language:FR-CA\"><o:p>&nbsp;</o:p></span></i></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\nnormal\"><i><span style=\"font-size:12.0pt;\nfont-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\ncolor:#222222;background:yellow;mso-highlight:yellow;mso-fareast-language:FR-CA\">L’initiation,\nc’est ce temps&nbsp;pendant lequel une personne découvre progressivement la foi\nen Jésus Christ, c’est la&nbsp;période qui permet que&nbsp;cette foi devienne\nprogressivement celle de la personne qui est en train d’être initiée. Il s’agit&nbsp;donc\nd’un processus de lente maturation qui conduit une personne à pouvoir dire : «\nJésus Christ et son Évangile, sa mort et sa résurrection donnent désormais sens\nà ma vie, c’est pourquoi je souhaite être intégrée au groupe de ses disciples,\nl’Église.­­ »</span></i><i><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:#222222;mso-fareast-language:FR-CA\"><o:p></o:p></span></i></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\nnormal\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif\"><o:p>&nbsp;</o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\nnormal\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif\">Pour\ncélébrer la première communion, veuillez communiquer avec nous.&nbsp; </span><b><i><span style=\"font-family:&quot;Arial&quot;,sans-serif;\ncolor:#222222;background:lime;mso-highlight:lime\">Bouton vers le formulaire</span></i></b><b><i><span style=\"font-family:&quot;Arial&quot;,sans-serif;color:#222222\"><o:p></o:p></span></i></b></p>\n\n<p style=\"margin: 0in 0in 0.0001pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b><i><span style=\"font-family:&quot;Arial&quot;,sans-serif;color:#222222\"><o:p>&nbsp;</o:p></span></i></b></p>\n\n<p style=\"margin: 0in 0in 0.0001pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b><i><span style=\"font-family:&quot;Arial&quot;,sans-serif;color:#222222\"><o:p>&nbsp;</o:p></span></i></b></p>\n\n<p style=\"margin: 0in 0in 0.0001pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b><i><span style=\"font-family:&quot;Arial&quot;,sans-serif;color:#222222\"><o:p>&nbsp;</o:p></span></i></b></p>\n\n<p class=\"MsoNormal\"><span style=\"font-size:12.0pt;mso-bidi-font-size:11.0pt;\nline-height:115%\">Pour les adultes et les jeunes de 16 ans et plus, veuillez\nconsulter la page de l’initiation chrétienne des adultes.&nbsp; <span style=\"background:lime;mso-highlight:\nlime\">Bouton vers la fenêtre de l’initiation chrétienne des adultes</span></span><o:p></o:p></p> \n            \n          '),(6,28,'',' \n            \n          ',' \n            \n          ',' \n            \n          ','<h1 style=\"margin:0in;margin-bottom:.0001pt\"><span style=\"font-size:12.0pt;\nfont-family:&quot;Arial&quot;,sans-serif;color:#056181\">LA CONFIRMATION<o:p></o:p></span></h1>\n\n<p style=\"margin: 0in 0in 0.0001pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-family:&quot;Arial&quot;,sans-serif;color:#222222\"><o:p>&nbsp;</o:p></span></p>\n\n<p style=\"margin: 0in 0in 0.0001pt; line-height: 115%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-family:&quot;Arial&quot;,sans-serif;color:#222222\">La Confirmation est comme\nle Baptême, un sacrement unique, qui se vit une seule fois.<o:p></o:p></span></p>\n\n<p style=\"margin: 0in 0in 0.0001pt; line-height: 115%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-family:&quot;Arial&quot;,sans-serif;color:#222222\">Pour un petit enfant, le\nbaptême est en quelque sorte une célébration incomplète. Il y manque un geste\nimportant qui doit être posé par l’évêque et qui marque la fin du temps\nd’initiation. C’est la confirmation.<o:p></o:p></span></p>\n\n<p style=\"margin: 0in 0in 0.0001pt; line-height: 115%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-family:&quot;Arial&quot;,sans-serif;color:#222222\"><o:p>&nbsp;</o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-top:0in;margin-right:0in;margin-bottom:0in;\nmargin-left:.25in;margin-bottom:.0001pt;mso-layout-grid-align:none;text-autospace:\nnone\"><span style=\"font-size:12.0pt;line-height:115%;font-family:&quot;Arial&quot;,sans-serif;\ncolor:#222222\">À la Confirmation, l’évêque vient confirmer&nbsp;que tu es\nmaintenant capable de proclamer ta foi&nbsp;: par tes gestes, tes paroles et ta\nvie. <o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-top:0in;margin-right:0in;margin-bottom:0in;\nmargin-left:.25in;margin-bottom:.0001pt;mso-layout-grid-align:none;text-autospace:\nnone\"><span style=\"font-size:12.0pt;line-height:115%;font-family:&quot;Arial&quot;,sans-serif;\ncolor:#222222\">Recevoir la confirmation est une grâce de <b><i>Dieu le Père</i></b> qui te rend\nferme dans la foi et t’unit davantage à nos frères et sœurs dans l’Église et te\nrend témoin de <b><i>Jésus Christ.</i></b><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-top:0in;margin-right:0in;margin-bottom:0in;\nmargin-left:.25in;margin-bottom:.0001pt;mso-layout-grid-align:none;text-autospace:\nnone\"><span style=\"font-size:12.0pt;line-height:115%;font-family:&quot;Arial&quot;,sans-serif;\ncolor:#222222\">Tu es maintenant capable de manifester la sagesse et\nl’intelligence de ta foi. <o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;text-indent:\n.25in;mso-layout-grid-align:none;text-autospace:none\"><b><i><span style=\"font-size:12.0pt;\nline-height:115%;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:Calibri;\nmso-fareast-language:FR-CA\">L’Esprit Saint</span></i></b><span style=\"font-size:12.0pt;line-height:115%;font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:Calibri;mso-fareast-language:FR-CA\"> fait de toi un\ntémoin joyeux de la présence du Christ.</span><span style=\"font-size:12.0pt;\nline-height:115%;font-family:&quot;Arial&quot;,sans-serif;color:#222222\"><o:p></o:p></span></p>\n\n<p style=\"margin: 0in 0in 0.0001pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-family:&quot;Arial&quot;,sans-serif;color:#222222\"><o:p>&nbsp;</o:p></span></p>\n\n<p style=\"margin: 0in 0in 0.0001pt; line-height: 115%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-family:&quot;Arial&quot;,sans-serif;color:#222222\">Bien sûr, puisqu’il s’agit\nde la fin du temps d’initiation, cela suppose que la foi ait grandi pendant ce\ntemps qui a séparé le baptême de la confirmation. Et l’un des éléments les plus\nimportants pour que cette foi grandisse, c’est la participation à diverses\nactivités de catéchèse.<o:p></o:p></span></p>\n\n<p style=\"margin: 0in 0in 0.0001pt; line-height: 115%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-family:&quot;Arial&quot;,sans-serif;color:black;mso-color-alt:windowtext\">Les\ndivers parcours de catéchèse permettent de découvrir toutes les facettes de la\nfoi chrétienne.</span><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><o:p></o:p></span></p>\n\n<p style=\"margin: 0in 0in 0.0001pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><o:p>&nbsp;</o:p></span></p>\n\n<p style=\"margin: 0in 0in 0.0001pt; line-height: 115%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-family:&quot;Arial&quot;,sans-serif;color:#222222\">Conditions&nbsp;:<o:p></o:p></span></p>\n\n<p style=\"margin: 0in 0in 0.0001pt 0.5in; text-indent: -0.25in; line-height: 115%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><!--[if !supportLists]--><span style=\"font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:Arial;color:#222222\">-<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span style=\"font-family:&quot;Arial&quot;,sans-serif;color:#222222\">Avoir vécu le premier\npardon/la première réconciliation et la première communion.<o:p></o:p></span></p>\n\n<p style=\"margin: 0in 0in 0.0001pt 0.5in; text-indent: -0.25in; line-height: 115%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><!--[if !supportLists]--><span style=\"font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:Arial;color:#222222\">-<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span style=\"font-family:&quot;Arial&quot;,sans-serif;color:#222222\">Avoir 12 ans et plus ou\nêtre en 6<sup>e</sup> année scolaire.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\nnormal\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif\">Pour\ncélébrer le sacrement de la confirmation, veuillez communiquer avec nous.&nbsp; </span><b><i><span style=\"font-family:&quot;Arial&quot;,sans-serif;\ncolor:#222222;background:lime;mso-highlight:lime\">Bouton vers le formulaire</span></i></b><b><i><span style=\"font-family:&quot;Arial&quot;,sans-serif;color:#222222\"><o:p></o:p></span></i></b></p>\n\n<p style=\"margin: 0in 0in 0.0001pt; line-height: 115%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-family:&quot;Arial&quot;,sans-serif;color:#222222\"><o:p>&nbsp;</o:p></span></p>\n\n<p style=\"margin: 0in 0in 0.0001pt 0.5in; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-family:&quot;Arial&quot;,sans-serif;\ncolor:#222222\"><o:p>&nbsp;</o:p></span></p>\n\n<p class=\"MsoNormal\"><span style=\"font-size:12.0pt;mso-bidi-font-size:11.0pt;\nline-height:115%\">Pour les adultes et les jeunes de 16 ans et plus, veuillez\nconsulter la page de l’initiation chrétienne des adultes.&nbsp; <span style=\"background:lime;mso-highlight:\nlime\">Bouton vers la fenêtre de l’initiation chrétienne des adultes</span></span><o:p></o:p></p> \n            \n          '),(7,30,'',' \n             \n            \n          \n          ',' \n             \n            \n          \n          ',' \n             \n            \n          \n          ',' \n            <p class=\"MsoNormal\"><b><span style=\"font-size:14.0pt;line-height:107%;\nfont-family:&quot;Franklin Gothic Heavy&quot;,sans-serif\">L’ONCTION DES MALADES.</span></b><b><span style=\"font-family:&quot;Franklin Gothic Heavy&quot;,sans-serif\"> <o:p></o:p></span></b></p><p class=\"MsoNormal\"><span style=\"font-size:12.0pt;line-height:107%;font-family:\n&quot;Franklin Gothic Book&quot;,sans-serif\">L’Onction des malades est un <span style=\"color:red\"><a href=\"https://www.ecdq.org/sacrements/\">des <span style=\"font-size:14.0pt;line-height:107%\">sept sacrements</span></a></span></span><span style=\"font-size:14.0pt;line-height:107%;font-family:&quot;Franklin Gothic Book&quot;,sans-serif;\ncolor:red\">* </span><span style=\"font-size:14.0pt;line-height:107%;font-family:\n&quot;Franklin Gothic Book&quot;,sans-serif\">offerts par l’Église catholique. Dans le\npassé on a associé ce sacrement à la préparation immédiate de la personne\nmalade à la mort. Aujourd’hui recevoir ce sacrement montre le désir d’être fortifié\npar le Christ pour vivre et relever le défi de la maladie ou du vieillissement.\n<o:p></o:p></span></p><p class=\"MsoNormal\"><span style=\"font-size:14.0pt;line-height:107%;font-family:\n&quot;Franklin Gothic Book&quot;,sans-serif\">Le geste essentiel de ce sacrement est une\nonction avec l’huile des malades, bénie par l’évêque, que le <span style=\"color:red\">prêtre***</span> applique sur le front et les mains de la\npersonne.<o:p></o:p></span></p><p class=\"MsoNormal\"><span style=\"font-size:12.0pt;line-height:107%;font-family:\n&quot;Franklin Gothic Book&quot;,sans-serif\"><o:p>&nbsp;</o:p></span></p><p class=\"MsoNormal\"><span style=\"font-size:12.0pt;line-height:107%;font-family:\n&quot;Franklin Gothic Book&quot;,sans-serif\"><o:p>&nbsp;</o:p></span></p><p class=\"MsoNormal\">\n\n\n\n\n\n\n\n\n\n</p><p class=\"MsoNormal\"><span style=\"font-size:12.0pt;line-height:107%;font-family:\n&quot;Franklin Gothic Book&quot;,sans-serif\">Par ce sacrement <span style=\"color:red\">l’Église**</span>\nintercède en faveur de la personne gravement touchée par la maladie ou par le\ngrand âge. Celle-ci peut ainsi unir ses souffrances à celles du Christ et\ncontribuer au bien du peuple de Dieu.<o:p></o:p></span></p> \n            \n          \n          '),(8,31,'','<p class=\"MsoNormal\" align=\"center\" style=\"text-align:center\"><span style=\"font-size:20.0pt;line-height:107%\">Initiation chrétienne des adultes<o:p></o:p></span></p> \n             \n             \n            \n          \n          \n          ',' \n             \n             \n            \n          \n          \n          ',' \n             \n             \n            \n          \n          \n          ',' \n             \n            <p class=\"MsoNormal\">On t’a demandé pour être parrain ou marraine mais tu n’es\npas confirmé?<o:p></o:p></p>\n\n<p class=\"MsoNormal\">Tu penses te marier à l’église bientôt mais tu as entendu\ndire qu’il fallait faire ta confirmation?<o:p></o:p></p>\n\n<p class=\"MsoNormal\">Tu connais des gens qui ont la foi et ce qu’ils vivent\nt’intrigue?<o:p></o:p></p>\n\n<p class=\"MsoNormal\">Tu veux connaître le Christ et débuter ta vie avec Lui?<o:p></o:p></p>\n\n<p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p>\n\n<p class=\"MsoNormal\">Si tu as 16 ans et plus et que tu te trouves dans l’une ou\nl’autre des situations énumérées ci-haut, l’initiation chrétienne des adultes\nest pour toi.<o:p></o:p></p>\n\n<p class=\"MsoNormal\">Ce cheminement est personnalisé. Il comprend un\naccompagnement individuel, des rencontres de catéchèse, des partages de la\nParole et des activités qui te seront proposées au fil de ton parcours. <o:p></o:p></p>\n\n<p class=\"MsoNormal\">Au cours de la démarche, il te sera proposé de vivre les\nsacrements d’initiation qui t’aideront à grandir dans ta relation avec Dieu\n(baptême, eucharistie (première communion), réconciliation et confirmation). <o:p></o:p></p>\n\n<p class=\"MsoNormal\">Est-ce que tu pourras devenir parrain ou marraine, ou est-ce\nque tu pourras te marier avant d’avoir terminé ton cheminement? C’est possible\ndans certaines conditions.<o:p></o:p></p>\n\n<p class=\"MsoNormal\">À ce titre, tu pourrais trouver intéressant ce\ndocument&nbsp;:<o:p></o:p></p>\n\n<p class=\"MsoNormal\"><span style=\"background:lime;mso-highlight:lime\">Bouton pour\ntélécharger le document Se marier en Église</span><o:p></o:p></p>\n\n<p class=\"MsoNormal\">Combien de temps durera ta démarche? Ça va dépendre de ce\nqui se passera dans ton cœur avec Dieu.<o:p></o:p></p>\n\n<p class=\"MsoNormal\">Pour en savoir plus, tu peux remplir le formulaire suivant <span style=\"background:lime;mso-highlight:lime\">Bouton formulaire en annexe</span><o:p></o:p></p>\n\n<p class=\"MsoNormal\">Ou tu peux contacter le responsable&nbsp;:<o:p></o:p></p>\n\n<p class=\"MsoNormal\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Denis\nVallée<o:p></o:p></p>\n\n<p class=\"MsoNormal\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Facebook&nbsp;:\nDenis Vallée Pasto<o:p></o:p></p>\n\n<p class=\"MsoNormal\" style=\"margin-left:35.4pt\">Courriel&nbsp;: <a href=\"mailto:denis.vallee@globetrotter.net\">denis.vallee@globetrotter.net</a>\n(à changer&nbsp;: <a href=\"mailto:dvallee@dd.org\">dvallee@dd.org</a>?\ndvallee@devenirdisciple.org?)<o:p></o:p></p>\n\n<p class=\"MsoNormal\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Téléphone&nbsp;:\n418-228-2558 poste 31<o:p></o:p></p> \n            \n          \n          \n          '),(9,42,'','<p class=\"MsoNormal\" align=\"center\" style=\"text-align:center;line-height:115%\"><span style=\"font-size:16.0pt;line-height:115%;font-family:&quot;Times New Roman&quot;,serif\">Les\nservants de messe&nbsp;</span><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><o:p></o:p></span></p> \n            \n          ',' \n            \n          ',' \n            \n          ','<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><span style=\"font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Servir la\nmesse, c’est d’abord un ministère de service&nbsp;: <o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\n115%\"><span style=\"font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">C’est un service auprès du prêtre,\npour apporter ce dont il a besoin pour célébrer la messe.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\n115%\"><span style=\"font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Choisir d’être servant de messe,\nc’est d’être à la suite de <b>Saint-Tarcisius</b>, saint patron des servants de\nmesse. C’est décider de participer à la beauté des messes, d’aider le prêtre <o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\n115%\"><span style=\"font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">et tout les paroissiens à prier\net de marcher à la suite de Jésus, ainsi chaque servant est<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\n115%\"><span style=\"font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">appelé à approfondir son amour de\nl’Eucharistie. <o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\n115%\"><span style=\"font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\"><o:p>&nbsp;</o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\n115%\"><span style=\"font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Dans la communauté de\nl’Assomption, outre les messes de fin de semaine, les jeunes se réunissent un dimanche\npar mois. <o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\n115%\"><span style=\"font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Ces rencontres leur permettent\nainsi de se former, d’en apprendre plus sur la vie de Jésus et <o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\n115%\"><span style=\"font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">de prier. </span><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Elles servent aussi pour développer\nun sentiment d\'appartenance et à se reconnaitre <o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\n115%\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">en dehors de l’église. </span><span style=\"font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\nmso-fareast-language:FR-CA\"><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\nnormal\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><o:p>&nbsp;</o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\n115%\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Il faut être en mesure\nde remplir ce service par une présence aux messes de fin de semaine <o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\n115%\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">et des messes\nparticulières.&nbsp;Un horaire est fait selon les disponibilités de chacun.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\n115%\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><o:p>&nbsp;</o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\n115%\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">J’accueille les jeunes à\npartir de 7 ans. <o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\n115%\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><o:p>&nbsp;</o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\n115%\"><b><span style=\"font-family:&quot;Times New Roman&quot;,serif\">J’invite aussi les\nadultes, qui veulent servir la messe à venir aux formations qui seront offertes\ndans l’année. Surveillez les feuillets paroissiaux pour les dates de ces\nformations.<o:p></o:p></span></b></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\n115%\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><o:p>&nbsp;</o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\n115%\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Si vous êtes\nintéressé(e), vous n\'avez qu\'à me contacter au: 418-228-2558 poste 25 ou<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\n115%\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">par courriel:&nbsp;</span><a href=\"mailto:annikcate@hotmail.com\" target=\"_blank\"><span style=\"font-family:\n&quot;Times New Roman&quot;,serif\">annikcate@hotmail.com</span></a><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\n115%\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><o:p>&nbsp;</o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"line-height:115%\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Annik\nLegendre&nbsp;<o:p></o:p></span></p>\n\n<p style=\"margin:0in;margin-bottom:.0001pt;text-align:justify;line-height:115%\"><i>«&nbsp;Vous\naussi, vous êtes déjà apôtres de Jésus&nbsp;! Quand vous participez à la\nLiturgie en <o:p></o:p></i></p>\n\n<p style=\"margin:0in;margin-bottom:.0001pt;text-align:justify;line-height:115%\"><i>exerçant\nvotre service de l’autel, vous offrez à tous un témoignage. Votre attitude de <o:p></o:p></i></p>\n\n<p style=\"margin:0in;margin-bottom:.0001pt;text-align:justify;line-height:115%\"><i>prière,\nqui vient du cœur et qui se manifeste par les gestes, par le chant, par votre<o:p></o:p></i></p>\n\n<p style=\"margin:0in;margin-bottom:.0001pt;text-align:justify;line-height:115%\"><i>participation,\ntout cela est déjà apostolat. Vous êtes très proches de Jésus Eucharistie, <o:p></o:p></i></p>\n\n<p style=\"margin:0in;margin-bottom:.0001pt;text-align:justify;line-height:115%\"><i>ce\nqui est le plus grand signe de son amitié pour vous. Laissez-vous toujours\némerveiller par tant d’amour et de proximité&nbsp;! Chers servants d’autel,\nsoyez toujours amis et apôtres de Jésus&nbsp;!&nbsp;»<o:p></o:p></i></p> \n            \n          '),(10,46,'','<p align=\"center\" style=\"margin: 0in 0in 15pt; text-align: center; line-height: 18pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><em><span style=\"font-family:&quot;Arial&quot;,sans-serif;color:#333333\">« Il rassemble ses\nagnelets et les porte sur son cœur.»</span></em><i><span style=\"font-family:\n&quot;Arial&quot;,sans-serif;color:#333333\"><br>\n<em>Is 40,11</em></span></i><span style=\"font-family:&quot;Arial&quot;,sans-serif;color:#333333\"><o:p></o:p></span></p> \n            \n          ',' \n            \n          ',' \n            \n          ','<p style=\"margin: 0in 0in 15pt; text-align: justify; line-height: 18pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-family:&quot;Arial&quot;,sans-serif;color:#333333\">Le chemin d’évangélisation\n<b><i><span style=\"background:aqua;mso-highlight:aqua\">Les Agnelets de Jésus</span></i></b>\nvise l’éveil spirituel des tout-petits âgés de 3-4-5 ans. À cet âge, l’enfant\ns’éveille à la vie. L’initier à la prière est donc essentiellement l’aider à se\ntourner vers Dieu et à entrer dans une relation d’amour et de tendresse avec\nLui.<o:p></o:p></span></p>\n\n<p style=\"margin: 0in 0in 0.0001pt; text-align: justify; line-height: 18pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-family:&quot;Arial&quot;,sans-serif;color:#333333\">La\nParole de Dieu est au cœur de chaque rencontre d’Agnelets de Jésus.<o:p></o:p></span></p>\n\n<p style=\"margin: 0in 0in 0.0001pt; text-align: justify; line-height: 18pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-family:&quot;Arial&quot;,sans-serif;color:#333333\">Elle\nest reprise plusieurs fois afin que l’enfant puisse la garder dans son cœur. <o:p></o:p></span></p>\n\n<p style=\"margin: 0in 0in 0.0001pt; text-align: justify; line-height: 18pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-family:&quot;Arial&quot;,sans-serif;color:#333333\">Elle\ninspire la prière. <o:p></o:p></span></p>\n\n<p style=\"margin: 0in 0in 0.0001pt; text-align: justify; line-height: 18pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-family:&quot;Arial&quot;,sans-serif;color:#333333\">Elle\nprovoque l’émerveillement devant la beauté de la création. <o:p></o:p></span></p>\n\n<p style=\"margin: 0in 0in 0.0001pt; text-align: justify; line-height: 18pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-family:&quot;Arial&quot;,sans-serif;color:#333333\">Elle\nillumine les différents témoins. <o:p></o:p></span></p>\n\n<p style=\"margin: 0in 0in 0.0001pt; text-align: justify; line-height: 18pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-family:&quot;Arial&quot;,sans-serif;color:#333333\">Elle\nenseigne au cœur de l’enfant que son Dieu est un Dieu d’amour et de tendresse. <o:p></o:p></span></p>\n\n<p style=\"margin: 0in 0in 0.0001pt; text-align: justify; line-height: 18pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-family:&quot;Arial&quot;,sans-serif;color:#333333\"><o:p>&nbsp;</o:p></span></p>\n\n<p style=\"margin: 0in 0in 15pt; text-align: justify; line-height: 18pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-family:&quot;Arial&quot;,sans-serif;color:#333333\">Les rencontres ont\ngénéralement lieu aux 15 jours et durent environ une heure.<o:p></o:p></span></p>\n\n<p style=\"margin: 0in 0in 15pt; text-align: justify; line-height: 18pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-family:&quot;Arial&quot;,sans-serif;color:#333333\">Les Agnelets de Jésus\nc’est d’abord et avant tout la rencontre du cœur de l’enfant avec le Cœur de\nDieu.<o:p></o:p></span></p>\n\n<p style=\"margin: 0in 0in 0.0001pt; text-align: justify; line-height: 18pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b><i><span style=\"font-family:&quot;Arial&quot;,sans-serif;color:#333333;background:\naqua;mso-highlight:aqua\">Contactez-nous</span></i></b><b><i><span style=\"font-family:&quot;Arial&quot;,sans-serif;\ncolor:#333333\"><o:p></o:p></span></i></b></p> \n            \n          '),(11,47,'',' \n            \n          ',' \n            \n          ',' \n            \n          ','<p class=\"MsoNormal\">https://www.prierenfamille.com/<o:p></o:p></p>\n\n<p class=\"MsoNormal\">https://officedecatechese.qc.ca/productions/familles/rythme.html<o:p></o:p></p>\n\n<p class=\"MsoNormal\">https://www.ecdq.org/pastorale/famille/<o:p></o:p></p>\n\n<p class=\"MsoNormal\"><a href=\"https://www.ecdq.org/pastorale/famille/coffre-a-outils/\">https://www.ecdq.org/pastorale/famille/coffre-a-outils/</a><o:p></o:p></p> \n            \n          '),(12,48,'',' \n								<p class=\"MsoNormal\" align=\"center\" style=\"margin: 4.8pt 0in 9.6pt; text-align: center; line-height: 150%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b><span style=\"font-size:16.0pt;line-height:150%;font-family:\n&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;color:#444444;\nmso-fareast-language:FR-CA\">La P’tite Pasto<o:p></o:p></span></b></p> \n            \n          \n							',' \n							 \n            \n          \n							',' \n							 \n            \n          \n						',' \n							<p class=\"MsoNormal\" style=\"margin: 4.8pt 0in 9.6pt; text-align: justify; line-height: 150%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:12.0pt;line-height:150%;font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:#444444;mso-fareast-language:\nFR-CA\">C’est une activité d’éveil à la foi où, par le jeu, le chant et le\nbricolage, l’enfant de 2 à 5 ans découvre les merveilles de la famille, de la\nnature, de l’amitié et est doucement introduit à la présence de Dieu et aux\nvaleurs chrétiennes: dans un langage adapté à son âge et un climat de plaisir!<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin: 4.8pt 0in 9.6pt; text-align: justify; line-height: 150%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:12.0pt;line-height:150%;font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:#444444;mso-fareast-language:\nFR-CA\">La P’tite Pasto se fonde sur la conviction que vous les parents, par\nl’amour qui vous lie à votre enfant, êtes les personnes les mieux placées pour\nle guider vers l’Amour de Dieu&nbsp;et les valeurs chrétiennes. La P’tite Pasto\nveut vous offrir; une occasion de découvrir qu’il est possible et amusant de\nparler de votre foi à votre enfant, des pistes à suivre à la maison pour\nl’éveil de la foi;&nbsp;des prières, des mots simples pour parler à Dieu, à\nJésus; l’occasion de créer par des chants, dessins, bricolages, contes, danses,\njeux, prière.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin: 4.8pt 0in 9.6pt; text-align: justify; line-height: 150%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:12.0pt;line-height:150%;font-family:&quot;Arial&quot;,sans-serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:#444444;mso-fareast-language:\nFR-CA\">Une équipe formée de parents, grands-parents et ayant à cœur le bonheur\ndes familles, travaille à la réalisation du projet depuis 6 ans, car les\nfamilles sont le présent et l’avenir de l’Église, la P’tite Pasto veut donc\nvous faire une place de choix au sein de notre communauté.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Pour plus\nd\'infos contactez:</span></b><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\"><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Dorisse\nFaucher 418-228-4361, Sr Hélène Lachance 418-685-2043, Sr Solange Deblois\n418-227-7709 poste 234<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Pour\navoir plus d’information sur le mouvement&nbsp;:<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:normal\"><a href=\"http://www.laptitepasto.com/\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">http://www.laptitepasto.com/</span></a><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\"><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt\"><b><span style=\"font-size:12.0pt;line-height:\n115%;font-family:&quot;Arial&quot;,sans-serif;background:lime;mso-highlight:lime\">Contactez-nous\n(Bouton vers le formulaire pour enfants)</span></b><b><span style=\"font-size:12.0pt;line-height:115%;font-family:&quot;Arial&quot;,sans-serif\"><o:p></o:p></span></b></p> \n            \n          \n						'),(13,44,'',' \n            \n          ',' \n            \n          ',' \n            \n          ','<p style=\"margin: 0in 0in 0.0001pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b><i><span style=\"font-family:&quot;Arial&quot;,sans-serif;color:black;mso-color-alt:windowtext\">«\nJe suis venu pour que les brebis aient la vie et l\'aient en abondance. Je suis\nle bon pasteur, le bon pasteur donne sa vie pour ses brebis »</span></i></b><b><i><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><o:p></o:p></span></i></b></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt\"><b><i><span style=\"font-size:12.0pt;line-height:115%;font-family:&quot;Arial&quot;,sans-serif\">(Jn\n10,10-11).<o:p></o:p></span></i></b></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\nnormal\"><span style=\"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif\"><o:p>&nbsp;</o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\nnormal\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif\">Cette\nParole de Dieu fonde le Mouvement Les Brebis de Jésus, né en 1985 par sr Jocelyne\nHuot, de la communauté des Sœurs de St-François d\'Assise<o:p></o:p></span></p>\n\n<p style=\"margin: 0in 0in 0.0001pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif\"><o:p>&nbsp;</o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom: 0.0001pt; text-align: justify; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:12.0pt;\nfont-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\ncolor:#333333;mso-fareast-language:FR-CA\">Le chemin d’évangélisation Les Brebis\nde Jésus veut rejoindre les enfants de 6-12 ans. La Brebis de Jésus tire sa\njoie de la présence du Berger qui prend soin d’elle, l’appelle par son nom, la\nconduit dans de verts pâturages, la protège du mal. Sa voix la rassure,\nl’établit dans la confiance et la sécurité. L’approfondissement de sa relation\npersonnelle avec son Berger lui révèle son identité d’enfant de Dieu. C’est la\ndécouverte de la grâce de son baptême. <o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom: 0.0001pt; text-align: justify; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:12.0pt;\nfont-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\ncolor:#333333;mso-fareast-language:FR-CA\">À cette étape, l’enfant apprend à\ngrandir en alliance avec son Dieu.<br>\nLa Parole de Dieu est au cœur de chaque rencontre des Brebis de Jésus.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom: 0.0001pt; text-align: justify; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:12.0pt;\nfont-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\ncolor:#333333;mso-fareast-language:FR-CA\">Une rencontre, c’est la Parole de\nDieu entendue, proclamée, accueillie, partagée et actualisée. <o:p></o:p></span></p>\n\n<p class=\"MsoListParagraph\" style=\"margin-bottom: 0.0001pt; text-align: justify; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:#333333;mso-fareast-language:FR-CA\"><o:p>&nbsp;</o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom: 0.0001pt; text-align: justify; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:12.0pt;\nfont-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\ncolor:#333333;mso-fareast-language:FR-CA\">Les rencontres se vivent à un rythme\nhebdomadaire ou bimensuel. Elles durent environ 60 minutes.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom: 0.0001pt; text-align: justify; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:10.0pt;\nfont-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\ncolor:#333333;mso-fareast-language:FR-CA\"><o:p>&nbsp;</o:p></span></p>\n\n<ul style=\"margin-top:0in\" type=\"disc\">\n <li class=\"MsoNormal\" style=\"color: rgb(51, 51, 51); margin-bottom: 0.0001pt; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;\n     mso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Une\n     pédagogie de la rencontre personnelle avec le Christ qui forme le croyant\n     ;<o:p></o:p></span></li>\n <li class=\"MsoNormal\" style=\"color: rgb(51, 51, 51); margin-bottom: 0.0001pt; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;\n     mso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Une\n     pédagogie de la communauté, car la conscience d’appartenir à un troupeau,\n     à un peuple, est liée à la relation Berger-Brebis;<o:p></o:p></span></li>\n <li class=\"MsoNormal\" style=\"color: rgb(51, 51, 51); margin-bottom: 0.0001pt; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;\n     mso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Une\n     pédagogie de la Sequela Christi, car les brebis, petites ou grandes,\n     apprennent à suivre leur Berger là où Il veut les conduire;<o:p></o:p></span></li>\n <li class=\"MsoNormal\" style=\"color: rgb(51, 51, 51); margin-bottom: 0.0001pt; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;\n     mso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Une\n     pédagogie de l’annonce, car la Parole porte en elle-même son dynamisme\n     missionnaire;<o:p></o:p></span></li>\n <li class=\"MsoNormal\" style=\"color: rgb(51, 51, 51); margin-bottom: 0.0001pt; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;\n     mso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:FR-CA\">Une\n     pédagogie de l’unité et de la communauté, au service de l’Église.<o:p></o:p></span></li>\n</ul>\n\n<p class=\"MsoNormal\" style=\"margin: 0in 0in 0.0001pt 0.5in; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;color:#333333;mso-fareast-language:FR-CA\"><o:p>&nbsp;</o:p></span></p>\n\n<p style=\"margin: 0in 0in 0.0001pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b><i><span style=\"font-family:&quot;Arial&quot;,sans-serif;color:black;mso-color-alt:windowtext;\nbackground:aqua;mso-highlight:aqua\">Contactez-nous</span></i></b><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><o:p></o:p></span></p> \n            \n          '),(14,45,'',' \n            \n          ',' \n            \n          ',' \n            \n          ','<p class=\"MsoNormal\">Catéchèse des enfants<o:p></o:p></p>\n\n<p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p>\n\n<p class=\"MsoNormal\">Le cheminement des enfants par la catéchèse inclut souvent\nla célébration des sacrements d’initiation.<o:p></o:p></p>\n\n<p class=\"MsoNormal\">Pour en savoir plus, vous êtes invités à vous référer à la\nsection «&nbsp;Sacrements&nbsp;».<o:p></o:p></p>\n\n<p class=\"MsoNormal\">Vous pouvez aussi contacter les personnes responsables à\npartir de ce formulaire&nbsp;:<o:p></o:p></p>\n\n<p class=\"MsoNormal\"><span style=\"background:lime;mso-highlight:lime\">Bouton\nformulaire enfants</span><o:p></o:p></p> \n            \n          '),(15,34,'',' \n								 \n								 \n								 \n								 \n								 \n								<br> \n            \n          \n							\n							\n							\n							\n							\n							',' \n							 \n							 \n							 \n							 \n							 \n							 \n            \n          \n							\n							\n							\n							\n							\n							',' \n							\n						',' \n							 \n							 \n							 \n							 \n							 \n							<p class=\"MsoNormal\">Pastorale jeunesse<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Tu as entre 12 et 17 ans? Ou entre 18 et 35 ans? Des\nactivités peuvent être organisées selon tes intérêts, tes goûts et ton temps\npour t’aider à grandir dans la foi avec d’autres jeunes de ton âge.<o:p></o:p></p><p class=\"MsoNormal\">Pour en savoir plus, contacte Denis Vallée, agent de\npastorale<o:p></o:p></p><p class=\"MsoNormal\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Facebook&nbsp;:\nDenis Vallée Pasto<o:p></o:p></p><p class=\"MsoNormal\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Courriel&nbsp;:\n<a href=\"mailto:denis.vallee@globetrotter.net\">denis.vallee@globetrotter.net</a>\n(à changer)<o:p></o:p></p><p class=\"MsoNormal\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Téléphone&nbsp;:\n418-228-2558 poste 31</p><p class=\"MsoNormal\"><br></p> \n            \n          \n						\n						\n						\n						\n						\n						'),(16,35,'',' \n            \n          ',' \n            \n          ',' \n            \n          ','<p class=\"MsoNormal\">Équipes&nbsp; Accueil\nFraternité<o:p></o:p></p>\n\n<p class=\"MsoNormal\">À la demande de Mgr Lacroix et en raison du regroupement des\ndouze &nbsp;communautés de la Paroisse de\nSaint-Georges-de-Sartigan, des équipes ont été mises en place. &nbsp;Dans son approche, Mgr Lacroix maintenait &nbsp;qu’il était devenu impératif &nbsp;que les communautés se prennent en main et\nassure la vitalité de leur milieu.<o:p></o:p></p>\n\n<p class=\"MsoNormal\">Une équipe qui assume le leadership et dont l’objectif est\nd’établir &nbsp;un programme d’accueil et de\nfraternité, &nbsp;a déjà entrepris des\ndémarches auprès de certaines communautés de la Paroisse. D’autres communautés\nont déjà des équipes d’accueil et de fraternité en place et expérimentent des\nprojets. <o:p></o:p></p>\n\n<p class=\"MsoNormal\">Notre équipe rencontre les leaders des communautés, &nbsp;afin d’implanter des équipes permanentes qui\nprendront en charge dans un avenir rappoché la vie de leur communauté.<o:p></o:p></p>\n\n<p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p>\n\n<p class=\"MsoNormal\">Contacts : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Hélène\nPaquet, Martial Drouin 418&nbsp;227 4420<o:p></o:p></p>\n\n<p class=\"MsoNormal\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;martial.h.drouin@gmail.com&gt;<o:p></o:p></p> \n            \n          '),(17,49,'',' \n            \n          ',' \n            \n          ',' \n            \n          ','<p class=\"MsoNormal\">Catéchèse d’adultes<o:p></o:p></p>\n\n<p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p>\n\n<p class=\"MsoNormal\">Il existe plusieurs formes de catéchèse d’adultes. La plus\ncommune chez nous concerne l’initiation chrétienne des adultes.<o:p></o:p></p>\n\n<p class=\"MsoNormal\"><span style=\"background:lime;mso-highlight:lime\">Bouton vers\nl’initiation chrétienne des adultes (dans la section des sacrements)</span><o:p></o:p></p>\n\n<p class=\"MsoNormal\">Pour en savoir plus, vous pouvez aussi contacter Denis\nVallée, agent de pastorale<o:p></o:p></p>\n\n<p class=\"MsoNormal\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Facebook&nbsp;:\nDenis Vallée Pasto<o:p></o:p></p>\n\n<p class=\"MsoNormal\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Courriel&nbsp;:\n<a href=\"mailto:denis.vallee@globetrotter.net\">denis.vallee@globetrotter.net</a><o:p></o:p></p>\n\n<p class=\"MsoNormal\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Téléphone&nbsp;:\n418-228-2558<o:p></o:p></p>\n\n<p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p> \n            \n          '),(18,50,'','<p class=\"MsoNormal\" align=\"center\" style=\"mso-margin-bottom-alt:auto;text-align:\ncenter;line-height:33.75pt;mso-outline-level:1;background:#6CB144\"><span style=\"font-size:26.5pt;font-family:&quot;inherit&quot;,serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;mso-bidi-font-family:&quot;Times New Roman&quot;;color:white;\nmso-font-kerning:18.0pt;mso-fareast-language:FR-CA\">Cellules paroissiales\nd\'évangélisation</span><span style=\"font-size:26.5pt;font-family:&quot;inherit&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:&quot;Times New Roman&quot;;\ncolor:#6CB144;mso-font-kerning:18.0pt;mso-fareast-language:FR-CA\"><o:p></o:p></span></p> \n            \n          ',' \n            \n          ',' \n            \n          ','<p class=\"MsoNormal\" style=\"margin-bottom:7.5pt;text-align:justify;line-height:\nnormal\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-fareast-language:\nFR-CA\">La « cellule paroissiale d’évangélisation » est un petit groupe de laïcs\n(6 à 10 personnes) qui se réunit chaque semaine dans une maison familiale pour\nfraterniser, prier, partager la Parole, rendre service, s’encourager dans le\ntémoignage. Elle a comme objectif d’aider les paroissiens à devenir, dans leur\nvie concrète et quotidienne, des disciples-missionnaires de Jésus-Christ. Pour\ndes personnes de tous âges, croyant ou pas, pratiquant ou pas! Il y a une place\npour toi! <o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:7.5pt;text-align:justify;line-height:\nnormal\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-fareast-language:\nFR-CA\">Voici en gros ce qu`est une Cellule; mais nous qui vivons une Cellule\nd`évangélisation nous vivons encore plus que cela. La rencontre commence par un\naccueil très chaleureux, avec le temps nous devenons vraiment comme une belle famille\nunie où les liens de fraternité sont très importants. Le support des uns et des\nautres par la prière est aussi très senti et efficace. Le partage de notre vécu\npendant la semaine, fait partie de nos rencontres. Le climat de confiance et le\nrespect sont très importants.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:7.5pt;text-align:justify;line-height:\nnormal\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-fareast-language:\nFR-CA\">Le partage de la Parole de Dieu est au centre de nos rencontres. Nous\npouvons compter sur un enseignement qui nous aide à approfondir cette Parole\nentendue. Le plus beau dans tout cela, c`est en écoutant chacun sur sa façon de\nvoir la Parole, que nous découvrons parfois des messages que nous n`avions pas\nsaisi. Cela représente bien ce qu`est une cellule à l`exemple d`une cellule\nhumaine qui est là pour que la vie se continue et grandisse. Tout cela se vit\navec l`aide de l`Esprit-saint qui nous pousse par la suite vers ceux et celles\nautour de nous qui en ont le plus de besoin. <o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:7.5pt;text-align:justify;line-height:\nnormal\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-fareast-language:\nFR-CA\">&nbsp;Ce que nous vivons est une\nexpérience authentique d`évangélisation qui ressemble beaucoup à ce qui avait\nlieu dans les premiers temps de l`Église.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:7.5pt;text-align:justify;line-height:\nnormal\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-fareast-language:\nFR-CA\">Pour en savoir plus ou pour faire cette belle expérience viens chez-nous\nc`est Jésus qui t`invite. <o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:7.5pt;text-align:justify;line-height:\nnormal\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-fareast-language:\nFR-CA\">Voir site sur internet&nbsp;: Google,&nbsp;&nbsp;\nwww cellules paroissiales d`évangélisation<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:7.5pt;text-align:justify;line-height:\nnormal\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-fareast-language:\nFR-CA\">Une série de volumes de formation avec des dépliants expliquant les 7\nmoments d`une rencontre de Cellule sont disponibles.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:7.5pt;text-align:justify;line-height:\nnormal\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-fareast-language:\nFR-CA\">&nbsp;Paroisse St-Jean-Paul II&nbsp;:\nResponsable&nbsp;: Mme Danielle Veilleux 418-382-3107<o:p></o:p></span></p>\n\n<span style=\"font-size:12.0pt;line-height:115%;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-ansi-language:FR-CA;\nmso-fareast-language:FR-CA;mso-bidi-language:AR-SA\">&nbsp;Répondant diocésain&nbsp;: Raoul Lessard\ndiacre. 418-228-7542&nbsp;</span> \n            \n          '),(19,51,'','<p class=\"MsoNormal\" align=\"center\" style=\"text-align:center\"><span style=\"font-size:18.0pt;line-height:107%\">Chapelles d’adoration<o:p></o:p></span></p> \n            \n          ',' \n            \n          ',' \n            \n          ','<p class=\"MsoNormal\"><u>Du côté de l’Assomption de la Bienheureuse Vierge Marie</u>&nbsp;:</p><p class=\"MsoNormal\"><br></p>\n\n<p class=\"MsoNormal\">Tu as le goût de vivre un temps d’arrêt, de présence et\nd’écoute du Seigneur dans le silence et la prière? Tu es la ou le bienvenu à la\nchapelle d’adoration «&nbsp;Marie adoratrice&nbsp;» située sous le perron de\nl’église de l’Assomption au 12375, boulevard Lacroix à St-Georges.<o:p></o:p></p>\n\n<p class=\"MsoNormal\">La chapelle a ouvert ses portes le 2 février 2003.<o:p></o:p></p>\n\n<p class=\"MsoNormal\">Si ça t’intéresse de combler une heure précise d’adoration\ndurant la semaine, communique avec nous&nbsp;:<o:p></o:p></p>\n\n<p class=\"MsoNormal\">Louis Paquet et Gisèle Couture&nbsp;: 418-228-6739<o:p></o:p></p>\n\n<p class=\"MsoNormal\">Ou Charles Roberge, d.p.&nbsp;: 418-228-3684<o:p></o:p></p>\n\n<p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p>\n\n<p class=\"MsoNormal\">La chapelle est toujours ouverte 24h/24, 7 jours/7. Par\ncontre, pour l’adoration de nuit, communique avec nous pour avoir le code de la\nserrure.<o:p></o:p></p>\n\n<p class=\"MsoNormal\">Une vidéo montée alors que nos communautés n’étaient pas\nencore fusionnées peut être vue ici&nbsp;:<o:p></o:p></p>\n\n<p class=\"MsoNormal\"><a href=\"https://www.youtube.com/watch?v=jsGg2P_mdn0&amp;feature=youtu.be\">https://www.youtube.com/watch?v=jsGg2P_mdn0&amp;feature=youtu.be</a><o:p></o:p></p>\n\n<p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p>\n\n<p class=\"MsoNormal\">Toutes et tous sont bienvenus pour venir adorer en tout\ntemps.</p><p class=\"MsoNormal\"><br></p>\n\n<p class=\"MsoNormal\"><u>Du côté de l’église de St-Georges</u> se trouve une autre\nchapelle située dans l’église. Elle est ouverte aux heures d’ouverture de\nl’église, soit tôt le matin jusque vers 15h00.<o:p></o:p></p>\n\n<p class=\"MsoNormal\">Tout le monde est bienvenu!<o:p></o:p></p> \n            \n          '),(20,52,'',' \n            <p class=\"MsoNormal\" align=\"center\" style=\"margin-bottom:0in;margin-bottom:.0001pt;\ntext-align:center;line-height:normal\"><b><span style=\"font-size:16.0pt;font-family:&quot;Arial&quot;,sans-serif\">Le Curcillo<o:p></o:p></span></b></p> \n            \n          \n          ',' \n             \n            \n          \n          ',' \n             \n            \n          \n          ',' \n            <p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\nnormal\"><b><span style=\"font-size:16.0pt;\nfont-family:&quot;Arial&quot;,sans-serif\">Le Curcillo est un mouvement pour adultes.<o:p></o:p></span></b></p>\n\n<p class=\"MsoListParagraphCxSpFirst\" style=\"margin-bottom:0in;margin-bottom:.0001pt;\nmso-add-space:auto;text-indent:-.25in;line-height:normal;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:16.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\nArial\">-<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span></span><!--[endif]--><b><span style=\"font-size:16.0pt;font-family:&quot;Arial&quot;,sans-serif\">Un mouvement d’Église\nqui vise la rencontre personnelle de Jésus Christ.<o:p></o:p></span></b></p>\n\n<p class=\"MsoListParagraphCxSpLast\" style=\"margin-bottom:0in;margin-bottom:.0001pt;\nmso-add-space:auto;text-indent:-.25in;line-height:normal;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:16.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\nArial\">-<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span></span><!--[endif]--><b><span style=\"font-size:16.0pt;font-family:&quot;Arial&quot;,sans-serif\">C’est une expérience de\nvie qui permet de savoir qui je suis, de faire le point dans sa vie, de\nrencontrer les autres et de rencontrer l’Amour de Dieu.<o:p></o:p></span></b></p>\n\n<p class=\"MsoNormal\" style=\"margin-top:0in;margin-right:0in;margin-bottom:0in;\nmargin-left:.25in;margin-bottom:.0001pt;line-height:normal\"><b><span style=\"font-size:16.0pt;font-family:\n&quot;Arial&quot;,sans-serif\"><o:p>&nbsp;</o:p></span></b></p>\n\n<p class=\"MsoNormal\" style=\"margin-top:0in;margin-right:0in;margin-bottom:0in;\nmargin-left:.25in;margin-bottom:.0001pt;line-height:normal\"><b><span style=\"font-size:16.0pt;font-family:\n&quot;Arial&quot;,sans-serif\">Le Curcillo débute par une rencontre de trois jours, par la\nsuite vous serez invités à vous joindre à une communauté proche de chez vous et\nce, une fois par semaine.<o:p></o:p></span></b></p>\n\n<p class=\"MsoNormal\" style=\"margin-top:0in;margin-right:0in;margin-bottom:0in;\nmargin-left:.25in;margin-bottom:.0001pt;line-height:normal\"><b><span style=\"font-size:16.0pt;font-family:\n&quot;Arial&quot;,sans-serif\"><o:p>&nbsp;</o:p></span></b></p>\n\n<p class=\"MsoNormal\" style=\"margin-top:0in;margin-right:0in;margin-bottom:0in;\nmargin-left:.25in;margin-bottom:.0001pt;line-height:normal\"><b><span style=\"font-size:16.0pt;font-family:\n&quot;Arial&quot;,sans-serif\">Donc, si vous voulez faire cette triple rencontre avec\nvous-mêmes, avec Dieu et avec les autres, offrez-vous ce cadeau qui pourra\nchanger votre vie.<o:p></o:p></span></b></p>\n\n<p class=\"MsoNormal\" style=\"margin-top:0in;margin-right:0in;margin-bottom:0in;\nmargin-left:.25in;margin-bottom:.0001pt;line-height:normal\"><b><span style=\"font-size:16.0pt;font-family:\n&quot;Arial&quot;,sans-serif\"><o:p>&nbsp;</o:p></span></b></p>\n\n<p class=\"MsoNormal\" style=\"margin-top:0in;margin-right:0in;margin-bottom:0in;\nmargin-left:.25in;margin-bottom:.0001pt;line-height:normal\"><b><span style=\"font-size:16.0pt;font-family:\n&quot;Arial&quot;,sans-serif\">Prenez contact avec nous pour en savoir davantage soit par\ncourriel&nbsp;:&nbsp;&nbsp;&nbsp; </span></b><a href=\"mailto:curcilloquebec@gmail.com\"><b><span style=\"font-size:16.0pt;font-family:&quot;Arial&quot;,sans-serif\">curcilloquebec@gmail.com</span></b></a><b><span style=\"font-size:16.0pt;font-family:\n&quot;Arial&quot;,sans-serif\"><o:p></o:p></span></b></p>\n\n<p class=\"MsoNormal\" style=\"margin-top:0in;margin-right:0in;margin-bottom:0in;\nmargin-left:.25in;margin-bottom:.0001pt;line-height:normal\"><b><span style=\"font-size:16.0pt;font-family:\n&quot;Arial&quot;,sans-serif\"><o:p>&nbsp;</o:p></span></b></p>\n\n<p class=\"MsoNormal\" style=\"margin-top:0in;margin-right:0in;margin-bottom:0in;\nmargin-left:.25in;margin-bottom:.0001pt;line-height:normal\"><b><span style=\"font-size:16.0pt;font-family:\n&quot;Arial&quot;,sans-serif\">Ou par téléphone au 418-228-6758<o:p></o:p></span></b></p> \n            \n          \n          '),(21,53,'',' \n            \n          ',' \n            \n          ',' \n            \n          ','<p class=\"MsoNormal\">Groupes de prière<o:p></o:p></p>\n\n<p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p>\n\n<p class=\"MsoNormal\">Tu veux rencontrer le Seigneur avec d’autres frères et sœurs\nchrétiens? Tu seras bienvenu dans l’un ou l’autre des groupes de prière de nos\nparoisses.<o:p></o:p></p>\n\n<p class=\"MsoNormal\">Horaire&nbsp;:<o:p></o:p></p>\n\n<p class=\"MsoListParagraphCxSpFirst\" style=\"text-indent:-.25in;mso-list:l0 level1 lfo1\"><!--[if !supportLists]-->-<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span><!--[endif]-->Dimanche soir au 12140, 1<sup>ère</sup> avenue,\nSt-Georges (ancien local du Café Chrétien)<o:p></o:p></p>\n\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent:-.25in;mso-list:l0 level1 lfo1\"><!--[if !supportLists]-->-<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span><!--[endif]-->Lundi soir à St-Prosper<o:p></o:p></p>\n\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent:-.25in;mso-list:l0 level1 lfo1\"><!--[if !supportLists]-->-<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span><!--[endif]-->Lundi soir à la salle Pasto-Vie (sous-sol de\nl’église de St-Georges)<o:p></o:p></p>\n\n<p class=\"MsoListParagraphCxSpLast\" style=\"text-indent:-.25in;mso-list:l0 level1 lfo1\"><!--[if !supportLists]-->-<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span><!--[endif]-->Jeudi soir au sous-sol de l’église de\nl’Assomption<o:p></o:p></p>\n\n<p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p>\n\n<p class=\"MsoNormal\">Pour en savoir plus<o:p></o:p></p>\n\n<p class=\"MsoNormal\"><span style=\"background:lime;mso-highlight:lime\">Bouton\nContactez-nous</span><o:p></o:p></p> \n            \n          '),(22,37,'','<p class=\"MsoNormal\" align=\"center\" style=\"text-align:center\"><span style=\"font-size:18.0pt;line-height:107%\">Comité Création Verte<o:p></o:p></span></p> \n            \n          ',' \n            \n          ',' \n            \n          ','<p class=\"MsoNormal\">Le Comité Création Verte est le comité de l’environnement de\nla paroisse St-Georges-de-Sartigan. Notre mission est de sensibiliser et\nd\'interpeller les membres de notre paroisse à faire le lien entre leur foi, les\nappels du Seigneur et l\'environnement que nous appelons \"Création\" en\nterme biblique, et à agir pour la préservation de la Création.<o:p></o:p></p>\n\n<p class=\"MsoNormal\">Pour en savoir plus et pour vous joindre à nous, veuillez\ncontacter Céline Jacques&nbsp;:<o:p></o:p></p>\n\n<p class=\"MsoNormal\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Téléphone&nbsp;:\n581-372-7918<o:p></o:p></p>\n\n<p class=\"MsoNormal\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Courriel&nbsp;:\nceline_leia@hotmail.com<o:p></o:p></p>\n\n<p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p>\n\n<p class=\"MsoNormal\">Vous pouvez consulter notre page Facebook&nbsp;: Comité\nCréation Verte<o:p></o:p></p> \n            \n          '),(23,57,'',' \n								<p class=\"MsoTitle\"><b><span style=\"font-size:22.0pt;font-family:&quot;Franklin Gothic Medium&quot;,sans-serif\">Projet\nmusical Mario Pelchat et les prêtres<o:p></o:p></span></b></p> \n								\n							\n							',' \n							 \n							\n							\n							',' \n							 \n							\n						\n						','<p class=\"MsoNormal\" style=\"text-align:justify\"><span style=\"font-size:14.0pt;\nline-height:107%;font-family:&quot;Franklin Gothic Medium&quot;,sans-serif\">Le projet\nmusical de <i>Mario Pelchat et les prêtres</i> est, à l’origine, un groupe\nvocal&nbsp; d’accompagnement regroupant des\nprêtres, des séminaristes et un évêque pour mettre en valeur le talent et\nl’inspiration spirituelle de Mario Pelchat et de plusieurs artistes invités à\noffrir une contribution vocale au projet. Il a pris naissance à l’automne 2016.\n<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"text-align:justify\"><span style=\"font-size:14.0pt;\nline-height:107%;font-family:&quot;Franklin Gothic Medium&quot;,sans-serif\">L’enregistrement\ndu premier album <i>Agnus Dei</i> a été réalisé en février 2017 pour la sortie\nà Pâques de la même année, puis l’album <i>Noël Ensemble</i> a suivi à\nl’automne 2017. Les CD <i>Agnus Dei</i> et <i>Noël Ensemble</i> ont été&nbsp; certifiés disque d’or la même année.&nbsp; <o:p></o:p></span></p>\n\n<p class=\"MsoNormal\"><span style=\"font-size:14.0pt;line-height:107%;font-family:\n&quot;Franklin Gothic Medium&quot;,sans-serif\">En octobre 2018, l’ADISQ a décerné le prix\nFélix de l’album le plus vendu au Québec en 2018 pour le CD <i>Agnus Dei</i>.</span>\n<span style=\"font-size:14.0pt;line-height:107%;font-family:&quot;Franklin Gothic Medium&quot;,sans-serif\"><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\"><span style=\"font-size:14.0pt;line-height:107%;font-family:\n&quot;Franklin Gothic Medium&quot;,sans-serif\"><o:p>&nbsp;</o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"text-align:justify\"><span style=\"font-size:14.0pt;\nline-height:107%;font-family:&quot;Franklin Gothic Medium&quot;,sans-serif\">Nous avons eu\nle privilège de chanter avec des voix prestigieuses comme celle de Nicole\nMartin, Joe Bocan et Marie-Josée Lord. S’ajoutent aussi les voix des jeunes de\nla génération montante&nbsp;: 2 frères, Tocccadeo, Sophia-Rose Boulanger, Cindy\nDaniel, Margau, Michaël et Raphaël.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt\"><span style=\"font-size:14.0pt;line-height:107%;font-family:&quot;Franklin Gothic Medium&quot;,sans-serif\">3\nalbums constituent <o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt\"><span style=\"font-size:14.0pt;line-height:107%;font-family:&quot;Franklin Gothic Medium&quot;,sans-serif\">la\ndiscographie du groupe<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt\"><span style=\"font-size:14.0pt;line-height:107%;font-family:&quot;Franklin Gothic Medium&quot;,sans-serif\"><o:p>&nbsp;</o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt\"><span style=\"font-size:14.0pt;line-height:107%;font-family:&quot;Franklin Gothic Medium&quot;,sans-serif\"><o:p>&nbsp;</o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt\"><span style=\"font-size:14.0pt;line-height:107%;font-family:&quot;Franklin Gothic Medium&quot;,sans-serif\">Agnus\nDei <o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt\"><span style=\"font-size:14.0pt;line-height:107%;font-family:&quot;Franklin Gothic Medium&quot;,sans-serif\"><o:p>&nbsp;</o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt\"><span style=\"font-size:14.0pt;line-height:107%;font-family:&quot;Franklin Gothic Medium&quot;,sans-serif\"><o:p>&nbsp;</o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt\"><span style=\"font-size:14.0pt;line-height:107%;font-family:&quot;Franklin Gothic Medium&quot;,sans-serif\">Noël\nEnsemble <o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt\"><span style=\"font-size:14.0pt;line-height:107%;font-family:&quot;Franklin Gothic Medium&quot;,sans-serif\"><o:p>&nbsp;</o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt\"><span style=\"font-size:14.0pt;line-height:107%;font-family:&quot;Franklin Gothic Medium&quot;,sans-serif\"><o:p>&nbsp;</o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt\"><span style=\"font-size:14.0pt;line-height:107%;font-family:&quot;Franklin Gothic Medium&quot;,sans-serif\">Quand\nles hommes <o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt\"><span style=\"font-size:14.0pt;line-height:107%;font-family:&quot;Franklin Gothic Medium&quot;,sans-serif\">vivront\nd’amour.&nbsp;&nbsp; <o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt\"><span style=\"font-size:14.0pt;line-height:107%;font-family:&quot;Franklin Gothic Medium&quot;,sans-serif\"><o:p>&nbsp;</o:p></span></p>\n\n<p class=\"MsoNormal\"><span style=\"font-size:14.0pt;line-height:107%;font-family:\n&quot;Franklin Gothic Medium&quot;,sans-serif\"><o:p>&nbsp;</o:p></span></p>\n\n<p class=\"MsoNormal\"><span style=\"font-size:14.0pt;line-height:107%;font-family:\n&quot;Franklin Gothic Medium&quot;,sans-serif\">Visionnez quelques beaux moments du\nprojet. <o:p></o:p></span></p>\n\n<p class=\"MsoNormal\"><a href=\"https://palmaresadisq.ca/fr/artiste/mario-pelchat-et-les-pretres/video/agnus-dei/\"><span style=\"font-size:12.0pt;line-height:107%;font-family:&quot;Franklin Gothic Medium&quot;,sans-serif\">https://palmaresadisq.ca/fr/artiste/mario-pelchat-et-les-pretres/video/agnus-dei/</span></a><span style=\"font-size:12.0pt;line-height:107%;font-family:&quot;Franklin Gothic Medium&quot;,sans-serif\"><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\"><a href=\"https://www.youtube.com/watch?v=nxESi8HFjSo\"><span style=\"font-size:14.0pt;line-height:107%;font-family:&quot;Franklin Gothic Medium&quot;,sans-serif\">https://www.youtube.com/watch?v=nxESi8HFjSo</span></a><span style=\"font-size:14.0pt;line-height:107%;font-family:&quot;Franklin Gothic Medium&quot;,sans-serif\"><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\"><a href=\"https://www.youtube.com/watch?v=GVc3cNS4WFE\"><span style=\"font-size:14.0pt;line-height:107%;font-family:&quot;Franklin Gothic Medium&quot;,sans-serif\">https://www.youtube.com/watch?v=GVc3cNS4WFE</span></a><span style=\"font-size:14.0pt;line-height:107%;font-family:&quot;Franklin Gothic Medium&quot;,sans-serif\"><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\"><a href=\"https://youtu.be/lUDsM3tPpm8\"><span style=\"font-size:14.0pt;line-height:107%;font-family:&quot;Franklin Gothic Medium&quot;,sans-serif\">https://youtu.be/lUDsM3tPpm8</span></a><span style=\"font-size:14.0pt;line-height:107%;font-family:&quot;Franklin Gothic Medium&quot;,sans-serif\"><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\"><span style=\"font-size:14.0pt;line-height:107%;font-family:\n&quot;Franklin Gothic Medium&quot;,sans-serif\"><o:p>&nbsp;</o:p></span></p>\n\n<p class=\"MsoNormal\"><u><span style=\"font-size:16.0pt;line-height:107%;\nfont-family:&quot;Franklin Gothic Medium&quot;,sans-serif\">La tournée des concerts Mario\nPelchat et les prêtres</span></u><u><span style=\"font-size:14.0pt;line-height:\n107%;font-family:&quot;Franklin Gothic Medium&quot;,sans-serif\"><o:p></o:p></span></u></p>\n\n<p class=\"MsoNormal\"><span style=\"font-size:14.0pt;line-height:107%;font-family:\n&quot;Franklin Gothic Medium&quot;,sans-serif\"><o:p>&nbsp;</o:p></span></p>\n\n<p class=\"MsoNormal\"><span style=\"font-size:14.0pt;line-height:107%;font-family:\n&quot;Franklin Gothic Medium&quot;,sans-serif\">En novembre décembre 2017 et 2018 plus\nd’une vingtaine de concerts en salle ont été présentés dont deux au Centre\nVideotron de Québec. <o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt\"><span style=\"font-size:14.0pt;line-height:107%;font-family:&quot;Franklin Gothic Medium&quot;,sans-serif\"><o:p>&nbsp;</o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt\"><span style=\"font-size:14.0pt;line-height:107%;font-family:&quot;Franklin Gothic Medium&quot;,sans-serif\">Le\ngroupe a fait relâche en 2019. Une relance est prévue en 2020 par la\npréparation d’un concert plus adapté au format des églises paroissiales. Un\npremier concert aura lieu en l’église de Saint-Frédéric en Beauce le samedi 9\nmai 2020.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\"><span style=\"font-size:14.0pt;line-height:107%;font-family:\n&quot;Franklin Gothic Medium&quot;,sans-serif\"><o:p>&nbsp;</o:p></span></p>\n\n<p class=\"MsoNormal\"><span style=\"font-size:14.0pt;line-height:107%;font-family:\n&quot;Franklin Gothic Medium&quot;,sans-serif\">Horaire des concerts à venir&nbsp;:<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\"><span style=\"font-size:14.0pt;line-height:107%;font-family:\n&quot;Franklin Gothic Medium&quot;,sans-serif\">9 mai 2020 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; église Saint-Frédéric de Beauce <o:p></o:p></span></p>\n\n<p class=\"MsoNormal\"><span style=\"font-size:14.0pt;line-height:107%;font-family:\n&quot;Franklin Gothic Medium&quot;,sans-serif\">Automne 2020 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; église Saint-Prosper de Beauce<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\"><span style=\"font-size:14.0pt;line-height:107%;font-family:\n&quot;Franklin Gothic Medium&quot;,sans-serif\"><o:p>&nbsp;</o:p></span></p>\n\n<p class=\"MsoNormal\"><span style=\"font-size:14.0pt;line-height:107%;font-family:\n&quot;Franklin Gothic Medium&quot;,sans-serif\">Pour l’achat de disques <o:p></o:p></span></p>\n\n<p class=\"MsoNormal\"><span style=\"font-size:14.0pt;line-height:107%;font-family:\n&quot;Franklin Gothic Medium&quot;,sans-serif\">Et sur iTunes Store<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\"><o:p></o:p></p><p class=\"MsoNormal\" style=\"text-align:justify\"><span style=\"font-size: 1rem; text-align: left;\">Pour en savoir davantage</span><span style=\"font-size: 1rem; text-align: left;\">&nbsp;</span><span style=\"font-size: 1rem; text-align: left;\">&nbsp;</span><br></p>\n\n \n							 \n							\n						\n						'),(24,58,'','<span id=\"docs-internal-guid-5abf981e-7fff-84f3-bca6-c6861c418be0\"><span style=\"font-size: 36pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">                               Déjeuners de la Parole</span></span> \n								\n							',' \n							\n							',' \n							\n						','<span id=\"docs-internal-guid-73e7937f-7fff-66dc-5e54-29688c65682e\"><p dir=\"ltr\" style=\"line-height:1.295;margin-top:0pt;margin-bottom:8pt;\"><span style=\"font-size: 12pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">Les déjeuners de la Parole sont des moments de fraternité qui réunissent des participants et des participantes autour d’un bon café et du texte biblique du dimanche suivant. Ensemble, après une première lecture, ils prennent un moment pour s’intérioriser et souligner au groupe le mot, la phrase ou l’expression qui les interpelle, les questionne ou les dérange. Ensuite, ceux et celles qui le désirent commentent leur passage et expliquent ce qu’ils ont découvert dans le récit biblique visité. Chaque personne est libre de partager sa découverte ou son questionnement.&nbsp;</span></p><p dir=\"ltr\" style=\"line-height:1.295;margin-top:0pt;margin-bottom:8pt;\"><span style=\"font-size: 12pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">Supervisés par un animateur, ces déjeuners de la Parole durent une heure environ. Ils se tiennent en générale dans un restaurant les jours de semaine. En temps de confinement, les déjeuners de la Parole sont transformés en café de la Parole où chaque participant vient prendre son deuxième café devant sa tablette ou son ordinateur. Par diverses plateformes de communication, les personnes qui participent revivent ces échanges enrichissants d’où chacun et chacune ressortent avec un petit quelque chose de plus.&nbsp;</span></p><p dir=\"ltr\" style=\"line-height:1.295;margin-top:0pt;margin-bottom:8pt;\"><span style=\"font-size: 12pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">Pour connaitre les endroits où se tiennent les Déjeuners de la Parole&nbsp;:&nbsp;</span></p><p dir=\"ltr\" style=\"line-height:1.295;margin-top:0pt;margin-bottom:8pt;\"><span style=\"font-size: 12pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">Contacter&nbsp;: M. Daniel Garant, Agent de Pastorale.&nbsp;</span></p><div><span style=\"font-size: 12pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\"><br></span></div></span> \n							\n						'),(25,5,'',' \n								 \n								 \n								 \n								 \n								\n							\n							\n							\n							\n							',' \n							 \n							 \n							 \n							 \n							\n							\n							\n							\n							\n							',' \n							 \n							 \n							 \n							 \n							\n						\n						\n						\n						\n						',' \n							 \n							 \n							 \n							 \n							\n						\n						\n						\n						\n						');
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
/*!50003 DROP PROCEDURE IF EXISTS `AddFeuillet` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddFeuillet`(in inPdfPath varchar(200),in inPdfName varchar(100), in inActif tinyint, in inOrderDisplay int, in inSize varchar(20))
BEGIN

insert into feuillet(pdfPath,pdfName, Actif, orderDisplay, size)
    values (inPdfPath, inPdfName, inActif, inOrderDisplay, inSize);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddNouvelles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddNouvelles`(
	in title varchar(50),
	descrSomm VARCHAR(100),
	descrTot LONGTEXT,
	dateDebut INT(11),
	dateFin INT(11),    
	actif tinyint,
	imagePath varchar(500))
BEGIN
	insert into nouvelles(title, descrSomm, descrTot, dateDebut, dateFin, actif, imagePath)
    values (title, descrSomm, descrTot, dateDebut, dateFin, actif, imagePath);
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
/*!50003 DROP PROCEDURE IF EXISTS `DeleteEvent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteEvent`(IN inEventId INT(11))
BEGIN
	DELETE FROM calendarevent WHERE eventId = inEventId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteFeuillet` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteFeuillet`(IN inFeuilletId INT(11))
BEGIN
	DELETE FROM feuillet WHERE FeuilletId = inFeuilletId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteFormBenevolat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteFormBenevolat`(IN inFormId INT(11))
BEGIN
	DELETE FROM formulairebenevolat 
    WHERE formulaireid = inFormId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteFormContact` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteFormContact`(IN inFormId INT(11))
BEGIN
	DELETE FROM formulairecontact 
    WHERE  formulaireid = inFormId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteFormEnfant` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteFormEnfant`(IN inFormId INT(11))
BEGIN
	DELETE FROM formulaireenfant
    WHERE formulaireid = inFormId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteNouvelles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteNouvelles`(
	in nouvelleId INT(11))
BEGIN
DELETE FROM `nouvelles` WHERE nouvellesId = nouvelleId;
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
/*!50003 DROP PROCEDURE IF EXISTS `FormulaireContactSave` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `FormulaireContactSave`(IN inPrenom VARBINARY(1000), IN inNom VARBINARY(1000), IN inCourriel VARBINARY(1000), IN inTelephone VARBINARY(1000), IN inMessage VARCHAR(8000), IN inKey VARBINARY(1000), IN inIv VARBINARY(1000))
BEGIN
	INSERT INTO formulairecontact (prenom, nom, courriel, telephone, message, formulairecontact.key, iv)
    VALUES (inPrenom, inNom, inCourriel, inTelephone, inMessage, inKey, inIv);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `FormulaireEnfantSave` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `FormulaireEnfantSave`(IN inName VARBINARY(1000), IN inAdresse VARBINARY(1000), IN inCodePostal VARBINARY(1000), IN inCourriel VARBINARY(1000), IN inDateNaissance VARBINARY(1000),
																	  IN inNomPere VARBINARY(1000), IN inTelPere VARBINARY(1000), IN inNomMere VARBINARY(1000), IN inTelMere VARBINARY(1000), IN inBapteme VARCHAR(500), IN inPardon VARCHAR(500), IN inEucharistie VARCHAR(500), IN inAllergies VARCHAR(500),
                                                                      IN inParoisseId INT(11), IN inCommunauteId INT(11),IN inInitiation TINYINT(4), IN inPtitePasto TINYINT(4), IN inAgnelets TINYINT(4), IN inPremierPardon TINYINT(4), IN inPremiereCommunion TINYINT(4), IN inConfirmation TINYINT(4), IN inBrebis TINYINT(4),
                                                                      IN inKey VARBINARY(1000), IN inIV VARBINARY(1000))
BEGIN
	INSERT INTO formulaireenfant
	(`nom`,
	`adresse`,
	`codepostal`,
	`courriel`,
	`datenaissance`,
	`nompere`,
	`telpere`,
	`nommere`,
	`telmere`,
	`bapteme`,
	`pardon`,
    `eucharistie`,
    `allergies`,
    `paroisseid`,
    `communauteid`,
	`initiation`,
	`ptitepasto`,
	`agnelets`,
	`premierpardon`,
	`premierecommunion`,
	`confirmation`,
	`brebis`,	
    `key`,
    `iv`)
	VALUES
	(inName,
	inAdresse,
	inCodePostal,
	inCourriel,
	inDateNaissance,
	inNomPere,
	inTelPere,
    inNomMere,
    inTelMere,
	inBapteme,
	inPardon,
	inEucharistie,
    inAllergies,
	inParoisseId,
    inCommunauteId,
	inInitiation,
	inPtitePasto,
	inAgnelets,
	inPremierPardon,
	inPremiereCommunion,
	inConfirmation,
	inBrebis,
    inKey,
    inIV);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAccueil` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAccueil`()
BEGIN
	select imageHomeliePath, imageTemoignagePath, videoBienvenuePath, imageFormulairePath from accueil order by accueilId desc limit 1;
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
/*!50003 DROP PROCEDURE IF EXISTS `GetAllFeuillet` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllFeuillet`()
BEGIN
	select feuilletId, pdfPath, pdfName, Actif, orderDisplay, size from feuillet where Actif = 1 order by orderDisplay;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllFeuilletEdit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllFeuilletEdit`()
BEGIN
	select feuilletId, pdfPath, pdfName, Actif, orderDisplay, size from feuillet  order by  orderDisplay , Actif;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllFormBenevolat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllFormBenevolat`()
BEGIN
	SELECT formulaireid, courriel, paroisse.nom as 'nomparoisse', formulairebenevolat.key, iv 
    FROM formulairebenevolat
    LEFT JOIN paroisse ON paroisse.paroisseid = formulairebenevolat.paroisseid
    ORDER BY formulaireid DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllFormContact` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllFormContact`()
BEGIN
	SELECT *
    FROM formulairecontact 
    ORDER BY formulaireid DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllFormEnfant` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllFormEnfant`()
BEGIN
	SELECT communaute.nom as 'communauteid', formulaireid, formulaireenfant.nom, adresse, codepostal, courriel,
	   datenaissance, nompere, telpere, nommere, telmere, bapteme, pardon, eucharistie, allergies, formulaireenfant.paroisseid, 
       initiation, ptitepasto, agnelets, premierpardon, premierecommunion, confirmation, brebis, formulaireenfant.key, iv 
	FROM formulaireenfant
	LEFT JOIN communaute ON communaute.communauteid = formulaireenfant.communauteid
    ORDER BY formulaireid DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllNouvelles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllNouvelles`()
BEGIN
	SELECT  nouvellesId, title, descrSomm, descrTot, dateDebut, dateFin, actif, imagePath from nouvelles order by actif desc, dateDebut, dateFin;
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
/*!50003 DROP PROCEDURE IF EXISTS `GetCommunitySchedule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCommunitySchedule`(IN inCommunityId INT(11))
BEGIN
	SELECT scheduleid, schedule, communityid FROM communityschedule WHERE communityid = inCommunityId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetFeuillet` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetFeuillet`(in inFeuilletId int)
BEGIN
	select feuilletId, pdfPath, pdfName, Actif, orderDisplay, size from feuillet where feuilletId = inFeuilletId;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetFormBenevolat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetFormBenevolat`(IN inFormId INT(11))
BEGIN
	SELECT * FROM formulairebenevolat WHERE formulaireid = inFormId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetFormContact` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetFormContact`(IN inFormId INT(11))
BEGIN
	SELECT * FROM formulairecontact WHERE formulaireid = inFormId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetFormEnfant` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetFormEnfant`(IN inFormId INT(11))
BEGIN
	SELECT communauteid, formulaireid, nom, adresse, codepostal, courriel,
	   datenaissance, nompere, telpere, nommere, telmere, bapteme, pardon, eucharistie, allergies, paroisseid, 
       initiation, ptitepasto, agnelets, premierpardon, premierecommunion, confirmation, brebis, formulaireenfant.key, iv 
	FROM formulaireenfant
    WHERE formulaireid = inFormId;
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
/*!50003 DROP PROCEDURE IF EXISTS `GetNouvelle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetNouvelle`(
	in nouvelleId int(11))
BEGIN
	select nouvellesId, title, descrSomm, descrTot, dateDebut, dateFin, actif, imagePath from nouvelles where nouvellesId = nouvelleId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetNouvellesBandeau` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetNouvellesBandeau`()
BEGIN
DECLARE x INT DEFAULT 0;
DECLARE y INT DEFAULT 0;

set x = (select count(nouvellesId) from nouvelles where actif = 1);
set x = (if (x <= 5, x, 5));
set y = 5 - x;


(select nouvellesId, title, descrSomm, descrTot, dateDebut, dateFin, actif, imagePath
from nouvelles
where actif = 1 
limit x)
union
(select nouvellesId, title, descrSomm, descrTot, dateDebut, dateFin, actif, imagePath
from nouvelles
where actif = 0 and dateDebut >= UNIX_TIMESTAMP(CURDATE()) and dateFin <= UNIX_TIMESTAMP(CURDATE())  
limit y)
order by actif desc , dateDebut,dateFin;
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
/*!50003 DROP PROCEDURE IF EXISTS `SaveCommunitySchedule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SaveCommunitySchedule`(IN inScheduleId INT(11), IN inSchedule LONGTEXT, IN inCommunityId INT(11))
BEGIN
	INSERT INTO communityschedule(schedule, communityid) SELECT inSchedule, inCommunityId WHERE inScheduleId = 0;
    
    UPDATE communityschedule SET schedule = inSchedule WHERE scheduleid = inScheduleId;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SavePageContentTemplateText`(IN inContentId INT(11), IN inMenuId INT(11), IN inTitle LONGTEXT, IN inHeader LONGTEXT, IN inSubtitle LONGTEXT, IN inContent LONGTEXT)
BEGIN
	INSERT INTO pagecontenttemplatetext(menuid, title, header, subtitle, content) SELECT inMenuId, inTitle, inHeader, inSubtitle, inContent WHERE inContentId = 0;
    
    UPDATE pagecontenttemplatetext SET title = inTitle, header = inHeader, subtitle = inSubtitle, content = inContent WHERE menuid = inMenuId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateEvent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateEvent`(IN inEventId INT(11), IN inName VARCHAR(100), IN inDate VARCHAR(100), IN inDescr VARCHAR(500), IN inColor VARCHAR(50), IN inIcon VARCHAR(50))
BEGIN
	UPDATE calendarevent SET name= inName, descr = inDescr, date = inDate, color = inColor, icon = inIcon WHERE eventId = inEventId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateFeuillet` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateFeuillet`(in inFeuilletId int, in inActif tinyint, in inOrderDisplay int)
BEGIN
	update feuillet
    SET 
        Actif 		 = inActif,
        orderDisplay = inOrderDisplay
        
	WHERE
     feuilletId= inFeuilletId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateimageAccueil` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateimageAccueil`(IN inImageHomeliePath VARCHAR(200), IN inImageTemoignagePath VARCHAR(200), IN inVideoBienvenuePath VARCHAR(200), IN inImageFormulairePath VARCHAR(200))
BEGIN
	UPDATE accueil SET imageHomeliePath= inImageHomeliePath, imageTemoignagePath = inImageTemoignagePath, videoBienvenuePath = inVideoBienvenuePath, imageFormulairePath = inImageFormulairePath WHERE accueilId = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateImageFormulaire` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateImageFormulaire`(in inImageFormulairePath varchar(500))
BEGIN
	update accueil
    SET         
        imageFormulairePath = inImageFormulairePath
        
	WHERE
     accueilId= 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateImageHomelie` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateImageHomelie`(in inImageHomeliePath varchar(500))
BEGIN
	update accueil
    SET         
        imageHomeliePath = inImageHomeliePath
        
	WHERE
     accueilId= 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateImageNouvelle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateImageNouvelle`(in inNouvellesId int(11), in inImagePath varchar(500))
BEGIN
	update `nouvelles`
    SET 
		imagePath = inImagePath
	WHERE
    nouvellesId = inNouvellesId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateImageTemoignage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateImageTemoignage`(in inImageTemoignagePath varchar(500))
BEGIN
	update accueil
    SET         
        imageTemoignagePath = inImageTemoignagePath
        
	WHERE
     accueilId= 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateImageTemplateText` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateImageTemplateText`(IN inMenuId INT(11), IN inImagePath varchar(500))
BEGIN
	INSERT INTO pagecontenttemplatetext(menuid, image ) SELECT inMenuId,  inImagePath WHERE inMenuId not in (select menuId from pageContentTemplateText);
    
    UPDATE pagecontenttemplatetext SET image = inImagePath WHERE menuid = inMenuId ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateNouvelles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateNouvelles`(
	in inNouvelleId int(11), 
    in inTitle varchar(50),
	in inDescrSomm VARCHAR(100),
	in inDescrTot LONGTEXT,
	in inDateDebut INT(11),
	in inDateFin INT(11),
	in inActif tinyint)
BEGIN
	update `nouvelles`
    SET 
		title = inTitle,
		descrSomm = inDescrSomm,
		descrTot = inDescrTot,
		dateDebut = inDateDebut,
		dateFin = inDateFin,
		actif = inActif
		
	WHERE
    nouvellesId = inNouvelleId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateVideoBienvenue` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateVideoBienvenue`(in inVideoBienvenuePath varchar(500))
BEGIN
	update accueil
    SET         
        videoBienvenuePath = inVideoBienvenuePath
        
	WHERE
     accueilId= 1;
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

-- Dump completed on 2020-05-16 13:07:17
