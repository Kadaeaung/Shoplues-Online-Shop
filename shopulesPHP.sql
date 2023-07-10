-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 16, 2020 at 07:42 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.2.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopulesPHP`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `logo` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `logo`, `created_at`, `updated_at`) VALUES
(1, 'Apple', 'logo/438297.jpg', '2020-08-11 02:56:11', '0000-00-00 00:00:00'),
(2, 'Samsung', 'logo/653939.png', '2020-08-11 02:56:25', '0000-00-00 00:00:00'),
(3, 'Yan Yan', 'logo/988688.jpeg', '2020-08-11 03:58:03', '0000-00-00 00:00:00'),
(4, 'Puma', 'logo/479995.png', '2020-08-11 04:05:54', '0000-00-00 00:00:00'),
(5, 'Chanel', 'logo/731805.png', '2020-08-11 04:11:02', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `photo` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `photo`, `created_at`, `updated_at`) VALUES
(1, 'Moblie', 'image/337633.png', '2020-08-11 02:55:24', '0000-00-00 00:00:00'),
(2, 'Picture', 'image/929861.jpeg', '2020-08-11 02:55:49', '0000-00-00 00:00:00'),
(3, 'Electronic', 'image/808970.png', '2020-08-11 03:20:06', '0000-00-00 00:00:00'),
(4, 'Food', 'image/888232.jpg', '2020-08-11 03:56:07', '0000-00-00 00:00:00'),
(5, 'Clothes', 'image/628350.png', '2020-08-11 04:05:34', '0000-00-00 00:00:00'),
(6, 'Accessories', 'image/210136.png', '2020-08-11 04:13:05', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `codeno` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `photo` text COLLATE utf8_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `discount` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `brand_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `codeno`, `name`, `photo`, `price`, `discount`, `description`, `created_at`, `updated_at`, `brand_id`, `subcategory_id`) VALUES
(2, '002', 'Galaxy A6', 'image/547386.jpg', '5000000', '4500000', '720P Resoultion ,4G,Wifi', '2020-08-11 07:34:42', '0000-00-00 00:00:00', 2, 1),
(3, '003', 'LED Lamp', 'image/916452.jpg', '200000', '1500000', 'Sweet and Love', '2020-08-11 07:34:49', '0000-00-00 00:00:00', 2, 3),
(4, '004', 'Double Spciy', 'image/832098.jpg', '3000', '', 'Spicy Spicy', '2020-08-11 08:01:03', '0000-00-00 00:00:00', 3, 4),
(5, '005', 'Spciy Noodles', 'image/522525.jpg', '30000', '', 'Spicy x 1', '2020-08-11 08:01:00', '0000-00-00 00:00:00', 3, 4),
(6, '006', 'Puma T-shirt', 'image/808039.jpg', '500000', '400000', 'Light and Smart', '2020-08-11 07:35:11', '0000-00-00 00:00:00', 4, 5),
(7, '007', 'Chanel Perfume', 'image/679945.jpg', '2000000', '1700000', 'For Her(Love Potion)', '2020-08-11 07:35:22', '0000-00-00 00:00:00', 5, 6);

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `id` int(11) NOT NULL,
  `voucherno` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `qty` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`id`, `voucherno`, `qty`, `created_at`, `updated_at`, `item_id`) VALUES
(1, '1597263145', 1, '2020-08-13 08:12:25', '0000-00-00 00:00:00', 7),
(2, '1597263213', 1, '2020-08-13 08:13:33', '0000-00-00 00:00:00', 7),
(3, '1597263221', 1, '2020-08-13 08:13:41', '0000-00-00 00:00:00', 7),
(4, '1597263298', 1, '2020-08-13 08:14:58', '0000-00-00 00:00:00', 7),
(5, '1597263321', 1, '2020-08-13 08:15:21', '0000-00-00 00:00:00', 7),
(6, '1597263353', 1, '2020-08-13 08:15:53', '0000-00-00 00:00:00', 7),
(7, '1597263414', 1, '2020-08-13 08:16:54', '0000-00-00 00:00:00', 7),
(8, '1597263755', 1, '2020-08-13 08:22:35', '0000-00-00 00:00:00', 7),
(9, '1597264349', 1, '2020-08-13 08:32:29', '0000-00-00 00:00:00', 1),
(10, '1597447861', 1, '2020-08-15 11:31:01', '0000-00-00 00:00:00', 2),
(11, '1597447861', 1, '2020-08-15 11:31:01', '0000-00-00 00:00:00', 3),
(12, '1597449147', 1, '2020-08-15 11:52:27', '0000-00-00 00:00:00', 3),
(13, '1597449193', 1, '2020-08-15 11:53:13', '0000-00-00 00:00:00', 2),
(14, '1597453884', 7, '2020-08-15 13:11:24', '0000-00-00 00:00:00', 3),
(15, '1597453884', 1, '2020-08-15 13:11:24', '0000-00-00 00:00:00', 6),
(16, '1597517272', 1, '2020-08-15 18:47:52', '0000-00-00 00:00:00', 3),
(17, '1597517272', 1, '2020-08-15 18:47:52', '0000-00-00 00:00:00', 2),
(18, '1597517391', 2, '2020-08-15 18:49:51', '0000-00-00 00:00:00', 7),
(19, '1597517391', 1, '2020-08-15 18:49:51', '0000-00-00 00:00:00', 2),
(20, '1597517433', 1, '2020-08-15 18:50:33', '0000-00-00 00:00:00', 6),
(21, '1597517447', 1, '2020-08-15 18:50:47', '0000-00-00 00:00:00', 3),
(22, '1597555351', 1, '2020-08-16 05:22:31', '0000-00-00 00:00:00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `orderdate` date NOT NULL,
  `voucherno` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `total` varchar(225) COLLATE utf8_unicode_ci NOT NULL,
  `note` text COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `orderdate`, `voucherno`, `total`, `note`, `status`, `created_at`, `updated_at`, `user_id`) VALUES
