-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 27, 2016 at 03:24 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `travelify`
--

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_ablog_categories`
--

CREATE TABLE IF NOT EXISTS `hyxu5_ablog_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL DEFAULT '',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL,
  `published` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_left_right` (`lft`,`rgt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_ablog_comments`
--

CREATE TABLE IF NOT EXISTS `hyxu5_ablog_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_date` datetime NOT NULL,
  `email_adress` varchar(120) NOT NULL,
  `creator` varchar(100) NOT NULL,
  `post_creator` int(11) NOT NULL,
  `content` text NOT NULL,
  `comment_answer_id` int(11) NOT NULL,
  `published` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_ablog_comment_answers`
--

CREATE TABLE IF NOT EXISTS `hyxu5_ablog_comment_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `creator` varchar(100) NOT NULL,
  `email_adress` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL,
  `published` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_ablog_posts`
--

CREATE TABLE IF NOT EXISTS `hyxu5_ablog_posts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created_date` datetime DEFAULT NULL,
  `title` varchar(50) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL,
  `published` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '0',
  `creator` varchar(100) NOT NULL,
  `creator_username` varchar(100) NOT NULL,
  `creator_id` int(11) NOT NULL,
  `categorie_id` int(11) NOT NULL,
  `trashed` int(11) NOT NULL,
  `publish_start` datetime NOT NULL,
  `publish_stop` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_akeeba_common`
--

CREATE TABLE IF NOT EXISTS `hyxu5_akeeba_common` (
  `key` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_ak_profiles`
--

CREATE TABLE IF NOT EXISTS `hyxu5_ak_profiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `configuration` longtext,
  `filters` longtext,
  `quickicon` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `hyxu5_ak_profiles`
--

INSERT INTO `hyxu5_ak_profiles` (`id`, `description`, `configuration`, `filters`, `quickicon`) VALUES
(1, 'Default Backup Profile', '###AES128###5l7qTmcqpJCYUa6CbC+tNbNSW0u/8VY7rHYFJjzCSOv/48y3qO1gRaB7i+K48CvA6sx8rF7C7HLXrYIPDEJIPaHfUC/nkaZCfpvMm28RPa0uKg+ADFF8j9euHVIP2h3i1MQ/L1fmXTFdO/mhtn7MJOr0ujX37ukH7Hvdc+YhKvUJtxnrFJ0zj2ctc8V4W99YwYkUGDIAKxisEiroNo1Cvc39ehiTQQCIUjWf8mRLlpP72kOECIbuiRqI2BwavewG733FJxDWd7MqCdqSejT3+0AtbFfSKKNm2Gf2HgVOXnrGGQlxKJjkYavvAUpCrx3vD565W0cjP3pwntN2fL0vDkPaVFXNGmwEMBvE2k3bC+arh3X/bXLVqE4x7BjhHuYD2fuVRrv92DIEIPYq0kUBpUGbmLutPJkWujn73hgVRZCkT5cEk+gKvAZQfcx1V49kxRDwUV5qfCTGivGsRp04MU795Z8AgEPaOhEvQDyQ+3PwhGrIbyEURFXdjPH+p4d0my0QvDWPwqCCYY1tem1a0gzr9uSAIIfukH148DLo2Chgue4rUQaIUim1VMlZtD/ZlW6fnRWk8yBUaI2vwTj5b78BPoCp19dA9Dg0V70ydnxeBqudgxGl4vuMScSiko0MAOFy6L3PZaTAwLebPEss1jNI2MlrfUG6ewjMAY50qFnuXzeh3D70jvaQxfZ/67hE9zf6HuZJgazkLrYzj2JDJtqjqJX6zmvwxAmbdr3xCFEZXhKLNFD4YIGPYBSDSoNVYnT1GbwQKdBDu/f9BngQSENzp2PcfXHJ/DyfTbH0BAJDki0bRitYtNXLWhnXrBlC9BNUmY3sHZKM5m1bGc8X/+kHwOpjCwPJd2+hAXXnaupNR50SgM2szTVAkCiOpnQy7ACH+xXKRD6ZIPSybwwHJn+prupYpYoFUf+ZR7dsS8Wc7HzS0ncs1cU8T9ypMNaXHSYpGaD0yQSKKtmuay7ag6rNlUdSCmyS6cfvxMZP1kTfesZEjrXi8xtwpQW6K7xcsaHQAsFzgVIlnnkiGwxWrkScumBxX5W4lIqqUG3KV/zlS17yamz64c2corKe1+lvhrYo8Y2kkr2QMLbOQrE0ejMIKnFJZ4O39tluANNw0jBIhnT/t7ddb7bXrJMBkkt5xA6oXfIqa5iLUUccUeSHgGRQZex1tDcaI7lgV6Em5fZ0gm8nWY8yuuFX8RCm89hFTxqvaBC5BVKBhwBFbmW48TAtbwfcyiBCMEJzEALbr/BwKu4RQobPiedxG2siHWB/qNdLrUmjSKM4IwUyVJ7VToMNvmzxmZQIW//zQ2PTXlYkWDIGGk8Hax1apnLZLKg3jL+cUfCaJ5WCpfKeWxe/rQP1aDWreS0ptQngOQO1H92cwWzD5zRGpw/PhbHaXc7We7qtsYvPA7INY2yrfPsrsmQNEv9KiQ6Yq1uLpXAOa32sv2zb2Wvj60p6ur2mIGevxYAzG/j8m+qic9UuYjn5v3UWvjNS0ADeVZnzP8rtbFoOPSYsUIdGxygkSDPAX8j/IC2LnKXqFVyB2OZ34+p/sHmHMEH4Fs1K0YK2f9QrV53fq8y1SehfsldgYWbVgPB373DaVqwLTZSJemb3JWAsK7/6VZ614OE8EOGNoSgXnoITZBCXnOemfijua4xJtXHfsqChODfQ/uiPvrEmLNFSw7z09zUc/IGyp+N4lOlJ2uFGW7KXAeyrEDCWGfmcpl4/5OzT9DwRQ62BjOccdCuBIzMwcuxvxtLQG9wtNRGak68zFOR6v7rmaFSNYMXSbuwaKeqzy/j1fjBBiaeEd13Jk/zuW52+jSfpR+yga7HpNEvvlNGCFFuYdqwBeJvtk/MlI+3FDu3llI9CV4sZbmSCGI8dn6qs+23mcPh3QvUqsw29mCA8ZEtz4MLqNsYgMQFccYdXQKKoL4qvcgFJxOku27I9rX6w48hKg4iH9C4Hnt+yOWconPTIGU/8JrbHq4kiGeIplX1nr4qt7mqbxAddBZSIGBCCMCUtKeLoDix1Up59x47fqrCCKl/APloezOC/7u3LWk5g+ASd2Zg8JCXFBMVe2FIFbfJIFDRPSLVmIZN9kq6sBrRk9WcxWvk1Owg6ZhdJHUSABLgwC0DhX7NWB5wrQ+kHTgSCgih3MtUJ2UqunJnMDyO1VzC807gpsr9Sh+SxqUafRoi/107jwRT2thJOqthDoZn07+iQ3OAIb0CWF97zZGeRVSWEp9ksePiyJKELBKASZi9l+naL2ef9qhjYJd8CfW4VFXfPbVYgncT+d8k1gByntF3E/s5KdWfpTmlR/fpxRcYWOT1rA7U3+DnrA9agiHFFvI3tKN9jNIh08RbDBOI1wf1tneoKguj1eYIq4qvBx08iFztDWws01EpQSVZyc7HyIigm5lE3XVAVC8P+8gYAAA==', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_ak_stats`
--

CREATE TABLE IF NOT EXISTS `hyxu5_ak_stats` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `comment` longtext,
  `backupstart` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `backupend` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` enum('run','fail','complete') NOT NULL DEFAULT 'run',
  `origin` varchar(30) NOT NULL DEFAULT 'backend',
  `type` varchar(30) NOT NULL DEFAULT 'full',
  `profile_id` bigint(20) NOT NULL DEFAULT '1',
  `archivename` longtext,
  `absolute_path` longtext,
  `multipart` int(11) NOT NULL DEFAULT '0',
  `tag` varchar(255) DEFAULT NULL,
  `backupid` varchar(255) DEFAULT NULL,
  `filesexist` tinyint(3) NOT NULL DEFAULT '1',
  `remote_filename` varchar(1000) DEFAULT NULL,
  `total_size` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fullstatus` (`filesexist`,`status`),
  KEY `idx_stale` (`status`,`origin`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `hyxu5_ak_stats`
--

INSERT INTO `hyxu5_ak_stats` (`id`, `description`, `comment`, `backupstart`, `backupend`, `status`, `origin`, `type`, `profile_id`, `archivename`, `absolute_path`, `multipart`, `tag`, `backupid`, `filesexist`, `remote_filename`, `total_size`) VALUES
(1, 'Backup taken on Tuesday, 23 February 2016 02:14', '', '2016-02-22 19:14:24', '2016-02-22 19:16:53', 'complete', 'backend', 'full', 1, 'site-localhost-20160223-021424.jpa', 'C:/wamp/www/travelify/administrator/components/com_akeeba/backup/site-localhost-20160223-021424.jpa', 1, 'backend', 'id1', 1, NULL, 19111585),
(2, 'Backup TicasoVN on Saturday, 07 May 2016', '', '2016-05-06 20:44:43', '2016-05-06 20:48:10', 'complete', 'backend', 'full', 1, 'site-localhost-20160507-034443.jpa', 'C:/wamp/www/travelify/administrator/components/com_akeeba/backup/site-localhost-20160507-034443.jpa', 1, 'backend', 'id2', 1, NULL, 21594660);

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_ak_storage`
--

CREATE TABLE IF NOT EXISTS `hyxu5_ak_storage` (
  `tag` varchar(255) NOT NULL,
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data` longtext,
  PRIMARY KEY (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_assets`
--

CREATE TABLE IF NOT EXISTS `hyxu5_assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set parent.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `level` int(10) unsigned NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_asset_name` (`name`),
  KEY `idx_lft_rgt` (`lft`,`rgt`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=170 ;

--
-- Dumping data for table `hyxu5_assets`
--

INSERT INTO `hyxu5_assets` (`id`, `parent_id`, `lft`, `rgt`, `level`, `name`, `title`, `rules`) VALUES
(1, 0, 0, 197, 0, 'root.1', 'Root Asset', '{"core.login.site":{"6":1,"2":1},"core.login.admin":{"6":1},"core.login.offline":{"6":1},"core.admin":{"8":1},"core.manage":{"7":1},"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(2, 1, 1, 2, 1, 'com_admin', 'com_admin', '{}'),
(3, 1, 3, 6, 1, 'com_banners', 'com_banners', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(4, 1, 7, 8, 1, 'com_cache', 'com_cache', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(5, 1, 9, 10, 1, 'com_checkin', 'com_checkin', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(6, 1, 11, 12, 1, 'com_config', 'com_config', '{}'),
(7, 1, 13, 16, 1, 'com_contact', 'com_contact', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(8, 1, 17, 56, 1, 'com_content', 'com_content', '{"core.admin":{"7":1},"core.options":[],"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(9, 1, 57, 58, 1, 'com_cpanel', 'com_cpanel', '{}'),
(10, 1, 59, 60, 1, 'com_installer', 'com_installer', '{"core.admin":[],"core.manage":{"7":0},"core.delete":{"7":0},"core.edit.state":{"7":0}}'),
(11, 1, 61, 62, 1, 'com_languages', 'com_languages', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(12, 1, 63, 64, 1, 'com_login', 'com_login', '{}'),
(13, 1, 65, 66, 1, 'com_mailto', 'com_mailto', '{}'),
(14, 1, 67, 68, 1, 'com_massmail', 'com_massmail', '{}'),
(15, 1, 69, 70, 1, 'com_media', 'com_media', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":{"5":1}}'),
(16, 1, 71, 72, 1, 'com_menus', 'com_menus', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(17, 1, 73, 74, 1, 'com_messages', 'com_messages', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(18, 1, 75, 150, 1, 'com_modules', 'com_modules', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(19, 1, 151, 154, 1, 'com_newsfeeds', 'com_newsfeeds', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(20, 1, 155, 156, 1, 'com_plugins', 'com_plugins', '{"core.admin":{"7":1},"core.manage":[],"core.edit":[],"core.edit.state":[]}'),
(21, 1, 157, 158, 1, 'com_redirect', 'com_redirect', '{"core.admin":{"7":1},"core.manage":[]}'),
(22, 1, 159, 160, 1, 'com_search', 'com_search', '{"core.admin":{"7":1},"core.options":[],"core.manage":{"6":1},"core.edit.state":[]}'),
(23, 1, 161, 162, 1, 'com_templates', 'com_templates', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(24, 1, 163, 166, 1, 'com_users', 'com_users', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(26, 1, 167, 168, 1, 'com_wrapper', 'com_wrapper', '{}'),
(27, 8, 18, 55, 2, 'com_content.category.2', 'Travelify', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(28, 3, 4, 5, 2, 'com_banners.category.3', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(29, 7, 14, 15, 2, 'com_contact.category.4', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(30, 19, 152, 153, 2, 'com_newsfeeds.category.5', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(32, 24, 164, 165, 1, 'com_users.category.7', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(33, 1, 169, 170, 1, 'com_finder', 'com_finder', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(34, 1, 171, 172, 1, 'com_joomlaupdate', 'com_joomlaupdate', '{"core.admin":[],"core.manage":[],"core.delete":[],"core.edit.state":[]}'),
(35, 1, 173, 174, 1, 'com_tags', 'com_tags', '{"core.admin":[],"core.options":[],"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(36, 1, 175, 176, 1, 'com_contenthistory', 'com_contenthistory', '{}'),
(37, 1, 177, 178, 1, 'com_ajax', 'com_ajax', '{}'),
(38, 1, 179, 180, 1, 'com_postinstall', 'com_postinstall', '{}'),
(39, 18, 76, 77, 2, 'com_modules.module.1', 'Main Menu', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(40, 18, 78, 79, 2, 'com_modules.module.2', 'Login', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(41, 18, 80, 81, 2, 'com_modules.module.3', 'Popular Articles', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(42, 18, 82, 83, 2, 'com_modules.module.4', 'Recently Added Articles', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(43, 18, 84, 85, 2, 'com_modules.module.8', 'Toolbar', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(44, 18, 86, 87, 2, 'com_modules.module.9', 'Quick Icons', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(45, 18, 88, 89, 2, 'com_modules.module.10', 'Logged-in Users', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(46, 18, 90, 91, 2, 'com_modules.module.12', 'Admin Menu', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(47, 18, 92, 93, 2, 'com_modules.module.13', 'Admin Submenu', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(48, 18, 94, 95, 2, 'com_modules.module.14', 'User Status', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(49, 18, 96, 97, 2, 'com_modules.module.15', 'Title', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(50, 18, 98, 99, 2, 'com_modules.module.16', 'Login Form', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(51, 18, 100, 101, 2, 'com_modules.module.17', 'Breadcrumbs', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(52, 18, 102, 103, 2, 'com_modules.module.79', 'Multilanguage status', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(53, 18, 104, 105, 2, 'com_modules.module.86', 'Joomla Version', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(54, 18, 106, 107, 2, 'com_modules.module.87', 'social-icons', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(55, 18, 108, 109, 2, 'com_modules.module.88', 'logo', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(58, 18, 110, 111, 2, 'com_modules.module.90', 'BM Cool Menu', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(59, 18, 112, 113, 2, 'com_modules.module.91', 'BT Content Slider', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(60, 157, 40, 41, 4, 'com_content.article.1', 'Content Layout Preview', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(61, 95, 32, 33, 4, 'com_content.article.2', 'Design Simplicity Inspired by Nature', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(63, 94, 20, 21, 4, 'com_content.article.3', 'This post has no body – almost', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(72, 18, 114, 115, 2, 'com_modules.module.96', 'Blog Factory Menu', '{}'),
(80, 18, 116, 117, 2, 'com_modules.module.103', 'Search', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(81, 18, 118, 119, 2, 'com_modules.module.104', 'Smart Latest News right', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(82, 18, 120, 121, 2, 'com_modules.module.105', 'Articles - Category ', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(94, 27, 19, 30, 3, 'com_content.category.11', 'New York', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(95, 27, 31, 36, 3, 'com_content.category.12', 'Other', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(97, 18, 122, 123, 2, 'com_modules.module.110', 'statistic', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(98, 18, 124, 125, 2, 'com_modules.module.111', 'Right Menu', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(102, 18, 126, 127, 2, 'com_modules.module.114', 'Category statictis', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(103, 18, 128, 129, 2, 'com_modules.module.115', 'Recent bottom 2', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(104, 18, 130, 131, 2, 'com_modules.module.116', 'Recent bottom 1', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(105, 18, 132, 133, 2, 'com_modules.module.117', 'Tag Cloud', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(106, 1, 181, 182, 1, '#__ucm_content.1', '#__ucm_content.1', '[]'),
(107, 18, 134, 135, 2, 'com_modules.module.118', 'Tag Cloud 2', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(108, 18, 136, 137, 2, 'com_modules.module.119', 'copyright', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(109, 18, 138, 139, 2, 'com_modules.module.120', 'footer right', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(110, 18, 140, 141, 2, 'com_modules.module.121', 'breadcrumbs', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(111, 94, 22, 23, 4, 'com_content.article.4', 'Post Format Test: Aside', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(112, 1, 183, 184, 1, '#__ucm_content.2', '#__ucm_content.2', '[]'),
(113, 94, 26, 27, 4, 'com_content.article.5', 'Design Simplicity Inspired by Nature', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(114, 95, 34, 35, 4, 'com_content.article.6', 'This is the right theme for you. Period', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(119, 1, 185, 186, 1, 'com_chronoforms5', 'com_chronoforms5', '{}'),
(120, 18, 142, 143, 2, 'com_modules.module.124', 'Archives', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(121, 27, 37, 38, 3, 'com_content.article.7', 'Tiled Gallery Preview for Travelify WordPress Theme', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(122, 18, 144, 145, 2, 'com_modules.module.125', 'recent-posts-6', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(123, 94, 24, 25, 4, 'com_content.article.8', 'SoundCloud Preview', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(153, 1, 187, 188, 1, 'com_comment', 'COM_COMMENT', '{}'),
(154, 1, 189, 190, 1, '#__ucm_content.3', '#__ucm_content.3', '[]'),
(155, 94, 28, 29, 4, 'com_content.article.9', 'test', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(156, 18, 146, 147, 2, 'com_modules.module.126', 'News Calendar', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(157, 27, 39, 42, 3, 'com_content.category.13', 'Spain', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(158, 27, 43, 46, 3, 'com_content.category.14', 'France', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(159, 27, 47, 50, 3, 'com_content.category.15', 'Italy', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(160, 27, 51, 54, 3, 'com_content.category.16', 'Miami', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(161, 158, 44, 45, 4, 'com_content.article.10', 'Post Format Test: Chat – This article has so long title that it will wrap in new line', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(162, 159, 48, 49, 4, 'com_content.article.11', 'Post Format Test: Gallery', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(163, 160, 52, 53, 4, 'com_content.article.12', 'Post Format Test: Image (Linked)', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(164, 1, 191, 192, 1, 'com_akeeba', 'Akeeba', '{}'),
(167, 18, 148, 149, 2, 'com_modules.module.127', 'Login', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(168, 1, 193, 196, 1, 'com_docstation', 'com_docstation', '{"core.admin":[],"core.manage":[],"core.attach":[],"core.create":[],"core.delete":[],"core.delete.own":[],"core.edit":[],"core.edit.own":[],"core.edit.state":[],"core.edit.state.own":[]}'),
(169, 168, 194, 195, 2, 'com_docstation.category.18', 'Uncategorised', '[]');

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_associations`
--

CREATE TABLE IF NOT EXISTS `hyxu5_associations` (
  `id` int(11) NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.',
  PRIMARY KEY (`context`,`id`),
  KEY `idx_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_banners`
--

CREATE TABLE IF NOT EXISTS `hyxu5_banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `clickurl` varchar(200) NOT NULL DEFAULT '',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `custombannercode` varchar(2048) NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `params` text NOT NULL,
  `own_prefix` tinyint(1) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `language` char(7) NOT NULL DEFAULT '',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`),
  KEY `idx_banner_catid` (`catid`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_banner_clients`
--

CREATE TABLE IF NOT EXISTS `hyxu5_banner_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contact` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `extrainfo` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `metakey` text NOT NULL,
  `own_prefix` tinyint(4) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_banner_tracks`
--

CREATE TABLE IF NOT EXISTS `hyxu5_banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  KEY `idx_track_date` (`track_date`),
  KEY `idx_track_type` (`track_type`),
  KEY `idx_banner_id` (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_blogsten_account`
--

CREATE TABLE IF NOT EXISTS `hyxu5_blogsten_account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL DEFAULT '',
  `published` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `updated` int(10) unsigned NOT NULL DEFAULT '0',
  `session_id` varchar(85) NOT NULL,
  `interval` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `category` int(10) unsigned NOT NULL DEFAULT '0',
  `lastchecked` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `active` tinyint(1) unsigned NOT NULL,
  `section` int(11) NOT NULL,
  `whitelist` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_blogsten_item`
--

CREATE TABLE IF NOT EXISTS `hyxu5_blogsten_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) NOT NULL,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `address` varchar(85) NOT NULL,
  `account` int(10) unsigned NOT NULL DEFAULT '0',
  `contentid` int(10) NOT NULL,
  `component` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_blogsten_media`
--

CREATE TABLE IF NOT EXISTS `hyxu5_blogsten_media` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `msgid` int(10) unsigned NOT NULL,
  `filename` varchar(255) NOT NULL,
  `type` varchar(10) NOT NULL,
  `subtype` varchar(10) NOT NULL,
  `ordering` int(10) unsigned NOT NULL,
  `published` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_published` (`published`),
  KEY `idx_ordering` (`ordering`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_blogsten_timer`
--

CREATE TABLE IF NOT EXISTS `hyxu5_blogsten_timer` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `interval` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `hyxu5_blogsten_timer`
--

INSERT INTO `hyxu5_blogsten_timer` (`id`, `interval`) VALUES
(1, '2016-02-19 03:46:04');

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_blogsten_user`
--

CREATE TABLE IF NOT EXISTS `hyxu5_blogsten_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(85) NOT NULL,
  `addresses` text NOT NULL,
  `published` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `auto_publish` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `category` int(10) unsigned NOT NULL DEFAULT '0',
  `juid` int(10) unsigned NOT NULL DEFAULT '0',
  `section` int(10) NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_published` (`published`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_categories`
--

CREATE TABLE IF NOT EXISTS `hyxu5_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `extension` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `metadesc` varchar(1024) NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`extension`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `hyxu5_categories`
--

INSERT INTO `hyxu5_categories` (`id`, `asset_id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `extension`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `modified_user_id`, `modified_time`, `hits`, `language`, `version`) VALUES
(1, 0, 0, 0, 33, 0, '', 'system', 'ROOT', 'root', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{}', '', '', '{}', 42, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(2, 27, 1, 1, 14, 1, 'uncategorised', 'com_content', 'Travelify', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 42, '2011-01-01 00:00:01', 198, '2016-02-21 15:49:59', 0, '*', 1),
(3, 28, 1, 15, 16, 1, 'uncategorised', 'com_banners', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(4, 29, 1, 17, 18, 1, 'uncategorised', 'com_contact', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(5, 30, 1, 19, 20, 1, 'uncategorised', 'com_newsfeeds', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(7, 32, 1, 21, 22, 1, 'uncategorised', 'com_users', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(11, 94, 2, 2, 3, 2, 'uncategorised/new-york', 'com_content', 'New York', 'new-york', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 198, '2016-02-19 02:22:53', 0, '2016-02-19 02:22:53', 0, '*', 1),
(12, 95, 2, 4, 5, 2, 'uncategorised/other', 'com_content', 'Other', 'other', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 198, '2016-02-19 02:23:11', 0, '2016-02-19 02:23:11', 0, '*', 1),
(13, 157, 2, 6, 7, 2, 'uncategorised/spain', 'com_content', 'Spain', 'spain', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 198, '2016-02-21 16:36:34', 0, '2016-02-21 16:36:34', 0, '*', 1),
(14, 158, 2, 8, 9, 2, 'uncategorised/france', 'com_content', 'France', 'france', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 198, '2016-02-21 16:36:46', 0, '2016-02-21 16:36:46', 0, '*', 1),
(15, 159, 2, 10, 11, 2, 'uncategorised/italy', 'com_content', 'Italy', 'italy', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 198, '2016-02-21 16:36:58', 0, '2016-02-21 16:36:58', 0, '*', 1),
(16, 160, 2, 12, 13, 2, 'uncategorised/miami', 'com_content', 'Miami', 'miami', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 198, '2016-02-21 16:37:18', 0, '2016-02-21 16:37:18', 0, '*', 1),
(18, 169, 1, 31, 32, 1, 'uncategorised', 'com_docstation', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '', '', '', '', 198, '2016-02-23 03:47:37', 0, '2016-02-23 03:47:37', 0, '*', 1);

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_chronoengine_chronoforms`
--

CREATE TABLE IF NOT EXISTS `hyxu5_chronoengine_chronoforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `extras` longtext NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `app` varchar(255) NOT NULL DEFAULT '',
  `form_type` int(1) NOT NULL DEFAULT '1',
  `content` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `hyxu5_chronoengine_chronoforms`
--

INSERT INTO `hyxu5_chronoengine_chronoforms` (`id`, `title`, `params`, `extras`, `published`, `app`, `form_type`, `content`) VALUES
(1, 'contact', '{"description":"","setup":"0","theme":"none","tight_layout":"0","rtl_support":"0","labels_right_aligned":"0","labels_auto_width":"0","js_validation_language":""}', 'YTo0OntzOjY6ImZpZWxkcyI7YTo1OntpOjE7YToxODp7czo0OiJuYW1lIjtzOjQ6Im5hbWUiO3M6MjoiaWQiO3M6MTI6ImNvbnRhY3QtbmFtZSI7czo1OiJ2YWx1ZSI7czowOiIiO3M6NToibGFiZWwiO2E6Mjp7czo0OiJ0ZXh0IjtzOjIxOiJZb3VyIE5hbWUgKHJlcXVpcmVkKSAiO3M6ODoicG9zaXRpb24iO3M6MzoidG9wIjt9czo4OiJzdWJsYWJlbCI7czowOiIiO3M6MTE6InBsYWNlaG9sZGVyIjtzOjA6IiI7czo5OiJtYXhsZW5ndGgiO3M6MDoiIjtzOjQ6InNpemUiO3M6MDoiIjtzOjU6ImNsYXNzIjtzOjA6IiI7czo1OiJ0aXRsZSI7czowOiIiO3M6NToic3R5bGUiO3M6MDoiIjtzOjE1OiI6ZGF0YS1pbnB1dG1hc2siO3M6MDoiIjtzOjY6InBhcmFtcyI7czowOiIiO3M6MTY6IjpkYXRhLWxvYWQtc3RhdGUiO3M6MDoiIjtzOjEzOiI6ZGF0YS10b29sdGlwIjtzOjA6IiI7czo0OiJ0eXBlIjtzOjQ6InRleHQiO3M6MTI6ImNvbnRhaW5lcl9pZCI7czoxOiIwIjtzOjEwOiJ2YWxpZGF0aW9uIjthOjEzOntzOjg6InJlcXVpcmVkIjtzOjE6IjEiO3M6NToiYWxwaGEiO3M6MToiMSI7czo4OiJhbHBoYW51bSI7czowOiIiO3M6NToiZGlnaXQiO3M6MDoiIjtzOjc6Im5vZGlnaXQiO3M6MDoiIjtzOjc6Im5vc3BhY2UiO3M6MDoiIjtzOjY6Im51bWJlciI7czowOiIiO3M6NToiZW1haWwiO3M6MDoiIjtzOjU6InBob25lIjtzOjA6IiI7czoxMToicGhvbmVfaW50ZXIiO3M6MDoiIjtzOjM6InVybCI7czowOiIiO3M6NzoiY29uZmlybSI7czowOiIiO3M6NjoiY3VzdG9tIjtzOjA6IiI7fX1pOjI7YToxODp7czo0OiJuYW1lIjtzOjU6ImVtYWlsIjtzOjI6ImlkIjtzOjEzOiJjb250YWN0LWVtYWlsIjtzOjU6InZhbHVlIjtzOjA6IiI7czo1OiJsYWJlbCI7YToyOntzOjQ6InRleHQiO3M6MjE6IllvdXIgRW1haWwgKHJlcXVpcmVkKSI7czo4OiJwb3NpdGlvbiI7czozOiJ0b3AiO31zOjg6InN1YmxhYmVsIjtzOjA6IiI7czoxMToicGxhY2Vob2xkZXIiO3M6MDoiIjtzOjk6Im1heGxlbmd0aCI7czowOiIiO3M6NDoic2l6ZSI7czowOiIiO3M6NToiY2xhc3MiO3M6MDoiIjtzOjU6InRpdGxlIjtzOjA6IiI7czo1OiJzdHlsZSI7czowOiIiO3M6MTU6IjpkYXRhLWlucHV0bWFzayI7czowOiIiO3M6NjoicGFyYW1zIjtzOjA6IiI7czoxNjoiOmRhdGEtbG9hZC1zdGF0ZSI7czowOiIiO3M6MTM6IjpkYXRhLXRvb2x0aXAiO3M6MDoiIjtzOjQ6InR5cGUiO3M6NDoidGV4dCI7czoxMjoiY29udGFpbmVyX2lkIjtzOjE6IjAiO3M6MTA6InZhbGlkYXRpb24iO2E6MTM6e3M6ODoicmVxdWlyZWQiO3M6MToiMSI7czo1OiJhbHBoYSI7czowOiIiO3M6ODoiYWxwaGFudW0iO3M6MDoiIjtzOjU6ImRpZ2l0IjtzOjA6IiI7czo3OiJub2RpZ2l0IjtzOjA6IiI7czo3OiJub3NwYWNlIjtzOjA6IiI7czo2OiJudW1iZXIiO3M6MDoiIjtzOjU6ImVtYWlsIjtzOjE6IjEiO3M6NToicGhvbmUiO3M6MDoiIjtzOjExOiJwaG9uZV9pbnRlciI7czowOiIiO3M6MzoidXJsIjtzOjA6IiI7czo3OiJjb25maXJtIjtzOjA6IiI7czo2OiJjdXN0b20iO3M6MDoiIjt9fWk6MzthOjE4OntzOjQ6Im5hbWUiO3M6Nzoic3ViamVjdCI7czoyOiJpZCI7czoxNToiY29udGFjdC1zdWJqZWN0IjtzOjU6InZhbHVlIjtzOjA6IiI7czo1OiJsYWJlbCI7YToyOntzOjQ6InRleHQiO3M6NzoiU3ViamVjdCI7czo4OiJwb3NpdGlvbiI7czozOiJ0b3AiO31zOjg6InN1YmxhYmVsIjtzOjA6IiI7czoxMToicGxhY2Vob2xkZXIiO3M6MDoiIjtzOjk6Im1heGxlbmd0aCI7czowOiIiO3M6NDoic2l6ZSI7czowOiIiO3M6NToiY2xhc3MiO3M6MDoiIjtzOjU6InRpdGxlIjtzOjA6IiI7czo1OiJzdHlsZSI7czowOiIiO3M6MTU6IjpkYXRhLWlucHV0bWFzayI7czowOiIiO3M6NjoicGFyYW1zIjtzOjA6IiI7czoxNjoiOmRhdGEtbG9hZC1zdGF0ZSI7czowOiIiO3M6MTM6IjpkYXRhLXRvb2x0aXAiO3M6MDoiIjtzOjQ6InR5cGUiO3M6NDoidGV4dCI7czoxMjoiY29udGFpbmVyX2lkIjtzOjE6IjAiO3M6MTA6InZhbGlkYXRpb24iO2E6MTM6e3M6ODoicmVxdWlyZWQiO3M6MDoiIjtzOjU6ImFscGhhIjtzOjE6IjEiO3M6ODoiYWxwaGFudW0iO3M6MDoiIjtzOjU6ImRpZ2l0IjtzOjA6IiI7czo3OiJub2RpZ2l0IjtzOjA6IiI7czo3OiJub3NwYWNlIjtzOjA6IiI7czo2OiJudW1iZXIiO3M6MDoiIjtzOjU6ImVtYWlsIjtzOjA6IiI7czo1OiJwaG9uZSI7czowOiIiO3M6MTE6InBob25lX2ludGVyIjtzOjA6IiI7czozOiJ1cmwiO3M6MDoiIjtzOjc6ImNvbmZpcm0iO3M6MDoiIjtzOjY6ImN1c3RvbSI7czowOiIiO319aTo1O2E6MTg6e3M6NDoibmFtZSI7czo3OiJtZXNzYWdlIjtzOjI6ImlkIjtzOjE1OiJjb250YWN0LW1lc3NhZ2UiO3M6NToidmFsdWUiO3M6MDoiIjtzOjU6ImxhYmVsIjthOjI6e3M6NDoidGV4dCI7czoxMjoiWW91ciBNZXNzYWdlIjtzOjg6InBvc2l0aW9uIjtzOjM6InRvcCI7fXM6ODoic3VibGFiZWwiO3M6MDoiIjtzOjExOiJwbGFjZWhvbGRlciI7czowOiIiO3M6NDoicm93cyI7czoyOiIxMCI7czo0OiJjb2xzIjtzOjI6IjQwIjtzOjU6ImNsYXNzIjtzOjA6IiI7czo1OiJ0aXRsZSI7czowOiIiO3M6NToic3R5bGUiO3M6MDoiIjtzOjEzOiI6ZGF0YS13eXNpd3lnIjtzOjE6IjAiO3M6NjoicGFyYW1zIjtzOjA6IiI7czoxNjoiOmRhdGEtbG9hZC1zdGF0ZSI7czowOiIiO3M6MTM6IjpkYXRhLXRvb2x0aXAiO3M6MDoiIjtzOjQ6InR5cGUiO3M6ODoidGV4dGFyZWEiO3M6MTI6ImNvbnRhaW5lcl9pZCI7czoxOiIwIjtzOjEwOiJ2YWxpZGF0aW9uIjthOjg6e3M6ODoicmVxdWlyZWQiO3M6MDoiIjtzOjU6ImFscGhhIjtzOjA6IiI7czo4OiJhbHBoYW51bSI7czowOiIiO3M6NToiZGlnaXQiO3M6MDoiIjtzOjc6Im5vZGlnaXQiO3M6MDoiIjtzOjY6Im51bWJlciI7czowOiIiO3M6NzoiY29uZmlybSI7czowOiIiO3M6NjoiY3VzdG9tIjtzOjA6IiI7fX1pOjY7YToxMDp7czoxMToicmVuZGVyX3R5cGUiO3M6Njoic3VibWl0IjtzOjQ6Im5hbWUiO3M6NzoiYnV0dG9uNiI7czoyOiJpZCI7czoxMjoiY29udGFjdC1zZW5kIjtzOjQ6InR5cGUiO3M6Njoic3VibWl0IjtzOjU6InZhbHVlIjtzOjQ6IlNlbmQiO3M6NToiY2xhc3MiO3M6MTU6ImJ0biBidG4tc3VjY2VzcyI7czo1OiJzdHlsZSI7czowOiIiO3M6NjoicGFyYW1zIjtzOjA6IiI7czoxNjoiOmRhdGEtbG9hZC1zdGF0ZSI7czowOiIiO3M6MTI6ImNvbnRhaW5lcl9pZCI7czoxOiIwIjt9fXM6ODoianNldmVudHMiO2E6Mjp7aToxO2E6NTp7czo1OiJldmVudCI7czowOiIiO3M6NToidmFsdWUiO3M6MDoiIjtzOjY6InNvdXJjZSI7czowOiIiO3M6NjoidGFyZ2V0IjtzOjA6IiI7czo0OiJ0eXBlIjtzOjY6ImVuYWJsZSI7fWk6MjthOjY6e3M6NToiZXZlbnQiO3M6MDoiIjtzOjU6InZhbHVlIjtzOjA6IiI7czo2OiJzb3VyY2UiO3M6MDoiIjtzOjY6InRhcmdldCI7czowOiIiO3M6NjoicGFyZW50IjtzOjE6IjAiO3M6NDoidHlwZSI7czo0OiJzaG93Ijt9fXM6MzoiRE5BIjthOjI6e3M6NDoibG9hZCI7YTo0OntzOjQ6ImpzXzgiO3M6MDoiIjtzOjU6ImNzc183IjtzOjA6IiI7czoxNDoibG9hZF9jYXB0Y2hhXzYiO3M6MDoiIjtzOjY6Imh0bWxfNSI7czowOiIiO31zOjY6InN1Ym1pdCI7YTo4OntzOjE1OiJjaGVja19jYXB0Y2hhXzIiO2E6Mjp7czo3OiJzdWNjZXNzIjtzOjA6IiI7czo0OiJmYWlsIjthOjE6e3M6MTI6ImV2ZW50X2xvb3BfMyI7czowOiIiO319czoxMzoiZmlsZV91cGxvYWRfOSI7YToyOntzOjc6InN1Y2Nlc3MiO3M6MDoiIjtzOjQ6ImZhaWwiO2E6MTp7czoxMzoiZXZlbnRfbG9vcF8xMCI7czowOiIiO319czoxNjoiaGFuZGxlX2FycmF5c18xMyI7czowOiIiO3M6MTA6ImRiX3NhdmVfMTEiO3M6MDoiIjtzOjc6ImVtYWlsXzAiO3M6MDoiIjtzOjc6ImVtYWlsXzEiO3M6MDoiIjtzOjE2OiJ0aGFua3NfbWVzc2FnZV80IjtzOjA6IiI7czoxMToiZGVidWdnZXJfMTIiO3M6MDoiIjt9fXM6MTQ6ImFjdGlvbnNfY29uZmlnIjthOjE0OntpOjg7YToyOntzOjc6ImNvbnRlbnQiO3M6MDoiIjtzOjU6ImZpbGVzIjtzOjA6IiI7fWk6NzthOjI6e3M6NzoiY29udGVudCI7czowOiIiO3M6NToiZmlsZXMiO3M6MDoiIjt9aTo2O2E6Mjp7czo1OiJmb250cyI7czoxOiIxIjtzOjE0OiJyZWZyZXNoX2J1dHRvbiI7czoxOiIwIjt9aTo1O2E6MTE6e3M6NDoicGFnZSI7czoxOiIxIjtzOjEyOiJzdWJtaXRfZXZlbnQiO3M6Njoic3VibWl0IjtzOjExOiJmb3JtX21ldGhvZCI7czo0OiJmaWxlIjtzOjEwOiJhY3Rpb25fdXJsIjtzOjA6IiI7czoxMDoiZm9ybV9jbGFzcyI7czoxMDoiY2hyb25vZm9ybSI7czoxNToiZm9ybV90YWdfYXR0YWNoIjtzOjA6IiI7czoyNDoicmVxdWlyZWRfbGFiZWxzX2lkZW50aWZ5IjtzOjE6IjEiO3M6MTI6InJlbGF0aXZlX3VybCI7czoxOiIxIjtzOjExOiJhamF4X3N1Ym1pdCI7czoxOiIwIjtzOjEzOiJhZGRfZm9ybV90YWdzIjtzOjE6IjEiO3M6OToieGh0bWxfdXJsIjtzOjE6IjAiO31pOjM7YToxOntzOjU6ImV2ZW50IjtzOjQ6ImxvYWQiO31pOjI7YToyOntzOjc6ImVuYWJsZWQiO3M6MToiMCI7czo1OiJlcnJvciI7czo0MzoiWW91IGhhdmUgZW50ZXJlZCBhIHdyb25nIHZlcmlmaWNhdGlvbiBjb2RlISI7fWk6MTA7YToxOntzOjU6ImV2ZW50IjtzOjQ6ImxvYWQiO31pOjk7YToxMTp7czo3OiJlbmFibGVkIjtzOjE6IjAiO3M6NToiZmlsZXMiO3M6MDoiIjtzOjExOiJ1cGxvYWRfcGF0aCI7czowOiIiO3M6ODoibWF4X3NpemUiO3M6MzoiMTAwIjtzOjg6Im1pbl9zaXplIjtzOjE6IjAiO3M6OToibWF4X2Vycm9yIjtzOjU3OiJTb3JyeSwgWW91ciB1cGxvYWRlZCBmaWxlIHNpemUgZXhjZWVkcyB0aGUgYWxsb3dlZCBsaW1pdC4iO3M6OToibWluX2Vycm9yIjtzOjYyOiJTb3JyeSwgWW91ciB1cGxvYWRlZCBmaWxlIHNpemUgaXMgbGVzcyB0aGFuIHRoZSBtaW5pbXVtIGxpbWl0LiI7czoxMDoidHlwZV9lcnJvciI7czo0NjoiU29ycnksIFlvdXIgdXBsb2FkZWQgZmlsZSB0eXBlIGlzIG5vdCBhbGxvd2VkLiI7czoxMjoiYXJyYXlfZmllbGRzIjtzOjA6IiI7czoxNzoiZHluYW1pY19maWxlX25hbWUiO3M6MDoiIjtzOjIwOiJleHRlbnNpb25zX3NlcGFyYXRvciI7czoxOiItIjt9aToxMzthOjU6e3M6NzoiZW5hYmxlZCI7czoxOiIxIjtzOjE2OiJza2lwX2Fzc29jaWF0aXZlIjtzOjE6IjEiO3M6MTE6ImZpZWxkc19saXN0IjtzOjA6IiI7czo5OiJkZWxpbWl0ZXIiO3M6MToiLCI7czo3OiJza2lwcGVkIjtzOjA6IiI7fWk6MTE7YToxNTp7czoxMjoiYWN0aW9uX2xhYmVsIjtzOjA6IiI7czo3OiJlbmFibGVkIjtzOjE6IjAiO3M6OToidGFibGVuYW1lIjtzOjA6IiI7czoxODoic2F2ZV91bmRlcl9tb2RlbGlkIjtzOjE6IjAiO3M6MTA6Im11bHRpX3NhdmUiO3M6MToiMCI7czo4OiJtb2RlbF9pZCI7czo0OiJEYXRhIjtzOjEwOiJmb3JjZV9zYXZlIjtzOjE6IjAiO3M6MTA6ImNvbmRpdGlvbnMiO3M6MDoiIjtzOjEwOiJuZGJfZW5hYmxlIjtzOjE6IjAiO3M6MTA6Im5kYl9kcml2ZXIiO3M6NToibXlzcWwiO3M6ODoibmRiX2hvc3QiO3M6OToibG9jYWxob3N0IjtzOjEyOiJuZGJfZGF0YWJhc2UiO3M6MDoiIjtzOjg6Im5kYl91c2VyIjtzOjA6IiI7czoxMjoibmRiX3Bhc3N3b3JkIjtzOjA6IiI7czoxMDoibmRiX3ByZWZpeCI7czo0OiJqb3NfIjt9aTowO2E6Mjk6e3M6MTI6ImFjdGlvbl9sYWJlbCI7czowOiIiO3M6NzoiZW5hYmxlZCI7czoxOiIwIjtzOjI6InRvIjtzOjA6IiI7czo3OiJzdWJqZWN0IjtzOjA6IiI7czo5OiJmcm9tX25hbWUiO3M6MDoiIjtzOjEwOiJmcm9tX2VtYWlsIjtzOjA6IiI7czoxMDoiZW1haWxfdHlwZSI7czo0OiJodG1sIjtzOjE5OiJ0ZW1wbGF0ZV9nZW5lcmF0aW9uIjtzOjE6IjAiO3M6ODoidGVtcGxhdGUiO3M6MTMwOiI8dGFibGU+DQo8dHI+PHRkPllvdXIgTmFtZSAocmVxdWlyZWQpIDwvdGQ+PHRkPntuYW1lfTwvdGQ+PC90cj4NCjx0cj48dGQ+WW91ciBFbWFpbCAocmVxdWlyZWQpPC90ZD48dGQ+e2VtYWlsfTwvdGQ+PC90cj4NCjwvdGFibGU+IjtzOjY6ImF0dGFjaCI7czowOiIiO3M6MzoiZHRvIjtzOjA6IiI7czo4OiJkc3ViamVjdCI7czowOiIiO3M6MTA6InJlcGx5X25hbWUiO3M6MDoiIjtzOjExOiJyZXBseV9lbWFpbCI7czowOiIiO3M6MTE6ImRyZXBseV9uYW1lIjtzOjA6IiI7czoxMjoiZHJlcGx5X2VtYWlsIjtzOjA6IiI7czoxMDoiZGZyb21fbmFtZSI7czowOiIiO3M6MTE6ImRmcm9tX2VtYWlsIjtzOjA6IiI7czoyOiJjYyI7czowOiIiO3M6MzoiYmNjIjtzOjA6IiI7czozOiJkY2MiO3M6MDoiIjtzOjQ6ImRiY2MiO3M6MDoiIjtzOjE3OiJhcHBlbmRfaXBfYWRkcmVzcyI7czoxOiIxIjtzOjE2OiJfX2FjdGlvbl90aXRsZV9fIjtzOjU6ImVtYWlsIjtzOjE1OiJlbmNyeXB0X2VuYWJsZWQiO3M6MToiMCI7czoxMToiZ3BnX3NlY19rZXkiO3M6MDoiIjtzOjE1OiJ0ZW1wbGF0ZV9oZWFkZXIiO3M6MDoiIjtzOjEzOiJ0ZW1wbGF0ZV9ib2R5IjtzOjA6IiI7czoxNToidGVtcGxhdGVfZm9vdGVyIjtzOjA6IiI7fWk6MTthOjI5OntzOjEyOiJhY3Rpb25fbGFiZWwiO3M6MDoiIjtzOjc6ImVuYWJsZWQiO3M6MToiMCI7czoyOiJ0byI7czowOiIiO3M6Nzoic3ViamVjdCI7czowOiIiO3M6OToiZnJvbV9uYW1lIjtzOjA6IiI7czoxMDoiZnJvbV9lbWFpbCI7czowOiIiO3M6MTA6ImVtYWlsX3R5cGUiO3M6NDoiaHRtbCI7czoxOToidGVtcGxhdGVfZ2VuZXJhdGlvbiI7czoxOiIwIjtzOjg6InRlbXBsYXRlIjtzOjEzMDoiPHRhYmxlPg0KPHRyPjx0ZD5Zb3VyIE5hbWUgKHJlcXVpcmVkKSA8L3RkPjx0ZD57bmFtZX08L3RkPjwvdHI+DQo8dHI+PHRkPllvdXIgRW1haWwgKHJlcXVpcmVkKTwvdGQ+PHRkPntlbWFpbH08L3RkPjwvdHI+DQo8L3RhYmxlPiI7czo2OiJhdHRhY2giO3M6MDoiIjtzOjM6ImR0byI7czowOiIiO3M6ODoiZHN1YmplY3QiO3M6MDoiIjtzOjEwOiJyZXBseV9uYW1lIjtzOjA6IiI7czoxMToicmVwbHlfZW1haWwiO3M6MDoiIjtzOjExOiJkcmVwbHlfbmFtZSI7czowOiIiO3M6MTI6ImRyZXBseV9lbWFpbCI7czowOiIiO3M6MTA6ImRmcm9tX25hbWUiO3M6MDoiIjtzOjExOiJkZnJvbV9lbWFpbCI7czowOiIiO3M6MjoiY2MiO3M6MDoiIjtzOjM6ImJjYyI7czowOiIiO3M6MzoiZGNjIjtzOjA6IiI7czo0OiJkYmNjIjtzOjA6IiI7czoxNzoiYXBwZW5kX2lwX2FkZHJlc3MiO3M6MToiMSI7czoxNjoiX19hY3Rpb25fdGl0bGVfXyI7czo1OiJlbWFpbCI7czoxNToiZW5jcnlwdF9lbmFibGVkIjtzOjE6IjAiO3M6MTE6ImdwZ19zZWNfa2V5IjtzOjA6IiI7czoxNToidGVtcGxhdGVfaGVhZGVyIjtzOjA6IiI7czoxMzoidGVtcGxhdGVfYm9keSI7czowOiIiO3M6MTU6InRlbXBsYXRlX2Zvb3RlciI7czowOiIiO31pOjQ7YToyOntzOjEyOiJhY3Rpb25fbGFiZWwiO3M6MDoiIjtzOjc6Im1lc3NhZ2UiO3M6MDoiIjt9aToxMjthOjE6e3M6NzoiZW5hYmxlZCI7czoxOiIwIjt9fX0=', 1, '', 0, '\r\n<div class="gcore-line-tr gcore-form-row" id="ftr-contact-name"><div class="gcore-line-td" id="ftd-contact-name"><label for="contact-name" class="gcore-label-top">Your Name (required) </label>\r\n<div class="gcore-display-table gcore-input-wide" id="fin-contact-name"><input name="name" id="contact-name" value="" placeholder="" class=" validate[&#039;required&#039;,&#039;alpha&#039;]" title="" style="" data-inputmask="" data-load-state="" data-tooltip="" type="text" /></div></div></div><div class="gcore-line-tr gcore-form-row" id="ftr-contact-email"><div class="gcore-line-td" id="ftd-contact-email"><label for="contact-email" class="gcore-label-top">Your Email (required)</label>\r\n<div class="gcore-display-table gcore-input-wide" id="fin-contact-email"><input name="email" id="contact-email" value="" placeholder="" class=" validate[&#039;required&#039;,&#039;email&#039;]" title="" style="" data-inputmask="" data-load-state="" data-tooltip="" type="text" /></div></div></div><div class="gcore-line-tr gcore-form-row" id="ftr-contact-subject"><div class="gcore-line-td" id="ftd-contact-subject"><label for="contact-subject" class="gcore-label-top">Subject</label>\r\n<div class="gcore-display-table gcore-input-wide" id="fin-contact-subject"><input name="subject" id="contact-subject" value="" placeholder="" class=" validate[&#039;alpha&#039;]" title="" style="" data-inputmask="" data-load-state="" data-tooltip="" type="text" /></div></div></div><div class="gcore-line-tr gcore-form-row" id="ftr-contact-message"><div class="gcore-line-td" id="ftd-contact-message"><label for="contact-message" class="gcore-label-top">Your Message</label>\r\n<div class="gcore-display-table gcore-input-wide" id="fin-contact-message"><textarea name="message" id="contact-message" placeholder="" rows="10" cols="40" class="" title="" style="" data-wysiwyg="0" data-load-state="" data-tooltip=""></textarea></div></div></div><div class="gcore-line-tr gcore-form-row" id="ftr-contact-send"><div class="gcore-line-td" id="ftd-contact-send"><div class="gcore-display-table gcore-input" id="fin-contact-send"><input name="button6" id="contact-send" type="submit" value="Send" class="btn btn-success" style="" data-load-state="" /></div></div></div>');

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_chronoengine_extensions`
--

CREATE TABLE IF NOT EXISTS `hyxu5_chronoengine_extensions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addon_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `ordering` int(4) NOT NULL,
  `settings` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_cjblog_badges`
--

CREATE TABLE IF NOT EXISTS `hyxu5_cjblog_badges` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `alias` varchar(32) NOT NULL,
  `description` varchar(999) NOT NULL,
  `published` tinyint(1) NOT NULL,
  `icon` varchar(64) DEFAULT NULL,
  `css_class` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_CJBLOG_BADGES_NAME_UNIQ` (`alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_cjblog_badge_rules`
--

CREATE TABLE IF NOT EXISTS `hyxu5_cjblog_badge_rules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `badge_id` int(10) unsigned NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `rule_name` varchar(64) NOT NULL,
  `rule_content` varchar(999) NOT NULL,
  `asset_name` varchar(64) NOT NULL,
  `asset_title` varchar(255) NOT NULL,
  `published` tinyint(1) NOT NULL,
  `num_assigned` int(10) unsigned NOT NULL DEFAULT '0',
  `access` int(6) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_cjblog_content`
--

CREATE TABLE IF NOT EXISTS `hyxu5_cjblog_content` (
  `id` int(11) NOT NULL,
  `favorites` int(11) NOT NULL DEFAULT '0',
  `comments` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_cjblog_favorites`
--

CREATE TABLE IF NOT EXISTS `hyxu5_cjblog_favorites` (
  `content_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`content_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_cjblog_points`
--

CREATE TABLE IF NOT EXISTS `hyxu5_cjblog_points` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `rule_id` int(10) unsigned NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `points` int(11) NOT NULL DEFAULT '0',
  `ref_id` varchar(255) DEFAULT NULL,
  `description` varchar(999) DEFAULT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_cjblog_point_rules`
--

CREATE TABLE IF NOT EXISTS `hyxu5_cjblog_point_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) CHARACTER SET latin1 NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `asset_name` varchar(128) NOT NULL,
  `auto_approve` tinyint(1) NOT NULL DEFAULT '1',
  `conditional_rules` varchar(5120) DEFAULT NULL,
  `access` int(6) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_points_rule_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_cjblog_ranks`
--

CREATE TABLE IF NOT EXISTS `hyxu5_cjblog_ranks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `classname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_cjblog_tagmap`
--

CREATE TABLE IF NOT EXISTS `hyxu5_cjblog_tagmap` (
  `tag_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  PRIMARY KEY (`tag_id`,`item_id`),
  KEY `IDX_CJBLOG_TAGSMAP_ITEMID` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_cjblog_tags`
--

CREATE TABLE IF NOT EXISTS `hyxu5_cjblog_tags` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tag_text` varchar(50) NOT NULL DEFAULT '0',
  `alias` varchar(50) NOT NULL,
  `description` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_CJBLOG_TAGS_TAGTEXT` (`tag_text`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_cjblog_tags_stats`
--

CREATE TABLE IF NOT EXISTS `hyxu5_cjblog_tags_stats` (
  `tag_id` int(11) NOT NULL,
  `num_items` int(10) unsigned NOT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_cjblog_users`
--

CREATE TABLE IF NOT EXISTS `hyxu5_cjblog_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `about` mediumtext,
  `num_articles` int(10) unsigned NOT NULL DEFAULT '0',
  `avatar` varchar(32) DEFAULT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  `num_badges` int(10) unsigned NOT NULL DEFAULT '0',
  `country` varchar(255) DEFAULT NULL,
  `user_rank` int(10) unsigned DEFAULT NULL,
  `profile_views` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_cjblog_user_badge_map`
--

CREATE TABLE IF NOT EXISTS `hyxu5_cjblog_user_badge_map` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `badge_id` int(10) unsigned NOT NULL DEFAULT '0',
  `date_assigned` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rule_id` int(10) unsigned NOT NULL,
  `ref_id` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_cjlib_config`
--

CREATE TABLE IF NOT EXISTS `hyxu5_cjlib_config` (
  `config_name` varchar(255) NOT NULL,
  `config_value` text NOT NULL,
  PRIMARY KEY (`config_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_comment`
--

CREATE TABLE IF NOT EXISTS `hyxu5_comment` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `contentid` int(10) NOT NULL DEFAULT '0',
  `component` varchar(50) NOT NULL DEFAULT '',
  `ip` varchar(15) NOT NULL DEFAULT '',
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `name` varchar(30) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `website` varchar(100) NOT NULL DEFAULT '',
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `title` varchar(50) NOT NULL DEFAULT '',
  `comment` text NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `spam` tinyint(1) NOT NULL DEFAULT '0',
  `voting_yes` int(10) NOT NULL DEFAULT '0',
  `voting_no` int(10) NOT NULL DEFAULT '0',
  `parentid` int(10) NOT NULL DEFAULT '-1',
  `importtable` varchar(30) NOT NULL DEFAULT '',
  `importid` int(10) NOT NULL DEFAULT '0',
  `importparentid` int(10) NOT NULL DEFAULT '-1',
  `unsubscribe_hash` varchar(255) NOT NULL,
  `moderate_hash` varchar(255) NOT NULL,
  `customfields` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `com_contentid` (`component`,`contentid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `hyxu5_comment`
--

INSERT INTO `hyxu5_comment` (`id`, `contentid`, `component`, `ip`, `userid`, `modified_by`, `date`, `modified`, `name`, `email`, `website`, `notify`, `title`, `comment`, `published`, `deleted`, `spam`, `voting_yes`, `voting_no`, `parentid`, `importtable`, `importid`, `importparentid`, `unsubscribe_hash`, `moderate_hash`, `customfields`) VALUES
(1, 8, 'com_content', '::1', 0, 0, '2016-02-21 16:32:45', '0000-00-00 00:00:00', 'toan', 'toan005@gmail.com', '', 0, '', 'Comment1', 1, 0, 0, 0, 0, -1, '', 0, -1, 'c382d635803488bc956518abf4f2cd08', '4fe1d1783ffd709ac7d82e732617cc71', '');

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_comment_captcha`
--

CREATE TABLE IF NOT EXISTS `hyxu5_comment_captcha` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `insertdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `referenceid` varchar(100) NOT NULL DEFAULT '',
  `hiddentext` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_comment_queue`
--

CREATE TABLE IF NOT EXISTS `hyxu5_comment_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mailfrom` varchar(255) DEFAULT NULL,
  `fromname` varchar(255) DEFAULT NULL,
  `recipient` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `created` datetime NOT NULL,
  `type` varchar(10) NOT NULL DEFAULT 'html',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_comment_setting`
--

CREATE TABLE IF NOT EXISTS `hyxu5_comment_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `note` varchar(50) NOT NULL DEFAULT '',
  `component` varchar(50) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `hyxu5_comment_setting`
--

INSERT INTO `hyxu5_comment_setting` (`id`, `note`, `component`, `params`) VALUES
(1, 'The standard joomla article manager', 'com_content', '{"basic":{"include_categories":"0","exclude_content_items":""},"security":{"authorised_users":["1"],"auto_publish":"1","notify_moderators":"0","moderators":["8"],"captcha":"0","captcha_type":"default","maxlength_text":"30000"},"layout":{"tree":"0","sort":"0","comments_per_page":"0","support_ubb":"1","support_pictures":"0","pictures_maxwidth":"200","voting_visible":"0","date_format":"age","show_readon":"1","menu_readon":"0","intro_only":"0","emoticon_pack":"default"},"template":{"template":"default"},"template_params":{"emulate_bootstrap":"1","minify_scripts":"1","notify_users":"1","pagination_position":"0","form_position":"0","form_avatar":"1","form_ubb":"1","required_user":"0","required_email":"1","show_rss":"0","show_search":"0","preview_visible":"0","preview_length":"80","preview_lines":"5"},"integrations":{"gravatar":"1","support_profiles":"0"}}');

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_comment_voting`
--

CREATE TABLE IF NOT EXISTS `hyxu5_comment_voting` (
  `id` int(10) NOT NULL DEFAULT '0',
  `ip` varchar(15) NOT NULL DEFAULT '',
  `time` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_compojoom_customfields`
--

CREATE TABLE IF NOT EXISTS `hyxu5_compojoom_customfields` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `slug` varchar(255) NOT NULL DEFAULT '',
  `component` varchar(255) NOT NULL DEFAULT '',
  `show` enum('all','category') NOT NULL DEFAULT 'all',
  `type` varchar(100) NOT NULL DEFAULT 'text',
  `options` mediumtext,
  `default` varchar(255) DEFAULT '',
  `allow_empty` tinyint(3) NOT NULL DEFAULT '0',
  `params` mediumtext,
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  `filter` tinyint(3) NOT NULL DEFAULT '0',
  `ordering` bigint(20) unsigned NOT NULL DEFAULT '0',
  `created_by` bigint(20) NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` bigint(20) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_compojoom_customfields_cats`
--

CREATE TABLE IF NOT EXISTS `hyxu5_compojoom_customfields_cats` (
  `compojoom_customfields_id` int(11) NOT NULL,
  `catid` int(11) NOT NULL,
  PRIMARY KEY (`compojoom_customfields_id`,`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_compojoom_multimedia`
--

CREATE TABLE IF NOT EXISTS `hyxu5_compojoom_multimedia` (
  `compojoom_multimedia_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `type_alias` varchar(255) DEFAULT '',
  `title` varchar(1024) NOT NULL,
  `description` text NOT NULL,
  `mangled_filename` varchar(1024) NOT NULL,
  `mime_type` varchar(255) NOT NULL DEFAULT 'application/octet-stream',
  `origin` varchar(40) DEFAULT 'web',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` bigint(20) NOT NULL DEFAULT '0',
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  PRIMARY KEY (`compojoom_multimedia_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_contact_details`
--

CREATE TABLE IF NOT EXISTS `hyxu5_contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `con_position` varchar(255) DEFAULT NULL,
  `address` text,
  `suburb` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postcode` varchar(100) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `misc` mediumtext,
  `image` varchar(255) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `default_con` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `webpage` varchar(255) NOT NULL DEFAULT '',
  `sortname1` varchar(255) NOT NULL,
  `sortname2` varchar(255) NOT NULL,
  `sortname3` varchar(255) NOT NULL,
  `language` char(7) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_content`
--

CREATE TABLE IF NOT EXISTS `hyxu5_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` varchar(5120) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `language` char(7) NOT NULL COMMENT 'The language code for the article.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `hyxu5_content`
--

INSERT INTO `hyxu5_content` (`id`, `asset_id`, `title`, `alias`, `introtext`, `fulltext`, `state`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`, `featured`, `language`, `xreference`) VALUES
(1, 60, 'Content Layout Preview', 'content-layout-preview', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Sed odio nibh, tincidunt adipiscing, pretium nec, tincidunt id, enim. Fusce scelerisque nunc vitae nisl. Quisque quis urna in velit dictum pellentesque.', '{jcomments on}', 1, 13, '2016-02-16 08:56:47', 198, '', '2016-02-22 02:14:30', 198, 0, '0000-00-00 00:00:00', '2016-02-16 08:56:47', '0000-00-00 00:00:00', '{"image_intro":"images\\/spain6-1018x460.jpg","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 5, 2, '', '', 1, 9, '{"robots":"","author":"","rights":"","xreference":""}', 1, '*', ''),
(2, 61, 'Design Simplicity Inspired by Nature', 'design-simplicity-inspired-by-nature', 'This theme is better than most premium themes out there. Download it and see yourself.\r\n', '\r\nNullam rhoncus eleifend ornare. Fusce vulputate neque in nisi vehicula vitae adipiscing tortor volutpat. Vivamus id leo et est tincidunt placerat. In laoreet purus vitae neque bibendum vel viverra urna accumsan. Nullam at lacus tincidunt tortor dictum vulputate a vitae nulla. Vivamus condimentum eleifend enim non ultricies. ', 1, 12, '2016-02-16 08:59:11', 198, '', '2016-02-21 16:30:59', 198, 0, '0000-00-00 00:00:00', '2016-02-16 08:59:11', '0000-00-00 00:00:00', '{"image_intro":"images\\/featured-4.jpg","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 7, 1, '', '', 1, 9, '{"robots":"","author":"","rights":"","xreference":""}', 1, '*', ''),
(3, 63, 'This post has no body – almost', 'this-post-has-no-body-almost', 'Cras leo tortor, condimentum id semper eu, sodales id elit. Maecenas commodo dolor vel massa gravida vehicula. Morbi tristique sapien ac dui tempus imperdiet.', '\r\nThis post has no body{jcomments on}', 1, 11, '2016-02-16 10:21:36', 198, '', '2016-02-21 16:57:45', 198, 0, '0000-00-00 00:00:00', '2016-02-16 10:21:36', '0000-00-00 00:00:00', '{"image_intro":"images\\/Spain-Plaza-de-Cibeles-Madrid-670x300.jpg","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"0","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"0","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 13, 3, '', '', 1, 94, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(4, 111, 'Post Format Test: Aside', 'post-format-test-aside', 'I never tried to prove nothing, just wanted to give a good show. My life has always been my music, it’s always come first, but the music ain’t worth nothing if you can’t lay it on the public. The main thing is to live for that audience, ’cause what you’re there for is to please the people.', '\r\n“I never tried to prove nothing, just wanted to give a good show. My life has always been my music, it’s always come first, but the music ain’t worth nothing if you can’t lay it on the public. The main thing is to live for that audience, ’cause what you’re there for is to please the people.”\r\n\r\n', 1, 11, '2016-02-20 08:18:55', 198, '', '2016-02-21 16:57:36', 198, 0, '0000-00-00 00:00:00', '2016-02-20 08:18:55', '0000-00-00 00:00:00', '{"image_intro":"images\\/6040613987_e80842ee05_b-670x300.jpg","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"0","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 3, 4, '', '', 1, 8, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(5, 113, 'Design Simplicity Inspired by Nature', 'design-simplicity-inspired-by-nature', 'This theme is better than most premium themes out there. Download it and see yourself.\r\n', '\r\nNullam rhoncus eleifend ornare. Fusce vulputate neque in nisi vehicula vitae adipiscing tortor volutpat. Vivamus id leo et est tincidunt placerat. In laoreet purus vitae neque bibendum vel viverra urna accumsan. Nullam at lacus tincidunt tortor dictum vulputate a vitae nulla. Vivamus condimentum eleifend enim non ultricies. ', 1, 11, '2016-02-20 10:26:34', 198, '', '2016-02-21 16:57:26', 198, 0, '0000-00-00 00:00:00', '2016-02-20 10:26:34', '0000-00-00 00:00:00', '{"image_intro":"https:\\/\\/colorlib.com\\/travelify\\/wp-content\\/uploads\\/sites\\/4\\/2012\\/06\\/featured-5.jpg","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"0","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 6, 2, '', '', 1, 10, '{"robots":"","author":"","rights":"","xreference":""}', 1, '*', ''),
(6, 114, 'This is the right theme for you. Period', 'this-is-the-right-theme-for-you-period', 'This theme is for free and available via WordPress.org as well as several other websites.', '\r\nALorem ipsum dolor sit amet, consectetuer adipiscing elit. Sed odio nibh, tincidunt adipiscing, pretium nec, tincidunt id, enim. Fusce scelerisque nunc vitae nisl. Quisque quis urna in velit dictum pellentesque. Vivamus a quam.', 1, 12, '2016-02-21 03:25:05', 198, '', '2016-02-21 16:57:16', 198, 0, '0000-00-00 00:00:00', '2016-02-21 03:25:05', '0000-00-00 00:00:00', '{"image_intro":"images\\/7148951717_9bbf185db3_h-1018x460.jpg","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"0","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 13, 1, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 1, '*', ''),
(7, 121, 'Tiled Gallery Preview for Travelify WordPress Theme', 'tiled-gallery-preview-for-travelify-wordpress-theme', 'Cras leo tortor, condimentum id semper eu, sodales id elit. Maecenas commodo dolor vel massa gravida vehicula. Morbi tristique sapien ac dui tempus imperdiet.', '', 2, 2, '2016-02-21 10:39:33', 198, '', '2016-02-21 10:39:33', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '{"image_intro":"images\\/spain6-1018x460.jpg","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 1, '', '', 1, 8, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(8, 123, 'SoundCloud Preview', 'soundcloud-preview', 'This posts show how SoundCloud embeds does work on Travelify theme:\r\n', '\r\nThis posts show how SoundCloud embeds does work on Travelify theme:', 1, 11, '2016-02-21 10:52:02', 198, '', '2016-05-07 03:40:50', 198, 0, '0000-00-00 00:00:00', '2016-02-21 10:52:02', '0000-00-00 00:00:00', '{"image_intro":"images\\/new-york-14-670x300.jpg","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"0","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 14, 1, '', '', 1, 72, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(9, 155, 'test', 'test', 'test', '\r\nThis is test', -2, 11, '2016-02-21 15:52:35', 198, '', '2016-02-21 15:57:01', 198, 0, '0000-00-00 00:00:00', '2016-02-21 15:52:35', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 0, '', '', 1, 1, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(10, 161, 'Post Format Test: Chat – This article has so long title that it will wrap in new line', 'post-format-test-chat-this-article-has-so-long-title-that-it-will-wrap-in-new-line', 'Nullam rhoncus eleifend ornare. Fusce vulputate neque in nisi vehicula vitae adipiscing tortor volutpat. Vivamus id leo et est tincidunt placerat. In laoreet purus vitae neque bibendum vel viverra urna accumsan. Nullam at lacus tincidunt tortor dictum vulputate a vitae nulla. Vivamus condimentum eleifend enim non ultricies.', '\r\nNullam rhoncus eleifend ornare. Fusce vulputate neque in nisi vehicula vitae adipiscing tortor volutpat. Vivamus id leo et est tincidunt placerat. In laoreet purus vitae neque bibendum vel viverra urna accumsan. Nullam at lacus tincidunt tortor dictum vulputate a vitae nulla. Vivamus condimentum eleifend enim non ultricies.\r\n', 1, 14, '2016-02-22 02:16:09', 198, '', '2016-02-22 02:16:09', 0, 0, '0000-00-00 00:00:00', '2016-02-22 02:16:09', '0000-00-00 00:00:00', '{"image_intro":"images\\/5877492285_f307c838c1_b-670x300.jpg","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(11, 162, 'Post Format Test: Gallery', 'post-format-test-gallery', 'Nulla facilisi. Morbi eu neque massa. Phasellus nec rhoncus diam. Morbi elementum ligula quis magna tristique egestas. Donec nec eros nibh, id sollicitudin mi. Mauris eget lorem sed mauris lacinia adipiscing ut id ligula.', '\r\nPost Format Test: Gallery', 1, 15, '2016-02-22 02:18:14', 198, '', '2016-02-22 02:18:14', 0, 0, '0000-00-00 00:00:00', '2016-02-22 02:18:14', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(12, 163, 'Post Format Test: Image (Linked)', 'post-format-test-image-linked', 'Sed a urna augue, et eleifend metus. Phasellus velit tortor, scelerisque non dignissim eu, aliquet a arcu. Aenean ut tortor turpis, id dignissim dolor. Quisque aliquet, nunc eget aliquet bibendum, nunc leo accumsan arcu, vitae pharetra nulla mauris non dui.…', '\r\nUt enim turpis, adipiscing sed commodo eget, vehicula quis lorem. Sed rutrum, mauris vestibulum volutpat iaculis, lacus augue facilisis massa, et volutpat nisl nibh quis quam. Nulla laoreet aliquet libero varius aliquet. Ut ac nisi leo, in ornare dolor. Cras consectetur venenatis metus, a fringilla ligula molestie vitae. Quisque mi tellus, faucibus vel venenatis vel, elementum ut leo. Etiam odio enim, pellentesque vel rutrum nec, auctor a nisl. Praesent feugiat eleifend elit, vitae dignissim nibh posuere ut. Donec at dapibus mauris. Cras vitae lorem sed eros ullamcorper dignissim.', 1, 16, '2016-02-22 02:19:44', 198, '', '2016-02-23 04:52:51', 198, 0, '0000-00-00 00:00:00', '2016-02-22 02:19:44', '0000-00-00 00:00:00', '{"image_intro":"images\\/5661697632_d1ff426de6_b-670x300.jpg","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"0","show_hits":"0","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 3, 0, '', '', 1, 1, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', '');

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_contentitem_tag_map`
--

CREATE TABLE IF NOT EXISTS `hyxu5_contentitem_tag_map` (
  `type_alias` varchar(255) NOT NULL DEFAULT '',
  `core_content_id` int(10) unsigned NOT NULL COMMENT 'PK from the core content table',
  `content_item_id` int(11) NOT NULL COMMENT 'PK from the content type table',
  `tag_id` int(10) unsigned NOT NULL COMMENT 'PK from the tag table',
  `tag_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of most recent save for this tag-item',
  `type_id` mediumint(8) NOT NULL COMMENT 'PK from the content_type table',
  UNIQUE KEY `uc_ItemnameTagid` (`type_id`,`content_item_id`,`tag_id`),
  KEY `idx_tag_type` (`tag_id`,`type_id`),
  KEY `idx_date_id` (`tag_date`,`tag_id`),
  KEY `idx_tag` (`tag_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_core_content_id` (`core_content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maps items from content tables to tags';

--
-- Dumping data for table `hyxu5_contentitem_tag_map`
--

INSERT INTO `hyxu5_contentitem_tag_map` (`type_alias`, `core_content_id`, `content_item_id`, `tag_id`, `tag_date`, `type_id`) VALUES
('com_content.article', 1, 3, 2, '2016-02-21 16:57:46', 1),
('com_content.article', 1, 3, 3, '2016-02-21 16:57:46', 1),
('com_content.article', 1, 3, 4, '2016-02-21 16:57:46', 1),
('com_content.article', 1, 3, 5, '2016-02-21 16:57:46', 1),
('com_content.article', 1, 3, 6, '2016-02-21 16:57:46', 1),
('com_content.article', 1, 3, 7, '2016-02-21 16:57:46', 1),
('com_content.article', 1, 3, 8, '2016-02-21 16:57:46', 1),
('com_content.article', 2, 4, 2, '2016-02-21 16:57:36', 1),
('com_content.article', 2, 4, 3, '2016-02-21 16:57:36', 1),
('com_content.article', 2, 4, 4, '2016-02-21 16:57:36', 1),
('com_content.article', 2, 4, 5, '2016-02-21 16:57:36', 1),
('com_content.article', 2, 4, 6, '2016-02-21 16:57:36', 1),
('com_content.article', 2, 4, 7, '2016-02-21 16:57:36', 1),
('com_content.article', 2, 4, 8, '2016-02-21 16:57:36', 1),
('com_content.article', 2, 4, 9, '2016-02-21 16:57:36', 1),
('com_content.article', 2, 4, 10, '2016-02-21 16:57:36', 1),
('com_content.article', 2, 4, 11, '2016-02-21 16:57:36', 1),
('com_content.article', 2, 4, 12, '2016-02-21 16:57:36', 1),
('com_content.article', 2, 4, 13, '2016-02-21 16:57:36', 1),
('com_content.article', 2, 4, 14, '2016-02-21 16:57:36', 1),
('com_content.article', 3, 6, 2, '2016-02-21 16:57:16', 1),
('com_content.article', 3, 6, 3, '2016-02-21 16:57:16', 1),
('com_content.article', 3, 6, 4, '2016-02-21 16:57:16', 1),
('com_content.article', 3, 6, 5, '2016-02-21 16:57:16', 1),
('com_content.article', 3, 6, 6, '2016-02-21 16:57:16', 1),
('com_content.article', 3, 6, 7, '2016-02-21 16:57:16', 1),
('com_content.article', 3, 6, 8, '2016-02-21 16:57:16', 1),
('com_content.article', 3, 6, 9, '2016-02-21 16:57:16', 1),
('com_content.article', 3, 6, 10, '2016-02-21 16:57:16', 1),
('com_content.article', 3, 6, 11, '2016-02-21 16:57:16', 1),
('com_content.article', 3, 6, 12, '2016-02-21 16:57:16', 1),
('com_content.article', 3, 6, 13, '2016-02-21 16:57:16', 1),
('com_content.article', 3, 6, 14, '2016-02-21 16:57:16', 1);

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_content_frontpage`
--

CREATE TABLE IF NOT EXISTS `hyxu5_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hyxu5_content_frontpage`
--

INSERT INTO `hyxu5_content_frontpage` (`content_id`, `ordering`) VALUES
(1, 4),
(2, 3),
(5, 2),
(6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_content_rating`
--

CREATE TABLE IF NOT EXISTS `hyxu5_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(10) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_content_types`
--

CREATE TABLE IF NOT EXISTS `hyxu5_content_types` (
  `type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_title` varchar(255) NOT NULL DEFAULT '',
  `type_alias` varchar(255) NOT NULL DEFAULT '',
  `table` varchar(255) NOT NULL DEFAULT '',
  `rules` text NOT NULL,
  `field_mappings` text NOT NULL,
  `router` varchar(255) NOT NULL DEFAULT '',
  `content_history_options` varchar(5120) DEFAULT NULL COMMENT 'JSON string for com_contenthistory options',
  PRIMARY KEY (`type_id`),
  KEY `idx_alias` (`type_alias`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `hyxu5_content_types`
--

INSERT INTO `hyxu5_content_types` (`type_id`, `type_title`, `type_alias`, `table`, `rules`, `field_mappings`, `router`, `content_history_options`) VALUES
(1, 'Article', 'com_content.article', '{"special":{"dbtable":"#__content","key":"id","type":"Content","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"state","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"introtext", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"attribs", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"urls", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"xreference", "asset_id":"asset_id"}, "special":{"fulltext":"fulltext"}}', 'ContentHelperRoute::getArticleRoute', '{"formFile":"administrator\\/components\\/com_content\\/models\\/forms\\/article.xml", "hideFields":["asset_id","checked_out","checked_out_time","version"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "hits"],"convertToInt":["publish_up", "publish_down", "featured", "ordering"],"displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"} ]}'),
(2, 'Contact', 'com_contact.contact', '{"special":{"dbtable":"#__contact_details","key":"id","type":"Contact","prefix":"ContactTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"published","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"address", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"image", "core_urls":"webpage", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"xreference", "asset_id":"null"}, "special":{"con_position":"con_position","suburb":"suburb","state":"state","country":"country","postcode":"postcode","telephone":"telephone","fax":"fax","misc":"misc","email_to":"email_to","default_con":"default_con","user_id":"user_id","mobile":"mobile","sortname1":"sortname1","sortname2":"sortname2","sortname3":"sortname3"}}', 'ContactHelperRoute::getContactRoute', '{"formFile":"administrator\\/components\\/com_contact\\/models\\/forms\\/contact.xml","hideFields":["default_con","checked_out","checked_out_time","version","xreference"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "hits"],"convertToInt":["publish_up", "publish_down", "featured", "ordering"], "displayLookup":[ {"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"} ] }'),
(3, 'Newsfeed', 'com_newsfeeds.newsfeed', '{"special":{"dbtable":"#__newsfeeds","key":"id","type":"Newsfeed","prefix":"NewsfeedsTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"published","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"description", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"link", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"xreference", "asset_id":"null"}, "special":{"numarticles":"numarticles","cache_time":"cache_time","rtl":"rtl"}}', 'NewsfeedsHelperRoute::getNewsfeedRoute', '{"formFile":"administrator\\/components\\/com_newsfeeds\\/models\\/forms\\/newsfeed.xml","hideFields":["asset_id","checked_out","checked_out_time","version"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "hits"],"convertToInt":["publish_up", "publish_down", "featured", "ordering"],"displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"} ]}'),
(4, 'User', 'com_users.user', '{"special":{"dbtable":"#__users","key":"id","type":"User","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"null","core_alias":"username","core_created_time":"registerdate","core_modified_time":"lastvisitDate","core_body":"null", "core_hits":"null","core_publish_up":"null","core_publish_down":"null","access":"null", "core_params":"params", "core_featured":"null", "core_metadata":"null", "core_language":"null", "core_images":"null", "core_urls":"null", "core_version":"null", "core_ordering":"null", "core_metakey":"null", "core_metadesc":"null", "core_catid":"null", "core_xreference":"null", "asset_id":"null"}, "special":{}}', 'UsersHelperRoute::getUserRoute', ''),
(5, 'Article Category', 'com_content.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'ContentHelperRoute::getCategoryRoute', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}'),
(6, 'Contact Category', 'com_contact.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'ContactHelperRoute::getCategoryRoute', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}'),
(7, 'Newsfeeds Category', 'com_newsfeeds.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'NewsfeedsHelperRoute::getCategoryRoute', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}'),
(8, 'Tag', 'com_tags.tag', '{"special":{"dbtable":"#__tags","key":"tag_id","type":"Tag","prefix":"TagsTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"urls", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"null", "core_xreference":"null", "asset_id":"null"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path"}}', 'TagsHelperRoute::getTagRoute', '{"formFile":"administrator\\/components\\/com_tags\\/models\\/forms\\/tag.xml", "hideFields":["checked_out","checked_out_time","version", "lft", "rgt", "level", "path", "urls", "publish_up", "publish_down"],"ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"}, {"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}]}'),
(9, 'Banner', 'com_banners.banner', '{"special":{"dbtable":"#__banners","key":"id","type":"Banner","prefix":"BannersTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"published","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"description", "core_hits":"null","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"link", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"null", "asset_id":"null"}, "special":{"imptotal":"imptotal", "impmade":"impmade", "clicks":"clicks", "clickurl":"clickurl", "custombannercode":"custombannercode", "cid":"cid", "purchase_type":"purchase_type", "track_impressions":"track_impressions", "track_clicks":"track_clicks"}}', '', '{"formFile":"administrator\\/components\\/com_banners\\/models\\/forms\\/banner.xml", "hideFields":["checked_out","checked_out_time","version", "reset"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "imptotal", "impmade", "reset"], "convertToInt":["publish_up", "publish_down", "ordering"], "displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}, {"sourceColumn":"cid","targetTable":"#__banner_clients","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"} ]}'),
(10, 'Banners Category', 'com_banners.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special": {"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', '', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"], "convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}'),
(11, 'Banner Client', 'com_banners.client', '{"special":{"dbtable":"#__banner_clients","key":"id","type":"Client","prefix":"BannersTable"}}', '', '', '', '{"formFile":"administrator\\/components\\/com_banners\\/models\\/forms\\/client.xml", "hideFields":["checked_out","checked_out_time"], "ignoreChanges":["checked_out", "checked_out_time"], "convertToInt":[], "displayLookup":[]}'),
(12, 'User Notes', 'com_users.note', '{"special":{"dbtable":"#__user_notes","key":"id","type":"Note","prefix":"UsersTable"}}', '', '', '', '{"formFile":"administrator\\/components\\/com_users\\/models\\/forms\\/note.xml", "hideFields":["checked_out","checked_out_time", "publish_up", "publish_down"],"ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time"], "convertToInt":["publish_up", "publish_down"],"displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}, {"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}]}'),
(13, 'User Notes Category', 'com_users.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', '', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"], "convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}'),
(14, 'MyJspace Page', 'com_myjspace.see', '{"special":{"dbtable":"#__myjspace","key":"id","type":"Content","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"blockView","core_alias":"pagename","core_created_time":"created_date","core_modified_time":"last_update_date","core_body":"content", "core_hits":"hits", "core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"blockView", "core_params":"null", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"null", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"null", "core_catid":"catid", "core_xreference":"null", "asset_id":"null"}, "special": {}}', 'MyJspaceHelperRoute::getMyJspaceRoute', NULL),
(15, 'MyJspace Category', 'com_myjspace.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special": {"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'ContentHelperRoute::getCategoryRoute', NULL),
(18, 'Document', 'com_docstation.document', '{"special":{"dbtable":"#__docstation","key":"id","type":"Documents","prefix":"DocStationTable","config":"array()"}}', '', '{"common":[{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"description", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"null", "core_featured":"null", "core_metadata":"null", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"null", "core_ordering":"ordering", "core_metakey":"null", "core_metadesc":"null", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"null"}]}', 'DocStationHelperRoute::getDocumentRoute', NULL),
(19, 'Document Category', 'com_docstation.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'DocStationHelperRoute::getCategoryRoute', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_core_log_searches`
--

CREATE TABLE IF NOT EXISTS `hyxu5_core_log_searches` (
  `search_term` varchar(128) NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_docstation`
--

CREATE TABLE IF NOT EXISTS `hyxu5_docstation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `file_name` tinytext NOT NULL,
  `file_type` tinytext NOT NULL,
  `file_size` tinytext NOT NULL,
  `parent_type` tinytext NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `hits` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL,
  `access` tinyint(4) NOT NULL,
  `published` tinyint(4) NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `publish_up` datetime NOT NULL,
  `publish_down` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` timestamp NOT NULL,
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `hyxu5_docstation`
--

INSERT INTO `hyxu5_docstation` (`id`, `title`, `alias`, `description`, `file_name`, `file_type`, `file_size`, `parent_type`, `parent_id`, `hits`, `ordering`, `access`, `published`, `created`, `created_by`, `publish_up`, `publish_down`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `language`) VALUES
(1, 'tkda3', 'tkda3', '', 'tkda3.sql', 'application/octet-stream', '40284', 'com_content.article', 8, 3, 0, 1, 1, '2016-02-23 03:48:44', 198, '2016-02-23 03:48:44', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '*');

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_extensions`
--

CREATE TABLE IF NOT EXISTS `hyxu5_extensions` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `element` varchar(100) NOT NULL,
  `folder` varchar(100) NOT NULL,
  `client_id` tinyint(3) NOT NULL,
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  `access` int(10) unsigned NOT NULL DEFAULT '1',
  `protected` tinyint(3) NOT NULL DEFAULT '0',
  `manifest_cache` text NOT NULL,
  `params` text NOT NULL,
  `custom_data` text NOT NULL,
  `system_data` text NOT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) DEFAULT '0',
  `state` int(11) DEFAULT '0',
  PRIMARY KEY (`extension_id`),
  KEY `element_clientid` (`element`,`client_id`),
  KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  KEY `extension` (`type`,`element`,`folder`,`client_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10129 ;

--
-- Dumping data for table `hyxu5_extensions`
--

INSERT INTO `hyxu5_extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(1, 'com_mailto', 'component', 'com_mailto', '', 0, 1, 1, 1, '{"name":"com_mailto","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MAILTO_XML_DESCRIPTION","group":"","filename":"mailto"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(2, 'com_wrapper', 'component', 'com_wrapper', '', 0, 1, 1, 1, '{"name":"com_wrapper","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_WRAPPER_XML_DESCRIPTION","group":"","filename":"wrapper"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(3, 'com_admin', 'component', 'com_admin', '', 1, 1, 1, 1, '{"name":"com_admin","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_ADMIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(4, 'com_banners', 'component', 'com_banners', '', 1, 1, 1, 0, '{"name":"com_banners","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_BANNERS_XML_DESCRIPTION","group":"","filename":"banners"}', '{"purchase_type":"3","track_impressions":"0","track_clicks":"0","metakey_prefix":"","save_history":"1","history_limit":10}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(5, 'com_cache', 'component', 'com_cache', '', 1, 1, 1, 1, '{"name":"com_cache","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CACHE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(6, 'com_categories', 'component', 'com_categories', '', 1, 1, 1, 1, '{"name":"com_categories","type":"component","creationDate":"December 2007","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CATEGORIES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(7, 'com_checkin', 'component', 'com_checkin', '', 1, 1, 1, 1, '{"name":"com_checkin","type":"component","creationDate":"Unknown","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CHECKIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(8, 'com_contact', 'component', 'com_contact', '', 1, 1, 1, 0, '{"name":"com_contact","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CONTACT_XML_DESCRIPTION","group":"","filename":"contact"}', '{"show_contact_category":"hide","save_history":"1","history_limit":10,"show_contact_list":"0","presentation_style":"sliders","show_name":"1","show_position":"1","show_email":"0","show_street_address":"1","show_suburb":"1","show_state":"1","show_postcode":"1","show_country":"1","show_telephone":"1","show_mobile":"1","show_fax":"1","show_webpage":"1","show_misc":"1","show_image":"1","image":"","allow_vcard":"0","show_articles":"0","show_profile":"0","show_links":"0","linka_name":"","linkb_name":"","linkc_name":"","linkd_name":"","linke_name":"","contact_icons":"0","icon_address":"","icon_email":"","icon_telephone":"","icon_mobile":"","icon_fax":"","icon_misc":"","show_headings":"1","show_position_headings":"1","show_email_headings":"0","show_telephone_headings":"1","show_mobile_headings":"0","show_fax_headings":"0","allow_vcard_headings":"0","show_suburb_headings":"1","show_state_headings":"1","show_country_headings":"1","show_email_form":"1","show_email_copy":"1","banned_email":"","banned_subject":"","banned_text":"","validate_session":"1","custom_reply":"0","redirect":"","show_category_crumb":"0","metakey":"","metadesc":"","robots":"","author":"","rights":"","xreference":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(9, 'com_cpanel', 'component', 'com_cpanel', '', 1, 1, 1, 1, '{"name":"com_cpanel","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CPANEL_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10, 'com_installer', 'component', 'com_installer', '', 1, 1, 1, 1, '{"name":"com_installer","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_INSTALLER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(11, 'com_languages', 'component', 'com_languages', '', 1, 1, 1, 1, '{"name":"com_languages","type":"component","creationDate":"2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_LANGUAGES_XML_DESCRIPTION","group":""}', '{"administrator":"en-GB","site":"en-GB"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(12, 'com_login', 'component', 'com_login', '', 1, 1, 1, 1, '{"name":"com_login","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(13, 'com_media', 'component', 'com_media', '', 1, 1, 0, 1, '{"name":"com_media","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MEDIA_XML_DESCRIPTION","group":"","filename":"media"}', '{"upload_extensions":"bmp,csv,doc,gif,ico,jpg,jpeg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,GIF,ICO,JPG,JPEG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS","upload_maxsize":"10","file_path":"images","image_path":"images","restrict_uploads":"1","allowed_media_usergroup":"3","check_mime":"1","image_extensions":"bmp,gif,jpg,png","ignore_extensions":"","upload_mime":"image\\/jpeg,image\\/gif,image\\/png,image\\/bmp,application\\/x-shockwave-flash,application\\/msword,application\\/excel,application\\/pdf,application\\/powerpoint,text\\/plain,application\\/x-zip","upload_mime_illegal":"text\\/html"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(14, 'com_menus', 'component', 'com_menus', '', 1, 1, 1, 1, '{"name":"com_menus","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MENUS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(15, 'com_messages', 'component', 'com_messages', '', 1, 1, 1, 1, '{"name":"com_messages","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MESSAGES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(16, 'com_modules', 'component', 'com_modules', '', 1, 1, 1, 1, '{"name":"com_modules","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MODULES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(17, 'com_newsfeeds', 'component', 'com_newsfeeds', '', 1, 1, 1, 0, '{"name":"com_newsfeeds","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_NEWSFEEDS_XML_DESCRIPTION","group":"","filename":"newsfeeds"}', '{"newsfeed_layout":"_:default","save_history":"1","history_limit":5,"show_feed_image":"1","show_feed_description":"1","show_item_description":"1","feed_character_count":"0","feed_display_order":"des","float_first":"right","float_second":"right","show_tags":"1","category_layout":"_:default","show_category_title":"1","show_description":"1","show_description_image":"1","maxLevel":"-1","show_empty_categories":"0","show_subcat_desc":"1","show_cat_items":"1","show_cat_tags":"1","show_base_description":"1","maxLevelcat":"-1","show_empty_categories_cat":"0","show_subcat_desc_cat":"1","show_cat_items_cat":"1","filter_field":"1","show_pagination_limit":"1","show_headings":"1","show_articles":"0","show_link":"1","show_pagination":"1","show_pagination_results":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(18, 'com_plugins', 'component', 'com_plugins', '', 1, 1, 1, 1, '{"name":"com_plugins","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_PLUGINS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(19, 'com_search', 'component', 'com_search', '', 1, 1, 1, 0, '{"name":"com_search","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_SEARCH_XML_DESCRIPTION","group":"","filename":"search"}', '{"enabled":"0","search_phrases":"0","search_areas":"0","show_date":"0","opensearch_name":"","opensearch_description":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(20, 'com_templates', 'component', 'com_templates', '', 1, 1, 1, 1, '{"name":"com_templates","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_TEMPLATES_XML_DESCRIPTION","group":""}', '{"template_positions_display":"0","upload_limit":"2","image_formats":"gif,bmp,jpg,jpeg,png","source_formats":"txt,less,ini,xml,js,php,css","font_formats":"woff,ttf,otf","compressed_formats":"zip"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(22, 'com_content', 'component', 'com_content', '', 1, 1, 0, 1, '{"name":"com_content","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CONTENT_XML_DESCRIPTION","group":"","filename":"content"}', '{"article_layout":"_:default","show_title":"1","link_titles":"1","show_intro":"1","info_block_position":"0","show_category":"1","link_category":"1","show_parent_category":"0","link_parent_category":"0","show_author":"1","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"1","show_item_navigation":"0","show_vote":"0","show_readmore":"1","show_readmore_title":"1","readmore_limit":"100","show_tags":"1","show_icons":"1","show_print_icon":"1","show_email_icon":"1","show_hits":"1","show_noauth":"0","urls_position":"0","show_publishing_options":"1","show_article_options":"1","save_history":"1","history_limit":10,"show_urls_images_frontend":"0","show_urls_images_backend":"1","targeta":0,"targetb":0,"targetc":0,"float_intro":"left","float_fulltext":"left","category_layout":"_:blog","show_category_heading_title_text":"0","show_category_title":"0","show_description":"0","show_description_image":"0","maxLevel":"1","show_empty_categories":"0","show_no_articles":"1","show_subcat_desc":"1","show_cat_num_articles":"1","show_cat_tags":"1","show_base_description":"1","maxLevelcat":"-1","show_empty_categories_cat":"0","show_subcat_desc_cat":"1","show_cat_num_articles_cat":"1","num_leading_articles":"1","num_intro_articles":"4","num_columns":"1","num_links":"4","multi_column_order":"0","show_subcategory_content":"-1","show_pagination_limit":"1","filter_field":"hide","show_headings":"1","list_show_date":"0","date_format":"","list_show_hits":"1","list_show_author":"1","orderby_pri":"order","orderby_sec":"rdate","order_date":"published","show_pagination":"2","show_pagination_results":"1","show_featured":"show","show_feed_link":"1","feed_summary":"0","feed_show_readmore":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(23, 'com_config', 'component', 'com_config', '', 1, 1, 0, 1, '{"name":"com_config","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CONFIG_XML_DESCRIPTION","group":""}', '{"filters":{"1":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"9":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"6":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"7":{"filter_type":"NONE","filter_tags":"","filter_attributes":""},"2":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"3":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"4":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"5":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"8":{"filter_type":"NONE","filter_tags":"","filter_attributes":""}}}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(24, 'com_redirect', 'component', 'com_redirect', '', 1, 1, 0, 1, '{"name":"com_redirect","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_REDIRECT_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(25, 'com_users', 'component', 'com_users', '', 1, 1, 0, 1, '{"name":"com_users","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_USERS_XML_DESCRIPTION","group":"","filename":"users"}', '{"allowUserRegistration":"0","new_usertype":"2","guest_usergroup":"9","sendpassword":"1","useractivation":"1","mail_to_admin":"0","captcha":"","frontend_userparams":"1","site_language":"0","change_login_name":"0","reset_count":"10","reset_time":"1","minimum_length":"4","minimum_integers":"0","minimum_symbols":"0","minimum_uppercase":"0","save_history":"1","history_limit":5,"mailSubjectPrefix":"","mailBodySuffix":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(27, 'com_finder', 'component', 'com_finder', '', 1, 1, 0, 0, '{"name":"com_finder","type":"component","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_FINDER_XML_DESCRIPTION","group":"","filename":"finder"}', '{"show_description":"1","description_length":255,"allow_empty_query":"0","show_url":"1","show_advanced":"1","expand_advanced":"0","show_date_filters":"0","highlight_terms":"1","opensearch_name":"","opensearch_description":"","batch_size":"50","memory_table_limit":30000,"title_multiplier":"1.7","text_multiplier":"0.7","meta_multiplier":"1.2","path_multiplier":"2.0","misc_multiplier":"0.3","stemmer":"snowball"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(28, 'com_joomlaupdate', 'component', 'com_joomlaupdate', '', 1, 1, 0, 1, '{"name":"com_joomlaupdate","type":"component","creationDate":"February 2012","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_JOOMLAUPDATE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(29, 'com_tags', 'component', 'com_tags', '', 1, 1, 1, 1, '{"name":"com_tags","type":"component","creationDate":"December 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.0","description":"COM_TAGS_XML_DESCRIPTION","group":"","filename":"tags"}', '{"tag_layout":"_:default","save_history":"1","history_limit":10,"show_tag_title":"1","tag_list_show_tag_image":"1","tag_list_show_tag_description":"0","tag_list_image":"","show_tag_num_items":"1","tag_list_orderby":"c.core_title","tag_list_orderby_direction":"ASC","show_headings":"0","tag_list_show_date":"published","tag_list_show_item_image":"1","tag_list_show_item_description":"1","tag_list_item_maximum_characters":0,"min_term_length":"3","return_any_or_all":"1","include_children":"0","maximum":200,"tag_list_language_filter":"all","tags_layout":"_:default","all_tags_orderby":"title","all_tags_orderby_direction":"ASC","all_tags_show_tag_image":"0","all_tags_show_tag_descripion":"0","all_tags_tag_maximum_characters":20,"all_tags_show_tag_hits":"0","filter_field":"0","show_pagination_limit":"0","show_pagination":"2","show_pagination_results":"1","tag_field_ajax_mode":"0","show_feed_link":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(30, 'com_contenthistory', 'component', 'com_contenthistory', '', 1, 1, 1, 0, '{"name":"com_contenthistory","type":"component","creationDate":"May 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"COM_CONTENTHISTORY_XML_DESCRIPTION","group":"","filename":"contenthistory"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(31, 'com_ajax', 'component', 'com_ajax', '', 1, 1, 1, 0, '{"name":"com_ajax","type":"component","creationDate":"August 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"COM_AJAX_XML_DESCRIPTION","group":"","filename":"ajax"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(32, 'com_postinstall', 'component', 'com_postinstall', '', 1, 1, 1, 1, '{"name":"com_postinstall","type":"component","creationDate":"September 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"COM_POSTINSTALL_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(101, 'SimplePie', 'library', 'simplepie', '', 0, 1, 1, 1, '{"name":"SimplePie","type":"library","creationDate":"2004","author":"SimplePie","copyright":"Copyright (c) 2004-2009, Ryan Parman and Geoffrey Sneddon","authorEmail":"","authorUrl":"http:\\/\\/simplepie.org\\/","version":"1.2","description":"LIB_SIMPLEPIE_XML_DESCRIPTION","group":"","filename":"simplepie"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(102, 'phputf8', 'library', 'phputf8', '', 0, 1, 1, 1, '{"name":"phputf8","type":"library","creationDate":"2006","author":"Harry Fuecks","copyright":"Copyright various authors","authorEmail":"hfuecks@gmail.com","authorUrl":"http:\\/\\/sourceforge.net\\/projects\\/phputf8","version":"0.5","description":"LIB_PHPUTF8_XML_DESCRIPTION","group":"","filename":"phputf8"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(103, 'Joomla! Platform', 'library', 'joomla', '', 0, 1, 1, 1, '{"name":"Joomla! Platform","type":"library","creationDate":"2008","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"http:\\/\\/www.joomla.org","version":"13.1","description":"LIB_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '{"mediaversion":"542d1d7033c94540c2d1b26ca4ad4560"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(104, 'IDNA Convert', 'library', 'idna_convert', '', 0, 1, 1, 1, '{"name":"IDNA Convert","type":"library","creationDate":"2004","author":"phlyLabs","copyright":"2004-2011 phlyLabs Berlin, http:\\/\\/phlylabs.de","authorEmail":"phlymail@phlylabs.de","authorUrl":"http:\\/\\/phlylabs.de","version":"0.8.0","description":"LIB_IDNA_XML_DESCRIPTION","group":"","filename":"idna_convert"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(105, 'FOF', 'library', 'fof', '', 0, 1, 1, 1, '{"name":"FOF","type":"library","creationDate":"2015-04-22 13:15:32","author":"Nicholas K. Dionysopoulos \\/ Akeeba Ltd","copyright":"(C)2011-2015 Nicholas K. Dionysopoulos","authorEmail":"nicholas@akeebabackup.com","authorUrl":"https:\\/\\/www.akeebabackup.com","version":"2.4.3","description":"LIB_FOF_XML_DESCRIPTION","group":"","filename":"fof"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(106, 'PHPass', 'library', 'phpass', '', 0, 1, 1, 1, '{"name":"PHPass","type":"library","creationDate":"2004-2006","author":"Solar Designer","copyright":"","authorEmail":"solar@openwall.com","authorUrl":"http:\\/\\/www.openwall.com\\/phpass\\/","version":"0.3","description":"LIB_PHPASS_XML_DESCRIPTION","group":"","filename":"phpass"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(200, 'mod_articles_archive', 'module', 'mod_articles_archive', '', 0, 1, 1, 0, '{"name":"mod_articles_archive","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_ARCHIVE_XML_DESCRIPTION","group":"","filename":"mod_articles_archive"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(201, 'mod_articles_latest', 'module', 'mod_articles_latest', '', 0, 1, 1, 0, '{"name":"mod_articles_latest","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LATEST_NEWS_XML_DESCRIPTION","group":"","filename":"mod_articles_latest"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(202, 'mod_articles_popular', 'module', 'mod_articles_popular', '', 0, 1, 1, 0, '{"name":"mod_articles_popular","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":"","filename":"mod_articles_popular"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(203, 'mod_banners', 'module', 'mod_banners', '', 0, 1, 1, 0, '{"name":"mod_banners","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_BANNERS_XML_DESCRIPTION","group":"","filename":"mod_banners"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(204, 'mod_breadcrumbs', 'module', 'mod_breadcrumbs', '', 0, 1, 1, 1, '{"name":"mod_breadcrumbs","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_BREADCRUMBS_XML_DESCRIPTION","group":"","filename":"mod_breadcrumbs"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(205, 'mod_custom', 'module', 'mod_custom', '', 0, 1, 1, 1, '{"name":"mod_custom","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":"","filename":"mod_custom"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(206, 'mod_feed', 'module', 'mod_feed', '', 0, 1, 1, 0, '{"name":"mod_feed","type":"module","creationDate":"July 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FEED_XML_DESCRIPTION","group":"","filename":"mod_feed"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(207, 'mod_footer', 'module', 'mod_footer', '', 0, 1, 1, 0, '{"name":"mod_footer","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FOOTER_XML_DESCRIPTION","group":"","filename":"mod_footer"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(208, 'mod_login', 'module', 'mod_login', '', 0, 1, 1, 1, '{"name":"mod_login","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":"","filename":"mod_login"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(209, 'mod_menu', 'module', 'mod_menu', '', 0, 1, 1, 1, '{"name":"mod_menu","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_MENU_XML_DESCRIPTION","group":"","filename":"mod_menu"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(210, 'mod_articles_news', 'module', 'mod_articles_news', '', 0, 1, 1, 0, '{"name":"mod_articles_news","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_NEWS_XML_DESCRIPTION","group":"","filename":"mod_articles_news"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(211, 'mod_random_image', 'module', 'mod_random_image', '', 0, 1, 1, 0, '{"name":"mod_random_image","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_RANDOM_IMAGE_XML_DESCRIPTION","group":"","filename":"mod_random_image"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(212, 'mod_related_items', 'module', 'mod_related_items', '', 0, 1, 1, 0, '{"name":"mod_related_items","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_RELATED_XML_DESCRIPTION","group":"","filename":"mod_related_items"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(213, 'mod_search', 'module', 'mod_search', '', 0, 1, 1, 0, '{"name":"mod_search","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_SEARCH_XML_DESCRIPTION","group":"","filename":"mod_search"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(214, 'mod_stats', 'module', 'mod_stats', '', 0, 1, 1, 0, '{"name":"mod_stats","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_STATS_XML_DESCRIPTION","group":"","filename":"mod_stats"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(215, 'mod_syndicate', 'module', 'mod_syndicate', '', 0, 1, 1, 1, '{"name":"mod_syndicate","type":"module","creationDate":"May 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_SYNDICATE_XML_DESCRIPTION","group":"","filename":"mod_syndicate"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(216, 'mod_users_latest', 'module', 'mod_users_latest', '', 0, 1, 1, 0, '{"name":"mod_users_latest","type":"module","creationDate":"December 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_USERS_LATEST_XML_DESCRIPTION","group":"","filename":"mod_users_latest"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(218, 'mod_whosonline', 'module', 'mod_whosonline', '', 0, 1, 1, 0, '{"name":"mod_whosonline","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_WHOSONLINE_XML_DESCRIPTION","group":"","filename":"mod_whosonline"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(219, 'mod_wrapper', 'module', 'mod_wrapper', '', 0, 1, 1, 0, '{"name":"mod_wrapper","type":"module","creationDate":"October 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_WRAPPER_XML_DESCRIPTION","group":"","filename":"mod_wrapper"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(220, 'mod_articles_category', 'module', 'mod_articles_category', '', 0, 1, 1, 0, '{"name":"mod_articles_category","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_CATEGORY_XML_DESCRIPTION","group":"","filename":"mod_articles_category"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(221, 'mod_articles_categories', 'module', 'mod_articles_categories', '', 0, 1, 1, 0, '{"name":"mod_articles_categories","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_CATEGORIES_XML_DESCRIPTION","group":"","filename":"mod_articles_categories"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(222, 'mod_languages', 'module', 'mod_languages', '', 0, 1, 1, 1, '{"name":"mod_languages","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LANGUAGES_XML_DESCRIPTION","group":"","filename":"mod_languages"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(223, 'mod_finder', 'module', 'mod_finder', '', 0, 1, 0, 0, '{"name":"mod_finder","type":"module","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FINDER_XML_DESCRIPTION","group":"","filename":"mod_finder"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(300, 'mod_custom', 'module', 'mod_custom', '', 1, 1, 1, 1, '{"name":"mod_custom","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":"","filename":"mod_custom"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(301, 'mod_feed', 'module', 'mod_feed', '', 1, 1, 1, 0, '{"name":"mod_feed","type":"module","creationDate":"July 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FEED_XML_DESCRIPTION","group":"","filename":"mod_feed"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(302, 'mod_latest', 'module', 'mod_latest', '', 1, 1, 1, 0, '{"name":"mod_latest","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LATEST_XML_DESCRIPTION","group":"","filename":"mod_latest"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(303, 'mod_logged', 'module', 'mod_logged', '', 1, 1, 1, 0, '{"name":"mod_logged","type":"module","creationDate":"January 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LOGGED_XML_DESCRIPTION","group":"","filename":"mod_logged"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(304, 'mod_login', 'module', 'mod_login', '', 1, 1, 1, 1, '{"name":"mod_login","type":"module","creationDate":"March 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":"","filename":"mod_login"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(305, 'mod_menu', 'module', 'mod_menu', '', 1, 1, 1, 0, '{"name":"mod_menu","type":"module","creationDate":"March 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_MENU_XML_DESCRIPTION","group":"","filename":"mod_menu"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(307, 'mod_popular', 'module', 'mod_popular', '', 1, 1, 1, 0, '{"name":"mod_popular","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":"","filename":"mod_popular"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(308, 'mod_quickicon', 'module', 'mod_quickicon', '', 1, 1, 1, 1, '{"name":"mod_quickicon","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_QUICKICON_XML_DESCRIPTION","group":"","filename":"mod_quickicon"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(309, 'mod_status', 'module', 'mod_status', '', 1, 1, 1, 0, '{"name":"mod_status","type":"module","creationDate":"Feb 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_STATUS_XML_DESCRIPTION","group":"","filename":"mod_status"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(310, 'mod_submenu', 'module', 'mod_submenu', '', 1, 1, 1, 0, '{"name":"mod_submenu","type":"module","creationDate":"Feb 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_SUBMENU_XML_DESCRIPTION","group":"","filename":"mod_submenu"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(311, 'mod_title', 'module', 'mod_title', '', 1, 1, 1, 0, '{"name":"mod_title","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_TITLE_XML_DESCRIPTION","group":"","filename":"mod_title"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(312, 'mod_toolbar', 'module', 'mod_toolbar', '', 1, 1, 1, 1, '{"name":"mod_toolbar","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_TOOLBAR_XML_DESCRIPTION","group":"","filename":"mod_toolbar"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(313, 'mod_multilangstatus', 'module', 'mod_multilangstatus', '', 1, 1, 1, 0, '{"name":"mod_multilangstatus","type":"module","creationDate":"September 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_MULTILANGSTATUS_XML_DESCRIPTION","group":"","filename":"mod_multilangstatus"}', '{"cache":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(314, 'mod_version', 'module', 'mod_version', '', 1, 1, 1, 0, '{"name":"mod_version","type":"module","creationDate":"January 2012","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_VERSION_XML_DESCRIPTION","group":"","filename":"mod_version"}', '{"format":"short","product":"1","cache":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(315, 'mod_stats_admin', 'module', 'mod_stats_admin', '', 1, 1, 1, 0, '{"name":"mod_stats_admin","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_STATS_XML_DESCRIPTION","group":"","filename":"mod_stats_admin"}', '{"serverinfo":"0","siteinfo":"0","counter":"0","increase":"0","cache":"1","cache_time":"900","cachemode":"static"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(316, 'mod_tags_popular', 'module', 'mod_tags_popular', '', 0, 1, 1, 0, '{"name":"mod_tags_popular","type":"module","creationDate":"January 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.0","description":"MOD_TAGS_POPULAR_XML_DESCRIPTION","group":"","filename":"mod_tags_popular"}', '{"maximum":"5","timeframe":"alltime","owncache":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(317, 'mod_tags_similar', 'module', 'mod_tags_similar', '', 0, 1, 1, 0, '{"name":"mod_tags_similar","type":"module","creationDate":"January 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.0","description":"MOD_TAGS_SIMILAR_XML_DESCRIPTION","group":"","filename":"mod_tags_similar"}', '{"maximum":"5","matchtype":"any","owncache":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(400, 'plg_authentication_gmail', 'plugin', 'gmail', 'authentication', 0, 0, 1, 0, '{"name":"plg_authentication_gmail","type":"plugin","creationDate":"February 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_GMAIL_XML_DESCRIPTION","group":"","filename":"gmail"}', '{"applysuffix":"0","suffix":"","verifypeer":"1","user_blacklist":""}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(401, 'plg_authentication_joomla', 'plugin', 'joomla', 'authentication', 0, 1, 1, 1, '{"name":"plg_authentication_joomla","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_AUTH_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(402, 'plg_authentication_ldap', 'plugin', 'ldap', 'authentication', 0, 0, 1, 0, '{"name":"plg_authentication_ldap","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_LDAP_XML_DESCRIPTION","group":"","filename":"ldap"}', '{"host":"","port":"389","use_ldapV3":"0","negotiate_tls":"0","no_referrals":"0","auth_method":"bind","base_dn":"","search_string":"","users_dn":"","username":"admin","password":"bobby7","ldap_fullname":"fullName","ldap_email":"mail","ldap_uid":"uid"}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(403, 'plg_content_contact', 'plugin', 'contact', 'content', 0, 1, 1, 0, '{"name":"plg_content_contact","type":"plugin","creationDate":"January 2014","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.2","description":"PLG_CONTENT_CONTACT_XML_DESCRIPTION","group":"","filename":"contact"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(404, 'plg_content_emailcloak', 'plugin', 'emailcloak', 'content', 0, 1, 1, 0, '{"name":"plg_content_emailcloak","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_EMAILCLOAK_XML_DESCRIPTION","group":"","filename":"emailcloak"}', '{"mode":"1"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(406, 'plg_content_loadmodule', 'plugin', 'loadmodule', 'content', 0, 1, 1, 0, '{"name":"plg_content_loadmodule","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_LOADMODULE_XML_DESCRIPTION","group":"","filename":"loadmodule"}', '{"style":"xhtml"}', '', '', 0, '2011-09-18 15:22:50', 0, 0),
(407, 'plg_content_pagebreak', 'plugin', 'pagebreak', 'content', 0, 1, 1, 0, '{"name":"plg_content_pagebreak","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_PAGEBREAK_XML_DESCRIPTION","group":"","filename":"pagebreak"}', '{"title":"1","multipage_toc":"1","showall":"1"}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(408, 'plg_content_pagenavigation', 'plugin', 'pagenavigation', 'content', 0, 1, 1, 0, '{"name":"plg_content_pagenavigation","type":"plugin","creationDate":"January 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_PAGENAVIGATION_XML_DESCRIPTION","group":"","filename":"pagenavigation"}', '{"position":"1"}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(409, 'plg_content_vote', 'plugin', 'vote', 'content', 0, 1, 1, 0, '{"name":"plg_content_vote","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_VOTE_XML_DESCRIPTION","group":"","filename":"vote"}', '', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(410, 'plg_editors_codemirror', 'plugin', 'codemirror', 'editors', 0, 1, 1, 1, '{"name":"plg_editors_codemirror","type":"plugin","creationDate":"28 March 2011","author":"Marijn Haverbeke","copyright":"Copyright (C) 2014 by Marijn Haverbeke <marijnh@gmail.com> and others","authorEmail":"marijnh@gmail.com","authorUrl":"http:\\/\\/codemirror.net\\/","version":"5.6","description":"PLG_CODEMIRROR_XML_DESCRIPTION","group":"","filename":"codemirror"}', '{"lineNumbers":"1","lineWrapping":"1","matchTags":"1","matchBrackets":"1","marker-gutter":"1","autoCloseTags":"1","autoCloseBrackets":"1","autoFocus":"1","theme":"default","tabmode":"indent"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(411, 'plg_editors_none', 'plugin', 'none', 'editors', 0, 1, 1, 1, '{"name":"plg_editors_none","type":"plugin","creationDate":"September 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_NONE_XML_DESCRIPTION","group":"","filename":"none"}', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(412, 'plg_editors_tinymce', 'plugin', 'tinymce', 'editors', 0, 1, 1, 0, '{"name":"plg_editors_tinymce","type":"plugin","creationDate":"2005-2014","author":"Moxiecode Systems AB","copyright":"Moxiecode Systems AB","authorEmail":"N\\/A","authorUrl":"tinymce.moxiecode.com","version":"4.1.7","description":"PLG_TINY_XML_DESCRIPTION","group":"","filename":"tinymce"}', '{"mode":"1","skin":"0","mobile":"0","entity_encoding":"raw","lang_mode":"1","text_direction":"ltr","content_css":"1","content_css_custom":"","relative_urls":"1","newlines":"0","invalid_elements":"script,applet,iframe","extended_elements":"","html_height":"550","html_width":"750","resizing":"1","element_path":"1","fonts":"1","paste":"1","searchreplace":"1","insertdate":"1","colors":"1","table":"1","smilies":"1","hr":"1","link":"1","media":"1","print":"1","directionality":"1","fullscreen":"1","alignment":"1","visualchars":"1","visualblocks":"1","nonbreaking":"1","template":"1","blockquote":"1","wordcount":"1","advlist":"1","autosave":"1","contextmenu":"1","inlinepopups":"1","custom_plugin":"","custom_button":""}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(413, 'plg_editors-xtd_article', 'plugin', 'article', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_article","type":"plugin","creationDate":"October 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_ARTICLE_XML_DESCRIPTION","group":"","filename":"article"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(414, 'plg_editors-xtd_image', 'plugin', 'image', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_image","type":"plugin","creationDate":"August 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_IMAGE_XML_DESCRIPTION","group":"","filename":"image"}', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(415, 'plg_editors-xtd_pagebreak', 'plugin', 'pagebreak', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_pagebreak","type":"plugin","creationDate":"August 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_EDITORSXTD_PAGEBREAK_XML_DESCRIPTION","group":"","filename":"pagebreak"}', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(416, 'plg_editors-xtd_readmore', 'plugin', 'readmore', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_readmore","type":"plugin","creationDate":"March 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_READMORE_XML_DESCRIPTION","group":"","filename":"readmore"}', '', '', '', 0, '0000-00-00 00:00:00', 4, 0);
INSERT INTO `hyxu5_extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(417, 'plg_search_categories', 'plugin', 'categories', 'search', 0, 1, 1, 0, '{"name":"plg_search_categories","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_CATEGORIES_XML_DESCRIPTION","group":"","filename":"categories"}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(418, 'plg_search_contacts', 'plugin', 'contacts', 'search', 0, 1, 1, 0, '{"name":"plg_search_contacts","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_CONTACTS_XML_DESCRIPTION","group":"","filename":"contacts"}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(419, 'plg_search_content', 'plugin', 'content', 'search', 0, 1, 1, 0, '{"name":"plg_search_content","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_CONTENT_XML_DESCRIPTION","group":"","filename":"content"}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(420, 'plg_search_newsfeeds', 'plugin', 'newsfeeds', 'search', 0, 1, 1, 0, '{"name":"plg_search_newsfeeds","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_NEWSFEEDS_XML_DESCRIPTION","group":"","filename":"newsfeeds"}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(422, 'plg_system_languagefilter', 'plugin', 'languagefilter', 'system', 0, 0, 1, 1, '{"name":"plg_system_languagefilter","type":"plugin","creationDate":"July 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_LANGUAGEFILTER_XML_DESCRIPTION","group":"","filename":"languagefilter"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(423, 'plg_system_p3p', 'plugin', 'p3p', 'system', 0, 0, 1, 0, '{"name":"plg_system_p3p","type":"plugin","creationDate":"September 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_P3P_XML_DESCRIPTION","group":"","filename":"p3p"}', '{"headers":"NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(424, 'plg_system_cache', 'plugin', 'cache', 'system', 0, 0, 1, 1, '{"name":"plg_system_cache","type":"plugin","creationDate":"February 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CACHE_XML_DESCRIPTION","group":"","filename":"cache"}', '{"browsercache":"0","cachetime":"15"}', '', '', 0, '0000-00-00 00:00:00', 9, 0),
(425, 'plg_system_debug', 'plugin', 'debug', 'system', 0, 1, 1, 0, '{"name":"plg_system_debug","type":"plugin","creationDate":"December 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_DEBUG_XML_DESCRIPTION","group":"","filename":"debug"}', '{"profile":"1","queries":"1","memory":"1","language_files":"1","language_strings":"1","strip-first":"1","strip-prefix":"","strip-suffix":""}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(426, 'plg_system_log', 'plugin', 'log', 'system', 0, 1, 1, 1, '{"name":"plg_system_log","type":"plugin","creationDate":"April 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_LOG_XML_DESCRIPTION","group":"","filename":"log"}', '', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(427, 'plg_system_redirect', 'plugin', 'redirect', 'system', 0, 0, 1, 1, '{"name":"plg_system_redirect","type":"plugin","creationDate":"April 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_REDIRECT_XML_DESCRIPTION","group":"","filename":"redirect"}', '', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(428, 'plg_system_remember', 'plugin', 'remember', 'system', 0, 1, 1, 1, '{"name":"plg_system_remember","type":"plugin","creationDate":"April 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_REMEMBER_XML_DESCRIPTION","group":"","filename":"remember"}', '', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(429, 'plg_system_sef', 'plugin', 'sef', 'system', 0, 1, 1, 0, '{"name":"plg_system_sef","type":"plugin","creationDate":"December 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEF_XML_DESCRIPTION","group":"","filename":"sef"}', '', '', '', 0, '0000-00-00 00:00:00', 8, 0),
(430, 'plg_system_logout', 'plugin', 'logout', 'system', 0, 1, 1, 1, '{"name":"plg_system_logout","type":"plugin","creationDate":"April 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_LOGOUT_XML_DESCRIPTION","group":"","filename":"logout"}', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(431, 'plg_user_contactcreator', 'plugin', 'contactcreator', 'user', 0, 0, 1, 0, '{"name":"plg_user_contactcreator","type":"plugin","creationDate":"August 2009","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTACTCREATOR_XML_DESCRIPTION","group":"","filename":"contactcreator"}', '{"autowebpage":"","category":"34","autopublish":"0"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(432, 'plg_user_joomla', 'plugin', 'joomla', 'user', 0, 1, 1, 0, '{"name":"plg_user_joomla","type":"plugin","creationDate":"December 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_USER_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '{"autoregister":"1","mail_to_user":"1","forceLogout":"1"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(433, 'plg_user_profile', 'plugin', 'profile', 'user', 0, 0, 1, 0, '{"name":"plg_user_profile","type":"plugin","creationDate":"January 2008","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_USER_PROFILE_XML_DESCRIPTION","group":"","filename":"profile"}', '{"register-require_address1":"1","register-require_address2":"1","register-require_city":"1","register-require_region":"1","register-require_country":"1","register-require_postal_code":"1","register-require_phone":"1","register-require_website":"1","register-require_favoritebook":"1","register-require_aboutme":"1","register-require_tos":"1","register-require_dob":"1","profile-require_address1":"1","profile-require_address2":"1","profile-require_city":"1","profile-require_region":"1","profile-require_country":"1","profile-require_postal_code":"1","profile-require_phone":"1","profile-require_website":"1","profile-require_favoritebook":"1","profile-require_aboutme":"1","profile-require_tos":"1","profile-require_dob":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(434, 'plg_extension_joomla', 'plugin', 'joomla', 'extension', 0, 1, 1, 1, '{"name":"plg_extension_joomla","type":"plugin","creationDate":"May 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_EXTENSION_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(435, 'plg_content_joomla', 'plugin', 'joomla', 'content', 0, 1, 1, 0, '{"name":"plg_content_joomla","type":"plugin","creationDate":"November 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(436, 'plg_system_languagecode', 'plugin', 'languagecode', 'system', 0, 0, 1, 0, '{"name":"plg_system_languagecode","type":"plugin","creationDate":"November 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_LANGUAGECODE_XML_DESCRIPTION","group":"","filename":"languagecode"}', '', '', '', 0, '0000-00-00 00:00:00', 10, 0),
(437, 'plg_quickicon_joomlaupdate', 'plugin', 'joomlaupdate', 'quickicon', 0, 1, 1, 1, '{"name":"plg_quickicon_joomlaupdate","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_QUICKICON_JOOMLAUPDATE_XML_DESCRIPTION","group":"","filename":"joomlaupdate"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(438, 'plg_quickicon_extensionupdate', 'plugin', 'extensionupdate', 'quickicon', 0, 1, 1, 1, '{"name":"plg_quickicon_extensionupdate","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_QUICKICON_EXTENSIONUPDATE_XML_DESCRIPTION","group":"","filename":"extensionupdate"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(439, 'plg_captcha_recaptcha', 'plugin', 'recaptcha', 'captcha', 0, 0, 1, 0, '{"name":"plg_captcha_recaptcha","type":"plugin","creationDate":"December 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.4.0","description":"PLG_CAPTCHA_RECAPTCHA_XML_DESCRIPTION","group":"","filename":"recaptcha"}', '{"public_key":"","private_key":"","theme":"clean"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(440, 'plg_system_highlight', 'plugin', 'highlight', 'system', 0, 1, 1, 0, '{"name":"plg_system_highlight","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_HIGHLIGHT_XML_DESCRIPTION","group":"","filename":"highlight"}', '', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(441, 'plg_content_finder', 'plugin', 'finder', 'content', 0, 0, 1, 0, '{"name":"plg_content_finder","type":"plugin","creationDate":"December 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_FINDER_XML_DESCRIPTION","group":"","filename":"finder"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(442, 'plg_finder_categories', 'plugin', 'categories', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_categories","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_CATEGORIES_XML_DESCRIPTION","group":"","filename":"categories"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(443, 'plg_finder_contacts', 'plugin', 'contacts', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_contacts","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_CONTACTS_XML_DESCRIPTION","group":"","filename":"contacts"}', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(444, 'plg_finder_content', 'plugin', 'content', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_content","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_CONTENT_XML_DESCRIPTION","group":"","filename":"content"}', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(445, 'plg_finder_newsfeeds', 'plugin', 'newsfeeds', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_newsfeeds","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_NEWSFEEDS_XML_DESCRIPTION","group":"","filename":"newsfeeds"}', '', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(447, 'plg_finder_tags', 'plugin', 'tags', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_tags","type":"plugin","creationDate":"February 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_TAGS_XML_DESCRIPTION","group":"","filename":"tags"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(448, 'plg_twofactorauth_totp', 'plugin', 'totp', 'twofactorauth', 0, 0, 1, 0, '{"name":"plg_twofactorauth_totp","type":"plugin","creationDate":"August 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"PLG_TWOFACTORAUTH_TOTP_XML_DESCRIPTION","group":"","filename":"totp"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(449, 'plg_authentication_cookie', 'plugin', 'cookie', 'authentication', 0, 1, 1, 0, '{"name":"plg_authentication_cookie","type":"plugin","creationDate":"July 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_AUTH_COOKIE_XML_DESCRIPTION","group":"","filename":"cookie"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(450, 'plg_twofactorauth_yubikey', 'plugin', 'yubikey', 'twofactorauth', 0, 0, 1, 0, '{"name":"plg_twofactorauth_yubikey","type":"plugin","creationDate":"September 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"PLG_TWOFACTORAUTH_YUBIKEY_XML_DESCRIPTION","group":"","filename":"yubikey"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(451, 'plg_search_tags', 'plugin', 'tags', 'search', 0, 1, 1, 0, '{"name":"plg_search_tags","type":"plugin","creationDate":"March 2014","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_TAGS_XML_DESCRIPTION","group":"","filename":"tags"}', '{"search_limit":"50","show_tagged_items":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(503, 'beez3', 'template', 'beez3', '', 0, 1, 1, 0, '{"name":"beez3","type":"template","creationDate":"25 November 2009","author":"Angie Radtke","copyright":"Copyright (C) 2005 - 2015 Open Source Matters, Inc. All rights reserved.","authorEmail":"a.radtke@derauftritt.de","authorUrl":"http:\\/\\/www.der-auftritt.de","version":"3.1.0","description":"TPL_BEEZ3_XML_DESCRIPTION","group":"","filename":"templateDetails"}', '{"wrapperSmall":"53","wrapperLarge":"72","sitetitle":"","sitedescription":"","navposition":"center","templatecolor":"nature"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(504, 'hathor', 'template', 'hathor', '', 1, 1, 1, 0, '{"name":"hathor","type":"template","creationDate":"May 2010","author":"Andrea Tarr","copyright":"Copyright (C) 2005 - 2015 Open Source Matters, Inc. All rights reserved.","authorEmail":"hathor@tarrconsulting.com","authorUrl":"http:\\/\\/www.tarrconsulting.com","version":"3.0.0","description":"TPL_HATHOR_XML_DESCRIPTION","group":"","filename":"templateDetails"}', '{"showSiteName":"0","colourChoice":"0","boldText":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(506, 'protostar', 'template', 'protostar', '', 0, 1, 1, 0, '{"name":"protostar","type":"template","creationDate":"4\\/30\\/2012","author":"Kyle Ledbetter","copyright":"Copyright (C) 2005 - 2015 Open Source Matters, Inc. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"","version":"1.0","description":"TPL_PROTOSTAR_XML_DESCRIPTION","group":"","filename":"templateDetails"}', '{"templateColor":"","logoFile":"","googleFont":"1","googleFontName":"Open+Sans","fluidContainer":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(507, 'isis', 'template', 'isis', '', 1, 1, 1, 0, '{"name":"isis","type":"template","creationDate":"3\\/30\\/2012","author":"Kyle Ledbetter","copyright":"Copyright (C) 2005 - 2015 Open Source Matters, Inc. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"","version":"1.0","description":"TPL_ISIS_XML_DESCRIPTION","group":"","filename":"templateDetails"}', '{"templateColor":"","logoFile":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(600, 'English (en-GB)', 'language', 'en-GB', '', 0, 1, 1, 1, '{"name":"English (en-GB)","type":"language","creationDate":"2013-03-07","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.4.3","description":"en-GB site language","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(601, 'English (en-GB)', 'language', 'en-GB', '', 1, 1, 1, 1, '{"name":"English (en-GB)","type":"language","creationDate":"2013-03-07","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.4.3","description":"en-GB administrator language","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(700, 'files_joomla', 'file', 'joomla', '', 0, 1, 1, 1, '{"name":"files_joomla","type":"file","creationDate":"December 2015","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.4.8","description":"FILES_JOOMLA_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10000, 'Travelify', 'template', 'travelify', '', 0, 1, 1, 0, '{"name":"Travelify","type":"template","creationDate":"2016-02-06","author":"Nguyen Toan","copyright":"Nguyen Toan 2016","authorEmail":"","authorUrl":"","version":"1.0","description":"Travelify template","group":"","filename":"templateDetails"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10003, 'BM Cool Menu', 'module', 'mod_bm_cool_menu', '', 0, 1, 0, 0, '{"name":"BM Cool Menu","type":"module","creationDate":"October 2014","author":"Brainymore","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"brainymore@gmail.com","authorUrl":"www.brainymore.com","version":"1.0.0","description":"MOD_BM_COOL_MENU_XML_DESCRIPTION","group":"","filename":"mod_bm_cool_menu"}', '{"startLevel":"1","endLevel":"0","showAllChildren":"1","text_color":"#ffffff","text_hover_color":"#e5e4e2","bgmenu":"#2b547e","showBorder":"1","border_radius":"4px","border_color":"#151b54","bg_color_actice":"#2b65ec","jquery":"0","cache":"1","cache_time":"900","cachemode":"itemid"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10004, 'BT Content Slider', 'module', 'mod_bt_contentslider', '', 0, 1, 0, 0, '{"name":"BT Content Slider","type":"module","creationDate":"Sep 2011","author":"www.bowthemes.com","copyright":"Copyright (C) 2012 Bowthemes. All rights reserved.","authorEmail":"support@bowthemes.com","authorUrl":"http:\\/\\/www.bowthemes.com","version":"2.3.8","description":"\\n\\t\\n<div class=\\"bt_description\\">\\n\\t<h3>BT content slider Module Version 2.3.8<\\/h3>\\n\\t<a href=\\"http:\\/\\/bowthemes.com\\" target=\\"_blank\\"><img\\n\\t\\tsrc=\\"..\\/modules\\/mod_bt_contentslider\\/admin\\/images\\/bt-slider.png\\">\\n\\t<\\/a>\\n\\t<p>Helps to slide your articles from Joomla! categories with cool\\n\\t\\teffects, rich backend configs covering layout, animation control, auto\\n\\t\\tthumbnail creating, images resizing, numbering articles, sorting\\n\\t\\tect...<\\/p>\\n\\t<br clear=\\"both\\" \\/>\\n\\t<h3>Features<\\/h3>\\n\\t<ul class=\\"list-style\\">\\n\\t\\t<li>Compatibility with Joomla 1.6, 1.7, 2.5 and Joomla 3.x<\\/li>\\n\\t\\t<li>Content control display from any section, category or article ID''s<\\/li>\\n\\t\\t<li>Support for<a href=\\"http:\\/\\/getk2.org\\/\\"> K2 component<\\/a><\\/li>\\n\\t\\t<li>Support for <a href=\\"joomla-extensions\\/bt-porfolio-component.html\\" target=\\"_blank\\" title=\\"Portfolio Joomla component\\">BT Portfolio component<\\/a><\\/li>\\n\\t\\t<li>Support for <a href=\\"http:\\/\\/bit.ly\\/1baVxzb\\">EasyBlog Component<\\/a><\\/li>\\n\\t\\t<li>Scalable size of the module<\\/li>\\n\\t\\t<li>Horizontal and vertical news presentation (columns and rows\\n\\t\\t\\tconfiguration).<\\/li>\\n\\t\\t<li>Support for responsive template<\\/li>\\n\\t\\t<li>Show text, image, author, date, section\\/category name and\\n\\t\\t\\tbutton \\"read more\\" option, with order customization.<\\/li>\\n\\t\\t<li>Image Cropping<\\/li>\\n\\t\\t<li>On\\/Off front page articles display in modules<\\/li>\\n\\t\\t<li>Easy and friendly back-end administration.<\\/li>\\n\\t\\t<li>Included French language.<\\/li>\\n\\t\\t<li>Used Javascript Framework: Jquery latest version<\\/li>\\n\\t\\t<li>Fully compatible: Firefox, IE7+, Opera 9.5, Safari, Netscape,\\n\\t\\t\\tGoogle Chrome, Camino, Flock 0.7+.<\\/li>\\n\\t<\\/ul>\\n\\t<h3>UPgrade versions<\\/h3>\\n\\t<p>\\n\\t\\tYour current versions is 2.3.8. <a target=\\"_blank\\" href=\\"http:\\/\\/bowthemes.com\\/bt-content-slider.html\\">Find our latest versions now<\\/a>\\n\\t<\\/p>\\n\\t<h3>Userful links<\\/h3>\\n\\t<ul>\\n\\t\\t<li><a target=\\"_blank\\" href=\\"http:\\/\\/bowthemes.com\\/bowthemes.com\\/bt-content-slider.html\\">Video tutorials<\\/a><\\/li>\\n\\t\\t<li><a target=\\"_blank\\" href=\\"http:\\/\\/bowthemes.com\\/forums\\/14-bt-content-slider\\/\\">Report bug<\\/a><\\/li>\\n\\t\\t<li><a target=\\"_blank\\" href=\\"http:\\/\\/bowthemes.com\\/forums\\/14-bt-content-slider\\/\\">Forum support<\\/a><\\/li>\\n\\t<\\/ul>\\n\\t<h3>About bow themes & copyright<\\/h3>\\n\\t<p>Bow Themes is Professional Joomla template provider. We are\\n\\t\\tfocused on creating unique, attractive and clean templates without\\n\\t\\tloosing flexibility and simplicity of customization<\\/p>\\n\\tCopyright (C) 2012 BowThemes\\n<\\/div>\\n<style>\\n.bt_description{\\n\\ttext-align: left;\\n}\\n.bt_description h3 {\\n\\ttext-transform: uppercase;\\n\\tmargin: 20px 0px 10px 0px;\\n}\\n\\n.bt_description img {\\n\\tfloat: left;\\n\\tmargin: 5px 10px 5px 0px;\\n}\\n\\n.bt_description p,.bt_description li {\\n\\tpadding: 5px 5px 5px 30px;\\n\\tlist-style: none outside none;\\n}\\n\\n.bt_description ul.list-style li {\\n\\tbackground: url(..\\/modules\\/mod_bt_contentslider\\/admin\\/images\\/tick.png)\\n\\t\\t0px 6px no-repeat;\\n\\tpadding-left: 30px;\\n\\tline-height: 15px;\\n}\\n<\\/style>\\n","group":"","filename":"mod_bt_contentslider"}', '{"moduleclass_sfx":"","content_title":"","content_link":"","butlet":"1","navigation_top":"0","navigation_right":"0","next_back":"0","module_width":"auto","module_height":"auto","auto_height":"1","items_per_cols":"1","items_per_rows":"3","source":"category","article_ids":"","k2_article_ids":"","btportfolio_article_ids":"","k2_category":"","btportfolio_category":"","easyblog_article_ids":"","joomla_tags":"","k2_tags":"","auto_category":"0","sub_categories":"0","limit_items":"12","limit_items_for_each":"0","user_id":"0","show_featured":"1","ordering":"created-asc","content_plugin":"0","use_introimg":"1","use_caption":"0","use_linka":"0","show_title":"1","limit_title_by":"word","title_max_chars":"8","show_intro":"1","limit_description_by":"char","description_max_chars":"100","show_category_name":"1","show_category_name_as_link":"1","show_readmore":"1","show_date":"0","show_author":"0","show_image":"1","checkimg_fulltext":"0","check_image_exist":"0","image_align":"center","equalHeight":"1","image_thumb":"1","thumbnail_width":"180","thumbnail_height":"120","image_quality":"80","default_thumb":"1","touch_screen":"0","hovereffect":"1","modalbox":"0","next_back_effect":"slide","bullet_effect":"slide","pause_hover":"1","interval":"5000","duration":"500","effect":"easeInQuad","auto_start":"1","auto_strip_tags":"1","allow_tags":"","open_target":"_parent","loadJquery":"auto","cache":"1","cache_time":"900"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10024, 'My Badges', 'plugin', 'jsbadges', 'community', 0, 0, 1, 0, '{"name":"My Badges","type":"plugin","creationDate":"26-Mar-2014","author":"Maverick","copyright":"Copyright (C) 2009-14. All rights reserved.","authorEmail":"support@corejoomla.com","authorUrl":"www.corejoomla.com","version":"1.0.0","description":"Displays the the badges earned by a user in his profile page.","group":"","filename":"jsbadges"}', '{"cache":"0","coreapp":"0","position":"content"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10036, 'Smart Latest News', 'module', 'mod_smartlatest', '', 0, 1, 0, 0, '{"name":"Smart Latest News","type":"module","creationDate":"April 2013","author":"Top Position","copyright":"Copyright (C) 2011 Top Position. All rights reserved.","authorEmail":"opensource.tposition@gmail.com","authorUrl":"http:\\/\\/master-comunicacion.es\\/joomla-extensions\\/","version":"1.0.0","description":"Smart Latest News module.","group":"","filename":"mod_smartlatest"}', '{"catid":"","count":"5","show_featured":"","ordering":"published","user_id":"0","include_css":"1","css":"1","show_header":"1","show_date":"1","link_title":"1","date_format":"%d-%m-%Y","show_intro":"1","strip_intro":"1","crop_intro":"1","crop":"200","show_readmore":"1","readmore_text":"Read more","show_link":"1","link":"","link_text":"More news...","show_image1":"0","cache":"1","cache_time":"900","cachemode":"static"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10100, 'Travelify 2 ', 'template', 'travelify2', '', 0, 1, 1, 0, '{"name":"Travelify 2 ","type":"template","creationDate":"2016-02-06","author":"Nguyen Toan","copyright":"Nguyen Toan 2016","authorEmail":"","authorUrl":"","version":"1.0","description":"Travelify template","group":"","filename":"templateDetails"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10101, 'CEGCore', 'library', 'cegcore', '', 0, 1, 1, 0, '{"name":"CEGCore","type":"library","creationDate":"01.2014","author":"ChronoEngine.com","copyright":"Copyright (C) 2013","authorEmail":"webmaster@chronoengine.com","authorUrl":"www.chronoengine.com","version":"1.0","description":"The GCore framework classes!","group":"","filename":"cegcore"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10102, 'com_chronoforms5', 'component', 'com_chronoforms5', '', 1, 1, 0, 0, '{"name":"com_chronoforms5","type":"component","creationDate":"28.July.2015","author":"ChronoEngine.com","copyright":"ChronoEngine.com 2015","authorEmail":"webmaster@chronoengine.com","authorUrl":"www.chronoengine.com","version":"5.0.10","description":"The ChronoForms V5 component is the ultimate tool for Joomla forms creation, power and simplicity.","group":"","filename":"chronoforms5"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10103, 'ChronoForms5 Package', 'package', 'pkg_chronoforms5', '', 0, 1, 1, 0, '{"name":"ChronoForms5 Package","type":"package","creationDate":"2015","author":"ChronoEngine.com Team","copyright":"","authorEmail":"","authorUrl":"","version":"V5.0","description":"ChronoForms5 extension package (Component + CEGCore library)","group":"","filename":"pkg_chronoforms5"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10108, 'COM_COMMENT', 'component', 'com_comment', '', 1, 1, 0, 0, '{"name":"COM_COMMENT","type":"component","creationDate":"2015-12-17","author":"Compojoom.com","copyright":"(C) 2010 Daniel Dimitrov","authorEmail":"contact-us@compojoom.com","authorUrl":"https:\\/\\/compojoom.com","version":"5.3.5","description":"","group":"","filename":"comment"}', '{}', '{"update_report_sent":"2016-02-21 11:59:52"}', '', 0, '0000-00-00 00:00:00', 0, 0),
(10109, 'Content - CComment', 'plugin', 'joscomment', 'content', 0, 1, 1, 0, '{"name":"Content - CComment","type":"plugin","creationDate":"2015-12-17","author":"Daniel Dimitrov ","copyright":"Copyright(C) Daniel Dimitrov All rights reserved!","authorEmail":"services@compojoom.com","authorUrl":"http:\\/\\/compojoom.com","version":"5.3.5","description":"You need to enable this plugin if you want to have comments in com_content or in virtuemart(com_virtuemart)","group":"","filename":"joscomment"}', '{"support_com_content":"1","on_content_prepare":"0","support_com_virtuemart":"0","support_com_matukio":"0","printView":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10110, 'K2 Plugin - CComment', 'plugin', 'ccomment', 'k2', 0, 0, 1, 0, '{"name":"K2 Plugin - CComment","type":"plugin","creationDate":"2015-12-17","author":"Compojoom","copyright":"Copyright (c) 2008 - 2010 Compojoom.com. All rights reserved.","authorEmail":"services@compojoom.com","authorUrl":"www.compojoom.com","version":"5.3.5","description":"A K2 plugin to allow comments with compojoomcomment","group":"","filename":"ccomment"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10111, 'Search - CComment', 'plugin', 'ccomment', 'search', 0, 0, 1, 0, '{"name":"Search - CComment","type":"plugin","creationDate":"2015-12-17","author":"Daniel Dimitrov","copyright":"Copyright (C) 2008 - 2013 compojoom.com. All rights reserved.","authorEmail":"daniel@compojoom.com","authorUrl":"https:\\/\\/compojoom.com","version":"5.3.5","description":"This plugin enables you to search comments through joomla''s search","group":"","filename":"ccomment"}', '{"search_limit":"50"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10112, 'Library - compojoom', 'library', 'compojoom', '', 0, 1, 1, 0, '{"name":"Library - compojoom","type":"library","creationDate":"2015-12-17","author":"compojoom.com","copyright":"(C) 2008-2015 Daniel Dimitrov and Yves Hoppe","authorEmail":"daniel@compojoom.com","authorUrl":"https:\\/\\/compojoom.com","version":"4.0.51","description":"LIB_COMPOJOOM_DESC","group":"","filename":"compojoom"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10113, 'News Calendar', 'module', 'mod_newscalendar', '', 0, 1, 0, 0, '{"name":"News Calendar","type":"module","creationDate":"Nov 2011","author":"Jesus Vargas","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"chuzky@gmail.com","authorUrl":"http:\\/\\/www.joomlahill.com","version":"1.2.3","description":"MOD_NEWSCALENDAR_XML_DESCRIPTION","group":"","filename":"mod_newscalendar"}', '{"show_child_category_articles":"0","levels":"1","usedate":"created","ordering":"published","count":"0","user_id":"0","state":"0","subyearname":"0","submonthname":"0","subdayname":"2","firstday":"0","defmonth":"0","remmonth":"0","encode":"UTF-8","stylesheet":"blue-arrows.css","cache":"0","cache_time":"900","cachemode":"itemid"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10114, 'plg_system_sl_scrolltotop', 'plugin', 'sl_scrolltotop', 'system', 0, 1, 1, 0, '{"name":"plg_system_sl_scrolltotop","type":"plugin","creationDate":"January 2012","author":"Pham Minh Tuan","copyright":"Copyright (c) 2013 Skyline. All rights reserved.","authorEmail":"admin@extstore.com","authorUrl":"http:\\/\\/extstore.com","version":"2.0.0","description":"\\n\\t\\n\\t\\tSkyline Scroll To Top Plugin For Joomla 1.7+<br \\/><br \\/>Developed by Skyline Software (<a target=\\"_blank\\" href=\\"http:\\/\\/extstore.com\\">http:\\/\\/extstore.com<\\/a>).\\n\\t\\n\\t","group":"","filename":"sl_scrolltotop"}', '{"admin_enable":"0","engine":"jquery","image":"","text":"","title":"","background_color":"#ffffff","color":"#ffffff","hover_background_color":"#0088cc","hover_color":"#ffffff","position":"bottom_right","border_radius":"3","offset_x":"18","offset_y":"10","padding_x":"12","padding_y":"12","duration":"2000","transition":"Fx.Transitions.linear","custom_css":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10115, 'Akeeba', 'component', 'com_akeeba', '', 1, 1, 0, 0, '{"name":"Akeeba","type":"component","creationDate":"2016-02-19","author":"Nicholas K. Dionysopoulos","copyright":"Copyright (c)2006-2016 Nicholas K. Dionysopoulos","authorEmail":"nicholas@dionysopoulos.me","authorUrl":"http:\\/\\/www.akeebabackup.com","version":"4.5.5","description":"Akeeba Backup Core - Full Joomla! site backup solution, Core Edition.","group":"","filename":"akeeba"}', '{"confwiz_upgrade":1,"siteurl":"http:\\/\\/localhost\\/travelify\\/","jlibrariesdir":"C:\\/wamp\\/www\\/travelify\\/libraries","jversion":"1.6"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10116, 'plg_quickicon_akeebabackup', 'plugin', 'akeebabackup', 'quickicon', 0, 1, 1, 0, '{"name":"plg_quickicon_akeebabackup","type":"plugin","creationDate":"2012-09-26","author":"Nicholas K. Dionysopoulos","copyright":"Copyright (c)2009-2016 Nicholas K. Dionysopoulos","authorEmail":"nicholas@akeebabackup.com","authorUrl":"http:\\/\\/www.akeebabackup.com","version":"1.0","description":"PLG_QUICKICON_AKEEBABACKUP_XML_DESCRIPTION","group":"","filename":"akeebabackup"}', '{"context":"mod_quickicon","enablewarning":"1","warnfailed":"1","maxbackupperiod":"24","profileid":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10117, 'PLG_SYSTEM_AKEEBAUPDATECHECK_TITLE', 'plugin', 'akeebaupdatecheck', 'system', 0, 0, 1, 0, '{"name":"PLG_SYSTEM_AKEEBAUPDATECHECK_TITLE","type":"plugin","creationDate":"2011-05-26","author":"Nicholas K. Dionysopoulos","copyright":"Copyright (c)2009-2016 Nicholas K. Dionysopoulos","authorEmail":"nicholas@dionysopoulos.me","authorUrl":"http:\\/\\/www.akeebabackup.com","version":"1.1","description":"PLG_AKEEBAUPDATECHECK_DESCRIPTION2","group":"","filename":"akeebaupdatecheck"}', '{"email":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10118, 'PLG_SYSTEM_BACKUPONUPDATE_TITLE', 'plugin', 'backuponupdate', 'system', 0, 1, 1, 0, '{"name":"PLG_SYSTEM_BACKUPONUPDATE_TITLE","type":"plugin","creationDate":"2013-08-13","author":"Nicholas K. Dionysopoulos","copyright":"Copyright (c)2009-2016 Nicholas K. Dionysopoulos","authorEmail":"nicholas@dionysopoulos.me","authorUrl":"http:\\/\\/www.akeebabackup.com","version":"3.7","description":"PLG_SYSTEM_BACKUPONUPDATE_DESCRIPTION","group":"","filename":"backuponupdate"}', '{"profileid":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10119, 'F0F (NEW) DO NOT REMOVE', 'library', 'lib_f0f', '', 0, 1, 1, 0, '{"name":"F0F (NEW) DO NOT REMOVE","type":"library","creationDate":"2016-02-19","author":"Nicholas K. Dionysopoulos \\/ Akeeba Ltd","copyright":"(C)2011-2014 Nicholas K. Dionysopoulos","authorEmail":"nicholas@akeebabackup.com","authorUrl":"https:\\/\\/www.akeebabackup.com","version":"2.5.3","description":"Framework-on-Framework (FOF) newer version - DO NOT REMOVE - The rapid component development framework for Joomla!. This package is the newer version of FOF, not the one shipped with Joomla! as the official Joomla! RAD Layer. The Joomla! RAD Layer has ceased development in March 2014. DO NOT UNINSTALL THIS PACKAGE, IT IS *** N O T *** A DUPLICATE OF THE ''FOF'' PACKAGE. REMOVING EITHER FOF PACKAGE WILL BREAK YOUR SITE.","group":"","filename":"lib_f0f"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10120, 'AkeebaStrapper', 'file', 'AkeebaStrapper', '', 0, 1, 0, 0, '{"name":"AkeebaStrapper","type":"file","creationDate":"2016-02-19","author":"Nicholas K. Dionysopoulos","copyright":"(C) 2012-2013 Akeeba Ltd.","authorEmail":"nicholas@dionysopoulos.me","authorUrl":"https:\\/\\/www.akeebabackup.com","version":"2.5.3","description":"Namespaced jQuery, jQuery UI and Bootstrap for Akeeba products.","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10125, 'com_docstation', 'component', 'com_docstation', '', 1, 1, 0, 0, '{"name":"com_docstation","type":"component","creationDate":"January 2013","author":"Mikhail Meschangin","copyright":"Copyright (C) 2013-2014 Mikhail Meschangin. All rights reserved.","authorEmail":"wolfhound512@gmail.com","authorUrl":"https:\\/\\/bitbucket.org\\/wolfhound512","version":"0.4.1","description":"COM_DOCSTATION_DESCRIPTION","group":"","filename":"docstation"}', '{"show_used":"1","show_forbidden":"1","show_document_page":"1","open_new_window":"1","replace_attributes":"1","show_documents_desc":"0","show_attachments_desc":"0","show_document_size":["0"],"icon_list_size":"64","icon_inline_size":"32","icon_attachment_size":"48","show_title":"1","link_titles":"1","show_category":"1","link_category":"1","show_author":"1","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"1","show_tags":"1","show_icons":"1","show_print_icon":"1","show_email_icon":"1","show_hits":"1","max_name_length":"80","max_ext_length":"20","parent_type_aliases":"com_content.featured=com_content.article; com_content.category=com_content.article; com_content.form=com_content.article; com_blogstation.article=com_content.article; com_blogstation.category=com_categories.category; com_blogstation.document=com_docstation.document; com_blogstation.image=com_imgstation.image; com_falang.content=com_content.article; com_falang.categories=com_categories.category; com_falang.contact_details=com_contact.contact; com_falang.modules=com_modules.module; com_falang.weblinks=com_weblinks.weblink;","parent_context_vars":"{\\"com_content\\":{\\"view\\":\\"view\\",\\"id\\":{\\"_default\\":\\"id\\",\\"form\\":\\"a_id\\"}},\\"com_falang\\":{\\"view\\":\\"catid\\",\\"id\\":{\\"_default\\":{\\"name\\":\\"cid\\",\\"type\\":\\"explode\\",\\"delimiter\\":\\"|\\",\\"index\\":1}}}}"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10126, 'plg_content_docstation', 'plugin', 'docstation', 'content', 0, 1, 1, 0, '{"name":"plg_content_docstation","type":"plugin","creationDate":"January 2013","author":"Mikhail Meschangin","copyright":"Copyright (C) 2013-2014 Mikhail Meschangin. All rights reserved.","authorEmail":"wolfhound512@gmail.com","authorUrl":"https:\\/\\/bitbucket.org\\/wolfhound512","version":"0.4.1","description":"PLG_DOCSTATION_CONTENT_DESCRIPTION","group":"","filename":"docstation"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10127, 'plg_editors-xtd_docstation', 'plugin', 'docstation', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_docstation","type":"plugin","creationDate":"January 2013","author":"Mikhail Meschangin","copyright":"Copyright (C) 2013-2014 Mikhail Meschangin. All rights reserved.","authorEmail":"wolfhound512@gmail.com","authorUrl":"https:\\/\\/bitbucket.org\\/wolfhound512","version":"0.4.1","description":"PLG_DOCSTATION_BUTTON_DESCRIPTION","group":"","filename":"docstation"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10128, 'DocStation Package', 'package', 'pkg_docstation', '', 0, 1, 1, 0, '{"name":"DocStation Package","type":"package","creationDate":"January 2013","author":"Mikhail Meschangin","copyright":"Copyright (C) 2013-2014 Mikhail Meschangin. All rights reserved.","authorEmail":"wolfhound512@gmail.com","authorUrl":"https:\\/\\/bitbucket.org\\/wolfhound512","version":"0.4.1","description":"DocStation Package","group":"","filename":"pkg_docstation"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_finder_filters`
--

CREATE TABLE IF NOT EXISTS `hyxu5_finder_filters` (
  `filter_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL,
  `created_by_alias` varchar(255) NOT NULL,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `map_count` int(10) unsigned NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `params` mediumtext,
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_finder_links`
--

CREATE TABLE IF NOT EXISTS `hyxu5_finder_links` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `route` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `indexdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `md5sum` varchar(32) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `state` int(5) DEFAULT '1',
  `access` int(5) DEFAULT '0',
  `language` varchar(8) NOT NULL,
  `publish_start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `list_price` double unsigned NOT NULL DEFAULT '0',
  `sale_price` double unsigned NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL,
  `object` mediumblob NOT NULL,
  PRIMARY KEY (`link_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_title` (`title`),
  KEY `idx_md5` (`md5sum`),
  KEY `idx_url` (`url`(75)),
  KEY `idx_published_list` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`list_price`),
  KEY `idx_published_sale` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`sale_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_finder_links_terms0`
--

CREATE TABLE IF NOT EXISTS `hyxu5_finder_links_terms0` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_finder_links_terms1`
--

CREATE TABLE IF NOT EXISTS `hyxu5_finder_links_terms1` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_finder_links_terms2`
--

CREATE TABLE IF NOT EXISTS `hyxu5_finder_links_terms2` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_finder_links_terms3`
--

CREATE TABLE IF NOT EXISTS `hyxu5_finder_links_terms3` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_finder_links_terms4`
--

CREATE TABLE IF NOT EXISTS `hyxu5_finder_links_terms4` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_finder_links_terms5`
--

CREATE TABLE IF NOT EXISTS `hyxu5_finder_links_terms5` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_finder_links_terms6`
--

CREATE TABLE IF NOT EXISTS `hyxu5_finder_links_terms6` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_finder_links_terms7`
--

CREATE TABLE IF NOT EXISTS `hyxu5_finder_links_terms7` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_finder_links_terms8`
--

CREATE TABLE IF NOT EXISTS `hyxu5_finder_links_terms8` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_finder_links_terms9`
--

CREATE TABLE IF NOT EXISTS `hyxu5_finder_links_terms9` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_finder_links_termsa`
--

CREATE TABLE IF NOT EXISTS `hyxu5_finder_links_termsa` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_finder_links_termsb`
--

CREATE TABLE IF NOT EXISTS `hyxu5_finder_links_termsb` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_finder_links_termsc`
--

CREATE TABLE IF NOT EXISTS `hyxu5_finder_links_termsc` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_finder_links_termsd`
--

CREATE TABLE IF NOT EXISTS `hyxu5_finder_links_termsd` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_finder_links_termse`
--

CREATE TABLE IF NOT EXISTS `hyxu5_finder_links_termse` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_finder_links_termsf`
--

CREATE TABLE IF NOT EXISTS `hyxu5_finder_links_termsf` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_finder_taxonomy`
--

CREATE TABLE IF NOT EXISTS `hyxu5_finder_taxonomy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `access` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `state` (`state`),
  KEY `ordering` (`ordering`),
  KEY `access` (`access`),
  KEY `idx_parent_published` (`parent_id`,`state`,`access`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `hyxu5_finder_taxonomy`
--

INSERT INTO `hyxu5_finder_taxonomy` (`id`, `parent_id`, `title`, `state`, `access`, `ordering`) VALUES
(1, 0, 'ROOT', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_finder_taxonomy_map`
--

CREATE TABLE IF NOT EXISTS `hyxu5_finder_taxonomy_map` (
  `link_id` int(10) unsigned NOT NULL,
  `node_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`node_id`),
  KEY `link_id` (`link_id`),
  KEY `node_id` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_finder_terms`
--

CREATE TABLE IF NOT EXISTS `hyxu5_finder_terms` (
  `term_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '0',
  `soundex` varchar(75) NOT NULL,
  `links` int(10) NOT NULL DEFAULT '0',
  `language` char(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `idx_term` (`term`),
  KEY `idx_term_phrase` (`term`,`phrase`),
  KEY `idx_stem_phrase` (`stem`,`phrase`),
  KEY `idx_soundex_phrase` (`soundex`,`phrase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_finder_terms_common`
--

CREATE TABLE IF NOT EXISTS `hyxu5_finder_terms_common` (
  `term` varchar(75) NOT NULL,
  `language` varchar(3) NOT NULL,
  KEY `idx_word_lang` (`term`,`language`),
  KEY `idx_lang` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hyxu5_finder_terms_common`
--

INSERT INTO `hyxu5_finder_terms_common` (`term`, `language`) VALUES
('a', 'en'),
('about', 'en'),
('after', 'en'),
('ago', 'en'),
('all', 'en'),
('am', 'en'),
('an', 'en'),
('and', 'en'),
('ani', 'en'),
('any', 'en'),
('are', 'en'),
('aren''t', 'en'),
('as', 'en'),
('at', 'en'),
('be', 'en'),
('but', 'en'),
('by', 'en'),
('for', 'en'),
('from', 'en'),
('get', 'en'),
('go', 'en'),
('how', 'en'),
('if', 'en'),
('in', 'en'),
('into', 'en'),
('is', 'en'),
('isn''t', 'en'),
('it', 'en'),
('its', 'en'),
('me', 'en'),
('more', 'en'),
('most', 'en'),
('must', 'en'),
('my', 'en'),
('new', 'en'),
('no', 'en'),
('none', 'en'),
('not', 'en'),
('noth', 'en'),
('nothing', 'en'),
('of', 'en'),
('off', 'en'),
('often', 'en'),
('old', 'en'),
('on', 'en'),
('onc', 'en'),
('once', 'en'),
('onli', 'en'),
('only', 'en'),
('or', 'en'),
('other', 'en'),
('our', 'en'),
('ours', 'en'),
('out', 'en'),
('over', 'en'),
('page', 'en'),
('she', 'en'),
('should', 'en'),
('small', 'en'),
('so', 'en'),
('some', 'en'),
('than', 'en'),
('thank', 'en'),
('that', 'en'),
('the', 'en'),
('their', 'en'),
('theirs', 'en'),
('them', 'en'),
('then', 'en'),
('there', 'en'),
('these', 'en'),
('they', 'en'),
('this', 'en'),
('those', 'en'),
('thus', 'en'),
('time', 'en'),
('times', 'en'),
('to', 'en'),
('too', 'en'),
('true', 'en'),
('under', 'en'),
('until', 'en'),
('up', 'en'),
('upon', 'en'),
('use', 'en'),
('user', 'en'),
('users', 'en'),
('veri', 'en'),
('version', 'en'),
('very', 'en'),
('via', 'en'),
('want', 'en'),
('was', 'en'),
('way', 'en'),
('were', 'en'),
('what', 'en'),
('when', 'en'),
('where', 'en'),
('whi', 'en'),
('which', 'en'),
('who', 'en'),
('whom', 'en'),
('whose', 'en'),
('why', 'en'),
('wide', 'en'),
('will', 'en'),
('with', 'en'),
('within', 'en'),
('without', 'en'),
('would', 'en'),
('yes', 'en'),
('yet', 'en'),
('you', 'en'),
('your', 'en'),
('yours', 'en');

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_finder_tokens`
--

CREATE TABLE IF NOT EXISTS `hyxu5_finder_tokens` (
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '1',
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `language` char(3) NOT NULL DEFAULT '',
  KEY `idx_word` (`term`),
  KEY `idx_context` (`context`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_finder_tokens_aggregate`
--

CREATE TABLE IF NOT EXISTS `hyxu5_finder_tokens_aggregate` (
  `term_id` int(10) unsigned NOT NULL,
  `map_suffix` char(1) NOT NULL,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `term_weight` float unsigned NOT NULL,
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `context_weight` float unsigned NOT NULL,
  `total_weight` float unsigned NOT NULL,
  `language` char(3) NOT NULL DEFAULT '',
  KEY `token` (`term`),
  KEY `keyword_id` (`term_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_finder_types`
--

CREATE TABLE IF NOT EXISTS `hyxu5_finder_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `mime` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_flexicontact_log`
--

CREATE TABLE IF NOT EXISTS `hyxu5_flexicontact_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datetime` datetime NOT NULL,
  `name` varchar(60) NOT NULL DEFAULT '',
  `email` varchar(60) NOT NULL DEFAULT '',
  `admin_email` varchar(60) NOT NULL DEFAULT '',
  `admin_from_email` varchar(60) NOT NULL DEFAULT '',
  `user_from_email` varchar(60) NOT NULL DEFAULT '',
  `admin_reply_to_email` varchar(60) NOT NULL DEFAULT '',
  `subject` varchar(100) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `config_show_copy` tinyint(4) NOT NULL DEFAULT '99',
  `show_copy` tinyint(4) NOT NULL DEFAULT '99',
  `status_main` varchar(255) NOT NULL DEFAULT '',
  `status_copy` varchar(255) NOT NULL DEFAULT '',
  `ip` varchar(40) NOT NULL DEFAULT '',
  `browser_id` tinyint(4) NOT NULL DEFAULT '0',
  `browser_string` varchar(20) NOT NULL DEFAULT '',
  `list_choice` varchar(60) DEFAULT NULL,
  `field1` varchar(100) DEFAULT NULL,
  `field2` varchar(100) DEFAULT NULL,
  `field3` varchar(100) DEFAULT NULL,
  `field4` varchar(100) DEFAULT NULL,
  `field5` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `DATETIME` (`datetime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_jcomments`
--

CREATE TABLE IF NOT EXISTS `hyxu5_jcomments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent` int(11) unsigned NOT NULL DEFAULT '0',
  `thread_id` int(11) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `object_id` int(11) unsigned NOT NULL DEFAULT '0',
  `object_group` varchar(255) NOT NULL DEFAULT '',
  `object_params` text NOT NULL,
  `lang` varchar(255) NOT NULL DEFAULT '',
  `userid` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `homepage` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `comment` text NOT NULL,
  `ip` varchar(39) NOT NULL DEFAULT '',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isgood` smallint(5) NOT NULL DEFAULT '0',
  `ispoor` smallint(5) NOT NULL DEFAULT '0',
  `published` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subscribe` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `source` varchar(255) NOT NULL DEFAULT '',
  `source_id` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_userid` (`userid`),
  KEY `idx_source` (`source`),
  KEY `idx_email` (`email`),
  KEY `idx_lang` (`lang`),
  KEY `idx_subscribe` (`subscribe`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_object` (`object_id`,`object_group`,`published`,`date`),
  KEY `idx_path` (`path`,`level`),
  KEY `idx_thread` (`thread_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `hyxu5_jcomments`
--

INSERT INTO `hyxu5_jcomments` (`id`, `parent`, `thread_id`, `path`, `level`, `object_id`, `object_group`, `object_params`, `lang`, `userid`, `name`, `username`, `email`, `homepage`, `title`, `comment`, `ip`, `date`, `isgood`, `ispoor`, `published`, `deleted`, `subscribe`, `source`, `source_id`, `checked_out`, `checked_out_time`, `editor`) VALUES
(1, 0, 0, '0', 0, 3, 'com_content', '', 'en-GB', 0, 'toan', 'toan', '123@gmail.com', 'http://toan2015.tk', '', 'abc', '::1', '2016-02-19 02:53:53', 0, 0, 1, 0, 0, '', 0, 0, '0000-00-00 00:00:00', ''),
(2, 0, 0, '0', 0, 3, 'com_content', '', 'en-GB', 0, 'toan', 'toan', '123@gmail.com', 'http://toan2015.tk', '', '123', '::1', '2016-02-19 03:02:37', 0, 0, 1, 0, 0, '', 0, 0, '0000-00-00 00:00:00', ''),
(3, 0, 0, '0', 0, 3, 'com_content', '', 'en-GB', 0, 'toan', 'toan', '123@gmail.com', 'http://toan2015.tk', '', '1233', '::1', '2016-02-19 03:13:41', 0, 0, 0, 0, 0, '', 0, 0, '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_jcomments_blacklist`
--

CREATE TABLE IF NOT EXISTS `hyxu5_jcomments_blacklist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(39) NOT NULL DEFAULT '',
  `userid` int(11) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) unsigned NOT NULL DEFAULT '0',
  `expire` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reason` tinytext NOT NULL,
  `notes` tinytext NOT NULL,
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_jcomments_custom_bbcodes`
--

CREATE TABLE IF NOT EXISTS `hyxu5_jcomments_custom_bbcodes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `simple_pattern` varchar(255) NOT NULL DEFAULT '',
  `simple_replacement_html` text NOT NULL,
  `simple_replacement_text` text NOT NULL,
  `pattern` varchar(255) NOT NULL DEFAULT '',
  `replacement_html` text NOT NULL,
  `replacement_text` text NOT NULL,
  `button_acl` text NOT NULL,
  `button_open_tag` varchar(16) NOT NULL DEFAULT '',
  `button_close_tag` varchar(16) NOT NULL DEFAULT '',
  `button_title` varchar(255) NOT NULL DEFAULT '',
  `button_prompt` varchar(255) NOT NULL DEFAULT '',
  `button_image` varchar(255) NOT NULL DEFAULT '',
  `button_css` varchar(255) NOT NULL DEFAULT '',
  `button_enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `hyxu5_jcomments_custom_bbcodes`
--

INSERT INTO `hyxu5_jcomments_custom_bbcodes` (`id`, `name`, `simple_pattern`, `simple_replacement_html`, `simple_replacement_text`, `pattern`, `replacement_html`, `replacement_text`, `button_acl`, `button_open_tag`, `button_close_tag`, `button_title`, `button_prompt`, `button_image`, `button_css`, `button_enabled`, `ordering`, `published`, `checked_out`, `checked_out_time`) VALUES
(1, 'YouTube Video', '[youtube]http://www.youtube.com/watch?v={IDENTIFIER}[/youtube]', '<iframe width="425" height="350" src="//www.youtube.com/embed/{IDENTIFIER}?rel=0" frameborder="0" allowfullscreen></iframe>', 'http://youtu.be/{IDENTIFIER}', '\\[youtube\\]http\\:\\/\\/www\\.youtube\\.com\\/watch\\?v\\=([A-Za-z0-9-_]+)([A-Za-z0-9\\%\\&\\=\\#]*?)\\[\\/youtube\\]', '<iframe width="425" height="350" src="//www.youtube.com/embed/${1}?rel=0" frameborder="0" allowfullscreen></iframe>', 'http://youtu.be/${1}', '1,2,3,4,5,6,7,8,9', '[youtube]', '[/youtube]', 'YouTube Video', '', '', 'bbcode-youtube', 1, 1, 1, 0, '0000-00-00 00:00:00'),
(2, 'YouTube Video (short syntax)', '[youtube]{IDENTIFIER}[/youtube]', '<iframe width="425" height="350" src="//www.youtube.com/embed/{IDENTIFIER}?rel=0" frameborder="0" allowfullscreen></iframe>', 'http://youtu.be/{IDENTIFIER}', '\\[youtube\\]([A-Za-z0-9-_]+)([A-Za-z0-9\\%\\&\\=\\#]*?)\\[\\/youtube\\]', '<iframe width="425" height="350" src="//www.youtube.com/embed/${1}?rel=0" frameborder="0" allowfullscreen></iframe>', 'http://youtu.be/${1}', '1,2,3,4,5,6,7,8,9', '', '', '', '', '', '', 0, 2, 1, 0, '0000-00-00 00:00:00'),
(3, 'YouTube Video (alternate syntax)', '[youtube]http://www.youtube.com/watch?v={IDENTIFIER}{TEXT}[/youtube]', '<iframe width="425" height="350" src="//www.youtube.com/embed/{IDENTIFIER}?rel=0" frameborder="0" allowfullscreen></iframe>', 'http://youtu.be/{IDENTIFIER}', '\\[youtube\\]http\\:\\/\\/www\\.youtube\\.com\\/watch\\?v\\=([A-Za-z0-9-_]+)([\\w0-9-\\+\\=\\!\\?\\(\\)\\[\\]\\{\\}\\&\\%\\*\\#\\.,_ ]+)\\[\\/youtube\\]', '<iframe width="425" height="350" src="//www.youtube.com/embed/${1}?rel=0" frameborder="0" allowfullscreen></iframe>', 'http://youtu.be/${1}', '1,2,3,4,5,6,7,8,9', '[youtube]', '[/youtube]', 'YouTube Video', '', '', '', 0, 3, 1, 0, '0000-00-00 00:00:00'),
(4, 'YouTube Video (alternate syntax)', '[youtube]http://www.youtube.com/watch?feature=player_embedded&v={IDENTIFIER}[/youtube]', '<iframe width="425" height="350" src="//www.youtube.com/embed/{IDENTIFIER}?rel=0" frameborder="0" allowfullscreen></iframe>', 'http://youtu.be/{IDENTIFIER}', '\\[youtube\\]http\\://www\\.youtube\\.com/watch\\?feature\\=player_embedded&v\\=([\\w0-9-_]+)\\[/youtube\\]', '<iframe width="425" height="350" src="//www.youtube.com/embed/${1}?rel=0" frameborder="0" allowfullscreen></iframe>', 'http://youtu.be/${1}', '1,2,3,4,5,6,7,8,9', '', '', '', '', '', '', 0, 4, 1, 0, '0000-00-00 00:00:00'),
(5, 'YouTube Video (alternate syntax)', '[youtube]http://youtu.be/{IDENTIFIER}[/youtube]', '<iframe width="425" height="350" src="//www.youtube.com/embed/{IDENTIFIER}?rel=0" frameborder="0" allowfullscreen></iframe>', 'http://youtu.be/{IDENTIFIER}', '\\[youtube\\]http\\://youtu\\.be/([\\w0-9-_]+)\\[/youtube\\]', '<iframe width="425" height="350" src="//www.youtube.com/embed/${1}?rel=0" frameborder="0" allowfullscreen></iframe>', 'http://youtu.be/${1}', '1,2,3,4,5,6,7,8,9', '', '', '', '', '', '', 0, 5, 1, 0, '0000-00-00 00:00:00'),
(6, 'Facebook Video', '[fv]http://www.facebook.com/video/video.php?v={IDENTIFIER}[/fv]', '<iframe width="425" height="350" src="//www.facebook.com/video/embed?video_id={IDENTIFIER}" frameborder="0"></iframe>', 'http://www.facebook.com/photo.php?v={IDENTIFIER}', '\\[fv\\]http\\:\\/\\/www\\.facebook\\.com\\/video\\/video\\.php\\?v\\=([A-Za-z0-9-_]+)([A-Za-z0-9\\%\\&\\=\\#]*?)\\[\\/fv\\]', '<iframe width="425" height="350" src="//www.facebook.com/video/embed?video_id=${1}" frameborder="0"></iframe>', 'http://www.facebook.com/photo.php?v=${1}', '1,2,3,4,5,6,7,8,9', '[fv]', '[/fv]', 'Facebook Video', '', '', 'bbcode-facebook', 1, 6, 1, 0, '0000-00-00 00:00:00'),
(7, 'Facebook Video (short syntax)', '[fv]{IDENTIFIER}[/fv]', '<iframe width="425" height="350" src="//www.facebook.com/video/embed?video_id={IDENTIFIER}" frameborder="0"></iframe>', 'http://www.facebook.com/photo.php?v={IDENTIFIER}', '\\[fv\\]([A-Za-z0-9-_]+)([A-Za-z0-9\\%\\&\\=\\#]*?)\\[\\/fv\\]', '<iframe width="425" height="350" src="//www.facebook.com/video/embed?video_id=${1}" frameborder="0"></iframe>', 'http://www.facebook.com/photo.php?v=${1}', '1,2,3,4,5,6,7,8,9', '', '', '', '', '', '', 0, 7, 1, 0, '0000-00-00 00:00:00'),
(8, 'Facebook Video (alternate syntax)', '[fv]http://www.facebook.com/photo.php?v={IDENTIFIER}[/fv]', '<iframe width="425" height="350" src="//www.facebook.com/video/embed?video_id={IDENTIFIER}" frameborder="0"></iframe>', 'http://www.facebook.com/photo.php?v={IDENTIFIER}', '\\[fv\\]http\\:\\/\\/www\\.facebook\\.com\\/photo\\.php\\?v\\=([A-Za-z0-9-_]+)([A-Za-z0-9\\%\\&\\=\\#]*?)\\[\\/fv\\]', '<iframe width="425" height="350" src="//www.facebook.com/video/embed?video_id=${1}" frameborder="0"></iframe>', 'http://www.facebook.com/photo.php?v=${1}', '1,2,3,4,5,6,7,8,9', '', '', '', '', '', '', 0, 8, 1, 0, '0000-00-00 00:00:00'),
(9, 'Instagram', '[instagram]http://instagram.com/p/{IDENTIFIER}/[/instagram]', '<iframe width="425" height="350" src="//instagram.com/p/{IDENTIFIER}/embed/" frameborder="0" scrolling="no" allowtransparency="true"></iframe>', 'http://instagram.com/p/{IDENTIFIER}/', '\\[instagram\\]http\\:\\/\\/instagram\\.com\\/p\\/([\\w0-9-_]+)\\/\\[/instagram\\]', '<iframe width="425" height="350" src="//instagram.com/p/${1}/embed/" frameborder="0" scrolling="no" allowtransparency="true"></iframe>', 'http://instagram.com/p/${1}/', '1,2,3,4,5,6,7,8,9', '[instagram]', '[/instagram]', 'Instagram Photo', '', '', 'bbcode-instagram', 1, 9, 1, 0, '0000-00-00 00:00:00'),
(10, 'Instagram (short syntax)', '[instagram]{IDENTIFIER}[/instagram]', '<iframe width="425" height="350" src="//instagram.com/p/{IDENTIFIER}/embed/" frameborder="0" scrolling="no" allowtransparency="true"></iframe>', 'http://instagram.com/p/{IDENTIFIER}/', '\\[instagram\\]([\\w0-9-_]+)\\[/instagram\\]', '<iframe width="425" height="350" src="//instagram.com/p/${1}/embed/" frameborder="0" scrolling="no" allowtransparency="true"></iframe>', 'http://instagram.com/p/${1}/', '1,2,3,4,5,6,7,8,9', '', '', '', '', '', '', 0, 10, 1, 0, '0000-00-00 00:00:00'),
(11, 'Instagram (alternate syntax)', '[instagram]http://instagram.com/p/{IDENTIFIER}[/instagram]', '<iframe width="425" height="350" src="//instagram.com/p/{IDENTIFIER}/embed/" frameborder="0" scrolling="no" allowtransparency="true"></iframe>', 'http://instagram.com/p/{IDENTIFIER}/', '\\[instagram\\]http\\:\\/\\/instagram\\.com\\/p\\/([\\w0-9-_]+)\\[/instagram\\]', '<iframe width="425" height="350" src="//instagram.com/p/${1}/embed/" frameborder="0" scrolling="no" allowtransparency="true"></iframe>', 'http://instagram.com/p/${1}/', '1,2,3,4,5,6,7,8,9', '', '', '', '', '', '', 0, 11, 1, 0, '0000-00-00 00:00:00'),
(12, 'Vimeo', '[vimeo]http://vimeo.com/{IDENTIFIER}/[/vimeo]', '<iframe width="425" height="239" src="//player.vimeo.com/video/{IDENTIFIER}/" frameborder="0"  webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>', 'http://vimeo.com/{IDENTIFIER}/', '\\[vimeo\\]http\\:\\/\\/vimeo\\.com\\/([\\w0-9-_]+)\\[/vimeo\\]', '<iframe width="425" height="239" src="//player.vimeo.com/video/${1}" frameborder="0"  webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>', 'http://vimeo.com/${1}/', '1,2,3,4,5,6,7,8,9', '[vimeo]', '[/vimeo]', 'Vimeo Video', '', '', 'bbcode-vimeo', 1, 12, 1, 0, '0000-00-00 00:00:00'),
(13, 'Vimeo (short syntax)', '[vimeo]{IDENTIFIER}[/vimeo]', '<iframe width="425" height="239" src="//player.vimeo.com/video/{IDENTIFIER}/" frameborder="0"  webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>', 'http://vimeo.com/{IDENTIFIER}/', '\\[vimeo\\]([\\w0-9-_]+)\\[/vimeo\\]', '<iframe width="425" height="239" src="//player.vimeo.com/video/${1}" frameborder="0"  webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>', 'http://vimeo.com/${1}/', '1,2,3,4,5,6,7,8,9', '', '', '', '', '', '', 0, 13, 1, 0, '0000-00-00 00:00:00'),
(14, 'Vimeo (alternate syntax)', '[vimeo]https://vimeo.com/{IDENTIFIER}/[/vimeo]', '<iframe width="425" height="239" src="//player.vimeo.com/video/{IDENTIFIER}/" frameborder="0"  webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>', 'https://vimeo.com/{IDENTIFIER}/', '\\[vimeo\\]https\\:\\/\\/vimeo\\.com\\/([\\w0-9-_]+)\\[/vimeo\\]', '<iframe width="425" height="239" src="//player.vimeo.com/video/${1}" frameborder="0"  webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>', 'https://vimeo.com/${1}/', '1,2,3,4,5,6,7,8,9', '', '', '', '', '', '', 0, 13, 1, 0, '0000-00-00 00:00:00'),
(15, 'Wiki', '[wiki]{SIMPLETEXT}[/wiki]', '<a href="http://www.wikipedia.org/wiki/{SIMPLETEXT}" title="{SIMPLETEXT}" target="_blank">{SIMPLETEXT}</a>', '{SIMPLETEXT}', '\\[wiki\\]([A-Za-z0-9\\-\\+\\.,_ ]+)\\[\\/wiki\\]', '<a href="http://www.wikipedia.org/wiki/${1}" title="${1}" target="_blank">${1}</a>', '${1}', '1,2,3,4,5,6,7,8,9', '[wiki]', '[/wiki]', 'Wikipedia', '', '', 'bbcode-wiki', 1, 14, 1, 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_jcomments_mailq`
--

CREATE TABLE IF NOT EXISTS `hyxu5_jcomments_mailq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `created` datetime NOT NULL,
  `attempts` tinyint(1) NOT NULL DEFAULT '0',
  `priority` tinyint(1) NOT NULL DEFAULT '0',
  `session_id` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_priority` (`priority`),
  KEY `idx_attempts` (`attempts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_jcomments_objects`
--

CREATE TABLE IF NOT EXISTS `hyxu5_jcomments_objects` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` int(11) unsigned NOT NULL DEFAULT '0',
  `object_group` varchar(255) NOT NULL DEFAULT '',
  `category_id` int(11) unsigned NOT NULL DEFAULT '0',
  `lang` varchar(20) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `link` text NOT NULL,
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `userid` int(11) unsigned NOT NULL DEFAULT '0',
  `expired` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_object` (`object_id`,`object_group`,`lang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `hyxu5_jcomments_objects`
--

INSERT INTO `hyxu5_jcomments_objects` (`id`, `object_id`, `object_group`, `category_id`, `lang`, `title`, `link`, `access`, `userid`, `expired`, `modified`) VALUES
(1, 3, 'com_content', 11, 'en-GB', 'This post has no body – almost', '/travelify/index.php/11-new-york/3-this-post-has-no-body-almost', 1, 198, 0, '2016-02-19 03:13:41'),
(2, 1, 'com_content', 12, 'en-GB', 'Content Layout Preview', '/travelify/index.php/12-other/1-content-layout-preview', 1, 198, 0, '2016-02-19 06:52:40'),
(3, 2, 'com_content', 12, 'en-GB', 'Design Simplicity Inspired by Nature', '/travelify/index.php/12-other/2-design-simplicity-inspired-by-nature', 1, 198, 0, '2016-02-19 06:52:52');

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_jcomments_reports`
--

CREATE TABLE IF NOT EXISTS `hyxu5_jcomments_reports` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `commentid` int(11) unsigned NOT NULL DEFAULT '0',
  `userid` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `ip` varchar(39) NOT NULL DEFAULT '',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reason` tinytext NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_jcomments_settings`
--

CREATE TABLE IF NOT EXISTS `hyxu5_jcomments_settings` (
  `component` varchar(50) NOT NULL DEFAULT '',
  `lang` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`component`,`lang`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hyxu5_jcomments_settings`
--

INSERT INTO `hyxu5_jcomments_settings` (`component`, `lang`, `name`, `value`) VALUES
('', '', 'author_email', '2'),
('', '', 'author_homepage', '1'),
('', '', 'author_name', '2'),
('', '', 'autolinkurls', '6,7,2,3,4,5,8'),
('', '', 'autopublish', '1,6,7,2,3,4,5,8'),
('', '', 'badwords', ''),
('', '', 'can_ban', '7,8'),
('', '', 'can_comment', '1,9,6,7,2,3,4,5,8'),
('', '', 'can_delete', '6,7,8'),
('', '', 'can_delete_for_my_object', ''),
('', '', 'can_delete_own', '6,7,8'),
('', '', 'can_edit', '6,7,8'),
('', '', 'can_edit_for_my_object', ''),
('', '', 'can_edit_own', '6,7,2,3,4,5,8'),
('', '', 'can_publish', '6,7,5,8'),
('', '', 'can_publish_for_my_object', ''),
('', '', 'can_reply', '1,9,6,7,2,3,4,5,8'),
('', '', 'can_report', '6,7,2,3,4,5,8'),
('', '', 'can_view_email', '6,7,8'),
('', '', 'can_view_homepage', '6,7,2,3,4,5,8'),
('', '', 'can_view_ip', '7,8'),
('', '', 'can_vote', '1,9,6,7,2,3,4,5,8'),
('', '', 'captcha_engine', 'kcaptcha'),
('', '', 'censor_replace_word', '[censored]'),
('', '', 'comments_list_order', 'DESC'),
('', '', 'comments_page_limit', '15'),
('', '', 'comments_pagination', 'both'),
('', '', 'comments_per_page', '10'),
('', '', 'comments_tree_order', '0'),
('', '', 'comment_maxlength', '1000'),
('', '', 'comment_minlength', '0'),
('', '', 'comment_title', '0'),
('', '', 'delete_mode', '0'),
('', '', 'display_author', 'name'),
('', '', 'emailprotection', '1,9'),
('', '', 'enable_autocensor', '1,9'),
('', '', 'enable_bbcode_b', '6,7,2,3,4,5,8'),
('', '', 'enable_bbcode_code', '2,3,4,5,6,7,8'),
('', '', 'enable_bbcode_hide', '6,7,2,3,4,5,8'),
('', '', 'enable_bbcode_i', '6,7,2,3,4,5,8'),
('', '', 'enable_bbcode_img', '6,7,2,3,4,5,8'),
('', '', 'enable_bbcode_list', '6,7,2,3,4,5,8'),
('', '', 'enable_bbcode_quote', '9,6,7,2,3,4,5,8'),
('', '', 'enable_bbcode_s', '6,7,2,3,4,5,8'),
('', '', 'enable_bbcode_u', '6,7,2,3,4,5,8'),
('', '', 'enable_bbcode_url', '6,7,2,3,4,5,8'),
('', '', 'enable_blacklist', '0'),
('', '', 'enable_captcha', '9'),
('', '', 'enable_categories', ''),
('', '', 'enable_comment_length_check', '1,9,2'),
('', '', 'enable_comment_maxlength_check', ''),
('', '', 'enable_custom_bbcode', '0'),
('', '', 'enable_geshi', '0'),
('', '', 'enable_gravatar', '1'),
('', '', 'enable_nested_quotes', '0'),
('', '', 'enable_notification', '0'),
('', '', 'enable_plugins', '1'),
('', '', 'enable_quick_moderation', '0'),
('', '', 'enable_reports', '1'),
('', '', 'enable_rss', '0'),
('', '', 'enable_smilies', '0'),
('', '', 'enable_subscribe', '1,9,6,7,2,3,4,5,8'),
('', '', 'enable_username_check', '1'),
('', '', 'enable_voting', '0'),
('', '', 'feed_limit', '100'),
('', '', 'floodprotection', '1,9,2,3,4'),
('', '', 'flood_time', '30'),
('', '', 'forbidden_names', 'administrator,moderator'),
('', '', 'form_position', '0'),
('', '', 'form_show', '1'),
('', '', 'link_maxlength', '50'),
('', '', 'load_cached_comments', '1'),
('', '', 'max_comments_per_object', '0'),
('', '', 'merge_time', '0'),
('', '', 'message_banned', ''),
('', '', 'message_locked', 'Comments are now closed for this entry'),
('', '', 'message_policy_post', ''),
('', '', 'message_policy_whocancomment', 'You have no rights to post comments'),
('', '', 'notification_email', ''),
('', '', 'notification_type', '1,2'),
('', '', 'reports_before_unpublish', '0'),
('', '', 'reports_per_comment', '0'),
('', '', 'report_reason_required', '1'),
('', '', 'show_commentlength', '0'),
('', '', 'show_policy', '1,9,2'),
('', '', 'smilies', ':D	laugh.gif\n:lol:	lol.gif\n:-)	smile.gif\n;-)	wink.gif\n8)	cool.gif\n:-|	normal.gif\n:-*	whistling.gif\n:oops:	redface.gif\n:sad:	sad.gif\n:cry:	cry.gif\n:o	surprised.gif\n:-?	confused.gif\n:-x	sick.gif\n:eek:	shocked.gif\n:zzz	sleeping.gif\n:P	tongue.gif\n:roll:	rolleyes.gif\n:sigh:	unsure.gif'),
('', '', 'smilies_path', '/components/com_jcomments/images/smilies/'),
('', '', 'template', 'default'),
('', '', 'template_view', 'list'),
('', '', 'username_maxlength', '20'),
('', '', 'word_maxlength', '50');

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_jcomments_smilies`
--

CREATE TABLE IF NOT EXISTS `hyxu5_jcomments_smilies` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(39) NOT NULL DEFAULT '',
  `alias` varchar(39) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `ordering` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_checkout` (`checked_out`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `hyxu5_jcomments_smilies`
--

INSERT INTO `hyxu5_jcomments_smilies` (`id`, `code`, `alias`, `image`, `name`, `published`, `ordering`, `checked_out`, `checked_out_time`) VALUES
(1, ':D', '', 'laugh.gif', 'Laugh', 1, 1, 0, '0000-00-00 00:00:00'),
(2, ':lol:', '', 'lol.gif', 'Lol', 1, 2, 0, '0000-00-00 00:00:00'),
(3, ':-)', '', 'smile.gif', 'Smile', 1, 3, 0, '0000-00-00 00:00:00'),
(4, ';-)', '', 'wink.gif', 'Wink', 1, 4, 0, '0000-00-00 00:00:00'),
(5, '8)', '', 'cool.gif', 'Cool', 1, 5, 0, '0000-00-00 00:00:00'),
(6, ':-|', '', 'normal.gif', 'Normal', 1, 6, 0, '0000-00-00 00:00:00'),
(7, ':-*', '', 'whistling.gif', 'Whistling', 1, 7, 0, '0000-00-00 00:00:00'),
(8, ':oops:', '', 'redface.gif', 'Redface', 1, 8, 0, '0000-00-00 00:00:00'),
(9, ':sad:', '', 'sad.gif', 'Sad', 1, 9, 0, '0000-00-00 00:00:00'),
(10, ':cry:', '', 'cry.gif', 'Cry', 1, 10, 0, '0000-00-00 00:00:00'),
(11, ':o', '', 'surprised.gif', 'Surprised', 1, 11, 0, '0000-00-00 00:00:00'),
(12, ':-?', '', 'confused.gif', 'Confused', 1, 12, 0, '0000-00-00 00:00:00'),
(13, ':-x', '', 'sick.gif', 'Sick', 1, 13, 0, '0000-00-00 00:00:00'),
(14, ':eek:', '', 'shocked.gif', 'Shocked', 1, 14, 0, '0000-00-00 00:00:00'),
(15, ':zzz', '', 'sleeping.gif', 'Sleeping', 1, 15, 0, '0000-00-00 00:00:00'),
(16, ':P', '', 'tongue.gif', 'Tongue', 1, 16, 0, '0000-00-00 00:00:00'),
(17, ':roll:', '', 'rolleyes.gif', 'Rolleyes', 1, 17, 0, '0000-00-00 00:00:00'),
(18, ':sigh:', '', 'unsure.gif', 'Unsure', 1, 18, 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_jcomments_subscriptions`
--

CREATE TABLE IF NOT EXISTS `hyxu5_jcomments_subscriptions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` int(11) unsigned NOT NULL DEFAULT '0',
  `object_group` varchar(255) NOT NULL DEFAULT '',
  `lang` varchar(255) NOT NULL DEFAULT '',
  `userid` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `hash` varchar(255) NOT NULL DEFAULT '',
  `published` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `source` varchar(255) NOT NULL DEFAULT '',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_object` (`object_id`,`object_group`),
  KEY `idx_lang` (`lang`),
  KEY `idx_source` (`source`),
  KEY `idx_hash` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_jcomments_version`
--

CREATE TABLE IF NOT EXISTS `hyxu5_jcomments_version` (
  `version` varchar(16) NOT NULL DEFAULT '',
  `previous` varchar(16) NOT NULL DEFAULT '',
  `installed` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_jcomments_votes`
--

CREATE TABLE IF NOT EXISTS `hyxu5_jcomments_votes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `commentid` int(11) unsigned NOT NULL DEFAULT '0',
  `userid` int(11) unsigned NOT NULL DEFAULT '0',
  `ip` varchar(39) NOT NULL DEFAULT '',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `value` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_comment` (`commentid`,`userid`),
  KEY `idx_user` (`userid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_languages`
--

CREATE TABLE IF NOT EXISTS `hyxu5_languages` (
  `lang_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang_code` char(7) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_native` varchar(50) NOT NULL,
  `sef` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  `description` varchar(512) NOT NULL,
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `sitename` varchar(1024) NOT NULL DEFAULT '',
  `published` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  UNIQUE KEY `idx_sef` (`sef`),
  UNIQUE KEY `idx_image` (`image`),
  UNIQUE KEY `idx_langcode` (`lang_code`),
  KEY `idx_access` (`access`),
  KEY `idx_ordering` (`ordering`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `hyxu5_languages`
--

INSERT INTO `hyxu5_languages` (`lang_id`, `lang_code`, `title`, `title_native`, `sef`, `image`, `description`, `metakey`, `metadesc`, `sitename`, `published`, `access`, `ordering`) VALUES
(1, 'en-GB', 'English (UK)', 'English (UK)', 'en', 'en', '', '', '', '', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_menu`
--

CREATE TABLE IF NOT EXISTS `hyxu5_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(1024) NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The published state of the menu link.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'The parent menu item in the menu tree.',
  `level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The relative level in the tree.',
  `component_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__extensions.id',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__users.id',
  `checked_out_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The click behaviour of the link.',
  `access` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The access level required to view the menu item.',
  `img` varchar(255) NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `home` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) NOT NULL DEFAULT '',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_client_id_parent_id_alias_language` (`client_id`,`parent_id`,`alias`,`language`),
  KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  KEY `idx_menutype` (`menutype`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_path` (`path`(255)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=229 ;

--
-- Dumping data for table `hyxu5_menu`
--

INSERT INTO `hyxu5_menu` (`id`, `menutype`, `title`, `alias`, `note`, `path`, `link`, `type`, `published`, `parent_id`, `level`, `component_id`, `checked_out`, `checked_out_time`, `browserNav`, `access`, `img`, `template_style_id`, `params`, `lft`, `rgt`, `home`, `language`, `client_id`) VALUES
(1, '', 'Menu_Item_Root', 'root', '', '', '', '', 1, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '', 0, '', 0, 99, 0, '*', 0),
(2, 'menu', 'com_banners', 'Banners', '', 'Banners', 'index.php?option=com_banners', 'component', 0, 1, 1, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 3, 12, 0, '*', 1),
(3, 'menu', 'com_banners', 'Banners', '', 'Banners/Banners', 'index.php?option=com_banners', 'component', 0, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 4, 5, 0, '*', 1),
(4, 'menu', 'com_banners_categories', 'Categories', '', 'Banners/Categories', 'index.php?option=com_categories&extension=com_banners', 'component', 0, 2, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-cat', 0, '', 6, 7, 0, '*', 1),
(5, 'menu', 'com_banners_clients', 'Clients', '', 'Banners/Clients', 'index.php?option=com_banners&view=clients', 'component', 0, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-clients', 0, '', 8, 9, 0, '*', 1),
(6, 'menu', 'com_banners_tracks', 'Tracks', '', 'Banners/Tracks', 'index.php?option=com_banners&view=tracks', 'component', 0, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-tracks', 0, '', 10, 11, 0, '*', 1),
(7, 'menu', 'com_contact', 'Contacts', '', 'Contacts', 'index.php?option=com_contact', 'component', 0, 1, 1, 8, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 13, 18, 0, '*', 1),
(8, 'menu', 'com_contact', 'Contacts', '', 'Contacts/Contacts', 'index.php?option=com_contact', 'component', 0, 7, 2, 8, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 14, 15, 0, '*', 1),
(9, 'menu', 'com_contact_categories', 'Categories', '', 'Contacts/Categories', 'index.php?option=com_categories&extension=com_contact', 'component', 0, 7, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact-cat', 0, '', 16, 17, 0, '*', 1),
(10, 'menu', 'com_messages', 'Messaging', '', 'Messaging', 'index.php?option=com_messages', 'component', 0, 1, 1, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages', 0, '', 19, 24, 0, '*', 1),
(11, 'menu', 'com_messages_add', 'New Private Message', '', 'Messaging/New Private Message', 'index.php?option=com_messages&task=message.add', 'component', 0, 10, 2, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages-add', 0, '', 20, 21, 0, '*', 1),
(12, 'menu', 'com_messages_read', 'Read Private Message', '', 'Messaging/Read Private Message', 'index.php?option=com_messages', 'component', 0, 10, 2, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages-read', 0, '', 22, 23, 0, '*', 1),
(13, 'menu', 'com_newsfeeds', 'News Feeds', '', 'News Feeds', 'index.php?option=com_newsfeeds', 'component', 0, 1, 1, 17, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 25, 30, 0, '*', 1),
(14, 'menu', 'com_newsfeeds_feeds', 'Feeds', '', 'News Feeds/Feeds', 'index.php?option=com_newsfeeds', 'component', 0, 13, 2, 17, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 26, 27, 0, '*', 1),
(15, 'menu', 'com_newsfeeds_categories', 'Categories', '', 'News Feeds/Categories', 'index.php?option=com_categories&extension=com_newsfeeds', 'component', 0, 13, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds-cat', 0, '', 28, 29, 0, '*', 1),
(16, 'menu', 'com_redirect', 'Redirect', '', 'Redirect', 'index.php?option=com_redirect', 'component', 0, 1, 1, 24, 0, '0000-00-00 00:00:00', 0, 0, 'class:redirect', 0, '', 31, 32, 0, '*', 1),
(17, 'menu', 'com_search', 'Basic Search', '', 'Basic Search', 'index.php?option=com_search', 'component', 0, 1, 1, 19, 0, '0000-00-00 00:00:00', 0, 0, 'class:search', 0, '', 33, 34, 0, '*', 1),
(18, 'menu', 'com_finder', 'Smart Search', '', 'Smart Search', 'index.php?option=com_finder', 'component', 0, 1, 1, 27, 0, '0000-00-00 00:00:00', 0, 0, 'class:finder', 0, '', 35, 36, 0, '*', 1),
(19, 'menu', 'com_joomlaupdate', 'Joomla! Update', '', 'Joomla! Update', 'index.php?option=com_joomlaupdate', 'component', 1, 1, 1, 28, 0, '0000-00-00 00:00:00', 0, 0, 'class:joomlaupdate', 0, '', 37, 38, 0, '*', 1),
(20, 'main', 'com_tags', 'Tags', '', 'Tags', 'index.php?option=com_tags', 'component', 0, 1, 1, 29, 0, '0000-00-00 00:00:00', 0, 1, 'class:tags', 0, '', 39, 40, 0, '', 1),
(21, 'main', 'com_postinstall', 'Post-installation messages', '', 'Post-installation messages', 'index.php?option=com_postinstall', 'component', 0, 1, 1, 32, 0, '0000-00-00 00:00:00', 0, 1, 'class:postinstall', 0, '', 41, 42, 0, '*', 1),
(101, 'mainmenu', 'Home', 'home', '', 'home', 'index.php?option=com_content&view=category&layout=blog&id=2', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"layout_type":"blog","show_category_heading_title_text":"","show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_subcat_desc":"","show_cat_num_articles":"","show_cat_tags":"","page_subheading":"","num_leading_articles":"10","num_intro_articles":"0","num_columns":"1","num_links":"0","multi_column_order":"","show_subcategory_content":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","show_featured":"","show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"0","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"0","show_tags":"0","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"0","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 43, 44, 1, '*', 0),
(102, 'mainmenu', 'Login', '2016-02-16-07-54-19', '', '2016-02-16-07-54-19', 'index.php?option=com_users&view=login', 'component', -2, 1, 1, 25, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"login_redirect_url":"","logindescription_show":"1","login_description":"","login_image":"","logout_redirect_url":"","logoutdescription_show":"1","logout_description":"","logout_image":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 45, 46, 0, '*', 0),
(103, 'mainmenu', 'Manager', 'blog', '', '2016-02-23-04-11-48/blog', 'index.php?option=com_docstation&view=category&layout=my', 'component', 1, 227, 2, 10125, 0, '0000-00-00 00:00:00', 0, 2, ' ', 0, '{"only_own_docs":"1","show_subcategories":"2","maxLevel":"0","catid":"","show_category_title":"","group_categories":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 90, 95, 0, '*', 0),
(105, 'mainmenu', 'Blog Medium Images', 'blog-medium-images', '', '2016-02-23-04-11-48/blog/blog-medium-images', 'index.php?option=com_content&view=featured', 'component', -2, 103, 3, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"featured_categories":[""],"layout_type":"blog","num_leading_articles":"","num_intro_articles":"","num_columns":"","num_links":"","multi_column_order":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_tags":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 91, 92, 0, '*', 0),
(106, 'mainmenu', 'Blog Large Images', 'blog-large-images', '', '2016-02-23-04-11-48/blog/blog-large-images', 'index.php?option=com_content&view=featured', 'component', -2, 103, 3, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"featured_categories":[""],"layout_type":"blog","num_leading_articles":"","num_intro_articles":"","num_columns":"","num_links":"","multi_column_order":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_tags":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 93, 94, 0, '*', 0),
(189, 'hidden-menu', 'Travelify', 'travelify', '', 'travelify', 'index.php?option=com_content&view=category&layout=blog&id=2', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 9, '{"layout_type":"blog","show_category_heading_title_text":"","show_category_title":"1","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_subcat_desc":"","show_cat_num_articles":"","show_cat_tags":"","page_subheading":"","num_leading_articles":"10","num_intro_articles":"0","num_columns":"1","num_links":"10","multi_column_order":"","show_subcategory_content":"-1","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","show_featured":"","show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"0","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"0","show_tags":"0","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"0","page_heading":"","pageclass_sfx":"categories","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 1, 2, 0, '*', 0),
(190, 'mainmenu', 'Contact us', 'contact-us', '', 'contact-us', 'index.php?option=com_chronoforms5&view=form', 'component', 1, 1, 1, 10102, 0, '0000-00-00 00:00:00', 0, 1, ' ', 10, '{"chronoform":"contact","event":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 59, 60, 0, '*', 0),
(201, 'main', 'COM_CHRONOFORMS5', 'com-chronoforms5', '', 'com-chronoforms5', 'index.php?option=com_chronoforms5', 'component', 0, 1, 1, 10102, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_chronoforms5/CF.png', 0, '{}', 61, 66, 0, '', 1),
(202, 'main', 'COM_CHRONOFORMS5', 'com-chronoforms5', '', 'com-chronoforms5/com-chronoforms5', 'index.php?option=com_chronoforms5', 'component', 0, 201, 2, 10102, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 62, 63, 0, '', 1),
(203, 'main', 'COM_CHRONOFORMS5_VALIDATE', 'com-chronoforms5-validate', '', 'com-chronoforms5/com-chronoforms5-validate', 'index.php?option=com_chronoforms5&act=validateinstall', 'component', 0, 201, 2, 10102, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 64, 65, 0, '', 1),
(205, 'main', 'COM_COMMENT', 'com-comment', '', 'com-comment', 'index.php?option=com_comment', 'component', 0, 1, 1, 10108, 0, '0000-00-00 00:00:00', 0, 1, '../media/com_comment/backend/images/ccomment-logo.png', 0, '{}', 67, 76, 0, '', 1),
(206, 'main', 'COM_COMMENT_MANAGE_COMMENTS', 'com-comment-manage-comments', '', 'com-comment/com-comment-manage-comments', 'index.php?option=com_comment&view=comments', 'component', 0, 205, 2, 10108, 0, '0000-00-00 00:00:00', 0, 1, '../media/com_comment/backend/images/edit.png', 0, '{}', 68, 69, 0, '', 1),
(207, 'main', 'COM_COMMENT_SETTINGS', 'com-comment-settings', '', 'com-comment/com-comment-settings', 'index.php?option=com_comment&view=settings', 'component', 0, 205, 2, 10108, 0, '0000-00-00 00:00:00', 0, 1, '../media/com_comment/backend/images/config.png', 0, '{}', 70, 71, 0, '', 1),
(208, 'main', 'COM_COMMENT_IMPORT', 'com-comment-import', '', 'com-comment/com-comment-import', 'index.php?option=com_comment&view=import', 'component', 0, 205, 2, 10108, 0, '0000-00-00 00:00:00', 0, 1, '../media/com_comment/backend/images/controlpanel.png', 0, '{}', 72, 73, 0, '', 1),
(209, 'main', 'COM_COMMENT_CUSTOM_FIELDS', 'com-comment-custom-fields', '', 'com-comment/com-comment-custom-fields', 'index.php?option=com_comment&view=customfields', 'component', 0, 205, 2, 10108, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 74, 75, 0, '', 1),
(210, 'mainmenu', 'New York', 'new-york', '', 'new-york', 'index.php?option=com_content&view=category&layout=blog&id=11', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"layout_type":"blog","show_category_heading_title_text":"","show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_subcat_desc":"","show_cat_num_articles":"","show_cat_tags":"","page_subheading":"","num_leading_articles":"10","num_intro_articles":"0","num_columns":"1","num_links":"10","multi_column_order":"","show_subcategory_content":"-1","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","show_featured":"","show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"0","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"0","show_tags":"0","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 47, 48, 0, '*', 0),
(211, 'mainmenu', 'Other', 'other', '', 'other', 'index.php?option=com_content&view=category&layout=blog&id=12', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"layout_type":"blog","show_category_heading_title_text":"","show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_subcat_desc":"","show_cat_num_articles":"","show_cat_tags":"","page_subheading":"","num_leading_articles":"10","num_intro_articles":"0","num_columns":"1","num_links":"10","multi_column_order":"","show_subcategory_content":"-1","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","show_featured":"","show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"0","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"0","show_tags":"0","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 49, 50, 0, '*', 0),
(212, 'mainmenu', 'Spain', 'spain', '', 'spain', 'index.php?option=com_content&view=category&layout=blog&id=13', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"layout_type":"blog","show_category_heading_title_text":"","show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_subcat_desc":"","show_cat_num_articles":"","show_cat_tags":"","page_subheading":"","num_leading_articles":"10","num_intro_articles":"0","num_columns":"1","num_links":"10","multi_column_order":"","show_subcategory_content":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","show_featured":"","show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"0","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"0","show_tags":"0","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 51, 52, 0, '*', 0),
(213, 'mainmenu', 'France', 'france', '', 'france', 'index.php?option=com_content&view=category&layout=blog&id=14', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"layout_type":"blog","show_category_heading_title_text":"","show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_subcat_desc":"","show_cat_num_articles":"","show_cat_tags":"","page_subheading":"","num_leading_articles":"10","num_intro_articles":"0","num_columns":"1","num_links":"10","multi_column_order":"","show_subcategory_content":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","show_featured":"","show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"0","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"0","show_tags":"0","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 53, 54, 0, '*', 0),
(214, 'mainmenu', 'Italy', 'italy', '', 'italy', 'index.php?option=com_content&view=category&layout=blog&id=15', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"layout_type":"blog","show_category_heading_title_text":"","show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_subcat_desc":"","show_cat_num_articles":"","show_cat_tags":"","page_subheading":"","num_leading_articles":"10","num_intro_articles":"0","num_columns":"1","num_links":"10","multi_column_order":"","show_subcategory_content":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","show_featured":"","show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"0","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"0","show_tags":"0","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 55, 56, 0, '*', 0),
(215, 'mainmenu', 'Miami', 'miami', '', 'miami', 'index.php?option=com_content&view=category&layout=blog&id=16', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"layout_type":"blog","show_category_heading_title_text":"","show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_subcat_desc":"","show_cat_num_articles":"","show_cat_tags":"","page_subheading":"","num_leading_articles":"10","num_intro_articles":"0","num_columns":"1","num_links":"10","multi_column_order":"","show_subcategory_content":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","show_featured":"","show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_tags":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 57, 58, 0, '*', 0),
(216, 'mainmenu', 'Upload', 'upload', '', '2016-02-23-04-11-48/upload', 'index.php?option=com_docstation&view=upload&layout=edit', 'component', 1, 227, 2, 10125, 0, '0000-00-00 00:00:00', 0, 2, ' ', 0, '{"enable_category":"0","catid":"18","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 96, 97, 0, '*', 0),
(218, 'main', 'COM_AKEEBA', 'com-akeeba', '', 'com-akeeba', 'index.php?option=com_akeeba', 'component', 1, 1, 1, 10115, 0, '0000-00-00 00:00:00', 0, 1, '../media/com_akeeba/icons/akeeba-16.png', 0, '{}', 77, 78, 0, '', 1),
(223, 'main', 'COM_DOCSTATION_MENU', 'com-docstation-menu', '', 'com-docstation-menu', 'index.php?option=com_docstation', 'component', 0, 1, 1, 10125, 0, '0000-00-00 00:00:00', 0, 1, 'class:docstation', 0, '{}', 79, 86, 0, '', 1),
(224, 'main', 'COM_DOCSTATION_MENU_DOCUMENTS', 'com-docstation-menu-documents', '', 'com-docstation-menu/com-docstation-menu-documents', 'index.php?option=com_docstation', 'component', 0, 223, 2, 10125, 0, '0000-00-00 00:00:00', 0, 1, 'class:document', 0, '{}', 80, 81, 0, '', 1),
(225, 'main', 'COM_DOCSTATION_MENU_CATEGORIES', 'com-docstation-menu-categories', '', 'com-docstation-menu/com-docstation-menu-categories', 'index.php?option=com_categories&extension=com_docstation', 'component', 0, 223, 2, 10125, 0, '0000-00-00 00:00:00', 0, 1, 'class:document-cat', 0, '{}', 82, 83, 0, '', 1),
(226, 'main', 'COM_DOCSTATION_MENU_MASSUPLOAD', 'com-docstation-menu-massupload', '', 'com-docstation-menu/com-docstation-menu-massupload', 'index.php?option=com_docstation&view=massupload', 'component', 0, 223, 2, 10125, 0, '0000-00-00 00:00:00', 0, 1, 'class:massupload', 0, '{}', 84, 85, 0, '', 1),
(227, 'mainmenu', 'User', '2016-02-23-04-11-48', '', '2016-02-23-04-11-48', '', 'url', 1, 1, 1, 0, 0, '0000-00-00 00:00:00', 0, 2, ' ', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 87, 98, 0, '*', 0),
(228, 'mainmenu', 'Create Article', 'create-article', '', '2016-02-23-04-11-48/create-article', 'index.php?option=com_content&view=form&layout=edit', 'component', 1, 227, 2, 22, 0, '0000-00-00 00:00:00', 0, 2, ' ', 0, '{"enable_category":"0","catid":"2","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 88, 89, 0, '*', 0);

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_menu_types`
--

CREATE TABLE IF NOT EXISTS `hyxu5_menu_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL,
  `title` varchar(48) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_menutype` (`menutype`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `hyxu5_menu_types`
--

INSERT INTO `hyxu5_menu_types` (`id`, `menutype`, `title`, `description`) VALUES
(1, 'mainmenu', 'Main Menu', 'The main menu for the site'),
(3, 'hidden-menu', 'hidden menu', 'hidden menu');

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_messages`
--

CREATE TABLE IF NOT EXISTS `hyxu5_messages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id_to` int(10) unsigned NOT NULL DEFAULT '0',
  `folder_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `priority` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_messages_cfg`
--

CREATE TABLE IF NOT EXISTS `hyxu5_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) NOT NULL DEFAULT '',
  `cfg_value` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_modules`
--

CREATE TABLE IF NOT EXISTS `hyxu5_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(100) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) NOT NULL DEFAULT '',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) DEFAULT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=128 ;

--
-- Dumping data for table `hyxu5_modules`
--

INSERT INTO `hyxu5_modules` (`id`, `asset_id`, `title`, `note`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `published`, `module`, `access`, `showtitle`, `params`, `client_id`, `language`) VALUES
(1, 39, 'Main Menu', '', '', 1, 'position-7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 1, '{"menutype":"mainmenu","startLevel":"0","endLevel":"0","showAllChildren":"0","tag_id":"","class_sfx":"","window_open":"","layout":"","moduleclass_sfx":"_menu","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(2, 40, 'Login', '', '', 1, 'login', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_login', 1, 1, '', 1, '*'),
(3, 41, 'Popular Articles', '', '', 3, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_popular', 3, 1, '{"count":"5","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(4, 42, 'Recently Added Articles', '', '', 4, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_latest', 3, 1, '{"count":"5","ordering":"c_dsc","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(8, 43, 'Toolbar', '', '', 1, 'toolbar', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_toolbar', 3, 1, '', 1, '*'),
(9, 44, 'Quick Icons', '', '', 1, 'icon', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_quickicon', 3, 1, '', 1, '*'),
(10, 45, 'Logged-in Users', '', '', 2, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_logged', 3, 1, '{"count":"5","name":"1","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(12, 46, 'Admin Menu', '', '', 1, 'menu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 3, 1, '{"layout":"","moduleclass_sfx":"","shownew":"1","showhelp":"1","cache":"0"}', 1, '*'),
(13, 47, 'Admin Submenu', '', '', 1, 'submenu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_submenu', 3, 1, '', 1, '*'),
(14, 48, 'User Status', '', '', 2, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_status', 3, 1, '', 1, '*'),
(15, 49, 'Title', '', '', 1, 'title', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_title', 3, 1, '', 1, '*'),
(16, 50, 'Login Form', '', '', 7, 'position-7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_login', 1, 1, '{"greeting":"1","name":"0"}', 0, '*'),
(17, 51, 'Breadcrumbs', '', '', 1, 'position-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_breadcrumbs', 1, 1, '{"showHere":"1","showHome":"1","homeText":"","showLast":"1","separator":"","layout":"_:default","moduleclass_sfx":"","cache":"0","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(79, 52, 'Multilanguage status', '', '', 1, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_multilangstatus', 3, 1, '{"layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(86, 53, 'Joomla Version', '', '', 1, 'footer', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_version', 3, 1, '{"format":"short","product":"1","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(87, 54, 'social-icons', '', '<ul>\r\n<li class="facebook"><a title="Travelify on Facebook" href="#" target="_blank"></a></li>\r\n<li class="twitter"><a title="Travelify on Twitter" href="#" target="_blank"></a></li>\r\n<li class="google-plus"><a title="Travelify on Google-Plus" href="#" target="_blank"></a></li>\r\n<li class="pinterest"><a title="Travelify on Pinterest" href="#" target="_blank"></a></li>\r\n<li class="youtube"><a title="Travelify on YouTube" href="#" target="_blank"></a></li>\r\n<li class="vimeo"><a title="Travelify on Vimeo" href="#" target="_blank"></a></li>\r\n<li class="linkedin"><a title="Travelify on LinkedIn" href="#" target="_blank"></a></li>\r\n<li class="flickr"><a title="Travelify on Flickr" href="#" target="_blank"></a></li>\r\n<li class="tumblr"><a title="Travelify on Tumblr" href="#" target="_blank"></a></li>\r\n<li class="instagram"><a title="Travelify on Instagram" href="#" target="_blank"></a></li>\r\n<li class="rss"><a title="Travelify on RSS" href="#" target="_blank"></a></li>\r\n<li class="github"><a title="Travelify on GitHub" href="#" target="_blank"></a></li>\r\n</ul>', 1, 'social-icons', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 0, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(88, 55, 'logo', '', '<h1 id="site-title">\r\n  <a href="index.php" title="Travelify" rel="home">\r\n    Travelify								\r\n  </a>\r\n</h1>\r\n<h2 id="site-description">Responsive WordPress Travel Theme Demo</h2>', 0, 'logo', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 0, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(90, 58, 'BM Cool Menu', '', '', 1, 'mainmenu', 198, '2016-02-23 10:13:17', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_bm_cool_menu', 1, 0, '{"menutype":"mainmenu","base":"","startLevel":"1","endLevel":"0","showAllChildren":"1","text_color":"#ffffff","text_hover_color":"#ffffff","bgmenu":"#57ad68","bgimage":"","showBorder":"0","border_radius":"4px","border_color":"#151b54","bg_color_actice":"#439f55","jquery":"0","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"0","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(91, 59, 'BT Content Slider', '', '', 1, 'featured-slider', 198, '2016-02-23 04:18:26', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_bt_contentslider', 1, 0, '{"moduleclass_sfx":" slider-cycle","layout":"_:default","content_title":"","content_link":"","butlet":"1","navigation_top":"0","navigation_right":"0","next_back":"0","module_width":"auto","module_height":"auto","auto_height":"1","items_per_cols":"1","items_per_rows":"1","source":"category","article_ids":"","k2_article_ids":"","btportfolio_article_ids":"","category":["0"],"easyblog_article_ids":"","auto_category":"1","sub_categories":"1","exclude_categories":"","limit_items":"4","limit_items_for_each":"0","user_id":"0","show_featured":"3","ordering":"created-asc","content_plugin":"0","use_introimg":"1","use_caption":"1","use_linka":"0","show_title":"1","limit_title_by":"word","title_max_chars":"80","show_intro":"1","limit_description_by":"char","description_max_chars":"1000","show_category_name":"0","show_category_name_as_link":"0","show_readmore":"0","show_date":"0","show_author":"0","show_image":"1","checkimg_fulltext":"1","check_image_exist":"0","image_align":"center","equalHeight":"1","image_thumb":"1","thumbnail_width":"1018px","thumbnail_height":"460px","image_quality":"300","default_thumb":"0","touch_screen":"0","hovereffect":"1","modalbox":"0","next_back_effect":"slide","bullet_effect":"slide","pause_hover":"1","interval":"5000","duration":"500","effect":"easeInQuad","auto_start":"0","auto_strip_tags":"1","open_target":"_parent","loadJquery":"auto","cache":"0","cache_time":"900","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(103, 80, 'Search', '', '', 1, 'search', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_search', 1, 0, '{"label":"","width":"","text":"Search","button":"0","button_pos":"left","imagebutton":"0","button_text":"","opensearch":"1","opensearch_title":"","set_itemid":"0","layout":"_:default","moduleclass_sfx":"","cache":"0","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(104, 81, 'Smart Latest News right', '', '', 1, 'recent-left', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_smartlatest', 1, 0, '{"catid":[""],"count":"5","show_featured":"","ordering":"c_dsc","user_id":"0","include_css":"1","css":"1","show_header":"0","show_date":"1","link_title":"1","date_format":"%d %B, %Y","show_intro":"0","strip_intro":"1","crop_intro":"1","crop":"200","show_readmore":"0","readmore_text":"Read more","show_link":"0","link":"","link_text":"More news...","show_image1":"1","layout":"travelify:image","moduleclass_sfx":"","cache":"0","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(105, 82, 'Articles - Category ', '', '', 1, 'recent-left', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_articles_category', 1, 0, '{"mode":"normal","show_on_article_page":"1","count":"0","show_front":"show","category_filtering_type":"1","catid":[""],"show_child_category_articles":"0","levels":"1","author_filtering_type":"1","created_by":[""],"author_alias_filtering_type":"1","created_by_alias":[""],"excluded_articles":"","date_filtering":"off","date_field":"a.created","start_date_range":"","end_date_range":"","relative_date":"30","article_ordering":"a.title","article_ordering_direction":"ASC","article_grouping":"none","article_grouping_direction":"ksort","month_year_format":"F Y","link_titles":"1","show_date":"0","show_date_field":"created","show_date_format":"Y-m-d H:i:s","show_category":"1","show_hits":"1","show_author":"1","show_introtext":"1","introtext_limit":"100","show_readmore":"0","show_readmore_title":"1","readmore_limit":"15","layout":"_:default","moduleclass_sfx":"","owncache":"1","cache_time":"900","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(110, 97, 'statistic', '', '', 1, 'category-statistic', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_stats', 1, 0, '{"serverinfo":"1","siteinfo":"1","counter":"1","increase":"0","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(111, 98, 'Right Menu', '', '', 1, 'right-menu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 0, '{"menutype":"mainmenu","base":"","startLevel":"1","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"0","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(114, 102, 'Category statictis', '', '', 1, 'category-statistic', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_articles_categories', 1, 0, '{"parent":"2","show_description":"0","numitems":"1","show_children":"0","count":"0","maxlevel":"0","layout":"_:default","item_heading":"4","moduleclass_sfx":"","owncache":"1","cache_time":"900","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(115, 103, 'Recent bottom 2', '', '', 1, 'recent-bottom2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_smartlatest', 1, 1, '{"catid":[""],"count":"4","show_featured":"","ordering":"c_dsc","user_id":"0","include_css":"1","css":"1","show_header":"0","show_date":"1","link_title":"1","date_format":"%d %B, %Y","show_intro":"0","strip_intro":"1","crop_intro":"1","crop":"200","show_readmore":"0","readmore_text":"Read more","show_link":"0","link":"","link_text":"More news...","show_image1":"1","layout":"travelify:image","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(116, 104, 'Recent bottom 1', '', '', 1, 'recent-bottom1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_smartlatest', 1, 0, '{"catid":[""],"count":"6","show_featured":"","ordering":"c_dsc","user_id":"0","include_css":"0","css":"1","show_header":"0","show_date":"1","link_title":"1","date_format":"%d %B, %Y","show_intro":"0","strip_intro":"1","crop_intro":"1","crop":"200","show_readmore":"0","readmore_text":"Read more","show_link":"0","link":"","link_text":"More news...","show_image1":"0","layout":"travelify:noimage","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(117, 105, 'Tag Cloud', '', '', 1, 'tag-cloud', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_tags_popular', 1, 0, '{"maximum":"20","timeframe":"alltime","order_value":"rand()","order_direction":"1","display_count":0,"no_results_text":"0","minsize":11,"maxsize":29,"layout":"_:default","moduleclass_sfx":"","owncache":"1","cache_time":"900","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(118, 107, 'Tag Cloud 2', '', '', 1, 'tag-cloud', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_tags_similar', 1, 0, '{"maximum":"20","matchtype":"all","ordering":"count","layout":"_:default","moduleclass_sfx":"","owncache":"1","cache_time":"900","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(119, 108, 'copyright', '', 'Copyright © 2016 <a href="#" title="Travelify"><span>Travelify</span></a>. Theme by <a href="#" target="_blank" title="Colorlib"><span>Colorlib</span></a> Powered by <a href="#" target="_blank" title="WordPress"><span>WordPress</span></a>', 1, 'copyright', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 0, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(120, 109, 'footer right', '', '<a href="#">Travelify</a> - Multipurpose WordPress Theme', 0, 'footer-right', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 0, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(121, 110, 'breadcrumbs', '', '', 1, 'breadcrumb', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_breadcrumbs', 1, 0, '{"showHere":"0","showHome":"1","homeText":"colorlib.com","showLast":"1","separator":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(124, 120, 'Archives', '', '', 0, 'archives-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_articles_archive', 1, 0, '{"count":"10","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(125, 122, 'recent-posts-6', '', '', 1, 'recent-posts-6', 198, '2016-02-21 10:57:23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_smartlatest', 1, 0, '{"catid":["","2","11","12"],"count":"5","show_featured":"","ordering":"c_dsc","user_id":"0","include_css":"0","css":"1","show_header":"0","show_date":"1","link_title":"1","date_format":"%d %B, %Y","show_intro":"0","strip_intro":"1","crop_intro":"1","crop":"200","show_readmore":"0","readmore_text":"Read more","show_link":"0","link":"","link_text":"More news...","show_image1":"0","layout":"travelify2:noimage","moduleclass_sfx":"","cache":"0","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(126, 156, 'News Calendar', '', '', 1, 'calendar', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_newscalendar', 1, 0, '{"catid":[""],"show_child_category_articles":"1","levels":"1","usedate":"publish_up","ordering":"c_dsc","count":"0","user_id":"0","state":"1","subyearname":"0","submonthname":"0","subdayname":"2","firstday":"0","defyear":"","defmonth":"0","remmonth":"0","encode":"UTF-8","layout":"_:default","stylesheet":"blue-arrows.css","moduleclass_sfx":"","cache":"0","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(127, 167, 'Login', '', '', 1, 'login', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_login', 1, 0, '{"pretext":"","posttext":"","login":"","logout":"","greeting":"1","name":"0","usesecure":"0","usetext":"0","layout":"_:default","moduleclass_sfx":"","cache":"0","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*');

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_modules_menu`
--

CREATE TABLE IF NOT EXISTS `hyxu5_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hyxu5_modules_menu`
--

INSERT INTO `hyxu5_modules_menu` (`moduleid`, `menuid`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 0),
(79, 0),
(86, 0),
(87, 0),
(88, 0),
(90, 0),
(91, 101),
(96, 0),
(103, -190),
(104, -190),
(105, 0),
(110, 0),
(111, -190),
(114, -190),
(115, 0),
(116, 0),
(117, 0),
(118, 0),
(119, 0),
(120, 0),
(121, -106),
(121, -105),
(121, -103),
(121, -102),
(121, -101),
(124, 190),
(125, 0),
(126, -190),
(127, 0);

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_myjspace`
--

CREATE TABLE IF NOT EXISTS `hyxu5_myjspace` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `pagename` varchar(100) NOT NULL,
  `userid` int(11) NOT NULL DEFAULT '0',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `content` mediumtext,
  `blockEdit` tinyint(4) NOT NULL DEFAULT '0',
  `blockView` int(10) unsigned NOT NULL DEFAULT '1',
  `userread` varchar(100) NOT NULL DEFAULT '',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update_date` timestamp NULL DEFAULT NULL,
  `last_access_date` timestamp NULL DEFAULT NULL,
  `last_access_ip` varchar(8) NOT NULL DEFAULT '0',
  `hits` bigint(20) NOT NULL DEFAULT '0',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `metakey` text NOT NULL,
  `template` varchar(50) NOT NULL DEFAULT '',
  `catid` int(11) NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL DEFAULT '*',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_pagename` (`pagename`),
  KEY `idx_userid` (`userid`),
  KEY `idx_access` (`access`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_myjspace_cfg`
--

CREATE TABLE IF NOT EXISTS `hyxu5_myjspace_cfg` (
  `foldername` varchar(100) NOT NULL,
  PRIMARY KEY (`foldername`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hyxu5_myjspace_cfg`
--

INSERT INTO `hyxu5_myjspace_cfg` (`foldername`) VALUES
('myjsp');

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_newsfeeds`
--

CREATE TABLE IF NOT EXISTS `hyxu5_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `link` varchar(200) NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(10) unsigned NOT NULL DEFAULT '1',
  `cache_time` int(10) unsigned NOT NULL DEFAULT '3600',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` text NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `images` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_overrider`
--

CREATE TABLE IF NOT EXISTS `hyxu5_overrider` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `constant` varchar(255) NOT NULL,
  `string` text NOT NULL,
  `file` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2947 ;

--
-- Dumping data for table `hyxu5_overrider`
--

INSERT INTO `hyxu5_overrider` (`id`, `constant`, `string`, `file`) VALUES
(1, 'COM_AJAX', 'Ajax Interface', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_ajax.ini'),
(2, 'COM_AJAX_XML_DESCRIPTION', 'An extendable Ajax interface for Joomla.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_ajax.ini'),
(3, 'COM_AJAX_SPECIFY_FORMAT', 'Please specify a valid response format, other than that of HTML, such as json, raw, debug, etc.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_ajax.ini'),
(4, 'COM_AJAX_METHOD_NOT_EXISTS', 'Method %s does not exist.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_ajax.ini'),
(5, 'COM_AJAX_FILE_NOT_EXISTS', 'The file at %s does not exist.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_ajax.ini'),
(6, 'COM_AJAX_MODULE_NOT_ACCESSIBLE', 'Module %s is not published, you do not have access to it, or it''s not assigned to the current menu item.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_ajax.ini'),
(7, 'COM_CONFIG', 'Administrator Services', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_config.ini'),
(8, 'COM_CONFIG_CONFIGURATION', 'Administrator Services Configuration', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_config.ini'),
(9, 'COM_CONFIG_ERROR_CONTROLLER_NOT_FOUND', 'Controller Not found!', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_config.ini'),
(10, 'COM_CONFIG_FIELD_DEFAULT_ACCESS_LEVEL_DESC', 'Select the default access level for new content, menu items and other items created on your site.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_config.ini'),
(11, 'COM_CONFIG_FIELD_DEFAULT_ACCESS_LEVEL_LABEL', 'Default Access Level', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_config.ini'),
(12, 'COM_CONFIG_FIELD_DEFAULT_LIST_LIMIT_DESC', 'Sets the default length of lists in the Control Panel for all users.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_config.ini'),
(13, 'COM_CONFIG_FIELD_DEFAULT_LIST_LIMIT_LABEL', 'Default List Limit', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_config.ini'),
(14, 'COM_CONFIG_FIELD_METADESC_DESC', 'Enter a description of the overall website that is to be used by search engines. Generally, a maximum of 20 words is optimal.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_config.ini'),
(15, 'COM_CONFIG_FIELD_METADESC_LABEL', 'Site Meta Description', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_config.ini'),
(16, 'COM_CONFIG_FIELD_METAKEYS_DESC', 'Enter the keywords and phrases that best describe your website. Separate keywords and phrases with a comma.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_config.ini'),
(17, 'COM_CONFIG_FIELD_METAKEYS_LABEL', 'Site Meta Keywords', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_config.ini'),
(18, 'COM_CONFIG_FIELD_SEF_URL_DESC', 'Select whether or not the URLs are optimised for Search Engines.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_config.ini'),
(19, 'COM_CONFIG_FIELD_SEF_URL_LABEL', 'Search Engine Friendly URLs', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_config.ini'),
(20, 'COM_CONFIG_FIELD_SITE_NAME_DESC', 'Enter the name of your website. This will be used in various locations (eg the Backend browser title bar and <em>Site Offline</em> pages).', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_config.ini'),
(21, 'COM_CONFIG_FIELD_SITE_NAME_LABEL', 'Site Name', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_config.ini'),
(22, 'COM_CONFIG_FIELD_VALUE_AFTER', 'After', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_config.ini'),
(23, 'COM_CONFIG_FIELD_VALUE_BEFORE', 'Before', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_config.ini'),
(24, 'COM_CONFIG_FIELD_SITE_OFFLINE_DESC', 'Select whether access to the Site Frontend is available. If Yes, the Frontend will display a message if set such in Backend.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_config.ini'),
(25, 'COM_CONFIG_FIELD_SITE_OFFLINE_LABEL', 'Site Offline', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_config.ini'),
(26, 'COM_CONFIG_FIELD_SITENAME_PAGETITLES_DESC', 'Begin or end all Page Titles with the site name (for example, My Site Name - My Article Name).', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_config.ini'),
(27, 'COM_CONFIG_FIELD_SITENAME_PAGETITLES_LABEL', 'Include Site Name in Page Titles', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_config.ini'),
(28, 'COM_CONFIG_METADATA_SETTINGS', 'Metadata Settings', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_config.ini'),
(29, 'COM_CONFIG_MODULES_MODULE_NAME', 'Module Name', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_config.ini'),
(30, 'COM_CONFIG_MODULES_MODULE_TYPE', 'Module Type', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_config.ini'),
(31, 'COM_CONFIG_MODULES_SETTINGS_TITLE', 'Module Settings', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_config.ini'),
(32, 'COM_CONFIG_MODULES_SAVE_SUCCESS', 'Module successfully saved.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_config.ini'),
(33, 'COM_CONFIG_SAVE_SUCCESS', 'Configuration successfully saved.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_config.ini'),
(34, 'COM_CONFIG_SEO_SETTINGS', 'SEO Settings', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_config.ini'),
(35, 'COM_CONFIG_SITE_SETTINGS', 'Site Settings', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_config.ini'),
(36, 'COM_CONFIG_TEMPLATE_SETTINGS', 'Template Settings', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_config.ini'),
(37, 'COM_CONFIG_XML_DESCRIPTION', 'Frontend Administrator Services Configuration Manager.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_config.ini'),
(38, 'COM_CONTACT_ADDRESS', 'Address', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(39, 'COM_CONTACT_ARTICLES_HEADING', 'Contact''s articles', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(40, 'COM_CONTACT_CAPTCHA_LABEL', 'Captcha', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(41, 'COM_CONTACT_CAPTCHA_DESC', 'Type in the textbox what you see in the image.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(42, 'COM_CONTACT_CAT_NUM', '# of Contacts :', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(43, 'COM_CONTACT_CONTACT_EMAIL_A_COPY_DESC', 'Sends a copy of the message to the address you have supplied.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(44, 'COM_CONTACT_CONTACT_EMAIL_A_COPY_LABEL', 'Send Copy to Yourself', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(45, 'COM_CONTACT_CONTACT_EMAIL_NAME_DESC', 'Your name.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(46, 'COM_CONTACT_CONTACT_EMAIL_NAME_LABEL', 'Name', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(47, 'COM_CONTACT_CONTACT_ENTER_MESSAGE_DESC', 'Enter your message here.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(48, 'COM_CONTACT_CONTACT_ENTER_MESSAGE_LABEL', 'Message', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(49, 'COM_CONTACT_CONTACT_ENTER_VALID_EMAIL', 'Please enter a valid email address.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(50, 'COM_CONTACT_CONTENT_TYPE_CONTACT', 'Contact', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(51, 'COM_CONTACT_CONTENT_TYPE_CATEGORY', 'Contact Category', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(52, 'COM_CONTACT_FILTER_LABEL', 'Filter Field', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(53, 'COM_CONTACT_FILTER_SEARCH_DESC', 'Contact Filter Search', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(54, 'COM_CONTACT_CONTACT_MESSAGE_SUBJECT_DESC', 'Enter the subject of your message here.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(55, 'COM_CONTACT_CONTACT_MESSAGE_SUBJECT_LABEL', 'Subject', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(56, 'COM_CONTACT_CONTACT_SEND', 'Send Email', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(57, 'COM_CONTACT_COPYSUBJECT_OF', 'Copy of: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(58, 'COM_CONTACT_COPYTEXT_OF', 'This is a copy of the following message you sent to %s via %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(59, 'COM_CONTACT_COUNT', 'Contact count:', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(60, 'COM_CONTACT_COUNTRY', 'Country', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(61, 'COM_CONTACT_DEFAULT_PAGE_TITLE', 'Contacts', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(62, 'COM_CONTACT_DETAILS', 'Contact', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(63, 'COM_CONTACT_DOWNLOAD_INFORMATION_AS', 'Download information as:', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(64, 'COM_CONTACT_EMAIL_BANNEDTEXT', 'The %s of your email contains banned text.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(65, 'COM_CONTACT_EMAIL_DESC', 'Email Address for contact.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(66, 'COM_CONTACT_EMAIL_FORM', 'Contact Form', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(67, 'COM_CONTACT_EMAIL_LABEL', 'Email', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(68, 'COM_CONTACT_EMAIL_THANKS', 'Thank you for your email.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(69, 'COM_CONTACT_ENQUIRY_TEXT', 'This is an enquiry email via %s from:', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(70, 'COM_CONTACT_ERROR_CONTACT_NOT_FOUND', 'Contact not found', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(71, 'COM_CONTACT_FAX', 'Fax', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(72, 'COM_CONTACT_FAX_NUMBER', 'Fax: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(73, 'COM_CONTACT_FORM_LABEL', 'Send an Email. All fields with an asterisk (*) are required.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(74, 'COM_CONTACT_FORM_NC', 'Please make sure the form is complete and valid.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(75, 'COM_CONTACT_IMAGE_DETAILS', 'Contact image', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(76, 'COM_CONTACT_LINKS', 'Links', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(77, 'COM_CONTACT_MAILENQUIRY', '%s Enquiry', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(78, 'COM_CONTACT_MOBILE', 'Mobile', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(79, 'COM_CONTACT_MOBILE_NUMBER', 'Mobile: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(80, 'COM_CONTACT_NO_CONTACTS', 'There are no Contacts to display', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(81, 'COM_CONTACT_NOT_MORE_THAN_ONE_EMAIL_ADDRESS', 'You can''t enter more than one email address.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(82, 'COM_CONTACT_OPTIONAL', '(optional)', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(83, 'COM_CONTACT_OTHER_INFORMATION', 'Miscellaneous Information', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(84, 'COM_CONTACT_POSITION', 'Position', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(85, 'COM_CONTACT_PROFILE', 'Profile', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(86, 'COM_CONTACT_PROFILE_HEADING', 'Contact profile', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(87, 'COM_CONTACT_SELECT_CONTACT', 'Select a contact:', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(88, 'COM_CONTACT_STATE', 'State', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(89, 'COM_CONTACT_SUBURB', 'Suburb', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(90, 'COM_CONTACT_TELEPHONE', 'Phone', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(91, 'COM_CONTACT_TELEPHONE_NUMBER', 'Phone: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(92, 'COM_CONTACT_VCARD', 'vCard', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_contact.ini'),
(93, 'COM_CONTENT_ACCESS_DELETE_DESC', 'Inherited state for <strong>delete actions</strong> on this article and the calculated state based on the menu selection.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(94, 'COM_CONTENT_ACCESS_EDITSTATE_DESC', 'Inherited state for <strong>edit state actions</strong> on this article and the calculated state based on the menu selection.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(95, 'COM_CONTENT_ACCESS_EDIT_DESC', 'Inherited state for <strong>edit actions</strong> on this article and the calculated state based on the menu selection.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(96, 'COM_CONTENT_ARTICLE_CONTENT', 'Content', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(97, 'COM_CONTENT_ARTICLE_HITS', 'Hits: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(98, 'COM_CONTENT_ARTICLE_INFO', 'Details', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(99, 'COM_CONTENT_ARTICLE_VOTE_SUCCESS', 'Thank You for rating this Article.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(100, 'COM_CONTENT_ARTICLE_VOTE_FAILURE', 'You already rated this Article today!', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(101, 'COM_CONTENT_AUTHOR_FILTER_LABEL', 'Author Filter', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(102, 'COM_CONTENT_CATEGORY', 'Category: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(103, 'COM_CONTENT_CHECKED_OUT_BY', 'Checked out by %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(104, 'COM_CONTENT_CONTENT_TYPE_ARTICLE', 'Article', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(105, 'COM_CONTENT_CONTENT_TYPE_CATEGORY', 'Article Category', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(106, 'COM_CONTENT_CREATE_ARTICLE', 'Submit new article', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(107, 'COM_CONTENT_CREATED_DATE', 'Created Date', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(108, 'COM_CONTENT_CREATED_DATE_ON', 'Created: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(109, 'COM_CONTENT_EDIT_ITEM', 'Edit Article', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(110, 'COM_CONTENT_ERROR_ARTICLE_NOT_FOUND', 'Article not found', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(111, 'COM_CONTENT_ERROR_LOGIN_TO_VIEW_ARTICLE', 'Please login to view the article', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(112, 'COM_CONTENT_ERROR_PARENT_CATEGORY_NOT_FOUND', 'Parent category not found', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(113, 'COM_CONTENT_FEED_READMORE', 'Read More ...', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(114, 'COM_CONTENT_FILTER_SEARCH_DESC', 'Content Filter Search', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(115, 'COM_CONTENT_FORM_EDIT_ARTICLE', 'Edit an article', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(116, 'COM_CONTENT_HEADING_TITLE', 'Title', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(117, 'COM_CONTENT_HITS_FILTER_LABEL', 'Hits Filter', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(118, 'COM_CONTENT_INTROTEXT', 'Article must have some content.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(119, 'COM_CONTENT_INVALID_RATING', 'Article Rating: Invalid Rating: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(120, 'COM_CONTENT_LAST_UPDATED', 'Last Updated: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(121, 'COM_CONTENT_METADATA', 'Metadata', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(122, 'COM_CONTENT_MODIFIED_DATE', 'Modified Date', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(123, 'COM_CONTENT_MONTH', 'Month', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(124, 'COM_CONTENT_MORE_ARTICLES', 'More Articles ...', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(125, 'COM_CONTENT_NEW_ARTICLE', 'New Article', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(126, 'COM_CONTENT_NO_ARTICLES', 'There are no articles in this category. If subcategories display on this page, they may contain articles.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(127, 'COM_CONTENT_NONE', 'None', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(128, 'COM_CONTENT_NUM_ITEMS', 'Article Count:', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(129, 'COM_CONTENT_ON_NEW_CONTENT', 'A new Article has been submitted by ''%1$s'' entitled ''%2$s''.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(130, 'COM_CONTENT_ORDERING', 'Ordering:<br />New articles default to the first position in the Category. The ordering can be changed in Backend.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(131, 'COM_CONTENT_PAGEBREAK_DOC_TITLE', 'Page Break', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(132, 'COM_CONTENT_PAGEBREAK_INSERT_BUTTON', 'Insert Page Break', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(133, 'COM_CONTENT_PAGEBREAK_TITLE', 'Page Title:', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(134, 'COM_CONTENT_PAGEBREAK_TOC', 'Table of Contents Alias:', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(135, 'COM_CONTENT_PARENT', 'Parent Category: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(136, 'COM_CONTENT_PUBLISHED_DATE', 'Published Date', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(137, 'COM_CONTENT_PUBLISHED_DATE_ON', 'Published: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(138, 'COM_CONTENT_PUBLISHING', 'Publishing', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(139, 'COM_CONTENT_READ_MORE', 'Read more: ', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(140, 'COM_CONTENT_READ_MORE_TITLE', 'Read more ...', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(141, 'COM_CONTENT_REGISTER_TO_READ_MORE', 'Register to read more ...', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(142, 'COM_CONTENT_SAVE_SUCCESS', 'Article successfully saved.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(143, 'COM_CONTENT_SAVE_WARNING', 'Alias already existed so a number was added at the end. If you want to change the alias, please contact a site administrator', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(144, 'COM_CONTENT_SELECT_AN_ARTICLE', 'Select an Article', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(145, 'COM_CONTENT_SUBMIT_SAVE_SUCCESS', 'Article successfully submitted.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(146, 'COM_CONTENT_TITLE_FILTER_LABEL', 'Title Filter', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(147, 'COM_CONTENT_WRITTEN_BY', 'Written by %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(148, 'COM_CONTENT_FIELD_FULL_DESC', 'Select or upload an image for the single article display.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(149, 'COM_CONTENT_FIELD_FULL_LABEL', 'Full Article Image', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(150, 'COM_CONTENT_FIELD_IMAGE_DESC', 'The image to be displayed.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(151, 'COM_CONTENT_FIELD_IMAGE_ALT_DESC', 'Alternative text used for visitors without access to images. Replaced with caption text if it is present.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(152, 'COM_CONTENT_FIELD_IMAGE_ALT_LABEL', 'Alt Text', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(153, 'COM_CONTENT_FIELD_IMAGE_CAPTION_DESC', 'Caption attached to the image.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(154, 'COM_CONTENT_FIELD_IMAGE_CAPTION_LABEL', 'Caption', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(155, 'COM_CONTENT_FIELD_INTRO_DESC', 'Select or upload an image for the intro text layouts such as blogs and featured.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(156, 'COM_CONTENT_FIELD_INTRO_LABEL', 'Intro Image', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(157, 'COM_CONTENT_FIELD_URLC_LABEL', 'Link C', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(158, 'COM_CONTENT_FIELD_URL_DESC', 'Link for display.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(159, 'COM_CONTENT_FIELD_URLA_LABEL', 'Link A', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(160, 'COM_CONTENT_FIELD_URLA_LINK_TEXT_LABEL', 'Link A Text', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(161, 'COM_CONTENT_FIELD_URLB_LABEL', 'Link B', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(162, 'COM_CONTENT_FIELD_URL_LINK_TEXT_DESC', 'Text to display for the link.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(163, 'COM_CONTENT_FIELD_URLB_LINK_TEXT_LABEL', 'Link B Text', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(164, 'COM_CONTENT_FIELD_URLC_LINK_TEXT_LABEL', 'Link C Text', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(165, 'COM_CONTENT_FLOAT_DESC', 'Controls placement of the image.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(166, 'COM_CONTENT_FLOAT_LABEL', 'Image Float', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(167, 'COM_CONTENT_FLOAT_INTRO_LABEL', 'Intro Image float', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(168, 'COM_CONTENT_FLOAT_FULLTEXT_LABEL', 'Full text image float.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(169, 'COM_CONTENT_LEFT', 'Left', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(170, 'COM_CONTENT_RIGHT', 'Right', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(171, 'COM_CONTENT_FIELD_URL_LINK_TEXT_LABEL', 'Link Text', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(172, 'COM_CONTENT_IMAGES_AND_URLS', 'Images and Links', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_content.ini'),
(173, 'COM_FINDER', 'Smart Search', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_finder.ini'),
(174, 'COM_FINDER_ADVANCED_SEARCH_TOGGLE', 'Advanced Search', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_finder.ini'),
(175, 'COM_FINDER_ADVANCED_TIPS', '<p>Here are a few examples of how you can use the search feature:</p><p>Entering <span class="term">this and that</span> into the search form will return results containing both &quot;this&quot; and &quot;that&quot;.</p><p>Entering <span class="term">this not that</span> into the search form will return results containing &quot;this&quot; and not &quot;that&quot;.</p><p>Entering <span class="term">this or that</span> into the search form will return results containing either &quot;this&quot; or &quot;that&quot;.</p><p>Entering <span class="term">&quot;this and that&quot;</span> (with quotes) into the search form will return results containing the exact phrase &quot;this and that&quot;.</p><p>Search results can also be filtered using a variety of criteria. Select one or more filters below to get started.</p>', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_finder.ini'),
(176, 'COM_FINDER_DEFAULT_PAGE_TITLE', 'Search Results', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_finder.ini'),
(177, 'COM_FINDER_FILTER_BRANCH_LABEL', 'Search by %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_finder.ini'),
(178, 'COM_FINDER_FILTER_DATE_BEFORE', 'Before', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_finder.ini'),
(179, 'COM_FINDER_FILTER_DATE_EXACTLY', 'Exactly', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_finder.ini'),
(180, 'COM_FINDER_FILTER_DATE_AFTER', 'After', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_finder.ini'),
(181, 'COM_FINDER_FILTER_DATE1', 'Start Date', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_finder.ini'),
(182, 'COM_FINDER_FILTER_DATE1_DESC', 'Enter a date in YYYY-MM-DD format.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_finder.ini'),
(183, 'COM_FINDER_FILTER_DATE2', 'End Date', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_finder.ini'),
(184, 'COM_FINDER_FILTER_DATE2_DESC', 'Enter a date in YYYY-MM-DD format.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_finder.ini'),
(185, 'COM_FINDER_FILTER_SELECT_ALL_LABEL', 'Search All', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_finder.ini'),
(186, 'COM_FINDER_FILTER_WHEN_AFTER', 'After', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_finder.ini'),
(187, 'COM_FINDER_FILTER_WHEN_BEFORE', 'Before', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_finder.ini'),
(188, 'COM_FINDER_QUERY_DATE_CONDITION_AFTER', 'after', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_finder.ini'),
(189, 'COM_FINDER_QUERY_DATE_CONDITION_BEFORE', 'before', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_finder.ini'),
(190, 'COM_FINDER_QUERY_DATE_CONDITION_EXACT', 'exactly on', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_finder.ini'),
(191, 'COM_FINDER_QUERY_END_DATE', 'ending date <span class="when">%s</span> <span class="date">%s</span>', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_finder.ini'),
(192, 'COM_FINDER_QUERY_OPERATOR_AND', 'and', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_finder.ini'),
(193, 'COM_FINDER_QUERY_OPERATOR_OR', 'or', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_finder.ini'),
(194, 'COM_FINDER_QUERY_OPERATOR_NOT', 'not', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_finder.ini'),
(195, 'COM_FINDER_QUERY_FILTER_BRANCH_VENUE', 'venue', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_finder.ini'),
(196, 'COM_FINDER_QUERY_START_DATE', 'beginning date <span class="when">%s</span> <span class="date">%s</span>', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_finder.ini'),
(197, 'COM_FINDER_QUERY_TAXONOMY_NODE', 'with <span class="node">%s</span> as <span class="branch">%s</span> ', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_finder.ini'),
(198, 'COM_FINDER_QUERY_TOKEN_EXCLUDED', '<span class="term">%s</span> should be excluded.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_finder.ini'),
(199, 'COM_FINDER_QUERY_TOKEN_GLUE', ', and ', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_finder.ini'),
(200, 'COM_FINDER_QUERY_TOKEN_INTERPRETED', 'Assuming %s, the following results were found.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_finder.ini'),
(201, 'COM_FINDER_QUERY_TOKEN_OPTIONAL', '<span class="term">%s</span> is optional.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_finder.ini'),
(202, 'COM_FINDER_QUERY_TOKEN_REQUIRED', '<span class="term">%s</span> is required.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_finder.ini'),
(203, 'COM_FINDER_SEARCH_NO_RESULTS_BODY', 'No search results could be found for query: %s.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_finder.ini'),
(204, 'COM_FINDER_SEARCH_NO_RESULTS_BODY_MULTILANG', 'No search results (in English-UK) could be found for query: %s.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_finder.ini'),
(205, 'COM_FINDER_SEARCH_NO_RESULTS_HEADING', 'No Results Found', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_finder.ini'),
(206, 'COM_FINDER_SEARCH_RESULTS_OF', 'Results <strong>%s</strong> - <strong>%s</strong> of <strong>%s</strong>', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_finder.ini'),
(207, 'COM_FINDER_SEARCH_SIMILAR', 'Did you mean: %s?', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_finder.ini'),
(208, 'COM_FINDER_SEARCH_TERMS', 'Search Terms:', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_finder.ini'),
(209, 'LINK_READ_COMMENTS', 'Comments (%s)', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(210, 'LINK_READ_COMMENTS_1', '%s comment', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(211, 'LINK_READ_COMMENTS_MORE', '%s comments', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(212, 'LINK_ADD_COMMENT', 'Add new comment', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(213, 'LINK_READ_MORE', 'More...', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(214, 'LINK_REGISTER_TO_READ_MORE', 'Register to read more...', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(215, 'ARTICLE_HITS', 'Hits: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(216, 'COMMENTS_LIST_HEADER', 'Comments', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(217, 'COMMENT_TITLE_RE', 'RE:', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(218, 'COMMENT_TEXT_CODE', 'Code:', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(219, 'COMMENT_TEXT_COMMENT_HAS_BEEN_DELETED', 'This comment has been deleted by Administrator', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(220, 'COMMENT_TEXT_QUOTE', 'Quote:', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(221, 'COMMENT_TEXT_QUOTE_EXTENDED', 'Quoting %s:', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(222, 'BUTTON_QUOTE', 'Quote', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(223, 'BUTTON_REPLY', 'Reply', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(224, 'BUTTON_REPLY_WITH_QUOTE', 'Reply with quote', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(225, 'BUTTON_RSS', 'RSS feed for comments to this post', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(226, 'BUTTON_REFRESH', 'Refresh comments list', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(227, 'BUTTON_VOTE_GOOD', 'Good comment!', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(228, 'BUTTON_VOTE_BAD', 'Bad comment!', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(229, 'BUTTON_REPORT', 'Report to administrator', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(230, 'DATE_FORMAT', 'Y-m-d', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(231, 'TIME_FORMAT', 'H:i', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(232, 'DATETIME_FORMAT', 'Y-m-d H:i', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(233, 'OBJECT_FEED_DESCRIPTION', 'Discuss %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(234, 'OBJECT_FEED_ITEM_TITLE', '%s says:', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(235, 'SITE_FEED_TITLE', 'Comments', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(236, 'SITE_FEED_DESCRIPTION', 'Discuss %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(237, 'SITE_FEED_ITEM_DESCRIPTION', '%s says: &quot;%s&quot;', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(238, 'USER_FEED_TITLE', 'Comments by &quot;%s&quot;', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(239, 'USER_FEED_DESCRIPTION', 'Comments by user &quot;%s&quot;', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(240, 'USER_FEED_ITEM_DESCRIPTION', '%s says: &quot;%s&quot;', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(241, 'FORM_HEADER', 'Add comment', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(242, 'FORM_SEND', 'Send', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(243, 'FORM_SEND_HINT', 'Send (Ctrl+Enter)', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(244, 'FORM_NAME', 'Name', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(245, 'FORM_NAME_REQUIRED', 'Name (required)', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(246, 'FORM_EMAIL', 'E-mail', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(247, 'FORM_EMAIL_REQUIRED', 'E-mail (required, but will not display)', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(248, 'FORM_HOMEPAGE', 'Website', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(249, 'FORM_HOMEPAGE_REQUIRED', 'Website (required)', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(250, 'FORM_TITLE', 'Title', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(251, 'FORM_TITLE_REQUIRED', 'Title (required)', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(252, 'FORM_CHARSLEFT_PREFIX', '', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(253, 'FORM_CHARSLEFT_SUFFIX', ' symbols left', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(254, 'FORM_CAPTCHA', 'Security code', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(255, 'FORM_CAPTCHA_REFRESH', 'Refresh', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(256, 'FORM_CAPTCHA_DESC', 'This step helps prevent unfair use of automated programs. If you can not read this code click on Refresh link and try a different one.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(257, 'FORM_SAVE', 'Save', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(258, 'FORM_CANCEL', 'Cancel', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(259, 'FORM_SUBSCRIBE', 'Notify me of follow-up comments', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(260, 'FORM_BBCODE_B', 'Bold', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(261, 'FORM_BBCODE_I', 'Italic', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(262, 'FORM_BBCODE_U', 'Underlined', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(263, 'FORM_BBCODE_S', 'Striked', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(264, 'FORM_BBCODE_URL', 'Link', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(265, 'FORM_BBCODE_IMG', 'Image', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(266, 'FORM_BBCODE_QUOTE', 'Quote', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(267, 'FORM_BBCODE_LIST', 'List', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(268, 'FORM_BBCODE_HIDE', 'Hidden text (only for registered)', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(269, 'BBCODE_HINT_ENTER_TEXT', 'Enter text', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(270, 'BBCODE_HINT_ENTER_FULL_URL_TO_THE_IMAGE', 'Enter full URL to the image', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(271, 'BBCODE_HINT_ENTER_FULL_URL', 'Enter full URL', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(272, 'BBCODE_HINT_ENTER_TEXT_TO_QUOTE', 'Enter text to quote', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(273, 'BBCODE_HINT_ENTER_LIST_ITEM_TEXT', 'Enter list item text', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(274, 'BBCODE_HINT_ENTER_TEXT_TO_HIDE_IT_FROM_UNREGISTERED', 'Enter text to hide from unregistered', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(275, 'BBCODE_MESSAGE_HIDDEN_TEXT', 'Only registered users can view hidden text!', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(276, 'BUTTON_EDIT', 'Change', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(277, 'BUTTON_DELETE', 'Delete', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(278, 'BUTTON_DELETE_CONIRM', 'Delete comment?', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(279, 'BUTTON_PUBLISH', 'Publish', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(280, 'BUTTON_UNPUBLISH', 'Unpublish', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(281, 'BUTTON_IP', 'IP', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(282, 'BUTTON_MAILTO', 'Write e-mail', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(283, 'BUTTON_BANIP', 'Ban IP', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(284, 'NOTIFICATION_SUBJECT_NEW', 'Comment has been added: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(285, 'NOTIFICATION_SUBJECT_UPDATED', 'Comment has been changed: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(286, 'NOTIFICATION_DISCUSSION', 'Discuss:', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(287, 'NOTIFICATION_COMMENT_TITLE', 'Content item title', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(288, 'NOTIFICATION_COMMENT_LINK', 'Link to the comment', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(289, 'NOTIFICATION_COMMENT_DATE', 'Date', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(290, 'NOTIFICATION_COMMENT_NAME', 'Comment author', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(291, 'NOTIFICATION_COMMENT_EMAIL', 'Author''s E-mail', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(292, 'NOTIFICATION_COMMENT_HOMEPAGE', 'Author''s site', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(293, 'NOTIFICATION_COMMENT_TEXT', 'Comment text', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(294, 'NOTIFICATION_COMMENT_UNSUBSCRIBE_MESSAGE', 'This message was sent to you because you chose to be notified about new comments related to &quot;%s&quot;. You can unsubscribe by clicking on the link below', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(295, 'NOTIFICATION_COMMENT_UNSUBSCRIBE_LINK', 'Unsubscribe', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(296, 'BUTTON_UNSUBSCRIBE', 'Unsubscribe', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(297, 'BUTTON_SUBSCRIBE', 'Subscribe', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(298, 'SUCCESSFULLY_UNSUBSCRIBED', 'You have been successfully unsubscribed!', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(299, 'ERROR_ALREADY_SUBSCRIBED', 'Already subscribed!', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(300, 'REPORT_TO_ADMINISTRATOR', 'Report to administrator', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(301, 'REPORT_NAME', 'Name', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(302, 'REPORT_GUEST', 'Guest', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(303, 'REPORT_REASON', 'Reason', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(304, 'REPORT_REASON_UNKNOWN_REASON', 'Unknown reason', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(305, 'REPORT_SUBMIT', 'Submit', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(306, 'REPORT_CANCEL', 'Cancel', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(307, 'REPORT_SUCCESSFULLY_SENT', 'Report successfully sent!', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(308, 'ERROR_COMMENT_ALREADY_REPORTED', 'Comment already reported to the site administrator', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(309, 'REPORT_NOTIFICATION_SUBJECT', 'Reported comment', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(310, 'REPORT_NOTIFICATION_MESSAGE', 'The following comment by &quot;%1$s&quot; has been reported by &quot;%2$s&quot;', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(311, 'REPORT_NOTIFICATION_MESSAGE_REASON', 'The reporter gave the following reason', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(312, 'THANK_YOU_FOR_YOUR_SUBMISSION', 'Thank you for your submission!', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(313, 'THANK_YOU_YOUR_COMMENT_WILL_BE_PUBLISHED_ONCE_REVIEWED', 'Thank you, your comment will be published once reviewed.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(314, 'ERROR_EMPTY_NAME', 'Please enter your name!', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(315, 'ERROR_NAME_EXISTS', 'This name is already in use. Please login or try another name.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(316, 'ERROR_EMAIL_EXISTS', 'This e-mail address is already used by a registered user. Please login or try another address.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(317, 'ERROR_FORBIDDEN_NAME', 'Specified name is located in the list of forbidden words.\\nPlease try another name.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(318, 'ERROR_INVALID_NAME', 'This name consists of forbidden symbols.\\nPlease do not use quotation marks or square brackets [ and ] in the name.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(319, 'ERROR_YOUR_COMMENT_IS_TOO_LONG', 'Comment is too long!', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(320, 'ERROR_YOUR_COMMENT_IS_TOO_SHORT', 'Your comment is too short!', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(321, 'ERROR_NOTHING_EXCEPT_QUOTES', 'Your message consists only of a quote of another comment. May be you forgot to comment this quote?', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(322, 'ERROR_TOO_LONG_USERNAME', 'Username is too long!', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(323, 'ERROR_TOO_QUICK', 'You have recently added a new comment, please try again later.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(324, 'ERROR_NOTHING_TO_QUOTE', 'There is no text for quoting!', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(325, 'ERROR_EMPTY_EMAIL', 'Please enter your e-mail!', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(326, 'ERROR_INCORRECT_EMAIL', 'Please enter a valid e-mail!', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(327, 'ERROR_EMPTY_HOMEPAGE', 'Please enter site URL!', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(328, 'ERROR_EMPTY_TITLE', 'Please enter a comment title!', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(329, 'ERROR_EMPTY_COMMENT', 'Please enter text of your comment!', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(330, 'ERROR_CAPTCHA', 'Please enter security code displayed in the image!', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(331, 'ERROR_DUPLICATE_COMMENT', 'You have already posted the same comment.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(332, 'ERROR_CANT_COMMENT', 'You have no rights to add a new comment. May be you need to register on the site.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(333, 'ERROR_CANT_DELETE', 'You have no rights to delete comments.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(334, 'ERROR_CANT_PUBLISH', 'You have no rights for publishing comments.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(335, 'ERROR_CANT_EDIT', 'You have no rights for editing comments.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(336, 'ERROR_BEING_EDITTED', 'This comment is currently being edited by another person', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(337, 'ERROR_NOT_FOUND', 'Can not find comment message!\\n May be it has been deleted or unpublished by administrator.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(338, 'ERROR_ALREADY_VOTED', 'You have already voted for this comment!', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(339, 'ERROR_CANT_VOTE', 'You do not have enough rights to vote!', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(340, 'ERROR_SUBSCRIPTION_EMAIL', 'Provide your e-mail to receive notifications about new comments.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(341, 'ERROR_YOU_HAVE_NO_RIGHTS_TO_USE_THIS_TAG', 'You have no rights to use this tag.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(342, 'ERROR_YOU_CAN_NOT_REPORT_THE_SAME_COMMENT_MORE_THAN_ONCE', 'You can not report the same comment more than once!', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(343, 'ERROR_YOU_HAVE_NO_RIGHTS_TO_REPORT', 'You have no rights to report a comment!', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(344, 'ERROR_NO_REASON_FOR_REPORT', 'Please enter the reason for your report!', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(345, 'ERROR_SESSION_EXPIRED', 'Your session has expired. Please log in again.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(346, 'SUCCESSFULLY_BANNED', 'IP-address of this comment''s author has been successfully blacklisted.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(347, 'ERROR_IP_ALREADY_BANNED', 'IP-address of this comment''s author is already blacklisted!', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(348, 'ERROR_YOU_CAN_NOT_BAN_YOUR_IP', 'You can not blacklist your own current IP-address!', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(349, 'QUICK_MODERATION', 'Quick moderation', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(350, 'ERROR_QUICK_MODERATION_DISABLED', 'Quick moderation function is disabled by administrator!', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(351, 'ERROR_QUICK_MODERATION_INCORRECT_HASH', 'Incorrect hash for this operation!', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_jcomments.ini'),
(352, 'COM_MAILTO', 'Mailto', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_mailto.ini'),
(353, 'COM_MAILTO_CANCEL', 'Cancel', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_mailto.ini'),
(354, 'COM_MAILTO_CLOSE_WINDOW', 'Close Window', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_mailto.ini'),
(355, 'COM_MAILTO_EMAIL_ERR_NOINFO', 'Please provide a valid email address.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_mailto.ini'),
(356, 'COM_MAILTO_EMAIL_INVALID', 'The address ''%s'' does not appear to be a valid email address.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_mailto.ini'),
(357, 'COM_MAILTO_EMAIL_MSG', 'This is an email from (%s) sent by %s (%s). You may also find the following link interesting: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_mailto.ini'),
(358, 'COM_MAILTO_EMAIL_NOT_SENT', 'Email could not be sent.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_mailto.ini'),
(359, 'COM_MAILTO_EMAIL_SENT', 'Email was sent successfully.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_mailto.ini'),
(360, 'COM_MAILTO_EMAIL_TO', 'Email to', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_mailto.ini'),
(361, 'COM_MAILTO_EMAIL_TO_A_FRIEND', 'Email this link to a friend.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_mailto.ini'),
(362, 'COM_MAILTO_LINK_IS_MISSING', 'Link is missing', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_mailto.ini'),
(363, 'COM_MAILTO_SEND', 'Send', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_mailto.ini'),
(364, 'COM_MAILTO_SENDER', 'Sender', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_mailto.ini'),
(365, 'COM_MAILTO_SENT_BY', 'Item sent by', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_mailto.ini'),
(366, 'COM_MAILTO_SUBJECT', 'Subject', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_mailto.ini'),
(367, 'COM_MAILTO_YOUR_EMAIL', 'Your Email', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_mailto.ini'),
(368, 'COM_MEDIA_ALIGN', 'Image Float', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(369, 'COM_MEDIA_ALIGN_DESC', 'This will apply the classes ''pull-left'', ''pull-center'' or ''pull-right'' to the ''<figure>'' or ''<img>'' element.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(370, 'COM_MEDIA_BROWSE_FILES', 'Browse Files', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(371, 'COM_MEDIA_CAPTION', 'Caption', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini');
INSERT INTO `hyxu5_overrider` (`id`, `constant`, `string`, `file`) VALUES
(372, 'COM_MEDIA_CAPTION_CLASS_LABEL', 'Caption Class', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(373, 'COM_MEDIA_CAPTION_CLASS_DESC', 'This will apply the entered class to the ''<figcaption>'' element. For example: ''text-left'', ''text-right'', ''text-center''.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(374, 'COM_MEDIA_CLEAR_LIST', 'Clear List', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(375, 'COM_MEDIA_CONFIGURATION', 'Media: Options', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(376, 'COM_MEDIA_CREATE_FOLDER', 'Create Folder', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(377, 'COM_MEDIA_CURRENT_PROGRESS', 'Current progress', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(378, 'COM_MEDIA_DESCFTP', 'To upload, change and delete media files, Joomla! will most likely need your FTP account details. Please enter them in the form fields below.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(379, 'COM_MEDIA_DESCFTPTITLE', 'FTP Login Details', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(380, 'COM_MEDIA_DETAIL_VIEW', 'Detail View', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(381, 'COM_MEDIA_DIRECTORY', 'Folder', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(382, 'COM_MEDIA_DIRECTORY_UP', 'Folder Up', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(383, 'COM_MEDIA_ERROR_BAD_REQUEST', 'Bad Request', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(384, 'COM_MEDIA_ERROR_FILE_EXISTS', 'File already exists.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(385, 'COM_MEDIA_ERROR_UNABLE_TO_CREATE_FOLDER_WARNDIRNAME', 'Unable to create folder. Folder name must only contain alphanumeric characters and no spaces.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(386, 'COM_MEDIA_ERROR_UNABLE_TO_BROWSE_FOLDER_WARNDIRNAME', 'Unable to browse:&#160;%s. Folder name must only contain alphanumeric characters and no spaces.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(387, 'COM_MEDIA_ERROR_UNABLE_TO_DELETE', ' Unable to delete:&#160;', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(388, 'COM_MEDIA_ERROR_UNABLE_TO_DELETE_FILE_WARNFILENAME', 'Unable to delete:&#160;%s. File name must only contain alphanumeric characters and no spaces.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(389, 'COM_MEDIA_ERROR_UNABLE_TO_DELETE_FOLDER_NOT_EMPTY', 'Unable to delete:&#160;%s. Folder is not empty!', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(390, 'COM_MEDIA_ERROR_UNABLE_TO_DELETE_FOLDER_WARNDIRNAME', 'Unable to delete:&#160;%s. Folder name must only contain alphanumeric characters and no spaces.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(391, 'COM_MEDIA_ERROR_UNABLE_TO_UPLOAD_FILE', 'Unable to upload file.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(392, 'COM_MEDIA_ERROR_WARNFILETOOLARGE', 'This file is too large to upload.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(393, 'COM_MEDIA_ERROR_WARNUPLOADTOOLARGE', 'Total size of upload exceeds the limit.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(394, 'COM_MEDIA_FIELD_CHECK_MIME_DESC', 'Use MIME Magic or Fileinfo to attempt to verify files. Try disabling this if you get invalid mime type errors.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(395, 'COM_MEDIA_FIELD_CHECK_MIME_LABEL', 'Check MIME Types', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(396, 'COM_MEDIA_FIELD_IGNORED_EXTENSIONS_DESC', 'Ignored file extensions for MIME type checking and restricted uploads.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(397, 'COM_MEDIA_FIELD_IGNORED_EXTENSIONS_LABEL', 'Ignored Extensions', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(398, 'COM_MEDIA_FIELD_ILLEGAL_MIME_TYPES_DESC', 'A comma separated list of illegal MIME types for upload (blacklist).', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(399, 'COM_MEDIA_FIELD_ILLEGAL_MIME_TYPES_LABEL', 'Illegal MIME Types', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(400, 'COM_MEDIA_FIELD_LEGAL_EXTENSIONS_DESC', ' Extensions (file types) you are allowed to upload (comma separated).', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(401, 'COM_MEDIA_FIELD_LEGAL_EXTENSIONS_LABEL', 'Legal Extensions (File Types)', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(402, 'COM_MEDIA_FIELD_LEGAL_IMAGE_EXTENSIONS_DESC', ' Image extensions (file types) you are allowed to upload (comma separated). These are used to check for valid image headers.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(403, 'COM_MEDIA_FIELD_LEGAL_IMAGE_EXTENSIONS_LABEL', 'Legal Image Extensions (File Types)', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(404, 'COM_MEDIA_FIELD_LEGAL_MIME_TYPES_DESC', 'A comma separated list of legal MIME types for upload.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(405, 'COM_MEDIA_FIELD_LEGAL_MIME_TYPES_LABEL', 'Legal MIME Types', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(406, 'COM_MEDIA_FIELD_MAXIMUM_SIZE_DESC', 'The maximum size for an upload (in bytes). Use zero for no limit. Note: your server has a maximum limit.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(407, 'COM_MEDIA_FIELD_MAXIMUM_SIZE_LABEL', 'Maximum Size', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(408, 'COM_MEDIA_FIELD_PATH_FILE_FOLDER_DESC', 'Enter the path to the file folder relative to root.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(409, 'COM_MEDIA_FIELD_PATH_FILE_FOLDER_LABEL', 'Path to File Folder', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(410, 'COM_MEDIA_FIELD_PATH_IMAGE_FOLDER_DESC', 'Enter the path to the image folder relative to root.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(411, 'COM_MEDIA_FIELD_PATH_IMAGE_FOLDER_LABEL', 'Path to Image Folder', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(412, 'COM_MEDIA_FIELD_RESTRICT_UPLOADS_DESC', 'Restrict uploads for lower than manager users to just images if Fileinfo or MIME Magic isn''t installed.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(413, 'COM_MEDIA_FIELD_RESTRICT_UPLOADS_LABEL', 'Restrict Uploads', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(414, 'COM_MEDIA_FILES', 'Files', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(415, 'COM_MEDIA_FILESIZE', 'File size', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(416, 'COM_MEDIA_FOLDER', 'Folder', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(417, 'COM_MEDIA_FOLDERS', 'Folders', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(418, 'COM_MEDIA_IMAGE_DESCRIPTION', 'Image Description', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(419, 'COM_MEDIA_IMAGE_URL', 'Image URL', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(420, 'COM_MEDIA_INSERT', 'Insert', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(421, 'COM_MEDIA_INSERT_IMAGE', 'Insert Image', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(422, 'COM_MEDIA_MAXIMUM_SIZE', 'Maximum Size', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(423, 'COM_MEDIA_MEDIA', 'Media', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(424, 'COM_MEDIA_NAME', 'Image Name', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(425, 'COM_MEDIA_NO_IMAGES_FOUND', 'No Images Found', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(426, 'COM_MEDIA_NOT_SET', 'Not Set', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(427, 'COM_MEDIA_OVERALL_PROGRESS', 'Overall Progress', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(428, 'COM_MEDIA_PIXEL_DIMENSIONS', 'Pixel Dimensions (w x h)', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(429, 'COM_MEDIA_START_UPLOAD', 'Start Upload', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(430, 'COM_MEDIA_THUMBNAIL_VIEW', 'Thumbnail View', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(431, 'COM_MEDIA_TITLE', 'Image Title', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(432, 'COM_MEDIA_UP', 'Up', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(433, 'COM_MEDIA_UPLOAD', 'Upload', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(434, 'COM_MEDIA_UPLOAD_COMPLETE', 'Upload Complete', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(435, 'COM_MEDIA_UPLOAD_FILE', 'Upload file', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(436, 'COM_MEDIA_UPLOAD_FILES', 'Upload files (Maximum Size: %s MB)', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(437, 'COM_MEDIA_UPLOAD_FILES_NOLIMIT', 'Upload files (No maximum size)', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(438, 'COM_MEDIA_UPLOAD_SUCCESSFUL', 'Upload Successful', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_media.ini'),
(439, 'COM_MESSAGES_ERR_SEND_FAILED', 'The user has locked their mailbox. Message failed.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_messages.ini'),
(440, 'COM_MESSAGES_NEW_MESSAGE_ARRIVED', 'A new private message has arrived from %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_messages.ini'),
(441, 'COM_MESSAGES_PLEASE_LOGIN', 'Please log in to %s to read your message.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_messages.ini'),
(442, 'COM_NEWSFEEDS_CACHE_DIRECTORY_UNWRITABLE', 'The cache folder is unwritable. The news feed can''t be displayed. Please contact a site administrator.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_newsfeeds.ini'),
(443, 'COM_NEWSFEEDS_CAT_NUM', '# of News feeds :', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_newsfeeds.ini'),
(444, 'COM_NEWSFEEDS_CONTENT_TYPE_NEWSFEED', 'News Feed', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_newsfeeds.ini'),
(445, 'COM_NEWSFEEDS_CONTENT_TYPE_CATEGORY', 'News Feed Category', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_newsfeeds.ini'),
(446, 'COM_NEWSFEEDS_DEFAULT_PAGE_TITLE', 'News Feeds', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_newsfeeds.ini'),
(447, 'COM_NEWSFEEDS_ERROR_FEED_NOT_FOUND', 'Error. Feed not found.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_newsfeeds.ini'),
(448, 'COM_NEWSFEEDS_ERRORS_FEED_NOT_RETRIEVED', 'Error. Feed could not be retrieved.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_newsfeeds.ini'),
(449, 'COM_NEWSFEEDS_FEED_LINK', 'Feed Link', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_newsfeeds.ini'),
(450, 'COM_NEWSFEEDS_FEED_NAME', 'Feed Name', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_newsfeeds.ini'),
(451, 'COM_NEWSFEEDS_FILTER_LABEL', 'Filter Field', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_newsfeeds.ini'),
(452, 'COM_NEWSFEEDS_FILTER_SEARCH_DESC', 'News Feed Filter Search', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_newsfeeds.ini'),
(453, 'COM_NEWSFEEDS_NO_ARTICLES', 'No Articles for this News Feed.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_newsfeeds.ini'),
(454, 'COM_NEWSFEEDS_NUM_ARTICLES', '# Articles', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_newsfeeds.ini'),
(455, 'COM_NEWSFEEDS_NUM_ARTICLES_COUNT', '# Articles: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_newsfeeds.ini'),
(456, 'COM_NEWSFEEDS_NUM_ITEMS', '# News feeds', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_newsfeeds.ini'),
(457, 'COM_SEARCH_ALL_WORDS', 'All words', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_search.ini'),
(458, 'COM_SEARCH_ALPHABETICAL', 'Alphabetical', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_search.ini'),
(459, 'COM_SEARCH_ANY_WORDS', 'Any words', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_search.ini'),
(460, 'COM_SEARCH_ERROR_ENTERKEYWORD', 'Enter a search keyword', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_search.ini'),
(461, 'COM_SEARCH_ERROR_IGNOREKEYWORD', 'One or more common words were ignored in the search.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_search.ini'),
(462, 'COM_SEARCH_ERROR_SEARCH_MESSAGE', 'Search term must be a minimum of %1$s characters and a maximum of %2$s characters.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_search.ini'),
(463, 'COM_SEARCH_EXACT_PHRASE', 'Exact Phrase', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_search.ini'),
(464, 'COM_SEARCH_FIELD_SEARCH_PHRASES_DESC', 'Show the search options.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_search.ini'),
(465, 'COM_SEARCH_FIELD_SEARCH_PHRASES_LABEL', 'Use Search Options', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_search.ini'),
(466, 'COM_SEARCH_FIELD_SEARCH_AREAS_DESC', 'Show the search areas checkboxes.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_search.ini'),
(467, 'COM_SEARCH_FIELD_SEARCH_AREAS_LABEL', 'Use Search Areas', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_search.ini'),
(468, 'COM_SEARCH_FOR', 'Search for:', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_search.ini'),
(469, 'COM_SEARCH_MOST_POPULAR', 'Most Popular', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_search.ini'),
(470, 'COM_SEARCH_NEWEST_FIRST', 'Newest First', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_search.ini'),
(471, 'COM_SEARCH_OLDEST_FIRST', 'Oldest First', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_search.ini'),
(472, 'COM_SEARCH_ORDERING', 'Ordering:', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_search.ini'),
(473, 'COM_SEARCH_SEARCH', 'Search', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_search.ini'),
(474, 'COM_SEARCH_SEARCH_AGAIN', 'Search Again', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_search.ini'),
(475, 'COM_SEARCH_SEARCH_KEYWORD', 'Search Keyword:', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_search.ini'),
(476, 'COM_SEARCH_SEARCH_KEYWORD_N_RESULTS_1', '<strong>Total: One result found.</strong>', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_search.ini'),
(477, 'COM_SEARCH_SEARCH_KEYWORD_N_RESULTS', '<strong>Total: %s results found.</strong>', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_search.ini'),
(478, 'COM_SEARCH_SEARCH_ONLY', 'Search Only:', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_search.ini'),
(479, 'COM_SEARCH_SEARCH_RESULT', 'Search Result', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_search.ini'),
(480, 'COM_TAGS_CREATED_DATE', 'Created Date', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_tags.ini'),
(481, 'COM_TAGS_FILTER_SEARCH_DESC', 'Enter all or part of the title to search for.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_tags.ini'),
(482, 'COM_TAGS_MODIFIED_DATE', 'Modified Date', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_tags.ini'),
(483, 'COM_TAGS_NO_ITEMS', 'No matching items were found.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_tags.ini'),
(484, 'COM_TAGS_NO_TAGS', 'There are no tags.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_tags.ini'),
(485, 'COM_TAGS_PUBLISHED_DATE', 'Published Date', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_tags.ini'),
(486, 'COM_TAGS_TITLE_FILTER_LABEL', 'Enter Part of Title', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_tags.ini'),
(487, 'COM_USERS_ACTIVATION_TOKEN_NOT_FOUND', 'Verification code not found.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(488, 'COM_USERS_CAPTCHA_LABEL', 'Captcha', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(489, 'COM_USERS_CAPTCHA_DESC', 'Type in the textbox what you see in the image.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(490, 'COM_USERS_DATABASE_ERROR', 'Error getting the user from the database: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(491, 'COM_USERS_DESIRED_PASSWORD', 'Enter your desired password.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(492, 'COM_USERS_DESIRED_USERNAME', 'Enter your desired username.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(493, 'COM_USERS_EDIT_PROFILE', 'Edit Profile', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(494, 'COM_USERS_EMAIL_ACCOUNT_DETAILS', 'Account Details for %s at %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(495, 'COM_USERS_EMAIL_ACTIVATE_WITH_ADMIN_ACTIVATION_BODY', 'Hello administrator,\\n\\nA new user has registered at %s.\\nThe user has verified his email address and requests that you approve his account.\\nThis email contains their details:\\n\\n  Name :  %s \\n  email:  %s \\n Username:  %s \\n\\nYou can activate the user by selecting on the link below:\\n %s \\n', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(496, 'COM_USERS_EMAIL_ACTIVATE_WITH_ADMIN_ACTIVATION_SUBJECT', 'Registration approval required for account of %s at %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(497, 'COM_USERS_EMAIL_ACTIVATED_BY_ADMIN_ACTIVATION_BODY', 'Hello %s,\\n\\nYour account has been activated by an administrator. You can now login at %s using the username %s and the password you chose while registering.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(498, 'COM_USERS_EMAIL_ACTIVATED_BY_ADMIN_ACTIVATION_SUBJECT', 'Account activated for %s at %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(499, 'COM_USERS_EMAIL_PASSWORD_RESET_BODY', 'Hello,\\n\\nA request has been made to reset your %s account password. To reset your password, you will need to submit this verification code in order to verify that the request was legitimate.\\n\\nThe verification code is %s\\n\\nSelect the URL below and proceed with resetting your password.\\n\\n %s \\n\\nThank you.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(500, 'COM_USERS_EMAIL_PASSWORD_RESET_SUBJECT', 'Your %s password reset request', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(501, 'COM_USERS_EMAIL_REGISTERED_BODY', 'Hello %s,\\n\\nThank you for registering at %s.\\n\\nYou may now log in to %s using the following username and password:\\n\\nUsername: %s\\nPassword: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(502, 'COM_USERS_EMAIL_REGISTERED_BODY_NOPW', 'Hello %s,\\n\\nThank you for registering at %s.\\n\\nYou may now log in to %s using the username and password you registered with.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(503, 'COM_USERS_EMAIL_REGISTERED_NOTIFICATION_TO_ADMIN_BODY', 'Hello administrator, \\n\\nA new user ''%s'', username ''%s'', has registered at %s.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(504, 'COM_USERS_EMAIL_REGISTERED_WITH_ACTIVATION_BODY', 'Hello %s,\\n\\nThank you for registering at %s. Your account is created and must be activated before you can use it.\\nTo activate the account select the following link or copy-paste it in your browser:\\n%s \\n\\nAfter activation you may login to %s using the following username and password:\\n\\nUsername: %s\\nPassword: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(505, 'COM_USERS_EMAIL_REGISTERED_WITH_ACTIVATION_BODY_NOPW', 'Hello %s,\\n\\nThank you for registering at %s. Your account is created and must be activated before you can use it.\\nTo activate the account select the following link or copy-paste it in your browser:\\n%s \\n\\nAfter activation you may login to %s using the following username and the password you entered during registration:\\n\\nUsername: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(506, 'COM_USERS_EMAIL_REGISTERED_WITH_ADMIN_ACTIVATION_BODY', 'Hello %s,\\n\\nThank you for registering at %s. Your account is created and must be verified before you can use it.\\nTo verify the account select the following link or copy-paste it in your browser:\\n %s \\n\\nAfter verification an administrator will be notified to activate your account. You''ll receive a confirmation when it''s done.\\nOnce that account has been activated you may login to %s using the following username and password:\\n\\nUsername: %s\\nPassword: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(507, 'COM_USERS_EMAIL_REGISTERED_WITH_ADMIN_ACTIVATION_BODY_NOPW', 'Hello %s,\\n\\nThank you for registering at %s. Your account is created and must be verified before you can use it.\\nTo verify the account select the following link or copy-paste it in your browser:\\n %s \\n\\nAfter verification an administrator will be notified to activate your account. You''ll receive a confirmation when it''s done.\\nOnce that account has been activated you may login to %s using the following username and the password you entered during registration:\\n\\nUsername: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(508, 'COM_USERS_EMAIL_USERNAME_REMINDER_BODY', 'Hello,\\n\\nA username reminder has been requested for your %s account.\\n\\nYour username is %s.\\n\\nTo login to your account, select the link below.\\n\\n%s \\n\\nThank you.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(509, 'COM_USERS_EMAIL_USERNAME_REMINDER_SUBJECT', 'Your %s username', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(510, 'COM_USERS_ERROR_SECRET_CODE_WITHOUT_TFA', 'You have entered a Secret Code but two factor authentication is not enabled in your user account. If you want to use a secret code to secure your login please edit your user profile and enable two factor authentication.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(511, 'COM_USERS_FIELD_PASSWORD_RESET_DESC', 'Please enter the email address associated with your User account.<br />A verification code will be sent to you. Once you have received the verification code, you will be able to choose a new password for your account.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(512, 'COM_USERS_FIELD_PASSWORD_RESET_LABEL', 'Email Address', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(513, 'COM_USERS_FIELD_REMIND_EMAIL_DESC', 'Please enter the email address associated with your User account.<br />Your username will be emailed to the email address on file.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(514, 'COM_USERS_FIELD_REMIND_EMAIL_LABEL', 'Email Address', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(515, 'COM_USERS_FIELD_RESET_CONFIRM_TOKEN_DESC', 'Enter the password reset verification code you received by email.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(516, 'COM_USERS_FIELD_RESET_CONFIRM_TOKEN_LABEL', 'Verification Code', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(517, 'COM_USERS_FIELD_RESET_CONFIRM_USERNAME_DESC', 'Enter your username.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(518, 'COM_USERS_FIELD_RESET_CONFIRM_USERNAME_LABEL', 'Username', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(519, 'COM_USERS_FIELD_RESET_PASSWORD1_DESC', 'Enter your new password.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(520, 'COM_USERS_FIELD_RESET_PASSWORD1_LABEL', 'Password', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(521, 'COM_USERS_FIELD_RESET_PASSWORD1_MESSAGE', 'The passwords you entered do not match. Please enter your desired password in the password field and confirm your entry by entering it in the confirm password field.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(522, 'COM_USERS_FIELD_RESET_PASSWORD2_DESC', 'Confirm your new password.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(523, 'COM_USERS_FIELD_RESET_PASSWORD2_LABEL', 'Confirm Password', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(524, 'COM_USERS_INVALID_EMAIL', 'Invalid email address', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(525, 'COM_USERS_LOGIN_IMAGE_ALT', 'Login image', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(526, 'COM_USERS_LOGIN_REGISTER', 'Don''t have an account?', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(527, 'COM_USERS_LOGIN_REMEMBER_ME', 'Remember me', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(528, 'COM_USERS_LOGIN_REMIND', 'Forgot your username?', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(529, 'COM_USERS_LOGIN_RESET', 'Forgot your password?', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(530, 'COM_USERS_LOGIN_USERNAME_LABEL', 'Username', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(531, 'COM_USERS_MAIL_FAILED', 'Failed sending email.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(532, 'COM_USERS_MAIL_SEND_FAILURE_BODY', 'An error was encountered when sending the user registration email. The error is: %s The user who attempted to register is: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(533, 'COM_USERS_MAIL_SEND_FAILURE_SUBJECT', 'Error sending email', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(534, 'COM_USERS_MSG_NOT_ENOUGH_INTEGERS_N', 'Password does not contain enough digits. At least %s digits are required.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(535, 'COM_USERS_MSG_NOT_ENOUGH_INTEGERS_N_1', 'Password does not contain enough digits. At least 1 digit is required.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(536, 'COM_USERS_MSG_NOT_ENOUGH_SYMBOLS_N', 'Password does not contain enough symbols. At least %s symbols are required.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(537, 'COM_USERS_MSG_NOT_ENOUGH_SYMBOLS_N_1', 'Password does not contain enough symbols. At least 1 symbol is required.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(538, 'COM_USERS_MSG_NOT_ENOUGH_UPPERCASE_LETTERS_N', 'Password does not contain enough uppercase characters. At least %s upper case characters are required.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(539, 'COM_USERS_MSG_NOT_ENOUGH_UPPERCASE_LETTERS_N_1', 'Password does not contain enough uppercase characters. At least 1 upper case character is required.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(540, 'COM_USERS_MSG_PASSWORD_TOO_LONG', 'Password is too long. Passwords must be less than 100 characters.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(541, 'COM_USERS_MSG_PASSWORD_TOO_SHORT_N', 'Password is too short. Passwords must have at least %s characters.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(542, 'COM_USERS_MSG_SPACES_IN_PASSWORD', 'Password must not contain spaces.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(543, 'COM_USERS_OPTIONAL', '(optional)', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(544, 'COM_USERS_OR', 'or', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(545, 'COM_USERS_PROFILE', 'User Profile', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(546, 'COM_USERS_PROFILE_BIND_FAILED', 'Could not bind profile data: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(547, 'COM_USERS_PROFILE_CORE_LEGEND', 'Profile', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(548, 'COM_USERS_PROFILE_CUSTOM_LEGEND', 'Custom Profile', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(549, 'COM_USERS_PROFILE_DEFAULT_LABEL', 'Edit Your Profile', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(550, 'COM_USERS_PROFILE_EMAIL1_DESC', 'Enter your email address.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(551, 'COM_USERS_PROFILE_EMAIL1_LABEL', 'Email Address', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(552, 'COM_USERS_PROFILE_EMAIL1_MESSAGE', 'The email address you entered is already in use or invalid. Please enter another email address.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(553, 'COM_USERS_PROFILE_EMAIL2_DESC', 'Confirm your email address.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(554, 'COM_USERS_PROFILE_EMAIL2_LABEL', 'Confirm email Address', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(555, 'COM_USERS_PROFILE_EMAIL2_MESSAGE', 'The email addresses you entered do not match. Please enter your email address in the email address field and confirm your entry by entering it in the confirm email address field.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(556, 'COM_USERS_PROFILE_LAST_VISITED_DATE_LABEL', 'Last Visited Date', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(557, 'COM_USERS_PROFILE_MY_PROFILE', 'My Profile', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(558, 'COM_USERS_PROFILE_NAME_DESC', 'Enter your full name.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(559, 'COM_USERS_PROFILE_NAME_LABEL', 'Name', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(560, 'COM_USERS_PROFILE_NEVER_VISITED', 'This is the first time you visit this site', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(561, 'COM_USERS_PROFILE_NOCHANGE_USERNAME_DESC', 'If you want to change your username, please contact a site administrator.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(562, 'COM_USERS_PROFILE_OTEPS', 'One time emergency passwords', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(563, 'COM_USERS_PROFILE_OTEPS_DESC', 'If you do not have access to your two factor authentication device you can use any of the following passwords instead of a regular security code. Each one of these emergency passwords is immediately destroyed upon use. We recommend printing these passwords out and keeping the printout in a safe and accessible location, eg your wallet or a safety deposit box.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(564, 'COM_USERS_PROFILE_OTEPS_WAIT_DESC', 'There are currently no emergency one time passwords generated in your account. The passwords will be generated automatically and displayed here as soon as you activate two factor authentication.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(565, 'COM_USERS_PROFILE_PASSWORD1_LABEL', 'Password', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(566, 'COM_USERS_PROFILE_PASSWORD1_MESSAGE', 'The passwords you entered do not match. Please enter your desired password in the password field and confirm your entry by entering it in the confirm password field.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(567, 'COM_USERS_PROFILE_PASSWORD2_DESC', 'Confirm your password.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(568, 'COM_USERS_PROFILE_PASSWORD2_LABEL', 'Confirm Password', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(569, 'COM_USERS_PROFILE_REGISTERED_DATE_LABEL', 'Registered Date', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(570, 'COM_USERS_PROFILE_SAVE_FAILED', 'Profile could not be saved: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(571, 'COM_USERS_PROFILE_SAVE_SUCCESS', 'Profile successfully saved.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(572, 'COM_USERS_PROFILE_TWO_FACTOR_AUTH', 'Two Factor Authentication', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(573, 'COM_USERS_PROFILE_TWOFACTOR_LABEL', 'Authentication Method', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(574, 'COM_USERS_PROFILE_TWOFACTOR_DESC', 'Which two factor authentication method you want to activate on the user account.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(575, 'COM_USERS_PROFILE_USERNAME_DESC', 'Enter your desired username.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(576, 'COM_USERS_PROFILE_USERNAME_LABEL', 'Username', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(577, 'COM_USERS_PROFILE_USERNAME_MESSAGE', 'The username you entered is not available. Please pick another username.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(578, 'COM_USERS_PROFILE_VALUE_NOT_FOUND', 'No Information Entered', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(579, 'COM_USERS_PROFILE_WELCOME', 'Welcome, %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(580, 'COM_USERS_REGISTER_DEFAULT_LABEL', 'Create An Account', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(581, 'COM_USERS_REGISTER_EMAIL1_DESC', 'Enter your email address.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(582, 'COM_USERS_REGISTER_EMAIL1_LABEL', 'Email Address', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(583, 'COM_USERS_REGISTER_EMAIL1_MESSAGE', 'The email address you entered is already in use or invalid. Please enter another email address.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(584, 'COM_USERS_REGISTER_EMAIL2_DESC', 'Confirm your email address.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(585, 'COM_USERS_REGISTER_EMAIL2_LABEL', 'Confirm email Address', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(586, 'COM_USERS_REGISTER_EMAIL2_MESSAGE', 'The email addresses you entered do not match. Please enter your email address in the email address field and confirm your entry by entering it in the confirm email address field.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(587, 'COM_USERS_REGISTER_NAME_DESC', 'Enter your full name.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(588, 'COM_USERS_REGISTER_NAME_LABEL', 'Name', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(589, 'COM_USERS_REGISTER_PASSWORD1_LABEL', 'Password', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(590, 'COM_USERS_REGISTER_PASSWORD1_MESSAGE', 'The passwords you entered do not match. Please enter your desired password in the password field and confirm your entry by entering it in the confirm password field.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(591, 'COM_USERS_REGISTER_PASSWORD2_DESC', 'Confirm your password.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(592, 'COM_USERS_REGISTER_PASSWORD2_LABEL', 'Confirm Password', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(593, 'COM_USERS_REGISTER_REQUIRED', '<strong class="red">*</strong> Required field', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(594, 'COM_USERS_REGISTER_USERNAME_DESC', 'Enter your desired username.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(595, 'COM_USERS_REGISTER_USERNAME_LABEL', 'Username', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(596, 'COM_USERS_REGISTER_USERNAME_MESSAGE', 'The username you entered is not available. Please pick another username.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(597, 'COM_USERS_REGISTRATION', 'User Registration', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(598, 'COM_USERS_REGISTRATION_ACTIVATE_SUCCESS', 'Your Account has been successfully activated. You can now log in using the username and password you chose during the registration.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(599, 'COM_USERS_REGISTRATION_ACTIVATION_NOTIFY_SEND_MAIL_FAILED', 'An error was encountered while sending activation notification email', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(600, 'COM_USERS_REGISTRATION_ACTIVATION_SAVE_FAILED', 'Failed to save activation data: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(601, 'COM_USERS_REGISTRATION_ADMINACTIVATE_SUCCESS', 'The user''s account has been successfully activated and the user has been notified about it.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(602, 'COM_USERS_REGISTRATION_BIND_FAILED', 'Failed to bind registration data: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(603, 'COM_USERS_REGISTRATION_COMPLETE_ACTIVATE', 'Your account has been created and an activation link has been sent to the email address you entered. Note that you must activate the account by selecting the activation link when you get the email before you can login.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(604, 'COM_USERS_REGISTRATION_COMPLETE_VERIFY', 'Your account has been created and a verification link has been sent to the email address you entered. Note that you must verify the account by selecting the verification link when you get the email and then an administrator will activate your account before you can login.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(605, 'COM_USERS_REGISTRATION_DEFAULT_LABEL', 'User Registration', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(606, 'COM_USERS_REGISTRATION_SAVE_FAILED', 'Registration failed: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(607, 'COM_USERS_REGISTRATION_SAVE_SUCCESS', 'Thank you for registering. You may now log in using the username and password you registered with.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(608, 'COM_USERS_REGISTRATION_SEND_MAIL_FAILED', 'An error was encountered while sending the registration email. A message has been sent to the administrator of this site.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(609, 'COM_USERS_REGISTRATION_VERIFY_SUCCESS', 'Your email address has been verified. Once an administrator approves your account you will be notified by email and you can login to the site.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(610, 'COM_USERS_REMIND', 'Reminder', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(611, 'COM_USERS_REMIND_DEFAULT_LABEL', 'Please enter the email address associated with your User account. Your username will be emailed to the email address on file.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(612, 'COM_USERS_REMIND_EMAIL_LABEL', 'Your Email', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(613, 'COM_USERS_REMIND_LIMIT_ERROR_N_HOURS', 'You have exceeded the maximum number of password resets allowed. Please try again in %s hours.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(614, 'COM_USERS_REMIND_LIMIT_ERROR_N_HOURS_1', 'You have exceeded the maximum number of password resets allowed. Please try again in one hour.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(615, 'COM_USERS_REMIND_REQUEST_FAILED', 'Reminder failed: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(616, 'COM_USERS_REMIND_REQUEST_SUCCESS', 'Reminder successfully sent. Please check your mail.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(617, 'COM_USERS_REMIND_SUPERADMIN_ERROR', 'A Super User can''t request a password reminder. Please contact another Super User or use an alternative method.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(618, 'COM_USERS_RESET', 'Password Reset', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(619, 'COM_USERS_RESET_COMPLETE_ERROR', 'Error completing password reset.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(620, 'COM_USERS_RESET_COMPLETE_FAILED', 'Completing reset password failed: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(621, 'COM_USERS_RESET_COMPLETE_LABEL', 'To complete the password reset process, please enter a new password.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(622, 'COM_USERS_RESET_COMPLETE_SUCCESS', 'Reset password successful. You may now login to the site.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(623, 'COM_USERS_RESET_CONFIRM_ERROR', 'Error while confirming the password.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(624, 'COM_USERS_RESET_CONFIRM_FAILED', 'Your password reset confirmation failed because the verification code was invalid. %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(625, 'COM_USERS_RESET_CONFIRM_LABEL', 'An email has been sent to your email address. The email contains a verification code, please paste the verification code in the field below to prove that you are the owner of this account.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(626, 'COM_USERS_RESET_COMPLETE_TOKENS_MISSING', 'Your password reset confirmation failed because the verification code was missing.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(627, 'COM_USERS_RESET_REQUEST_ERROR', 'Error requesting password reset.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(628, 'COM_USERS_RESET_REQUEST_FAILED', 'Reset password failed: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(629, 'COM_USERS_RESET_REQUEST_LABEL', 'Please enter the email address for your account. A verification code will be sent to you. Once you have received the verification code, you will be able to choose a new password for your account.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(630, 'COM_USERS_SETTINGS_FIELDSET_LABEL', 'Basic Settings', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(631, 'COM_USERS_USER_BLOCKED', 'This user is blocked. If this is an error, please contact an administrator.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(632, 'COM_USERS_USER_FIELD_BACKEND_LANGUAGE_DESC', 'Choose your default language for the Backend.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(633, 'COM_USERS_USER_FIELD_BACKEND_LANGUAGE_LABEL', 'Backend Language', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(634, 'COM_USERS_USER_FIELD_BACKEND_TEMPLATE_DESC', 'Select the template style for the Administrator Backend interface. This will only affect this User.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(635, 'COM_USERS_USER_FIELD_BACKEND_TEMPLATE_LABEL', 'Backend Template Style', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(636, 'COM_USERS_USER_FIELD_EDITOR_DESC', 'Choose your text editor.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(637, 'COM_USERS_USER_FIELD_EDITOR_LABEL', 'Editor', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(638, 'COM_USERS_USER_FIELD_FRONTEND_LANGUAGE_DESC', 'Choose your default language for the Frontend.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(639, 'COM_USERS_USER_FIELD_FRONTEND_LANGUAGE_LABEL', 'Frontend Language', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(640, 'COM_USERS_USER_FIELD_HELPSITE_DESC', 'Help site for the Backend.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(641, 'COM_USERS_USER_FIELD_HELPSITE_LABEL', 'Help Site', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(642, 'COM_USERS_USER_FIELD_TIMEZONE_DESC', 'Choose your time zone.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(643, 'COM_USERS_USER_FIELD_TIMEZONE_LABEL', 'Time Zone', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(644, 'COM_USERS_USER_NOT_FOUND', 'User not found.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(645, 'COM_USERS_USER_SAVE_FAILED', 'Failed to save user: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_users.ini'),
(646, 'COM_WEBLINKS_CONTENT_TYPE_WEBLINK', 'Web Link', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_weblinks.ini'),
(647, 'COM_WEBLINKS_CONTENT_TYPE_CATEGORY', 'Web Links Category', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_weblinks.ini'),
(648, 'COM_WEBLINKS_DEFAULT_PAGE_TITLE', 'Web Links', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_weblinks.ini'),
(649, 'COM_WEBLINKS_EDIT', 'Edit Web link', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_weblinks.ini'),
(650, 'COM_WEBLINKS_ERR_TABLES_NAME', 'There is already a Web Link with that name in this category. Please try again.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_weblinks.ini'),
(651, 'COM_WEBLINKS_ERR_TABLES_PROVIDE_URL', 'Please provide a valid URL', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_weblinks.ini'),
(652, 'COM_WEBLINKS_ERR_TABLES_TITLE', 'Your Web Link must contain a title.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_weblinks.ini'),
(653, 'COM_WEBLINKS_ERROR_CATEGORY_NOT_FOUND', 'Web Link category not found.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_weblinks.ini'),
(654, 'COM_WEBLINKS_ERROR_UNIQUE_ALIAS', 'Another Web Link from this category has the same alias (remember it may be a trashed item).', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_weblinks.ini'),
(655, 'COM_WEBLINKS_ERROR_WEBLINK_NOT_FOUND', 'Web Link not found.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_weblinks.ini'),
(656, 'COM_WEBLINKS_ERROR_WEBLINK_URL_INVALID', 'Invalid Web link URL.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_weblinks.ini'),
(657, 'COM_WEBLINKS_FIELD_ALIAS_DESC', 'The alias is for internal use only. Leave this blank and Joomla will fill in a default value from the title. It has to be unique for each web link in the same category.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_weblinks.ini'),
(658, 'COM_WEBLINKS_FIELD_CATEGORY_DESC', 'You must select a Category.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_weblinks.ini'),
(659, 'COM_WEBLINKS_FIELD_DESCRIPTION_DESC', 'Enter a description for your Web link.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_weblinks.ini'),
(660, 'COM_WEBLINKS_FILTER_LABEL', 'Filter Field', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_weblinks.ini'),
(661, 'COM_WEBLINKS_FILTER_SEARCH_DESC', 'Web Links filter search', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_weblinks.ini'),
(662, 'COM_WEBLINKS_FIELD_TITLE_DESC', 'Your Web Link must have a Title.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_weblinks.ini'),
(663, 'COM_WEBLINKS_FIELD_URL_DESC', 'You must enter a URL.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_weblinks.ini'),
(664, 'COM_WEBLINKS_FIELD_URL_LABEL', 'URL', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_weblinks.ini'),
(665, 'COM_WEBLINKS_FORM_CREATE_WEBLINK', 'Submit a Web Link', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_weblinks.ini'),
(666, 'COM_WEBLINKS_GRID_TITLE', 'Title', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_weblinks.ini'),
(667, 'COM_WEBLINKS_LINK', 'Web Link', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_weblinks.ini'),
(668, 'COM_WEBLINKS_NAME', 'Name', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_weblinks.ini'),
(669, 'COM_WEBLINKS_NO_WEBLINKS', 'There are no Web Links in this category.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_weblinks.ini'),
(670, 'COM_WEBLINKS_NUM', '# of links:', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_weblinks.ini'),
(671, 'COM_WEBLINKS_FORM_EDIT_WEBLINK', 'Edit a Web Link', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_weblinks.ini'),
(672, 'COM_WEBLINKS_FORM_SUBMIT_WEBLINK', 'Submit a Web Link', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_weblinks.ini'),
(673, 'COM_WEBLINKS_SAVE_SUCCESS', 'Web link successfully saved.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_weblinks.ini'),
(674, 'COM_WEBLINKS_SUBMIT_SAVE_SUCCESS', 'Web Link successfully submitted.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_weblinks.ini'),
(675, 'COM_WEBLINKS_WEB_LINKS', 'Web Links', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_weblinks.ini'),
(676, 'JGLOBAL_NEWITEMSLAST_DESC', 'New Web Links default to the last position. Ordering can be changed after this Web Link has been saved.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_weblinks.ini'),
(677, 'COM_WRAPPER_NO_IFRAMES', 'This option will not work correctly. Unfortunately, your browser does not support inline frames.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.com_wrapper.ini'),
(678, 'FILES_JOOMLA', 'Joomla CMS', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.files_joomla.sys.ini'),
(679, 'FILES_JOOMLA_ERROR_FILE_FOLDER', 'Error on deleting file or folder %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.files_joomla.sys.ini'),
(680, 'FILES_JOOMLA_ERROR_MANIFEST', 'Error on updating manifest cache: (type, element, folder, client) = (%s, %s, %s, %s)', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.files_joomla.sys.ini'),
(681, 'FILES_JOOMLA_XML_DESCRIPTION', 'Joomla! 3 Content Management System.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.files_joomla.sys.ini'),
(682, 'FINDER_CLI', 'Smart Search INDEXER', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.finder_cli.ini'),
(683, 'FINDER_CLI_BATCH_COMPLETE', ' * Processed batch %s in %s seconds.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.finder_cli.ini');
INSERT INTO `hyxu5_overrider` (`id`, `constant`, `string`, `file`) VALUES
(684, 'FINDER_CLI_FILTER_RESTORE_WARNING', 'Warning: Did not find taxonomy %s/%s in filter %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.finder_cli.ini'),
(685, 'FINDER_CLI_INDEX_PURGE', 'Clear index', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.finder_cli.ini'),
(686, 'FINDER_CLI_INDEX_PURGE_FAILED', '- index clear failed.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.finder_cli.ini'),
(687, 'FINDER_CLI_INDEX_PURGE_SUCCESS', '- index clear successful', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.finder_cli.ini'),
(688, 'FINDER_CLI_PROCESS_COMPLETE', 'Total Processing Time: %s seconds.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.finder_cli.ini'),
(689, 'FINDER_CLI_RESTORE_FILTER_COMPLETED', '- number of filters restored: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.finder_cli.ini'),
(690, 'FINDER_CLI_RESTORE_FILTERS', 'Restoring filters', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.finder_cli.ini'),
(691, 'FINDER_CLI_SAVE_FILTER_COMPLETED', '- number of saved filters: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.finder_cli.ini'),
(692, 'FINDER_CLI_SAVE_FILTERS', 'Saving filters', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.finder_cli.ini'),
(693, 'FINDER_CLI_SETTING_UP_PLUGINS', 'Setting up Smart Search plugins', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.finder_cli.ini'),
(694, 'FINDER_CLI_SETUP_ITEMS', 'Setup %s items in %s seconds.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.finder_cli.ini'),
(695, 'FINDER_CLI_STARTING_INDEXER', 'Starting Indexer', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.finder_cli.ini'),
(696, 'JERROR_PARSING_LANGUAGE_FILE', '&#160;: error(s) in line(s) %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(697, 'ERROR', 'Error', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(698, 'MESSAGE', 'Message', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(699, 'NOTICE', 'Notice', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(700, 'WARNING', 'Warning', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(701, 'J1', '1', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(702, 'J2', '2', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(703, 'J3', '3', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(704, 'J4', '4', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(705, 'J5', '5', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(706, 'J6', '6', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(707, 'J7', '7', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(708, 'J8', '8', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(709, 'J9', '9', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(710, 'J10', '10', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(711, 'J15', '15', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(712, 'J20', '20', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(713, 'J25', '25', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(714, 'J30', '30', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(715, 'J50', '50', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(716, 'J100', '100', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(717, 'JACTION_ADMIN', 'Configure', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(718, 'JACTION_ADMIN_GLOBAL', 'Super User', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(719, 'JACTION_COMPONENT_SETTINGS', 'Component Settings', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(720, 'JACTION_CREATE', 'Create', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(721, 'JACTION_DELETE', 'Delete', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(722, 'JACTION_EDIT', 'Edit', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(723, 'JACTION_EDITOWN', 'Edit Own', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(724, 'JACTION_EDITSTATE', 'Edit State', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(725, 'JACTION_LOGIN_ADMIN', 'Administrator Login', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(726, 'JACTION_LOGIN_SITE', 'Site Login', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(727, 'JACTION_MANAGE', 'Access Administration Interface', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(728, 'JADMINISTRATOR', 'Administrator', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(729, 'JALL', 'All', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(730, 'JALL_LANGUAGE', 'All', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(731, 'JARCHIVED', 'Archived', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(732, 'JAUTHOR', 'Author', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(733, 'JCANCEL', 'Cancel', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(734, 'JCATEGORY', 'Category', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(735, 'JDATE', 'Date', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(736, 'JDEFAULT', 'Default', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(737, 'JDETAILS', 'Details', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(738, 'JDISABLED', 'Disabled', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(739, 'JEDITOR', 'Editor', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(740, 'JENABLED', 'Enabled', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(741, 'JEXPIRED', 'Expired', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(742, 'JFALSE', 'False', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(743, 'JFEATURED', 'Featured', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(744, 'JHIDE', 'Hide', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(745, 'JINVALID_TOKEN', 'Invalid Token', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(746, 'JLOGIN', 'Log in', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(747, 'JLOGOUT', 'Log out', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(748, 'JNEW', 'New', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(749, 'JNEXT', 'Next', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(750, 'JNO', 'No', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(751, 'JNONE', 'None', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(752, 'JNOTPUBLISHEDYET', 'Not published yet', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(753, 'JNOTICE', 'Notice', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(754, 'JOFF', 'Off', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(755, 'JOFFLINE_MESSAGE', 'This site is down for maintenance.<br />Please check back again soon.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(756, 'JON', 'On', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(757, 'JOPTIONS', 'Options', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(758, 'JPAGETITLE', '%1$s - %2$s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(759, 'JPREV', 'Prev', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(760, 'JPREVIOUS', 'Previous', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(761, 'JPUBLISHED', 'Published', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(762, 'JREGISTER', 'Register', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(763, 'JREQUIRED', 'Required', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(764, 'JSAVE', 'Save', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(765, 'JSHOW', 'Show', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(766, 'JSITE', 'Site', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(767, 'JSTATUS', 'Status', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(768, 'JSUBMIT', 'Submit', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(769, 'JTAG', 'Tags', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(770, 'JTAG_DESC', 'Add and delete tags to an item.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(771, 'JTOOLBAR_VERSIONS', 'Versions', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(772, 'JTRASH', 'Trash', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(773, 'JTRASHED', 'Trashed', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(774, 'JTRUE', 'True', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(775, 'JUNPUBLISHED', 'Unpublished', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(776, 'JYEAR', 'Year', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(777, 'JYES', 'Yes', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(778, 'JBROWSERTARGET_MODAL', 'Modal', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(779, 'JBROWSERTARGET_NEW', 'Open in new window', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(780, 'JBROWSERTARGET_PARENT', 'Open in parent window', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(781, 'JBROWSERTARGET_POPUP', 'Open in popup', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(782, 'JERROR_ALERTNOAUTHOR', 'You are not authorised to view this resource.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(783, 'JERROR_ALERTNOTEMPLATE', '<strong>The template for this display is not available. Please contact a Site administrator.</strong>', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(784, 'JERROR_AN_ERROR_HAS_OCCURRED', 'An error has occurred.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(785, 'JERROR_COULD_NOT_FIND_TEMPLATE', 'Could not find template "%s".', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(786, 'JERROR_ERROR', 'Error', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(787, 'JERROR_LAYOUT_AN_OUT_OF_DATE_BOOKMARK_FAVOURITE', 'an <strong>out-of-date bookmark/favourite</strong>', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(788, 'JERROR_LAYOUT_ERROR_HAS_OCCURRED_WHILE_PROCESSING_YOUR_REQUEST', 'An error has occurred while processing your request.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(789, 'JERROR_LAYOUT_GO_TO_THE_HOME_PAGE', 'Go to the Home Page', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(790, 'JERROR_LAYOUT_HOME_PAGE', 'Home Page', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(791, 'JERROR_LAYOUT_MIS_TYPED_ADDRESS', 'a <strong>mistyped address</strong>', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(792, 'JERROR_LAYOUT_NOT_ABLE_TO_VISIT', 'You may not be able to visit this page because of:', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(793, 'JERROR_LAYOUT_PAGE_NOT_FOUND', 'The requested page can''t be found.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(794, 'JERROR_LAYOUT_PLEASE_CONTACT_THE_SYSTEM_ADMINISTRATOR', 'If difficulties persist, please contact the System Administrator of this site and report the error below.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(795, 'JERROR_LAYOUT_PLEASE_TRY_ONE_OF_THE_FOLLOWING_PAGES', 'Please try one of the following pages:', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(796, 'JERROR_LAYOUT_REQUESTED_RESOURCE_WAS_NOT_FOUND', 'The requested resource was not found.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(797, 'JERROR_LAYOUT_SEARCH', 'You may wish to search the site or visit the home page.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(798, 'JERROR_LAYOUT_SEARCH_ENGINE_OUT_OF_DATE_LISTING', 'a search engine that has an <strong>out-of-date listing for this site</strong>', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(799, 'JERROR_LAYOUT_SEARCH_PAGE', 'Search this site', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(800, 'JERROR_LAYOUT_YOU_HAVE_NO_ACCESS_TO_THIS_PAGE', 'you have <strong>no access</strong> to this page', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(801, 'JERROR_LOADING_MENUS', 'Error loading Menus: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(802, 'JERROR_LOGIN_DENIED', 'You can''t access the private section of this site.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(803, 'JERROR_NOLOGIN_BLOCKED', 'Login denied! Your account has either been blocked or you have not activated it yet.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(804, 'JERROR_SESSION_STARTUP', 'Error initialising the session.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(805, 'JERROR_TABLE_BIND_FAILED', 'hmm %s ...', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(806, 'JERROR_USERS_PROFILE_NOT_FOUND', 'User profile not found', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(807, 'JFIELD_ACCESS_DESC', 'Access level for this content.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(808, 'JFIELD_ACCESS_LABEL', 'Access', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(809, 'JFIELD_ALIAS_DESC', 'The Alias will be used in the SEF URL. Leave this blank and Joomla! will fill in a default value from the title. This value will depend on the SEO settings (Global Configuration->Site). <br />Using Unicode will produce UTF-8 aliases. You may also enter manually any UTF-8 character. Spaces and some forbidden characters will be changed to hyphens.<br />When using default transliteration it will produce an alias in lower case and with dashes instead of spaces. You may enter the Alias manually. Use lowercase letters and hyphens (-). No spaces or underscores are allowed. Default value will be a date and time if the title is typed in non-latin letters .', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(810, 'JFIELD_ALIAS_LABEL', 'Alias', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(811, 'JFIELD_ALIAS_PLACEHOLDER', 'Auto-generate from title', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(812, 'JFIELD_ALT_PAGE_TITLE_LABEL', 'Alternative Page Title', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(813, 'JFIELD_CATEGORY_DESC', 'Category', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(814, 'JFIELD_LANGUAGE_DESC', 'Assign a language to this article.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(815, 'JFIELD_LANGUAGE_LABEL', 'Language', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(816, 'JFIELD_META_DESCRIPTION_DESC', 'Metadata description.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(817, 'JFIELD_META_DESCRIPTION_LABEL', 'Meta Description', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(818, 'JFIELD_META_KEYWORDS_DESC', 'Keywords describing the content.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(819, 'JFIELD_META_KEYWORDS_LABEL', 'Keywords', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(820, 'JFIELD_META_RIGHTS_DESC', 'Describe what rights others have to use this content.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(821, 'JFIELD_META_RIGHTS_LABEL', 'Content Rights', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(822, 'JFIELD_ORDERING_DESC', 'Ordering of the article within the category.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(823, 'JFIELD_ORDERING_LABEL', 'Ordering', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(824, 'JFIELD_PUBLISHED_DESC', 'Set publication status.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(825, 'JFIELD_TITLE_DESC', 'Title for the article.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(826, 'JGLOBAL_ARTICLES', 'Articles', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(827, 'JGLOBAL_AUTH_ACCESS_DENIED', 'Access Denied', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(828, 'JGLOBAL_AUTH_ACCESS_GRANTED', 'Access Granted', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(829, 'JGLOBAL_AUTH_BIND_FAILED', 'Failed binding to LDAP server', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(830, 'JGLOBAL_AUTH_CANCEL', 'Authentication cancelled', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(831, 'JGLOBAL_AUTH_CURL_NOT_INSTALLED', 'Curl isn''t installed.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(832, 'JGLOBAL_AUTH_EMPTY_PASS_NOT_ALLOWED', 'Empty password not allowed.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(833, 'JGLOBAL_AUTH_FAIL', 'Authentication failed', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(834, 'JGLOBAL_AUTH_FAILED', 'Failed to authenticate: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(835, 'JGLOBAL_AUTH_INCORRECT', 'Incorrect username/password', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(836, 'JGLOBAL_AUTH_INVALID_PASS', 'Username and password do not match or you do not have an account yet.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(837, 'JGLOBAL_AUTH_INVALID_SECRETKEY', 'The two factor authentication Secret Key is invalid.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(838, 'JGLOBAL_AUTH_NO_BIND', 'Unable to bind to LDAP', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(839, 'JGLOBAL_AUTH_NO_CONNECT', 'Unable to connect to LDAP server', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(840, 'JGLOBAL_AUTH_NO_REDIRECT', 'Could not redirect to server: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(841, 'JGLOBAL_AUTH_NO_USER', 'Username and password do not match or you do not have an account yet.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(842, 'JGLOBAL_AUTH_NOT_CREATE_DIR', 'Could not create the FileStore folder %s. Please check the effective permissions.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(843, 'JGLOBAL_AUTH_PASS_BLANK', 'LDAP can''t have blank password', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(844, 'JGLOBAL_AUTH_UNKNOWN_ACCESS_DENIED', 'Result Unknown. Access Denied', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(845, 'JGLOBAL_AUTH_USER_BLACKLISTED', 'User is blacklisted.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(846, 'JGLOBAL_AUTH_USER_NOT_FOUND', 'Unable to find user', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(847, 'JGLOBAL_AUTO', 'Auto', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(848, 'JGLOBAL_CATEGORY_NOT_FOUND', 'Category not found', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(849, 'JGLOBAL_CENTER', 'Center', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(850, 'JGLOBAL_CHECK_ALL', 'Check All', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(851, 'JGLOBAL_CLICK_TO_SORT_THIS_COLUMN', 'Select to sort by this column', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(852, 'JGLOBAL_CREATED_DATE_ON', 'Created on %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(853, 'JGLOBAL_DESCRIPTION', 'Description', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(854, 'JGLOBAL_DISPLAY_NUM', 'Display #', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(855, 'JGLOBAL_EDIT', 'Edit', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(856, 'JGLOBAL_EMAIL', 'Email', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(857, 'JGLOBAL_FIELD_CREATED_BY_ALIAS_DESC', 'Uses another name than the author''s for display.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(858, 'JGLOBAL_FIELD_CREATED_BY_ALIAS_LABEL', 'Author''s Alias', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(859, 'JGLOBAL_FIELD_FEATURED_DESC', 'Assign the article to the featured blog layout.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(860, 'JGLOBAL_FIELD_FEATURED_LABEL', 'Featured', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(861, 'JGLOBAL_FIELD_PUBLISH_DOWN_DESC', 'An optional date to stop publishing.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(862, 'JGLOBAL_FIELD_PUBLISH_DOWN_LABEL', 'Finish Publishing', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(863, 'JGLOBAL_FIELD_PUBLISH_UP_DESC', 'An optional date to start publishing.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(864, 'JGLOBAL_FIELD_PUBLISH_UP_LABEL', 'Start Publishing', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(865, 'JGLOBAL_FIELD_VERSION_NOTE_DESC', 'Enter an optional note for this version of the item.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(866, 'JGLOBAL_FIELD_VERSION_NOTE_LABEL', 'Version Note', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(867, 'JGLOBAL_FILTER_BUTTON', 'Filter', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(868, 'JGLOBAL_FILTER_LABEL', 'Filter', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(869, 'JGLOBAL_FULL_TEXT', 'Full Text', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(870, 'JGLOBAL_GT', '&gt;', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(871, 'JGLOBAL_HELPREFRESH_BUTTON', 'Refresh', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(872, 'JGLOBAL_HITS', 'Hits', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(873, 'JGLOBAL_HITS_COUNT', 'Hits: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(874, 'JGLOBAL_ICON_SEP', '|', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(875, 'JGLOBAL_INHERIT', 'Inherit', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(876, 'JGLOBAL_INTRO_TEXT', 'Intro Text', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(877, 'JGLOBAL_KEEP_TYPING', 'Keep typing ...', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(878, 'JGLOBAL_LEFT', 'Left', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(879, 'JGLOBAL_LOOKING_FOR', 'Looking for', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(880, 'JGLOBAL_LT', '&lt;', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(881, 'JGLOBAL_NEWITEMSLAST_DESC', 'New items default to the last position. Ordering can be changed after this item has been saved.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(882, 'JGLOBAL_NO_MATCHING_RESULTS', 'No Matching Results', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(883, 'JGLOBAL_NUM', '#', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(884, 'JGLOBAL_OTPMETHOD_NONE', 'Disable Two Factor Authentication', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(885, 'JGLOBAL_PASSWORD', 'Password', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(886, 'JGLOBAL_PASSWORD_RESET_REQUIRED', 'You are required to reset your password before proceeding.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(887, 'JGLOBAL_PRINT', 'Print', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(888, 'JGLOBAL_RECORD_NUMBER', 'Record ID: %d', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(889, 'JGLOBAL_REMEMBER_ME', 'Remember me', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(890, 'JGLOBAL_REMEMBER_MUST_LOGIN', 'For security reasons you must login before editing your personal information.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(891, 'JGLOBAL_RESOURCE_NOT_FOUND', 'Resource not found', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(892, 'JGLOBAL_RIGHT', 'Right', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(893, 'JGLOBAL_ROOT', 'Root', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(894, 'JGLOBAL_SECRETKEY', 'Secret Key', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(895, 'JGLOBAL_SECRETKEY_HELP', 'If you have enabled two factor authentication in your user account please enter your secret key. If you do not know what this means, you can leave this field blank.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(896, 'JGLOBAL_SELECT_AN_OPTION', 'Select an option', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(897, 'JGLOBAL_SELECT_NO_RESULTS_MATCH', 'No results match', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(898, 'JGLOBAL_SELECT_SOME_OPTIONS', 'Select some options', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(899, 'JGLOBAL_START_PUBLISH_AFTER_FINISH', 'Item start publishing date must be before finish publishing date', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(900, 'JGLOBAL_SUBCATEGORIES', 'Subcategories', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(901, 'JGLOBAL_SUBHEADING_DESC', 'Optional text to show as a subheading.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(902, 'JGLOBAL_TITLE', 'Title', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(903, 'JGLOBAL_USE_GLOBAL', 'Use Global', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(904, 'JGLOBAL_USERNAME', 'Username', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(905, 'JGLOBAL_VALIDATION_FORM_FAILED', 'Invalid form', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(906, 'JGLOBAL_YOU_MUST_LOGIN_FIRST', 'Please login first', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(907, 'JGRID_HEADING_ACCESS', 'Access', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(908, 'JGRID_HEADING_ID', 'ID', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(909, 'JGRID_HEADING_LANGUAGE', 'Language', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(910, 'JLIB_DATABASE_ERROR_ADAPTER_MYSQL', 'The MySQL adapter ''mysql'' is not available.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(911, 'JLIB_DATABASE_ERROR_ADAPTER_MYSQLI', 'The MySQL adapter ''mysqli'' is not available.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(912, 'JLIB_DATABASE_ERROR_CONNECT_DATABASE', 'Unable to connect to the Database: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(913, 'JLIB_DATABASE_ERROR_CONNECT_MYSQL', 'Could not connect to MySQL.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(914, 'JLIB_DATABASE_ERROR_DATABASE_CONNECT', 'Could not connect to database', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(915, 'JLIB_DATABASE_ERROR_LOAD_DATABASE_DRIVER', 'Unable to load Database Driver: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(916, 'JLIB_ERROR_INFINITE_LOOP', 'Infinite loop detected in JError', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(917, 'JOPTION_SELECT_ACCESS', '- Select Access -', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(918, 'JOPTION_SELECT_AUTHOR', '- Select Author -', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(919, 'JOPTION_SELECT_CATEGORY', '- Select Category -', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(920, 'JOPTION_SELECT_LANGUAGE', '- Select Language -', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(921, 'JOPTION_SELECT_PUBLISHED', '- Select Status -', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(922, 'JOPTION_SELECT_MAX_LEVELS', '- Select Max Levels -', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(923, 'JOPTION_SELECT_TAG', '- Select Tag -', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(924, 'JOPTION_USE_DEFAULT', '- Use Default -', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(925, 'JSEARCH_FILTER_CLEAR', 'Clear', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(926, 'JSEARCH_FILTER_LABEL', 'Filter', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(927, 'JSEARCH_FILTER_SUBMIT', 'Search', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(928, 'JSEARCH_FILTER', 'Search', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(929, 'DATE_FORMAT_LC', 'l, d F Y', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(930, 'DATE_FORMAT_LC1', 'l, d F Y', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(931, 'DATE_FORMAT_LC2', 'l, d F Y H:i', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(932, 'DATE_FORMAT_LC3', 'd F Y', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(933, 'DATE_FORMAT_LC4', 'Y-m-d', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(934, 'DATE_FORMAT_JS1', 'y-m-d', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(935, 'JANUARY_SHORT', 'Jan', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(936, 'JANUARY', 'January', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(937, 'FEBRUARY_SHORT', 'Feb', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(938, 'FEBRUARY', 'February', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(939, 'MARCH_SHORT', 'Mar', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(940, 'MARCH', 'March', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(941, 'APRIL_SHORT', 'Apr', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(942, 'APRIL', 'April', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(943, 'MAY_SHORT', 'May', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(944, 'MAY', 'May', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(945, 'JUNE_SHORT', 'Jun', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(946, 'JUNE', 'June', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(947, 'JULY_SHORT', 'Jul', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(948, 'JULY', 'July', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(949, 'AUGUST_SHORT', 'Aug', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(950, 'AUGUST', 'August', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(951, 'SEPTEMBER_SHORT', 'Sep', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(952, 'SEPTEMBER', 'September', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(953, 'OCTOBER_SHORT', 'Oct', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(954, 'OCTOBER', 'October', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(955, 'NOVEMBER_SHORT', 'Nov', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(956, 'NOVEMBER', 'November', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(957, 'DECEMBER_SHORT', 'Dec', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(958, 'DECEMBER', 'December', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(959, 'SAT', 'Sat', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(960, 'SATURDAY', 'Saturday', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(961, 'SUN', 'Sun', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(962, 'SUNDAY', 'Sunday', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(963, 'MON', 'Mon', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(964, 'MONDAY', 'Monday', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(965, 'TUE', 'Tue', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(966, 'TUESDAY', 'Tuesday', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(967, 'WED', 'Wed', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(968, 'WEDNESDAY', 'Wednesday', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(969, 'THU', 'Thu', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(970, 'THURSDAY', 'Thursday', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(971, 'FRI', 'Fri', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(972, 'FRIDAY', 'Friday', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(973, 'DECIMALS_SEPARATOR', '.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(974, 'THOUSANDS_SEPARATOR', ',', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(975, 'PHPMAILER_PROVIDE_ADDRESS', 'You must provide at least one recipient email address.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(976, 'PHPMAILER_MAILER_IS_NOT_SUPPORTED', ' Mailer is not supported.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(977, 'PHPMAILER_EXECUTE', 'Could not execute: ', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(978, 'PHPMAILER_INSTANTIATE', 'Could not start mail function.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(979, 'PHPMAILER_AUTHENTICATE', 'SMTP Error! Could not authenticate.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(980, 'PHPMAILER_FROM_FAILED', 'The following from address failed: ', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(981, 'PHPMAILER_RECIPIENTS_FAILED', 'SMTP Error! The following recipients failed: ', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(982, 'PHPMAILER_DATA_NOT_ACCEPTED', 'SMTP Error! Data not accepted.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(983, 'PHPMAILER_CONNECT_HOST', 'SMTP Error! Could not connect to SMTP host.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(984, 'PHPMAILER_FILE_ACCESS', 'Could not access file: ', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(985, 'PHPMAILER_FILE_OPEN', 'File Error: Could not open file: ', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(986, 'PHPMAILER_ENCODING', 'Unknown encoding: ', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(987, 'PHPMAILER_SIGNING_ERROR', 'Signing error: ', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(988, 'PHPMAILER_SMTP_ERROR', 'SMTP server error: ', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(989, 'PHPMAILER_EMPTY_MESSAGE', 'Empty message body', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(990, 'PHPMAILER_INVALID_ADDRESS', 'Invalid address', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(991, 'PHPMAILER_VARIABLE_SET', 'Can''t set or reset variable: ', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(992, 'PHPMAILER_SMTP_CONNECT_FAILED', 'SMTP connect failed', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(993, 'PHPMAILER_TLS', 'Could not start TLS', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(994, 'MYSQL', 'MySQL', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(995, 'MYSQLI', 'MySQLi', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(996, 'ORACLE', 'Oracle', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(997, 'PDOMYSQL', 'MySQL (PDO)', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(998, 'POSTGRESQL', 'PostgreSQL', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(999, 'SQLAZURE', 'Microsoft SQL Azure', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(1000, 'SQLITE', 'SQLite', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(1001, 'SQLSRV', 'Microsoft SQL Server', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(1002, 'JSEARCH_TOOLS', 'Search Tools', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(1003, 'JSEARCH_TOOLS_DESC', 'Filter the list items.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(1004, 'JSEARCH_TOOLS_ORDERING', 'Order by:', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.ini'),
(1005, 'LIB_FOF_DOWNLOAD_ERR_COULDNOTDOWNLOADFROMURL', 'Could not download from %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_fof.ini'),
(1006, 'LIB_FOF_DOWNLOAD_ERR_COULDNOTWRITELOCALFILE', 'Local file %s is not writeable', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_fof.ini'),
(1007, 'LIB_FOF_DOWNLOAD_ERR_CURL_ERROR', 'The download failed: cURL error %s: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_fof.ini'),
(1008, 'LIB_FOF_DOWNLOAD_ERR_HTTPERROR', 'Unexpected HTTP status %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_fof.ini'),
(1009, 'LIB_FOF_XML_DESCRIPTION', 'Framework-on-Framework (FOF) - A rapid component development framework for Joomla!', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_fof.sys.ini'),
(1010, 'LIB_IDNA_XML_DESCRIPTION', 'The class idna_convert allows to convert internationalised domain names (see RFC 3490, 3491, 3492 and 3454 for details) as they can be used with various registries worldwide to be translated between their original (localised) form and their encoded form as it will be used in the DNS (Domain Name System).', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_idna_convert.sys.ini'),
(1011, 'JERROR_PARSING_LANGUAGE_FILE', '&#160;: error(s) in line(s) %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1012, 'JLIB_APPLICATION_ERROR_ACCESS_FORBIDDEN', 'Access forbidden.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1013, 'JLIB_APPLICATION_ERROR_APPLICATION_GET_NAME', 'JApplication: :getName() : Can''t get or parse class name.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1014, 'JLIB_APPLICATION_ERROR_APPLICATION_LOAD', 'Unable to load application: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1015, 'JLIB_APPLICATION_ERROR_BATCH_CANNOT_CREATE', 'You are not allowed to create new items in this category.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1016, 'JLIB_APPLICATION_ERROR_BATCH_CANNOT_EDIT', 'You are not allowed to edit one or more of these items.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1017, 'JLIB_APPLICATION_ERROR_BATCH_FAILED', 'Batch process failed with following error: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1018, 'JLIB_APPLICATION_ERROR_BATCH_MOVE_CATEGORY_NOT_FOUND', 'Can''t find the destination category for this move.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1019, 'JLIB_APPLICATION_ERROR_BATCH_MOVE_ROW_NOT_FOUND', 'Can''t find the item being moved.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1020, 'JLIB_APPLICATION_ERROR_CHECKIN_FAILED', 'Check-in failed with the following error: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1021, 'JLIB_APPLICATION_ERROR_CHECKIN_NOT_CHECKED', 'Item is not checked out.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1022, 'JLIB_APPLICATION_ERROR_CHECKIN_USER_MISMATCH', 'The user checking in does not match the user who checked out the item.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1023, 'JLIB_APPLICATION_ERROR_CHECKOUT_FAILED', 'Check-out failed with the following error: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1024, 'JLIB_APPLICATION_ERROR_CHECKOUT_USER_MISMATCH', 'The user checking out does not match the user who checked out the item.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1025, 'JLIB_APPLICATION_ERROR_COMPONENT_NOT_FOUND', 'Component not found.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1026, 'JLIB_APPLICATION_ERROR_COMPONENT_NOT_LOADING', 'Error loading component: %1$s, %2$s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1027, 'JLIB_APPLICATION_ERROR_CONTROLLER_GET_NAME', 'JController: :getName() : Can''t get or parse class name.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1028, 'JLIB_APPLICATION_ERROR_CREATE_RECORD_NOT_PERMITTED', 'Create record not permitted.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1029, 'JLIB_APPLICATION_ERROR_DELETE_NOT_PERMITTED', 'Delete not permitted.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1030, 'JLIB_APPLICATION_ERROR_EDITSTATE_NOT_PERMITTED', 'Edit state is not permitted.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1031, 'JLIB_APPLICATION_ERROR_EDIT_ITEM_NOT_PERMITTED', 'Edit is not permitted.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1032, 'JLIB_APPLICATION_ERROR_EDIT_NOT_PERMITTED', 'Edit not permitted.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1033, 'JLIB_APPLICATION_ERROR_HISTORY_ID_MISMATCH', 'Error restoring item version from history.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1034, 'JLIB_APPLICATION_ERROR_INSUFFICIENT_BATCH_INFORMATION', 'Insufficient information to perform the batch operation.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1035, 'JLIB_APPLICATION_ERROR_INVALID_CONTROLLER_CLASS', 'Invalid controller class: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1036, 'JLIB_APPLICATION_ERROR_INVALID_CONTROLLER', 'Invalid controller: name=''%s'', format=''%s''', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1037, 'JLIB_APPLICATION_ERROR_LAYOUTFILE_NOT_FOUND', 'Layout %s not found.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1038, 'JLIB_APPLICATION_ERROR_LIBRARY_NOT_FOUND', 'Library not found.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1039, 'JLIB_APPLICATION_ERROR_LIBRARY_NOT_LOADING', 'Error loading library: %1$s, %2$s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1040, 'JLIB_APPLICATION_ERROR_MODEL_GET_NAME', 'JModel: :getName() : Can''t get or parse class name.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1041, 'JLIB_APPLICATION_ERROR_MODULE_LOAD', 'Error loading module %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1042, 'JLIB_APPLICATION_ERROR_PATHWAY_LOAD', 'Unable to load pathway: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1043, 'JLIB_APPLICATION_ERROR_REORDER_FAILED', 'Reorder failed. Error: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1044, 'JLIB_APPLICATION_ERROR_ROUTER_LOAD', 'Unable to load router: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1045, 'JLIB_APPLICATION_ERROR_MODELCLASS_NOT_FOUND', 'Model class %s not found in file.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1046, 'JLIB_APPLICATION_ERROR_SAVE_FAILED', 'Save failed with the following error: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1047, 'JLIB_APPLICATION_ERROR_SAVE_NOT_PERMITTED', 'Save not permitted.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1048, 'JLIB_APPLICATION_ERROR_TABLE_NAME_NOT_SUPPORTED', 'Table %s not supported. File not found.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1049, 'JLIB_APPLICATION_ERROR_TASK_NOT_FOUND', 'Task [%s] not found.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1050, 'JLIB_APPLICATION_ERROR_UNHELD_ID', 'You are not permitted to use that link to directly access that page (#%d).', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1051, 'JLIB_APPLICATION_ERROR_VIEW_CLASS_NOT_FOUND', 'View class not found [class, file]: %1$s, %2$s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1052, 'JLIB_APPLICATION_ERROR_VIEW_GET_NAME_SUBSTRING', 'JView: :getName() : Your classname contains the substring ''view''. This causes problems when extracting the classname from the name of your objects view. Avoid Object names with the substring ''view''.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1053, 'JLIB_APPLICATION_ERROR_VIEW_GET_NAME', 'JView: :getName() : Can''t get or parse class name.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1054, 'JLIB_APPLICATION_ERROR_VIEW_NOT_FOUND', 'View not found [name, type, prefix]: %1$s, %2$s, %3$s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1055, 'JLIB_APPLICATION_SAVE_SUCCESS', 'Item successfully saved.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1056, 'JLIB_APPLICATION_SUBMIT_SAVE_SUCCESS', 'Item successfully submitted.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1057, 'JLIB_APPLICATION_SUCCESS_BATCH', 'Batch process completed successfully.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1058, 'JLIB_APPLICATION_SUCCESS_ITEM_REORDERED', 'Ordering successfully saved.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1059, 'JLIB_APPLICATION_SUCCESS_ORDERING_SAVED', 'Ordering successfully saved.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1060, 'JLIB_APPLICATION_SUCCESS_LOAD_HISTORY', 'Prior version successfully restored. Saved on %s %s.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1061, 'JLIB_LOGIN_AUTHENTICATE', 'Username and password do not match or you do not have an account yet.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1062, 'JLIB_CACHE_ERROR_CACHE_HANDLER_LOAD', 'Unable to load Cache Handler: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1063, 'JLIB_CACHE_ERROR_CACHE_STORAGE_LOAD', 'Unable to load Cache Storage: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1064, 'JLIB_CAPTCHA_ERROR_PLUGIN_NOT_FOUND', 'Captcha plugin not set or not found. Please contact a site administrator.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1065, 'JLIB_CLIENT_ERROR_JFTP_NO_CONNECT', 'JFTP: :connect: Could not connect to host '' %1$s '' on port '' %2$s ''', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1066, 'JLIB_CLIENT_ERROR_JFTP_NO_CONNECT_SOCKET', 'JFTP: :connect: Could not connect to host '' %1$s '' on port '' %2$s ''. Socket error number: %3$s and error message: %4$s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1067, 'JLIB_CLIENT_ERROR_JFTP_BAD_RESPONSE', 'JFTP: :connect: Bad response. Server response: %s [Expected: 220]', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1068, 'JLIB_CLIENT_ERROR_JFTP_BAD_USERNAME', 'JFTP: :login: Bad Username. Server response: %1$s [Expected: 331]. Username sent: %2$s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1069, 'JLIB_CLIENT_ERROR_JFTP_BAD_PASSWORD', 'JFTP: :login: Bad Password. Server response: %1$s [Expected: 230]. Password sent: %2$s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1070, 'JLIB_CLIENT_ERROR_JFTP_PWD_BAD_RESPONSE_NATIVE', 'FTP: :pwd: Bad response.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1071, 'JLIB_CLIENT_ERROR_JFTP_PWD_BAD_RESPONSE', 'JFTP: :pwd: Bad response. Server response: %s [Expected: 257]', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1072, 'JLIB_CLIENT_ERROR_JFTP_SYST_BAD_RESPONSE_NATIVE', 'JFTP: :syst: Bad response.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1073, 'JLIB_CLIENT_ERROR_JFTP_SYST_BAD_RESPONSE', 'JFTP: :syst: Bad response. Server response: %s [Expected: 215]', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1074, 'JLIB_CLIENT_ERROR_JFTP_CHDIR_BAD_RESPONSE_NATIVE', 'JFTP: :chdir: Bad response.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1075, 'JLIB_CLIENT_ERROR_JFTP_CHDIR_BAD_RESPONSE', 'JFTP: :chdir: Bad response. Server response: %1$s [Expected: 250]. Path sent: %2$s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1076, 'JLIB_CLIENT_ERROR_JFTP_REINIT_BAD_RESPONSE_NATIVE', 'JFTP: :reinit: Bad response.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1077, 'JLIB_CLIENT_ERROR_JFTP_REINIT_BAD_RESPONSE', 'JFTP: :reinit: Bad response. Server response: %s [Expected: 220]', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1078, 'JLIB_CLIENT_ERROR_JFTP_RENAME_BAD_RESPONSE_NATIVE', 'JFTP: :rename: Bad response.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1079, 'JLIB_CLIENT_ERROR_JFTP_RENAME_BAD_RESPONSE_FROM', 'JFTP: :rename: Bad response. Server response: %1$s [Expected: 350]. From path sent: %2$s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1080, 'JLIB_CLIENT_ERROR_JFTP_RENAME_BAD_RESPONSE_TO', 'JFTP: :rename: Bad response. Server response: %1$s [Expected: 250]. To path sent: %2$s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1081, 'JLIB_CLIENT_ERROR_JFTP_CHMOD_BAD_RESPONSE_NATIVE', 'JFTP: :chmod: Bad response.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1082, 'JLIB_CLIENT_ERROR_JFTP_CHMOD_BAD_RESPONSE', 'JFTP: :chmod: Bad response. Server response: %1$s [Expected: 250]. Path sent: %2$s. Mode sent: %3$s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1083, 'JLIB_CLIENT_ERROR_JFTP_DELETE_BAD_RESPONSE_NATIVE', 'JFTP: :delete: Bad response.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1084, 'JLIB_CLIENT_ERROR_JFTP_DELETE_BAD_RESPONSE', 'JFTP: :delete: Bad response. Server response: %1$s [Expected: 250]. Path sent: %2$s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1085, 'JLIB_CLIENT_ERROR_JFTP_MKDIR_BAD_RESPONSE_NATIVE', 'JFTP: :mkdir: Bad response.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1086, 'JLIB_CLIENT_ERROR_JFTP_MKDIR_BAD_RESPONSE', 'JFTP: :mkdir: Bad response. Server response: %1$s [Expected: 257]. Path sent: %2$s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1087, 'JLIB_CLIENT_ERROR_JFTP_RESTART_BAD_RESPONSE_NATIVE', 'JFTP: :restart: Bad response.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1088, 'JLIB_CLIENT_ERROR_JFTP_RESTART_BAD_RESPONSE', 'JFTP: :restart: Bad response. Server response: %1$s [Expected: 350]. Restart point sent: %2$s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1089, 'JLIB_CLIENT_ERROR_JFTP_CREATE_BAD_RESPONSE_BUFFER', 'JFTP: :create: Bad response.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1090, 'JLIB_CLIENT_ERROR_JFTP_CREATE_BAD_RESPONSE_PASSIVE', 'JFTP: :create: Unable to use passive mode.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1091, 'JLIB_CLIENT_ERROR_JFTP_CREATE_BAD_RESPONSE', 'JFTP: :create: Bad response. Server response: %1$s [Expected: 150 or 125]. Path sent: %2$s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1092, 'JLIB_CLIENT_ERROR_JFTP_CREATE_BAD_RESPONSE_TRANSFER', 'JFTP: :create: Transfer Failed. Server response: %1$s [Expected: 226]. Path sent: %2$s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1093, 'JLIB_CLIENT_ERROR_JFTP_READ_BAD_RESPONSE_BUFFER', 'JFTP: :read: Bad response.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1094, 'JLIB_CLIENT_ERROR_JFTP_READ_BAD_RESPONSE_PASSIVE', 'JFTP: :read: Unable to use passive mode.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1095, 'JLIB_CLIENT_ERROR_JFTP_READ_BAD_RESPONSE', 'JFTP: :read: Bad response. Server response: %1$s [Expected: 150 or 125]. Path sent: %2$s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini');
INSERT INTO `hyxu5_overrider` (`id`, `constant`, `string`, `file`) VALUES
(1096, 'JLIB_CLIENT_ERROR_JFTP_READ_BAD_RESPONSE_TRANSFER', 'JFTP: :read: Transfer Failed. Server response: %1$s [Expected: 226]. Path sent: %2$s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1097, 'JLIB_CLIENT_ERROR_JFTP_GET_BAD_RESPONSE', 'JFTP: :get: Bad response.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1098, 'JLIB_CLIENT_ERROR_JFTP_GET_PASSIVE', 'JFTP: :get: Unable to use passive mode.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1099, 'JLIB_CLIENT_ERROR_JFTP_GET_WRITING_LOCAL', 'JFTP: :get: Unable to open local file for writing. Local path: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1100, 'JLIB_CLIENT_ERROR_JFTP_GET_BAD_RESPONSE_RETR', 'JFTP: :get: Bad response. Server response: %1$s [Expected: 150 or 125]. Path sent: %2$s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1101, 'JLIB_CLIENT_ERROR_JFTP_GET_BAD_RESPONSE_TRANSFER', 'JFTP: :get: Transfer Failed. Server response: %1$s [Expected: 226]. Path sent: %2$s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1102, 'JLIB_CLIENT_ERROR_JFTP_STORE_PASSIVE', 'JFTP: :store: Unable to use passive mode.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1103, 'JLIB_CLIENT_ERROR_JFTP_STORE_BAD_RESPONSE', 'JFTP: :store: Bad response.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1104, 'JLIB_CLIENT_ERROR_JFTP_STORE_READING_LOCAL', 'JFTP: :store: Unable to open local file for reading. Local path: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1105, 'JLIB_CLIENT_ERROR_JFTP_STORE_FIND_LOCAL', 'JFTP: :store: Unable to find local file. Local path: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1106, 'JLIB_CLIENT_ERROR_JFTP_STORE_BAD_RESPONSE_STOR', 'JFTP: :store: Bad response. Server response: %1$s [Expected: 150 or 125]. Path sent: %2$s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1107, 'JLIB_CLIENT_ERROR_JFTP_STORE_DATA_PORT', 'JFTP: :store: Unable to write to data port socket.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1108, 'JLIB_CLIENT_ERROR_JFTP_STORE_BAD_RESPONSE_TRANSFER', 'JFTP: :store: Transfer Failed. Server response: %1$s [Expected: 226]. Path sent: %2$s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1109, 'JLIB_CLIENT_ERROR_JFTP_WRITE_PASSIVE', 'JFTP: :write: Unable to use passive mode.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1110, 'JLIB_CLIENT_ERROR_JFTP_WRITE_BAD_RESPONSE', 'JFTP: :write: Bad response.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1111, 'JLIB_CLIENT_ERROR_JFTP_WRITE_BAD_RESPONSE_STOR', 'JFTP: :write: Bad response. Server response: %1$s [Expected: 150 or 125]. Path sent: %2$s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1112, 'JLIB_CLIENT_ERROR_JFTP_WRITE_DATA_PORT', 'JFTP: :write: Unable to write to data port socket.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1113, 'JLIB_CLIENT_ERROR_JFTP_WRITE_BAD_RESPONSE_TRANSFER', 'JFTP: :write: Transfer Failed. Server response: %1$s [Expected: 226]. Path sent: %2$s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1114, 'JLIB_CLIENT_ERROR_JFTP_LISTNAMES_PASSIVE', 'JFTP: :listNames: Unable to use passive mode.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1115, 'JLIB_CLIENT_ERROR_JFTP_LISTNAMES_BAD_RESPONSE', 'JFTP: :listNames: Bad response.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1116, 'JLIB_CLIENT_ERROR_JFTP_LISTNAMES_BAD_RESPONSE_NLST', 'JFTP: :listNames: Bad response. Server response: %1$s [Expected: 150 or 125]. Path sent: %2$s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1117, 'JLIB_CLIENT_ERROR_JFTP_LISTNAMES_BAD_RESPONSE_TRANSFER', 'JFTP: :listNames: Transfer Failed. Server response: %1$s [Expected: 226]. Path sent: %2$s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1118, 'JLIB_CLIENT_ERROR_JFTP_LISTDETAILS_BAD_RESPONSE', 'JFTP: :listDetails: Bad response.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1119, 'JLIB_CLIENT_ERROR_JFTP_LISTDETAILS_PASSIVE', 'JFTP: :listDetails: Unable to use passive mode.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1120, 'JLIB_CLIENT_ERROR_JFTP_LISTDETAILS_BAD_RESPONSE_LIST', 'JFTP: :listDetails: Bad response. Server response: %1$s [Expected: 150 or 125]. Path sent: %2$s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1121, 'JLIB_CLIENT_ERROR_JFTP_LISTDETAILS_BAD_RESPONSE_TRANSFER', 'JFTP: :listDetails: Transfer Failed. Server response: %1$s [Expected: 226]. Path sent: %2$s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1122, 'JLIB_CLIENT_ERROR_JFTP_LISTDETAILS_UNRECOGNISED', 'JFTP: :listDetails: Unrecognised folder listing format.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1123, 'JLIB_CLIENT_ERROR_JFTP_PUTCMD_UNCONNECTED', 'JFTP: :_putCmd: Not connected to the control port.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1124, 'JLIB_CLIENT_ERROR_JFTP_PUTCMD_SEND', 'JFTP: :_putCmd: Unable to send command: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1125, 'JLIB_CLIENT_ERROR_JFTP_VERIFYRESPONSE', 'JFTP: :_verifyResponse: Timeout or unrecognised response while waiting for a response from the server. Server response: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1126, 'JLIB_CLIENT_ERROR_JFTP_PASSIVE_CONNECT_PORT', 'JFTP: :_passive: Not connected to the control port.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1127, 'JLIB_CLIENT_ERROR_JFTP_PASSIVE_RESPONSE', 'JFTP: :_passive: Timeout or unrecognised response while waiting for a response from the server. Server response: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1128, 'JLIB_CLIENT_ERROR_JFTP_PASSIVE_IP_OBTAIN', 'JFTP: :_passive: Unable to obtain IP and port for data transfer. Server response: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1129, 'JLIB_CLIENT_ERROR_JFTP_PASSIVE_IP_VALID', 'JFTP: :_passive: IP and port for data transfer not valid. Server response: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1130, 'JLIB_CLIENT_ERROR_JFTP_PASSIVE_CONNECT', 'JFTP: :_passive: Could not connect to host %1$s on port %2$s. Socket error number: %3$s and error message: %4$s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1131, 'JLIB_CLIENT_ERROR_JFTP_MODE_BINARY', 'JFTP: :_mode: Bad response. Server response: %s [Expected: 200]. Mode sent: Binary.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1132, 'JLIB_CLIENT_ERROR_JFTP_MODE_ASCII', 'JFTP: :_mode: Bad response. Server response: %s [Expected: 200]. Mode sent: Ascii.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1133, 'JLIB_CLIENT_ERROR_HELPER_SETCREDENTIALSFROMREQUEST_FAILED', 'Looks like User''s credentials are no good.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1134, 'JLIB_CLIENT_ERROR_LDAP_ADDRESS_NOT_AVAILABLE', 'Address not available.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1135, 'JLIB_DATABASE_ERROR_ADAPTER_MYSQL', 'The MySQL adapter ''mysql'' is not available.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1136, 'JLIB_DATABASE_ERROR_ADAPTER_MYSQLI', 'The MySQL adapter ''mysqli'' is not available.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1137, 'JLIB_DATABASE_ERROR_BIND_FAILED_INVALID_SOURCE_ARGUMENT', '%s: :bind failed. Invalid source argument.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1138, 'JLIB_DATABASE_ERROR_ARTICLE_UNIQUE_ALIAS', 'Another article from this category has the same alias (remember it may be a trashed item).', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1139, 'JLIB_DATABASE_ERROR_CATEGORY_UNIQUE_ALIAS', 'Another category with the same parent category has the same alias (remember it may be a trashed item).', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1140, 'JLIB_DATABASE_ERROR_CHECK_FAILED', '%s: :check Failed - %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1141, 'JLIB_DATABASE_ERROR_CHECKIN_FAILED', '%s: :check-in failed - %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1142, 'JLIB_DATABASE_ERROR_CHECKOUT_FAILED', '%s: :check-out failed - %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1143, 'JLIB_DATABASE_ERROR_CHILD_ROWS_CHECKED_OUT', 'Child rows checked out.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1144, 'JLIB_DATABASE_ERROR_CLASS_DOES_NOT_SUPPORT_ORDERING', '%s does not support ordering.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1145, 'JLIB_DATABASE_ERROR_CLASS_IS_MISSING_FIELD', 'Missing field in the database: %s &#160; %s.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1146, 'JLIB_DATABASE_ERROR_CLASS_NOT_FOUND_IN_FILE', 'Table class %s not found in file.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1147, 'JLIB_DATABASE_ERROR_CONNECT_DATABASE', 'Unable to connect to the Database: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1148, 'JLIB_DATABASE_ERROR_CONNECT_MYSQL', 'Could not connect to MySQL.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1149, 'JLIB_DATABASE_ERROR_DATABASE_CONNECT', 'Could not connect to database.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1150, 'JLIB_DATABASE_ERROR_DELETE_CATEGORY', 'Left-Right data inconsistency. Can''t delete category.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1151, 'JLIB_DATABASE_ERROR_DELETE_FAILED', '%s: :delete failed - %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1152, 'JLIB_DATABASE_ERROR_DELETE_ROOT_CATEGORIES', 'Root categories can''t be deleted.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1153, 'JLIB_DATABASE_ERROR_EMAIL_INUSE', 'This email address is already registered.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1154, 'JLIB_DATABASE_ERROR_EMPTY_ROW_RETURNED', 'The database row is empty.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1155, 'JLIB_DATABASE_ERROR_FUNCTION_FAILED', 'DB function failed with error number %s <br /><span style="color: red;">%s</span>', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1156, 'JLIB_DATABASE_ERROR_GET_NEXT_ORDER_FAILED', '%s: :getNextOrder failed - %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1157, 'JLIB_DATABASE_ERROR_GET_TREE_FAILED', '%s: :getTree Failed - %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1158, 'JLIB_DATABASE_ERROR_GETNODE_FAILED', '%s: :_getNode Failed - %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1159, 'JLIB_DATABASE_ERROR_GETROOTID_FAILED', '%s: :getRootId Failed - %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1160, 'JLIB_DATABASE_ERROR_HIT_FAILED', '%s: :hit failed - %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1161, 'JLIB_DATABASE_ERROR_INVALID_LOCATION', '%s: :setLocation - Invalid location.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1162, 'JLIB_DATABASE_ERROR_INVALID_NODE_RECURSION', '%s: :move Failed - Can''t move the node to be a child of itself.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1163, 'JLIB_DATABASE_ERROR_INVALID_PARENT_ID', 'Invalid parent ID.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1164, 'JLIB_DATABASE_ERROR_LANGUAGE_NO_TITLE', 'The language should have a title.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1165, 'JLIB_DATABASE_ERROR_LANGUAGE_UNIQUE_IMAGE', 'A content language already exists with this Image Prefix.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1166, 'JLIB_DATABASE_ERROR_LANGUAGE_UNIQUE_LANG_CODE', 'A content language already exists with this Language Tag.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1167, 'JLIB_DATABASE_ERROR_LANGUAGE_UNIQUE_SEF', 'A content language already exists with this URL Language Code.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1168, 'JLIB_DATABASE_ERROR_LOAD_DATABASE_DRIVER', 'Unable to load Database Driver: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1169, 'JLIB_DATABASE_ERROR_MENUTYPE', 'Some menu items or some menu modules related to this menutype are checked out by another user or the default menu item is in this menu.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1170, 'JLIB_DATABASE_ERROR_MENUTYPE_CHECKOUT', 'The user checking out does not match the user who checked out this menu and/or its linked menu module.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1171, 'JLIB_DATABASE_ERROR_MENUTYPE_EMPTY', 'Menu type empty.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1172, 'JLIB_DATABASE_ERROR_MENUTYPE_EXISTS', 'Menu type exists: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1173, 'JLIB_DATABASE_ERROR_MENU_CANNOT_UNSET_DEFAULT', 'The Language parameter for this menu item must be set to ''All''. At least one Default menu item must have Language set to All, even if the site is multilingual.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1174, 'JLIB_DATABASE_ERROR_MENU_CANNOT_UNSET_DEFAULT_DEFAULT', 'At least one menu item has to be set as Default.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1175, 'JLIB_DATABASE_ERROR_MENU_UNPUBLISH_DEFAULT_HOME', 'Can''t unpublish default home.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1176, 'JLIB_DATABASE_ERROR_MENU_DEFAULT_CHECKIN_USER_MISMATCH', 'The current home menu for this language is checked out.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1177, 'JLIB_DATABASE_ERROR_MENU_UNIQUE_ALIAS', 'Another menu item with the same parent has this alias (remember it may be a trashed item).', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1178, 'JLIB_DATABASE_ERROR_MENU_UNIQUE_ALIAS_ROOT', 'Another menu item has the same alias in Root (remember it may be a trashed item). Root is the top level parent.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1179, 'JLIB_DATABASE_ERROR_MENU_HOME_NOT_COMPONENT', 'The home menu item must be a component.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1180, 'JLIB_DATABASE_ERROR_MENU_HOME_NOT_UNIQUE_IN_MENU', 'A menu should contain only one Default home.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1181, 'JLIB_DATABASE_ERROR_MENU_ROOT_ALIAS_COMPONENT', 'A first level menu item alias can''t be ''component''.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1182, 'JLIB_DATABASE_ERROR_MENU_ROOT_ALIAS_FOLDER', 'A first level menu item alias can''t be ''%s'' because ''%s'' is a sub-folder of your joomla installation folder.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1183, 'JLIB_DATABASE_ERROR_MOVE_FAILED', '%s: :move failed - %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1184, 'JLIB_DATABASE_ERROR_MUSTCONTAIN_A_TITLE_CATEGORY', 'Category must have a title.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1185, 'JLIB_DATABASE_ERROR_MUSTCONTAIN_A_TITLE_EXTENSION', 'Extension must have a title.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1186, 'JLIB_DATABASE_ERROR_MUSTCONTAIN_A_TITLE_MENUITEM', 'Menu Item must have a title.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1187, 'JLIB_DATABASE_ERROR_MUSTCONTAIN_A_TITLE_MODULE', 'Module must have a title.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1188, 'JLIB_DATABASE_ERROR_MUSTCONTAIN_A_TITLE_UPDATESITE', 'Update site must have a title.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1189, 'JLIB_DATABASE_ERROR_NEGATIVE_NOT_PERMITTED', '%s can''t be negative.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1190, 'JLIB_DATABASE_ERROR_NO_ROWS_SELECTED', 'No rows selected.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1191, 'JLIB_DATABASE_ERROR_NOT_SUPPORTED_FILE_NOT_FOUND', 'Table %s not supported. File not found.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1192, 'JLIB_DATABASE_ERROR_NULL_PRIMARY_KEY', 'Null primary key not allowed.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1193, 'JLIB_DATABASE_ERROR_ORDERDOWN_FAILED', '%s: :orderDown Failed - %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1194, 'JLIB_DATABASE_ERROR_ORDERUP_FAILED', '%s: :orderUp Failed - %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1195, 'JLIB_DATABASE_ERROR_PLEASE_ENTER_A_USER_NAME', 'Please enter a username.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1196, 'JLIB_DATABASE_ERROR_PLEASE_ENTER_YOUR_NAME', 'Please enter your name.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1197, 'JLIB_DATABASE_ERROR_PUBLISH_FAILED', '%s: :publish failed - %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1198, 'JLIB_DATABASE_ERROR_REBUILD_FAILED', '%s: :rebuild Failed - %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1199, 'JLIB_DATABASE_ERROR_REBUILDPATH_FAILED', '%s: :rebuildPath Failed - %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1200, 'JLIB_DATABASE_ERROR_REORDER_FAILED', '%s: :reorder failed - %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1201, 'JLIB_DATABASE_ERROR_REORDER_UPDATE_ROW_FAILED', '%s: :reorder update the row %s failed - %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1202, 'JLIB_DATABASE_ERROR_ROOT_NODE_NOT_FOUND', 'Root node not found.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1203, 'JLIB_DATABASE_ERROR_STORE_FAILED_UPDATE_ASSET_ID', 'The asset_id field could not be updated.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1204, 'JLIB_DATABASE_ERROR_STORE_FAILED', '%1$s: :store failed<br />%2$s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1205, 'JLIB_DATABASE_ERROR_USERGROUP_TITLE', 'User group must have a title.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1206, 'JLIB_DATABASE_ERROR_USERGROUP_TITLE_EXISTS', 'User group title already exists. Title must be unique with the same parent.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1207, 'JLIB_DATABASE_ERROR_USERLEVEL_NAME_EXISTS', 'Level with the name &quot;%s&quot; already exists.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1208, 'JLIB_DATABASE_ERROR_USERNAME_CANNOT_CHANGE', 'Can''t use this username.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1209, 'JLIB_DATABASE_ERROR_USERNAME_INUSE', 'Username in use.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1210, 'JLIB_DATABASE_ERROR_VALID_AZ09', 'Please enter a valid username. No space at beginning or end, at least %d characters and must <strong>not</strong> contain the following characters: < > \\ &quot; '' &#37; ; ( ) &.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1211, 'JLIB_DATABASE_ERROR_VALID_MAIL', 'Please enter a valid email address.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1212, 'JLIB_DATABASE_ERROR_VIEWLEVEL', 'Viewlevel must have a title.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1213, 'JLIB_DATABASE_FUNCTION_NOERROR', 'DB function reports no errors.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1214, 'JLIB_DATABASE_QUERY_FAILED', 'Database query failed (error # %s): %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1215, 'JLIB_DOCUMENT_ERROR_UNABLE_LOAD_DOC_CLASS', 'Unable to load document class.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1216, 'JLIB_ENVIRONMENT_SESSION_EXPIRED', 'Your session has expired. Please log in again.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1217, 'JLIB_ERROR_INFINITE_LOOP', 'Infinite loop detected in JError.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1218, 'JLIB_EVENT_ERROR_DISPATCHER', 'JEventDispatcher: :register: Event handler not recognised. Handler: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1219, 'JLIB_FILESYSTEM_BZIP_NOT_SUPPORTED', 'BZip2 Not Supported.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1220, 'JLIB_FILESYSTEM_BZIP_UNABLE_TO_READ', 'Unable to read archive (bz2).', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1221, 'JLIB_FILESYSTEM_BZIP_UNABLE_TO_WRITE', 'Unable to write archive (bz2).', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1222, 'JLIB_FILESYSTEM_BZIP_UNABLE_TO_WRITE_FILE', 'Unable to write file (bz2).', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1223, 'JLIB_FILESYSTEM_GZIP_NOT_SUPPORTED', 'GZlib Not Supported.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1224, 'JLIB_FILESYSTEM_GZIP_UNABLE_TO_READ', 'Unable to read archive (gz).', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1225, 'JLIB_FILESYSTEM_GZIP_UNABLE_TO_WRITE', 'Unable to write archive (gz).', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1226, 'JLIB_FILESYSTEM_GZIP_UNABLE_TO_WRITE_FILE', 'Unable to write file (gz).', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1227, 'JLIB_FILESYSTEM_GZIP_UNABLE_TO_DECOMPRESS', 'Unable to decompress data.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1228, 'JLIB_FILESYSTEM_TAR_UNABLE_TO_READ', 'Unable to read archive (tar).', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1229, 'JLIB_FILESYSTEM_TAR_UNABLE_TO_DECOMPRESS', 'Unable to decompress data.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1230, 'JLIB_FILESYSTEM_TAR_UNABLE_TO_CREATE_DESTINATION', 'Unable to create destination.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1231, 'JLIB_FILESYSTEM_TAR_UNABLE_TO_WRITE_ENTRY', 'Unable to write entry.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1232, 'JLIB_FILESYSTEM_ZIP_NOT_SUPPORTED', 'Zlib Not Supported.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1233, 'JLIB_FILESYSTEM_ZIP_UNABLE_TO_READ', 'Unable to read archive (zip).', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1234, 'JLIB_FILESYSTEM_ZIP_INFO_FAILED', 'Get ZIP Information failed.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1235, 'JLIB_FILESYSTEM_ZIP_UNABLE_TO_CREATE_DESTINATION', 'Unable to create destination.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1236, 'JLIB_FILESYSTEM_ZIP_UNABLE_TO_WRITE_ENTRY', 'Unable to write entry.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1237, 'JLIB_FILESYSTEM_ZIP_UNABLE_TO_READ_ENTRY', 'Unable to read entry.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1238, 'JLIB_FILESYSTEM_ZIP_UNABLE_TO_OPEN_ARCHIVE', 'Unable to open archive.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1239, 'JLIB_FILESYSTEM_ZIP_INVALID_ZIP_DATA', 'Invalid ZIP data.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1240, 'JLIB_FILESYSTEM_STREAM_FAILED', 'Failed to register string stream.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1241, 'JLIB_FILESYSTEM_UNKNOWNARCHIVETYPE', 'Unknown Archive type.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1242, 'JLIB_FILESYSTEM_UNABLE_TO_LOAD_ARCHIVE', 'Unable to load archive.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1243, 'JLIB_FILESYSTEM_ERROR_JFILE_FIND_COPY', 'JFile: :copy: Can''t find or read file: $%s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1244, 'JLIB_FILESYSTEM_ERROR_JFILE_STREAMS', 'JFile: :copy(%1$s, %2$s): %3$s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1245, 'JLIB_FILESYSTEM_ERROR_COPY_FAILED', 'Copy failed.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1246, 'JLIB_FILESYSTEM_DELETE_FAILED', 'Failed deleting %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1247, 'JLIB_FILESYSTEM_CANNOT_FIND_SOURCE_FILE', 'Can''t find source file.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1248, 'JLIB_FILESYSTEM_ERROR_JFILE_MOVE_STREAMS', 'JFile: :move: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1249, 'JLIB_FILESYSTEM_ERROR_RENAME_FILE', 'Rename failed.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1250, 'JLIB_FILESYSTEM_ERROR_READ_UNABLE_TO_OPEN_FILE', 'JFile: :read: Unable to open file: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1251, 'JLIB_FILESYSTEM_ERROR_WRITE_STREAMS', 'JFile: :write(%1$s): %2$s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1252, 'JLIB_FILESYSTEM_ERROR_UPLOAD', 'JFile: :upload: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1253, 'JLIB_FILESYSTEM_ERROR_WARNFS_ERR01', 'Warning: Failed to change file permissions!', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1254, 'JLIB_FILESYSTEM_ERROR_WARNFS_ERR02', 'Warning: Failed to move file!', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1255, 'JLIB_FILESYSTEM_ERROR_WARNFS_ERR03', 'Warning: File %s not uploaded for security reasons!', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1256, 'JLIB_FILESYSTEM_ERROR_FIND_SOURCE_FOLDER', 'Can''t find source folder.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1257, 'JLIB_FILESYSTEM_ERROR_FOLDER_EXISTS', 'Folder already exists.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1258, 'JLIB_FILESYSTEM_ERROR_FOLDER_CREATE', 'Unable to create target folder.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1259, 'JLIB_FILESYSTEM_ERROR_FOLDER_OPEN', 'Unable to open source folder.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1260, 'JLIB_FILESYSTEM_ERROR_FOLDER_LOOP', 'Infinite loop detected.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1261, 'JLIB_FILESYSTEM_ERROR_FOLDER_PATH', 'Path not in open_basedir paths.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1262, 'JLIB_FILESYSTEM_ERROR_COULD_NOT_CREATE_DIRECTORY', 'Could not create folder.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1263, 'JLIB_FILESYSTEM_ERROR_DELETE_BASE_DIRECTORY', 'You can''t delete a base folder.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1264, 'JLIB_FILESYSTEM_ERROR_PATH_IS_NOT_A_FOLDER', 'JFolder: :delete: Path is not a folder. Path: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1265, 'JLIB_FILESYSTEM_ERROR_FOLDER_DELETE', 'JFolder: :delete: Could not delete folder. Path: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1266, 'JLIB_FILESYSTEM_ERROR_FOLDER_RENAME', 'Rename failed: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1267, 'JLIB_FILESYSTEM_ERROR_PATH_IS_NOT_A_FOLDER_FILES', 'JFolder: :files: Path is not a folder. Path: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1268, 'JLIB_FILESYSTEM_ERROR_PATH_IS_NOT_A_FOLDER_FOLDER', 'JFolder: :folder: Path is not a folder. Path: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1269, 'JLIB_FILESYSTEM_ERROR_STREAMS_FILE_SIZE', 'Failed to get file size. This may not work for all streams!', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1270, 'JLIB_FILESYSTEM_ERROR_STREAMS_FILE_NOT_OPEN', 'File not open.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1271, 'JLIB_FILESYSTEM_ERROR_STREAMS_FILENAME', 'File name not set.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1272, 'JLIB_FILESYSTEM_ERROR_NO_DATA_WRITTEN', 'Warning: No data written.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1273, 'JLIB_FILESYSTEM_ERROR_STREAMS_FAILED_TO_OPEN_WRITER', 'Failed to open writer: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1274, 'JLIB_FILESYSTEM_ERROR_STREAMS_FAILED_TO_OPEN_READER', 'Failed to open reader: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1275, 'JLIB_FILESYSTEM_ERROR_STREAMS_NOT_UPLOADED_FILE', 'Not an uploaded file!', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1276, 'JLIB_FORM_BUTTON_CLEAR', 'Clear', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1277, 'JLIB_FORM_BUTTON_SELECT', 'Select', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1278, 'JLIB_FORM_CHANGE_IMAGE', 'Change Image', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1279, 'JLIB_FORM_CHANGE_IMAGE_BUTTON', 'Change Image Button', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1280, 'JLIB_FORM_CHANGE_USER', 'Select User', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1281, 'JLIB_FORM_ERROR_FIELDS_CATEGORY_ERROR_EXTENSION_EMPTY', 'Extension attribute is empty in the category field.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1282, 'JLIB_FORM_ERROR_FIELDS_GROUPEDLIST_ELEMENT_NAME', 'Unknown element type: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1283, 'JLIB_FORM_ERROR_NO_DATA', 'No data.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1284, 'JLIB_FORM_ERROR_VALIDATE_FIELD', 'Invalid xml field.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1285, 'JLIB_FORM_ERROR_XML_FILE_DID_NOT_LOAD', 'XML file did not load.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1286, 'JLIB_FORM_FIELD_INVALID', 'Invalid field:&#160', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1287, 'JLIB_FORM_INPUTMODE', 'latin', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1288, 'JLIB_FORM_INVALID_FORM_OBJECT', 'Invalid Form Object: :%s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1289, 'JLIB_FORM_INVALID_FORM_RULE', 'Invalid Form Rule: :%s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1290, 'JLIB_FORM_MEDIA_PREVIEW_ALT', 'Selected image.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1291, 'JLIB_FORM_MEDIA_PREVIEW_EMPTY', 'No image selected.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1292, 'JLIB_FORM_MEDIA_PREVIEW_SELECTED_IMAGE', 'Selected image.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1293, 'JLIB_FORM_MEDIA_PREVIEW_TIP_TITLE', 'Preview', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1294, 'JLIB_FORM_SELECT_USER', 'Select a User.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1295, 'JLIB_FORM_VALIDATE_FIELD_INVALID', 'Invalid field: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1296, 'JLIB_FORM_VALIDATE_FIELD_REQUIRED', 'Field required: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1297, 'JLIB_FORM_VALIDATE_FIELD_RULE_MISSING', 'Validation Rule missing: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1298, 'JLIB_FORM_VALUE_CACHE_APC', 'Alternative PHP Cache', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1299, 'JLIB_FORM_VALUE_CACHE_CACHELITE', 'Cache_Lite', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1300, 'JLIB_FORM_VALUE_CACHE_EACCELERATOR', 'eAccelerator', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1301, 'JLIB_FORM_VALUE_CACHE_FILE', 'File', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1302, 'JLIB_FORM_VALUE_CACHE_MEMCACHE', 'Memcache', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1303, 'JLIB_FORM_VALUE_CACHE_MEMCACHED', 'Memcached (Experimental)', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1304, 'JLIB_FORM_VALUE_CACHE_REDIS', 'Redis', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1305, 'JLIB_FORM_VALUE_CACHE_WINCACHE', 'Windows Cache', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1306, 'JLIB_FORM_VALUE_CACHE_XCACHE', 'XCache', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1307, 'JLIB_FORM_VALUE_SESSION_APC', 'Alternative PHP Cache', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1308, 'JLIB_FORM_VALUE_SESSION_DATABASE', 'Database', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1309, 'JLIB_FORM_VALUE_SESSION_EACCELERATOR', 'eAccelerator', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1310, 'JLIB_FORM_VALUE_SESSION_MEMCACHE', 'Memcache', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1311, 'JLIB_FORM_VALUE_SESSION_MEMCACHED', 'Memcached (Experimental)', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1312, 'JLIB_FORM_VALUE_SESSION_NONE', 'None', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1313, 'JLIB_FORM_VALUE_SESSION_WINCACHE', 'Windows Cache', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1314, 'JLIB_FORM_VALUE_SESSION_XCACHE', 'XCache', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1315, 'JLIB_FORM_VALUE_TIMEZONE_UTC', 'Universal Time, Coordinated (UTC)', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1316, 'JLIB_FORM_VALUE_FROM_TEMPLATE', 'From Template', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1317, 'JLIB_FORM_VALUE_INHERITED', 'Inherited', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1318, 'JLIB_HTML_ACCESS_MODIFY_DESC_CAPTION_ACL', 'ACL', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1319, 'JLIB_HTML_ACCESS_MODIFY_DESC_CAPTION_TABLE', 'Table', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1320, 'JLIB_HTML_ACCESS_SUMMARY_DESC_CAPTION', 'ACL Summary Table', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1321, 'JLIB_HTML_ACCESS_SUMMARY_DESC', 'Shown below is an overview of the permission settings for this article. Select the tabs above to customise these settings by action.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1322, 'JLIB_HTML_ACCESS_SUMMARY', 'Summary.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1323, 'JLIB_HTML_ADD_TO_ROOT', 'Add to root.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1324, 'JLIB_HTML_ADD_TO_THIS_MENU', 'Add to this menu.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1325, 'JLIB_HTML_BATCH_ACCESS_LABEL', 'Set Access Level', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1326, 'JLIB_HTML_BATCH_ACCESS_LABEL_DESC', 'Not making a selection will keep the original access levels when processing.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1327, 'JLIB_HTML_BATCH_COPY', 'Copy', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1328, 'JLIB_HTML_BATCH_LANGUAGE_LABEL', 'Set Language', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1329, 'JLIB_HTML_BATCH_LANGUAGE_LABEL_DESC', 'Not making a selection will keep the original language when processing.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1330, 'JLIB_HTML_BATCH_LANGUAGE_NOCHANGE', '- Keep original Language -', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1331, 'JLIB_HTML_BATCH_MENU_LABEL', 'To Move or Copy your selection please select a Category.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1332, 'JLIB_HTML_BATCH_MOVE', 'Move', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1333, 'JLIB_HTML_BATCH_MOVE_QUESTION', 'Do you want to move the items or make a copy of them?', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1334, 'JLIB_HTML_BATCH_NO_CATEGORY', '- Don''t move or copy -', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1335, 'JLIB_HTML_BATCH_NOCHANGE', '- Keep original Access Levels -', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1336, 'JLIB_HTML_BATCH_TAG_LABEL', 'Add Tag', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1337, 'JLIB_HTML_BATCH_TAG_LABEL_DESC', 'Add a tag to selected items.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1338, 'JLIB_HTML_BATCH_TAG_NOCHANGE', '- Keep original Tags -', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1339, 'JLIB_HTML_BATCH_USER_LABEL', 'Set User.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1340, 'JLIB_HTML_BATCH_USER_LABEL_DESC', 'Not making a selection will keep the original user when processing.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1341, 'JLIB_HTML_BATCH_USER_NOCHANGE', '- Keep original User -', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1342, 'JLIB_HTML_BATCH_USER_NOUSER', 'No User.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1343, 'JLIB_HTML_BEHAVIOR_ABOUT_THE_CALENDAR', 'About the Calendar', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1344, 'JLIB_HTML_BEHAVIOR_CLOSE', 'Close', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1345, 'JLIB_HTML_BEHAVIOR_DATE_SELECTION', 'Date selection:\\n', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1346, 'JLIB_HTML_BEHAVIOR_DISPLAY_S_FIRST', 'Display %s first', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1347, 'JLIB_HTML_BEHAVIOR_DRAG_TO_MOVE', 'Drag to move.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1348, 'JLIB_HTML_BEHAVIOR_GO_TODAY', 'Go to today', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1349, 'JLIB_HTML_BEHAVIOR_GREEN', 'Green', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1350, 'JLIB_HTML_BEHAVIOR_HOLD_MOUSE', '- Hold mouse button on any of the buttons above for faster selection.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1351, 'JLIB_HTML_BEHAVIOR_MONTH_SELECT', '- Use the < and > buttons to select month\\n', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1352, 'JLIB_HTML_BEHAVIOR_NEXT_MONTH_HOLD_FOR_MENU', 'Select to move to the next month. Select and hold for a list of the months.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1353, 'JLIB_HTML_BEHAVIOR_NEXT_YEAR_HOLD_FOR_MENU', 'Select to move to the next year. Select and hold for a list of years.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1354, 'JLIB_HTML_BEHAVIOR_PREV_MONTH_HOLD_FOR_MENU', 'Select to move to the previous month. Select and hold for a list of the months.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1355, 'JLIB_HTML_BEHAVIOR_PREV_YEAR_HOLD_FOR_MENU', 'Select to move to the previous year. Select and hold for a list of years.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1356, 'JLIB_HTML_BEHAVIOR_SELECT_DATE', 'Select a date.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1357, 'JLIB_HTML_BEHAVIOR_SHIFT_CLICK_OR_DRAG_TO_CHANGE_VALUE', '(Shift-)Select or Drag to change the value.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1358, 'JLIB_HTML_BEHAVIOR_TIME', 'Time:', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1359, 'JLIB_HTML_BEHAVIOR_TODAY', 'Today', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1360, 'JLIB_HTML_BEHAVIOR_TT_DATE_FORMAT', '%a, %b %e', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1361, 'JLIB_HTML_BEHAVIOR_WK', 'wk', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1362, 'JLIB_HTML_BEHAVIOR_YEAR_SELECT', '- Use the « and » buttons to select year\\n', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1363, 'JLIB_HTML_BUTTON_BASE_CLASS', 'Could not load button base class.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1364, 'JLIB_HTML_BUTTON_NO_LOAD', 'Could not load button %s (%s);', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1365, 'JLIB_HTML_BUTTON_NOT_DEFINED', 'Button not defined for type = %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1366, 'JLIB_HTML_CALENDAR', 'Calendar', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1367, 'JLIB_HTML_CHECKED_OUT', 'Checked out.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1368, 'JLIB_HTML_CHECKIN', 'Check-in', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1369, 'JLIB_HTML_CLOAKING', 'This email address is being protected from spambots. You need JavaScript enabled to view it.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1370, 'JLIB_HTML_DATE_RELATIVE_DAYS', '%s days ago.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1371, 'JLIB_HTML_DATE_RELATIVE_DAYS_1', '%s day ago.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1372, 'JLIB_HTML_DATE_RELATIVE_DAYS_0', '%s days ago.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1373, 'JLIB_HTML_DATE_RELATIVE_HOURS', '%s hours ago.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1374, 'JLIB_HTML_DATE_RELATIVE_HOURS_1', '%s hour ago.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1375, 'JLIB_HTML_DATE_RELATIVE_HOURS_0', '%s hours ago.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1376, 'JLIB_HTML_DATE_RELATIVE_LESSTHANAMINUTE', 'Less than a minute ago.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1377, 'JLIB_HTML_DATE_RELATIVE_MINUTES', '%s minutes ago.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1378, 'JLIB_HTML_DATE_RELATIVE_MINUTES_1', '%s minute ago.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1379, 'JLIB_HTML_DATE_RELATIVE_MINUTES_0', '%s minutes ago.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1380, 'JLIB_HTML_DATE_RELATIVE_WEEKS', '%s weeks ago.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1381, 'JLIB_HTML_DATE_RELATIVE_WEEKS_1', '%s week ago.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1382, 'JLIB_HTML_DATE_RELATIVE_WEEKS_0', '%s weeks ago.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1383, 'JLIB_HTML_EDIT_MENU_ITEM', 'Edit menu item.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1384, 'JLIB_HTML_EDIT_MENU_ITEM_ID', 'Item ID: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1385, 'JLIB_HTML_EDIT_MODULE', 'Edit module', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1386, 'JLIB_HTML_EDIT_MODULE_IN_POSITION', 'Position: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1387, 'JLIB_HTML_EDITOR_CANNOT_LOAD', 'Can''t load the editor.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1388, 'JLIB_HTML_END', 'End', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1389, 'JLIB_HTML_ERROR_FUNCTION_NOT_SUPPORTED', 'Function not supported.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1390, 'JLIB_HTML_ERROR_NOTFOUNDINFILE', '%s: :%s not found in file.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1391, 'JLIB_HTML_ERROR_NOTSUPPORTED_NOFILE', '%s: :%s not supported. File not found.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1392, 'JLIB_HTML_ERROR_NOTSUPPORTED', '%s: :%s not supported.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1393, 'JLIB_HTML_MOVE_DOWN', 'Move Down', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1394, 'JLIB_HTML_MOVE_UP', 'Move Up', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1395, 'JLIB_HTML_NO_PARAMETERS_FOR_THIS_ITEM', 'There are no parameters for this item.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1396, 'JLIB_HTML_NO_RECORDS_FOUND', 'No records found.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1397, 'JLIB_HTML_PAGE_CURRENT_OF_TOTAL', 'Page %s of %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1398, 'JLIB_HTML_PLEASE_MAKE_A_SELECTION_FROM_THE_LIST', 'Please first make a selection from the list.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1399, 'JLIB_HTML_PUBLISH_ITEM', 'Publish Item', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1400, 'JLIB_HTML_PUBLISHED_EXPIRED_ITEM', 'Published, but has Expired.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1401, 'JLIB_HTML_PUBLISHED_FINISHED', 'Finish: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1402, 'JLIB_HTML_PUBLISHED_ITEM', 'Published and is Current.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1403, 'JLIB_HTML_PUBLISHED_PENDING_ITEM', 'Published, but is Pending.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1404, 'JLIB_HTML_PUBLISHED_START', 'Start: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1405, 'JLIB_HTML_RESULTS_OF', 'Results %s - %s of %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1406, 'JLIB_HTML_SAVE_ORDER', 'Save Order', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1407, 'JLIB_HTML_SELECT_STATE', 'Select State', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1408, 'JLIB_HTML_START', 'Start', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1409, 'JLIB_HTML_UNPUBLISH_ITEM', 'Unpublish Item', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1410, 'JLIB_HTML_VIEW_ALL', 'View All', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1411, 'JLIB_HTML_SETDEFAULT_ITEM', 'Set default', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1412, 'JLIB_HTML_UNSETDEFAULT_ITEM', 'Unset default', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1413, 'JLIB_INSTALLER_ABORT', 'Aborting language installation: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1414, 'JLIB_INSTALLER_ABORT_ALREADYINSTALLED', 'Extension is already installed.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1415, 'JLIB_INSTALLER_ABORT_ALREADY_EXISTS', 'Extension %1$s: Extension %2$s already exists.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1416, 'JLIB_INSTALLER_ABORT_COMP_BUILDADMINMENUS_FAILED', 'Error building Administrator Menus.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1417, 'JLIB_INSTALLER_ABORT_COMP_COPY_MANIFEST', 'Component %1$s: Could not copy PHP manifest file.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1418, 'JLIB_INSTALLER_ABORT_COMP_COPY_SETUP', 'Component %1$s: Could not copy setup file.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1419, 'JLIB_INSTALLER_ABORT_COMP_FAIL_ADMIN_FILES', 'Component %s: Failed to copy administrator files.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1420, 'JLIB_INSTALLER_ABORT_COMP_FAIL_SITE_FILES', 'Component %s: Failed to copy site files.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1421, 'JLIB_INSTALLER_ABORT_COMP_INSTALL_COPY_SETUP', 'Component Install: Could not copy setup file.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1422, 'JLIB_INSTALLER_ABORT_COMP_INSTALL_CUSTOM_INSTALL_FAILURE', 'Component Install: Custom install routine failure.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1423, 'JLIB_INSTALLER_ABORT_COMP_INSTALL_MANIFEST', 'Component Install: Could not copy PHP manifest file.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1424, 'JLIB_INSTALLER_ABORT_COMP_INSTALL_PHP_INSTALL', 'Component Install: Could not copy PHP install file.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1425, 'JLIB_INSTALLER_ABORT_COMP_INSTALL_PHP_UNINSTALL', 'Component Install: Could not copy PHP uninstall file.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1426, 'JLIB_INSTALLER_ABORT_COMP_INSTALL_ROLLBACK', 'Component Install: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1427, 'JLIB_INSTALLER_ABORT_COMP_INSTALL_SQL_ERROR', 'Component Install: SQL error file %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini');
INSERT INTO `hyxu5_overrider` (`id`, `constant`, `string`, `file`) VALUES
(1428, 'JLIB_INSTALLER_ABORT_COMP_UPDATESITEMENUS_FAILED', 'Component Install: Failed to update menu items.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1429, 'JLIB_INSTALLER_ABORT_COMP_UPDATE_ADMIN_ELEMENT', 'Component Update: The XML file did not contain an administration element.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1430, 'JLIB_INSTALLER_ABORT_COMP_UPDATE_COPY_SETUP', 'Component Update: Could not copy setup file.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1431, 'JLIB_INSTALLER_ABORT_COMP_UPDATE_MANIFEST', 'Component Update: Could not copy PHP manifest file.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1432, 'JLIB_INSTALLER_ABORT_COMP_UPDATE_PHP_INSTALL', 'Component Update: Could not copy PHP install file.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1433, 'JLIB_INSTALLER_ABORT_COMP_UPDATE_PHP_UNINSTALL', 'Component Update: Could not copy PHP uninstall file.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1434, 'JLIB_INSTALLER_ABORT_COMP_UPDATE_ROLLBACK', 'Component Update: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1435, 'JLIB_INSTALLER_ABORT_COMP_UPDATE_SQL_ERROR', 'Component Update: SQL error file %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1436, 'JLIB_INSTALLER_ABORT_CREATE_DIRECTORY', 'Extension %1$s: Failed to create folder: %2$s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1437, 'JLIB_INSTALLER_ABORT_DEBUG', 'Installation unexpectedly terminated:', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1438, 'JLIB_INSTALLER_ABORT_DETECTMANIFEST', 'Unable to detect manifest file.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1439, 'JLIB_INSTALLER_ABORT_DIRECTORY', 'Extension %1$s: Another %2$s is already using the named folder: %3$s. Are you trying to install the same extension again?', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1440, 'JLIB_INSTALLER_ABORT_EXTENSIONNOTVALID', 'Extension is not valid.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1441, 'JLIB_INSTALLER_ABORT_FILE_INSTALL_COPY_SETUP', 'Files Install: Could not copy setup file.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1442, 'JLIB_INSTALLER_ABORT_FILE_INSTALL_CUSTOM_INSTALL_FAILURE', 'Files Install: Custom install routine failure.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1443, 'JLIB_INSTALLER_ABORT_FILE_INSTALL_FAIL_SOURCE_DIRECTORY', 'Files Install: Failed to find source folder: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1444, 'JLIB_INSTALLER_ABORT_FILE_INSTALL_ROLLBACK', 'Files Install: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1445, 'JLIB_INSTALLER_ABORT_FILE_INSTALL_SQL_ERROR', 'Files %1$s: SQL error file %2$s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1446, 'JLIB_INSTALLER_ABORT_FILE_ROLLBACK', 'Files Install: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1447, 'JLIB_INSTALLER_ABORT_FILE_SAME_NAME', 'Files Install: Another extension with same name already exists.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1448, 'JLIB_INSTALLER_ABORT_FILE_UPDATE_SQL_ERROR', 'Files Update: SQL error file %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1449, 'JLIB_INSTALLER_ABORT_INSTALL_CUSTOM_INSTALL_FAILURE', 'Extension %s: Custom install routine failure.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1450, 'JLIB_INSTALLER_ABORT_LIB_COPY_FILES', 'Library %s: Could not copy files from the source.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1451, 'JLIB_INSTALLER_ABORT_LIB_INSTALL_ALREADY_INSTALLED', 'Library Install: Library already installed.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1452, 'JLIB_INSTALLER_ABORT_LIB_INSTALL_COPY_SETUP', 'Library Install: Could not copy setup file.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1453, 'JLIB_INSTALLER_ABORT_LIB_INSTALL_FAILED_TO_CREATE_DIRECTORY', 'Library Install: Failed to create folder: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1454, 'JLIB_INSTALLER_ABORT_LIB_INSTALL_NOFILE', 'Library Install: No library file specified.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1455, 'JLIB_INSTALLER_ABORT_LIB_INSTALL_ROLLBACK', 'Library Install: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1456, 'JLIB_INSTALLER_ABORT_LOAD_DETAILS', 'Failed to load extension details.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1457, 'JLIB_INSTALLER_ABORT_MANIFEST', 'Extension %1$s: Could not copy PHP manifest file.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1458, 'JLIB_INSTALLER_ABORT_METHODNOTSUPPORTED', 'Method not supported for this extension type.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1459, 'JLIB_INSTALLER_ABORT_METHODNOTSUPPORTED_TYPE', 'Method not supported for this extension type: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1460, 'JLIB_INSTALLER_ABORT_MOD_COPY_FILES', 'Module %s: Could not copy files from the source.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1461, 'JLIB_INSTALLER_ABORT_MOD_INSTALL_COPY_SETUP', 'Module Install: Could not copy setup file.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1462, 'JLIB_INSTALLER_ABORT_MOD_INSTALL_CREATE_DIRECTORY', 'Module %1$s: Failed to create folder: %2$s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1463, 'JLIB_INSTALLER_ABORT_MOD_INSTALL_CUSTOM_INSTALL_FAILURE', 'Module Install: Custom install routine failure.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1464, 'JLIB_INSTALLER_ABORT_MOD_INSTALL_DIRECTORY', 'Module %1$s: Another module is already using folder: %2$s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1465, 'JLIB_INSTALLER_ABORT_MOD_INSTALL_MANIFEST', 'Module Install: Could not copy PHP manifest file.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1466, 'JLIB_INSTALLER_ABORT_MOD_INSTALL_NOFILE', 'Module %s: No module file specified.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1467, 'JLIB_INSTALLER_ABORT_MOD_INSTALL_SQL_ERROR', 'Module %1$s: SQL error file %2$s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1468, 'JLIB_INSTALLER_ABORT_MOD_ROLLBACK', 'Module %1$s: %2$s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1469, 'JLIB_INSTALLER_ABORT_MOD_UNINSTALL_UNKNOWN_CLIENT', 'Module Uninstall: Unknown client type [%s]', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1470, 'JLIB_INSTALLER_ABORT_MOD_UNKNOWN_CLIENT', 'Module %1$s: Unknown client type [%2$s]', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1471, 'JLIB_INSTALLER_ABORT_NOINSTALLPATH', 'Install path does not exist.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1472, 'JLIB_INSTALLER_ABORT_NOUPDATEPATH', 'Update path does not exist.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1473, 'JLIB_INSTALLER_ABORT_PACK_INSTALL_COPY_SETUP', 'Package Install: Could not copy setup file.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1474, 'JLIB_INSTALLER_ABORT_PACK_INSTALL_CREATE_DIRECTORY', 'Package Install: Failed to create folder:%s.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1475, 'JLIB_INSTALLER_ABORT_PACKAGE_INSTALL_CUSTOM_INSTALL_FAILURE', 'Package Install: Custom install routine failure.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1476, 'JLIB_INSTALLER_ABORT_PACKAGE_INSTALL_MANIFEST', 'Installation failed: Could not copy PHP manifest file.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1477, 'JLIB_INSTALLER_ABORT_PACK_INSTALL_ERROR_EXTENSION', 'Package %1$s: There was an error installing an extension: %2$s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1478, 'JLIB_INSTALLER_ABORT_PACK_INSTALL_NO_FILES', 'Package %s: There were no files to install!', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1479, 'JLIB_INSTALLER_ABORT_PACK_INSTALL_NO_PACK', 'Package %s: No package file specified.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1480, 'JLIB_INSTALLER_ABORT_PACK_INSTALL_ROLLBACK', 'Package Install: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1481, 'JLIB_INSTALLER_ABORT_PLG_COPY_FILES', 'Plugin %s: Could not copy files from the source.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1482, 'JLIB_INSTALLER_ABORT_PLG_INSTALL_ALLREADY_EXISTS', 'Plugin %1$s: Plugin %2$s already exists.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1483, 'JLIB_INSTALLER_ABORT_PLG_INSTALL_COPY_SETUP', 'Plugin %s: Could not copy setup file.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1484, 'JLIB_INSTALLER_ABORT_PLG_INSTALL_CREATE_DIRECTORY', 'Plugin %1$s: Failed to create folder: %2$s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1485, 'JLIB_INSTALLER_ABORT_PLG_INSTALL_CUSTOM_INSTALL_FAILURE', 'Plugin Install: Custom install routine failure.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1486, 'JLIB_INSTALLER_ABORT_PLG_INSTALL_DIRECTORY', 'Plugin %1$s: Another plugin is already using folder: %2$s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1487, 'JLIB_INSTALLER_ABORT_PLG_INSTALL_MANIFEST', 'Plugin %s: Could not copy PHP manifest file.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1488, 'JLIB_INSTALLER_ABORT_PLG_INSTALL_NO_FILE', 'Plugin %s: No plugin file specified.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1489, 'JLIB_INSTALLER_ABORT_PLG_INSTALL_ROLLBACK', 'Plugin %1$s: %2$s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1490, 'JLIB_INSTALLER_ABORT_PLG_INSTALL_SQL_ERROR', 'Plugin %1$s: SQL error file %2$s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1491, 'JLIB_INSTALLER_ABORT_PLG_UNINSTALL_SQL_ERROR', 'Plugin Uninstall: SQL error file %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1492, 'JLIB_INSTALLER_ABORT_REFRESH_MANIFEST_CACHE', 'Refresh Manifest Cache failed: Extension is not currently installed.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1493, 'JLIB_INSTALLER_ABORT_REFRESH_MANIFEST_CACHE_VALID', 'Refresh Manifest Cache failed: Extension is not valid.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1494, 'JLIB_INSTALLER_ABORT_ROLLBACK', 'Extension %1$s: %2$s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1495, 'JLIB_INSTALLER_ABORT_SQL_ERROR', 'Extension %1$s: SQL error processing query: %2$s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1496, 'JLIB_INSTALLER_ABORT_TPL_INSTALL_ALREADY_INSTALLED', 'Template Install: Template already installed.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1497, 'JLIB_INSTALLER_ABORT_TPL_INSTALL_ANOTHER_TEMPLATE_USING_DIRECTORY', 'Template Install: There is already a Template using the named folder: %s. Are you trying to install the same template again?', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1498, 'JLIB_INSTALLER_ABORT_TPL_INSTALL_COPY_FILES', 'Template Install: Could not copy files from the %s source.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1499, 'JLIB_INSTALLER_ABORT_TPL_INSTALL_COPY_SETUP', 'Template Install: Could not copy setup file.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1500, 'JLIB_INSTALLER_ABORT_TPL_INSTALL_FAILED_CREATE_DIRECTORY', 'Template Install: Failed to create folder: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1501, 'JLIB_INSTALLER_ABORT_TPL_INSTALL_ROLLBACK', 'Template Install: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1502, 'JLIB_INSTALLER_ABORT_TPL_INSTALL_UNKNOWN_CLIENT', 'Template Install: Unknown client type [%s]', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1503, 'JLIB_INSTALLER_AVAILABLE_UPDATE_PHP_VERSION', 'For the extension %1$s version %2$s is available, but it requires at least PHP version %3$s while your system only has %4$s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1504, 'JLIB_INSTALLER_PURGED_UPDATES', 'Cleared updates', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1505, 'JLIB_INSTALLER_FAILED_TO_PURGE_UPDATES', 'Failed to clear updates.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1506, 'JLIB_INSTALLER_DEFAULT_STYLE', '%s - Default', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1507, 'JLIB_INSTALLER_DISCOVER', 'Discover', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1508, 'JLIB_INSTALLER_ERROR_COMP_DISCOVER_STORE_DETAILS', 'Component Discover install: Failed to store component details.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1509, 'JLIB_INSTALLER_ERROR_COMP_FAILED_TO_CREATE_DIRECTORY', 'Component %1$s: Failed to create folder: %2$s.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1510, 'JLIB_INSTALLER_ERROR_COMP_INSTALL_ADMIN_ELEMENT', 'Component Install: The XML file did not contain an administration element.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1511, 'JLIB_INSTALLER_ERROR_COMP_INSTALL_DIR_ADMIN', 'Component Install: Another component is already using folder: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1512, 'JLIB_INSTALLER_ERROR_COMP_INSTALL_DIR_SITE', 'Component Install: Another component is already using folder: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1513, 'JLIB_INSTALLER_ERROR_COMP_INSTALL_FAILED_TO_CREATE_DIRECTORY_ADMIN', 'Component Install: Failed to create administrator folder: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1514, 'JLIB_INSTALLER_ERROR_COMP_INSTALL_FAILED_TO_CREATE_DIRECTORY_SITE', 'Component Install: Failed to create site folder: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1515, 'JLIB_INSTALLER_ERROR_COMP_REFRESH_MANIFEST_CACHE', 'Component Refresh manifest cache: Failed to store component details.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1516, 'JLIB_INSTALLER_ERROR_COMP_REMOVING_ADMIN_MENUS_FAILED', 'Could not delete the Administrator menus.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1517, 'JLIB_INSTALLER_ERROR_COMP_UNINSTALL_CUSTOM', 'Component Uninstall: Custom Uninstall script unsuccessful.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1518, 'JLIB_INSTALLER_ERROR_COMP_UNINSTALL_FAILED_DELETE_CATEGORIES', 'Component Uninstall: Unable to delete the component categories.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1519, 'JLIB_INSTALLER_ERROR_COMP_UNINSTALL_ERRORREMOVEMANUALLY', 'Component Uninstall: Can''t uninstall. Please remove manually.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1520, 'JLIB_INSTALLER_ERROR_COMP_UNINSTALL_ERRORUNKOWNEXTENSION', 'Component Uninstall: Unknown Extension.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1521, 'JLIB_INSTALLER_ERROR_COMP_UNINSTALL_FAILED_REMOVE_DIRECTORY_ADMIN', 'Component Uninstall: Unable to remove the component administrator folder.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1522, 'JLIB_INSTALLER_ERROR_COMP_UNINSTALL_FAILED_REMOVE_DIRECTORY_SITE', 'Component Uninstall: Unable to remove the component site folder.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1523, 'JLIB_INSTALLER_ERROR_COMP_UNINSTALL_NO_OPTION', 'Component Uninstall: Option field empty, can''t remove files.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1524, 'JLIB_INSTALLER_ERROR_COMP_UNINSTALL_SQL_ERROR', 'Component Uninstall: SQL error file %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1525, 'JLIB_INSTALLER_ERROR_COMP_UNINSTALL_WARNCORECOMPONENT', 'Component Uninstall: Trying to uninstall a core component.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1526, 'JLIB_INSTALLER_ERROR_COMP_UPDATE_FAILED_TO_CREATE_DIRECTORY_ADMIN', 'Component Update: Failed to create administrator folder: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1527, 'JLIB_INSTALLER_ERROR_COMP_UPDATE_FAILED_TO_CREATE_DIRECTORY_SITE', 'Component Update: Failed to create site folder: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1528, 'JLIB_INSTALLER_ERROR_CREATE_DIRECTORY', 'JInstaller: :Install: Failed to create folder: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1529, 'JLIB_INSTALLER_ERROR_CREATE_FOLDER_FAILED', 'Failed to create folder [%s]', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1530, 'JLIB_INSTALLER_ERROR_DEPRECATED_FORMAT', 'Deprecated install format (client="both"), use package installer in future.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1531, 'JLIB_INSTALLER_ERROR_DISCOVER_INSTALL_UNSUPPORTED', 'A %s extension can not be installed using the discover method. Please install this extension from Extension Manager: Install.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1532, 'JLIB_INSTALLER_ERROR_DOWNLOAD_SERVER_CONNECT', 'Error connecting to the server: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1533, 'JLIB_INSTALLER_ERROR_FAIL_COPY_FILE', 'JInstaller: :Install: Failed to copy file %1$s to %2$s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1534, 'JLIB_INSTALLER_ERROR_FAIL_COPY_FOLDER', 'JInstaller: :Install: Failed to copy folder %1$s to %2$s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1535, 'JLIB_INSTALLER_ERROR_FAILED_READING_NETWORK_RESOURCES', 'Failed reading network resource: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1536, 'JLIB_INSTALLER_ERROR_FILE_EXISTS', 'JInstaller: :Install: File already exists %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1537, 'JLIB_INSTALLER_ERROR_FILE_UNINSTALL_INVALID_MANIFEST', 'Files Uninstall: Invalid manifest file.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1538, 'JLIB_INSTALLER_ERROR_FILE_UNINSTALL_INVALID_NOTFOUND_MANIFEST', 'Files Uninstall: Manifest file invalid or not found.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1539, 'JLIB_INSTALLER_ERROR_FILE_UNINSTALL_LOAD_ENTRY', 'Files Uninstall: Could not load extension entry.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1540, 'JLIB_INSTALLER_ERROR_FILE_UNINSTALL_LOAD_MANIFEST', 'Files Uninstall: Could not load manifest file.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1541, 'JLIB_INSTALLER_ERROR_FILE_UNINSTALL_SQL_ERROR', 'Files Uninstall: SQL error file %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1542, 'JLIB_INSTALLER_ERROR_FILE_UNINSTALL_WARNCOREFILE', 'File Uninstall: Trying to uninstall core files.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1543, 'JLIB_INSTALLER_ERROR_FOLDER_IN_USE', 'Another extension is already using folder [%s]', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1544, 'JLIB_INSTALLER_ERROR_LANG_DISCOVER_STORE_DETAILS', 'Language Discover install: Failed to store language details.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1545, 'JLIB_INSTALLER_ERROR_LANG_UNINSTALL_DEFAULT', 'This language can''t be uninstalled as long as it is defined as a default language.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1546, 'JLIB_INSTALLER_ERROR_LANG_UNINSTALL_DIRECTORY', 'Language Uninstall: Unable to remove the specified Language folder.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1547, 'JLIB_INSTALLER_ERROR_LANG_UNINSTALL_ELEMENT_EMPTY', 'Language Uninstall: Element is empty, can''t uninstall files.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1548, 'JLIB_INSTALLER_ERROR_LANG_UNINSTALL_PATH_EMPTY', 'Language Uninstall: Language path is empty, can''t uninstall files.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1549, 'JLIB_INSTALLER_ERROR_LANG_UNINSTALL_PROTECTED', 'This language can''t be uninstalled. It is protected in the database (usually en-GB).', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1550, 'JLIB_INSTALLER_ERROR_LIB_DISCOVER_STORE_DETAILS', 'Library Discover install: Failed to store library details.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1551, 'JLIB_INSTALLER_ERROR_LIB_UNINSTALL_INVALID_MANIFEST', 'Library Uninstall: Invalid manifest file.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1552, 'JLIB_INSTALLER_ERROR_LIB_UNINSTALL_INVALID_NOTFOUND_MANIFEST', 'Library Uninstall: Manifest file invalid or not found.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1553, 'JLIB_INSTALLER_ERROR_LIB_UNINSTALL_LOAD_MANIFEST', 'Library Uninstall: Could not load manifest file.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1554, 'JLIB_INSTALLER_ERROR_LIB_UNINSTALL_WARNCORELIBRARY', 'Library Uninstall: Trying to uninstall a core library.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1555, 'JLIB_INSTALLER_ERROR_LOAD_XML', 'JInstaller: :Install: Failed to load XML File: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1556, 'JLIB_INSTALLER_ERROR_MOD_DISCOVER_STORE_DETAILS', 'Module Discover install: Failed to store module details.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1557, 'JLIB_INSTALLER_ERROR_MOD_REFRESH_MANIFEST_CACHE', 'Module Refresh manifest cache: Failed to store module details.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1558, 'JLIB_INSTALLER_ERROR_MOD_UNINSTALL_ERRORUNKOWNEXTENSION', 'Module Uninstall: Unknown Extension.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1559, 'JLIB_INSTALLER_ERROR_MOD_UNINSTALL_EXCEPTION', 'Module Uninstall: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1560, 'JLIB_INSTALLER_ERROR_MOD_UNINSTALL_INVALID_NOTFOUND_MANIFEST', 'Module Uninstall: Manifest file invalid or not found.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1561, 'JLIB_INSTALLER_ERROR_MOD_UNINSTALL_SQL_ERROR', 'Module Uninstall: SQL error file %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1562, 'JLIB_INSTALLER_ERROR_MOD_UNINSTALL_WARNCOREMODULE', 'Module Uninstall: Trying to uninstall a core module: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1563, 'JLIB_INSTALLER_ERROR_NO_CORE_LANGUAGE', 'No core pack exists for the language [%s]', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1564, 'JLIB_INSTALLER_ERROR_NO_FILE', 'JInstaller: :Install: File does not exist %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1565, 'JLIB_INSTALLER_ERROR_NO_LANGUAGE_TAG', 'The package did not specify a language tag. Are you trying to install an old language package?', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1566, 'JLIB_INSTALLER_ERROR_NOTFINDJOOMLAXMLSETUPFILE', 'JInstaller: :Install: Can''t find Joomla XML setup file.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1567, 'JLIB_INSTALLER_ERROR_NOTFINDXMLSETUPFILE', 'JInstaller: :Install: Can''t find XML setup file.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1568, 'JLIB_INSTALLER_ERROR_PACK_UNINSTALL_INVALID_MANIFEST', 'Package Uninstall: Invalid manifest file.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1569, 'JLIB_INSTALLER_ERROR_PACK_UNINSTALL_INVALID_NOTFOUND_MANIFEST', 'Package Uninstall: Manifest file invalid or not found: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1570, 'JLIB_INSTALLER_ERROR_PACK_UNINSTALL_LOAD_MANIFEST', 'Package Uninstall: Could not load manifest file.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1571, 'JLIB_INSTALLER_ERROR_PACK_UNINSTALL_MANIFEST_NOT_REMOVED', 'Package Uninstall: Errors were detected, manifest file not removed!', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1572, 'JLIB_INSTALLER_ERROR_PACK_UNINSTALL_MISSINGMANIFEST', 'Package Uninstall: Missing manifest file.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1573, 'JLIB_INSTALLER_ERROR_PACK_UNINSTALL_NOT_PROPER', 'Package Uninstall: This extension may have already been uninstalled or might not have been uninstall properly: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1574, 'JLIB_INSTALLER_ERROR_PACK_UNINSTALL_WARNCOREPACK', 'Package Uninstall: Trying to uninstall core package.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1575, 'JLIB_INSTALLER_ERROR_PLG_DISCOVER_STORE_DETAILS', 'Plugin Discover install: Failed to store plugin details.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1576, 'JLIB_INSTALLER_ERROR_PLG_REFRESH_MANIFEST_CACHE', 'Plugin Refresh manifest cache: Failed to store plugin details.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1577, 'JLIB_INSTALLER_ERROR_PLG_UNINSTALL_ERRORUNKOWNEXTENSION', 'Plugin Uninstall: Unknown Extension.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1578, 'JLIB_INSTALLER_ERROR_PLG_UNINSTALL_FOLDER_FIELD_EMPTY', 'Plugin Uninstall: Folder field empty, can''t remove files.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1579, 'JLIB_INSTALLER_ERROR_PLG_UNINSTALL_INVALID_MANIFEST', 'Plugin Uninstall: Invalid manifest file.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1580, 'JLIB_INSTALLER_ERROR_PLG_UNINSTALL_INVALID_NOTFOUND_MANIFEST', 'Plugin Uninstall: Manifest file invalid or not found.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1581, 'JLIB_INSTALLER_ERROR_PLG_UNINSTALL_LOAD_MANIFEST', 'Plugin Uninstall: Could not load manifest file.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1582, 'JLIB_INSTALLER_ERROR_PLG_UNINSTALL_WARNCOREPLUGIN', 'Plugin Uninstall: Trying to uninstall a core plugin: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1583, 'JLIB_INSTALLER_ERROR_SQL_ERROR', 'JInstaller: :Install: Error SQL %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1584, 'JLIB_INSTALLER_ERROR_SQL_FILENOTFOUND', 'JInstaller: :Install: SQL File not found %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1585, 'JLIB_INSTALLER_ERROR_SQL_READBUFFER', 'JInstaller: :Install: SQL File Buffer Read Error.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1586, 'JLIB_INSTALLER_ERROR_TPL_DISCOVER_STORE_DETAILS', 'Template Discover install: Failed to store template details.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1587, 'JLIB_INSTALLER_ERROR_TPL_UNINSTALL_ERRORUNKOWNEXTENSION', 'Template Uninstall: Unknown Extension.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1588, 'JLIB_INSTALLER_ERROR_TPL_UNINSTALL_INVALID_CLIENT', 'Template Uninstall: Invalid client.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1589, 'JLIB_INSTALLER_ERROR_TPL_UNINSTALL_INVALID_NOTFOUND_MANIFEST', 'Template Uninstall: Manifest file invalid or not found.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1590, 'JLIB_INSTALLER_ERROR_TPL_UNINSTALL_TEMPLATE_DEFAULT', 'Template Uninstall: Can''t remove default template.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1591, 'JLIB_INSTALLER_ERROR_TPL_UNINSTALL_TEMPLATE_DIRECTORY', 'Template Uninstall: Folder does not exist, can''t remove files.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1592, 'JLIB_INSTALLER_ERROR_TPL_UNINSTALL_TEMPLATE_ID_EMPTY', 'Template Uninstall: Template ID is empty, can''t uninstall files.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1593, 'JLIB_INSTALLER_ERROR_TPL_UNINSTALL_WARNCORETEMPLATE', 'Template Uninstall: Trying to uninstall a core template: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1594, 'JLIB_INSTALLER_ERROR_UNKNOWN_CLIENT_TYPE', 'Unknown Client Type [%s]', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1595, 'JLIB_INSTALLER_INSTALL', 'Install', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1596, 'JLIB_INSTALLER_NOTICE_LANG_RESET_USERS', 'Language set to Default for %d users.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1597, 'JLIB_INSTALLER_NOTICE_LANG_RESET_USERS_1', 'Language set to Default for %d user.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1598, 'JLIB_INSTALLER_UNINSTALL', 'Uninstall', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1599, 'JLIB_INSTALLER_UPDATE', 'Update', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1600, 'JLIB_INSTALLER_ERROR_EXTENSION_INVALID_CLIENT_IDENTIFIER', 'Invalid client identifier specified in extension manifest.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1601, 'JLIB_INSTALLER_ERROR_PACK_UNINSTALL_UNKNOWN_EXTENSION', 'Attempting to uninstall unknown extension from package. This extension may have already been removed earlier.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1602, 'JLIB_INSTALLER_NOT_ERROR', 'If the error is related to the installation of TinyMCE language files it has no effect on the installation of the language(s). Some language packs created prior to Joomla! 3.2.0 may try to install separate TinyMCE language files. As these are now included in the core they no longer need to be installed.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1603, 'JLIB_INSTALLER_UPDATE_LOG_QUERY', 'Ran query from file %1$s. Query text: %2$s.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1604, 'JLIB_MAIL_FUNCTION_DISABLED', 'The mail() function has been disabled and the mail can''t be sent.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1605, 'JLIB_MAIL_FUNCTION_OFFLINE', 'The mail function has been temporarily disabled on this site, please try again later.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1606, 'JLIB_MAIL_INVALID_EMAIL_SENDER', 'JMail: : Invalid email Sender: %s, JMail: :setSender(%s).', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1607, 'JLIB_MEDIA_ERROR_UPLOAD_INPUT', 'Unable to upload file.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1608, 'JLIB_MEDIA_ERROR_WARNFILENAME', 'File name must only contain alphanumeric characters and no spaces.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1609, 'JLIB_MEDIA_ERROR_WARNFILETOOLARGE', 'This file is too large to upload.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1610, 'JLIB_MEDIA_ERROR_WARNFILETYPE', 'This file type is not supported.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1611, 'JLIB_MEDIA_ERROR_WARNIEXSS', 'Possible IE XSS Attack found.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1612, 'JLIB_MEDIA_ERROR_WARNINVALID_IMG', 'Not a valid image.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1613, 'JLIB_MEDIA_ERROR_WARNINVALID_MIME', 'Illegal or invalid mime type detected.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1614, 'JLIB_MEDIA_ERROR_WARNNOTADMIN', 'Uploaded file is not an image file and you do not have permission.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1615, 'JLIB_PLUGIN_ERROR_LOADING_PLUGINS', 'Error loading Plugins: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1616, 'JLIB_REGISTRY_EXCEPTION_LOAD_FORMAT_CLASS', 'Unable to load format class.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1617, 'JLIB_RULES_ACTION', 'Action', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1618, 'JLIB_RULES_ALLOWED', 'Allowed', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1619, 'JLIB_RULES_ALLOWED_ADMIN', 'Allowed (Super User)', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1620, 'JLIB_RULES_CALCULATED_SETTING', 'Calculated Setting <sup>2</sup>', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1621, 'JLIB_RULES_CONFLICT', 'Conflict', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1622, 'JLIB_RULES_DENIED', 'Denied', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1623, 'JLIB_RULES_GROUP', '%s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1624, 'JLIB_RULES_GROUPS', 'Groups', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1625, 'JLIB_RULES_INHERIT', 'Inherit', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1626, 'JLIB_RULES_INHERITED', 'Inherited', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1627, 'JLIB_RULES_NOT_ALLOWED', 'Not Allowed.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1628, 'JLIB_RULES_NOT_ALLOWED_ADMIN_CONFLICT', 'Conflict', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1629, 'JLIB_RULES_NOT_ALLOWED_LOCKED', 'Not Allowed (Locked)', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1630, 'JLIB_RULES_NOT_SET', 'Not Set', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1631, 'JLIB_RULES_SELECT_ALLOW_DENY_GROUP', 'Allow or deny %s for users in the %s group.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1632, 'JLIB_RULES_SELECT_SETTING', 'Select New Setting <sup>1</sup>', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1633, 'JLIB_RULES_SETTING_NOTES', '1. If you change the setting, it will apply to this and all child groups, components and content. Note that <em>Denied</em> will overrule any inherited setting and also the setting in any child group, component or content. In the case of a setting conflict, <em>Deny</em> will take precedence. <em>Not Set</em> is equivalent to <em>Denied</em> but can be changed in child groups, components and content.<br />2. If you select a new setting, select <em>Save</em> to refresh the calculated settings.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1634, 'JLIB_RULES_SETTING_NOTES_ITEM', '1. If you change the setting, it will apply to this item. Note that:<br /><em>Inherited</em> means that the permissions from global configuration, parent group and category will be used.<br /><em>Denied</em> means that no matter what the global configuration, parent group or category settings are, the group being edited can''t take this action on this item.<br /><em>Allowed</em> means that the group being edited will be able to take this action for this item (but if this is in conflict with the global configuration, parent group or category it will have no impact; a conflict will be indicated by <em>Not Allowed (Locked)</em> under Calculated Settings).<br />2. If you select a new setting, select <em>Save</em> to refresh the calculated settings.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1635, 'JLIB_RULES_SETTINGS_DESC', 'Manage the permission settings for the user groups below. See notes at the bottom.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1636, 'JLIB_UNKNOWN', 'Unknown', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1637, 'JLIB_UPDATER_ERROR_COLLECTION_FOPEN', 'The PHP allow_url_fopen setting is disabled. This setting must be enabled for the updater to work.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1638, 'JLIB_UPDATER_ERROR_COLLECTION_OPEN_URL', 'Update: :Collection: Could not open %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1639, 'JLIB_UPDATER_ERROR_COLLECTION_PARSE_URL', 'Update: :Collection: Could not parse %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1640, 'JLIB_UPDATER_ERROR_EXTENSION_OPEN_URL', 'Update: :Extension: Could not open %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1641, 'JLIB_UPDATER_ERROR_EXTENSION_PARSE_URL', 'Update: :Extension: Could not parse %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1642, 'JLIB_UPDATER_ERROR_OPEN_UPDATE_SITE', 'Update: Could not open update site #%d &quot;%s&quot;, URL: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1643, 'JLIB_USER_ERROR_AUTHENTICATION_FAILED_LOAD_PLUGIN', 'JAuthentication: :authenticate: Failed to load plugin: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1644, 'JLIB_USER_ERROR_AUTHENTICATION_LIBRARIES', 'JAuthentication: :__construct: Could not load authentication libraries.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1645, 'JLIB_USER_ERROR_BIND_ARRAY', 'Unable to bind array to user object.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1646, 'JLIB_USER_ERROR_CANNOT_DEMOTE_SELF', 'You can''t remove your own Super User permissions.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1647, 'JLIB_USER_ERROR_CANNOT_REUSE_PASSWORD', 'You can''t reuse your current password, please enter a new password.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1648, 'JLIB_USER_ERROR_ID_NOT_EXISTS', 'JUser: :_load: User %s does not exist.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1649, 'JLIB_USER_ERROR_NOT_SUPERADMIN', 'Only users with Super User permissions can change other Super User user accounts.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1650, 'JLIB_USER_ERROR_PASSWORD_NOT_MATCH', 'Passwords do not match. Please re-enter password.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1651, 'JLIB_USER_ERROR_UNABLE_TO_FIND_USER', 'Unable to find a user with given activation string.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1652, 'JLIB_USER_ERROR_UNABLE_TO_LOAD_USER', 'JUser: :_load: Unable to load user with ID: %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1653, 'JLIB_USER_EXCEPTION_ACCESS_USERGROUP_INVALID', 'User group does not exist.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1654, 'JLIB_UTIL_ERROR_APP_INSTANTIATION', 'Application Startup Error.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1655, 'JLIB_UTIL_ERROR_CONNECT_DATABASE', 'JDatabase: :getInstance: Could not connect to database <br />joomla.library: %1$s - %2$s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1656, 'JLIB_UTIL_ERROR_DOMIT', 'DommitDocument is deprecated. Use DomDocument instead.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1657, 'JLIB_UTIL_ERROR_LOADING_FEED_DATA', 'Error loading feed data.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1658, 'JLIB_UTIL_ERROR_XML_LOAD', 'Failed loading XML file.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.ini'),
(1659, 'LIB_JOOMLA_XML_DESCRIPTION', 'The Joomla! Platform is the Core of the Joomla! Content Management System.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_joomla.sys.ini'),
(1660, 'LIB_PHPASS_XML_DESCRIPTION', 'phpass is a portable password hashing framework for use in PHP applications. The preferred (most secure) hashing method supported by phpass is the OpenBSD-style bcrypt (known in PHP as CRYPT_BLOWFISH), with a fallback to BSDI-style extended DES-based hashes (known in PHP as CRYPT_EXT_DES) and a last resort fallback to an MD5-based variable iteration count password hashing method implemented in phpass itself.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_phpass.sys.ini'),
(1661, 'LIB_PHPUTF8_XML_DESCRIPTION', 'Classes for UTF-8.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_phputf8.sys.ini'),
(1662, 'LIB_SIMPLEPIE_XML_DESCRIPTION', 'PHP based RSS and Atom Feed Framework.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.lib_simplepie.sys.ini'),
(1663, 'MOD_ARTICLES_ARCHIVE', 'Articles - Archived', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_archive.ini'),
(1664, 'MOD_ARTICLES_ARCHIVE_FIELD_COUNT_LABEL', '# of Months', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_archive.ini'),
(1665, 'MOD_ARTICLES_ARCHIVE_FIELD_COUNT_DESC', 'The number of months to display (the default is 10).', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_archive.ini'),
(1666, 'MOD_ARTICLES_ARCHIVE_XML_DESCRIPTION', 'This module shows a list of the calendar months containing archived articles. After you have changed the status of an article to archived, this list will be automatically generated.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_archive.ini'),
(1667, 'MOD_ARTICLES_ARCHIVE_DATE', '%1$s, %2$s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_archive.ini'),
(1668, 'MOD_ARTICLES_ARCHIVE', 'Articles - Archived', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_archive.sys.ini'),
(1669, 'MOD_ARTICLES_ARCHIVE_XML_DESCRIPTION', 'This module shows a list of the calendar months containing Archived Articles. After you have changed the status of an Article to Archived, this list will be automatically generated.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_archive.sys.ini'),
(1670, 'MOD_ARTICLES_ARCHIVE_LAYOUT_DEFAULT', 'Default', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_archive.sys.ini'),
(1671, 'MOD_ARTICLES_CATEGORIES', 'Articles - Categories', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_categories.ini'),
(1672, 'MOD_ARTICLES_CATEGORIES_FIELD_COUNT_DESC', 'Select the number of first level subcategories to display. Default is all.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_categories.ini'),
(1673, 'MOD_ARTICLES_CATEGORIES_FIELD_COUNT_LABEL', '# First Subcategories', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_categories.ini'),
(1674, 'MOD_ARTICLES_CATEGORIES_FIELD_MAXLEVEL_DESC', 'Select the maximum level depth for each subcategory. Default is all.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_categories.ini'),
(1675, 'MOD_ARTICLES_CATEGORIES_FIELD_MAXLEVEL_LABEL', 'Maximum Level Depth', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_categories.ini'),
(1676, 'MOD_ARTICLES_CATEGORIES_FIELD_PARENT_DESC', 'Choose a parent category.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_categories.ini'),
(1677, 'MOD_ARTICLES_CATEGORIES_FIELD_PARENT_LABEL', 'Parent Category', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_categories.ini'),
(1678, 'MOD_ARTICLES_CATEGORIES_FIELD_SHOW_CHILDREN_DESC', 'Show or hide subcategories.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_categories.ini'),
(1679, 'MOD_ARTICLES_CATEGORIES_FIELD_SHOW_CHILDREN_LABEL', 'Show Subcategories', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_categories.ini'),
(1680, 'MOD_ARTICLES_CATEGORIES_FIELD_NUMITEMS_DESC', 'Show or hide number of articles.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_categories.ini'),
(1681, 'MOD_ARTICLES_CATEGORIES_FIELD_NUMITEMS_LABEL', 'Show Number of Articles', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_categories.ini'),
(1682, 'MOD_ARTICLES_CATEGORIES_FIELD_SHOW_DESCRIPTION_DESC', 'Show or hide category descriptions.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_categories.ini'),
(1683, 'MOD_ARTICLES_CATEGORIES_FIELD_SHOW_DESCRIPTION_LABEL', 'Category Descriptions', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_categories.ini'),
(1684, 'MOD_ARTICLES_CATEGORIES_XML_DESCRIPTION', 'This module displays a list of categories from one parent category.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_categories.ini'),
(1685, 'MOD_ARTICLES_CATEGORIES_TITLE_HEADING_LABEL', 'Heading Style', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_categories.ini'),
(1686, 'MOD_ARTICLES_CATEGORIES_TITLE_HEADING_DESC', 'Set the heading style to use.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_categories.ini'),
(1687, 'MOD_ARTICLES_CATEGORIES', 'Articles - Categories', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_categories.sys.ini'),
(1688, 'MOD_ARTICLES_CATEGORIES_XML_DESCRIPTION', 'This module displays a list of categories from one parent category.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_categories.sys.ini'),
(1689, 'MOD_ARTICLES_CATEGORIES_LAYOUT_DEFAULT', 'Default', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_categories.sys.ini'),
(1690, 'MOD_ARTICLES_CATEGORY', 'Articles - Category', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1691, 'MOD_ARTICLES_CATEGORY_FIELD_ARTICLEGROUPING_DESC', 'Select how you would like the articles to be grouped.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1692, 'MOD_ARTICLES_CATEGORY_FIELD_ARTICLEGROUPING_LABEL', 'Article Grouping', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1693, 'MOD_ARTICLES_CATEGORY_FIELD_ARTICLEGROUPINGDIR_DESC', 'Select the direction you would like the Article Groupings to be ordered by.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1694, 'MOD_ARTICLES_CATEGORY_FIELD_ARTICLEGROUPINGDIR_LABEL', 'Grouping Direction', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1695, 'MOD_ARTICLES_CATEGORY_FIELD_ARTICLEORDERING_DESC', 'Select which field you would like Articles to be ordered by. Featured Ordering should only be used when Filtering Option for Featured Articles is set to ''Only''.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1696, 'MOD_ARTICLES_CATEGORY_FIELD_ARTICLEORDERING_LABEL', 'Article Field to Order By', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1697, 'MOD_ARTICLES_CATEGORY_FIELD_ARTICLEORDERINGDIR_DESC', 'Select the direction you would like Articles to be ordered by.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1698, 'MOD_ARTICLES_CATEGORY_FIELD_ARTICLEORDERINGDIR_LABEL', 'Ordering Direction', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1699, 'MOD_ARTICLES_CATEGORY_FIELD_AUTHOR_DESC', 'Select one or more authors from the list below.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1700, 'MOD_ARTICLES_CATEGORY_FIELD_AUTHOR_LABEL', 'Authors', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1701, 'MOD_ARTICLES_CATEGORY_FIELD_AUTHORALIAS_DESC', 'Select one or more author aliases from the list below.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1702, 'MOD_ARTICLES_CATEGORY_FIELD_AUTHORALIAS_LABEL', 'Author Aliases', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1703, 'MOD_ARTICLES_CATEGORY_FIELD_AUTHORALIASFILTERING_DESC', 'Select Inclusive to Include the Selected Author Aliases, Exclusive to Exclude the Selected Author Aliases.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1704, 'MOD_ARTICLES_CATEGORY_FIELD_AUTHORALIASFILTERING_LABEL', 'Author Alias Filtering Type', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1705, 'MOD_ARTICLES_CATEGORY_FIELD_AUTHORFILTERING_DESC', 'Select Inclusive to Include the Selected Authors, Exclusive to Exclude the Selected Authors.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1706, 'MOD_ARTICLES_CATEGORY_FIELD_AUTHORFILTERING_LABEL', 'Author Filtering Type', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1707, 'MOD_ARTICLES_CATEGORY_FIELD_CATDEPTH_DESC', 'The number of child category levels to return.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1708, 'MOD_ARTICLES_CATEGORY_FIELD_CATDEPTH_LABEL', 'Category Depth', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1709, 'MOD_ARTICLES_CATEGORY_FIELD_CATEGORY_DESC', 'Please select one or more categories.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1710, 'MOD_ARTICLES_CATEGORY_FIELD_CATFILTERINGTYPE_DESC', 'Select Inclusive to Include the Selected Categories, Exclusive to Exclude the Selected Categories.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1711, 'MOD_ARTICLES_CATEGORY_FIELD_CATFILTERINGTYPE_LABEL', 'Category Filtering Type', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini');
INSERT INTO `hyxu5_overrider` (`id`, `constant`, `string`, `file`) VALUES
(1712, 'MOD_ARTICLES_CATEGORY_FIELD_COUNT_DESC', 'The number of items to display. The default value of 0 will display all articles.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1713, 'MOD_ARTICLES_CATEGORY_FIELD_COUNT_LABEL', 'Count', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1714, 'MOD_ARTICLES_CATEGORY_FIELD_DATERANGEFIELD_DESC', 'Select which date field you want the date range to be applied to.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1715, 'MOD_ARTICLES_CATEGORY_FIELD_DATERANGEFIELD_LABEL', 'Date Range Field', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1716, 'MOD_ARTICLES_CATEGORY_FIELD_DATEFIELD_DESC', 'Select which date field you want to display.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1717, 'MOD_ARTICLES_CATEGORY_FIELD_DATEFIELD_LABEL', 'Date Field', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1718, 'MOD_ARTICLES_CATEGORY_FIELD_DATEFIELDFORMAT_DESC', 'Please enter in a valid date format. See: http://php.net/date for formatting information.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1719, 'MOD_ARTICLES_CATEGORY_FIELD_DATEFIELDFORMAT_LABEL', 'Date Format', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1720, 'MOD_ARTICLES_CATEGORY_FIELD_DATEFILTERING_DESC', 'Select Date Filtering Type.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1721, 'MOD_ARTICLES_CATEGORY_FIELD_DATEFILTERING_LABEL', 'Date Filtering', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1722, 'MOD_ARTICLES_CATEGORY_FIELD_ENDDATE_DESC', 'If Date Range is selected above, please enter an End Date.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1723, 'MOD_ARTICLES_CATEGORY_FIELD_ENDDATE_LABEL', 'To Date', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1724, 'MOD_ARTICLES_CATEGORY_FIELD_EXCLUDEDARTICLES_DESC', 'Please enter each Article ID on a new line.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1725, 'MOD_ARTICLES_CATEGORY_FIELD_EXCLUDEDARTICLES_LABEL', 'Article IDs to Exclude', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1726, 'MOD_ARTICLES_CATEGORY_FIELD_GROUP_DISPLAY_LABEL', 'Display Options', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1727, 'MOD_ARTICLES_CATEGORY_FIELD_GROUP_DYNAMIC_LABEL', 'Dynamic Mode Options', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1728, 'MOD_ARTICLES_CATEGORY_FIELD_GROUP_FILTERING_LABEL', 'Filtering Options', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1729, 'MOD_ARTICLES_CATEGORY_FIELD_GROUP_GROUPING_LABEL', 'Grouping Options', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1730, 'MOD_ARTICLES_CATEGORY_FIELD_GROUP_ORDERING_LABEL', 'Ordering Options', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1731, 'MOD_ARTICLES_CATEGORY_FIELD_INTROTEXTLIMIT_DESC', 'Please enter in a numeric character limit value. The introtext will be trimmed to the number of characters you enter.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1732, 'MOD_ARTICLES_CATEGORY_FIELD_INTROTEXTLIMIT_LABEL', 'Introtext Limit', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1733, 'MOD_ARTICLES_CATEGORY_FIELD_LINKTITLES_LABEL', 'Linked Titles', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1734, 'MOD_ARTICLES_CATEGORY_FIELD_LINKTITLES_DESC', 'Linked titles.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1735, 'MOD_ARTICLES_CATEGORY_FIELD_MODE_DESC', 'Please select the mode you would like to use. If Normal Mode is chosen, then simply configure the module and it will display a static list of Articles on the menu items you assign the module to. If Dynamic Mode is chosen, then you can still configure the module normally, however now the Category option will no longer be used. Instead, the module will dynamically detect whether or not you are on a Category view and will display the list of articles within that Category accordingly. When Dynamic Mode is chosen, it is best to leave the module set to display on all pages, as it will decide whether or not to display anything dynamically.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1736, 'MOD_ARTICLES_CATEGORY_FIELD_MODE_LABEL', 'Mode', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1737, 'MOD_ARTICLES_CATEGORY_FIELD_MONTHYEARFORMAT_DESC', 'Please enter in a valid date format. See: http://php.net/date for formatting information.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1738, 'MOD_ARTICLES_CATEGORY_FIELD_MONTHYEARFORMAT_LABEL', 'Month and Year Display Format', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1739, 'MOD_ARTICLES_CATEGORY_FIELD_RELATIVEDATE_DESC', 'If Relative Date is selected above, please enter in a numeric day value. Results will be retrieved relative to the current date and the value you enter.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1740, 'MOD_ARTICLES_CATEGORY_FIELD_RELATIVEDATE_LABEL', 'Relative Date', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1741, 'MOD_ARTICLES_CATEGORY_FIELD_SHOWAUTHOR_DESC', 'Select Show if you would like the author (or author alias instead, if available) to be displayed.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1742, 'MOD_ARTICLES_CATEGORY_FIELD_SHOWCATEGORY_DESC', 'Select Show if you would like the category name displayed.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1743, 'MOD_ARTICLES_CATEGORY_FIELD_SHOWCHILDCATEGORYARTICLES_DESC', 'Include or Exclude Articles from Child Categories.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1744, 'MOD_ARTICLES_CATEGORY_FIELD_SHOWCHILDCATEGORYARTICLES_LABEL', 'Child Category Articles', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1745, 'MOD_ARTICLES_CATEGORY_FIELD_SHOWDATE_DESC', 'Select Show if you would like the date displayed.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1746, 'MOD_ARTICLES_CATEGORY_FIELD_SHOWFEATURED_DESC', 'Select to Show, Hide, or Only display Featured Articles.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1747, 'MOD_ARTICLES_CATEGORY_FIELD_SHOWFEATURED_LABEL', 'Featured Articles', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1748, 'MOD_ARTICLES_CATEGORY_FIELD_SHOWHITS_DESC', 'Select Show if you would like the hits for each article to be displayed.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1749, 'MOD_ARTICLES_CATEGORY_FIELD_SHOWHITS_LABEL', 'Hits', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1750, 'MOD_ARTICLES_CATEGORY_FIELD_SHOWINTROTEXT_DESC', 'Select Show if you would like the introtext to be displayed.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1751, 'MOD_ARTICLES_CATEGORY_FIELD_SHOWINTROTEXT_LABEL', 'Introtext', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1752, 'MOD_ARTICLES_CATEGORY_FIELD_SHOWONARTICLEPAGE_DESC', 'Select to Show or hide Article List from Article Pages. This means that the module will only display itself dynamically on Category Pages.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1753, 'MOD_ARTICLES_CATEGORY_FIELD_SHOWONARTICLEPAGE_LABEL', 'Show on Article Page', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1754, 'MOD_ARTICLES_CATEGORY_FIELD_STARTDATE_DESC', 'If Date Range is selected above, please enter a Starting Date.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1755, 'MOD_ARTICLES_CATEGORY_FIELD_STARTDATE_LABEL', 'Start Date Range', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1756, 'MOD_ARTICLES_CATEGORY_OPTION_ASCENDING_VALUE', 'Ascending', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1757, 'MOD_ARTICLES_CATEGORY_OPTION_CREATED_VALUE', 'Created Date', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1758, 'MOD_ARTICLES_CATEGORY_OPTION_DATERANGE_VALUE', 'Date Range', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1759, 'MOD_ARTICLES_CATEGORY_OPTION_DESCENDING_VALUE', 'Descending', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1760, 'MOD_ARTICLES_CATEGORY_OPTION_DYNAMIC_VALUE', 'Dynamic', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1761, 'MOD_ARTICLES_CATEGORY_OPTION_EXCLUDE_VALUE', 'Exclude', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1762, 'MOD_ARTICLES_CATEGORY_OPTION_EXCLUSIVE_VALUE', 'Exclusive', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1763, 'MOD_ARTICLES_CATEGORY_OPTION_HITS_VALUE', 'Hits', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1764, 'MOD_ARTICLES_CATEGORY_OPTION_ID_VALUE', 'ID', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1765, 'MOD_ARTICLES_CATEGORY_OPTION_INCLUDE_VALUE', 'Include', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1766, 'MOD_ARTICLES_CATEGORY_OPTION_INCLUSIVE_VALUE', 'Inclusive', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1767, 'MOD_ARTICLES_CATEGORY_OPTION_MODIFIED_VALUE', 'Modified Date', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1768, 'MOD_ARTICLES_CATEGORY_OPTION_MONTHYEAR_VALUE', 'Month and Year', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1769, 'MOD_ARTICLES_CATEGORY_OPTION_NORMAL_VALUE', 'Normal', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1770, 'MOD_ARTICLES_CATEGORY_OPTION_OFF_VALUE', 'Off', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1771, 'MOD_ARTICLES_CATEGORY_OPTION_ONLYFEATURED_VALUE', 'Only', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1772, 'MOD_ARTICLES_CATEGORY_OPTION_ORDERING_VALUE', 'Article Order', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1773, 'MOD_ARTICLES_CATEGORY_OPTION_ORDERINGFEATURED_VALUE', 'Featured Articles Order', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1774, 'MOD_ARTICLES_CATEGORY_OPTION_RELATIVEDAY_VALUE', 'Relative Date', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1775, 'MOD_ARTICLES_CATEGORY_OPTION_STARTPUBLISHING_VALUE', 'Start Publishing Date', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1776, 'MOD_ARTICLES_CATEGORY_OPTION_FINISHPUBLISHING_VALUE', 'Finish Publishing Date', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1777, 'MOD_ARTICLES_CATEGORY_OPTION_YEAR_VALUE', 'Year', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1778, 'MOD_ARTICLES_CATEGORY_READ_MORE', 'Read more: ', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1779, 'MOD_ARTICLES_CATEGORY_READ_MORE_TITLE', 'Read More ...', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1780, 'MOD_ARTICLES_CATEGORY_REGISTER_TO_READ_MORE', 'Register to read more', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1781, 'MOD_ARTICLES_CATEGORY_XML_DESCRIPTION', 'This module displays a list of articles from one or more categories.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.ini'),
(1782, 'MOD_ARTICLES_CATEGORY', 'Articles - Category', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.sys.ini'),
(1783, 'MOD_ARTICLES_CATEGORY_XML_DESCRIPTION', 'This module displays a list of articles from one or more categories.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.sys.ini'),
(1784, 'MOD_ARTICLES_CATEGORY_LAYOUT_DEFAULT', 'Default', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_category.sys.ini'),
(1785, 'MOD_ARTICLES_LATEST', 'Articles - Latest', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_latest.ini'),
(1786, 'MOD_LATEST_NEWS_FIELD_CATEGORY_DESC', 'Selects Articles from one or more Categories. If no selection will show all categories as default.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_latest.ini'),
(1787, 'MOD_LATEST_NEWS_FIELD_COUNT_DESC', 'The number of Articles to display (the default is 5).', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_latest.ini'),
(1788, 'MOD_LATEST_NEWS_FIELD_COUNT_LABEL', 'Count', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_latest.ini'),
(1789, 'MOD_LATEST_NEWS_FIELD_FEATURED_DESC', 'Show or hide articles designated as featured.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_latest.ini'),
(1790, 'MOD_LATEST_NEWS_FIELD_FEATURED_LABEL', 'Featured Articles', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_latest.ini'),
(1791, 'MOD_LATEST_NEWS_FIELD_ORDERING_DESC', 'Recently Added First: order the articles using their creation date<br />Recently Modified First: order the articles using their modification date<br />Recently Published First: order the articles using their publication date.<br />Recently Touched First: order the articles using their modification or creation dates.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_latest.ini'),
(1792, 'MOD_LATEST_NEWS_FIELD_ORDERING_LABEL', 'Order', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_latest.ini'),
(1793, 'MOD_LATEST_NEWS_FIELD_USER_DESC', 'Filter by author.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_latest.ini'),
(1794, 'MOD_LATEST_NEWS_FIELD_USER_LABEL', 'Authors', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_latest.ini'),
(1795, 'MOD_LATEST_NEWS_VALUE_ADDED_BY_ME', 'Added or modified by me', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_latest.ini'),
(1796, 'MOD_LATEST_NEWS_VALUE_ANYONE', 'Anyone', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_latest.ini'),
(1797, 'MOD_LATEST_NEWS_VALUE_NOTADDED_BY_ME', 'Not added or modified by me', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_latest.ini'),
(1798, 'MOD_LATEST_NEWS_VALUE_ONLY_SHOW_FEATURED', 'Only show Featured Articles', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_latest.ini'),
(1799, 'MOD_LATEST_NEWS_VALUE_RECENT_ADDED', 'Recently Added First', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_latest.ini'),
(1800, 'MOD_LATEST_NEWS_VALUE_RECENT_MODIFIED', 'Recently Modified First', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_latest.ini'),
(1801, 'MOD_LATEST_NEWS_VALUE_RECENT_RAND', 'Random Articles', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_latest.ini'),
(1802, 'MOD_LATEST_NEWS_VALUE_RECENT_PUBLISHED', 'Recently Published First', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_latest.ini'),
(1803, 'MOD_LATEST_NEWS_VALUE_RECENT_TOUCHED', 'Recently Touched First', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_latest.ini'),
(1804, 'MOD_LATEST_NEWS_XML_DESCRIPTION', 'This module shows a list of the most recently published and current Articles. Some that are shown may have expired even though they are the most recent.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_latest.ini'),
(1805, 'MOD_ARTICLES_LATEST', 'Articles - Latest', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_latest.sys.ini'),
(1806, 'MOD_LATEST_NEWS_XML_DESCRIPTION', 'This module shows a list of the most recently published and current Articles. Some that are shown may have expired even though they are the most recent.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_latest.sys.ini'),
(1807, 'MOD_ARTICLES_LATEST_LAYOUT_DEFAULT', 'Default', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_latest.sys.ini'),
(1808, 'MOD_ARTICLES_NEWS', 'Articles - Newsflash', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_news.ini'),
(1809, 'MOD_ARTICLES_NEWS_FIELD_CATEGORY_DESC', 'Select Articles from a specific Category or a set of Categories. If no selection will show all categories as default.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_news.ini'),
(1810, 'MOD_ARTICLES_NEWS_FIELD_IMAGES_DESC', 'Display Article images.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_news.ini'),
(1811, 'MOD_ARTICLES_NEWS_FIELD_IMAGES_LABEL', 'Show Images', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_news.ini'),
(1812, 'MOD_ARTICLES_NEWS_FIELD_ITEMS_DESC', 'The number of Articles to display within this module.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_news.ini'),
(1813, 'MOD_ARTICLES_NEWS_FIELD_ITEMS_LABEL', 'Number of Articles', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_news.ini'),
(1814, 'MOD_ARTICLES_NEWS_FIELD_LINKTITLE_DESC', 'Link the Article titles to Articles.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_news.ini'),
(1815, 'MOD_ARTICLES_NEWS_FIELD_LINKTITLE_LABEL', 'Linked Titles', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_news.ini'),
(1816, 'MOD_ARTICLES_NEWS_FIELD_ORDERING_DESC', 'Select the order in which you want query results presented.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_news.ini'),
(1817, 'MOD_ARTICLES_NEWS_FIELD_ORDERING_LABEL', 'Order Results', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_news.ini'),
(1818, 'MOD_ARTICLES_NEWS_FIELD_ORDERING_CREATED_DATE', 'Created Date', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_news.ini'),
(1819, 'MOD_ARTICLES_NEWS_FIELD_ORDERING_PUBLISHED_DATE', 'Published Date', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_news.ini'),
(1820, 'MOD_ARTICLES_NEWS_FIELD_ORDERING_ORDERING', 'Ordering', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_news.ini'),
(1821, 'MOD_ARTICLES_NEWS_FIELD_ORDERING_RANDOM', 'Random', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_news.ini'),
(1822, 'MOD_ARTICLES_NEWS_FIELD_READMORE_DESC', 'If set to Show, the ''Read more ...'' link will show if Main text has been provided for an Article.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_news.ini'),
(1823, 'MOD_ARTICLES_NEWS_FIELD_READMORE_LABEL', '''Read more ...'' Link', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_news.ini'),
(1824, 'MOD_ARTICLES_NEWS_FIELD_SEPARATOR_DESC', 'Show separator after last Article.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_news.ini'),
(1825, 'MOD_ARTICLES_NEWS_FIELD_SEPARATOR_LABEL', 'Show Last Separator', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_news.ini'),
(1826, 'MOD_ARTICLES_NEWS_FIELD_TITLE_DESC', 'Show or hide the Article title.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_news.ini'),
(1827, 'MOD_ARTICLES_NEWS_FIELD_TITLE_LABEL', 'Show Article Title', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_news.ini'),
(1828, 'MOD_ARTICLES_NEWS_READMORE', 'Read more ...', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_news.ini'),
(1829, 'MOD_ARTICLES_NEWS_READMORE_REGISTER', 'Register to Read More', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_news.ini'),
(1830, 'MOD_ARTICLES_NEWS_TITLE_HEADING', 'Header Level', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_news.ini'),
(1831, 'MOD_ARTICLES_NEWS_TITLE_HEADING_DESCRIPTION', 'Select the desired HTML header level for the Article titles.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_news.ini'),
(1832, 'MOD_ARTICLES_NEWS_XML_DESCRIPTION', 'The Article Newsflash Module will display a fixed number of Articles from a specific Category or a set of Categories.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_news.ini'),
(1833, 'MOD_ARTICLES_NEWS', 'Articles - Newsflash', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_news.sys.ini'),
(1834, 'MOD_ARTICLES_NEWS_XML_DESCRIPTION', 'The Newsflash Module will display a fixed number of articles from a specific category.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_news.sys.ini'),
(1835, 'MOD_ARTICLES_NEWS_LAYOUT_DEFAULT', 'Default', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_news.sys.ini'),
(1836, 'MOD_ARTICLES_POPULAR', 'Articles - Most Read', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_popular.ini'),
(1837, 'MOD_POPULAR_FIELD_CATEGORY_DESC', 'Select Articles from a specific Category or a set of Categories. If no selection will show all categories as default.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_popular.ini'),
(1838, 'MOD_POPULAR_FIELD_COUNT_DESC', 'The number of Articles to display (the default is 5).', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_popular.ini'),
(1839, 'MOD_POPULAR_FIELD_COUNT_LABEL', 'Count', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_popular.ini'),
(1840, 'MOD_POPULAR_FIELD_FEATURED_DESC', 'Show or hide Articles designated as Featured.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_popular.ini'),
(1841, 'MOD_POPULAR_FIELD_FEATURED_LABEL', 'Featured Articles', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_popular.ini'),
(1842, 'MOD_POPULAR_XML_DESCRIPTION', 'This module shows a list of the currently published Articles which have the highest number of page views.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_popular.ini'),
(1843, 'MOD_POPULAR_FIELD_DATEFIELD_DESC', 'Select which date field you want the date filter to be applied to.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_popular.ini'),
(1844, 'MOD_POPULAR_FIELD_DATEFIELD_LABEL', 'Date Field', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_popular.ini'),
(1845, 'MOD_POPULAR_FIELD_DATEFILTERING_DESC', 'Select Date Filtering Type.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_popular.ini'),
(1846, 'MOD_POPULAR_FIELD_DATEFILTERING_LABEL', 'Date Filtering', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_popular.ini'),
(1847, 'MOD_POPULAR_FIELD_ENDDATE_DESC', 'If Date Range is selected above, please enter an End Date.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_popular.ini'),
(1848, 'MOD_POPULAR_FIELD_ENDDATE_LABEL', 'End Date', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_popular.ini'),
(1849, 'MOD_POPULAR_FIELD_STARTDATE_DESC', 'If Date Range is selected above, please enter a Starting Date.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_popular.ini'),
(1850, 'MOD_POPULAR_FIELD_STARTDATE_LABEL', 'Start Date Range', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_popular.ini'),
(1851, 'MOD_POPULAR_FIELD_RELATIVEDATE_DESC', 'If Relative Date is selected above, please enter a numeric day value. Results will be retrieved relative to the current date and the value you enter.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_popular.ini'),
(1852, 'MOD_POPULAR_FIELD_RELATIVEDATE_LABEL', 'Relative Date', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_popular.ini'),
(1853, 'MOD_POPULAR_OPTION_CREATED_VALUE', 'Created Date', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_popular.ini'),
(1854, 'MOD_POPULAR_OPTION_DATERANGE_VALUE', 'Date Range', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_popular.ini'),
(1855, 'MOD_POPULAR_OPTION_MODIFIED_VALUE', 'Modified Date', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_popular.ini'),
(1856, 'MOD_POPULAR_OPTION_OFF_VALUE', 'Off', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_popular.ini'),
(1857, 'MOD_POPULAR_OPTION_RELATIVEDAY_VALUE', 'Relative Date', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_popular.ini'),
(1858, 'MOD_POPULAR_OPTION_STARTPUBLISHING_VALUE', 'Start Publishing Date', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_popular.ini'),
(1859, 'MOD_ARTICLES_POPULAR', 'Articles - Most Read', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_popular.sys.ini'),
(1860, 'MOD_POPULAR_XML_DESCRIPTION', 'This module shows a list of the currently published Articles which have the highest number of page views.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_popular.sys.ini'),
(1861, 'MOD_ARTICLES_POPULAR_LAYOUT_DEFAULT', 'Default', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_articles_popular.sys.ini'),
(1862, 'COM_BANNERS_NO_CLIENT', '- No client -', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_banners.ini'),
(1863, 'MOD_BANNERS', 'Banners', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_banners.ini'),
(1864, 'MOD_BANNERS_BANNER', 'Banner', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_banners.ini'),
(1865, 'MOD_BANNERS_FIELD_BANNERCLIENT_DESC', 'Select banners only from a single client.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_banners.ini'),
(1866, 'MOD_BANNERS_FIELD_BANNERCLIENT_LABEL', 'Client', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_banners.ini'),
(1867, 'MOD_BANNERS_FIELD_CACHETIME_DESC', 'The time before the module is recached.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_banners.ini'),
(1868, 'MOD_BANNERS_FIELD_CACHETIME_LABEL', 'Cache Time', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_banners.ini'),
(1869, 'MOD_BANNERS_FIELD_CATEGORY_DESC', 'Select banners from a specific Category or a set of Categories. If no selection then it will show all categories as default.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_banners.ini'),
(1870, 'MOD_BANNERS_FIELD_COUNT_DESC', 'The number of banners to display (default 5).', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_banners.ini'),
(1871, 'MOD_BANNERS_FIELD_COUNT_LABEL', 'Count', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_banners.ini'),
(1872, 'MOD_BANNERS_FIELD_FOOTER_DESC', 'Text or HTML to display after the group of banners.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_banners.ini'),
(1873, 'MOD_BANNERS_FIELD_FOOTER_LABEL', 'Footer Text', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_banners.ini'),
(1874, 'MOD_BANNERS_FIELD_HEADER_DESC', 'Text or HTML to display before the group of banners.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_banners.ini'),
(1875, 'MOD_BANNERS_FIELD_HEADER_LABEL', 'Header Text', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_banners.ini'),
(1876, 'MOD_BANNERS_FIELD_RANDOMISE_DESC', 'Randomise the ordering of the banners.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_banners.ini'),
(1877, 'MOD_BANNERS_FIELD_RANDOMISE_LABEL', 'Randomise', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_banners.ini'),
(1878, 'MOD_BANNERS_FIELD_TAG_DESC', 'Banner is selected by matching the banner tags to the current document meta keywords.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_banners.ini'),
(1879, 'MOD_BANNERS_FIELD_TAG_LABEL', 'Search by Meta Keyword', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_banners.ini'),
(1880, 'MOD_BANNERS_FIELD_TARGET_DESC', 'Target window when the link is selected.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_banners.ini'),
(1881, 'MOD_BANNERS_FIELD_TARGET_LABEL', 'Target', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_banners.ini'),
(1882, 'MOD_BANNERS_VALUE_STICKYORDERING', 'Pinned, Ordering', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_banners.ini'),
(1883, 'MOD_BANNERS_VALUE_STICKYRANDOMISE', 'Pinned, Randomise', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_banners.ini'),
(1884, 'MOD_BANNERS_XML_DESCRIPTION', 'The Banner Module displays the active Banners from the Component.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_banners.ini'),
(1885, 'MOD_BANNERS', 'Banners', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_banners.sys.ini'),
(1886, 'MOD_BANNERS_XML_DESCRIPTION', 'The Banner Module displays the active Banners from the Component.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_banners.sys.ini'),
(1887, 'MOD_BANNERS_LAYOUT_DEFAULT', 'Default', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_banners.sys.ini'),
(1888, 'MOD_BM_COOL_MENU', 'Menu', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(1889, 'MOD_BM_COOL_MENU_FIELD_ACTIVE_DESC', 'BM Cool Menu help you show menu with many configs for color. You can config almost color on menu (text, background, active background, border). Visit our website <a href=''http://www.brainymore.com'' target=''_blank''>Brainymore.com</a> to see our new products.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(1890, 'MOD_BM_COOL_MENU_FIELD_ACTIVE_LABEL', 'Base Item', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(1891, 'MOD_BM_COOL_MENU_FIELD_ALLCHILDREN_DESC', 'Expand the menu and make its sub-menu items always visible.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(1892, 'MOD_BM_COOL_MENU_FIELD_ALLCHILDREN_LABEL', 'Show Sub-menu Items', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(1893, 'MOD_BM_COOL_MENU_FIELD_CLASS_DESC', 'A suffix to be applied to the CSS class of the menu items', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(1894, 'MOD_BM_COOL_MENU_FIELD_CLASS_LABEL', 'Menu Class Suffix', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(1895, 'MOD_BM_COOL_MENU_FIELD_ENDLEVEL_DESC', 'Level to stop rendering the menu at. If you choose ''All'', all levels will be shown depending on ''Show Sub-menu Items'' setting.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(1896, 'MOD_BM_COOL_MENU_FIELD_ENDLEVEL_LABEL', 'End Level', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(1897, 'MOD_BM_COOL_MENU_FIELD_MENUTYPE_DESC', 'Select a menu in the list', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(1898, 'MOD_BM_COOL_MENU_FIELD_MENUTYPE_LABEL', 'Select Menu', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(1899, 'MOD_BM_COOL_MENU_FIELD_STARTLEVEL_DESC', 'Level to start rendering the menu at. Setting the start and end levels to the same # and setting ''Show Sub-menu Items'' to yes will only display that single level.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(1900, 'MOD_BM_COOL_MENU_FIELD_STARTLEVEL_LABEL', 'Start Level', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(1901, 'MOD_BM_COOL_MENU_FIELD_TAG_ID_DESC', 'An ID attribute to assign to the root UL tag of the menu (optional)', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(1902, 'MOD_BM_COOL_MENU_FIELD_TAG_ID_LABEL', 'Menu Tag ID', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(1903, 'MOD_BM_COOL_MENU_FIELD_TARGET_DESC', 'JavaScript values to position a popup window, e.g. top=50,left=50,width=200,height=300', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(1904, 'MOD_BM_COOL_MENU_FIELD_TARGET_LABEL', 'Target Position', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(1905, 'MOD_BM_COOL_MENU_XML_DESCRIPTION', 'BM Cool Menu help you show menu with many configs for color. You can config almost color on menu (text, background, active background, border). Visit our website <a href=''http://www.brainymore.com'' target=''_blank''>Brainymore.com</a> to see our new products.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(1906, 'MOD_BM_TEXT_COLOR', 'Text color', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(1907, 'MOD_BM_TEXT_COLOR_DESC', 'Color for text', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(1908, 'MOD_BM_TEXT_HOVER_COLOR', 'Hover text color', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(1909, 'MOD_BM_TEXT_HOVER_COLOR_DESC', 'Color for text when hover menu item', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(1910, 'MOD_BM_BACKGROUND_COLOR', 'Menu''s background', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(1911, 'MOD_BM_BACKGROUND_COLOR_DESC', 'Background for menu', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(1912, 'MOD_BM_BACKGROUND_IMAGE', 'Background image', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(1913, 'MOD_BM_BACKGROUND_IMAGE_DESC', 'You can config css (background-image) for menu. <br> Fomart:<br>\nbackground-image: -moz-linear-gradient(#2B547E, #2B3856);<br> \nbackground-image: -webkit-gradient(linear, left top, left bottom, from(#2B547E), to(#2B3856));<br>	\nbackground-image: -webkit-linear-gradient(#2B547E, #2B3856);<br>	\nbackground-image: -o-linear-gradient(#2B547E, #2B3856);<br>\nbackground-image: -ms-linear-gradient(#2B547E, #2B3856);<br>\nbackground-image: linear-gradient(#2B547E, #2B3856);', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(1914, 'MOD_BM_SHOW_BORDER', 'Show border', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(1915, 'MOD_BM_SHOW_BORDER_DESC', 'Show border or not', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(1916, 'MOD_BM_BORDER_RADIUS', 'Border radius', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(1917, 'MOD_BM_BORDER_RADIUS_DESC', 'Config border radius (1px,2px ...)', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(1918, 'MOD_BM_BORDER_COLOR', 'Border color', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(1919, 'MOD_BM_BORDER_COLOR_DESC', 'Set color for border', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(1920, 'MOD_BM_BACKGROUND_COLOR_ACTIVE', 'Active background', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(1921, 'MOD_BM_BACKGROUND_COLOR_ACTIVE_DESC', 'Background color for active item', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(1922, 'MOD_BM_JQUERY', 'Load jQuery', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(1923, 'MOD_BM_JQUERY_DESC', 'Load jQuery or not', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(1924, 'MOD_BM_COOL_MENU', 'Menu', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bm_cool_menu.sys.ini'),
(1925, 'MOD_BM_COOL_MENU_XML_DESCRIPTION', 'BM Cool Menu help you show menu with many configs for color. You can config almost color on menu (text, background, active background, border). Visit our website <a href=''http://www.brainymore.com'' target=''_blank''>Brainymore.com</a> to see our new products.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bm_cool_menu.sys.ini'),
(1926, 'MOD_BM_COOL_MENU_LAYOUT_DEFAULT', 'Default', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bm_cool_menu.sys.ini'),
(1927, 'MOD_BREADCRUMBS', 'Breadcrumbs', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_breadcrumbs.ini'),
(1928, 'MOD_BREADCRUMBS_FIELD_HOMETEXT_DESC', 'This text will be shown as Home entry. If the field is left empty, it will use the default value from the mod_breadcrumbs.ini language file.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_breadcrumbs.ini'),
(1929, 'MOD_BREADCRUMBS_FIELD_HOMETEXT_LABEL', 'Text for Home Entry', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_breadcrumbs.ini'),
(1930, 'MOD_BREADCRUMBS_FIELD_SEPARATOR_DESC', 'A text separator.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_breadcrumbs.ini'),
(1931, 'MOD_BREADCRUMBS_FIELD_SEPARATOR_LABEL', 'Text Separator', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_breadcrumbs.ini'),
(1932, 'MOD_BREADCRUMBS_FIELD_SHOWHERE_DESC', 'Show or hide &quot;You are here&quot; text in the pathway.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_breadcrumbs.ini'),
(1933, 'MOD_BREADCRUMBS_FIELD_SHOWHERE_LABEL', 'Show &quot;You are here&quot;', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_breadcrumbs.ini'),
(1934, 'MOD_BREADCRUMBS_FIELD_SHOWHOME_DESC', 'Show or hide the Home element in the pathway.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_breadcrumbs.ini'),
(1935, 'MOD_BREADCRUMBS_FIELD_SHOWHOME_LABEL', 'Show Home', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_breadcrumbs.ini'),
(1936, 'MOD_BREADCRUMBS_FIELD_SHOWLAST_DESC', 'Show or hide the last element in the pathway.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_breadcrumbs.ini'),
(1937, 'MOD_BREADCRUMBS_FIELD_SHOWLAST_LABEL', 'Show Last', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_breadcrumbs.ini'),
(1938, 'MOD_BREADCRUMBS_HERE', 'You are here: ', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_breadcrumbs.ini'),
(1939, 'MOD_BREADCRUMBS_HOME', 'Home', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_breadcrumbs.ini'),
(1940, 'MOD_BREADCRUMBS_XML_DESCRIPTION', 'This module displays the Breadcrumbs.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_breadcrumbs.ini'),
(1941, 'MOD_BREADCRUMBS', 'Breadcrumbs', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_breadcrumbs.sys.ini'),
(1942, 'MOD_BREADCRUMBS_XML_DESCRIPTION', 'This module displays the Breadcrumbs.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_breadcrumbs.sys.ini'),
(1943, 'MOD_BREADCRUMBS_LAYOUT_DEFAULT', 'Default', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_breadcrumbs.sys.ini'),
(1944, 'BT_CREATEDON', 'Created on %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1945, 'BT_CREATEDBY', 'Written by %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1946, 'READ_MORE', 'Read more', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1947, 'YESNO_IMAGE', 'modules/mod_bt_contentslider/admin/images/switcher-yesno.png', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1948, 'GLOBALSETTING', 'Global setting', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1949, 'OPTION_LEFT', 'Left', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1950, 'OPTION_RIGHT', 'Right', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1951, 'OPTION_CENTER', 'Center', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1952, 'OPTION_AUTO', 'Auto', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1953, 'OPTION_LINK', 'Link', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1954, 'OPTION_IMAGE', 'Image', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1955, 'OPTION_BOLD', 'Bold', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1956, 'OPTION_ITALIC', 'Italic', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1957, 'OPTION_FONT', 'Font', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1958, 'OPTION_NEWLINE', 'Newline', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1959, 'OPTION_NEW_WINDOW', 'New window', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1960, 'OPTION_PARENT_WINDOW', 'Parent window', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1961, 'OPTION_SLIDE', 'Slide', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1962, 'OPTION_FADE', 'Fade', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1963, 'EFFECT_SETTING', 'Effect Setting', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1964, 'ITEM_LAYOUT_SETTING', 'Item Layout Setting', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1965, 'AUTO_ADJUST_HEIGHT', 'Auto adjust height', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1966, 'AUTO_ADJUST_HEIGHT_DESC', 'Auto adjust height effect.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1967, 'EQUAL_HEIGHT', 'Equal height', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1968, 'EQUAL_HEIGHT_DESC', 'Titles/descriptions will have the same height', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1969, 'MODULE_CLASS_SUFFIX', 'Module class suffix', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1970, 'MODULE_CLASS_SUFFIX_DESC', 'Module class suffix', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1971, 'NEXT_BACK', 'Next Back', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1972, 'NEXT_BACK_DESC', 'Show or hide next back buttons', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1973, 'MODULE_WIDTH', 'Module Width', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1974, 'MODULE_WIDTH_DESC', 'Set the height of the module  in the numeric or ''auto'' ', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1975, 'MODULE_HEIGHT', 'Module Height', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1976, 'MODULE_HEIGHT_DESC', 'Set the height of the module in the numeric or ''auto''.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1977, 'ITEMS_PER_COLS', 'Number of Rows', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1978, 'ITEMS_PER_COLS_DESC', 'Number of Rows', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1979, 'ITEMS_PER_ROWS', 'Number of Cols', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1980, 'ITEMS_PER_ROWS_DESC', 'Number of Cols', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1981, 'SOURCE_SETTING', 'Source Setting', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1982, 'SOURCE_FROM', 'Source From', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1983, 'SOURCE_FROM_DESC', 'Choose a source to get the list of articles', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1984, 'CATEGORY', 'Joomla Categories', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1985, 'ARTICLES_IDS', 'Joomla Article IDs', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1986, 'K2_CATEGORY', 'K2 Categories', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1987, 'K2_ARTICLES_IDS', 'K2 Article IDs', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1988, 'ARTICLES_IDS_DESC', 'Put ID of Articles with format: id1, id2, id3 (1,2,3)', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1989, 'K2_ARTICLES_IDS_DESC', 'Put ID of K2 Articles with format: id1, id2, id3 (1,2,3)', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1990, 'CONTENT_CATEGORY', 'Joomla Categories', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1991, 'CONTENT_CATEGORY_DESC', 'Joomla Categories', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1992, 'COM_CONTENT_CREATED_DATE_ON', 'Created on %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1993, 'COM_CONTENT_WRITTEN_BY', 'Written by %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1994, 'K2_CATEGORIES', 'K2 Categories', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1995, 'K2CATEGORIES_DESC', 'K2 Categories', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1996, 'LIMIT_ITEMS', 'Number of Articles', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1997, 'LIMIT_ITEMS_DESC', 'Number of Articles', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1998, 'USER_FILTER', 'Filter By author', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(1999, 'USER_FILTER_DESC', 'Filter By Author', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2000, 'USER_ADDED_BY_ME', 'Added or modified by logged user', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2001, 'USER_ANYONE', 'Anyone', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2002, 'USER_NOTADDED_BY_ME', 'Not added or modified by logged user', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2003, 'SHOW_FEATURED_DESC', 'Show/Hide Articles designated as Featured', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2004, 'SHOW_FEATURED', 'Featured Articles', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2005, 'ONLY_SHOW_FEATURED', 'Only show Featured Articles', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2006, 'ARTCILES_SORTED_BY', 'Articles Sorted By', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2007, 'ARTCILES_SORTED_BY_DESC', 'Choose one of conditions to sort the list of articles. "Featured ordering" is only available with Joomla Content and ''Only show Featured Articles'' value', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2008, 'SHOW_TITLE', 'Show Title', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2009, 'SHOW_TITLE_DESC', 'Show Title', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2010, 'LIMIT_TITLE_BY', 'Limit Title By', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2011, 'LIMIT_TITLE_BY_DESC', 'Limit Title by Words or Characters', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2012, 'TITLE_MAX_CHARS', 'Title Max Chars', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2013, 'TITLE_MAX_CHARS_DESC', 'In the Title Enter Maximum Characters display', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2014, 'SHOW_INTRO', 'Show Intro Text', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2015, 'SHOW_INTRO_DESC', 'Show Intro Text', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2016, 'SHOW_AUTHOR', 'Show Author', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2017, 'SHOW_AUTHOR_DESC', 'Show Author', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2018, 'SHOW_CATEGORY_NAME', 'Show Category Name', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2019, 'SHOW_CATEGORY_NAME_DESC', 'Show Category Name', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2020, 'SHOW_CATEGORY_NAME_AS_LINK', 'Show Category Name As Link', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2021, 'SHOW_CATEGORY_NAME_AS_LINK_DESC', 'Show Category Name As Link', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2022, 'LIMIT_DESCRIPTION_BY', 'Limit Description By', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2023, 'LIMIT_DESCRIPTION_BY_DESC', 'Limit description by Words or Characters', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2024, 'DESCRIPTION_MAX_CHARS', 'Description Max Chars', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2025, 'DESCRIPTION_MAX_CHARS_DESC', 'In the Description Enter Maximum Characters display', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2026, 'SHOW_READ_MORE', 'Show Read More', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2027, 'SHOW_READ_MORE_DESC', 'Whether allow to Show Read More', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2028, 'SHOW_DATE', 'Show Date', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2029, 'SHOW_DATE_DESC', 'Whether allow to Show the Date Creation', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2030, 'WORD', 'Word', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2031, 'CHARACTER', 'Character', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2032, 'GIRD_SETTING', '<h3><span>Grid Setting</span></h3>', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2033, 'IMAGE_OPTION', '<h3><span>Image Option</span></h3>', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2034, 'TITLE_OPTION', '<h3><span>Title Option</span></h3>', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini');
INSERT INTO `hyxu5_overrider` (`id`, `constant`, `string`, `file`) VALUES
(2035, 'INTRO_TEXT_OPTION', '<h3><span>Intro Text Option</span></h3>', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2036, 'NAVIGATION_SETTING', '<h3><span>Navigation Setting</span></h3>', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2037, 'SHOW_IMAGE', 'Show Image', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2038, 'SHOW_IMAGE_DESC', 'Grab the first image from the post and show it', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2039, 'IMAGE_THUMB', 'Auto Generate Thumbnail', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2040, 'IMAGE_THUMB_DESC', 'Auto Generate Thumbnail', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2041, 'THUMBNAIL_WIDTH', 'Thumbnail width', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2042, 'THUMBNAIL_WIDTH_DESC', 'Enter the width of thumbnail in the numeric', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2043, 'THUMBNAIL_HEIGHT', 'Thumbnail height', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2044, 'THUMBNAIL_HEIGHT_DESC', 'Enter the height of thumbnail in the numeric', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2045, 'HORIZONTAL_RIGHT_TO_LEFT', 'Horizontal righ to left', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2046, 'HORIZONTAL_LEFT_TO_RIGHT', 'Horizontal left to right', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2047, 'VERTICAL_DOWN_TO_UP', 'Vertical down to up', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2048, 'VERTICAL_UP_TO_DOWN', 'Vertical up to down', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2049, 'OPACITY', 'Opacity', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2050, 'INTERVAL', 'Interval', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2051, 'INTERVAL_DESC', 'Set period of time to allow the module playing.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2052, 'ANIMATION_DURATION', 'Animation duration', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2053, 'ANIMATION_DURATION_DESC', 'Animation duration', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2054, 'ANIMATION_TRANSITION', 'Animation Transition', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2055, 'ANIMATION_TRANSITION_DESC', 'Animation Transitions', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2056, 'PLAY_STYLE', 'Play Style', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2057, 'PLAY_STYLE_DESC', 'The module animate with a play style you choosed', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2058, 'PAGE_ANIMATION_TRANSITION', 'Page Animation Transition', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2059, 'PAGE_ANIMATION_TRANSITION_DESC', 'Choose a animation for playing effect in page', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2060, 'AUTO_START', 'Auto Start', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2061, 'AUTO_START_DESC', 'Whether to allow the module auto start', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2062, 'STRIP_TAGS', 'Strip Tags', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2063, 'STRIP_TAGS_DESC', 'Strip Tags', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2064, 'CREATION_DATE_ASCENDING', 'Creation Date - Asc', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2065, 'CREATION_DATE_DESCENDING', 'Creation Date - Desc', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2066, 'SALES_ASCENDING', 'Sales - Asc', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2067, 'SALES_DESCENDING', 'Sales - Desc', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2068, 'ONLY_FEATURED_ITEMS', 'Only Featured Items', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2069, 'ID_ASCENDING', 'ID - Asc', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2070, 'ID_DESCENDING', 'ID - Desc', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2071, 'PUBLISHED_DATE_ASCENDING', 'Published - Asc', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2072, 'PUBLISHED_DATE_DESCENDING', 'Published - Desc', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2073, 'ORDERING_ASCENDING', 'Ordering - Asc', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2074, 'ORDERING_DESCENDING', 'Ordering - Desc', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2075, 'HIT_ASCENDING', 'Hits - Asc', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2076, 'HIT_DESCENDING', 'Hits - Desc', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2077, 'DATE_DESCENDING', 'Date - Desc', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2078, 'DATE_ASCENDING', 'Date - Asc', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2079, 'FEATURED_ORDERING', 'Featured ordering', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2080, 'RANDOM', 'Random', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2081, 'CLICK_LINK_OPEN_IN', 'Open Link In', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2082, 'CLICK_LINK_OPEN_IN_DESC', 'Set the target open the link', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2083, 'IMAGE_ALIGN', 'Alignment of image', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2084, 'IMAGE_ALIGN_DESC', 'Set alignment for thumbnail images. Equal-Height is recommended to enable with ''center'' value', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2085, 'CONTENT_TITLE', 'Content title', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2086, 'CONTENT_TITLE_DESC', 'Enter the title of content', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2087, 'CONTENT_LINK', 'Content link', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2088, 'CONTENT_LINK_DESC', 'Enter the link of content title', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2089, 'NAVIGATION_TOP', 'Move top', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2090, 'NAVIGATION_RIGHT', 'Move right', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2091, 'NAVIGATION_TOP_DESC', 'Move Navigation bar to the top - This value can be negative number (pixel)', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2092, 'NAVIGATION_RIGHT_DESC', 'Move Navigation bar to the right - This value can be negative number (pixel)', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2093, 'NEXT_BACK_EFFECT_LABEL', 'Next back effect', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2094, 'NEXT_BACK_EFFECT_DESC', 'Set effect slide or fade for next/back', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2095, 'BULLET_EFFECT_LABEL', 'Navigation effect', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2096, 'BULLET_EFFECT_DESC', 'Set effect slide or fade for navigation', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2097, 'PAUSE_HOVER_LABEL', 'Pause hover', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2098, 'PAUSE_HOVER_DESC', 'Pause slider on mouse over', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2099, 'IMAGE_THUMB_EFFECT', 'Image Mouseover Effect', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2100, 'IMAGE_THUMB_EFFECT_DESC', 'On mouse hover, the thumbnail image will fade out to 50% opacity smoothly', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2101, 'BT_PORTFOLIO_CATEGORY', 'BT Portfolio Categories', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2102, 'BT_PORTFOLIO_ARTICLE', 'Bt Portfolio Articles', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2103, 'ALLOW_TAGS', 'Allow tags', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2104, 'ALLOW_TAGS_DESC', 'Selected html tags will be not striped from content', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2105, 'DEFAULT_THUMB', 'Default thumbnail', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2106, 'DEFAULT_THUMB_DESC', 'If thumbnail image is not available, default will be display instead of', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2107, 'CHECK_IMAGE_EXIST', 'Check existing image', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2108, 'CHECK_IMAGE_EXIST_DESC', 'Turn off this option for faster module', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2109, 'BT_LOADJQUERY', 'Load JQuery', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2110, 'BT_LOADJQUERY_DESC', 'Prevent conflict js', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2111, 'BT_LOADCSS', 'Load default css', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2112, 'BT_LOADCSS_DESC', 'Load default css for module', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2113, 'IMAGES_LINKS_OPTION', '<h3><span>Images and links</span></h3>', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2114, 'IMAGES_LINKS_OPTION_DESC', 'Joomla content only', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2115, 'USE_INTROIMG', 'Use intro image', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2116, 'USE_INTROIMG_DESC', 'Use intro image instead of inner content images if it''s available', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2117, 'USE_CAPTION', 'Use caption', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2118, 'USE_CAPTION_DESC', 'Use intro image caption instead of article introtext if it''s available', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2119, 'USE_LINKA', 'Use link A', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2120, 'USE_LINKA_DESC', 'Use link A instead of article link if it''s available', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2121, 'AUTO_CATEGORY', 'Auto-detect category', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2122, 'AUTO_CATEGORY_DESC', 'Category filter will be selected by current page (Caching option of this module should be turn off if you want this feature works normally)', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2123, 'CONTENT_PLUGIN', 'Run content plugin', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2124, 'CHECKIMG_FULLTEXT', 'Grab img in fulltext', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2125, 'CHECKIMG_FULLTEXT_DESC', 'Turn off this option for faster module', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2126, 'LIMIT_ITEMS_FOR_EACH', 'Limit for each', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2127, 'LIMIT_ITEMS_FOR_EACH_DESC', 'Get items with limit number above for each category if you choose Yes and for all if you choose No.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2128, 'CONTENT_PLUGIN_DESC', 'Run content plugins on content prepare for introtext', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2129, 'MODALBOX_EFFECT', 'Image ModalBox Effect', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2130, 'MODALBOX_EFFECT_DESC', 'When clicking to thumbnail, the modal box will be shown with full image', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2131, 'NAVIGATION_BAR', 'Navigation bar', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2132, 'NAVIGATION_BAR_DESC', 'Navigation bar(Bullet or numbering navigation)', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2133, 'BULLET', 'Bullet', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2134, 'NUMBERING', 'Numbering', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2135, 'TOUCH_SCREEN_LABEL', 'Touchscreen', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2136, 'EASYBLOG_CATEGORY', 'EasyBlog Category', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2137, 'EASYBLOG_ARTICLE', 'EasyBlog Post ID', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2138, 'TOUCH_SCREEN_DESC', 'Support drag and swipe for Androids and IOS', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2139, 'SUB_CATEGORIES', 'Sub Categories', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2140, 'SUB_CATEGORIES_DESC', 'Get items from sub categories. This option follows <b>Auto-detect category</b>', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2141, 'EXCLUDE_CATEGORIES', 'Exclude Categories', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2142, 'EXCLUDE_CATEGORIES_DESC', 'Enter excluded categories'' id. Separator is comma. Example 1,2,3.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2143, 'IMAGE_QUALITY', 'Image Quality', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2144, 'IMAGE_QUALITY_DESC', 'Ranges from 0 (worst quality, smaller file) to 100 (best quality, biggest file). 80 is recommended', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2145, 'JOOMLA_TAGS', 'Joomla Tags', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2146, 'JOOMLA_TAGS_DESC', 'Choose tags that you want to use to get articles', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2147, 'ERROR_CURRENT_VERSION_DOES_NOT_SUPPORT_TAGS_COMPONENT', 'Current Joomla version doesn''t support tags', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2148, 'K2_TAGS', 'K2 Tags', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2149, 'K2_TAGS_DESC', 'Choose tags that you want to use to get articles', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2150, 'K2_IS_NOT_ENABLED_OR_INSTALLED', 'K2 component is not enabled or installed', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2151, 'EASYBLOG_IS_NOT_ENABLED_OR_INSTALLED', 'Easyblog component is not enabled or installed', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2152, 'BT_PORTFORLIO_IS_NOT_ENABLED_OR_INSTALLED', 'BT Portfolio component is not enabled or installed', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_bt_contentslider.ini'),
(2153, 'MOD_CUSTOM', 'Custom HTML', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_custom.ini'),
(2154, 'MOD_CUSTOM_FIELD_PREPARE_CONTENT_DESC', 'Optionally prepare the content with the Joomla Content Plugins.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_custom.ini'),
(2155, 'MOD_CUSTOM_FIELD_PREPARE_CONTENT_LABEL', 'Prepare Content', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_custom.ini'),
(2156, 'MOD_CUSTOM_XML_DESCRIPTION', 'This module allows you to create your own HTML Module using a WYSIWYG editor.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_custom.ini'),
(2157, 'MOD_CUSTOM_FIELD_BACKGROUNDIMAGE_LABEL', 'Select a Background Image', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_custom.ini'),
(2158, 'MOD_BACKGROUNDIMAGE_FIELD_LOGO_DESC', 'Select or upload an image that will automatically be inserted as an inline style for the wrapping div element.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_custom.ini'),
(2159, 'MOD_CUSTOM', 'Custom HTML', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_custom.sys.ini'),
(2160, 'MOD_CUSTOM_XML_DESCRIPTION', 'This module allows you to create your own HTML Module using a WYSIWYG editor.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_custom.sys.ini'),
(2161, 'MOD_CUSTOM_LAYOUT_DEFAULT', 'Default', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_custom.sys.ini'),
(2162, 'MOD_FEED', 'Feed Display', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_feed.ini'),
(2163, 'MOD_FEED_ERR_CACHE', 'Please make cache folder writeable.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_feed.ini'),
(2164, 'MOD_FEED_ERR_FEED_NOT_RETRIEVED', 'Feed not found.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_feed.ini'),
(2165, 'MOD_FEED_ERR_NO_URL', 'No feed URL specified.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_feed.ini'),
(2166, 'MOD_FEED_FIELD_DESCRIPTION_DESC', 'Show the description text for the entire feed.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_feed.ini'),
(2167, 'MOD_FEED_FIELD_DESCRIPTION_LABEL', 'Feed Description', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_feed.ini'),
(2168, 'MOD_FEED_FIELD_IMAGE_DESC', 'Show the image associated with the entire feed.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_feed.ini'),
(2169, 'MOD_FEED_FIELD_IMAGE_LABEL', 'Feed Image', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_feed.ini'),
(2170, 'MOD_FEED_FIELD_ITEMDESCRIPTION_DESC', 'Show the description or intro text of individual RSS items.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_feed.ini'),
(2171, 'MOD_FEED_FIELD_ITEMDESCRIPTION_LABEL', 'Item Description', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_feed.ini'),
(2172, 'MOD_FEED_FIELD_ITEMS_DESC', 'Enter number of RSS items to display.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_feed.ini'),
(2173, 'MOD_FEED_FIELD_ITEMS_LABEL', 'Feed Items', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_feed.ini'),
(2174, 'MOD_FEED_FIELD_RSSTITLE_DESC', 'Display news feed title.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_feed.ini'),
(2175, 'MOD_FEED_FIELD_RSSTITLE_LABEL', 'Feed Title', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_feed.ini'),
(2176, 'MOD_FEED_FIELD_RSSURL_DESC', 'Enter the URL of the RSS/RDF/ATOM feed.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_feed.ini'),
(2177, 'MOD_FEED_FIELD_RSSURL_LABEL', 'Feed URL', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_feed.ini'),
(2178, 'MOD_FEED_FIELD_RTL_DESC', 'Display feed in RTL direction.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_feed.ini'),
(2179, 'MOD_FEED_FIELD_RTL_LABEL', 'RTL Feed', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_feed.ini'),
(2180, 'MOD_FEED_FIELD_WORDCOUNT_DESC', 'Allows you to limit the amount of visible Item description text. 0 will show all the text.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_feed.ini'),
(2181, 'MOD_FEED_FIELD_WORDCOUNT_LABEL', 'Word Count', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_feed.ini'),
(2182, 'MOD_FEED_XML_DESCRIPTION', 'This module allows the displaying of a syndicated feed.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_feed.ini'),
(2183, 'MOD_FEED', 'Feed Display', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_feed.sys.ini'),
(2184, 'MOD_FEED_XML_DESCRIPTION', 'This module allows the displaying of a syndicated feed.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_feed.sys.ini'),
(2185, 'MOD_FEED_LAYOUT_DEFAULT', 'Default', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_feed.sys.ini'),
(2186, 'COM_FINDER_FILTER_BRANCH_LABEL', 'Search by %s', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_finder.ini'),
(2187, 'COM_FINDER_FILTER_SELECT_ALL_LABEL', 'Search All', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_finder.ini'),
(2188, 'COM_FINDER_ADVANCED_SEARCH', 'Advanced Search', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_finder.ini'),
(2189, 'COM_FINDER_SELECT_SEARCH_FILTER', '- No Filter -', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_finder.ini'),
(2190, 'MOD_FINDER', 'Smart Search', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_finder.ini'),
(2191, 'MOD_FINDER_CONFIG_OPTION_BOTTOM', 'Bottom', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_finder.ini'),
(2192, 'MOD_FINDER_CONFIG_OPTION_TOP', 'Top', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_finder.ini'),
(2193, 'MOD_FINDER_FIELDSET_ADVANCED_ALT_DESCRIPTION', 'An alternative label for the search field.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_finder.ini'),
(2194, 'MOD_FINDER_FIELDSET_ADVANCED_ALT_LABEL', 'Alternative Label', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_finder.ini'),
(2195, 'MOD_FINDER_FIELDSET_ADVANCED_BUTTON_POS_DESCRIPTION', 'The position of the search button relative to the search field.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_finder.ini'),
(2196, 'MOD_FINDER_FIELDSET_ADVANCED_BUTTON_POS_LABEL', 'Button Position', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_finder.ini'),
(2197, 'MOD_FINDER_FIELDSET_ADVANCED_FIELD_SIZE_DESCRIPTION', 'The width of the search field by character length.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_finder.ini'),
(2198, 'MOD_FINDER_FIELDSET_ADVANCED_FIELD_SIZE_LABEL', 'Search Field Size', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_finder.ini'),
(2199, 'MOD_FINDER_FIELDSET_ADVANCED_LABEL_POS_DESCRIPTION', 'The position of the search label relative to the search field.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_finder.ini'),
(2200, 'MOD_FINDER_FIELDSET_ADVANCED_LABEL_POS_LABEL', 'Label Position', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_finder.ini'),
(2201, 'MOD_FINDER_FIELDSET_ADVANCED_SETITEMID_DESCRIPTION', 'Assign an ItemID by selecting a menu item in the list for the display of the search results if there is no com_finder menu item and a specific display is desired. If you do not know what this means, you may not need it.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_finder.ini'),
(2202, 'MOD_FINDER_FIELDSET_ADVANCED_SETITEMID_LABEL', 'Set ItemID', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_finder.ini'),
(2203, 'MOD_FINDER_FIELDSET_ADVANCED_SHOW_BUTTON_DESCRIPTION', 'Toggle whether a button should be displayed for the search form.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_finder.ini'),
(2204, 'MOD_FINDER_FIELDSET_ADVANCED_SHOW_BUTTON_LABEL', 'Search Button', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_finder.ini'),
(2205, 'MOD_FINDER_FIELDSET_ADVANCED_SHOW_LABEL_DESCRIPTION', 'Toggle whether a label should be displayed for the search field.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_finder.ini'),
(2206, 'MOD_FINDER_FIELDSET_ADVANCED_SHOW_LABEL_LABEL', 'Search Field Label', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_finder.ini'),
(2207, 'MOD_FINDER_FIELDSET_BASIC_AUTOSUGGEST_DESCRIPTION', 'Toggle whether automatic search suggestions should be displayed.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_finder.ini'),
(2208, 'MOD_FINDER_FIELDSET_BASIC_AUTOSUGGEST_LABEL', 'Search Suggestions', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_finder.ini'),
(2209, 'MOD_FINDER_FIELDSET_BASIC_SEARCHFILTER_DESCRIPTION', 'Selecting a Search Filter will limit any searches submitted through this module to use the selected filter.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_finder.ini'),
(2210, 'MOD_FINDER_FIELDSET_BASIC_SEARCHFILTER_LABEL', 'Search Filter', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_finder.ini'),
(2211, 'MOD_FINDER_FIELDSET_BASIC_SHOW_ADVANCED_DESCRIPTION', 'Toggle whether users should be able to see advanced search options. If set to Link to Component option creates a Smart Search link which redirects to the smart search view. If set to show, the advanced search options will be displayed inline.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_finder.ini'),
(2212, 'MOD_FINDER_FIELDSET_BASIC_SHOW_ADVANCED_LABEL', 'Advanced Search', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_finder.ini'),
(2213, 'MOD_FINDER_FIELDSET_BASIC_SHOW_ADVANCED_OPTION_LINK', 'Link to Component', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_finder.ini'),
(2214, 'MOD_FINDER_FIELD_OPENSEARCH_DESCRIPTION', 'Some browsers can add support for your site''s search if this option is enabled.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_finder.ini'),
(2215, 'MOD_FINDER_FIELD_OPENSEARCH_LABEL', 'OpenSearch Autodiscovery', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_finder.ini'),
(2216, 'MOD_FINDER_FIELD_OPENSEARCH_TEXT_DESCRIPTION', 'Text displayed in supported browsers when adding your site as a search provider.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_finder.ini'),
(2217, 'MOD_FINDER_FIELD_OPENSEARCH_TEXT_LABEL', 'OpenSearch title', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_finder.ini'),
(2218, 'MOD_FINDER_SEARCHBUTTON_TEXT', 'Search', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_finder.ini'),
(2219, 'MOD_FINDER_SEARCH_BUTTON', 'Go', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_finder.ini'),
(2220, 'MOD_FINDER_SEARCH_VALUE', 'Search ...', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_finder.ini'),
(2221, 'MOD_FINDER_SELECT_MENU_ITEMID', 'Select a menu item', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_finder.ini'),
(2222, 'MOD_FINDER_XML_DESCRIPTION', 'This is a Smart Search module.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_finder.ini'),
(2223, 'MOD_FINDER', 'Smart Search', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_finder.sys.ini'),
(2224, 'MOD_FINDER_XML_DESCRIPTION', 'This is a search module for the Smart Search system.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_finder.sys.ini'),
(2225, 'MOD_FINDER_LAYOUT_DEFAULT', 'Default', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_finder.sys.ini'),
(2226, 'MOD_FOOTER', 'Footer', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_footer.ini'),
(2227, 'MOD_FOOTER_LINE1', 'Copyright &#169; %date% %sitename%. All Rights Reserved.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_footer.ini'),
(2228, 'MOD_FOOTER_LINE2', '<a href="http://www.joomla.org">Joomla!</a> is Free Software released under the <a href="http://www.gnu.org/licenses/gpl-2.0.html">GNU General Public License.</a>', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_footer.ini'),
(2229, 'MOD_FOOTER_XML_DESCRIPTION', 'This module shows the Joomla! copyright information.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_footer.ini'),
(2230, 'MOD_FOOTER', 'Footer', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_footer.sys.ini'),
(2231, 'MOD_FOOTER_XML_DESCRIPTION', 'This module shows the Joomla! copyright information.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_footer.sys.ini'),
(2232, 'MOD_FOOTER_LAYOUT_DEFAULT', 'Default', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_footer.sys.ini'),
(2233, 'MOD_LANGUAGES', 'Language Switcher', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_languages.ini'),
(2234, 'MOD_LANGUAGES_FIELD_ACTIVE_DESC', 'Display or not the active language. If displayed, the class ''lang-active'' will be added to the element.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_languages.ini'),
(2235, 'MOD_LANGUAGES_FIELD_ACTIVE_LABEL', 'Active Language', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_languages.ini'),
(2236, 'MOD_LANGUAGES_FIELD_CACHING_DESC', 'Select whether to cache or not the content of this module.<br />This should be set to ''No caching'' when using Items Associations.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_languages.ini'),
(2237, 'MOD_LANGUAGES_FIELD_DROPDOWN_DESC', 'If set to ''Yes'', the display parameters below will be ignored. The content languages native names will display in a dropdown.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_languages.ini'),
(2238, 'MOD_LANGUAGES_FIELD_DROPDOWN_LABEL', 'Use Dropdown', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_languages.ini'),
(2239, 'MOD_LANGUAGES_FIELD_FOOTER_DESC', 'This is the text or HTML that is displayed below the language switcher.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_languages.ini'),
(2240, 'MOD_LANGUAGES_FIELD_FOOTER_LABEL', 'Post-text', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_languages.ini'),
(2241, 'MOD_LANGUAGES_FIELD_FULL_NAME_DESC', 'If set to ''Yes'' and image flags set to ''No'', full content language native names are displayed. If set to ''No'', upper case abbreviations from the content languages URL Language Code are used. Example: EN for English, FR for French.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_languages.ini'),
(2242, 'MOD_LANGUAGES_FIELD_FULL_NAME_LABEL', 'Languages Full Names', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_languages.ini'),
(2243, 'MOD_LANGUAGES_FIELD_HEADER_DESC', 'This is the text or HTML that is displayed above the language switcher.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_languages.ini'),
(2244, 'MOD_LANGUAGES_FIELD_HEADER_LABEL', 'Pre-text', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_languages.ini'),
(2245, 'MOD_LANGUAGES_FIELD_INLINE_DESC', 'Default is set to ''Yes'', ie to horizontal display.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_languages.ini'),
(2246, 'MOD_LANGUAGES_FIELD_INLINE_LABEL', 'Horizontal Display', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_languages.ini'),
(2247, 'MOD_LANGUAGES_FIELD_MODULE_LAYOUT_DESC', 'Use a different layout from the supplied module or overrides in the default template.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_languages.ini'),
(2248, 'MOD_LANGUAGES_FIELD_USEIMAGE_DESC', 'If set to ''Yes'', will display language choice as image flags. Otherwise will use the content language native names.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_languages.ini'),
(2249, 'MOD_LANGUAGES_FIELD_USEIMAGE_LABEL', 'Use Image Flags', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_languages.ini'),
(2250, 'MOD_LANGUAGES_OPTION_DEFAULT_LANGUAGE', 'Default', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_languages.ini'),
(2251, 'MOD_LANGUAGES_SPACERDROP_LABEL', '<u>If Use Dropdown is set to ''Yes'', <br />the display options below will be ignored</u>', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_languages.ini'),
(2252, 'MOD_LANGUAGES_SPACERNAME_LABEL', '<u>If Use Image Flags is set to ''Yes'', <br />the display options below will be ignored</u>', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_languages.ini'),
(2253, 'MOD_LANGUAGES_XML_DESCRIPTION', 'This module displays a list of available Content Languages (as defined and published in Language Manager Content tab) for switching between them when you want to use Joomla! as a multilingual site. <br />--The plugin ''System - Language Filter'' has to be enabled.--<br />When switching languages and if the item displayed in the page is not associated to another item, the module redirects to the Home page defined for the chosen language.<br />Otherwise, if the parameter is set for the Language filter plugin, it will redirect to the associated item in the language chosen. Thereafter, the navigation will be the one defined for that language. <br />If the plugin <strong>''System - Language Filter''</strong> is disabled, this may have unwanted results.<br /><strong>Method:</strong><br />1. Open Language Manager Content tab and make sure the Languages you want to use in contents are published and have a Language Code for the URL as well as prefix for the image used in the module display.<br />2. Create a Home page by assigning a language to a menu item and defining it as Default Home page for each published content language. <br />3. Thereafter, you can assign a language to any Article, Category, Module, News Feed, Web Links in Joomla.<br />4. Make sure the module is published and the plugin is enabled. <br />5. When using associated items, make sure the module is displayed on the pages concerned. <br />6. The way the flags or names of the languages are displayed is defined by the ordering in the Language Manager - Content Languages.<br ><br >If this module is published, it is suggested to publish the Administrator multilingual status module.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_languages.ini'),
(2254, 'MOD_LANGUAGES', 'Language Switcher', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_languages.sys.ini'),
(2255, 'MOD_LANGUAGES_XML_DESCRIPTION', 'This module displays a list of available Content Languages (as defined and published in Language Manager Content tab) for switching between them when you want to use Joomla! as a multilingual site. <br />--The plugin ''System - Language Filter'' has to be enabled.--<br />When switching languages and if the item displayed in the page is not associated to another item, the module redirects to the Home page defined for the chosen language.<br />Otherwise, if the parameter is set for the Language filter plugin, it will redirect to the associated item in the language chosen. Thereafter, the navigation will be the one defined for that language. <br />If the plugin <strong>''System - Language Filter''</strong> is disabled, this may have unwanted results.<br /><strong>Method:</strong><br />1. Open Language Manager Content tab and make sure the Languages you want to use in contents are published and have a Language Code for the URL as well as prefix for the image used in the module display.<br />2. Create a Home page by assigning a language to a menu item and defining it as Default Home page for each published content language. <br />3. Thereafter, you can assign a language to any Article, Category, Module, News Feed, Web Links in Joomla.<br />4. Make sure the module is published and the plugin is enabled. <br />5. When using associated items, make sure the module is displayed on the pages concerned. <br />6. The way the flags or names of the languages are displayed is defined by the ordering in the Language Manager - Content Languages.<br ><br >If this module is published, it is suggested to publish the Administrator multilingual status module.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_languages.sys.ini'),
(2256, 'MOD_LANGUAGES_LAYOUT_DEFAULT', 'Default', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_languages.sys.ini'),
(2257, 'MOD_LOGIN', 'Login', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_login.ini'),
(2258, 'MOD_LOGIN_FIELD_GREETING_DESC', 'Show or hide the simple greeting text.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_login.ini'),
(2259, 'MOD_LOGIN_FIELD_GREETING_LABEL', 'Show Greeting', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_login.ini'),
(2260, 'MOD_LOGIN_FIELD_LOGIN_REDIRECTURL_DESC', 'Select the page the user will be redirected to after a successful login. Select from all the pages listed in the dropdown menu. Choosing &quot;Default&quot; will return to the same page.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_login.ini'),
(2261, 'MOD_LOGIN_FIELD_LOGIN_REDIRECTURL_LABEL', 'Login Redirection Page', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_login.ini'),
(2262, 'MOD_LOGIN_FIELD_LOGOUT_REDIRECTURL_DESC', 'Select the page the user will be redirected to after successfully ending their current session by logging out. Select from all the pages listed in the dropdown menu. Choosing &quot;Default&quot; will return to the same page.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_login.ini'),
(2263, 'MOD_LOGIN_FIELD_LOGOUT_REDIRECTURL_LABEL', 'Logout Redirection Page', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_login.ini'),
(2264, 'MOD_LOGIN_FIELD_NAME_DESC', 'Displays name or username after logging in.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_login.ini'),
(2265, 'MOD_LOGIN_FIELD_NAME_LABEL', 'Show Name/Username', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_login.ini'),
(2266, 'MOD_LOGIN_FIELD_POST_TEXT_DESC', 'This is the text or HTML that is displayed below the login form.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_login.ini'),
(2267, 'MOD_LOGIN_FIELD_POST_TEXT_LABEL', 'Post-text', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_login.ini'),
(2268, 'MOD_LOGIN_FIELD_PRE_TEXT_DESC', 'This is the text or HTML that is displayed above the login form.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_login.ini'),
(2269, 'MOD_LOGIN_FIELD_PRE_TEXT_LABEL', 'Pre-text', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_login.ini'),
(2270, 'MOD_LOGIN_FIELD_USESECURE_DESC', 'Submit encrypted login data (requires SSL). Do not enable this option if Joomla is not accessible using the https:// protocol prefix.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_login.ini'),
(2271, 'MOD_LOGIN_FIELD_USESECURE_LABEL', 'Encrypt Login Form', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_login.ini'),
(2272, 'MOD_LOGIN_FIELD_USETEXT_DESC', 'Choose text or icons to display the field labels. Default is icons.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_login.ini'),
(2273, 'MOD_LOGIN_FIELD_USETEXT_LABEL', 'Display Labels', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_login.ini'),
(2274, 'MOD_LOGIN_FORGOT_YOUR_PASSWORD', 'Forgot your password?', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_login.ini'),
(2275, 'MOD_LOGIN_FORGOT_YOUR_USERNAME', 'Forgot your username?', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_login.ini'),
(2276, 'MOD_LOGIN_HINAME', 'Hi %s,', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_login.ini'),
(2277, 'MOD_LOGIN_REGISTER', 'Create an account', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_login.ini'),
(2278, 'MOD_LOGIN_REMEMBER_ME', 'Remember Me', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_login.ini'),
(2279, 'MOD_LOGIN_VALUE_ICONS', 'Icons', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_login.ini'),
(2280, 'MOD_LOGIN_VALUE_NAME', 'Name', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_login.ini'),
(2281, 'MOD_LOGIN_VALUE_TEXT', 'Text', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_login.ini'),
(2282, 'MOD_LOGIN_VALUE_USERNAME', 'Username', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_login.ini'),
(2283, 'MOD_LOGIN_XML_DESCRIPTION', 'This module displays a username and password login form. It also displays a link to retrieve a forgotten password. If user registration is enabled (in User Manager > Options), another link will be shown to enable self-registration for users.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_login.ini'),
(2284, 'MOD_LOGIN', 'Login', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_login.sys.ini'),
(2285, 'MOD_LOGIN_XML_DESCRIPTION', 'This module displays a username and password login form. It also displays a link to retrieve a forgotten password. If user registration is enabled (in User Manager > Options), another link will be shown to enable self-registration for users.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_login.sys.ini'),
(2286, 'MOD_LOGIN_LAYOUT_DEFAULT', 'Default', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_login.sys.ini'),
(2287, 'MOD_MENU', 'Menu', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_menu.ini'),
(2288, 'MOD_MENU_FIELD_ACTIVE_DESC', 'Select a menu item to always be used as the base for the menu display. You must set the Start Level to the same level or higher than the level of the base item. This will cause the module to be displayed on all assigned pages. If Current is selected the currently active item is used as the base. This causes the module to only display when the parent menu item is active.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_menu.ini'),
(2289, 'MOD_MENU_FIELD_ACTIVE_LABEL', 'Base Item', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_menu.ini'),
(2290, 'MOD_MENU_FIELD_ALLCHILDREN_DESC', 'Expand the menu and make its sub-menu items always visible.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_menu.ini'),
(2291, 'MOD_MENU_FIELD_ALLCHILDREN_LABEL', 'Show Sub-menu Items', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_menu.ini'),
(2292, 'MOD_MENU_FIELD_CLASS_DESC', 'A suffix to be applied to the CSS class of the menu items.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_menu.ini'),
(2293, 'MOD_MENU_FIELD_CLASS_LABEL', 'Menu Class Suffix', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_menu.ini'),
(2294, 'MOD_MENU_FIELD_ENDLEVEL_DESC', 'Level to stop rendering the menu at. If you choose ''All'', all levels will be shown depending on ''Show Sub-menu Items'' setting.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_menu.ini'),
(2295, 'MOD_MENU_FIELD_ENDLEVEL_LABEL', 'End Level', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_menu.ini'),
(2296, 'MOD_MENU_FIELD_MENUTYPE_DESC', 'Select a menu in the list.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_menu.ini'),
(2297, 'MOD_MENU_FIELD_MENUTYPE_LABEL', 'Select Menu', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_menu.ini'),
(2298, 'MOD_MENU_FIELD_STARTLEVEL_DESC', 'Level to start rendering the menu at. Setting the start and end levels to the same # and setting ''Show Sub-menu Items'' to yes will only display that single level.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_menu.ini'),
(2299, 'MOD_MENU_FIELD_STARTLEVEL_LABEL', 'Start Level', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_menu.ini'),
(2300, 'MOD_MENU_FIELD_TAG_ID_DESC', 'An ID attribute to assign to the root ul tag of the menu (optional).', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_menu.ini'),
(2301, 'MOD_MENU_FIELD_TAG_ID_LABEL', 'Menu Tag ID', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_menu.ini'),
(2302, 'MOD_MENU_FIELD_TARGET_DESC', 'JavaScript values to position a popup window, eg top=50,left=50,width=200,height=300.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_menu.ini'),
(2303, 'MOD_MENU_FIELD_TARGET_LABEL', 'Target Position', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_menu.ini'),
(2304, 'MOD_MENU_XML_DESCRIPTION', 'This module displays a menu on the Frontend.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_menu.ini'),
(2305, 'MOD_MENU', 'Menu', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_menu.sys.ini'),
(2306, 'MOD_MENU_XML_DESCRIPTION', 'This module displays a menu on the Frontend.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_menu.sys.ini'),
(2307, 'MOD_MENU_LAYOUT_DEFAULT', 'Default', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_menu.sys.ini'),
(2308, 'MOD_RANDOM_IMAGE', 'Random Image', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_random_image.ini'),
(2309, 'MOD_RANDOM_IMAGE_FIELD_FOLDER_DESC', 'Path to the image folder relative to the site URL (eg images).', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_random_image.ini'),
(2310, 'MOD_RANDOM_IMAGE_FIELD_FOLDER_LABEL', 'Image Folder', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_random_image.ini'),
(2311, 'MOD_RANDOM_IMAGE_FIELD_HEIGHT_DESC', 'Image height forces all images to be displayed with the height in pixels.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_random_image.ini'),
(2312, 'MOD_RANDOM_IMAGE_FIELD_HEIGHT_LABEL', 'Height (px)', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_random_image.ini'),
(2313, 'MOD_RANDOM_IMAGE_FIELD_LINK_DESC', 'A URL to redirect to if the image is selected (eg http://www.joomla.org).', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_random_image.ini'),
(2314, 'MOD_RANDOM_IMAGE_FIELD_LINK_LABEL', 'Link', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_random_image.ini'),
(2315, 'MOD_RANDOM_IMAGE_FIELD_TYPE_DESC', 'Type of image PNG/GIF/JPG etc (the default is JPG).', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_random_image.ini'),
(2316, 'MOD_RANDOM_IMAGE_FIELD_TYPE_LABEL', 'Image Type', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_random_image.ini'),
(2317, 'MOD_RANDOM_IMAGE_FIELD_WIDTH_DESC', 'Image width forces all images to be displayed with this width in pixels.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_random_image.ini'),
(2318, 'MOD_RANDOM_IMAGE_FIELD_WIDTH_LABEL', 'Width (px)', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_random_image.ini'),
(2319, 'MOD_RANDOM_IMAGE_NO_IMAGES', 'No Images', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_random_image.ini'),
(2320, 'MOD_RANDOM_IMAGE_XML_DESCRIPTION', 'This module displays a random image from your chosen folder.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_random_image.ini'),
(2321, 'MOD_RANDOM_IMAGE', 'Random Image', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_random_image.sys.ini'),
(2322, 'MOD_RANDOM_IMAGE_XML_DESCRIPTION', 'This module displays a random image from your chosen folder.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_random_image.sys.ini'),
(2323, 'MOD_RANDOM_IMAGE_LAYOUT_DEFAULT', 'Default', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_random_image.sys.ini'),
(2324, 'MOD_RELATED_FIELD_MAX_DESC', 'The maximum number of related articles to display (default is 5).', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_related_items.ini'),
(2325, 'MOD_RELATED_FIELD_MAX_LABEL', 'Maximum Articles', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_related_items.ini'),
(2326, 'MOD_RELATED_FIELD_SHOWDATE_DESC', 'Show or hide date.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_related_items.ini'),
(2327, 'MOD_RELATED_FIELD_SHOWDATE_LABEL', 'Show Date', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_related_items.ini'),
(2328, 'MOD_RELATED_ITEMS', 'Articles - Related', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_related_items.ini'),
(2329, 'MOD_RELATED_XML_DESCRIPTION', 'This module displays other Articles that are related to the one currently being viewed. These relations are established by the Meta keywords. <br />All the keywords of the current Article are searched against all the keywords of all other published Articles. For example, you may have an Article on &quot;Breeding Parrots&quot; and another on &quot;Hand Raising Black Cockatoos&quot;. If you include the keyword &quot;parrot&quot; in both Articles, then the Related Items Module will list the &quot;Breeding Parrots&quot; Article when viewing &quot;Hand Raising Black Cockatoos&quot; and vice-versa.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_related_items.ini'),
(2330, 'MOD_RELATED_ITEMS', 'Articles - Related', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_related_items.sys.ini'),
(2331, 'MOD_RELATED_XML_DESCRIPTION', 'This module displays other Articles that are related to the one currently being viewed. These relations are established by the Meta keywords. <br />All the keywords of the current Article are searched against all the keywords of all other published Articles. For example, you may have an Article on &quot;Breeding Parrots&quot; and another on &quot;Hand Raising Black Cockatoos&quot;. If you include the keyword &quot;parrot&quot; in both Articles, then the Related Items Module will list the &quot;Breeding Parrots&quot; Article when viewing &quot;Hand Raising Black Cockatoos&quot; and vice-versa.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_related_items.sys.ini'),
(2332, 'MOD_RELATED_ITEMS_LAYOUT_DEFAULT', 'Default', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_related_items.sys.ini'),
(2333, 'MOD_SEARCH', 'Search', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_search.ini'),
(2334, 'MOD_SEARCH_FIELD_BOXWIDTH_DESC', 'Size of the search text box in characters.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_search.ini'),
(2335, 'MOD_SEARCH_FIELD_BOXWIDTH_LABEL', 'Box Width', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_search.ini'),
(2336, 'MOD_SEARCH_FIELD_BUTTON_DESC', 'Display a search button.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_search.ini'),
(2337, 'MOD_SEARCH_FIELD_BUTTON_LABEL', 'Search Button', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_search.ini'),
(2338, 'MOD_SEARCH_FIELD_BUTTONPOS_DESC', 'Position of the button relative to the search box.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_search.ini'),
(2339, 'MOD_SEARCH_FIELD_BUTTONPOS_LABEL', 'Button Position', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_search.ini'),
(2340, 'MOD_SEARCH_FIELD_BUTTONTEXT_DESC', 'The text that appears in the search button. If left blank, it will load the ''searchbutton'' string from your language file.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_search.ini'),
(2341, 'MOD_SEARCH_FIELD_BUTTONTEXT_LABEL', 'Button Text', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_search.ini');
INSERT INTO `hyxu5_overrider` (`id`, `constant`, `string`, `file`) VALUES
(2342, 'MOD_SEARCH_FIELD_IMAGEBUTTON_DESC', 'Use an image as button. This image has to be named searchButton.gif and must be located in templates/*your template name*/images/.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_search.ini'),
(2343, 'MOD_SEARCH_FIELD_IMAGEBUTTON_LABEL', 'Search Button Image', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_search.ini'),
(2344, 'MOD_SEARCH_FIELD_SETITEMID_DESC', 'Assign an ItemID by selecting a menu item in the list for the display of the search results if there is no com_search menu and a specific display is desired. If you do not know what this means, you may not need it.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_search.ini'),
(2345, 'MOD_SEARCH_FIELD_SETITEMID_LABEL', 'Set ItemID', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_search.ini'),
(2346, 'MOD_SEARCH_FIELD_LABEL_TEXT_DESC', 'The text that appears in the label of search box. If left blank, it will load ''label'' string from your language file.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_search.ini'),
(2347, 'MOD_SEARCH_FIELD_LABEL_TEXT_LABEL', 'Box Label', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_search.ini'),
(2348, 'MOD_SEARCH_FIELD_OPENSEARCH_LABEL', 'OpenSearch Autodiscovery', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_search.ini'),
(2349, 'MOD_SEARCH_FIELD_OPENSEARCH_TEXT_LABEL', 'OpenSearch Title', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_search.ini'),
(2350, 'MOD_SEARCH_FIELD_OPENSEARCH_TEXT_DESC', 'Text displayed in supported browsers when adding your site as a search provider.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_search.ini'),
(2351, 'MOD_SEARCH_FIELD_OPENSEARCH_DESC', 'Some browsers can add support for your site''s search if this option is enabled.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_search.ini'),
(2352, 'MOD_SEARCH_FIELD_TEXT_DESC', 'The text that appears in the search text box. If left blank, it will load the ''searchbox'' string from your language file.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_search.ini'),
(2353, 'MOD_SEARCH_FIELD_TEXT_LABEL', 'Box Text', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_search.ini'),
(2354, 'MOD_SEARCH_FIELD_VALUE_BOTTOM', 'Bottom', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_search.ini'),
(2355, 'MOD_SEARCH_FIELD_VALUE_LEFT', 'Left', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_search.ini'),
(2356, 'MOD_SEARCH_FIELD_VALUE_RIGHT', 'Right', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_search.ini'),
(2357, 'MOD_SEARCH_FIELD_VALUE_TOP', 'Top', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_search.ini'),
(2358, 'MOD_SEARCH_LABEL_TEXT', 'Search ...', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_search.ini'),
(2359, 'MOD_SEARCH_SEARCHBOX_TEXT', 'Search ...', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_search.ini'),
(2360, 'MOD_SEARCH_SEARCHBUTTON_TEXT', 'Search', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_search.ini'),
(2361, 'MOD_SEARCH_SELECT_MENU_ITEMID', 'Select a menu item', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_search.ini'),
(2362, 'MOD_SEARCH_XML_DESCRIPTION', 'This module will display a search box.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_search.ini'),
(2363, 'MOD_SEARCH', 'Search', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_search.sys.ini'),
(2364, 'MOD_SEARCH_XML_DESCRIPTION', 'This module will display a search box.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_search.sys.ini'),
(2365, 'MOD_SEARCH_LAYOUT_DEFAULT', 'Default', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_search.sys.ini'),
(2366, 'MOD_STATS', 'Statistics', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_stats.ini'),
(2367, 'MOD_STATS_ARTICLES', 'Articles', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_stats.ini'),
(2368, 'MOD_STATS_ARTICLES_VIEW_HITS', 'Articles View Hits', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_stats.ini'),
(2369, 'MOD_STATS_CACHING', 'Caching', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_stats.ini'),
(2370, 'MOD_STATS_FIELD_COUNTER_DESC', 'Display hit counter.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_stats.ini'),
(2371, 'MOD_STATS_FIELD_COUNTER_LABEL', 'Hit Counter', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_stats.ini'),
(2372, 'MOD_STATS_FIELD_INCREASECOUNTER_DESC', 'Enter the number of hits to increase the counter by.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_stats.ini'),
(2373, 'MOD_STATS_FIELD_INCREASECOUNTER_LABEL', 'Increase Counter', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_stats.ini'),
(2374, 'MOD_STATS_FIELD_SERVERINFO_DESC', 'Display server information.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_stats.ini'),
(2375, 'MOD_STATS_FIELD_SERVERINFO_LABEL', 'Server Information', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_stats.ini'),
(2376, 'MOD_STATS_FIELD_SITEINFO_DESC', 'Display site information.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_stats.ini'),
(2377, 'MOD_STATS_FIELD_SITEINFO_LABEL', 'Site Information', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_stats.ini'),
(2378, 'MOD_STATS_GZIP', 'GZip', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_stats.ini'),
(2379, 'MOD_STATS_MYSQL', 'MySQL', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_stats.ini'),
(2380, 'MOD_STATS_OS', 'OS', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_stats.ini'),
(2381, 'MOD_STATS_PHP', 'PHP', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_stats.ini'),
(2382, 'MOD_STATS_TIME', 'Time', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_stats.ini'),
(2383, 'MOD_STATS_USERS', 'Users', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_stats.ini'),
(2384, 'MOD_STATS_WEBLINKS', 'Web Links', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_stats.ini'),
(2385, 'MOD_STATS_XML_DESCRIPTION', 'The Statistics Module shows information about your server installation together with statistics on the website users, number of Articles in your database and the number of Web links you provide.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_stats.ini'),
(2386, 'MOD_STATS', 'Statistics', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_stats.sys.ini'),
(2387, 'MOD_STATS_XML_DESCRIPTION', 'The Statistics Module shows information about your server installation together with statistics on the website users, number of Articles in your database and the number of Web links you provide.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_stats.sys.ini'),
(2388, 'MOD_STATS_LAYOUT_DEFAULT', 'Default', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_stats.sys.ini'),
(2389, 'MOD_SYNDICATE', 'Syndication Feeds', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_syndicate.ini'),
(2390, 'MOD_SYNDICATE_DEFAULT_FEED_ENTRIES', 'Feed Entries', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_syndicate.ini'),
(2391, 'MOD_SYNDICATE_FIELD_DISPLAYTEXT_DESC', 'If set to ''Yes'', text will be displayed next to the icon.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_syndicate.ini'),
(2392, 'MOD_SYNDICATE_FIELD_DISPLAYTEXT_LABEL', 'Display Text', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_syndicate.ini'),
(2393, 'MOD_SYNDICATE_FIELD_FORMAT_DESC', 'Select the format for the Syndication Feed.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_syndicate.ini'),
(2394, 'MOD_SYNDICATE_FIELD_FORMAT_LABEL', 'Feed Format', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_syndicate.ini'),
(2395, 'MOD_SYNDICATE_FIELD_TEXT_DESC', 'If ''Display Text'' is activated, the text entered will be displayed next to the icon along with the RSS Link. If this field is left empty, the default text displayed will be picked from the site language ini file.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_syndicate.ini'),
(2396, 'MOD_SYNDICATE_FIELD_TEXT_LABEL', 'Text', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_syndicate.ini'),
(2397, 'MOD_SYNDICATE_FIELD_VALUE_ATOM', 'Atom 1.0', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_syndicate.ini'),
(2398, 'MOD_SYNDICATE_FIELD_VALUE_RSS', 'RSS 2.0', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_syndicate.ini'),
(2399, 'MOD_SYNDICATE_XML_DESCRIPTION', 'Smart Syndication Module that creates a Syndicated Feed for the page where the Module is displayed.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_syndicate.ini'),
(2400, 'MOD_SYNDICATE', 'Syndication Feeds', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_syndicate.sys.ini'),
(2401, 'MOD_SYNDICATE_XML_DESCRIPTION', 'Smart Syndication Module that creates a Syndicated Feed for the page where the Module is displayed.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_syndicate.sys.ini'),
(2402, 'MOD_SYNDICATE_LAYOUT_DEFAULT', 'Default', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_syndicate.sys.ini'),
(2403, 'MOD_TAGS_POPULAR', 'Tags - Popular', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_tags_popular.ini'),
(2404, 'MOD_TAGS_POPULAR_FIELD_ALL_TIME', 'All time', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_tags_popular.ini'),
(2405, 'MOD_TAGS_POPULAR_FIELD_DISPLAY_COUNT_DESC', 'Choose if the number of tagged items should be displayed next to each tag.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_tags_popular.ini'),
(2406, 'MOD_TAGS_POPULAR_FIELD_DISPLAY_COUNT_LABEL', 'Display Number of Items', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_tags_popular.ini'),
(2407, 'MOD_TAGS_POPULAR_FIELD_LAST_DAY', 'Last day', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_tags_popular.ini'),
(2408, 'MOD_TAGS_POPULAR_FIELD_LAST_HOUR', 'Last hour', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_tags_popular.ini'),
(2409, 'MOD_TAGS_POPULAR_FIELD_LAST_MONTH', 'Last month', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_tags_popular.ini'),
(2410, 'MOD_TAGS_POPULAR_FIELD_LAST_WEEK', 'Last week', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_tags_popular.ini'),
(2411, 'MOD_TAGS_POPULAR_FIELD_LAST_YEAR', 'Last year', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_tags_popular.ini'),
(2412, 'MOD_TAGS_POPULAR_FIELD_MAX_DESC', 'Sets the maximum number of tags to display in the module. Enter &quot;0&quot; to display all tags.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_tags_popular.ini'),
(2413, 'MOD_TAGS_POPULAR_FIELD_MAX_LABEL', 'Maximum Tags', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_tags_popular.ini'),
(2414, 'MOD_TAGS_POPULAR_FIELD_MAXSIZE_DESC', 'The maximum font size used for the tags, proportional to the site''s default font size (eg &quot;2&quot; means 200% of the default size).', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_tags_popular.ini'),
(2415, 'MOD_TAGS_POPULAR_FIELD_MAXSIZE_LABEL', 'Maximum Font Size', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_tags_popular.ini'),
(2416, 'MOD_TAGS_POPULAR_FIELD_MINSIZE_DESC', 'The minimum font size used for the tags, proportional to the site''s default font size (eg &quot;2&quot; means 200% of the default size).', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_tags_popular.ini'),
(2417, 'MOD_TAGS_POPULAR_FIELD_MINSIZE_LABEL', 'Minimum Font Size', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_tags_popular.ini'),
(2418, 'MOD_TAGS_POPULAR_FIELD_NO_RESULTS_DESC', 'Will show a message if no matching tags are found instead of hiding the module.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_tags_popular.ini'),
(2419, 'MOD_TAGS_POPULAR_FIELD_NO_RESULTS_LABEL', 'Show &quot;No results&quot; text', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_tags_popular.ini'),
(2420, 'MOD_TAGS_POPULAR_FIELD_ORDER_VALUE_COUNT', 'Number of Items', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_tags_popular.ini'),
(2421, 'MOD_TAGS_POPULAR_FIELD_ORDER_VALUE_DESC', 'The order that tags will show in.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_tags_popular.ini'),
(2422, 'MOD_TAGS_POPULAR_FIELD_ORDER_VALUE_LABEL', 'Order', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_tags_popular.ini'),
(2423, 'MOD_TAGS_POPULAR_FIELD_ORDER_VALUE_RANDOM', 'Random', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_tags_popular.ini'),
(2424, 'MOD_TAGS_POPULAR_FIELD_ORDER_VALUE_TITLE', 'Title', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_tags_popular.ini'),
(2425, 'MOD_TAGS_POPULAR_FIELD_TIMEFRAME_DESC', 'Sets the time period for which to calculate popularity.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_tags_popular.ini'),
(2426, 'MOD_TAGS_POPULAR_FIELD_TIMEFRAME_LABEL', 'Time Period', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_tags_popular.ini'),
(2427, 'MOD_TAGS_POPULAR_FIELDSET_CLOUD_LABEL', 'Cloud Layout', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_tags_popular.ini'),
(2428, 'MOD_TAGS_POPULAR_MAX_DESC', 'Sets the maximum number of tags to display in the module.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_tags_popular.ini'),
(2429, 'MOD_TAGS_POPULAR_MAX_LABEL', 'Maximum tags', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_tags_popular.ini'),
(2430, 'MOD_TAGS_POPULAR_NO_ITEMS_FOUND', 'No Tags found.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_tags_popular.ini'),
(2431, 'MOD_TAGS_POPULAR_XML_DESCRIPTION', 'This module displays tags used on the site in a list or a cloud layout. Tags can be ordered by title or by the number of tagged items and limited to a specific time period.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_tags_popular.ini'),
(2432, 'MOD_TAGS_POPULAR', 'Tags - Popular', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_tags_popular.sys.ini'),
(2433, 'MOD_TAGS_POPULAR_LAYOUT_CLOUD', 'Cloud', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_tags_popular.sys.ini'),
(2434, 'MOD_TAGS_POPULAR_LAYOUT_DEFAULT', 'Default', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_tags_popular.sys.ini'),
(2435, 'MOD_TAGS_POPULAR_XML_DESCRIPTION', 'This module displays tags used on the site in a list or a cloud layout. Tags can be ordered by title or by the number of tagged items and limited to a specific time period.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_tags_popular.sys.ini'),
(2436, 'MOD_TAGS_SIMILAR', 'Tags - Similar', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_tags_similar.ini'),
(2437, 'MOD_TAGS_SIMILAR_FIELD_ALL', 'All', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_tags_similar.ini'),
(2438, 'MOD_TAGS_SIMILAR_FIELD_HALF', 'Half', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_tags_similar.ini'),
(2439, 'MOD_TAGS_SIMILAR_FIELD_MATCHTYPE_DESC', 'How closely an item''s tags need to match. All - requires that all tags in the displayed item be matched. Any - requires that at least one tag match. Half - requires that at least half of the tags match (rounded up in the case of decimals).', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_tags_similar.ini'),
(2440, 'MOD_TAGS_SIMILAR_FIELD_MATCHTYPE_LABEL', 'Match Type', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_tags_similar.ini'),
(2441, 'MOD_TAGS_SIMILAR_FIELD_ONE', 'Any', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_tags_similar.ini'),
(2442, 'MOD_TAGS_SIMILAR_LAYOUT_DEFAULT', 'Default', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_tags_similar.ini'),
(2443, 'MOD_TAGS_SIMILAR_MAX_DESC', 'Maximum number of items to display.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_tags_similar.ini'),
(2444, 'MOD_TAGS_SIMILAR_MAX_LABEL', 'Maximum Items', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_tags_similar.ini'),
(2445, 'MOD_TAGS_SIMILAR_NO_MATCHING_TAGS', 'No matching tags.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_tags_similar.ini'),
(2446, 'MOD_TAGS_SIMILAR_XML_DESCRIPTION', 'The Similar Tags Module displays links to other items with similar tags. The closeness of the match can be specified.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_tags_similar.ini'),
(2447, 'MOD_TAGS_SIMILAR_FIELD_ORDERING_LABEL', 'Order Results', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_tags_similar.ini'),
(2448, 'MOD_TAGS_SIMILAR_FIELD_ORDERING_DESC', 'Select the order in which you want query results presented.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_tags_similar.ini'),
(2449, 'MOD_TAGS_SIMILAR_FIELD_ORDERING_COUNT', 'Number of matching tags', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_tags_similar.ini'),
(2450, 'MOD_TAGS_SIMILAR_FIELD_ORDERING_RANDOM', 'Random', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_tags_similar.ini'),
(2451, 'MOD_TAGS_SIMILAR_FIELD_ORDERING_COUNT_AND_RANDOM', 'Number of matching tags & Random', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_tags_similar.ini'),
(2452, 'MOD_TAGS_SIMILAR', 'Tags - Similar', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_tags_similar.sys.ini'),
(2453, 'MOD_TAGS_SIMILAR_LAYOUT_DEFAULT', 'Default', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_tags_similar.sys.ini'),
(2454, 'MOD_TAGS_SIMILAR_XML_DESCRIPTION', 'The Similar Tags Module displays links to other items with similar tags. The closeness of the match can be specified.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_tags_similar.sys.ini'),
(2455, 'MOD_USERS_LATEST', 'Latest Users', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_users_latest.ini'),
(2456, 'MOD_USERS_LATEST_FIELD_FILTER_GROUPS_DESC', 'Choose to filter by groups of the connected user.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_users_latest.ini'),
(2457, 'MOD_USERS_LATEST_FIELD_FILTER_GROUPS_LABEL', 'Filter Groups', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_users_latest.ini'),
(2458, 'MOD_USERS_LATEST_FIELD_LINKTOWHAT_DESC', 'Choose the type of information to display.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_users_latest.ini'),
(2459, 'MOD_USERS_LATEST_FIELD_LINKTOWHAT_LABEL', 'User Information', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_users_latest.ini'),
(2460, 'MOD_USERS_LATEST_FIELD_NUMBER_DESC', 'Number of latest registered users to display.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_users_latest.ini'),
(2461, 'MOD_USERS_LATEST_FIELD_NUMBER_LABEL', 'Number of Users', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_users_latest.ini'),
(2462, 'MOD_USERS_LATEST_FIELD_VALUE_CONTACT', 'Contact', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_users_latest.ini'),
(2463, 'MOD_USERS_LATEST_FIELD_VALUE_PROFILE', 'Profile', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_users_latest.ini'),
(2464, 'MOD_USERS_LATEST_XML_DESCRIPTION', 'This module displays the latest registered users.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_users_latest.ini'),
(2465, 'MOD_USERS_LATEST', 'Latest Users', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_users_latest.sys.ini'),
(2466, 'MOD_USERS_LATEST_XML_DESCRIPTION', 'This module displays the latest registered users.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_users_latest.sys.ini'),
(2467, 'MOD_USERS_LATEST_LAYOUT_DEFAULT', 'Default', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_users_latest.sys.ini'),
(2468, 'MOD_WEBLINKS', 'Weblinks', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_weblinks.ini'),
(2469, 'MOD_WEBLINKS_FIELD_CATEGORY_DESC', 'Choose the Web Links category to display.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_weblinks.ini'),
(2470, 'MOD_WEBLINKS_FIELD_COUNT_DESC', 'Number of Web Links to display.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_weblinks.ini'),
(2471, 'MOD_WEBLINKS_FIELD_COUNT_LABEL', 'Count', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_weblinks.ini'),
(2472, 'MOD_WEBLINKS_FIELD_COUNTCLICKS_DESC', 'If set to yes, the number of times the link has been clicked will be recorded.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_weblinks.ini'),
(2473, 'MOD_WEBLINKS_FIELD_COUNTCLICKS_LABEL', 'Count Clicks', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_weblinks.ini'),
(2474, 'MOD_WEBLINKS_FIELD_DESCRIPTION_DESC', 'Display Web Link description.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_weblinks.ini'),
(2475, 'MOD_WEBLINKS_FIELD_DESCRIPTION_LABEL', 'Description', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_weblinks.ini'),
(2476, 'MOD_WEBLINKS_FIELD_FOLLOW_DESC', 'Robots index - allow to follow or not.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_weblinks.ini'),
(2477, 'MOD_WEBLINKS_FIELD_FOLLOW_LABEL', 'Follow/No Follow', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_weblinks.ini'),
(2478, 'MOD_WEBLINKS_FIELD_HITS_DESC', 'Show hits.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_weblinks.ini'),
(2479, 'MOD_WEBLINKS_FIELD_HITS_LABEL', 'Hits', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_weblinks.ini'),
(2480, 'MOD_WEBLINKS_FIELD_ORDERDIRECTION_DESC', 'Set the ordering direction.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_weblinks.ini'),
(2481, 'MOD_WEBLINKS_FIELD_ORDERDIRECTION_LABEL', 'Direction', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_weblinks.ini'),
(2482, 'MOD_WEBLINKS_FIELD_ORDERING_DESC', 'Ordering for the Web Links.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_weblinks.ini'),
(2483, 'MOD_WEBLINKS_FIELD_ORDERING_LABEL', 'Ordering', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_weblinks.ini'),
(2484, 'MOD_WEBLINKS_FIELD_TARGET_DESC', 'Target browser window when the link is selected.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_weblinks.ini'),
(2485, 'MOD_WEBLINKS_FIELD_TARGET_LABEL', 'Target Window', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_weblinks.ini'),
(2486, 'MOD_WEBLINKS_FIELD_VALUE_ASCENDING', 'Ascending', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_weblinks.ini'),
(2487, 'MOD_WEBLINKS_FIELD_VALUE_DESCENDING', 'Descending', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_weblinks.ini'),
(2488, 'MOD_WEBLINKS_FIELD_VALUE_FOLLOW', 'Follow', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_weblinks.ini'),
(2489, 'MOD_WEBLINKS_FIELD_VALUE_HITS', 'Hits', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_weblinks.ini'),
(2490, 'MOD_WEBLINKS_FIELD_VALUE_NOFOLLOW', 'No follow', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_weblinks.ini'),
(2491, 'MOD_WEBLINKS_FIELD_VALUE_ORDER', 'Order', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_weblinks.ini'),
(2492, 'MOD_WEBLINKS_HITS', 'Hits', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_weblinks.ini'),
(2493, 'MOD_WEBLINKS_XML_DESCRIPTION', 'This modules displays web links from a category defined in the Web Links component.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_weblinks.ini'),
(2494, 'MOD_WEBLINKS', 'Web Links', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_weblinks.sys.ini'),
(2495, 'MOD_WEBLINKS_XML_DESCRIPTION', 'This modules displays Web Links from a category defined in the Web Links component.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_weblinks.sys.ini'),
(2496, 'MOD_WEBLINKS_LAYOUT_DEFAULT', 'Default', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_weblinks.sys.ini'),
(2497, 'MOD_WHOSONLINE', 'Who''s Online', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_whosonline.ini'),
(2498, 'MOD_WHOSONLINE_FIELD_FILTER_GROUPS_DESC', 'Choose to filter by groups of the connected user', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_whosonline.ini'),
(2499, 'MOD_WHOSONLINE_FIELD_FILTER_GROUPS_LABEL', 'Filter groups', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_whosonline.ini'),
(2500, 'MOD_WHOSONLINE_FIELD_LINKTOWHAT_DESC', 'Choose the type of information to display', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_whosonline.ini'),
(2501, 'MOD_WHOSONLINE_FIELD_LINKTOWHAT_LABEL', 'Information', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_whosonline.ini'),
(2502, 'MOD_WHOSONLINE_FIELD_VALUE_BOTH', 'Both', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_whosonline.ini'),
(2503, 'MOD_WHOSONLINE_FIELD_VALUE_CONTACT', 'Contact', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_whosonline.ini'),
(2504, 'MOD_WHOSONLINE_FIELD_VALUE_NAMES', 'Usernames', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_whosonline.ini'),
(2505, 'MOD_WHOSONLINE_FIELD_VALUE_NUMBER', '# of Guests / Users', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_whosonline.ini'),
(2506, 'MOD_WHOSONLINE_FIELD_VALUE_PROFILE', 'Profile', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_whosonline.ini'),
(2507, 'MOD_WHOSONLINE_GUESTS', '%s&#160;guests', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_whosonline.ini'),
(2508, 'MOD_WHOSONLINE_GUESTS_1', 'one guest', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_whosonline.ini'),
(2509, 'MOD_WHOSONLINE_GUESTS_0', 'no guests', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_whosonline.ini'),
(2510, 'MOD_WHOSONLINE_MEMBERS', '%s&#160;members', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_whosonline.ini'),
(2511, 'MOD_WHOSONLINE_MEMBERS_1', 'one member', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_whosonline.ini'),
(2512, 'MOD_WHOSONLINE_MEMBERS_0', 'no members', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_whosonline.ini'),
(2513, 'MOD_WHOSONLINE_SAME_GROUP_MESSAGE', 'List of Users who belong to your user groups or your user groups'' child groups', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_whosonline.ini'),
(2514, 'MOD_WHOSONLINE_SHOWMODE_DESC', 'Select what will be shown', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_whosonline.ini'),
(2515, 'MOD_WHOSONLINE_SHOWMODE_LABEL', 'Display', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_whosonline.ini'),
(2516, 'MOD_WHOSONLINE_XML_DESCRIPTION', 'The Who''s Online Module displays the number of Anonymous Users (e.g. Guests) and Registered Users (ones logged-in) that are currently accessing the Web site.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_whosonline.ini'),
(2517, 'MOD_WHOSONLINE_WE_HAVE', 'We have %1$s and %2$s online', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_whosonline.ini'),
(2518, 'MOD_WHOSONLINE', 'Who''s Online', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_whosonline.sys.ini'),
(2519, 'MOD_WHOSONLINE_XML_DESCRIPTION', 'The Who''s Online Module displays the number of Anonymous Users (Guests) and Registered Users (users logged-in) that are currently accessing the website.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_whosonline.sys.ini'),
(2520, 'MOD_WHOSONLINE_LAYOUT_DEFAULT', 'Default', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_whosonline.sys.ini'),
(2521, 'MOD_WRAPPER', 'Wrapper', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_wrapper.ini'),
(2522, 'MOD_WRAPPER_FIELD_ADD_DESC', 'By default, http:// will be added unless it detects http:// or https:// in the URL you provide. This allows you to switch this ability off.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_wrapper.ini'),
(2523, 'MOD_WRAPPER_FIELD_ADD_LABEL', 'Auto Add', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_wrapper.ini'),
(2524, 'MOD_WRAPPER_FIELD_AUTOHEIGHT_DESC', 'The height will automatically be set to the size of the external page. This will only work for pages on your own domain.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_wrapper.ini'),
(2525, 'MOD_WRAPPER_FIELD_AUTOHEIGHT_LABEL', 'Auto Height', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_wrapper.ini'),
(2526, 'MOD_WRAPPER_FIELD_HEIGHT_DESC', 'Height of the iframe window.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_wrapper.ini'),
(2527, 'MOD_WRAPPER_FIELD_HEIGHT_LABEL', 'Height', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_wrapper.ini'),
(2528, 'MOD_WRAPPER_FIELD_SCROLL_DESC', 'Show or hide horizontal &amp; vertical scroll bars.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_wrapper.ini'),
(2529, 'MOD_WRAPPER_FIELD_SCROLL_LABEL', 'Scroll Bars', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_wrapper.ini'),
(2530, 'MOD_WRAPPER_FIELD_TARGET_DESC', 'Name of the iframe when used as target.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_wrapper.ini'),
(2531, 'MOD_WRAPPER_FIELD_TARGET_LABEL', 'Target Name', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_wrapper.ini'),
(2532, 'MOD_WRAPPER_FIELD_URL_DESC', 'URL to site/file you wish to display within the iframe.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_wrapper.ini'),
(2533, 'MOD_WRAPPER_FIELD_URL_LABEL', 'URL', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_wrapper.ini'),
(2534, 'MOD_WRAPPER_FIELD_VALUE_AUTO', 'Auto', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_wrapper.ini'),
(2535, 'MOD_WRAPPER_FIELD_WIDTH_DESC', 'Width of the iframe window. You can enter an absolute figure in pixels or a relative figure by adding a %.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_wrapper.ini'),
(2536, 'MOD_WRAPPER_FIELD_WIDTH_LABEL', 'Width', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_wrapper.ini'),
(2537, 'MOD_WRAPPER_NO_IFRAMES', 'No iframes', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_wrapper.ini'),
(2538, 'MOD_WRAPPER_XML_DESCRIPTION', 'This module shows an iframe window to specified location.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_wrapper.ini'),
(2539, 'MOD_WRAPPER_FIELD_FRAME_LABEL', 'Frame border', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_wrapper.ini'),
(2540, 'MOD_WRAPPER_FIELD_FRAME_DESC', 'Show frame border which wraps the iframe.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_wrapper.ini'),
(2541, 'MOD_WRAPPER', 'Wrapper', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_wrapper.sys.ini'),
(2542, 'MOD_WRAPPER_NO_IFRAMES', 'No iframes', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_wrapper.sys.ini'),
(2543, 'MOD_WRAPPER_XML_DESCRIPTION', 'This module shows an iframe window to specified location.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_wrapper.sys.ini'),
(2544, 'MOD_WRAPPER_LAYOUT_DEFAULT', 'Default', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.mod_wrapper.sys.ini'),
(2545, 'PLG_SEARCH_JCOMMENTS_COMMENTS', 'Comments', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.plg_search_jcomments.ini'),
(2546, 'TPL_BEEZ3_ADDITIONAL_INFORMATION', 'Additional information', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2547, 'TPL_BEEZ3_ALTCLOSE', 'is closed', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2548, 'TPL_BEEZ3_ALTOPEN', 'is open', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2549, 'TPL_BEEZ3_BIGGER', 'Bigger', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2550, 'TPL_BEEZ3_CLICK', 'select', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2551, 'TPL_BEEZ3_CLOSEMENU', 'Close Menu', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2552, 'TPL_BEEZ3_DECREASE_SIZE', 'Decrease size', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2553, 'TPL_BEEZ3_ERROR_JUMP_TO_NAV', 'Jump to navigation', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2554, 'TPL_BEEZ3_FIELD_BOOTSTRAP_DESC', 'Create a comma separated list of any components for which Bootstrap is needed, for example com_name, com_anothername.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2555, 'TPL_BEEZ3_FIELD_BOOTSTRAP_LABEL', 'Components Requiring<br /> Bootstrap', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2556, 'TPL_BEEZ3_FIELD_DESCRIPTION_DESC', 'Please add your site description here.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2557, 'TPL_BEEZ3_FIELD_DESCRIPTION_LABEL', 'Site Description', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2558, 'TPL_BEEZ3_FIELD_HEADER_BACKGROUND_COLOR_DESC', 'Choose a colour for the Background when Custom is selected as the Template Colour. If left blank the Default (#eeeeee) is used.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2559, 'TPL_BEEZ3_FIELD_HEADER_BACKGROUND_COLOR_LABEL', 'Background Colour', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2560, 'TPL_BEEZ3_FIELD_HEADER_IMAGE_DESC', 'Select or upload an image to be used as a header image when the custom colour option is selected.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2561, 'TPL_BEEZ3_FIELD_HEADER_IMAGE_LABEL', 'Header Image', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2562, 'TPL_BEEZ3_FIELD_LOGO_DESC', 'Select or upload an image. If you do not want to display a logo, select Clear and leave the field blank.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2563, 'TPL_BEEZ3_FIELD_LOGO_LABEL', 'Logo', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2564, 'TPL_BEEZ3_FIELD_NAVPOSITION_DESC', 'Navigation before or after content.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2565, 'TPL_BEEZ3_FIELD_NAVPOSITION_LABEL', 'Position of Navigation', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2566, 'TPL_BEEZ3_FIELD_SITETITLE_DESC', 'Please add your site title here, it''s only displayed if you don''t use a logo.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2567, 'TPL_BEEZ3_FIELD_SITETITLE_LABEL', 'Site Title', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2568, 'TPL_BEEZ3_FIELD_TEMPLATECOLOR_DESC', 'Colour of the template.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2569, 'TPL_BEEZ3_FIELD_TEMPLATECOLOR_LABEL', 'Template Colour', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2570, 'TPL_BEEZ3_FIELD_WRAPPERLARGE_DESC', 'Wrapper width with closed additional columns in percent.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2571, 'TPL_BEEZ3_FIELD_WRAPPERLARGE_LABEL', 'Wrapper Large (%)', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2572, 'TPL_BEEZ3_FIELD_WRAPPERSMALL_DESC', 'Wrapper width with opened additional columns in percent.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2573, 'TPL_BEEZ3_FIELD_WRAPPERSMALL_LABEL', 'Wrapper Small (%)', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2574, 'TPL_BEEZ3_FONTSIZE', 'Font Size', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2575, 'TPL_BEEZ3_INCREASE_SIZE', 'Increase size', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2576, 'TPL_BEEZ3_JUMP_TO_INFO', 'Jump to additional information', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2577, 'TPL_BEEZ3_JUMP_TO_NAV', 'Jump to main navigation and login', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2578, 'TPL_BEEZ3_NAVIGATION', 'Navigation', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2579, 'TPL_BEEZ3_NAV_VIEW_SEARCH', 'Nav view search', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2580, 'TPL_BEEZ3_NEXTTAB', 'Next Tab', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2581, 'TPL_BEEZ3_OPENMENU', 'Open Menu', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2582, 'TPL_BEEZ3_OPTION_AFTER_CONTENT', 'after content', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2583, 'TPL_BEEZ3_OPTION_BEFORE_CONTENT', 'before content', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2584, 'TPL_BEEZ3_OPTION_IMAGE', 'Custom', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2585, 'TPL_BEEZ3_OPTION_NATURE', 'Nature', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2586, 'TPL_BEEZ3_OPTION_PERSONAL', 'Personal', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2587, 'TPL_BEEZ3_OPTION_RED', 'Red', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2588, 'TPL_BEEZ3_OPTION_TURQ', 'Turquoise', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2589, 'TPL_BEEZ3_POWERED_BY', 'Powered by', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2590, 'TPL_BEEZ3_RESET', 'Reset', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2591, 'TPL_BEEZ3_REVERT_STYLES_TO_DEFAULT', 'Revert styles to default', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2592, 'TPL_BEEZ3_SEARCH', 'Search', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2593, 'TPL_BEEZ3_SKIP_TO_CONTENT', 'Skip to content', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2594, 'TPL_BEEZ3_SKIP_TO_ERROR_CONTENT', 'Jump to error message and search', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2595, 'TPL_BEEZ3_SMALLER', 'Smaller', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2596, 'TPL_BEEZ3_SYSTEM_MESSAGE', 'Error', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2597, 'TPL_BEEZ3_TEXTRIGHTCLOSE', 'Close info', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2598, 'TPL_BEEZ3_TEXTRIGHTOPEN', 'Open info', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2599, 'TPL_BEEZ3_XML_DESCRIPTION', 'Accessible template for Joomla! Beez, the HTML 4 version.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2600, 'TPL_BEEZ3_YOUR_SITE_DESCRIPTION', 'Your site description', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2601, 'TPL_BEEZ3_POSITION_DEBUG', 'Debug', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.sys.ini'),
(2602, 'TPL_BEEZ3_POSITION_POSITION-0', 'Search', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.sys.ini'),
(2603, 'TPL_BEEZ3_POSITION_POSITION-10', 'Footer middle', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.sys.ini'),
(2604, 'TPL_BEEZ3_POSITION_POSITION-11', 'Footer bottom', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.sys.ini'),
(2605, 'TPL_BEEZ3_POSITION_POSITION-12', 'Middle top', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.sys.ini'),
(2606, 'TPL_BEEZ3_POSITION_POSITION-13', 'Unused', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.sys.ini'),
(2607, 'TPL_BEEZ3_POSITION_POSITION-14', 'Footer last', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.sys.ini'),
(2608, 'TPL_BEEZ3_POSITION_POSITION-15', 'Header', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.sys.ini'),
(2609, 'TPL_BEEZ3_POSITION_POSITION-1', 'Top', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.sys.ini'),
(2610, 'TPL_BEEZ3_POSITION_POSITION-2', 'Breadcrumbs', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.sys.ini'),
(2611, 'TPL_BEEZ3_POSITION_POSITION-3', 'Right bottom', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.sys.ini'),
(2612, 'TPL_BEEZ3_POSITION_POSITION-4', 'Left middle', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.sys.ini'),
(2613, 'TPL_BEEZ3_POSITION_POSITION-5', 'Left bottom', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.sys.ini'),
(2614, 'TPL_BEEZ3_POSITION_POSITION-6', 'Right top', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.sys.ini'),
(2615, 'TPL_BEEZ3_POSITION_POSITION-7', 'Left top', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.sys.ini'),
(2616, 'TPL_BEEZ3_POSITION_POSITION-8', 'Right middle', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.sys.ini'),
(2617, 'TPL_BEEZ3_POSITION_POSITION-9', 'Footer top', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.sys.ini'),
(2618, 'TPL_BEEZ3_XML_DESCRIPTION', 'Accessible template for Joomla! Beez, the HTML 4 version.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_beez3.sys.ini'),
(2619, 'TPL_PROTOSTAR_XML_DESCRIPTION', 'Continuing the space theme (Solarflare from 1.0 and Milkyway from 1.5), Protostar is the Joomla 3 site template based on Bootstrap from Twitter and the launch of the Joomla User Interface library (JUI).', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_protostar.ini'),
(2620, 'TPL_PROTOSTAR_BACKGROUND_COLOR_DESC', 'Choose a background colour for static layouts. If left blank the Default (#f4f6f7) is used.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_protostar.ini'),
(2621, 'TPL_PROTOSTAR_BACKGROUND_COLOR_LABEL', 'Background Colour', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_protostar.ini'),
(2622, 'TPL_PROTOSTAR_BACKTOTOP', 'Back to Top', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_protostar.ini'),
(2623, 'TPL_PROTOSTAR_COLOR_DESC', 'Choose an overall colour for the site template. If left blank the Default (#0088cc) is used.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_protostar.ini'),
(2624, 'TPL_PROTOSTAR_COLOR_LABEL', 'Template Colour', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_protostar.ini'),
(2625, 'TPL_PROTOSTAR_FLUID', 'Fluid', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_protostar.ini'),
(2626, 'TPL_PROTOSTAR_FLUID_LABEL', 'Fluid Layout', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_protostar.ini'),
(2627, 'TPL_PROTOSTAR_FLUID_DESC', 'Use Bootstrap''s Fluid or Static Container (both are Responsive).', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_protostar.ini'),
(2628, 'TPL_PROTOSTAR_FONT_LABEL', 'Google Font for Headings', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_protostar.ini'),
(2629, 'TPL_PROTOSTAR_FONT_DESC', 'Load a Google font for the headings (H1, H2, H3, etc).', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_protostar.ini'),
(2630, 'TPL_PROTOSTAR_FONT_NAME_LABEL', 'Google Font Name', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_protostar.ini'),
(2631, 'TPL_PROTOSTAR_FONT_NAME_DESC', 'Example: Open+Sans or Source+Sans+Pro.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_protostar.ini'),
(2632, 'TPL_PROTOSTAR_LOGO_LABEL', 'Logo', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_protostar.ini'),
(2633, 'TPL_PROTOSTAR_LOGO_DESC', 'Select or upload a custom logo for the site template.', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_protostar.ini'),
(2634, 'TPL_PROTOSTAR_STATIC', 'Static', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_protostar.ini'),
(2635, 'TPL_PROTOSTAR_POSITION_BANNER', 'Banner', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_protostar.sys.ini'),
(2636, 'TPL_PROTOSTAR_POSITION_DEBUG', 'Debug', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_protostar.sys.ini'),
(2637, 'TPL_PROTOSTAR_POSITION_POSITION-0', 'Search', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_protostar.sys.ini'),
(2638, 'TPL_PROTOSTAR_POSITION_POSITION-10', 'Unused', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_protostar.sys.ini'),
(2639, 'TPL_PROTOSTAR_POSITION_POSITION-11', 'Unused', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_protostar.sys.ini'),
(2640, 'TPL_PROTOSTAR_POSITION_POSITION-12', 'Unused', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_protostar.sys.ini'),
(2641, 'TPL_PROTOSTAR_POSITION_POSITION-13', 'Unused', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_protostar.sys.ini'),
(2642, 'TPL_PROTOSTAR_POSITION_POSITION-14', 'Unused', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_protostar.sys.ini'),
(2643, 'TPL_PROTOSTAR_POSITION_POSITION-15', 'Unused', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_protostar.sys.ini'),
(2644, 'TPL_PROTOSTAR_POSITION_POSITION-1', 'Navigation', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_protostar.sys.ini'),
(2645, 'TPL_PROTOSTAR_POSITION_POSITION-2', 'Breadcrumbs', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_protostar.sys.ini'),
(2646, 'TPL_PROTOSTAR_POSITION_POSITION-3', 'Top centre', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_protostar.sys.ini'),
(2647, 'TPL_PROTOSTAR_POSITION_POSITION-4', 'Unused', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_protostar.sys.ini'),
(2648, 'TPL_PROTOSTAR_POSITION_POSITION-5', 'Unused', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_protostar.sys.ini'),
(2649, 'TPL_PROTOSTAR_POSITION_POSITION-6', 'Unused', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_protostar.sys.ini'),
(2650, 'TPL_PROTOSTAR_POSITION_POSITION-7', 'Right', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_protostar.sys.ini'),
(2651, 'TPL_PROTOSTAR_POSITION_POSITION-8', 'Left', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_protostar.sys.ini'),
(2652, 'TPL_PROTOSTAR_POSITION_POSITION-9', 'Unused', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_protostar.sys.ini'),
(2653, 'TPL_PROTOSTAR_POSITION_FOOTER', 'Footer', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_protostar.sys.ini'),
(2654, 'TPL_PROTOSTAR_XML_DESCRIPTION', 'Continuing the space theme (Solarflare from 1.0 and Milkyway from 1.5), Protostar is the Joomla 3 site template based on Bootstrap from Twitter and the launch of the Joomla User Interface library (JUI).', 'C:\\wamp\\www\\travelify\\language\\en-GB\\en-GB.tpl_protostar.sys.ini'),
(2655, 'LINK_READ_COMMENTS', 'Comments (%s)', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2656, 'LINK_READ_COMMENTS_1', '%s comment', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2657, 'LINK_READ_COMMENTS_MORE', '%s comments', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2658, 'LINK_ADD_COMMENT', 'Add new comment', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2659, 'LINK_READ_MORE', 'More...', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2660, 'LINK_REGISTER_TO_READ_MORE', 'Register to read more...', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2661, 'ARTICLE_HITS', 'Hits: %s', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2662, 'COMMENTS_LIST_HEADER', 'Comments', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2663, 'COMMENT_TITLE_RE', 'RE:', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2664, 'COMMENT_TEXT_CODE', 'Code:', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2665, 'COMMENT_TEXT_COMMENT_HAS_BEEN_DELETED', 'This comment has been deleted by Administrator', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2666, 'COMMENT_TEXT_QUOTE', 'Quote:', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2667, 'COMMENT_TEXT_QUOTE_EXTENDED', 'Quoting %s:', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2668, 'BUTTON_QUOTE', 'Quote', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2669, 'BUTTON_REPLY', 'Reply', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2670, 'BUTTON_REPLY_WITH_QUOTE', 'Reply with quote', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2671, 'BUTTON_RSS', 'RSS feed for comments to this post', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2672, 'BUTTON_REFRESH', 'Refresh comments list', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2673, 'BUTTON_VOTE_GOOD', 'Good comment!', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2674, 'BUTTON_VOTE_BAD', 'Bad comment!', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2675, 'BUTTON_REPORT', 'Report to administrator', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2676, 'DATE_FORMAT', 'Y-m-d', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2677, 'TIME_FORMAT', 'H:i', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2678, 'DATETIME_FORMAT', 'Y-m-d H:i', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2679, 'OBJECT_FEED_DESCRIPTION', 'Discuss %s', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2680, 'OBJECT_FEED_ITEM_TITLE', '%s says:', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2681, 'SITE_FEED_TITLE', 'Comments', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2682, 'SITE_FEED_DESCRIPTION', 'Discuss %s', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2683, 'SITE_FEED_ITEM_DESCRIPTION', '%s says: &quot;%s&quot;', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2684, 'USER_FEED_TITLE', 'Comments by &quot;%s&quot;', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2685, 'USER_FEED_DESCRIPTION', 'Comments by user &quot;%s&quot;', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2686, 'USER_FEED_ITEM_DESCRIPTION', '%s says: &quot;%s&quot;', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2687, 'FORM_HEADER', 'Add comment', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2688, 'FORM_SEND', 'Send', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2689, 'FORM_SEND_HINT', 'Send (Ctrl+Enter)', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2690, 'FORM_NAME', 'Name', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2691, 'FORM_NAME_REQUIRED', 'Name (required)', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2692, 'FORM_EMAIL', 'E-mail', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini');
INSERT INTO `hyxu5_overrider` (`id`, `constant`, `string`, `file`) VALUES
(2693, 'FORM_EMAIL_REQUIRED', 'E-mail (required, but will not display)', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2694, 'FORM_HOMEPAGE', 'Website', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2695, 'FORM_HOMEPAGE_REQUIRED', 'Website (required)', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2696, 'FORM_TITLE', 'Title', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2697, 'FORM_TITLE_REQUIRED', 'Title (required)', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2698, 'FORM_CHARSLEFT_PREFIX', '', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2699, 'FORM_CHARSLEFT_SUFFIX', ' symbols left', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2700, 'FORM_CAPTCHA', 'Security code', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2701, 'FORM_CAPTCHA_REFRESH', 'Refresh', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2702, 'FORM_CAPTCHA_DESC', 'This step helps prevent unfair use of automated programs. If you can not read this code click on Refresh link and try a different one.', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2703, 'FORM_SAVE', 'Save', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2704, 'FORM_CANCEL', 'Cancel', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2705, 'FORM_SUBSCRIBE', 'Notify me of follow-up comments', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2706, 'FORM_BBCODE_B', 'Bold', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2707, 'FORM_BBCODE_I', 'Italic', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2708, 'FORM_BBCODE_U', 'Underlined', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2709, 'FORM_BBCODE_S', 'Striked', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2710, 'FORM_BBCODE_URL', 'Link', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2711, 'FORM_BBCODE_IMG', 'Image', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2712, 'FORM_BBCODE_QUOTE', 'Quote', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2713, 'FORM_BBCODE_LIST', 'List', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2714, 'FORM_BBCODE_HIDE', 'Hidden text (only for registered)', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2715, 'BBCODE_HINT_ENTER_TEXT', 'Enter text', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2716, 'BBCODE_HINT_ENTER_FULL_URL_TO_THE_IMAGE', 'Enter full URL to the image', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2717, 'BBCODE_HINT_ENTER_FULL_URL', 'Enter full URL', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2718, 'BBCODE_HINT_ENTER_TEXT_TO_QUOTE', 'Enter text to quote', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2719, 'BBCODE_HINT_ENTER_LIST_ITEM_TEXT', 'Enter list item text', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2720, 'BBCODE_HINT_ENTER_TEXT_TO_HIDE_IT_FROM_UNREGISTERED', 'Enter text to hide from unregistered', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2721, 'BBCODE_MESSAGE_HIDDEN_TEXT', 'Only registered users can view hidden text!', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2722, 'BUTTON_EDIT', 'Change', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2723, 'BUTTON_DELETE', 'Delete', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2724, 'BUTTON_DELETE_CONIRM', 'Delete comment?', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2725, 'BUTTON_PUBLISH', 'Publish', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2726, 'BUTTON_UNPUBLISH', 'Unpublish', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2727, 'BUTTON_IP', 'IP', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2728, 'BUTTON_MAILTO', 'Write e-mail', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2729, 'BUTTON_BANIP', 'Ban IP', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2730, 'NOTIFICATION_SUBJECT_NEW', 'Comment has been added: %s', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2731, 'NOTIFICATION_SUBJECT_UPDATED', 'Comment has been changed: %s', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2732, 'NOTIFICATION_DISCUSSION', 'Discuss:', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2733, 'NOTIFICATION_COMMENT_TITLE', 'Content item title', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2734, 'NOTIFICATION_COMMENT_LINK', 'Link to the comment', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2735, 'NOTIFICATION_COMMENT_DATE', 'Date', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2736, 'NOTIFICATION_COMMENT_NAME', 'Comment author', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2737, 'NOTIFICATION_COMMENT_EMAIL', 'Author''s E-mail', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2738, 'NOTIFICATION_COMMENT_HOMEPAGE', 'Author''s site', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2739, 'NOTIFICATION_COMMENT_TEXT', 'Comment text', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2740, 'NOTIFICATION_COMMENT_UNSUBSCRIBE_MESSAGE', 'This message was sent to you because you chose to be notified about new comments related to &quot;%s&quot;. You can unsubscribe by clicking on the link below', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2741, 'NOTIFICATION_COMMENT_UNSUBSCRIBE_LINK', 'Unsubscribe', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2742, 'BUTTON_UNSUBSCRIBE', 'Unsubscribe', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2743, 'BUTTON_SUBSCRIBE', 'Subscribe', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2744, 'SUCCESSFULLY_UNSUBSCRIBED', 'You have been successfully unsubscribed!', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2745, 'ERROR_ALREADY_SUBSCRIBED', 'Already subscribed!', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2746, 'REPORT_TO_ADMINISTRATOR', 'Report to administrator', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2747, 'REPORT_NAME', 'Name', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2748, 'REPORT_GUEST', 'Guest', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2749, 'REPORT_REASON', 'Reason', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2750, 'REPORT_REASON_UNKNOWN_REASON', 'Unknown reason', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2751, 'REPORT_SUBMIT', 'Submit', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2752, 'REPORT_CANCEL', 'Cancel', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2753, 'REPORT_SUCCESSFULLY_SENT', 'Report successfully sent!', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2754, 'ERROR_COMMENT_ALREADY_REPORTED', 'Comment already reported to the site administrator', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2755, 'REPORT_NOTIFICATION_SUBJECT', 'Reported comment', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2756, 'REPORT_NOTIFICATION_MESSAGE', 'The following comment by &quot;%1$s&quot; has been reported by &quot;%2$s&quot;', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2757, 'REPORT_NOTIFICATION_MESSAGE_REASON', 'The reporter gave the following reason', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2758, 'THANK_YOU_FOR_YOUR_SUBMISSION', 'Thank you for your submission!', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2759, 'THANK_YOU_YOUR_COMMENT_WILL_BE_PUBLISHED_ONCE_REVIEWED', 'Thank you, your comment will be published once reviewed.', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2760, 'ERROR_EMPTY_NAME', 'Please enter your name!', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2761, 'ERROR_NAME_EXISTS', 'This name is already in use. Please login or try another name.', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2762, 'ERROR_EMAIL_EXISTS', 'This e-mail address is already used by a registered user. Please login or try another address.', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2763, 'ERROR_FORBIDDEN_NAME', 'Specified name is located in the list of forbidden words.\\nPlease try another name.', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2764, 'ERROR_INVALID_NAME', 'This name consists of forbidden symbols.\\nPlease do not use quotation marks or square brackets [ and ] in the name.', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2765, 'ERROR_YOUR_COMMENT_IS_TOO_LONG', 'Comment is too long!', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2766, 'ERROR_YOUR_COMMENT_IS_TOO_SHORT', 'Your comment is too short!', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2767, 'ERROR_NOTHING_EXCEPT_QUOTES', 'Your message consists only of a quote of another comment. May be you forgot to comment this quote?', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2768, 'ERROR_TOO_LONG_USERNAME', 'Username is too long!', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2769, 'ERROR_TOO_QUICK', 'You have recently added a new comment, please try again later.', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2770, 'ERROR_NOTHING_TO_QUOTE', 'There is no text for quoting!', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2771, 'ERROR_EMPTY_EMAIL', 'Please enter your e-mail!', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2772, 'ERROR_INCORRECT_EMAIL', 'Please enter a valid e-mail!', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2773, 'ERROR_EMPTY_HOMEPAGE', 'Please enter site URL!', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2774, 'ERROR_EMPTY_TITLE', 'Please enter a comment title!', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2775, 'ERROR_EMPTY_COMMENT', 'Please enter text of your comment!', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2776, 'ERROR_CAPTCHA', 'Please enter security code displayed in the image!', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2777, 'ERROR_DUPLICATE_COMMENT', 'You have already posted the same comment.', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2778, 'ERROR_CANT_COMMENT', 'You have no rights to add a new comment. May be you need to register on the site.', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2779, 'ERROR_CANT_DELETE', 'You have no rights to delete comments.', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2780, 'ERROR_CANT_PUBLISH', 'You have no rights for publishing comments.', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2781, 'ERROR_CANT_EDIT', 'You have no rights for editing comments.', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2782, 'ERROR_BEING_EDITTED', 'This comment is currently being edited by another person', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2783, 'ERROR_NOT_FOUND', 'Can not find comment message!\\n May be it has been deleted or unpublished by administrator.', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2784, 'ERROR_ALREADY_VOTED', 'You have already voted for this comment!', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2785, 'ERROR_CANT_VOTE', 'You do not have enough rights to vote!', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2786, 'ERROR_SUBSCRIPTION_EMAIL', 'Provide your e-mail to receive notifications about new comments.', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2787, 'ERROR_YOU_HAVE_NO_RIGHTS_TO_USE_THIS_TAG', 'You have no rights to use this tag.', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2788, 'ERROR_YOU_CAN_NOT_REPORT_THE_SAME_COMMENT_MORE_THAN_ONCE', 'You can not report the same comment more than once!', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2789, 'ERROR_YOU_HAVE_NO_RIGHTS_TO_REPORT', 'You have no rights to report a comment!', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2790, 'ERROR_NO_REASON_FOR_REPORT', 'Please enter the reason for your report!', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2791, 'ERROR_SESSION_EXPIRED', 'Your session has expired. Please log in again.', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2792, 'SUCCESSFULLY_BANNED', 'IP-address of this comment''s author has been successfully blacklisted.', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2793, 'ERROR_IP_ALREADY_BANNED', 'IP-address of this comment''s author is already blacklisted!', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2794, 'ERROR_YOU_CAN_NOT_BAN_YOUR_IP', 'You can not blacklist your own current IP-address!', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2795, 'QUICK_MODERATION', 'Quick moderation', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2796, 'ERROR_QUICK_MODERATION_DISABLED', 'Quick moderation function is disabled by administrator!', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2797, 'ERROR_QUICK_MODERATION_INCORRECT_HASH', 'Incorrect hash for this operation!', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.com_jcomments.ini'),
(2798, 'PLG_SEARCH_JCOMMENTS_COMMENTS', 'Comments', 'C:\\wamp\\www\\travelify\\components\\com_jcomments\\languages\\en-GB.plg_search_jcomments.ini'),
(2799, 'MOD_BM_COOL_MENU', 'Menu', 'C:\\wamp\\www\\travelify\\modules\\mod_bm_cool_menu\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(2800, 'MOD_BM_COOL_MENU_FIELD_ACTIVE_DESC', 'BM Cool Menu help you show menu with many configs for color. You can config almost color on menu (text, background, active background, border). Visit our website <a href=''http://www.brainymore.com'' target=''_blank''>Brainymore.com</a> to see our new products.', 'C:\\wamp\\www\\travelify\\modules\\mod_bm_cool_menu\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(2801, 'MOD_BM_COOL_MENU_FIELD_ACTIVE_LABEL', 'Base Item', 'C:\\wamp\\www\\travelify\\modules\\mod_bm_cool_menu\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(2802, 'MOD_BM_COOL_MENU_FIELD_ALLCHILDREN_DESC', 'Expand the menu and make its sub-menu items always visible.', 'C:\\wamp\\www\\travelify\\modules\\mod_bm_cool_menu\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(2803, 'MOD_BM_COOL_MENU_FIELD_ALLCHILDREN_LABEL', 'Show Sub-menu Items', 'C:\\wamp\\www\\travelify\\modules\\mod_bm_cool_menu\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(2804, 'MOD_BM_COOL_MENU_FIELD_CLASS_DESC', 'A suffix to be applied to the CSS class of the menu items', 'C:\\wamp\\www\\travelify\\modules\\mod_bm_cool_menu\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(2805, 'MOD_BM_COOL_MENU_FIELD_CLASS_LABEL', 'Menu Class Suffix', 'C:\\wamp\\www\\travelify\\modules\\mod_bm_cool_menu\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(2806, 'MOD_BM_COOL_MENU_FIELD_ENDLEVEL_DESC', 'Level to stop rendering the menu at. If you choose ''All'', all levels will be shown depending on ''Show Sub-menu Items'' setting.', 'C:\\wamp\\www\\travelify\\modules\\mod_bm_cool_menu\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(2807, 'MOD_BM_COOL_MENU_FIELD_ENDLEVEL_LABEL', 'End Level', 'C:\\wamp\\www\\travelify\\modules\\mod_bm_cool_menu\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(2808, 'MOD_BM_COOL_MENU_FIELD_MENUTYPE_DESC', 'Select a menu in the list', 'C:\\wamp\\www\\travelify\\modules\\mod_bm_cool_menu\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(2809, 'MOD_BM_COOL_MENU_FIELD_MENUTYPE_LABEL', 'Select Menu', 'C:\\wamp\\www\\travelify\\modules\\mod_bm_cool_menu\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(2810, 'MOD_BM_COOL_MENU_FIELD_STARTLEVEL_DESC', 'Level to start rendering the menu at. Setting the start and end levels to the same # and setting ''Show Sub-menu Items'' to yes will only display that single level.', 'C:\\wamp\\www\\travelify\\modules\\mod_bm_cool_menu\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(2811, 'MOD_BM_COOL_MENU_FIELD_STARTLEVEL_LABEL', 'Start Level', 'C:\\wamp\\www\\travelify\\modules\\mod_bm_cool_menu\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(2812, 'MOD_BM_COOL_MENU_FIELD_TAG_ID_DESC', 'An ID attribute to assign to the root UL tag of the menu (optional)', 'C:\\wamp\\www\\travelify\\modules\\mod_bm_cool_menu\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(2813, 'MOD_BM_COOL_MENU_FIELD_TAG_ID_LABEL', 'Menu Tag ID', 'C:\\wamp\\www\\travelify\\modules\\mod_bm_cool_menu\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(2814, 'MOD_BM_COOL_MENU_FIELD_TARGET_DESC', 'JavaScript values to position a popup window, e.g. top=50,left=50,width=200,height=300', 'C:\\wamp\\www\\travelify\\modules\\mod_bm_cool_menu\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(2815, 'MOD_BM_COOL_MENU_FIELD_TARGET_LABEL', 'Target Position', 'C:\\wamp\\www\\travelify\\modules\\mod_bm_cool_menu\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(2816, 'MOD_BM_COOL_MENU_XML_DESCRIPTION', 'BM Cool Menu help you show menu with many configs for color. You can config almost color on menu (text, background, active background, border). Visit our website <a href=''http://www.brainymore.com'' target=''_blank''>Brainymore.com</a> to see our new products.', 'C:\\wamp\\www\\travelify\\modules\\mod_bm_cool_menu\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(2817, 'MOD_BM_TEXT_COLOR', 'Text color', 'C:\\wamp\\www\\travelify\\modules\\mod_bm_cool_menu\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(2818, 'MOD_BM_TEXT_COLOR_DESC', 'Color for text', 'C:\\wamp\\www\\travelify\\modules\\mod_bm_cool_menu\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(2819, 'MOD_BM_TEXT_HOVER_COLOR', 'Hover text color', 'C:\\wamp\\www\\travelify\\modules\\mod_bm_cool_menu\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(2820, 'MOD_BM_TEXT_HOVER_COLOR_DESC', 'Color for text when hover menu item', 'C:\\wamp\\www\\travelify\\modules\\mod_bm_cool_menu\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(2821, 'MOD_BM_BACKGROUND_COLOR', 'Menu''s background', 'C:\\wamp\\www\\travelify\\modules\\mod_bm_cool_menu\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(2822, 'MOD_BM_BACKGROUND_COLOR_DESC', 'Background for menu', 'C:\\wamp\\www\\travelify\\modules\\mod_bm_cool_menu\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(2823, 'MOD_BM_BACKGROUND_IMAGE', 'Background image', 'C:\\wamp\\www\\travelify\\modules\\mod_bm_cool_menu\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(2824, 'MOD_BM_BACKGROUND_IMAGE_DESC', 'You can config css (background-image) for menu. <br> Fomart:<br>\nbackground-image: -moz-linear-gradient(#2B547E, #2B3856);<br> \nbackground-image: -webkit-gradient(linear, left top, left bottom, from(#2B547E), to(#2B3856));<br>	\nbackground-image: -webkit-linear-gradient(#2B547E, #2B3856);<br>	\nbackground-image: -o-linear-gradient(#2B547E, #2B3856);<br>\nbackground-image: -ms-linear-gradient(#2B547E, #2B3856);<br>\nbackground-image: linear-gradient(#2B547E, #2B3856);', 'C:\\wamp\\www\\travelify\\modules\\mod_bm_cool_menu\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(2825, 'MOD_BM_SHOW_BORDER', 'Show border', 'C:\\wamp\\www\\travelify\\modules\\mod_bm_cool_menu\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(2826, 'MOD_BM_SHOW_BORDER_DESC', 'Show border or not', 'C:\\wamp\\www\\travelify\\modules\\mod_bm_cool_menu\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(2827, 'MOD_BM_BORDER_RADIUS', 'Border radius', 'C:\\wamp\\www\\travelify\\modules\\mod_bm_cool_menu\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(2828, 'MOD_BM_BORDER_RADIUS_DESC', 'Config border radius (1px,2px ...)', 'C:\\wamp\\www\\travelify\\modules\\mod_bm_cool_menu\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(2829, 'MOD_BM_BORDER_COLOR', 'Border color', 'C:\\wamp\\www\\travelify\\modules\\mod_bm_cool_menu\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(2830, 'MOD_BM_BORDER_COLOR_DESC', 'Set color for border', 'C:\\wamp\\www\\travelify\\modules\\mod_bm_cool_menu\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(2831, 'MOD_BM_BACKGROUND_COLOR_ACTIVE', 'Active background', 'C:\\wamp\\www\\travelify\\modules\\mod_bm_cool_menu\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(2832, 'MOD_BM_BACKGROUND_COLOR_ACTIVE_DESC', 'Background color for active item', 'C:\\wamp\\www\\travelify\\modules\\mod_bm_cool_menu\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(2833, 'MOD_BM_JQUERY', 'Load jQuery', 'C:\\wamp\\www\\travelify\\modules\\mod_bm_cool_menu\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(2834, 'MOD_BM_JQUERY_DESC', 'Load jQuery or not', 'C:\\wamp\\www\\travelify\\modules\\mod_bm_cool_menu\\language\\en-GB\\en-GB.mod_bm_cool_menu.ini'),
(2835, 'MOD_BM_COOL_MENU', 'Menu', 'C:\\wamp\\www\\travelify\\modules\\mod_bm_cool_menu\\language\\en-GB\\en-GB.mod_bm_cool_menu.sys.ini'),
(2836, 'MOD_BM_COOL_MENU_XML_DESCRIPTION', 'BM Cool Menu help you show menu with many configs for color. You can config almost color on menu (text, background, active background, border). Visit our website <a href=''http://www.brainymore.com'' target=''_blank''>Brainymore.com</a> to see our new products.', 'C:\\wamp\\www\\travelify\\modules\\mod_bm_cool_menu\\language\\en-GB\\en-GB.mod_bm_cool_menu.sys.ini'),
(2837, 'MOD_BM_COOL_MENU_LAYOUT_DEFAULT', 'Default', 'C:\\wamp\\www\\travelify\\modules\\mod_bm_cool_menu\\language\\en-GB\\en-GB.mod_bm_cool_menu.sys.ini'),
(2838, 'TPL_BEEZ3_ADDITIONAL_INFORMATION', 'Additional information', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2839, 'TPL_BEEZ3_ALTCLOSE', 'is closed', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2840, 'TPL_BEEZ3_ALTOPEN', 'is open', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2841, 'TPL_BEEZ3_BIGGER', 'Bigger', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2842, 'TPL_BEEZ3_CLICK', 'select', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2843, 'TPL_BEEZ3_CLOSEMENU', 'Close Menu', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2844, 'TPL_BEEZ3_DECREASE_SIZE', 'Decrease size', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2845, 'TPL_BEEZ3_ERROR_JUMP_TO_NAV', 'Jump to navigation', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2846, 'TPL_BEEZ3_FIELD_BOOTSTRAP_DESC', 'Create a comma separated list of any components for which Bootstrap is needed, for example com_name, com_anothername.', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2847, 'TPL_BEEZ3_FIELD_BOOTSTRAP_LABEL', 'Components Requiring<br /> Bootstrap', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2848, 'TPL_BEEZ3_FIELD_DESCRIPTION_DESC', 'Please add your site description here.', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2849, 'TPL_BEEZ3_FIELD_DESCRIPTION_LABEL', 'Site Description', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2850, 'TPL_BEEZ3_FIELD_HEADER_BACKGROUND_COLOR_DESC', 'Choose a colour for the Background when Custom is selected as the Template Colour. If left blank the Default (#eeeeee) is used.', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2851, 'TPL_BEEZ3_FIELD_HEADER_BACKGROUND_COLOR_LABEL', 'Background Colour', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2852, 'TPL_BEEZ3_FIELD_HEADER_IMAGE_DESC', 'Use the selected header image when Custom is selected as the Template Colour', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2853, 'TPL_BEEZ3_FIELD_HEADER_IMAGE_LABEL', 'Header Image', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2854, 'TPL_BEEZ3_FIELD_LOGO_DESC', 'Please choose an image. If you do not want to display a logo, select Clear and leave the field blank.', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2855, 'TPL_BEEZ3_FIELD_LOGO_LABEL', 'Logo', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2856, 'TPL_BEEZ3_FIELD_NAVPOSITION_DESC', 'Navigation before or after content.', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2857, 'TPL_BEEZ3_FIELD_NAVPOSITION_LABEL', 'Position of Navigation', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2858, 'TPL_BEEZ3_FIELD_SITETITLE_DESC', 'Please add your site title here, it''s only displayed if you don''t use a logo.', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2859, 'TPL_BEEZ3_FIELD_SITETITLE_LABEL', 'Site Title', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2860, 'TPL_BEEZ3_FIELD_TEMPLATECOLOR_DESC', 'Colour of the template.', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2861, 'TPL_BEEZ3_FIELD_TEMPLATECOLOR_LABEL', 'Template colour', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2862, 'TPL_BEEZ3_FIELD_WRAPPERLARGE_DESC', 'Wrapper width with closed additional columns in percent.', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2863, 'TPL_BEEZ3_FIELD_WRAPPERLARGE_LABEL', 'Wrapper Large (%)', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2864, 'TPL_BEEZ3_FIELD_WRAPPERSMALL_DESC', 'Wrapper width with opened additional columns in percent.', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2865, 'TPL_BEEZ3_FIELD_WRAPPERSMALL_LABEL', 'Wrapper Small (%)', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2866, 'TPL_BEEZ3_FONTSIZE', 'Font size', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2867, 'TPL_BEEZ3_INCREASE_SIZE', 'Increase size', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2868, 'TPL_BEEZ3_JUMP_TO_INFO', 'Jump to additional information', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2869, 'TPL_BEEZ3_JUMP_TO_NAV', 'Jump to main navigation and login', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2870, 'TPL_BEEZ3_NAVIGATION', 'Navigation', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2871, 'TPL_BEEZ3_NAV_VIEW_SEARCH', 'Nav view search', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2872, 'TPL_BEEZ3_NEXTTAB', 'Next Tab', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2873, 'TPL_BEEZ3_OPENMENU', 'Open Menu', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2874, 'TPL_BEEZ3_OPTION_AFTER_CONTENT', 'after content', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2875, 'TPL_BEEZ3_OPTION_BEFORE_CONTENT', 'before content', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2876, 'TPL_BEEZ3_OPTION_IMAGE', 'Custom', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2877, 'TPL_BEEZ3_OPTION_NATURE', 'Nature', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2878, 'TPL_BEEZ3_OPTION_PERSONAL', 'Personal', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2879, 'TPL_BEEZ3_OPTION_RED', 'Red', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2880, 'TPL_BEEZ3_OPTION_TURQ', 'Turquoise', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2881, 'TPL_BEEZ3_POWERED_BY', 'Powered by', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2882, 'TPL_BEEZ3_RESET', 'Reset', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2883, 'TPL_BEEZ3_REVERT_STYLES_TO_DEFAULT', 'Revert styles to default', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2884, 'TPL_BEEZ3_SEARCH', 'Search', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2885, 'TPL_BEEZ3_SKIP_TO_CONTENT', 'Skip to content', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2886, 'TPL_BEEZ3_SKIP_TO_ERROR_CONTENT', 'Jump to error message and search', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2887, 'TPL_BEEZ3_SMALLER', 'Smaller', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2888, 'TPL_BEEZ3_SYSTEM_MESSAGE', 'Error', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2889, 'TPL_BEEZ3_TEXTRIGHTCLOSE', 'Close info', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2890, 'TPL_BEEZ3_TEXTRIGHTOPEN', 'Open info', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2891, 'TPL_BEEZ3_XML_DESCRIPTION', 'Accessible template for Joomla! Beez, the HTML 4 version.', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2892, 'TPL_BEEZ3_YOUR_SITE_DESCRIPTION', 'Your site description', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.ini'),
(2893, 'TPL_BEEZ3_POSITION_DEBUG', 'Debug', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.sys.ini'),
(2894, 'TPL_BEEZ3_POSITION_POSITION-0', 'Search', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.sys.ini'),
(2895, 'TPL_BEEZ3_POSITION_POSITION-10', 'Footer middle', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.sys.ini'),
(2896, 'TPL_BEEZ3_POSITION_POSITION-11', 'Footer bottom', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.sys.ini'),
(2897, 'TPL_BEEZ3_POSITION_POSITION-12', 'Middle top', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.sys.ini'),
(2898, 'TPL_BEEZ3_POSITION_POSITION-13', 'Unused', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.sys.ini'),
(2899, 'TPL_BEEZ3_POSITION_POSITION-14', 'Footer last', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.sys.ini'),
(2900, 'TPL_BEEZ3_POSITION_POSITION-15', 'Header', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.sys.ini'),
(2901, 'TPL_BEEZ3_POSITION_POSITION-1', 'Top', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.sys.ini'),
(2902, 'TPL_BEEZ3_POSITION_POSITION-2', 'Breadcrumbs', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.sys.ini'),
(2903, 'TPL_BEEZ3_POSITION_POSITION-3', 'Right bottom', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.sys.ini'),
(2904, 'TPL_BEEZ3_POSITION_POSITION-4', 'Left middle', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.sys.ini'),
(2905, 'TPL_BEEZ3_POSITION_POSITION-5', 'Left bottom', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.sys.ini'),
(2906, 'TPL_BEEZ3_POSITION_POSITION-6', 'Right top', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.sys.ini'),
(2907, 'TPL_BEEZ3_POSITION_POSITION-7', 'Left top', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.sys.ini'),
(2908, 'TPL_BEEZ3_POSITION_POSITION-8', 'Right middle', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.sys.ini'),
(2909, 'TPL_BEEZ3_POSITION_POSITION-9', 'Footer top', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.sys.ini'),
(2910, 'TPL_BEEZ3_XML_DESCRIPTION', 'Accessible template for Joomla! Beez, the HTML 4 version.', 'C:\\wamp\\www\\travelify\\templates\\beez3\\language\\en-GB\\en-GB.tpl_beez3.sys.ini'),
(2911, 'TPL_PROTOSTAR_XML_DESCRIPTION', 'Continuing the space theme (Solarflare from 1.0 and Milkyway from 1.5), Protostar is the Joomla 3 site template based on Bootstrap from Twitter and the launch of the Joomla User Interface library (JUI).', 'C:\\wamp\\www\\travelify\\templates\\protostar\\language\\en-GB\\en-GB.tpl_protostar.ini'),
(2912, 'TPL_PROTOSTAR_BACKGROUND_COLOR_DESC', 'Choose a background colour for static layouts. If left blank the Default (#f4f6f7) is used.', 'C:\\wamp\\www\\travelify\\templates\\protostar\\language\\en-GB\\en-GB.tpl_protostar.ini'),
(2913, 'TPL_PROTOSTAR_BACKGROUND_COLOR_LABEL', 'Background Colour', 'C:\\wamp\\www\\travelify\\templates\\protostar\\language\\en-GB\\en-GB.tpl_protostar.ini'),
(2914, 'TPL_PROTOSTAR_BACKTOTOP', 'Back to Top', 'C:\\wamp\\www\\travelify\\templates\\protostar\\language\\en-GB\\en-GB.tpl_protostar.ini'),
(2915, 'TPL_PROTOSTAR_COLOR_DESC', 'Choose an overall colour for the site template. If left blank the Default (#0088cc) is used.', 'C:\\wamp\\www\\travelify\\templates\\protostar\\language\\en-GB\\en-GB.tpl_protostar.ini'),
(2916, 'TPL_PROTOSTAR_COLOR_LABEL', 'Template Colour', 'C:\\wamp\\www\\travelify\\templates\\protostar\\language\\en-GB\\en-GB.tpl_protostar.ini'),
(2917, 'TPL_PROTOSTAR_FLUID', 'Fluid', 'C:\\wamp\\www\\travelify\\templates\\protostar\\language\\en-GB\\en-GB.tpl_protostar.ini'),
(2918, 'TPL_PROTOSTAR_FLUID_LABEL', 'Fluid Layout', 'C:\\wamp\\www\\travelify\\templates\\protostar\\language\\en-GB\\en-GB.tpl_protostar.ini'),
(2919, 'TPL_PROTOSTAR_FLUID_DESC', 'Use Bootstrap''s fluid or static container (both are responsive).', 'C:\\wamp\\www\\travelify\\templates\\protostar\\language\\en-GB\\en-GB.tpl_protostar.ini'),
(2920, 'TPL_PROTOSTAR_FONT_LABEL', 'Google Font for Headings', 'C:\\wamp\\www\\travelify\\templates\\protostar\\language\\en-GB\\en-GB.tpl_protostar.ini'),
(2921, 'TPL_PROTOSTAR_FONT_DESC', 'Load a Google font for the headings (H1, H2, H3, etc).', 'C:\\wamp\\www\\travelify\\templates\\protostar\\language\\en-GB\\en-GB.tpl_protostar.ini'),
(2922, 'TPL_PROTOSTAR_FONT_NAME_LABEL', 'Google Font Name', 'C:\\wamp\\www\\travelify\\templates\\protostar\\language\\en-GB\\en-GB.tpl_protostar.ini'),
(2923, 'TPL_PROTOSTAR_FONT_NAME_DESC', 'Example: Open+Sans or Source+Sans+Pro.', 'C:\\wamp\\www\\travelify\\templates\\protostar\\language\\en-GB\\en-GB.tpl_protostar.ini'),
(2924, 'TPL_PROTOSTAR_LOGO_LABEL', 'Logo', 'C:\\wamp\\www\\travelify\\templates\\protostar\\language\\en-GB\\en-GB.tpl_protostar.ini'),
(2925, 'TPL_PROTOSTAR_LOGO_DESC', 'Select or upload a custom logo for the site template.', 'C:\\wamp\\www\\travelify\\templates\\protostar\\language\\en-GB\\en-GB.tpl_protostar.ini'),
(2926, 'TPL_PROTOSTAR_STATIC', 'Static', 'C:\\wamp\\www\\travelify\\templates\\protostar\\language\\en-GB\\en-GB.tpl_protostar.ini'),
(2927, 'TPL_PROTOSTAR_POSITION_BANNER', 'Banner', 'C:\\wamp\\www\\travelify\\templates\\protostar\\language\\en-GB\\en-GB.tpl_protostar.sys.ini'),
(2928, 'TPL_PROTOSTAR_POSITION_DEBUG', 'Debug', 'C:\\wamp\\www\\travelify\\templates\\protostar\\language\\en-GB\\en-GB.tpl_protostar.sys.ini'),
(2929, 'TPL_PROTOSTAR_POSITION_POSITION-0', 'Search', 'C:\\wamp\\www\\travelify\\templates\\protostar\\language\\en-GB\\en-GB.tpl_protostar.sys.ini'),
(2930, 'TPL_PROTOSTAR_POSITION_POSITION-10', 'Unused', 'C:\\wamp\\www\\travelify\\templates\\protostar\\language\\en-GB\\en-GB.tpl_protostar.sys.ini'),
(2931, 'TPL_PROTOSTAR_POSITION_POSITION-11', 'Unused', 'C:\\wamp\\www\\travelify\\templates\\protostar\\language\\en-GB\\en-GB.tpl_protostar.sys.ini'),
(2932, 'TPL_PROTOSTAR_POSITION_POSITION-12', 'Unused', 'C:\\wamp\\www\\travelify\\templates\\protostar\\language\\en-GB\\en-GB.tpl_protostar.sys.ini'),
(2933, 'TPL_PROTOSTAR_POSITION_POSITION-13', 'Unused', 'C:\\wamp\\www\\travelify\\templates\\protostar\\language\\en-GB\\en-GB.tpl_protostar.sys.ini'),
(2934, 'TPL_PROTOSTAR_POSITION_POSITION-14', 'Unused', 'C:\\wamp\\www\\travelify\\templates\\protostar\\language\\en-GB\\en-GB.tpl_protostar.sys.ini'),
(2935, 'TPL_PROTOSTAR_POSITION_POSITION-15', 'Unused', 'C:\\wamp\\www\\travelify\\templates\\protostar\\language\\en-GB\\en-GB.tpl_protostar.sys.ini'),
(2936, 'TPL_PROTOSTAR_POSITION_POSITION-1', 'Navigation', 'C:\\wamp\\www\\travelify\\templates\\protostar\\language\\en-GB\\en-GB.tpl_protostar.sys.ini'),
(2937, 'TPL_PROTOSTAR_POSITION_POSITION-2', 'Breadcrumbs', 'C:\\wamp\\www\\travelify\\templates\\protostar\\language\\en-GB\\en-GB.tpl_protostar.sys.ini'),
(2938, 'TPL_PROTOSTAR_POSITION_POSITION-3', 'Top center', 'C:\\wamp\\www\\travelify\\templates\\protostar\\language\\en-GB\\en-GB.tpl_protostar.sys.ini'),
(2939, 'TPL_PROTOSTAR_POSITION_POSITION-4', 'Unused', 'C:\\wamp\\www\\travelify\\templates\\protostar\\language\\en-GB\\en-GB.tpl_protostar.sys.ini'),
(2940, 'TPL_PROTOSTAR_POSITION_POSITION-5', 'Unused', 'C:\\wamp\\www\\travelify\\templates\\protostar\\language\\en-GB\\en-GB.tpl_protostar.sys.ini'),
(2941, 'TPL_PROTOSTAR_POSITION_POSITION-6', 'Unused', 'C:\\wamp\\www\\travelify\\templates\\protostar\\language\\en-GB\\en-GB.tpl_protostar.sys.ini'),
(2942, 'TPL_PROTOSTAR_POSITION_POSITION-7', 'Right', 'C:\\wamp\\www\\travelify\\templates\\protostar\\language\\en-GB\\en-GB.tpl_protostar.sys.ini'),
(2943, 'TPL_PROTOSTAR_POSITION_POSITION-8', 'Left', 'C:\\wamp\\www\\travelify\\templates\\protostar\\language\\en-GB\\en-GB.tpl_protostar.sys.ini'),
(2944, 'TPL_PROTOSTAR_POSITION_POSITION-9', 'Unused', 'C:\\wamp\\www\\travelify\\templates\\protostar\\language\\en-GB\\en-GB.tpl_protostar.sys.ini'),
(2945, 'TPL_PROTOSTAR_POSITION_FOOTER', 'Footer', 'C:\\wamp\\www\\travelify\\templates\\protostar\\language\\en-GB\\en-GB.tpl_protostar.sys.ini'),
(2946, 'TPL_PROTOSTAR_XML_DESCRIPTION', 'Continuing the space theme (Solarflare from 1.0 and Milkyway from 1.5), Protostar is the Joomla 3 site template based on Bootstrap from Twitter and the launch of the Joomla User Interface library (JUI).', 'C:\\wamp\\www\\travelify\\templates\\protostar\\language\\en-GB\\en-GB.tpl_protostar.sys.ini');

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_postinstall_messages`
--

CREATE TABLE IF NOT EXISTS `hyxu5_postinstall_messages` (
  `postinstall_message_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `extension_id` bigint(20) NOT NULL DEFAULT '700' COMMENT 'FK to #__extensions',
  `title_key` varchar(255) NOT NULL DEFAULT '' COMMENT 'Lang key for the title',
  `description_key` varchar(255) NOT NULL DEFAULT '' COMMENT 'Lang key for description',
  `action_key` varchar(255) NOT NULL DEFAULT '',
  `language_extension` varchar(255) NOT NULL DEFAULT 'com_postinstall' COMMENT 'Extension holding lang keys',
  `language_client_id` tinyint(3) NOT NULL DEFAULT '1',
  `type` varchar(10) NOT NULL DEFAULT 'link' COMMENT 'Message type - message, link, action',
  `action_file` varchar(255) DEFAULT '' COMMENT 'RAD URI to the PHP file containing action method',
  `action` varchar(255) DEFAULT '' COMMENT 'Action method name or URL',
  `condition_file` varchar(255) DEFAULT NULL COMMENT 'RAD URI to file holding display condition method',
  `condition_method` varchar(255) DEFAULT NULL COMMENT 'Display condition method, must return boolean',
  `version_introduced` varchar(50) NOT NULL DEFAULT '3.2.0' COMMENT 'Version when this message was introduced',
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`postinstall_message_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `hyxu5_postinstall_messages`
--

INSERT INTO `hyxu5_postinstall_messages` (`postinstall_message_id`, `extension_id`, `title_key`, `description_key`, `action_key`, `language_extension`, `language_client_id`, `type`, `action_file`, `action`, `condition_file`, `condition_method`, `version_introduced`, `enabled`) VALUES
(1, 700, 'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_TITLE', 'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_BODY', 'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_ACTION', 'plg_twofactorauth_totp', 1, 'action', 'site://plugins/twofactorauth/totp/postinstall/actions.php', 'twofactorauth_postinstall_action', 'site://plugins/twofactorauth/totp/postinstall/actions.php', 'twofactorauth_postinstall_condition', '3.2.0', 1),
(2, 700, 'COM_CPANEL_WELCOME_BEGINNERS_TITLE', 'COM_CPANEL_WELCOME_BEGINNERS_MESSAGE', '', 'com_cpanel', 1, 'message', '', '', '', '', '3.2.0', 1);

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_redirect_links`
--

CREATE TABLE IF NOT EXISTS `hyxu5_redirect_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `old_url` varchar(255) NOT NULL,
  `new_url` varchar(255) DEFAULT NULL,
  `referer` varchar(150) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(4) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `header` smallint(3) NOT NULL DEFAULT '301',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_link_old` (`old_url`),
  KEY `idx_link_modifed` (`modified_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_schemas`
--

CREATE TABLE IF NOT EXISTS `hyxu5_schemas` (
  `extension_id` int(11) NOT NULL,
  `version_id` varchar(20) NOT NULL,
  PRIMARY KEY (`extension_id`,`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hyxu5_schemas`
--

INSERT INTO `hyxu5_schemas` (`extension_id`, `version_id`) VALUES
(700, '3.4.0-2015-02-26'),
(10125, '0.2.4');

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_session`
--

CREATE TABLE IF NOT EXISTS `hyxu5_session` (
  `session_id` varchar(200) NOT NULL DEFAULT '',
  `client_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `guest` tinyint(4) unsigned DEFAULT '1',
  `time` varchar(14) DEFAULT '',
  `data` mediumtext,
  `userid` int(11) DEFAULT '0',
  `username` varchar(150) DEFAULT '',
  PRIMARY KEY (`session_id`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hyxu5_session`
--

INSERT INTO `hyxu5_session` (`session_id`, `client_id`, `guest`, `time`, `data`, `userid`, `username`) VALUES
('da4notssq2o8ki8pa6mare5ts5', 1, 0, '1467033825', 'joomla|s:2132:"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjoyOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiY291bnRlciI7aTo0O3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTQ2NzAzMzc4OTtzOjQ6Imxhc3QiO2k6MTQ2NzAzMzc5NjtzOjM6Im5vdyI7aToxNDY3MDMzODAxO31zOjU6InRva2VuIjtzOjMyOiJjY2VkNGQ2MGEzY2U4M2IxODE4ODRkY2MwNTQ5OTU3MSI7fXM6ODoicmVnaXN0cnkiO086MjQ6Ikpvb21sYVxSZWdpc3RyeVxSZWdpc3RyeSI6Mjp7czo3OiIAKgBkYXRhIjtPOjg6InN0ZENsYXNzIjoyOntzOjExOiJhcHBsaWNhdGlvbiI7Tzo4OiJzdGRDbGFzcyI6MTp7czo0OiJsYW5nIjtzOjU6ImVuLUdCIjt9czoxMzoiY29tX2luc3RhbGxlciI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo3OiJtZXNzYWdlIjtzOjA6IiI7czoxNzoiZXh0ZW5zaW9uX21lc3NhZ2UiO3M6MDoiIjt9fXM6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086NToiSlVzZXIiOjI4OntzOjk6IgAqAGlzUm9vdCI7YjoxO3M6MjoiaWQiO3M6MzoiMTk4IjtzOjQ6Im5hbWUiO3M6MTA6IlN1cGVyIFVzZXIiO3M6ODoidXNlcm5hbWUiO3M6MzoiMTIzIjtzOjU6ImVtYWlsIjtzOjE5OiJ0b2FuaGQwMDVAZ21haWwuY29tIjtzOjg6InBhc3N3b3JkIjtzOjYwOiIkMnkkMTAkSnR6aS9ZalRyWHJmVDZIQWVkaGVNLnNWR1RXdHlvaXltay5jT3VPNzM3bzhINXJMNTFSMHEiO3M6MTQ6InBhc3N3b3JkX2NsZWFyIjtzOjA6IiI7czo1OiJibG9jayI7czoxOiIwIjtzOjk6InNlbmRFbWFpbCI7czoxOiIxIjtzOjEyOiJyZWdpc3RlckRhdGUiO3M6MTk6IjIwMTYtMDItMTUgMTQ6NTI6MTYiO3M6MTM6Imxhc3R2aXNpdERhdGUiO3M6MTk6IjIwMTYtMDUtMTggMDY6MDg6MDEiO3M6MTA6ImFjdGl2YXRpb24iO3M6MToiMCI7czo2OiJwYXJhbXMiO3M6MDoiIjtzOjY6Imdyb3VwcyI7YToxOntpOjg7czoxOiI4Ijt9czo1OiJndWVzdCI7aTowO3M6MTM6Imxhc3RSZXNldFRpbWUiO3M6MTk6IjAwMDAtMDAtMDAgMDA6MDA6MDAiO3M6MTA6InJlc2V0Q291bnQiO3M6MToiMCI7czoxMjoicmVxdWlyZVJlc2V0IjtzOjE6IjAiO3M6MTA6IgAqAF9wYXJhbXMiO086MjQ6Ikpvb21sYVxSZWdpc3RyeVxSZWdpc3RyeSI6Mjp7czo3OiIAKgBkYXRhIjtPOjg6InN0ZENsYXNzIjowOnt9czo5OiJzZXBhcmF0b3IiO3M6MToiLiI7fXM6MTQ6IgAqAF9hdXRoR3JvdXBzIjthOjI6e2k6MDtpOjE7aToxO2k6ODt9czoxNDoiACoAX2F1dGhMZXZlbHMiO2E6NTp7aTowO2k6MTtpOjE7aToxO2k6MjtpOjI7aTozO2k6MztpOjQ7aTo2O31zOjE1OiIAKgBfYXV0aEFjdGlvbnMiO047czoxMjoiACoAX2Vycm9yTXNnIjtOO3M6MTM6IgAqAHVzZXJIZWxwZXIiO086MTg6IkpVc2VyV3JhcHBlckhlbHBlciI6MDp7fXM6MTA6IgAqAF9lcnJvcnMiO2E6MDp7fXM6MzoiYWlkIjtpOjA7czo2OiJvdHBLZXkiO3M6MDoiIjtzOjQ6Im90ZXAiO3M6MDoiIjt9fX1zOjk6InNlcGFyYXRvciI7czoxOiIuIjt9";', 198, '123'),
('msv57jah0ok4e3saet8632sqe1', 0, 1, '1467033744', 'joomla|s:3984:"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjoyOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjo0OntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aToyO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTQ2NzAzMzcyODtzOjQ6Imxhc3QiO2k6MTQ2NzAzMzcyODtzOjM6Im5vdyI7aToxNDY3MDMzNzQyO319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjoyOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjk6InNlcGFyYXRvciI7czoxOiIuIjt9czo0OiJ1c2VyIjtPOjU6IkpVc2VyIjoyNjp7czo5OiIAKgBpc1Jvb3QiO2I6MDtzOjI6ImlkIjtpOjA7czo0OiJuYW1lIjtOO3M6ODoidXNlcm5hbWUiO047czo1OiJlbWFpbCI7TjtzOjg6InBhc3N3b3JkIjtOO3M6MTQ6InBhc3N3b3JkX2NsZWFyIjtzOjA6IiI7czo1OiJibG9jayI7TjtzOjk6InNlbmRFbWFpbCI7aTowO3M6MTI6InJlZ2lzdGVyRGF0ZSI7TjtzOjEzOiJsYXN0dmlzaXREYXRlIjtOO3M6MTA6ImFjdGl2YXRpb24iO047czo2OiJwYXJhbXMiO047czo2OiJncm91cHMiO2E6MTp7aTowO3M6MToiOSI7fXM6NToiZ3Vlc3QiO2k6MTtzOjEzOiJsYXN0UmVzZXRUaW1lIjtOO3M6MTA6InJlc2V0Q291bnQiO047czoxMjoicmVxdWlyZVJlc2V0IjtOO3M6MTA6IgAqAF9wYXJhbXMiO086MjQ6Ikpvb21sYVxSZWdpc3RyeVxSZWdpc3RyeSI6Mjp7czo3OiIAKgBkYXRhIjtPOjg6InN0ZENsYXNzIjowOnt9czo5OiJzZXBhcmF0b3IiO3M6MToiLiI7fXM6MTQ6IgAqAF9hdXRoR3JvdXBzIjthOjI6e2k6MDtpOjE7aToxO2k6OTt9czoxNDoiACoAX2F1dGhMZXZlbHMiO2E6Mzp7aTowO2k6MTtpOjE7aToxO2k6MjtpOjU7fXM6MTU6IgAqAF9hdXRoQWN0aW9ucyI7TjtzOjEyOiIAKgBfZXJyb3JNc2ciO047czoxMzoiACoAdXNlckhlbHBlciI7TzoxODoiSlVzZXJXcmFwcGVySGVscGVyIjowOnt9czoxMDoiACoAX2Vycm9ycyI7YTowOnt9czozOiJhaWQiO2k6MDt9czoxMDoiY29tX21haWx0byI7Tzo4OiJzdGRDbGFzcyI6MTp7czo1OiJsaW5rcyI7YToxMDp7czo0MDoiNGI5ZjdlZDI2N2RkYzg5ZjQ2N2U3OTE5MmIxMDQ0MDgyNTEzNzRmNiI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJsaW5rIjtzOjU2OiJodHRwOi8vbG9jYWxob3N0L3RyYXZlbGlmeS9uZXcteW9yay84LXNvdW5kY2xvdWQtcHJldmlldyI7czo2OiJleHBpcnkiO2k6MTQ2NzAzMzc0Mzt9czo0MDoiYzE1YjI1OTlmMzY5MWY2ZTFkYThjY2IzNWU5OTdhZjU1ZWQ3MjZiNCI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJsaW5rIjtzOjc0OiJodHRwOi8vbG9jYWxob3N0L3RyYXZlbGlmeS9uZXcteW9yay81LWRlc2lnbi1zaW1wbGljaXR5LWluc3BpcmVkLWJ5LW5hdHVyZSI7czo2OiJleHBpcnkiO2k6MTQ2NzAzMzc0Mzt9czo0MDoiYTg2MDcyMjAwMzlkZTU2MGYzNDViYzlmODVlMTNkYjViZDgwN2MxNCI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJsaW5rIjtzOjYwOiJodHRwOi8vbG9jYWxob3N0L3RyYXZlbGlmeS9uZXcteW9yay80LXBvc3QtZm9ybWF0LXRlc3QtYXNpZGUiO3M6NjoiZXhwaXJ5IjtpOjE0NjcwMzM3NDM7fXM6NDA6IjllOTRhZmYzZDk0ODBkNjYxMDRhOWEzYjk2ODUxMmUxNjVmZTA3NWYiO086ODoic3RkQ2xhc3MiOjI6e3M6NDoibGluayI7czo2NjoiaHR0cDovL2xvY2FsaG9zdC90cmF2ZWxpZnkvbmV3LXlvcmsvMy10aGlzLXBvc3QtaGFzLW5vLWJvZHktYWxtb3N0IjtzOjY6ImV4cGlyeSI7aToxNDY3MDMzNzQzO31zOjQwOiJmYTBkNjVjYjZiYjlkMWRlOTEyMTgwY2M2MTg5MTllZjA0YzQyZGYyIjtPOjg6InN0ZENsYXNzIjoyOntzOjQ6ImxpbmsiO3M6NzM6Imh0dHA6Ly9sb2NhbGhvc3QvdHJhdmVsaWZ5L290aGVyLzYtdGhpcy1pcy10aGUtcmlnaHQtdGhlbWUtZm9yLXlvdS1wZXJpb2QiO3M6NjoiZXhwaXJ5IjtpOjE0NjcwMzM3NDM7fXM6NDA6IjkyYjNjMmU2ODc0NGZjMjM2YTJiNWRiYTZhYzZiYzk2MmJlODA5ZmQiO086ODoic3RkQ2xhc3MiOjI6e3M6NDoibGluayI7czo3MToiaHR0cDovL2xvY2FsaG9zdC90cmF2ZWxpZnkvb3RoZXIvMi1kZXNpZ24tc2ltcGxpY2l0eS1pbnNwaXJlZC1ieS1uYXR1cmUiO3M6NjoiZXhwaXJ5IjtpOjE0NjcwMzM3NDM7fXM6NDA6IjBlNjliZDdmNzM0MTczMWYyNmFmZGRjNzIwZDI5OTQ4MGVmMWQ0MjIiO086ODoic3RkQ2xhc3MiOjI6e3M6NDoibGluayI7czo1NzoiaHR0cDovL2xvY2FsaG9zdC90cmF2ZWxpZnkvc3BhaW4vMS1jb250ZW50LWxheW91dC1wcmV2aWV3IjtzOjY6ImV4cGlyeSI7aToxNDY3MDMzNzQzO31zOjQwOiI2YTc2NmUxNjY3MmM4N2NmYmU1NmQ5NjU0ZDY0YTQ2YWE2NTRlNzkwIjtPOjg6InN0ZENsYXNzIjoyOntzOjQ6ImxpbmsiO3M6MTE5OiJodHRwOi8vbG9jYWxob3N0L3RyYXZlbGlmeS9mcmFuY2UvMTAtcG9zdC1mb3JtYXQtdGVzdC1jaGF0LXRoaXMtYXJ0aWNsZS1oYXMtc28tbG9uZy10aXRsZS10aGF0LWl0LXdpbGwtd3JhcC1pbi1uZXctbGluZSI7czo2OiJleHBpcnkiO2k6MTQ2NzAzMzc0Mzt9czo0MDoiZWY1N2ZkOWM5ZjYyMjA2MjVhYjdhOTQ5MzY3ZmYxODg0M2ZhNDc0YyI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJsaW5rIjtzOjYwOiJodHRwOi8vbG9jYWxob3N0L3RyYXZlbGlmeS9pdGFseS8xMS1wb3N0LWZvcm1hdC10ZXN0LWdhbGxlcnkiO3M6NjoiZXhwaXJ5IjtpOjE0NjcwMzM3NDM7fXM6NDA6IjFjNTIyYjdhZTUxOTFjYjYyZmU5NTJjNzc5NjJkMDQ1NTY0NjNhZWQiO086ODoic3RkQ2xhc3MiOjI6e3M6NDoibGluayI7czo2NToiaHR0cDovL2xvY2FsaG9zdC90cmF2ZWxpZnkvbWlhbWkvMTItcG9zdC1mb3JtYXQtdGVzdC1pbWFnZS1saW5rZWQiO3M6NjoiZXhwaXJ5IjtpOjE0NjcwMzM3NDQ7fX19fX1zOjk6InNlcGFyYXRvciI7czoxOiIuIjt9";', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_tags`
--

CREATE TABLE IF NOT EXISTS `hyxu5_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `metadesc` varchar(1024) NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `tag_idx` (`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `hyxu5_tags`
--

INSERT INTO `hyxu5_tags` (`id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `created_by_alias`, `modified_user_id`, `modified_time`, `images`, `urls`, `hits`, `language`, `version`, `publish_up`, `publish_down`) VALUES
(1, 0, 0, 27, 0, '', 'ROOT', 'root', '', '', 1, 0, '0000-00-00 00:00:00', 1, '', '', '', '', 42, '2011-01-01 00:00:01', '', 0, '0000-00-00 00:00:00', '', '', 0, '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 1, 1, 2, 1, 'post-formats', 'Post Formats', 'post-formats', '', '', 1, 0, '2016-02-20 04:23:49', 1, '{"tag_layout":"","tag_link_class":"label label-info"}', ' ', ' ', '{"author":"","robots":""}', 198, '2016-02-20 04:23:49', '', 0, '2016-02-20 04:23:49', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{}', 22, '*', 1, '2016-02-20 04:23:49', '2016-02-20 04:23:49'),
(3, 1, 3, 4, 1, 'xanthopsia', 'xanthopsia', 'xanthopsia', '', '', 1, 0, '2016-02-20 04:24:05', 1, '{"tag_layout":"","tag_link_class":"label label-info"}', ' ', ' ', '{"author":"","robots":""}', 198, '2016-02-20 04:24:05', '', 0, '2016-02-20 04:24:05', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{}', 6, '*', 1, '2016-02-20 04:24:05', '2016-02-20 04:24:05'),
(4, 1, 5, 6, 1, 'withered-brandnew', ' withered brandnew', 'withered-brandnew', '', '', 1, 0, '2016-02-20 04:24:29', 1, '{"tag_layout":"","tag_link_class":"label label-info"}', ' ', ' ', '{"author":"","robots":""}', 198, '2016-02-20 04:24:29', '', 0, '2016-02-20 04:24:29', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{}', 5, '*', 1, '2016-02-20 04:24:29', '2016-02-20 04:24:29'),
(5, 1, 7, 8, 1, 'tag1', ' tag1', 'tag1', '', '', 1, 0, '2016-02-20 04:24:42', 1, '{"tag_layout":"","tag_link_class":"label label-info"}', ' ', ' ', '{"author":"","robots":""}', 198, '2016-02-20 04:24:42', '', 0, '2016-02-20 04:24:42', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{}', 2, '*', 1, '2016-02-20 04:24:42', '2016-02-20 04:24:42'),
(6, 1, 9, 10, 1, 'tag2', 'tag2', 'tag2', '', '', 1, 0, '2016-02-20 04:24:46', 1, '{"tag_layout":"","tag_link_class":"label label-info"}', ' ', ' ', '{"author":"","robots":""}', 198, '2016-02-20 04:24:46', '', 0, '2016-02-20 04:24:46', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{}', 10, '*', 1, '2016-02-20 04:24:46', '2016-02-20 04:24:46'),
(7, 1, 11, 12, 1, 'tag3', 'tag3', 'tag3', '', '', 1, 0, '2016-02-20 04:24:50', 1, '{"tag_layout":"","tag_link_class":"label label-info"}', ' ', ' ', '{"author":"","robots":""}', 198, '2016-02-20 04:24:50', '', 0, '2016-02-20 04:24:50', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{}', 66, '*', 1, '2016-02-20 04:24:50', '2016-02-20 04:24:50'),
(8, 1, 13, 14, 1, 'dinarchy', 'dinarchy', 'dinarchy', '', '', 1, 0, '2016-02-20 04:25:00', 1, '{"tag_layout":"","tag_link_class":"label label-info"}', ' ', ' ', '{"author":"","robots":""}', 198, '2016-02-20 04:25:00', '', 0, '2016-02-20 04:25:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{}', 7, '*', 1, '2016-02-20 04:25:00', '2016-02-20 04:25:00'),
(9, 1, 15, 16, 1, 'cienaga', 'cienaga', 'cienaga', '', '', 1, 0, '2016-02-20 04:25:09', 1, '{"tag_layout":"","tag_link_class":"label label-info"}', ' ', ' ', '{"author":"","robots":""}', 198, '2016-02-20 04:25:09', '', 0, '2016-02-20 04:25:09', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{}', 2, '*', 1, '2016-02-20 04:25:09', '2016-02-20 04:25:09'),
(10, 1, 17, 18, 1, 'claycold', 'claycold', 'claycold', '', '', 1, 0, '2016-02-20 04:25:17', 1, '{"tag_layout":"","tag_link_class":"label label-info"}', ' ', ' ', '{"author":"","robots":""}', 198, '2016-02-20 04:25:17', '', 0, '2016-02-20 04:25:17', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{}', 0, '*', 1, '2016-02-20 04:25:17', '2016-02-20 04:25:17'),
(11, 1, 19, 20, 1, 'doolie', 'doolie', 'doolie', '', '', 1, 0, '2016-02-20 04:25:24', 1, '{"tag_layout":"","tag_link_class":"label label-info"}', ' ', ' ', '{"author":"","robots":""}', 198, '2016-02-20 04:25:24', '', 0, '2016-02-20 04:25:24', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{}', 0, '*', 1, '2016-02-20 04:25:24', '2016-02-20 04:25:24'),
(12, 1, 21, 22, 1, 'energumen', 'energumen', 'energumen', '', '', 1, 0, '2016-02-20 04:25:31', 1, '{"tag_layout":"","tag_link_class":"label label-info"}', ' ', ' ', '{"author":"","robots":""}', 198, '2016-02-20 04:25:31', '', 0, '2016-02-20 04:25:31', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{}', 2, '*', 1, '2016-02-20 04:25:31', '2016-02-20 04:25:31'),
(13, 1, 23, 24, 1, 'figuriste', 'figuriste', 'figuriste', '', '', 1, 0, '2016-02-20 04:25:39', 1, '{"tag_layout":"","tag_link_class":"label label-info"}', ' ', ' ', '{"author":"","robots":""}', 198, '2016-02-20 04:25:39', '', 0, '2016-02-20 04:25:39', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{}', 2, '*', 1, '2016-02-20 04:25:39', '2016-02-20 04:25:39'),
(14, 1, 25, 26, 1, 'habergeon', 'habergeon', 'habergeon', '', '', 1, 0, '2016-02-20 04:25:47', 1, '{"tag_layout":"","tag_link_class":"label label-info"}', ' ', ' ', '{"author":"","robots":""}', 198, '2016-02-20 04:25:47', '', 0, '2016-02-20 04:25:47', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{}', 7, '*', 1, '2016-02-20 04:25:47', '2016-02-20 04:25:47');

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_template_styles`
--

CREATE TABLE IF NOT EXISTS `hyxu5_template_styles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template` varchar(50) NOT NULL DEFAULT '',
  `client_id` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `home` char(7) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_template` (`template`),
  KEY `idx_home` (`home`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `hyxu5_template_styles`
--

INSERT INTO `hyxu5_template_styles` (`id`, `template`, `client_id`, `home`, `title`, `params`) VALUES
(4, 'beez3', 0, '0', 'Beez3 - Default', '{"wrapperSmall":"53","wrapperLarge":"72","logo":"images\\/joomla_black.png","sitetitle":"Joomla!","sitedescription":"Open Source Content Management","navposition":"left","templatecolor":"personal","html5":"0"}'),
(5, 'hathor', 1, '0', 'Hathor - Default', '{"showSiteName":"0","colourChoice":"","boldText":"0"}'),
(7, 'protostar', 0, '0', 'protostar - Default', '{"templateColor":"","logoFile":"","googleFont":"1","googleFontName":"Open+Sans","fluidContainer":"0"}'),
(8, 'isis', 1, '1', 'isis - Default', '{"templateColor":"","logoFile":""}'),
(9, 'travelify', 0, '1', 'Travelify - Default', '{}'),
(10, 'travelify2', 0, '0', 'Travelify 2  - Default', '{}');

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_ucm_base`
--

CREATE TABLE IF NOT EXISTS `hyxu5_ucm_base` (
  `ucm_id` int(10) unsigned NOT NULL,
  `ucm_item_id` int(10) NOT NULL,
  `ucm_type_id` int(11) NOT NULL,
  `ucm_language_id` int(11) NOT NULL,
  PRIMARY KEY (`ucm_id`),
  KEY `idx_ucm_item_id` (`ucm_item_id`),
  KEY `idx_ucm_type_id` (`ucm_type_id`),
  KEY `idx_ucm_language_id` (`ucm_language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hyxu5_ucm_base`
--

INSERT INTO `hyxu5_ucm_base` (`ucm_id`, `ucm_item_id`, `ucm_type_id`, `ucm_language_id`) VALUES
(1, 3, 1, 0),
(2, 4, 1, 0),
(3, 6, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_ucm_content`
--

CREATE TABLE IF NOT EXISTS `hyxu5_ucm_content` (
  `core_content_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `core_type_alias` varchar(255) NOT NULL DEFAULT '' COMMENT 'FK to the content types table',
  `core_title` varchar(255) NOT NULL,
  `core_alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `core_body` mediumtext NOT NULL,
  `core_state` tinyint(1) NOT NULL DEFAULT '0',
  `core_checked_out_time` varchar(255) NOT NULL DEFAULT '',
  `core_checked_out_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `core_access` int(10) unsigned NOT NULL DEFAULT '0',
  `core_params` text NOT NULL,
  `core_featured` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `core_metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `core_created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `core_created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `core_created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_modified_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Most recent user that modified',
  `core_modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_language` char(7) NOT NULL,
  `core_publish_up` datetime NOT NULL,
  `core_publish_down` datetime NOT NULL,
  `core_content_item_id` int(10) unsigned DEFAULT NULL COMMENT 'ID from the individual type table',
  `asset_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to the #__assets table.',
  `core_images` text NOT NULL,
  `core_urls` text NOT NULL,
  `core_hits` int(10) unsigned NOT NULL DEFAULT '0',
  `core_version` int(10) unsigned NOT NULL DEFAULT '1',
  `core_ordering` int(11) NOT NULL DEFAULT '0',
  `core_metakey` text NOT NULL,
  `core_metadesc` text NOT NULL,
  `core_catid` int(10) unsigned NOT NULL DEFAULT '0',
  `core_xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `core_type_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`core_content_id`),
  KEY `tag_idx` (`core_state`,`core_access`),
  KEY `idx_access` (`core_access`),
  KEY `idx_alias` (`core_alias`),
  KEY `idx_language` (`core_language`),
  KEY `idx_title` (`core_title`),
  KEY `idx_modified_time` (`core_modified_time`),
  KEY `idx_created_time` (`core_created_time`),
  KEY `idx_content_type` (`core_type_alias`),
  KEY `idx_core_modified_user_id` (`core_modified_user_id`),
  KEY `idx_core_checked_out_user_id` (`core_checked_out_user_id`),
  KEY `idx_core_created_user_id` (`core_created_user_id`),
  KEY `idx_core_type_id` (`core_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Contains core content data in name spaced fields' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `hyxu5_ucm_content`
--

INSERT INTO `hyxu5_ucm_content` (`core_content_id`, `core_type_alias`, `core_title`, `core_alias`, `core_body`, `core_state`, `core_checked_out_time`, `core_checked_out_user_id`, `core_access`, `core_params`, `core_featured`, `core_metadata`, `core_created_user_id`, `core_created_by_alias`, `core_created_time`, `core_modified_user_id`, `core_modified_time`, `core_language`, `core_publish_up`, `core_publish_down`, `core_content_item_id`, `asset_id`, `core_images`, `core_urls`, `core_hits`, `core_version`, `core_ordering`, `core_metakey`, `core_metadesc`, `core_catid`, `core_xreference`, `core_type_id`) VALUES
(1, 'com_content.article', 'This post has no body – almost', 'this-post-has-no-body-almost', 'Cras leo tortor, condimentum id semper eu, sodales id elit. Maecenas commodo dolor vel massa gravida vehicula. Morbi tristique sapien ac dui tempus imperdiet.', 1, '', 0, 1, '{"show_title":"","link_titles":"","show_tags":"0","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"0","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 0, '{"robots":"","author":"","rights":"","xreference":""}', 198, '', '2016-02-16 10:21:36', 198, '2016-02-21 16:57:45', '*', '2016-02-16 10:21:36', '0000-00-00 00:00:00', 3, 106, '{"image_intro":"images\\/Spain-Plaza-de-Cibeles-Madrid-670x300.jpg","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', 94, 13, 3, '', '', 11, '', 1),
(2, 'com_content.article', 'Post Format Test: Aside', 'post-format-test-aside', 'I never tried to prove nothing, just wanted to give a good show. My life has always been my music, it’s always come first, but the music ain’t worth nothing if you can’t lay it on the public. The main thing is to live for that audience, ’cause what you’re there for is to please the people.', 1, '', 0, 1, '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"0","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 0, '{"robots":"","author":"","rights":"","xreference":""}', 198, '', '2016-02-20 08:18:55', 198, '2016-02-21 16:57:36', '*', '2016-02-20 08:18:55', '0000-00-00 00:00:00', 4, 112, '{"image_intro":"images\\/6040613987_e80842ee05_b-670x300.jpg","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', 7, 3, 4, '', '', 11, '', 1),
(3, 'com_content.article', 'This is the right theme for you. Period', 'this-is-the-right-theme-for-you-period', 'This theme is for free and available via WordPress.org as well as several other websites.', 1, '', 0, 1, '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"0","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, '{"robots":"","author":"","rights":"","xreference":""}', 198, '', '2016-02-21 03:25:05', 198, '2016-02-21 16:57:16', '*', '2016-02-21 03:25:05', '0000-00-00 00:00:00', 6, 154, '{"image_intro":"images\\/7148951717_9bbf185db3_h-1018x460.jpg","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', 0, 13, 1, '', '', 12, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_ucm_history`
--

CREATE TABLE IF NOT EXISTS `hyxu5_ucm_history` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ucm_item_id` int(10) unsigned NOT NULL,
  `ucm_type_id` int(10) unsigned NOT NULL,
  `version_note` varchar(255) NOT NULL DEFAULT '' COMMENT 'Optional version name',
  `save_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `character_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Number of characters in this version.',
  `sha1_hash` varchar(50) NOT NULL DEFAULT '' COMMENT 'SHA1 hash of the version_data column.',
  `version_data` mediumtext NOT NULL COMMENT 'json-encoded string of version data',
  `keep_forever` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=auto delete; 1=keep',
  PRIMARY KEY (`version_id`),
  KEY `idx_ucm_item_id` (`ucm_type_id`,`ucm_item_id`),
  KEY `idx_save_date` (`save_date`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=67 ;

--
-- Dumping data for table `hyxu5_ucm_history`
--

INSERT INTO `hyxu5_ucm_history` (`version_id`, `ucm_item_id`, `ucm_type_id`, `version_note`, `save_date`, `editor_user_id`, `character_count`, `sha1_hash`, `version_data`, `keep_forever`) VALUES
(1, 1, 1, '', '2016-02-16 08:56:47', 198, 1923, '13f273cda3ce82061754a3de6c70709c7cec9540', '{"id":1,"asset_id":60,"title":"Content Layout Preview","alias":"content-layout-preview","introtext":"","fulltext":"","state":1,"catid":"2","created":"2016-02-16 08:56:47","created_by":"198","created_by_alias":"","modified":"2016-02-16 08:56:47","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2016-02-16 08:56:47","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"images\\\\\\/spain6-1018x460.jpg\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Sed odio nibh, tincidunt adipiscing, pretium nec, tincidunt id, enim. Fusce scelerisque nunc vitae nisl. Quisque quis urna in velit dictum pellentesque.\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"1","language":"*","xreference":""}', 0),
(2, 2, 1, '', '2016-02-16 08:59:11', 198, 1822, '67381d22f6c9146d3a940e664f9d71e589a2ae22', '{"id":2,"asset_id":61,"title":"Design Simplicity Inspired by Nature","alias":"design-simplicity-inspired-by-nature","introtext":"","fulltext":"","state":1,"catid":"2","created":"2016-02-16 08:59:11","created_by":"198","created_by_alias":"","modified":"2016-02-16 08:59:11","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2016-02-16 08:59:11","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"images\\\\\\/featured-4.jpg\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"This theme is better than most premium themes out there. Download it and see yourself.\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"1","language":"*","xreference":""}', 0),
(3, 3, 1, '', '2016-02-16 10:21:36', 198, 1912, '030ad7a1a7eda690eeed086fea1da389c2152f40', '{"id":3,"asset_id":63,"title":"This post has no body \\u2013 almost","alias":"this-post-has-no-body-almost","introtext":"","fulltext":"","state":1,"catid":"2","created":"2016-02-16 10:21:36","created_by":"198","created_by_alias":"","modified":"2016-02-16 10:21:36","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2016-02-16 10:21:36","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"images\\\\\\/Spain-Plaza-de-Cibeles-Madrid-670x300.jpg\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"Cras leo tortor, condimentum id semper eu, sodales id elit. Maecenas commodo dolor vel massa gravida vehicula. Morbi tristique sapien ac dui tempus imperdiet.\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(4, 3, 1, '', '2016-02-18 04:10:10', 198, 1938, 'e47a6f3bb6668649cf2bc2931cd3aaf3edfb56b4', '{"id":3,"asset_id":"63","title":"This post has no body \\u2013 almost","alias":"this-post-has-no-body-almost","introtext":"adfasdf","fulltext":"","state":1,"catid":"2","created":"2016-02-16 10:21:36","created_by":"198","created_by_alias":"","modified":"2016-02-18 04:10:10","modified_by":"198","checked_out":"198","checked_out_time":"2016-02-18 04:10:05","publish_up":"2016-02-16 10:21:36","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"images\\\\\\/Spain-Plaza-de-Cibeles-Madrid-670x300.jpg\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"Cras leo tortor, condimentum id semper eu, sodales id elit. Maecenas commodo dolor vel massa gravida vehicula. Morbi tristique sapien ac dui tempus imperdiet.\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":3,"ordering":"0","metakey":"","metadesc":"","access":"1","hits":"0","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(5, 3, 1, '', '2016-02-18 04:10:27', 198, 1952, 'a2ae3a365bd4270ee730b8c6531f2d577b99626a', '{"id":3,"asset_id":"63","title":"This post has no body \\u2013 almost","alias":"this-post-has-no-body-almost","introtext":"This post has no body","fulltext":"","state":1,"catid":"2","created":"2016-02-16 10:21:36","created_by":"198","created_by_alias":"","modified":"2016-02-18 04:10:27","modified_by":"198","checked_out":"198","checked_out_time":"2016-02-18 04:10:14","publish_up":"2016-02-16 10:21:36","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"images\\\\\\/Spain-Plaza-de-Cibeles-Madrid-670x300.jpg\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"Cras leo tortor, condimentum id semper eu, sodales id elit. Maecenas commodo dolor vel massa gravida vehicula. Morbi tristique sapien ac dui tempus imperdiet.\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":4,"ordering":"0","metakey":"","metadesc":"","access":"1","hits":"0","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(6, 2, 5, '', '2016-02-19 02:22:12', 198, 586, '679164c9ba621c319ca3e36f6284a652921a12cf', '{"id":2,"asset_id":"27","parent_id":"1","lft":"1","rgt":"2","level":"1","path":"uncategorised","extension":"com_content","title":"Root","alias":"uncategorised","note":"","description":"","published":"1","checked_out":"198","checked_out_time":"2016-02-19 02:22:06","access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"42","created_time":"2011-01-01 00:00:01","modified_user_id":"198","modified_time":"2016-02-19 02:22:12","hits":"0","language":"*","version":"1"}', 0),
(7, 11, 5, '', '2016-02-19 02:22:53', 198, 552, '2672e809f5d31aa3b8e062d391d353e594235787', '{"id":11,"asset_id":94,"parent_id":"2","lft":"2","rgt":3,"level":2,"path":null,"extension":"com_content","title":"New York","alias":"new-york","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"198","created_time":"2016-02-19 02:22:53","modified_user_id":null,"modified_time":"2016-02-19 02:22:53","hits":"0","language":"*","version":null}', 0),
(8, 12, 5, '', '2016-02-19 02:23:11', 198, 546, 'ba2c08c92fcf5d5449dc668c7a750dcf7c189759', '{"id":12,"asset_id":95,"parent_id":"2","lft":"4","rgt":5,"level":2,"path":null,"extension":"com_content","title":"Other","alias":"other","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"198","created_time":"2016-02-19 02:23:11","modified_user_id":null,"modified_time":"2016-02-19 02:23:11","hits":"0","language":"*","version":null}', 0),
(9, 3, 1, '', '2016-02-19 02:23:34', 198, 1953, '5666541988758525ed4aea329fd4efb375c43e1e', '{"id":3,"asset_id":"63","title":"This post has no body \\u2013 almost","alias":"this-post-has-no-body-almost","introtext":"This post has no body","fulltext":"","state":1,"catid":"11","created":"2016-02-16 10:21:36","created_by":"198","created_by_alias":"","modified":"2016-02-19 02:23:34","modified_by":"198","checked_out":"198","checked_out_time":"2016-02-19 02:23:28","publish_up":"2016-02-16 10:21:36","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"images\\\\\\/Spain-Plaza-de-Cibeles-Madrid-670x300.jpg\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"Cras leo tortor, condimentum id semper eu, sodales id elit. Maecenas commodo dolor vel massa gravida vehicula. Morbi tristique sapien ac dui tempus imperdiet.\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":6,"ordering":"0","metakey":"","metadesc":"","access":"1","hits":"0","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(10, 2, 1, '', '2016-02-19 02:23:41', 198, 1842, '7ea1ff5c4f4106a0ce22ecfdc4925bac5c533e60', '{"id":2,"asset_id":"61","title":"Design Simplicity Inspired by Nature","alias":"design-simplicity-inspired-by-nature","introtext":"","fulltext":"","state":1,"catid":"12","created":"2016-02-16 08:59:11","created_by":"198","created_by_alias":"","modified":"2016-02-19 02:23:41","modified_by":"198","checked_out":"198","checked_out_time":"2016-02-19 02:23:36","publish_up":"2016-02-16 08:59:11","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"images\\\\\\/featured-4.jpg\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"This theme is better than most premium themes out there. Download it and see yourself.\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":2,"ordering":"1","metakey":"","metadesc":"","access":"1","hits":"2","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"1","language":"*","xreference":""}', 0),
(11, 1, 1, '', '2016-02-19 02:23:50', 198, 1943, 'fe01e9320d3df0175ba1f9570dde2f6c3ba1815a', '{"id":1,"asset_id":"60","title":"Content Layout Preview","alias":"content-layout-preview","introtext":"","fulltext":"","state":1,"catid":"12","created":"2016-02-16 08:56:47","created_by":"198","created_by_alias":"","modified":"2016-02-19 02:23:50","modified_by":"198","checked_out":"198","checked_out_time":"2016-02-19 02:23:45","publish_up":"2016-02-16 08:56:47","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"images\\\\\\/spain6-1018x460.jpg\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Sed odio nibh, tincidunt adipiscing, pretium nec, tincidunt id, enim. Fusce scelerisque nunc vitae nisl. Quisque quis urna in velit dictum pellentesque.\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":3,"ordering":"2","metakey":"","metadesc":"","access":"1","hits":"1","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"1","language":"*","xreference":""}', 0),
(12, 3, 1, '', '2016-02-19 02:52:46', 198, 1967, '52821e4ee3017dec05a6e7300d86696001ddf3d5', '{"id":3,"asset_id":"63","title":"This post has no body \\u2013 almost","alias":"this-post-has-no-body-almost","introtext":"This post has no body{jcomments on}","fulltext":"","state":1,"catid":"11","created":"2016-02-16 10:21:36","created_by":"198","created_by_alias":"","modified":"2016-02-19 02:52:46","modified_by":"198","checked_out":"198","checked_out_time":"2016-02-19 02:52:17","publish_up":"2016-02-16 10:21:36","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"images\\\\\\/Spain-Plaza-de-Cibeles-Madrid-670x300.jpg\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"Cras leo tortor, condimentum id semper eu, sodales id elit. Maecenas commodo dolor vel massa gravida vehicula. Morbi tristique sapien ac dui tempus imperdiet.\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":7,"ordering":"0","metakey":"","metadesc":"","access":"1","hits":"2","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(13, 3, 1, '', '2016-02-19 03:18:00', 198, 1972, 'ee93be3ef701dc8f5aee245d5a35b654bce2b98d', '{"id":3,"asset_id":"63","title":"This post has no body \\u2013 almost","alias":"this-post-has-no-body-almost","introtext":"Cras leo tortor, condimentum id semper eu, sodales id elit. Maecenas commodo dolor vel massa gravida vehicula. Morbi tristique sapien ac dui tempus imperdiet.","fulltext":"\\r\\nThis post has no body{jcomments on}","state":1,"catid":"11","created":"2016-02-16 10:21:36","created_by":"198","created_by_alias":"","modified":"2016-02-19 03:18:00","modified_by":"198","checked_out":"198","checked_out_time":"2016-02-19 03:17:34","publish_up":"2016-02-16 10:21:36","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"images\\\\\\/Spain-Plaza-de-Cibeles-Madrid-670x300.jpg\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":9,"ordering":"0","metakey":"","metadesc":"","access":"1","hits":"17","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(14, 2, 1, '', '2016-02-19 03:18:40', 198, 1860, 'a3e2b223ac5ef3bbe285761a53bec21919dbd1a4', '{"id":2,"asset_id":"61","title":"Design Simplicity Inspired by Nature","alias":"design-simplicity-inspired-by-nature","introtext":"This theme is better than most premium themes out there. Download it and see yourself.\\r\\n","fulltext":"{jcomments on}","state":1,"catid":"12","created":"2016-02-16 08:59:11","created_by":"198","created_by_alias":"","modified":"2016-02-19 03:18:40","modified_by":"198","checked_out":"198","checked_out_time":"2016-02-19 03:18:21","publish_up":"2016-02-16 08:59:11","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"images\\\\\\/featured-4.jpg\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":3,"ordering":"1","metakey":"","metadesc":"","access":"1","hits":"2","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"1","language":"*","xreference":""}', 0),
(15, 1, 1, '', '2016-02-19 03:19:15', 198, 1957, '44f3ab6a141ef74b376dea7806292d88cbc11cc7', '{"id":1,"asset_id":"60","title":"Content Layout Preview","alias":"content-layout-preview","introtext":"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Sed odio nibh, tincidunt adipiscing, pretium nec, tincidunt id, enim. Fusce scelerisque nunc vitae nisl. Quisque quis urna in velit dictum pellentesque.","fulltext":"{jcomments on}","state":1,"catid":"12","created":"2016-02-16 08:56:47","created_by":"198","created_by_alias":"","modified":"2016-02-19 03:19:15","modified_by":"198","checked_out":"198","checked_out_time":"2016-02-19 03:18:56","publish_up":"2016-02-16 08:56:47","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"images\\\\\\/spain6-1018x460.jpg\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":4,"ordering":"2","metakey":"","metadesc":"","access":"1","hits":"1","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"1","language":"*","xreference":""}', 0),
(16, 2, 8, '', '2016-02-20 04:23:49', 198, 862, '7cf3e37db1835c1c3cadfbe54ad35c60078e550b', '{"id":2,"parent_id":"1","lft":"1","rgt":2,"level":1,"path":null,"title":"Post Formats","alias":"post-formats","note":"","description":"","published":"1","checked_out":null,"checked_out_time":"2016-02-20 04:23:49","access":"1","params":"{\\"tag_layout\\":\\"\\",\\"tag_link_class\\":\\"label label-info\\"}","metadesc":" ","metakey":" ","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"198","created_time":"2016-02-20 04:23:49","created_by_alias":"","modified_user_id":null,"modified_time":"2016-02-20 04:23:49","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{}","hits":"0","language":"*","version":null,"publish_up":"2016-02-20 04:23:49","publish_down":"2016-02-20 04:23:49"}', 0),
(17, 3, 8, '', '2016-02-20 04:24:05', 198, 858, '6edd6699336a41ea377eebe48392113428e53eba', '{"id":3,"parent_id":"1","lft":"3","rgt":4,"level":1,"path":null,"title":"xanthopsia","alias":"xanthopsia","note":"","description":"","published":"1","checked_out":null,"checked_out_time":"2016-02-20 04:24:05","access":"1","params":"{\\"tag_layout\\":\\"\\",\\"tag_link_class\\":\\"label label-info\\"}","metadesc":" ","metakey":" ","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"198","created_time":"2016-02-20 04:24:05","created_by_alias":"","modified_user_id":null,"modified_time":"2016-02-20 04:24:05","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{}","hits":"0","language":"*","version":null,"publish_up":"2016-02-20 04:24:05","publish_down":"2016-02-20 04:24:05"}', 0),
(18, 4, 8, '', '2016-02-20 04:24:29', 198, 873, 'bb1956cf7361c6907466c05fbbe6692706800308', '{"id":4,"parent_id":"1","lft":"5","rgt":6,"level":1,"path":null,"title":" withered brandnew","alias":"withered-brandnew","note":"","description":"","published":"1","checked_out":null,"checked_out_time":"2016-02-20 04:24:29","access":"1","params":"{\\"tag_layout\\":\\"\\",\\"tag_link_class\\":\\"label label-info\\"}","metadesc":" ","metakey":" ","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"198","created_time":"2016-02-20 04:24:29","created_by_alias":"","modified_user_id":null,"modified_time":"2016-02-20 04:24:29","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{}","hits":"0","language":"*","version":null,"publish_up":"2016-02-20 04:24:29","publish_down":"2016-02-20 04:24:29"}', 0),
(19, 5, 8, '', '2016-02-20 04:24:42', 198, 847, '962019e7b72f1674b7b71d475943920b3639f3b8', '{"id":5,"parent_id":"1","lft":"7","rgt":8,"level":1,"path":null,"title":" tag1","alias":"tag1","note":"","description":"","published":"1","checked_out":null,"checked_out_time":"2016-02-20 04:24:42","access":"1","params":"{\\"tag_layout\\":\\"\\",\\"tag_link_class\\":\\"label label-info\\"}","metadesc":" ","metakey":" ","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"198","created_time":"2016-02-20 04:24:42","created_by_alias":"","modified_user_id":null,"modified_time":"2016-02-20 04:24:42","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{}","hits":"0","language":"*","version":null,"publish_up":"2016-02-20 04:24:42","publish_down":"2016-02-20 04:24:42"}', 0),
(20, 6, 8, '', '2016-02-20 04:24:46', 198, 847, '3f4ad8c2505041b7a4b2fa3f7f428e712362d991', '{"id":6,"parent_id":"1","lft":"9","rgt":10,"level":1,"path":null,"title":"tag2","alias":"tag2","note":"","description":"","published":"1","checked_out":null,"checked_out_time":"2016-02-20 04:24:46","access":"1","params":"{\\"tag_layout\\":\\"\\",\\"tag_link_class\\":\\"label label-info\\"}","metadesc":" ","metakey":" ","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"198","created_time":"2016-02-20 04:24:46","created_by_alias":"","modified_user_id":null,"modified_time":"2016-02-20 04:24:46","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{}","hits":"0","language":"*","version":null,"publish_up":"2016-02-20 04:24:46","publish_down":"2016-02-20 04:24:46"}', 0),
(21, 7, 8, '', '2016-02-20 04:24:50', 198, 848, 'c66f7eee1c425cac7deb8e8058fd487ffeb46a88', '{"id":7,"parent_id":"1","lft":"11","rgt":12,"level":1,"path":null,"title":"tag3","alias":"tag3","note":"","description":"","published":"1","checked_out":null,"checked_out_time":"2016-02-20 04:24:50","access":"1","params":"{\\"tag_layout\\":\\"\\",\\"tag_link_class\\":\\"label label-info\\"}","metadesc":" ","metakey":" ","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"198","created_time":"2016-02-20 04:24:50","created_by_alias":"","modified_user_id":null,"modified_time":"2016-02-20 04:24:50","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{}","hits":"0","language":"*","version":null,"publish_up":"2016-02-20 04:24:50","publish_down":"2016-02-20 04:24:50"}', 0),
(22, 8, 8, '', '2016-02-20 04:25:00', 198, 856, 'fc914cfe2b1398743266b28eceae6489d74dc436', '{"id":8,"parent_id":"1","lft":"13","rgt":14,"level":1,"path":null,"title":"dinarchy","alias":"dinarchy","note":"","description":"","published":"1","checked_out":null,"checked_out_time":"2016-02-20 04:25:00","access":"1","params":"{\\"tag_layout\\":\\"\\",\\"tag_link_class\\":\\"label label-info\\"}","metadesc":" ","metakey":" ","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"198","created_time":"2016-02-20 04:25:00","created_by_alias":"","modified_user_id":null,"modified_time":"2016-02-20 04:25:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{}","hits":"0","language":"*","version":null,"publish_up":"2016-02-20 04:25:00","publish_down":"2016-02-20 04:25:00"}', 0),
(23, 9, 8, '', '2016-02-20 04:25:09', 198, 854, '016fe89e060f17717c75d8daf765d95db215a5de', '{"id":9,"parent_id":"1","lft":"15","rgt":16,"level":1,"path":null,"title":"cienaga","alias":"cienaga","note":"","description":"","published":"1","checked_out":null,"checked_out_time":"2016-02-20 04:25:09","access":"1","params":"{\\"tag_layout\\":\\"\\",\\"tag_link_class\\":\\"label label-info\\"}","metadesc":" ","metakey":" ","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"198","created_time":"2016-02-20 04:25:09","created_by_alias":"","modified_user_id":null,"modified_time":"2016-02-20 04:25:09","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{}","hits":"0","language":"*","version":null,"publish_up":"2016-02-20 04:25:09","publish_down":"2016-02-20 04:25:09"}', 0),
(24, 10, 8, '', '2016-02-20 04:25:17', 198, 857, '802793afa63ce4d841516bd9d38c54868a3201cd', '{"id":10,"parent_id":"1","lft":"17","rgt":18,"level":1,"path":null,"title":"claycold","alias":"claycold","note":"","description":"","published":"1","checked_out":null,"checked_out_time":"2016-02-20 04:25:17","access":"1","params":"{\\"tag_layout\\":\\"\\",\\"tag_link_class\\":\\"label label-info\\"}","metadesc":" ","metakey":" ","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"198","created_time":"2016-02-20 04:25:17","created_by_alias":"","modified_user_id":null,"modified_time":"2016-02-20 04:25:17","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{}","hits":"0","language":"*","version":null,"publish_up":"2016-02-20 04:25:17","publish_down":"2016-02-20 04:25:17"}', 0),
(25, 11, 8, '', '2016-02-20 04:25:24', 198, 853, '1f81359d2aaf99646a8cc41e7619179fd38146af', '{"id":11,"parent_id":"1","lft":"19","rgt":20,"level":1,"path":null,"title":"doolie","alias":"doolie","note":"","description":"","published":"1","checked_out":null,"checked_out_time":"2016-02-20 04:25:24","access":"1","params":"{\\"tag_layout\\":\\"\\",\\"tag_link_class\\":\\"label label-info\\"}","metadesc":" ","metakey":" ","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"198","created_time":"2016-02-20 04:25:24","created_by_alias":"","modified_user_id":null,"modified_time":"2016-02-20 04:25:24","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{}","hits":"0","language":"*","version":null,"publish_up":"2016-02-20 04:25:24","publish_down":"2016-02-20 04:25:24"}', 0),
(26, 12, 8, '', '2016-02-20 04:25:31', 198, 859, '583ef5f6cd83af335509d51ff0bfddd14bea9f41', '{"id":12,"parent_id":"1","lft":"21","rgt":22,"level":1,"path":null,"title":"energumen","alias":"energumen","note":"","description":"","published":"1","checked_out":null,"checked_out_time":"2016-02-20 04:25:31","access":"1","params":"{\\"tag_layout\\":\\"\\",\\"tag_link_class\\":\\"label label-info\\"}","metadesc":" ","metakey":" ","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"198","created_time":"2016-02-20 04:25:31","created_by_alias":"","modified_user_id":null,"modified_time":"2016-02-20 04:25:31","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{}","hits":"0","language":"*","version":null,"publish_up":"2016-02-20 04:25:31","publish_down":"2016-02-20 04:25:31"}', 0),
(27, 13, 8, '', '2016-02-20 04:25:39', 198, 859, 'ad9d8688254da0e6763a3982788051159226041c', '{"id":13,"parent_id":"1","lft":"23","rgt":24,"level":1,"path":null,"title":"figuriste","alias":"figuriste","note":"","description":"","published":"1","checked_out":null,"checked_out_time":"2016-02-20 04:25:39","access":"1","params":"{\\"tag_layout\\":\\"\\",\\"tag_link_class\\":\\"label label-info\\"}","metadesc":" ","metakey":" ","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"198","created_time":"2016-02-20 04:25:39","created_by_alias":"","modified_user_id":null,"modified_time":"2016-02-20 04:25:39","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{}","hits":"0","language":"*","version":null,"publish_up":"2016-02-20 04:25:39","publish_down":"2016-02-20 04:25:39"}', 0),
(28, 14, 8, '', '2016-02-20 04:25:47', 198, 859, 'b19296f9daf4c337c3f57f2527bb868cf14f4fbd', '{"id":14,"parent_id":"1","lft":"25","rgt":26,"level":1,"path":null,"title":"habergeon","alias":"habergeon","note":"","description":"","published":"1","checked_out":null,"checked_out_time":"2016-02-20 04:25:47","access":"1","params":"{\\"tag_layout\\":\\"\\",\\"tag_link_class\\":\\"label label-info\\"}","metadesc":" ","metakey":" ","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"198","created_time":"2016-02-20 04:25:47","created_by_alias":"","modified_user_id":null,"modified_time":"2016-02-20 04:25:47","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{}","hits":"0","language":"*","version":null,"publish_up":"2016-02-20 04:25:47","publish_down":"2016-02-20 04:25:47"}', 0),
(29, 3, 1, '', '2016-02-20 05:08:26', 198, 1975, '09e186724c688bbfcc1901c20a04574561e00c49', '{"id":3,"asset_id":"63","title":"This post has no body \\u2013 almost","alias":"this-post-has-no-body-almost","introtext":"Cras leo tortor, condimentum id semper eu, sodales id elit. Maecenas commodo dolor vel massa gravida vehicula. Morbi tristique sapien ac dui tempus imperdiet.","fulltext":"\\r\\nThis post has no body{jcomments on}","state":1,"catid":"11","created":"2016-02-16 10:21:36","created_by":"198","created_by_alias":"","modified":"2016-02-20 05:08:26","modified_by":"198","checked_out":"198","checked_out_time":"2016-02-20 05:08:06","publish_up":"2016-02-16 10:21:36","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"images\\\\\\/Spain-Plaza-de-Cibeles-Madrid-670x300.jpg\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"0\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"0\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":12,"ordering":"0","metakey":"","metadesc":"","access":"1","hits":"37","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(30, 4, 1, '', '2016-02-20 08:18:55', 198, 2385, '3ee1cbfdf15381e80cc9128188a270874f57aebb', '{"id":4,"asset_id":111,"title":"Post Format Test: Aside","alias":"post-format-test-aside","introtext":"I never tried to prove nothing, just wanted to give a good show. My life has always been my music, it\\u2019s always come first, but the music ain\\u2019t worth nothing if you can\\u2019t lay it on the public. The main thing is to live for that audience, \\u2019cause what you\\u2019re there for is to please the people.","fulltext":"\\r\\n\\u201cI never tried to prove nothing, just wanted to give a good show. My life has always been my music, it\\u2019s always come first, but the music ain\\u2019t worth nothing if you can\\u2019t lay it on the public. The main thing is to live for that audience, \\u2019cause what you\\u2019re there for is to please the people.\\u201d\\r\\n\\r\\n","state":1,"catid":"2","created":"2016-02-20 08:18:55","created_by":"198","created_by_alias":"","modified":"2016-02-20 08:18:55","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2016-02-20 08:18:55","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"images\\\\\\/6040613987_e80842ee05_b-670x300.jpg\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(31, 4, 1, '', '2016-02-20 09:09:48', 198, 2405, '20161b6c23c9d83691021c60971d07aad7c214ad', '{"id":4,"asset_id":"111","title":"Post Format Test: Aside","alias":"post-format-test-aside","introtext":"I never tried to prove nothing, just wanted to give a good show. My life has always been my music, it\\u2019s always come first, but the music ain\\u2019t worth nothing if you can\\u2019t lay it on the public. The main thing is to live for that audience, \\u2019cause what you\\u2019re there for is to please the people.","fulltext":"\\r\\n\\u201cI never tried to prove nothing, just wanted to give a good show. My life has always been my music, it\\u2019s always come first, but the music ain\\u2019t worth nothing if you can\\u2019t lay it on the public. The main thing is to live for that audience, \\u2019cause what you\\u2019re there for is to please the people.\\u201d\\r\\n\\r\\n","state":1,"catid":"11","created":"2016-02-20 08:18:55","created_by":"198","created_by_alias":"","modified":"2016-02-20 09:09:48","modified_by":"198","checked_out":"198","checked_out_time":"2016-02-20 09:09:42","publish_up":"2016-02-20 08:18:55","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"images\\\\\\/6040613987_e80842ee05_b-670x300.jpg\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":2,"ordering":"0","metakey":"","metadesc":"","access":"1","hits":"4","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0);
INSERT INTO `hyxu5_ucm_history` (`version_id`, `ucm_item_id`, `ucm_type_id`, `version_note`, `save_date`, `editor_user_id`, `character_count`, `sha1_hash`, `version_data`, `keep_forever`) VALUES
(32, 5, 1, '', '2016-02-20 10:26:34', 198, 1823, '5fd26f4904b9897cf9a7e0feb8198285c8f44fab', '{"id":5,"asset_id":113,"title":"Design Simplicity Inspired by Nature","alias":"design-simplicity-inspired-by-nature","introtext":"","fulltext":"","state":1,"catid":"2","created":"2016-02-20 10:26:34","created_by":"198","created_by_alias":"","modified":"2016-02-20 10:26:34","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2016-02-20 10:26:34","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"https:\\\\\\/\\\\\\/colorlib.com\\\\\\/travelify\\\\\\/wp-content\\\\\\/uploads\\\\\\/sites\\\\\\/4\\\\\\/2012\\\\\\/06\\\\\\/featured-5.jpg\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"1","language":"*","xreference":""}', 0),
(33, 5, 1, '', '2016-02-20 10:26:58', 198, 1929, '39596e5898f4c62fcbcd5625a4e6409837e39462', '{"id":5,"asset_id":"113","title":"Design Simplicity Inspired by Nature","alias":"design-simplicity-inspired-by-nature","introtext":"This theme is better than most premium themes out there. Download it and see yourself. ","fulltext":"","state":1,"catid":"2","created":"2016-02-20 10:26:34","created_by":"198","created_by_alias":"","modified":"2016-02-20 10:26:58","modified_by":"198","checked_out":"198","checked_out_time":"2016-02-20 10:26:52","publish_up":"2016-02-20 10:26:34","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"https:\\\\\\/\\\\\\/colorlib.com\\\\\\/travelify\\\\\\/wp-content\\\\\\/uploads\\\\\\/sites\\\\\\/4\\\\\\/2012\\\\\\/06\\\\\\/featured-5.jpg\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":2,"ordering":"0","metakey":"","metadesc":"","access":"1","hits":"0","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"1","language":"*","xreference":""}', 0),
(34, 6, 1, '', '2016-02-21 03:25:05', 198, 1854, '901b4494a2ade2e32a83096168deaf06e5304e1c', '{"id":6,"asset_id":114,"title":"This is the right theme for you. Period","alias":"this-is-the-right-theme-for-you-period","introtext":"This theme is for free and available via WordPress.org as well as several other websites.","fulltext":"","state":1,"catid":"11","created":"2016-02-21 03:25:05","created_by":"198","created_by_alias":"","modified":"2016-02-21 03:25:05","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2016-02-21 03:25:05","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"images\\\\\\/7148951717_9bbf185db3_h-1018x460.jpg\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"1","language":"*","xreference":""}', 0),
(35, 7, 1, '', '2016-02-21 10:39:33', 198, 1892, 'adac0bbb580e95a923aa7e05b400a11e52978d2b', '{"id":7,"asset_id":121,"title":"Tiled Gallery Preview for Travelify WordPress Theme","alias":"tiled-gallery-preview-for-travelify-wordpress-theme","introtext":"Cras leo tortor, condimentum id semper eu, sodales id elit. Maecenas commodo dolor vel massa gravida vehicula. Morbi tristique sapien ac dui tempus imperdiet.","fulltext":"","state":2,"catid":"2","created":"2016-02-21 10:39:33","created_by":"198","created_by_alias":"","modified":"2016-02-21 10:39:33","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"","publish_down":"","images":"{\\"image_intro\\":\\"images\\\\\\/spain6-1018x460.jpg\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(36, 8, 1, '', '2016-02-21 10:52:02', 198, 1778, 'd2e6857fa5732ffb836e2b94f07fbe88bf195719', '{"id":8,"asset_id":123,"title":"SoundCloud Preview","alias":"soundcloud-preview","introtext":"This posts show how SoundCloud embeds does work on Travelify theme:","fulltext":"","state":1,"catid":"11","created":"2016-02-21 10:52:02","created_by":"198","created_by_alias":"","modified":"2016-02-21 10:52:02","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2016-02-21 10:52:02","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"images\\\\\\/new-york-14-670x300.jpg\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(37, 8, 1, '', '2016-02-21 11:29:36', 198, 1868, 'ff85faea6deb3c305dd4013d3f64ae1df74c3026', '{"id":8,"asset_id":"123","title":"SoundCloud Preview","alias":"soundcloud-preview","introtext":"This posts show how SoundCloud embeds does work on Travelify theme:\\r\\n","fulltext":"\\r\\n{popfeed_mailrecipient}email@email.com{\\/popfeed_mailrecipient}","state":1,"catid":"11","created":"2016-02-21 10:52:02","created_by":"198","created_by_alias":"","modified":"2016-02-21 11:29:36","modified_by":"198","checked_out":"198","checked_out_time":"2016-02-21 11:28:44","publish_up":"2016-02-21 10:52:02","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"images\\\\\\/new-york-14-670x300.jpg\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":2,"ordering":"0","metakey":"","metadesc":"","access":"1","hits":"0","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(38, 2, 1, '', '2016-02-21 15:34:42', 198, 1846, '9ef47d959b11d7722ec412984e476fef5dcea35a', '{"id":2,"asset_id":"61","title":"Design Simplicity Inspired by Nature","alias":"design-simplicity-inspired-by-nature","introtext":"This theme is better than most premium themes out there. Download it and see yourself.\\r\\n","fulltext":"","state":1,"catid":"12","created":"2016-02-16 08:59:11","created_by":"198","created_by_alias":"","modified":"2016-02-21 15:34:42","modified_by":"198","checked_out":"198","checked_out_time":"2016-02-21 15:34:31","publish_up":"2016-02-16 08:59:11","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"images\\\\\\/featured-4.jpg\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":4,"ordering":"1","metakey":"","metadesc":"","access":"1","hits":"7","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"1","language":"*","xreference":""}', 0),
(39, 6, 1, '', '2016-02-21 15:37:19', 198, 1873, '509a43ee34365372694bdb5aefefbfae25e48c1e', '{"id":6,"asset_id":"114","title":"This is the right theme for you. Period","alias":"this-is-the-right-theme-for-you-period","introtext":"This theme is for free and available via WordPress.org as well as several other websites.","fulltext":"","state":1,"catid":"11","created":"2016-02-21 03:25:05","created_by":"198","created_by_alias":"","modified":"2016-02-21 15:37:19","modified_by":"198","checked_out":"198","checked_out_time":"2016-02-21 15:37:13","publish_up":"2016-02-21 03:25:05","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"images\\\\\\/7148951717_9bbf185db3_h-1018x460.jpg\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":2,"ordering":"1","metakey":"","metadesc":"","access":"1","hits":"0","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"1","language":"*","xreference":""}', 0),
(40, 6, 1, '', '2016-02-21 15:37:46', 198, 1873, 'c1fc530ffb1e0404a85d7c00aa145074ca029122', '{"id":6,"asset_id":"114","title":"This is the right theme for you. Period","alias":"this-is-the-right-theme-for-you-period","introtext":"This theme is for free and available via WordPress.org as well as several other websites.","fulltext":"","state":1,"catid":"12","created":"2016-02-21 03:25:05","created_by":"198","created_by_alias":"","modified":"2016-02-21 15:37:46","modified_by":"198","checked_out":"198","checked_out_time":"2016-02-21 15:37:30","publish_up":"2016-02-21 03:25:05","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"images\\\\\\/7148951717_9bbf185db3_h-1018x460.jpg\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":3,"ordering":"1","metakey":"","metadesc":"","access":"1","hits":"0","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"1","language":"*","xreference":""}', 0),
(41, 6, 1, '', '2016-02-21 15:41:45', 198, 1873, '43dcfff456c09e03dfee6f4121fdb83fe800188a', '{"id":6,"asset_id":"114","title":"This is the right theme for you. Period","alias":"this-is-the-right-theme-for-you-period","introtext":"This theme is for free and available via WordPress.org as well as several other websites.","fulltext":"","state":1,"catid":"12","created":"2016-02-21 03:25:05","created_by":"198","created_by_alias":"","modified":"2016-02-21 15:41:45","modified_by":"198","checked_out":"198","checked_out_time":"2016-02-21 15:41:16","publish_up":"2016-02-21 03:25:05","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"images\\\\\\/7148951717_9bbf185db3_h-1018x460.jpg\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":7,"ordering":"1","metakey":"","metadesc":"","access":"1","hits":"0","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(42, 2, 5, '', '2016-02-21 15:49:59', 198, 591, 'ab538780bf794bcad14f2efc16ae504b1e568407', '{"id":2,"asset_id":"27","parent_id":"1","lft":"1","rgt":"6","level":"1","path":"uncategorised","extension":"com_content","title":"Travelify","alias":"uncategorised","note":"","description":"","published":"1","checked_out":"198","checked_out_time":"2016-02-21 15:49:48","access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"42","created_time":"2011-01-01 00:00:01","modified_user_id":"198","modified_time":"2016-02-21 15:49:59","hits":"0","language":"*","version":"1"}', 0),
(43, 5, 1, '', '2016-02-21 15:51:57', 198, 1930, 'dc4f6b06c4ec3f70afd97e808fc229ba710a74ce', '{"id":5,"asset_id":"113","title":"Design Simplicity Inspired by Nature","alias":"design-simplicity-inspired-by-nature","introtext":"This theme is better than most premium themes out there. Download it and see yourself. ","fulltext":"","state":1,"catid":"11","created":"2016-02-20 10:26:34","created_by":"198","created_by_alias":"","modified":"2016-02-21 15:51:57","modified_by":"198","checked_out":"198","checked_out_time":"2016-02-21 15:51:50","publish_up":"2016-02-20 10:26:34","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"https:\\\\\\/\\\\\\/colorlib.com\\\\\\/travelify\\\\\\/wp-content\\\\\\/uploads\\\\\\/sites\\\\\\/4\\\\\\/2012\\\\\\/06\\\\\\/featured-5.jpg\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":3,"ordering":"1","metakey":"","metadesc":"","access":"1","hits":"3","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"1","language":"*","xreference":""}', 0),
(44, 5, 1, '', '2016-02-21 15:52:08', 198, 1933, 'd4bc995c3d95144379ee926f3a36ca437a863772', '{"id":5,"asset_id":"113","title":"Design Simplicity Inspired by Nature","alias":"design-simplicity-inspired-by-nature","introtext":"This theme is better than most premium themes out there. Download it and see yourself.\\r\\n","fulltext":"","state":1,"catid":"11","created":"2016-02-20 10:26:34","created_by":"198","created_by_alias":"","modified":"2016-02-21 15:52:08","modified_by":"198","checked_out":"198","checked_out_time":"2016-02-21 15:51:57","publish_up":"2016-02-20 10:26:34","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"https:\\\\\\/\\\\\\/colorlib.com\\\\\\/travelify\\\\\\/wp-content\\\\\\/uploads\\\\\\/sites\\\\\\/4\\\\\\/2012\\\\\\/06\\\\\\/featured-5.jpg\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":4,"ordering":"1","metakey":"","metadesc":"","access":"1","hits":"3","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"1","language":"*","xreference":""}', 0),
(45, 9, 1, '', '2016-02-21 15:52:35', 198, 1654, 'bf3e9d887c81472c719c29f84aefb92dc17c46cf', '{"id":9,"asset_id":155,"title":"test","alias":"test","introtext":"test","fulltext":"","state":1,"catid":"11","created":"2016-02-21 15:52:35","created_by":"198","created_by_alias":"","modified":"2016-02-21 15:52:35","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2016-02-21 15:52:35","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(46, 9, 1, '', '2016-02-21 15:57:01', 198, 1689, 'fd86b4e30f047f33911c049897146f701bdd4db1', '{"id":9,"asset_id":"155","title":"test","alias":"test","introtext":"test","fulltext":"\\r\\nThis is test","state":1,"catid":"11","created":"2016-02-21 15:52:35","created_by":"198","created_by_alias":"","modified":"2016-02-21 15:57:01","modified_by":"198","checked_out":"198","checked_out_time":"2016-02-21 15:56:42","publish_up":"2016-02-21 15:52:35","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":2,"ordering":"0","metakey":"","metadesc":"","access":"1","hits":"1","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(47, 6, 1, '', '2016-02-21 15:58:12', 198, 2105, '8718be66710d896329fee1d8e5f40e41589cc747', '{"id":6,"asset_id":"114","title":"This is the right theme for you. Period","alias":"this-is-the-right-theme-for-you-period","introtext":"This theme is for free and available via WordPress.org as well as several other websites.","fulltext":"\\r\\nALorem ipsum dolor sit amet, consectetuer adipiscing elit. Sed odio nibh, tincidunt adipiscing, pretium nec, tincidunt id, enim. Fusce scelerisque nunc vitae nisl. Quisque quis urna in velit dictum pellentesque. Vivamus a quam.","state":1,"catid":"12","created":"2016-02-21 03:25:05","created_by":"198","created_by_alias":"","modified":"2016-02-21 15:58:12","modified_by":"198","checked_out":"198","checked_out_time":"2016-02-21 15:57:27","publish_up":"2016-02-21 03:25:05","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"images\\\\\\/7148951717_9bbf185db3_h-1018x460.jpg\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":12,"ordering":"1","metakey":"","metadesc":"","access":"1","hits":"0","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"1","language":"*","xreference":""}', 0),
(48, 5, 1, '', '2016-02-21 15:58:35', 198, 2263, '23371bb204ac4a200ceba0135d3a83f3baacc822', '{"id":5,"asset_id":"113","title":"Design Simplicity Inspired by Nature","alias":"design-simplicity-inspired-by-nature","introtext":"This theme is better than most premium themes out there. Download it and see yourself.\\r\\n","fulltext":"\\r\\nNullam rhoncus eleifend ornare. Fusce vulputate neque in nisi vehicula vitae adipiscing tortor volutpat. Vivamus id leo et est tincidunt placerat. In laoreet purus vitae neque bibendum vel viverra urna accumsan. Nullam at lacus tincidunt tortor dictum vulputate a vitae nulla. Vivamus condimentum eleifend enim non ultricies. ","state":1,"catid":"11","created":"2016-02-20 10:26:34","created_by":"198","created_by_alias":"","modified":"2016-02-21 15:58:35","modified_by":"198","checked_out":"198","checked_out_time":"2016-02-21 15:58:20","publish_up":"2016-02-20 10:26:34","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"https:\\\\\\/\\\\\\/colorlib.com\\\\\\/travelify\\\\\\/wp-content\\\\\\/uploads\\\\\\/sites\\\\\\/4\\\\\\/2012\\\\\\/06\\\\\\/featured-5.jpg\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":5,"ordering":"2","metakey":"","metadesc":"","access":"1","hits":"3","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"1","language":"*","xreference":""}', 0),
(49, 2, 1, '', '2016-02-21 16:30:59', 198, 2176, '48cb9a15f401d0291aec0e20377d6927a4146535', '{"id":2,"asset_id":"61","title":"Design Simplicity Inspired by Nature","alias":"design-simplicity-inspired-by-nature","introtext":"This theme is better than most premium themes out there. Download it and see yourself.\\r\\n","fulltext":"\\r\\nNullam rhoncus eleifend ornare. Fusce vulputate neque in nisi vehicula vitae adipiscing tortor volutpat. Vivamus id leo et est tincidunt placerat. In laoreet purus vitae neque bibendum vel viverra urna accumsan. Nullam at lacus tincidunt tortor dictum vulputate a vitae nulla. Vivamus condimentum eleifend enim non ultricies. ","state":1,"catid":"12","created":"2016-02-16 08:59:11","created_by":"198","created_by_alias":"","modified":"2016-02-21 16:30:59","modified_by":"198","checked_out":"198","checked_out_time":"2016-02-21 16:30:45","publish_up":"2016-02-16 08:59:11","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"images\\\\\\/featured-4.jpg\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":7,"ordering":"1","metakey":"","metadesc":"","access":"1","hits":"7","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"1","language":"*","xreference":""}', 0),
(50, 13, 5, '', '2016-02-21 16:36:34', 198, 547, 'a44fe1444d5131edbf05f81345d9897f34d38ce8', '{"id":13,"asset_id":157,"parent_id":"2","lft":"6","rgt":7,"level":2,"path":null,"extension":"com_content","title":"Spain","alias":"spain","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"198","created_time":"2016-02-21 16:36:34","modified_user_id":null,"modified_time":"2016-02-21 16:36:34","hits":"0","language":"*","version":null}', 0),
(51, 14, 5, '', '2016-02-21 16:36:46', 198, 549, '5fc72e2cb1c9723db564e328297d4d5653092676', '{"id":14,"asset_id":158,"parent_id":"2","lft":"8","rgt":9,"level":2,"path":null,"extension":"com_content","title":"France","alias":"france","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"198","created_time":"2016-02-21 16:36:46","modified_user_id":null,"modified_time":"2016-02-21 16:36:46","hits":"0","language":"*","version":null}', 0),
(52, 15, 5, '', '2016-02-21 16:36:58', 198, 549, '18887584d58bf4b90d8700a6e16d86eb997674de', '{"id":15,"asset_id":159,"parent_id":"2","lft":"10","rgt":11,"level":2,"path":null,"extension":"com_content","title":"Italy","alias":"italy","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"198","created_time":"2016-02-21 16:36:58","modified_user_id":null,"modified_time":"2016-02-21 16:36:58","hits":"0","language":"*","version":null}', 0),
(53, 16, 5, '', '2016-02-21 16:37:18', 198, 549, 'ade2125649ce7711c679281383f207d48c3282ab', '{"id":16,"asset_id":160,"parent_id":"2","lft":"12","rgt":13,"level":2,"path":null,"extension":"com_content","title":"Miami","alias":"miami","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"198","created_time":"2016-02-21 16:37:18","modified_user_id":null,"modified_time":"2016-02-21 16:37:18","hits":"0","language":"*","version":null}', 0),
(54, 8, 1, '', '2016-02-21 16:55:47', 198, 1869, '0c6307ffea9e9bdea741f0c5e38ee9a94c6c5e3c', '{"id":8,"asset_id":"123","title":"SoundCloud Preview","alias":"soundcloud-preview","introtext":"This posts show how SoundCloud embeds does work on Travelify theme:\\r\\n","fulltext":"\\r\\n{popfeed_mailrecipient}email@email.com{\\/popfeed_mailrecipient}","state":1,"catid":"11","created":"2016-02-21 10:52:02","created_by":"198","created_by_alias":"","modified":"2016-02-21 16:55:47","modified_by":"198","checked_out":"198","checked_out_time":"2016-02-21 16:55:37","publish_up":"2016-02-21 10:52:02","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"images\\\\\\/new-york-14-670x300.jpg\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"0\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":3,"ordering":"1","metakey":"","metadesc":"","access":"1","hits":"6","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(55, 6, 1, '', '2016-02-21 16:57:16', 198, 2106, '805db326c9e6f271f689a70e4b08c8e01c5121b6', '{"id":6,"asset_id":"114","title":"This is the right theme for you. Period","alias":"this-is-the-right-theme-for-you-period","introtext":"This theme is for free and available via WordPress.org as well as several other websites.","fulltext":"\\r\\nALorem ipsum dolor sit amet, consectetuer adipiscing elit. Sed odio nibh, tincidunt adipiscing, pretium nec, tincidunt id, enim. Fusce scelerisque nunc vitae nisl. Quisque quis urna in velit dictum pellentesque. Vivamus a quam.","state":1,"catid":"12","created":"2016-02-21 03:25:05","created_by":"198","created_by_alias":"","modified":"2016-02-21 16:57:16","modified_by":"198","checked_out":"198","checked_out_time":"2016-02-21 16:57:03","publish_up":"2016-02-21 03:25:05","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"images\\\\\\/7148951717_9bbf185db3_h-1018x460.jpg\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"0\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":13,"ordering":"1","metakey":"","metadesc":"","access":"1","hits":"0","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"1","language":"*","xreference":""}', 0),
(56, 5, 1, '', '2016-02-21 16:57:26', 198, 2264, '8d5cbd3903f9eacc14b4f3b2575b0c03bb8c52cc', '{"id":5,"asset_id":"113","title":"Design Simplicity Inspired by Nature","alias":"design-simplicity-inspired-by-nature","introtext":"This theme is better than most premium themes out there. Download it and see yourself.\\r\\n","fulltext":"\\r\\nNullam rhoncus eleifend ornare. Fusce vulputate neque in nisi vehicula vitae adipiscing tortor volutpat. Vivamus id leo et est tincidunt placerat. In laoreet purus vitae neque bibendum vel viverra urna accumsan. Nullam at lacus tincidunt tortor dictum vulputate a vitae nulla. Vivamus condimentum eleifend enim non ultricies. ","state":1,"catid":"11","created":"2016-02-20 10:26:34","created_by":"198","created_by_alias":"","modified":"2016-02-21 16:57:26","modified_by":"198","checked_out":"198","checked_out_time":"2016-02-21 16:57:19","publish_up":"2016-02-20 10:26:34","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"https:\\\\\\/\\\\\\/colorlib.com\\\\\\/travelify\\\\\\/wp-content\\\\\\/uploads\\\\\\/sites\\\\\\/4\\\\\\/2012\\\\\\/06\\\\\\/featured-5.jpg\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"0\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":6,"ordering":"2","metakey":"","metadesc":"","access":"1","hits":"6","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"1","language":"*","xreference":""}', 0);
INSERT INTO `hyxu5_ucm_history` (`version_id`, `ucm_item_id`, `ucm_type_id`, `version_note`, `save_date`, `editor_user_id`, `character_count`, `sha1_hash`, `version_data`, `keep_forever`) VALUES
(57, 4, 1, '', '2016-02-21 16:57:36', 198, 2406, 'a0cbc0da31c59362224aa239ec62abe05863ffb9', '{"id":4,"asset_id":"111","title":"Post Format Test: Aside","alias":"post-format-test-aside","introtext":"I never tried to prove nothing, just wanted to give a good show. My life has always been my music, it\\u2019s always come first, but the music ain\\u2019t worth nothing if you can\\u2019t lay it on the public. The main thing is to live for that audience, \\u2019cause what you\\u2019re there for is to please the people.","fulltext":"\\r\\n\\u201cI never tried to prove nothing, just wanted to give a good show. My life has always been my music, it\\u2019s always come first, but the music ain\\u2019t worth nothing if you can\\u2019t lay it on the public. The main thing is to live for that audience, \\u2019cause what you\\u2019re there for is to please the people.\\u201d\\r\\n\\r\\n","state":1,"catid":"11","created":"2016-02-20 08:18:55","created_by":"198","created_by_alias":"","modified":"2016-02-21 16:57:36","modified_by":"198","checked_out":"198","checked_out_time":"2016-02-21 16:57:29","publish_up":"2016-02-20 08:18:55","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"images\\\\\\/6040613987_e80842ee05_b-670x300.jpg\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"0\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":3,"ordering":"4","metakey":"","metadesc":"","access":"1","hits":"7","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(58, 3, 1, '', '2016-02-21 16:57:45', 198, 1975, '3b97ae63a4dd5388f84771539cb397efc0542780', '{"id":3,"asset_id":"63","title":"This post has no body \\u2013 almost","alias":"this-post-has-no-body-almost","introtext":"Cras leo tortor, condimentum id semper eu, sodales id elit. Maecenas commodo dolor vel massa gravida vehicula. Morbi tristique sapien ac dui tempus imperdiet.","fulltext":"\\r\\nThis post has no body{jcomments on}","state":1,"catid":"11","created":"2016-02-16 10:21:36","created_by":"198","created_by_alias":"","modified":"2016-02-21 16:57:45","modified_by":"198","checked_out":"198","checked_out_time":"2016-02-21 16:57:40","publish_up":"2016-02-16 10:21:36","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"images\\\\\\/Spain-Plaza-de-Cibeles-Madrid-670x300.jpg\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"0\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"0\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":13,"ordering":"3","metakey":"","metadesc":"","access":"1","hits":"94","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(59, 1, 1, '', '2016-02-22 02:14:30', 198, 1957, '84a84f723c7e7f280bde5f46871f9ec4b59b3bba', '{"id":1,"asset_id":"60","title":"Content Layout Preview","alias":"content-layout-preview","introtext":"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Sed odio nibh, tincidunt adipiscing, pretium nec, tincidunt id, enim. Fusce scelerisque nunc vitae nisl. Quisque quis urna in velit dictum pellentesque.","fulltext":"{jcomments on}","state":1,"catid":"13","created":"2016-02-16 08:56:47","created_by":"198","created_by_alias":"","modified":"2016-02-22 02:14:30","modified_by":"198","checked_out":"198","checked_out_time":"2016-02-22 02:14:23","publish_up":"2016-02-16 08:56:47","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"images\\\\\\/spain6-1018x460.jpg\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":5,"ordering":"2","metakey":"","metadesc":"","access":"1","hits":"7","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"1","language":"*","xreference":""}', 0),
(60, 10, 1, '', '2016-02-22 02:16:09', 198, 2518, 'cc5bca5506c35d534d711136657c9326312ea535', '{"id":10,"asset_id":161,"title":"Post Format Test: Chat \\u2013 This article has so long title that it will wrap in new line","alias":"post-format-test-chat-this-article-has-so-long-title-that-it-will-wrap-in-new-line","introtext":"Nullam rhoncus eleifend ornare. Fusce vulputate neque in nisi vehicula vitae adipiscing tortor volutpat. Vivamus id leo et est tincidunt placerat. In laoreet purus vitae neque bibendum vel viverra urna accumsan. Nullam at lacus tincidunt tortor dictum vulputate a vitae nulla. Vivamus condimentum eleifend enim non ultricies.","fulltext":"\\r\\nNullam rhoncus eleifend ornare. Fusce vulputate neque in nisi vehicula vitae adipiscing tortor volutpat. Vivamus id leo et est tincidunt placerat. In laoreet purus vitae neque bibendum vel viverra urna accumsan. Nullam at lacus tincidunt tortor dictum vulputate a vitae nulla. Vivamus condimentum eleifend enim non ultricies.\\r\\n","state":1,"catid":"14","created":"2016-02-22 02:16:09","created_by":"198","created_by_alias":"","modified":"2016-02-22 02:16:09","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2016-02-22 02:16:09","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"images\\\\\\/5877492285_f307c838c1_b-670x300.jpg\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(61, 11, 1, '', '2016-02-22 02:18:14', 198, 1942, 'bd97dd642405bf481e718c5a66e22a2e78bae6b4', '{"id":11,"asset_id":162,"title":"Post Format Test: Gallery","alias":"post-format-test-gallery","introtext":"Nulla facilisi. Morbi eu neque massa. Phasellus nec rhoncus diam. Morbi elementum ligula quis magna tristique egestas. Donec nec eros nibh, id sollicitudin mi. Mauris eget lorem sed mauris lacinia adipiscing ut id ligula.","fulltext":"\\r\\nPost Format Test: Gallery","state":1,"catid":"15","created":"2016-02-22 02:18:14","created_by":"198","created_by_alias":"","modified":"2016-02-22 02:18:14","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2016-02-22 02:18:14","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(62, 12, 1, '', '2016-02-22 02:19:44', 198, 2602, 'd1739675d4ffd3563cf820aa475691b0ae474417', '{"id":12,"asset_id":163,"title":"Post Format Test: Image (Linked)","alias":"post-format-test-image-linked","introtext":"Sed a urna augue, et eleifend metus. Phasellus velit tortor, scelerisque non dignissim eu, aliquet a arcu. Aenean ut tortor turpis, id dignissim dolor. Quisque aliquet, nunc eget aliquet bibendum, nunc leo accumsan arcu, vitae pharetra nulla mauris non dui.\\u2026","fulltext":"\\r\\nUt enim turpis, adipiscing sed commodo eget, vehicula quis lorem. Sed rutrum, mauris vestibulum volutpat iaculis, lacus augue facilisis massa, et volutpat nisl nibh quis quam. Nulla laoreet aliquet libero varius aliquet. Ut ac nisi leo, in ornare dolor. Cras consectetur venenatis metus, a fringilla ligula molestie vitae. Quisque mi tellus, faucibus vel venenatis vel, elementum ut leo. Etiam odio enim, pellentesque vel rutrum nec, auctor a nisl. Praesent feugiat eleifend elit, vitae dignissim nibh posuere ut. Donec at dapibus mauris. Cras vitae lorem sed eros ullamcorper dignissim.","state":1,"catid":"2","created":"2016-02-22 02:19:44","created_by":"198","created_by_alias":"","modified":"2016-02-22 02:19:44","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2016-02-22 02:19:44","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"images\\\\\\/5661697632_d1ff426de6_b-670x300.jpg\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(63, 12, 1, '', '2016-02-22 02:19:59', 198, 2622, '3990d03e5cba7e162daf27e0d0db1ec5b5ec6eba', '{"id":12,"asset_id":"163","title":"Post Format Test: Image (Linked)","alias":"post-format-test-image-linked","introtext":"Sed a urna augue, et eleifend metus. Phasellus velit tortor, scelerisque non dignissim eu, aliquet a arcu. Aenean ut tortor turpis, id dignissim dolor. Quisque aliquet, nunc eget aliquet bibendum, nunc leo accumsan arcu, vitae pharetra nulla mauris non dui.\\u2026","fulltext":"\\r\\nUt enim turpis, adipiscing sed commodo eget, vehicula quis lorem. Sed rutrum, mauris vestibulum volutpat iaculis, lacus augue facilisis massa, et volutpat nisl nibh quis quam. Nulla laoreet aliquet libero varius aliquet. Ut ac nisi leo, in ornare dolor. Cras consectetur venenatis metus, a fringilla ligula molestie vitae. Quisque mi tellus, faucibus vel venenatis vel, elementum ut leo. Etiam odio enim, pellentesque vel rutrum nec, auctor a nisl. Praesent feugiat eleifend elit, vitae dignissim nibh posuere ut. Donec at dapibus mauris. Cras vitae lorem sed eros ullamcorper dignissim.","state":1,"catid":"16","created":"2016-02-22 02:19:44","created_by":"198","created_by_alias":"","modified":"2016-02-22 02:19:59","modified_by":"198","checked_out":"198","checked_out_time":"2016-02-22 02:19:50","publish_up":"2016-02-22 02:19:44","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"images\\\\\\/5661697632_d1ff426de6_b-670x300.jpg\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":2,"ordering":"0","metakey":"","metadesc":"","access":"1","hits":"0","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(64, 8, 1, '', '2016-02-23 03:27:02', 198, 1870, '0c4a770586cd99c11cda0265711052063c0f6e41', '{"id":8,"asset_id":"123","title":"SoundCloud Preview","alias":"soundcloud-preview","introtext":"This posts show how SoundCloud embeds does work on Travelify theme:\\r\\n","fulltext":"\\r\\n{popfeed_mailrecipient}email@email.com{\\/popfeed_mailrecipient}","state":1,"catid":"11","created":"2016-02-21 10:52:02","created_by":"198","created_by_alias":"","modified":"2016-02-23 03:27:02","modified_by":"198","checked_out":"198","checked_out_time":"2016-02-23 03:26:51","publish_up":"2016-02-21 10:52:02","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"images\\\\\\/new-york-14-670x300.jpg\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"0\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":6,"ordering":"1","metakey":"","metadesc":"","access":"2","hits":"12","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(65, 12, 1, '', '2016-02-23 04:52:51', 198, 2624, '30f9d14772567765eac36fe7e9c53645f09be2d6', '{"id":12,"asset_id":"163","title":"Post Format Test: Image (Linked)","alias":"post-format-test-image-linked","introtext":"Sed a urna augue, et eleifend metus. Phasellus velit tortor, scelerisque non dignissim eu, aliquet a arcu. Aenean ut tortor turpis, id dignissim dolor. Quisque aliquet, nunc eget aliquet bibendum, nunc leo accumsan arcu, vitae pharetra nulla mauris non dui.\\u2026","fulltext":"\\r\\nUt enim turpis, adipiscing sed commodo eget, vehicula quis lorem. Sed rutrum, mauris vestibulum volutpat iaculis, lacus augue facilisis massa, et volutpat nisl nibh quis quam. Nulla laoreet aliquet libero varius aliquet. Ut ac nisi leo, in ornare dolor. Cras consectetur venenatis metus, a fringilla ligula molestie vitae. Quisque mi tellus, faucibus vel venenatis vel, elementum ut leo. Etiam odio enim, pellentesque vel rutrum nec, auctor a nisl. Praesent feugiat eleifend elit, vitae dignissim nibh posuere ut. Donec at dapibus mauris. Cras vitae lorem sed eros ullamcorper dignissim.","state":1,"catid":"16","created":"2016-02-22 02:19:44","created_by":"198","created_by_alias":"","modified":"2016-02-23 04:52:51","modified_by":"198","checked_out":"198","checked_out_time":"2016-02-23 04:52:37","publish_up":"2016-02-22 02:19:44","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"images\\\\\\/5661697632_d1ff426de6_b-670x300.jpg\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"0\\",\\"show_hits\\":\\"0\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":3,"ordering":"0","metakey":"","metadesc":"","access":"1","hits":"1","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(66, 8, 1, '', '2016-05-07 03:40:20', 198, 1875, '46e15e1fdf297133212adcadaed1f0ad52d0f2a9', '{"id":8,"asset_id":"123","title":"SoundCloud Preview","alias":"soundcloud-preview","introtext":"This posts show how SoundCloud embeds does work on Travelify theme:\\r\\n","fulltext":"\\r\\nThis posts show how SoundCloud embeds does work on Travelify theme:","state":1,"catid":"11","created":"2016-02-21 10:52:02","created_by":"198","created_by_alias":"","modified":"2016-05-07 03:40:20","modified_by":"198","checked_out":"198","checked_out_time":"2016-05-07 03:40:07","publish_up":"2016-02-21 10:52:02","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"images\\\\\\/new-york-14-670x300.jpg\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"0\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":13,"ordering":"1","metakey":"","metadesc":"","access":"1","hits":"70","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0);

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_updates`
--

CREATE TABLE IF NOT EXISTS `hyxu5_updates` (
  `update_id` int(11) NOT NULL AUTO_INCREMENT,
  `update_site_id` int(11) DEFAULT '0',
  `extension_id` int(11) DEFAULT '0',
  `name` varchar(100) DEFAULT '',
  `description` text NOT NULL,
  `element` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `folder` varchar(20) DEFAULT '',
  `client_id` tinyint(3) DEFAULT '0',
  `version` varchar(32) DEFAULT '',
  `data` text NOT NULL,
  `detailsurl` text NOT NULL,
  `infourl` text NOT NULL,
  `extra_query` varchar(1000) DEFAULT '',
  PRIMARY KEY (`update_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Available Updates' AUTO_INCREMENT=70 ;

--
-- Dumping data for table `hyxu5_updates`
--

INSERT INTO `hyxu5_updates` (`update_id`, `update_site_id`, `extension_id`, `name`, `description`, `element`, `type`, `folder`, `client_id`, `version`, `data`, `detailsurl`, `infourl`, `extra_query`) VALUES
(1, 1, 700, 'Joomla', '', 'joomla', 'file', '', 0, '3.5.1', '', 'https://update.joomla.org/core/sts/extension_sts.xml', '', ''),
(2, 3, 0, 'Armenian', '', 'pkg_hy-AM', 'package', '', 0, '3.4.4.1', '', 'https://update.joomla.org/language/details3/hy-AM_details.xml', '', ''),
(3, 3, 0, 'Malay', '', 'pkg_ms-MY', 'package', '', 0, '3.4.1.2', '', 'https://update.joomla.org/language/details3/ms-MY_details.xml', '', ''),
(4, 3, 0, 'Romanian', '', 'pkg_ro-RO', 'package', '', 0, '3.5.0.1', '', 'https://update.joomla.org/language/details3/ro-RO_details.xml', '', ''),
(5, 3, 0, 'Flemish', '', 'pkg_nl-BE', 'package', '', 0, '3.5.1.1', '', 'https://update.joomla.org/language/details3/nl-BE_details.xml', '', ''),
(6, 3, 0, 'Chinese Traditional', '', 'pkg_zh-TW', 'package', '', 0, '3.5.0.1', '', 'https://update.joomla.org/language/details3/zh-TW_details.xml', '', ''),
(7, 3, 0, 'French', '', 'pkg_fr-FR', 'package', '', 0, '3.5.1.1', '', 'https://update.joomla.org/language/details3/fr-FR_details.xml', '', ''),
(8, 3, 0, 'Galician', '', 'pkg_gl-ES', 'package', '', 0, '3.3.1.2', '', 'https://update.joomla.org/language/details3/gl-ES_details.xml', '', ''),
(9, 3, 0, 'German', '', 'pkg_de-DE', 'package', '', 0, '3.5.1.1', '', 'https://update.joomla.org/language/details3/de-DE_details.xml', '', ''),
(10, 3, 0, 'Greek', '', 'pkg_el-GR', 'package', '', 0, '3.4.2.1', '', 'https://update.joomla.org/language/details3/el-GR_details.xml', '', ''),
(11, 3, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '3.5.1.1', '', 'https://update.joomla.org/language/details3/ja-JP_details.xml', '', ''),
(12, 3, 0, 'Hebrew', '', 'pkg_he-IL', 'package', '', 0, '3.1.1.1', '', 'https://update.joomla.org/language/details3/he-IL_details.xml', '', ''),
(13, 3, 0, 'Hungarian', '', 'pkg_hu-HU', 'package', '', 0, '3.5.1.2', '', 'https://update.joomla.org/language/details3/hu-HU_details.xml', '', ''),
(14, 3, 0, 'Afrikaans', '', 'pkg_af-ZA', 'package', '', 0, '3.5.2.2', '', 'https://update.joomla.org/language/details3/af-ZA_details.xml', '', ''),
(15, 3, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '3.5.0.1', '', 'https://update.joomla.org/language/details3/ar-AA_details.xml', '', ''),
(16, 3, 0, 'Belarusian', '', 'pkg_be-BY', 'package', '', 0, '3.2.1.1', '', 'https://update.joomla.org/language/details3/be-BY_details.xml', '', ''),
(17, 3, 0, 'Bulgarian', '', 'pkg_bg-BG', 'package', '', 0, '3.4.4.2', '', 'https://update.joomla.org/language/details3/bg-BG_details.xml', '', ''),
(18, 3, 0, 'Catalan', '', 'pkg_ca-ES', 'package', '', 0, '3.5.0.1', '', 'https://update.joomla.org/language/details3/ca-ES_details.xml', '', ''),
(19, 3, 0, 'Chinese Simplified', '', 'pkg_zh-CN', 'package', '', 0, '3.4.1.1', '', 'https://update.joomla.org/language/details3/zh-CN_details.xml', '', ''),
(20, 3, 0, 'Croatian', '', 'pkg_hr-HR', 'package', '', 0, '3.5.1.1', '', 'https://update.joomla.org/language/details3/hr-HR_details.xml', '', ''),
(21, 3, 0, 'Czech', '', 'pkg_cs-CZ', 'package', '', 0, '3.5.1.1', '', 'https://update.joomla.org/language/details3/cs-CZ_details.xml', '', ''),
(22, 3, 0, 'Danish', '', 'pkg_da-DK', 'package', '', 0, '3.5.1.1', '', 'https://update.joomla.org/language/details3/da-DK_details.xml', '', ''),
(23, 3, 0, 'Dutch', '', 'pkg_nl-NL', 'package', '', 0, '3.5.1.2', '', 'https://update.joomla.org/language/details3/nl-NL_details.xml', '', ''),
(24, 3, 0, 'Estonian', '', 'pkg_et-EE', 'package', '', 0, '3.5.0.1', '', 'https://update.joomla.org/language/details3/et-EE_details.xml', '', ''),
(25, 3, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '3.5.1.1', '', 'https://update.joomla.org/language/details3/it-IT_details.xml', '', ''),
(26, 3, 0, 'Khmer', '', 'pkg_km-KH', 'package', '', 0, '3.4.5.1', '', 'https://update.joomla.org/language/details3/km-KH_details.xml', '', ''),
(27, 3, 0, 'Korean', '', 'pkg_ko-KR', 'package', '', 0, '3.5.1.2', '', 'https://update.joomla.org/language/details3/ko-KR_details.xml', '', ''),
(28, 3, 0, 'Latvian', '', 'pkg_lv-LV', 'package', '', 0, '3.4.3.1', '', 'https://update.joomla.org/language/details3/lv-LV_details.xml', '', ''),
(29, 3, 0, 'Macedonian', '', 'pkg_mk-MK', 'package', '', 0, '3.5.0.1', '', 'https://update.joomla.org/language/details3/mk-MK_details.xml', '', ''),
(30, 3, 0, 'Norwegian Bokmal', '', 'pkg_nb-NO', 'package', '', 0, '3.5.1.1', '', 'https://update.joomla.org/language/details3/nb-NO_details.xml', '', ''),
(31, 3, 0, 'Norwegian Nynorsk', '', 'pkg_nn-NO', 'package', '', 0, '3.4.2.1', '', 'https://update.joomla.org/language/details3/nn-NO_details.xml', '', ''),
(32, 3, 0, 'Persian', '', 'pkg_fa-IR', 'package', '', 0, '3.5.1.1', '', 'https://update.joomla.org/language/details3/fa-IR_details.xml', '', ''),
(33, 3, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '3.5.0.1', '', 'https://update.joomla.org/language/details3/pl-PL_details.xml', '', ''),
(34, 3, 0, 'Portuguese', '', 'pkg_pt-PT', 'package', '', 0, '3.5.1.4', '', 'https://update.joomla.org/language/details3/pt-PT_details.xml', '', ''),
(35, 3, 0, 'Russian', '', 'pkg_ru-RU', 'package', '', 0, '3.5.0.6', '', 'https://update.joomla.org/language/details3/ru-RU_details.xml', '', ''),
(36, 3, 0, 'English AU', '', 'pkg_en-AU', 'package', '', 0, '3.5.1.2', '', 'https://update.joomla.org/language/details3/en-AU_details.xml', '', ''),
(37, 3, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '3.5.1.2', '', 'https://update.joomla.org/language/details3/sk-SK_details.xml', '', ''),
(38, 3, 0, 'English US', '', 'pkg_en-US', 'package', '', 0, '3.5.1.1', '', 'https://update.joomla.org/language/details3/en-US_details.xml', '', ''),
(39, 3, 0, 'Swedish', '', 'pkg_sv-SE', 'package', '', 0, '3.5.1.1', '', 'https://update.joomla.org/language/details3/sv-SE_details.xml', '', ''),
(40, 3, 0, 'Syriac', '', 'pkg_sy-IQ', 'package', '', 0, '3.4.5.1', '', 'https://update.joomla.org/language/details3/sy-IQ_details.xml', '', ''),
(41, 3, 0, 'Tamil', '', 'pkg_ta-IN', 'package', '', 0, '3.5.1.2', '', 'https://update.joomla.org/language/details3/ta-IN_details.xml', '', ''),
(42, 3, 0, 'Thai', '', 'pkg_th-TH', 'package', '', 0, '3.5.1.1', '', 'https://update.joomla.org/language/details3/th-TH_details.xml', '', ''),
(43, 3, 0, 'Turkish', '', 'pkg_tr-TR', 'package', '', 0, '3.5.1.1', '', 'https://update.joomla.org/language/details3/tr-TR_details.xml', '', ''),
(44, 3, 0, 'Ukrainian', '', 'pkg_uk-UA', 'package', '', 0, '3.5.1.1', '', 'https://update.joomla.org/language/details3/uk-UA_details.xml', '', ''),
(45, 3, 0, 'Uyghur', '', 'pkg_ug-CN', 'package', '', 0, '3.3.0.1', '', 'https://update.joomla.org/language/details3/ug-CN_details.xml', '', ''),
(46, 3, 0, 'Albanian', '', 'pkg_sq-AL', 'package', '', 0, '3.1.1.1', '', 'https://update.joomla.org/language/details3/sq-AL_details.xml', '', ''),
(47, 3, 0, 'Basque', '', 'pkg_eu-ES', 'package', '', 0, '3.5.1.2', '', 'https://update.joomla.org/language/details3/eu-ES_details.xml', '', ''),
(48, 3, 0, 'Hindi', '', 'pkg_hi-IN', 'package', '', 0, '3.3.6.1', '', 'https://update.joomla.org/language/details3/hi-IN_details.xml', '', ''),
(49, 3, 0, 'Portuguese Brazil', '', 'pkg_pt-BR', 'package', '', 0, '3.5.1.1', '', 'https://update.joomla.org/language/details3/pt-BR_details.xml', '', ''),
(50, 3, 0, 'Serbian Latin', '', 'pkg_sr-YU', 'package', '', 0, '3.5.0.1', '', 'https://update.joomla.org/language/details3/sr-YU_details.xml', '', ''),
(51, 3, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '3.5.1.1', '', 'https://update.joomla.org/language/details3/es-ES_details.xml', '', ''),
(52, 3, 0, 'Bosnian', '', 'pkg_bs-BA', 'package', '', 0, '3.4.8.1', '', 'https://update.joomla.org/language/details3/bs-BA_details.xml', '', ''),
(53, 3, 0, 'Serbian Cyrillic', '', 'pkg_sr-RS', 'package', '', 0, '3.5.0.1', '', 'https://update.joomla.org/language/details3/sr-RS_details.xml', '', ''),
(54, 3, 0, 'Vietnamese', '', 'pkg_vi-VN', 'package', '', 0, '3.2.1.1', '', 'https://update.joomla.org/language/details3/vi-VN_details.xml', '', ''),
(55, 3, 0, 'Bahasa Indonesia', '', 'pkg_id-ID', 'package', '', 0, '3.3.0.2', '', 'https://update.joomla.org/language/details3/id-ID_details.xml', '', ''),
(56, 3, 0, 'Finnish', '', 'pkg_fi-FI', 'package', '', 0, '3.5.1.1', '', 'https://update.joomla.org/language/details3/fi-FI_details.xml', '', ''),
(57, 3, 0, 'Swahili', '', 'pkg_sw-KE', 'package', '', 0, '3.5.1.1', '', 'https://update.joomla.org/language/details3/sw-KE_details.xml', '', ''),
(58, 3, 0, 'Montenegrin', '', 'pkg_srp-ME', 'package', '', 0, '3.3.1.1', '', 'https://update.joomla.org/language/details3/srp-ME_details.xml', '', ''),
(59, 3, 0, 'English CA', '', 'pkg_en-CA', 'package', '', 0, '3.5.1.2', '', 'https://update.joomla.org/language/details3/en-CA_details.xml', '', ''),
(60, 3, 0, 'French CA', '', 'pkg_fr-CA', 'package', '', 0, '3.5.1.2', '', 'https://update.joomla.org/language/details3/fr-CA_details.xml', '', ''),
(61, 3, 0, 'Welsh', '', 'pkg_cy-GB', 'package', '', 0, '3.3.0.2', '', 'https://update.joomla.org/language/details3/cy-GB_details.xml', '', ''),
(62, 3, 0, 'Sinhala', '', 'pkg_si-LK', 'package', '', 0, '3.3.1.1', '', 'https://update.joomla.org/language/details3/si-LK_details.xml', '', ''),
(63, 3, 0, 'Dari Persian', '', 'pkg_prs-AF', 'package', '', 0, '3.4.4.1', '', 'https://update.joomla.org/language/details3/prs-AF_details.xml', '', ''),
(64, 3, 0, 'Turkmen', '', 'pkg_tk-TM', 'package', '', 0, '3.5.0.1', '', 'https://update.joomla.org/language/details3/tk-TM_details.xml', '', ''),
(65, 3, 0, 'Irish', '', 'pkg_ga-IE', 'package', '', 0, '3.5.1.1', '', 'https://update.joomla.org/language/details3/ga-IE_details.xml', '', ''),
(66, 3, 0, 'Dzongkha', '', 'pkg_dz-BT', 'package', '', 0, '3.4.5.1', '', 'https://update.joomla.org/language/details3/dz-BT_details.xml', '', ''),
(67, 3, 0, 'Slovenian', '', 'pkg_sl-SI', 'package', '', 0, '3.5.1.1', '', 'https://update.joomla.org/language/details3/sl-SI_details.xml', '', ''),
(68, 12, 10102, 'Chronoforms v5', 'Latest update of Chronoforms v5 for Joomla 1.6, 2.5 and 3.x', 'com_chronoforms5', 'component', '', 1, '5.0.11', '', 'http://www.chronoengine.com/chrono_joomla_updates/chronoforms5.xml', 'http://www.chronoengine.com', ''),
(69, 14, 10115, 'Akeeba Backup Core', 'Akeeba Backup Core', 'com_akeeba', 'component', '', 1, '4.7.3', '', 'http://cdn.akeebabackup.com/updates/abcore.xml', 'https://www.akeebabackup.com/component/ars/?view=Items&release_id=2484', '');

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_update_sites`
--

CREATE TABLE IF NOT EXISTS `hyxu5_update_sites` (
  `update_site_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `location` text NOT NULL,
  `enabled` int(11) DEFAULT '0',
  `last_check_timestamp` bigint(20) DEFAULT '0',
  `extra_query` varchar(1000) DEFAULT '',
  PRIMARY KEY (`update_site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Update Sites' AUTO_INCREMENT=17 ;

--
-- Dumping data for table `hyxu5_update_sites`
--

INSERT INTO `hyxu5_update_sites` (`update_site_id`, `name`, `type`, `location`, `enabled`, `last_check_timestamp`, `extra_query`) VALUES
(1, 'Joomla! Core', 'collection', 'http://update.joomla.org/core/list.xml', 1, 1467033802, ''),
(2, 'Joomla! Extension Directory', 'collection', 'http://update.joomla.org/jed/list.xml', 1, 1467033802, ''),
(3, 'Accredited Joomla! Translations', 'collection', 'http://update.joomla.org/language/translationlist_3.xml', 1, 1467033802, ''),
(4, 'Joomla! Update Component Update Site', 'extension', 'http://update.joomla.org/core/extensions/com_joomlaupdate.xml', 1, 1467033802, ''),
(6, 'com_blogsten', 'extension', 'http://www.powermail4joomla.com/index.php?option=com_ars&view=update&task=stream&format=xml&id=1', 1, 1467033802, ''),
(12, 'Chronoforms v5 update server', 'extension', 'http://www.chronoengine.com/chrono_joomla_updates/chronoforms5.xml', 1, 1467033802, ''),
(13, 'CComment Core', 'extension', 'https://compojoom.com/index.php?option=com_ars&view=update&task=stream&format=xml&id=16&dummy=extension.xml', 1, 1467033802, ''),
(14, 'Akeeba Backup Core', 'extension', 'http://cdn.akeebabackup.com/updates/abcore.xml', 1, 1467033802, ''),
(16, 'DocStation Updates', 'collection', 'http://joomla.albalynx.com/updates/docstation/collection.xml', 1, 1467033802, '');

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_update_sites_extensions`
--

CREATE TABLE IF NOT EXISTS `hyxu5_update_sites_extensions` (
  `update_site_id` int(11) NOT NULL DEFAULT '0',
  `extension_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`update_site_id`,`extension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Links extensions to update sites';

--
-- Dumping data for table `hyxu5_update_sites_extensions`
--

INSERT INTO `hyxu5_update_sites_extensions` (`update_site_id`, `extension_id`) VALUES
(1, 700),
(2, 700),
(3, 600),
(4, 28),
(6, 10063),
(12, 10102),
(13, 10108),
(14, 10115),
(16, 10128);

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_usergroups`
--

CREATE TABLE IF NOT EXISTS `hyxu5_usergroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Adjacency List Reference Id',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `title` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  KEY `idx_usergroup_title_lookup` (`title`),
  KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `hyxu5_usergroups`
--

INSERT INTO `hyxu5_usergroups` (`id`, `parent_id`, `lft`, `rgt`, `title`) VALUES
(1, 0, 1, 18, 'Public'),
(2, 1, 8, 15, 'Registered'),
(3, 2, 9, 14, 'Author'),
(4, 3, 10, 13, 'Editor'),
(5, 4, 11, 12, 'Publisher'),
(6, 1, 4, 7, 'Manager'),
(7, 6, 5, 6, 'Administrator'),
(8, 1, 16, 17, 'Super Users'),
(9, 1, 2, 3, 'Guest');

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_users`
--

CREATE TABLE IF NOT EXISTS `hyxu5_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `lastResetTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of last password reset',
  `resetCount` int(11) NOT NULL DEFAULT '0' COMMENT 'Count of password resets since lastResetTime',
  `otpKey` varchar(1000) NOT NULL DEFAULT '' COMMENT 'Two factor authentication encrypted keys',
  `otep` varchar(1000) NOT NULL DEFAULT '' COMMENT 'One time emergency passwords',
  `requireReset` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Require user to reset password on next login',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`),
  KEY `idx_block` (`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=199 ;

--
-- Dumping data for table `hyxu5_users`
--

INSERT INTO `hyxu5_users` (`id`, `name`, `username`, `email`, `password`, `block`, `sendEmail`, `registerDate`, `lastvisitDate`, `activation`, `params`, `lastResetTime`, `resetCount`, `otpKey`, `otep`, `requireReset`) VALUES
(198, 'Super User', '123', 'toanhd005@gmail.com', '$2y$10$Jtzi/YjTrXrfT6HAedheM.sVGTWtyoiymk.cOuO737o8H5rL51R0q', 0, 1, '2016-02-15 14:52:16', '2016-06-27 13:23:16', '0', '', '0000-00-00 00:00:00', 0, '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_user_keys`
--

CREATE TABLE IF NOT EXISTS `hyxu5_user_keys` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `series` varchar(255) NOT NULL,
  `invalid` tinyint(4) NOT NULL,
  `time` varchar(200) NOT NULL,
  `uastring` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `series` (`series`),
  UNIQUE KEY `series_2` (`series`),
  UNIQUE KEY `series_3` (`series`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_user_notes`
--

CREATE TABLE IF NOT EXISTS `hyxu5_user_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(100) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL,
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_category_id` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_user_profiles`
--

CREATE TABLE IF NOT EXISTS `hyxu5_user_profiles` (
  `user_id` int(11) NOT NULL,
  `profile_key` varchar(100) NOT NULL,
  `profile_value` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `idx_user_id_profile_key` (`user_id`,`profile_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Simple user profile storage table';

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_user_usergroup_map`
--

CREATE TABLE IF NOT EXISTS `hyxu5_user_usergroup_map` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__users.id',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__usergroups.id',
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hyxu5_user_usergroup_map`
--

INSERT INTO `hyxu5_user_usergroup_map` (`user_id`, `group_id`) VALUES
(198, 8);

-- --------------------------------------------------------

--
-- Table structure for table `hyxu5_viewlevels`
--

CREATE TABLE IF NOT EXISTS `hyxu5_viewlevels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `title` varchar(100) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_assetgroup_title_lookup` (`title`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `hyxu5_viewlevels`
--

INSERT INTO `hyxu5_viewlevels` (`id`, `title`, `ordering`, `rules`) VALUES
(1, 'Public', 0, '[1]'),
(2, 'Registered', 2, '[6,2,8]'),
(3, 'Special', 3, '[6,3,8]'),
(5, 'Guest', 1, '[9]'),
(6, 'Super Users', 4, '[8]');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
