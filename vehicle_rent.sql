-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 09, 2022 at 09:16 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vehicle_rent`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'Car', '2022-02-02 10:29:06', '2022-02-02 04:29:02'),
(2, 'Bike', '2022-02-02 10:29:20', '2022-02-02 04:29:16');

-- --------------------------------------------------------

--
-- Table structure for table `histories`
--

CREATE TABLE `histories` (
  `id` int(11) NOT NULL,
  `rentStartDate` date NOT NULL,
  `rentEndDate` date NOT NULL,
  `prepayment` int(11) NOT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `histories`
--

INSERT INTO `histories` (`id`, `rentStartDate`, `rentEndDate`, `prepayment`, `vehicle_id`, `user_id`, `createdAt`, `updatedAt`) VALUES
(1, '2022-02-02', '2022-02-04', 0, 4, 2, '2022-02-02 10:06:36', '2022-02-03 10:13:55'),
(2, '2022-02-02', '2022-02-04', 0, 4, 3, '2022-02-03 10:13:07', '2022-02-03 10:13:55'),
(3, '2022-02-03', '2022-02-05', 0, 4, 3, '2022-02-03 10:13:07', '2022-02-03 10:13:55'),
(4, '2022-02-02', '2022-02-04', 0, 2, 2, '2022-02-03 10:15:20', '2022-02-03 04:15:06');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `email` varchar(80) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `createdAt`, `updatedAt`) VALUES
(2, 'Guest 1', 'guest1@mail.com', '2022-02-02 10:22:40', '2022-02-03 02:06:18'),
(3, 'Guest 2', 'guest2@mail.com', '2022-02-02 10:22:54', '2022-02-02 04:22:45');

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `image` text DEFAULT NULL,
  `price` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`id`, `name`, `image`, `price`, `qty`, `category_id`, `createdAt`, `updatedAt`) VALUES
(1, 'Toyota Alphard', NULL, 150000, 20, 1, '2022-02-02 10:05:39', '2022-02-08 10:34:45'),
(2, 'Datsun Go+', NULL, 150000, 2, 1, '2022-02-02 10:30:01', '2022-02-08 10:34:45'),
(3, 'Brompton', NULL, 80000, 2, 2, '2022-02-02 10:30:49', '2022-02-08 10:34:45'),
(4, 'Toyota Vellfire', NULL, 180000, 6, 1, '2022-03-02 10:07:31', '2022-02-08 10:34:45'),
(5, 'Egg', 'uploads/egg-1644293086824-699112319.jpg', 150000, 40, 2, '2022-02-08 11:04:46', '2022-02-09 14:58:44'),
(6, 'Egg Bike', 'uploads/egg-1644293118168-436001530.jpg', 150000, 5, 2, '2022-02-08 11:05:18', NULL),
(7, 'Egg Bike', 'uploads/egg-1644293716155-725996611.jpg', 150000, 5, 2, '2022-02-08 11:15:16', NULL),
(8, 'Egg Bike', 'uploads/egg-1644293799336-608278001.jpg', 150000, 5, 2, '2022-02-08 11:16:39', NULL),
(9, 'Egg Bike', NULL, 150000, 5, 2, '2022-02-08 11:19:35', NULL),
(10, 'Egg Bike', NULL, 150000, 5, 2, '2022-02-08 11:21:18', NULL),
(11, 'Egg Bike', NULL, 150000, 5, 2, '2022-02-08 11:21:40', NULL),
(12, 'Egg Bike', 'uploads/egg-1644294126469-100917811.jpg', 150000, 5, 2, '2022-02-08 11:22:06', NULL),
(13, 'Egg Bike', 'uploads/L10 - Sorting-1644294195589-694198282.pdf', 150000, 5, 2, '2022-02-08 11:23:15', NULL),
(14, 'Egg Bike', 'uploads/L10 - Sorting-1644294289418-408721835.pdf', 150000, 5, 2, '2022-02-08 11:24:49', NULL),
(15, 'Egg Bike', 'uploads/egg-1644295046795-98482441.jpg', 150000, 5, 2, '2022-02-08 11:37:26', NULL),
(16, 'Egg Bike', 'uploads/Fresh-eggs-in-a-dish-transparent-PNG-1644296134499-535372533.png', 150000, 5, 2, '2022-02-08 11:55:34', NULL),
(17, 'Egg Bike', 'uploads/anim_egg-1644296142951-877810931.gif', 150000, 5, 2, '2022-02-08 11:55:42', NULL),
(18, 'Egg Bike', 'uploads/egg-1644296150696-240025202.jpg', 150000, 5, 2, '2022-02-08 11:55:50', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `histories`
--
ALTER TABLE `histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vehicle_id` (`vehicle_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `histories`
--
ALTER TABLE `histories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `histories`
--
ALTER TABLE `histories`
  ADD CONSTRAINT `histories_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `histories_ibfk_2` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD CONSTRAINT `vehicles_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
