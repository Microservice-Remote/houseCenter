-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: houseCenter
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
-- Table structure for table `agency`
--

DROP TABLE IF EXISTS `agency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '经纪机构名称',
  `address` varchar(20) NOT NULL COMMENT '地址',
  `phone` varchar(30) NOT NULL COMMENT '手机号',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `about_us` varchar(512) NOT NULL COMMENT '描述',
  `mobile` varchar(11) NOT NULL COMMENT '电话',
  `web_site` varchar(512) NOT NULL COMMENT '站点',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='经纪机构表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agency`
--

LOCK TABLES `agency` WRITE;
/*!40000 ALTER TABLE `agency` DISABLE KEYS */;
/*!40000 ALTER TABLE `agency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog` (
  `id` int(11) NOT NULL,
  `tags` varchar(20) NOT NULL COMMENT '标签',
  `content` varchar(512) NOT NULL COMMENT '内容',
  `title` varchar(20) NOT NULL COMMENT '标题',
  `cat` int(11) NOT NULL COMMENT '1-准备买房 2-看房/选房 3-q签约/订房 4-全款/贷款 5-缴税/过户 6-入住/交接 7-买房风险',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='百科表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog`
--

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(512) NOT NULL COMMENT '评论内容',
  `house_id` bigint(20) NOT NULL COMMENT '房屋id',
  `blog_id` int(11) NOT NULL COMMENT '博客id',
  `type` tinyint(1) NOT NULL COMMENT '1-房产评论  2-博客评论',
  `user_id` bigint(20) NOT NULL COMMENT '评论用户',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `community`
--

DROP TABLE IF EXISTS `community`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `community` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_code` varchar(11) NOT NULL COMMENT '城市编码\n',
  `name` varchar(50) NOT NULL COMMENT '小区名称',
  `city_name` varchar(11) DEFAULT NULL COMMENT '城市名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='小区表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community`
--

LOCK TABLES `community` WRITE;
/*!40000 ALTER TABLE `community` DISABLE KEYS */;
/*!40000 ALTER TABLE `community` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `house`
--

DROP TABLE IF EXISTS `house`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `house` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '房产名称',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1:销售 2:出租',
  `price` int(11) DEFAULT NULL COMMENT '房产价格 单位: 元',
  `area` int(11) NOT NULL DEFAULT '0' COMMENT '房产的面积',
  `beds` int(11) DEFAULT '0' COMMENT '卧室数量',
  `baths` int(11) NOT NULL DEFAULT '0' COMMENT '卫生间数量',
  `rating` double NOT NULL DEFAULT '0' COMMENT '评级分数',
  `remarks` varchar(512) NOT NULL COMMENT '房产描述',
  `properties` varchar(512) NOT NULL COMMENT '属性',
  `floor_plan` varchar(250) NOT NULL COMMENT '户型图',
  `tags` varchar(20) NOT NULL COMMENT '标签',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `city_id` int(11) NOT NULL DEFAULT '0' COMMENT '城市id',
  `community_id` int(11) NOT NULL DEFAULT '0' COMMENT '小区名称',
  `address` varchar(20) DEFAULT NULL COMMENT '房产地址',
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '房产状态 1-上架 2-下架',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `house`
--

LOCK TABLES `house` WRITE;
/*!40000 ALTER TABLE `house` DISABLE KEYS */;
/*!40000 ALTER TABLE `house` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `house_msg`
--

DROP TABLE IF EXISTS `house_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `house_msg` (
  `column_1` int(11) DEFAULT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `msg` varchar(512) NOT NULL COMMENT '消息留言',
  `agent_id` bigint(20) NOT NULL COMMENT '经纪人id',
  `house_id` bigint(20) NOT NULL COMMENT '房屋id',
  `user_name` varchar(20) NOT NULL COMMENT '用户姓名',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='房产留言表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `house_msg`
--

LOCK TABLES `house_msg` WRITE;
/*!40000 ALTER TABLE `house_msg` DISABLE KEYS */;
/*!40000 ALTER TABLE `house_msg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `house_user`
--

DROP TABLE IF EXISTS `house_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `house_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `house_id` bigint(20) NOT NULL COMMENT '房产id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1: 售卖 2: 收藏',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='房产用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `house_user`
--

LOCK TABLES `house_user` WRITE;
/*!40000 ALTER TABLE `house_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `house_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `phone` char(13) NOT NULL COMMENT '手机号码',
  `email` varchar(90) NOT NULL COMMENT '邮箱',
  `aboutme` varchar(250) NOT NULL COMMENT '自我介绍',
  `passwd` varchar(512) NOT NULL COMMENT '经过md5加密的密码',
  `avatar` varchar(512) NOT NULL COMMENT '头像图片',
  `type` tinyint(1) NOT NULL COMMENT '1:普通用户 2: 房产经纪人',
  `enable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1: 启用 0: 停用',
  `agency_id` int(11) NOT NULL COMMENT '所属经纪公司',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_email_uindex` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
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

-- Dump completed on 2018-02-23 21:49:08
