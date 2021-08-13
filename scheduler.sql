-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 13, 2021 at 02:53 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `scheduler`
--

-- --------------------------------------------------------

--
-- Table structure for table `individuals`
--

CREATE TABLE `individuals` (
  `id` int(30) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `individuals`
--

INSERT INTO `individuals` (`id`, `code`, `name`, `date_created`) VALUES
(3, '871616979009', 'John Smith', '2021-06-28 16:06:46'),
(4, '125845984159', 'Claire Blake', '2021-06-28 16:07:12'),
(7, '812732533116', 'Peter mwovi', '2021-08-11 14:38:54'),
(8, '481940256398', 'Vincent OOko', '2021-08-13 15:24:39');

-- --------------------------------------------------------

--
-- Table structure for table `individual_meta`
--

CREATE TABLE `individual_meta` (
  `individual_id` int(30) NOT NULL,
  `meta_field` text DEFAULT NULL,
  `meta_value` text DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `individual_meta`
--

INSERT INTO `individual_meta` (`individual_id`, `meta_field`, `meta_value`, `date_created`) VALUES
(3, 'name', 'John Smith', '2021-06-28 16:06:46'),
(3, 'contact', '09123456789', '2021-06-28 16:06:46'),
(3, 'gender', 'Male', '2021-06-28 16:06:46'),
(3, 'dob', '1995-06-23', '2021-06-28 16:06:46'),
(3, 'address', 'Sample Address', '2021-06-28 16:06:46'),
(4, 'name', 'Claire Blake', '2021-06-28 16:07:12'),
(4, 'contact', 'Sample Address', '2021-06-28 16:07:12'),
(4, 'gender', 'Female', '2021-06-28 16:07:12'),
(4, 'dob', '1995-10-14', '2021-06-28 16:07:12'),
(4, 'address', 'Sample Address', '2021-06-28 16:07:12'),
(7, 'name', 'Peter mwovi', '2021-08-11 14:38:55'),
(7, 'contact', '0706678868', '2021-08-11 14:38:55'),
(7, 'gender', 'Male', '2021-08-11 14:38:55'),
(7, 'dob', '2000-09-02', '2021-08-11 14:38:55'),
(7, 'address', 'Kakamega ', '2021-08-11 14:38:55'),
(8, 'name', 'Vincent OOko', '2021-08-13 15:24:39'),
(8, 'contact', '0706678868', '2021-08-13 15:24:39'),
(8, 'gender', 'Male', '2021-08-13 15:24:39'),
(8, 'dob', '2021-08-12', '2021-08-13 15:24:39'),
(8, 'address', 'lupe', '2021-08-13 15:24:39');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id` int(30) NOT NULL,
  `location` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `max_a_day` int(5) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `location`, `description`, `max_a_day`, `date_created`, `date_updated`) VALUES
(5, 'Shirere, Kakamega , Kenya', '', 300, '2021-08-11 14:47:27', NULL),
(6, 'Lurambi, Kakamega', '', 50, '2021-08-13 15:23:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` int(11) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `FirstName`, `LastName`, `Email`, `Password`) VALUES
(1, 'Peter', 'Mwovi', 'peter@gmail.com', '202cb962ac59075b964b07152d234b70'),
(2, 'Vinny', 'ooko', 'vinny@gmail.com', '202cb962ac59075b964b07152d234b70');

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` int(30) NOT NULL,
  `individual_id` int(30) NOT NULL,
  `location_id` int(30) NOT NULL,
  `date_sched` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `individual_id`, `location_id`, `date_sched`, `status`, `date_created`) VALUES
(3, 3, 1, '2021-06-28', 1, '2021-06-28 16:06:46'),
(4, 4, 1, '2021-06-28', 1, '2021-06-28 16:07:12'),
(7, 7, 1, '2021-08-13', 0, '2021-08-11 14:38:54'),
(8, 8, 6, '2021-08-17', 0, '2021-08-13 15:24:39');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Covid Vaccination  System'),
(6, 'short_name', 'COVID 19 VACCINE'),
(11, 'logo', 'uploads/1624844160_vaccine.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/1624844160_vaccine_banner.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/1624240500_avatar.png', NULL, 1, '2021-01-20 14:02:37', '2021-06-21 09:55:07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `individuals`
--
ALTER TABLE `individuals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `individuals`
--
ALTER TABLE `individuals`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
