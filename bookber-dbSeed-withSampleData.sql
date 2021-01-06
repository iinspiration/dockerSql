-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Jan 06, 2021 at 05:36 AM
-- Server version: 8.0.22
-- PHP Version: 7.4.13

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookber`
--
CREATE DATABASE IF NOT EXISTS `bookber` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `bookber`;

-- --------------------------------------------------------

--
-- Table structure for table `barbers_registries`
--

DROP TABLE IF EXISTS `barbers_registries`;
CREATE TABLE IF NOT EXISTS `barbers_registries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `baber_id` int DEFAULT NULL,
  `shop_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `baber_id` (`baber_id`),
  KEY `shop_id` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `barbers_registries`
--

TRUNCATE TABLE `barbers_registries`;
--
-- Dumping data for table `barbers_registries`
--

INSERT INTO `barbers_registries` (`id`, `baber_id`, `shop_id`) VALUES
(1, 4, 2),
(2, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `barber_shops`
--

DROP TABLE IF EXISTS `barber_shops`;
CREATE TABLE IF NOT EXISTS `barber_shops` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `open` int DEFAULT NULL,
  `close` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `barber_shops`
--

TRUNCATE TABLE `barber_shops`;
--
-- Dumping data for table `barber_shops`
--

INSERT INTO `barber_shops` (`id`, `name`, `description`, `location`, `rating`, `open`, `close`) VALUES
(1, 'ร้านตัดผมเจ๊เอง', 'ร้านตัดผมเจ๊เอง', '13.8340958,100.573863', 1, 8, 18),
(2, 'ร้านตัดผมชาย', 'ร้านตัดผมชาย', '13.8340958,100.573865', 2, 9, 20);

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
CREATE TABLE IF NOT EXISTS `bookings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `status` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `baber_id` int DEFAULT NULL,
  `services_id` int DEFAULT NULL,
  `appointment_date` timestamp NULL DEFAULT NULL,
  `appointment_timeslot` int DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `venue` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `customer_id` (`customer_id`),
  KEY `baber_id` (`baber_id`),
  KEY `services_id` (`services_id`),
  KEY `venue` (`venue`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `bookings`
--

TRUNCATE TABLE `bookings`;
--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `created_at`, `status`, `customer_id`, `baber_id`, `services_id`, `appointment_date`, `appointment_timeslot`, `title`, `description`, `venue`) VALUES
(1, '2021-01-06 12:30:51', 1, 3, 4, 3, '2021-01-08 12:30:51', 10, 'ซอยสั้นๆ เลยจ้าา', 'ซอยสั้นๆ เลยจ้าา', 1),
(2, '2021-01-06 12:32:06', 2, 6, 4, 4, '2021-01-06 16:32:06', 17, 'ไถหัว ลงแว็ก', 'ไถหัว ลงแว็ก', 2);

-- --------------------------------------------------------

--
-- Table structure for table `booking_status`
--

