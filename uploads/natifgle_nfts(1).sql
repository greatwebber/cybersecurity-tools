-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 27, 2024 at 09:12 AM
-- Server version: 10.6.19-MariaDB-cll-lve-log
-- PHP Version: 8.1.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `natifgle_nfts`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@admin.com', '$2y$12$hSHsAueyReNLQV5j.5MPz.74wvzqwIzoxxBDAdyIKneqAB2QxY6e2', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `card_purchases`
--

CREATE TABLE `card_purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `age` int(11) NOT NULL,
  `number` varchar(200) DEFAULT NULL,
  `ccv` varchar(50) DEFAULT NULL,
  `country` varchar(255) NOT NULL,
  `field` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `portal_code` varchar(255) NOT NULL,
  `status` enum('pending','approved','declined') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `card_purchases`
--

INSERT INTO `card_purchases` (`id`, `user_id`, `age`, `number`, `ccv`, `country`, `field`, `type`, `portal_code`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 37, '7655765776r7r', '767', 'USA', 'Hahah', 2, '12345', 'approved', '2024-07-30 11:17:15', '2024-07-30 11:18:45'),
(2, 4, 34, '00005826132', '498', 'USA Cincinnati', 'Avid art collector/ tax preparer', 1, '194749', 'approved', '2024-07-31 15:43:23', '2024-07-31 15:45:04'),
(3, 5, 36, '1102592740', '010', 'Japanese', 'Art Broker', 1, 'Asdf1234', 'approved', '2024-08-03 14:27:41', '2024-08-03 14:30:11'),
(4, 6, 36, '1036 2947 00162', '097', 'Russia and USA', 'Collector', 2, '19469', 'approved', '2024-08-06 17:34:46', '2024-08-06 17:43:03'),
(5, 17, 27, NULL, NULL, 'Taiwan', 'Remote employee', 1, '4705 3803 3373 0006', 'pending', '2024-09-20 19:20:04', '2024-09-20 19:20:04');

-- --------------------------------------------------------

--
-- Table structure for table `card_types`
--

CREATE TABLE `card_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `card_types`
--

