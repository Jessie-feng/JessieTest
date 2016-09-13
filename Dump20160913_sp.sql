-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 192.168.99.85    Database: reports
-- ------------------------------------------------------
-- Server version	5.6.31-log

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED='762390a6-32dc-11e6-9e84-141877493164:2336979-2352848:2434364-2447023:2593369-2691745:2871418-6284545:6530093-6530098:6542816-6561425:6789821-12175757:12282881-12285015:12786452-14003091,
9ef73df4-47d4-11e6-a740-70e28406dc60:1-13555807';

--
-- Table structure for table `call_all_daily_log`
--

DROP TABLE IF EXISTS `call_all_daily_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `call_all_daily_log` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `log` varchar(255) DEFAULT NULL,
  `insertTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=568 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cust_applyTime`
--

DROP TABLE IF EXISTS `cust_applyTime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cust_applyTime` (
  `custInfoAudtWorkLogId` bigint(20) NOT NULL,
  `custId` bigint(20) NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`custInfoAudtWorkLogId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cust_firstLoan`
--

DROP TABLE IF EXISTS `cust_firstLoan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cust_firstLoan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '贷款id',
  `custId` bigint(20) NOT NULL COMMENT '用户id',
  `loanBorrowId` bigint(20) DEFAULT NULL,
  `borrowTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '贷款申请时间',
  `borrowAmount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '贷款本金',
  `borrowCharge` decimal(8,2) DEFAULT '0.00' COMMENT '借款手续费',
  `lastPayDate` date DEFAULT NULL COMMENT '最后还款日',
  `giveMoneyTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '银行放款时间',
  `repayTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '还款申请时间',
  `deductMoneyTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '银行扣款时间',
  `calWay` int(2) NOT NULL DEFAULT '1' COMMENT '计算方式',
  `chargeRate` decimal(10,6) NOT NULL COMMENT '手续费率',
  `interestRate` decimal(10,6) NOT NULL COMMENT '利率',
  `overdueFineRate` decimal(10,6) NOT NULL COMMENT '滞纳金率',
  `repayPrincipal` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '已付本金',
  `repayCharge` decimal(8,2) DEFAULT '0.00' COMMENT '已付还款手续费',
  `interest` decimal(8,2) DEFAULT '0.00' COMMENT '已付利息',
  `overdueFine` decimal(8,2) DEFAULT '0.00' COMMENT '已付滞纳金',
  `totalPaidAmount` decimal(10,2) DEFAULT '0.00' COMMENT '已付总金额',
  `dueTotalInterest` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '应付总利息(定时计算)',
  `dueTotalOverdueFine` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '应付总滞纳金(定时计算)',
  `overdueDays` int(11) NOT NULL DEFAULT '0' COMMENT '滞纳总天数(定时计算)',
  `remainingDays` int(11) NOT NULL DEFAULT '0' COMMENT '还款剩余天数(定时计算)',
  `totalRepayAmount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '应还款总金额(定时计算)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9033 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customServiceHour`
--

DROP TABLE IF EXISTS `customServiceHour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customServiceHour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `auditor` char(30) DEFAULT NULL,
  `auditorId` int(11) DEFAULT NULL,
  `hour` int(11) DEFAULT NULL,
  `hourCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5106 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_applyStepsRate`
--

DROP TABLE IF EXISTS `report_applyStepsRate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_applyStepsRate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `snapDate` date DEFAULT NULL,
  `applyDate` date DEFAULT NULL,
  `apply` int(20) DEFAULT NULL,
  `phoneListBlock` bigint(20) DEFAULT NULL,
  `blackListBlock` bigint(20) DEFAULT NULL,
  `threeAdrsBlock` bigint(20) DEFAULT NULL,
  `positionBlock` bigint(20) DEFAULT NULL,
  `antiFraud` bigint(20) DEFAULT NULL,
  `hegui` bigint(20) DEFAULT NULL,
  `waitForManualAudit` bigint(20) DEFAULT NULL,
  `manualAuditPass` bigint(20) DEFAULT NULL,
  `manualAuditFail` bigint(20) DEFAULT NULL,
  `yujinjian` bigint(20) DEFAULT NULL,
  `sendFile` bigint(20) DEFAULT NULL,
  `open` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2270 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_borrowPayCustCount`
--

DROP TABLE IF EXISTS `report_borrowPayCustCount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_borrowPayCustCount` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `borrowCustCount` bigint(20) DEFAULT NULL,
  `payCustCount` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_borrowPayFlow`
--

DROP TABLE IF EXISTS `report_borrowPayFlow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_borrowPayFlow` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `newCust` int(11) DEFAULT NULL,
  `oldCust` int(11) DEFAULT NULL,
  `newCustBorrow` decimal(10,2) DEFAULT NULL,
  `oldCustBorrow` decimal(10,2) DEFAULT NULL,
  `thisPay` decimal(10,2) DEFAULT NULL,
  `totalBalance` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=494 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_channel`
--

DROP TABLE IF EXISTS `report_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_channel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `watchDate` date DEFAULT NULL,
  `date` date DEFAULT NULL,
  `channel` varchar(45) DEFAULT NULL,
  `active` bigint(20) DEFAULT NULL,
  `register` bigint(20) DEFAULT NULL,
  `realName` bigint(20) DEFAULT NULL,
  `apply` bigint(20) DEFAULT NULL,
  `sendFile` bigint(20) DEFAULT NULL,
  `openAccount` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46248 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_customService`
--

DROP TABLE IF EXISTS `report_customService`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_customService` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `auditor` char(30) DEFAULT NULL,
  `auditorId` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=782 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_customServiceEfficiency`
--

DROP TABLE IF EXISTS `report_customServiceEfficiency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_customServiceEfficiency` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `auditor` char(30) DEFAULT NULL,
  `auditorId` int(11) DEFAULT NULL,
  `h0-9` int(11) DEFAULT NULL,
  `h10` int(11) DEFAULT NULL,
  `h11` int(11) DEFAULT NULL,
  `h12` int(11) DEFAULT NULL,
  `h13` int(11) DEFAULT NULL,
  `h14` int(11) DEFAULT NULL,
  `h15` int(11) DEFAULT NULL,
  `h16` int(11) DEFAULT NULL,
  `h17` int(11) DEFAULT NULL,
  `h18` int(11) DEFAULT NULL,
  `h19` int(11) DEFAULT NULL,
  `h20` int(11) DEFAULT NULL,
  `h21` int(11) DEFAULT NULL,
  `h21-24` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1119 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_ios_channel`
--

