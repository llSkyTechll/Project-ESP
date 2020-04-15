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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'0','Accueil','Accueil/Accueil.php',1),(2,'0','Paroisses-Communautés','ParoissesCommunaute/ParoissesCommunaute.php',2),(3,'0','Sacrements','Sacrements/Sacrements.php',3),(4,'0','Chemins de foi','CheminsDeFoi/CheminsDeFoi.php',4),(5,'0','Funérailles','Funerailles/Funerailles.php',5),(6,'0','Feuillets','Feuillets/Feuillets.php',6),(7,'0','Financement','Financement/Financement.php',7),(8,'2','St-Georges-de-Sartigan','ParoissesCommunaute/ParoissesCommunaute.php',2),(9,'2','Saint-Jean-Paul II','ParoissesCommunaute/ParoissesCommunaute.php',1),(10,'8','Saint-Benjamin','ParoissesCommunaute/ParoissesCommunaute.php',0),(11,'8','Saint-Côme','ParoissesCommunaute/ParoissesCommunaute.php',0),(12,'8','Sainte-Aurélie','ParoissesCommunaute/ParoissesCommunaute.php',0),(13,'9','Saint-Gédéon','ParoissesCommunaute/ParoissesCommunaute.php',0),(14,'8','Saint-Georges','ParoissesCommunaute/ParoissesCommunaute.php',0),(15,'8','Saint-Jean-de-la-Lande','ParoissesCommunaute/ParoissesCommunaute.php',0),(16,'9','Saint-Ludger','ParoissesCommunaute/ParoissesCommunaute.php',0),(17,'9','Saint-Martin','ParoissesCommunaute/ParoissesCommunaute.php',0),(18,'8','Saint-Philibert','ParoissesCommunaute/ParoissesCommunaute.php',0),(19,'8','Saint-Prosper','ParoissesCommunaute/ParoissesCommunaute.php',0),(20,'8','Saint-René-Goupil','ParoissesCommunaute/ParoissesCommunaute.php',0),(21,'9','Saint-Robert-Bellarmin','ParoissesCommunaute/ParoissesCommunaute.php',0),(22,'8','Saint-Simon','ParoissesCommunaute/ParoissesCommunaute.php',0),(23,'9','Saint-Théophile','ParoissesCommunaute/ParoissesCommunaute.php',0),(24,'8','Saint-Zacharie','ParoissesCommunaute/ParoissesCommunaute.php',0),(25,'3','Baptême','Sacrements/Sacrements.php',1),(26,'3','Premier pardon - réconciliation','Sacrements/Sacrements.php',2),(27,'3','Première communion','Sacrements/Sacrements.php',3),(28,'3','Confirmation','Sacrements/Sacrements.php',4),(29,'3','Mariage','Sacrements/Sacrements.php',5),(30,'3','Onction des malades','Sacrements/Sacrements.php',6),(31,'3','Initiation chrétienne des adultes','Sacrements/Sacrements.php',7),(32,'4','Liturgie','CheminsDeFoi/CheminsDeFoi.php',1),(33,'4','Enfants','CheminsDeFoi/CheminsDeFoi.php',2),(34,'4','Pastorale jeunesse','CheminsDeFoi/CheminsDeFoi.php',3),(35,'4','Équipes de fraternité','CheminsDeFoi/CheminsDeFoi.php',4),(36,'4','Croissance spirituelle','CheminsDeFoi/CheminsDeFoi.php',5),(37,'4','Comité Création Verte','CheminsDeFoi/CheminsDeFoi.php',6),(39,'8','Assomption de la BVM','ParoissesCommunaute/ParoissesCommunaute.php',0),(40,'8','Notre-Dame-de-la-Providence','Notre-Dame-de-la-Providence',0);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
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
/*!50003 DROP PROCEDURE IF EXISTS `ConnexionAdmin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 DROP PROCEDURE IF EXISTS `GetAllParoisse` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 DROP PROCEDURE IF EXISTS `GetMenus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-15 16:02:26
