-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 24, 2024 at 05:48 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `web_cybersecurity`
--

-- --------------------------------------------------------

--
-- Table structure for table `file_scans`
--

CREATE TABLE `file_scans` (
  `id` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `analysis_id` varchar(255) NOT NULL,
  `status` enum('queued','completed','failed') DEFAULT 'queued',
  `malicious_engines` int(11) DEFAULT 0,
  `total_engines` int(11) DEFAULT 0,
  `scan_results` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`scan_results`)),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `file_scans`
--

INSERT INTO `file_scans` (`id`, `file_name`, `file_path`, `analysis_id`, `status`, `malicious_engines`, `total_engines`, `scan_results`, `created_at`, `updated_at`, `user_id`) VALUES
(1, 'config(1).php', 'uploads/config(1).php', 'M2RmMGVkNzMxZGEzNGUzMzczY2I3OTg3ZDZiMDY2NmY6MTczMjQ2Mjk5OQ==', 'completed', 0, 0, NULL, '2024-11-24 15:55:29', '2024-11-24 16:41:48', 1),
(2, 'u947225733_trading_invest.sql', 'uploads/u947225733_trading_invest.sql', 'NjIzMmExNWZmMzFiNDUwY2QxYjRhMTM1OWQzOWM1Yjk6MTczMjQ2NDIzNg==', 'completed', 0, 0, NULL, '2024-11-24 16:03:56', '2024-11-24 16:24:57', 1),
(3, 'natifgle_nfts(1).sql', 'uploads/natifgle_nfts(1).sql', 'YTU2MDY3MjdjNDk5MzVjMzU1NGQ3ZWQxZjZhZDgyNDE6MTczMjQ2NTAwMQ==', 'completed', 0, 0, NULL, '2024-11-24 16:16:41', '2024-11-24 16:21:43', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_admin` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `created_at`, `is_admin`) VALUES
(1, 'kaywhytee', 'kaywhytee232@gmail.com', '$2y$10$BZpLh5ATr3yWHgTnn6OiZuw705ttL34f4DEkxgCpy1wQB0fZ3MXEC', '2024-11-24 11:23:21', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `file_scans`
--
ALTER TABLE `file_scans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `file_scans`
--
ALTER TABLE `file_scans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