DROP TABLE IF EXISTS `report_ios_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_ios_channel` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `channel` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL,
  `clickNum` bigint(20) DEFAULT NULL,
  `activeNum` bigint(20) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_openBorrowRate`
--

DROP TABLE IF EXISTS `report_openBorrowRate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_openBorrowRate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `snapDate` date DEFAULT NULL,
  `date` date DEFAULT NULL,
  `todayOpen` bigint(20) DEFAULT NULL,
  `borrowInTodayOpen` bigint(20) DEFAULT NULL,
  `twoMonthsOpen` bigint(20) DEFAULT NULL,
  `borrowInTwoMonthsOpen` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=910 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_registerApply`
--

DROP TABLE IF EXISTS `report_registerApply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_registerApply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `watchDate` date DEFAULT NULL,
  `registerDate` date DEFAULT NULL,
  `register` bigint(20) DEFAULT NULL,
  `notApply` bigint(20) DEFAULT NULL,
  `onlyRegister` bigint(20) DEFAULT NULL,
  `onlyRealName` bigint(20) DEFAULT NULL,
  `realNameAndBankCard` bigint(20) DEFAULT NULL,
  `realNameAndBasicInfo` bigint(20) DEFAULT NULL,
  `realNameAndVedio` bigint(20) DEFAULT NULL,
  `noBankCard` bigint(20) DEFAULT NULL,
  `noBasicInfo` bigint(20) DEFAULT NULL,
  `noVedio` bigint(20) DEFAULT NULL,
  `allButSign` bigint(20) DEFAULT NULL,
  `realNameFailed` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2173 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_registerStepsRate`
--

DROP TABLE IF EXISTS `report_registerStepsRate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_registerStepsRate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `snapDate` date DEFAULT NULL,
  `registerDate` date DEFAULT NULL,
  `register` bigint(20) DEFAULT NULL,
  `fake` bigint(20) DEFAULT NULL,
  `apply` bigint(20) DEFAULT NULL,
  `antiFraud` bigint(20) DEFAULT NULL,
  `waitForManualAudit` bigint(20) DEFAULT NULL,
  `manualAuditPass` bigint(20) DEFAULT NULL,
  `manualAuditFail` bigint(20) DEFAULT NULL,
  `sendFile` bigint(20) DEFAULT NULL,
  `rulePass` bigint(20) DEFAULT NULL,
  `tongdun` bigint(20) DEFAULT NULL,
  `waitForComTel` bigint(20) DEFAULT NULL,
  `comTelFail` bigint(20) DEFAULT NULL,
  `comTelPend` bigint(20) DEFAULT NULL,
  `comTelPass` bigint(20) DEFAULT NULL,
  `waitForPerTel` bigint(20) DEFAULT NULL,
  `perTelFail` bigint(20) DEFAULT NULL,
  `perTelPend` bigint(20) DEFAULT NULL,
  `perTelPass` bigint(20) DEFAULT NULL,
  `open` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1994 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_sendStepsRate`
--

DROP TABLE IF EXISTS `report_sendStepsRate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_sendStepsRate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `snapDate` date DEFAULT NULL,
  `sendDate` date DEFAULT NULL,
  `send` bigint(20) DEFAULT NULL,
  `ruleReject` bigint(20) DEFAULT NULL,
  `ruleWait` bigint(20) DEFAULT NULL,
  `rulePass` bigint(20) DEFAULT NULL,
  `tongdun` bigint(20) DEFAULT NULL,
  `waitForComTel` bigint(20) DEFAULT NULL,
  `comTelFail` bigint(20) DEFAULT NULL,
  `comTelPend` bigint(20) DEFAULT NULL,
  `comTelPass` bigint(20) DEFAULT NULL,
  `waitForPerTel` bigint(20) DEFAULT NULL,
  `perTelFail` bigint(20) DEFAULT NULL,
  `perTelPend` bigint(20) DEFAULT NULL,
  `perTelPass` bigint(20) DEFAULT NULL,
  `open` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1791 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_stepsRate`
--

DROP TABLE IF EXISTS `report_stepsRate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_stepsRate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `watchDate` date DEFAULT NULL,
  `date` date DEFAULT NULL,
  `register` bigint(20) DEFAULT NULL,
  `fakeInRegister` bigint(20) DEFAULT NULL,
  `applyInRegister` bigint(20) DEFAULT NULL,
  `openInRegister` bigint(20) DEFAULT NULL,
  `apply` bigint(20) DEFAULT NULL,
  `antiFraudInApply` bigint(20) DEFAULT NULL,
  `manualAuditPassInApply` bigint(20) DEFAULT NULL,
  `sendFileInApply` bigint(20) DEFAULT NULL,
  `sendFile` bigint(20) DEFAULT NULL,
  `rulePassSendFile` bigint(20) DEFAULT NULL,
  `tongdunBlackListSendFile` bigint(20) DEFAULT NULL,
  `companyTelPassSendFile` bigint(20) DEFAULT NULL,
  `personalTelPassSendFile` bigint(20) DEFAULT NULL,
  `open` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2933 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stepsRate_1_register`
--

DROP TABLE IF EXISTS `stepsRate_1_register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stepsRate_1_register` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `watchDate` date DEFAULT NULL,
  `date` date DEFAULT NULL,
  `register` bigint(20) DEFAULT NULL,
  `fakeInRegister` bigint(20) DEFAULT NULL,
  `applyInRegister` bigint(20) DEFAULT NULL,
  `openInRegister` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2123 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stepsRate_2_apply`
--

DROP TABLE IF EXISTS `stepsRate_2_apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stepsRate_2_apply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `watchDate` date DEFAULT NULL,
  `date` date DEFAULT NULL,
  `apply` bigint(20) DEFAULT NULL,
  `antiFraudInApply` bigint(20) DEFAULT NULL,
  `manualAuditPassInApply` bigint(20) DEFAULT NULL,
  `sendFileInApply` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2042 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stepsRate_3_sendFile`
--

DROP TABLE IF EXISTS `stepsRate_3_sendFile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stepsRate_3_sendFile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `watchDate` date DEFAULT NULL,
  `date` date DEFAULT NULL,
  `sendFile` bigint(20) DEFAULT NULL,
  `rulePassSendFile` bigint(20) DEFAULT NULL,
  `tongdunBlackListSendFile` bigint(20) DEFAULT NULL,
  `companyTelPassSendFile` bigint(20) DEFAULT NULL,
  `personalTelPassSendFile` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1895 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stepsRate_4_open`
--

DROP TABLE IF EXISTS `stepsRate_4_open`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stepsRate_4_open` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `watchDate` date DEFAULT NULL,
  `date` date DEFAULT NULL,
  `open` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1930 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t3`
--

DROP TABLE IF EXISTS `t3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t3` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `totalBorrow`
--

DROP TABLE IF EXISTS `totalBorrow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `totalBorrow` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `todayBorrow` decimal(10,2) DEFAULT NULL,
  `todayPay` decimal(10,2) DEFAULT NULL,
  `todayBalance` decimal(10,2) DEFAULT NULL,
  `balance2monthAgo` decimal(10,2) DEFAULT NULL,
  `totalBalance` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6976 DEFAULT CHARSET=utf8 COMMENT='截止到每日贷款总余额表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tt`
--

