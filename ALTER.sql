-- MySQL Workbench Synchronization

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER TABLE `devenirdisciple.org`.`pagecontenttemplatetext` 
DROP FOREIGN KEY `FK_pageContentMenuid`;

CREATE TABLE IF NOT EXISTS `devenirdisciple.org`.`accueil` (
  `accueilId` INT(11) NOT NULL AUTO_INCREMENT,
  `imageHomeliePath` VARCHAR(200) NULL DEFAULT NULL,
  `imageTemoignagePath` VARCHAR(200) NULL DEFAULT NULL,
  `videoBienvenuePath` VARCHAR(200) NULL DEFAULT NULL,
  `imageFormulairePath` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`accueilId`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;

ALTER TABLE `devenirdisciple.org`.`calendarevent` 
ADD COLUMN `global` TINYINT(4) NOT NULL DEFAULT 0 AFTER `communityId`;

CREATE TABLE IF NOT EXISTS `devenirdisciple.org`.`communityschedule` (
  `scheduleid` INT(11) NOT NULL AUTO_INCREMENT,
  `schedule` LONGTEXT NOT NULL DEFAULT '',
  `communityid` INT(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`scheduleid`),
  INDEX `FK_community` (`communityid` ASC),
  CONSTRAINT `FK_community`
    FOREIGN KEY (`communityid`)
    REFERENCES `devenirdisciple.org`.`communaute` (`communauteid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `devenirdisciple.org`.`feuillet` (
  `feuilletId` INT(11) NOT NULL AUTO_INCREMENT,
  `pdfPath` VARCHAR(200) NULL DEFAULT NULL,
  `pdfName` VARCHAR(100) NULL DEFAULT NULL,
  `actif` TINYINT(4) NULL DEFAULT NULL,
  `orderDisplay` INT(11) NULL DEFAULT NULL,
  `size` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`feuilletId`))
ENGINE = InnoDB
AUTO_INCREMENT = 61
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `devenirdisciple.org`.`formulairecontact` (
  `formulaireid` INT(11) NOT NULL AUTO_INCREMENT,
  `prenom` VARBINARY(1000) NOT NULL DEFAULT '',
  `nom` VARBINARY(1000) NOT NULL DEFAULT '',
  `courriel` VARBINARY(1000) NOT NULL DEFAULT '',
  `telephone` VARBINARY(1000) NOT NULL DEFAULT '',
  `message` VARCHAR(8000) NOT NULL DEFAULT '',
  `key` VARBINARY(1000) NOT NULL DEFAULT '',
  `iv` VARBINARY(1000) NOT NULL DEFAULT '',
  PRIMARY KEY (`formulaireid`))
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `devenirdisciple.org`.`formulaireenfant` (
  `formulaireid` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARBINARY(1000) NOT NULL DEFAULT '',
  `adresse` VARBINARY(1000) NOT NULL DEFAULT '',
  `codepostal` VARBINARY(1000) NOT NULL DEFAULT '',
  `courriel` VARBINARY(1000) NOT NULL DEFAULT '',
  `datenaissance` VARBINARY(1000) NOT NULL DEFAULT '',
  `nompere` VARBINARY(1000) NOT NULL DEFAULT '',
  `telpere` VARBINARY(1000) NOT NULL DEFAULT '',
  `nommere` VARBINARY(1000) NOT NULL DEFAULT '',
  `telmere` VARBINARY(1000) NOT NULL DEFAULT '',
  `bapteme` VARCHAR(500) NOT NULL DEFAULT '',
  `pardon` VARCHAR(500) NOT NULL DEFAULT '',
  `eucharistie` VARCHAR(500) NOT NULL DEFAULT '',
  `allergies` VARCHAR(500) NOT NULL DEFAULT '',
  `paroisseid` INT(11) NOT NULL DEFAULT 0,
  `communauteid` INT(11) NOT NULL DEFAULT 0,
  `initiation` TINYINT(4) NOT NULL DEFAULT 0,
  `ptitepasto` TINYINT(4) NOT NULL DEFAULT 0,
  `agnelets` TINYINT(4) NOT NULL DEFAULT 0,
  `premierpardon` TINYINT(4) NOT NULL DEFAULT 0,
  `premierecommunion` TINYINT(4) NOT NULL DEFAULT 0,
  `confirmation` TINYINT(4) NOT NULL DEFAULT 0,
  `brebis` TINYINT(4) NOT NULL DEFAULT 0,
  `key` VARBINARY(1000) NOT NULL DEFAULT '0',
  `iv` VARBINARY(1000) NOT NULL DEFAULT '0',
  PRIMARY KEY (`formulaireid`))
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `devenirdisciple.org`.`imagemagasin` (
  `imageMagasinId` INT(11) NOT NULL AUTO_INCREMENT,
  `menuId` INT(11) NULL DEFAULT NULL,
  `imagePath` VARCHAR(200) NULL DEFAULT NULL,
  `imageName` VARCHAR(100) NULL DEFAULT NULL,
  `actif` TINYINT(4) NULL DEFAULT NULL,
  `orderDisplay` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`imageMagasinId`))
ENGINE = InnoDB
AUTO_INCREMENT = 28
DEFAULT CHARACTER SET = utf8;

ALTER TABLE `devenirdisciple.org`.`nouvelles` 
ENGINE = InnoDB ;

ALTER TABLE `devenirdisciple.org`.`pagecontenttemplatetext` 
CHANGE COLUMN `title` `title` LONGTEXT NOT NULL DEFAULT '' ,
CHANGE COLUMN `header` `header` LONGTEXT NOT NULL DEFAULT '' ,
CHANGE COLUMN `subtitle` `subtitle` LONGTEXT NOT NULL DEFAULT '' ,
DROP INDEX `FK_pageContentMenuid` ;
;


USE `devenirdisciple.org`;
DROP procedure IF EXISTS `devenirdisciple.org`.`AddEvent`;

DELIMITER $$
USE `devenirdisciple.org`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddEvent`(IN inName NVARCHAR(100), IN inDate NVARCHAR(100), IN inDescr NVARCHAR(500), IN inColor NVARCHAR(50), IN inIcon NVARCHAR(50), IN inCommunityID INT(11), IN inGlobal TINYINT)
BEGIN
	INSERT INTO calendarevent (name, date, descr, color, icon, communityId, global)
    VALUES (inName, inDate, inDescr, inColor, inIcon, inCommunityID, inGlobal);
END$$

DELIMITER ;

DELIMITER $$
USE `devenirdisciple.org`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddFeuillet`(in inPdfPath varchar(200),in inPdfName varchar(100), in inActif tinyint, in inOrderDisplay int, in inSize varchar(20))
BEGIN

insert into feuillet(pdfPath,pdfName, actif, orderDisplay, size)
    values (inPdfPath, inPdfName, inActif, inOrderDisplay, inSize);
END$$

DELIMITER ;

DELIMITER $$
USE `devenirdisciple.org`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddImageMagasin`(in inMenuId int(11), in inImagePath varchar(200),in inImageName varchar(100), in inActif tinyint, in inOrderDisplay int)
BEGIN

insert into imagemagasin(menuId, imagePath, imageName, actif, orderDisplay)
				values (inMenuId, inImagePath, inImageName, inActif, inOrderDisplay);
END$$

DELIMITER ;

USE `devenirdisciple.org`;
DROP procedure IF EXISTS `devenirdisciple.org`.`AddNouvelles`;

DELIMITER $$
USE `devenirdisciple.org`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddNouvelles`(
	in title varchar(50),
	descrSomm VARCHAR(100),
	descrTot LONGTEXT,
	dateDebut INT(11),
	dateFin INT(11),    
	actif tinyint)
BEGIN
	insert into nouvelles(title, descrSomm, descrTot, dateDebut, dateFin, actif, imagePath)
    values (title, descrSomm, descrTot, dateDebut, dateFin, actif, '');
END$$

DELIMITER ;

USE `devenirdisciple.org`;
DROP procedure IF EXISTS `devenirdisciple.org`.`ConnexionAdmin`;

DELIMITER $$
USE `devenirdisciple.org`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConnexionAdmin`(IN inEmail NVARCHAR(100), IN inPassword NVARCHAR(500), OUT AdminId INT)
BEGIN
	SET AdminId = 0;
	SET AdminId = (SELECT admin.adminId FROM admin WHERE admin.email = inEmail COLLATE utf8_general_ci AND admin.password LIKE BINARY inPassword);

    SELECT IF(ISNULL(AdminId) = 0, AdminId, 0) AS AdminId;
END$$

DELIMITER ;

DELIMITER $$
USE `devenirdisciple.org`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteEvent`(IN inEventId INT(11))
BEGIN
	DELETE FROM calendarevent WHERE eventId = inEventId;
END$$

DELIMITER ;

DELIMITER $$
USE `devenirdisciple.org`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteFeuillet`(IN inFeuilletId INT(11))
BEGIN
	DELETE FROM feuillet WHERE FeuilletId = inFeuilletId;
END$$

DELIMITER ;

DELIMITER $$
USE `devenirdisciple.org`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteFormBenevolat`(IN inFormId INT(11))
BEGIN
	DELETE FROM formulairebenevolat 
    WHERE formulaireid = inFormId;
END$$

DELIMITER ;

DELIMITER $$
USE `devenirdisciple.org`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteFormContact`(IN inFormId INT(11))
BEGIN
	DELETE FROM formulairecontact 
    WHERE  formulaireid = inFormId;
END$$

DELIMITER ;

DELIMITER $$
USE `devenirdisciple.org`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteFormEnfant`(IN inFormId INT(11))
BEGIN
	DELETE FROM formulaireenfant
    WHERE formulaireid = inFormId;
END$$

DELIMITER ;

DELIMITER $$
USE `devenirdisciple.org`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteImageMagasin`(IN inImageMagasinId INT(11))
BEGIN
	DELETE FROM imagemagasin WHERE imageMagasinId = inImageMagasinId;
END$$

DELIMITER ;

USE `devenirdisciple.org`;
DROP procedure IF EXISTS `devenirdisciple.org`.`DeleteNouvelles`;

DELIMITER $$
USE `devenirdisciple.org`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteNouvelles`(
	in nouvelleId INT(11))
BEGIN
DELETE FROM `nouvelles` WHERE nouvellesId = nouvelleId;
END$$

DELIMITER ;

USE `devenirdisciple.org`;
DROP procedure IF EXISTS `devenirdisciple.org`.`FormulaireBenevolatSave`;

DELIMITER $$
USE `devenirdisciple.org`$$
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

END$$

DELIMITER ;

DELIMITER $$
USE `devenirdisciple.org`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `FormulaireContactSave`(IN inPrenom VARBINARY(1000), IN inNom VARBINARY(1000), IN inCourriel VARBINARY(1000), IN inTelephone VARBINARY(1000), IN inMessage VARCHAR(8000), IN inKey VARBINARY(1000), IN inIv VARBINARY(1000))
BEGIN
	INSERT INTO formulairecontact (prenom, nom, courriel, telephone, message, formulairecontact.key, iv)
    VALUES (inPrenom, inNom, inCourriel, inTelephone, inMessage, inKey, inIv);
END$$

DELIMITER ;

DELIMITER $$
USE `devenirdisciple.org`$$
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

END$$

DELIMITER ;

DELIMITER $$
USE `devenirdisciple.org`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAccueil`()
BEGIN
	select imageHomeliePath, imageTemoignagePath, videoBienvenuePath, imageFormulairePath from accueil order by accueilId desc limit 1;
END$$

DELIMITER ;

USE `devenirdisciple.org`;
DROP procedure IF EXISTS `devenirdisciple.org`.`GetAllCommunauteOrderParoisse`;

DELIMITER $$
USE `devenirdisciple.org`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllCommunauteOrderParoisse`()
BEGIN
	SELECT nom, paroisseid, communauteid FROM communaute ORDER BY paroisseid, nom, communauteid;
END$$

DELIMITER ;

USE `devenirdisciple.org`;
DROP procedure IF EXISTS `devenirdisciple.org`.`GetAllEvents`;

DELIMITER $$
USE `devenirdisciple.org`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllEvents`(IN inCommunityId INT(11))
BEGIN
	SELECT eventId, name, descr, date, color, icon, communityId, global FROM calendarevent WHERE communityId = inCommunityId OR global = 1;
END$$

DELIMITER ;

DELIMITER $$
USE `devenirdisciple.org`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllFeuillet`()
BEGIN
	select feuilletId, pdfPath, pdfName, actif, orderDisplay, size from feuillet where actif = 1 order by orderDisplay;
END$$

DELIMITER ;

DELIMITER $$
USE `devenirdisciple.org`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllFeuilletEdit`()
BEGIN
	select feuilletId, pdfPath, pdfName, actif, orderDisplay, size from feuillet  order by  orderDisplay , Actif;
END$$

DELIMITER ;

DELIMITER $$
USE `devenirdisciple.org`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllFormBenevolat`()
BEGIN
	SELECT formulaireid, courriel, paroisse.nom as 'nomparoisse', formulairebenevolat.key, iv 
    FROM formulairebenevolat
    LEFT JOIN paroisse ON paroisse.paroisseid = formulairebenevolat.paroisseid
    ORDER BY formulaireid DESC;
END$$

DELIMITER ;

DELIMITER $$
USE `devenirdisciple.org`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllFormContact`()
BEGIN
	SELECT *
    FROM formulairecontact 
    ORDER BY formulaireid DESC;
END$$

DELIMITER ;

DELIMITER $$
USE `devenirdisciple.org`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllFormEnfant`()
BEGIN
	SELECT communaute.nom as 'communauteid', formulaireid, formulaireenfant.nom, adresse, codepostal, courriel,
	   datenaissance, nompere, telpere, nommere, telmere, bapteme, pardon, eucharistie, allergies, formulaireenfant.paroisseid, 
       initiation, ptitepasto, agnelets, premierpardon, premierecommunion, confirmation, brebis, formulaireenfant.key, iv 
	FROM formulaireenfant
	LEFT JOIN communaute ON communaute.communauteid = formulaireenfant.communauteid
    ORDER BY formulaireid DESC;
END$$

DELIMITER ;

DELIMITER $$
USE `devenirdisciple.org`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllImageMagasin`()
BEGIN
	select imageMagasinId, menuId, imagePath, imageName, actif, orderDisplay from imagemagasin where actif = 1 order by orderDisplay;
      
END$$

DELIMITER ;

DELIMITER $$
USE `devenirdisciple.org`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllImageMagasinEdit`()
BEGIN
	select imageMagasinId, menuId, imagePath, imageName, actif, orderDisplay from imagemagasin  order by  orderDisplay , actif;
END$$

DELIMITER ;

USE `devenirdisciple.org`;
DROP procedure IF EXISTS `devenirdisciple.org`.`GetAllNouvelles`;

DELIMITER $$
USE `devenirdisciple.org`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllNouvelles`()
BEGIN
	SELECT  nouvellesId, title, descrSomm, descrTot, dateDebut, dateFin, actif, imagePath
    FROM nouvelles
    WHERE (dateDebut >= UNIX_TIMESTAMP(CURDATE()) AND dateFin <= UNIX_TIMESTAMP(CURDATE())) OR actif = 1
    ORDER BY actif DESC, dateDebut, dateFin;
END$$

DELIMITER ;

DELIMITER $$
USE `devenirdisciple.org`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllNouvellesEdit`()
BEGIN
	SELECT  nouvellesId, title, descrSomm, descrTot, dateDebut, dateFin, actif, imagePath
    FROM nouvelles
    ORDER BY actif DESC, dateDebut, dateFin;
END$$

DELIMITER ;

USE `devenirdisciple.org`;
DROP procedure IF EXISTS `devenirdisciple.org`.`GetAllParoisse`;

DELIMITER $$
USE `devenirdisciple.org`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllParoisse`()
BEGIN
	SELECT nom, paroisseid FROM paroisse ORDER BY nom, paroisseid;
END$$

DELIMITER ;

USE `devenirdisciple.org`;
DROP procedure IF EXISTS `devenirdisciple.org`.`GetCommunityID`;

DELIMITER $$
USE `devenirdisciple.org`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCommunityID`(IN inMenuID INT(11))
BEGIN
	SELECT communauteid, nom FROM communaute WHERE menuid = inMenuID;
END$$

DELIMITER ;

DELIMITER $$
USE `devenirdisciple.org`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCommunityName`(IN inCommunityId INT(11))
BEGIN
	SELECT nom 
    FROM communaute 
    WHERE communauteid = inCommunityId;
END$$

DELIMITER ;

DELIMITER $$
USE `devenirdisciple.org`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCommunitySchedule`(IN inCommunityId INT(11))
BEGIN
	SELECT scheduleid, schedule, communityid FROM communityschedule WHERE communityid = inCommunityId;
END$$

DELIMITER ;

DELIMITER $$
USE `devenirdisciple.org`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetFeuillet`(in inFeuilletId int)
BEGIN
	select feuilletId, pdfPath, pdfName, actif, orderDisplay, size from feuillet where feuilletId = inFeuilletId;
    
END$$

DELIMITER ;

DELIMITER $$
USE `devenirdisciple.org`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetFormBenevolat`(IN inFormId INT(11))
BEGIN
	SELECT * FROM formulairebenevolat WHERE formulaireid = inFormId;
END$$

DELIMITER ;

DELIMITER $$
USE `devenirdisciple.org`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetFormContact`(IN inFormId INT(11))
BEGIN
	SELECT * FROM formulairecontact WHERE formulaireid = inFormId;
END$$

DELIMITER ;

DELIMITER $$
USE `devenirdisciple.org`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetFormEnfant`(IN inFormId INT(11))
BEGIN
	SELECT communauteid, formulaireid, nom, adresse, codepostal, courriel,
	   datenaissance, nompere, telpere, nommere, telmere, bapteme, pardon, eucharistie, allergies, paroisseid, 
       initiation, ptitepasto, agnelets, premierpardon, premierecommunion, confirmation, brebis, formulaireenfant.key, iv 
	FROM formulaireenfant
    WHERE formulaireid = inFormId;
END$$

DELIMITER ;

DELIMITER $$
USE `devenirdisciple.org`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetImageMagasin`(in inImageMagasinId int)
BEGIN	
    select imageMagasinId, menuId, imagePath, imageName, actif, orderDisplay from imagemagasin  where imageMagasinId = inImageMagasinId;
END$$

DELIMITER ;

USE `devenirdisciple.org`;
DROP procedure IF EXISTS `devenirdisciple.org`.`GetMenus`;

DELIMITER $$
USE `devenirdisciple.org`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetMenus`(IN inParentid INT(11))
BEGIN
  SELECT menu.menuId, menu.name, menu.redirectionPath FROM menu WHERE parentId = inParentid ORDER BY sequence, name;
END$$

DELIMITER ;

USE `devenirdisciple.org`;
DROP procedure IF EXISTS `devenirdisciple.org`.`GetNouvelle`;

DELIMITER $$
USE `devenirdisciple.org`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetNouvelle`(
	in nouvelleId int(11))
BEGIN
	select nouvellesId, title, descrSomm, descrTot, dateDebut, dateFin, actif, imagePath from nouvelles where nouvellesId = nouvelleId;
END$$

DELIMITER ;

USE `devenirdisciple.org`;
DROP procedure IF EXISTS `devenirdisciple.org`.`GetNouvellesBandeau`;

DELIMITER $$
USE `devenirdisciple.org`$$
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
END$$

DELIMITER ;

USE `devenirdisciple.org`;
DROP procedure IF EXISTS `devenirdisciple.org`.`GetPageContentTemplateText`;

DELIMITER $$
USE `devenirdisciple.org`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetPageContentTemplateText`(IN inMenuId INT(11))
BEGIN
	SELECT pagecontenttemplatetextid, menuid, image, title, header, subtitle, content FROM pagecontenttemplatetext WHERE menuid = inMenuId;
END$$

DELIMITER ;

DELIMITER $$
USE `devenirdisciple.org`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SaveCommunitySchedule`(IN inScheduleId INT(11), IN inSchedule LONGTEXT, IN inCommunityId INT(11))
BEGIN
	INSERT INTO communityschedule(schedule, communityid) SELECT inSchedule, inCommunityId WHERE inScheduleId = 0;
    
    UPDATE communityschedule SET schedule = inSchedule WHERE scheduleid = inScheduleId;
END$$

DELIMITER ;

DELIMITER $$
USE `devenirdisciple.org`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SavePageContentTemplateText`(IN inContentId INT(11), IN inMenuId INT(11), IN inTitle LONGTEXT, IN inHeader LONGTEXT, IN inSubtitle LONGTEXT, IN inContent LONGTEXT)
BEGIN
	INSERT INTO pagecontenttemplatetext(menuid, title, header, subtitle, content) SELECT inMenuId, inTitle, inHeader, inSubtitle, inContent WHERE inContentId = 0;
    
    UPDATE pagecontenttemplatetext SET title = inTitle, header = inHeader, subtitle = inSubtitle, content = inContent WHERE menuid = inMenuId;
END$$

DELIMITER ;

DELIMITER $$
USE `devenirdisciple.org`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateEvent`(IN inEventId INT(11), IN inName VARCHAR(100), IN inDate VARCHAR(100), IN inDescr VARCHAR(500), IN inColor VARCHAR(50), IN inIcon VARCHAR(50), IN inGlobal TINYINT)
BEGIN
	UPDATE calendarevent SET name= inName, descr = inDescr, date = inDate, color = inColor, icon = inIcon, global = inGlobal WHERE eventId = inEventId;
END$$

DELIMITER ;

DELIMITER $$
USE `devenirdisciple.org`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateFeuillet`(in inFeuilletId int, in inActif tinyint, in inOrderDisplay int)
BEGIN
	update feuillet
    SET 
        actif 		 = inActif,
        orderDisplay = inOrderDisplay
        
	WHERE
     feuilletId= inFeuilletId;
END$$

DELIMITER ;

DELIMITER $$
USE `devenirdisciple.org`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateImageFormulaire`(in inImageFormulairePath varchar(500))
BEGIN
	update accueil
    SET         
        imageFormulairePath = inImageFormulairePath
        
	WHERE
     accueilId= 1;
END$$

DELIMITER ;

DELIMITER $$
USE `devenirdisciple.org`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateImageHomelie`(in inImageHomeliePath varchar(500))
BEGIN
	update accueil
    SET         
        imageHomeliePath = inImageHomeliePath
        
	WHERE
     accueilId= 1;
END$$

DELIMITER ;

DELIMITER $$
USE `devenirdisciple.org`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateImageMagasin`(in inImageMagasinId int(11), in inActif tinyint, in inOrderDisplay int)
BEGIN
	update imagemagasin
    SET 
        actif 		 = inActif,
        orderDisplay = inOrderDisplay
        
	WHERE
     imageMagasinId= inImageMagasinId;
END$$

DELIMITER ;

DELIMITER $$
USE `devenirdisciple.org`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateImageNouvelle`(in inNouvellesId int(11), in inImagePath varchar(500))
BEGIN
	INSERT INTO `nouvelles`(title, descrSomm, descrTot, dateDebut, dateFin, actif, imagePath) SELECT 'Défault', '', '', unix_timestamp(curdate()), unix_timestamp(curdate()), 0, inImagePath WHERE inNouvellesId = 0;
	UPDATE `nouvelles`
    SET 
		imagePath = inImagePath
	WHERE
    nouvellesId = inNouvellesId;
END$$

DELIMITER ;

DELIMITER $$
USE `devenirdisciple.org`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateImageTemoignage`(in inImageTemoignagePath varchar(500))
BEGIN
	update accueil
    SET         
        imageTemoignagePath = inImageTemoignagePath
        
	WHERE
     accueilId= 1;
END$$

DELIMITER ;

DELIMITER $$
USE `devenirdisciple.org`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateImageTemplateText`(IN inMenuId INT(11), IN inImagePath varchar(500))
BEGIN
	INSERT INTO pagecontenttemplatetext(menuid, image ) SELECT inMenuId,  inImagePath WHERE inMenuId not in (select menuId from pageContentTemplateText);
    
    UPDATE pagecontenttemplatetext SET image = inImagePath WHERE menuid = inMenuId ;
END$$

DELIMITER ;

USE `devenirdisciple.org`;
DROP procedure IF EXISTS `devenirdisciple.org`.`UpdateNouvelles`;

DELIMITER $$
USE `devenirdisciple.org`$$
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
END$$

DELIMITER ;

DELIMITER $$
USE `devenirdisciple.org`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateVideoBienvenue`(in inVideoBienvenuePath varchar(500))
BEGIN
	update accueil
    SET         
        videoBienvenuePath = inVideoBienvenuePath
        
	WHERE
     accueilId= 1;
END$$

DELIMITER ;

DELIMITER $$
USE `devenirdisciple.org`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateimageAccueil`(IN inImageHomeliePath VARCHAR(200), IN inImageTemoignagePath VARCHAR(200), IN inVideoBienvenuePath VARCHAR(200), IN inImageFormulairePath VARCHAR(200))
BEGIN
	UPDATE accueil SET imageHomeliePath= inImageHomeliePath, imageTemoignagePath = inImageTemoignagePath, videoBienvenuePath = inVideoBienvenuePath, imageFormulairePath = inImageFormulairePath WHERE accueilId = 1;
END$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
