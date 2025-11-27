-- phpMyAdmin SQL Dump
-- version 2.11.11.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 24, 2011 at 03:12 PM
-- Server version: 5.0.77
-- PHP Version: 5.1.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tfl005`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `auth_group`
--


-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL auto_increment,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `permission_id_refs_id_5886d21f` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `auth_group_permissions`
--


-- --------------------------------------------------------

--
-- Table structure for table `auth_message`
--

CREATE TABLE IF NOT EXISTS `auth_message` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `message` longtext NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `auth_message_user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=735 ;

--
-- Dumping data for table `auth_message`
--


-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id` (`content_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=55 ;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add permission', 1, 'add_permission'),
(2, 'Can change permission', 1, 'change_permission'),
(3, 'Can delete permission', 1, 'delete_permission'),
(4, 'Can add group', 2, 'add_group'),
(5, 'Can change group', 2, 'change_group'),
(6, 'Can delete group', 2, 'delete_group'),
(7, 'Can add user', 3, 'add_user'),
(8, 'Can change user', 3, 'change_user'),
(9, 'Can delete user', 3, 'delete_user'),
(10, 'Can add message', 4, 'add_message'),
(11, 'Can change message', 4, 'change_message'),
(12, 'Can delete message', 4, 'delete_message'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add site', 7, 'add_site'),
(20, 'Can change site', 7, 'change_site'),
(21, 'Can delete site', 7, 'delete_site'),
(22, 'Can add glass', 8, 'add_glass'),
(23, 'Can change glass', 8, 'change_glass'),
(24, 'Can delete glass', 8, 'delete_glass'),
(25, 'Can add gallery', 9, 'add_gallery'),
(26, 'Can change gallery', 9, 'change_gallery'),
(27, 'Can delete gallery', 9, 'delete_gallery'),
(28, 'Can add gallery upload', 10, 'add_galleryupload'),
(29, 'Can change gallery upload', 10, 'change_galleryupload'),
(30, 'Can delete gallery upload', 10, 'delete_galleryupload'),
(31, 'Can add photo', 11, 'add_photo'),
(32, 'Can change photo', 11, 'change_photo'),
(33, 'Can delete photo', 11, 'delete_photo'),
(34, 'Can add photo effect', 12, 'add_photoeffect'),
(35, 'Can change photo effect', 12, 'change_photoeffect'),
(36, 'Can delete photo effect', 12, 'delete_photoeffect'),
(37, 'Can add watermark', 13, 'add_watermark'),
(38, 'Can change watermark', 13, 'change_watermark'),
(39, 'Can delete watermark', 13, 'delete_watermark'),
(40, 'Can add photo size', 14, 'add_photosize'),
(41, 'Can change photo size', 14, 'change_photosize'),
(42, 'Can delete photo size', 14, 'delete_photosize'),
(43, 'Can add log entry', 15, 'add_logentry'),
(44, 'Can change log entry', 15, 'change_logentry'),
(45, 'Can delete log entry', 15, 'delete_logentry'),
(46, 'Can add tag', 16, 'add_tag'),
(47, 'Can change tag', 16, 'change_tag'),
(48, 'Can delete tag', 16, 'delete_tag'),
(49, 'Can add tagged item', 17, 'add_taggeditem'),
(50, 'Can change tagged item', 17, 'change_taggeditem'),
(51, 'Can delete tagged item', 17, 'delete_taggeditem'),
(52, 'Can add blog post', 18, 'add_blogpost'),
(53, 'Can change blog post', 18, 'change_blogpost'),
(54, 'Can delete blog post', 18, 'delete_blogpost');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `username`, `first_name`, `last_name`, `email`, `password`, `is_staff`, `is_active`, `is_superuser`, `last_login`, `date_joined`) VALUES
(1, 'tanja', '', '', 'tanja@test.com', 'sha1$636ed$696ab220873b7722cee760b830cefb55c5db31cf', 1, 1, 1, '2010-09-19 22:28:25', '2009-07-21 17:37:31');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `group_id_refs_id_f116770` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `auth_user_groups`
--


-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `permission_id_refs_id_67e79cb` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `auth_user_user_permissions`
--


