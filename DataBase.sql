CREATE DATABASE  IF NOT EXISTS `devenirdisciple.org` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `devenirdisciple.org`;
-- MySQL dump 10.13  Distrib 5.7.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: devenirdisciple.org
-- ------------------------------------------------------
-- Server version	5.7.21

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
  `sequence` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`menuId`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'0','Accueil','Accueil/Accueil.php',0),(2,'0','Paroisses-Communautés','ParoissesCommunaute/ParoissesCommunaute.php',0),(3,'0','Sacrements','Sacrements/Sacrements.php',0),(4,'0','Chemins de foi','CheminsDeFoi/CheminsDeFoi.php',0),(5,'0','Funérailles','Funerailles/Funerailles.php',0),(6,'0','Feuillets','Feuillets/Feuillets.php',0),(7,'0','Financement','Financement/Financement.php',0),(8,'2','Assomption de la BVM (St-Georges-de-Sartigan)','Financement/Financement.php',0),(9,'2','Notre-Dame-de-la-Providence (St-Georges-de-Sartigan)','ParoissesCommunaute/ParoissesCommunaute.php',0),(10,'2','Saint-Benjamin (St-Georges-de-Sartigan)','ParoissesCommunaute/ParoissesCommunaute.php',0),(11,'2','Saint-Côme (St-Georges-de-Sartigan)','ParoissesCommunaute/ParoissesCommunaute.php',0),(12,'2','Sainte-Aurélie (St-Georges-de-Sartigan)','ParoissesCommunaute/ParoissesCommunaute.php',0),(13,'2','Saint-Gédéon (Saint-Jean-Paul II)','ParoissesCommunaute/ParoissesCommunaute.php',0),(14,'2','Saint-Georges (St-Georges-de-Sartigan)','ParoissesCommunaute/ParoissesCommunaute.php',0),(15,'2','Saint-Jean-de-la-Lande (St-Georges-de-Sartigan)','ParoissesCommunaute/ParoissesCommunaute.php',0),(16,'2','Saint-Ludger (Saint-Jean-Paul II)','ParoissesCommunaute/ParoissesCommunaute.php',0),(17,'2','Saint-Martin (Saint-Jean-Paul II)','ParoissesCommunaute/ParoissesCommunaute.php',0),(18,'2','Saint-Philibert (St-Georges-de-Sartigan)','ParoissesCommunaute/ParoissesCommunaute.php',0),(19,'2','Saint-Prosper (St-Georges-de-Sartigan)','ParoissesCommunaute/ParoissesCommunaute.php',0),(20,'2','Saint-René-Goupil (St-Georges-de-Sartigan)','ParoissesCommunaute/ParoissesCommunaute.php',0),(21,'2','Saint-Robert-Bellarmin (Saint-Jean-Paul II)','ParoissesCommunaute/ParoissesCommunaute.php',0),(22,'2','Saint-Simon (St-Georges-de-Sartigan)','ParoissesCommunaute/ParoissesCommunaute.php',0),(23,'2','Saint-Théophile (Saint-Jean-Paul II)','ParoissesCommunaute/ParoissesCommunaute.php',0),(24,'2','Saint-Zacharie (St-Georges-de-Sartigan)','ParoissesCommunaute/ParoissesCommunaute.php',0),(25,'3','Baptême','Sacrements/Sacrements.php',1),(26,'3','Premier pardon - réconciliation','Sacrements/Sacrements.php',2),(27,'3','Première communion','Sacrements/Sacrements.php',3),(28,'3','Confirmation','Sacrements/Sacrements.php',4),(29,'3','Mariage','Sacrements/Sacrements.php',5),(30,'3','Onction des malades','Sacrements/Sacrements.php',6),(31,'3','Initiation chrétienne des adultes','Sacrements/Sacrements.php',7),(32,'4','Liturgie','CheminsDeFoi/CheminsDeFoi.php',1),(33,'4','Enfants','CheminsDeFoi/CheminsDeFoi.php',2),(34,'4','Pastorale jeunesse','CheminsDeFoi/CheminsDeFoi.php',3),(35,'4','Équipes de fraternité','CheminsDeFoi/CheminsDeFoi.php',4),(36,'4','Croissance spirituelle','CheminsDeFoi/CheminsDeFoi.php',5),(37,'4','Comité Création Verte','CheminsDeFoi/CheminsDeFoi.php',6),(38,'4','Je veux m\'impliquer','CheminsDeFoi/CheminsDeFoi.php',7);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-12 13:02:29
