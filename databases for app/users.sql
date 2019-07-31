-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 05, 2019 at 05:57 PM
-- Server version: 5.7.25-log
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `users`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL,
  `instructor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `TITLE_UNIQUE` (`title`),
  KEY `FK_INSTRUCTOR_idx` (`instructor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`id`, `title`, `instructor_id`) VALUES
(10, 'php', 2),
(11, 'java', 2),
(12, 'c++', 2),
(13, 'phwdfsp', NULL),
(14, 'jaasdfsdava', NULL),
(15, 'c+fadssfd+', NULL),
(16, 'SAMO DANAS JAVA EE', NULL),
(17, 'pacman=how to svore milion points', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `course_student`
--

DROP TABLE IF EXISTS `course_student`;
CREATE TABLE IF NOT EXISTS `course_student` (
  `course_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`course_id`,`student_id`),
  KEY `FK_STUDENT_idx` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course_student`
--

INSERT INTO `course_student` (`course_id`, `student_id`) VALUES
(17, 1),
(17, 2);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `first_name`, `last_name`, `email`) VALUES
(1, 'David', 'Adams', 'david@luv2code.com'),
(2, 'John', 'Doe', 'john@luv2code.com'),
(3, 'Ajay', 'Rao', 'ajay@luv2code.com'),
(4, 'Mary', 'Public', 'mary@luv2code.com'),
(5, 'Maxwell', 'Dixon', 'max@luv2code.com');

-- --------------------------------------------------------

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
CREATE TABLE IF NOT EXISTS `instructor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `instructor_detail_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_DETAIL_idx` (`instructor_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `instructor`
--

INSERT INTO `instructor` (`id`, `first_name`, `last_name`, `email`, `instructor_detail_id`) VALUES
(1, 'vojislav', 'jovanic', 'vojke@bgmail.com', 1),
(2, 'petar', 'jovanic', 'petar@bgmail.com', 2),
(3, 'petar213', 'jovaafsdsfnic', 'petarfdsafd@bgmail.com', 4),
(4, 'qq4', 'q', 'pet1qbgmail.com', 5);

-- --------------------------------------------------------

--
-- Table structure for table `instructor_detail`
--

DROP TABLE IF EXISTS `instructor_detail`;
CREATE TABLE IF NOT EXISTS `instructor_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `youtube_channel` varchar(128) DEFAULT NULL,
  `hobby` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `instructor_detail`
--

INSERT INTO `instructor_detail` (`id`, `youtube_channel`, `hobby`) VALUES
(1, 'http://asd;dsa.com', 'fudbal/kosarka'),
(2, 'http://youtube.com', 'kosarka'),
(3, 'http://youtube.comsdafad', 'kofdafdsarka'),
(4, 'http://youtube.comsdafad', 'kofdafdsarka'),
(5, 'http://yq324', 'kofdaqka');

-- --------------------------------------------------------

--
-- Table structure for table `kupci`
--

DROP TABLE IF EXISTS `kupci`;
CREATE TABLE IF NOT EXISTS `kupci` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ime` varchar(30) DEFAULT NULL,
  `prezime` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kupci`
--

INSERT INTO `kupci` (`id`, `ime`, `prezime`) VALUES
(1, 'milan', 'simic'),
(2, 'petar', 'scekic'),
(3, 'ilija', 'dakic'),
(4, 'aleksandra', 'dakic'),
(5, 'nevena', 'dimitrijevic'),
(6, 'Goran', 'dimovic'),
(7, 'Kralj', 'Petric'),
(8, 'peric', 'ovosti');

-- --------------------------------------------------------

--
-- Table structure for table `prizvodi`
--

DROP TABLE IF EXISTS `prizvodi`;
CREATE TABLE IF NOT EXISTS `prizvodi` (
  `id_proizvoda` int(11) NOT NULL AUTO_INCREMENT,
  `dobavljavac` varchar(255) DEFAULT NULL,
  `kolicina` int(11) DEFAULT NULL,
  `naziv` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_proizvoda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prodaja`
--

DROP TABLE IF EXISTS `prodaja`;
CREATE TABLE IF NOT EXISTS `prodaja` (
  `prodaja_id` int(11) NOT NULL AUTO_INCREMENT,
  `proizvod_id` int(11) NOT NULL,
  `kupac_id` int(11) NOT NULL,
  PRIMARY KEY (`prodaja_id`),
  KEY `proizvod_id` (`proizvod_id`),
  KEY `kupac_id` (`kupac_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prodaja`
--

INSERT INTO `prodaja` (`prodaja_id`, `proizvod_id`, `kupac_id`) VALUES
(1, 1, 1),
(2, 1, 3),
(3, 3, 3),
(4, 2, 5),
(7, 5, 5),
(8, 1, 7),
(9, 3, 6),
(10, 5, 7),
(11, 7, 8),
(12, 9, 8);

-- --------------------------------------------------------

--
-- Table structure for table `proizvodi`
--

DROP TABLE IF EXISTS `proizvodi`;
CREATE TABLE IF NOT EXISTS `proizvodi` (
  `id_proizvoda` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(60) DEFAULT NULL,
  `kolicina` int(11) DEFAULT NULL,
  `dobavljavac` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_proizvoda`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `proizvodi`
--

INSERT INTO `proizvodi` (`id_proizvoda`, `naziv`, `kolicina`, `dobavljavac`) VALUES
(1, 'fudbalska_lopta', 42, 'planeta_sport'),
(2, 'coca cola', 120, 'eu0ins'),
(3, 'hleb', 111, 'Zamajac'),
(4, 'Lav pivo', 300, 'Skturket'),
(5, 'Jelen pivo', 300, 'ihobavbajuy'),
(6, 'Zajacarsko', 300, 'ihobavbajuy'),
(7, 'Nisicko', 300, 'ihobavbajuy'),
(8, 'Tuborg', 200, 'eu-dans'),
(9, 'Lav pivo', 300, 'Skturket'),
(10, 'pepsi', 93, 'lidl'),
(11, 'Lav pivo', 300, 'Skturket');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
CREATE TABLE IF NOT EXISTS `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` varchar(256) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_COURSE_ID_idx` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`id`, `comment`, `course_id`) VALUES
(1, 'super je', 16),
(2, 'lose je', 16),
(3, 'OK', 16);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `first_name`, `last_name`, `email`) VALUES
(1, 'marry', 'doe', 'john@gmailc.om'),
(2, 'vojke', 'bos', 'sukurac@gmailc.om');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `FK_INSTRUCTOR` FOREIGN KEY (`instructor_id`) REFERENCES `instructor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `course_student`
--
ALTER TABLE `course_student`
  ADD CONSTRAINT `FK_COURSE_05` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_STUDENT` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `instructor`
--
ALTER TABLE `instructor`
  ADD CONSTRAINT `FK_DETAIL` FOREIGN KEY (`instructor_detail_id`) REFERENCES `instructor_detail` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `prodaja`
--
ALTER TABLE `prodaja`
  ADD CONSTRAINT `prodaja_ibfk_1` FOREIGN KEY (`proizvod_id`) REFERENCES `proizvodi` (`id_proizvoda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `prodaja_ibfk_2` FOREIGN KEY (`kupac_id`) REFERENCES `kupci` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `FK_COURSE` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