-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL auto_increment,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) default NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `django_admin_log_user_id` (`user_id`),
  KEY `django_admin_log_content_type_id` (`content_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=737 ;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `user_id`, `content_type_id`, `object_id`, `object_repr`, `action_flag`, `change_message`) VALUES
(108, '2009-07-27 20:40:21', 1, 11, '46', 'rrrrrr', 1, ''),
(107, '2009-07-27 20:39:43', 1, 11, '45', 'testtttttt', 1, ''),
(106, '2009-07-27 20:38:48', 1, 9, '5', 'Test', 2, 'No fields changed.'),
(105, '2009-07-27 20:38:45', 1, 9, '5', 'Test', 2, 'Changed photos.'),
(104, '2009-07-27 20:38:06', 1, 9, '5', 'Test', 2, 'No fields changed.'),
(103, '2009-07-27 20:37:30', 1, 11, 'None', 'testtest 4', 3, ''),
(102, '2009-07-27 20:37:26', 1, 11, 'None', 'testtest 6', 3, ''),
(101, '2009-07-27 20:37:20', 1, 11, 'None', 'testtest 5', 3, ''),
(100, '2009-07-27 20:37:16', 1, 11, 'None', 'testtest 7', 3, ''),
(99, '2009-07-27 20:37:12', 1, 11, 'None', 'testtest 8', 3, ''),
(98, '2009-07-27 20:37:07', 1, 11, 'None', 'testtest 9', 3, ''),
(97, '2009-07-27 20:37:04', 1, 11, 'None', 'testtest 10', 3, ''),
(96, '2009-07-27 20:36:59', 1, 11, 'None', 'testtest 11', 3, ''),
(95, '2009-07-27 20:36:55', 1, 11, 'None', 'testtest 12', 3, ''),
(94, '2009-07-27 19:08:54', 1, 9, '5', 'Test', 2, 'Changed photos.'),
(93, '2009-07-27 19:08:22', 1, 9, '5', 'Test', 2, 'Changed photos.'),
(92, '2009-07-27 18:15:15', 1, 9, 'None', 'Hallo', 3, ''),
(90, '2009-07-27 18:06:28', 1, 11, 'None', 'test', 3, ''),
(91, '2009-07-27 18:14:40', 1, 10, 'None', 'GalleryUpload object', 1, ''),
(89, '2009-07-27 18:05:36', 1, 11, '27', 'test', 1, ''),
(32, '2009-07-22 00:27:16', 1, 11, 'None', 'Test 8', 3, ''),
(33, '2009-07-22 00:27:24', 1, 11, 'None', 'Test 9', 3, ''),
(34, '2009-07-22 00:27:31', 1, 11, 'None', 'Test 4', 3, ''),
(35, '2009-07-22 00:27:36', 1, 11, 'None', 'Test 11', 3, ''),
(36, '2009-07-22 00:27:41', 1, 11, 'None', 'Test 6', 3, ''),
(37, '2009-07-22 00:27:46', 1, 11, 'None', 'Test 7', 3, ''),
(38, '2009-07-22 00:27:52', 1, 11, 'None', 'Test 12', 3, ''),
(39, '2009-07-22 00:27:56', 1, 10, 'None', 'GalleryUpload object', 1, ''),
(40, '2009-07-22 00:28:08', 1, 11, '21', 'Test 15', 2, 'Changed caption.'),
(41, '2009-07-22 00:37:44', 1, 14, '3', 'display', 2, 'Changed width and height.'),
(42, '2009-07-22 00:41:05', 1, 9, '5', 'Test', 2, 'Changed photos.'),
(43, '2009-07-22 00:44:48', 1, 14, '2', 'thumbnail', 2, 'Changed width, height and effect.'),
(44, '2009-07-22 00:47:09', 1, 14, '2', 'thumbnail', 2, 'Changed width, height and effect.'),
(45, '2009-07-22 00:47:22', 1, 14, '3', 'display', 2, 'Changed width, height and quality.'),
(46, '2009-07-22 13:56:46', 1, 14, '2', 'thumbnail', 2, 'Changed width and height.'),
(47, '2009-07-22 23:44:18', 1, 14, '2', 'thumbnail', 2, 'Changed width and height.'),
(48, '2009-07-22 23:44:54', 1, 14, '2', 'thumbnail', 2, 'Changed height.'),
(49, '2009-07-26 14:08:39', 1, 14, '3', 'display', 2, 'Changed width and height.'),
(50, '2009-07-26 14:09:15', 1, 14, '3', 'display', 2, 'Changed width and height.'),
(51, '2009-07-26 14:13:40', 1, 14, '3', 'display', 2, 'Changed width.'),
(52, '2009-07-26 14:20:50', 1, 11, '24', 'Rømer eller berkemeyerglass', 1, ''),
(53, '2009-07-26 14:21:59', 1, 11, 'None', 'Test 17', 3, ''),
(54, '2009-07-26 14:22:05', 1, 11, 'None', 'Test 14', 3, ''),
(55, '2009-07-26 14:25:51', 1, 9, '5', 'Test', 2, 'Changed photos.'),
(56, '2009-07-26 14:26:32', 1, 9, '5', 'Test', 2, 'Changed photos.'),
(57, '2009-07-26 14:26:52', 1, 11, '24', 'Rømer eller berkemeyerglass', 2, 'Changed effect.'),
(58, '2009-07-26 14:29:44', 1, 9, '5', 'Test', 2, 'No fields changed.'),
(59, '2009-07-26 14:32:56', 1, 11, '25', 'Slangestett', 1, ''),
(60, '2009-07-26 14:33:12', 1, 9, '5', 'Test', 2, 'Changed photos.'),
(61, '2009-07-26 14:33:26', 1, 9, '5', 'Test', 2, 'Changed photos.'),
(62, '2009-07-26 14:34:13', 1, 11, '25', 'Slangestett', 2, 'Changed image.'),
(63, '2009-07-26 14:34:33', 1, 11, '24', 'Rømer eller berkemeyerglass', 2, 'Changed image.'),
(64, '2009-07-26 14:34:44', 1, 11, '24', 'Rømer eller berkemeyerglass', 2, 'Changed effect.'),
(65, '2009-07-26 14:35:02', 1, 11, 'None', 'Rømer eller berkemeyerglass', 3, ''),
(66, '2009-07-26 14:36:56', 1, 11, '26', 'Rømer- eller berkemeyerglass', 1, ''),
(67, '2009-07-26 14:37:13', 1, 9, '5', 'Test', 2, 'Changed photos.'),
(68, '2009-07-26 14:37:42', 1, 11, '26', 'Romer- eller berkemeyerglass', 2, 'Changed title.'),
(69, '2009-07-26 14:37:56', 1, 11, '26', 'Rømer- eller berkemeyerglass', 2, 'Changed title.'),
(70, '2009-07-26 14:42:37', 1, 11, '26', 'Rømer- eller berkemeyerglass', 2, 'Changed image.'),
(71, '2009-07-26 14:43:17', 1, 11, 'None', 'Test 16', 3, ''),
(72, '2009-07-26 14:43:22', 1, 11, 'None', 'Test 15', 3, ''),
(73, '2009-07-26 14:43:28', 1, 11, 'None', 'Test 3', 3, ''),
(74, '2009-07-26 14:43:33', 1, 11, 'None', 'Test 13', 3, ''),
(75, '2009-07-26 14:43:38', 1, 11, 'None', 'Test 2', 3, ''),
(76, '2009-07-26 14:43:42', 1, 11, 'None', 'Test 1', 3, ''),
(77, '2009-07-26 14:45:30', 1, 14, '3', 'display', 2, 'Changed height.'),
(78, '2009-07-26 14:47:17', 1, 14, '3', 'display', 2, 'Changed height.'),
(79, '2009-07-26 20:46:59', 1, 14, '2', 'thumbnail', 2, 'Changed width.'),
(80, '2009-07-26 20:47:29', 1, 14, '2', 'thumbnail', 2, 'Changed height.'),
(81, '2009-07-26 20:48:15', 1, 14, '2', 'thumbnail', 2, 'Changed width.'),
(82, '2009-07-26 20:48:39', 1, 14, '2', 'thumbnail', 2, 'Changed width.'),
(83, '2009-07-26 20:52:13', 1, 14, '2', 'thumbnail', 2, 'Changed width and height.'),
(84, '2009-07-26 21:00:30', 1, 14, '2', 'thumbnail', 2, 'Changed width and height.'),
(85, '2009-07-26 21:02:30', 1, 14, '2', 'thumbnail', 2, 'Changed width and height.'),
(86, '2009-07-26 21:02:43', 1, 14, '2', 'thumbnail', 2, 'Changed width and height.'),
(87, '2009-07-27 01:41:20', 1, 18, '1', 'BlogPost object', 1, ''),
(88, '2009-07-27 12:14:13', 1, 12, '1', 'Enhance Thumbnail', 2, 'Changed sharpness.'),
(109, '2009-07-27 20:40:24', 1, 9, '5', 'Test', 2, 'Changed photos.'),
(110, '2009-07-29 14:09:49', 1, 11, 'None', 'testtest 17', 3, ''),
(111, '2009-07-29 14:09:53', 1, 11, 'None', 'testtttttt', 3, ''),
(112, '2009-07-29 14:09:57', 1, 11, 'None', 'testtest 16', 3, ''),
(113, '2009-07-29 14:10:00', 1, 11, 'None', 'testtest 15', 3, ''),
(114, '2009-07-29 14:10:04', 1, 11, 'None', 'testtest 14', 3, ''),
(115, '2009-07-29 14:10:07', 1, 11, 'None', 'testtest 13', 3, ''),
(116, '2009-07-29 14:10:11', 1, 11, 'None', 'testtest 3', 3, ''),
(117, '2009-07-29 14:10:14', 1, 11, 'None', 'testtest 2', 3, ''),
(118, '2009-07-29 14:10:17', 1, 11, 'None', 'testtest 1', 3, ''),
(119, '2009-07-29 14:14:01', 1, 11, '47', 'Drikkeglass', 1, ''),
(120, '2009-07-29 14:14:30', 1, 9, '5', 'Test', 2, 'Changed photos.'),
(121, '2009-07-29 14:17:30', 1, 11, '48', 'Rømer eller berkemeyerglass', 1, ''),
(122, '2009-07-29 14:20:11', 1, 11, '49', 'Venetiansk stettglass', 1, ''),
(123, '2009-07-29 14:23:13', 1, 11, '50', 'Stett av Rømerglass', 1, ''),
(124, '2009-07-29 14:28:19', 1, 11, '51', 'Grønt rømer- eller berkemeyerglass', 1, ''),
(125, '2009-07-29 14:28:37', 1, 9, '5', 'Test', 2, 'Changed photos.'),
(126, '2009-07-29 14:33:25', 1, 11, '46', 'Rømer eller berkemeyerglass med glassyke', 2, 'Changed title, title_slug and caption.'),
(127, '2009-07-29 14:33:30', 1, 11, '46', 'Rømer eller berkemeyerglass med glassyke', 2, 'No fields changed.'),
(128, '2009-07-29 14:33:53', 1, 9, '5', 'Test', 2, 'No fields changed.'),
(129, '2009-07-29 14:35:24', 1, 11, '51', 'Grønt rømer- eller berkemeyerglass', 2, 'No fields changed.'),
(130, '2009-07-29 14:35:34', 1, 9, '5', 'Test', 2, 'No fields changed.'),
(131, '2009-07-29 14:36:21', 1, 9, '5', 'Test', 2, 'No fields changed.'),
(132, '2009-07-29 14:36:50', 1, 9, '5', 'Test', 2, 'No fields changed.'),
(133, '2009-07-29 14:39:10', 1, 9, '5', 'Test', 2, 'No fields changed.'),
(134, '2009-07-29 14:42:25', 1, 9, '5', 'Test', 2, 'No fields changed.'),
(135, '2009-07-29 14:42:55', 1, 9, '5', 'Test', 2, 'Changed is_public.'),
(136, '2009-07-29 14:43:07', 1, 9, '5', 'Test', 2, 'Changed is_public.'),
(137, '2009-07-29 14:43:57', 1, 11, '51', 'Grønt rømer- eller berkemeyerglass', 2, 'No fields changed.'),
(138, '2009-07-29 14:44:30', 1, 9, '5', 'Test', 2, 'No fields changed.'),
(139, '2009-07-29 14:44:41', 1, 9, '5', 'Test', 2, 'Changed photos.'),
(140, '2009-07-29 14:45:04', 1, 9, '5', 'Test', 2, 'Changed photos.'),
(141, '2009-07-29 14:47:00', 1, 11, '46', 'Rømer eller berkemeyerglass med glassyke', 2, 'Changed caption.'),
(142, '2009-07-29 14:47:15', 1, 11, '46', 'Rømer eller berkemeyerglass med glassyke', 2, 'Changed caption.'),
(143, '2009-07-29 14:47:26', 1, 9, '5', 'Test', 2, 'No fields changed.'),
(144, '2009-07-29 14:48:25', 1, 9, '5', 'Test', 2, 'No fields changed.'),
(145, '2009-07-29 15:01:38', 1, 11, '51', 'Grønt rømer- eller berkemeyerglass', 2, 'No fields changed.'),
(146, '2009-07-29 17:46:05', 1, 9, '5', 'Test', 2, 'Changed photos.'),
(147, '2009-07-29 17:46:31', 1, 9, '5', 'Test', 2, 'Changed photos.'),
(148, '2009-07-29 18:39:42', 1, 9, 'None', 'Glass', 3, ''),
(149, '2009-07-29 18:39:54', 1, 9, '9', 'Glass', 1, ''),
(150, '2009-07-29 18:41:29', 1, 9, '5', 'Test', 2, 'Changed is_public.'),
(151, '2009-07-29 18:42:29', 1, 9, '5', 'Test', 2, 'Changed is_public.'),
(152, '2009-07-29 18:44:42', 1, 11, '47', 'Drikkeglass', 2, 'Changed image.'),
(153, '2009-07-29 18:45:50', 1, 11, '51', 'Grønt rømer- eller berkemeyerglass', 2, 'Changed image.'),
(154, '2009-07-29 18:46:20', 1, 11, '50', 'Stett av Rømerglass', 2, 'Changed image.'),
(155, '2009-07-29 18:47:07', 1, 11, '49', 'Venetiansk stettglass', 2, 'Changed image.'),
(156, '2009-07-29 18:48:13', 1, 11, '48', 'Rømer eller berkemeyerglass', 2, 'Changed image.'),
(157, '2009-07-29 18:48:40', 1, 11, '46', 'Rømer eller berkemeyerglass med glassyke', 2, 'Changed image.'),
(158, '2009-07-29 18:48:51', 1, 9, '5', 'Test', 2, 'No fields changed.'),
(159, '2009-07-29 20:58:09', 1, 11, '49', 'Venetiansk stettglass', 2, 'Changed caption.'),
(160, '2009-07-29 20:58:31', 1, 11, '49', 'Venetiansk stettglass', 2, 'Changed caption.'),
(161, '2009-07-29 22:00:34', 1, 11, '46', 'Rømer eller berkemeyerglass med glassyke', 2, 'Changed caption.'),
(162, '2009-07-29 22:01:01', 1, 11, '46', 'Rømer eller berkemeyerglass med glassyke', 2, 'Changed caption.'),
(163, '2009-07-29 22:01:53', 1, 11, '46', 'Rømer eller berkemeyerglass med glassyke', 2, 'Changed caption.'),
(164, '2009-07-29 22:02:25', 1, 11, '46', 'Rømer eller berkemeyerglass med glassyke', 2, 'Changed caption.'),
(165, '2009-07-29 22:05:29', 1, 11, '46', 'Rømer eller berkemeyerglass med glassyke', 2, 'Changed caption.'),
(166, '2009-07-29 22:06:00', 1, 11, '46', 'Rømer eller berkemeyerglass med glassyke', 2, 'Changed caption.'),
(167, '2009-07-30 11:18:33', 1, 11, '46', 'Rømer eller berkemeyerglass med glassyke', 2, 'Changed caption.'),
(168, '2009-07-30 11:18:49', 1, 11, '46', 'Rømer eller berkemeyerglass med glassyke', 2, 'Changed caption.'),
(169, '2009-07-30 11:19:04', 1, 11, '46', 'Rømer eller berkemeyerglass med glassyke', 2, 'Changed caption.'),
(170, '2009-07-30 11:19:51', 1, 11, '46', 'Rømer eller berkemeyerglass med glassyke', 2, 'Changed caption.'),
(171, '2009-07-30 11:20:12', 1, 11, '46', 'Rømer eller berkemeyerglass med glassyke', 2, 'Changed caption.'),
(172, '2009-07-30 11:20:31', 1, 11, '46', 'Rømer eller berkemeyerglass med glassyke', 2, 'Changed caption.'),
(173, '2009-07-30 11:20:48', 1, 11, '46', 'Rømer eller berkemeyerglass med glassyke', 2, 'Changed caption.'),
(174, '2009-07-30 11:20:59', 1, 11, '46', 'Rømer eller berkemeyerglass med glassyke', 2, 'Changed caption.'),
(175, '2009-07-30 11:21:23', 1, 11, '46', 'Rømer eller berkemeyerglass med glassyke', 2, 'Changed caption.'),
(176, '2009-07-30 11:21:37', 1, 11, '46', 'Rømer eller berkemeyerglass med glassyke', 2, 'Changed caption.'),
(177, '2009-07-30 11:22:29', 1, 11, '46', 'Rømer eller berkemeyerglass med glassyke', 2, 'Changed caption.'),
(178, '2009-07-30 11:22:42', 1, 11, '46', 'Rømer eller berkemeyerglass med glassyke', 2, 'Changed caption.'),
(179, '2009-07-30 11:23:55', 1, 11, '46', 'Rømer eller berkemeyerglass med glassyke', 2, 'Changed caption.'),
(180, '2009-07-30 11:24:13', 1, 11, '46', 'Rømer eller berkemeyerglass med glassyke', 2, 'Changed caption.'),
(181, '2009-07-30 11:24:37', 1, 11, '46', 'Rømer eller berkemeyerglass med glassyke', 2, 'Changed caption.'),
(182, '2009-07-30 11:24:55', 1, 11, '46', 'Rømer eller berkemeyerglass med glassyke', 2, 'Changed caption.'),
(183, '2009-07-30 11:25:18', 1, 11, '46', 'Rømer eller berkemeyerglass med glassyke', 2, 'Changed caption.'),
(184, '2009-07-30 14:26:38', 1, 11, '51', 'Grønt rømer- eller berkemeyerglass', 2, 'Changed image.'),
(185, '2009-07-30 14:26:45', 1, 11, '50', 'Stett av Rømerglass', 2, 'Changed image.'),
(186, '2009-07-30 14:27:00', 1, 11, '48', 'Rømer eller berkemeyerglass', 2, 'Changed image.'),
(187, '2009-07-30 14:27:12', 1, 11, '47', 'Drikkeglass', 2, 'Changed image.'),
(188, '2009-07-30 15:04:49', 1, 11, '48', 'Rømer- eller berkemeyerglass', 2, 'Changed title.'),
(189, '2009-07-30 15:04:57', 1, 11, '46', 'Rømer- eller berkemeyerglass med glassyke', 2, 'Changed title.'),
(190, '2010-02-24 13:53:14', 1, 9, '10', 'Rømer og berkemeyer', 1, ''),
(191, '2010-02-28 16:36:24', 1, 9, '10', 'Rømer og berkemeyer', 2, 'Changed photos.'),
(192, '2010-02-28 16:59:11', 1, 14, '3', 'display', 2, 'Changed width and height.'),
(193, '2010-02-28 16:59:40', 1, 14, '3', 'display', 2, 'Changed width and height.'),
(194, '2010-02-28 17:12:54', 1, 14, '3', 'display', 2, 'Changed width and height.'),
(195, '2010-02-28 17:25:45', 1, 14, '3', 'display', 2, 'Changed width.'),
(196, '2010-02-28 17:26:10', 1, 14, '3', 'display', 2, 'Changed width.'),
(197, '2010-02-28 17:26:23', 1, 14, '3', 'display', 2, 'Changed width.'),
(198, '2010-02-28 17:27:01', 1, 14, '3', 'display', 2, 'Changed width.'),
(199, '2010-02-28 17:27:18', 1, 14, '3', 'display', 2, 'Changed width.'),
(200, '2010-02-28 17:32:15', 1, 11, '52', 'Rømerellerberkemeyer', 1, ''),
(201, '2010-02-28 17:32:43', 1, 11, '52', 'Rømerellerberkemeyer', 2, 'Changed image.'),
(202, '2010-02-28 17:32:53', 1, 11, '52', 'Rømer eller berkemeyer', 2, 'Changed title.'),
(203, '2010-02-28 17:33:23', 1, 9, '10', 'Rømer og berkemeyer', 2, 'Changed photos.'),
(204, '2010-02-28 17:33:40', 1, 9, '10', 'Rømer og berkemeyer', 2, 'No fields changed.'),
(205, '2010-02-28 17:34:09', 1, 9, '10', 'Rømer og berkemeyer', 2, 'Changed photos.'),
(206, '2010-02-28 17:34:22', 1, 9, '10', 'Rømer og berkemeyer', 2, 'Changed photos.'),
(207, '2010-02-28 17:34:43', 1, 9, '10', 'Rømer og berkemeyer', 2, 'Changed photos.'),
(208, '2010-02-28 17:34:59', 1, 9, '10', 'Rømer og berkemeyer', 2, 'Changed photos.'),
(209, '2010-02-28 17:35:14', 1, 12, '2', 'Display Reflection', 2, 'No fields changed.'),
(210, '2010-02-28 17:36:06', 1, 9, '10', 'Rømer og berkemeyer', 2, 'Changed description.'),
(211, '2010-02-28 17:36:29', 1, 9, '10', 'Rømer og berkemeyer', 2, 'Changed description.'),
(212, '2010-02-28 18:14:07', 1, 11, '53', 'Rømer eller berkemeyer2', 1, ''),
(213, '2010-02-28 18:14:17', 1, 9, '10', 'Rømer og berkemeyer', 2, 'Changed photos.'),
(214, '2010-02-28 18:15:09', 1, 9, '10', 'Rømer og berkemeyer', 2, 'No fields changed.'),
(215, '2010-02-28 18:17:33', 1, 9, '11', 'Rømer og berkemeyerglass', 1, ''),
(216, '2010-02-28 18:19:55', 1, 9, 'None', 'Rømer og berkemeyer', 3, ''),
(217, '2010-02-28 18:20:01', 1, 9, 'None', 'Glass', 3, ''),
(218, '2010-02-28 18:22:40', 1, 11, '54', 'Rømer eller berkemeyerglass3', 1, ''),
(219, '2010-02-28 18:24:56', 1, 11, '55', 'Rømer eller berkemeyerglass4', 1, ''),
(220, '2010-02-28 18:25:46', 1, 11, '56', 'Rømer eller berkemeyerglass5', 1, ''),
(221, '2010-02-28 18:26:18', 1, 11, '57', 'Rømerglass', 1, ''),
(222, '2010-02-28 18:26:50', 1, 11, '58', 'Rømerglass2', 1, ''),
(223, '2010-02-28 18:27:08', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(224, '2010-02-28 19:05:47', 1, 11, '58', 'Rømerglass2', 2, 'Changed effect.'),
(225, '2010-02-28 19:05:58', 1, 11, '57', 'Rømerglass', 2, 'Changed effect.'),
(226, '2010-02-28 19:06:05', 1, 11, '56', 'Rømer eller berkemeyerglass5', 2, 'Changed effect.'),
(227, '2010-02-28 19:06:23', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(228, '2010-02-28 19:06:46', 1, 11, '55', 'Rømer eller berkemeyerglass4', 2, 'Changed effect.'),
(229, '2010-02-28 19:06:51', 1, 11, '54', 'Rømer eller berkemeyerglass3', 2, 'Changed effect.'),
(230, '2010-02-28 19:06:56', 1, 11, '53', 'Rømer eller berkemeyer2', 2, 'Changed effect.'),
(231, '2010-02-28 19:07:01', 1, 11, '53', 'Rømer eller berkemeyer2', 2, 'No fields changed.'),
(232, '2010-02-28 19:07:07', 1, 11, '53', 'Rømer eller berkemeyer2', 2, 'No fields changed.'),
(233, '2010-02-28 19:07:27', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(234, '2010-02-28 19:09:08', 1, 9, '11', 'Rømerogberkemeyerglass', 2, 'Changed title.'),
(235, '2010-02-28 19:09:37', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed title.'),
(236, '2010-02-28 19:15:29', 1, 9, '12', 'Maigeleinglass', 1, ''),
(237, '2010-02-28 19:18:55', 1, 11, '59', 'Maigeleinglass', 1, ''),
(238, '2010-02-28 19:19:06', 1, 9, '12', 'Maigeleinglass', 2, 'Changed photos.'),
(239, '2010-02-28 19:22:15', 1, 14, '2', 'thumbnail', 2, 'Changed effect.'),
(240, '2010-02-28 19:24:52', 1, 9, '11', 'Rømer og berkemeyer', 2, 'Changed title and title_slug.'),
(241, '2010-02-28 19:29:11', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed title and title_slug.'),
(242, '2010-02-28 19:36:27', 1, 9, '13', 'Stangenglass', 1, ''),
(243, '2010-02-28 19:41:01', 1, 11, '60', 'Grønnlig smalt stangenglass ', 1, ''),
(244, '2010-02-28 19:41:12', 1, 9, '13', 'Stangenglass', 2, 'Changed photos.'),
(245, '2010-02-28 21:07:34', 1, 11, '61', 'Rømer eller berkemeyerglass6', 1, ''),
(246, '2010-02-28 21:07:45', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(247, '2010-02-28 21:08:36', 1, 11, '61', 'Rømer eller berkemeyerglass6', 2, 'Changed effect.'),
(248, '2010-02-28 21:08:41', 1, 11, '60', 'Grønnlig smalt stangenglass ', 2, 'Changed effect.'),
(249, '2010-02-28 21:08:50', 1, 11, '59', 'Maigeleinglass', 2, 'Changed effect.'),
(250, '2010-02-28 21:44:02', 1, 11, '61', 'Rømer eller berkemeyerglass6', 2, 'No fields changed.'),
(251, '2010-02-28 21:45:02', 1, 11, '60', 'Grønnlig smalt stangenglass ', 2, 'No fields changed.'),
(252, '2010-02-28 21:45:53', 1, 14, '2', 'thumbnail', 2, 'No fields changed.'),
(253, '2010-02-28 22:02:35', 1, 11, 'None', 'Rømer eller berkemeyer', 3, ''),
(254, '2010-02-28 22:03:33', 1, 11, '62', 'Rømer eller berkemeyerglass7', 1, ''),
(255, '2010-02-28 22:03:52', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(256, '2010-02-28 22:07:53', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(257, '2010-02-28 22:10:46', 1, 11, 'None', 'Rømer eller berkemeyerglass6', 3, ''),
(258, '2010-02-28 22:10:49', 1, 11, 'None', 'Grønnlig smalt stangenglass ', 3, ''),
(259, '2010-02-28 22:10:53', 1, 11, 'None', 'Maigeleinglass', 3, ''),
(260, '2010-02-28 22:10:58', 1, 11, 'None', 'Rømerglass2', 3, ''),
(261, '2010-02-28 22:11:02', 1, 11, 'None', 'Rømerglass', 3, ''),
(262, '2010-02-28 22:11:06', 1, 11, 'None', 'Rømer eller berkemeyerglass5', 3, ''),
(263, '2010-02-28 22:11:09', 1, 11, 'None', 'Rømer eller berkemeyerglass4', 3, ''),
(264, '2010-02-28 22:11:13', 1, 11, 'None', 'Rømer eller berkemeyerglass3', 3, ''),
(265, '2010-02-28 22:11:17', 1, 11, 'None', 'Rømer eller berkemeyer2', 3, ''),
(266, '2010-02-28 22:14:59', 1, 11, '62', 'Rømer eller berkemeyerglass7', 2, 'Changed caption.'),
(267, '2010-02-28 22:34:42', 1, 9, '11', 'rr', 2, 'Changed title and title_slug.'),
(268, '2010-02-28 22:34:42', 1, 9, '11', 'rr', 2, 'No fields changed.'),
(269, '2010-02-28 22:42:27', 1, 9, '11', 'rr', 2, 'Changed photos.'),
(270, '2010-02-28 22:44:56', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed title and title_slug.'),
(271, '2010-02-28 22:53:03', 1, 9, '5', 'Test', 2, 'Changed photos.'),
(272, '2010-02-28 22:54:58', 1, 11, '62', 'Rømer eller berkemeyerglass7', 2, 'Changed image.'),
(273, '2010-02-28 22:55:09', 1, 9, '5', 'Test', 2, 'No fields changed.'),
(274, '2010-02-28 22:55:39', 1, 9, '5', 'Test', 2, 'Changed photos.'),
(275, '2010-02-28 22:56:05', 1, 11, '63', 'kjole', 1, ''),
(276, '2010-02-28 22:56:19', 1, 9, '5', 'Test', 2, 'Changed photos.'),
(277, '2010-02-28 22:57:43', 1, 11, '64', 'Rømer- eller berkemeyerglass8', 1, ''),
(278, '2010-02-28 22:57:54', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(279, '2010-02-28 22:58:18', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(280, '2010-02-28 22:58:34', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(281, '2010-02-28 22:59:49', 1, 11, 'None', 'Rømer- eller berkemeyerglass8', 3, ''),
(282, '2010-02-28 22:59:55', 1, 11, 'None', 'Rømer eller berkemeyerglass7', 3, ''),
(283, '2010-02-28 23:00:20', 1, 11, '65', 'Rømer eller berkemeyerglass7', 1, ''),
(284, '2010-02-28 23:00:27', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(285, '2010-02-28 23:01:18', 1, 11, 'None', 'Rømer eller berkemeyerglass7', 3, ''),
(286, '2010-02-28 23:01:42', 1, 11, '66', 'Rømer eller berkemeyerglass', 1, ''),
(287, '2010-02-28 23:02:07', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(288, '2010-02-28 23:03:06', 1, 11, 'None', 'Rømer eller berkemeyerglass', 3, ''),
(289, '2010-02-28 23:03:16', 1, 11, '67', 'Rømer', 1, ''),
(290, '2010-02-28 23:03:31', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(291, '2010-02-28 23:04:47', 1, 11, '67', 'Rømer- eller berkemeyerglass7', 2, 'Changed image, title, title_slug and caption.'),
(292, '2010-02-28 23:05:10', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(293, '2010-02-28 23:05:40', 1, 11, '67', 'Rømer- eller berkemeyerglass7', 2, 'Changed image.'),
(294, '2010-02-28 23:05:50', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(295, '2010-02-28 23:05:57', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(296, '2010-02-28 23:15:08', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(297, '2010-02-28 23:15:33', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(298, '2010-03-01 15:01:06', 1, 11, '68', 'Rømer- eller berkemeyerglass 2', 1, ''),
(299, '2010-03-01 15:01:16', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(300, '2010-03-01 15:02:17', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(301, '2010-03-01 15:02:23', 1, 11, 'None', 'Rømer- eller berkemeyerglass 2', 3, ''),
(302, '2010-03-01 15:02:51', 1, 11, '69', 'Rømer- eller berkemeyerglass 2', 1, ''),
(303, '2010-03-01 15:02:58', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(304, '2010-03-01 15:03:58', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(305, '2010-03-01 15:04:25', 1, 11, '70', 'Rømer- eller berkemeyer 2', 1, ''),
(306, '2010-03-01 15:04:48', 1, 11, 'None', 'Rømer- eller berkemeyerglass 2', 3, ''),
(307, '2010-03-01 15:04:55', 1, 11, '70', 'Rømer- eller berkemeyerglass 2', 2, 'Changed title and title_slug.'),
(308, '2010-03-01 15:05:02', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(309, '2010-03-01 15:05:14', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(310, '2010-03-01 15:05:47', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(311, '2010-03-01 15:05:53', 1, 11, 'None', 'Rømer- eller berkemeyerglass 2', 3, ''),
(312, '2010-03-01 15:06:03', 1, 11, '71', 'Rømer', 1, ''),
(313, '2010-03-01 15:06:13', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(314, '2010-03-01 15:06:25', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(315, '2010-03-01 15:07:25', 1, 11, 'None', 'Rømer', 3, ''),
(316, '2010-03-01 15:07:50', 1, 11, '72', 'Rømer- eller berkemeyerglass 2', 1, ''),
(317, '2010-03-01 15:07:58', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(318, '2010-03-01 15:09:33', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(319, '2010-03-01 15:09:42', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(320, '2010-03-01 15:09:52', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(321, '2010-03-01 15:10:11', 1, 11, '72', 'Rømer- eller berkemeyerglassto', 2, 'Changed title and title_slug.'),
(322, '2010-03-01 15:10:18', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(323, '2010-03-01 15:10:29', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(324, '2010-03-01 15:10:48', 1, 11, '72', 'Rømer- eller berkemeyerglass 2', 2, 'Changed title, title_slug and caption.'),
(325, '2010-03-01 15:10:55', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(326, '2010-03-01 15:11:39', 1, 11, '72', 'Rømer- eller berkemeyerglass 2', 2, 'Changed caption.'),
(327, '2010-03-01 15:11:53', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(328, '2010-03-01 15:12:05', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(329, '2010-03-01 15:12:43', 1, 11, '72', 'Rømer- eller berkemeyerglass 2', 2, 'Changed caption.'),
(330, '2010-03-01 15:12:50', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(331, '2010-03-01 15:13:10', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(332, '2010-03-01 15:14:27', 1, 11, 'None', 'Grønt rømer- eller berkemeyerglass', 3, ''),
(333, '2010-03-01 15:14:35', 1, 11, 'None', 'Stett av Rømerglass', 3, ''),
(334, '2010-03-01 15:15:56', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(335, '2010-03-01 15:16:26', 1, 11, '67', 'Rømer- eller berkemeyerglass7', 2, 'Changed caption.'),
(336, '2010-03-01 15:16:34', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(337, '2010-03-01 15:16:39', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(338, '2010-03-01 15:16:47', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(339, '2010-03-01 15:19:15', 1, 11, '73', 'Rømer- eller berkemeyerglass8', 1, ''),
(340, '2010-03-01 15:19:24', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(341, '2010-03-01 15:19:33', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(342, '2010-03-01 15:20:33', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(343, '2010-03-01 15:20:40', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(344, '2010-03-01 15:21:58', 1, 11, '73', 'Rømer- eller berkemeyerglass8', 2, 'Changed image.'),
(345, '2010-03-01 15:22:12', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(346, '2010-03-01 15:23:00', 1, 11, '73', 'Rømer- eller berkemeyerglass8', 2, 'Changed image.'),
(347, '2010-03-01 15:23:10', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(348, '2010-03-01 15:23:14', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(349, '2010-03-01 15:23:24', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(350, '2010-03-01 15:25:16', 1, 14, '3', 'display', 2, 'Changed width.'),
(351, '2010-03-01 15:25:41', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(352, '2010-03-01 15:25:53', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(353, '2010-03-01 15:25:59', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(354, '2010-03-01 15:26:15', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(355, '2010-03-01 15:27:09', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(356, '2010-03-01 15:28:10', 1, 11, '73', 'Rømer- eller berkemeyerglass8', 2, 'No fields changed.'),
(357, '2010-03-01 15:28:22', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(358, '2010-03-01 15:28:29', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(359, '2010-03-01 15:29:08', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(360, '2010-03-01 15:29:26', 1, 11, '63', 'kjole', 2, 'Changed effect.'),
(361, '2010-03-01 15:37:13', 1, 11, '74', 'Rømer- eller berkemeyerglass3', 1, ''),
(362, '2010-03-01 15:37:20', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(363, '2010-03-01 15:37:32', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(364, '2010-03-01 15:38:11', 1, 11, 'None', 'Rømer- eller berkemeyerglass3', 3, ''),
(365, '2010-03-01 15:38:33', 1, 11, '75', 'Rømer- eller berkemeyerglass 3', 1, ''),
(366, '2010-03-01 15:38:42', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(367, '2010-03-01 15:38:49', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(368, '2010-03-01 15:39:36', 1, 11, '73', 'Rømer- eller berkemeyerglass8', 2, 'Changed caption.'),
(369, '2010-03-01 15:39:45', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(370, '2010-03-01 15:40:01', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(371, '2010-03-01 15:40:20', 1, 11, '73', 'Rømer- eller berkemeyerglass8', 2, 'Changed caption.'),
(372, '2010-03-01 15:40:38', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(373, '2010-03-01 15:40:52', 1, 11, '73', 'Rømer- eller berkemeyerglass8', 2, 'Changed caption.'),
(374, '2010-03-01 15:41:00', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(375, '2010-03-01 15:41:05', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(376, '2010-03-01 15:48:54', 1, 11, '73', 'Rømer- eller berkemeyerglass8', 2, 'Changed caption.'),
(377, '2010-03-01 15:49:01', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(378, '2010-03-01 15:49:06', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(379, '2010-03-01 15:49:28', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(380, '2010-03-01 15:49:33', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(381, '2010-03-01 15:50:54', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(382, '2010-03-01 15:52:09', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(383, '2010-03-01 15:52:25', 1, 11, '75', 'Rømer- eller berkemeyerglass 3', 2, 'Changed caption.'),
(384, '2010-03-01 15:52:32', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(385, '2010-03-01 15:52:36', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(386, '2010-03-01 15:52:50', 1, 11, '75', 'Rømer- eller berkemeyerglass 3', 2, 'Changed caption.'),
(387, '2010-03-01 15:52:58', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(388, '2010-03-01 15:53:02', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(389, '2010-03-01 15:53:25', 1, 11, '75', 'Rømer- eller berkemeyerglass 3', 2, 'Changed image.'),
(390, '2010-03-01 15:53:33', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(391, '2010-03-01 15:53:37', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(392, '2010-03-01 16:01:59', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(393, '2010-03-01 16:02:14', 1, 11, '75', 'Rømer- eller berkemeyerglass 3', 2, 'Changed caption.'),
(394, '2010-03-01 16:02:20', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(395, '2010-03-01 16:02:28', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(396, '2010-03-01 16:02:50', 1, 11, '75', 'Rømer- eller berkemeyerglass 3', 2, 'Changed caption.'),
(397, '2010-03-01 16:02:56', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(398, '2010-03-01 16:04:09', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed description.'),
(399, '2010-03-01 16:04:18', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed description.'),
(400, '2010-03-01 16:04:32', 1, 9, '11', 'Rømer- og berkemeyerglass', 2, 'Changed title and title_slug.'),
(401, '2010-03-01 16:04:44', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed title and title_slug.'),
(402, '2010-03-01 16:11:18', 1, 11, '75', 'Rømer- eller berkemeyerglass 3', 2, 'Changed caption.'),
(403, '2010-03-01 16:11:25', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(404, '2010-03-01 16:11:30', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(405, '2010-03-01 16:11:37', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(406, '2010-03-01 16:11:46', 1, 11, '75', 'Rømer- eller berkemeyerglass 3', 2, 'Changed caption.'),
(407, '2010-03-01 16:11:53', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(408, '2010-03-01 16:17:34', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(409, '2010-03-01 16:17:44', 1, 11, '75', 'Rømer- eller berkemeyerglass 3', 2, 'Changed caption.'),
(410, '2010-03-01 16:17:52', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(411, '2010-03-01 16:18:06', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(412, '2010-03-01 16:18:19', 1, 11, '75', 'Rømer- eller berkemeyerglass 3', 2, 'Changed caption.'),
(413, '2010-03-01 16:18:25', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(414, '2010-03-01 16:20:35', 1, 11, '75', 'Rømer- eller berkemeyerglass 3', 2, 'Changed caption.'),
(415, '2010-03-01 16:20:41', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(416, '2010-03-01 16:20:45', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(417, '2010-03-01 16:21:08', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(418, '2010-03-01 16:21:18', 1, 11, '75', 'Rømer- eller berkemeyerglass 3', 2, 'Changed caption.'),
(419, '2010-03-01 16:22:27', 1, 11, '75', 'Rømer- eller berkemeyerglass 3', 2, 'Changed caption.'),
(420, '2010-03-01 16:22:35', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(421, '2010-03-01 16:22:43', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(422, '2010-03-01 19:21:33', 1, 11, '46', 'Rømer- eller berkemeyerglass med glassyke', 2, 'Changed effect and caption.'),
(423, '2010-03-01 19:21:43', 1, 11, 'None', 'Rømer- eller berkemeyerglass', 3, ''),
(424, '2010-03-01 19:21:59', 1, 11, 'None', 'Rømer- eller berkemeyerglass7', 3, ''),
(425, '2010-03-01 19:23:33', 1, 11, '76', 'Rømer- eller berkemeyerglass2', 1, ''),
(426, '2010-03-01 19:24:48', 1, 11, '77', 'Rømerglass', 1, ''),
(427, '2010-03-01 19:25:16', 1, 11, '78', 'Rømerglass2', 1, ''),
(428, '2010-03-01 19:25:51', 1, 11, '79', 'Rømer- eller berkemeyerglass3', 1, ''),
(429, '2010-03-01 19:26:25', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(430, '2010-03-01 19:26:37', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(431, '2010-03-01 19:27:11', 1, 11, '79', 'Rømer- eller berkemeyerglass3', 2, 'Changed caption.'),
(432, '2010-03-01 19:27:16', 1, 11, '78', 'Rømerglass2', 2, 'Changed caption.'),
(433, '2010-03-01 19:27:22', 1, 11, '77', 'Rømerglass', 2, 'Changed caption.'),
(434, '2010-03-01 19:27:44', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(435, '2010-03-01 19:28:06', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(436, '2010-03-01 19:28:31', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(437, '2010-03-01 19:29:05', 1, 11, '76', 'Rømer- eller berkemeyerglass2', 2, 'Changed caption.'),
(438, '2010-03-01 19:29:19', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(439, '2010-03-01 19:29:32', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(440, '2010-03-01 19:30:05', 1, 11, '75', 'Rømer- eller berkemeyerglass 3', 2, 'Changed caption.'),
(441, '2010-03-01 19:30:13', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(442, '2010-03-01 19:31:03', 1, 11, '73', 'Rømer- eller berkemeyerglass8', 2, 'Changed caption.'),
(443, '2010-03-01 19:31:09', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(444, '2010-03-01 19:31:49', 1, 11, '73', 'Rømer- eller berkemeyerglass8', 2, 'Changed caption.'),
(445, '2010-03-01 19:31:57', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(446, '2010-03-01 19:32:06', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(447, '2010-03-01 19:32:22', 1, 11, '73', 'Rømer- eller berkemeyerglass8', 2, 'Changed caption.'),
(448, '2010-03-01 19:32:29', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(449, '2010-03-01 19:32:33', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(450, '2010-03-01 19:33:05', 1, 11, '73', 'Rømer- eller berkemeyerglass8', 2, 'Changed caption.'),
(451, '2010-03-01 19:33:12', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(452, '2010-03-01 19:33:17', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(453, '2010-03-01 19:33:39', 1, 11, '73', 'Rømer- eller berkemeyerglass8', 2, 'Changed caption.'),
(454, '2010-03-01 19:33:45', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(455, '2010-03-01 19:33:51', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(456, '2010-03-01 19:35:49', 1, 11, '80', 'Maigeleinglass', 1, ''),
(457, '2010-03-01 19:36:16', 1, 11, '81', 'Maigeleinglass2', 1, ''),
(458, '2010-03-01 19:36:38', 1, 11, '82', 'Maigeleinglass3', 1, ''),
(459, '2010-03-01 19:36:59', 1, 11, '83', 'Maigeleinglass4', 1, ''),
(460, '2010-03-01 19:37:10', 1, 9, '12', 'Maigeleinglass', 2, 'Changed photos.'),
(461, '2010-03-01 19:37:22', 1, 9, '12', 'Maigeleinglass', 2, 'Changed description.'),
(462, '2010-03-01 19:42:26', 1, 11, '83', 'Maigeleinglass4', 2, 'Changed caption.'),
(463, '2010-03-01 19:42:31', 1, 11, '82', 'Maigeleinglass3', 2, 'Changed caption.'),
(464, '2010-03-01 19:42:37', 1, 11, '81', 'Maigeleinglass2', 2, 'Changed caption.'),
(465, '2010-03-01 19:42:41', 1, 11, '80', 'Maigeleinglass', 2, 'Changed caption.'),
(466, '2010-03-01 19:42:54', 1, 9, '12', 'Maigeleinglass', 2, 'Changed photos.'),
(467, '2010-03-01 19:44:29', 1, 11, '80', 'Maigeleinglass', 2, 'Changed image.'),
(468, '2010-03-01 19:44:43', 1, 9, '12', 'Maigeleinglass', 2, 'No fields changed.'),
(469, '2010-03-01 19:47:19', 1, 11, '80', 'Maigeleinglass', 2, 'Changed image.'),
(470, '2010-03-01 19:47:27', 1, 9, '12', 'Maigeleinglass', 2, 'Changed photos.'),
(471, '2010-03-01 19:47:34', 1, 9, '12', 'Maigeleinglass', 2, 'Changed photos.'),
(472, '2010-03-01 19:48:41', 1, 11, '80', 'Maigeleinglass', 2, 'Changed image.'),
(473, '2010-03-01 19:48:48', 1, 9, '12', 'Maigeleinglass', 2, 'Changed photos.'),
(474, '2010-03-01 19:48:55', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'No fields changed.'),
(475, '2010-03-01 19:49:00', 1, 9, '12', 'Maigeleinglass', 2, 'Changed photos.'),
(476, '2010-03-01 19:53:22', 1, 11, '80', 'Maigeleinglass', 2, 'Changed image.'),
(477, '2010-03-01 19:53:30', 1, 9, '12', 'Maigeleinglass', 2, 'Changed photos.'),
(478, '2010-03-01 19:53:36', 1, 9, '12', 'Maigeleinglass', 2, 'Changed photos.'),
(479, '2010-03-01 19:57:37', 1, 11, '81', 'Maigeleinglass2', 2, 'Changed image.'),
(480, '2010-03-01 19:57:47', 1, 9, '12', 'Maigeleinglass', 2, 'Changed photos.'),
(481, '2010-03-01 20:05:42', 1, 9, '12', 'Maigeleinglass', 2, 'Changed photos.'),
(482, '2010-03-01 20:08:49', 1, 11, '82', 'Maigeleinglass3', 2, 'Changed image.'),
(483, '2010-03-01 20:08:55', 1, 9, '12', 'Maigeleinglass', 2, 'Changed photos.'),
(484, '2010-03-01 20:09:00', 1, 9, '12', 'Maigeleinglass', 2, 'Changed photos.'),
(485, '2010-03-01 20:10:41', 1, 11, '83', 'Maigeleinglass4', 2, 'Changed image.'),
(486, '2010-03-01 20:10:48', 1, 9, '12', 'Maigeleinglass', 2, 'Changed photos.'),
(487, '2010-03-01 20:10:53', 1, 9, '12', 'Maigeleinglass', 2, 'Changed photos.'),
(488, '2010-03-01 20:11:40', 1, 11, '80', 'Maigeleinglass', 2, 'Changed caption.'),
(489, '2010-03-01 20:12:01', 1, 11, '80', 'Maigeleinglass', 2, 'Changed caption.'),
(490, '2010-03-01 20:12:40', 1, 11, '81', 'Maigeleinglass2', 2, 'Changed caption.'),
(491, '2010-03-01 20:12:55', 1, 11, '81', 'Maigeleinglass2', 2, 'Changed caption.'),
(492, '2010-03-01 20:13:04', 1, 11, '81', 'Maigeleinglass2', 2, 'Changed caption.'),
(493, '2010-03-01 20:13:25', 1, 11, '81', 'Maigeleinglass2', 2, 'Changed caption.'),
(494, '2010-03-01 20:13:35', 1, 11, '81', 'Maigeleinglass2', 2, 'Changed caption.'),
(495, '2010-03-01 20:14:19', 1, 11, '80', 'Maigeleinglass', 2, 'Changed image.'),
(496, '2010-03-01 20:15:16', 1, 11, '81', 'Maigeleinglass2', 2, 'Changed image.'),
(497, '2010-03-01 20:15:27', 1, 11, '81', 'Maigeleinglass2', 2, 'Changed caption.'),
(498, '2010-03-01 20:18:17', 1, 11, '83', 'Maigeleinglass4', 2, 'Changed effect.'),
(499, '2010-03-01 20:18:26', 1, 11, '82', 'Maigeleinglass3', 2, 'Changed effect.'),
(500, '2010-03-01 20:18:29', 1, 11, '81', 'Maigeleinglass2', 2, 'Changed effect.'),
(501, '2010-03-01 20:18:34', 1, 11, '80', 'Maigeleinglass', 2, 'Changed effect.'),
(502, '2010-03-01 20:18:58', 1, 11, '83', 'Maigeleinglass4', 2, 'Changed effect.'),
(503, '2010-03-01 20:19:09', 1, 11, '82', 'Maigeleinglass3', 2, 'Changed effect.'),
(504, '2010-03-01 20:19:13', 1, 11, '81', 'Maigeleinglass2', 2, 'Changed effect.'),
(505, '2010-03-01 20:19:33', 1, 11, '81', 'Maigeleinglass2', 2, 'Changed effect.'),
(506, '2010-03-01 20:19:37', 1, 11, '80', 'Maigeleinglass', 2, 'Changed effect.'),
(507, '2010-03-01 20:20:15', 1, 14, '2', 'thumbnail', 2, 'Changed pre_cache.'),
(508, '2010-03-01 20:20:32', 1, 14, '3', 'display', 2, 'Changed pre_cache.'),
(509, '2010-03-01 20:20:55', 1, 11, '83', 'Maigeleinglass4', 2, 'Changed caption.'),
(510, '2010-03-01 20:21:13', 1, 11, '83', 'Maigeleinglass4', 2, 'Changed caption.'),
(511, '2010-03-01 20:21:38', 1, 11, '83', 'Maigeleinglass4', 2, 'Changed caption.'),
(512, '2010-03-01 20:22:08', 1, 11, '83', 'Maigeleinglass4', 2, 'Changed caption.'),
(513, '2010-03-01 20:22:28', 1, 11, '83', 'Maigeleinglass4', 2, 'Changed caption.'),
(514, '2010-03-01 20:22:36', 1, 11, '83', 'Maigeleinglass4', 2, 'Changed caption.'),
(515, '2010-03-01 20:22:45', 1, 11, '83', 'Maigeleinglass4', 2, 'Changed caption.'),
(516, '2010-03-01 20:22:56', 1, 11, '83', 'Maigeleinglass4', 2, 'Changed caption.'),
(517, '2010-03-01 20:23:08', 1, 11, '83', 'Maigeleinglass4', 2, 'Changed caption.'),
(518, '2010-03-01 20:23:22', 1, 11, '83', 'Maigeleinglass4', 2, 'Changed caption.'),
(519, '2010-03-01 20:23:30', 1, 11, '83', 'Maigeleinglass4', 2, 'Changed caption.'),
(520, '2010-03-01 20:23:38', 1, 11, '83', 'Maigeleinglass4', 2, 'Changed caption.'),
(521, '2010-03-01 20:23:49', 1, 11, '83', 'Maigeleinglass4', 2, 'Changed caption.'),
(522, '2010-03-01 20:23:57', 1, 11, '83', 'Maigeleinglass4', 2, 'Changed caption.'),
(523, '2010-03-01 20:24:02', 1, 11, '83', 'Maigeleinglass4', 2, 'Changed caption.'),
(524, '2010-03-01 20:24:30', 1, 11, '82', 'Maigeleinglass3', 2, 'No fields changed.'),
(525, '2010-03-01 20:24:42', 1, 11, '82', 'Maigeleinglass3', 2, 'Changed caption.'),
(526, '2010-03-01 20:24:50', 1, 11, '82', 'Maigeleinglass3', 2, 'Changed caption.'),
(527, '2010-03-01 20:25:00', 1, 11, '82', 'Maigeleinglass3', 2, 'Changed caption.'),
(528, '2010-03-01 20:25:06', 1, 11, '82', 'Maigeleinglass3', 2, 'Changed caption.'),
(529, '2010-03-01 20:25:18', 1, 11, '82', 'Maigeleinglass3', 2, 'Changed caption.'),
(530, '2010-03-01 20:25:35', 1, 11, '82', 'Maigeleinglass3', 2, 'Changed caption.'),
(531, '2010-03-01 20:25:57', 1, 11, '81', 'Maigeleinglass2', 2, 'Changed caption.'),
(532, '2010-03-01 20:26:06', 1, 11, '81', 'Maigeleinglass2', 2, 'Changed caption.'),
(533, '2010-03-01 20:26:17', 1, 11, '81', 'Maigeleinglass2', 2, 'Changed caption.'),
(534, '2010-03-01 20:26:23', 1, 11, '81', 'Maigeleinglass2', 2, 'Changed caption.'),
(535, '2010-03-01 20:26:54', 1, 11, '80', 'Maigeleinglass', 2, 'Changed caption.'),
(536, '2010-03-01 20:28:06', 1, 11, '73', 'Rømer- eller berkemeyerglass8', 2, 'Changed caption.'),
(537, '2010-03-01 20:28:25', 1, 11, '73', 'Rømer- eller berkemeyerglass8', 2, 'Changed caption.'),
(538, '2010-03-01 20:28:40', 1, 11, '73', 'Rømer- eller berkemeyerglass8', 2, 'Changed caption.'),
(539, '2010-03-01 20:28:49', 1, 11, '73', 'Rømer- eller berkemeyerglass8', 2, 'Changed caption.'),
(540, '2010-03-01 20:29:44', 1, 11, '72', 'Rømer- eller berkemeyerglass 2', 2, 'Changed caption.'),
(541, '2010-03-01 20:30:13', 1, 11, '72', 'Rømer- eller berkemeyerglass 2', 2, 'Changed caption.'),
(542, '2010-03-01 20:30:25', 1, 11, '72', 'Rømer- eller berkemeyerglass 2', 2, 'Changed caption.'),
(543, '2010-03-01 20:30:46', 1, 11, '72', 'Rømer- eller berkemeyerglass 2', 2, 'Changed caption.'),
(544, '2010-03-01 20:31:02', 1, 11, '72', 'Rømer- eller berkemeyerglass 2', 2, 'Changed caption.'),
(545, '2010-03-01 20:31:14', 1, 11, '72', 'Rømer- eller berkemeyerglass 2', 2, 'Changed caption.'),
(546, '2010-03-01 20:31:39', 1, 11, '72', 'Rømer- eller berkemeyerglass 2', 2, 'Changed caption.'),
(547, '2010-03-01 20:31:51', 1, 11, '72', 'Rømer- eller berkemeyerglass 2', 2, 'Changed caption.'),
(548, '2010-03-01 20:32:03', 1, 11, '72', 'Rømer- eller berkemeyerglass 2', 2, 'Changed caption.'),
(549, '2010-03-01 20:32:14', 1, 11, '72', 'Rømer- eller berkemeyerglass 2', 2, 'Changed caption.'),
(550, '2010-03-01 20:32:27', 1, 11, '72', 'Rømer- eller berkemeyerglass 2', 2, 'Changed caption.'),
(551, '2010-03-01 20:32:40', 1, 11, '72', 'Rømer- eller berkemeyerglass 2', 2, 'Changed caption.'),
(552, '2010-03-01 20:33:08', 1, 11, '72', 'Rømer- eller berkemeyerglass 2', 2, 'Changed caption.'),
(553, '2010-03-01 20:33:50', 1, 11, '72', 'Rømer- eller berkemeyerglass 2', 2, 'Changed caption.'),
(554, '2010-03-01 20:35:16', 1, 11, '75', 'Rømer- eller berkemeyerglass 3', 2, 'Changed caption.'),
(555, '2010-03-01 20:36:47', 1, 11, '76', 'Rømer- eller berkemeyerglass2', 2, 'Changed caption.'),
(556, '2010-03-01 20:37:38', 1, 11, '77', 'Rømerglass', 2, 'Changed caption.'),
(557, '2010-03-01 20:38:37', 1, 11, '78', 'Rømerglass2', 2, 'Changed caption.'),
(558, '2010-03-01 20:39:55', 1, 11, '79', 'Rømer- eller berkemeyerglass3', 2, 'Changed caption.'),
(559, '2010-06-21 17:58:54', 1, 11, '84', 'Stangenglass', 1, ''),
(560, '2010-06-21 18:03:05', 1, 11, '85', 'Stangenglass2', 1, ''),
(561, '2010-06-21 18:06:18', 1, 11, '86', 'Passglass', 1, ''),
(562, '2010-06-21 18:34:18', 1, 9, '13', 'Stangenglass', 2, 'Changed photos.'),
(563, '2010-06-21 18:35:20', 1, 11, '86', 'Passglass', 2, 'Changed caption.'),
(564, '2010-06-21 18:35:45', 1, 11, '84', 'Stangenglass', 2, 'No fields changed.'),
(565, '2010-06-21 18:35:54', 1, 11, '86', 'Passglass', 2, 'Changed caption.'),
(566, '2010-06-21 18:36:26', 1, 11, '86', 'Passglass', 2, 'Changed caption.'),
(567, '2010-06-21 18:36:30', 1, 11, '85', 'Stangenglass2', 2, 'Changed caption.'),
(568, '2010-06-21 18:36:40', 1, 11, '84', 'Stangenglass', 2, 'Changed caption.'),
(569, '2010-06-21 18:37:37', 1, 9, '13', 'Stangenglass', 2, 'Changed photos.'),
(570, '2010-06-21 18:37:43', 1, 9, '13', 'Stangenglass', 2, 'Changed photos.'),
(571, '2010-06-21 18:38:02', 1, 9, '13', 'Stangenglass', 2, 'Changed photos.'),
(572, '2010-06-21 18:38:16', 1, 9, '13', 'Stangenglass', 2, 'Changed photos.'),
(573, '2010-06-21 18:38:33', 1, 11, '86', 'Passglass', 2, 'Changed caption.'),
(574, '2010-06-21 18:39:04', 1, 11, '86', 'Passglass', 2, 'Changed caption.'),
(575, '2010-06-21 18:39:23', 1, 11, '86', 'Passglass', 2, 'Changed caption.'),
(576, '2010-06-21 18:39:55', 1, 11, '86', 'Passglass', 2, 'Changed caption.'),
(577, '2010-06-21 18:40:12', 1, 11, '86', 'Passglass', 2, 'Changed caption.'),
(578, '2010-06-21 18:40:34', 1, 11, '86', 'Passglass', 2, 'Changed caption.'),
(579, '2010-06-21 18:40:47', 1, 11, '86', 'Passglass', 2, 'Changed caption.'),
(580, '2010-06-21 18:43:49', 1, 11, '86', 'Passglass', 2, 'Changed image.'),
(581, '2010-06-21 18:45:28', 1, 11, '86', 'Passglass', 2, 'Changed image.'),
(582, '2010-06-21 18:45:57', 1, 11, '86', 'Passglass', 2, 'Changed image.'),
(583, '2010-06-21 18:46:36', 1, 11, '86', 'Passglass', 2, 'Changed caption.'),
(584, '2010-06-21 18:47:03', 1, 11, '86', 'Passglass', 2, 'Changed caption.'),
(585, '2010-06-21 19:04:10', 1, 11, '86', 'Passglass', 2, 'Changed caption.'),
(586, '2010-06-21 19:18:21', 1, 11, '87', 'Skår av passglass', 1, ''),
(587, '2010-06-21 19:18:36', 1, 9, '13', 'Stangenglass', 2, 'Changed photos.'),
(588, '2010-06-21 19:19:21', 1, 11, '87', 'Skår av passglass', 2, 'Changed caption.'),
(589, '2010-06-21 19:20:42', 1, 11, '87', 'Skår av passglass', 2, 'Changed caption.'),
(590, '2010-06-21 19:21:17', 1, 11, '88', 'Skår fra passglass2', 1, ''),
(591, '2010-06-21 19:21:32', 1, 9, '13', 'Stangenglass', 2, 'Changed photos.'),
(592, '2010-06-21 19:22:25', 1, 11, '88', 'Skår fra passglass2', 2, 'Changed caption.'),
(593, '2010-06-21 19:22:30', 1, 11, '88', 'Skår fra passglass2', 2, 'Changed caption.'),
(594, '2010-06-21 19:22:58', 1, 11, '87', 'Skår av passglass', 2, 'Changed caption.'),
(595, '2010-06-21 19:23:19', 1, 11, '88', 'Skår fra passglass2', 2, 'Changed caption.'),
(596, '2010-06-21 19:23:49', 1, 9, '13', 'Stangenglass', 2, 'Changed photos.'),
(597, '2010-06-21 19:23:59', 1, 9, '13', 'Stangenglass', 2, 'Changed photos.'),
(598, '2010-06-21 19:24:31', 1, 9, '13', 'Stangenglass', 2, 'Changed photos.'),
(599, '2010-06-21 19:24:49', 1, 9, '13', 'Stangenglass', 2, 'No fields changed.'),
(600, '2010-06-21 19:24:56', 1, 9, '13', 'Stangenglass', 2, 'Changed photos.'),
(601, '2010-06-21 19:25:08', 1, 9, '13', 'Stangenglass', 2, 'Changed photos.'),
(602, '2010-06-21 19:25:17', 1, 9, '13', 'Stangenglass', 2, 'Changed photos.'),
(603, '2010-06-21 19:25:44', 1, 11, '87', 'Skår fra passglass', 2, 'Changed title and title_slug.'),
(604, '2010-06-21 19:25:51', 1, 9, '13', 'Stangenglass', 2, 'Changed photos.'),
(605, '2010-06-21 19:25:58', 1, 9, '13', 'Stangenglass', 2, 'Changed photos.'),
(606, '2010-06-21 19:26:10', 1, 9, '13', 'Stangenglass', 2, 'Changed photos.'),
(607, '2010-06-21 19:26:44', 1, 9, '13', 'Stangenglass', 2, 'Changed photos.'),
(608, '2010-06-21 19:27:04', 1, 9, '13', 'Stangenglass', 2, 'Changed photos.'),
(609, '2010-06-21 19:27:22', 1, 9, '13', 'Stangenglass', 2, 'Changed photos.'),
(610, '2010-06-21 19:27:30', 1, 9, '13', 'Stangenglass', 2, 'Changed photos.'),
(611, '2010-06-21 19:27:50', 1, 9, '13', 'Stangenglass', 2, 'Changed photos.'),
(612, '2010-06-21 19:28:04', 1, 9, '13', 'Stangenglass', 2, 'Changed photos.'),
(613, '2010-06-21 19:28:14', 1, 9, '13', 'Stangenglass', 2, 'Changed photos.'),
(614, '2010-06-21 19:35:25', 1, 11, '89', 'Rekonstruksjon av passglass', 1, ''),
(615, '2010-06-21 19:35:33', 1, 9, '13', 'Stangenglass', 2, 'Changed photos.'),
(616, '2010-06-21 19:36:04', 1, 9, '13', 'Stangenglass', 2, 'Changed photos.'),
(617, '2010-06-21 19:36:13', 1, 9, '13', 'Stangenglass', 2, 'Changed photos.'),
(618, '2010-06-21 19:36:24', 1, 9, '13', 'Stangenglass', 2, 'Changed photos.'),
(619, '2010-06-21 19:36:41', 1, 9, '13', 'Stangenglass', 2, 'Changed photos.'),
(620, '2010-06-21 19:38:09', 1, 9, '13', 'Stangenglass', 2, 'Changed photos.'),
(621, '2010-06-21 19:38:18', 1, 9, '13', 'Stangenglass', 2, 'Changed photos.'),
(622, '2010-06-21 19:38:28', 1, 9, '13', 'Stangenglass', 2, 'Changed photos.');
INSERT INTO `django_admin_log` (`id`, `action_time`, `user_id`, `content_type_id`, `object_id`, `object_repr`, `action_flag`, `change_message`) VALUES
(623, '2010-06-21 19:38:43', 1, 11, '85', 'Stangenglass2', 2, 'Changed caption.'),
(624, '2010-06-21 19:38:51', 1, 9, '13', 'Stangenglass', 2, 'Changed photos.'),
(625, '2010-06-21 19:39:12', 1, 11, '85', 'Stangenglass2', 2, 'Changed caption.'),
(626, '2010-06-21 19:39:36', 1, 11, '85', 'Stangenglass2', 2, 'Changed caption.'),
(627, '2010-06-21 19:40:00', 1, 11, '85', 'Stangenglass2', 2, 'Changed caption.'),
(628, '2010-06-21 19:40:17', 1, 11, '85', 'Stangenglass2', 2, 'Changed caption.'),
(629, '2010-06-21 19:40:32', 1, 11, '85', 'Stangenglass2', 2, 'Changed caption.'),
(630, '2010-06-21 19:40:40', 1, 11, '85', 'Stangenglass2', 2, 'Changed caption.'),
(631, '2010-06-21 19:40:57', 1, 11, '85', 'Stangenglass2', 2, 'Changed caption.'),
(632, '2010-06-21 19:41:17', 1, 11, '85', 'Stangenglass2', 2, 'Changed caption.'),
(633, '2010-06-21 19:41:38', 1, 11, '84', 'Stangenglass', 2, 'Changed caption.'),
(634, '2010-06-21 19:42:04', 1, 11, '84', 'Stangenglass', 2, 'Changed caption.'),
(635, '2010-06-21 19:42:27', 1, 11, '84', 'Stangenglass', 2, 'Changed caption.'),
(636, '2010-06-21 19:42:42', 1, 11, '84', 'Stangenglass', 2, 'Changed caption.'),
(637, '2010-06-21 19:43:08', 1, 11, '84', 'Stangenglass', 2, 'Changed caption.'),
(638, '2010-06-21 19:50:00', 1, 11, '90', 'Rekonstruksjon av rømer- eller berkemeyerglass', 1, ''),
(639, '2010-06-21 19:50:12', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(640, '2010-06-21 19:50:32', 1, 11, '90', 'Rekonstruksjon av rømer- eller berkemeyerglass', 2, 'Changed caption.'),
(641, '2010-06-21 19:50:49', 1, 11, '90', 'Rekonstruksjon av rømer- eller berkemeyerglass', 2, 'Changed caption.'),
(642, '2010-06-21 19:52:25', 1, 11, '90', 'Rømer- eller berkemeyerglass4', 2, 'Changed title and title_slug.'),
(643, '2010-06-21 19:55:40', 1, 11, '91', 'Rømer- eller berkemeyerglass5', 1, ''),
(644, '2010-06-21 19:55:52', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.'),
(645, '2010-06-21 19:59:19', 1, 9, '14', 'Isglass', 1, ''),
(646, '2010-06-21 20:00:23', 1, 9, '15', 'Stettglass med vinge- eller slangedekor', 1, ''),
(647, '2010-06-21 20:00:39', 1, 9, '16', 'Filigranglass', 1, ''),
(648, '2010-06-21 20:39:01', 1, 11, '92', 'Bunn av isglass', 1, ''),
(649, '2010-06-21 20:39:49', 1, 11, '93', 'Skår av isglass', 1, ''),
(650, '2010-06-21 20:40:44', 1, 11, '94', 'Rekonstruksjon av isglass', 1, ''),
(651, '2010-06-21 20:45:59', 1, 11, '95', 'Slangestett', 1, ''),
(652, '2010-06-21 20:46:17', 1, 11, '95', 'Slangestett', 2, 'No fields changed.'),
(653, '2010-06-21 20:46:22', 1, 11, '95', 'Slangestett', 2, 'Changed caption.'),
(654, '2010-06-21 20:46:34', 1, 11, '95', 'Slangestett', 2, 'Changed caption.'),
(655, '2010-06-21 20:46:48', 1, 11, '95', 'Slangestett', 2, 'Changed caption.'),
(656, '2010-06-21 20:46:59', 1, 11, '95', 'Slangestett', 2, 'Changed caption.'),
(657, '2010-06-21 20:47:08', 1, 9, '13', 'Stangenglass', 2, 'Changed photos.'),
(658, '2010-06-21 20:47:23', 1, 9, '13', 'Stangenglass', 2, 'Changed photos.'),
(659, '2010-06-21 20:48:17', 1, 11, '96', 'Skår fra et slangestett', 1, ''),
(660, '2010-06-21 20:48:31', 1, 11, '96', 'Skår fra et slangestett', 2, 'Changed caption.'),
(661, '2010-06-21 20:48:43', 1, 11, '96', 'Skår fra et slangestett', 2, 'Changed caption.'),
(662, '2010-06-21 20:48:51', 1, 9, '13', 'Stangenglass', 2, 'Changed photos.'),
(663, '2010-06-21 20:49:02', 1, 9, '13', 'Stangenglass', 2, 'Changed photos.'),
(664, '2010-06-21 20:49:41', 1, 11, '97', 'Rekonstruksjon av slangestett', 1, ''),
(665, '2010-06-21 20:49:48', 1, 9, '13', 'Stangenglass', 2, 'Changed photos.'),
(666, '2010-06-21 20:50:13', 1, 9, '13', 'Stangenglass', 2, 'Changed photos.'),
(667, '2010-06-21 20:54:09', 1, 11, '98', 'Skår fra filigranglass', 1, ''),
(668, '2010-06-21 20:54:22', 1, 11, '98', 'Skår fra filigranglass', 2, 'Changed caption.'),
(669, '2010-06-21 20:54:38', 1, 11, '98', 'Skår fra filigranglass', 2, 'Changed caption.'),
(670, '2010-06-21 20:54:45', 1, 9, '13', 'Stangenglass', 2, 'Changed photos.'),
(671, '2010-06-21 20:55:02', 1, 11, '98', 'Skår fra filigranglass', 2, 'Changed caption.'),
(672, '2010-06-21 20:55:13', 1, 11, '98', 'Skår fra filigranglass', 2, 'Changed caption.'),
(673, '2010-06-21 20:55:21', 1, 11, '98', 'Skår fra filigranglass', 2, 'Changed caption.'),
(674, '2010-06-21 20:55:31', 1, 11, '98', 'Skår fra filigranglass', 2, 'Changed caption.'),
(675, '2010-06-21 20:55:42', 1, 11, '98', 'Skår fra filigranglass', 2, 'Changed caption.'),
(676, '2010-06-21 20:55:51', 1, 11, '98', 'Skår fra filigranglass', 2, 'Changed caption.'),
(677, '2010-06-21 20:56:01', 1, 11, '98', 'Skår fra filigranglass', 2, 'Changed caption.'),
(678, '2010-06-21 20:56:13', 1, 11, '98', 'Skår fra filigranglass', 2, 'Changed caption.'),
(679, '2010-06-21 20:56:19', 1, 11, '98', 'Skår fra filigranglass', 2, 'Changed caption.'),
(680, '2010-06-21 20:56:29', 1, 11, '98', 'Skår fra filigranglass', 2, 'Changed caption.'),
(681, '2010-06-21 20:56:35', 1, 11, '98', 'Skår fra filigranglass', 2, 'Changed caption.'),
(682, '2010-06-21 20:56:50', 1, 9, '13', 'Stangenglass', 2, 'Changed photos.'),
(683, '2010-06-21 20:57:45', 1, 11, '99', 'Rekonstruksjon av et filigranglass', 1, ''),
(684, '2010-06-21 20:57:54', 1, 9, '13', 'Stangenglass', 2, 'Changed photos.'),
(685, '2010-06-21 20:58:03', 1, 9, '13', 'Stangenglass', 2, 'Changed photos.'),
(686, '2010-06-25 20:48:03', 1, 11, '91', 'Rømer- eller berkemeyerglass5', 2, 'No fields changed.'),
(687, '2010-06-28 12:11:05', 1, 11, '95', 'Slangestett', 2, 'Changed caption.'),
(688, '2010-06-28 12:35:58', 1, 11, '100', 'Nuppenbecher', 1, ''),
(689, '2010-06-28 12:36:11', 1, 11, '100', 'Nuppenbecher', 2, 'Changed caption.'),
(690, '2010-06-28 12:36:18', 1, 11, '100', 'Nuppenbecher', 2, 'Changed caption.'),
(691, '2010-06-28 12:36:22', 1, 11, '100', 'Nuppenbecher', 2, 'Changed caption.'),
(692, '2010-06-28 12:37:17', 1, 11, '101', 'Rekonstruksjon av nuppenbecherglass', 1, ''),
(693, '2010-06-28 12:57:31', 1, 9, '14', 'Isglass', 2, 'Changed photos.'),
(694, '2010-06-28 12:57:51', 1, 11, '92', 'Bunn av isglass', 2, 'Changed caption.'),
(695, '2010-06-28 12:58:03', 1, 11, '92', 'Bunn av isglass', 2, 'Changed caption.'),
(696, '2010-06-28 12:58:23', 1, 11, '92', 'Bunn av isglass', 2, 'Changed caption.'),
(697, '2010-06-28 12:58:37', 1, 11, '92', 'Bunn av isglass', 2, 'Changed caption.'),
(698, '2010-06-28 12:59:02', 1, 11, '92', 'Bunn av isglass', 2, 'Changed caption.'),
(699, '2010-06-28 12:59:18', 1, 11, '93', 'Skår av isglass', 2, 'Changed caption.'),
(700, '2010-06-28 12:59:25', 1, 11, '93', 'Skår av isglass', 2, 'Changed caption.'),
(701, '2010-06-28 12:59:41', 1, 9, '14', 'Isglass', 2, 'Changed photos.'),
(702, '2010-06-28 13:16:38', 1, 9, '15', 'Stettglass', 2, 'Changed title and title_slug.'),
(703, '2010-06-28 13:17:07', 1, 9, '15', 'Stettglass med vinge- eller slangedekor', 2, 'Changed title.'),
(704, '2010-06-28 13:17:20', 1, 9, '15', 'Stettglass ', 2, 'Changed title.'),
(705, '2010-06-28 13:17:33', 1, 9, '15', 'Stettglass ', 2, 'Changed photos.'),
(706, '2010-06-28 13:17:50', 1, 9, '15', 'Stettglass ', 2, 'Changed photos.'),
(707, '2010-06-28 13:17:59', 1, 9, '15', 'Stettglass ', 2, 'Changed photos.'),
(708, '2010-06-28 13:18:23', 1, 9, '15', 'Stettglass ', 2, 'Changed photos.'),
(709, '2010-06-28 13:19:20', 1, 9, '16', 'Filigranglass', 2, 'Changed photos.'),
(710, '2010-06-28 13:22:20', 1, 11, '102', 'Nærbilde av fot', 1, ''),
(711, '2010-06-28 13:22:29', 1, 9, '15', 'Stettglass ', 2, 'Changed photos.'),
(712, '2010-06-28 13:23:42', 1, 9, '15', 'Stettglass ', 2, 'Changed photos.'),
(713, '2010-06-28 13:23:50', 1, 9, '15', 'Stettglass ', 2, 'Changed photos.'),
(714, '2010-06-28 13:24:04', 1, 9, '15', 'Stettglass ', 2, 'Changed photos.'),
(715, '2010-06-28 13:24:19', 1, 11, '102', 'Nærbilde av fot', 2, 'Changed image.'),
(716, '2010-06-28 13:24:24', 1, 11, '102', 'Nærbilde av fot', 2, 'No fields changed.'),
(717, '2010-06-28 13:24:32', 1, 9, '15', 'Stettglass ', 2, 'Changed photos.'),
(718, '2010-06-28 13:24:44', 1, 9, '15', 'Stettglass ', 2, 'Changed photos.'),
(719, '2010-06-28 13:25:02', 1, 9, '15', 'Stettglass ', 2, 'Changed photos.'),
(720, '2010-06-28 13:50:32', 1, 9, '17', 'Nuppenbecher', 1, ''),
(721, '2010-06-28 13:51:01', 1, 9, '17', 'Nuppenbecher', 2, 'Changed photos.'),
(722, '2010-06-28 13:52:36', 1, 9, '17', 'Nuppenbecher', 2, 'Changed photos.'),
(723, '2010-06-28 13:52:46', 1, 9, '17', 'Nuppenbecher', 2, 'Changed photos.'),
(724, '2010-06-28 13:52:58', 1, 11, '100', 'Nuppenbecher', 2, 'Changed image.'),
(725, '2010-06-28 13:53:10', 1, 9, '17', 'Nuppenbecher', 2, 'Changed photos.'),
(726, '2010-06-28 13:54:21', 1, 11, '100', 'Nuppenbecher', 2, 'Changed image.'),
(727, '2010-06-28 14:07:23', 1, 11, '90', 'Rømer- eller berkemeyerglass4', 2, 'Changed caption.'),
(728, '2010-06-28 14:08:47', 1, 11, '99', 'Rekonstruksjon av et filigranglass', 2, 'Changed caption.'),
(729, '2010-06-28 14:09:00', 1, 11, '99', 'Rekonstruksjon av et filigranglass', 2, 'Changed caption.'),
(730, '2010-07-01 10:33:36', 1, 11, '86', 'Passglass', 2, 'Changed caption.'),
(731, '2010-07-01 10:34:06', 1, 11, '86', 'Passglass', 2, 'Changed caption.'),
(732, '2010-07-01 10:34:19', 1, 11, '86', 'Passglass', 2, 'Changed caption.'),
(733, '2010-07-01 10:35:07', 1, 11, '86', 'Passglass', 2, 'Changed caption.'),
(734, '2010-07-01 10:43:34', 1, 11, '103', 'Rømerglass-ellerberkemeyer9', 1, ''),
(735, '2010-07-01 10:44:20', 1, 11, '103', 'Rømerglass-ellerberkemeyer9', 2, 'Changed caption.'),
(736, '2010-07-01 10:44:29', 1, 9, '11', 'Rømer og berkemeyerglass', 2, 'Changed photos.');

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `name`, `app_label`, `model`) VALUES
(1, 'permission', 'auth', 'permission'),
(2, 'group', 'auth', 'group'),
(3, 'user', 'auth', 'user'),
(4, 'message', 'auth', 'message'),
(5, 'content type', 'contenttypes', 'contenttype'),
(6, 'session', 'sessions', 'session'),
(7, 'site', 'sites', 'site'),
(8, 'glass', 'glass', 'glass'),
(9, 'gallery', 'photologue', 'gallery'),
(10, 'gallery upload', 'photologue', 'galleryupload'),
(11, 'photo', 'photologue', 'photo'),
(12, 'photo effect', 'photologue', 'photoeffect'),
(13, 'watermark', 'photologue', 'watermark'),
(14, 'photo size', 'photologue', 'photosize'),
(15, 'log entry', 'admin', 'logentry'),
(16, 'tag', 'tagging', 'tag'),
(17, 'tagged item', 'tagging', 'taggeditem'),
(18, 'blog post', 'theblog', 'blogpost');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY  (`session_key`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('1bb8931e93104b269e1667a87189705b', 'gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5mZDNjYzkxNzQ1YWM1YWE3Nzhi\nNmYwN2FkYzhjNTFhNg==\n', '2010-03-14 17:38:21'),
('414ff5fb411e7a1a1764485d63dcd5b2', 'gAJ9cQEuNjgyMTVkZTY1YTJhNmE3NDBkMzM0MzE2MzE2OTExZWE=\n', '2010-03-10 17:34:23'),
('d68de1343fad983d6985a5697d630390', 'gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5mZDNjYzkxNzQ1YWM1YWE3Nzhi\nNmYwN2FkYzhjNTFhNg==\n', '2010-03-14 16:29:44'),
('ef61342bdba63e9f82b81e0f386ed7b9', 'gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5mZDNjYzkxNzQ1YWM1YWE3Nzhi\nNmYwN2FkYzhjNTFhNg==\n', '2009-08-12 14:42:19'),
('70fb8dc596add34f2992d04ca1b4a1a8', 'gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5mZDNjYzkxNzQ1YWM1YWE3Nzhi\nNmYwN2FkYzhjNTFhNg==\n', '2009-08-10 17:59:37'),
('f924d88a4e00b856709d6587763ca39c', 'gAJ9cQEuNjgyMTVkZTY1YTJhNmE3NDBkMzM0MzE2MzE2OTExZWE=\n', '2010-07-05 21:03:15'),
('a0daf53fdd4151e322b4aa47dff2933c', 'gAJ9cQEuNjgyMTVkZTY1YTJhNmE3NDBkMzM0MzE2MzE2OTExZWE=\n', '2010-03-15 21:02:47'),
('1aa1b8c912163e9a7e535e815065e120', 'gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5mZDNjYzkxNzQ1YWM1YWE3Nzhi\nNmYwN2FkYzhjNTFhNg==\n', '2010-07-12 12:06:52'),
('af69c7be258291475d936bed20ee3977', 'gAJ9cQEuNjgyMTVkZTY1YTJhNmE3NDBkMzM0MzE2MzE2OTExZWE=\n', '2010-07-09 21:09:35'),
('ab43b199455ecc68c1fe0e2fed1e2c80', 'gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5mZDNjYzkxNzQ1YWM1YWE3Nzhi\nNmYwN2FkYzhjNTFhNg==\n', '2010-07-15 10:29:07'),
('311d28dcabfe2ebf2923e4d7d24d5567', 'gAJ9cQEuNjgyMTVkZTY1YTJhNmE3NDBkMzM0MzE2MzE2OTExZWE=\n', '2010-07-12 15:01:52'),
('c7158ec3049fe0526ff1b33b4cbeea83', 'gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5mZDNjYzkxNzQ1YWM1YWE3Nzhi\nNmYwN2FkYzhjNTFhNg==\n', '2010-10-03 22:28:25');

-- --------------------------------------------------------

--
-- Table structure for table `django_site`
--

CREATE TABLE IF NOT EXISTS `django_site` (
  `id` int(11) NOT NULL auto_increment,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `django_site`
--


-- --------------------------------------------------------

--
-- Table structure for table `photologue_gallery`
--

CREATE TABLE IF NOT EXISTS `photologue_gallery` (
  `id` int(11) NOT NULL auto_increment,
  `date_added` datetime NOT NULL,
  `title` varchar(100) NOT NULL,
  `title_slug` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `tags` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `title` (`title`),
  UNIQUE KEY `title_slug` (`title_slug`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `photologue_gallery`
--

INSERT INTO `photologue_gallery` (`id`, `date_added`, `title`, `title_slug`, `description`, `is_public`, `tags`) VALUES
(5, '2009-07-22 00:26:26', 'Test', 'test', '', 1, ''),
(12, '2010-02-28 19:15:01', 'Maigeleinglass', 'maigeleinglass', '', 1, ''),
(14, '2010-06-21 19:59:10', 'Isglass', 'isglass', '', 1, ''),
(15, '2010-06-21 19:59:28', 'Stettglass ', 'stettglass', '', 1, ''),
(17, '2010-06-28 13:50:20', 'Nuppenbecher', 'nuppenbecher', '', 1, ''),
(16, '2010-06-21 20:00:26', 'Filigranglass', 'filigranglass', '', 1, ''),
(13, '2010-02-28 19:36:11', 'Stangenglass', 'stangenglass', 'Stangenglass er en fellesbetegnelse for en gruppe av høye begerglass. Glassene har en høy fot  som avsluttes inni klokken. Klokken begynner slik halvveis oppe på foten. \r\nGlassene er vanligvis 20-30 cm høye, men kan i enkelte tilfeller være over 40 cm høye. \r\nStangenglass ble produsert fra midten av 1400-tallet. De eldste var grønnlige, men utover 1500- og 1600-tallet ble de også laget i klart glass. \r\nEn del stangenglass er optisk dekorerte i tillegg til å ha pålagt dekor i form av vannrette glassbånd, pålagte knopper eller dyrehoder i glass. De yngre glassene kan være dekorert med emaljefarge.\r\n', 1, ''),
(11, '2010-02-28 18:16:57', 'Rømer og berkemeyerglass', 'romerogberkemeyerglass', '', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `photologue_galleryupload`
--

CREATE TABLE IF NOT EXISTS `photologue_galleryupload` (
  `id` int(11) NOT NULL auto_increment,
  `zip_file` varchar(100) NOT NULL,
  `gallery_id` int(11) default NULL,
  `title` varchar(75) NOT NULL,
  `caption` longtext NOT NULL,
  `description` longtext NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `tags` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `photologue_galleryupload_gallery_id` (`gallery_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `photologue_galleryupload`
--

INSERT INTO `photologue_galleryupload` (`id`, `zip_file`, `gallery_id`, `title`, `caption`, `description`, `is_public`, `tags`) VALUES
(2, 'photologue/temp/B_6583_1...psd', 5, 'Rømer/Berkmeyerglass', 'Datering: 1550-1650', 'Rømer- eller berkemeyerglass med bånd på foten i klart litt grønnlig glass. Funnet ved utgravningen på Bryggen ved Koren-Wiberg i 1908. ', 1, ''),
(3, 'photologue/temp/bilder.zip', NULL, 'test', 'hei du dette er en test', 'hallo', 1, ''),
(4, 'photologue/temp/bilder_.zip', NULL, 'Hallo', 'dsfgasdf', 'sdfasdf', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `photologue_gallery_photos`
--

CREATE TABLE IF NOT EXISTS `photologue_gallery_photos` (
  `id` int(11) NOT NULL auto_increment,
  `gallery_id` int(11) NOT NULL,
  `photo_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `gallery_id` (`gallery_id`,`photo_id`),
  KEY `photo_id_refs_id_41c9ecc` (`photo_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=989 ;

--
-- Dumping data for table `photologue_gallery_photos`
--

INSERT INTO `photologue_gallery_photos` (`id`, `gallery_id`, `photo_id`) VALUES
(934, 14, 92),
(932, 13, 89),
(931, 13, 88),
(765, 12, 82),
(766, 12, 83),
(763, 12, 80),
(362, 5, 63),
(987, 11, 90),
(764, 12, 81),
(986, 11, 79),
(985, 11, 78),
(359, 5, 49),
(984, 11, 77),
(983, 11, 76),
(982, 11, 75),
(981, 11, 73),
(930, 13, 87),
(357, 5, 47),
(356, 5, 46),
(929, 13, 86),
(928, 13, 85),
(980, 11, 72),
(979, 11, 103),
(927, 13, 84),
(935, 14, 93),
(936, 14, 94),
(968, 15, 97),
(969, 15, 102),
(967, 15, 96),
(944, 16, 98),
(945, 16, 99),
(970, 15, 95),
(977, 17, 100),
(978, 17, 101),
(988, 11, 91);

-- --------------------------------------------------------

--
-- Table structure for table `photologue_photo`
--

CREATE TABLE IF NOT EXISTS `photologue_photo` (
  `id` int(11) NOT NULL auto_increment,
  `image` varchar(100) NOT NULL,
  `date_taken` datetime default NULL,
  `view_count` int(10) unsigned NOT NULL,
  `crop_from` varchar(10) NOT NULL,
  `effect_id` int(11) default NULL,
  `title` varchar(100) NOT NULL,
  `title_slug` varchar(50) NOT NULL,
  `caption` longtext NOT NULL,
  `date_added` datetime NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `tags` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `title` (`title`),
  UNIQUE KEY `title_slug` (`title_slug`),
  KEY `photologue_photo_effect_id` (`effect_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=104 ;

--
-- Dumping data for table `photologue_photo`
--

INSERT INTO `photologue_photo` (`id`, `image`, `date_taken`, `view_count`, `crop_from`, `effect_id`, `title`, `title_slug`, `caption`, `date_added`, `is_public`, `tags`) VALUES
(79, 'photologue/photos/14romerB_6388.jpg', '2010-03-01 19:25:51', 967, 'center', NULL, 'Rømer- eller berkemeyerglass3', 'romer-eller-berkemeyerglass3', 'Rømer- eller berkemeyerglass (B 6388). Fragmentet er ca. 7,5 cm høyt. Glassets fot er bygget opp av glasstråder og det er bringebærknopper på stetten. Klokken er kuleformet. Glasset er funnet i Vinkjelleren på Bryggen. Typen ble laget fra 1600-tallet eller i begynnelsen av 1700-tallet.', '2010-03-01 19:25:51', 1, ''),
(76, 'photologue/photos/11romerB_6388.jpg', '2010-03-01 19:23:33', 928, 'center', NULL, 'Rømer- eller berkemeyerglass2', 'romer-eller-berkemeyerglass2', 'Rømer- eller berkemeyerglass (B 6588). Fragmentet er ca. 8,0 cm høyt. Glassets fot er bygget opp av glasstråder og det er bringebærknopper på klokken. Det er funnet i Vinkjelleren på Bryggen. Typen ble laget på 1600-tallet.', '2010-03-01 19:23:33', 1, ''),
(77, 'photologue/photos/12romerB_6583.jpg', '2010-03-01 19:24:48', 955, 'center', NULL, 'Rømerglass', 'romerglass', 'Rømerglass (B 6583). Fragmentet er ca. 10,0 cm høyt. Glassets fot er glatt og det er bringebærknopper på stetten. Det er funnet i Vinkjelleren på Bryggen. Typen ble laget fra 1600-tallet eller i begynnelsen av 1700-tallet.', '2010-03-01 19:24:48', 1, ''),
(46, 'photologue/photos/B_6583_romerberkemeyer.jpg', '2009-07-27 20:40:21', 2416, 'center', 1, 'Rømer- eller berkemeyerglass med glassyke', 'romer-eller-berkemeyerglass-glassyke', 'Rømer- eller berkemeyerglass (B 6583). Fragmentet er ca. 3,0 cm høyt. Glassets fot er bygget opp av glasstråder og det er knopper på klokken. Det ble funnet i Vinkjelleren på Bryggen.\r\n', '2009-07-27 20:40:18', 1, ''),
(47, 'photologue/photos/BRM_070465_.jpg', '2009-07-29 14:14:01', 1417, 'center', NULL, 'Drikkeglass', 'drikkeglass', 'Del av blått begerglass med pålagt dekorerte bånd og en fot av båndringer. ', '2009-07-29 14:13:57', 1, ''),
(81, 'photologue/photos/16maigeleinB_6583__.jpg', '2010-03-01 19:36:16', 644, 'center', NULL, 'Maigeleinglass2', 'maigeleinglass2', 'Maigeleinglass (B 6583). Dette glasset er bare ca. 1,5 cm høyt, det har optisk dekor og er funnet i Vinkjelleren på Bryggen.', '2010-03-01 19:36:16', 1, ''),
(78, 'photologue/photos/13romerB_6583.jpg', '2010-03-01 19:25:16', 959, 'center', NULL, 'Rømerglass2', 'romerglass2', 'Rømerglass (B 6583). Fragmentet er ca. 8,0 cm høyt. Glassets fot er bygget opp av glasstråder og det er bringebærknopper på stetten. Klokken er nesten kuleformet. Glasset er funnet i Vinkjelleren på Bryggen. Typen ble laget på 1600-tallet.', '2010-03-01 19:25:16', 1, ''),
(49, 'photologue/photos/B_6388h.jpg', '2009-07-29 14:20:11', 1457, 'center', NULL, 'Venetiansk stettglass', 'venetiansk-stettglass', 'Venetiansk stettglass med vingedekor. Klart glass med dekor utført i klart og blått glass. Nedre del av fragmentet består av klokken og øvre delen av stetten.', '2009-07-29 14:20:08', 1, ''),
(73, 'photologue/photos/7romer_.jpg', '2010-03-01 15:19:15', 1024, 'center', NULL, 'Rømer- eller berkemeyerglass8', 'romer-eller-berkemeyerglass8', 'Rømer- eller berkemeyerglass funnet i Vinkjelleren på Bryggen (B 6388). Fragmentet er ca. 5,0 cm høyt. Glasset har glatt fot og pigger på klokken. Typen ble laget på 1500-tallet eller i begynnelsen av 1600-tallet.', '2010-03-01 15:19:14', 1, ''),
(80, 'photologue/photos/15maigeleinB_6583_____.jpg', '2010-03-01 19:35:49', 643, 'center', NULL, 'Maigeleinglass', 'maigeleinglass', 'Maigeleinglass (B 6583). Fragmentet er ca. 4,0 cm høyt. Glasset har optisk dekor. Det er funnet i Vinkjelleren på Bryggen.', '2010-03-01 19:35:49', 1, ''),
(75, 'photologue/photos/romer9.jpg', '2010-03-01 15:38:33', 1034, 'center', NULL, 'Rømer- eller berkemeyerglass 3', 'romer-eller-berkemeyerglass-3', 'Rømer- eller berkemeyerglass (BRM 0/70466). Fragmentet er ca. 4,5 cm høyt. Glasset har piggete kant på foten og pigger på klokken, det er funnet i den nordlige delen av Bryggen. Typen ble laget på 1500-tallet eller i begynnelsen av 1600-tallet.', '2010-03-01 15:38:32', 1, ''),
(72, 'photologue/photos/8romer.jpg', '2010-03-01 15:07:50', 578, 'center', NULL, 'Rømer- eller berkemeyerglass 2', 'romer-eller-berkemeyerglass-2', 'Rømer- eller berkemeyerglass (BRM 0/70254). Fragmentet er ca. 3,5 cm høyt. Glasset har glatt fot og pigger på klokken. Glasset har glatt fot og pigger på klokken. Det er funnet i den nordlige delen av Bryggen. Typen ble laget på 1500-tallet eller i begynnelsen av 1600-tallet.', '2010-03-01 15:07:50', 1, ''),
(82, 'photologue/photos/17maigeleinB0_26493_.jpg', '2010-03-01 19:36:38', 652, 'center', NULL, 'Maigeleinglass3', 'maigeleinglass3', 'Maigeleinglass (BRM 0/26493). Fragmentet er ca. 5,5 cm høyt. Glasset har optisk dekor. Det er funnet i den nordlige delen av Bryggen.', '2010-03-01 19:36:38', 1, ''),
(83, 'photologue/photos/18maigeleinB_6388_.jpg', '2010-03-01 19:36:59', 657, 'center', NULL, 'Maigeleinglass4', 'maigeleinglass4', 'Maigeleinglass (B 6388). Glasset er helt, det er ca. 1,5 cm høyt. Det har glatte sider uten dekor. Det er funnet i Vinkjelleren på Bryggen.', '2010-03-01 19:36:59', 1, ''),
(84, 'photologue/photos/stangenglassBRM0_55349.jpg', '2010-06-21 17:58:54', 419, 'center', 1, 'Stangenglass', 'stangenglass', 'Grønnlig smalt stangenglass (BRM 0/55349)med et karakteristisk blått bånd på klokken. Det er små luftboblene i glasset. Boblene kan være en form for optisk dekor, eller de kan være en feil i glasset. Skåret er funnet på den nordlige del av Bryggen. Typen ble laget fra ca. 1550-1675.  ', '2010-06-21 17:58:54', 1, ''),
(88, 'photologue/photos/21PassglassBRM_58028_skaar2.jpg', '2010-06-21 19:21:17', 425, 'center', NULL, 'Skår fra passglass2', 'skar-fra-passglass2', 'Skår (BRM 0/58119) fra passglass. Skårene er funnet i den nordlige delen av Bryggen. ', '2010-06-21 19:21:17', 1, ''),
(89, 'photologue/photos/passglass_avkvarell.jpg', '2010-06-21 19:35:25', 394, 'center', NULL, 'Rekonstruksjon av passglass', 'rekonstruksjon-av-passglass', 'Rekonstruksjon av passglasset med skårenes plassering.', '2010-06-21 19:35:25', 1, ''),
(85, 'photologue/photos/20StangenglasBRM0_70467.jpg', '2010-06-21 18:03:05', 417, 'center', NULL, 'Stangenglass2', 'stangenglass2', 'Grønnlig stangenglass (BRM 0/70467). En ser at klokken begynner oppe på foten. Skåret er ca. 7,5 cm høyt. Glasset har opprinnelig vært klart og grønnlig, de flotte fargene vi ser nå skyldes glasspest! Skåret er funnet på den nordlige delen av Bryggen.', '2010-06-21 18:03:05', 1, ''),
(63, 'photologue/photos/kjol_.jpg', '2010-02-28 22:56:05', 459, 'center', 1, 'kjole', 'kjole', '', '2010-02-28 22:56:05', 1, ''),
(86, 'photologue/photos/21PassglassBRM-_58028_2stk___.jpg', '2010-06-21 18:06:17', 562, 'center', NULL, 'Passglass', 'passglass', 'Fotfragmentet av et passglass (BRM 0/58028). Det er ca 11,5 cm høyt.', '2010-06-21 18:06:17', 1, ''),
(103, 'photologue/photos/10romer.jpg', '2010-07-01 10:43:34', 14, 'center', NULL, 'Rømerglass-ellerberkemeyer9', 'romerglass-ellerberkemeyer9', 'Rømer- eller berkemeyerglass (B 6583). Fragmentet er ca. 3,0 cm høyt. Glassets fot er bygget opp av glasstråder og det er knopper på klokken. Det ble funnet i Vinkjelleren på Bryggen.', '2010-07-01 10:43:33', 1, ''),
(87, 'photologue/photos/21PassglassBRM-_58028_skaar.jpg', '2010-06-21 19:18:21', 424, 'center', NULL, 'Skår fra passglass', 'skar-fra-passglass', 'Skåret på bildet (BRM 0/57846) stammer fra et passglass. Skåret har i tillegg til pålagte glassbånd også loddrett optisk dekor nedover klokken. Skåret er funnet i den nordlige delen av Bryggen. ', '2010-06-21 19:18:21', 1, ''),
(90, 'photologue/photos/romer_akvarell.jpg', '2010-06-21 19:50:00', 645, 'center', NULL, 'Rømer- eller berkemeyerglass4', 'romer-eller-berkemeyerglass4', 'Dette viser en rekonstruksjon av et rømer- eller berkemeyerglass (B 6388) bygget opp av glasstråder og med bringebærknopper på stetten.', '2010-06-21 19:50:00', 1, ''),
(91, 'photologue/photos/romer_akvarell2.jpg', '2010-06-21 19:55:40', 634, 'center', NULL, 'Rømer- eller berkemeyerglass5', 'romer-eller-berkemeyerglass5', 'Rekonstruksjon av et rømer- eller berkemeyerglass (BRM 0/70466).', '2010-06-21 19:55:40', 1, ''),
(92, 'photologue/photos/22isglass_bunn.jpg', '2010-06-21 20:39:01', 179, 'center', NULL, 'Bunn av isglass', 'bunn-av-isglass', 'Bunnfragmentet er ca. 3,5 cm høyt (BRM 0/35145), det er funnet i den nordlige delen av Bryggen.', '2010-06-21 20:39:01', 1, ''),
(93, 'photologue/photos/22isglass_skaar.jpg', '2010-06-21 20:39:49', 171, 'center', NULL, 'Skår av isglass', 'skar-av-isglass', 'Skår av isglass funnet på Bryggen.', '2010-06-21 20:39:49', 1, ''),
(94, 'photologue/photos/akvarell_isglass.jpg', '2010-06-21 20:40:44', 172, 'center', NULL, 'Rekonstruksjon av isglass', 'rekonstruksjon-av-isglass', 'Rekonstruksjon av skår fra et isglass.', '2010-06-21 20:40:44', 1, ''),
(95, 'photologue/photos/23slangestett.jpg', '2010-06-21 20:45:59', 238, 'center', NULL, 'Slangestett', 'slangestett', 'På dette glasset (B 6388h) er mye av klokken bevart. Klokken er av svært tynnblåst klart glass. Stetten er omkranset av ormer som slynger seg rundt hverandre. Dette er detaljer i blått glass. Stetten er i klart glass med en stripe hvitt opak glass i midten. Dette skåret er funnet i Vinkjelleren. Det er ca. 11,0 cm høyt.', '2010-06-21 20:45:59', 1, ''),
(96, 'photologue/photos/23slangestett_skar.jpg', '2010-06-21 20:48:17', 222, 'center', NULL, 'Skår fra et slangestett', 'skar-fra-et-slangestett', 'Her (BRM 0/32405) sees en del av en blå vinge og den klare stetten med en hvit opak spiral inni. Fragmentet er 1,7 cm langt. Det er fra den nordlige delen av Bryggen.', '2010-06-21 20:48:17', 1, ''),
(97, 'photologue/photos/akvarell_slangestett.jpg', '2010-06-21 20:49:40', 218, 'center', NULL, 'Rekonstruksjon av slangestett', 'rekonstruksjon-av-slangestett', 'Her sees en rekonstruksjon av et slangestett.', '2010-06-21 20:49:40', 1, ''),
(98, 'photologue/photos/filigranglass_skar.jpg', '2010-06-21 20:54:09', 159, 'center', NULL, 'Skår fra filigranglass', 'skar-fra-filigranglass', 'Fragmentet av filigranglasset på bildet er ca. 2,0 cm langt (BRM 0/34357). Det er en del av foten til et beger i klart glass med hvite opake glasstråder. Skåret er fra den nordlige delen av Bryggen.', '2010-06-21 20:54:09', 1, ''),
(99, 'photologue/photos/akvarell_filigran.jpg', '2010-06-21 20:57:45', 119, 'center', NULL, 'Rekonstruksjon av et filigranglass', 'rekonstruksjon-av-et-filigranglass', 'Her sees en rekonstruksjon av filigranglasset som viser fragmentets plassering.', '2010-06-21 20:57:45', 1, ''),
(100, 'photologue/photos/nuppen_.jpg', '2010-06-28 12:35:58', 450, 'center', NULL, 'Nuppenbecher', 'nuppenbecher', 'På bildet ses et nuppenbecher av krautstrunk-typen (krautstrunk betyr rosenkål-stokk på tysk). Skåret på bildet er ca. 3,0 cm høyt (BRM 76/26225). Det er funnet i Vinkjelleren på Bryggen.', '2010-06-28 12:35:58', 1, ''),
(101, 'photologue/photos/akvarell_nuppen.jpg', '2010-06-28 12:37:17', 445, 'center', NULL, 'Rekonstruksjon av nuppenbecherglass', 'rekonstruksjon-av-nuppenbecherglass', 'Her sees en rekonstruksjon av skåret av nuppenbecherglasset.', '2010-06-28 12:37:17', 1, ''),
(102, 'photologue/photos/24slangestett_close.jpg', '2010-06-28 13:22:20', 168, 'center', NULL, 'Nærbilde av fot', 'naerbilde-av-fot', 'Nærbilde av slangestettglassets fot.', '2010-06-28 13:22:20', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `photologue_photoeffect`
--

CREATE TABLE IF NOT EXISTS `photologue_photoeffect` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(30) NOT NULL,
  `description` longtext NOT NULL,
  `transpose_method` varchar(15) NOT NULL,
  `color` double NOT NULL,
  `brightness` double NOT NULL,
  `contrast` double NOT NULL,
  `sharpness` double NOT NULL,
  `filters` varchar(200) NOT NULL,
  `reflection_size` double NOT NULL,
  `reflection_strength` double NOT NULL,
  `background_color` varchar(7) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `photologue_photoeffect`
--

INSERT INTO `photologue_photoeffect` (`id`, `name`, `description`, `transpose_method`, `color`, `brightness`, `contrast`, `sharpness`, `filters`, `reflection_size`, `reflection_strength`, `background_color`) VALUES
(1, 'Enhance Thumbnail', 'Increases sharpness and contrast. Works well for smaller image sizes such as thumbnails.', '', 1, 1, 1.2, 1, '', 0, 0.6, '#FFFFFF'),
(2, 'Display Reflection', 'Generates a reflection with a white background', '', 1, 1, 1, 1, '', 0.4, 0.6, '#FFFFFF');

-- --------------------------------------------------------

--
-- Table structure for table `photologue_photosize`
--

CREATE TABLE IF NOT EXISTS `photologue_photosize` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(20) NOT NULL,
  `width` int(10) unsigned NOT NULL,
  `height` int(10) unsigned NOT NULL,
  `quality` int(10) unsigned NOT NULL,
  `upscale` tinyint(1) NOT NULL,
  `crop` tinyint(1) NOT NULL,
  `pre_cache` tinyint(1) NOT NULL,
  `increment_count` tinyint(1) NOT NULL,
  `effect_id` int(11) default NULL,
  `watermark_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `photologue_photosize_effect_id` (`effect_id`),
  KEY `photologue_photosize_watermark_id` (`watermark_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `photologue_photosize`
--

INSERT INTO `photologue_photosize` (`id`, `name`, `width`, `height`, `quality`, `upscale`, `crop`, `pre_cache`, `increment_count`, `effect_id`, `watermark_id`) VALUES
(1, 'admin_thumbnail', 200, 200, 70, 0, 1, 1, 1, NULL, NULL),
(2, 'thumbnail', 90, 90, 70, 0, 1, 1, 1, 1, NULL),
(3, 'display', 370, 475, 80, 0, 1, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `photologue_watermark`
--

CREATE TABLE IF NOT EXISTS `photologue_watermark` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(30) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(100) NOT NULL,
  `style` varchar(5) NOT NULL,
  `opacity` double NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `photologue_watermark`
--


-- --------------------------------------------------------

--
-- Table structure for table `tagging_tag`
--

CREATE TABLE IF NOT EXISTS `tagging_tag` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `tagging_tag`
--

INSERT INTO `tagging_tag` (`id`, `name`) VALUES
(4, 'glass'),
(3, 'hei'),
(5, 'test2'),
(6, 'test');

-- --------------------------------------------------------

--
-- Table structure for table `tagging_taggeditem`
--

CREATE TABLE IF NOT EXISTS `tagging_taggeditem` (
  `id` int(11) NOT NULL auto_increment,
  `tag_id` int(11) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `object_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `tag_id` (`tag_id`,`content_type_id`,`object_id`),
  KEY `tagging_taggeditem_tag_id` (`tag_id`),
  KEY `tagging_taggeditem_content_type_id` (`content_type_id`),
  KEY `tagging_taggeditem_object_id` (`object_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `tagging_taggeditem`
--

INSERT INTO `tagging_taggeditem` (`id`, `tag_id`, `content_type_id`, `object_id`) VALUES
(4, 4, 9, 3),
(5, 5, 11, 6),
(6, 6, 9, 4);

-- --------------------------------------------------------

--
-- Table structure for table `theblog_blogpost`
--

CREATE TABLE IF NOT EXISTS `theblog_blogpost` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(150) NOT NULL,
  `body` longtext NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `theblog_blogpost`
--

INSERT INTO `theblog_blogpost` (`id`, `title`, `body`, `timestamp`) VALUES
(1, 'Test', 'Hei dette er en blog test', '2009-07-08 01:41:19');
