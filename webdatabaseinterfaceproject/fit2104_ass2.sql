-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 09, 2022 at 08:21 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fit2104_ass2`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Basic- Piano'),
(2, 'Intermediate - Piano'),
(3, 'Advanced - Piano'),
(4, 'Basic - Guitar'),
(5, 'Intermediate - Guitar'),
(6, 'Advanced - Guitar'),
(7, 'Basic - Violin'),
(8, 'Intermediate - Violin'),
(9, 'Advanced - Violin'),
(10, 'Basic - Drum'),
(11, 'Intermediate - Drum'),
(12, 'Advanced - Drum'),
(13, 'Basic - Cello'),
(14, 'Intermediate - Cello'),
(15, 'Advanced - Cello'),
(23, 'Basic - Vocals');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`id`, `name`, `price`, `category_id`) VALUES
(41, 'Basic Piano Class', '55.50', 1),
(42, 'Intermediate Piano Class', '60.00', 2),
(43, 'Advanced Piano Class', '65.50', 3),
(44, 'Basic Guitar Class', '35.90', 4),
(45, 'Intermediate Guitar Class', '62.00', 5),
(46, 'Advanced Guitar Class', '45.50', 6),
(47, 'Basic Violin Class', '40.50', 7),
(48, 'Intermediate Violin Class', '45.50', 8),
(49, 'Advanced Violin Class', '50.00', 9),
(50, 'Basic Drum Class', '41.50', 10),
(51, 'Intermediate Drum Class', '43.50', 11),
(52, 'Advanced Drum Class', '44.50', 12),
(53, 'Basic Cello Class', '45.00', 13),
(57, 'Intermediate Cello Class', '47.50', 14),
(58, 'Advanced Cello Class', '49.50', 15),
(60, 'Basic Vocals Class', '50.00', 23);

-- --------------------------------------------------------

--
-- Table structure for table `course_image`
--

CREATE TABLE `course_image` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `file_path` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course_image`
--

