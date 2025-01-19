-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 19, 2025 at 07:15 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sns_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `comment_list`
--

CREATE TABLE `comment_list` (
  `id` int(30) NOT NULL,
  `post_id` int(30) NOT NULL,
  `member_id` int(30) NOT NULL,
  `message` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comment_list`
--

INSERT INTO `comment_list` (`id`, `post_id`, `member_id`, `message`, `date_created`, `date_updated`) VALUES
(12, 12, 3, 'nice', '2025-01-16 23:39:29', '2025-01-16 23:39:29');

-- --------------------------------------------------------

--
-- Table structure for table `like_list`
--

CREATE TABLE `like_list` (
  `post_id` int(30) NOT NULL,
  `member_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `like_list`
--

INSERT INTO `like_list` (`post_id`, `member_id`) VALUES
(14, 3),
(13, 3),
(12, 3);

-- --------------------------------------------------------

--
-- Table structure for table `member_list`
--

CREATE TABLE `member_list` (
  `id` int(30) NOT NULL,
  `firstname` text NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=Pending, 1=Approved, 2 = Denied, 3=Blocked',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `member_list`
--

INSERT INTO `member_list` (`id`, `firstname`, `middlename`, `lastname`, `email`, `password`, `avatar`, `status`, `date_created`, `date_updated`) VALUES
(3, 'hassan', 'c', 'ali', 'hassan@gmial.com', '202cb962ac59075b964b07152d234b70', NULL, 0, '2025-01-16 23:17:43', '2025-01-16 23:17:43'),
(4, 'naeem', 'c', 'kayani', 'naeemkayani39@gmail.com', '202cb962ac59075b964b07152d234b70', NULL, 0, '2025-01-16 23:19:55', '2025-01-16 23:19:55'),
(5, 'saif', '', 'ali', 'saif@gmial.com', '202cb962ac59075b964b07152d234b70', NULL, 0, '2025-01-16 23:30:02', '2025-01-16 23:30:02');

-- --------------------------------------------------------

--
-- Table structure for table `member_meta`
--

CREATE TABLE `member_meta` (
  `member_id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_list`
--

CREATE TABLE `post_list` (
  `id` int(30) NOT NULL,
  `member_id` int(30) NOT NULL,
  `caption` text NOT NULL,
  `upload_path` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post_list`
--

INSERT INTO `post_list` (`id`, `member_id`, `caption`, `upload_path`, `date_created`, `date_updated`) VALUES
(12, 5, '', 'uploads/posts/202501160001/', '2025-01-16 23:36:43', '2025-01-16 23:36:43'),
(13, 4, 'hy this is my first post', 'uploads/posts/202501160002/', '2025-01-16 23:38:04', '2025-01-16 23:38:04'),
(14, 3, 'hy this is my first post', 'uploads/posts/202501160003/', '2025-01-16 23:38:49', '2025-01-16 23:38:49'),
(15, 4, 'hyy', 'uploads/posts/202501160004/', '2025-01-16 23:41:37', '2025-01-16 23:41:37');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', ' Social media analytics'),
(6, 'short_name', 'InstaMage '),
(11, 'logo', 'uploads/logo.png?v=1651540223'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover.png?v=1651540931');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `middlename`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', NULL, 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/avatars/1.png?v=1649834664', NULL, 1, '2021-01-20 14:02:37', '2022-04-13 15:24:24'),
(3, 'John', NULL, 'Smith', 'jsmith', '1254737c076cf867dc53d60a0364f38e', 'uploads/avatars/3.png?v=1650527149', NULL, 2, '2022-04-21 15:45:49', '2022-04-21 15:46:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comment_list`
--
ALTER TABLE `comment_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `like_list`
--
ALTER TABLE `like_list`
  ADD KEY `post_id` (`post_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `member_list`
--
ALTER TABLE `member_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `member_meta`
--
ALTER TABLE `member_meta`
  ADD KEY `individual_id` (`member_id`);

--
-- Indexes for table `post_list`
--
ALTER TABLE `post_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_id` (`member_id`);

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
-- AUTO_INCREMENT for table `comment_list`
--
ALTER TABLE `comment_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `member_list`
--
ALTER TABLE `member_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `post_list`
--
ALTER TABLE `post_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment_list`
--
ALTER TABLE `comment_list`
  ADD CONSTRAINT `member_id_fk_cl` FOREIGN KEY (`member_id`) REFERENCES `member_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `post_id_fk_cl` FOREIGN KEY (`post_id`) REFERENCES `post_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `like_list`
--
ALTER TABLE `like_list`
  ADD CONSTRAINT `member_id_fk_ll` FOREIGN KEY (`member_id`) REFERENCES `member_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `post_id_fk_ll` FOREIGN KEY (`post_id`) REFERENCES `post_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `member_meta`
--
ALTER TABLE `member_meta`
  ADD CONSTRAINT `member_id_fk_mm` FOREIGN KEY (`member_id`) REFERENCES `member_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `post_list`
--
ALTER TABLE `post_list`
  ADD CONSTRAINT `member_id_fk_pl` FOREIGN KEY (`member_id`) REFERENCES `member_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