(1, '2020-08-13', '1597263414', '1700000', 'pp', 1, '2020-08-15 12:17:41', '0000-00-00 00:00:00', 2),
(2, '2020-08-13', '1597263755', '1700000', 'ibc', 2, '2020-08-15 12:17:38', '0000-00-00 00:00:00', 2),
(3, '2020-08-13', '1597264349', '12000000', 'cde', 1, '2020-08-15 18:51:28', '0000-00-00 00:00:00', 2),
(4, '2020-08-15', '1597447861', '1500000', 'abc', 0, '2020-08-15 12:17:29', '0000-00-00 00:00:00', 2),
(5, '2020-08-15', '1597449147', '1500000', 'abc', 0, '2020-08-15 12:17:25', '0000-00-00 00:00:00', 2),
(6, '2020-08-15', '1597449193', '4500000', 'abc', 0, '2020-08-15 12:17:22', '0000-00-00 00:00:00', 2),
(7, '2020-08-15', '1597453884', '400000', 'chit lar', 0, '2020-08-15 17:44:50', '0000-00-00 00:00:00', 2),
(8, '2020-08-16', '1597517272', '4500000', '', 1, '2020-08-15 19:00:14', '0000-00-00 00:00:00', 2),
(9, '2020-08-16', '1597517391', '4500000', '', 2, '2020-08-15 19:00:15', '0000-00-00 00:00:00', 2),
(10, '2020-08-16', '1597517433', '400000', '', 0, '2020-08-15 18:59:15', '0000-00-00 00:00:00', 2),
(11, '2020-08-16', '1597517447', '1500000', '', 0, '2020-08-15 18:59:08', '0000-00-00 00:00:00', 2),
(12, '2020-08-16', '1597555351', '4500000', '', 0, '2020-08-16 05:22:31', '0000-00-00 00:00:00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2020-08-12 07:48:56', '0000-00-00 00:00:00'),
(2, 'customer', '2020-08-12 07:48:56', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` int(11) NOT NULL,
  `name` varchar(225) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `name`, `created_at`, `updated_at`, `category_id`) VALUES
(1, 'Mid-Range', '2020-08-11 02:57:28', '0000-00-00 00:00:00', 1),
(2, 'Hight-end', '2020-08-11 02:57:46', '0000-00-00 00:00:00', 1),
(3, 'lamp', '2020-08-11 03:20:36', '0000-00-00 00:00:00', 3),
(4, 'Noodles', '2020-08-11 03:56:27', '0000-00-00 00:00:00', 4),
(5, 'Men Clothes', '2020-08-11 04:06:26', '0000-00-00 00:00:00', 5),
(6, 'Perfume', '2020-08-11 04:14:11', '0000-00-00 00:00:00', 6),
(7, 'Wallpaper', '2020-08-11 05:08:14', '0000-00-00 00:00:00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `profile` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `profile`, `email`, `password`, `phone`, `address`, `status`, `created_at`, `updated_at`, `role_id`) VALUES
(1, 'Kadae Aung', NULL, 'kadaeaung@gmail.com', 'kadae', '092503933939', 'Dagon Township', 0, '2020-08-12 07:56:57', '0000-00-00 00:00:00', 1),
(2, 'Chaw', NULL, 'chawchaw@gmail.com', 'chaw', '095994949494', 'Gyimyindine', 0, '2020-08-12 07:57:01', '0000-00-00 00:00:00', 2),
(3, 'kaung', NULL, 'kaung@gmail.com', 'kaung', '0993939393', 'alone', NULL, '2020-08-15 17:51:35', '0000-00-00 00:00:00', 2),
(4, 'Chaw gyi', NULL, 'chawgyi@gmail.com', 'chaw', '092503933939', 'cc', NULL, '2020-08-15 17:51:38', '0000-00-00 00:00:00', 2),
(5, 'Lin Gyi', NULL, 'linlin@gmail.com', 'lin', '092503933939', 'll', NULL, '2020-08-15 17:51:45', '0000-00-00 00:00:00', 1),
(6, 'Hein Zaw', NULL, 'hein@gmail.com', 'hein', '0993939393', 'hh', NULL, '2020-08-15 17:51:49', '0000-00-00 00:00:00', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
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
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