DROP TABLE IF EXISTS `tt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tt` (
  `c1` int(4) DEFAULT NULL,
  `c2` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zSystemDate`
--

DROP TABLE IF EXISTS `zSystemDate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zSystemDate` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `day` date DEFAULT NULL,
  `insertTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'reports'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `NewEvent` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`loan`@`%`*/ /*!50106 EVENT `NewEvent` ON SCHEDULE EVERY 2 HOUR STARTS '2016-08-28 10:00:00' ON COMPLETION NOT PRESERVE ENABLE DO call `call_all_daily`() */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'reports'
--
/*!50003 DROP PROCEDURE IF EXISTS `call_all_daily` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`loan`@`%` PROCEDURE `call_all_daily`()
BEGIN
     declare oldReportDay date;
     declare synDay date;
     declare fn int(4);     
    -- select convert(max(insertTime),date) into oldReportDay from reports.call_all_daily_log;
   --  select convert(max(finishTime),date) into synDay from mydb.recovery;
   --  select status into fn from mydb.recovery where convert(finishTime,date) = synDay;
     
 -- if synDay = curdate() and fn = 1 and oldReportDay < curdate() then 
     
    delete from `reports`.`call_all_daily_log`;
    insert into `reports`.`call_all_daily_log`(log,insertTime) values("delete previous logs" , now());  
    
	call `reports`.`zSystemDate`();
    insert into `reports`.`call_all_daily_log`(log,insertTime) values("end: zSystemDate" , now()); 
    
	call `reports`.`update_cust_firstLoan_anytime`();
    insert into `reports`.`call_all_daily_log`(log,insertTime) values("end: update_cust_firstLoan_anytime",now());  
    
    call `reports`.`update_cust_applyTime_daily`();
    insert into `reports`.`call_all_daily_log`(log,insertTime) values("end: update_cust_applyTime_daily" , now());  
    
    call `reports`.`totalBorrow_anytime`();
    insert into `reports`.`call_all_daily_log`(log,insertTime) values("end: totalBorrow_anytime", now());   
    
    call `reports`.`report_borrowPayCustCount_anytime`();
    insert into `reports`.`call_all_daily_log`(log,insertTime) values("end: report_borrowPayCustCount_anytime", now()); 
    
    call `reports`.`report_borrowPayFlow_daily`();
    insert into `reports`.`call_all_daily_log`(log,insertTime) values("end: report_borrowPayFlow_daily", now()); 
    
    call `reports`.`report_openBorrowRate_daily`();
    insert into `reports`.`call_all_daily_log`(log,insertTime) values("end: report_openBorrowRate_daily", now());    
     
    call `reports`.`report_ios_channel`();
    insert into `reports`.`call_all_daily_log`(log,insertTime) values("end: report_ios_channel" , now());  
   
    call `reports`.`stepsRate_1_register_daily`();
    insert into `reports`.`call_all_daily_log`(log,insertTime) values("end: stepsRate_1_register_daily", now()); 
    
    call `reports`.`stepsRate_2_apply_daily`();
    insert into `reports`.`call_all_daily_log`(log,insertTime) values("end: stepsRate_2_apply_daily", now()); 
    
    call `reports`.`stepsRate_3_sendFile_daily`();
    insert into `reports`.`call_all_daily_log`(log,insertTime) values("end: stepsRate_3_sendFile_daily", now()); 
    
    call `reports`.`stepsRate_4_open_daily`();
    insert into `reports`.`call_all_daily_log`(log,insertTime) values("end: stepsRate_4_open_daily", now()); 
    
    call `reports`.`report_stepsRate_daily`();
    insert into `reports`.`call_all_daily_log`(log,insertTime) values("end: report_stepsRate_daily", now()); 
   
    call `reports`.`report_registerApply_daily`();
    insert into `reports`.`call_all_daily_log`(log,insertTime) values("end: report_registerApply_daily", now()); 
  
    call `reports`.`report_registerStepsRate_daily`();
    insert into `reports`.`call_all_daily_log`(log,insertTime) values("end: report_registerStepsRate_daily", now()); 
      
    call `reports`.`report_applyStepsRate_daily`();
    insert into `reports`.`call_all_daily_log`(log,insertTime) values("end: report_applyStepsRate_daily", now()); 
    
    call `reports`.`report_sendStepsRate_daily`();
    insert into `reports`.`call_all_daily_log`(log,insertTime) values("end: report_sendStepsRate_daily", now()); 
    
    call `reports`.`report_channel_daily`();
    insert into `reports`.`call_all_daily_log`(log,insertTime) values("end: report_channel_daily", now()); 
    
    call `reports`.`customServiceHourCount_daily`();
    insert into `reports`.`call_all_daily_log`(log,insertTime)values("end: customServiceHourCount_daily", now()); 
    
    call `reports`.`report_customServiceEfficiency_daily`();
    insert into `reports`.`call_all_daily_log`(log,insertTime) values("end: report_customServiceEfficiency_daily", now()); 
    
    call `reports`.`report_customService_daily`();
    insert into `reports`.`call_all_daily_log`(log,insertTime) values("end: report_customService_daily", now()); 
    
	insert into `reports`.`call_all_daily_log`(log,insertTime) values("Done", now()); 
    

 -- end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `customServiceHourCount_daily` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`loan`@`%` PROCEDURE `customServiceHourCount_daily`()
BEGIN
	declare showDate date;
  declare existMaxDate date;
  declare auditmaxDate date;  
  DECLARE Done INT DEFAULT 0;
    
	select max(date) into existMaxDate from `reports`.`customServiceHour`;
  select max(snapDate) into auditmaxDate from `reports`.`report_applyStepsRate`;
 -- select max(CONVERT(createTime,date)) into auditmaxDate from `loan`.`custInfoAudtWorkLog` where flag =250099;
  if existMaxDate is null then set existMaxDate = '2016-1-1'; end if;  
  
  
  if existMaxDate < auditmaxDate then 
  begin
     DECLARE rs CURSOR FOR SELECT distinct CONVERT(createTime,date) from `loan`.`custInfoAudtWorkLog` where flag =250099 and CONVERT(createTime,date) >existMaxDate;
		 DECLARE CONTINUE HANDLER FOR not found SET Done = true;
     OPEN rs;
		 FETCH rs INTO showDate;
     while (not done) do 
            insert into `reports`.`customServiceHour`(`date` ,`auditor` ,`auditorId` ,`hour`,`hourCount`)
            select 
               showDate, 
               createrName,
               createrId,
               extract(hour from createTime),
               count(*) as hourCount   
            from `loan`.`custInfoAudtWorkLog`
            where flag =250099 and CONVERT(createTime,date) = showDate
            group by createrId,extract(hour from createTime);
            
     FETCH rs INTO showDate;
     end while; 
     close rs;   
   end;
  end if;
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `report_applyStepsRate_daily` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`loan`@`%` PROCEDURE `report_applyStepsRate_daily`()
BEGIN
	declare applyDate DATE;
	declare showDate DATE;
	declare snapDate DATE;
	declare existMaxDate DATE;
	set applyDate = '2016-6-24';
	set showDate = applyDate;	
    
  select max(snapDate) into existMaxDate from `reports`.`report_applyStepsRate`;
  if existMaxDate is null then set existMaxDate = '2016-1-1'; end if;

  select max(day) into snapDate from reports.zSystemDate; 
 
if existMaxDate < snapDate then 
  while showDate <= snapDate do
		INSERT INTO `reports`.`report_applyStepsRate`(`snapDate`,`applyDate`,
		`apply`,`phoneListBlock`,`blackListBlock`,`threeAdrsBlock`,`positionBlock`,`antiFraud`,`hegui`,`waitForManualAudit`,
		`manualAuditPass`,`manualAuditFail`,`yujinjian`,`sendFile`,`open`)
    select 
		snapDate,showDate,
		count(t1.id) as apply,
		count(CASE WHEN t4.flag =130002 THEN t1.id END ) as phoneListBlock,
		count(CASE WHEN t4.flag =130001 THEN t1.id END ) as blackListBlock,
		count(CASE WHEN t4.flag =130003 THEN t1.id END ) as threeAdrsBlock,
		count(CASE WHEN t4.flag =130004 THEN t1.id END ) as positionBlock,
		count(CASE WHEN t2.flag >=230099 or t3.flag >=230099 THEN t1.id END ) as antiFraud,
		count(CASE WHEN t2.flag >=240099 or t3.flag >=240099 THEN t1.id END ) as hegui,
		count(CASE WHEN t2.flag in(250000,250001) or t3.flag in(250000,250001) THEN t1.id END ) as waitForManualAudit,
		count(CASE WHEN t2.flag >=260099 or t3.flag >=260099 THEN t1.id END ) as manualAuditPass,
		count(CASE WHEN t4.flag = 150000 THEN t1.id END ) as manualAuditFail,
		count(CASE WHEN t2.flag >=260099 or t3.flag >=260099 THEN t1.id END ) as yujinjian,
		count(CASE WHEN t2.flag >=270010 or t2.flag >=270010 THEN t1.id END ) as sendFile,
		count(t3.id) as open
		from `loan`.`custInfoAudtWorkLog` as t1
        LEFT JOIN `loan`.`custWholeInfo` as t2 on t1.custId = t2.custId and t1.custWholeInfoId = t2.id
		LEFT JOIN `loan`.`custWholeInfoSuccess` as t3 on t1.custId = t3.custId and t1.custWholeInfoId = t3.wholeInfoId
		LEFT JOIN `loan`.`custWholeInfoFail` as t4 on t1.custId = t4.custId and t1.custWholeInfoId = t4.wholeInfoId 
		where t1.id in (select MIN(id) from loan.custInfoAudtWorkLog group by custId,custWholeInfoId) and CONVERT(t1.createTime,DATE) = showDate;

    set showDate = DATE_ADD(showDate,INTERVAL 1 DAY);
  end while;
  
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `report_borrowPayCustCount_anytime` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`loan`@`%` PROCEDURE `report_borrowPayCustCount_anytime`()
BEGIN
	declare showDate date;
  declare existMaxDate date;
  declare auditMaxDate date;
	declare bcount int(11);
  declare pcount int(11);

	select max(date) into existMaxDate from `reports`.`report_borrowPayCustCount`;
  if existMaxDate is null then 
     set existMaxDate = '2016-7-15'; 
  else 
     delete from `reports`.`report_borrowPayCustCount` where date=existMaxDate;
     set existMaxDate = date_sub(existMaxDate, interval 1 day);
  end if;
  
  set showDate = date_add(existMaxDate,interval 1 day);
  select max(day) into auditMaxDate from reports.zSystemDate;
  
  while showDate <= auditmaxDate do 
        select count(distinct custId) into bcount from `loan`.`loanBorrow` where status >=2 and CONVERT(giveMoneyTime,DATE) = showDate;
        select count(distinct custId) into pcount from `loan`.`loanRepayment` where status >=2 and CONVERT(deductMoneyTime,DATE) = showDate;
        insert `reports`.`report_borrowPayCustCount`(`date`,`borrowCustCount`,`payCustCount`)
        values (showDate, bcount,pcount);             
        set showDate = date_add(showDate, interval 1 day);
  end while;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `report_borrowPayFlow_daily` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`loan`@`%` PROCEDURE `report_borrowPayFlow_daily`()
BEGIN
  	declare showDate date;
    declare existMaxDate date;
    declare snapDate date;
    
    select max(date) into existMaxDate from `reports`.`report_borrowPayFlow`;	
    if existMaxDate is null then 
         set existMaxDate = '2016-7-14'; 
    else 
         delete from `reports`.`report_borrowPayFlow` where date = existMaxDate;
         set existMaxDate = date_sub(existMaxDate, interval 1 day);
    end if;
    
    select max(day) into snapDate from reports.zSystemDate;
    set showDate = DATE_ADD(existMaxDate,INTERVAL 1 DAY);
    
	while showDate <= snapDate do
	  drop table if exists t1;
      create temporary table t1( 
            `date` date,
            `custId` bigint(20),
        		`borrow` decimal(10,2),
            `pay` decimal(10,2));
            
       insert into t1(custId, borrow,pay)
            select custId, borrowAmount as borrow, 0 from `loan`.`loanBorrow` where status >=2 and CONVERT(giveMoneyTime,DATE) = showDate;
       insert into t1(custId, borrow,pay)     
            select custId, 0 , principal as pay from `loan`.`loanRepayment`  where status >=2 and CONVERT(deductMoneyTime,DATE) = showDate;
       
       insert into `reports`.`report_borrowPayFlow`(`date`,`newCust`, 
    				`oldCust`,`newCustBorrow`,`oldCustBorrow`,`thisPay`,`totalBalance`)
       select 
             showDate,
             count(distinct case when t2.custId is null and t1.borrow >0 then t1.custId end) as newCust,
             count(distinct case when t2.custId is not null and t1.borrow >0 then t1.custId end) as oldCust,
             sum(case when t2.custId is null then t1.borrow end) as newCustBorrow,
             sum(case when t2.custId is not null then t1.borrow end) as oldCustBorrow,
             sum(t1.pay) as thisPay,
             ((select totalBalance from `reports`.`totalBorrow` where date = showDate)) as totalBalance
       from t1 left join `reports`.`cust_firstLoan` t2 on (t1.custId = t2.custId and convert(t2.giveMoneyTime,date) < showDate);
       
       drop table if exists t1;
			set showDate = DATE_ADD(showDate,INTERVAL 1 DAY);
	end while;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `report_channel_daily` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`loan`@`%` PROCEDURE `report_channel_daily`()
BEGIN
	declare showDate DATE;
	declare snapDate DATE;
	declare existMaxDate DATE;

	set showDate = '2016-6-24';
   
  select max(watchDate) into existMaxDate from `reports`.`report_channel`;
  if existMaxDate is null then set existMaxDate = '2016-6-23'; end if;
  select max(day) into snapDate from reports.zSystemDate;

  if existMaxDate < snapDate then   
      while showDate <= snapDate do      
        	INSERT INTO `reports`.`report_channel`(`watchDate`,`date`,`channel`,`active`,`register`,`realName`,`apply`,`sendFile`,`openAccount`)
        	SELECT 
        		snapDate,showDate,
        		channel.name, 
        		count(distinct device.id) as active,
        		count(distinct cust.id) as register,
				count(distinct custIdCard.id) as realName,				
				count(custWholeInfo.id) + count(custWholeInfoFail.id) + count(custWholeInfoSuccess.id) as apply,
				count(CASE WHEN custWholeInfo.flag >=270010 OR custWholeInfoSuccess.flag >=270010 THEN cust.id END) as send,
                count(custWholeInfoSuccess.custId) as openAccount
        	FROM loan.device 
            inner join loan.channel on device.channelId = channel.id
            left join loan.cust on device.id = cust.deviceId 
            left join loan.custIdCard on custIdCard.id = cust.id   
			left join loan.custWholeInfo on cust.id = custWholeInfo.custId 
			left join loan.custWholeInfoSuccess on cust.id = custWholeInfoSuccess.custId
			left join loan.custWholeInfoFail on cust.id = custWholeInfoFail.custId
            where convert(device.createTime, date) = showDate
            group by channel.name;
          
        	set showDate = DATE_ADD(showDate,INTERVAL 1 DAY);  
      end while;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `report_customServiceEfficiency_daily` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`loan`@`%` PROCEDURE `report_customServiceEfficiency_daily`()
BEGIN
	declare showDate DATE;
  declare existMaxDate date;
  declare auditMaxDate date;
	DECLARE Done INT DEFAULT 0;
    
	select max(date) into existMaxDate from `reports`.`report_customServiceEfficiency`;
  select max(date) into auditMaxDate from `reports`.`customServiceHour`;   
  if existMaxDate is null then set existMaxDate = '2016-1-1'; end if;  
  if existMaxDate < auditmaxDate then 
  begin    
     DECLARE rs CURSOR FOR SELECT distinct date from `reports`.`customServiceHour` where date >existMaxDate;
     DECLARE CONTINUE HANDLER FOR not found SET Done = true;
     OPEN rs;
       FETCH rs INTO showDate;
       while (not Done) do
             insert into `reports`.`report_customServiceEfficiency`(`date`,`auditor`,`auditorId`,`h0-9`,`h10`,`h11`,`h12`,`h13`,`h14`,`h15`,`h16`,`h17`,`h18`,`h19`,`h20`,`h21`,`h21-24`)
             select 
                 showDate, auditor,auditorId,
                 sum(case when hour >=0 and hour <=9 then hourCount end),
                 sum(case when hour =10 then hourCount end),
                 sum(case when hour =11 then hourCount end),
                 sum(case when hour =12 then hourCount end),
                 sum(case when hour =13 then hourCount end),
                 sum(case when hour =14 then hourCount end),
                 sum(case when hour =15 then hourCount end),
                 sum(case when hour =16 then hourCount end),
                 sum(case when hour =17 then hourCount end),
                 sum(case when hour =18 then hourCount end),
                 sum(case when hour =19 then hourCount end),
                 sum(case when hour =20 then hourCount end),
                 sum(case when hour =21 then hourCount end),
                 sum(case when hour >21 then hourCount end)             
             from `reports`.`customServiceHour` 
             where date = showDate
             group by auditorId;
             
             FETCH rs INTO showDate;
       end while;
     close rs;
  end;
  end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `report_customService_daily` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`loan`@`%` PROCEDURE `report_customService_daily`()
BEGIN
  	declare showDate DATE;
  	declare logDay DATE;
    declare rs_name varchar(30);
    declare rs_id int(11);
    declare rs_count int(11);
    declare existMaxDate date;
    declare auditmaxDate date;
  	declare Done INT DEFAULT 0;
      
  	select max(date) into existMaxDate from `reports`.`report_customService`;
    if existMaxDate is null then set existMaxDate = '2016-1-1'; end if;
    select max(CONVERT(createTime,DATE)) into auditmaxDate from `loan`.`custInfoAudtWorkLog` where flag =250099;
    
    if existMaxDate < auditmaxDate then 
    begin    
		DECLARE rs CURSOR FOR SELECT CONVERT(createTime,DATE), createrName,createrId,count(*) from `loan`.`custInfoAudtWorkLog` where flag =250099 and CONVERT(createTime,DATE) > existMaxDate group by CONVERT(createTime,DATE), createrId;
		DECLARE CONTINUE HANDLER FOR not found SET Done = true;
		
		OPEN rs;
		 FETCH rs INTO logDay,rs_name,rs_id,rs_count;
		 while (not done) do 
				-- if concat_ws('_',logDay,rs_name) in (select concat_ws('_',date,auditor) from `reports`.`report_customService` ) then 
				--    update `reports`.`report_customService` set count = count where date= logDay and auditor = rs_name and count<>rs_count;
				-- else 
					insert into `reports`.`report_customService`(date, auditor, auditorId, count) values(logDay,rs_name,rs_id,rs_count);
				-- end if;
		 FETCH rs INTO logDay,rs_name,rs_id,rs_count;
		 end while;		 
		CLOSE rs;
    end;
    
    end if;
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `report_ios_channel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`loan`@`%` PROCEDURE `report_ios_channel`()
BEGIN
	insert into `reports`.`report_ios_channel`(`date`,`channel`,`clickNum`,`activeNum`,`updateTime`)
	select
		convert(t1.createTime, date),
		t2.name as channelName,
		count(distinct idfa) as click,
		count(distinct custId) as active,
    NOW()
	from loan.maktAdvertLog t1 
	inner join loan.maktAdvertiser t2 on t1.advertiserCode = t2.code
	where convert(t1.createTime, date) not in(select date from `reports`.`report_ios_channel`)
	group by convert(t1.createTime, date),advertiserCode; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `report_openBorrowRate_daily` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`loan`@`%` PROCEDURE `report_openBorrowRate_daily`()
BEGIN
	declare showDate DATE;
  declare existMaxDate date;
  declare auditMaxDate date;
	declare todayOpen int(11);
 	declare borrowInTodayOpen int(11);
  declare twoMonthsOpen int(11);
  declare borrowInTwoMonthsOpen int(11);

	select max(snapDate) into existMaxDate from `reports`.`report_openBorrowRate`;
  if existMaxDate is null then set existMaxDate = '2016-8-30'; end if;
  
  select max(day) into auditmaxDate from reports.zSystemDate;
  
if existMaxDate < auditmaxDate then 
  set showDate = '2016-7-15';
  while showDate <= auditmaxDate do 
       select 
         count(distinct t1.custId),count(distinct t2.custId) into todayOpen, borrowInTodayOpen
       from `loan`.`custWholeInfoSuccess` t1
       left join `loan`.`loanBorrow` t2 on (t1.custId = t2.custId and t2.status>=2)
    	 where CONVERT(t1.createTime,DATE) = showDate;
       
       select 
         count(distinct t3.custId),count(distinct t4.custId) into twoMonthsOpen,borrowInTwoMonthsOpen
       from `loan`.`custWholeInfoSuccess` t3
       left join `loan`.`loanBorrow` t4 on (t3.custId = t4.custId and t4.status>=2)
    	 where t3.createTime >date_add(auditmaxDate, interval -2 month); 

       insert `reports`.`report_openBorrowRate`(`snapDate`,`date`,`todayOpen`,`borrowInTodayOpen`,`twoMonthsOpen`,`borrowInTwoMonthsOpen`)
       values (auditmaxDate,showDate, todayOpen,borrowInTodayOpen,twoMonthsOpen,twoMonthsOpen);   
                 
       set showDate = date_add(showDate, interval 1 day);
  end while;     
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `report_registerApply_daily` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`loan`@`%` PROCEDURE `report_registerApply_daily`()
BEGIN
	declare showDate DATE;
	declare syncDate DATE;
  declare existMaxDate DATE;
	set showDate = '2016-6-24';   
  
  select max(watchDate) into existMaxDate from `reports`.`report_registerApply`;  
  if existMaxDate is null then set existMaxDate = '2016-6-24'; end if;

  select max(day) into syncDate from reports.zSystemDate;   
  
  if existMaxDate < syncDate then 
     while showDate <= syncDate do      		
      		INSERT INTO `reports`.`report_registerApply`(`watchDate`,`registerDate`,`register`,`notApply`,
      		`onlyRegister`,`onlyRealName`,`realNameAndBankCard`,`realNameAndBasicInfo`,`realNameAndVedio`,
          `noBankCard`,`noBasicInfo`,`noVedio`,`allButSign`,`realNameFailed`)
          select 
        		syncDate,showDate,
        		count(distinct cust.id) as register,
        		count(distinct case when custLoanInfo.custId is null then cust.id end) as notApply,
        		count(distinct case when custIdCard.id is null and custBankCard.id is null and custVideo.id is null and custDetail.id is null then cust.id end) as onlyRegister,
        		count(distinct case when custIdCard.id is NOT null and custBankCard.id is null and custVideo.id is null and custDetail.id is null then cust.id end) as onlyRealName,
        		count(distinct case when custIdCard.id is NOT null and custBankCard.id is NOT null and custVideo.id is null and custDetail.id is null then cust.id end) as realNameAndBankCard,
        		count(distinct case when custIdCard.id is NOT null and custBankCard.id is null and custVideo.id is null and custDetail.id is NOT null then cust.id end) as realNameAndBasicInfo,
        		count(distinct case when custIdCard.id is NOT null and custBankCard.id is null and custVideo.id is NOT null and custDetail.id is null then cust.id end) as realNameAndVedio,
        		count(distinct case when custIdCard.id is NOT null and custBankCard.id is null and custVideo.id is NOT null and custDetail.id is NOT null then cust.id end) as noBankCard,
        		count(distinct case when custIdCard.id is NOT null and custBankCard.id is NOT null and custVideo.id is NOT null and custDetail.id is null then cust.id end) as noBasicInfo,
        		count(distinct case when custIdCard.id is NOT null and custBankCard.id is NOT null and custVideo.id is null and custDetail.id is NOT null then cust.id end) as noVedio,
        		count(distinct case when custIdCard.id is NOT null and custBankCard.id is NOT null and custVideo.id is NOT null and custDetail.id is NOT null and custLoanInfo.custId is  null then cust.id end) as allButSign,
        		count(distinct case when custIdCard.id is null then cust.id end) as realNameFailed
        	from `loan`.`cust`
        	left join `loan`.`custIdCard` on custIdCard.id = cust.id
        	left join `loan`.`custBankCard` on custBankCard.id = cust.id
        	left join `loan`.`custVideo` on (custVideo.id = cust.id and custVideo.flag >=2)
        	left join `loan`.`custDetail` on custDetail.id = cust.id
        	left join `loan`.`custLoanInfo` on custLoanInfo.custId = cust.id
        -- 	left join `loan`.`custIdCardLog` on (custIdCardLog.custId = cust.id and custIdCardLog.flag >=2)
        	where CONVERT(cust.createTime,DATE) = showDate;
      	
          set showDate = DATE_ADD(showDate,INTERVAL 1 DAY);
        end while;
     end if;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `report_registerStepsRate_daily` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`loan`@`%` PROCEDURE `report_registerStepsRate_daily`()
BEGIN
	declare registerDate DATE;
	declare showDate DATE;
    declare existMaxDate  date;
	declare snapDate DATE;
    
    select max(snapDate) into existMaxDate from `reports`.`report_registerStepsRate`;	
    if existMaxDate is null then set existMaxDate = '2016-6-23'; end if;

    select max(day) into snapDate from reports.zSystemDate;
    set showDate = '2016-6-24';
    
    if existMaxDate < snapDate then 
		  while showDate <= snapDate do
				INSERT INTO `reports`.`report_registerStepsRate`(`snapDate`,`registerDate`,
				`register`,`fake`,`apply`,`antiFraud`,`waitForManualAudit`,`manualAuditPass`,`manualAuditFail`,`sendFile`,
				`rulePass`,`tongdun`,`waitForComTel`,`comTelFail`,`comTelPend`,`comTelPass`,`waitForPerTel`,`perTelFail`,
				`perTelPend`,`perTelPass`,`open`)
			select 
				snapDate,showDate,
				count(distinct cust.id) as register,
				count(distinct CASE WHEN cust.channelId is not null THEN cust.id END) as fake,                
				count(custWholeInfo.id) + count(custWholeInfoSuccess.id) + count(custWholeInfoFail.id) as apply, 
				count(case when custWholeInfo.flag >=230099 or custWholeInfoSuccess.flag >=230099 then cust.id end) as antiFraud,	
				count(case when custWholeInfo.flag in(250000,250001) or custWholeInfoSuccess.flag in(250000,250001) then cust.id END) as waitForManualAudit,
                count(case when custWholeInfo.flag >=250099 or custWholeInfoSuccess.flag >=250099 then cust.id end) as manualAuditPass,	                
                count(case when custWholeInfoFail.flag =150000 then cust.id end) as manualAuditFail,	
                count(case when custWholeInfo.flag >=270010 or custWholeInfoSuccess.flag >=270010 then cust.id end) as sendFile,	
				count(case when custWholeInfo.flag >=270099 or custWholeInfoSuccess.flag >=270099 then cust.id end) as rulePass,	
				0 as tongdun,	
                count(case when custWholeInfo.flag in(280000,280001) or custWholeInfoSuccess.flag in(280000,280001) then cust.id END) as waitForComTel,
                count(case when custWholeInfoFail.flag =180000 then cust.id end) as comTelFail,	
                count(case when custWholeInfo.flag =280001 or custWholeInfoSuccess.flag=280001 then cust.id end) as comTelPend,	
                count(case when custWholeInfo.flag >=280099 or custWholeInfoSuccess.flag>=280099 then cust.id end) as comTelPass,	
                count(case when custWholeInfo.flag in(280100,280101) or custWholeInfoSuccess.flag in(280100,280101) then cust.id END) as waitForPerTel,
				count(case when custWholeInfoFail.flag =180100 then cust.id end) as perTelFail,	
                count(case when custWholeInfo.flag =280101 or custWholeInfoSuccess.flag =280101 then cust.id end) as perTelPend,	
                count(case when custWholeInfo.flag >=280199 or custWholeInfoSuccess.flag >=280199 then cust.id end) as perTelPass,
                count(custWholeInfoSuccess.id) as open
				from `loan`.`cust` 
                left join `loan`.`channel` on cust.channelId = channel.id and channel.code like '9-%'
				left join loan.custWholeInfo on cust.id = custWholeInfo.custId 
				left join loan.custWholeInfoSuccess on cust.id = custWholeInfoSuccess.custId
				left join loan.custWholeInfoFail on cust.id = custWholeInfoFail.custId 
				where  CONVERT(cust.createTime,DATE) = showDate;

			set showDate = DATE_ADD(showDate,INTERVAL 1 DAY);
		  end while;
end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `report_sendStepsRate_daily` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`loan`@`%` PROCEDURE `report_sendStepsRate_daily`()
BEGIN
	declare applyDate DATE;
	declare showDate DATE;
	declare snapDate DATE;
	declare existMaxDate DATE;
	set applyDate = '2016-6-24';
	set showDate = applyDate;    
	
  select max(snapDate) into existMaxDate from `reports`.`report_sendStepsRate` ;
   if existMaxDate is null then set existMaxDate = '2016-1-1'; end if;  
   select max(day) into snapDate from reports.zSystemDate; 
   
if existMaxDate < snapDate then 
  while showDate <= snapDate do
		INSERT INTO `reports`.`report_sendStepsRate`(`snapDate`,`sendDate`,
		`send`,`ruleReject`,`ruleWait`,`rulePass`,`tongdun`,`waitForComTel`,`comTelFail`,`comTelPend`,
		`comTelPass`,`waitForPerTel`,`perTelFail`,`perTelPend`,`perTelPass`,`open`)
    select 
		snapDate,showDate,
		count(t1.id) as send,
		count(CASE WHEN t4.flag =170000 THEN t1.id END ) as ruleReject,
		count(CASE WHEN t2.flag =270010 OR t3.flag =270010 THEN t1.id END ) as ruleWait,
		count(CASE WHEN t2.flag >=270099 OR t3.flag >=270099 THEN t1.id END ) as rulePass,
		0 as tongdun,
		count(CASE WHEN t2.flag in (280000,280001) OR t3.flag in (280000,280001) THEN t1.id END ) as waitForComTel,
		count(CASE WHEN t4.flag =180000 THEN t1.id END ) as comTelFail,
		count(CASE WHEN t2.flag =280001 OR t3.flag =280001 THEN t1.id END ) as comTelPend,
		count(CASE WHEN t2.flag >=280099 OR t3.flag >=280099 THEN t1.id END ) as comTelPass,
		count(CASE WHEN t2.flag in (280100,280101) OR t3.flag in (280100,280101) THEN t1.id END ) as waitForPerTel,
		count(CASE WHEN t4.flag =180100 THEN t1.id END ) as perTelFail,
		count(CASE WHEN t2.flag =280101 OR t3.flag =280101 THEN t1.id END ) as perTelPend,
		count(CASE WHEN t2.flag >=280199 OR t3.flag >=280199 THEN t1.id END ) as perTelPass,
		count(t3.id) as open
		from `loan`.`custInfoAudtWorkLog` as t1
		LEFT JOIN `loan`.`custWholeInfo` as t2 on t1.custId = t2.custId and t1.custWholeInfoId = t2.id
		LEFT JOIN `loan`.`custWholeInfoSuccess` as t3 on t1.custId = t3.custId and t1.custWholeInfoId = t3.wholeInfoId
		LEFT JOIN `loan`.`custWholeInfoFail` as t4 on t1.custId = t4.custId and t1.custWholeInfoId = t4.wholeInfoId 
		where t1.flag = 270010 and CONVERT(t1.createTime,DATE) = showDate;

    set showDate = DATE_ADD(showDate,INTERVAL 1 DAY);
  end while;
  
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `report_stepsRate_daily` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`loan`@`%` PROCEDURE `report_stepsRate_daily`()
BEGIN

	insert into `reports`.`report_stepsRate`(`watchDate`, `date`, `register`, `fakeInRegister`, `applyInRegister`, `openInRegister`)
	select `watchDate`, `date`, `register`, `fakeInRegister`, `applyInRegister`, `openInRegister`
	from `reports`.`stepsRate_1_register` where `reports`.`stepsRate_1_register`.watchDate not in (select watchDate from `reports`.`report_stepsRate`);

	update report_stepsRate, stepsRate_2_apply set 
	report_stepsRate.apply = stepsRate_2_apply.apply,
	report_stepsRate.antiFraudInApply = stepsRate_2_apply.antiFraudInApply,
	report_stepsRate.manualAuditPassInApply = stepsRate_2_apply.manualAuditPassInApply,
	report_stepsRate.sendFileInApply = stepsRate_2_apply.sendFileInApply
	where report_stepsRate.watchDate = stepsRate_2_apply.watchDate and  report_stepsRate.date = stepsRate_2_apply.date;

	update report_stepsRate, stepsRate_3_sendFile set 
	report_stepsRate.`sendFile` = stepsRate_3_sendFile.sendFile,
	report_stepsRate.`rulePassSendFile` = stepsRate_3_sendFile.rulePassSendFile,
	report_stepsRate.`tongdunBlackListSendFile` = stepsRate_3_sendFile.tongdunBlackListSendFile,
	report_stepsRate.`companyTelPassSendFile` = stepsRate_3_sendFile.companyTelPassSendFile,
	report_stepsRate.`personalTelPassSendFile` = stepsRate_3_sendFile.personalTelPassSendFile
	where report_stepsRate.watchDate = stepsRate_3_sendFile.watchDate and  report_stepsRate.date = stepsRate_3_sendFile.date;


	update report_stepsRate, stepsRate_4_open set 
	report_stepsRate.`open` = stepsRate_4_open.`open`
	where report_stepsRate.watchDate = stepsRate_4_open.watchDate and  report_stepsRate.date = stepsRate_4_open.date;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `stepsRate_1_register_daily` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`loan`@`%` PROCEDURE `stepsRate_1_register_daily`()
BEGIN
  declare showDate DATE;
  declare syncDate DATE;
  declare existMaxDate DATE;
  
  set showDate = '2016-6-24';
 
  select max(watchDate) into existMaxDate from `reports`.`stepsRate_1_register`;
  if existMaxDate is null then set existMaxDate = '2016-6-24'; end if;

  select max(day) into syncDate from reports.zSystemDate;   
  
  if existMaxDate < syncDate then 

  while showDate <= syncDate do
		INSERT INTO `reports`.`stepsRate_1_register`(`watchDate`,`date`,
		`register`,`fakeInRegister`,`applyInRegister`,`openInRegister`)
    select 
		syncDate,showDate,
		count(distinct cust.id) as register,
		count(distinct CASE WHEN cust.channelId is not null THEN cust.id END) as fakeInRegister,
        count(custWholeInfo.id) + count(custWholeInfoFail.id) + count(custWholeInfoSuccess.id) as applyInRegister, 
        count(custWholeInfoSuccess.custId) as openInRegister		
	from `loan`.`cust` 
    left join `loan`.`channel` on cust.channelId = channel.id and channel.code like '9-%'    
    left join loan.custWholeInfo on cust.id = custWholeInfo.custId 
    left join loan.custWholeInfoSuccess on cust.id = custWholeInfoSuccess.custId
	left join loan.custWholeInfoFail on cust.id = custWholeInfoFail.custId 
	WHERE CONVERT(cust.createTime,DATE) = showDate;	

    set showDate = DATE_ADD(showDate,INTERVAL 1 DAY);
  end while;
  
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `stepsRate_2_apply_daily` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`loan`@`%` PROCEDURE `stepsRate_2_apply_daily`()
BEGIN
	declare registerDate DATE;
	declare showDate DATE;
	declare syncDate DATE;
    declare existMaxDate DATE;
 
	set registerDate = '2016-6-24';
	set showDate = registerDate; 
	
  select max(watchDate) into existMaxDate from `reports`.`stepsRate_2_apply`;
  if existMaxDate is null then set existMaxDate = '2016-6-24'; end if;

   select max(day) into syncDate from reports.zSystemDate; 
  
  if existMaxDate < syncDate then 
  
      while showDate <= syncDate do    
      		INSERT INTO `reports`.`stepsRate_2_apply`(`watchDate`,`date`,
      		`apply`,`antiFraudInApply`,`manualAuditPassInApply`,`sendFileInApply`)
          select 
      		syncDate,showDate,
      		count(t1.id) as apply,
      		count(CASE WHEN t2.flag >=230099 OR t3.flag >=230099 THEN t1.id END ) as antiFraudInApply,
      		count(CASE WHEN t2.flag >=250099 OR t3.flag >=250099 THEN t1.id END ) as manualAuditPassInApply,
      		count(CASE WHEN t2.flag >=270010 OR t3.flag >=270010 THEN t1.id END ) as sendFileInApply
      		from `loan`.`custInfoAudtWorkLog` as t1
			LEFT JOIN `loan`.`custWholeInfo` as t2 on t1.custId = t2.custId and t1.custWholeInfoId = t2.id
			LEFT JOIN `loan`.`custWholeInfoSuccess` as t3 on t1.custId = t3.custId and t1.custWholeInfoId = t3.wholeInfoId          
      		where t1.id in (select MIN(id) from `loan`.`custInfoAudtWorkLog` group by custId,custWholeInfoId) and CONVERT(t1.createTime,DATE) = showDate;
          
      	  set showDate = DATE_ADD(showDate,INTERVAL 1 DAY);
      end while;
  
  end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `stepsRate_3_sendFile_daily` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`loan`@`%` PROCEDURE `stepsRate_3_sendFile_daily`()
BEGIN
	declare showDate DATE;
	declare syncDate DATE;
    declare existMaxDate DATE; 

	set showDate = '2016-6-24';
	
  select max(watchDate) into existMaxDate from `reports`.`stepsRate_3_sendFile`;
  if existMaxDate is null then set existMaxDate = '2016-1-1'; end if;
  select max(day) into syncDate from reports.zSystemDate; 
  
 if existMaxDate < syncDate then 
  while showDate <= syncDate do
		INSERT INTO `reports`.`stepsRate_3_sendFile`(`watchDate`,`date`,
		`sendFile`,`rulePassSendFile`,`tongdunBlackListSendFile`,`companyTelPassSendFile`,
		`personalTelPassSendFile`)
    select 
		syncDate,showDate,
		count(t1.id) as sendFile,
        count(CASE WHEN t2.flag >=270099 OR t3.flag >=270010 THEN t1.id END ) as rulePassSendFile,
		0 as tongdunBlackListSendFile,
        count(CASE WHEN t2.flag >=280099 OR t3.flag >=280099 THEN t1.id END ) as companyTelPassSendFile,		
        count(CASE WHEN t2.flag >=280199 OR t3.flag >=280199 THEN t1.id END ) as personalTelPassSendFile
		from `loan`.`custInfoAudtWorkLog` as t1
		LEFT JOIN `loan`.`custWholeInfo` as t2 on t1.custId = t2.custId and t1.custWholeInfoId = t2.id
		LEFT JOIN `loan`.`custWholeInfoSuccess` as t3 on t1.custId = t3.custId and t1.custWholeInfoId = t3.wholeInfoId
		where t1.flag = 270010 and CONVERT(t1.createTime,DATE) = showDate;

    set showDate = DATE_ADD(showDate,INTERVAL 1 DAY);
  end while;
  
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `stepsRate_4_open_daily` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`loan`@`%` PROCEDURE `stepsRate_4_open_daily`()
BEGIN
	declare registerDate DATE;
	declare showDate DATE;
	declare syncDate DATE;
  declare existMaxDate DATE;

	set showDate = '2016-6-24';
	
  select max(watchDate) into existMaxDate from `reports`.`stepsRate_4_open`;
  if existMaxDate is null then set existMaxDate = '2016-6-24'; end if;
  select max(day) into syncDate from reports.zSystemDate; 
  
  if existMaxDate < syncDate then 
  while showDate <= syncDate do
		INSERT INTO `reports`.`stepsRate_4_open`(`watchDate`,`date`,`open`)
    select 
		syncDate,showDate,
		count(*) as open
		from `loan`.`custWholeInfoSuccess` as t1
		where CONVERT(t1.createTime,DATE) = showDate;

    set showDate = DATE_ADD(showDate,INTERVAL 1 DAY);
  end while;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `totalBorrow_anytime` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`loan`@`%` PROCEDURE `totalBorrow_anytime`()
BEGIN
  	declare syncDate date; 
    declare existMaxDate date; 
  	declare existMinDate date; 
    declare showDate date; 
    declare twoMonthAgoDate date;
    declare todayBorrow decimal(10,2);
    declare todayPay decimal(10,2);   
    declare this2monthBorrow decimal(10,2);
    declare this2monthPay decimal(10,2);   
    declare balance2monthAgo decimal(10,2);       

    select max(day) into syncDate from reports.zSystemDate;   
     
  	select max(date) into existMaxDate from reports.totalBorrow;    
    if existMaxDate is null then 
       set existMaxDate = '2016-7-14' ; 
    else
        delete from `reports`.`totalBorrow` where date = existMaxDate;  
        set existMaxDate =  date_sub(existMaxDate, interval 1 day);
    end if;
   
    set showDate = date_add(existMaxDate, interval 1 day);     
    while showDate <= syncDate do 
  		  select sum(borrowAmount) into todayBorrow from `loan`.`loanBorrow` where CONVERT(giveMoneyTime,DATE) = showDate and status >=2;
     	  select sum(principal) into todayPay from `loan`.`loanRepayment` where CONVERT(deductMoneyTime,DATE) = showDate and status >=2;
              				
				set twoMonthAgoDate =  DATE_SUB(showDate,INTERVAL 2 MONTH);          				
				select min(date) into existMinDate from `reports`.`totalBorrow`;  				
				if twoMonthAgoDate < existMinDate then 
					set balance2monthAgo = 0;
				else 
					select totalBalance into balance2monthAgo from `reports`.`totalBorrow` where date = twoMonthAgoDate;
          if balance2monthAgo is null then set balance2monthAgo = 0; end if;
				end if;
        
       select sum(borrowAmount) into this2monthBorrow from `loan`.`loanBorrow` where status >=2 and 
               CONVERT(giveMoneyTime,DATE) >twoMonthAgoDate and CONVERT(giveMoneyTime,DATE) <= showDate;
     	 select sum(principal) into this2monthPay from `loan`.`loanRepayment` where status >=2 and 
              CONVERT(deductMoneyTime,DATE) >twoMonthAgoDate and CONVERT(deductMoneyTime,DATE)<= showDate ;
              
       if todayBorrow is null then set todayBorrow = 0; end if;
       if todayPay is null then set todayPay = 0; end if;
       if this2monthBorrow is null then set this2monthBorrow = 0; end if;
       if this2monthPay is null then set this2monthPay = 0; end if;
  				
      insert into  `reports`.`totalBorrow` (date, todayBorrow, todayPay, todayBalance,balance2monthAgo,totalBalance) values
      (showDate,todayBorrow,todayPay, todayBorrow - todayPay, balance2monthAgo, balance2monthAgo + this2monthBorrow - this2monthPay);
   
   set showDate = date_add(showDate, interval 1 day);
   end while;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_cust_applyTime_daily` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`loan`@`%` PROCEDURE `update_cust_applyTime_daily`()
BEGIN
	
  insert into `reports`.`cust_applyTime`
  select id, custId, createTime from `loan`.`custInfoAudtWorkLog` where flag = 230000 and 
  id not in (select custInfoAudtWorkLogId from `reports`.`cust_applyTime`);
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_cust_firstLoan_anytime` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`loan`@`%` PROCEDURE `update_cust_firstLoan_anytime`()
BEGIN	
insert into `reports`.`cust_firstLoan`
( `custId`,
	`loanBorrowId`,
  `borrowTime`,
  `borrowAmount`,
  `borrowCharge` ,
  `lastPayDate` ,
  `giveMoneyTime` ,
  `repayTime`,
  `deductMoneyTime`,
  `calWay`,
  `chargeRate` ,
  `interestRate`,
  `overdueFineRate` ,
  `repayPrincipal` ,
  `repayCharge`,
  `interest` ,
  `overdueFine`,
  `totalPaidAmount`,
  `dueTotalInterest` ,
  `dueTotalOverdueFine` ,
  `overdueDays`,
  `remainingDays`,
  `totalRepayAmount`)
select 
  `custId`,
	`id`,
  `borrowTime`,
  `borrowAmount`,
  `borrowCharge` ,
  `lastPayDate` ,
  `giveMoneyTime` ,
  `repayTime`,
  `deductMoneyTime`,
  `calWay`,
  `chargeRate` ,
  `interestRate`,
  `overdueFineRate` ,
  `repayPrincipal` ,
  `repayCharge`,
  `interest` ,
  `overdueFine`,
  `totalPaidAmount`,
  `dueTotalInterest` ,
  `dueTotalOverdueFine` ,
  `overdueDays`,
  `remainingDays`,
  `totalRepayAmount` from `loan`.`loanBorrow`
WHERE id in(select min(id)from `loan`.`loanBorrow` where status>=2 group by custId) and 
custId not in (select custId from `reports`.`cust_firstLoan`);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `zSystemDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`loan`@`%` PROCEDURE `zSystemDate`()
BEGIN
    declare auditDate date;
    declare custDate date;
    declare borrowDate date;
    declare payDate date;
    declare maxDate date;
    declare maxExistDate date;
    declare diffDays int;
    
    select convert(max(borrowTime),date) into borrowDate from `loan`.`loanBorrow`; 
    select convert(max(deductMoneyTime),date) into payDate from `loan`.`loanRepayment`; 
    select convert(max(createTime),date) into custDate from `loan`.`cust`;
    select convert(max(createTime),date) into auditDate from `loan`.`custInfoAudtWorkLog`;
    
    set maxDate = auditDate;    
    if maxDate < custDate then set maxDate = custDate; end if;
    if maxDate < borrowDate then set maxDate = borrowDate; end if;
    if maxDate < payDate then set maxDate = payDate; end if;
    
    select max(day) into maxExistDate from reports.zSystemDate;
    
    select TIMESTAMPDIFF(DAY,maxExistDate,maxDate) into diffDays;
    
    if diffDays > 1 then 
       set maxDate = date_sub(maxDate, interval 1 day);
    end if;
    
    if diffDays > 0 then 
		insert into reports.zSystemDate(day, insertTime) values(maxDate,now());
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-13 10:26:44
