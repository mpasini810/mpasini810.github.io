CREATE DATABASE  IF NOT EXISTS `TShirt` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `TShirt`;
-- MySQL dump 10.13  Distrib 5.7.12, for osx10.9 (x86_64)
--
-- Host: 127.0.0.1    Database: TShirt
-- ------------------------------------------------------
-- Server version	5.5.42

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
-- Table structure for table `OrderLines`
--

DROP TABLE IF EXISTS `OrderLines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrderLines` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Orders_ID` int(11) NOT NULL,
  `SKU` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Orders_ID` (`Orders_ID`),
  CONSTRAINT `orderlines_ibfk_1` FOREIGN KEY (`Orders_ID`) REFERENCES `Orders` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderLines`
--

LOCK TABLES `OrderLines` WRITE;
/*!40000 ALTER TABLE `OrderLines` DISABLE KEYS */;
INSERT INTO `OrderLines` VALUES (5,1,2004),(9,1,2005),(11,2,2003),(12,3,2010),(13,4,1007),(14,4,1008),(15,4,1009),(16,4,1010),(17,4,2010),(21,4,2010);
/*!40000 ALTER TABLE `OrderLines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Orders` (
  `ID` int(45) NOT NULL AUTO_INCREMENT,
  `User_ID` varchar(20) NOT NULL,
  `OrderDateandTime` datetime NOT NULL,
  `Total` decimal(5,2) NOT NULL,
  `ShippingAddress` varchar(255) NOT NULL DEFAULT '',
  `BillingAddress` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `Users` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (1,'dragmedaddy','2016-08-24 19:05:47',50.00,'656 Raphael Ct. Baltimore, MD, 55447','656 Raphael Ct. Baltimore, MD, 55447'),(2,'kappakeepo','2016-08-30 08:15:10',25.00,'78 Ali St. Bushwick, NY, 11237','78 Ali St. Bushwick, NY, 11237'),(3,'steamedhams','2017-01-30 10:25:37',35.00,'12 Knickerbocker Brooklyn, NY, 11206','12 Knickerbocker Brooklyn, NY, 11206'),(4,'kateisgr8','2017-02-15 09:10:30',170.00,'Cow Dr. Howell, MI, 48430','Cow Dr. Howell, MI, 48430'),(10,'kateisgr8','2016-12-30 21:49:05',0.00,'Cow Dr. Howell, MI, 48430','Cow Dr. Howell, MI, 48430');
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Shirts`
--