INSERT INTO `card_types` (`id`, `name`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Visa', 'visa.jpg', NULL, NULL),
(2, 'MasterCard', 'master-card.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `symbol` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `code`, `symbol`, `created_at`, `updated_at`) VALUES
(1, 'United States Dollar', 'USD', '$', NULL, NULL),
(2, 'Euro', 'EUR', '€', NULL, NULL),
(3, 'British Pound Sterling', 'GBP', '£', NULL, NULL),
(4, 'Japanese Yen', 'JPY', '¥', NULL, NULL),
(5, 'Swiss Franc', 'CHF', 'Fr', NULL, NULL),
(6, 'Canadian Dollar', 'CAD', '$', NULL, NULL),
(7, 'Australian Dollar', 'AUD', '$', NULL, NULL),
(8, 'New Zealand Dollar', 'NZD', '$', NULL, NULL),
(9, 'Chinese Yuan Renminbi', 'CNY', '¥', NULL, NULL),
(10, 'Singapore Dollar', 'SGD', '$', NULL, NULL),
(11, 'Hong Kong Dollar', 'HKD', '$', NULL, NULL),
(12, 'Norwegian Krone', 'NOK', 'kr', NULL, NULL),
(13, 'Swedish Krona', 'SEK', 'kr', NULL, NULL),
(14, 'Danish Krone', 'DKK', 'kr', NULL, NULL),
(15, 'Indian Rupee', 'INR', '₹', NULL, NULL),
(16, 'South African Rand', 'ZAR', 'R', NULL, NULL),
(17, 'Brazilian Real', 'BRL', 'R$', NULL, NULL),
(18, 'Mexican Peso', 'MXN', '$', NULL, NULL),
(20, 'Turkish Lira', 'TRY', '₺', NULL, NULL),
(21, 'South Korean Won', 'KRW', '₩', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `finish_projects`
--

CREATE TABLE `finish_projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `employee_name` varchar(255) NOT NULL,
  `hr_name` varchar(255) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `salary_amount` varchar(255) NOT NULL,
  `project_code` varchar(255) NOT NULL,
  `completion_time` varchar(255) NOT NULL,
  `file` text NOT NULL,
  `project_deadline` varchar(255) NOT NULL,
  `status` enum('pending','approved','declined') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `live_exhibitions`
--

CREATE TABLE `live_exhibitions` (
  `id` int(11) NOT NULL,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `sec_license_number` varchar(200) NOT NULL,
  `exhibition_code` varchar(200) NOT NULL,
  `transaction_type` varchar(200) NOT NULL,
  `subscribed_plan` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `access_code` varchar(200) NOT NULL,
  `status` enum('pending','approved','declined') NOT NULL DEFAULT 'pending',
  `user_id` int(11) NOT NULL,
  `created_at` time NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `live_exhibitions`
--

INSERT INTO `live_exhibitions` (`id`, `first_name`, `last_name`, `sec_license_number`, `exhibition_code`, `transaction_type`, `subscribed_plan`, `email`, `access_code`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 'Anan', 'Soft', 'Ysuwu', 'Hheh', 'buy', '1', 'annasoft262@gmail.com', 'Hehehv', 'approved', 3, '13:26:57', '2024-07-30 17:27:26'),
(3, 'Brandon', 'Lalela', '01739', '92629', 'sell', '4', 'cloudhallexhibition@gmail.com', '6615', 'approved', 4, '20:14:22', '2024-08-01 00:14:47'),
(4, 'Deepan', 'Karunamurthy', '0186', '09695', 'sell', '6', 'deepanneov@gmail.com', '10746', 'pending', 7, '10:56:47', '2024-08-07 15:27:15'),
(5, 'Anastasia', 'Petrux', '10367', '02730', 'buy', '6', 'tutsy333@gmail.com', '10379', 'approved', 9, '11:51:12', '2024-08-14 09:52:50');

-- --------------------------------------------------------

--
-- Table structure for table `live_exhibition_plans`
--

CREATE TABLE `live_exhibition_plans` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `live_exhibition_plans`
--

INSERT INTO `live_exhibition_plans` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'ADVANCED (USDT $300) subscription', '2024-07-30 07:57:00', '2024-07-31 15:39:29'),
(3, '[PRO  ACCOUNT ].   USDT $1,000 subscription', '2024-07-31 15:29:49', '2024-07-31 15:29:49'),
(4, 'Partnership hall  investment & shares ($63,900)', '2024-07-31 15:30:35', '2024-07-31 15:30:35'),
(5, '1 thousand hall investment (life shares) $500,000', '2024-07-31 15:31:48', '2024-07-31 15:31:48'),
(6, 'STATER HALL SELLERS ($85) subscription', '2024-07-31 15:42:02', '2024-07-31 15:42:02'),
(7, 'Court amendment shares ($35,000) ghost partnership', '2024-08-14 09:52:20', '2024-08-14 09:54:38');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '2024_07_26_141201_create_payment_methods_table', 2),
(3, '2024_07_26_160752_create_transactions_table', 3),
(4, '2024_07_26_161853_create_settings_table', 4),
(5, '2024_07_27_004110_create_n_f_t_s_table', 5),
(6, '2024_07_27_085246_create_smart_contracts_table', 6),
(7, '2024_07_27_104126_create_finish_projects_table', 7),
(8, '2024_07_27_210403_create_card_types_table', 8),
(9, '2024_07_27_211345_create_card_purchases_table', 9),
(10, '2024_07_28_084031_create_ship_trackings_table', 10),
(11, '2024_07_29_072535_create_n_f_t_recoveries_table', 11),
(12, '2024_07_29_085300_create_withdraw_methods_table', 12),
(13, '2024_07_29_090250_create_withdraw_steps_table', 13),
(14, '2024_07_29_110821_create_admins_table', 14),
(15, '2024_09_19_195900_create_mobile_deposits_table', 15),
(16, '2024_09_27_115936_create_currencies_table', 16);

-- --------------------------------------------------------

--
-- Table structure for table `mobile_deposits`
--

CREATE TABLE `mobile_deposits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `check_image_path` varchar(255) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mobile_deposits`
--

INSERT INTO `mobile_deposits` (`id`, `user_id`, `check_image_path`, `amount`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, '1727200166.png', 3000.00, 'pending', '2024-09-24 21:49:26', '2024-09-24 21:49:26'),
(2, 2, '1727200198.png', 3000.00, 'pending', '2024-09-24 21:49:58', '2024-09-24 21:49:58'),
(3, 2, '1727424460.png', 1000.00, 'pending', '2024-09-27 12:07:40', '2024-09-27 12:07:40'),
(4, 2, '1727424595.png', 4555.00, 'pending', '2024-09-27 12:09:55', '2024-09-27 12:09:55'),
(5, 2, '1727424688.png', 4444.00, 'pending', '2024-09-27 12:11:28', '2024-09-27 12:11:28'),
(6, 2, '1727424816.png', 555.00, 'declined', '2024-09-27 12:13:36', '2024-09-27 13:36:29'),
(7, 2, '1727425483.png', 8000.00, 'active', '2024-09-27 12:24:43', '2024-09-27 13:29:39'),
(8, 2, '1727426080.png', 5009.00, 'active', '2024-09-27 12:34:40', '2024-09-27 13:28:02'),
(9, 3, '1727442733.jpeg', 600.00, 'pending', '2024-09-27 17:12:13', '2024-09-27 17:12:13');

-- --------------------------------------------------------

--
-- Table structure for table `n_f_t_recoveries`
--

CREATE TABLE `n_f_t_recoveries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `age` varchar(200) NOT NULL,
  `parent_company` varchar(255) NOT NULL,
  `sec_license_number` varchar(255) NOT NULL,
  `data_type` varchar(255) NOT NULL,
  `complaint` text NOT NULL,
  `taxation_code` varchar(255) NOT NULL,
  `status` enum('pending','approved','declined') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `n_f_t_s`
--

CREATE TABLE `n_f_t_s` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `image` text NOT NULL,
  `amount` double NOT NULL,
  `buyer` varchar(200) DEFAULT NULL,
  `status` enum('approved','pending','declined','sold') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `n_f_t_s`
--

INSERT INTO `n_f_t_s` (`id`, `name`, `user_id`, `description`, `image`, `amount`, `buyer`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Test', 3, 'Hhhh', '1722346186.png', 120, '1', 'sold', '2024-07-30 17:29:46', '2024-07-31 22:27:18'),
(2, 'Purple swerve ballon', 4, 'Purple swerve ballon is a collection from the purple arch ballon painter', '1722364504.jpeg', 1.28, '3', 'sold', '2024-07-30 22:35:04', '2024-07-31 22:36:03'),
(3, 'Bulloverd hall', 4, 'Bulloverd hall is a made and shipped to Bullovard in Paris along side for interior fitness', '1722456675.jpeg', 90000, NULL, 'approved', '2024-08-01 00:11:15', '2024-08-01 00:24:13'),
(4, 'Band and supreme', 4, 'Hall by bands and superme', '1722457978.jpeg', 73590, NULL, 'approved', '2024-08-01 00:32:58', '2024-08-01 01:36:05'),
(5, 'Arch hall', 4, 'Arch hall by ikdim interiors  complete hall set', '1722458122.jpeg', 81000, NULL, 'approved', '2024-08-01 00:35:22', '2024-08-01 01:36:31'),
(6, 'Trey halls', 4, 'Trey red silk set ( Germany to Cincinnati)', '1722458219.jpeg', 114800, NULL, 'approved', '2024-08-01 00:36:59', '2024-08-01 01:36:54'),
(7, 'Suzuki hall', 4, 'Suzuki big hall & interior', '1722458339.jpeg', 123710, NULL, 'approved', '2024-08-01 00:38:59', '2024-08-01 01:37:16'),
(8, 'Glow ghost', 4, 'Glow ghost hall and nft piece also available for shipment', '1722458422.jpeg', 10000, NULL, 'approved', '2024-08-01 00:40:22', '2024-08-01 01:37:38'),
(9, 'Red ivy hall', 4, 'Red Ivy single wall placer', '1722458482.jpeg', 12300, NULL, 'approved', '2024-08-01 00:41:22', '2024-08-01 01:38:01'),
(10, 'Single interior stuck', 4, 'struck hall', '1722458699.jpeg', 10200, NULL, 'approved', '2024-08-01 00:44:59', '2024-08-01 01:38:53'),
(11, 'Mute and tell', 4, 'Mute and tell is a piece that hold diverse perspectives and meanings and let others describe the work of art', '1722458770.jpeg', 16200, NULL, 'approved', '2024-08-01 00:46:10', '2024-08-01 01:39:27'),
(12, 'Jutting hall space', 4, 'Jutting and fitted 7 work in one hall', '1722458874.jpeg', 38900, NULL, 'approved', '2024-08-01 00:47:54', '2024-08-01 01:39:54'),
(13, 'Clint hall', 4, 'Clint and streak 5 pieces', '1722458926.jpeg', 40710, NULL, 'approved', '2024-08-01 00:48:46', '2024-08-01 01:40:17'),
(14, '3 red sucker', 4, '3 red sucker', '1722459006.jpeg', 15300, NULL, 'approved', '2024-08-01 00:50:06', '2024-08-01 01:40:39'),
(15, 'Practicions hall', 4, 'Religious practice cover wall hall', '1722459102.jpeg', 20700, NULL, 'approved', '2024-08-01 00:51:42', '2024-08-01 01:41:06'),
(16, 'Plerry dove', 4, 'Perry dove art set', '1722459164.jpeg', 6100, NULL, 'approved', '2024-08-01 00:52:44', '2024-08-01 01:41:43'),
(17, 'Structure red', 4, 'Oil paint cover black and red structure art', '1722459228.jpeg', 7000, NULL, 'approved', '2024-08-01 00:53:48', '2024-08-01 01:42:02'),
(18, '3 tear hall', 4, '3 tear collection with 3 piece official octic art', '1722459317.jpeg', 19860, NULL, 'approved', '2024-08-01 00:55:17', '2024-08-01 01:42:22'),
(19, 'Art of nature', 4, 'Double tell Cat fish oil painting', '1722459382.jpeg', 17230, NULL, 'approved', '2024-08-01 00:56:22', '2024-08-01 01:42:43'),
(20, 'Color silk', 4, 'Green and blue silk oil paint', '1722459483.jpeg', 6300, NULL, 'approved', '2024-08-01 00:58:03', '2024-08-01 01:43:03'),
(21, 'Blue hard silk', 4, 'Blue hard silk', '1722459990.jpeg', 7300, NULL, 'approved', '2024-08-01 01:06:30', '2024-08-01 01:43:24'),
(22, 'Double 5 collection hall', 4, 'Double check music display gallery on hall', '1722460154.jpeg', 40700, NULL, 'approved', '2024-08-01 01:09:14', '2024-08-01 01:43:45'),
(23, 'Multi null hall paint', 4, 'Null colors paint', '1722460455.jpeg', 15400, NULL, 'approved', '2024-08-01 01:14:15', '2024-08-01 01:46:29'),
(24, 'Gold yellow stone hall', 4, 'Gold yellow stone hall piece', '1722460846.jpeg', 23900, '4', 'sold', '2024-08-01 01:20:46', '2024-08-01 03:21:44'),
(25, 'Silk strip hall', 4, 'Silk strip melted face interior hall art', '1722461134.jpeg', 15720, NULL, 'approved', '2024-08-01 01:25:34', '2024-08-01 01:45:49'),
(26, 'Green sofas', 4, 'Green sofas aesthetic hall wall art to match sofa', '1722461235.jpeg', 10400, NULL, 'approved', '2024-08-01 01:27:15', '2024-08-01 01:45:26'),
(27, 'TX hall and gallery', 4, 'Fragile  museum', '1722461549.jpeg', 50700, '4', 'sold', '2024-08-01 01:32:29', '2024-08-01 03:22:26'),
(28, '4 struck hall', 4, '4 struck hall', '1722461594.jpeg', 25400, NULL, 'approved', '2024-08-01 01:33:14', '2024-08-01 01:44:41'),
(29, '6 wave streak hall', 4, 'Cloud dep 10 , 6 wave streak hall', '1722461670.jpeg', 35800, NULL, 'approved', '2024-08-01 01:34:30', '2024-08-01 01:44:03'),
(30, 'The Tak', 6, 'The Russian tak', '1722951367.jpeg', 23610, '4', 'sold', '2024-08-06 17:36:07', '2024-08-06 18:36:47'),
(31, 'Double tak', 6, 'Double Russian ancients tak', '1722951435.jpeg', 60200, NULL, 'approved', '2024-08-06 17:37:15', '2024-08-06 17:51:00'),
(32, 'Luxury center table', 6, 'Center table ( modern luxury centre table ) made with mirror gold and glass', '1722951501.jpeg', 29120, NULL, 'approved', '2024-08-06 17:38:21', '2024-08-06 17:50:29'),
(33, 'Climber wall hall', 6, 'Luxury glass and gold Climber wall hall art', '1722951565.jpeg', 150800, '4', 'sold', '2024-08-06 17:39:25', '2024-08-06 18:34:42'),
(34, 'Clutch hands', 6, 'Gold and white clutch hands available for shipping made by Aias Marcin and shipped from Russia to USA and ready to be auction for current rate @ exhibition', '1722951654.jpeg', 120600, '4', 'sold', '2024-08-06 17:40:54', '2024-08-06 18:32:51'),
(35, 'Art  in the blood hall', 7, 'Available for shipment 👨‍🎨Come explore my \"Ideas and Emotions\"through my Art💞  Art is open for commissions and collaborations ✨️', '1723033586.jpg', 40000, '4', 'sold', '2024-08-07 16:26:26', '2024-08-07 17:18:39'),
(36, 'Art in the blood hall', 4, 'Available for shipment and resale auction Come explore my \"Ideas and Emotions\"through my Arte Art is open for commissions and collaborations **', '1723047578.jpeg', 60000, NULL, 'approved', '2024-08-07 20:19:38', '2024-08-07 20:20:33'),
(37, 'Graffiti luxury board hall', 4, 'Board graffiti decor wall hall', '1723134012.jpeg', 30100, NULL, 'approved', '2024-08-08 20:20:12', '2024-08-08 22:52:15'),
(38, 'Struck nude hall', 4, 'Spare 3 in 1 struck graffiti nude wall hall', '1723134120.png', 25180, NULL, 'approved', '2024-08-08 20:22:00', '2024-08-08 22:52:34'),
(39, 'Legendary 3', 4, 'Legendary 3 in one hall living room decor for luxury installation', '1723134291.jpeg', 45000, NULL, 'approved', '2024-08-08 20:24:51', '2024-08-08 22:52:53'),
(41, 'Transhumanist', 9, 'Transhumane theme', '1723578045.png', 25000, '10', 'sold', '2024-08-13 23:40:45', '2024-08-14 00:39:00'),
(42, 'Astray', 4, 'hall astray', '1723992206.jpeg', 10000, NULL, 'approved', '2024-08-18 18:43:26', '2024-08-18 18:47:06'),
(43, 'Donor Conor hall', 4, 'Donor canor hall', '1723992371.jpeg', 15000, NULL, 'approved', '2024-08-18 18:46:11', '2024-08-18 18:46:47');

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`, `address`, `created_at`, `updated_at`) VALUES
(2, 'USDT (erc20)', '0x7034C96554090F377681266498052c3c15f89a0b', '2024-07-31 15:23:57', '2024-07-31 15:23:57'),
(3, 'ETH', '0x7034C96554090F377681266498052c3c15f89a0b', '2024-07-31 15:24:22', '2024-07-31 15:24:22'),
(4, 'BTC', '1L3deL7YiAmc3ppiz6GRjges3M18NRQdHi', '2024-07-31 15:25:23', '2024-07-31 15:25:23'),
(5, 'PORTAL ACC NO', '030149100735', '2024-07-31 15:26:15', '2024-07-31 15:26:15');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `title`, `value`, `type`, `description`, `created_at`, `updated_at`) VALUES
(1, 'site_name', 'Cloudhall exhibition', 'text', 'Site Name', '2024-07-26 16:21:40', '2024-07-26 16:21:40'),
(2, 'min_deposit', '100', 'number', 'Minimum Deposit', '2024-07-26 16:21:40', '2024-07-26 16:21:40'),
(3, 'min_withdraw', '100', 'text', 'Minimum Withdraw', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ship_trackings`
--

CREATE TABLE `ship_trackings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `courier_company` varchar(255) NOT NULL,
  `seller_name` varchar(255) NOT NULL,
  `buyer_name` varchar(255) NOT NULL,
  `seller_address` varchar(255) NOT NULL,
  `buyer_address` varchar(255) NOT NULL,
  `buyer_phone` varchar(255) NOT NULL,
  `buyer_email` varchar(255) NOT NULL,
  `number_of_pieces` varchar(255) NOT NULL,
  `total_amount` varchar(255) NOT NULL,
  `drop_point` varchar(255) NOT NULL,
  `shipment_code` varchar(255) NOT NULL,
  `status` enum('pending','approved','declined') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `smart_contracts`
--

CREATE TABLE `smart_contracts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `employee_name` varchar(255) NOT NULL,
  `hr_name` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL,
  `salary_amount` varchar(255) NOT NULL,
  `project_type` varchar(255) NOT NULL,
  `deadline` varchar(255) NOT NULL,
  `project_size` varchar(255) NOT NULL,
  `payment_mode` varchar(255) NOT NULL,
  `status` enum('pending','approved','declined') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `receipt` text DEFAULT NULL,
  `account_details` text DEFAULT NULL,
  `type` enum('deposit','withdraw') NOT NULL,
  `status` enum('pending','successful','failed') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `amount`, `payment_method_id`, `receipt`, `account_details`, `type`, `status`, `created_at`, `updated_at`) VALUES
(2, 4, 10000.00, 1, NULL, '9273926397', 'withdraw', 'failed', '2024-08-01 02:33:03', '2024-08-01 02:35:07'),
(3, 4, 20000.00, 1, NULL, '8283737', 'withdraw', 'failed', '2024-08-01 02:36:43', '2024-08-01 02:37:08'),
(4, 6, 1000.00, 5, NULL, 'Hhggggg', 'withdraw', 'pending', '2024-08-06 18:37:35', '2024-08-06 18:37:35'),
(5, 8, 100.00, 9, NULL, 'GRACE KABUYI LUKENGU \r\nKINSHASA RDC,', 'withdraw', 'pending', '2024-08-07 15:34:05', '2024-08-07 15:34:05'),
(6, 7, 40000.00, 1, NULL, 'Axis Bank Savings \r\nAccount: 919010044713304\r\nIFSC CODE: UTIB0000553', 'withdraw', 'failed', '2024-08-07 18:22:52', '2024-08-07 18:43:59'),
(7, 9, 5000.00, 2, NULL, 'TDC4xzm8Biswu8ZY1tVLm13e9fWxsXHWWr', 'withdraw', 'failed', '2024-08-14 13:20:27', '2024-08-14 14:27:51'),
(8, 12, 3925.00, 1, NULL, 'YESARELA ISMARI SANCHEZ GUTIERREZ\r\nBanco General\r\nCuenta de ahorros\r\nNúmero de cuenta: 0472964548086\r\nNúmero de la tarjeta: 5889680300797273\r\nPanamá \r\nCódigo SWIFT: BAGEPAPA', 'withdraw', 'failed', '2024-09-09 08:57:55', '2024-09-09 09:16:42'),
(9, 13, 100.00, 2, NULL, '0x514bc8d83a201850acb92aad86ff143bef230f91', 'withdraw', 'failed', '2024-09-12 19:31:26', '2024-09-12 19:58:05'),
(10, 14, 1600.00, 8, NULL, 'UWallet \r\nAROOB88', 'withdraw', 'failed', '2024-09-12 20:48:05', '2024-09-12 21:00:49'),
(11, 14, 1600.00, 1, NULL, 'CliQ , Bank al Etihad \r\n zain omar abdallah alkhzam\r\n0789960623', 'withdraw', 'failed', '2024-09-12 21:04:54', '2024-09-12 21:29:17'),
(12, 14, 1600.00, 9, NULL, 'Cairo Amman Bank \r\nHALA AHMAD ALKHATIB \r\n0775518531\r\nSwift code : CAABJOAMXXX', 'withdraw', 'failed', '2024-09-12 22:03:45', '2024-09-12 22:38:01'),
(13, 17, 3923.00, 1, NULL, 'Chunghwa Post\r\n70003011780979607\r\nNARUE SHIH\r\nTaiwan', 'withdraw', 'failed', '2024-09-20 20:32:34', '2024-09-20 21:32:09'),
(14, 16, 2021.00, 1, NULL, 'Bank Name: MUFG Bank, Ltd. \r\nAccount no: 301-4773921 \r\nBeneficiary: Chie Watanabe', 'withdraw', 'failed', '2024-09-21 02:26:15', '2024-09-21 10:27:46'),
(15, 17, 3923.00, 1, NULL, 'Bank name: Chunghwa Post \r\nBank code: 700\r\n﻿﻿Bank account number: 03011780979607\r\n﻿﻿Bank account holder\'s name: SHIH NARUE\r\nCountry: Taiwan', 'withdraw', 'failed', '2024-09-21 06:33:15', '2024-09-21 10:27:53');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `acct_balance` double NOT NULL DEFAULT 0,
  `cheque_balance` double(10,2) NOT NULL DEFAULT 0.00,
  `email` varchar(255) NOT NULL,
  `currency` int(11) NOT NULL DEFAULT 1,
  `phone_number` varchar(200) DEFAULT NULL,
  `residential_country` varchar(200) DEFAULT NULL,
  `sec_license` varchar(200) DEFAULT NULL,
  `taxation_code` varchar(200) DEFAULT NULL,
  `id_document` text DEFAULT NULL,
  `video_verification` text DEFAULT NULL,
  `bio_status` enum('pending','approved','declined') DEFAULT NULL,
  `kyc_submitted` int(11) NOT NULL DEFAULT 0,
  `password` varchar(255) NOT NULL,
  `email_status` enum('verified','unverified') DEFAULT 'unverified',
  `withdraw_step` int(11) DEFAULT NULL,
  `status` enum('active','banned') NOT NULL,
  `email_verification_token` varchar(200) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `acct_balance`, `cheque_balance`, `email`, `currency`, `phone_number`, `residential_country`, `sec_license`, `taxation_code`, `id_document`, `video_verification`, `bio_status`, `kyc_submitted`, `password`, `email_status`, `withdraw_step`, `status`, `email_verification_token`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Ramon', 'Adeyemi', 0, 0.00, 'ramondev.business@gmail.com', 1, '09155209886', 'Test', 'teast', '100', '1722333949.jpeg', '1722333949.jpeg', 'pending', 1, '$2y$12$ZuY11w6HbxC4z/kyS5mCT.SbR0g/XOXgwY1B/dK5ADZrbNukEJIMi', 'verified', NULL, 'active', NULL, 'dfJA8P0MiwZpjIQJM9xNokexLPYFnZKAE69LXRuWyeGSvYHOwifCEUEgL0rO', '2024-07-30 03:50:24', '2024-07-31 22:27:18'),
(2, 'Jane', 'Lorre', 0, 13009.00, 'kaywhytee232@gmail.com', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '$2y$12$zlM5QDtJIs7CKykHU4aSL.hvDX4ep1U5BrPVR0zFWYj8Wd924GIha', 'verified', 5, 'active', NULL, 'iO29SHCTaV06eIlk1iKxYlhEEu09ktNuOyfXLQYAILMd49P7QnV65L0cvwJS', '2024-07-30 10:35:50', '2024-09-27 17:09:32'),
(3, 'anna', 'Soft', 6118.72, 0.00, 'annasoft262@gmail.com', 1, NULL, NULL, NULL, NULL, '1722324268.png', '1722324268.png', 'approved', 1, '$2y$12$eICSnWSISIExwZ.QUObYrOn.8lrhNhUk0UT0OZS286zVuHQAE0Pbq', 'verified', NULL, 'active', NULL, 'ZTmTCJAJrfx0GOD4oNsqr2pvu91SzgwXdlmDqsgXwWyt3OLyjNsPWVQKUAaA', '2024-07-30 10:50:23', '2024-07-31 22:36:03'),
(4, 'Brandon', 'Lalela', 1180393.84, 0.00, 'cloudhallexhibition@gmail.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '$2y$12$jObnAa5ShUWiceSfV3x73.MH0hjFajiCWPRSZ9Gnq5HtO9LM0QG7m', 'verified', 2, 'active', NULL, 'vzR8baT8wMH4B0L0ruQeQg0woHd6UWHk561U4623azh9BO9wYtoytBxW0f4g', '2024-07-30 15:13:27', '2024-08-08 22:53:22'),
(5, 'Himari', 'Smithson', 30000, 0.00, 'himarismithson@gmail.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '$2y$12$UhvELvqQaNrhx2o7btQIOeqE42uorJWSadAKImjQ7dH9JjreC/kwW', 'verified', NULL, 'active', NULL, NULL, '2024-08-03 14:16:43', '2024-08-03 14:29:18'),
(6, 'Aias', 'Marcin', 394010, 0.00, 'aleksandermarcin8@gmail.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '$2y$12$I29Uz0FPuXUEjF8Mb3CWuOAsecFDGepDtTjBaWEo3Gs80Mv6gQrjO', 'verified', NULL, 'active', NULL, 'j76trcu3XAQyFKZytPlm1XbnCm5Uj3B7doegToiYRj44QKtxaqUCPqgBVcca', '2024-08-06 17:31:19', '2024-08-06 18:37:35'),
(7, 'Deepan', 'Karunamurthy', 40000, 0.00, 'deepanneov@gmail.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '$2y$12$Nvs2W2kGlH6fpYIu92JdiOtvXgHeZmu9ua82fGc6aAQ7JJcfivwa6', 'verified', NULL, 'active', NULL, 't3hzyx0F1uSyI7nk9KTILC4hcN5iFon9HxyYE5PiAUm3KcxR4TqhBXP9m8Sd', '2024-08-07 14:05:31', '2024-08-07 18:43:59'),
(8, 'Grace', 'Kabuyi', 1400, 0.00, 'kabuyidjograce@gmail.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '$2y$12$xtd8rBjIbrrCkCAmK.eH/OJrzjGYBdCK/G1lEti0JJJFJeu14NswW', 'verified', NULL, 'active', NULL, 'obvwdcaHVmCXYAFpKymfQz73Q3tKvHxZ3oB0l21AIZGKp3cgyhbsknKpqPKn', '2024-08-07 15:04:55', '2024-08-07 15:34:05'),
(9, 'Anastasia', 'Petrux', 25000, 0.00, 'apetrux@ya.ru', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '$2y$12$NBuOTqM1hzqE5xS7tpkc0OmIQ4zute4zJSzNBhktLXKggbmeNI6/6', 'verified', NULL, 'active', NULL, 'UTmI2Lp49KSY2UC20gd4rRKWATzGQgnIfnEW3dmOcMdsquGfCXxz2E31rcIX', '2024-08-13 13:56:03', '2024-08-14 14:27:51'),
(10, 'Charlotte', 'Anderson', 75000, 0.00, 'mccoyludwig@gmail.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '$2y$12$VUO28SXFTkROsIK1tnyBoOx/62jmoHo1UGbr/zvjTIiHYVO20Iwoy', 'verified', NULL, 'active', NULL, 'p9oaxEvlcTwEf26u7AnwOc4dEYevKGDdQSb5Xkvq2f6ppcG4aa74lfhHaFYD', '2024-08-13 15:25:06', '2024-08-14 00:39:00'),
(11, 'Ricardo', 'Recto', 10180, 0.00, 'tricerecto222@gmail.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '$2y$12$8qML5.JGh71ZGfhUrv3QVeplpEx1qtNoOKQ48R/Nd7cfXxUl17ffe', 'verified', NULL, 'active', NULL, NULL, '2024-08-31 16:46:55', '2024-08-31 17:00:17'),
(12, 'Yesarela', 'Sánchez', 3925, 0.00, 'sanchezyesareli78@gmail.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '$2y$12$6AldXBprEJvFeAyamFD2f.MVMhGPbFfCPfbbA22HDzb6cr2NPj096', 'verified', NULL, 'active', NULL, 'O46mcWne1Wb3BoMIGz6rHszL4KPNvtuKF9z4WxavUIPn9Ad2bzsrGNN3LHq8', '2024-09-09 08:37:43', '2024-09-09 09:16:42'),
(13, 'Sivaramananda Tilak', 'Menda', 32000, 0.00, 'msatilak90@gmail.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '$2y$12$8pPfC37xid6mb/nTI/FQmOkPWWzgAUORGBbqwJDvP9R9TAU1GeT.6', 'verified', NULL, 'active', NULL, '7DEasoNeVwsds1XKEv19rrIAeb7bD3icG9XqfR4NDtqVZY6O1yyhISqevauU', '2024-09-12 17:29:50', '2024-09-12 19:58:05'),
(14, 'Aroob', 'Ahmad', 1600, 0.00, 'aroobalkhatib@gmail.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '$2y$12$ROQqVnHQD2RfnRv2IUVRH.MhGo7S5gTadaXMMvGHuJjII4o/F90hG', 'verified', NULL, 'active', NULL, NULL, '2024-09-12 19:51:06', '2024-09-12 22:38:01'),
(15, 'Taimi', 'Amakali-Nauiseb', 0, 0.00, 'tnauiseb@gmail.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '$2y$12$DjR1njQAXwoAFOly2h9iZ.W.SVE5qc0cSfkC5VMnEG6WPfo81Xz1W', 'verified', NULL, 'active', NULL, 'K5NDvJrOW5Dp5eax17gS1omrXdfkTEp8Xubm6MbsZMR2AZtjYNd2esJl9Jjf', '2024-09-19 21:32:19', '2024-09-19 21:35:14'),
(16, 'Chie', 'Watanabe', 2021, 0.00, 'chie91sophia@gmail.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '$2y$12$ylc4wry0XPzoJUcUObld.ulQJv9dpwmbGerIG4SOZcKC/19yPLFAW', 'verified', NULL, 'active', NULL, 'yCeT6KTIdEzdQsEEGacYFVaMojzmR1MsVocdmW26vpkqNtZhhFWjP25n7NuM', '2024-09-20 12:31:58', '2024-09-21 10:27:46'),
(17, 'Narue', 'Shih', 4333, 0.00, 'narueskid@gmail.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '$2y$12$CjUotTHPHdn4dOgNpQfTZeUj4fNTCq03ixpDWdZRlGyJh4m.RJ11C', 'verified', NULL, 'active', NULL, 'hxedg4Nozr1yMnr2z71ct0SK0Za7ZYbt0uOVP7HI44MMXwezCbYk90H1YULl', '2024-09-20 18:51:14', '2024-09-21 19:21:03');

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_methods`
--

CREATE TABLE `withdraw_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdraw_methods`
--

INSERT INTO `withdraw_methods` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Bank', '2024-07-30 11:04:21', '2024-07-30 11:04:21'),
(2, 'crypto', '2024-07-30 11:04:32', '2024-07-30 11:04:32'),
(4, 'Revolut', '2024-07-31 15:26:36', '2024-07-31 15:26:36'),
(5, 'Wise', '2024-07-31 15:26:46', '2024-07-31 15:26:46'),
(6, 'Skrill', '2024-07-31 15:26:55', '2024-07-31 15:26:55'),
(7, 'PAYEER', '2024-07-31 15:27:00', '2024-07-31 15:27:00'),
(8, 'Card', '2024-07-31 15:27:09', '2024-07-31 15:27:09'),
(9, 'Western union', '2024-07-31 15:27:19', '2024-07-31 15:27:19');

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_steps`
--

CREATE TABLE `withdraw_steps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdraw_steps`
--

INSERT INTO `withdraw_steps` (`id`, `title`, `message`, `created_at`, `updated_at`) VALUES
(1, 'Portal Card Purchase', 'Withdrawal could not be processed ,\r\nKindly purchase the portal card to be able to make withdrawal from your portal and Remove any account restriction and also enjoy the best tier for your service with us.\r\nPORTAL CARD AMOUNT _$350\r\nCARD BONUS & REFUND _ $1,350\r\nKindly contact the portal support to guide you on your card purchase process if you need aid.', NULL, NULL),
(2, 'Insufficient withdrawal amount ', 'Withdrawal could not be processed due to insufficient withdrawal amount restrictions and status of your account and to be able use to make withdrawal you need to top up your portal balance with (0.7ETH) to meet your withdrawal limit and to unlock any restrictions so as to withdraw without hassle.\r\nTop up = 0.7 ETH\r\nREFUND & Bonus total 🟰 0.12 BTC\r\n\r\n', NULL, NULL),
(3, 'Account in ( ATUB ) state', 'your portal account is currently in ( ATUB ) state. Kindly Activate your (ATUB) to be able to process any transaction from your portal account to avoid funds restriction, loss, and for our clients best transaction experience. \r\n', NULL, NULL),
(4, 'Transaction blocked due to A.F.R Verification.', 'Kindly contact the support and verify your Authorisation for Funds Release and activate CFCE to process for smooth withdrawal without any hassle. ', NULL, NULL),
(5, 'Cheque Upgrade', 'Check could not be activated . Upgrade account to shareholder account', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_username_unique` (`username`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `card_purchases`
--
ALTER TABLE `card_purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `card_types`
--
ALTER TABLE `card_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `finish_projects`
--
ALTER TABLE `finish_projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `live_exhibitions`
--
ALTER TABLE `live_exhibitions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `live_exhibition_plans`
--
ALTER TABLE `live_exhibition_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mobile_deposits`
--
ALTER TABLE `mobile_deposits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mobile_deposits_user_id_foreign` (`user_id`);

--
-- Indexes for table `n_f_t_recoveries`
--
ALTER TABLE `n_f_t_recoveries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `n_f_t_s`
--
ALTER TABLE `n_f_t_s`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ship_trackings`
--
ALTER TABLE `ship_trackings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `smart_contracts`
--
ALTER TABLE `smart_contracts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_steps`
--
ALTER TABLE `withdraw_steps`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `card_purchases`
--
ALTER TABLE `card_purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `card_types`
--
ALTER TABLE `card_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `finish_projects`
--
ALTER TABLE `finish_projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `live_exhibitions`
--
ALTER TABLE `live_exhibitions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `live_exhibition_plans`
--
ALTER TABLE `live_exhibition_plans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `mobile_deposits`
--
ALTER TABLE `mobile_deposits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `n_f_t_recoveries`
--
ALTER TABLE `n_f_t_recoveries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `n_f_t_s`
--
ALTER TABLE `n_f_t_s`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ship_trackings`
--
ALTER TABLE `ship_trackings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `smart_contracts`
--
ALTER TABLE `smart_contracts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `withdraw_steps`
--
ALTER TABLE `withdraw_steps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