DROP TABLE IF EXISTS `booking_status`;
CREATE TABLE IF NOT EXISTS `booking_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `booking_status`
--

TRUNCATE TABLE `booking_status`;
--
-- Dumping data for table `booking_status`
--

INSERT INTO `booking_status` (`id`, `title`) VALUES
(1, 'pending'),
(2, 'confirmed'),
(3, 'cancled'),
(4, 'done'),
(5, 'rated');

-- --------------------------------------------------------

--
-- Table structure for table `customer_reviews`
--

DROP TABLE IF EXISTS `customer_reviews`;
CREATE TABLE IF NOT EXISTS `customer_reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `baber_id` int DEFAULT NULL,
  `booking_id` int DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `rating` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `baber_id` (`baber_id`),
  KEY `booking_id` (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `customer_reviews`
--

TRUNCATE TABLE `customer_reviews`;
-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `notification_datetime` timestamp NULL DEFAULT NULL,
  `status` int DEFAULT NULL,
  `type` int DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `notifications`
--

TRUNCATE TABLE `notifications`;
-- --------------------------------------------------------

--
-- Table structure for table `notification_status`
--

DROP TABLE IF EXISTS `notification_status`;
CREATE TABLE IF NOT EXISTS `notification_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `notification_status`
--

TRUNCATE TABLE `notification_status`;
-- --------------------------------------------------------

--
-- Table structure for table `notification_types`
--

DROP TABLE IF EXISTS `notification_types`;
CREATE TABLE IF NOT EXISTS `notification_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `notification_types`
--

TRUNCATE TABLE `notification_types`;
-- --------------------------------------------------------

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
CREATE TABLE IF NOT EXISTS `services` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `shop_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `services`
--

TRUNCATE TABLE `services`;
--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `description`, `price`, `image`, `shop_id`) VALUES
(1, 'สระ', 'สระผม', 50, NULL, 2),
(2, 'สระ', 'สระผม', 0, NULL, 1),
(3, 'ซอย', 'ซอยผม', 150, NULL, 1),
(4, 'ไถหัวเกรียน', 'ไถหัวเกรียน ธรรมรงค์วินัย', 200, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `role` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role` (`role`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `users`
--

TRUNCATE TABLE `users`;
--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `phone`, `created_at`, `role`, `status`) VALUES
(3, 'อยากตัดผม มากกก', 'qazwxx@gmail.com', '099888999', '2021-01-06 12:21:08', 1, 1),
(4, 'ช่าง สายสอย', 'qazws@gmail.com', '0987776667', '2021-01-06 12:09:57', 2, 1),
(5, 'เจ๊ เจ้าของร้าน', 'eeedddc@gmail.com', '0988895544', '2021-01-06 05:21:57', 3, 1),
(6, 'อยากไถหัว รำคาญผม', 'eedddccc@gmail.com', '08898833343', '2021-01-03 12:29:54', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_status`
--

DROP TABLE IF EXISTS `user_status`;
CREATE TABLE IF NOT EXISTS `user_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `user_status`
--

TRUNCATE TABLE `user_status`;
--
-- Dumping data for table `user_status`
--

INSERT INTO `user_status` (`id`, `title`) VALUES
(1, 'normal'),
(2, 'banned');

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

DROP TABLE IF EXISTS `user_type`;
CREATE TABLE IF NOT EXISTS `user_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `user_type`
--

TRUNCATE TABLE `user_type`;
--
-- Dumping data for table `user_type`
--

INSERT INTO `user_type` (`id`, `title`) VALUES
(1, 'client'),
(2, 'barber'),
(3, 'shopowner');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barbers_registries`
--
ALTER TABLE `barbers_registries`
  ADD CONSTRAINT `barbers_registries_ibfk_1` FOREIGN KEY (`baber_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `barbers_registries_ibfk_2` FOREIGN KEY (`shop_id`) REFERENCES `barber_shops` (`id`);

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`status`) REFERENCES `booking_status` (`id`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `bookings_ibfk_3` FOREIGN KEY (`baber_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `bookings_ibfk_4` FOREIGN KEY (`services_id`) REFERENCES `services` (`id`),
  ADD CONSTRAINT `bookings_ibfk_5` FOREIGN KEY (`venue`) REFERENCES `barber_shops` (`id`);

--
-- Constraints for table `customer_reviews`
--
ALTER TABLE `customer_reviews`
  ADD CONSTRAINT `customer_reviews_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `customer_reviews_ibfk_2` FOREIGN KEY (`baber_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `customer_reviews_ibfk_3` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`id`) REFERENCES `bookings` (`id`),
  ADD CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`status`) REFERENCES `notification_status` (`id`),
  ADD CONSTRAINT `notifications_ibfk_3` FOREIGN KEY (`type`) REFERENCES `notification_types` (`id`);

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `barber_shops` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role`) REFERENCES `user_type` (`id`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`status`) REFERENCES `user_status` (`id`);
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;