-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 23, 2021 at 06:55 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tatvasoft_practical`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `is_active` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `user_id`, `title`, `description`, `start_date`, `end_date`, `is_active`, `image`, `created_at`, `updated_at`) VALUES
(2, 4, 'Blog 123', 'slkjdklsjdklsdj', '2021-12-12', '2022-01-01', '1', '1640275037.jpg', '2021-12-23 08:58:34', '2021-12-23 10:27:36'),
(3, 2, 'Blog for food', 'kjfklsdjflkdsjfsdasdasdasd', '2021-12-06', '2022-01-16', '1', '1640272345.jpg', '2021-12-23 09:00:51', '2021-12-23 09:42:25'),
(4, 2, 'Blog 3', 'mkflsjdfifuifojdsikj', '2021-12-12', '2022-02-28', '1', '1640271401.jpg', '2021-12-23 09:26:42', '2021-12-23 09:46:25'),
(5, 3, 'Javed\'s Blog', 'skdfjlksjfiefijfk', '2021-12-23', '2022-12-23', '1', '1640273001.jpg', '2021-12-23 09:53:21', '2021-12-23 09:53:21'),
(6, 4, 'Admin\'s Blog', 'kdjfsk;jfsdjf', '2021-12-25', '2022-12-25', '1', '1640274562.jpg', '2021-12-23 10:19:22', '2021-12-23 10:19:22'),
(7, 4, 'Jofra\'s Blog', 'sdkjfksljfskjd', '2021-12-12', '2022-12-12', '0', '1640274707.jpg', '2021-12-23 10:21:47', '2021-12-23 10:27:45'),
(8, 3, 'lklkj', 'kfdjkldsjfkldjf', '2021-12-01', '2022-01-07', '1', '1640279086.jpg', '2021-12-23 11:34:46', '2021-12-23 11:34:46'),
(9, 3, 'klj', 'ls;ldkjasl;kd;askd', '2021-12-15', '2021-12-15', '1', '1640279597.jpg', '2021-12-23 11:43:17', '2021-12-23 11:43:17');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_12_23_130934_create_blogs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob` date NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('user','admin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `dob`, `image`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'test', 'test last', 'test@test.test', '12345678', '2021-12-12', 'imageedit_8_5419352941.png', 'user', NULL, '2021-12-23 08:14:24', '2021-12-23 08:14:24'),
(2, 'Palak', 'Gohil', 'palak@gmail.com', '$2y$10$mNuw9D28JwAkYVf7Pvs4/.ta0ryJj7lrr0s9fsbUEno3dfSyFavvC', '2021-12-12', '1-Available-slots.jpg', 'user', NULL, '2021-12-23 08:17:22', '2021-12-23 08:17:22'),
(3, 'Javed', 'Ali', 'javed@gmail.com', '$2y$10$Ld8KX1AS6zObQ0IjgK.Bdu6.m3gLUIpckyWQAyUjPcgoYDQx10na6', '1999-04-27', '05.jpg', 'user', NULL, '2021-12-23 09:52:32', '2021-12-23 09:52:32'),
(4, 'Jofra', 'Archer', 'jofra@gmail.com', '$2y$10$Bbn/trxrWGLXMTQrMrC4Ru0I6C4FshsYIOaPCcCbosI/9.K0pkO2G', '1999-04-27', '002.jpg', 'admin', NULL, '2021-12-23 09:56:26', '2021-12-23 09:56:26'),
(6, 'jkklj', 'kljkljkl', 'jklj@g.c', '$2y$10$VhTRkz6u3zsQf2XN6co4E.8Ru/pEHhU9m/g5YcQKcz6.PUszp8jpC', '1999-04-27', 'C:\\xampp\\tmp\\php8D39.tmp', 'user', NULL, '2021-12-23 11:07:20', '2021-12-23 11:07:20'),
(7, 'abc', 'def', 'abc@g.c', '$2y$10$PnBVcaV6Bm7fRNv6ZdC91OaHBN/xJSOXjUtuFGNkxrCLTUi7tKyyW', '2021-12-07', 'C:\\xampp\\tmp\\php2A10.tmp', 'user', NULL, '2021-12-23 11:30:55', '2021-12-23 11:30:55'),
(8, 'palak', 'gohil', 'palak123@gmail.com', '$2y$10$LVfS/XVdf2ov6Int9coeoOaQU1.Ivk95gT08QLZ5RBGBGwxrF99Xm', '2021-12-04', 'C:\\xampp\\tmp\\php4EBE.tmp', 'user', NULL, '2021-12-23 11:39:49', '2021-12-23 11:39:49');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blogs_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blogs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