DROP TABLE IF EXISTS `Shirts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Shirts` (
  `SKU` int(11) NOT NULL,
  `Name` varchar(20) DEFAULT NULL,
  `Price` decimal(5,2) DEFAULT NULL,
  `Qtyinstock` tinyint(2) DEFAULT NULL,
  `Color` varchar(20) DEFAULT NULL,
  `Style` varchar(20) DEFAULT NULL,
  `Size` char(2) DEFAULT NULL,
  `Sex` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SKU`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Shirts`
--

LOCK TABLES `Shirts` WRITE;
/*!40000 ALTER TABLE `Shirts` DISABLE KEYS */;
INSERT INTO `Shirts` VALUES (1006,'Detox',25.00,5,'red','Busted','XS','M'),(1007,'Alaska',25.00,5,'lavender','Diva','S','M'),(1008,'Tatiana',25.00,5,'gold','Hussy','S','M'),(1009,'Carmen',25.00,1,'white','Hussy','XL','W'),(1010,'KimChi',25.00,1,'pink','Diva','XL','M'),(1030,'Willam',35.00,2,'scarlet','Hussy','XS','W'),(2001,'Sharon',25.00,5,'purple','Hoochie','S','M'),(2002,'Trixie',25.00,5,'pink','Hunty','M','M'),(2003,'Katya',25.00,5,'purple','Hunty','S','W'),(2004,'Latrice',25.00,5,'purple','Fishy','L','N'),(2005,'PhiPhi',25.00,5,'turquoise','Hoochie','XL','M'),(2007,'Detox',25.00,10,'purple','Busted','XS','N'),(2008,'Detox',25.00,5,'gold','Busted','S','N'),(2009,'Carmen',25.00,4,'pink','Hussy','M','M'),(2010,'KimChi',35.00,3,'turquoise','Diva','L','W');
/*!40000 ALTER TABLE `Shirts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `ID` varchar(20) NOT NULL DEFAULT '',
  `FirstName` varchar(20) DEFAULT NULL,
  `LastName` varchar(30) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `Password` varchar(16) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES ('dragmedaddy','Eric','Zhang','ericzz@gmail.com','screwyou810','3016789696'),('ihavegreenhair','Seto','Kaiba','money@gmail.com','ihateyugi','5558675310'),('kappakeepo','John','Lemay','johnrocks@gmail.com','i<3k8lol','8102348901'),('kateisgr8','Kate','Lemay','klemay@gmail.com','dogs4luv','6033915088'),('monstercard','Yugi','Muto','grandpa@gmail.com','whatever','5558675308'),('steamedhams','David','Zhang','davidz@gmail.com','dentalplan22','3016785454'),('whatisinaname','Paul','Schnauzer','paulisdead@gmail.com','wearegoing2moon','5558675309');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `menslowhigh`
--

DROP TABLE IF EXISTS `menslowhigh`;
/*!50001 DROP VIEW IF EXISTS `menslowhigh`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `menslowhigh` AS SELECT 
 1 AS `SKU`,
 1 AS `Name`,
 1 AS `Price`,
 1 AS `Qtyinstock`,
 1 AS `Color`,
 1 AS `Style`,
 1 AS `Size`,
 1 AS `Sex`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `usersbyname`
--

DROP TABLE IF EXISTS `usersbyname`;
/*!50001 DROP VIEW IF EXISTS `usersbyname`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `usersbyname` AS SELECT 
 1 AS `ID`,
 1 AS `FirstName`,
 1 AS `LastName`,
 1 AS `Email`,
 1 AS `Password`,
 1 AS `Phone`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `womenslowhigh`
--

DROP TABLE IF EXISTS `womenslowhigh`;
/*!50001 DROP VIEW IF EXISTS `womenslowhigh`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `womenslowhigh` AS SELECT 
 1 AS `SKU`,
 1 AS `Name`,
 1 AS `Price`,
 1 AS `Qtyinstock`,
 1 AS `Color`,
 1 AS `Style`,
 1 AS `Size`,
 1 AS `Sex`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'TShirt'
--

--
-- Dumping routines for database 'TShirt'
--
/*!50003 DROP FUNCTION IF EXISTS `CheckPassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `CheckPassword`(Username VARCHAR(20), Password VARCHAR(16)) RETURNS int(1)
    DETERMINISTIC
BEGIN
    DECLARE FOUND INT(1);
    
    SET FOUND = (SELECT COUNT(*) > 0 from Users where Users.`ID` = Username and Users.`Password` = Password);
    
    RETURN FOUND;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `NumberProducts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `NumberProducts`(CATEGORY VARCHAR(2)) RETURNS int(10)
    DETERMINISTIC
BEGIN
    DECLARE ProductCount INT(10);
    
    SET ProductCount = (SELECT COUNT(*) from Shirts where Shirts.`Sex` = CATEGORY);
    
    RETURN ProductCount;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddOrder`(in User_ID varchar(20), ShippingAddress varchar(255), BillingAddress varchar(255))
BEGIN
 
 INSERT INTO `Orders` (`User_ID`, `OrderDateandTime`, `Total`,`ShippingAddress`,`BillingAddress`)
 VALUES (User_ID, NOW(), 0, ShippingAddress, BillingAddress);
 
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NameandPrice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `NameandPrice`(in CATEGORY varchar(20))
BEGIN 

Select Name, Price FROM Shirts Where Sex = CATEGORY;

End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ProductDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ProductDetails`(in SKU int(11))
BEGIN 

Select Name, Price, Color, Style, Size, Sex from Shirts Where `Shirts`.`SKU` = SKU;

End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RecordPurchases` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RecordPurchases`(in `Orders_ID` int(11), `SKU` int(11))
BEGIN
 
 INSERT INTO `OrderLines` (`Orders_ID`, `SKU`)
 VALUES (Orders_ID, SKU);
 
 UPDATE `Orders`
 SET Orders.Total=Orders.Total+(select `Price` from `Shirts` where Shirts.SKU=SKU) 
 WHERE ID = Orders_ID;
 
 
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegisterUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegisterUser`(in ID varchar(20), in FirstName varchar(20), in LastName varchar(30), in Email varchar(30), in Password varchar(16), in Phone varchar(20))
BEGIN

    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
          ROLLBACK;
    END;

    START TRANSACTION;

  	INSERT INTO `Users` (`ID`,`FirstName`, `LastName`, `Email`, `Password`, `Phone`)
  	VALUES (ID, FirstName, LastName, Email, Password, Phone);

    COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdatePassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdatePassword`(in `Password` varchar(16), in `ID` varchar(20))
BEGIN
    
START TRANSACTION;  

UPDATE `Users`

SET Users.Password = Password

WHERE Users.ID = ID;
 
COMMIT;
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `menslowhigh`
--

/*!50001 DROP VIEW IF EXISTS `menslowhigh`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `menslowhigh` AS select `shirts`.`SKU` AS `SKU`,`shirts`.`Name` AS `Name`,`shirts`.`Price` AS `Price`,`shirts`.`Qtyinstock` AS `Qtyinstock`,`shirts`.`Color` AS `Color`,`shirts`.`Style` AS `Style`,`shirts`.`Size` AS `Size`,`shirts`.`Sex` AS `Sex` from `shirts` where (`shirts`.`Sex` in ('M','N')) order by 'Price' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `usersbyname`
--

/*!50001 DROP VIEW IF EXISTS `usersbyname`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `usersbyname` AS select `users`.`ID` AS `ID`,`users`.`FirstName` AS `FirstName`,`users`.`LastName` AS `LastName`,`users`.`Email` AS `Email`,`users`.`Password` AS `Password`,`users`.`Phone` AS `Phone` from `users` order by `users`.`LastName` desc,`users`.`FirstName` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `womenslowhigh`
--

/*!50001 DROP VIEW IF EXISTS `womenslowhigh`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `womenslowhigh` AS select `shirts`.`SKU` AS `SKU`,`shirts`.`Name` AS `Name`,`shirts`.`Price` AS `Price`,`shirts`.`Qtyinstock` AS `Qtyinstock`,`shirts`.`Color` AS `Color`,`shirts`.`Style` AS `Style`,`shirts`.`Size` AS `Size`,`shirts`.`Sex` AS `Sex` from `shirts` where (`shirts`.`Sex` in ('W','N')) order by 'Price' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-07 16:29:16
