CREATE DATABASE  IF NOT EXISTS `devenirdisciple.org` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `devenirdisciple.org`;
-- MySQL dump 10.17  Distrib 10.3.20-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: devenirdisciple.org
-- ------------------------------------------------------
-- Server version	10.3.20-MariaDB

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
-- Table structure for table `formulairebenevolat`
--

DROP TABLE IF EXISTS `formulairebenevolat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formulairebenevolat` (
  `formulaireid` int(11) NOT NULL AUTO_INCREMENT,
  `prenom` varchar(50) NOT NULL DEFAULT '',
  `nom` varchar(50) NOT NULL DEFAULT '',
  `adresse` varchar(50) NOT NULL DEFAULT '',
  `telephone` varchar(50) NOT NULL DEFAULT '',
  `cellulaire` varchar(50) NOT NULL DEFAULT '',
  `courriel` varchar(100) NOT NULL DEFAULT '',
  `benevolat1` varchar(500) NOT NULL DEFAULT '',
  `benevolat2` varchar(500) NOT NULL DEFAULT '',
  `benevolat3` varchar(500) NOT NULL DEFAULT '',
  `benevolat4` varchar(500) NOT NULL DEFAULT '',
  `paroisseid` int(11) NOT NULL DEFAULT 0,
  `lundiam` tinyint(1) NOT NULL DEFAULT 0,
  `lundipm` tinyint(1) NOT NULL DEFAULT 0,
  `lundisoiree` tinyint(1) NOT NULL DEFAULT 0,
  `mardiam` tinyint(1) NOT NULL DEFAULT 0,
  `mardipm` tinyint(1) NOT NULL DEFAULT 0,
  `mardisoiree` tinyint(1) NOT NULL DEFAULT 0,
  `mercrediam` tinyint(1) NOT NULL DEFAULT 0,
  `mercredipm` tinyint(1) NOT NULL DEFAULT 0,
  `mercredisoiree` tinyint(1) NOT NULL DEFAULT 0,
  `jeudiam` tinyint(1) NOT NULL DEFAULT 0,
  `jeudipm` tinyint(1) NOT NULL DEFAULT 0,
  `jeudisoiree` tinyint(1) NOT NULL DEFAULT 0,
  `vendrediam` tinyint(1) NOT NULL DEFAULT 0,
  `vendredipm` tinyint(1) NOT NULL DEFAULT 0,
  `vendredisoiree` tinyint(1) NOT NULL DEFAULT 0,
  `samediam` tinyint(1) NOT NULL DEFAULT 0,
  `samedipm` tinyint(1) NOT NULL DEFAULT 0,
  `samedisoiree` tinyint(1) NOT NULL DEFAULT 0,
  `dimancheam` tinyint(1) NOT NULL DEFAULT 0,
  `dimanchepm` tinyint(1) NOT NULL DEFAULT 0,
  `dimanchesoiree` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`formulaireid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formulairebenevolat`
--

LOCK TABLES `formulairebenevolat` WRITE;
/*!40000 ALTER TABLE `formulairebenevolat` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'0','Accueil','Accueil/Accueil.php',0),(2,'0','Paroisses-Communautés','ParoissesCommunaute/ParoissesCommunaute.php',0),(3,'0','Sacrements','Sacrements/Sacrements.php',0),(4,'0','Chemins de foi','CheminsDeFoi/CheminsDeFoi.php',0),(5,'0','Funérailles','Funerailles/Funerailles.php',0),(6,'0','Feuillets','Feuillets/Feuillets.php',0),(7,'0','Financement','Financement/Financement.php',0),(8,'2','Assomption de la BVM (St-Georges-de-Sartigan)','Financement/Financement.php',0),(9,'2','Notre-Dame-de-la-Providence (St-Georges-de-Sartigan)','ParoissesCommunaute/ParoissesCommunaute.php',0),(10,'2','Saint-Benjamin (St-Georges-de-Sartigan)','ParoissesCommunaute/ParoissesCommunaute.php',0),(11,'2','Saint-Côme (St-Georges-de-Sartigan)','ParoissesCommunaute/ParoissesCommunaute.php',0),(12,'2','Sainte-Aurélie (St-Georges-de-Sartigan)','ParoissesCommunaute/ParoissesCommunaute.php',0),(13,'2','Saint-Gédéon (Saint-Jean-Paul II)','ParoissesCommunaute/ParoissesCommunaute.php',0),(14,'2','Saint-Georges (St-Georges-de-Sartigan)','ParoissesCommunaute/ParoissesCommunaute.php',0),(15,'2','Saint-Jean-de-la-Lande (St-Georges-de-Sartigan)','ParoissesCommunaute/ParoissesCommunaute.php',0),(16,'2','Saint-Ludger (Saint-Jean-Paul II)','ParoissesCommunaute/ParoissesCommunaute.php',0),(17,'2','Saint-Martin (Saint-Jean-Paul II)','ParoissesCommunaute/ParoissesCommunaute.php',0),(18,'2','Saint-Philibert (St-Georges-de-Sartigan)','ParoissesCommunaute/ParoissesCommunaute.php',0),(19,'2','Saint-Prosper (St-Georges-de-Sartigan)','ParoissesCommunaute/ParoissesCommunaute.php',0),(20,'2','Saint-René-Goupil (St-Georges-de-Sartigan)','ParoissesCommunaute/ParoissesCommunaute.php',0),(21,'2','Saint-Robert-Bellarmin (Saint-Jean-Paul II)','ParoissesCommunaute/ParoissesCommunaute.php',0),(22,'2','Saint-Simon (St-Georges-de-Sartigan)','ParoissesCommunaute/ParoissesCommunaute.php',0),(23,'2','Saint-Théophile (Saint-Jean-Paul II)','ParoissesCommunaute/ParoissesCommunaute.php',0),(24,'2','Saint-Zacharie (St-Georges-de-Sartigan)','ParoissesCommunaute/ParoissesCommunaute.php',0),(25,'3','Baptême','Sacrements/Sacrements.php',1),(26,'3','Premier pardon - réconciliation','Sacrements/Sacrements.php',2),(27,'3','Première communion','Sacrements/Sacrements.php',3),(28,'3','Confirmation','Sacrements/Sacrements.php',4),(29,'3','Mariage','Sacrements/Sacrements.php',5),(30,'3','Onction des malades','Sacrements/Sacrements.php',6),(31,'3','Initiation chrétienne des adultes','Sacrements/Sacrements.php',7),(32,'4','Liturgie','CheminsDeFoi/CheminsDeFoi.php',1),(33,'4','Enfants','CheminsDeFoi/CheminsDeFoi.php',2),(34,'4','Pastorale jeunesse','CheminsDeFoi/CheminsDeFoi.php',3),(35,'4','Équipes de fraternité','CheminsDeFoi/CheminsDeFoi.php',4),(36,'4','Croissance spirituelle','CheminsDeFoi/CheminsDeFoi.php',5),(37,'4','Comité Création Verte','CheminsDeFoi/CheminsDeFoi.php',6),(38,'4','Je veux m\'impliquer','CheminsDeFoi/JeVeuxMimpliquer.php',7);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'devenirdisciple.org'
--

--
-- Dumping routines for database 'devenirdisciple.org'
--
/*!50003 DROP PROCEDURE IF EXISTS `ConnexionAdmin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConnexionAdmin`(IN inEmail NVARCHAR(100), IN inPassword NVARCHAR(500), OUT AdminId INT)
BEGIN
	SET AdminId = 0;
	SET AdminId = (SELECT admin.adminId FROM admin WHERE admin.email = inEmail AND admin.password = inPassword);
    SELECT IF(ISNULL(AdminId) = 0, AdminId, 0) AS AdminId;
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

-- Dump completed on 2020-04-06 13:55:23