INSERT INTO `course_image` (`id`, `course_id`, `file_path`) VALUES
(16, 41, 'course_41_633e46c3b73931.10725536.png'),
(17, 42, 'course_42_633e4739c42f93.26437275.png'),
(18, 43, 'course_43_633e477dd6ad51.79249567.png'),
(19, 44, 'course_44_633e5f3e23c167.02997021.png'),
(20, 45, 'course_45_633e5f69831528.46086090.png'),
(21, 46, 'course_46_633e5f7ce4e341.62371948.png'),
(22, 47, 'course_47_633e5feb356723.20568272.png'),
(23, 48, 'course_48_633e600a2c4039.31562376.png'),
(24, 49, 'course_49_633e6023b84687.98133961.png'),
(25, 50, 'course_50_633e6084779801.55341669.png'),
(26, 51, 'course_51_633e609a532129.63786151.png'),
(27, 52, 'course_52_633e60a7a33049.13462360.png'),
(28, 53, 'course_53_633e61028d4f78.90292038.png'),
(32, 57, 'course_57_634225459296b7.12041981.png'),
(33, 58, 'course_58_6342255eb11460.51709178.png'),
(35, 60, 'course_60_63423afbc147c4.82040885.png');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` int(10) NOT NULL,
  `dob` date NOT NULL,
  `email` varchar(100) NOT NULL,
  `subscribe` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `firstName`, `surname`, `address`, `phone`, `dob`, `email`, `subscribe`) VALUES
(1, 'Bill', 'Gong', '12 Clayton Road, 3168 Clayton, VIC', 412456791, '1990-12-12', 'billgong@gmail.com', 'Yes'),
(2, 'Nelly', 'Li', '7  Gloucester Avenue, 3053 Carlton, VIC', 415279341, '1995-01-13', 'nellyli@gmail.com', 'No'),
(3, 'Maya', 'Seccombe', '63 Parkes Road, 3002 East Melbourne, VIC', 111111111, '1999-07-13', 'mayaseccombe@gmail.com', 'No'),
(4, 'Darren', 'Luwi', '29 Gloucester Avenue, 5006 North Adelaide, SA', 455929292, '1991-01-23', 'darrenluwi@gmail.com', 'No'),
(5, 'Marshall', 'Mathers', '106 Creedon St, 3051 North Melbourne, VIC', 435617264, '2002-03-03', 'marshallmathers@gmail.com', 'No'),
(6, 'Britney', 'Spears', '43 Sydney Rd, 2422 Faulkland, NSW', 438901920, '1998-04-05', 'britneyspears@gmail.com', 'No'),
(7, 'John', 'Travolta', '128 Swanston St, 4103 Fairfield, QLD', 436667162, '1991-06-27', 'johntravolta@gmail.com', 'Yes'),
(8, 'Samuel', 'L.Jackson', '12 Jackson St, 2067 Chatswood, NSW', 998765432, '1989-01-20', 'samuelljackson@gmail.com', 'Yes'),
(9, 'Al', 'Pacino', '12 Scarface Rd, 5222 Ironstone, SA', 238918273, '1998-04-23', 'alpacino@gmai.com', 'Yes'),
(10, 'Michelle', 'Pfeiffer', '203 Pacific St, 3546 Gerahmin, VIC', 466172837, '1994-02-20', 'michellepfeiffer@gmail.com', 'Yes'),
(11, 'Taylor', 'Swift', '31 Swift Ave, 3691 Edben, VIC', 982281788, '1990-02-28', 'taylorswift@gmail.com', 'No'),
(12, 'Beyonce', 'Knowles', '302 Sesame St, 4670 Abbotsford, QLD', 435819901, '1993-03-26', 'beyonceknowles@gmail.com', 'Yes'),
(13, 'Justin', 'Timberlake', '34 Timberland St, 5166 O\'Sullivan Beach, SA', 372819291, '1996-01-01', 'justintimberlake@gmail.com', 'Yes'),
(14, 'Kurt', 'Cobain', '43 Nirvana Rd, 4680 Ubobo, QLD', 938192120, '1994-08-08', 'kurtcobain@gmail.com', 'No'),
(15, 'Lady', 'Gaga', '12 Rainbow Rd, 3430 Tallegalla, QLD', 489910291, '1994-06-27', 'ladygaga@gmail.com', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `tailored_class`
--

CREATE TABLE `tailored_class` (
  `id` int(11) NOT NULL,
  `summary` varchar(1000) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `quote` decimal(65,2) NOT NULL,
  `otherInfo` varchar(1000) NOT NULL,
  `student_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tailored_class`
--

INSERT INTO `tailored_class` (`id`, `summary`, `start_date`, `end_date`, `quote`, `otherInfo`, `student_id`) VALUES
(1, 'One-on-one Piano Class ', '2022-10-08', '2022-11-08', '78.90', 'Tutor: Dane Oldman', 3),
(2, 'One-on-one Guitar Class', '2022-10-08', '2022-11-08', '65.50', 'Tutor: Mick Jagger; Student requested class to be ran at a brighter room due to eyesight problems.', 4),
(3, 'One-on-one Piano Class', '2022-10-09', '2022-12-09', '150.50', 'Tutor: Elton John; Tutor requested extra lightings for the class', 13),
(4, 'Online one-on-one Guitar Class', '2022-10-10', '2022-11-10', '50.00', 'Tutor: Eric Clapton', 5),
(5, 'One-on-one Drum class', '2022-12-12', '2023-02-12', '140.30', 'Tutor: Phil Collins', 11),
(6, 'One-on-one Violin Class', '2022-11-11', '2023-02-11', '167.35', 'Tutor: Hillary Hahn; Tutor requested student to purchase his/her own Violin ', 6),
(7, 'One-on-one Vocals class', '2022-11-01', '2022-12-01', '55.50', 'Tutor: Mariah Carey', 3),
(8, 'Online one-on-one Vocals class', '2022-11-05', '2022-12-05', '45.80', 'Tutor: Celine Dion', 7),
(9, 'One-on-one Vocals class', '2022-10-09', '2022-11-09', '55.50', 'Tutor: Adam Levine; Student requested class to be held in an outdoor setting', 8),
(10, 'Online one-on-one Piano class', '2022-12-12', '2023-01-12', '60.70', 'Tutor: Ludwig van Beethoven', 1),
(11, 'One-on-one Cello class', '2023-01-01', '2023-02-01', '80.50', 'Tutor: Kenny G', 13),
(12, 'One-on-one Vocals class', '2023-01-01', '2023-02-01', '55.50', 'Tutor: Chester Bennington; Tutor requested extra microphones', 4),
(13, 'One-on-one Vocals class', '2022-12-01', '2022-12-25', '45.50', 'Tutor: Shane Filan', 7),
(14, 'One-on-one Drum class', '2022-12-12', '2022-01-12', '67.50', 'Tutor: Mike Shinoda', 11),
(15, 'One-on-one Vocals class', '2022-11-09', '2022-12-09', '55.50', 'Tutor: Eminem', 6);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(10000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `fullname`, `email`, `username`, `password`) VALUES
(1, 'Dane Oldman', 'contact_littledreamermusic@example.com', 'daneo', 'd7198e87ef115a338bbb0867ece7d84907747b7a673ad8d339e8464dc9e54f16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `course_image`
--
ALTER TABLE `course_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `tailored_class`
--
ALTER TABLE `tailored_class`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `course_image`
--
ALTER TABLE `course_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tailored_class`
--
ALTER TABLE `tailored_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `course_image`
--
ALTER TABLE `course_image`
  ADD CONSTRAINT `course_image_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tailored_class`
--
ALTER TABLE `tailored_class`
  ADD CONSTRAINT `tailored_class_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
