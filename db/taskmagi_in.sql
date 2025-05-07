-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 07, 2025 at 11:03 PM
-- Server version: 5.7.23-23
-- PHP Version: 8.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `taskmagi_in`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `project_id` int(11) NOT NULL DEFAULT '0',
  `task_id` int(11) NOT NULL DEFAULT '0',
  `log_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `user_id`, `project_id`, `task_id`, `log_type`, `remark`, `created_at`, `updated_at`) VALUES
(1, 6, 1, 1, 'Create Task', '{\"title\":\"Landing Page\"}', '2024-04-10 07:48:53', '2024-04-10 07:48:53'),
(2, 9, 2, 0, 'Invite User', '{\"title\":\"Tester\"}', '2024-05-09 08:42:49', '2024-05-09 08:42:49'),
(3, 9, 2, 0, 'Invite User', '{\"title\":\"Client\"}', '2024-05-09 08:42:55', '2024-05-09 08:42:55'),
(4, 9, 2, 0, 'Create Expense', '{\"title\":\"testing\"}', '2024-05-09 09:09:38', '2024-05-09 09:09:38'),
(5, 13, 5, 2, 'Create Task', '{\"title\":\"todo task test\"}', '2024-06-03 09:50:36', '2024-06-03 09:50:36'),
(6, 13, 5, 3, 'Create Task', '{\"title\":\"todo task test\"}', '2024-06-03 09:50:51', '2024-06-03 09:50:51'),
(7, 13, 5, 4, 'Create Task', '{\"title\":\"ysrt rt\"}', '2024-06-03 09:51:30', '2024-06-03 09:51:30'),
(8, 13, 5, 0, 'Create Expense', '{\"title\":\"Create Expense\"}', '2024-06-03 09:53:29', '2024-06-03 09:53:29'),
(9, 13, 5, 5, 'Create Task', '{\"title\":\"fg trhy dh\"}', '2024-06-03 09:57:42', '2024-06-03 09:57:42'),
(10, 13, 5, 6, 'Create Task', '{\"title\":\"yr nrty rt\"}', '2024-06-03 09:58:04', '2024-06-03 09:58:04'),
(11, 13, 5, 0, 'Invite User', '{\"title\":\"disha client\"}', '2024-06-03 10:21:39', '2024-06-03 10:21:39'),
(12, 13, 5, 0, 'Create Milestone', '{\"title\":\"Milestone\"}', '2024-06-03 10:22:34', '2024-06-03 10:22:34'),
(13, 13, 5, 0, 'Create Milestone', '{\"title\":\"Milestone\"}', '2024-06-03 10:22:34', '2024-06-03 10:22:34'),
(14, 13, 5, 0, 'Create Expense', '{\"title\":\"Expense test\"}', '2024-06-03 10:23:36', '2024-06-03 10:23:36'),
(15, 9, 2, 7, 'Create Task', '{\"title\":\"demo\"}', '2024-06-03 11:12:48', '2024-06-03 11:12:48'),
(16, 9, 2, 7, 'Move Task', '{\"title\":\"demo\",\"old_stage\":\"Todo\",\"new_stage\":\"In Progress\"}', '2024-06-03 11:12:52', '2024-06-03 11:12:52'),
(17, 9, 2, 7, 'Move Task', '{\"title\":\"demo\",\"old_stage\":\"In Progress\",\"new_stage\":\"Review\"}', '2024-06-03 12:51:19', '2024-06-03 12:51:19'),
(18, 9, 2, 7, 'Move Task', '{\"title\":\"demo\",\"old_stage\":\"Review\",\"new_stage\":\"In Progress\"}', '2024-06-03 12:51:44', '2024-06-03 12:51:44'),
(19, 13, 5, 6, 'Move Task', '{\"title\":\"yr nrty rt\",\"old_stage\":\"In Progress\",\"new_stage\":\"Todo\"}', '2024-06-03 13:08:13', '2024-06-03 13:08:13'),
(20, 13, 5, 3, 'Move Task', '{\"title\":\"todo task test\",\"old_stage\":\"Done\",\"new_stage\":\"Review\"}', '2024-06-03 13:08:19', '2024-06-03 13:08:19'),
(21, 13, 5, 3, 'Move Task', '{\"title\":\"todo task test\",\"old_stage\":\"Review\",\"new_stage\":\"Done\"}', '2024-06-03 13:08:21', '2024-06-03 13:08:21'),
(22, 13, 5, 3, 'Move Task', '{\"title\":\"todo task test\",\"old_stage\":\"Done\",\"new_stage\":\"Todo\"}', '2024-06-03 13:08:23', '2024-06-03 13:08:23'),
(23, 13, 5, 6, 'Move Task', '{\"title\":\"yr nrty rt\",\"old_stage\":\"Todo\",\"new_stage\":\"Done\"}', '2024-06-03 13:08:25', '2024-06-03 13:08:25'),
(24, 13, 5, 8, 'Create Task', '{\"title\":\"test att\"}', '2024-06-04 07:35:41', '2024-06-04 07:35:41'),
(25, 19, 7, 9, 'Create Task', '{\"title\":\"fdfff\"}', '2024-06-04 12:12:53', '2024-06-04 12:12:53'),
(26, 19, 7, 9, 'Move Task', '{\"title\":\"fdfff\",\"old_stage\":\"Todo\",\"new_stage\":\"In Progress\"}', '2024-06-04 12:13:34', '2024-06-04 12:13:34'),
(27, 13, 8, 0, 'Create Expense', '{\"title\":\"disha Expense\"}', '2024-06-06 07:50:03', '2024-06-06 07:50:03'),
(28, 13, 9, 0, 'Create Expense', '{\"title\":\"disha\"}', '2024-06-06 08:06:41', '2024-06-06 08:06:41'),
(77, 35, 27, 0, 'Invite User', '{\"title\":\"asdgfhjgfhurehurutrjgjgfijijyytirtivmlcmvkghljgrjfjfdjlgfjgt\"}', '2024-07-19 05:24:00', '2024-07-19 05:24:00'),
(78, 35, 27, 0, 'Invite User', '{\"title\":\"M\"}', '2024-07-19 05:25:13', '2024-07-19 05:25:13'),
(79, 35, 27, 0, 'Create Milestone', '{\"title\":\"T1\"}', '2024-07-19 05:26:05', '2024-07-19 05:26:05'),
(80, 35, 27, 0, 'Create Milestone', '{\"title\":\"M2\"}', '2024-07-19 05:27:26', '2024-07-19 05:27:26'),
(81, 35, 27, 0, 'Create Milestone', '{\"title\":\"M1\"}', '2024-07-19 06:55:49', '2024-07-19 06:55:49'),
(82, 35, 27, 0, 'Create Milestone', '{\"title\":\"12345678978758555585612344556780987654398765432123467809876543123898545238556565655656232\"}', '2024-07-19 06:57:32', '2024-07-19 06:57:32'),
(83, 35, 28, 0, 'Invite User', '{\"title\":\"M\"}', '2024-07-19 07:20:36', '2024-07-19 07:20:36'),
(84, 35, 27, 0, 'Invite User', '{\"title\":\"C1\"}', '2024-07-19 07:22:40', '2024-07-19 07:22:40'),
(85, 35, 28, 0, 'Invite User', '{\"title\":\"C1\"}', '2024-07-19 07:23:15', '2024-07-19 07:23:15'),
(87, 35, 29, 0, 'Invite User', '{\"title\":\"M\"}', '2024-07-19 07:26:28', '2024-07-19 07:26:28'),
(90, 35, 27, 0, 'Invite User', '{\"title\":\"M2\"}', '2024-07-20 11:52:18', '2024-07-20 11:52:18'),
(91, 35, 27, 28, 'Create Task', '{\"title\":\"T1\"}', '2024-07-22 08:02:58', '2024-07-22 08:02:58'),
(92, 35, 27, 29, 'Create Task', '{\"title\":\"T2\"}', '2024-07-22 08:03:39', '2024-07-22 08:03:39'),
(94, 45, 33, 0, 'Create Milestone', '{\"title\":\"Level 1\"}', '2024-07-25 07:54:41', '2024-07-25 07:54:41'),
(95, 45, 33, 0, 'Create Milestone', '{\"title\":\"Level 2\"}', '2024-07-25 08:01:00', '2024-07-25 08:01:00'),
(96, 45, 33, 0, 'Create Milestone', '{\"title\":\"Level 3\"}', '2024-07-25 08:01:24', '2024-07-25 08:01:24'),
(97, 45, 33, 0, 'Create Milestone', '{\"title\":\"Level 4\"}', '2024-07-25 08:01:56', '2024-07-25 08:01:56'),
(98, 45, 33, 0, 'Invite User', '{\"title\":\"nick\"}', '2024-07-25 08:16:06', '2024-07-25 08:16:06'),
(99, 45, 33, 0, 'Invite User', '{\"title\":\"namo\"}', '2024-07-25 08:24:24', '2024-07-25 08:24:24'),
(100, 39, 33, 0, 'Create Milestone', '{\"title\":\"level 5\"}', '2024-07-26 06:59:27', '2024-07-26 06:59:27'),
(101, 39, 33, 0, 'Create Expense', '{\"title\":\"Basic infra\"}', '2024-07-26 07:07:03', '2024-07-26 07:07:03'),
(102, 39, 32, 0, 'Create Milestone', '{\"title\":\"M1\"}', '2024-07-26 07:24:57', '2024-07-26 07:24:57'),
(103, 39, 32, 30, 'Create Task', '{\"title\":\"T1\"}', '2024-07-26 07:26:11', '2024-07-26 07:26:11'),
(104, 39, 33, 31, 'Create Task', '{\"title\":\"T1\"}', '2024-07-26 07:28:17', '2024-07-26 07:28:17'),
(105, 39, 33, 32, 'Create Task', '{\"title\":\"T1\"}', '2024-07-26 07:29:22', '2024-07-26 07:29:22'),
(108, 39, 33, 34, 'Create Task', '{\"title\":\"T1\"}', '2024-07-26 07:54:56', '2024-07-26 07:54:56'),
(109, 39, 33, 35, 'Create Task', '{\"title\":\"T1\"}', '2024-07-26 07:56:38', '2024-07-26 07:56:38'),
(110, 39, 32, 0, 'Invite User', '{\"title\":\"sonali\"}', '2024-07-26 08:12:42', '2024-07-26 08:12:42'),
(112, 39, 32, 30, 'Move Task', '{\"title\":\"T1\",\"old_stage\":\"Todo\",\"new_stage\":\"In Progress\"}', '2024-07-26 10:22:52', '2024-07-26 10:22:52'),
(113, 39, 32, 0, 'Create Milestone', '{\"title\":\"M2\"}', '2024-07-26 10:23:17', '2024-07-26 10:23:17'),
(114, 39, 32, 30, 'Move Task', '{\"title\":\"T1\",\"old_stage\":\"In Progress\",\"new_stage\":\"Done\"}', '2024-07-26 11:14:50', '2024-07-26 11:14:50'),
(120, 39, 32, 0, 'Create Expense', '{\"title\":\"Actual development Expense\"}', '2024-07-26 12:56:55', '2024-07-26 12:56:55'),
(150, 39, 32, 0, 'Invite User', '{\"title\":\"nick\"}', '2024-08-08 09:37:59', '2024-08-08 09:37:59'),
(151, 39, 32, 0, 'Invite User', '{\"title\":\"namoo\"}', '2024-08-08 09:39:09', '2024-08-08 09:39:09'),
(152, 39, 32, 0, 'Invite User', '{\"title\":\"nick\"}', '2024-08-08 09:39:33', '2024-08-08 09:39:33'),
(164, 39, 32, 30, 'Move Task', '{\"title\":\"T1\",\"old_stage\":\"Done\",\"new_stage\":\"Review\"}', '2024-08-09 08:05:42', '2024-08-09 08:05:42'),
(166, 39, 32, 30, 'Move Task', '{\"title\":\"T1\",\"old_stage\":\"Review\",\"new_stage\":\"In Progress\"}', '2024-08-09 11:06:50', '2024-08-09 11:06:50'),
(187, 39, 32, 42, 'Create Task', '{\"title\":\"T2\"}', '2024-08-22 12:26:31', '2024-08-22 12:26:31'),
(190, 39, 32, 0, 'Create Expense', '{\"title\":\"dsfs\"}', '2024-08-23 11:15:09', '2024-08-23 11:15:09'),
(191, 9, 2, 44, 'Create Task', '{\"title\":\"jk\"}', '2024-09-05 09:53:29', '2024-09-05 09:53:29'),
(192, 49, 69, 45, 'Create Task', '{\"title\":\"Header\"}', '2024-09-05 10:01:30', '2024-09-05 10:01:30'),
(193, 9, 2, 46, 'Create Task', '{\"title\":\"dg\"}', '2024-09-05 10:17:25', '2024-09-05 10:17:25'),
(194, 49, 70, 47, 'Create Task', '{\"title\":\"Header\"}', '2024-09-05 10:33:23', '2024-09-05 10:33:23'),
(195, 49, 70, 48, 'Create Task', '{\"title\":\"Header\"}', '2024-09-05 10:33:24', '2024-09-05 10:33:24'),
(196, 49, 70, 0, 'Invite User', '{\"title\":\"Aaditi\"}', '2024-09-05 10:34:53', '2024-09-05 10:34:53'),
(197, 49, 70, 49, 'Create Task', '{\"title\":\"Header\"}', '2024-09-05 10:36:42', '2024-09-05 10:36:42'),
(198, 9, 70, 50, 'Create Task', '{\"title\":\"ert\"}', '2024-09-05 10:36:43', '2024-09-05 10:36:43'),
(199, 9, 70, 51, 'Create Task', '{\"title\":\"AditiOne\"}', '2024-09-05 10:41:06', '2024-09-05 10:41:06'),
(205, 9, 76, 54, 'Create Task', '{\"title\":\"jk\"}', '2024-09-30 07:31:25', '2024-09-30 07:31:25'),
(206, 9, 76, 55, 'Create Task', '{\"title\":\"dg\"}', '2024-09-30 07:31:25', '2024-09-30 07:31:25'),
(207, 9, 76, 56, 'Create Task', '{\"title\":\"demo\"}', '2024-09-30 07:31:25', '2024-09-30 07:31:25'),
(208, 9, 76, 56, 'Move Task', '{\"title\":\"demo\",\"old_stage\":\"Todo\",\"new_stage\":\"In Progress\"}', '2024-09-30 07:31:25', '2024-09-30 07:31:25'),
(209, 9, 76, 56, 'Move Task', '{\"title\":\"demo\",\"old_stage\":\"In Progress\",\"new_stage\":\"Review\"}', '2024-09-30 07:31:25', '2024-09-30 07:31:25'),
(210, 9, 76, 56, 'Move Task', '{\"title\":\"demo\",\"old_stage\":\"Review\",\"new_stage\":\"In Progress\"}', '2024-09-30 07:31:25', '2024-09-30 07:31:25'),
(211, 9, 76, 0, 'Invite User', '{\"title\":\"Tester\"}', '2024-09-30 07:31:25', '2024-09-30 07:31:25'),
(212, 9, 76, 0, 'Invite User', '{\"title\":\"Client\"}', '2024-09-30 07:31:25', '2024-09-30 07:31:25'),
(213, 9, 76, 0, 'Create Expense', '{\"title\":\"testing\"}', '2024-09-30 07:31:25', '2024-09-30 07:31:25'),
(236, 48, 84, 0, 'Invite User', '{\"title\":\"disha\"}', '2024-10-01 09:50:44', '2024-10-01 09:50:44'),
(237, 48, 85, 62, 'Create Task', '{\"title\":\"sdf\"}', '2024-10-01 12:10:00', '2024-10-01 12:10:00'),
(238, 48, 85, 63, 'Create Task', '{\"title\":\"et\"}', '2024-10-01 12:10:12', '2024-10-01 12:10:12'),
(239, 48, 85, 64, 'Create Task', '{\"title\":\"tyu\"}', '2024-10-01 12:10:26', '2024-10-01 12:10:26'),
(240, 48, 85, 65, 'Create Task', '{\"title\":\"ytu\"}', '2024-10-01 12:11:32', '2024-10-01 12:11:32'),
(241, 48, 87, 66, 'Create Task', '{\"title\":\"test task\"}', '2024-10-01 13:43:41', '2024-10-01 13:43:41'),
(242, 48, 88, 67, 'Create Task', '{\"title\":\"test123\"}', '2024-10-01 14:00:28', '2024-10-01 14:00:28'),
(243, 48, 88, 67, 'Move Task', '{\"title\":\"test123\",\"old_stage\":\"Todo\",\"new_stage\":\"Done\"}', '2024-10-01 14:00:36', '2024-10-01 14:00:36'),
(244, 48, 88, 68, 'Create Task', '{\"title\":\"jhhj\"}', '2024-10-01 14:01:14', '2024-10-01 14:01:14'),
(245, 39, 33, 69, 'Create Task', '{\"title\":\"TA1\"}', '2024-10-09 13:05:48', '2024-10-09 13:05:48'),
(246, 39, 33, 70, 'Create Task', '{\"title\":\"T1\"}', '2024-10-10 07:24:17', '2024-10-10 07:24:17'),
(247, 39, 33, 71, 'Create Task', '{\"title\":\"Task1\"}', '2024-10-10 07:33:37', '2024-10-10 07:33:37'),
(248, 39, 33, 72, 'Create Task', '{\"title\":\"regfrg\"}', '2024-10-10 07:47:23', '2024-10-10 07:47:23'),
(249, 62, 104, 0, 'Invite User', '{\"title\":\"namo\"}', '2024-11-25 12:53:34', '2024-11-25 12:53:34'),
(250, 62, 104, 0, 'Create Milestone', '{\"title\":\"Milestone 1\"}', '2024-11-25 13:16:30', '2024-11-25 13:16:30'),
(251, 62, 104, 73, 'Create Task', '{\"title\":\"xyz\"}', '2024-11-26 13:30:23', '2024-11-26 13:30:23'),
(252, 62, 104, 73, 'Move Task', '{\"title\":\"xyz\",\"old_stage\":\"Todo\",\"new_stage\":\"In Progress\"}', '2024-11-26 13:39:45', '2024-11-26 13:39:45'),
(253, 62, 104, 73, 'Move Task', '{\"title\":\"xyz\",\"old_stage\":\"In Progress\",\"new_stage\":\"Done\"}', '2024-11-27 09:51:40', '2024-11-27 09:51:40'),
(254, 62, 104, 73, 'Move Task', '{\"title\":\"xyz\",\"old_stage\":\"Done\",\"new_stage\":\"Review\"}', '2024-11-27 10:03:52', '2024-11-27 10:03:52'),
(255, 62, 104, 73, 'Move Task', '{\"title\":\"xyz\",\"old_stage\":\"Review\",\"new_stage\":\"In Progress\"}', '2024-11-27 10:03:54', '2024-11-27 10:03:54'),
(256, 62, 104, 73, 'Move Task', '{\"title\":\"xyz\",\"old_stage\":\"In Progress\",\"new_stage\":\"Todo\"}', '2024-11-27 10:03:55', '2024-11-27 10:03:55'),
(257, 62, 104, 73, 'Move Task', '{\"title\":\"xyz\",\"old_stage\":\"Todo\",\"new_stage\":\"In Progress\"}', '2024-11-27 10:04:09', '2024-11-27 10:04:09'),
(258, 62, 104, 73, 'Move Task', '{\"title\":\"xyz\",\"old_stage\":\"In Progress\",\"new_stage\":\"Review\"}', '2024-11-27 10:04:22', '2024-11-27 10:04:22'),
(259, 62, 104, 73, 'Move Task', '{\"title\":\"xyz\",\"old_stage\":\"Review\",\"new_stage\":\"Done\"}', '2024-11-27 10:04:29', '2024-11-27 10:04:29'),
(260, 62, 104, 73, 'Move Task', '{\"title\":\"xyz\",\"old_stage\":\"Done\",\"new_stage\":\"Review\"}', '2024-11-27 10:04:51', '2024-11-27 10:04:51'),
(261, 62, 104, 73, 'Move Task', '{\"title\":\"xyz\",\"old_stage\":\"Review\",\"new_stage\":\"Done\"}', '2024-11-27 10:05:21', '2024-11-27 10:05:21'),
(262, 62, 104, 73, 'Move Task', '{\"title\":\"xyz\",\"old_stage\":\"Done\",\"new_stage\":\"Review\"}', '2024-11-27 11:43:57', '2024-11-27 11:43:57'),
(263, 62, 104, 73, 'Move Task', '{\"title\":\"xyz\",\"old_stage\":\"Review\",\"new_stage\":\"Done\"}', '2024-11-27 11:44:00', '2024-11-27 11:44:00'),
(264, 62, 104, 73, 'Move Task', '{\"title\":\"xyz\",\"old_stage\":\"Done\",\"new_stage\":\"Review\"}', '2024-11-27 12:03:16', '2024-11-27 12:03:16'),
(265, 62, 104, 74, 'Create Task', '{\"title\":\"T1\"}', '2024-11-27 13:12:03', '2024-11-27 13:12:03'),
(266, 62, 104, 0, 'Invite User', '{\"title\":\"namo\"}', '2024-11-27 13:59:12', '2024-11-27 13:59:12'),
(267, 48, 84, 0, 'Invite User', '{\"title\":\"lixejif\"}', '2024-12-03 08:31:46', '2024-12-03 08:31:46'),
(268, 65, 84, 75, 'Create Task', '{\"title\":\"Added login and register page\"}', '2024-12-03 09:31:50', '2024-12-03 09:31:50'),
(269, 65, 84, 76, 'Create Task', '{\"title\":\"half don\"}', '2024-12-03 09:32:15', '2024-12-03 09:32:15'),
(270, 65, 84, 77, 'Create Task', '{\"title\":\"Task inReview\"}', '2024-12-03 09:32:36', '2024-12-03 09:32:36'),
(271, 65, 84, 78, 'Create Task', '{\"title\":\"Task Done\"}', '2024-12-03 09:33:21', '2024-12-03 09:33:21'),
(272, 65, 84, 0, 'Create Milestone', '{\"title\":\"New Milestone\"}', '2024-12-03 09:34:14', '2024-12-03 09:34:14'),
(273, 48, 84, 0, 'Create Expense', '{\"title\":\"Login and Registration\"}', '2024-12-03 09:46:43', '2024-12-03 09:46:43'),
(274, 48, 84, 79, 'Create Task', '{\"title\":\"Home page done\"}', '2024-12-03 09:58:59', '2024-12-03 09:58:59'),
(275, 62, 104, 74, 'Move Task', '{\"title\":\"T1\",\"old_stage\":\"Todo\",\"new_stage\":\"In Progress\"}', '2024-12-03 10:12:21', '2024-12-03 10:12:21'),
(276, 48, 84, 0, 'Invite User', '{\"title\":\"bifapo\"}', '2024-12-03 10:13:10', '2024-12-03 10:13:10'),
(277, 64, 84, 80, 'Create Task', '{\"title\":\"kjbjk\"}', '2024-12-03 11:16:18', '2024-12-03 11:16:18'),
(278, 48, 110, 0, 'Invite User', '{\"title\":\"dipaktestone\"}', '2025-02-08 10:16:30', '2025-02-08 10:16:30'),
(279, 48, 110, 0, 'Create Milestone', '{\"title\":\"Home page design\"}', '2025-02-08 10:26:03', '2025-02-08 10:26:03'),
(280, 48, 110, 81, 'Create Task', '{\"title\":\"Home page backend\"}', '2025-02-08 10:30:11', '2025-02-08 10:30:11'),
(281, 48, 110, 82, 'Create Task', '{\"title\":\"gfiudfs\"}', '2025-02-08 10:50:21', '2025-02-08 10:50:21'),
(282, 48, 111, 83, 'Create Task', '{\"title\":\"test task\"}', '2025-02-10 07:03:40', '2025-02-10 07:03:40'),
(283, 48, 84, 84, 'Create Task', '{\"title\":\"Project open task\"}', '2025-02-10 07:14:56', '2025-02-10 07:14:56'),
(284, 48, 84, 80, 'Move Task', '{\"title\":\"kjbjk\",\"old_stage\":\"Todo\",\"new_stage\":\"In Progress\"}', '2025-02-10 07:15:42', '2025-02-10 07:15:42'),
(285, 48, 110, 0, 'Invite User', '{\"title\":\"DipakK\"}', '2025-02-10 11:17:33', '2025-02-10 11:17:33'),
(286, 48, 110, 0, 'Create Milestone', '{\"title\":\"Contact page design complete\"}', '2025-02-12 10:42:54', '2025-02-12 10:42:54'),
(287, 364, 109, 0, 'Invite User', '{\"title\":\"dipak test user\"}', '2025-02-14 06:01:09', '2025-02-14 06:01:09'),
(288, 364, 109, 85, 'Create Task', '{\"title\":\"task one\"}', '2025-02-14 06:01:38', '2025-02-14 06:01:38'),
(289, 364, 109, 86, 'Create Task', '{\"title\":\"cvfsdf\"}', '2025-02-14 06:02:31', '2025-02-14 06:02:31'),
(290, 364, 108, 0, 'Invite User', '{\"title\":\"dipaktestone two\"}', '2025-02-14 06:03:28', '2025-02-14 06:03:28'),
(291, 364, 108, 87, 'Create Task', '{\"title\":\"nhnfg\"}', '2025-02-14 06:04:01', '2025-02-14 06:04:01'),
(292, 364, 108, 88, 'Create Task', '{\"title\":\"dfdf\"}', '2025-02-14 06:04:34', '2025-02-14 06:04:34'),
(293, 364, 113, 0, 'Invite User', '{\"title\":\"dipaktesttwo\"}', '2025-02-14 06:08:15', '2025-02-14 06:08:15'),
(294, 364, 113, 0, 'Invite User', '{\"title\":\"dipak test user\"}', '2025-02-14 06:08:16', '2025-02-14 06:08:16'),
(295, 364, 113, 0, 'Invite User', '{\"title\":\"dipaktestone two\"}', '2025-02-14 06:08:17', '2025-02-14 06:08:17'),
(296, 364, 113, 89, 'Create Task', '{\"title\":\"Dedign first figma\"}', '2025-02-14 06:09:12', '2025-02-14 06:09:12'),
(297, 48, 114, 0, 'Invite User', '{\"title\":\"DipakK\"}', '2025-02-14 07:41:58', '2025-02-14 07:41:58'),
(298, 365, 119, 0, 'Invite User', '{\"title\":\"dipak client\"}', '2025-02-14 11:51:09', '2025-02-14 11:51:09'),
(299, 48, 84, 90, 'Create Task', '{\"title\":\"Task Tracker\"}', '2025-02-15 08:12:53', '2025-02-15 08:12:53'),
(301, 48, 110, 91, 'Create Task', '{\"title\":\"Google Calendar\"}', '2025-02-20 09:59:39', '2025-02-20 09:59:39'),
(302, 48, 110, 92, 'Create Task', '{\"title\":\"test cad\"}', '2025-02-21 06:53:41', '2025-02-21 06:53:41'),
(303, 48, 110, 93, 'Create Task', '{\"title\":\"calendar task\"}', '2025-02-21 07:02:55', '2025-02-21 07:02:55'),
(304, 400, 122, 94, 'Create Task', '{\"title\":\"testing\"}', '2025-04-19 04:28:21', '2025-04-19 04:28:21'),
(305, 400, 124, 95, 'Create Task', '{\"title\":\"abc\"}', '2025-04-22 06:33:51', '2025-04-22 06:33:51'),
(306, 400, 124, 96, 'Create Task', '{\"title\":\"abc\"}', '2025-04-22 07:09:40', '2025-04-22 07:09:40'),
(307, 400, 124, 0, 'Invite User', '{\"title\":\"poonam\"}', '2025-04-24 04:05:18', '2025-04-24 04:05:18'),
(308, 400, 124, 0, 'Invite User', '{\"title\":\"nikita\"}', '2025-04-24 04:23:26', '2025-04-24 04:23:26'),
(309, 400, 122, 0, 'Create Milestone', '{\"title\":\"abc\"}', '2025-04-24 04:26:06', '2025-04-24 04:26:06');

-- --------------------------------------------------------

--
-- Table structure for table `banktransfers`
--

CREATE TABLE `banktransfers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `order_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `receipt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ch_favorites`
--

CREATE TABLE `ch_favorites` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `favorite_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ch_favorites`
--

INSERT INTO `ch_favorites` (`id`, `user_id`, `favorite_id`, `created_at`, `updated_at`) VALUES
(64740745, 39, 37, '2024-10-10 12:55:16', '2024-10-10 12:55:16'),
(74827700, 35, 42, '2024-07-20 13:31:00', '2024-07-20 13:31:00'),
(94348154, 35, 37, '2024-07-20 13:30:54', '2024-07-20 13:30:54'),
(95591038, 39, 47, '2024-08-23 05:57:46', '2024-08-23 05:57:46');

-- --------------------------------------------------------

--
-- Table structure for table `ch_messages`
--

CREATE TABLE `ch_messages` (
  `id` bigint(20) NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_id` bigint(20) NOT NULL,
  `to_id` bigint(20) NOT NULL,
  `body` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ch_messages`
--

INSERT INTO `ch_messages` (`id`, `type`, `from_id`, `to_id`, `body`, `attachment`, `seen`, `created_at`, `updated_at`) VALUES
(1755284370, 'user', 48, 64, '', '{\"new_name\":\"e493e586-48e0-4031-930f-67ae3e8bea90.png\",\"old_name\":\"pngtree-smoke-abstract-effect-png-image_12817375.png\"}', 1, '2024-12-25 06:41:47', '2024-12-25 06:41:57'),
(1761781662, 'user', 39, 32, '', '{\"new_name\":\"277b3b5b-5669-4773-8e7a-e73251c9128f.png\",\"old_name\":\"DF_044.png\"}', 0, '2024-08-23 06:35:05', '2024-08-23 06:35:05'),
(1765395499, 'user', 39, 47, '', '{\"new_name\":\"da799e32-c555-4598-86d0-f199d0bb5e56.png\",\"old_name\":\"DF_044.png\"}', 0, '2024-08-23 06:42:36', '2024-08-23 06:42:36'),
(1765494026, 'user', 39, 43, 'hii', NULL, 0, '2024-08-22 07:40:33', '2024-08-22 07:40:33'),
(1832483999, 'user', 35, 44, 'Hii', NULL, 0, '2024-07-20 13:31:27', '2024-07-20 13:31:27'),
(1832862761, 'user', 64, 48, '', '{\"new_name\":\"75d9e1c2-1094-4531-875f-5722a373eedf.jpg\",\"old_name\":\"hq720.jpg\"}', 1, '2024-12-25 07:11:59', '2024-12-25 07:12:05'),
(1837644698, 'user', 2, 2, 'hi', NULL, 1, '2025-03-08 12:06:49', '2025-03-08 12:06:54'),
(1846689991, 'user', 39, 37, 'hii', NULL, 0, '2024-10-10 13:17:42', '2024-10-10 13:17:42'),
(1852079496, 'user', 39, 43, 'hiii', NULL, 0, '2024-08-22 07:11:12', '2024-08-22 07:11:12'),
(1894650395, 'user', 48, 365, 'Gil', NULL, 1, '2025-02-10 08:29:38', '2025-02-10 08:29:50'),
(1917827408, 'user', 39, 32, 'hi', NULL, 0, '2024-08-22 10:47:43', '2024-08-22 10:47:43'),
(1921147697, 'user', 43, 47, 'hii', NULL, 0, '2024-08-22 06:55:47', '2024-08-22 06:55:47'),
(1997458217, 'user', 9, 11, 'hello', NULL, 0, '2024-05-09 08:48:19', '2024-05-09 08:48:19'),
(2066579955, 'user', 64, 48, '', '{\"new_name\":\"0f0f6d5e-95e4-427b-ace2-def842c36fda.png\",\"old_name\":\"laravel-model-notes.png\"}', 1, '2024-12-25 06:57:28', '2024-12-25 06:57:42'),
(2095997881, 'user', 13, 13, 'hii', NULL, 0, '2024-06-05 09:51:53', '2024-06-05 09:51:53'),
(2138748678, 'user', 39, 39, 'fdfdfdd', NULL, 1, '2024-08-22 06:18:54', '2024-08-22 06:31:09'),
(2143386687, 'user', 64, 48, '', '{\"new_name\":\"7253c66e-677f-45f1-991c-0fb5e9ff225e.jpg\",\"old_name\":\"person.jpg\"}', 1, '2024-12-25 06:51:59', '2024-12-25 06:52:14'),
(2158252606, 'user', 48, 64, 'hi', NULL, 1, '2024-12-25 05:50:36', '2024-12-25 05:50:54'),
(2193994668, 'user', 39, 37, 'hi', NULL, 0, '2024-10-10 13:20:33', '2024-10-10 13:20:33'),
(2256940764, 'user', 48, 64, '', '{\"new_name\":\"e6d621b9-4910-4665-82e5-d8fa1e90941e.png\",\"old_name\":\"attachment_87015135.png\"}', 1, '2024-12-25 07:09:22', '2024-12-25 07:10:00'),
(2292677214, 'user', 39, 41, '', '{\"new_name\":\"5aa560fa-b7a8-4a0d-8bd1-b837602572a7.jpg\",\"old_name\":\"7.jpg\"}', 0, '2024-08-22 07:21:04', '2024-08-22 07:21:04'),
(2365317408, 'user', 39, 41, 'hii', NULL, 0, '2024-08-22 06:50:49', '2024-08-22 06:50:49'),
(2379165868, 'user', 13, 13, 'how can i add task', NULL, 1, '2024-05-23 09:19:20', '2024-06-05 09:51:39'),
(2448318291, 'user', 48, 64, '', '{\"new_name\":\"a07114ca-2576-465a-a014-95bd8cf63ee2.png\",\"old_name\":\"logo-dark.png\"}', 1, '2024-12-25 06:54:47', '2024-12-25 06:55:31'),
(2453714150, 'user', 39, 43, 'hey', NULL, 0, '2024-08-22 08:07:21', '2024-08-22 08:07:21'),
(2481718410, 'user', 35, 44, 'ghhiui', NULL, 0, '2024-07-20 13:31:19', '2024-07-20 13:31:19'),
(2486474769, 'user', 48, 365, 'hi', NULL, 0, '2025-02-19 09:45:01', '2025-02-19 09:45:01'),
(2498746720, 'user', 39, 9, 'hii', NULL, 0, '2024-08-23 06:53:09', '2024-08-23 06:53:09'),
(2572719822, 'user', 39, 43, 'hii', NULL, 0, '2024-08-22 09:40:57', '2024-08-22 09:40:57'),
(2579278993, 'user', 365, 48, '', '{\"new_name\":\"367d8d35-eb87-4c6f-9a11-e780eca82d87.png\",\"old_name\":\"mollie.png\"}', 1, '2025-02-10 08:30:07', '2025-02-10 08:30:13'),
(2602385151, 'user', 39, 47, 'hi', NULL, 0, '2024-08-22 10:50:15', '2024-08-22 10:50:15'),
(2619627825, 'user', 48, 365, 'How can I help you?', NULL, 0, '2025-02-19 09:47:01', '2025-02-19 09:47:01'),
(2630922322, 'user', 48, 64, 'hi', NULL, 0, '2025-02-10 08:29:02', '2025-02-10 08:29:02'),
(2637742109, 'user', 39, 37, 'hi', NULL, 0, '2024-10-09 09:41:15', '2024-10-09 09:41:15'),
(2702502476, 'user', 43, 39, 'hii', NULL, 1, '2024-08-22 06:56:08', '2024-08-22 07:00:13'),
(2708922558, 'user', 64, 48, 'Hello', NULL, 1, '2024-12-25 05:51:10', '2024-12-25 05:58:42'),
(2711924474, 'user', 39, 39, 'fdddddfcde', NULL, 1, '2024-07-23 06:35:46', '2024-07-23 06:36:10'),
(2718260290, 'user', 39, 43, 'hii', NULL, 0, '2024-08-22 07:47:16', '2024-08-22 07:47:16');

-- --------------------------------------------------------

--
-- Table structure for table `contracts`
--

CREATE TABLE `contracts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client` int(11) NOT NULL DEFAULT '0',
  `project` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `notes` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `contract_description` longtext COLLATE utf8mb4_unicode_ci,
  `client_signature` longtext COLLATE utf8mb4_unicode_ci,
  `owner_signature` longtext COLLATE utf8mb4_unicode_ci,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contracts`
--

INSERT INTO `contracts` (`id`, `client`, `project`, `subject`, `value`, `type`, `start_date`, `end_date`, `notes`, `status`, `contract_description`, `client_signature`, `owner_signature`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 11, '2', 'testing', '5000', 1, '2024-05-09', '2024-06-01', 'testing', 'pending', NULL, NULL, NULL, 9, '2024-05-09 08:43:51', '2024-05-09 08:43:51'),
(2, 17, '5', 'yrtyutyu', '567', 2, '2024-06-03', '2024-06-05', 'ytjhrtyj', 'pending', 'rtvbtgh', 'fgfdghgh', 'fghfgh', 13, '2024-06-03 13:26:14', '2024-06-03 13:26:14'),
(3, 17, '5', 'dfe4ter', '543434', 2, '2024-06-05', '2024-06-05', 'sdfgfhfgjh', 'pending', NULL, NULL, NULL, 13, '2024-06-05 06:05:28', '2024-06-05 06:05:28'),
(4, 17, '5', 'ewrr', '56565', 2, '2024-06-07', '2024-06-07', 'turtu', 'pending', NULL, NULL, NULL, 13, '2024-06-07 09:54:46', '2024-06-07 09:54:46'),
(5, 17, '5', 'yyfukuk', '455445', 2, '2024-06-07', '2024-06-07', '', 'pending', NULL, NULL, NULL, 13, '2024-06-07 09:57:07', '2024-06-07 09:57:07'),
(6, 17, '5', 'ykui', '5454', 2, '2024-06-07', '2024-06-07', '', 'pending', NULL, NULL, NULL, 13, '2024-06-07 09:57:50', '2024-06-07 09:57:50'),
(7, 11, '2', 'utjghj', '567567', 1, '2024-06-07', '2024-06-07', '', 'pending', NULL, NULL, NULL, 9, '2024-06-07 10:09:27', '2024-06-07 10:09:27'),
(8, 17, '5', 'fghtyj', '34645', 2, '2024-06-07', '2024-06-07', '', 'pending', NULL, NULL, NULL, 13, '2024-06-07 10:10:50', '2024-06-07 10:10:50'),
(9, 43, '16', 'About the project', '11000', 6, '2024-07-29', '2024-07-29', 'This is description', 'decline', '<p><a href=\"https://www.taskmagix.com/in/app/hom\"><a href=\"https://www.taskmagix.com/in/app/home\">https://www.taskmagix.com/in/app/home</a></a></p><p></p><p><br></p><p><br></p><p><br></p><p></p>', NULL, 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAXwAAAB9CAYAAAChzNjbAAAAAXNSR0IArs4c6QAAFdpJREFUeF7tnWWwNEcVhk+Cu7u7JQQnOMEluBPc3aHQAn5AIYEEdwjuluCEIMFdAsGdoMElWGAeqrvSTHbu3dm7Ozuz/Zyqre9+9450vz37ds857zm9S2giIAIiIAJVILBLFb20kyIgAiIgAiHh+xCIgAiIQCUISPiVDLTdFAEREAEJ32dABERABCpBQMKvZKDtpgiIgAhI+D4DIiACIlAJAhJ+JQNtN0VABERAwvcZEAEREIFKEJDwKxlouykCIiACEr7PgAiIgAhUgoCEX8lA200REAERkPB9BkRABESgEgQk/EoG2m6KgAiIgITvMyACIiAClSAg4Vcy0HZTBERABCR8nwEREAERqAQBCb+SgbabIiACIiDh+wyIgAiIQCUISPiVDLTdFAEREAEJ32dABERABCpBQMKvZKDtpgiIgAhI+D4DIiACIlAJAhJ+JQNtN0VABERAwvcZEAEREIFKEJDwKxlouykCIiACEr7PgAiIgAhUgoCEX8lA200REAERkPB9BkRABESgEgQk/EoG2m6KgAiIgITvMyACIiAClSAg4Vcy0HZTBERABCR8nwEREAERqAQBCb+SgbabIiACIiDh+wyIgAiIQCUISPiVDLTdFIEGgSekj2BUioCEX+nA2+2NROAcEfGLiDh7RHwrIp4fESePiNtv0duPRcSBEfGMjUTETv0fAhK+D4QITAOBE0XEmSPi4hFxwog4dUScJCKuExFHRcRfIuJMEfHPiDg8In4aETdORA75Y3+LiG9ExFUj4sIRcYuIuGRzzMnS5HDfaUBhKxdFQMJfFDnPE4HlInDOiOD7CBmfoFl1XyIijhcRF0v/8vO/E2H/NiI+GxFHRMQvI+JXEfGTBZrDve6TiB93zxMXuIanTAgBCX9Cg2VTJ4/AaSLiDBFxxYg4Y1pl7xYRp0qrdzr414b0PxIRn4uIf0TEpyLi5xHxo7RCXwYITChPi4gbRgQTDUQP4WsbjoCEv+EDbPfWggCkftaIuFxE7J7I/DKN2+T0qTV/iogvRMR30ir9MxHxh4j45ACtZVWPv543COy9aZX/wwHu7S3WjICEv+YB8PaDInD1iLh1WmXjwyaYyQp6UTtfRJwlrdTxrbNqL4n914275OsR8fm0Qj8sET2Evw67R+P/f0p6o8j3pw/fXUdjvOfwCEj4w2PuHYdD4DgR8bCIeEDhMinv/pJmhQ0JbmeoXwhuniIiLpWUL9dMEwfnslLHh/7p9O83I4JVO0HSsRgum8cXjflSUufoyhnLCA3QDgl/AJC9xSAIoFzBH47bBB/5bSMCou6y30XE3RuXy1vTAUgZWXmjdLly+lw+BVJP2/i8TxwRH4+Iv6e3gj8nd8hXB+nd4je5U3LZXLq4BAoeJjrcOVpFCEj4FQ32hnb1ao0M8VYpAIlLpcv+mJQtkNwhyQ3DGwCumJs3q9//JDKHyFG/oIT5aOP2+V5EHB0R6NWnZARmn5MmtbLdBISf1ah/3jGlztjW5SAg4S8HR68yHALnjoibpVUrCpOtjJXskc1q/9tp9Q/p47O/UkScsiH9N0XE79MxByc/+3A9Wc2dmMTQ5r8hIk7auoVqnNVgPpmrSviTGaqqG4o7Yu+IuGki7llg5BU6zzQ/47JB4ohf/RPp//y8UzUK6pt906o/q20IzHKPdRsuLOSWt2w1hFU9ZM+/WsUISPgVD/6Iu46bZZ+I2DMFRlnV79rRXlbolBP4YCJ3kpMgdnTrqzAmk1mG6+ddzZvD/kuYVPq2m+/xg5rM26dHBCv8bLzRvCL9re81PX4DEZDwN3BQJ9AlAqCQOMoXNOsoX/ZIAVPS/LuMFfuXG5878saXJZ/8kN0l0PmiOW64X5M09ehU8mCOw3d0yBWS1JJAdWkHNdr+B6cYxI5u4Mmbg4CEvzljOdaekODDip1s0msUiUhle3GzUOSL+jClUReGICsBU9wRX0zumnX1lTIEz5vz5sQEcPOsSvZ4/KbUwuOa2jmPSUqi3CwmxYenlf2YZKFzwuZhq0RAwl8lunVd+7wRgYyRcgBIHJE2supEu47LBW06JQJ+kMj/Ao0bhtUpapLScMWwOv1aIvtFasSsCvnzpyqU5fWZhAgetyerfMwqAqUEnXEd5WzZfK+XprwDsnY1ETgWAhK+D8WiCEDqrNhxy1w3Is5VJB+xYmelCblTLoDEJEoMkAR1h9YN8Ykjk2Q1/OGkokHrPlajjZQnyMabB5p/Vv+P7Wg0byqvnCGR7NtH8gGe3LoO+OHmIrmMPAFNBDoRkPB9OLZDACKnLC9JTazIqd7IqhblDBUb35dW8EggCVy27UZJYXODIjOVYyg3ANG/ME0M27VjLH+/TUS8rtUY3FEodljpEyQtJ4TyUIK6xAF40+lrD2zyBB7VwpB7orWn7v3P+l7Q4+tDQMKvb8y7ekwgFVfBZdMHvzuKj1zwiySkHzfHfCh9eHa63C3UaUdC+aQmuHq24oaoRg6IiDcOVChsVaNLOeLTFRdvf4+QRrLqp85O23C3UKVy3kQuJkx88ky22fDNMw5MAASwNRGYCwEJfy6YNu4gfNGoZHDJsBrFPVMSGB1+S1qFk6g0DzkRRISc2HSDxKjsm8e1w6oXqSTJQP/aADTb0sxZfnqSn1AS8XY0y5j47t+4ucjsnWWUeMBFdLfGjQO2GK4uzuMDnpoI9EJAwu8F1yQPJmjK6pDEpfOk1Tu/K42VOitG/NHsjjQvmXAdyJ1rUwq4LG1APXf81tSqIWi7ScbuUrwRZbtQCkq3+3jRtDonp2DWd414APV8SlcYbiGKnF2rmCwIhPNW9MhU9mGTsLQvAyIg4Q8I9oC3wi2Dtp0PxbNK+35KDGLVfmgKkvaV7xF4heAhqzLRBz/ya4q3gwG7POit0OKXVTaJc3Rl8IIP8QtW+7OUPGw5yNsApA6hs+1gdgWRVEbNG94gdpohPChA3mycCEj44xyXvq2CJJA5UrIXOWRp+Ixxz7CKJMBKWdy+dpFmcqCWPL5nJpHyDQGSRx3CPd6T1Dl9rz+143FRlRPpVoSf+0ZiGcFe6vC3jTcG4h6lUV6ZCcByCFN7OkbcXgl/xIOzRdMIhOJKuckMguc0kpXenIqGLVLjBX8+Gnr88dyjzH4l8IpGnh2bcNfM49+fJsrdrT4wrdrzEXvNScxMDOw2Ba5d3z0I/sXNBP76TQPN/qwfAQl//WMwbwsojMUqmyArOzWVRh0ZgqvsXPTOiICU5zUyYPFBkzR1lVS/Br13aei8yRyl6iTJPV31ZOa959SPK/tPkbaupKtZ/bxXRNy3owjcb1IwfV07Yk19XGz/NghI+ON+RNguDyJGfpflkbnFr02BPIKtKGHmseMlcmcFT6IQWvpSNpmvwaYeBG7RyuMCYjVfO8lnbNr1dObNpKXEwu1S4HyrsSKQi+usS70zzzh7jAjMREDCH9+DgQuFrFT2XmXlnQ3yJWsVPTyv/WzQsZWhEEHxQcCQxKC8RV979c41KGeAf/8DKduVVas2GwGwoZZ+tq3cOfjrcc1csJBWch5jCbFTVpkCZ/j3SyMozJuAJgJLRUDCXyqcC10MUoCE0cSz6j5NcZX3J5In2LfVRtNs74dqhg9uGXaBOm5Ha9jNiQxX3DNIJw9fYSnhhQAZ8UkEx9k0JRsYEiwvjfwGyBrlDRN3aUzUZBYjscyGTv/dKYO5PJZdvMp7jRgWmzYVBCT84UeKLzgZqGSykgB1omaVh5ImK19engiAYmNI9trGBIF7h1Uh/nwkfPyck3M4ntotqDxQf0Dqv0wZmQRw+ZvWHwGqZDIhl4ZiCXcXxs/3TnGWci/do9J4EuDuCsSSpMakTk0ingeMuv53jAhcd5oILAUBCX8pMG55EVbs7JkKUfPvrMzL5zZqmK+kgCjH4ZMnQIt/nYxLjAmCjFjqx2dDp41bgKAqAT8IHrcP/ncIQ1sOAvjfSYYqDVcO2nhKSOCbZ3xKw032gpRlTCmGeQz1ztuLA6m5w+5VFkWbBz2P2RYBCX9biBY+gJT46yVZ46yL4IPny41bgEmB4Gx7E4vyPIqTQe45C5bX/VlvAAs32BNnIkASG8lPOYsYNRSBbGIi/K00Jlkkm7wNMPH2TWjjWrwpIKnN+/XyhsDkz/U0EdgRAhL+juA71snXT+6adhCuvfLDb87qnYSmtkHskDoTAis8JHr4fikx3Eduudye1Xs1Sjxn8mUscL+xr21plKPATYcvfrtg+jxIEhRGXpuT6IjfPDRNJvOc7zEiMBMBCX85DwbyyZdEBMqYLju6Y19WfMAkMhFkJf0eBYeSvOWMy06uQkkElDRUEJ1lkD+reXzvSGNXUcOfSYRKmchpqVTKfgKs/jURWAgBCX8h2P53EgE6pJPsOnTSBS5DNiWfHPRb4BKesgIEUNbgkyfeguKmNALpkDslJFA64W5ZtT0iVc3M2c5sgMJEMG/uxarb5/UnhICEP/9gEZRDNYGSAnVNX/t1kuOh1rA+Sl/0ln88CicS0PiQgMbGLqhryDxuG29cTAK4WdZhlJ1GrZPr7VDL564mw61jKKZ9Twm/e/zQXBN0xY9KKdyy9O9Wo45yhpU7ATuCrL6Cj+s7guqJXIQuw1VDMLwMyOK2QdKavy9MEqzuibHwO6SUuOT4mZwIspJxCfEvv+NcFFS4fdgPAGksLr4+FTDJ0+DNAvcOhsQTF89WfRkX8rZm7QhI+McMASt4VlIkLnVtUdc1YPhXedVmgw83kF77Y71lA0iKQi45Bsvkz34BSGt3TXJaJorswoHgmUw4hoD+PYta/Eh5Ke3AM8ffVW2NYVRH3IYaCR+/O9ppjFVXJvesxOgzXCQ1PTvJ9gy09kFufcfiFqE8BVLYRcZ8fS3f/s7U1OfNMtc9oiYSixESu3jjYEIgP4BSGxgTCb/nw8TChMPPlLxGKYZaiEmJNxMmlD5vJNu31iMGR6A2wmcXIcoV7NTQWaODr7E08E6xG9P5WUtP5jKuGEpOn7doIG6bvBsVE8WyJgiknrh5IFjIlKA/5TVmfR8hYEpmdJXK2A5Pgrvl7lzbHb/V36kjRK5BdlNlfMgSx33JhIJ7i0nHONVOkF7RubURPityElsWMV6bkV4+M/luF7mG54wXgXY2LQlWJMOVBuGzWs7Zz/P0htU2z92yVTVMUK9OaqLcDsous10lyjGye8nb4MP/+a4TkGbFzuTFBEJZDq7TZbulCYns8C6uIMN7VkE+cgeYzJhMmQww3qywg1SnzfPoLP+Y2ggfnTx+z3mNh5mVPLs5ocnWNhMBArTlPr4QFGQ3doO4923cNndJtZR4XlHvkB+wKoMzSBok+Qw3EGTPnsn8jtU9kyGuIPYIYHKZNRnQtiPT4ks30apGasZ1ayN8IEB+d7/0xZgFNb54NvlAPkkS1BBa6wGH3FvNQKC9ZSH1a6akrnpc2g4R1w0qI7a6pHjeKg2Z6m3TW1C55WWfe1I5lHwWbSAEaiT8DC1FyHjYWMlB8pQ7+GKzWmH3KK0eBHDT4FPPNu+GJmNDiEmKDeRZdePWQZywzPo7rOLZ/IXMY7ZqnMcIGhOfQHGElDUb7h4+5LRoAyJQM+EPCLO3GjECuOqyUgudO/WQpmrU4Cc5jFLZuHeIV6HKWdRIRGMjdTbRwd+/neEu3b9Q8xi43Q6xgf8u4Q8MuLcbHQKUS8ibmCCxfeDoWtivQUiOSfxDdsoKm5U/xd36GKqgByXVEiqhLqNQHEIGiJ17lG9Kfe7nsQMhIOEPBLS3GSUC5Q5WBA/ndVWMsjNFo1AXsasWgVVclGx6zyY42xlvOk9tMnopBthlhzWb9eyX3EVMltqEEJDwJzRYNnWpCJB8xD6+rGYxiA73xabY3o0M81mpABwBaNQ7BHTbhrLm7qnvXXJT6v+/KpV/pky3NlEEJPyJDpzN3jEC106Eny+EHn0VJY533NAdXACpJNp33lyQJFOGOxsTHXsf47qZJZ0keYqNX5AlvytJLHfQFE8dAwIS/hhGwTasAwGIDJcORjIdG4xsohF4pU4U2nyqgkL07MbGVprt7z8F3cgAflHajW3ZyWKbiO+k+iThT2q4bOySEMBXXSbSbfL3gF3VcO8g0yQHpW2QPCv4g1MGrIlQS3rIxniZTX7Qx4i3bRoHAvjr2VgEw7+NkmUTjCAtbhqCttQJIsdkVukEat6grCG7mHpQO5FubgJu1fRBwq9mqO1ogUC5T+3UsmpzN87e7HO8T9Lak9yEqyaXVM7HUMeHFTu7dKGRJ/sWP77Z45V+HST8Sge+4m7ju87FvMisZjU8xmAtxc3wvRNspWAbhE6NGtwzFETLJY7bQ0mhNvqHHJMa+9bIr/hhb3ddwvdhqA2BUns/Fikm1Shxv5yvSZriZ2IM7Uqd7XFikqKiJyt4XDKQOyTPHg+aCMxEQML3wagNAfYyuE/qNKUIlrE/Ql8Mectgtc7+DBTywxVDOYS2Qd5sck9gFUJnS8XPplU75Y81EeiFgITfCy4P3gAESjkmVR5xj6zSdk/lg9lYZY/kc4fss1FCmJgCZQpYqeNnx9VELRyyWjURWBoCEv7SoPRCE0CAlXQmeFQqe62ozbw54JIhuatdpoBdo8hcxddOxcj3pi0FV9QULysCxyAg4fs01IRAqb9fJuHv2ahgbpIkke0d1dhTgRIOSCAh+iNqAty+jgsBCX9c42FrVosA9dcpgYxRP4aNbhY1NgBBMXOr1gXYW+GQiDg0adzxuWsiMAoEJPxRDIONGAiBvNnJAY2//M4973nztIqnLk0uuJYvgXsG1wwreZQzmgiMEgEJf5TDYqNWhACZqOwGRXnfh3TcAz8/EwMbf18v7c16jRnHQu5vS2UJUM9oIjB6BCT80Q+RDVwiAiQrkZTEKpxaOjz/bN2HUoaaM+zqdMaO+yHfZDcpipD9bIlt8lIiMBgCEv5gUHujkSDwhIh4fEdb2NDjFxHx/fQmwP8hepQ1mghMHgEJf/JDaAcWQACXDUlNbGSv1n0BAD1lmghI+NMcN1stAiIgAr0RkPB7Q+YJIiACIjBNBCT8aY6brRYBERCB3ghI+L0h8wQREAERmCYCEv40x81Wi4AIiEBvBCT83pB5ggiIgAhMEwEJf5rjZqtFQAREoDcCEn5vyDxBBERABKaJgIQ/zXGz1SIgAiLQGwEJvzdkniACIiAC00RAwp/muNlqERABEeiNgITfGzJPEAEREIFpIiDhT3PcbLUIiIAI9EZAwu8NmSeIgAiIwDQRkPCnOW62WgREQAR6IyDh94bME0RABERgmghI+NMcN1stAiIgAr0RkPB7Q+YJIiACIjBNBCT8aY6brRYBERCB3ghI+L0h8wQREAERmCYCEv40x81Wi4AIiEBvBCT83pB5ggiIgAhMEwEJf5rjZqtFQAREoDcCEn5vyDxBBERABKaJgIQ/zXGz1SIgAiLQGwEJvzdkniACIiAC00Tgv0csJ6smEgOwAAAAAElFTkSuQmCC', 39, '2024-07-29 10:58:32', '2024-08-13 11:15:36'),
(11, 43, '16', 'About the project', '2000', 7, '2024-07-30', '2024-07-30', '', 'accept', NULL, 'data:image/png;base64,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', 'data:image/png;base64,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', 39, '2024-07-30 13:10:14', '2024-08-22 10:22:51'),
(13, 43, '16', 'Subject of project', '100', 6, '2024-08-13', '2024-08-13', '', 'pending', NULL, NULL, 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAXwAAAB9CAYAAAChzNjbAAAAAXNSR0IArs4c6QAABDZJREFUeF7t1AERAAAIAjHpX9ogPxswOXaOAAECBBICS6QUkgABAgTO4CsBAQIEIgIGP/JoMQkQIGDwdYAAAQIRAYMfebSYBAgQMPg6QIAAgYiAwY88WkwCBAgYfB0gQIBARMDgRx4tJgECBAy+DhAgQCAiYPAjjxaTAAECBl8HCBAgEBEw+JFHi0mAAAGDrwMECBCICBj8yKPFJECAgMHXAQIECEQEDH7k0WISIEDA4OsAAQIEIgIGP/JoMQkQIGDwdYAAAQIRAYMfebSYBAgQMPg6QIAAgYiAwY88WkwCBAgYfB0gQIBARMDgRx4tJgECBAy+DhAgQCAiYPAjjxaTAAECBl8HCBAgEBEw+JFHi0mAAAGDrwMECBCICBj8yKPFJECAgMHXAQIECEQEDH7k0WISIEDA4OsAAQIEIgIGP/JoMQkQIGDwdYAAAQIRAYMfebSYBAgQMPg6QIAAgYiAwY88WkwCBAgYfB0gQIBARMDgRx4tJgECBAy+DhAgQCAiYPAjjxaTAAECBl8HCBAgEBEw+JFHi0mAAAGDrwMECBCICBj8yKPFJECAgMHXAQIECEQEDH7k0WISIEDA4OsAAQIEIgIGP/JoMQkQIGDwdYAAAQIRAYMfebSYBAgQMPg6QIAAgYiAwY88WkwCBAgYfB0gQIBARMDgRx4tJgECBAy+DhAgQCAiYPAjjxaTAAECBl8HCBAgEBEw+JFHi0mAAAGDrwMECBCICBj8yKPFJECAgMHXAQIECEQEDH7k0WISIEDA4OsAAQIEIgIGP/JoMQkQIGDwdYAAAQIRAYMfebSYBAgQMPg6QIAAgYiAwY88WkwCBAgYfB0gQIBARMDgRx4tJgECBAy+DhAgQCAiYPAjjxaTAAECBl8HCBAgEBEw+JFHi0mAAAGDrwMECBCICBj8yKPFJECAgMHXAQIECEQEDH7k0WISIEDA4OsAAQIEIgIGP/JoMQkQIGDwdYAAAQIRAYMfebSYBAgQMPg6QIAAgYiAwY88WkwCBAgYfB0gQIBARMDgRx4tJgECBAy+DhAgQCAiYPAjjxaTAAECBl8HCBAgEBEw+JFHi0mAAAGDrwMECBCICBj8yKPFJECAgMHXAQIECEQEDH7k0WISIEDA4OsAAQIEIgIGP/JoMQkQIGDwdYAAAQIRAYMfebSYBAgQMPg6QIAAgYiAwY88WkwCBAgYfB0gQIBARMDgRx4tJgECBAy+DhAgQCAiYPAjjxaTAAECBl8HCBAgEBEw+JFHi0mAAAGDrwMECBCICBj8yKPFJECAgMHXAQIECEQEDH7k0WISIEDA4OsAAQIEIgIGP/JoMQkQIGDwdYAAAQIRAYMfebSYBAgQMPg6QIAAgYiAwY88WkwCBAgYfB0gQIBARMDgRx4tJgECBAy+DhAgQCAiYPAjjxaTAAECBl8HCBAgEBF4thcAftRC30YAAAAASUVORK5CYII=', 39, '2024-08-13 11:08:22', '2024-08-14 05:09:15'),
(14, 43, '16', 'target', '100', 6, '2024-08-14', '2024-08-14', '', 'pending', NULL, NULL, 'data:image/png;base64,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', 39, '2024-08-14 06:03:54', '2024-08-14 06:04:57');
INSERT INTO `contracts` (`id`, `client`, `project`, `subject`, `value`, `type`, `start_date`, `end_date`, `notes`, `status`, `contract_description`, `client_signature`, `owner_signature`, `created_by`, `created_at`, `updated_at`) VALUES
(15, 51, '84', 'hghjghj yuhj', '66666', 8, '2024-10-01', '2024-10-01', '', 'accept', NULL, 'data:image/png;base64,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', 'data:image/png;base64,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', 48, '2024-10-01 10:15:07', '2024-10-01 11:45:08'),
(17, 51, '84', 'new contract', '15000', 8, '2025-02-08', '2025-02-21', 'This is a new contract', 'accept', NULL, 'data:image/png;base64,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', 'data:image/png;base64,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', 48, '2025-02-08 12:41:01', '2025-02-10 07:27:20'),
(18, 51, '84', 'hghjghj yuhj', '66666', 8, '2025-02-10', '2025-02-10', '', 'pending', NULL, NULL, NULL, 48, '2025-02-10 07:22:51', '2025-02-10 07:22:51'),
(19, 51, '110', 'Additional Contract', '5000', 8, '2025-02-12', '2025-02-20', 'This isa addition contract.', 'pending', NULL, NULL, NULL, 48, '2025-02-12 11:07:54', '2025-02-12 11:07:54'),
(20, 51, '114', 'Contact Pro', '2022', 8, '2025-02-14', '2025-02-28', 'This is pro contract', 'pending', NULL, NULL, NULL, 48, '2025-02-14 07:43:39', '2025-02-14 07:43:39');

-- --------------------------------------------------------

--
-- Table structure for table `contract_attechments`
--

CREATE TABLE `contract_attechments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contract_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `files` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extension` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contract_attechments`
--

INSERT INTO `contract_attechments` (`id`, `contract_id`, `user_id`, `files`, `created_by`, `name`, `extension`, `file_size`, `created_at`, `updated_at`) VALUES
(5, 9, 39, '91722332597_#CON00009 (4).pdf', 39, '1722332597#CON00009 (4).pdf', 'pdf', NULL, '2024-07-30 09:43:17', '2024-07-30 09:43:17'),
(6, 15, 48, '151727784333_number-2_6335569.png', 48, '1727784333number-2_6335569.png', 'png', NULL, '2024-10-01 12:05:33', '2024-10-01 12:05:33'),
(7, 15, 48, '151727784336_number-2_6335569.png', 48, '1727784336number-2_6335569.png', 'png', NULL, '2024-10-01 12:05:36', '2024-10-01 12:05:36'),
(8, 17, 51, '171739172389_payment_1686386876_1739166950.png', 51, '1739172389payment_1686386876_1739166950.png', 'png', NULL, '2025-02-10 07:26:29', '2025-02-10 07:26:29');

-- --------------------------------------------------------

--
-- Table structure for table `contract_comments`
--

CREATE TABLE `contract_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contract_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contract_comments`
--

INSERT INTO `contract_comments` (`id`, `contract_id`, `user_id`, `comment`, `created_by`, `created_at`, `updated_at`) VALUES
(2, 9, '39', 'Comments here', 39, '2024-07-30 10:10:14', '2024-07-30 10:10:14'),
(3, 17, '51', 'gfggg tggertr', 51, '2025-02-10 07:26:34', '2025-02-10 07:26:34'),
(4, 17, '51', 'tggertet', 51, '2025-02-10 07:26:39', '2025-02-10 07:26:39'),
(5, 17, '48', 'ythyht', 48, '2025-02-10 07:29:16', '2025-02-10 07:29:16');

-- --------------------------------------------------------

--
-- Table structure for table `contract_notes`
--

CREATE TABLE `contract_notes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contract_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contract_notes`
--

INSERT INTO `contract_notes` (`id`, `contract_id`, `user_id`, `note`, `created_by`, `created_at`, `updated_at`) VALUES
(2, 9, 39, 'Notes here', 39, '2024-07-30 10:10:35', '2024-07-30 10:10:35'),
(3, 17, 51, 'tgg trtwertt tert', 51, '2025-02-10 07:26:44', '2025-02-10 07:26:44'),
(4, 17, 51, 'ertertertert', 51, '2025-02-10 07:26:49', '2025-02-10 07:26:49'),
(5, 17, 48, 'hjhj', 48, '2025-02-10 07:29:29', '2025-02-10 07:29:29');

-- --------------------------------------------------------

--
-- Table structure for table `contract_types`
--

CREATE TABLE `contract_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contract_types`
--

INSERT INTO `contract_types` (`id`, `name`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'demo', 9, '2024-05-09 08:35:27', '2024-05-09 08:35:27'),
(2, 'Contract Type', 13, '2024-06-03 13:10:09', '2024-06-03 13:10:09'),
(3, '@@@@@@@@', 19, '2024-06-04 11:54:31', '2024-06-04 11:54:31'),
(4, 'C', 35, '2024-07-17 11:50:46', '2024-07-17 11:50:46'),
(5, 'C1', 35, '2024-07-18 05:49:17', '2024-07-18 05:49:17'),
(6, 'Contract type A', 39, '2024-07-29 10:56:30', '2024-07-29 10:56:30'),
(7, 'Contract type B', 39, '2024-07-30 13:08:22', '2024-07-30 13:08:22'),
(8, 'simple Contract', 48, '2024-10-01 10:14:35', '2024-10-01 10:14:35'),
(9, 'tester', 400, '2025-04-24 04:34:38', '2025-04-24 04:34:38');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` double(8,2) NOT NULL DEFAULT '0.00',
  `limit` int(11) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_active` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `name`, `code`, `discount`, `limit`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'demo', 'EIFEHP0H7L', 10.00, 1, NULL, 1, '2024-06-07 07:17:09', '2024-06-07 07:18:08');

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keyword` text COLLATE utf8mb4_unicode_ci,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `name`, `from`, `keyword`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'User Invited', 'Task Magix', 'Email : {email},Password : {password}', 1, '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(2, 'Project Assigned', 'Task Magix', 'Project Name : {project_name},Project Status : {project_status},Project Budget : {project_budget},Project Hours : {project_hours}', 1, '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(3, 'Task Assigned', 'Task Magix', 'Task Name : {task_name},Task Priority : {task_priority},Task Project : {task_project},Task Stage : {task_stage}', 1, '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(4, 'New Timesheet', 'Task Magix', 'Timesheet Project : {timesheet_project},Timesheet Task : {timesheet_task},Timesheet Time : {timesheet_time},Timesheet Date : {timesheet_date}', 1, '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(5, 'Contract Shared', 'Task Magix', 'Client Name : {client_name},Contract Name : {contract_name},Contract Type : {contract_type}, Contract Value : {contract_value}, Start Date : {start_date}, End Date : {end_date}', 1, '2024-02-26 12:05:54', '2024-02-26 12:05:54');

-- --------------------------------------------------------

--
-- Table structure for table `email_template_langs`
--

CREATE TABLE `email_template_langs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL,
  `lang` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_template_langs`
--

INSERT INTO `email_template_langs` (`id`, `parent_id`, `lang`, `subject`, `from`, `content`, `created_at`, `updated_at`) VALUES
(1, 1, 'ar', 'User Invited', 'Task Magix', '<p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\">مرحبا،&nbsp;<br>مرحبا بك في {app_name}.</p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\"><span style=\"font-weight: bolder;\">البريد الإلكتروني&nbsp;</span>: {email}<br><span style=\"font-weight: bolder;\">كلمه السر</span>&nbsp;: {password}</p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\">{app_url}</p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\">شكر،<br>{app_name}</p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(2, 1, 'da', 'User Invited', 'Task Magix', '<p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\">Hej,&nbsp;<br>Velkommen til {app_name}.</p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\"><span style=\"font-weight: bolder;\">E-mail&nbsp;</span>: {email}<br><span style=\"font-weight: bolder;\">Adgangskode</span>&nbsp;: {password}</p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\">{app_url}</p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\">Tak,<br>{app_name}</p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(3, 1, 'de', 'User Invited', 'Task Magix', '<p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\">Hallo,&nbsp;<br>Willkommen zu {app_name}.</p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\"><span style=\"font-weight: bolder;\">Email&nbsp;</span>: {email}<br><span style=\"font-weight: bolder;\">Passwort</span>&nbsp;: {password}</p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\">{app_url}</p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\">Vielen Dank,<br>{app_name}</p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(4, 1, 'en', 'User Invited', 'Task Magix', '<p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\">Hello,&nbsp;<br>Welcome to {app_name}.</p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\"><span style=\"font-weight: bolder;\">Email&nbsp;</span>: {email}<br><span style=\"font-weight: bolder;\">Password</span>&nbsp;: {password}</p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\">{app_url}</p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\">Thanks,<br>{app_name}</p>', '2024-02-26 12:05:54', '2025-02-11 09:51:33'),
(5, 1, 'es', 'User Invited', 'Task Magix', '<p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\">Hola,&nbsp;<br>Bienvenido a {app_name}.</p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\"><span style=\"font-weight: bolder;\">Email&nbsp;</span>: {email}<br><span style=\"font-weight: bolder;\">Contraseña</span>&nbsp;: {password}</p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\">{app_url}</p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\">Gracias,<br>{app_name}</p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(6, 1, 'fr', 'User Invited', 'Task Magix', '<p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\">Bonjour,&nbsp;<br>Bienvenue à {app_name}.</p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\"><span style=\"font-weight: bolder;\">Email&nbsp;</span>: {email}<br><span style=\"font-weight: bolder;\">Mot de passe</span>&nbsp;: {password}</p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\">{app_url}</p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\">Merci,<br>{app_name}</p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(7, 1, 'it', 'User Invited', 'Task Magix', '<p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\">Ciao,&nbsp;<br>Benvenuto a {app_name}.</p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\"><span style=\"font-weight: bolder;\">E-mail&nbsp;</span>: {email}<br><span style=\"font-weight: bolder;\">Parola d\'ordine</span>&nbsp;: {password}</p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\">{app_url}</p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\">Grazie,<br>{app_name}</p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(8, 1, 'ja', 'User Invited', 'Task Magix', '<p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\">こんにちは、&nbsp;<br>へようこそ {app_name}.</p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\"><span style=\"font-weight: bolder;\">Eメール&nbsp;</span>: {email}<br><span style=\"font-weight: bolder;\">パスワード</span>&nbsp;: {password}</p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\">{app_url}</p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\">おかげで、<br>{app_name}</p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(9, 1, 'nl', 'User Invited', 'Task Magix', '<p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\">Hallo,&nbsp;<br>Welkom bij {app_name}.</p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\"><span style=\"font-weight: bolder;\">E-mail&nbsp;</span>: {email}<br><span style=\"font-weight: bolder;\">Wachtwoord</span>&nbsp;: {password}</p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\">{app_url}</p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\">Bedankt,<br>{app_name}</p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(10, 1, 'pl', 'User Invited', 'Task Magix', '<p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\">Dzień dobry,&nbsp;<br>Witamy w {app_name}.</p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\"><span style=\"font-weight: bolder;\">E-mail&nbsp;</span>: {email}<br><span style=\"font-weight: bolder;\">Hasło</span>&nbsp;: {password}</p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\">{app_url}</p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\">Dzięki,<br>{app_name}</p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(11, 1, 'ru', 'User Invited', 'Task Magix', '<p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\">Привет,&nbsp;<br>Добро пожаловать в {app_name}.</p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\"><span style=\"font-weight: bolder;\">Эл. адрес&nbsp;</span>: {email}<br><span style=\"font-weight: bolder;\">пароль</span>&nbsp;: {password}</p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\">{app_url}</p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\">Спасибо,<br>{app_name}</p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(12, 1, 'pt', 'User Invited', 'Task Magix', '<p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\">Olá   ,&nbsp;<br>Bem-vindo ao {app_name}.</p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\"><span style=\"font-weight: bolder;\">E-mail&nbsp;</span>: {email}<br><span style=\"font-weight: bolder;\">Senha</span>&nbsp;: {password}</p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\">{app_url}</p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\">Obrigada,<br>{app_name}</p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(13, 1, 'tr', 'User Invited', 'Task Magix', '<p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\">Merhaba, &nbsp;<br>{ app_name } olanağına hoş geldiniz.</p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\"><span style=\"font-weight: bolder;\">E-mail&nbsp;</span>: {email}<br><span style=\"font-weight: bolder;\">Parola</span>&nbsp;: {password}</p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\">{app_url}</p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\">Teşekkürler.<br>{app_name}</p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(14, 1, 'zh', 'User Invited', 'Task Magix', '<p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\">您好，<br>欢迎访问 {app_name}。</p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\"><span style=\"font-weight: bolder;\">电子邮件&nbsp;</span>: {email}<br><span style=\"font-weight: bolder;\">密码</span>&nbsp;: {password}</p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\">{app_url}</p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\">谢谢<br>{app_name}</p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(15, 1, 'he', 'User Invited', 'Task Magix', '<p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\">הלו,&nbsp;<br>ברוכים הבאים ל - {app_name}.</p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\"><span style=\"font-weight: bolder;\">דוא \" ל&nbsp;</span>: {email}<br><span style=\"font-weight: bolder;\">סיסמה</span>&nbsp;: {password}</p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\">{app_url}</p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\">תודה,<br>{app_name}</p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(16, 1, 'pt-br', 'User Invited', 'Task Magix', '<p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\">Olá   ,&nbsp;<br>Bem-vindo ao {app_name}.</p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\"><span style=\"font-weight: bolder;\">E-mail&nbsp;</span>: {email}<br><span style=\"font-weight: bolder;\">Senha</span>&nbsp;: {password}</p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\">{app_url}</p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\">Obrigada,<br>{app_name}</p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(17, 2, 'ar', 'New Project Assigned', 'Task Magix', '<p>مرحبا،</p><p>تم تعيين مشروع جديد لك.</p><p><b>اسم المشروع </b>: {project_name}<br><b>حالة المشروع </b>:<b>&nbsp;</b>{project_status}<br><b>ميزانية المشروع </b>:<b> </b>{project_budget}<br><b>ساعات المشروع </b>:<b> </b>{project_hours}</p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(18, 2, 'da', 'New Project Assigned', 'Task Magix', '<p>Hej,</p><p>Der er tildelt nyt projekt til dig.</p><p><b>Projekt navn </b>: {project_name}<br><b>Projektstatus </b>:<b>&nbsp;</b>{project_status}<br><b>Projektbudget </b>:<b> </b>{project_budget}<br><b>Projekt timer </b>:<b> </b>{project_hours}</p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(19, 2, 'de', 'New Project Assigned', 'Task Magix', '<p>Hallo,</p><p>Ihnen wurde ein neues Projekt zugewiesen.</p><p><b>Projektname </b>: {project_name}<br><b>Projekt-Status </b>:<b>&nbsp;</b>{project_status}<br><b>Projektbudget </b>:<b> </b>{project_budget}<br><b>Projektstunden </b>:<b> </b>{project_hours}</p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(20, 2, 'en', 'New Project Assigned', 'Task Magix', '<p>Hello,</p><p>New Project has been assigned to you.</p><p><b>Project Name </b>: {project_name}<br><b>Project Status </b>:<b>&nbsp;</b>{project_status}<br><b>Project Budget </b>:<b> </b>{project_budget}<br><b>Project Hours </b>:<b> </b>{project_hours}</p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(21, 2, 'es', 'New Project Assigned', 'Task Magix', '<p>Hola,</p><p>Se le ha asignado un nuevo proyecto.</p><p><b>Nombre del proyecto </b>: {project_name}<br><b>Estado del proyecto </b>:<b>&nbsp;</b>{project_status}<br><b>Presupuesto del proyecto </b>:<b> </b>{project_budget}<br><b>Horas del proyecto </b>:<b> </b>{project_hours}</p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(22, 2, 'fr', 'New Project Assigned', 'Task Magix', '<p>Bonjour,</p><p>Un nouveau projet vous a été attribué.</p><p><b>nom du projet </b>: {project_name}<br><b>L\'état du projet </b>:<b>&nbsp;</b>{project_status}<br><b>Budget du projet </b>:<b> </b>{project_budget}<br><b>Heures du projet </b>:<b> </b>{project_hours}</p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(23, 2, 'it', 'New Project Assigned', 'Task Magix', '<p>Ciao,</p><p>Nuovo progetto ti è stato assegnato.</p><p><b>Nome del progetto </b>: {project_name}<br><b>Stato del progetto </b>:<b>&nbsp;</b>{project_status}<br><b>Budget del progetto </b>:<b> </b>{project_budget}<br><b>Ore del progetto </b>:<b> </b>{project_hours}</p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(24, 2, 'ja', 'New Project Assigned', 'Task Magix', '<p>こんにちは、</p><p>新しいプロジェクトが割り当てられました。</p><p><b>プロジェクト名 </b>: {project_name}<br><b>プロジェクトの状況 </b>:<b>&nbsp;</b>{project_status}<br><b>プロジェクト予算 </b>:<b> </b>{project_budget}<br><b>プロジェクト時間 </b>:<b> </b>{project_hours}</p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(25, 2, 'nl', 'New Project Assigned', 'Task Magix', '<p>Hallo,</p><p>Nieuw project is aan u toegewezen.</p><p><b>Naam van het project </b>: {project_name}<br><b>Project status </b>:<b>&nbsp;</b>{project_status}<br><b>Project budget </b>:<b> </b>{project_budget}<br><b>Projecturen </b>:<b> </b>{project_hours}</p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(26, 2, 'pl', 'New Project Assigned', 'Task Magix', '<p>Dzień dobry,</p><p>Nowy projekt został Ci przypisany.</p><p><b>Nazwa Projektu </b>: {project_name}<br><b>Stan projektu </b>:<b>&nbsp;</b>{project_status}<br><b>Budżet projektu </b>:<b> </b>{project_budget}<br><b>Godziny projektu </b>:<b> </b>{project_hours}</p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(27, 2, 'ru', 'New Project Assigned', 'Task Magix', '<p>Привет,</p><p>Новый проект был назначен вам.</p><p><b>название проекта </b>: {project_name}<br><b>Статус проекта </b>:<b>&nbsp;</b>{project_status}<br><b>Бюджет проекта </b>:<b> </b>{project_budget}<br><b>Часы работы проекта </b>:<b> </b>{project_hours}</p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(28, 2, 'pt', 'New Project Assigned', 'Task Magix', '<p>Olá,</p><p>Novo Projeto foi atribuído a você.</p><p><b>Nome do Projeto </b>: {project_name}<br><b>Status do Projeto </b>:<b>&nbsp;</b>{project_status}<br><b>Orçamento do Projeto </b>:<b> </b>{project_budget}<br><b>Projeto Horas </b>:<b> </b>{project_hours}</p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(29, 2, 'tr', 'New Project Assigned', 'Task Magix', '<p>Merhaba,</p><p>Yeni Proje size atandı.</p><p><b>Proje Adı </b>: { project_name }<br><b>Proje Durumu </b>:<b>&nbsp;</b>{ project_status }<br><b>Proje Bütçesi </b>:<b> </b>{ project_budget }<br><b>Proje Saatleri </b>:<b> </b>{ project_hours }</p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(30, 2, 'zh', 'New Project Assigned', 'Task Magix', '<p>你好啊,</p><p>已将新项目分配给您.</p><p><b>项目名称 </b>: {project_name}<br><b>项目状态 </b>:<b>&nbsp;</b>{project_status}<br><b>项目预算</b>:<b> </b>{project_budget}<br><b>项目时间</b>:<b> </b>{project_hours}</p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(31, 2, 'he', 'New Project Assigned', 'Task Magix', '<p>הלו,</p><p>הפרויקט החדש הוקצה לכם.</p><p><b>שם הפרויקט </b>: {project_name}<br><b>סטטוס הפרויקט </b>:<b>&nbsp;</b>{project_status}<br><b>תקציב פרויקט </b>:<b> </b>{project_budget}<br><b>שעות הפרויקט </b>:<b> </b>{project_hours}</p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(32, 2, 'pt-br', 'New Project Assigned', 'Task Magix', '<p>Olá,</p><p>Novo Projeto foi atribuído a você.</p><p><b>Nome do Projeto </b>: {project_name}<br><b>Status do Projeto </b>:<b>&nbsp;</b>{project_status}<br><b>Orçamento do Projeto </b>:<b> </b>{project_budget}<br><b>Projeto Horas </b>:<b> </b>{project_hours}</p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(33, 3, 'ar', 'New Task Assigned', 'Task Magix', '<p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\"><span style=\"font-family: sans-serif;\">مرحبا،</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">تم تعيين مهمة جديدة لك.</span></p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\"><span style=\"font-family: sans-serif;\"><b>مهمة </b><span style=\"font-weight: bolder;\">اسم</span>&nbsp;: {task_name}<br><span style=\"font-weight: bolder;\">أولوية المهمة</span>&nbsp;: {task_priority}<br><b>مشروع المهمة </b>: {task_project}<b>&nbsp;<br>مرحلة المهمة </b>: {task_stage}</span></p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(34, 3, 'da', 'New Task Assigned', 'Task Magix', '<p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\"><span style=\"font-family: sans-serif;\">Hej,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">Ny opgave er blevet tildelt til dig.</span></p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\"><span style=\"font-family: sans-serif;\"><b>Opgave </b><span style=\"font-weight: bolder;\">Navn</span>&nbsp;: {task_name}<br><span style=\"font-weight: bolder;\">Opgaveprioritet</span>&nbsp;: {task_priority}<br><b>Opgaveprojekt </b>: {task_project}<b>&nbsp;<br>Opgavefase </b>: {task_stage}</span></p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(35, 3, 'de', 'New Task Assigned', 'Task Magix', '<p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\"><span style=\"font-family: sans-serif;\">Hallo,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">Neue Aufgabe wurde Ihnen zugewiesen.</span></p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\"><span style=\"font-family: sans-serif;\"><b>Aufgabe </b><span style=\"font-weight: bolder;\">Name</span>&nbsp;: {task_name}<br><span style=\"font-weight: bolder;\">Aufgabenpriorität</span>&nbsp;: {task_priority}<br><b>Aufgabenprojekt </b>: {task_project}<b>&nbsp;<br>Aufgabenphase </b>: {task_stage}</span></p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(36, 3, 'en', 'New Task Assigned', 'Task Magix', '<p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\"><span style=\"font-family: sans-serif;\">Hello,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">New Task has been Assign to you.</span></p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\"><span style=\"font-family: sans-serif;\"><b>Task </b><span style=\"font-weight: bolder;\">Name</span>&nbsp;: {task_name}<br><span style=\"font-weight: bolder;\">Task Priority</span>&nbsp;: {task_priority}<br><b>Task Project </b>: {task_project}<b>&nbsp;<br>Task Stage </b>: {task_stage}</span></p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(37, 3, 'es', 'New Task Assigned', 'Task Magix', '<p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\"><span style=\"font-family: sans-serif;\">Hola,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">Nueva tarea ha sido asignada a usted.</span></p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\"><span style=\"font-family: sans-serif;\"><b>Tarea </b><span style=\"font-weight: bolder;\">Nombre</span>&nbsp;: {task_name}<br><span style=\"font-weight: bolder;\">Prioridad de tarea</span>&nbsp;: {task_priority}<br><b>Proyecto de tarea </b>: {task_project}<b>&nbsp;<br>Etapa de tarea </b>: {task_stage}</span></p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(38, 3, 'fr', 'New Task Assigned', 'Task Magix', '<p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\"><span style=\"font-family: sans-serif;\">Bonjour,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">Une nouvelle tâche vous a été assignée.</span></p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\"><span style=\"font-family: sans-serif;\"><b>Tâche </b><span style=\"font-weight: bolder;\">Nom</span>&nbsp;: {task_name}<br><span style=\"font-weight: bolder;\">Priorité des tâches</span>&nbsp;: {task_priority}<br><b>Projet de tâche </b>: {task_project}<b>&nbsp;<br>Étape de la tâche </b>: {task_stage}</span></p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(39, 3, 'it', 'New Task Assigned', 'Task Magix', '<p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\"><span style=\"font-family: sans-serif;\">Ciao,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">La nuova attività è stata assegnata a te.</span></p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\"><span style=\"font-family: sans-serif;\"><b>Compito </b><span style=\"font-weight: bolder;\">Nome</span>&nbsp;: {task_name}<br><span style=\"font-weight: bolder;\">Priorità dell\'attività</span>&nbsp;: {task_priority}<br><b>Progetto di attività </b>: {task_project}<b>&nbsp;<br>Fase delle attività </b>: {task_stage}</span></p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(40, 3, 'ja', 'New Task Assigned', 'Task Magix', '<p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\"><span style=\"font-family: sans-serif;\">こんにちは、</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">新しいタスクが割り当てられました。</span></p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\"><span style=\"font-family: sans-serif;\"><b>仕事 </b><span style=\"font-weight: bolder;\">名前</span>&nbsp;: {task_name}<br><span style=\"font-weight: bolder;\">タスクの優先度</span>&nbsp;: {task_priority}<br><b>タスクプロジェクト </b>: {task_project}<b>&nbsp;<br>タスクステージ </b>: {task_stage}</span></p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(41, 3, 'nl', 'New Task Assigned', 'Task Magix', '<p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\"><span style=\"font-family: sans-serif;\">Hallo,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">Nieuwe taak is aan u toegewezen.</span></p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\"><span style=\"font-family: sans-serif;\"><b>Taak </b><span style=\"font-weight: bolder;\">Naam</span>&nbsp;: {task_name}<br><span style=\"font-weight: bolder;\">Taakprioriteit</span>&nbsp;: {task_priority}<br><b>Taakproject </b>: {task_project}<b>&nbsp;<br>Taakfase </b>: {task_stage}</span></p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(42, 3, 'pl', 'New Task Assigned', 'Task Magix', '<p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\"><span style=\"font-family: sans-serif;\">Dzień dobry,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">Nowe zadanie zostało Ci przypisane.</span></p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\"><span style=\"font-family: sans-serif;\"><b>Zadanie </b><span style=\"font-weight: bolder;\">Imię</span>&nbsp;: {task_name}<br><span style=\"font-weight: bolder;\">Priorytet zadania</span>&nbsp;: {task_priority}<br><b>Projekt zadania </b>: {task_project}<b>&nbsp;<br>Etap zadania </b>: {task_stage}</span></p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(43, 3, 'ru', 'New Task Assigned', 'Task Magix', '<p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\"><span style=\"font-family: sans-serif;\">Привет,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">Новая задача была назначена вам.</span></p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\"><span style=\"font-family: sans-serif;\"><b>задача </b><span style=\"font-weight: bolder;\">название</span>&nbsp;: {task_name}<br><span style=\"font-weight: bolder;\">Приоритет задачи</span>&nbsp;: {task_priority}<br><b>Задача Проект </b>: {task_project}<b>&nbsp;<br>Этап задачи </b>: {task_stage}</span></p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(44, 3, 'pt', 'New Task Assigned', 'Task Magix', '<p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\"><span style=\"font-family: sans-serif;\">Olá,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">Nova Tarefa tem sido Assign para você.</span></p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\"><span style=\"font-family: sans-serif;\"><b>Tarefa </b><span style=\"font-weight: bolder;\">Nome da </span>&nbsp;: {task_name}<br><span style=\"font-weight: bolder;\">Prioridade da Tarefa </span>&nbsp;: {task_priority}<br><b>Projeto de tarefa </b>: {task_project}<b>&nbsp;<br>Estágio da tarefa </b>: {task_stage}</span></p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(45, 3, 'tr', 'New Task Assigned', 'Task Magix', '<p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\"><span style=\"font-family: sans-serif;\">Merhaba.,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">Yeni Görev size Atandı.</span></p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\"><span style=\"font-family: sans-serif;\"><b>Görev </b><span style=\"font-weight: bolder;\">Name</span>&nbsp;: {task_name}<br><span style=\"font-weight: bolder;\">Görev Önceliği</span>&nbsp;: {task_priority}<br><b>Görev Projesi </b>: {task_project}<b>&nbsp;<br>Görev Aşaması </b>: {task_stage}</span></p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(46, 3, 'zh', 'New Task Assigned', 'Task Magix', '<p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\"><span style=\"font-family: sans-serif;\">你好啊,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">新任务已分配给您</span></p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\"><span style=\"font-family: sans-serif;\"><b>任务 </b><span style=\"font-weight: bolder;\">名称</span>&nbsp;: {task_name}<br><span style=\"font-weight: bolder;\">任务优先级</span>&nbsp;: {task_priority}<br><b>任务项目</b>: {task_project}<b>&nbsp;<br>任务阶段</b>: {task_stage}</span></p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(47, 3, 'he', 'New Task Assigned', 'Task Magix', '<p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\"><span style=\"font-family: sans-serif;\">הלו,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">משימה חדשה הוקצתה לכם..</span></p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\"><span style=\"font-family: sans-serif;\"><b>משימה </b><span style=\"font-weight: bolder;\">שם</span>&nbsp;: {task_name}<br><span style=\"font-weight: bolder;\">קדימות משימה</span>&nbsp;: {task_priority}<br><b>פרויקט משימה </b>: {task_project}<b>&nbsp;<br>שלב משימה </b>: {task_stage}</span></p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(48, 3, 'pt-br', 'New Task Assigned', 'Task Magix', '<p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\"><span style=\"font-family: sans-serif;\">Olá,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">Nova Tarefa tem sido Assign para você.</span></p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\"><span style=\"font-family: sans-serif;\"><b>Tarefa </b><span style=\"font-weight: bolder;\">Nome da </span>&nbsp;: {task_name}<br><span style=\"font-weight: bolder;\">Prioridade da Tarefa </span>&nbsp;: {task_priority}<br><b>Projeto de tarefa </b>: {task_project}<b>&nbsp;<br>Estágio da tarefa </b>: {task_stage}</span></p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(49, 4, 'ar', 'New Timesheet', 'Task Magix', '<p><span style=\"font-size: 14px; font-family: sans-serif;\">مرحبا،</span><br style=\"font-size: 14px; font-family: sans-serif;\"><span style=\"font-size: 14px; font-family: sans-serif;\">تم تعيين جدول زمني جديد لك.</span></p><p><span style=\"font-size: 14px; font-family: sans-serif;\"><b>مشروع الجدول الزمني</b> : {timesheet_project}<br><b>مهمة الجدول الزمني</b> : {timesheet_task}<br><b>وقت الجدول الزمني</b> : {timesheet_time}<br><b>تاريخ الجدول الزمني</b> : {timesheet_date}</span></p><p><br></p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(50, 4, 'da', 'New Timesheet', 'Task Magix', '<p><span style=\"font-size: 14px; font-family: sans-serif;\">Hej,</span><br style=\"font-size: 14px; font-family: sans-serif;\"><span style=\"font-size: 14px; font-family: sans-serif;\">Nyt timesheet er blevet tildelt til dig.</span></p><p><span style=\"font-size: 14px; font-family: sans-serif;\"><b>Timesheet-projekt</b> : {timesheet_project}<br><b>Timesheet-opgave</b> : {timesheet_task}<br><b>Tidsskema Tid</b> : {timesheet_time}<br><b>Tidspunkt Dato</b> : {timesheet_date}</span></p><p><br></p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(51, 4, 'de', 'New Timesheet', 'Task Magix', '<p><span style=\"font-size: 14px; font-family: sans-serif;\">Hallo,</span><br style=\"font-size: 14px; font-family: sans-serif;\"><span style=\"font-size: 14px; font-family: sans-serif;\">Neue Arbeitszeittabelle wurde Ihnen zugewiesen.</span></p><p><span style=\"font-size: 14px; font-family: sans-serif;\"><b>Arbeitszeittabellenprojekt</b> : {timesheet_project}<br><b>Arbeitszeittabellenaufgabe</b> : {timesheet_task}<br><b>Arbeitszeittabelle Zeit</b> : {timesheet_time}<br><b>Arbeitszeittabelle Datum</b> : {timesheet_date}</span></p><p><br></p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(52, 4, 'en', 'New Timesheet', 'Task Magix', '<p><span style=\"font-size: 14px; font-family: sans-serif;\">Hello,</span><br style=\"font-size: 14px; font-family: sans-serif;\"><span style=\"font-size: 14px; font-family: sans-serif;\">New Timesheet has been Assign to you.</span></p><p><span style=\"font-size: 14px; font-family: sans-serif;\"><b>Timesheet Project</b> : {timesheet_project}<br><b>Timesheet Task</b> : {timesheet_task}<br><b>Timesheet Time</b> : {timesheet_time}<br><b>Timesheet Date</b> : {timesheet_date}</span></p><p><br></p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(53, 4, 'es', 'New Timesheet', 'Task Magix', '<p><span style=\"font-size: 14px; font-family: sans-serif;\">Hola,</span><br style=\"font-size: 14px; font-family: sans-serif;\"><span style=\"font-size: 14px; font-family: sans-serif;\">Se le ha asignado una nueva hoja de tiempo.</span></p><p><span style=\"font-size: 14px; font-family: sans-serif;\"><b>Proyecto de parte de horas</b> : {timesheet_project}<br><b>Tarea de parte de horas</b> : {timesheet_task}<br><b>Tiempo de parte de horas</b> : {timesheet_time}<br><b>Fecha de parte de horas</b> : {timesheet_date}</span></p><p><br></p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(54, 4, 'fr', 'New Timesheet', 'Task Magix', '<p><span style=\"font-size: 14px; font-family: sans-serif;\">Bonjour,</span><br style=\"font-size: 14px; font-family: sans-serif;\"><span style=\"font-size: 14px; font-family: sans-serif;\">Une nouvelle feuille de temps vous a été attribuée.</span></p><p><span style=\"font-size: 14px; font-family: sans-serif;\"><b>Projet de feuille de temps</b> : {timesheet_project}<br><b>Tâche de feuille de temps</b> : {timesheet_task}<br><b>Temps de feuille de temps</b> : {timesheet_time}<br><b>Date de la feuille de temps</b> : {timesheet_date}</span></p><p><br></p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(55, 4, 'it', 'New Timesheet', 'Task Magix', '<p><span style=\"font-size: 14px; font-family: sans-serif;\">Ciao,</span><br style=\"font-size: 14px; font-family: sans-serif;\"><span style=\"font-size: 14px; font-family: sans-serif;\">La nuova scheda attività è stata assegnata a te.</span></p><p><span style=\"font-size: 14px; font-family: sans-serif;\"><b>Progetto scheda attività</b> : {timesheet_project}<br><b>Attività scheda attività</b> : {timesheet_task}<br><b>Timesheet Time</b> : {timesheet_time}<br><b>Data scheda attività</b> : {timesheet_date}</span></p><p><br></p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(56, 4, 'ja', 'New Timesheet', 'Task Magix', '<p><span style=\"font-size: 14px; font-family: sans-serif;\">こんにちは、</span><br style=\"font-size: 14px; font-family: sans-serif;\"><span style=\"font-size: 14px; font-family: sans-serif;\">新しいタイムシートが割り当てられました。</span></p><p><span style=\"font-size: 14px; font-family: sans-serif;\"><b>タイムシートプロジェクト</b> : {timesheet_project}<br><b>タイムシートタスク</b> : {timesheet_task}<br><b>タイムシート時間</b> : {timesheet_time}<br><b>タイムシートの日付</b> : {timesheet_date}</span></p><p><br></p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(57, 4, 'nl', 'New Timesheet', 'Task Magix', '<p><span style=\"font-size: 14px; font-family: sans-serif;\">Hallo,</span><br style=\"font-size: 14px; font-family: sans-serif;\"><span style=\"font-size: 14px; font-family: sans-serif;\">New Timesheet is aan u toewijzen.</span></p><p><span style=\"font-size: 14px; font-family: sans-serif;\"><b>Timesheet Project</b> : {timesheet_project}<br><b>Timesheet-taak</b> : {timesheet_task}<br><b>Timesheet Time</b> : {timesheet_time}<br><b>Datum rooster</b> : {timesheet_date}</span></p><p><br></p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(58, 4, 'pl', 'New Timesheet', 'Task Magix', '<p><span style=\"font-size: 14px; font-family: sans-serif;\">Dzień dobry,</span><br style=\"font-size: 14px; font-family: sans-serif;\"><span style=\"font-size: 14px; font-family: sans-serif;\">Nowy grafik został przypisany do Ciebie.</span></p><p><span style=\"font-size: 14px; font-family: sans-serif;\"><b>Projekt grafiku</b> : {timesheet_project}<br><b>Zadanie grafiku</b> : {timesheet_task}<br><b>Czas pracy</b> : {timesheet_time}<br><b>Data grafiku</b> : {timesheet_date}</span></p><p><br></p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(59, 4, 'ru', 'New Timesheet', 'Task Magix', '<p><span style=\"font-size: 14px; font-family: sans-serif;\">Привет,</span><br style=\"font-size: 14px; font-family: sans-serif;\"><span style=\"font-size: 14px; font-family: sans-serif;\">Новое расписание было назначено вам.</span></p><p><span style=\"font-size: 14px; font-family: sans-serif;\"><b>Проект расписания</b> : {timesheet_project}<br><b>Задача расписания</b> : {timesheet_task}<br><b>Расписание</b> : {timesheet_time}<br><b>Дата расписания</b> : {timesheet_date}</span></p><p><br></p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(60, 4, 'pt', 'New Timesheet', 'Task Magix', '<p><span style=\"font-size: 14px; font-family: sans-serif;\">Olá,</span><br style=\"font-size: 14px; font-family: sans-serif;\"><span style=\"font-size: 14px; font-family: sans-serif;\">New Timesheet tem sido Assign para você.</span></p><p><span style=\"font-size: 14px; font-family: sans-serif;\"><b>Projeto de Témesheet</b> : {timesheet_project}<br><b>Tarefa do Timesheet</b> : {timesheet_task}<br><b>Tempo de cronômetro</b> : {timesheet_time}<br><b>Data do cronômetro</b> : {timesheet_date}</span></p><p><br></p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(61, 4, 'tr', 'New Timesheet', 'Task Magix', '<p><span style=\"font-size: 14px; font-family: sans-serif;\">Merhaba.,</span><br style=\"font-size: 14px; font-family: sans-serif;\"><span style=\"font-size: 14px; font-family: sans-serif;\">Yeni Zaman Çizelgesi size atanmıştır.</span></p><p><span style=\"font-size: 14px; font-family: sans-serif;\"><b>Zaman Cetvesi Projesi</b> : {timesheet_project}<br><b>Zaman Cetvesi Görevi</b> : {timesheet_task}<br><b>Zaman Çizelgesi Süresi</b> : {timesheet_time}<br><b>Zaman Çizelgesi Tarihi</b> : {timesheet_date}</span></p><p><br></p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(62, 4, 'zh', 'New Timesheet', 'Task Magix', '<p><span style=\"font-size: 14px; font-family: sans-serif;\">你好啊,</span><br style=\"font-size: 14px; font-family: sans-serif;\"><span style=\"font-size: 14px; font-family: sans-serif;\">新时间表已分配给您。</span></p><p><span style=\"font-size: 14px; font-family: sans-serif;\"><b>时间表项目</b> : {timesheet_project}<br><b>时间表任务</b> : {timesheet_task}<br><b>时间表时间</b> : {timesheet_time}<br><b>时间表日期</b> : {timesheet_date}</span></p><p><br></p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(63, 4, 'he', 'New Timesheet', 'Task Magix', '<p><span style=\"font-size: 14px; font-family: sans-serif;\">הלו,</span><br style=\"font-size: 14px; font-family: sans-serif;\"><span style=\"font-size: 14px; font-family: sans-serif;\">גיליון שעות חדש הוקצה לכם..</span></p><p><span style=\"font-size: 14px; font-family: sans-serif;\"><b>פרויקט גיליון שעות</b> : {timesheet_project}<br><b>משימת גיליון שעות</b> : {timesheet_task}<br><b>זמן גיליון שעות</b> : {timesheet_time}<br><b>תאריך גיליון שעות</b> : {timesheet_date}</span></p><p><br></p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(64, 4, 'pt-br', 'New Timesheet', 'Task Magix', '<p><span style=\"font-size: 14px; font-family: sans-serif;\">Olá,</span><br style=\"font-size: 14px; font-family: sans-serif;\"><span style=\"font-size: 14px; font-family: sans-serif;\">New Timesheet tem sido Assign para você.</span></p><p><span style=\"font-size: 14px; font-family: sans-serif;\"><b>Projeto de Témesheet</b> : {timesheet_project}<br><b>Tarefa do Timesheet</b> : {timesheet_task}<br><b>Tempo de cronômetro</b> : {timesheet_time}<br><b>Data do cronômetro</b> : {timesheet_date}</span></p><p><br></p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(65, 5, 'ar', 'New Contract Shared', 'Task Magix', '<p><span style=\"font-size: 14px; font-family: sans-serif;\">مرحبًا,</span>\n                            <br style=\"font-size: 14px; font-family: sans-serif;\">\n                            <span style=\"font-size: 14px; font-family: sans-serif;\">تم تعيين عقد جديد لك.</span>\n                            </p><p><span style=\"font-size: 14px; font-family: sans-serif;\">\n                            <b>اسم العميل</b>  : {client_name}<br>\n                            <b>اسم العقد</b> :   {contract_name}<br>\n                            <b>نوع العقد</b> : {contract_type}<br>\n                            <b>قيمة العقد</b> : {contract_value}<br>\n                            <b>تاريخ البدء</b> : {start_date}<br>\n                            <b>تاريخ الانتهاء</b> : {end_date}</span></p><p><br></p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(66, 5, 'da', 'New Contract Shared', 'Task Magix', '<p><span style=\"font-size: 14px; font-family: sans-serif;\">Hej,</span>\n                            <br style=\"font-size: 14px; font-family: sans-serif;\">\n                            <span style=\"font-size: 14px; font-family: sans-serif;\">Ny kontrakt er blevet tildelt dig.</span>\n                            </p><p><span style=\"font-size: 14px; font-family: sans-serif;\">\n                            <b>Kundenavn</b>  : {client_name}<br>\n                            <b>Kontrakt navn</b> :   {contract_name}<br>\n                            <b>Kontrakttype</b> : {contract_type}<br>\n                            <b>Kontraktværdi</b> : {contract_value}<br>\n                            <b>Start dato</b> : {start_date}<br>\n                            <b>Slutdato</b> : {end_date}</span></p><p><br></p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(67, 5, 'de', 'New Contract Shared', 'Task Magix', '<p><span style=\"font-size: 14px; font-family: sans-serif;\">Hallo,</span>\n                            <br style=\"font-size: 14px; font-family: sans-serif;\">\n                            <span style=\"font-size: 14px; font-family: sans-serif;\">Ihnen wurde ein neuer Vertrag zugewiesen.</span>\n                            </p><p><span style=\"font-size: 14px; font-family: sans-serif;\">\n                            <b>Kundenname</b>  : {client_name}<br>\n                            <b>Vertragsname</b> :   {contract_name}<br>\n                            <b>Vertragstyp</b> : {contract_type}<br>\n                            <b>Vertragswert</b> : {contract_value}<br>\n                            <b>Anfangsdatum</b> : {start_date}<br>\n                            <b>Endtermin</b> : {end_date}</span></p><p><br></p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(68, 5, 'en', 'New Contract Shared', 'Task Magix', '<p><span style=\"font-size: 14px; font-family: sans-serif;\">Hello,</span>\n                            <br style=\"font-size: 14px; font-family: sans-serif;\">\n                            <span style=\"font-size: 14px; font-family: sans-serif;\">New Contract has been Assign to you.</span>\n                            </p><p><span style=\"font-size: 14px; font-family: sans-serif;\">\n                            <b>Client Name</b>  : {client_name}<br>\n                            <b>Contract Name</b> :   {contract_name}<br>\n                            <b>Contract Type</b> : {contract_type}<br>\n                            <b>Contract Value</b> : {contract_value}<br>\n                            <b>Start date</b> : {start_date}<br>\n                            <b>End date</b> : {end_date}</span></p><p><br></p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(69, 5, 'es', 'New Contract Shared', 'Task Magix', '<p><span style=\"font-size: 14px; font-family: sans-serif;\">Hola,</span>\n                            <br style=\"font-size: 14px; font-family: sans-serif;\">\n                            <span style=\"font-size: 14px; font-family: sans-serif;\">Se le ha asignado un nuevo contrato.</span>\n                            </p><p><span style=\"font-size: 14px; font-family: sans-serif;\">\n                            <b>nombre del cliente</b>  : {client_name}<br>\n                            <b>Nombre del contrato</b> :   {contract_name}<br>\n                            <b>tipo de contrato</b> : {contract_type}<br>\n                            <b>Valor del contrato</b> : {contract_value}<br>\n                            <b>Fecha de inicio</b> : {start_date}<br>\n                            <b>Fecha final</b> : {end_date}</span></p><p><br></p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(70, 5, 'fr', 'New Contract Shared', 'Task Magix', '<p><span style=\"font-size: 14px; font-family: sans-serif;\">Bonjour,</span>\n                            <br style=\"font-size: 14px; font-family: sans-serif;\">\n                            <span style=\"font-size: 14px; font-family: sans-serif;\">Un nouveau contrat vous a été attribué.</span>\n                            </p><p><span style=\"font-size: 14px; font-family: sans-serif;\">\n                            <b>Nom du client</b>  : {client_name}<br>\n                            <b>Nom du contrat</b> :   {contract_name}<br>\n                            <b>Type de contrat</b> : {contract_type}<br>\n                            <b>Valeur du contrat</b> : {contract_value}<br>\n                            <b>Date de début</b> : {start_date}<br>\n                            <b>Date de fin</b> : {end_date}</span></p><p><br></p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(71, 5, 'it', 'New Contract Shared', 'Task Magix', '<p><span style=\"font-size: 14px; font-family: sans-serif;\">Ciao,</span>\n                            <br style=\"font-size: 14px; font-family: sans-serif;\">\n                            <span style=\"font-size: 14px; font-family: sans-serif;\">Ti è stato assegnato un nuovo contratto.</span>\n                            </p><p><span style=\"font-size: 14px; font-family: sans-serif;\">\n                            <b>nome del cliente</b>  : {client_name}<br>\n                            <b>Nome del contratto</b> :   {contract_name}<br>\n                            <b>tipo di contratto</b> : {contract_type}<br>\n                            <b>Valore del contratto</b> : {contract_value}<br>\n                            <b>Data d\'inizio</b> : {start_date}<br>\n                            <b>Data di fine</b> : {end_date}</span></p><p><br></p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(72, 5, 'ja', 'New Contract Shared', 'Task Magix', '<p><span style=\"font-size: 14px; font-family: sans-serif;\">こんにちは,</span>\n                            <br style=\"font-size: 14px; font-family: sans-serif;\">\n                            <span style=\"font-size: 14px; font-family: sans-serif;\">新しい契約があなたに割り当てられました.</span>\n                            </p><p><span style=\"font-size: 14px; font-family: sans-serif;\">\n                            <b>クライアント名</b>  : {client_name}<br>\n                            <b>契約名</b> :   {contract_name}<br>\n                            <b>契約の種類</b> : {contract_type}<br>\n                            <b>契約金額</b> : {contract_value}<br>\n                            <b>開始日</b> : {start_date}<br>\n                            <b>終了日</b> : {end_date}</span></p><p><br></p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(73, 5, 'nl', 'New Contract Shared', 'Task Magix', '<p><span style=\"font-size: 14px; font-family: sans-serif;\">Hallo,</span>\n                            <br style=\"font-size: 14px; font-family: sans-serif;\">\n                            <span style=\"font-size: 14px; font-family: sans-serif;\">Nieuw contract is aan u toegewezen.</span>\n                            </p><p><span style=\"font-size: 14px; font-family: sans-serif;\">\n                            <b>klantnaam</b>  : {client_name}<br>\n                            <b>Contractnaam:</b> :   {contract_name}<br>\n                            <b>Contract type</b> : {contract_type}<br>\n                            <b>Contract waarde</b> : {contract_value}<br>\n                            <b>Startdatum</b> : {start_date}<br>\n                            <b>Einddatum</b> : {end_date}</span></p><p><br></p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(74, 5, 'pl', 'New Contract Shared', 'Task Magix', '<p><span style=\"font-size: 14px; font-family: sans-serif;\">Witam,</span>\n                            <br style=\"font-size: 14px; font-family: sans-serif;\">\n                            <span style=\"font-size: 14px; font-family: sans-serif;\">Nowa umowa została Ci przypisana.</span>\n                            </p><p><span style=\"font-size: 14px; font-family: sans-serif;\">\n                            <b>Nazwa klienta</b>  : {client_name}<br>\n                            <b>Nazwa kontraktu</b> :   {contract_name}<br>\n                            <b>Typ kontraktu</b> : {contract_type}<br>\n                            <b>Wartość kontraktu</b> : {contract_value}<br>\n                            <b>Data rozpoczęcia</b> : {start_date}<br>\n                            <b>Data zakonczenia</b> : {end_date}</span></p><p><br></p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(75, 5, 'ru', 'New Contract Shared', 'Task Magix', '<p><span style=\"font-size: 14px; font-family: sans-serif;\">Привет,</span>\n                            <br style=\"font-size: 14px; font-family: sans-serif;\">\n                            <span style=\"font-size: 14px; font-family: sans-serif;\">Вам назначен новый контракт.</span>\n                            </p><p><span style=\"font-size: 14px; font-family: sans-serif;\">\n                            <b>имя клиента</b>  : {client_name}<br>\n                            <b>Название контракта</b> :   {contract_name}<br>\n                            <b>Форма контракта</b> : {contract_type}<br>\n                            <b>Стоимость контракта</b> : {contract_value}<br>\n                            <b>Дата начала</b> : {start_date}<br>\n                            <b>Дата окончания</b> : {end_date}</span></p><p><br></p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54');
INSERT INTO `email_template_langs` (`id`, `parent_id`, `lang`, `subject`, `from`, `content`, `created_at`, `updated_at`) VALUES
(76, 5, 'pt', 'New Contract Shared', 'Task Magix', '<p><span style=\"font-size: 14px; font-family: sans-serif;\">Olá,</span>\n                            <br style=\"font-size: 14px; font-family: sans-serif;\">\n                            <span style=\"font-size: 14px; font-family: sans-serif;\">Novo contrato foi atribuído a você.</span>\n                            </p><p><span style=\"font-size: 14px; font-family: sans-serif;\">\n                            <b>Nome do cliente</b>  : {client_name}<br>\n                            <b>Nome do contrato</b> :   {contract_name}<br>\n                            <b>tipo de contrato</b> : {contract_type}<br>\n                            <b>Valor do contrato</b> : {contract_value}<br>\n                            <b>Data de início</b> : {start_date}<br>\n                            <b>Data final</b> : {end_date}</span></p><p><br></p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(77, 5, 'tr', 'New Contract Shared', 'Task Magix', '<p><span style=\"font-size: 14px; font-family: sans-serif;\">Merhaba.,</span>\n                            <br style=\"font-size: 14px; font-family: sans-serif;\">\n                            <span style=\"font-size: 14px; font-family: sans-serif;\">Yeni Sözleşme size Atandı.</span>\n                            </p><p><span style=\"font-size: 14px; font-family: sans-serif;\">\n                            <b>İstemci Adı</b>  : {client_name}<br>\n                            <b>Sözleşme Adı</b> :   {contract_name}<br>\n                            <b>Sözleşme Tipi</b> : {contract_type}<br>\n                            <b>Sözleşme Değeri</b> : {contract_value}<br>\n                            <b>Başlangıç tarihi</b> : {start_date}<br>\n                            <b>Bitiş tarihi</b> : {end_date}</span></p><p><br></p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(78, 5, 'zh', 'New Contract Shared', 'Task Magix', '<p><span style=\"font-size: 14px; font-family: sans-serif;\">你好啊,</span>\n                            <br style=\"font-size: 14px; font-family: sans-serif;\">\n                            <span style=\"font-size: 14px; font-family: sans-serif;\">新合同已分配给您</span>\n                            </p><p><span style=\"font-size: 14px; font-family: sans-serif;\">\n                            <b>客户机名称</b>  : {client_name}<br>\n                            <b>合同名称</b> :   {contract_name}<br>\n                            <b>合同类型</b> : {contract_type}<br>\n                            <b>合同值</b> : {contract_value}<br>\n                            <b>开始日期</b> : {start_date}<br>\n                            <b>结束日期</b> : {end_date}</span></p><p><br></p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(79, 5, 'he', 'New Contract Shared', 'Task Magix', '<p><span style=\"font-size: 14px; font-family: sans-serif;\">הלו,</span>\n                            <br style=\"font-size: 14px; font-family: sans-serif;\">\n                            <span style=\"font-size: 14px; font-family: sans-serif;\">חוזה חדש הוקצה לכם.</span>\n                            </p><p><span style=\"font-size: 14px; font-family: sans-serif;\">\n                            <b>שם לקוח</b>  : {client_name}<br>\n                            <b>שם חוזה</b> :   {contract_name}<br>\n                            <b>סוג חוזה</b> : {contract_type}<br>\n                            <b>ערך חוזה</b> : {contract_value}<br>\n                            <b>תאריך התחלה</b> : {start_date}<br>\n                            <b>תאריך סיום</b> : {end_date}</span></p><p><br></p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(80, 5, 'pt-br', 'New Contract Shared', 'Task Magix', '<p><span style=\"font-size: 14px; font-family: sans-serif;\">Olá,</span>\n                            <br style=\"font-size: 14px; font-family: sans-serif;\">\n                            <span style=\"font-size: 14px; font-family: sans-serif;\">Novo contrato foi atribuído a você.</span>\n                            </p><p><span style=\"font-size: 14px; font-family: sans-serif;\">\n                            <b>Nome do cliente</b>  : {client_name}<br>\n                            <b>Nome do contrato</b> :   {contract_name}<br>\n                            <b>tipo de contrato</b> : {contract_type}<br>\n                            <b>Valor do contrato</b> : {contract_value}<br>\n                            <b>Data de início</b> : {start_date}<br>\n                            <b>Data final</b> : {end_date}</span></p><p><br></p>', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(81, 1, 'hindi01', 'User Invited', NULL, '<p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\">Hello,&nbsp;<br>Welcome to {app_name}.</p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\"><span style=\"font-weight: bolder;\">Email&nbsp;</span>: {email}<br><span style=\"font-weight: bolder;\">Password</span>&nbsp;: {password}</p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\">{app_url}</p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\">Thanks,<br>{app_name}</p>', '2025-03-05 12:34:08', '2025-03-05 12:34:08'),
(82, 2, 'hindi01', 'New Project Assigned', NULL, '<p>Hello,</p><p>New Project has been assigned to you.</p><p><b>Project Name </b>: {project_name}<br><b>Project Status </b>:<b>&nbsp;</b>{project_status}<br><b>Project Budget </b>:<b> </b>{project_budget}<br><b>Project Hours </b>:<b> </b>{project_hours}</p>', '2025-03-05 12:34:08', '2025-03-05 12:34:08'),
(83, 3, 'hindi01', 'New Task Assigned', NULL, '<p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\"><span style=\"font-family: sans-serif;\">Hello,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">New Task has been Assign to you.</span></p><p style=\"line-height: 28px; font-family: Nunito, &quot;Segoe UI&quot;, arial; font-size: 14px;\"><span style=\"font-family: sans-serif;\"><b>Task </b><span style=\"font-weight: bolder;\">Name</span>&nbsp;: {task_name}<br><span style=\"font-weight: bolder;\">Task Priority</span>&nbsp;: {task_priority}<br><b>Task Project </b>: {task_project}<b>&nbsp;<br>Task Stage </b>: {task_stage}</span></p>', '2025-03-05 12:34:08', '2025-03-05 12:34:08'),
(84, 4, 'hindi01', 'New Timesheet', NULL, '<p><span style=\"font-size: 14px; font-family: sans-serif;\">Hello,</span><br style=\"font-size: 14px; font-family: sans-serif;\"><span style=\"font-size: 14px; font-family: sans-serif;\">New Timesheet has been Assign to you.</span></p><p><span style=\"font-size: 14px; font-family: sans-serif;\"><b>Timesheet Project</b> : {timesheet_project}<br><b>Timesheet Task</b> : {timesheet_task}<br><b>Timesheet Time</b> : {timesheet_time}<br><b>Timesheet Date</b> : {timesheet_date}</span></p><p><br></p>', '2025-03-05 12:34:08', '2025-03-05 12:34:08'),
(85, 5, 'hindi01', 'New Contract Shared', NULL, '<p><span style=\"font-size: 14px; font-family: sans-serif;\">Hello,</span>\n                            <br style=\"font-size: 14px; font-family: sans-serif;\">\n                            <span style=\"font-size: 14px; font-family: sans-serif;\">New Contract has been Assign to you.</span>\n                            </p><p><span style=\"font-size: 14px; font-family: sans-serif;\">\n                            <b>Client Name</b>  : {client_name}<br>\n                            <b>Contract Name</b> :   {contract_name}<br>\n                            <b>Contract Type</b> : {contract_type}<br>\n                            <b>Contract Value</b> : {contract_value}<br>\n                            <b>Start date</b> : {start_date}<br>\n                            <b>End date</b> : {end_date}</span></p><p><br></p>', '2025-03-05 12:34:08', '2025-03-05 12:34:08');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT '0',
  `attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `task_id` int(11) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `name`, `date`, `description`, `amount`, `attachment`, `project_id`, `task_id`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'testing', '2024-05-09', 'demo', 500, 'expense/1715245778.png', 2, 0, 9, '2024-05-09 09:09:38', '2024-05-09 09:10:06'),
(2, 'Create Expense', '2024-06-03', 'yrt yrthtdh dtj dtjt jsrdt', 54, NULL, 5, 3, 13, '2024-06-03 09:53:29', '2024-06-03 09:53:29'),
(3, 'Expense test', '2024-06-03', 'eWF AEG AERG', 333, NULL, 5, 3, 13, '2024-06-03 10:23:36', '2024-06-03 10:23:36'),
(4, 'disha Expense', '2024-06-06', 'thtehetyj', 57, NULL, 8, 0, 13, '2024-06-06 07:50:03', '2024-06-06 07:50:43'),
(5, 'disha', '2024-06-06', 'kjkjhk', 5000, NULL, 9, 0, 13, '2024-06-06 08:06:41', '2024-06-06 08:06:41'),
(6, 'Core Expense', '2024-07-18', '', 10000, NULL, 16, 10, 39, '2024-07-18 10:45:13', '2024-07-18 10:45:13'),
(7, 'Upper core', '2024-07-18', '', 250000, 'expense/1721299630.png', 16, 11, 39, '2024-07-18 10:47:10', '2024-07-18 10:47:10'),
(8, 'E1', '2024-07-18', 'ABCD', 10, 'expense/1721300108.png', 19, 0, 35, '2024-07-18 10:55:08', '2024-07-18 10:55:08'),
(10, 'Basic infra', '2024-07-26', 'fvfvfdddc', 100000, 'expense/1721977658.png', 33, 0, 39, '2024-07-26 07:07:03', '2024-07-26 07:07:38'),
(11, 'basic', '2024-07-26', 'dsacdscd', 20, 'expense/1721995461.png', 37, 0, 39, '2024-07-26 11:46:43', '2024-07-26 12:04:21'),
(12, 'Actual development Expense', '2024-08-08', 'dgrrgfr', 10, NULL, 32, 30, 39, '2024-07-26 12:56:55', '2024-08-08 09:46:47'),
(14, 'Basic', '2024-08-08', '', 10, NULL, 59, 40, 39, '2024-08-08 13:04:25', '2024-08-08 13:04:25'),
(16, 'Login and Registration', '2024-12-03', 'v vui idusuid uihsiudh d', 789, 'expense/1733219224.png', 84, 75, 48, '2024-12-03 09:46:43', '2024-12-03 09:47:04');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `tax_id` bigint(20) UNSIGNED NOT NULL,
  `due_date` date NOT NULL,
  `created_by` int(11) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `invoice_id`, `project_id`, `client_id`, `tax_id`, `due_date`, `created_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 4, 1, '2025-11-20', 400, 1, '2024-05-09 08:46:40', '2025-04-24 04:19:18'),
(2, 3, 2, 3, 2, '2020-11-24', 39, 1, '2024-05-09 08:47:19', '2024-08-16 09:54:52'),
(3, 3, 2, 11, 1, '2024-05-08', 9, 1, '2024-05-09 08:47:36', '2024-05-09 08:47:36'),
(4, 4, 2, 11, 1, '2024-06-02', 9, 1, '2024-05-09 09:13:50', '2024-05-09 09:13:50'),
(5, 5, 2, 12, 1, '2024-05-09', 9, 1, '2024-05-09 10:48:00', '2024-05-09 10:48:00'),
(6, 6, 2, 12, 1, '2024-05-25', 9, 1, '2024-05-25 13:55:55', '2024-05-25 13:55:55'),
(7, 7, 2, 11, 1, '2024-05-25', 9, 2, '2024-05-25 13:56:27', '2025-02-12 08:37:09'),
(8, 8, 2, 11, 1, '2024-05-25', 9, 2, '2024-05-25 13:56:40', '2025-02-10 06:18:37'),
(9, 1, 5, 17, 2, '2024-06-03', 13, 1, '2024-06-03 10:25:50', '2024-06-03 10:25:50'),
(10, 1, 13, 37, 4, '2024-07-18', 35, 1, '2024-07-18 05:25:43', '2024-07-18 05:25:43'),
(11, 2, 13, 37, 4, '2024-07-18', 35, 2, '2024-07-18 05:28:00', '2025-02-10 06:22:00'),
(13, 3, 27, 42, 4, '2024-07-19', 35, 1, '2024-07-19 07:29:18', '2024-07-19 07:29:18'),
(15, 0, 0, 10000000, 2021, '2024-07-17', 39, 1, '2024-07-29 13:04:23', '2024-07-29 13:04:23'),
(16, 0, 0, 100, 2024, '2024-07-19', 39, 1, '2024-07-29 13:04:23', '2024-07-29 13:04:23'),
(17, 0, 0, 100, 2024, '2024-07-19', 39, 1, '2024-07-29 13:04:23', '2024-07-29 13:04:23'),
(18, 0, 0, 1000000, 2017, '2024-07-25', 39, 1, '2024-07-29 13:04:23', '2024-07-29 13:04:23'),
(19, 1, 16, 43, 6, '2024-07-30', 43, 1, '2024-07-30 11:11:18', '2024-07-30 11:11:18'),
(20, 1, 16, 40, 6, '2024-07-30', 39, 2, '2024-07-30 12:39:41', '2024-08-27 12:00:43'),
(21, 2, 33, 46, 6, '2024-08-13', 39, 2, '2024-08-13 11:20:26', '2024-08-16 12:48:09'),
(23, 3, 16, 40, 6, '2024-08-21', 39, 3, '2024-08-21 06:16:15', '2024-08-21 08:02:33'),
(24, 4, 16, 43, 6, '2024-10-09', 39, 1, '2024-10-09 11:29:08', '2024-10-09 11:29:08'),
(25, 0, 0, 0, 2022, '2023-03-22', 39, 1, '2024-10-10 11:00:07', '2024-10-10 11:00:07'),
(26, 0, 0, 0, 2022, '2023-03-22', 39, 1, '2024-10-10 12:06:14', '2024-10-10 12:06:14'),
(27, 3, 104, 39, 7, '2024-12-03', 62, 3, '2024-12-03 09:42:12', '2024-12-03 11:30:11'),
(28, 1, 84, 51, 9, '2025-02-10', 48, 2, '2024-12-03 11:25:04', '2025-02-10 07:57:24'),
(32, 2, 114, 51, 9, '2025-02-28', 48, 2, '2025-02-14 07:45:25', '2025-02-14 08:33:06'),
(33, 1, 119, 383, 9, '2025-02-28', 365, 1, '2025-02-14 12:09:42', '2025-02-14 12:09:42');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_payments`
--

CREATE TABLE `invoice_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `amount` double(15,2) NOT NULL,
  `date` date NOT NULL,
  `payment_id` bigint(20) UNSIGNED NOT NULL,
  `payment_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_id` int(11) NOT NULL DEFAULT '1',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `receipt` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_payments`
--

INSERT INTO `invoice_payments` (`id`, `transaction_id`, `invoice_id`, `amount`, `date`, `payment_id`, `payment_type`, `client_id`, `notes`, `receipt`, `created_at`, `updated_at`) VALUES
(6, '2', 21, 4040.00, '2024-08-16', 0, 'MANUAL', 1, '', NULL, '2024-08-16 12:47:26', '2024-08-16 12:47:26'),
(17, '6', 23, 10.00, '2024-08-21', 0, 'MANUAL', 1, '', NULL, '2024-08-21 07:19:22', '2024-08-21 07:19:22'),
(21, '7', 23, 91.00, '2024-08-21', 0, 'MANUAL', 1, '', NULL, '2024-08-21 08:13:26', '2024-08-21 08:13:26'),
(22, '8', 20, 102.00, '2024-08-27', 0, 'MANUAL', 1, '', NULL, '2024-08-27 12:00:43', '2024-08-27 12:00:43'),
(26, '9', 27, 11.00, '2024-12-03', 0, 'MANUAL', 1, '', NULL, '2024-12-03 11:30:11', '2024-12-03 11:30:11'),
(27, '1739168316', 8, 3000.00, '2025-02-10', 0, 'Razorpay', 8, '', NULL, '2025-02-10 06:18:37', '2025-02-10 06:18:37'),
(28, '1739168519', 11, 199.00, '2025-02-10', 0, 'Razorpay', 11, '', NULL, '2025-02-10 06:22:00', '2025-02-10 06:22:00'),
(29, '1739168520', 28, 3262.56, '2025-02-10', 0, 'STRIPE', 51, '', NULL, '2025-02-10 07:55:38', '2025-02-10 07:55:38'),
(30, '1739168521', 28, 1344.00, '2025-02-10', 0, 'STRIPE', 51, '', NULL, '2025-02-10 07:57:24', '2025-02-10 07:57:24'),
(31, '1739348676', 11, 199.00, '2025-02-12', 0, 'Razorpay', 11, '', NULL, '2025-02-12 08:24:38', '2025-02-12 08:24:38'),
(32, '1739349428', 7, 1500.00, '2025-02-12', 0, 'Razorpay', 7, '', NULL, '2025-02-12 08:37:09', '2025-02-12 08:37:09'),
(33, '67AEF607838C6131180351', 32, 1418.00, '2025-02-14', 0, 'Bank Transfer', 48, '', NULL, '2025-02-14 07:52:18', '2025-02-14 07:52:18'),
(34, '68', 32, 1154.50, '2025-02-14', 0, 'STRIPE', 51, '', NULL, '2025-02-14 08:27:39', '2025-02-14 08:27:39'),
(35, '1739521986', 32, 210.00, '2025-02-14', 0, 'Razorpay', 32, '', NULL, '2025-02-14 08:33:06', '2025-02-14 08:33:06'),
(36, '1739525246', 32, 106.05, '2025-02-14', 0, 'Razorpay', 32, '', NULL, '2025-02-14 09:27:26', '2025-02-14 09:27:26'),
(37, '1739526397', 32, 210.00, '2025-02-14', 0, 'Razorpay', 32, '', NULL, '2025-02-14 09:46:39', '2025-02-14 09:46:39');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_products`
--

CREATE TABLE `invoice_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `item` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(15,2) NOT NULL DEFAULT '0.00',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_products`
--

INSERT INTO `invoice_products` (`id`, `invoice_id`, `item`, `price`, `type`, `created_at`, `updated_at`) VALUES
(1, 4, '-', 2000.00, 'others', '2024-05-09 09:14:35', '2024-05-09 09:14:35'),
(2, 9, 'test att', 99999.00, 'tasks', '2024-06-06 05:32:26', '2024-06-06 05:32:26'),
(3, 11, 'T1', 2000.00, 'tasks', '2024-07-18 09:24:55', '2024-07-18 09:24:55'),
(4, 11, 'T1', 2000.00, 'tasks', '2024-07-18 09:24:58', '2024-07-18 09:24:58'),
(5, 19, 'module A', 100000.00, 'tasks', '2024-07-30 11:11:46', '2024-07-30 11:11:46'),
(6, 20, 'module A', 1000.00, 'tasks', '2024-07-30 12:39:57', '2024-07-30 12:39:57'),
(7, 21, 'T1', 1000.00, 'tasks', '2024-08-13 11:20:54', '2024-08-13 11:20:54'),
(11, 21, 'T1', 2000.00, 'tasks', '2024-08-16 12:36:28', '2024-08-16 12:36:28'),
(12, 21, 'T2', 1000.00, 'others', '2024-08-16 12:40:31', '2024-08-16 12:40:31'),
(13, 23, 'A1', 100.00, 'others', '2024-08-21 06:30:02', '2024-08-21 06:30:02'),
(14, 27, 'Item 1', 10.00, 'others', '2024-12-03 09:46:38', '2024-12-03 09:46:38'),
(15, 28, 'half don', 1500.00, 'tasks', '2024-12-03 11:25:23', '2024-12-03 11:25:23'),
(16, 28, 'Task inReview', 1213.00, 'tasks', '2024-12-03 11:25:32', '2024-12-03 11:25:32'),
(17, 28, 'Home page done', 200.00, 'tasks', '2025-02-10 07:37:18', '2025-02-10 07:37:18'),
(25, 28, 'Project open task', 1200.00, 'tasks', '2025-02-10 07:56:31', '2025-02-10 07:56:31'),
(26, 32, 'Figma', 200.00, 'others', '2025-02-14 07:46:16', '2025-02-14 07:46:16'),
(27, 32, 'images', 150.00, 'others', '2025-02-14 07:46:28', '2025-02-14 07:46:28'),
(28, 32, 'Domain and Hosting', 1000.00, 'others', '2025-02-14 07:46:54', '2025-02-14 07:46:54'),
(29, 32, 'Front End Pages', 1100.00, 'others', '2025-02-14 07:52:58', '2025-02-14 07:52:58'),
(30, 32, 'Due task', 200.00, 'others', '2025-02-14 08:28:26', '2025-02-14 08:28:26'),
(31, 32, 'Database Schema', 101.00, 'others', '2025-02-14 09:26:23', '2025-02-14 09:26:23'),
(32, 32, 'testing', 200.00, 'others', '2025-02-14 09:28:42', '2025-02-14 09:28:42'),
(33, 32, 'Employee Charge', 300.00, 'others', '2025-02-14 09:58:34', '2025-02-14 09:58:34'),
(34, 33, 'developer', 200.00, 'others', '2025-02-14 12:11:05', '2025-02-14 12:11:05');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fullname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `code`, `fullname`, `created_at`, `updated_at`) VALUES
(1, 'ar', 'Arabic', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(2, 'zh', 'Chinese', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(3, 'da', 'Danish', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(4, 'de', 'German', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(5, 'en', 'English', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(6, 'es', 'Spanish', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(7, 'fr', 'French', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(8, 'he', 'Hebrew', '2024-02-26 12:05:54', '2024-02-26 12:05:54'),
(9, 'it', 'Italian', '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(10, 'ja', 'Japanese', '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(11, 'nl', 'Dutch', '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(12, 'pl', 'Polish', '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(13, 'pt', 'Portuguese', '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(14, 'ru', 'Russian', '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(15, 'tr', 'Turkish', '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(16, 'pt-br', 'Portuguese(Brazil)', '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(17, 'hindi01', 'Mmmmmmmu', '2025-03-05 12:34:08', '2025-03-05 12:34:08');

-- --------------------------------------------------------

--
-- Table structure for table `login_details`
--

CREATE TABLE `login_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `details` longtext COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `login_details`
--

INSERT INTO `login_details` (`id`, `user_id`, `ip`, `date`, `details`, `type`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, '162.158.48.108', '2024-02-26 17:39:14', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"162.158.48.108\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-02-26 17:39:14', '2024-02-26 17:39:14'),
(2, 1, '141.101.76.85', '2024-02-27 05:31:03', '{\"status\":\"success\",\"country\":\"Netherlands\",\"countryCode\":\"NL\",\"region\":\"NH\",\"regionName\":\"North Holland\",\"city\":\"Amsterdam\",\"zip\":\"\",\"lat\":52.3675,\"lon\":4.9041,\"timezone\":\"Europe\\/Amsterdam\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"141.101.76.85\",\"browser_name\":\"Chrome\",\"os_name\":\"Linux\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-02-27 05:31:03', '2024-02-27 05:31:03'),
(3, 1, '172.69.166.23', '2024-02-27 15:30:33', '{\"status\":\"success\",\"country\":\"Singapore\",\"countryCode\":\"SG\",\"region\":\"03\",\"regionName\":\"North West\",\"city\":\"Singapore\",\"zip\":\"858877\",\"lat\":1.352,\"lon\":103.8198,\"timezone\":\"Asia\\/Singapore\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.166.23\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-02-27 15:30:33', '2024-02-27 15:30:33'),
(4, 1, '172.71.98.66', '2024-02-27 09:40:26', '{\"status\":\"success\",\"country\":\"Netherlands\",\"countryCode\":\"NL\",\"region\":\"NH\",\"regionName\":\"North Holland\",\"city\":\"Amsterdam\",\"zip\":\"\",\"lat\":52.3675,\"lon\":4.9041,\"timezone\":\"Europe\\/Amsterdam\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.98.66\",\"browser_name\":\"Chrome\",\"os_name\":\"Linux\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-02-27 09:40:26', '2024-02-27 09:40:26'),
(5, 1, '172.69.86.175', '2024-02-28 12:00:47', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.86.175\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-02-28 12:00:47', '2024-02-28 12:00:47'),
(6, 1, '162.158.170.94', '2024-02-28 14:49:41', '{\"status\":\"success\",\"country\":\"Singapore\",\"countryCode\":\"SG\",\"region\":\"03\",\"regionName\":\"North West\",\"city\":\"Singapore\",\"zip\":\"858877\",\"lat\":1.352,\"lon\":103.8198,\"timezone\":\"Asia\\/Singapore\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"162.158.170.94\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-02-28 14:49:41', '2024-02-28 14:49:41'),
(7, 1, '162.158.170.25', '2024-02-28 14:57:27', '{\"status\":\"success\",\"country\":\"Singapore\",\"countryCode\":\"SG\",\"region\":\"03\",\"regionName\":\"North West\",\"city\":\"Singapore\",\"zip\":\"858877\",\"lat\":1.352,\"lon\":103.8198,\"timezone\":\"Asia\\/Singapore\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"162.158.170.25\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-02-28 14:57:27', '2024-02-28 14:57:27'),
(8, 1, '162.158.170.228', '2024-02-28 17:27:18', '{\"status\":\"success\",\"country\":\"Singapore\",\"countryCode\":\"SG\",\"region\":\"03\",\"regionName\":\"North West\",\"city\":\"Singapore\",\"zip\":\"858877\",\"lat\":1.352,\"lon\":103.8198,\"timezone\":\"Asia\\/Singapore\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"162.158.170.228\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-02-28 17:27:18', '2024-02-28 17:27:18'),
(9, 3, '172.69.178.65', '2024-02-28 15:22:55', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.178.65\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 3, '2024-02-28 15:22:55', '2024-02-28 15:22:55'),
(10, 1, '172.69.87.229', '2024-02-29 11:42:21', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.87.229\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-02-29 11:42:21', '2024-02-29 11:42:21'),
(11, 1, '162.158.235.35', '2024-03-26 18:33:32', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"162.158.235.35\",\"browser_name\":\"Edge\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-03-26 18:33:32', '2024-03-26 18:33:32'),
(12, 1, '162.158.235.84', '2024-03-30 16:35:36', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"162.158.235.84\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-03-30 16:35:36', '2024-03-30 16:35:36'),
(13, 2, '172.71.198.88', '2024-03-30 16:38:01', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.198.88\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 2, '2024-03-30 16:38:01', '2024-03-30 16:38:01'),
(14, 1, '162.158.189.36', '2024-04-01 16:26:38', '{\"status\":\"success\",\"country\":\"Singapore\",\"countryCode\":\"SG\",\"region\":\"03\",\"regionName\":\"North West\",\"city\":\"Singapore\",\"zip\":\"858877\",\"lat\":1.352,\"lon\":103.8198,\"timezone\":\"Asia\\/Singapore\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"162.158.189.36\",\"browser_name\":\"Edge\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-04-01 16:26:38', '2024-04-01 16:26:38'),
(15, 1, '172.71.202.164', '2024-04-05 09:47:46', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.202.164\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-04-05 09:47:46', '2024-04-05 09:47:46'),
(16, 1, '172.71.198.124', '2024-04-05 09:54:59', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.198.124\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-04-05 09:54:59', '2024-04-05 09:54:59'),
(17, 5, '172.69.86.134', '2024-04-05 17:38:30', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.86.134\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 5, '2024-04-05 17:38:30', '2024-04-05 17:38:30'),
(18, 5, '172.71.198.152', '2024-04-05 18:31:42', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.198.152\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 5, '2024-04-05 18:31:42', '2024-04-05 18:31:42'),
(19, 1, '162.158.189.76', '2024-04-08 14:14:58', '{\"status\":\"success\",\"country\":\"Singapore\",\"countryCode\":\"SG\",\"region\":\"03\",\"regionName\":\"North West\",\"city\":\"Singapore\",\"zip\":\"858877\",\"lat\":1.352,\"lon\":103.8198,\"timezone\":\"Asia\\/Singapore\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"162.158.189.76\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-04-08 14:14:58', '2024-04-08 14:14:58'),
(20, 5, '172.70.92.228', '2024-04-08 14:19:28', '{\"status\":\"success\",\"country\":\"Singapore\",\"countryCode\":\"SG\",\"region\":\"03\",\"regionName\":\"North West\",\"city\":\"Singapore\",\"zip\":\"858877\",\"lat\":1.352,\"lon\":103.8198,\"timezone\":\"Asia\\/Singapore\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.70.92.228\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 5, '2024-04-08 14:19:28', '2024-04-08 14:19:28'),
(21, 5, '172.70.188.183', '2024-04-08 15:04:48', '{\"status\":\"success\",\"country\":\"Singapore\",\"countryCode\":\"SG\",\"region\":\"03\",\"regionName\":\"North West\",\"city\":\"Singapore\",\"zip\":\"858877\",\"lat\":1.352,\"lon\":103.8198,\"timezone\":\"Asia\\/Singapore\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.70.188.183\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 5, '2024-04-08 15:04:48', '2024-04-08 15:04:48'),
(22, 5, '172.69.94.233', '2024-04-08 18:41:10', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.94.233\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 5, '2024-04-08 18:41:10', '2024-04-08 18:41:10'),
(23, 6, '172.70.189.81', '2024-04-10 15:44:31', '{\"status\":\"success\",\"country\":\"Singapore\",\"countryCode\":\"SG\",\"region\":\"03\",\"regionName\":\"North West\",\"city\":\"Singapore\",\"zip\":\"858877\",\"lat\":1.352,\"lon\":103.8198,\"timezone\":\"Asia\\/Singapore\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.70.189.81\",\"browser_name\":\"Safari\",\"os_name\":\"iOS\",\"browser_language\":\"en\",\"device_type\":\"mobile\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 6, '2024-04-10 15:44:31', '2024-04-10 15:44:31'),
(24, 1, '172.69.86.244', '2024-04-10 13:35:42', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.86.244\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-04-10 13:35:42', '2024-04-10 13:35:42'),
(25, 9, '162.158.235.35', '2024-05-09 13:31:30', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"162.158.235.35\",\"browser_name\":\"Edge\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 9, '2024-05-09 13:31:30', '2024-05-09 13:31:30'),
(26, 1, '172.71.202.66', '2024-05-22 13:18:43', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.202.66\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-05-22 13:18:43', '2024-05-22 13:18:43'),
(27, 1, '172.71.202.66', '2024-05-22 13:20:35', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.202.66\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-05-22 13:20:35', '2024-05-22 13:20:35'),
(28, 1, '172.71.202.66', '2024-05-22 13:21:28', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.202.66\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-05-22 13:21:28', '2024-05-22 13:21:28'),
(29, 1, '172.70.218.33', '2024-05-22 13:25:10', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.70.218.33\",\"browser_name\":\"Edge\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-05-22 13:25:10', '2024-05-22 13:25:10'),
(30, 1, '172.69.94.254', '2024-05-22 13:34:00', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.94.254\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-05-22 13:34:00', '2024-05-22 13:34:00'),
(31, 1, '172.69.178.248', '2024-05-22 13:53:46', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.178.248\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-05-22 13:53:46', '2024-05-22 13:53:46'),
(32, 1, '172.69.179.23', '2024-05-22 18:07:25', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.179.23\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-05-22 18:07:25', '2024-05-22 18:07:25'),
(33, 1, '172.69.86.216', '2024-05-22 18:11:41', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.86.216\",\"browser_name\":\"Edge\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-05-22 18:11:41', '2024-05-22 18:11:41'),
(34, 1, '172.69.94.232', '2024-05-22 18:13:19', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.94.232\",\"browser_name\":\"Edge\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-05-22 18:13:19', '2024-05-22 18:13:19'),
(35, 1, '172.69.94.232', '2024-05-22 18:13:54', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.94.232\",\"browser_name\":\"Edge\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-05-22 18:13:54', '2024-05-22 18:13:54'),
(36, 1, '172.69.94.232', '2024-05-22 18:14:22', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.94.232\",\"browser_name\":\"Edge\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-05-22 18:14:22', '2024-05-22 18:14:22'),
(37, 1, '172.69.94.232', '2024-05-22 18:14:44', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.94.232\",\"browser_name\":\"Edge\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-05-22 18:14:44', '2024-05-22 18:14:44'),
(38, 1, '172.69.178.70', '2024-05-22 18:36:27', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.178.70\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-05-22 18:36:27', '2024-05-22 18:36:27'),
(39, 1, '172.69.94.254', '2024-05-22 18:41:33', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.94.254\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-05-22 18:41:33', '2024-05-22 18:41:33'),
(40, 9, '172.69.86.18', '2024-05-22 18:42:48', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.86.18\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 9, '2024-05-22 18:42:48', '2024-05-22 18:42:48'),
(42, 13, '172.71.182.85', '2024-05-23 07:26:36', '{\"status\":\"success\",\"country\":\"Netherlands\",\"countryCode\":\"NL\",\"region\":\"NH\",\"regionName\":\"North Holland\",\"city\":\"Amsterdam\",\"zip\":\"\",\"lat\":52.3675,\"lon\":4.9041,\"timezone\":\"Europe\\/Amsterdam\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.182.85\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 13, '2024-05-23 07:26:36', '2024-05-23 07:26:36'),
(43, 13, '172.71.98.174', '2024-05-23 07:44:57', '{\"status\":\"success\",\"country\":\"Netherlands\",\"countryCode\":\"NL\",\"region\":\"NH\",\"regionName\":\"North Holland\",\"city\":\"Amsterdam\",\"zip\":\"\",\"lat\":52.3675,\"lon\":4.9041,\"timezone\":\"Europe\\/Amsterdam\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.98.174\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 13, '2024-05-23 07:44:57', '2024-05-23 07:44:57'),
(44, 13, '172.70.219.139', '2024-05-23 12:32:08', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.70.219.139\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 13, '2024-05-23 12:32:08', '2024-05-23 12:32:08'),
(45, 13, '162.158.48.9', '2024-05-23 12:46:55', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"162.158.48.9\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 13, '2024-05-23 12:46:55', '2024-05-23 12:46:55'),
(46, 13, '172.70.219.22', '2024-05-23 13:08:37', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.70.219.22\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 13, '2024-05-23 13:08:37', '2024-05-23 13:08:37'),
(47, 13, '172.70.219.22', '2024-05-23 13:09:14', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.70.219.22\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 13, '2024-05-23 13:09:14', '2024-05-23 13:09:14'),
(48, 13, '172.70.219.22', '2024-05-23 13:10:38', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.70.219.22\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 13, '2024-05-23 13:10:38', '2024-05-23 13:10:38'),
(49, 13, '172.70.218.79', '2024-05-23 13:21:59', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.70.218.79\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 13, '2024-05-23 13:21:59', '2024-05-23 13:21:59'),
(50, 1, '172.69.179.224', '2024-05-23 13:32:36', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.179.224\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-05-23 13:32:36', '2024-05-23 13:32:36'),
(51, 13, '172.69.179.224', '2024-05-23 13:33:11', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.179.224\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 13, '2024-05-23 13:33:11', '2024-05-23 13:33:11'),
(52, 1, '172.69.179.224', '2024-05-23 13:33:45', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.179.224\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-05-23 13:33:45', '2024-05-23 13:33:45'),
(53, 13, '172.69.179.224', '2024-05-23 13:34:33', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.179.224\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 13, '2024-05-23 13:34:33', '2024-05-23 13:34:33'),
(54, 1, '172.69.179.224', '2024-05-23 13:35:21', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.179.224\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-05-23 13:35:21', '2024-05-23 13:35:21'),
(55, 13, '172.69.179.224', '2024-05-23 13:36:54', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.179.224\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 13, '2024-05-23 13:36:54', '2024-05-23 13:36:54'),
(56, 13, '172.69.179.224', '2024-05-23 13:39:51', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.179.224\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 13, '2024-05-23 13:39:51', '2024-05-23 13:39:51'),
(57, 13, '172.71.198.156', '2024-05-23 14:42:27', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.198.156\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 13, '2024-05-23 14:42:27', '2024-05-23 14:42:27'),
(58, 13, '172.71.198.127', '2024-05-23 15:04:33', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.198.127\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 13, '2024-05-23 15:04:33', '2024-05-23 15:04:33'),
(59, 9, '172.69.86.65', '2024-05-25 19:23:35', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.86.65\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 9, '2024-05-25 19:23:35', '2024-05-25 19:23:35'),
(60, 9, '172.69.179.203', '2024-05-30 13:03:57', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.179.203\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 9, '2024-05-30 13:03:57', '2024-05-30 13:03:57'),
(61, 13, '172.69.87.19', '2024-06-03 15:08:07', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.87.19\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 13, '2024-06-03 15:08:07', '2024-06-03 15:08:07'),
(62, 13, '162.158.54.141', '2024-06-03 15:10:17', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"TN\",\"regionName\":\"Tamil Nadu\",\"city\":\"Chennai\",\"zip\":\"\",\"lat\":13.0826,\"lon\":80.2707,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"162.158.54.141\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 13, '2024-06-03 15:10:17', '2024-06-03 15:10:17'),
(63, 1, '162.158.48.7', '2024-06-03 15:11:36', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"162.158.48.7\",\"browser_name\":\"Edge\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-06-03 15:11:36', '2024-06-03 15:11:36'),
(64, 1, '172.69.94.254', '2024-06-03 16:14:16', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.94.254\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-06-03 16:14:16', '2024-06-03 16:14:16'),
(65, 1, '172.69.94.254', '2024-06-03 16:18:58', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.94.254\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-06-03 16:18:58', '2024-06-03 16:18:58'),
(66, 13, '172.69.179.203', '2024-06-03 17:36:58', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.179.203\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 13, '2024-06-03 17:36:58', '2024-06-03 17:36:58'),
(67, 18, '172.69.95.172', '2024-06-03 18:22:59', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.95.172\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 18, '2024-06-03 18:22:59', '2024-06-03 18:22:59'),
(68, 1, '172.71.198.142', '2024-06-03 18:31:32', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.198.142\",\"browser_name\":\"Edge\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-06-03 18:31:32', '2024-06-03 18:31:32'),
(69, 18, '172.69.178.65', '2024-06-03 19:12:48', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.178.65\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 18, '2024-06-03 19:12:48', '2024-06-03 19:12:48'),
(70, 13, '172.69.178.38', '2024-06-04 10:26:16', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.178.38\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 13, '2024-06-04 10:26:16', '2024-06-04 10:26:16'),
(71, 9, '172.71.202.28', '2024-06-04 11:13:18', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.202.28\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 9, '2024-06-04 11:13:18', '2024-06-04 11:13:18'),
(72, 9, '172.69.94.8', '2024-06-04 11:55:32', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.94.8\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 9, '2024-06-04 11:55:32', '2024-06-04 11:55:32'),
(73, 13, '172.69.179.170', '2024-06-04 12:56:34', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.179.170\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 13, '2024-06-04 12:56:34', '2024-06-04 12:56:34'),
(74, 13, '172.69.95.2', '2024-06-04 13:31:55', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.95.2\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 13, '2024-06-04 13:31:55', '2024-06-04 13:31:55'),
(75, 1, '172.69.179.169', '2024-06-04 13:51:09', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.179.169\",\"browser_name\":\"Edge\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-06-04 13:51:09', '2024-06-04 13:51:09'),
(76, 1, '172.69.95.164', '2024-06-04 15:37:44', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.95.164\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-06-04 15:37:44', '2024-06-04 15:37:44'),
(77, 13, '172.69.178.38', '2024-06-04 16:36:36', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.178.38\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 13, '2024-06-04 16:36:36', '2024-06-04 16:36:36'),
(78, 13, '172.70.219.28', '2024-06-04 16:40:55', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.70.219.28\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 13, '2024-06-04 16:40:55', '2024-06-04 16:40:55'),
(79, 13, '172.69.87.137', '2024-06-04 17:00:36', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.87.137\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 13, '2024-06-04 17:00:36', '2024-06-04 17:00:36'),
(80, 1, '172.70.218.164', '2024-06-04 17:03:36', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.70.218.164\",\"browser_name\":\"Edge\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-06-04 17:03:36', '2024-06-04 17:03:36'),
(81, 13, '172.71.202.66', '2024-06-04 17:16:14', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.202.66\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 13, '2024-06-04 17:16:14', '2024-06-04 17:16:14'),
(82, 19, '172.69.86.228', '2024-06-04 17:32:36', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.86.228\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 19, '2024-06-04 17:32:36', '2024-06-04 17:32:36'),
(83, 13, '172.69.179.203', '2024-06-04 17:34:31', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.179.203\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 13, '2024-06-04 17:34:31', '2024-06-04 17:34:31');
INSERT INTO `login_details` (`id`, `user_id`, `ip`, `date`, `details`, `type`, `created_by`, `created_at`, `updated_at`) VALUES
(84, 13, '172.69.86.229', '2024-06-04 18:19:14', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.86.229\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 13, '2024-06-04 18:19:14', '2024-06-04 18:19:14'),
(85, 13, '172.69.94.57', '2024-06-04 18:30:40', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.94.57\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 13, '2024-06-04 18:30:40', '2024-06-04 18:30:40'),
(86, 13, '172.71.98.33', '2024-06-04 15:23:55', '{\"status\":\"success\",\"country\":\"Netherlands\",\"countryCode\":\"NL\",\"region\":\"NH\",\"regionName\":\"North Holland\",\"city\":\"Amsterdam\",\"zip\":\"\",\"lat\":52.3675,\"lon\":4.9041,\"timezone\":\"Europe\\/Amsterdam\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.98.33\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 13, '2024-06-04 15:23:55', '2024-06-04 15:23:55'),
(87, 9, '172.69.94.57', '2024-06-04 18:55:20', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.94.57\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 9, '2024-06-04 18:55:20', '2024-06-04 18:55:20'),
(88, 1, '172.71.183.166', '2024-06-04 15:32:16', '{\"status\":\"success\",\"country\":\"Netherlands\",\"countryCode\":\"NL\",\"region\":\"NH\",\"regionName\":\"North Holland\",\"city\":\"Amsterdam\",\"zip\":\"\",\"lat\":52.3675,\"lon\":4.9041,\"timezone\":\"Europe\\/Amsterdam\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.183.166\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-06-04 15:32:16', '2024-06-04 15:32:16'),
(89, 13, '172.71.103.223', '2024-06-04 15:37:30', '{\"status\":\"success\",\"country\":\"Netherlands\",\"countryCode\":\"NL\",\"region\":\"NH\",\"regionName\":\"North Holland\",\"city\":\"Amsterdam\",\"zip\":\"\",\"lat\":52.3675,\"lon\":4.9041,\"timezone\":\"Europe\\/Amsterdam\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.103.223\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 13, '2024-06-04 15:37:30', '2024-06-04 15:37:30'),
(90, 13, '172.69.86.64', '2024-06-05 10:46:08', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.86.64\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 13, '2024-06-05 10:46:08', '2024-06-05 10:46:08'),
(91, 1, '172.69.86.228', '2024-06-05 10:48:36', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.86.228\",\"browser_name\":\"Edge\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-06-05 10:48:36', '2024-06-05 10:48:36'),
(92, 18, '172.69.94.33', '2024-06-05 11:08:05', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.94.33\",\"browser_name\":\"Edge\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 18, '2024-06-05 11:08:05', '2024-06-05 11:08:05'),
(93, 13, '172.70.218.196', '2024-06-05 17:29:06', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.70.218.196\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 13, '2024-06-05 17:29:06', '2024-06-05 17:29:06'),
(94, 1, '172.70.218.234', '2024-06-05 18:46:07', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.70.218.234\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-06-05 18:46:07', '2024-06-05 18:46:07'),
(95, 13, '172.69.86.41', '2024-06-05 18:50:32', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.86.41\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 13, '2024-06-05 18:50:32', '2024-06-05 18:50:32'),
(96, 9, '172.71.202.88', '2024-06-05 19:13:42', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.202.88\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 9, '2024-06-05 19:13:42', '2024-06-05 19:13:42'),
(97, 13, '172.69.179.169', '2024-06-05 19:14:58', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.179.169\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 13, '2024-06-05 19:14:58', '2024-06-05 19:14:58'),
(98, 13, '172.71.198.153', '2024-06-06 10:47:36', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.198.153\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 13, '2024-06-06 10:47:36', '2024-06-06 10:47:36'),
(99, 1, '172.69.178.126', '2024-06-06 11:48:41', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.178.126\",\"browser_name\":\"Edge\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-06-06 11:48:41', '2024-06-06 11:48:41'),
(100, 13, '172.69.178.65', '2024-06-06 13:16:34', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.178.65\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 13, '2024-06-06 13:16:34', '2024-06-06 13:16:34'),
(101, 9, '172.69.94.32', '2024-06-07 11:36:43', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.94.32\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 9, '2024-06-07 11:36:43', '2024-06-07 11:36:43'),
(102, 9, '172.69.95.2', '2024-06-07 11:38:16', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.95.2\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 9, '2024-06-07 11:38:16', '2024-06-07 11:38:16'),
(103, 1, '172.69.94.8', '2024-06-07 12:35:13', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.94.8\",\"browser_name\":\"Edge\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-06-07 12:35:13', '2024-06-07 12:35:13'),
(104, 13, '172.69.178.244', '2024-06-07 15:24:07', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.178.244\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 13, '2024-06-07 15:24:07', '2024-06-07 15:24:07'),
(105, 9, '172.69.178.64', '2024-06-07 15:30:54', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.178.64\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 9, '2024-06-07 15:30:54', '2024-06-07 15:30:54'),
(106, 13, '172.69.179.170', '2024-06-07 15:40:30', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.179.170\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 13, '2024-06-07 15:40:30', '2024-06-07 15:40:30'),
(107, 13, '172.70.218.117', '2024-06-07 15:53:51', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.70.218.117\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 13, '2024-06-07 15:53:51', '2024-06-07 15:53:51'),
(108, 9, '172.69.95.172', '2024-06-07 16:15:57', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.95.172\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 9, '2024-06-07 16:15:57', '2024-06-07 16:15:57'),
(109, 1, '172.70.218.205', '2024-07-01 17:40:56', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.70.218.205\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-07-01 17:40:56', '2024-07-01 17:40:56'),
(110, 13, '172.69.178.167', '2024-07-01 18:26:09', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.178.167\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 13, '2024-07-01 18:26:09', '2024-07-01 18:26:09'),
(111, 33, '172.69.95.172', '2024-07-08 15:58:26', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.95.172\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 33, '2024-07-08 15:58:26', '2024-07-08 15:58:26'),
(112, 33, '172.70.219.27', '2024-07-08 16:01:24', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.70.219.27\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 33, '2024-07-08 16:01:24', '2024-07-08 16:01:24'),
(113, 33, '172.69.86.229', '2024-07-08 17:02:03', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.86.229\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 33, '2024-07-08 17:02:03', '2024-07-08 17:02:03'),
(114, 33, '172.69.95.6', '2024-07-08 17:15:02', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.95.6\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 33, '2024-07-08 17:15:02', '2024-07-08 17:15:02'),
(115, 33, '172.69.178.228', '2024-07-08 17:31:52', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.178.228\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 33, '2024-07-08 17:31:52', '2024-07-08 17:31:52'),
(116, 33, '172.69.94.73', '2024-07-09 11:03:52', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.94.73\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 33, '2024-07-09 11:03:52', '2024-07-09 11:03:52'),
(117, 35, '172.71.198.126', '2024-07-17 15:59:19', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.198.126\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 35, '2024-07-17 15:59:19', '2024-07-17 15:59:19'),
(118, 35, '172.69.87.87', '2024-07-18 09:50:02', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.87.87\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 35, '2024-07-18 09:50:02', '2024-07-18 09:50:02'),
(120, 35, '172.69.86.250', '2024-07-18 10:53:35', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.86.250\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 35, '2024-07-18 10:53:35', '2024-07-18 10:53:35'),
(121, 35, '172.69.179.44', '2024-07-19 09:40:03', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.179.44\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 35, '2024-07-19 09:40:03', '2024-07-19 09:40:03'),
(125, 35, '188.114.102.177', '2024-07-20 13:46:48', '{\"status\":\"success\",\"country\":\"Italy\",\"countryCode\":\"IT\",\"region\":\"25\",\"regionName\":\"Lombardy\",\"city\":\"Milan\",\"zip\":\"\",\"lat\":45.4642,\"lon\":9.1899,\"timezone\":\"Europe\\/Rome\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"188.114.102.177\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 35, '2024-07-20 13:46:49', '2024-07-20 13:46:49'),
(126, 35, '162.158.23.53', '2024-07-22 06:24:39', '{\"status\":\"success\",\"country\":\"France\",\"countryCode\":\"FR\",\"region\":\"PAC\",\"regionName\":\"Provence-Alpes-C\\u00f4te d\'Azur\",\"city\":\"Marseille\",\"zip\":\"\",\"lat\":43.2964,\"lon\":5.3697,\"timezone\":\"Europe\\/Paris\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"162.158.23.53\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 35, '2024-07-22 06:24:39', '2024-07-22 06:24:39'),
(127, 39, '162.158.227.23', '2024-07-23 18:30:15', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"162.158.227.23\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-07-23 18:30:15', '2024-07-23 18:30:15'),
(128, 35, '162.158.22.226', '2024-07-24 07:16:37', '{\"status\":\"success\",\"country\":\"France\",\"countryCode\":\"FR\",\"region\":\"PAC\",\"regionName\":\"Provence-Alpes-C\\u00f4te d\'Azur\",\"city\":\"Marseille\",\"zip\":\"\",\"lat\":43.2964,\"lon\":5.3697,\"timezone\":\"Europe\\/Paris\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"162.158.22.226\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 35, '2024-07-24 07:16:37', '2024-07-24 07:16:37'),
(129, 39, '172.71.198.141', '2024-07-24 11:49:55', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.198.141\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-07-24 11:49:55', '2024-07-24 11:49:55'),
(130, 39, '172.69.179.44', '2024-07-24 12:49:41', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.179.44\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-07-24 12:49:41', '2024-07-24 12:49:41'),
(131, 45, '172.69.95.94', '2024-07-24 13:48:14', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.95.94\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 45, '2024-07-24 13:48:14', '2024-07-24 13:48:14'),
(132, 45, '172.69.179.114', '2024-07-24 18:23:35', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.179.114\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 45, '2024-07-24 18:23:35', '2024-07-24 18:23:35'),
(133, 45, '172.69.179.43', '2024-07-25 11:00:59', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.179.43\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 45, '2024-07-25 11:00:59', '2024-07-25 11:00:59'),
(134, 39, '172.69.95.169', '2024-07-26 11:31:49', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.95.169\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-07-26 11:31:49', '2024-07-26 11:31:49'),
(135, 39, '172.69.178.228', '2024-07-27 10:32:57', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.178.228\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-07-27 10:32:57', '2024-07-27 10:32:57'),
(136, 39, '172.69.87.111', '2024-07-27 12:02:30', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.87.111\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-07-27 12:02:30', '2024-07-27 12:02:30'),
(137, 39, '172.71.198.153', '2024-07-29 10:55:14', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.198.153\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-07-29 10:55:14', '2024-07-29 10:55:14'),
(138, 43, '172.69.178.251', '2024-07-29 18:13:23', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.178.251\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'client', 39, '2024-07-29 18:13:23', '2024-07-29 18:13:23'),
(139, 39, '172.69.87.87', '2024-07-29 18:29:18', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.87.87\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-07-29 18:29:18', '2024-07-29 18:29:18'),
(140, 39, '172.71.202.117', '2024-07-30 11:22:14', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.202.117\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-07-30 11:22:14', '2024-07-30 11:22:14'),
(141, 43, '172.71.198.145', '2024-07-30 16:29:38', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.198.145\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'client', 39, '2024-07-30 16:29:38', '2024-07-30 16:29:38'),
(142, 39, '172.70.218.117', '2024-07-30 16:42:47', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.70.218.117\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-07-30 16:42:47', '2024-07-30 16:42:47'),
(143, 40, '172.69.179.92', '2024-07-30 17:05:46', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.179.92\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 40, '2024-07-30 17:05:46', '2024-07-30 17:05:46'),
(144, 39, '172.69.179.92', '2024-07-30 17:06:08', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.179.92\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-07-30 17:06:08', '2024-07-30 17:06:08'),
(145, 39, '172.69.86.128', '2024-07-30 17:16:41', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.86.128\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-07-30 17:16:41', '2024-07-30 17:16:41'),
(146, 39, '172.69.87.88', '2024-07-31 11:08:48', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.87.88\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-07-31 11:08:48', '2024-07-31 11:08:48'),
(147, 40, '172.69.94.72', '2024-07-31 12:04:57', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.94.72\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 40, '2024-07-31 12:04:57', '2024-07-31 12:04:57'),
(148, 39, '172.69.86.41', '2024-07-31 12:10:29', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.86.41\",\"browser_name\":\"Opera\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-07-31 12:10:29', '2024-07-31 12:10:29'),
(149, 39, '172.71.202.179', '2024-07-31 12:31:18', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.202.179\",\"browser_name\":\"Opera\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-07-31 12:31:18', '2024-07-31 12:31:18'),
(150, 39, '162.158.235.9', '2024-07-31 12:51:51', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"162.158.235.9\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-07-31 12:51:51', '2024-07-31 12:51:51'),
(151, 39, '172.69.178.251', '2024-07-31 17:12:20', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.178.251\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-07-31 17:12:20', '2024-07-31 17:12:20'),
(152, 39, '172.69.94.168', '2024-08-01 10:54:29', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.94.168\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-08-01 10:54:29', '2024-08-01 10:54:29'),
(153, 39, '172.70.218.32', '2024-08-06 11:42:41', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.70.218.32\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-08-06 11:42:41', '2024-08-06 11:42:41'),
(154, 40, '172.69.95.6', '2024-08-06 11:51:43', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.95.6\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 40, '2024-08-06 11:51:43', '2024-08-06 11:51:43'),
(155, 39, '172.69.87.92', '2024-08-06 12:02:39', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.87.92\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-08-06 12:02:39', '2024-08-06 12:02:39'),
(156, 39, '172.69.87.92', '2024-08-06 12:02:54', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.87.92\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-08-06 12:02:54', '2024-08-06 12:02:54'),
(157, 40, '172.69.87.152', '2024-08-06 12:03:43', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.87.152\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 40, '2024-08-06 12:03:43', '2024-08-06 12:03:43'),
(158, 39, '172.69.94.18', '2024-08-06 12:07:09', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.94.18\",\"browser_name\":\"Opera\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-08-06 12:07:09', '2024-08-06 12:07:09'),
(159, 40, '172.69.94.18', '2024-08-06 12:07:36', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.94.18\",\"browser_name\":\"Opera\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 40, '2024-08-06 12:07:36', '2024-08-06 12:07:36'),
(160, 39, '172.71.198.147', '2024-08-06 12:36:03', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.198.147\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-08-06 12:36:03', '2024-08-06 12:36:03'),
(161, 39, '172.69.87.91', '2024-08-06 15:38:33', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.87.91\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-08-06 15:38:33', '2024-08-06 15:38:33'),
(162, 39, '172.69.95.5', '2024-08-07 11:36:49', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.95.5\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-08-07 11:36:49', '2024-08-07 11:36:49'),
(163, 40, '172.69.178.250', '2024-08-07 12:44:59', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.178.250\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 40, '2024-08-07 12:44:59', '2024-08-07 12:44:59'),
(164, 40, '172.69.178.250', '2024-08-07 12:45:16', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.178.250\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 40, '2024-08-07 12:45:16', '2024-08-07 12:45:16'),
(165, 39, '172.69.178.250', '2024-08-07 12:45:26', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.178.250\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-08-07 12:45:26', '2024-08-07 12:45:26'),
(166, 39, '172.69.178.250', '2024-08-07 12:46:32', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.178.250\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-08-07 12:46:32', '2024-08-07 12:46:32'),
(167, 39, '172.69.95.93', '2024-08-08 11:00:45', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.95.93\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-08-08 11:00:45', '2024-08-08 11:00:45'),
(168, 39, '172.71.81.182', '2024-08-08 17:36:25', '{\"status\":\"success\",\"country\":\"Singapore\",\"countryCode\":\"SG\",\"region\":\"03\",\"regionName\":\"North West\",\"city\":\"Singapore\",\"zip\":\"858877\",\"lat\":1.352,\"lon\":103.8198,\"timezone\":\"Asia\\/Singapore\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.81.182\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-08-08 17:36:25', '2024-08-08 17:36:25'),
(169, 39, '172.69.178.229', '2024-08-09 11:03:07', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.178.229\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-08-09 11:03:07', '2024-08-09 11:03:07');
INSERT INTO `login_details` (`id`, `user_id`, `ip`, `date`, `details`, `type`, `created_by`, `created_at`, `updated_at`) VALUES
(170, 40, '172.69.179.68', '2024-08-09 17:28:22', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.179.68\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 40, '2024-08-09 17:28:22', '2024-08-09 17:28:22'),
(171, 40, '172.69.179.68', '2024-08-09 17:28:43', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.179.68\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 40, '2024-08-09 17:28:43', '2024-08-09 17:28:43'),
(172, 39, '172.69.86.63', '2024-08-09 17:38:16', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.86.63\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-08-09 17:38:16', '2024-08-09 17:38:16'),
(173, 39, '172.69.94.107', '2024-08-10 11:14:09', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.94.107\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-08-10 11:14:09', '2024-08-10 11:14:09'),
(174, 40, '162.158.227.204', '2024-08-10 11:58:03', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"162.158.227.204\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 40, '2024-08-10 11:58:03', '2024-08-10 11:58:03'),
(175, 39, '172.69.178.251', '2024-08-10 12:03:48', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.178.251\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-08-10 12:03:48', '2024-08-10 12:03:48'),
(176, 39, '172.69.178.177', '2024-08-12 10:57:48', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.178.177\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-08-12 10:57:48', '2024-08-12 10:57:48'),
(177, 39, '172.69.150.78', '2024-08-12 08:02:57', '{\"status\":\"success\",\"country\":\"Germany\",\"countryCode\":\"DE\",\"region\":\"HE\",\"regionName\":\"Hesse\",\"city\":\"Frankfurt\",\"zip\":\"\",\"lat\":50.1109,\"lon\":8.6821,\"timezone\":\"Europe\\/Berlin\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.150.78\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-08-12 08:02:57', '2024-08-12 08:02:57'),
(179, 39, '172.69.150.165', '2024-08-12 14:44:44', '{\"status\":\"success\",\"country\":\"Germany\",\"countryCode\":\"DE\",\"region\":\"HE\",\"regionName\":\"Hesse\",\"city\":\"Frankfurt\",\"zip\":\"\",\"lat\":50.1109,\"lon\":8.6821,\"timezone\":\"Europe\\/Berlin\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.150.165\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-08-12 14:44:44', '2024-08-12 14:44:44'),
(180, 39, '172.69.150.173', '2024-08-13 07:48:09', '{\"status\":\"success\",\"country\":\"Germany\",\"countryCode\":\"DE\",\"region\":\"HE\",\"regionName\":\"Hesse\",\"city\":\"Frankfurt\",\"zip\":\"\",\"lat\":50.1109,\"lon\":8.6821,\"timezone\":\"Europe\\/Berlin\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.150.173\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-08-13 07:48:09', '2024-08-13 07:48:09'),
(181, 40, '162.158.111.98', '2024-08-13 09:35:09', '{\"status\":\"success\",\"country\":\"Germany\",\"countryCode\":\"DE\",\"region\":\"HE\",\"regionName\":\"Hesse\",\"city\":\"Frankfurt\",\"zip\":\"\",\"lat\":50.1109,\"lon\":8.6821,\"timezone\":\"Europe\\/Berlin\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"162.158.111.98\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 40, '2024-08-13 09:35:09', '2024-08-13 09:35:09'),
(182, 39, '172.68.192.147', '2024-08-13 10:13:56', '{\"status\":\"success\",\"country\":\"Germany\",\"countryCode\":\"DE\",\"region\":\"HE\",\"regionName\":\"Hesse\",\"city\":\"Frankfurt\",\"zip\":\"\",\"lat\":50.1109,\"lon\":8.6821,\"timezone\":\"Europe\\/Berlin\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.68.192.147\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-08-13 10:13:56', '2024-08-13 10:13:56'),
(183, 40, '172.68.192.147', '2024-08-13 10:14:48', '{\"status\":\"success\",\"country\":\"Germany\",\"countryCode\":\"DE\",\"region\":\"HE\",\"regionName\":\"Hesse\",\"city\":\"Frankfurt\",\"zip\":\"\",\"lat\":50.1109,\"lon\":8.6821,\"timezone\":\"Europe\\/Berlin\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.68.192.147\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 40, '2024-08-13 10:14:48', '2024-08-13 10:14:48'),
(184, 39, '172.69.179.44', '2024-08-13 15:30:00', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.179.44\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-08-13 15:30:00', '2024-08-13 15:30:00'),
(185, 40, '172.69.179.19', '2024-08-13 15:31:53', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.179.19\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 40, '2024-08-13 15:31:53', '2024-08-13 15:31:53'),
(186, 39, '172.69.179.114', '2024-08-13 15:33:45', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.179.114\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-08-13 15:33:45', '2024-08-13 15:33:45'),
(187, 39, '172.71.202.127', '2024-08-13 18:36:09', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.202.127\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-08-13 18:36:09', '2024-08-13 18:36:09'),
(188, 40, '172.69.178.40', '2024-08-13 18:47:17', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.178.40\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 40, '2024-08-13 18:47:17', '2024-08-13 18:47:17'),
(189, 39, '172.69.179.113', '2024-08-13 18:48:41', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.179.113\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-08-13 18:48:41', '2024-08-13 18:48:41'),
(190, 39, '172.69.86.172', '2024-08-14 10:24:39', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.86.172\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-08-14 10:24:39', '2024-08-14 10:24:39'),
(191, 39, '172.69.86.57', '2024-08-14 10:27:05', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.86.57\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-08-14 10:27:05', '2024-08-14 10:27:05'),
(192, 39, '172.69.179.19', '2024-08-16 12:53:00', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.179.19\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-08-16 12:53:00', '2024-08-16 12:53:00'),
(193, 40, '172.69.178.133', '2024-08-16 18:15:54', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.178.133\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 40, '2024-08-16 18:15:54', '2024-08-16 18:15:54'),
(194, 39, '172.69.178.133', '2024-08-16 18:16:08', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.178.133\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-08-16 18:16:08', '2024-08-16 18:16:08'),
(195, 39, '172.69.94.144', '2024-08-17 10:40:59', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.94.144\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-08-17 10:40:59', '2024-08-17 10:40:59'),
(196, 40, '172.70.218.198', '2024-08-17 12:02:49', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.70.218.198\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 40, '2024-08-17 12:02:49', '2024-08-17 12:02:49'),
(197, 40, '172.70.218.198', '2024-08-17 12:03:18', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.70.218.198\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 40, '2024-08-17 12:03:18', '2024-08-17 12:03:18'),
(198, 39, '172.71.198.142', '2024-08-17 12:07:56', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.198.142\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-08-17 12:07:56', '2024-08-17 12:07:56'),
(199, 39, '172.69.179.113', '2024-08-19 18:13:14', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.179.113\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-08-19 18:13:14', '2024-08-19 18:13:14'),
(200, 39, '172.71.202.47', '2024-08-20 13:32:00', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.202.47\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-08-20 13:32:00', '2024-08-20 13:32:00'),
(201, 39, '172.69.179.113', '2024-08-20 13:35:47', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.179.113\",\"browser_name\":\"Edge\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-08-20 13:35:47', '2024-08-20 13:35:47'),
(202, 39, '172.69.94.169', '2024-08-21 10:41:50', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.94.169\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-08-21 10:41:50', '2024-08-21 10:41:50'),
(203, 39, '172.69.87.36', '2024-08-21 18:56:55', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.87.36\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-08-21 18:56:55', '2024-08-21 18:56:55'),
(204, 39, '172.69.179.136', '2024-08-22 10:38:16', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.179.136\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-08-22 10:38:16', '2024-08-22 10:38:16'),
(205, 43, '172.69.94.19', '2024-08-22 11:53:02', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.94.19\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'client', 39, '2024-08-22 11:53:02', '2024-08-22 11:53:02'),
(206, 43, '172.69.178.65', '2024-08-22 11:54:19', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.178.65\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'client', 39, '2024-08-22 11:54:19', '2024-08-22 11:54:19'),
(207, 39, '172.69.86.234', '2024-08-22 11:55:18', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.86.234\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-08-22 11:55:18', '2024-08-22 11:55:18'),
(208, 43, '172.69.179.114', '2024-08-22 12:21:51', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.179.114\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'client', 39, '2024-08-22 12:21:51', '2024-08-22 12:21:51'),
(209, 39, '172.69.87.238', '2024-08-22 12:27:30', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.87.238\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-08-22 12:27:30', '2024-08-22 12:27:30'),
(210, 43, '172.69.87.35', '2024-08-22 12:33:52', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.87.35\",\"browser_name\":\"Opera\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'client', 39, '2024-08-22 12:33:52', '2024-08-22 12:33:52'),
(211, 43, '172.69.95.5', '2024-08-22 15:51:53', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.95.5\",\"browser_name\":\"Opera\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'client', 39, '2024-08-22 15:51:53', '2024-08-22 15:51:53'),
(212, 39, '172.71.202.58', '2024-08-23 10:29:05', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.202.58\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-08-23 10:29:05', '2024-08-23 10:29:05'),
(213, 39, '172.69.95.139', '2024-08-24 10:19:44', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.95.139\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-08-24 10:19:44', '2024-08-24 10:19:44'),
(214, 43, '172.69.178.250', '2024-08-24 13:21:59', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.178.250\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'client', 39, '2024-08-24 13:21:59', '2024-08-24 13:21:59'),
(215, 39, '172.69.179.20', '2024-08-24 13:23:38', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.179.20\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-08-24 13:23:38', '2024-08-24 13:23:38'),
(216, 39, '172.69.179.92', '2024-08-24 18:37:44', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.179.92\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-08-24 18:37:44', '2024-08-24 18:37:44'),
(217, 39, '172.69.86.173', '2024-08-26 10:39:42', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.86.173\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-08-26 10:39:42', '2024-08-26 10:39:42'),
(218, 39, '172.69.87.36', '2024-08-27 11:10:47', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.87.36\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-08-27 11:10:47', '2024-08-27 11:10:47'),
(219, 39, '172.69.87.35', '2024-08-27 15:46:42', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.87.35\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-08-27 15:46:42', '2024-08-27 15:46:42'),
(220, 39, '172.69.94.225', '2024-09-03 10:43:39', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.94.225\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-09-03 10:43:39', '2024-09-03 10:43:39'),
(221, 13, '172.71.98.60', '2024-09-03 10:00:51', '{\"status\":\"success\",\"country\":\"Netherlands\",\"countryCode\":\"NL\",\"region\":\"NH\",\"regionName\":\"North Holland\",\"city\":\"Amsterdam\",\"zip\":\"\",\"lat\":52.3675,\"lon\":4.9041,\"timezone\":\"Europe\\/Amsterdam\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.98.60\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 13, '2024-09-03 10:00:51', '2024-09-03 10:00:51'),
(222, 49, '172.70.47.127', '2024-09-04 08:33:44', '{\"status\":\"success\",\"country\":\"Netherlands\",\"countryCode\":\"NL\",\"region\":\"NH\",\"regionName\":\"North Holland\",\"city\":\"Amsterdam\",\"zip\":\"\",\"lat\":52.3675,\"lon\":4.9041,\"timezone\":\"Europe\\/Amsterdam\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.70.47.127\",\"browser_name\":\"Chrome\",\"os_name\":\"Android\",\"browser_language\":\"en\",\"device_type\":\"mobile\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 49, '2024-09-04 08:33:44', '2024-09-04 08:33:44'),
(223, 49, '172.71.182.127', '2024-09-04 08:34:18', '{\"status\":\"success\",\"country\":\"Netherlands\",\"countryCode\":\"NL\",\"region\":\"NH\",\"regionName\":\"North Holland\",\"city\":\"Amsterdam\",\"zip\":\"\",\"lat\":52.3675,\"lon\":4.9041,\"timezone\":\"Europe\\/Amsterdam\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.182.127\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 49, '2024-09-04 08:34:18', '2024-09-04 08:34:18'),
(224, 1, '172.71.99.180', '2024-09-04 08:35:19', '{\"status\":\"success\",\"country\":\"Netherlands\",\"countryCode\":\"NL\",\"region\":\"NH\",\"regionName\":\"North Holland\",\"city\":\"Amsterdam\",\"zip\":\"\",\"lat\":52.3675,\"lon\":4.9041,\"timezone\":\"Europe\\/Amsterdam\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.99.180\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-09-04 08:35:19', '2024-09-04 08:35:19'),
(225, 49, '172.70.46.157', '2024-09-04 08:37:23', '{\"status\":\"success\",\"country\":\"Netherlands\",\"countryCode\":\"NL\",\"region\":\"NH\",\"regionName\":\"North Holland\",\"city\":\"Amsterdam\",\"zip\":\"\",\"lat\":52.3675,\"lon\":4.9041,\"timezone\":\"Europe\\/Amsterdam\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.70.46.157\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 49, '2024-09-04 08:37:23', '2024-09-04 08:37:23'),
(226, 49, '172.71.102.200', '2024-09-04 09:12:22', '{\"status\":\"success\",\"country\":\"Netherlands\",\"countryCode\":\"NL\",\"region\":\"NH\",\"regionName\":\"North Holland\",\"city\":\"Amsterdam\",\"zip\":\"\",\"lat\":52.3675,\"lon\":4.9041,\"timezone\":\"Europe\\/Amsterdam\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.102.200\",\"browser_name\":\"Edge\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 49, '2024-09-04 09:12:22', '2024-09-04 09:12:22'),
(227, 49, '172.71.102.151', '2024-09-04 13:11:32', '{\"status\":\"success\",\"country\":\"Netherlands\",\"countryCode\":\"NL\",\"region\":\"NH\",\"regionName\":\"North Holland\",\"city\":\"Amsterdam\",\"zip\":\"\",\"lat\":52.3675,\"lon\":4.9041,\"timezone\":\"Europe\\/Amsterdam\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.102.151\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 49, '2024-09-04 13:11:32', '2024-09-04 13:11:32'),
(228, 49, '172.70.46.121', '2024-09-04 13:56:30', '{\"status\":\"success\",\"country\":\"Netherlands\",\"countryCode\":\"NL\",\"region\":\"NH\",\"regionName\":\"North Holland\",\"city\":\"Amsterdam\",\"zip\":\"\",\"lat\":52.3675,\"lon\":4.9041,\"timezone\":\"Europe\\/Amsterdam\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.70.46.121\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 49, '2024-09-04 13:56:30', '2024-09-04 13:56:30'),
(229, 39, '172.69.178.229', '2024-09-04 17:28:10', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.178.229\",\"browser_name\":\"Firefox\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-09-04 17:28:10', '2024-09-04 17:28:10'),
(230, 1, '172.71.99.4', '2024-09-04 14:29:24', '{\"status\":\"success\",\"country\":\"Netherlands\",\"countryCode\":\"NL\",\"region\":\"NH\",\"regionName\":\"North Holland\",\"city\":\"Amsterdam\",\"zip\":\"\",\"lat\":52.3675,\"lon\":4.9041,\"timezone\":\"Europe\\/Amsterdam\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.99.4\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-09-04 14:29:24', '2024-09-04 14:29:24'),
(231, 49, '172.71.182.100', '2024-09-04 14:41:45', '{\"status\":\"success\",\"country\":\"Netherlands\",\"countryCode\":\"NL\",\"region\":\"NH\",\"regionName\":\"North Holland\",\"city\":\"Amsterdam\",\"zip\":\"\",\"lat\":52.3675,\"lon\":4.9041,\"timezone\":\"Europe\\/Amsterdam\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.182.100\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 49, '2024-09-04 14:41:45', '2024-09-04 14:41:45'),
(232, 49, '172.71.183.171', '2024-09-05 07:37:22', '{\"status\":\"success\",\"country\":\"Netherlands\",\"countryCode\":\"NL\",\"region\":\"NH\",\"regionName\":\"North Holland\",\"city\":\"Amsterdam\",\"zip\":\"\",\"lat\":52.3675,\"lon\":4.9041,\"timezone\":\"Europe\\/Amsterdam\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.183.171\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 49, '2024-09-05 07:37:22', '2024-09-05 07:37:22'),
(233, 49, '172.70.47.127', '2024-09-05 08:19:35', '{\"status\":\"success\",\"country\":\"Netherlands\",\"countryCode\":\"NL\",\"region\":\"NH\",\"regionName\":\"North Holland\",\"city\":\"Amsterdam\",\"zip\":\"\",\"lat\":52.3675,\"lon\":4.9041,\"timezone\":\"Europe\\/Amsterdam\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.70.47.127\",\"browser_name\":\"Edge\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 49, '2024-09-05 08:19:35', '2024-09-05 08:19:35'),
(234, 49, '172.71.182.33', '2024-09-05 09:09:31', '{\"status\":\"success\",\"country\":\"Netherlands\",\"countryCode\":\"NL\",\"region\":\"NH\",\"regionName\":\"North Holland\",\"city\":\"Amsterdam\",\"zip\":\"\",\"lat\":52.3675,\"lon\":4.9041,\"timezone\":\"Europe\\/Amsterdam\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.182.33\",\"browser_name\":\"Edge\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 49, '2024-09-05 09:09:32', '2024-09-05 09:09:32'),
(235, 9, '172.71.102.197', '2024-09-05 10:08:21', '{\"status\":\"success\",\"country\":\"Netherlands\",\"countryCode\":\"NL\",\"region\":\"NH\",\"regionName\":\"North Holland\",\"city\":\"Amsterdam\",\"zip\":\"\",\"lat\":52.3675,\"lon\":4.9041,\"timezone\":\"Europe\\/Amsterdam\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.102.197\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 9, '2024-09-05 10:08:21', '2024-09-05 10:08:21'),
(236, 1, '172.71.94.254', '2024-09-05 11:54:17', '{\"status\":\"success\",\"country\":\"Netherlands\",\"countryCode\":\"NL\",\"region\":\"NH\",\"regionName\":\"North Holland\",\"city\":\"Amsterdam\",\"zip\":\"\",\"lat\":52.3675,\"lon\":4.9041,\"timezone\":\"Europe\\/Amsterdam\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.94.254\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-09-05 11:54:17', '2024-09-05 11:54:17'),
(237, 1, '172.71.94.154', '2024-09-05 11:56:52', '{\"status\":\"success\",\"country\":\"Netherlands\",\"countryCode\":\"NL\",\"region\":\"NH\",\"regionName\":\"North Holland\",\"city\":\"Amsterdam\",\"zip\":\"\",\"lat\":52.3675,\"lon\":4.9041,\"timezone\":\"Europe\\/Amsterdam\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.94.154\",\"browser_name\":\"Edge\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-09-05 11:56:52', '2024-09-05 11:56:52'),
(238, 49, '172.71.182.209', '2024-09-05 12:00:12', '{\"status\":\"success\",\"country\":\"Netherlands\",\"countryCode\":\"NL\",\"region\":\"NH\",\"regionName\":\"North Holland\",\"city\":\"Amsterdam\",\"zip\":\"\",\"lat\":52.3675,\"lon\":4.9041,\"timezone\":\"Europe\\/Amsterdam\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.182.209\",\"browser_name\":\"Edge\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 49, '2024-09-05 12:00:12', '2024-09-05 12:00:12'),
(239, 9, '172.71.183.194', '2024-09-05 12:03:17', '{\"status\":\"success\",\"country\":\"Netherlands\",\"countryCode\":\"NL\",\"region\":\"NH\",\"regionName\":\"North Holland\",\"city\":\"Amsterdam\",\"zip\":\"\",\"lat\":52.3675,\"lon\":4.9041,\"timezone\":\"Europe\\/Amsterdam\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.183.194\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 9, '2024-09-05 12:03:17', '2024-09-05 12:03:17'),
(240, 9, '172.71.99.4', '2024-09-28 13:21:36', '{\"status\":\"success\",\"country\":\"Netherlands\",\"countryCode\":\"NL\",\"region\":\"NH\",\"regionName\":\"North Holland\",\"city\":\"Amsterdam\",\"zip\":\"\",\"lat\":52.3675,\"lon\":4.9041,\"timezone\":\"Europe\\/Amsterdam\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.99.4\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 9, '2024-09-28 13:21:36', '2024-09-28 13:21:36'),
(241, 31, '172.70.46.78', '2024-09-30 07:50:37', '{\"status\":\"success\",\"country\":\"Netherlands\",\"countryCode\":\"NL\",\"region\":\"NH\",\"regionName\":\"North Holland\",\"city\":\"Amsterdam\",\"zip\":\"\",\"lat\":52.3675,\"lon\":4.9041,\"timezone\":\"Europe\\/Amsterdam\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.70.46.78\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 9, '2024-09-30 07:50:37', '2024-09-30 07:50:37'),
(242, 31, '172.71.183.194', '2024-09-30 08:24:55', '{\"status\":\"success\",\"country\":\"Netherlands\",\"countryCode\":\"NL\",\"region\":\"NH\",\"regionName\":\"North Holland\",\"city\":\"Amsterdam\",\"zip\":\"\",\"lat\":52.3675,\"lon\":4.9041,\"timezone\":\"Europe\\/Amsterdam\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.183.194\",\"browser_name\":\"Edge\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 9, '2024-09-30 08:24:55', '2024-09-30 08:24:55'),
(243, 31, '172.71.98.61', '2024-09-30 08:46:08', '{\"status\":\"success\",\"country\":\"Netherlands\",\"countryCode\":\"NL\",\"region\":\"NH\",\"regionName\":\"North Holland\",\"city\":\"Amsterdam\",\"zip\":\"\",\"lat\":52.3675,\"lon\":4.9041,\"timezone\":\"Europe\\/Amsterdam\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.98.61\",\"browser_name\":\"Edge\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-09-30 08:46:08', '2024-09-30 08:46:08'),
(244, 9, '172.70.46.20', '2024-09-30 14:12:42', '{\"status\":\"success\",\"country\":\"Netherlands\",\"countryCode\":\"NL\",\"region\":\"NH\",\"regionName\":\"North Holland\",\"city\":\"Amsterdam\",\"zip\":\"\",\"lat\":52.3675,\"lon\":4.9041,\"timezone\":\"Europe\\/Amsterdam\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.70.46.20\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 9, '2024-09-30 14:12:42', '2024-09-30 14:12:42'),
(245, 9, '172.70.46.99', '2024-10-01 07:47:06', '{\"status\":\"success\",\"country\":\"Netherlands\",\"countryCode\":\"NL\",\"region\":\"NH\",\"regionName\":\"North Holland\",\"city\":\"Amsterdam\",\"zip\":\"\",\"lat\":52.3675,\"lon\":4.9041,\"timezone\":\"Europe\\/Amsterdam\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.70.46.99\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 9, '2024-10-01 07:47:06', '2024-10-01 07:47:06'),
(246, 1, '172.71.99.172', '2024-10-01 12:39:35', '{\"status\":\"success\",\"country\":\"Netherlands\",\"countryCode\":\"NL\",\"region\":\"NH\",\"regionName\":\"North Holland\",\"city\":\"Amsterdam\",\"zip\":\"\",\"lat\":52.3675,\"lon\":4.9041,\"timezone\":\"Europe\\/Amsterdam\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.99.172\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-10-01 12:39:35', '2024-10-01 12:39:35'),
(247, 48, '172.70.46.188', '2024-10-01 12:43:46', '{\"status\":\"success\",\"country\":\"Netherlands\",\"countryCode\":\"NL\",\"region\":\"NH\",\"regionName\":\"North Holland\",\"city\":\"Amsterdam\",\"zip\":\"\",\"lat\":52.3675,\"lon\":4.9041,\"timezone\":\"Europe\\/Amsterdam\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.70.46.188\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 48, '2024-10-01 12:43:46', '2024-10-01 12:43:46'),
(248, 1, '172.71.182.101', '2024-10-01 13:14:13', '{\"status\":\"success\",\"country\":\"Netherlands\",\"countryCode\":\"NL\",\"region\":\"NH\",\"regionName\":\"North Holland\",\"city\":\"Amsterdam\",\"zip\":\"\",\"lat\":52.3675,\"lon\":4.9041,\"timezone\":\"Europe\\/Amsterdam\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.182.101\",\"browser_name\":\"Edge\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-10-01 13:14:13', '2024-10-01 13:14:13'),
(249, 48, '172.70.46.108', '2024-10-01 13:15:27', '{\"status\":\"success\",\"country\":\"Netherlands\",\"countryCode\":\"NL\",\"region\":\"NH\",\"regionName\":\"North Holland\",\"city\":\"Amsterdam\",\"zip\":\"\",\"lat\":52.3675,\"lon\":4.9041,\"timezone\":\"Europe\\/Amsterdam\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.70.46.108\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 48, '2024-10-01 13:15:27', '2024-10-01 13:15:27'),
(250, 48, '172.71.183.201', '2024-10-01 13:39:06', '{\"status\":\"success\",\"country\":\"Netherlands\",\"countryCode\":\"NL\",\"region\":\"NH\",\"regionName\":\"North Holland\",\"city\":\"Amsterdam\",\"zip\":\"\",\"lat\":52.3675,\"lon\":4.9041,\"timezone\":\"Europe\\/Amsterdam\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.183.201\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 48, '2024-10-01 13:39:06', '2024-10-01 13:39:06'),
(251, 51, '172.71.102.7', '2024-10-01 13:44:04', '{\"status\":\"success\",\"country\":\"Netherlands\",\"countryCode\":\"NL\",\"region\":\"NH\",\"regionName\":\"North Holland\",\"city\":\"Amsterdam\",\"zip\":\"\",\"lat\":52.3675,\"lon\":4.9041,\"timezone\":\"Europe\\/Amsterdam\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.102.7\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'client', 48, '2024-10-01 13:44:04', '2024-10-01 13:44:04'),
(252, 48, '172.71.183.210', '2024-10-01 14:01:33', '{\"status\":\"success\",\"country\":\"Netherlands\",\"countryCode\":\"NL\",\"region\":\"NH\",\"regionName\":\"North Holland\",\"city\":\"Amsterdam\",\"zip\":\"\",\"lat\":52.3675,\"lon\":4.9041,\"timezone\":\"Europe\\/Amsterdam\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.183.210\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 48, '2024-10-01 14:01:33', '2024-10-01 14:01:33');
INSERT INTO `login_details` (`id`, `user_id`, `ip`, `date`, `details`, `type`, `created_by`, `created_at`, `updated_at`) VALUES
(253, 1, '172.71.94.150', '2024-10-04 07:55:00', '{\"status\":\"success\",\"country\":\"Netherlands\",\"countryCode\":\"NL\",\"region\":\"NH\",\"regionName\":\"North Holland\",\"city\":\"Amsterdam\",\"zip\":\"\",\"lat\":52.3675,\"lon\":4.9041,\"timezone\":\"Europe\\/Amsterdam\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.94.150\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-10-04 07:55:00', '2024-10-04 07:55:00'),
(254, 1, '172.69.94.40', '2024-10-04 12:18:26', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.94.40\",\"browser_name\":\"Edge\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-10-04 12:18:26', '2024-10-04 12:18:26'),
(255, 1, '172.69.86.234', '2024-10-04 15:12:07', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.86.234\",\"browser_name\":\"Edge\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-10-04 15:12:07', '2024-10-04 15:12:07'),
(256, 1, '172.69.95.4', '2024-10-04 15:14:49', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.95.4\",\"browser_name\":\"Edge\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-10-04 15:14:49', '2024-10-04 15:14:49'),
(257, 1, '172.69.178.138', '2024-10-04 15:16:19', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.178.138\",\"browser_name\":\"Edge\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-10-04 15:16:19', '2024-10-04 15:16:19'),
(258, 1, '172.69.178.138', '2024-10-04 15:16:40', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.178.138\",\"browser_name\":\"Edge\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-10-04 15:16:40', '2024-10-04 15:16:40'),
(259, 1, '172.69.178.138', '2024-10-04 15:16:53', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.178.138\",\"browser_name\":\"Edge\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-10-04 15:16:53', '2024-10-04 15:16:53'),
(260, 1, '172.69.178.129', '2024-10-04 15:17:47', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.178.129\",\"browser_name\":\"Edge\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-10-04 15:17:47', '2024-10-04 15:17:47'),
(261, 1, '172.71.202.88', '2024-10-04 15:21:27', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.202.88\",\"browser_name\":\"Edge\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-10-04 15:21:27', '2024-10-04 15:21:27'),
(262, 1, '172.69.86.57', '2024-10-04 16:07:00', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.86.57\",\"browser_name\":\"Edge\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-10-04 16:07:00', '2024-10-04 16:07:00'),
(263, 1, '172.69.178.64', '2024-10-04 16:22:55', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.178.64\",\"browser_name\":\"Edge\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-10-04 16:22:55', '2024-10-04 16:22:55'),
(264, 39, '172.69.86.32', '2024-10-04 18:16:54', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.86.32\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-10-04 18:16:54', '2024-10-04 18:16:54'),
(265, 1, '172.69.86.88', '2024-10-05 11:44:52', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.86.88\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-10-05 11:44:52', '2024-10-05 11:44:52'),
(266, 1, '172.69.178.116', '2024-10-05 13:24:18', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.178.116\",\"browser_name\":\"Opera\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-10-05 13:24:18', '2024-10-05 13:24:18'),
(267, 1, '172.71.198.146', '2024-10-05 13:27:41', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.198.146\",\"browser_name\":\"Firefox\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-10-05 13:27:41', '2024-10-05 13:27:41'),
(268, 1, '162.158.227.153', '2024-10-07 10:17:03', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"162.158.227.153\",\"browser_name\":\"Firefox\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-10-07 10:17:03', '2024-10-07 10:17:03'),
(269, 1, '172.69.178.225', '2024-10-08 10:21:06', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.178.225\",\"browser_name\":\"Firefox\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-10-08 10:21:06', '2024-10-08 10:21:06'),
(270, 1, '172.69.178.214', '2024-10-08 15:43:30', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.178.214\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-10-08 15:43:30', '2024-10-08 15:43:30'),
(271, 1, '172.69.178.128', '2024-10-08 17:45:07', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.178.128\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-10-08 17:45:07', '2024-10-08 17:45:07'),
(272, 39, '172.69.178.214', '2024-10-08 18:17:46', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.178.214\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-10-08 18:17:46', '2024-10-08 18:17:46'),
(273, 39, '172.69.94.195', '2024-10-08 18:20:10', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.94.195\",\"browser_name\":\"Firefox\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-10-08 18:20:10', '2024-10-08 18:20:10'),
(274, 39, '172.71.198.127', '2024-10-09 10:39:04', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.198.127\",\"browser_name\":\"Firefox\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-10-09 10:39:04', '2024-10-09 10:39:04'),
(275, 39, '172.71.198.90', '2024-10-09 15:32:15', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.198.90\",\"browser_name\":\"Firefox\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-10-09 15:32:15', '2024-10-09 15:32:15'),
(276, 1, '172.69.94.234', '2024-10-09 15:35:10', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.94.234\",\"browser_name\":\"Edge\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-10-09 15:35:10', '2024-10-09 15:35:10'),
(277, 39, '172.71.198.144', '2024-10-09 17:13:53', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.198.144\",\"browser_name\":\"Firefox\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-10-09 17:13:53', '2024-10-09 17:13:53'),
(278, 39, '172.70.218.199', '2024-10-10 11:48:20', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.70.218.199\",\"browser_name\":\"Firefox\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-10-10 11:48:20', '2024-10-10 11:48:20'),
(279, 39, '172.69.178.57', '2024-10-10 11:53:54', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.178.57\",\"browser_name\":\"Firefox\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-10-10 11:53:54', '2024-10-10 11:53:54'),
(280, 39, '172.69.86.88', '2024-10-10 18:02:05', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.86.88\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-10-10 18:02:05', '2024-10-10 18:02:05'),
(281, 39, '172.70.218.198', '2024-10-12 13:06:05', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.70.218.198\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-10-12 13:06:05', '2024-10-12 13:06:05'),
(282, 62, '172.69.94.212', '2024-11-25 16:19:04', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.94.212\",\"browser_name\":\"Edge\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 62, '2024-11-25 16:19:04', '2024-11-25 16:19:04'),
(283, 62, '172.69.94.39', '2024-11-25 17:22:31', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.94.39\",\"browser_name\":\"Firefox\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 62, '2024-11-25 17:22:31', '2024-11-25 17:22:31'),
(284, 62, '172.71.198.35', '2024-11-26 11:45:03', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.198.35\",\"browser_name\":\"Firefox\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 62, '2024-11-26 11:45:03', '2024-11-26 11:45:03'),
(285, 62, '172.69.95.176', '2024-11-27 15:10:47', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.95.176\",\"browser_name\":\"Firefox\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 62, '2024-11-27 15:10:47', '2024-11-27 15:10:47'),
(286, 1, '172.71.94.242', '2024-12-03 07:35:17', '{\"status\":\"success\",\"country\":\"Netherlands\",\"countryCode\":\"NL\",\"region\":\"NH\",\"regionName\":\"North Holland\",\"city\":\"Amsterdam\",\"zip\":\"\",\"lat\":52.3675,\"lon\":4.9041,\"timezone\":\"Europe\\/Amsterdam\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.94.242\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-12-03 07:35:17', '2024-12-03 07:35:17'),
(287, 1, '172.71.94.242', '2024-12-03 07:36:17', '{\"status\":\"success\",\"country\":\"Netherlands\",\"countryCode\":\"NL\",\"region\":\"NH\",\"regionName\":\"North Holland\",\"city\":\"Amsterdam\",\"zip\":\"\",\"lat\":52.3675,\"lon\":4.9041,\"timezone\":\"Europe\\/Amsterdam\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.94.242\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-12-03 07:36:17', '2024-12-03 07:36:17'),
(288, 2, '172.71.98.150', '2024-12-03 07:49:45', '{\"status\":\"success\",\"country\":\"Netherlands\",\"countryCode\":\"NL\",\"region\":\"NH\",\"regionName\":\"North Holland\",\"city\":\"Amsterdam\",\"zip\":\"\",\"lat\":52.3675,\"lon\":4.9041,\"timezone\":\"Europe\\/Amsterdam\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.98.150\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 2, '2024-12-03 07:49:45', '2024-12-03 07:49:45'),
(289, 48, '172.71.124.165', '2024-12-03 14:57:51', '{\"status\":\"success\",\"country\":\"Singapore\",\"countryCode\":\"SG\",\"region\":\"03\",\"regionName\":\"North West\",\"city\":\"Singapore\",\"zip\":\"858877\",\"lat\":1.352,\"lon\":103.8198,\"timezone\":\"Asia\\/Singapore\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.124.165\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 48, '2024-12-03 14:57:51', '2024-12-03 14:57:51'),
(290, 50, '172.70.46.95', '2024-12-03 08:04:05', '{\"status\":\"success\",\"country\":\"Netherlands\",\"countryCode\":\"NL\",\"region\":\"NH\",\"regionName\":\"North Holland\",\"city\":\"Amsterdam\",\"zip\":\"\",\"lat\":52.3675,\"lon\":4.9041,\"timezone\":\"Europe\\/Amsterdam\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.70.46.95\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'client', 49, '2024-12-03 08:04:05', '2024-12-03 08:04:05'),
(291, 51, '172.71.103.35', '2024-12-03 08:14:33', '{\"status\":\"success\",\"country\":\"Netherlands\",\"countryCode\":\"NL\",\"region\":\"NH\",\"regionName\":\"North Holland\",\"city\":\"Amsterdam\",\"zip\":\"\",\"lat\":52.3675,\"lon\":4.9041,\"timezone\":\"Europe\\/Amsterdam\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.103.35\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'client', 48, '2024-12-03 08:14:33', '2024-12-03 08:14:33'),
(292, 1, '141.101.76.18', '2024-12-03 08:16:06', '{\"status\":\"success\",\"country\":\"Netherlands\",\"countryCode\":\"NL\",\"region\":\"NH\",\"regionName\":\"North Holland\",\"city\":\"Amsterdam\",\"zip\":\"\",\"lat\":52.3675,\"lon\":4.9041,\"timezone\":\"Europe\\/Amsterdam\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"141.101.76.18\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-12-03 08:16:06', '2024-12-03 08:16:06'),
(293, 1, '141.101.76.34', '2024-12-03 08:23:42', '{\"status\":\"success\",\"country\":\"Netherlands\",\"countryCode\":\"NL\",\"region\":\"NH\",\"regionName\":\"North Holland\",\"city\":\"Amsterdam\",\"zip\":\"\",\"lat\":52.3675,\"lon\":4.9041,\"timezone\":\"Europe\\/Amsterdam\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"141.101.76.34\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-12-03 08:23:42', '2024-12-03 08:23:42'),
(294, 48, '141.101.76.34', '2024-12-03 08:24:12', '{\"status\":\"success\",\"country\":\"Netherlands\",\"countryCode\":\"NL\",\"region\":\"NH\",\"regionName\":\"North Holland\",\"city\":\"Amsterdam\",\"zip\":\"\",\"lat\":52.3675,\"lon\":4.9041,\"timezone\":\"Europe\\/Amsterdam\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"141.101.76.34\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 48, '2024-12-03 08:24:12', '2024-12-03 08:24:12'),
(295, 1, '141.101.76.34', '2024-12-03 08:24:54', '{\"status\":\"success\",\"country\":\"Netherlands\",\"countryCode\":\"NL\",\"region\":\"NH\",\"regionName\":\"North Holland\",\"city\":\"Amsterdam\",\"zip\":\"\",\"lat\":52.3675,\"lon\":4.9041,\"timezone\":\"Europe\\/Amsterdam\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"141.101.76.34\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-12-03 08:24:54', '2024-12-03 08:24:54'),
(296, 1, '162.158.106.106', '2024-12-03 15:39:36', '{\"status\":\"success\",\"country\":\"Singapore\",\"countryCode\":\"SG\",\"region\":\"03\",\"regionName\":\"North West\",\"city\":\"Singapore\",\"zip\":\"858877\",\"lat\":1.352,\"lon\":103.8198,\"timezone\":\"Asia\\/Singapore\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"162.158.106.106\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-12-03 15:39:36', '2024-12-03 15:39:36'),
(297, 1, '162.158.114.44', '2024-12-03 15:42:26', '{\"status\":\"success\",\"country\":\"Hong Kong\",\"countryCode\":\"HK\",\"region\":\"HCW\",\"regionName\":\"Central and Western District\",\"city\":\"Hong Kong\",\"zip\":\"\",\"lat\":22.3193,\"lon\":114.1693,\"timezone\":\"Asia\\/Hong_Kong\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"162.158.114.44\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-12-03 15:42:26', '2024-12-03 15:42:26'),
(298, 48, '162.158.114.44', '2024-12-03 15:42:59', '{\"status\":\"success\",\"country\":\"Hong Kong\",\"countryCode\":\"HK\",\"region\":\"HCW\",\"regionName\":\"Central and Western District\",\"city\":\"Hong Kong\",\"zip\":\"\",\"lat\":22.3193,\"lon\":114.1693,\"timezone\":\"Asia\\/Hong_Kong\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"162.158.114.44\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 48, '2024-12-03 15:42:59', '2024-12-03 15:42:59'),
(299, 1, '108.162.226.244', '2024-12-03 15:46:17', '{\"status\":\"success\",\"country\":\"Singapore\",\"countryCode\":\"SG\",\"region\":\"03\",\"regionName\":\"North West\",\"city\":\"Singapore\",\"zip\":\"858877\",\"lat\":1.352,\"lon\":103.8198,\"timezone\":\"Asia\\/Singapore\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"108.162.226.244\",\"browser_name\":\"Firefox\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-12-03 15:46:17', '2024-12-03 15:46:17'),
(300, 64, '172.71.124.223', '2024-12-03 15:52:07', '{\"status\":\"success\",\"country\":\"Singapore\",\"countryCode\":\"SG\",\"region\":\"03\",\"regionName\":\"North West\",\"city\":\"Singapore\",\"zip\":\"858877\",\"lat\":1.352,\"lon\":103.8198,\"timezone\":\"Asia\\/Singapore\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.124.223\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'user', 48, '2024-12-03 15:52:07', '2024-12-03 15:52:07'),
(301, 65, '172.71.182.239', '2024-12-03 08:52:56', '{\"status\":\"success\",\"country\":\"Netherlands\",\"countryCode\":\"NL\",\"region\":\"NH\",\"regionName\":\"North Holland\",\"city\":\"Amsterdam\",\"zip\":\"\",\"lat\":52.3675,\"lon\":4.9041,\"timezone\":\"Europe\\/Amsterdam\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.182.239\",\"browser_name\":\"Firefox\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'client', 48, '2024-12-03 08:52:56', '2024-12-03 08:52:56'),
(302, 62, '172.69.94.140', '2024-12-03 15:02:47', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.94.140\",\"browser_name\":\"Edge\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 62, '2024-12-03 15:02:47', '2024-12-03 15:02:47'),
(303, 39, '172.69.86.64', '2024-12-03 15:13:09', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Mumbai\",\"zip\":\"\",\"lat\":19.0759,\"lon\":72.8776,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.69.86.64\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 39, '2024-12-03 15:13:09', '2024-12-03 15:13:09'),
(304, 48, '172.71.182.126', '2024-12-03 11:23:51', '{\"status\":\"success\",\"country\":\"Netherlands\",\"countryCode\":\"NL\",\"region\":\"NH\",\"regionName\":\"North Holland\",\"city\":\"Amsterdam\",\"zip\":\"\",\"lat\":52.3675,\"lon\":4.9041,\"timezone\":\"Europe\\/Amsterdam\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.182.126\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 48, '2024-12-03 11:23:51', '2024-12-03 11:23:51'),
(305, 1, '172.71.98.105', '2024-12-03 11:34:30', '{\"status\":\"success\",\"country\":\"Netherlands\",\"countryCode\":\"NL\",\"region\":\"NH\",\"regionName\":\"North Holland\",\"city\":\"Amsterdam\",\"zip\":\"\",\"lat\":52.3675,\"lon\":4.9041,\"timezone\":\"Europe\\/Amsterdam\",\"isp\":\"Cloudflare, Inc.\",\"org\":\"Cloudflare WARP\",\"as\":\"AS13335 Cloudflare, Inc.\",\"query\":\"172.71.98.105\",\"browser_name\":\"Firefox\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-12-03 11:34:30', '2024-12-03 11:34:30'),
(306, 2, '49.36.48.8', '2024-12-23 17:26:12', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411007\",\"lat\":18.616099999999999425881469505839049816131591796875,\"lon\":73.728600000000000136424205265939235687255859375,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Reliance Jio Infocomm Limited\",\"org\":\"RJIL Maharastra FTTX PUBLIC\",\"as\":\"AS55836 Reliance Jio Infocomm Limited\",\"query\":\"49.36.48.8\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 2, '2024-12-23 11:56:12', '2024-12-23 11:56:12'),
(307, 1, '49.36.48.8', '2024-12-23 17:26:36', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411007\",\"lat\":18.616099999999999425881469505839049816131591796875,\"lon\":73.728600000000000136424205265939235687255859375,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Reliance Jio Infocomm Limited\",\"org\":\"RJIL Maharastra FTTX PUBLIC\",\"as\":\"AS55836 Reliance Jio Infocomm Limited\",\"query\":\"49.36.48.8\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-12-23 11:56:36', '2024-12-23 11:56:36'),
(308, 1, '49.36.56.226', '2024-12-24 18:40:33', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411007\",\"lat\":18.616099999999999425881469505839049816131591796875,\"lon\":73.728600000000000136424205265939235687255859375,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Reliance Jio Infocomm Limited\",\"org\":\"RJIL Maharastra FTTX PUBLIC\",\"as\":\"AS55836 Reliance Jio Infocomm Limited\",\"query\":\"49.36.56.226\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-12-24 13:10:33', '2024-12-24 13:10:33'),
(309, 1, '49.36.57.181', '2024-12-24 18:46:00', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411007\",\"lat\":18.616099999999999425881469505839049816131591796875,\"lon\":73.728600000000000136424205265939235687255859375,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Reliance Jio Infocomm Limited\",\"org\":\"RJIL Maharastra FTTX PUBLIC\",\"as\":\"AS55836 Reliance Jio Infocomm Limited\",\"query\":\"49.36.57.181\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-12-24 13:16:00', '2024-12-24 13:16:00'),
(310, 1, '49.36.56.226', '2024-12-24 20:47:50', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411007\",\"lat\":18.616099999999999425881469505839049816131591796875,\"lon\":73.728600000000000136424205265939235687255859375,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Reliance Jio Infocomm Limited\",\"org\":\"RJIL Maharastra FTTX PUBLIC\",\"as\":\"AS55836 Reliance Jio Infocomm Limited\",\"query\":\"49.36.56.226\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-12-24 15:17:50', '2024-12-24 15:17:50'),
(311, 1, '106.195.6.169', '2024-12-25 10:50:05', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411006\",\"lat\":18.616099999999999425881469505839049816131591796875,\"lon\":73.728600000000000136424205265939235687255859375,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Limited\",\"as\":\"AS45609 Bharti Airtel Ltd. AS for GPRS Service\",\"query\":\"106.195.6.169\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-12-25 05:20:05', '2024-12-25 05:20:05'),
(312, 51, '106.195.6.169', '2024-12-25 11:14:20', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411006\",\"lat\":18.616099999999999425881469505839049816131591796875,\"lon\":73.728600000000000136424205265939235687255859375,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Limited\",\"as\":\"AS45609 Bharti Airtel Ltd. AS for GPRS Service\",\"query\":\"106.195.6.169\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'client', 48, '2024-12-25 05:44:20', '2024-12-25 05:44:20'),
(313, 48, '106.195.6.169', '2024-12-25 11:14:44', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411006\",\"lat\":18.616099999999999425881469505839049816131591796875,\"lon\":73.728600000000000136424205265939235687255859375,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Limited\",\"as\":\"AS45609 Bharti Airtel Ltd. AS for GPRS Service\",\"query\":\"106.195.6.169\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 48, '2024-12-25 05:44:44', '2024-12-25 05:44:44'),
(314, 64, '106.195.6.169', '2024-12-25 11:15:58', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411006\",\"lat\":18.616099999999999425881469505839049816131591796875,\"lon\":73.728600000000000136424205265939235687255859375,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Limited\",\"as\":\"AS45609 Bharti Airtel Ltd. AS for GPRS Service\",\"query\":\"106.195.6.169\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'user', 48, '2024-12-25 05:45:58', '2024-12-25 05:45:58'),
(315, 1, '49.36.49.167', '2024-12-28 11:11:39', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411007\",\"lat\":18.616099999999999425881469505839049816131591796875,\"lon\":73.728600000000000136424205265939235687255859375,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Reliance Jio Infocomm Limited\",\"org\":\"RJIL Maharastra FTTX PUBLIC\",\"as\":\"AS55836 Reliance Jio Infocomm Limited\",\"query\":\"49.36.49.167\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-12-28 05:41:39', '2024-12-28 05:41:39'),
(316, 1, '49.36.48.17', '2024-12-28 11:27:46', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411007\",\"lat\":18.616099999999999425881469505839049816131591796875,\"lon\":73.728600000000000136424205265939235687255859375,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Reliance Jio Infocomm Limited\",\"org\":\"RJIL Maharastra FTTX PUBLIC\",\"as\":\"AS55836 Reliance Jio Infocomm Limited\",\"query\":\"49.36.48.17\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2024-12-28 05:57:46', '2024-12-28 05:57:46'),
(317, 1, '49.36.49.213', '2025-01-22 17:02:18', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411007\",\"lat\":18.616099999999999425881469505839049816131591796875,\"lon\":73.728600000000000136424205265939235687255859375,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Reliance Jio Infocomm Limited\",\"org\":\"RJIL Maharastra FTTX PUBLIC\",\"as\":\"AS55836 Reliance Jio Infocomm Limited\",\"query\":\"49.36.49.213\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2025-01-22 11:32:18', '2025-01-22 11:32:18'),
(318, 2, '223.233.81.199', '2025-02-08 11:03:22', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.81.199\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 2, '2025-02-08 05:33:22', '2025-02-08 05:33:22'),
(319, 48, '223.233.81.199', '2025-02-08 11:03:51', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.81.199\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 48, '2025-02-08 05:33:51', '2025-02-08 05:33:51'),
(320, 48, '223.233.81.199', '2025-02-08 11:09:41', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.81.199\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 48, '2025-02-08 05:39:41', '2025-02-08 05:39:41'),
(321, 51, '223.233.81.199', '2025-02-08 11:09:56', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.81.199\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'client', 48, '2025-02-08 05:39:56', '2025-02-08 05:39:56'),
(322, 48, '223.233.81.199', '2025-02-08 11:10:08', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.81.199\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 48, '2025-02-08 05:40:08', '2025-02-08 05:40:08'),
(323, 1, '223.233.81.199', '2025-02-08 11:11:57', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.81.199\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2025-02-08 05:41:57', '2025-02-08 05:41:57'),
(324, 1, '223.233.81.199', '2025-02-08 11:13:06', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.81.199\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2025-02-08 05:43:06', '2025-02-08 05:43:06'),
(325, 1, '223.233.81.199', '2025-02-08 11:19:05', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.81.199\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2025-02-08 05:49:05', '2025-02-08 05:49:05'),
(326, 1, '223.233.81.199', '2025-02-08 11:19:42', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.81.199\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2025-02-08 05:49:42', '2025-02-08 05:49:42'),
(327, 1, '223.233.81.199', '2025-02-08 11:19:54', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.81.199\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2025-02-08 05:49:54', '2025-02-08 05:49:54'),
(328, 1, '223.233.81.199', '2025-02-08 11:24:13', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.81.199\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2025-02-08 05:54:13', '2025-02-08 05:54:13'),
(329, 51, '223.233.81.199', '2025-02-08 11:47:24', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.81.199\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'client', 48, '2025-02-08 06:17:24', '2025-02-08 06:17:24');
INSERT INTO `login_details` (`id`, `user_id`, `ip`, `date`, `details`, `type`, `created_by`, `created_at`, `updated_at`) VALUES
(330, 64, '223.233.81.199', '2025-02-08 11:50:38', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.81.199\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'user', 48, '2025-02-08 06:20:38', '2025-02-08 06:20:38'),
(331, 51, '223.233.81.199', '2025-02-08 12:09:47', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.81.199\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'client', 48, '2025-02-08 06:39:47', '2025-02-08 06:39:47'),
(332, 1, '223.233.81.199', '2025-02-08 12:35:05', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.81.199\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2025-02-08 07:05:05', '2025-02-08 07:05:05'),
(333, 364, '223.233.81.199', '2025-02-08 12:47:49', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.81.199\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 364, '2025-02-08 07:17:49', '2025-02-08 07:17:49'),
(334, 364, '223.233.81.199', '2025-02-08 12:53:52', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.81.199\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 364, '2025-02-08 07:23:52', '2025-02-08 07:23:52'),
(335, 364, '223.233.81.199', '2025-02-08 12:54:30', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.81.199\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 364, '2025-02-08 07:24:30', '2025-02-08 07:24:30'),
(336, 1, '223.233.81.199', '2025-02-08 13:00:31', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.81.199\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2025-02-08 07:30:31', '2025-02-08 07:30:31'),
(337, 48, '223.233.81.199', '2025-02-08 13:01:00', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.81.199\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 48, '2025-02-08 07:31:00', '2025-02-08 07:31:00'),
(338, 364, '223.233.81.199', '2025-02-08 13:02:38', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.81.199\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 364, '2025-02-08 07:32:38', '2025-02-08 07:32:38'),
(339, 364, '223.233.81.199', '2025-02-08 13:03:53', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.81.199\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 364, '2025-02-08 07:33:53', '2025-02-08 07:33:53'),
(340, 1, '223.233.81.199', '2025-02-08 13:06:43', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.81.199\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2025-02-08 07:36:43', '2025-02-08 07:36:43'),
(341, 48, '223.233.81.199', '2025-02-08 13:06:54', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.81.199\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 48, '2025-02-08 07:36:54', '2025-02-08 07:36:54'),
(342, 364, '223.233.81.199', '2025-02-08 13:45:24', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.81.199\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 364, '2025-02-08 08:15:24', '2025-02-08 08:15:24'),
(343, 51, '223.233.81.199', '2025-02-08 14:04:27', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.81.199\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'client', 48, '2025-02-08 08:34:27', '2025-02-08 08:34:27'),
(344, 51, '223.233.81.199', '2025-02-08 15:09:57', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.81.199\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'client', 48, '2025-02-08 09:39:57', '2025-02-08 09:39:57'),
(345, 48, '223.233.81.199', '2025-02-08 15:24:29', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.81.199\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 48, '2025-02-08 09:54:29', '2025-02-08 09:54:29'),
(346, 365, '223.233.81.199', '2025-02-08 15:42:30', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.81.199\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'user', 48, '2025-02-08 10:12:30', '2025-02-08 10:12:30'),
(347, 51, '223.233.81.199', '2025-02-08 16:30:52', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.81.199\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'client', 48, '2025-02-08 11:00:52', '2025-02-08 11:00:52'),
(348, 1, '223.233.83.38', '2025-02-10 10:43:53', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.83.38\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2025-02-10 05:13:53', '2025-02-10 05:13:53'),
(349, 48, '223.233.83.38', '2025-02-10 10:47:32', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.83.38\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 48, '2025-02-10 05:17:32', '2025-02-10 05:17:32'),
(350, 2, '223.233.83.38', '2025-02-10 11:18:34', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.83.38\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 2, '2025-02-10 05:48:34', '2025-02-10 05:48:34'),
(351, 48, '223.233.83.38', '2025-02-10 11:21:42', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.83.38\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 48, '2025-02-10 05:51:42', '2025-02-10 05:51:42'),
(352, 48, '223.233.83.38', '2025-02-10 12:20:43', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.83.38\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 48, '2025-02-10 06:50:43', '2025-02-10 06:50:43'),
(353, 51, '223.233.83.38', '2025-02-10 12:37:10', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.83.38\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'client', 48, '2025-02-10 07:07:10', '2025-02-10 07:07:10'),
(354, 64, '223.233.83.38', '2025-02-10 12:40:39', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.83.38\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'user', 48, '2025-02-10 07:10:39', '2025-02-10 07:10:39'),
(355, 51, '223.233.83.38', '2025-02-10 12:54:34', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.83.38\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'client', 48, '2025-02-10 07:24:34', '2025-02-10 07:24:34'),
(356, 365, '223.233.83.38', '2025-02-10 13:35:45', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.83.38\",\"browser_name\":\"Firefox\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'user', 48, '2025-02-10 08:05:45', '2025-02-10 08:05:45'),
(357, 51, '223.233.83.38', '2025-02-10 16:48:09', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.83.38\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'client', 48, '2025-02-10 11:18:09', '2025-02-10 11:18:09'),
(358, 1, '223.233.83.50', '2025-02-20 11:39:07', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.83.50\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2025-02-20 06:09:07', '2025-02-20 06:09:07'),
(359, 1, '223.233.83.50', '2025-02-20 13:59:21', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.83.50\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2025-02-20 08:29:21', '2025-02-20 08:29:21'),
(360, 1, '223.233.83.50', '2025-02-20 14:58:04', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.83.50\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2025-02-20 09:28:04', '2025-02-20 09:28:04'),
(361, 1, '223.233.83.50', '2025-02-20 15:02:11', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.83.50\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2025-02-20 09:32:11', '2025-02-20 09:32:11'),
(362, 48, '223.233.83.50', '2025-02-20 15:12:31', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.83.50\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 48, '2025-02-20 09:42:31', '2025-02-20 09:42:31'),
(363, 1, '223.233.83.50', '2025-02-20 15:12:50', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.83.50\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2025-02-20 09:42:50', '2025-02-20 09:42:50'),
(364, 51, '223.233.83.50', '2025-02-20 15:13:26', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.83.50\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'client', 48, '2025-02-20 09:43:26', '2025-02-20 09:43:26'),
(365, 48, '223.233.83.50', '2025-02-20 15:15:04', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.83.50\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 48, '2025-02-20 09:45:04', '2025-02-20 09:45:04'),
(366, 48, '223.233.83.50', '2025-02-20 17:46:42', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.83.50\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 48, '2025-02-20 12:16:42', '2025-02-20 12:16:42'),
(367, 48, '223.233.83.248', '2025-02-21 12:23:14', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.83.248\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 48, '2025-02-21 06:53:14', '2025-02-21 06:53:14'),
(368, 48, '223.233.83.248', '2025-02-21 12:51:29', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.83.248\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 48, '2025-02-21 07:21:29', '2025-02-21 07:21:29'),
(369, 1, '223.233.83.248', '2025-02-21 13:58:55', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.83.248\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2025-02-21 08:28:55', '2025-02-21 08:28:55'),
(370, 48, '223.233.83.248', '2025-02-21 16:27:20', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.83.248\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 48, '2025-02-21 10:57:20', '2025-02-21 10:57:20'),
(371, 1, '223.233.83.248', '2025-02-21 18:45:03', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.83.248\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2025-02-21 13:15:03', '2025-02-21 13:15:03'),
(372, 48, '223.233.83.248', '2025-02-21 18:45:52', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.83.248\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 48, '2025-02-21 13:15:52', '2025-02-21 13:15:52'),
(373, 1, '223.233.83.248', '2025-02-21 18:49:15', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.83.248\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2025-02-21 13:19:15', '2025-02-21 13:19:15'),
(374, 48, '223.233.83.248', '2025-02-21 18:50:14', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.83.248\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 48, '2025-02-21 13:20:14', '2025-02-21 13:20:14'),
(375, 1, '223.233.83.248', '2025-02-21 19:55:27', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.83.248\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2025-02-21 14:25:27', '2025-02-21 14:25:27'),
(376, 1, '223.233.83.248', '2025-02-22 11:01:59', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.83.248\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2025-02-22 05:31:59', '2025-02-22 05:31:59'),
(377, 48, '223.233.83.248', '2025-02-22 12:08:28', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.83.248\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 48, '2025-02-22 06:38:28', '2025-02-22 06:38:28'),
(378, 48, '223.233.83.248', '2025-02-22 12:14:29', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.83.248\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 48, '2025-02-22 06:44:29', '2025-02-22 06:44:29'),
(379, 1, '223.233.83.248', '2025-02-22 18:38:58', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.83.248\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2025-02-22 13:08:58', '2025-02-22 13:08:58'),
(380, 1, '223.233.81.161', '2025-02-25 15:12:35', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.81.161\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2025-02-25 09:42:35', '2025-02-25 09:42:35'),
(381, 1, '43.241.31.106', '2025-03-04 10:45:33', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Solapur\",\"zip\":\"413006\",\"lat\":17.673500000000000653699316899292171001434326171875,\"lon\":75.90510000000000445652403868734836578369140625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Intech Online Private Limited\",\"org\":\"Intech Online Private Limited\",\"as\":\"AS58678 Intech Online Private Limited\",\"query\":\"43.241.31.106\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2025-03-04 05:15:33', '2025-03-04 05:15:33'),
(382, 1, '43.241.31.106', '2025-03-04 13:04:38', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Solapur\",\"zip\":\"413006\",\"lat\":17.673500000000000653699316899292171001434326171875,\"lon\":75.90510000000000445652403868734836578369140625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Intech Online Private Limited\",\"org\":\"Intech Online Private Limited\",\"as\":\"AS58678 Intech Online Private Limited\",\"query\":\"43.241.31.106\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2025-03-04 07:34:38', '2025-03-04 07:34:38'),
(383, 1, '43.241.31.106', '2025-03-04 13:16:00', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Solapur\",\"zip\":\"413006\",\"lat\":17.673500000000000653699316899292171001434326171875,\"lon\":75.90510000000000445652403868734836578369140625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Intech Online Private Limited\",\"org\":\"Intech Online Private Limited\",\"as\":\"AS58678 Intech Online Private Limited\",\"query\":\"43.241.31.106\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2025-03-04 07:46:00', '2025-03-04 07:46:00'),
(384, 1, '103.200.214.207', '2025-03-05 11:07:15', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411005\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Saviyaa Impex\",\"org\":\"\",\"as\":\"AS55352 Microscan Internet Limited\",\"query\":\"103.200.214.207\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2025-03-05 05:37:15', '2025-03-05 05:37:15'),
(385, 1, '223.233.83.71', '2025-03-05 13:37:21', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.83.71\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2025-03-05 08:07:21', '2025-03-05 08:07:21'),
(386, 48, '223.233.83.71', '2025-03-05 15:27:14', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.83.71\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 48, '2025-03-05 09:57:14', '2025-03-05 09:57:14'),
(387, 1, '103.200.214.207', '2025-03-05 17:21:03', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411019\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Saviyaa Impex\",\"org\":\"\",\"as\":\"AS55352 Microscan Internet Limited\",\"query\":\"103.200.214.207\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2025-03-05 11:51:03', '2025-03-05 11:51:03'),
(388, 1, '103.200.214.207', '2025-03-06 12:55:39', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411019\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Saviyaa Impex\",\"org\":\"\",\"as\":\"AS55352 Microscan Internet Limited\",\"query\":\"103.200.214.207\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2025-03-06 07:25:39', '2025-03-06 07:25:39'),
(389, 1, '103.200.214.207', '2025-03-06 13:10:46', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411019\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Saviyaa Impex\",\"org\":\"\",\"as\":\"AS55352 Microscan Internet Limited\",\"query\":\"103.200.214.207\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2025-03-06 07:40:46', '2025-03-06 07:40:46'),
(390, 1, '103.200.214.207', '2025-03-06 15:52:21', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411019\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Saviyaa Impex\",\"org\":\"\",\"as\":\"AS55352 Microscan Internet Limited\",\"query\":\"103.200.214.207\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2025-03-06 10:22:21', '2025-03-06 10:22:21'),
(391, 1, '43.241.31.106', '2025-03-07 11:57:41', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Solapur\",\"zip\":\"413006\",\"lat\":17.673500000000000653699316899292171001434326171875,\"lon\":75.90510000000000445652403868734836578369140625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Intech Online Private Limited\",\"org\":\"Intech Online Private Limited\",\"as\":\"AS58678 Intech Online Private Limited\",\"query\":\"43.241.31.106\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2025-03-07 06:27:41', '2025-03-07 06:27:41'),
(392, 1, '43.241.31.106', '2025-03-07 12:01:11', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Solapur\",\"zip\":\"413006\",\"lat\":17.673500000000000653699316899292171001434326171875,\"lon\":75.90510000000000445652403868734836578369140625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Intech Online Private Limited\",\"org\":\"Intech Online Private Limited\",\"as\":\"AS58678 Intech Online Private Limited\",\"query\":\"43.241.31.106\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2025-03-07 06:31:11', '2025-03-07 06:31:11'),
(393, 1, '43.241.31.106', '2025-03-07 15:03:32', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Solapur\",\"zip\":\"413006\",\"lat\":17.673500000000000653699316899292171001434326171875,\"lon\":75.90510000000000445652403868734836578369140625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Intech Online Private Limited\",\"org\":\"Intech Online Private Limited\",\"as\":\"AS58678 Intech Online Private Limited\",\"query\":\"43.241.31.106\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2025-03-07 09:33:32', '2025-03-07 09:33:32'),
(394, 1, '43.241.31.106', '2025-03-08 12:26:29', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Solapur\",\"zip\":\"413006\",\"lat\":17.673500000000000653699316899292171001434326171875,\"lon\":75.90510000000000445652403868734836578369140625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Intech Online Private Limited\",\"org\":\"Intech Online Private Limited\",\"as\":\"AS58678 Intech Online Private Limited\",\"query\":\"43.241.31.106\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2025-03-08 06:56:29', '2025-03-08 06:56:29'),
(395, 1, '43.241.31.106', '2025-03-08 17:09:35', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Solapur\",\"zip\":\"413006\",\"lat\":17.673500000000000653699316899292171001434326171875,\"lon\":75.90510000000000445652403868734836578369140625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Intech Online Private Limited\",\"org\":\"Intech Online Private Limited\",\"as\":\"AS58678 Intech Online Private Limited\",\"query\":\"43.241.31.106\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2025-03-08 11:39:35', '2025-03-08 11:39:35'),
(396, 1, '223.233.80.17', '2025-04-07 17:41:44', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.80.17\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2025-04-07 12:11:44', '2025-04-07 12:11:44'),
(397, 1, '223.233.84.45', '2025-04-10 18:59:56', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411007\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.84.45\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2025-04-10 13:29:56', '2025-04-10 13:29:56'),
(398, 1, '223.233.84.45', '2025-04-10 19:20:31', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411007\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.84.45\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2025-04-10 13:50:31', '2025-04-10 13:50:31');
INSERT INTO `login_details` (`id`, `user_id`, `ip`, `date`, `details`, `type`, `created_by`, `created_at`, `updated_at`) VALUES
(399, 1, '183.87.230.23', '2025-04-18 12:07:26', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411009\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"FiveNetwork Solutions India Pvt Ltd\",\"org\":\"FiveNetwork Solutions India Pvt Ltd\",\"as\":\"AS24554 Microscan Internet Limited\",\"query\":\"183.87.230.23\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2025-04-18 06:37:26', '2025-04-18 06:37:26'),
(400, 400, '223.185.38.252', '2025-04-19 09:18:00', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Nagpur\",\"zip\":\"440013\",\"lat\":21.146300000000000096633812063373625278472900390625,\"lon\":79.08490000000000463842297904193401336669921875,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Limited\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.185.38.252\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 400, '2025-04-19 03:48:00', '2025-04-19 03:48:00'),
(401, 400, '223.228.39.246', '2025-04-22 11:21:16', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411016\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Limited\",\"as\":\"AS45609 Bharti Airtel Ltd. AS for GPRS Service\",\"query\":\"223.228.39.246\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 400, '2025-04-22 05:51:16', '2025-04-22 05:51:16'),
(402, 400, '223.185.39.18', '2025-04-24 09:32:19', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Nagpur\",\"zip\":\"440013\",\"lat\":21.146300000000000096633812063373625278472900390625,\"lon\":79.08490000000000463842297904193401336669921875,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel\",\"org\":\"Bharti Airtel Limited\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.185.39.18\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'owner', 400, '2025-04-24 04:02:19', '2025-04-24 04:02:19'),
(403, 1, '223.233.83.54', '2025-05-06 13:31:23', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411005\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Bharti Airtel Limited\",\"org\":\"Bharti Airtel Ltd.\",\"as\":\"AS24560 Bharti Airtel Ltd., Telemedia Services\",\"query\":\"223.233.83.54\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2025-05-06 08:01:23', '2025-05-06 08:01:23'),
(404, 1, '103.200.104.76', '2025-05-07 23:00:46', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411019\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Skandha Media Services Pvt Ltd\",\"org\":\"Skandha Media Services Pvt Ltd\",\"as\":\"AS55352 Microscan Internet Limited\",\"query\":\"103.200.104.76\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2025-05-07 17:30:46', '2025-05-07 17:30:46'),
(405, 1, '103.200.104.76', '2025-05-07 23:02:46', '{\"status\":\"success\",\"country\":\"India\",\"countryCode\":\"IN\",\"region\":\"MH\",\"regionName\":\"Maharashtra\",\"city\":\"Pune\",\"zip\":\"411019\",\"lat\":18.521100000000000562749846721999347209930419921875,\"lon\":73.850200000000000954969436861574649810791015625,\"timezone\":\"Asia\\/Kolkata\",\"isp\":\"Skandha Media Services Pvt Ltd\",\"org\":\"Skandha Media Services Pvt Ltd\",\"as\":\"AS55352 Microscan Internet Limited\",\"query\":\"103.200.104.76\",\"browser_name\":\"Chrome\",\"os_name\":\"Windows\",\"browser_language\":\"en\",\"device_type\":\"Desktop\",\"referrer_host\":true,\"referrer_path\":true}', 'admin', 1, '2025-05-07 17:32:46', '2025-05-07 17:32:46');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_09_22_192348_create_messages_table', 1),
(5, '2019_09_28_102009_create_settings_table', 1),
(6, '2019_10_16_211433_create_favorites_table', 1),
(7, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(8, '2020_06_02_052830_create_projects_table', 1),
(9, '2020_06_02_084227_create_project_users_table', 1),
(10, '2020_06_02_085538_create_task_stages_table', 1),
(11, '2020_06_04_063624_create_activity_logs_table', 1),
(12, '2020_06_04_110112_create_milestones_table', 1),
(13, '2020_06_09_083311_create_project_tasks_table', 1),
(14, '2020_06_12_043417_create_task_comments_table', 1),
(15, '2020_06_12_043437_create_task_checklists_table', 1),
(16, '2020_06_12_043456_create_task_files_table', 1),
(17, '2020_06_24_121604_create_expenses_table', 1),
(18, '2020_06_25_044010_create_timesheets_table', 1),
(19, '2020_06_30_043627_create_user_to_dos_table', 1),
(20, '2020_07_04_041153_create_email_templates_table', 1),
(21, '2020_07_04_041215_create_email_template_langs_table', 1),
(22, '2020_07_04_041452_create_project_email_templates_table', 1),
(23, '2020_07_06_110501_create_user_contacts_table', 1),
(24, '2020_07_15_060529_create_plans_table', 1),
(25, '2020_07_15_061846_create_orders_table', 1),
(26, '2020_07_15_062306_create_coupons_table', 1),
(27, '2020_07_15_062758_create_user_coupons_table', 1),
(28, '2020_08_06_112021_create_invoices_table', 1),
(29, '2020_08_07_071511_create_taxes_table', 1),
(30, '2020_08_08_065410_create_invoice_products_table', 1),
(31, '2020_08_08_065505_create_invoice_payments_table', 1),
(32, '2020_08_26_093539_create_time_trackers_table', 1),
(33, '2021_06_17_055913_create_project_task_timers', 1),
(34, '2021_07_05_143922_create_payment_settings', 1),
(35, '2021_09_03_112043_create_track_photos_table', 1),
(36, '2021_09_10_165514_create_plan_requests_table', 1),
(37, '2021_12_29_061011_create_zoom_meetings_table', 1),
(38, '2022_07_25_125056_create_contract_types_table', 1),
(39, '2022_07_26_051653_create_contracts_table', 1),
(40, '2022_07_27_045204_create_contract_comments_table', 1),
(41, '2022_07_27_045208_create_contract_notes_table', 1),
(42, '2022_07_27_110959_create_contract_attechments_table', 1),
(43, '2023_04_24_041813_create_login_details_table', 1),
(44, '2023_04_25_065342_create_webhooks_table', 1),
(45, '2023_05_02_105840_create_notification_template_langs_table', 1),
(46, '2023_05_03_052447_create_notification_templates_table', 1),
(47, '2023_05_30_090631_create_banktransfers_table', 1),
(48, '2023_06_08_085829_create_templates_table', 1),
(49, '2023_06_27_122501_create_languages_table', 1),
(50, '2023_12_13_041944_add_is_disable_to_users', 1),
(51, '2024_02_08_110643_add_is_refund_to_orders_table', 1),
(52, '2024_02_08_113843_update_price_in_plans_table', 1),
(53, '2024_04_08_063341_create_referral_settings_table', 2),
(54, '2024_04_08_071822_create_referral_transactions_table', 2),
(55, '2024_04_08_072104_create_transaction_orders_table', 2),
(56, '2024_04_08_072553_add_referral_code_to_users', 2),
(57, '2024_04_08_072905_add_expires_at_to_personal_access_tokens', 2);

-- --------------------------------------------------------

--
-- Table structure for table `milestones`
--

CREATE TABLE `milestones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `progress` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `milestones`
--

INSERT INTO `milestones` (`id`, `project_id`, `title`, `status`, `progress`, `description`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(1, 5, 'Milestone', 'in_progress', NULL, 'gdf erg aswr ftawef w', NULL, NULL, '2024-06-03 10:22:34', '2024-06-03 10:22:34'),
(2, 5, 'Milestone', 'in_progress', NULL, 'gdf erg aswr ftawef w', NULL, NULL, '2024-06-03 10:22:34', '2024-06-03 10:22:34'),
(17, 27, 'M2', 'in_progress', NULL, 'ABCD', NULL, NULL, '2024-07-19 05:27:26', '2024-07-19 05:27:26'),
(18, 27, 'M1', 'on_hold', NULL, '123456', NULL, NULL, '2024-07-19 06:55:49', '2024-07-19 06:55:49'),
(19, 27, '12345678978758555585612344556780987654398765432123467809876543123898545238556565655656232', 'in_progress', NULL, '12346679456789789456123212333333', NULL, NULL, '2024-07-19 06:57:32', '2024-07-19 06:57:32'),
(20, 33, 'Level 1', 'on_hold', NULL, 'For Hold', NULL, NULL, '2024-07-25 07:54:41', '2024-07-25 07:54:41'),
(21, 33, 'Level 2', 'in_progress', NULL, 'For in progress', NULL, NULL, '2024-07-25 08:01:00', '2024-07-25 08:01:00'),
(22, 33, 'Level 3', 'complete', NULL, 'For Complete', NULL, NULL, '2024-07-25 08:01:24', '2024-07-25 08:01:24'),
(23, 33, 'Level 4', 'canceled', NULL, 'For Canceled', NULL, NULL, '2024-07-25 08:01:55', '2024-07-25 08:01:55'),
(25, 32, 'M1', 'on_hold', '33', 'vdsv', '2024-07-25', '2024-07-26', '2024-07-26 07:24:57', '2024-07-26 11:18:08'),
(26, 32, 'M2', 'complete', NULL, 'ewfdfdwf', NULL, NULL, '2024-07-26 10:23:17', '2024-07-26 10:23:17'),
(36, 104, 'Milestone 1', 'on_hold', NULL, 'Milestone 1', NULL, NULL, '2024-11-25 13:16:30', '2024-11-25 13:16:30'),
(37, 84, 'New Milestone', 'on_hold', '18', 'Theis is New Milestone.', '2024-12-03', '2024-12-06', '2024-12-03 09:34:14', '2024-12-03 09:34:30'),
(38, 110, 'Home page design', 'complete', '100', 'this is milestone one', '2025-02-08', '2025-02-10', '2025-02-08 10:26:03', '2025-02-12 10:44:22'),
(39, 110, 'Contact page', 'in_progress', '40', 'Contact page design complete', '2025-02-07', '2025-02-07', '2025-02-12 10:42:54', '2025-02-12 10:47:01'),
(40, 122, 'abc', 'on_hold', NULL, 'abcd', NULL, NULL, '2025-04-24 04:26:06', '2025-04-24 04:26:06');

-- --------------------------------------------------------

--
-- Table structure for table `notification_templates`
--

CREATE TABLE `notification_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_templates`
--

INSERT INTO `notification_templates` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'New Project', 'new_project', '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(2, 'New Task', 'new_task', '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(3, 'New Invoice', 'new_invoice', '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(4, 'Task Stage Updated', 'task_stage_updated', '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(5, 'New Milestone', 'new_milestone', '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(6, 'Milestone Status Updated', 'milestone_status_updated', '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(7, 'Invoice Status Updated', 'invoice_status_updated', '2024-02-26 12:05:55', '2024-02-26 12:05:55');

-- --------------------------------------------------------

--
-- Table structure for table `notification_template_langs`
--

CREATE TABLE `notification_template_langs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL,
  `lang` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `variables` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_template_langs`
--

INSERT INTO `notification_template_langs` (`id`, `parent_id`, `lang`, `content`, `variables`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'ar', 'تم تكوين المشروع {project_name} بواسطة {app_name}. اجمالي الساعات هي {project_ساعات}.', '{\n                    \"Project Title\": \"project_name\",\n                    \"Project Budget\": \"project_budget\",\n                    \"Project Hours\": \"project_hours\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\",\n                    \"App Name\": \"app_name\",\n                    \"App Url\": \"app_url\"\n                    }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(2, 1, 'da', 'Projektet {project_name} er oprettet af {app_name}. Det samlede antal timer er {project_hours}.', '{\n                    \"Project Title\": \"project_name\",\n                    \"Project Budget\": \"project_budget\",\n                    \"Project Hours\": \"project_hours\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\",\n                    \"App Name\": \"app_name\",\n                    \"App Url\": \"app_url\"\n                    }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(3, 1, 'de', 'Das Projekt {project_name} wird von {app_name} erstellt. Die Gesamtstunden sind {project_hours}.', '{\n                    \"Project Title\": \"project_name\",\n                    \"Project Budget\": \"project_budget\",\n                    \"Project Hours\": \"project_hours\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\",\n                    \"App Name\": \"app_name\",\n                    \"App Url\": \"app_url\"\n                    }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(4, 1, 'en', 'The {project_name} project is created by {app_name}. The total hours are {project_hours}.', '{\n                    \"Project Title\": \"project_name\",\n                    \"Project Budget\": \"project_budget\",\n                    \"Project Hours\": \"project_hours\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\",\n                    \"App Name\": \"app_name\",\n                    \"App Url\": \"app_url\"\n                    }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(5, 1, 'es', 'El proyecto {project_name} está creado por {app_name}. Las horas totales son {project_hours}.', '{\n                    \"Project Title\": \"project_name\",\n                    \"Project Budget\": \"project_budget\",\n                    \"Project Hours\": \"project_hours\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\",\n                    \"App Name\": \"app_name\",\n                    \"App Url\": \"app_url\"\n                    }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(6, 1, 'fr', 'Le projet {project_name} est créé par {app_name}. Le nombre total d\'heures est de {project_hours}.', '{\n                    \"Project Title\": \"project_name\",\n                    \"Project Budget\": \"project_budget\",\n                    \"Project Hours\": \"project_hours\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\",\n                    \"App Name\": \"app_name\",\n                    \"App Url\": \"app_url\"\n                    }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(7, 1, 'it', 'Il progetto {project_name} è creato da {app_name}. Le ore totali sono {project_hours}.', '{\n                    \"Project Title\": \"project_name\",\n                    \"Project Budget\": \"project_budget\",\n                    \"Project Hours\": \"project_hours\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\",\n                    \"App Name\": \"app_name\",\n                    \"App Url\": \"app_url\"\n                    }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(8, 1, 'ja', '{project_name} プロジェクトは {app_name}によって作成されます。 合計時間は {project_hours}です。', '{\n                    \"Project Title\": \"project_name\",\n                    \"Project Budget\": \"project_budget\",\n                    \"Project Hours\": \"project_hours\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\",\n                    \"App Name\": \"app_name\",\n                    \"App Url\": \"app_url\"\n                    }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(9, 1, 'nl', 'Het project {project_name} is gemaakt door {app_name}. De totale uren zijn {project_hours}.', '{\n                    \"Project Title\": \"project_name\",\n                    \"Project Budget\": \"project_budget\",\n                    \"Project Hours\": \"project_hours\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\",\n                    \"App Name\": \"app_name\",\n                    \"App Url\": \"app_url\"\n                    }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(10, 1, 'pl', 'Projekt {project_name } jest tworzony przez użytkownika {app_name}. Łączna liczba godzin to {project_hours}.', '{\n                    \"Project Title\": \"project_name\",\n                    \"Project Budget\": \"project_budget\",\n                    \"Project Hours\": \"project_hours\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\",\n                    \"App Name\": \"app_name\",\n                    \"App Url\": \"app_url\"\n                    }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(11, 1, 'ru', 'Проект {project_name} создан {app_name}. Общее число часов: {project_hours}.', '{\n                    \"Project Title\": \"project_name\",\n                    \"Project Budget\": \"project_budget\",\n                    \"Project Hours\": \"project_hours\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\",\n                    \"App Name\": \"app_name\",\n                    \"App Url\": \"app_url\"\n                    }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(12, 1, 'pt', 'O projeto {project_name} é criado por {app_name}. O total de horas são {project_hours}.', '{\n                    \"Project Title\": \"project_name\",\n                    \"Project Budget\": \"project_budget\",\n                    \"Project Hours\": \"project_hours\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\",\n                    \"App Name\": \"app_name\",\n                    \"App Url\": \"app_url\"\n                    }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(13, 1, 'tr', '{ proj_name } tarafından { project_name } projesi yaratıldı. Toplam saat: { project_hours }.', '{\n                    \"Project Title\": \"project_name\",\n                    \"Project Budget\": \"project_budget\",\n                    \"Project Hours\": \"project_hours\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\",\n                    \"App Name\": \"app_name\",\n                    \"App Url\": \"app_url\"\n                    }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(14, 1, 'zh', '{project_name} 项目由 {app_name} 创建。 总小时数为 {project_小时数}。', '{\n                    \"Project Title\": \"project_name\",\n                    \"Project Budget\": \"project_budget\",\n                    \"Project Hours\": \"project_hours\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\",\n                    \"App Name\": \"app_name\",\n                    \"App Url\": \"app_url\"\n                    }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(15, 1, 'he', 'הפרויקט {project_name} נוצר על-ידי {app_name}. השעות הכולל הן {project_השעות}.', '{\n                    \"Project Title\": \"project_name\",\n                    \"Project Budget\": \"project_budget\",\n                    \"Project Hours\": \"project_hours\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\",\n                    \"App Name\": \"app_name\",\n                    \"App Url\": \"app_url\"\n                    }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(16, 1, 'pt-br', 'O projeto {project_name} é criado por {app_name}. O total de horas são {project_hours}.', '{\n                    \"Project Title\": \"project_name\",\n                    \"Project Budget\": \"project_budget\",\n                    \"Project Hours\": \"project_hours\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\",\n                    \"App Name\": \"app_name\",\n                    \"App Url\": \"app_url\"\n                    }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(17, 2, 'ar', 'تم تكوين المهمة {task_name} بواسطة {owner_name} من {project_name} المشروع.', '{\n                        \"Task Name\" : \"task_name\",\n                        \"Task Priority\" : \"task_priority\",\n                        \"Task Project\" : \"task_project\",\n                        \"Task Stage\" : \"task_stage\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"Project Title\": \"project_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(18, 2, 'da', 'Opgave {task_name} er oprettet af {owner_name} af {project_name}-projektet.', '{\n                        \"Task Name\" : \"task_name\",\n                        \"Task Priority\" : \"task_priority\",\n                        \"Task Project\" : \"task_project\",\n                        \"Task Stage\" : \"task_stage\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"Project Title\": \"project_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(19, 2, 'de', 'Die Task {task_name} wird von {owner_name} des Projekts {project_name} erstellt.', '{\n                        \"Task Name\" : \"task_name\",\n                        \"Task Priority\" : \"task_priority\",\n                        \"Task Project\" : \"task_project\",\n                        \"Task Stage\" : \"task_stage\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"Project Title\": \"project_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(20, 2, 'en', 'The {task_name} Task is Created By {owner_name} of {project_name} Project', '{\n                        \"Task Name\" : \"task_name\",\n                        \"Task Priority\" : \"task_priority\",\n                        \"Task Project\" : \"task_project\",\n                        \"Task Stage\" : \"task_stage\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"Project Title\": \"project_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(21, 2, 'es', 'La tarea {task_name} se ha creado por {owner_name} de {project_name} Project.', '{\n                        \"Task Name\" : \"task_name\",\n                        \"Task Priority\" : \"task_priority\",\n                        \"Task Project\" : \"task_project\",\n                        \"Task Stage\" : \"task_stage\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"Project Title\": \"project_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(22, 2, 'fr', 'La tâche {task_name} est créée par {nom_utilisateur} du projet {nom_projet}.', '{\n                        \"Task Name\" : \"task_name\",\n                        \"Task Priority\" : \"task_priority\",\n                        \"Task Project\" : \"task_project\",\n                        \"Task Stage\" : \"task_stage\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"Project Title\": \"project_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(23, 2, 'it', 'Il {task_name} Task è Creato By {owner_name} di {project_name} Project.', '{\n                        \"Task Name\" : \"task_name\",\n                        \"Task Priority\" : \"task_priority\",\n                        \"Task Project\" : \"task_project\",\n                        \"Task Stage\" : \"task_stage\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"Project Title\": \"project_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(24, 2, 'ja', '{task_name } タスクは、 {project_name} プロジェクトの {owner_name} によって作成されます。', '{\n                        \"Task Name\" : \"task_name\",\n                        \"Task Priority\" : \"task_priority\",\n                        \"Task Project\" : \"task_project\",\n                        \"Task Stage\" : \"task_stage\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"Project Title\": \"project_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(25, 2, 'nl', 'De taak {taaknaam} is gemaakt door {owner_name} van {project_name} Project.', '{\n                        \"Task Name\" : \"task_name\",\n                        \"Task Priority\" : \"task_priority\",\n                        \"Task Project\" : \"task_project\",\n                        \"Task Stage\" : \"task_stage\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"Project Title\": \"project_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(26, 2, 'pl', 'Zadanie {task_name} zostało utworzone przez użytkownika {owner_name } z projektu {project_name }.', '{\n                        \"Task Name\" : \"task_name\",\n                        \"Task Priority\" : \"task_priority\",\n                        \"Task Project\" : \"task_project\",\n                        \"Task Stage\" : \"task_stage\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"Project Title\": \"project_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(27, 2, 'ru', 'Задача {task_name} Создана {owner_name} проекта {project_name}.', '{\n                        \"Task Name\" : \"task_name\",\n                        \"Task Priority\" : \"task_priority\",\n                        \"Task Project\" : \"task_project\",\n                        \"Task Stage\" : \"task_stage\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"Project Title\": \"project_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(28, 2, 'pt', 'A Tarefa {task_name} é Criada por {owner_name} de {project_name} Project.', '{\n                        \"Task Name\" : \"task_name\",\n                        \"Task Priority\" : \"task_priority\",\n                        \"Task Project\" : \"task_project\",\n                        \"Task Stage\" : \"task_stage\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"Project Title\": \"project_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(29, 2, 'tr', '{ task_name } Görevi, { project_name } Project { owner_name } Tarafından Oluşturuldu.', '{\n                        \"Task Name\" : \"task_name\",\n                        \"Task Priority\" : \"task_priority\",\n                        \"Task Project\" : \"task_project\",\n                        \"Task Stage\" : \"task_stage\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"Project Title\": \"project_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(30, 2, 'zh', '{task_name} 任务由 {project_name} 项目创建', '{\n                        \"Task Name\" : \"task_name\",\n                        \"Task Priority\" : \"task_priority\",\n                        \"Task Project\" : \"task_project\",\n                        \"Task Stage\" : \"task_stage\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"Project Title\": \"project_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(31, 2, 'he', 'הפרויקט {project_name} נוצר על-ידי {app_name}. השעות הכולל הן {project_השעות}.', '{\n                        \"Task Name\" : \"task_name\",\n                        \"Task Priority\" : \"task_priority\",\n                        \"Task Project\" : \"task_project\",\n                        \"Task Stage\" : \"task_stage\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"Project Title\": \"project_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(32, 2, 'pt-br', 'A Tarefa {task_name} é Criada por {owner_name} de {project_name} Project.', '{\n                        \"Task Name\" : \"task_name\",\n                        \"Task Priority\" : \"task_priority\",\n                        \"Task Project\" : \"task_project\",\n                        \"Task Stage\" : \"task_stage\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"Project Title\": \"project_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(33, 3, 'ar', 'تم تكوين الفاتورة الجديدة {invoice_id} بواسطة {owner_name}', '{\n                        \"Invoice Name\": \"invoice_id\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(34, 3, 'da', 'Ny faktura {invoice_id} oprettet af {owner_name}', '{\n                        \"Invoice Name\": \"invoice_id\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(35, 3, 'de', 'Neue Rechnung {invoice_id} erstellt von {owner_name}', '{\n                        \"Invoice Name\": \"invoice_id\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(36, 3, 'en', 'New Invoice {invoice_id} created by {owner_name} ', '{\n                        \"Invoice Name\": \"invoice_id\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(37, 3, 'es', 'Nueva factura {invoice_id} creada por {owner_name}', '{\n                        \"Invoice Name\": \"invoice_id\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(38, 3, 'fr', 'Nouvelle facture {invoice_id} créée par { nom_utilisateur }', '{\n                        \"Invoice Name\": \"invoice_id\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(39, 3, 'it', 'Nuova Fattura {invoice_id} creata da {owner_name}', '{\n                        \"Invoice Name\": \"invoice_id\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(40, 3, 'ja', '{owner_name} によって作成された新規請求書 {請求 name}', '{\n                        \"Invoice Name\": \"invoice_id\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(41, 3, 'nl', 'Nieuwe factuur {invoice_id} gemaakt door {owner_name}', '{\n                        \"Invoice Name\": \"invoice_id\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(42, 3, 'pl', 'Nowa faktura {invoice_id } utworzona przez użytkownika {owner_name }', '{\n                        \"Invoice Name\": \"invoice_id\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(43, 3, 'ru', 'Новый инвойс {invoice_id} создан пользователем {owner_name}', '{\n                        \"Invoice Name\": \"invoice_id\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(44, 3, 'pt', 'Nova Fatura {invoice_id} criada por {owner_name}', '{\n                        \"Invoice Name\": \"invoice_id\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(45, 3, 'tr', '{ owner_name } tarafından oluşturulan yeni Fatura { invoice_id }', '{\n                        \"Invoice Name\": \"invoice_id\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(46, 3, 'zh', '{owner_name} 创建的新发票 {invoice_id} ', '{\n                        \"Invoice Name\": \"invoice_id\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(47, 3, 'he', 'חשבונית חדשה {invoice_id} נוצרה על-ידי {owner_name}', '{\n                        \"Invoice Name\": \"invoice_id\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(48, 3, 'pt-br', 'Nova Fatura {invoice_id} criada por {owner_name}', '{\n                        \"Invoice Name\": \"invoice_id\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(49, 4, 'ar', 'تم تعديل مرحلة المهمة من {task_name} من {old_مرحلة} الى المشروع { new_dattle }', '{\n                            \"Task Name\" : \"task_name\",\n                            \"New Stage\" : \"new_stage\",\n                            \"Old Stage\" : \"old_stage\",\n                            \"Task Priority\" : \"task_priority\",\n                            \"Task Project\" : \"task_project\",\n                            \"App Name\": \"app_name\",\n                            \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(50, 4, 'da', 'Opgavetrin for {task_name} opdateret fra {old_stage} til {ny_stage} projekt', '{\n                            \"Task Name\" : \"task_name\",\n                            \"New Stage\" : \"new_stage\",\n                            \"Old Stage\" : \"old_stage\",\n                            \"Task Priority\" : \"task_priority\",\n                            \"Task Project\" : \"task_project\",\n                            \"App Name\": \"app_name\",\n                            \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(51, 4, 'de', 'Taskstufe von {task_name} von {old_stage} auf {new_stage} Projekt aktualisiert', '{\n                            \"Task Name\" : \"task_name\",\n                            \"New Stage\" : \"new_stage\",\n                            \"Old Stage\" : \"old_stage\",\n                            \"Task Priority\" : \"task_priority\",\n                            \"Task Project\" : \"task_project\",\n                            \"App Name\": \"app_name\",\n                            \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(52, 4, 'en', 'Task stage of {task_name} updated from {old_stage} to {new_stage} Project', '{\n                            \"Task Name\" : \"task_name\",\n                            \"New Stage\" : \"new_stage\",\n                            \"Old Stage\" : \"old_stage\",\n                            \"Task Priority\" : \"task_priority\",\n                            \"Task Project\" : \"task_project\",\n                            \"App Name\": \"app_name\",\n                            \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(53, 4, 'es', 'Etapa de tarea de {task_name} actualizada de {old_stage} al proyecto {new_stage}', '{\n                            \"Task Name\" : \"task_name\",\n                            \"New Stage\" : \"new_stage\",\n                            \"Old Stage\" : \"old_stage\",\n                            \"Task Priority\" : \"task_priority\",\n                            \"Task Project\" : \"task_project\",\n                            \"App Name\": \"app_name\",\n                            \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(54, 4, 'fr', 'Etape de la tâche {task_name} mise à jour de { old_étape } au projet {new_stage}', '{\n                            \"Task Name\" : \"task_name\",\n                            \"New Stage\" : \"new_stage\",\n                            \"Old Stage\" : \"old_stage\",\n                            \"Task Priority\" : \"task_priority\",\n                            \"Task Project\" : \"task_project\",\n                            \"App Name\": \"app_name\",\n                            \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(55, 4, 'it', 'Stage di attività di {task_name} aggiornato da {old_stage} al {new_stage} Project', '{\n                            \"Task Name\" : \"task_name\",\n                            \"New Stage\" : \"new_stage\",\n                            \"Old Stage\" : \"old_stage\",\n                            \"Task Priority\" : \"task_priority\",\n                            \"Task Project\" : \"task_project\",\n                            \"App Name\": \"app_name\",\n                            \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(56, 4, 'ja', '{task_name} のタスク・ステージが {old_stage} から {new_stage} プロジェクトに更新されました', '{\n                            \"Task Name\" : \"task_name\",\n                            \"New Stage\" : \"new_stage\",\n                            \"Old Stage\" : \"old_stage\",\n                            \"Task Priority\" : \"task_priority\",\n                            \"Task Project\" : \"task_project\",\n                            \"App Name\": \"app_name\",\n                            \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(57, 4, 'nl', 'Taakstadium van {task_name} bijgewerkt van {old_stage} naar { new_stage } Project', '{\n                            \"Task Name\" : \"task_name\",\n                            \"New Stage\" : \"new_stage\",\n                            \"Old Stage\" : \"old_stage\",\n                            \"Task Priority\" : \"task_priority\",\n                            \"Task Project\" : \"task_project\",\n                            \"App Name\": \"app_name\",\n                            \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(58, 4, 'pl', 'Etap zadania {task_name } został zaktualizowany z {old_stage } do projektu {new_stage}', '{\n                            \"Task Name\" : \"task_name\",\n                            \"New Stage\" : \"new_stage\",\n                            \"Old Stage\" : \"old_stage\",\n                            \"Task Priority\" : \"task_priority\",\n                            \"Task Project\" : \"task_project\",\n                            \"App Name\": \"app_name\",\n                            \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(59, 4, 'ru', 'Этап задачи {task_name} обновлен с {old_stage} на {new_stage} Project', '{\n                            \"Task Name\" : \"task_name\",\n                            \"New Stage\" : \"new_stage\",\n                            \"Old Stage\" : \"old_stage\",\n                            \"Task Priority\" : \"task_priority\",\n                            \"Task Project\" : \"task_project\",\n                            \"App Name\": \"app_name\",\n                            \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(60, 4, 'pt', 'Estágio de tarefa de {task_name} atualizado de {old_stage} para {new_stage} Project ', '{\n                            \"Task Name\" : \"task_name\",\n                            \"New Stage\" : \"new_stage\",\n                            \"Old Stage\" : \"old_stage\",\n                            \"Task Priority\" : \"task_priority\",\n                            \"Task Project\" : \"task_project\",\n                            \"App Name\": \"app_name\",\n                            \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(61, 4, 'tr', '{ task_name } görev aşaması { old_stage } tarafından { new_stage } Projesine güncellendi', '{\n                            \"Task Name\" : \"task_name\",\n                            \"New Stage\" : \"new_stage\",\n                            \"Old Stage\" : \"old_stage\",\n                            \"Task Priority\" : \"task_priority\",\n                            \"Task Project\" : \"task_project\",\n                            \"App Name\": \"app_name\",\n                            \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(62, 4, 'zh', '{task_name} 的任务阶段已从 {old_stage} 更新为 {new_stage} 项目', '{\n                            \"Task Name\" : \"task_name\",\n                            \"New Stage\" : \"new_stage\",\n                            \"Old Stage\" : \"old_stage\",\n                            \"Task Priority\" : \"task_priority\",\n                            \"Task Project\" : \"task_project\",\n                            \"App Name\": \"app_name\",\n                            \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(63, 4, 'he', 'שלב המשימה של {task_name} עודכן מ - {old_מהבמה} ל - {new_stage} פרויקט', '{\n                            \"Task Name\" : \"task_name\",\n                            \"New Stage\" : \"new_stage\",\n                            \"Old Stage\" : \"old_stage\",\n                            \"Task Priority\" : \"task_priority\",\n                            \"Task Project\" : \"task_project\",\n                            \"App Name\": \"app_name\",\n                            \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(64, 4, 'pt-br', 'Estágio de tarefa de {task_name} atualizado de {old_stage} para {new_stage} Project ', '{\n                            \"Task Name\" : \"task_name\",\n                            \"New Stage\" : \"new_stage\",\n                            \"Old Stage\" : \"old_stage\",\n                            \"Task Priority\" : \"task_priority\",\n                            \"Task Project\" : \"task_project\",\n                            \"App Name\": \"app_name\",\n                            \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(65, 5, 'ar', '{ brow_one_title } Milestoner تم تكوينه بواسطة {owner_name} المشروع { project_name } المشروع', '{\n                        \"Milestone Title\": \"milestone_title\",\n                        \"Milestone Status\": \"milestone_status\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"Project Title\": \"project_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(66, 5, 'da', '{ milestone_title } Milepæl er oprettet af {owner_name} af { project_name } projekt }\n                            ', '{\n                        \"Milestone Title\": \"milestone_title\",\n                        \"Milestone Status\": \"milestone_status\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"Project Title\": \"project_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(67, 5, 'de', '{milestone_title} Meilenstein wird erstellt von {owner_name} von {project_name} Projekt\n                            ', '{\n                        \"Milestone Title\": \"milestone_title\",\n                        \"Milestone Status\": \"milestone_status\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"Project Title\": \"project_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(68, 5, 'en', '{milestone_title} Milestone is Created By {owner_name} of {project_name} Project', '{\n                        \"Milestone Title\": \"milestone_title\",\n                        \"Milestone Status\": \"milestone_status\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"Project Title\": \"project_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(69, 5, 'es', '{title one_title} El hito se crea por {owner_name} de {project_name} Project\n                            ', '{\n                        \"Milestone Title\": \"milestone_title\",\n                        \"Milestone Status\": \"milestone_status\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"Project Title\": \"project_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(70, 5, 'fr', 'Le jalon { milestone_title } est créé par { nom_utilisateur } du projet { nom_projet }\n                            ', '{\n                        \"Milestone Title\": \"milestone_title\",\n                        \"Milestone Status\": \"milestone_status\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"Project Title\": \"project_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(71, 5, 'it', '{milestone_title} Milestone è Creato By {owner_name} di {project_name} Project\n                            ', '{\n                        \"Milestone Title\": \"milestone_title\",\n                        \"Milestone Status\": \"milestone_status\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"Project Title\": \"project_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(72, 5, 'ja', '{ マイルストーン・タイトル} マイルストーンは、 {project_name} プロジェクトの {owner_name} { owner_name} によって作成されます\n                            ', '{\n                        \"Milestone Title\": \"milestone_title\",\n                        \"Milestone Status\": \"milestone_status\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"Project Title\": \"project_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(73, 5, 'nl', '{ milestone_title } Milestone wordt gemaakt door {owner_name} van { project_name } Project\n                            ', '{\n                        \"Milestone Title\": \"milestone_title\",\n                        \"Milestone Status\": \"milestone_status\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"Project Title\": \"project_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(74, 5, 'pl', 'Kamień milowy {milestone_title } został utworzony przez użytkownika {owner_name } z projektu {project_name }\n                            ', '{\n                        \"Milestone Title\": \"milestone_title\",\n                        \"Milestone Status\": \"milestone_status\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"Project Title\": \"project_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(75, 5, 'ru', '{ milestone_title } Ilestone Создается пользователем {owner_name} проекта { project_name }\n                            ', '{\n                        \"Milestone Title\": \"milestone_title\",\n                        \"Milestone Status\": \"milestone_status\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"Project Title\": \"project_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(76, 5, 'pt', '{milestone_title} Milestone é Criado por {owner_name} de {project_name} Project', '{\n                        \"Milestone Title\": \"milestone_title\",\n                        \"Milestone Status\": \"milestone_status\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"Project Title\": \"project_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(77, 5, 'tr', '{ mileone_title } Aşama, { project_name } Projesinin { owner_name } Tarafından Oluşturuldu', '{\n                        \"Milestone Title\": \"milestone_title\",\n                        \"Milestone Status\": \"milestone_status\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"Project Title\": \"project_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(78, 5, 'zh', '{milestone_title } 里程碑由 {project_name} 的 {owner_name} 创建', '{\n                        \"Milestone Title\": \"milestone_title\",\n                        \"Milestone Status\": \"milestone_status\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"Project Title\": \"project_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(79, 5, 'he', '{המייל} אבן דרך נוצר על ידי {owner_name} של פרויקט {project_name}', '{\n                        \"Milestone Title\": \"milestone_title\",\n                        \"Milestone Status\": \"milestone_status\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"Project Title\": \"project_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(80, 5, 'pt-br', '{milestone_title} Milestone é Criado por {owner_name} de {project_name} Project', '{\n                        \"Milestone Title\": \"milestone_title\",\n                        \"Milestone Status\": \"milestone_status\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"Project Title\": \"project_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(81, 6, 'ar', 'حالة { elos_one_title } تم تعديلها بواسطة { owner_name }', '{\n                        \"Milestone Title\": \"milestone_title\",\n                        \"Milestone Status\": \"milestone_status\",\n                        \"Milestone Progress\": \"milestone_progress\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(82, 6, 'da', 'status for { milestone_title } opdateret af { owner_name }\n                            ', '{\n                        \"Milestone Title\": \"milestone_title\",\n                        \"Milestone Status\": \"milestone_status\",\n                        \"Milestone Progress\": \"milestone_progress\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(83, 6, 'de', 'Status von {milestone_title} aktualisiert von {owner_name}', '{\n                        \"Milestone Title\": \"milestone_title\",\n                        \"Milestone Status\": \"milestone_status\",\n                        \"Milestone Progress\": \"milestone_progress\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(84, 6, 'en', 'status of {milestone_title} updated by {owner_name}', '{\n                        \"Milestone Title\": \"milestone_title\",\n                        \"Milestone Status\": \"milestone_status\",\n                        \"Milestone Progress\": \"milestone_progress\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(85, 6, 'es', 'estado de {title one_title} actualizado por {owner_name}\n                            ', '{\n                        \"Milestone Title\": \"milestone_title\",\n                        \"Milestone Status\": \"milestone_status\",\n                        \"Milestone Progress\": \"milestone_progress\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(86, 6, 'fr', 'Statut de { milestone_title } mis à jour par { nom_utilisateur }\n                            ', '{\n                        \"Milestone Title\": \"milestone_title\",\n                        \"Milestone Status\": \"milestone_status\",\n                        \"Milestone Progress\": \"milestone_progress\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(87, 6, 'it', 'stato di {milestone_title} aggiornato da {owner_name}\n                            ', '{\n                        \"Milestone Title\": \"milestone_title\",\n                        \"Milestone Status\": \"milestone_status\",\n                        \"Milestone Progress\": \"milestone_progress\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(88, 6, 'ja', '{owner_name} によって更新された {milestone_title} の状況\n                            ', '{\n                        \"Milestone Title\": \"milestone_title\",\n                        \"Milestone Status\": \"milestone_status\",\n                        \"Milestone Progress\": \"milestone_progress\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(89, 6, 'nl', 'status van { milestone_title } bijgewerkt door { owner_name }\n                            ', '{\n                        \"Milestone Title\": \"milestone_title\",\n                        \"Milestone Status\": \"milestone_status\",\n                        \"Milestone Progress\": \"milestone_progress\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(90, 6, 'pl', 'status {milestone_title } został zaktualizowany przez użytkownika {owner_name }\n                            ', '{\n                        \"Milestone Title\": \"milestone_title\",\n                        \"Milestone Status\": \"milestone_status\",\n                        \"Milestone Progress\": \"milestone_progress\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(91, 6, 'ru', 'состояние { milestone_title } обновлено пользователем { owner_name }\n                            ', '{\n                        \"Milestone Title\": \"milestone_title\",\n                        \"Milestone Status\": \"milestone_status\",\n                        \"Milestone Progress\": \"milestone_progress\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55');
INSERT INTO `notification_template_langs` (`id`, `parent_id`, `lang`, `content`, `variables`, `created_by`, `created_at`, `updated_at`) VALUES
(92, 6, 'pt', 'status de {milestone_title} atualizado por {owner_name}', '{\n                        \"Milestone Title\": \"milestone_title\",\n                        \"Milestone Status\": \"milestone_status\",\n                        \"Milestone Progress\": \"milestone_progress\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(93, 6, 'tr', '{ mounone_title } durumu { owner_name } tarafından güncelleştirildi', '{\n                        \"Milestone Title\": \"milestone_title\",\n                        \"Milestone Status\": \"milestone_status\",\n                        \"Milestone Progress\": \"milestone_progress\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(94, 6, 'zh', '{owner_name} 已更新 {mileestone_title } 的状态', '{\n                        \"Milestone Title\": \"milestone_title\",\n                        \"Milestone Status\": \"milestone_status\",\n                        \"Milestone Progress\": \"milestone_progress\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(95, 6, 'he', 'הסטאטוס של {המייל stone_title} שעודכן על ידי {owner_name}', '{\n                        \"Milestone Title\": \"milestone_title\",\n                        \"Milestone Status\": \"milestone_status\",\n                        \"Milestone Progress\": \"milestone_progress\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(96, 6, 'pt-br', 'status de {milestone_title} atualizado por {owner_name}', '{\n                        \"Milestone Title\": \"milestone_title\",\n                        \"Milestone Status\": \"milestone_status\",\n                        \"Milestone Progress\": \"milestone_progress\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(97, 7, 'ar', 'تم تعديل حالة { invoice_id } بواسطة { owner_name }', '{\n                        \"Invoice Name\": \"invoice_id\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(98, 7, 'da', 'status på { invoice_id } opdateret af { owner_name }\n                            ', '{\n                        \"Invoice Name\": \"invoice_id\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(99, 7, 'de', 'Status von {invoice_id} aktualisiert von {owner_name}', '{\n                        \"Invoice Name\": \"invoice_id\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(100, 7, 'en', 'status of {invoice_id} updated by {owner_name}', '{\n                        \"Invoice Name\": \"invoice_id\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(101, 7, 'es', 'estado de {invoice_id} actualizado por {owner_name}\n                            ', '{\n                        \"Invoice Name\": \"invoice_id\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(102, 7, 'fr', 'Statut de { invoice_id } mis à jour par { nom_utilisateur }\n                            ', '{\n                        \"Invoice Name\": \"invoice_id\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(103, 7, 'it', 'stato di {invoice_id} aggiornato da {owner_name}\n                            ', '{\n                        \"Invoice Name\": \"invoice_id\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(104, 7, 'ja', '{ owner_name} によって更新された {請求 name} の状況', '{\n                        \"Invoice Name\": \"invoice_id\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(105, 7, 'nl', 'status van { invoice_id } bijgewerkt door { owner_name }\n                            ', '{\n                        \"Invoice Name\": \"invoice_id\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(106, 7, 'pl', 'status {invoice_id } został zaktualizowany przez użytkownika {owner_name }\n                            ', '{\n                        \"Invoice Name\": \"invoice_id\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(107, 7, 'ru', 'состояние { invoice_id } обновлено пользователем { owner_name }\n                            ', '{\n                        \"Invoice Name\": \"invoice_id\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(108, 7, 'pt', 'status de {invoice_id} atualizado por {owner_name}', '{\n                        \"Invoice Name\": \"invoice_id\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(109, 7, 'tr', '{ owner_name } tarafından güncellenen { invoice_id } durumu', '{\n                        \"Invoice Name\": \"invoice_id\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(110, 7, 'zh', '{ owner_name} 已更新 {invoice_id} 的状态', '{\n                        \"Invoice Name\": \"invoice_id\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(111, 7, 'he', 'הסטאטוס של {invoice_id} עודכן על-ידי {owner_name}', '{\n                        \"Invoice Name\": \"invoice_id\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(112, 7, 'pt-br', 'status de {invoice_id} atualizado por {owner_name}', '{\n                        \"Invoice Name\": \"invoice_id\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(113, 1, 'en', 'The {project_name} project is created by {app_name}. The total hours are {project_hours}.', '{\n                    \"Project Title\": \"project_name\",\n                    \"Project Budget\": \"project_budget\",\n                    \"Project Hours\": \"project_hours\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\",\n                    \"App Name\": \"app_name\",\n                    \"App Url\": \"app_url\"\n                    }', 9, '2024-05-09 08:38:12', '2024-05-09 08:38:12'),
(114, 1, 'en', 'The {project_name} project is created by {app_name}. The total hours are {project_hours}.', '{\n                    \"Project Title\": \"project_name\",\n                    \"Project Budget\": \"project_budget\",\n                    \"Project Hours\": \"project_hours\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\",\n                    \"App Name\": \"app_name\",\n                    \"App Url\": \"app_url\"\n                    }', 13, '2024-05-23 07:44:01', '2024-05-23 07:44:01'),
(115, 1, 'en', 'The {Mega_project} project is created by {task_magix}. The total hours are {100}.', '{\n                    \"Project Title\": \"project_name\",\n                    \"Project Budget\": \"project_budget\",\n                    \"Project Hours\": \"project_hours\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\",\n                    \"App Name\": \"app_name\",\n                    \"App Url\": \"app_url\"\n                    }', 39, '2024-07-18 13:27:50', '2024-07-18 13:27:50'),
(116, 1, 'de', 'Das Projekt {project_name} wird von {app_name} erstellt. Die Gesamtstunden sind {project_hours}.', '{\n                    \"Project Title\": \"project_name\",\n                    \"Project Budget\": \"project_budget\",\n                    \"Project Hours\": \"project_hours\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\",\n                    \"App Name\": \"app_name\",\n                    \"App Url\": \"app_url\"\n                    }', 35, '2024-07-22 06:54:13', '2024-07-22 06:54:13'),
(117, 1, 'ja', '{project_name} プロジェクトは {app_name}によって作成されます。 合計時間は {project_hours}です。', '{\n                    \"Project Title\": \"project_name\",\n                    \"Project Budget\": \"project_budget\",\n                    \"Project Hours\": \"project_hours\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\",\n                    \"App Name\": \"app_name\",\n                    \"App Url\": \"app_url\"\n                    }', 35, '2024-07-22 06:55:11', '2024-07-22 06:55:11'),
(118, 1, 'en', 'The {project_name} project is created by {app_name}. The total hours are {project_hours}.', '{\n                    \"Project Title\": \"project_name\",\n                    \"Project Budget\": \"project_budget\",\n                    \"Project Hours\": \"project_hours\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\",\n                    \"App Name\": \"app_name\",\n                    \"App Url\": \"app_url\"\n                    }', 35, '2024-07-22 06:55:23', '2024-07-22 06:55:23'),
(119, 3, 'en', 'New Invoice {invoice_id} created by {owner_name}', '{\n                        \"Invoice Name\": \"invoice_id\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 39, '2024-08-23 07:19:08', '2024-08-23 07:19:08'),
(120, 2, 'en', 'hello', '{\n                        \"Task Name\" : \"task_name\",\n                        \"Task Priority\" : \"task_priority\",\n                        \"Task Project\" : \"task_project\",\n                        \"Task Stage\" : \"task_stage\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"Project Title\": \"project_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 39, '2024-08-23 10:35:14', '2024-08-23 10:35:14'),
(121, 7, 'en', 'status of {invoice_id} updated by {owner_name}', '{\n                        \"Invoice Name\": \"invoice_id\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 39, '2024-08-23 11:13:07', '2024-08-23 11:13:07'),
(122, 1, 'mr', 'The {project_name} project is created by {app_name}. The total hours are {project_hours}.', '{\n                    \"Project Title\": \"project_name\",\n                    \"Project Budget\": \"project_budget\",\n                    \"Project Hours\": \"project_hours\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\",\n                    \"App Name\": \"app_name\",\n                    \"App Url\": \"app_url\"\n                    }', 1, '2024-10-04 07:42:06', '2024-10-04 07:42:06'),
(123, 2, 'mr', 'The {task_name} Task is Created By {owner_name} of {project_name} Project', '{\n                        \"Task Name\" : \"task_name\",\n                        \"Task Priority\" : \"task_priority\",\n                        \"Task Project\" : \"task_project\",\n                        \"Task Stage\" : \"task_stage\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"Project Title\": \"project_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-10-04 07:42:06', '2024-10-04 07:42:06'),
(124, 3, 'mr', 'New Invoice {invoice_id} created by {owner_name} ', '{\n                        \"Invoice Name\": \"invoice_id\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-10-04 07:42:06', '2024-10-04 07:42:06'),
(125, 4, 'mr', 'Task stage of {task_name} updated from {old_stage} to {new_stage} Project', '{\n                            \"Task Name\" : \"task_name\",\n                            \"New Stage\" : \"new_stage\",\n                            \"Old Stage\" : \"old_stage\",\n                            \"Task Priority\" : \"task_priority\",\n                            \"Task Project\" : \"task_project\",\n                            \"App Name\": \"app_name\",\n                            \"App Url\": \"app_url\"\n                        }', 1, '2024-10-04 07:42:06', '2024-10-04 07:42:06'),
(126, 5, 'mr', '{milestone_title} Milestone is Created By {owner_name} of {project_name} Project', '{\n                        \"Milestone Title\": \"milestone_title\",\n                        \"Milestone Status\": \"milestone_status\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"Project Title\": \"project_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-10-04 07:42:06', '2024-10-04 07:42:06'),
(127, 6, 'mr', 'status of {milestone_title} updated by {owner_name}', '{\n                        \"Milestone Title\": \"milestone_title\",\n                        \"Milestone Status\": \"milestone_status\",\n                        \"Milestone Progress\": \"milestone_progress\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-10-04 07:42:06', '2024-10-04 07:42:06'),
(128, 7, 'mr', 'status of {invoice_id} updated by {owner_name}', '{\n                        \"Invoice Name\": \"invoice_id\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-10-04 07:42:06', '2024-10-04 07:42:06'),
(129, 1, 'mr', 'The {project_name} project is created by {app_name}. The total hours are {project_hours}.', '{\n                    \"Project Title\": \"project_name\",\n                    \"Project Budget\": \"project_budget\",\n                    \"Project Hours\": \"project_hours\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\",\n                    \"App Name\": \"app_name\",\n                    \"App Url\": \"app_url\"\n                    }', 1, '2024-10-04 08:07:47', '2024-10-04 08:07:47'),
(130, 2, 'mr', 'The {task_name} Task is Created By {owner_name} of {project_name} Project', '{\n                        \"Task Name\" : \"task_name\",\n                        \"Task Priority\" : \"task_priority\",\n                        \"Task Project\" : \"task_project\",\n                        \"Task Stage\" : \"task_stage\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"Project Title\": \"project_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-10-04 08:07:47', '2024-10-04 08:07:47'),
(131, 3, 'mr', 'New Invoice {invoice_id} created by {owner_name} ', '{\n                        \"Invoice Name\": \"invoice_id\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-10-04 08:07:47', '2024-10-04 08:07:47'),
(132, 4, 'mr', 'Task stage of {task_name} updated from {old_stage} to {new_stage} Project', '{\n                            \"Task Name\" : \"task_name\",\n                            \"New Stage\" : \"new_stage\",\n                            \"Old Stage\" : \"old_stage\",\n                            \"Task Priority\" : \"task_priority\",\n                            \"Task Project\" : \"task_project\",\n                            \"App Name\": \"app_name\",\n                            \"App Url\": \"app_url\"\n                        }', 1, '2024-10-04 08:07:47', '2024-10-04 08:07:47'),
(133, 5, 'mr', '{milestone_title} Milestone is Created By {owner_name} of {project_name} Project', '{\n                        \"Milestone Title\": \"milestone_title\",\n                        \"Milestone Status\": \"milestone_status\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"Project Title\": \"project_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-10-04 08:07:47', '2024-10-04 08:07:47'),
(134, 6, 'mr', 'status of {milestone_title} updated by {owner_name}', '{\n                        \"Milestone Title\": \"milestone_title\",\n                        \"Milestone Status\": \"milestone_status\",\n                        \"Milestone Progress\": \"milestone_progress\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-10-04 08:07:47', '2024-10-04 08:07:47'),
(135, 7, 'mr', 'status of {invoice_id} updated by {owner_name}', '{\n                        \"Invoice Name\": \"invoice_id\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-10-04 08:07:47', '2024-10-04 08:07:47'),
(136, 1, 'mr', 'The {project_name} project is created by {app_name}. The total hours are {project_hours}.', '{\n                    \"Project Title\": \"project_name\",\n                    \"Project Budget\": \"project_budget\",\n                    \"Project Hours\": \"project_hours\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\",\n                    \"App Name\": \"app_name\",\n                    \"App Url\": \"app_url\"\n                    }', 1, '2024-10-04 08:08:43', '2024-10-04 08:08:43'),
(137, 2, 'mr', 'The {task_name} Task is Created By {owner_name} of {project_name} Project', '{\n                        \"Task Name\" : \"task_name\",\n                        \"Task Priority\" : \"task_priority\",\n                        \"Task Project\" : \"task_project\",\n                        \"Task Stage\" : \"task_stage\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"Project Title\": \"project_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-10-04 08:08:43', '2024-10-04 08:08:43'),
(138, 3, 'mr', 'New Invoice {invoice_id} created by {owner_name} ', '{\n                        \"Invoice Name\": \"invoice_id\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-10-04 08:08:43', '2024-10-04 08:08:43'),
(139, 4, 'mr', 'Task stage of {task_name} updated from {old_stage} to {new_stage} Project', '{\n                            \"Task Name\" : \"task_name\",\n                            \"New Stage\" : \"new_stage\",\n                            \"Old Stage\" : \"old_stage\",\n                            \"Task Priority\" : \"task_priority\",\n                            \"Task Project\" : \"task_project\",\n                            \"App Name\": \"app_name\",\n                            \"App Url\": \"app_url\"\n                        }', 1, '2024-10-04 08:08:43', '2024-10-04 08:08:43'),
(140, 5, 'mr', '{milestone_title} Milestone is Created By {owner_name} of {project_name} Project', '{\n                        \"Milestone Title\": \"milestone_title\",\n                        \"Milestone Status\": \"milestone_status\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"Project Title\": \"project_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-10-04 08:08:43', '2024-10-04 08:08:43'),
(141, 6, 'mr', 'status of {milestone_title} updated by {owner_name}', '{\n                        \"Milestone Title\": \"milestone_title\",\n                        \"Milestone Status\": \"milestone_status\",\n                        \"Milestone Progress\": \"milestone_progress\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-10-04 08:08:43', '2024-10-04 08:08:43'),
(142, 7, 'mr', 'status of {invoice_id} updated by {owner_name}', '{\n                        \"Invoice Name\": \"invoice_id\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-10-04 08:08:43', '2024-10-04 08:08:43'),
(143, 1, 'mr', 'The {project_name} project is created by {app_name}. The total hours are {project_hours}.', '{\n                    \"Project Title\": \"project_name\",\n                    \"Project Budget\": \"project_budget\",\n                    \"Project Hours\": \"project_hours\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\",\n                    \"App Name\": \"app_name\",\n                    \"App Url\": \"app_url\"\n                    }', 1, '2024-10-05 10:10:35', '2024-10-05 10:10:35'),
(144, 2, 'mr', 'The {task_name} Task is Created By {owner_name} of {project_name} Project', '{\n                        \"Task Name\" : \"task_name\",\n                        \"Task Priority\" : \"task_priority\",\n                        \"Task Project\" : \"task_project\",\n                        \"Task Stage\" : \"task_stage\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"Project Title\": \"project_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-10-05 10:10:35', '2024-10-05 10:10:35'),
(145, 3, 'mr', 'New Invoice {invoice_id} created by {owner_name} ', '{\n                        \"Invoice Name\": \"invoice_id\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-10-05 10:10:35', '2024-10-05 10:10:35'),
(146, 4, 'mr', 'Task stage of {task_name} updated from {old_stage} to {new_stage} Project', '{\n                            \"Task Name\" : \"task_name\",\n                            \"New Stage\" : \"new_stage\",\n                            \"Old Stage\" : \"old_stage\",\n                            \"Task Priority\" : \"task_priority\",\n                            \"Task Project\" : \"task_project\",\n                            \"App Name\": \"app_name\",\n                            \"App Url\": \"app_url\"\n                        }', 1, '2024-10-05 10:10:35', '2024-10-05 10:10:35'),
(147, 5, 'mr', '{milestone_title} Milestone is Created By {owner_name} of {project_name} Project', '{\n                        \"Milestone Title\": \"milestone_title\",\n                        \"Milestone Status\": \"milestone_status\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"Project Title\": \"project_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-10-05 10:10:35', '2024-10-05 10:10:35'),
(148, 6, 'mr', 'status of {milestone_title} updated by {owner_name}', '{\n                        \"Milestone Title\": \"milestone_title\",\n                        \"Milestone Status\": \"milestone_status\",\n                        \"Milestone Progress\": \"milestone_progress\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-10-05 10:10:35', '2024-10-05 10:10:35'),
(149, 7, 'mr', 'status of {invoice_id} updated by {owner_name}', '{\n                        \"Invoice Name\": \"invoice_id\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2024-10-05 10:10:35', '2024-10-05 10:10:35'),
(150, 1, 'en', 'The {project_name} project is created by {app_name}. The total hours are {project_hours}.', '{\n                    \"Project Title\": \"project_name\",\n                    \"Project Budget\": \"project_budget\",\n                    \"Project Hours\": \"project_hours\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\",\n                    \"App Name\": \"app_name\",\n                    \"App Url\": \"app_url\"\n                    }', 48, '2025-02-10 09:34:29', '2025-02-10 09:34:29'),
(151, 1, 'hindi01', 'The {project_name} project is created by {app_name}. The total hours are {project_hours}.', '{\n                    \"Project Title\": \"project_name\",\n                    \"Project Budget\": \"project_budget\",\n                    \"Project Hours\": \"project_hours\",\n                    \"Start Date\": \"start_date\",\n                    \"End Date\": \"end_date\",\n                    \"App Name\": \"app_name\",\n                    \"App Url\": \"app_url\"\n                    }', 1, '2025-03-05 12:34:08', '2025-03-05 12:34:08'),
(152, 2, 'hindi01', 'The {task_name} Task is Created By {owner_name} of {project_name} Project', '{\n                        \"Task Name\" : \"task_name\",\n                        \"Task Priority\" : \"task_priority\",\n                        \"Task Project\" : \"task_project\",\n                        \"Task Stage\" : \"task_stage\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"Project Title\": \"project_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2025-03-05 12:34:08', '2025-03-05 12:34:08'),
(153, 3, 'hindi01', 'New Invoice {invoice_id} created by {owner_name} ', '{\n                        \"Invoice Name\": \"invoice_id\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2025-03-05 12:34:08', '2025-03-05 12:34:08'),
(154, 4, 'hindi01', 'Task stage of {task_name} updated from {old_stage} to {new_stage} Project', '{\n                            \"Task Name\" : \"task_name\",\n                            \"New Stage\" : \"new_stage\",\n                            \"Old Stage\" : \"old_stage\",\n                            \"Task Priority\" : \"task_priority\",\n                            \"Task Project\" : \"task_project\",\n                            \"App Name\": \"app_name\",\n                            \"App Url\": \"app_url\"\n                        }', 1, '2025-03-05 12:34:08', '2025-03-05 12:34:08'),
(155, 5, 'hindi01', '{milestone_title} Milestone is Created By {owner_name} of {project_name} Project', '{\n                        \"Milestone Title\": \"milestone_title\",\n                        \"Milestone Status\": \"milestone_status\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"Project Title\": \"project_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2025-03-05 12:34:08', '2025-03-05 12:34:08'),
(156, 6, 'hindi01', 'status of {milestone_title} updated by {owner_name}', '{\n                        \"Milestone Title\": \"milestone_title\",\n                        \"Milestone Status\": \"milestone_status\",\n                        \"Milestone Progress\": \"milestone_progress\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2025-03-05 12:34:08', '2025-03-05 12:34:08'),
(157, 7, 'hindi01', 'status of {invoice_id} updated by {owner_name}', '{\n                        \"Invoice Name\": \"invoice_id\",\n                        \"Owner Name\" : \"owner_name\",\n                        \"App Name\": \"app_name\",\n                        \"App Url\": \"app_url\"\n                        }', 1, '2025-03-05 12:34:08', '2025-03-05 12:34:08');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subscription_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_number` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_exp_month` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_exp_year` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plan_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plan_id` int(11) NOT NULL,
  `price` double(8,2) NOT NULL,
  `price_currency` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `txn_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payer_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_frequency` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `receipt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `is_refund` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_id`, `subscription_id`, `name`, `email`, `card_number`, `card_exp_month`, `card_exp_year`, `plan_name`, `plan_id`, `price`, `price_currency`, `txn_id`, `payer_id`, `payment_frequency`, `payment_type`, `payment_status`, `receipt`, `user_id`, `is_refund`, `created_at`, `updated_at`) VALUES
(1, '664EF828D806D836418061', NULL, NULL, NULL, NULL, NULL, NULL, 'Gold', 3, 1299.00, 'INR', '', NULL, NULL, 'Manually Upgrade By Super Admin', 'succeeded', NULL, 13, 0, '2024-05-23 08:02:48', '2024-05-23 08:02:48'),
(2, '664EF87B7F3AD926630936', NULL, NULL, NULL, NULL, NULL, NULL, 'Silver', 2, 799.00, 'INR', '', NULL, NULL, 'Manually Upgrade By Super Admin', 'succeeded', NULL, 13, 0, '2024-05-23 08:04:11', '2024-05-23 08:04:11'),
(3, '665D9FA64F5AE513345163', NULL, NULL, NULL, NULL, NULL, NULL, 'Gold', 3, 12999.00, 'INR', '', NULL, NULL, 'Manually Upgrade By Super Admin', 'succeeded', NULL, 18, 0, '2024-06-03 10:49:10', '2024-06-03 10:49:10'),
(4, '665EFEF5B7A6C113884496', NULL, NULL, NULL, NULL, NULL, NULL, 'Silver', 2, 7999.00, 'INR', '', NULL, NULL, 'Manually Upgrade By Super Admin', 'succeeded', NULL, 18, 0, '2024-06-04 11:48:05', '2024-06-04 11:48:05'),
(5, '665EFF0468902691651745', NULL, NULL, NULL, NULL, NULL, NULL, 'Gold', 3, 12999.00, 'INR', '', NULL, NULL, 'Manually Upgrade By Super Admin', 'succeeded', NULL, 19, 0, '2024-06-04 11:48:20', '2024-06-04 11:48:20'),
(6, '6662B41F99EE1832023208', NULL, NULL, NULL, NULL, NULL, NULL, 'Gold', 3, 0.00, 'INR', '', NULL, NULL, 'Stripe', 'succeeded', NULL, 9, 0, '2024-06-07 07:17:51', '2024-06-07 07:17:51'),
(7, '6700F3AF06B14335209156', NULL, NULL, NULL, NULL, NULL, NULL, 'Free Plan', 1, 0.00, 'INR', '', NULL, NULL, 'Manually Upgrade By Super Admin', 'succeeded', NULL, 32, 0, '2024-10-05 08:07:11', '2024-10-05 08:07:11'),
(8, '674EE21EF0C2B941170315', NULL, NULL, NULL, NULL, NULL, NULL, 'Ultra Platinum', 8, 50000.00, 'INR', '', NULL, NULL, 'Manually Upgrade By Super Admin', 'succeeded', NULL, 48, 0, '2024-12-03 10:49:02', '2024-12-03 10:49:02'),
(9, '67A71285AECBF552140741', NULL, NULL, NULL, NULL, NULL, NULL, 'Silver', 2, 799.00, 'INR', '', NULL, NULL, 'Manually Upgrade By Super Admin', 'succeeded', NULL, 364, 0, '2025-02-08 08:15:01', '2025-02-08 08:15:01'),
(10, '67A75690D2604957046416', NULL, NULL, NULL, NULL, NULL, NULL, 'test plan', 11, 199.00, 'INR', '', NULL, NULL, 'Manually Upgrade By Super Admin', 'succeeded', NULL, 364, 0, '2025-02-08 13:05:20', '2025-02-08 13:05:20'),
(11, '67A7570D96855855646000', NULL, NULL, NULL, NULL, NULL, NULL, 'Free Plan', 1, 0.00, 'INR', '', NULL, NULL, 'Manually Upgrade By Super Admin', 'succeeded', NULL, 364, 0, '2025-02-08 13:07:25', '2025-02-08 13:07:25'),
(12, '67A758DDEA174073766290', NULL, NULL, NULL, NULL, NULL, NULL, 'Free Plan', 1, 0.00, 'INR', '', NULL, NULL, 'Manually Upgrade By Super Admin', 'succeeded', NULL, 364, 0, '2025-02-08 13:15:09', '2025-02-08 13:15:09'),
(13, '67A758E6790C3977566991', NULL, NULL, NULL, NULL, NULL, NULL, 'test plan', 11, 199.00, 'INR', '', NULL, NULL, 'Manually Upgrade By Super Admin', 'succeeded', NULL, 364, 1, '2025-02-08 13:15:18', '2025-02-08 13:58:20'),
(14, '67A99440C2AAE119818021', NULL, NULL, NULL, NULL, NULL, NULL, 'Silver', 2, 799.00, 'INR', '', NULL, NULL, 'Manually Upgrade By Super Admin', 'succeeded', NULL, 364, 0, '2025-02-10 05:53:04', '2025-02-10 05:53:04'),
(15, '67A994E6E8FA9221709784', NULL, NULL, NULL, NULL, NULL, NULL, 'Gold', 3, 1299.00, '', '', NULL, NULL, 'Bank Transfer', 'Approved', 'payment_receipt/payment_1686386876_1739166950.png', 364, 0, '2025-02-10 05:55:50', '2025-02-10 05:58:12'),
(16, '67AB5F3E4B594470282792', NULL, NULL, NULL, NULL, NULL, NULL, 'Gold', 3, 1299.00, 'INR', '', NULL, NULL, 'Manually Upgrade By Super Admin', 'succeeded', NULL, 364, 0, '2025-02-11 14:31:26', '2025-02-11 14:31:26'),
(17, '67AC47183799F359373424', NULL, NULL, NULL, NULL, NULL, NULL, 'Silver', 2, 799.00, 'INR', '', NULL, NULL, 'Stripe', 'succeeded', NULL, 364, 0, '2025-02-12 07:00:40', '2025-02-12 07:00:40'),
(18, '1739353208', NULL, 'Dipak maildrop', NULL, '', '', '', 'Gold', 3, 1299.00, '', 'pay_PukjUBtzUVOzr8', NULL, NULL, 'Razorpay', 'success', '', 364, 0, '2025-02-12 09:40:12', '2025-02-12 09:40:12'),
(19, '1739353470', NULL, 'Dipak maildrop', NULL, '', '', '', 'Ultra Platinum', 8, 3000.00, '', 'pay_Puko5W6EAxOEC5', NULL, NULL, 'Razorpay', 'success', '', 364, 0, '2025-02-12 09:44:31', '2025-02-12 09:44:31'),
(20, '1739430358', NULL, 'Dipak maildrop', NULL, '', '', '', 'Ultra Platinum', 8, 3000.00, '', 'pay_Pv6do8Wl8xdV4E', NULL, NULL, 'Razorpay', 'success', '', 364, 0, '2025-02-13 07:05:58', '2025-02-13 07:05:58'),
(21, '67ADAD0D49B5F927569398', NULL, NULL, NULL, NULL, NULL, NULL, 'Ultra Platinum', 8, 3000.00, 'INR', '', NULL, NULL, 'Stripe', 'succeeded', NULL, 364, 0, '2025-02-13 08:27:57', '2025-02-13 08:27:57'),
(22, '67ADAE1982C24614348562', NULL, NULL, NULL, NULL, NULL, NULL, 'Ultra Platinum', 8, 3000.00, 'INR', '', NULL, NULL, 'Stripe', 'succeeded', NULL, 364, 0, '2025-02-13 08:32:25', '2025-02-13 08:32:25'),
(23, '1739437480', NULL, 'Dipak maildrop', NULL, '', '', '', 'Ultra Platinum', 8, 3000.00, '', 'pay_Pv8ezaoMCC0UsW', NULL, NULL, 'Razorpay', 'success', '', 364, 0, '2025-02-13 09:04:41', '2025-02-13 09:04:41'),
(24, '1739437607', NULL, 'Dipak maildrop', NULL, '', '', '', 'Ultra Platinum', 8, 3000.00, '', 'pay_Pv8hM5OkSEWMym', NULL, NULL, 'Razorpay', 'success', '', 364, 0, '2025-02-13 09:06:48', '2025-02-13 09:06:48'),
(25, '67ADB679B1B74247679998', NULL, NULL, NULL, NULL, NULL, NULL, 'Ultra Platinum', 8, 3000.00, 'INR', '', NULL, NULL, 'Stripe', 'succeeded', NULL, 364, 0, '2025-02-13 09:08:09', '2025-02-13 09:08:09'),
(26, '67ADD11771A78223342016', NULL, NULL, NULL, NULL, NULL, NULL, 'test plan', 11, 199.00, 'INR', '', NULL, NULL, 'Stripe', 'succeeded', NULL, 364, 0, '2025-02-13 11:01:43', '2025-02-13 11:01:43'),
(27, '67ADD1EA22B7F095742605', NULL, NULL, NULL, NULL, NULL, NULL, 'Platinum', 7, 3000.00, 'INR', '', NULL, NULL, 'Stripe', 'succeeded', NULL, 364, 0, '2025-02-13 11:05:14', '2025-02-13 11:05:14'),
(28, '67ADD3726C655738437830', NULL, NULL, NULL, NULL, NULL, NULL, 'Silver', 2, 7999.00, 'INR', '', NULL, NULL, 'Stripe', 'succeeded', NULL, 364, 0, '2025-02-13 11:11:46', '2025-02-13 11:11:46'),
(29, '67ADD3A44BEED754851277', NULL, NULL, NULL, NULL, NULL, NULL, 'Gold', 3, 12999.00, 'INR', '', NULL, NULL, 'Stripe', 'succeeded', NULL, 364, 0, '2025-02-13 11:12:36', '2025-02-13 11:12:36'),
(30, '1739448200', NULL, 'Dipak maildrop', NULL, '', '', '', 'Silver', 2, 7999.00, '', 'pay_PvBhqGq9kBxHTD', NULL, NULL, 'Razorpay', 'success', '', 364, 0, '2025-02-13 12:03:21', '2025-02-13 12:03:21'),
(31, '67AEDD59BDA07412724447', NULL, NULL, NULL, NULL, NULL, NULL, 'Gold', 3, 1299.00, 'INR', '', NULL, NULL, 'Stripe', 'succeeded', NULL, 364, 0, '2025-02-14 06:06:17', '2025-02-14 06:06:17'),
(32, '67B57BD0316CE320202777', NULL, NULL, NULL, NULL, NULL, NULL, 'Platinum', 7, 1500.00, 'INR', '', NULL, NULL, 'Stripe', 'succeeded', NULL, 48, 0, '2025-02-19 06:36:00', '2025-02-19 06:36:00'),
(33, '1740143817', NULL, 'Dipak', NULL, '', '', '', 'Ultra Platinum', 8, 3000.00, '', 'pay_PyNEePGGAUy8Ek', NULL, NULL, 'Razorpay', 'success', '', 48, 0, '2025-02-21 13:17:00', '2025-02-21 13:17:00'),
(34, '67B9C155C4F19284812904', NULL, NULL, NULL, NULL, NULL, NULL, 'Platinum', 7, 599.00, 'INR', '', NULL, NULL, 'Manually Upgrade By Super Admin', 'succeeded', NULL, 48, 0, '2025-02-22 12:21:41', '2025-02-22 12:21:41'),
(35, '67B9C15DEE3BF902143108', NULL, NULL, NULL, NULL, NULL, NULL, 'Platinum', 7, 599.00, 'INR', '', NULL, NULL, 'Manually Upgrade By Super Admin', 'succeeded', NULL, 69, 0, '2025-02-22 12:21:49', '2025-02-22 12:21:49'),
(36, '67B9C1653FE67308274543', NULL, NULL, NULL, NULL, NULL, NULL, 'Platinum', 7, 599.00, 'INR', '', NULL, NULL, 'Manually Upgrade By Super Admin', 'succeeded', NULL, 364, 0, '2025-02-22 12:21:57', '2025-02-22 12:21:57'),
(37, '1744963396', NULL, 'Tester', NULL, '', '', '', 'Silver', 2, 1990.00, '', 'pay_QKRo5Ccb8r6yBo', NULL, NULL, 'Razorpay', 'success', '', 400, 0, '2025-04-18 08:03:17', '2025-04-18 08:03:17'),
(38, '681B995538B14472790100', NULL, NULL, NULL, NULL, NULL, NULL, 'Gold', 3, 499.00, 'INR', '', NULL, NULL, 'Manually Upgrade By Super Admin', 'succeeded', NULL, 400, 0, '2025-05-07 17:33:09', '2025-05-07 17:33:09');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('nomo28@mailinator.com', '$2y$10$T.ccSbB9XsM96B/JP8rHUu.dgQlCvC0Fp5yonJ0Frk8N/nwe5Rr4S', '2024-07-17 09:31:51'),
('namo22@mailinator.com', '$2y$10$WOO48BisVOmKdcoxcKh/Y.KRGqh9vfSw379QQXREI5AI6l63Z2YYe', '2024-07-17 12:29:39'),
('monu22@mailinator.com', '$2y$10$jkMs5dYCl8UdaGyxsA1zheF03SZjCNPaehKmcjM/IdxGkzNdwQMcq', '2024-08-21 13:08:24'),
('aaditi.parmar@dreamsinternational.in', '$2y$10$yUjDdSZSKYknRzUwAbjUEeSI9B7jXLwWpFhMpchDl.qOC741kYxKq', '2024-09-03 11:03:25'),
('disha0857@gmail.com', '$2y$10$2ps7yG/iPOG2zPjKuvxpx.mkCAJLMXm6XBER0MAPEqQDg78mNrIh.', '2024-09-04 11:54:39'),
('myetteoeter@yahoo.com', '$2y$10$B9Ho7FJqCwsF14hBJoPvwuU5X8zHa3RWQnIjgOIqJDzDjJi/fLReu', '2025-01-14 06:55:23'),
('oedusk64talisman@gmail.com', '$2y$10$fB0rEEvB.5ResM9G96pY7O9Q6.A4gq0tqWNvlMiWWwIWmAh7XE82S', '2025-01-19 20:33:38'),
('icesurf1128@gmail.com', '$2y$10$3e58Yp4y9oDN.6xRxgkYV.j298/aRYaRksT2wT50eQqKO7guY8kiO', '2025-01-21 09:04:37'),
('samgdel@gmail.com', '$2y$10$zQJ3YC0KR6BUeyf5PoR8AOm0LIGFEWy0s..2qTVJOJRvz87229lz2', '2025-01-21 11:07:42'),
('alkluk10@gmail.com', '$2y$10$rW9ncXy1w2ZPqVQT.5fBH.n4Yoyzwl0nG2czeMlyfnbouY5NjCwOm', '2025-01-21 12:28:36'),
('asong74@gmail.com', '$2y$10$nfATPggEewtIe64kS1GByuN6crjbT9hRt1eHgR5k3bdG0XdoMhpS6', '2025-01-21 16:37:43'),
('howewife@gmail.com', '$2y$10$mZyweS67H9QUyx/r44V7nO4ewYlIVlwlilNV9H7kHcaOwkh.Vt9IC', '2025-01-21 16:43:02'),
('magic7@tohru.org', '$2y$10$0WhcrnnMN0OfIM0fJc.pzuzrrzzaXCS/RcrJPU.VM8E.6Zn3liSEC', '2025-01-21 18:05:03'),
('cottobrown@sprynet.com', '$2y$10$hE1OzvWsXWiQl94ptesko.XAEX3C7mbomirs3PCOcqzEc9mx9UdFS', '2025-01-21 20:43:20'),
('miadur1@gmail.com', '$2y$10$MuVwVsGTWOzCrz6KYwAO6uiwLQQ9wdnoFAS0nwrK2o2DuYQv4nIcC', '2025-01-22 00:40:57'),
('batyaten@gmail.com', '$2y$10$/nQwdMNRQPPwmzLAhGCzH.rbsIZzKzNE1SPOW/tmLJ2GledtR8rUy', '2025-01-22 04:07:22'),
('bjoonahn@gmail.com', '$2y$10$KyV2kfak8LVEB9j.12tCoOdEmUq4dbsGkB12xhlQmNGiW2df/YyVK', '2025-01-22 05:28:21'),
('bradbushey@gmail.com', '$2y$10$nnGCKXgp4qJUNx5tyAS6q.8hUr0njXBtCNznkp4AeGXLAXWfps6Vi', '2025-01-22 08:10:50'),
('jimmyaguileralopez@gmail.com', '$2y$10$6Nfz/SgICJ7gkOIM6NcgvugdUTlK.L6vmsT4kmKF.npndGtr256/O', '2025-01-22 11:03:54'),
('shoshtari@hotmail.com', '$2y$10$IXoGVJQFzulIKMKwwsJURuxHgct9ehQnuuVm.qxBoveEcxKZp1SQ6', '2025-01-22 12:11:13'),
('lirysjewelry@gmail.com', '$2y$10$anrFx4x.MEvy11YnxedO2uQdXqny6S19ASwTA.kMcVG3xlQRTYFIi', '2025-01-22 13:41:21'),
('sergiox03@gmail.com', '$2y$10$RVExouC79ADaV6VA/QAbvOX23P.bpJjzahW6E3xmaFcBy6fSXuhDa', '2025-01-22 15:12:50'),
('ronjon719@gmail.com', '$2y$10$VBc9hMvKg6SIH0xcpULVbODmt5T4jCnuv6RR6r.PDJOPBBk.HtqrC', '2025-01-22 18:00:46'),
('pyronn1515@gmail.com', '$2y$10$ENol7zsifeNQtDvkOUHs9OEtbAuYp0fnCS4ZWNQfDdT2zMnmhj8ou', '2025-01-22 18:24:02'),
('jacob@goldkine.com', '$2y$10$lxFqEDkuFKKCXpQCXbTzOenDKssm1BVWGiiRpjTHv0s4ZlU6RGRdS', '2025-01-22 20:54:52'),
('timothykyleyu@gmail.com', '$2y$10$jes5eL5Rah/4otgmxJnVGeKo5U92H1zIpiKz9rKEQx8hQwQUIoa4y', '2025-01-22 23:07:16'),
('alenajwestover@gmail.com', '$2y$10$NiniwgP35V5QSoe4fn8C5eRZQlay6pHlboArg/8pyi8/1/XJgdEKW', '2025-01-23 01:17:16'),
('jjpitenis@gmail.com', '$2y$10$LnjhMM3BFgrfs6PJibbwKe//GXT6uTRqb2qtBQUhAsqFRIOJuCj.O', '2025-01-23 01:25:25'),
('hapkidoguy1973@gmail.com', '$2y$10$662MYdaN59HwCYwBFn/wruIHVPtGaptFnkYf4/T.HZVydrpYyXfqa', '2025-01-23 01:31:09'),
('b-gabe@hotmail.com', '$2y$10$gRuNFjRNJi26s0HqsApWDOvdKjgGJnAvEt41VHRBJZhVymL.0536u', '2025-01-23 01:44:23'),
('tahere.thompson@gmail.com', '$2y$10$6bOUEfTx/elTWEWaRACgu.D5saKA/AjAYg8LgjiyxPcNdwlNe3gpi', '2025-01-23 02:36:22'),
('dm120266@gmail.com', '$2y$10$eZz/gIcrWIiQsky0zDMiRuphobyA.rYIFZ2wYi.ofuDlKgninlVFe', '2025-01-23 02:59:50'),
('lpbarbour@gmail.com', '$2y$10$jqqaMErk4DQc1WfABhly9e/28yP.DioSHnMvhseJk8CED.UnNBhmG', '2025-01-23 09:25:05'),
('rosieanglin@icloud.com', '$2y$10$0OK73V7ETUP5hN85yPOYbeTOMLQv9QNORmolgfGP3fm61a6rMnjLy', '2025-01-23 09:41:21'),
('johnearlgoss2wheels@gmail.com', '$2y$10$ckjnJ5RGy57h/hTwYXR68ukdTj.2ws7Uf4eZ4cWH.xAlejHc.KRVq', '2025-01-23 10:47:28'),
('jesse.lustina@gmail.com', '$2y$10$XayspkoiyGc37bZ.Yy58O.2HzC5EGcv0ixASaLuDHSewIZYlIpCsK', '2025-01-23 11:53:35'),
('cayon2010@gmail.com', '$2y$10$.S2TfvJCRXH0YfmLzKy1se3dmVvwaukunzDnpAlXxHFSzLDAEGxuG', '2025-01-23 12:47:53'),
('uio6645@gmail.com', '$2y$10$JpLuqWts1Xj6GMBjMSpgO.7gcgOk7lhTGJi.inb2CnRuAvdgXZr82', '2025-01-23 15:31:53'),
('jacquear@videotron.ca', '$2y$10$.YjEii5HD7V/U7/HLRiRLexy8pxjrFxCAj/z3eAUv/b1G6BPV.5Y6', '2025-01-23 15:50:00'),
('dispatch@dmntransport.com', '$2y$10$uQNGfO1YhHQu3QO9gv5qneLJoNtTW7FRAp6qErBNr/a2xHpbKeDZ.', '2025-01-23 18:50:58'),
('hungarybunz@gmail.com', '$2y$10$t7Qqi.hNlRwxCOYFkKxIxerYQ6Ltz2qJyJQM296ngKTP871G2vWmC', '2025-01-23 19:35:38'),
('darren.jamail90@gmail.com', '$2y$10$JMHeDLHorK43RCZG6cIB2eKENykRQqCJ0ly3Mls9jxgazyStnH8Am', '2025-01-23 20:34:41'),
('ryanvhill88@gmail.com', '$2y$10$Pl8Ee2Y/ydCuCgH05AZkeeCqss9HOd5Gr7DtEyXqjrA7xdbz1SxKi', '2025-01-23 22:30:50'),
('williaka@cox.net', '$2y$10$1A.r4JpXREBsvUBP9FFVvOLVLnyYkie4psBpg.vkML5iMUu2CoJ02', '2025-01-23 22:32:05'),
('terry.zook@gmail.com', '$2y$10$FUjpYlr4hVz4nA50kwuYW.2h0nFM4Fehoy4oswUiGT97MUMtXB7pa', '2025-01-23 23:25:00'),
('pos02019@gmail.com', '$2y$10$Q51T2p5RQ58KdjvGeNNwYeMozR1LSFXI5cLJmeXAhiH8AqY8r0t62', '2025-01-24 00:44:16'),
('jenebatarawally72@gmail.com', '$2y$10$oCb6I0svTzSLrptJWUgAmufKrcRGkGVm9la1F4.QsOwClQ.zei9g6', '2025-01-24 02:27:23'),
('k.b.estevane@gmail.com', '$2y$10$eHSjHEaTxB/7Vmliym7Uvux4Z12Q92wCHLinkC2HDWESGM6VDSZa2', '2025-01-24 06:31:59'),
('williamcambron6@gmail.com', '$2y$10$XM.Q4OK78TEMZZx0Nowdy.K0Ulz44gCMD0UPw7J48mRGOlLRqFLjS', '2025-01-24 10:43:54'),
('shubham.bangera@sakon.com', '$2y$10$3T0/9PRXxxTUcVkXzyHXUePmhXjh2ZK3MRa3f66ckLuodpPPh4E0C', '2025-01-24 11:45:59'),
('bensonlejou@gmail.com', '$2y$10$2ogSnuL5FWf01XQSDlyOnu15Fv/fkXnEaekI1ZG5PUGfRih2nzxam', '2025-01-24 11:59:13'),
('gloriahill88@gmail.com', '$2y$10$RIBCvoDjdEIShfVmT8RT/OadsKGzV4gjPhSU/oHjLIDEI9ETapf0G', '2025-01-24 13:15:49'),
('dennyturner.drt@gmail.com', '$2y$10$a.sV1WGBeceXUiEIyfscn.WFvah8E8hXdXNhvtqggP9DLOp0F.SA.', '2025-01-24 13:49:02'),
('office@gradivari.com', '$2y$10$N08lO7iZEnBwlaeohIw9decXKOq66YVB2BwxCUmgmc6.tckSNmMGy', '2025-01-24 14:12:36'),
('terriutter1@gmail.com', '$2y$10$8236zhVh9.LCMtscsXUFDuqmCEH4Bruni3TglymUK.E66ucryGZsy', '2025-01-24 14:36:14'),
('topo@fmallard.com', '$2y$10$wdbf7AqjVtWbW6pLKqE7iOP/NJwDbP4OZpZX3Iv18NnAPiQF2NwCi', '2025-01-24 17:57:23'),
('amwilkes007@gmail.com', '$2y$10$y79Kw8YMTcgT0kaqB1QmNOJkcEjaXWALxP9.Za9qT2mbYtnldOKSC', '2025-01-24 18:28:02'),
('brettmo6506@gmail.com', '$2y$10$Kxas3S93z7YWKCh.2OEXwO13.JpQkkbjQXqGWVUVGhfkOVuhPLHCW', '2025-01-24 18:56:34'),
('wasunflwr@gmail.com', '$2y$10$KA9FvHif0QJVmuGEZm2DGekZw2vz35ZcLUF5hfbvi78TDxfAZKU8K', '2025-01-24 19:01:36'),
('melissa.taylor@dynaenergetics.com', '$2y$10$rvFTxegDOmYaOAnycuBoneWqwQWQjjxljF3xu.vGCamiRmoND2gXK', '2025-01-24 19:36:45'),
('cottonf16@gmail.com', '$2y$10$j8OhJx5rKECv1N71dHP3EuGEeuVC0RZ.F5VraObLkmXgtBr.751VO', '2025-01-24 20:20:09'),
('zadygator@gmail.com', '$2y$10$2jPs1D77UHhyZTud.tMTpue3hILPr6YXX85X4H9PC2O0ebwuO.z42', '2025-01-24 22:07:48'),
('joelyjean3@gmail.com', '$2y$10$DFeR/KjyqoAk4LQlSxJcgeYRyNADO1bHQwr48vA0RUddNvF1Mil72', '2025-01-24 23:43:08'),
('zgzjhzxhq@gmail.com', '$2y$10$NtmwFFLyertYwjg5Y4byg.y2JGyffuMWdtmoY8/ijeGbHQgl1Ftzu', '2025-01-25 00:01:24'),
('mgtwiz100@gmail.com', '$2y$10$kQdGPz3Mvitv0wuq9g831.K0HwGxBwLnkIPm3FxPF40XNgaKlp4zi', '2025-01-25 00:10:21'),
('mphelps66@gmail.com', '$2y$10$Bfat.1DQU.0W4aBcCxn6Tu4za8c44W.aczAUTOdnTh5K6TjFW2Y.e', '2025-01-25 02:11:59'),
('dannyroycehenderson@gmail.com', '$2y$10$NmF/J2ekjUTYcMuXNBY4Q.8Nv6oDWwq8kxu7LfKJ7Qy5u1FN9/CB.', '2025-01-25 03:37:54'),
('mljudah@shaw.ca', '$2y$10$Z1IDnDE03/CWjrBez3A0L.b..4AHNwKpnU2PHWQXJLX6KPNtdZB2i', '2025-01-25 06:20:17'),
('radar5827@hotmail.com', '$2y$10$eP.8P6uuFldupG9mxK6hZOM63i/eKkhFgHrKIRSTIoA6ihEzqFfZ2', '2025-01-25 07:17:45'),
('donald.silva@gmail.com', '$2y$10$ENBAckbIejXeXjNK16SHrObOkXT69c0GIuuHCQsbZ5qsBIuC.o5vC', '2025-01-25 12:04:31'),
('guidoarter6@gmail.com', '$2y$10$Ts7shVy6XpP8qrehi6vkTuzk.RQXzHB0aDA/OZQ035bRnwWfg1Q0m', '2025-01-25 12:49:08'),
('dreinert23@gmail.com', '$2y$10$yJKeb3/GKaRjjhgOBVR85eogvP//8Brjrh2UlxBnbM0TlPcgBfbtq', '2025-01-25 14:05:54'),
('dhirenpatel18@gmail.com', '$2y$10$jzVNhBxXMtDlKnJC7xIMXO1Y9lqMV.GhgDb.VfMyiswIWvUqgl/k.', '2025-01-25 14:15:16'),
('info@vdaeae.de', '$2y$10$OYzg8NIBmyDY0OJIVw75A.PkXAa61t1WNODNeo6v3GiAqL72Qw4Ri', '2025-01-25 16:22:35'),
('storylibra@gmail.com', '$2y$10$4vBo00Qmj0tk474As7wGc.1pNjv4lDVKihLuZ1B4fr7crLcY3OiNi', '2025-01-25 16:58:28'),
('marprice99@gmail.com', '$2y$10$W5TA6LhFw4PAtjFAlcLxOuUWZChn/fgLkqy7k4VFOnblfvBrDR7/G', '2025-01-25 21:05:39'),
('tdflagg@gmail.com', '$2y$10$U3ldpohYmS5F1FiTBFop0uLybwC/gEmEIIWsp7ft70xMUHVkEMCDu', '2025-01-25 21:47:30'),
('dhamechaalpa@gmail.com', '$2y$10$J.I8OSa72R8i7eGuvK8rXeBlwFRdTkysFrzRtLEFLMVR0YLaAiitC', '2025-01-25 22:06:39'),
('bil857913@gmail.com', '$2y$10$Br7kNbG6/E3uGT57LOhzQuV8R6tXsiB8G3uscNvyfYzQYF90iGJWe', '2025-01-25 22:14:35'),
('williamzmk@gmail.com', '$2y$10$DvqAsRLYcXH4ZklSm1xTd.0x5lfSd.Ok8oZYf9miB/Oq92iNYkt36', '2025-01-25 22:51:45'),
('sam.ablott1972@gmail.com', '$2y$10$QpfTYi8wvqa0EV/KDV7Q0u.cvppUNeQfuZsI6Zx7duYWSPunnfo7C', '2025-01-25 23:27:30'),
('uaborealiarift@gmail.com', '$2y$10$bifKs8tRrbE7kJ9xtdfXQOaTg8bQwfB35B8nk137Yp98Yxq00HPki', '2025-02-09 06:28:45'),
('dipak.dreamsint@gmail.com', '$2y$10$BJ0YG8htR5os2Ky1tDp06.sEErgjWM95aGC4No1bX/T8xgp8g.5xi', '2025-02-11 10:28:17');

-- --------------------------------------------------------

--
-- Table structure for table `payment_settings`
--

CREATE TABLE `payment_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_settings`
--

INSERT INTO `payment_settings` (`id`, `name`, `value`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'currency', '₹', 1, '2024-02-26 12:16:38', '2025-02-21 13:15:37'),
(2, 'currency_code', 'INR', 1, '2024-02-26 12:16:38', '2025-02-21 13:15:37'),
(3, 'is_manually_enabled', 'on', 1, '2024-02-26 12:16:38', '2025-02-21 13:15:37'),
(4, 'is_bank_tranfer_enabled', 'off', 1, '2024-02-26 12:16:38', '2025-02-21 13:15:37'),
(5, 'enable_stripe', 'on', 1, '2024-02-26 12:16:38', '2025-02-21 13:15:37'),
(6, 'enable_paypal', 'off', 1, '2024-02-26 12:16:38', '2025-02-21 13:15:37'),
(7, 'is_paystack_enabled', 'off', 1, '2024-02-26 12:16:38', '2025-02-21 13:15:37'),
(8, 'is_flutterwave_enabled', 'off', 1, '2024-02-26 12:16:38', '2025-02-21 13:15:37'),
(9, 'is_razorpay_enabled', 'on', 1, '2024-02-26 12:16:38', '2025-02-21 13:15:37'),
(10, 'razorpay_public_key', 'rzp_test_1DSinVDLVKfFuJ', 1, '2024-02-26 12:16:38', '2025-02-21 13:15:37'),
(11, 'razorpay_secret_key', 'ULvCQAVclvzMFEqwQHbqkJVH', 1, '2024-02-26 12:16:38', '2025-02-21 13:15:37'),
(12, 'is_mercado_enabled', 'off', 1, '2024-02-26 12:16:38', '2025-02-21 13:15:37'),
(13, 'is_paytm_enabled', 'off', 1, '2024-02-26 12:16:38', '2025-02-21 13:15:37'),
(14, 'is_mollie_enabled', 'off', 1, '2024-02-26 12:16:38', '2025-02-21 13:15:37'),
(15, 'is_skrill_enabled', 'off', 1, '2024-02-26 12:16:38', '2025-02-21 13:15:37'),
(16, 'is_coingate_enabled', 'off', 1, '2024-02-26 12:16:38', '2025-02-21 13:15:37'),
(17, 'is_paymentwall_enabled', 'off', 1, '2024-02-26 12:16:38', '2025-02-21 13:15:37'),
(18, 'is_toyyibpay_enabled', 'off', 1, '2024-02-26 12:16:38', '2025-02-21 13:15:37'),
(19, 'is_payfast_enabled', 'off', 1, '2024-02-26 12:16:38', '2025-02-21 13:15:37'),
(20, 'is_iyzipay_enabled', 'off', 1, '2024-02-26 12:16:38', '2025-02-21 13:15:37'),
(21, 'is_sspay_enabled', 'off', 1, '2024-02-26 12:16:38', '2025-02-21 13:15:37'),
(22, 'is_paytab_enabled', 'off', 1, '2024-02-26 12:16:38', '2025-02-21 13:15:37'),
(23, 'is_benefit_enabled', 'off', 1, '2024-02-26 12:16:38', '2025-02-21 13:15:37'),
(24, 'is_cashfree_enabled', 'off', 1, '2024-02-26 12:16:38', '2025-02-21 13:15:37'),
(25, 'is_aamarpay_enabled', 'off', 1, '2024-02-26 12:16:38', '2025-02-21 13:15:37'),
(26, 'is_paytr_enabled', 'off', 1, '2024-02-26 12:16:38', '2025-02-21 13:15:37'),
(27, 'is_yookassa_enabled', 'off', 1, '2024-02-26 12:16:38', '2025-02-21 13:15:37'),
(28, 'is_xendit_enabled', 'off', 1, '2024-02-26 12:16:38', '2025-02-21 13:15:37'),
(29, 'is_midtrans_enabled', 'off', 1, '2024-02-26 12:16:38', '2025-02-21 13:15:37'),
(35, 'stripe_key', 'pk_test_51LBgDoBsmz7k2BTD4eYrzmvswQIIm6nNmYTCMNSaMXTGde9ay60iJBP2iZhY2Fg6FM1hjk9BE1fudSWSxe6vxojG00gQN55ihb', 1, '2024-02-27 04:36:50', '2025-02-21 13:15:37'),
(36, 'stripe_secret', 'sk_test_51LBgDoBsmz7k2BTDEu7pmlecAU84RwZhOx869Bz0ujoP4hDpyxePhOsepBYANVNey5W9OmUQ6112dZqzcdq4xRmX00l6OEWd8b', 1, '2024-02-27 04:36:50', '2025-02-21 13:15:37'),
(181, 'is_fedapay_enabled', 'off', 1, '2024-06-04 13:34:17', '2025-02-21 13:15:37'),
(182, 'is_paiementpro_enabled', 'off', 1, '2024-06-04 13:34:17', '2025-02-21 13:15:37'),
(183, 'is_nepalste_enabled', 'off', 1, '2024-06-04 13:34:17', '2025-02-21 13:15:37'),
(184, 'is_payhere_enabled', 'off', 1, '2024-06-04 13:34:17', '2025-02-21 13:15:37'),
(185, 'is_cinetpay_enabled', 'off', 1, '2024-06-04 13:34:17', '2025-02-21 13:15:37'),
(194, 'paypal_mode', 'sandbox', 1, '2024-06-04 13:36:59', '2025-02-19 06:42:36'),
(195, 'paypal_client_id', '', 1, '2024-06-04 13:36:59', '2025-02-19 06:42:36'),
(196, 'paypal_secret_key', '', 1, '2024-06-04 13:36:59', '2025-02-19 06:42:36'),
(225, 'currency', '', 39, '2024-08-16 13:00:55', '2024-08-24 13:24:10'),
(226, 'currency_code', '', 39, '2024-08-16 13:00:55', '2024-08-24 13:24:10'),
(227, 'is_manually_enabled', 'off', 39, '2024-08-16 13:00:55', '2024-08-24 13:24:10'),
(228, 'is_bank_tranfer_enabled', 'on', 39, '2024-08-16 13:00:55', '2024-08-24 13:24:10'),
(229, 'bank_details', 'Bank : HDFE Bank <Pune> Account Number : 1010200301200 <br>.', 39, '2024-08-16 13:00:55', '2024-08-24 13:24:10'),
(230, 'enable_stripe', 'off', 39, '2024-08-16 13:00:55', '2024-08-24 13:24:10'),
(231, 'enable_paypal', 'off', 39, '2024-08-16 13:00:55', '2024-08-24 13:24:10'),
(232, 'is_paystack_enabled', 'off', 39, '2024-08-16 13:00:55', '2024-08-24 13:24:10'),
(233, 'is_flutterwave_enabled', 'off', 39, '2024-08-16 13:00:55', '2024-08-24 13:24:10'),
(234, 'is_razorpay_enabled', 'off', 39, '2024-08-16 13:00:55', '2024-08-24 13:24:10'),
(235, 'is_mercado_enabled', 'off', 39, '2024-08-16 13:00:55', '2024-08-24 13:24:10'),
(236, 'is_paytm_enabled', 'on', 39, '2024-08-16 13:00:55', '2024-08-24 13:24:10'),
(237, 'is_mollie_enabled', 'off', 39, '2024-08-16 13:00:55', '2024-08-24 13:24:10'),
(238, 'is_skrill_enabled', 'off', 39, '2024-08-16 13:00:55', '2024-08-24 13:24:10'),
(239, 'is_coingate_enabled', 'off', 39, '2024-08-16 13:00:55', '2024-08-24 13:24:10'),
(240, 'is_paymentwall_enabled', 'off', 39, '2024-08-16 13:00:55', '2024-08-24 13:24:10'),
(241, 'is_toyyibpay_enabled', 'off', 39, '2024-08-16 13:00:55', '2024-08-24 13:24:10'),
(242, 'is_payfast_enabled', 'off', 39, '2024-08-16 13:00:55', '2024-08-24 13:24:10'),
(243, 'is_iyzipay_enabled', 'off', 39, '2024-08-16 13:00:55', '2024-08-24 13:24:10'),
(244, 'is_sspay_enabled', 'off', 39, '2024-08-16 13:00:55', '2024-08-24 13:24:10'),
(245, 'is_paytab_enabled', 'off', 39, '2024-08-16 13:00:55', '2024-08-24 13:24:10'),
(246, 'is_benefit_enabled', 'off', 39, '2024-08-16 13:00:55', '2024-08-24 13:24:10'),
(247, 'is_cashfree_enabled', 'off', 39, '2024-08-16 13:00:55', '2024-08-24 13:24:10'),
(248, 'is_aamarpay_enabled', 'off', 39, '2024-08-16 13:00:55', '2024-08-24 13:24:10'),
(249, 'is_paytr_enabled', 'off', 39, '2024-08-16 13:00:55', '2024-08-24 13:24:10'),
(250, 'is_yookassa_enabled', 'off', 39, '2024-08-16 13:00:55', '2024-08-24 13:24:10'),
(251, 'is_xendit_enabled', 'off', 39, '2024-08-16 13:00:55', '2024-08-24 13:24:10'),
(252, 'is_midtrans_enabled', 'off', 39, '2024-08-16 13:00:55', '2024-08-24 13:24:10'),
(253, 'is_fedapay_enabled', 'off', 39, '2024-08-16 13:00:55', '2024-08-24 13:24:10'),
(254, 'is_paiementpro_enabled', 'off', 39, '2024-08-16 13:00:55', '2024-08-24 13:24:10'),
(255, 'is_nepalste_enabled', 'off', 39, '2024-08-16 13:00:55', '2024-08-24 13:24:10'),
(256, 'is_payhere_enabled', 'off', 39, '2024-08-16 13:00:55', '2024-08-24 13:24:10'),
(257, 'is_cinetpay_enabled', 'off', 39, '2024-08-16 13:00:55', '2024-08-24 13:24:10'),
(336, 'paytm_mode', 'local', 39, '2024-08-24 13:20:14', '2024-08-24 13:24:10'),
(337, 'paytm_merchant_id', 'nick', 39, '2024-08-24 13:20:14', '2024-08-24 13:24:10'),
(338, 'paytm_merchant_key', 'nick', 39, '2024-08-24 13:20:14', '2024-08-24 13:24:10'),
(339, 'paytm_industry_type', 'IT', 39, '2024-08-24 13:20:14', '2024-08-24 13:24:10'),
(437, 'currency', '', 48, '2024-10-01 12:51:04', '2025-02-14 08:31:47'),
(438, 'currency_code', '', 48, '2024-10-01 12:51:04', '2025-02-14 08:31:47'),
(439, 'is_manually_enabled', 'off', 48, '2024-10-01 12:51:04', '2025-02-14 08:31:47'),
(440, 'is_bank_tranfer_enabled', 'on', 48, '2024-10-01 12:51:04', '2025-02-14 08:31:47'),
(441, 'enable_stripe', 'on', 48, '2024-10-01 12:51:04', '2025-02-14 08:31:47'),
(442, 'stripe_key', 'pk_test_51QDkRLFdFy2cpAS6oZmgbM8YZpIn8Ao2GAyczqz4bw9Ge236jBQlSyCSxKZFi45m4viJuiF044xSzhSQpqEy3k9I00DibP45Vm', 48, '2024-10-01 12:51:04', '2025-02-14 08:31:47'),
(443, 'stripe_secret', 'sk_test_51QDkRLFdFy2cpAS6QspqMgJFBzr1xHnbqseAvDxoZ7L4n1fCAaeCEXDg622N2k32p7EAtt5WTYZ8JftejlpjeDuV00eGZ32Xgf', 48, '2024-10-01 12:51:04', '2025-02-14 08:31:47'),
(444, 'enable_paypal', 'off', 48, '2024-10-01 12:51:04', '2025-02-14 08:31:47'),
(445, 'is_paystack_enabled', 'off', 48, '2024-10-01 12:51:04', '2025-02-14 08:31:47'),
(446, 'is_flutterwave_enabled', 'off', 48, '2024-10-01 12:51:04', '2025-02-14 08:31:47'),
(447, 'is_razorpay_enabled', 'on', 48, '2024-10-01 12:51:04', '2025-02-14 08:31:47'),
(448, 'is_mercado_enabled', 'off', 48, '2024-10-01 12:51:04', '2025-02-14 08:31:47'),
(449, 'is_paytm_enabled', 'off', 48, '2024-10-01 12:51:04', '2025-02-14 08:31:47'),
(450, 'is_mollie_enabled', 'off', 48, '2024-10-01 12:51:04', '2025-02-14 08:31:47'),
(451, 'is_skrill_enabled', 'off', 48, '2024-10-01 12:51:04', '2025-02-14 08:31:47'),
(452, 'is_coingate_enabled', 'off', 48, '2024-10-01 12:51:04', '2025-02-14 08:31:47'),
(453, 'is_paymentwall_enabled', 'off', 48, '2024-10-01 12:51:04', '2025-02-14 08:31:47'),
(454, 'is_toyyibpay_enabled', 'off', 48, '2024-10-01 12:51:04', '2025-02-14 08:31:47'),
(455, 'is_payfast_enabled', 'off', 48, '2024-10-01 12:51:04', '2025-02-14 08:31:47'),
(456, 'is_iyzipay_enabled', 'off', 48, '2024-10-01 12:51:04', '2025-02-14 08:31:47'),
(457, 'is_sspay_enabled', 'off', 48, '2024-10-01 12:51:04', '2025-02-14 08:31:47'),
(458, 'is_paytab_enabled', 'off', 48, '2024-10-01 12:51:04', '2025-02-14 08:31:47'),
(459, 'is_benefit_enabled', 'off', 48, '2024-10-01 12:51:04', '2025-02-14 08:31:47'),
(460, 'is_cashfree_enabled', 'off', 48, '2024-10-01 12:51:04', '2025-02-14 08:31:47'),
(461, 'is_aamarpay_enabled', 'off', 48, '2024-10-01 12:51:04', '2025-02-14 08:31:47'),
(462, 'is_paytr_enabled', 'off', 48, '2024-10-01 12:51:04', '2025-02-14 08:31:47'),
(463, 'is_yookassa_enabled', 'off', 48, '2024-10-01 12:51:04', '2025-02-14 08:31:47'),
(464, 'is_xendit_enabled', 'off', 48, '2024-10-01 12:51:04', '2025-02-14 08:31:47'),
(465, 'is_midtrans_enabled', 'off', 48, '2024-10-01 12:51:04', '2025-02-14 08:31:47'),
(466, 'is_fedapay_enabled', 'off', 48, '2024-10-01 12:51:04', '2025-02-14 08:31:47'),
(467, 'is_paiementpro_enabled', 'off', 48, '2024-10-01 12:51:04', '2025-02-14 08:31:47'),
(468, 'is_nepalste_enabled', 'off', 48, '2024-10-01 12:51:04', '2025-02-14 08:31:47'),
(469, 'is_payhere_enabled', 'off', 48, '2024-10-01 12:51:04', '2025-02-14 08:31:47'),
(470, 'is_cinetpay_enabled', 'off', 48, '2024-10-01 12:51:04', '2025-02-14 08:31:47'),
(553, 'bank_details', 'Bank : Indus Bank\r\nAccount Number : 3512 2563 14578\r\nIFSC Code: INDUS0021', 1, '2025-02-10 05:43:17', '2025-02-10 06:04:51'),
(562, 'paystack_public_key', 'pk_test_057dfe5dee14eaf9c3b4573df1e3760c02c06e38', 1, '2025-02-10 05:43:17', '2025-02-10 06:04:51'),
(563, 'paystack_secret_key', 'sk_test_77cb93329abbdc18104466e694c9f720a7d69c97', 1, '2025-02-10 05:43:17', '2025-02-10 06:04:51'),
(565, 'flutterwave_public_key', 'FLWPUBK_TEST-f448f625c416f69a7c08fc6028ebebbf-X', 1, '2025-02-10 05:43:17', '2025-02-10 06:04:51'),
(566, 'flutterwave_secret_key', 'FLWSECK_TEST-561fa94f45fc758339b1e54b393f3178-X', 1, '2025-02-10 05:43:17', '2025-02-10 06:04:51'),
(945, 'paypal_mode', 'sandbox', 48, '2025-02-14 08:15:42', '2025-02-14 08:17:33'),
(946, 'paypal_client_id', 'AWlV5x8Lhj9BRF8-TnawXtbNs-zt69mMVXME1BGJUIoDdrAYz8QIeeTBQp0sc2nIL9E529KJZys32Ipy', 48, '2025-02-14 08:15:42', '2025-02-14 08:17:33'),
(947, 'paypal_secret_key', 'EEvn1J_oIC6alxb-FoF4t8buKwy4uEWHJ4_Jd_wolaSPRMzFHe6GrMrliZAtawDDuE-WKkCKpWGiz0Yn', 48, '2025-02-14 08:15:42', '2025-02-14 08:17:33'),
(951, 'razorpay_public_key', 'rzp_test_1DSinVDLVKfFuJ', 48, '2025-02-14 08:15:42', '2025-02-14 08:31:47'),
(952, 'razorpay_secret_key', 'ULvCQAVclvzMFEqwQHbqkJVH', 48, '2025-02-14 08:15:42', '2025-02-14 08:31:47'),
(980, 'bank_details', 'Bank : Bank Name \r\nAccount Number : 0000 0000.', 48, '2025-02-14 08:17:33', '2025-02-14 08:31:47'),
(1053, 'currency', '', 365, '2025-02-14 11:49:27', '2025-02-14 11:49:27'),
(1054, 'currency_code', '', 365, '2025-02-14 11:49:27', '2025-02-14 11:49:27'),
(1055, 'is_manually_enabled', 'off', 365, '2025-02-14 11:49:27', '2025-02-14 11:49:27'),
(1056, 'is_bank_tranfer_enabled', 'off', 365, '2025-02-14 11:49:27', '2025-02-14 11:49:27'),
(1057, 'enable_stripe', 'on', 365, '2025-02-14 11:49:27', '2025-02-14 11:49:27'),
(1058, 'stripe_key', 'sk_test_51QDkRLFdFy2cpAS6QspqMgJFBzr1xHnbqseAvDxoZ7L4n1fCAaeCEXDg622N2k32p7EAtt5WTYZ8JftejlpjeDuV00eGZ32Xgf', 365, '2025-02-14 11:49:27', '2025-02-14 11:49:27'),
(1059, 'stripe_secret', 'pk_test_51QDkRLFdFy2cpAS6oZmgbM8YZpIn8Ao2GAyczqz4bw9Ge236jBQlSyCSxKZFi45m4viJuiF044xSzhSQpqEy3k9I00DibP45Vm', 365, '2025-02-14 11:49:27', '2025-02-14 11:49:27'),
(1060, 'enable_paypal', 'off', 365, '2025-02-14 11:49:27', '2025-02-14 11:49:27'),
(1061, 'is_paystack_enabled', 'off', 365, '2025-02-14 11:49:27', '2025-02-14 11:49:27'),
(1062, 'is_flutterwave_enabled', 'off', 365, '2025-02-14 11:49:27', '2025-02-14 11:49:27'),
(1063, 'is_razorpay_enabled', 'on', 365, '2025-02-14 11:49:27', '2025-02-14 11:49:27'),
(1064, 'razorpay_public_key', 'rzp_test_1DSinVDLVKfFuJ', 365, '2025-02-14 11:49:27', '2025-02-14 11:49:27'),
(1065, 'razorpay_secret_key', 'ULvCQAVclvzMFEqwQHbqkJVH', 365, '2025-02-14 11:49:27', '2025-02-14 11:49:27'),
(1066, 'is_mercado_enabled', 'off', 365, '2025-02-14 11:49:27', '2025-02-14 11:49:27'),
(1067, 'is_paytm_enabled', 'off', 365, '2025-02-14 11:49:27', '2025-02-14 11:49:27'),
(1068, 'is_mollie_enabled', 'off', 365, '2025-02-14 11:49:27', '2025-02-14 11:49:27'),
(1069, 'is_skrill_enabled', 'off', 365, '2025-02-14 11:49:27', '2025-02-14 11:49:27'),
(1070, 'is_coingate_enabled', 'off', 365, '2025-02-14 11:49:27', '2025-02-14 11:49:27'),
(1071, 'is_paymentwall_enabled', 'off', 365, '2025-02-14 11:49:27', '2025-02-14 11:49:27'),
(1072, 'is_toyyibpay_enabled', 'off', 365, '2025-02-14 11:49:27', '2025-02-14 11:49:27'),
(1073, 'is_payfast_enabled', 'off', 365, '2025-02-14 11:49:27', '2025-02-14 11:49:27'),
(1074, 'is_iyzipay_enabled', 'off', 365, '2025-02-14 11:49:27', '2025-02-14 11:49:27'),
(1075, 'is_sspay_enabled', 'off', 365, '2025-02-14 11:49:27', '2025-02-14 11:49:27'),
(1076, 'is_paytab_enabled', 'off', 365, '2025-02-14 11:49:27', '2025-02-14 11:49:27'),
(1077, 'is_benefit_enabled', 'off', 365, '2025-02-14 11:49:27', '2025-02-14 11:49:27'),
(1078, 'is_cashfree_enabled', 'off', 365, '2025-02-14 11:49:27', '2025-02-14 11:49:27'),
(1079, 'is_aamarpay_enabled', 'off', 365, '2025-02-14 11:49:27', '2025-02-14 11:49:27'),
(1080, 'is_paytr_enabled', 'off', 365, '2025-02-14 11:49:27', '2025-02-14 11:49:27'),
(1081, 'is_yookassa_enabled', 'off', 365, '2025-02-14 11:49:27', '2025-02-14 11:49:27'),
(1082, 'is_xendit_enabled', 'off', 365, '2025-02-14 11:49:27', '2025-02-14 11:49:27'),
(1083, 'is_midtrans_enabled', 'off', 365, '2025-02-14 11:49:27', '2025-02-14 11:49:27'),
(1084, 'is_fedapay_enabled', 'off', 365, '2025-02-14 11:49:27', '2025-02-14 11:49:27'),
(1085, 'is_paiementpro_enabled', 'off', 365, '2025-02-14 11:49:27', '2025-02-14 11:49:27'),
(1086, 'is_nepalste_enabled', 'off', 365, '2025-02-14 11:49:27', '2025-02-14 11:49:27'),
(1087, 'is_payhere_enabled', 'off', 365, '2025-02-14 11:49:27', '2025-02-14 11:49:27'),
(1088, 'is_cinetpay_enabled', 'off', 365, '2025-02-14 11:49:27', '2025-02-14 11:49:27');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `storage_limit` double(8,2) NOT NULL DEFAULT '0.00',
  `monthly_price` decimal(30,2) NOT NULL DEFAULT '0.00',
  `annual_price` decimal(30,2) NOT NULL DEFAULT '0.00',
  `status` int(10) NOT NULL DEFAULT '0',
  `enable_chatgpt` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'off',
  `trial_days` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_users` int(11) NOT NULL DEFAULT '0',
  `max_projects` int(11) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `name`, `storage_limit`, `monthly_price`, `annual_price`, `status`, `enable_chatgpt`, `trial_days`, `max_users`, `max_projects`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Free Plan', 100.00, 0.00, 0.00, 1, 'off', '', 30, 10, 'Free plan', '2024-02-26 12:05:54', '2025-02-19 11:58:04'),
(2, 'Silver', 500.00, 199.00, 1990.00, 1, 'on', '15', 100, 50, 'Silver Plan', '2024-02-26 12:21:59', '2025-02-22 12:25:44'),
(3, 'Gold', 1024.00, 499.00, 4990.00, 1, 'on', '10', 200, 100, 'Gold Plan', '2024-02-28 06:32:02', '2025-02-22 12:26:05'),
(7, 'Platinum', 2024.00, 999.00, 9990.00, 1, 'on', '5', -1, -1, 'Platinum Plan', '2024-12-03 10:41:32', '2025-02-22 12:26:13'),
(8, 'n plan', 100.00, 110.00, 500.00, 0, 'off', '24', 19, 15, 'desc', '2025-03-05 05:42:27', '2025-03-05 05:42:27');

-- --------------------------------------------------------

--
-- Table structure for table `plan_requests`
--

CREATE TABLE `plan_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `duration` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'monthly',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `budget` int(11) NOT NULL DEFAULT '0',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '$',
  `currency_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USD',
  `currency_position` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pre',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `is_active` int(11) NOT NULL DEFAULT '0',
  `descriptions` text COLLATE utf8mb4_unicode_ci,
  `project_progress` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `progress` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `task_progress` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'true',
  `tags` text COLLATE utf8mb4_unicode_ci,
  `estimated_hrs` int(11) NOT NULL DEFAULT '0',
  `copylinksetting` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `title`, `image`, `status`, `budget`, `start_date`, `end_date`, `password`, `currency`, `currency_code`, `currency_position`, `created_by`, `is_active`, `descriptions`, `project_progress`, `progress`, `task_progress`, `tags`, `estimated_hrs`, `copylinksetting`, `created_at`, `updated_at`) VALUES
(1, 'SAAS Projects', NULL, 'in_progress', 250000, '2023-12-10', '2024-05-10', NULL, '₹', 'INR', 'pre', 6, 1, '', 'false', '0', 'true', '', 1000, '{\"member\":\"on\",\"milestone\":\"off\",\"basic_details\":\"on\",\"activity\":\"off\",\"attachment\":\"on\",\"bug_report\":\"on\",\"task\":\"off\",\"tracker_details\":\"off\",\"timesheet\":\"off\" ,\"password_protected\":\"off\"}', '2024-04-10 07:46:29', '2024-04-10 07:47:43'),
(2, 'Testing1', 'projects/1715241867.png', 'in_progress', 5000, '2024-05-09', '2024-06-30', NULL, '₹', 'INR', 'post', 9, 1, 'test', 'true', '85', 'false', 'fake', 5, '{\"basic_details\":\"on\",\"member\":\"on\",\"milestone\":\"off\",\"activity\":\"off\",\"attachment\":\"on\",\"bug_report\":\"off\",\"task\":\"on\",\"tracker_details\":\"off\",\"timesheet\":\"off\",\"password_protected\":\"off\"}', '2024-05-09 08:04:27', '2024-06-07 06:17:54'),
(3, 'task magix', 'projects/1716448710.png', 'on_hold', 11, '2024-05-23', '2024-05-23', NULL, '$', 'AUD', 'pre', 13, 1, 'sA 564ew45 rgh sfg rtyrt fbsfghrt rth', 'false', '0', 'true', '', 5, '{\"basic_details\":\"on\",\"member\":\"on\",\"milestone\":\"on\",\"activity\":\"on\",\"attachment\":\"on\",\"bug_report\":\"off\",\"task\":\"on\",\"tracker_details\":\"on\",\"timesheet\":\"on\",\"password_protected\":\"off\"}', '2024-05-23 07:18:30', '2024-06-03 10:16:10'),
(4, 'task magix', 'projects/1716448710.png', 'on_hold', 11, '2024-05-23', '2024-05-23', NULL, '$', 'AUD', 'pre', 13, 1, 'sA 564ew45 rgh sfg rtyrt fbsfghrt rth', 'false', '0', 'true', '', 5, '{\"basic_details\":\"on\",\"member\":\"on\",\"milestone\":\"off\",\"activity\":\"off\",\"attachment\":\"on\",\"bug_report\":\"off\",\"task\":\"on\",\"tracker_details\":\"on\",\"timesheet\":\"on\",\"password_protected\":\"off\"}', '2024-05-23 08:09:11', '2024-06-03 10:20:34'),
(5, 'magix', 'projects/1717594785.jpg', 'in_progress', 10, '2024-05-23', '2024-05-23', 'ZGlzaGExMjM=', '$', 'ARS', 'pre', 13, 1, 'fefwx vf wef wefw e', 'true', '28', 'true', 'sdfwe wefwe ef,efwefwf', 3, '{\"basic_details\":\"on\",\"member\":\"on\",\"milestone\":\"on\",\"activity\":\"on\",\"attachment\":\"on\",\"bug_report\":\"off\",\"task\":\"on\",\"tracker_details\":\"on\",\"timesheet\":\"on\",\"password_protected\":\"on\"}', '2024-05-23 09:38:18', '2024-06-05 13:39:46'),
(6, 'demo', 'projects/1717412970.png', 'on_hold', 50000, '2024-06-03', '2024-06-07', NULL, '₹', 'INR', 'pre', 18, 1, 'fsgsgsgsgsgsgsgsgsgsgsg', 'false', '0', 'true', 'tst', 10, '{\"member\":\"on\",\"milestone\":\"off\",\"basic_details\":\"on\",\"activity\":\"off\",\"attachment\":\"on\",\"bug_report\":\"on\",\"task\":\"off\",\"tracker_details\":\"off\",\"timesheet\":\"off\" ,\"password_protected\":\"off\"}', '2024-06-03 11:09:30', '2024-06-03 11:09:30'),
(7, 'testing', 'projects/1717501924.png', 'on_hold', 50000, '2024-06-04', '0001-01-01', NULL, '₹', 'INR', 'pre', 19, 1, 'ghghfghgh', 'true', '75', 'true', '', 10, '{\"basic_details\":\"on\",\"member\":\"on\",\"milestone\":\"off\",\"activity\":\"off\",\"attachment\":\"on\",\"bug_report\":\"off\",\"task\":\"on\",\"tracker_details\":\"off\",\"timesheet\":\"off\",\"password_protected\":\"off\"}', '2024-06-04 11:52:04', '2024-06-04 12:15:52'),
(8, 'Customer', NULL, 'on_hold', 0, '2022-03-22', '2023-03-22', NULL, 'Optio reiciendis no', 'USD', 'pre', 13, 1, 'Quis ut nihil cumque', 'false', '0', 'true', 'Esse laborum Eos m', 12, NULL, '2024-06-06 05:25:13', '2024-06-06 05:25:13'),
(9, 'hfhg', NULL, 'on_hold', 100, '2024-06-06', '0001-01-01', NULL, 'Lek', 'ALL', 'pre', 13, 1, 'jbjk', 'false', '0', 'true', '', 5, '{\"member\":\"on\",\"milestone\":\"off\",\"basic_details\":\"on\",\"activity\":\"off\",\"attachment\":\"on\",\"bug_report\":\"on\",\"task\":\"off\",\"tracker_details\":\"off\",\"timesheet\":\"off\" ,\"password_protected\":\"off\"}', '2024-06-06 08:06:08', '2024-06-06 08:06:08'),
(10, 'Project_@002', 'projects/1720503770.png', 'complete', 0, '2024-07-01', '2024-07-03', NULL, '$', 'AUD', 'pre', 33, 1, 'It addresses the problem that initiated the project and the desired goals and objectives. But it doesn\'t have to stop there.', 'false', '0', 'true', 'Project_@001,project_@001', 0, '{\"member\":\"on\",\"milestone\":\"off\",\"basic_details\":\"on\",\"activity\":\"off\",\"attachment\":\"on\",\"bug_report\":\"on\",\"task\":\"off\",\"tracker_details\":\"off\",\"timesheet\":\"off\" ,\"password_protected\":\"off\"}', '2024-07-09 05:42:50', '2024-07-09 06:52:59'),
(11, 'Project_@001', 'projects/1720503770.png', 'on_hold', 0, '2024-07-01', '2024-07-03', NULL, '$', 'AUD', 'pre', 33, 1, 'It addresses the problem that initiated the project and the desired goals and objectives. But it doesn\'t have to stop there.', 'false', '0', 'true', 'Project_@001,project_@001', 0, '{\"member\":\"on\",\"milestone\":\"off\",\"basic_details\":\"on\",\"activity\":\"off\",\"attachment\":\"on\",\"bug_report\":\"on\",\"task\":\"off\",\"tracker_details\":\"off\",\"timesheet\":\"off\" ,\"password_protected\":\"off\"}', '2024-07-09 06:51:44', '2024-07-09 06:51:44'),
(27, 'P1', 'projects/1721362715.png', 'complete', 500, '2024-07-16', '2024-07-22', NULL, '$', 'AUD', 'pre', 35, 1, '', 'false', '0', 'true', 'ABC,XYZ', 5, '{\"member\":\"on\",\"milestone\":\"off\",\"basic_details\":\"on\",\"activity\":\"off\",\"attachment\":\"on\",\"bug_report\":\"on\",\"task\":\"off\",\"tracker_details\":\"off\",\"timesheet\":\"off\" ,\"password_protected\":\"off\"}', '2024-07-19 04:18:35', '2024-07-22 07:42:22'),
(28, 'P2', 'projects/1721367272.png', 'on_hold', 1000, '2024-07-19', '2024-07-19', NULL, '8', 'ALL', 'pre', 35, 1, '', 'false', '0', 'true', '', 2, '{\"member\":\"on\",\"milestone\":\"off\",\"basic_details\":\"on\",\"activity\":\"off\",\"attachment\":\"on\",\"bug_report\":\"on\",\"task\":\"off\",\"tracker_details\":\"off\",\"timesheet\":\"off\" ,\"password_protected\":\"off\"}', '2024-07-19 05:34:32', '2024-07-19 06:20:38'),
(29, 'P3', NULL, 'on_hold', 5, '2024-07-19', '2024-07-19', NULL, 'Lek', 'ALL', 'pre', 35, 1, '', 'false', '0', 'true', '', 1, '{\"member\":\"on\",\"milestone\":\"off\",\"basic_details\":\"on\",\"activity\":\"off\",\"attachment\":\"on\",\"bug_report\":\"on\",\"task\":\"off\",\"tracker_details\":\"off\",\"timesheet\":\"off\" ,\"password_protected\":\"off\"}', '2024-07-19 07:25:42', '2024-07-19 07:25:42'),
(31, 'P4', NULL, 'on_hold', 10, '2024-07-19', '2024-07-19', 'MTI0NTY3OA==', 'Lek', 'ALL', 'pre', 35, 1, '', 'false', '0', 'true', '', 2, '{\"basic_details\":\"on\",\"member\":\"on\",\"milestone\":\"on\",\"activity\":\"on\",\"attachment\":\"on\",\"bug_report\":\"off\",\"task\":\"on\",\"tracker_details\":\"on\",\"timesheet\":\"on\",\"password_protected\":\"on\"}', '2024-07-19 07:43:57', '2024-07-19 07:44:55'),
(32, 'P3', NULL, 'on_hold', 100, '2024-07-19', '2024-07-19', NULL, '2', 'ALL', 'pre', 39, 1, '', 'true', '68', 'true', '', 100, '{\"basic_details\":\"on\",\"member\":\"on\",\"milestone\":\"on\",\"activity\":\"on\",\"attachment\":\"on\",\"bug_report\":\"off\",\"task\":\"on\",\"tracker_details\":\"on\",\"timesheet\":\"on\",\"password_protected\":\"off\"}', '2024-07-19 07:51:02', '2024-10-09 11:59:02'),
(33, 'Samrudhhi mahamargh', 'projects/1721892477.png', 'in_progress', 1000000, '2017-02-07', '2024-07-25', NULL, 'Rupee', 'ALL', 'pre', 45, 1, '', 'false', '0', 'true', 'No more budget', 100000, '{\"basic_details\":\"on\",\"member\":\"on\",\"milestone\":\"on\",\"activity\":\"on\",\"attachment\":\"on\",\"bug_report\":\"off\",\"task\":\"on\",\"tracker_details\":\"on\",\"timesheet\":\"on\",\"password_protected\":\"off\"}', '2024-07-25 07:26:45', '2024-07-26 12:47:46'),
(69, 'ewre', NULL, 'on_hold', 0, '2024-09-04', '2024-09-04', NULL, 'Lek', 'ALL', 'pre', 49, 1, '', 'false', '0', 'true', '', 0, '{\"member\":\"on\",\"milestone\":\"off\",\"basic_details\":\"on\",\"activity\":\"off\",\"attachment\":\"on\",\"bug_report\":\"on\",\"task\":\"off\",\"tracker_details\":\"off\",\"timesheet\":\"off\" ,\"password_protected\":\"off\"}', '2024-09-04 10:23:14', '2024-09-04 10:23:14'),
(70, 'Header', 'projects/1727527740.png', 'on_hold', 0, '2024-09-05', '2024-09-06', NULL, '₹', 'INR', 'pre', 49, 1, 'demo', 'false', '0', 'true', '', 11, '{\"member\":\"on\",\"milestone\":\"off\",\"basic_details\":\"on\",\"activity\":\"off\",\"attachment\":\"on\",\"bug_report\":\"on\",\"task\":\"off\",\"tracker_details\":\"off\",\"timesheet\":\"off\" ,\"password_protected\":\"off\"}', '2024-09-05 10:30:54', '2024-09-28 12:49:00'),
(76, 'Testing1', 'projects/1715241867.png', 'in_progress', 5000, '2024-05-09', '2024-06-30', NULL, '₹', 'INR', 'post', 9, 1, 'test', 'true', '85', 'false', 'fake', 5, '{\"basic_details\":\"on\",\"member\":\"on\",\"milestone\":\"off\",\"activity\":\"off\",\"attachment\":\"on\",\"bug_report\":\"off\",\"task\":\"on\",\"tracker_details\":\"off\",\"timesheet\":\"off\",\"password_protected\":\"off\"}', '2024-09-30 07:31:25', '2024-09-30 07:31:25'),
(83, 'sad', NULL, 'on_hold', 4, '2024-10-01', '2024-10-01', NULL, 'Lek', 'ALL', 'pre', 9, 1, '', 'false', '0', 'true', '', 23, '{\"member\":\"on\",\"milestone\":\"off\",\"basic_details\":\"on\",\"activity\":\"off\",\"attachment\":\"on\",\"bug_report\":\"on\",\"task\":\"off\",\"tracker_details\":\"off\",\"timesheet\":\"off\" ,\"password_protected\":\"off\"}', '2024-10-01 07:27:01', '2024-10-01 07:27:01'),
(84, 'TaskMagix new', 'projects/1733219405.png', 'in_progress', 789, '2024-10-01', '2025-04-30', NULL, '₹', 'INR', 'pre', 48, 1, '', 'true', '94', 'true', '', 78, '{\"basic_details\":\"on\",\"member\":\"on\",\"milestone\":\"on\",\"activity\":\"on\",\"attachment\":\"on\",\"bug_report\":\"off\",\"task\":\"on\",\"tracker_details\":\"on\",\"timesheet\":\"on\",\"password_protected\":\"off\"}', '2024-10-01 09:48:40', '2025-02-15 08:11:17'),
(85, 'rdgrfg', 'projects/1727780925.jpg', 'on_hold', 45, '2024-10-01', '2024-10-01', NULL, 'Lek', 'ALL', 'pre', 48, 1, 'fd', 'true', '17', 'true', '', 45, '{\"member\":\"on\",\"milestone\":\"off\",\"basic_details\":\"on\",\"activity\":\"off\",\"attachment\":\"on\",\"bug_report\":\"on\",\"task\":\"off\",\"tracker_details\":\"off\",\"timesheet\":\"off\" ,\"password_protected\":\"off\"}', '2024-10-01 11:08:45', '2024-10-01 12:08:33'),
(87, 'Customer', NULL, 'on_hold', 0, '2022-03-22', '2023-03-22', NULL, 'Optio reiciendis no', 'USD', 'pre', 48, 1, 'Quis ut nihil cumque', 'false', '0', 'true', 'Esse laborum Eos m', 12, NULL, '2024-10-01 12:26:10', '2024-10-01 12:26:10'),
(88, 'fgfghfg', NULL, 'on_hold', 56, '2024-10-01', '2024-10-01', NULL, 'Lek', 'ALL', 'pre', 48, 1, '', 'false', '0', 'true', '', 545, '{\"member\":\"on\",\"milestone\":\"off\",\"basic_details\":\"on\",\"activity\":\"off\",\"attachment\":\"on\",\"bug_report\":\"on\",\"task\":\"off\",\"tracker_details\":\"off\",\"timesheet\":\"off\" ,\"password_protected\":\"off\"}', '2024-10-01 13:59:54', '2024-10-01 13:59:54'),
(91, 'P2', 'projects/1721373979.png', 'on_hold', 100, '2024-07-19', '2024-07-19', NULL, 'Lek', 'ALL', 'pre', 39, 1, '', 'true', '24', 'false', '', 100, '{\"member\":\"on\",\"milestone\":\"off\",\"basic_details\":\"on\",\"activity\":\"off\",\"attachment\":\"on\",\"bug_report\":\"on\",\"task\":\"off\",\"tracker_details\":\"off\",\"timesheet\":\"off\" ,\"password_protected\":\"off\"}', '2024-10-09 13:16:59', '2024-10-09 13:16:59'),
(95, 'P5', NULL, 'on_hold', 100, '2024-10-09', '2024-10-09', NULL, 'Lek', 'ALL', 'pre', 39, 1, '', 'false', '0', 'true', '', 100, '{\"member\":\"on\",\"milestone\":\"off\",\"basic_details\":\"on\",\"activity\":\"off\",\"attachment\":\"on\",\"bug_report\":\"on\",\"task\":\"off\",\"tracker_details\":\"off\",\"timesheet\":\"off\" ,\"password_protected\":\"off\"}', '2024-10-09 13:26:21', '2024-10-09 13:26:21'),
(100, 'Mega project', 'projects/1721288915.png', 'complete', 10000000, '2021-01-18', '2024-08-22', NULL, '₹', 'INR', 'pre', 39, 1, 'Ambitious project', 'false', '94', 'true', '', 10, '{\"basic_details\":\"on\",\"member\":\"on\",\"milestone\":\"on\",\"activity\":\"on\",\"attachment\":\"on\",\"bug_report\":\"off\",\"task\":\"on\",\"tracker_details\":\"on\",\"timesheet\":\"on\",\"password_protected\":\"on\"}', '2024-10-10 06:20:33', '2024-10-10 06:20:33'),
(103, 'Customer', NULL, 'on_hold', 0, '2022-03-22', '2023-03-22', NULL, 'Optio reiciendis no', 'USD', 'pre', 39, 1, 'Quis ut nihil cumque', 'false', '0', 'true', 'Esse laborum Eos m', 12, NULL, '2024-10-10 07:12:00', '2024-10-10 07:12:00'),
(104, 'Demo project', NULL, 'in_progress', 0, '2024-11-25', '2024-11-28', NULL, 'R', 'Rupee', 'post', 62, 1, '', 'true', '12', 'true', 'Java,c,c++', 101, '{\"basic_details\":\"on\",\"member\":\"on\",\"milestone\":\"off\",\"activity\":\"off\",\"attachment\":\"on\",\"bug_report\":\"off\",\"task\":\"off\",\"tracker_details\":\"off\",\"timesheet\":\"off\",\"password_protected\":\"off\"}', '2024-11-25 06:26:05', '2024-12-03 10:10:52'),
(106, 'test project', 'projects/1733212805.png', 'on_hold', 10000, '2024-12-03', '2024-12-26', NULL, '$', 'BMD', 'pre', 48, 1, 'This is a test project', 'true', '21', 'true', '', 124, '{\"basic_details\":\"on\",\"member\":\"on\",\"milestone\":\"off\",\"activity\":\"off\",\"attachment\":\"on\",\"bug_report\":\"off\",\"task\":\"off\",\"tracker_details\":\"off\",\"timesheet\":\"off\",\"password_protected\":\"off\"}', '2024-12-03 08:00:05', '2024-12-03 08:26:35'),
(107, 'P1', NULL, 'on_hold', 0, '2024-12-03', '2024-12-03', NULL, 'Lek', 'ALL', 'pre', 62, 1, '', 'false', '0', 'true', '', 0, '{\"member\":\"on\",\"milestone\":\"off\",\"basic_details\":\"on\",\"activity\":\"off\",\"attachment\":\"on\",\"bug_report\":\"on\",\"task\":\"off\",\"tracker_details\":\"off\",\"timesheet\":\"off\" ,\"password_protected\":\"off\"}', '2024-12-03 10:10:17', '2024-12-03 10:10:17'),
(108, 'hoighg', NULL, 'on_hold', 646, '2025-02-08', '2025-02-08', NULL, 'Lek', 'ALL', 'pre', 364, 1, 'fhih hfg hioho', 'false', '0', 'true', '', 66, '{\"member\":\"on\",\"milestone\":\"off\",\"basic_details\":\"on\",\"activity\":\"off\",\"attachment\":\"on\",\"bug_report\":\"on\",\"task\":\"off\",\"tracker_details\":\"off\",\"timesheet\":\"off\" ,\"password_protected\":\"off\"}', '2025-02-08 08:20:33', '2025-02-08 08:20:33'),
(109, 'zxcxcc', NULL, 'on_hold', 166, '2025-02-08', '2025-02-08', NULL, '₹', 'INR', 'pre', 364, 1, '654646', 'false', '0', 'true', '', 4646, '{\"member\":\"on\",\"milestone\":\"off\",\"basic_details\":\"on\",\"activity\":\"off\",\"attachment\":\"on\",\"bug_report\":\"on\",\"task\":\"off\",\"tracker_details\":\"off\",\"timesheet\":\"off\" ,\"password_protected\":\"off\"}', '2025-02-08 08:27:15', '2025-02-13 11:02:36'),
(110, 'SaaS ERP Project', 'projects/1739009746.png', 'in_progress', 50000, '2025-02-08', '2025-02-28', 'RGlwYWtAMTIzNA==', '₹', 'INR', 'pre', 48, 1, 'This is an ERP SaaS project.', 'false', '0', 'true', 'ERP,SaaS Project', 0, '{\"basic_details\":\"on\",\"member\":\"on\",\"milestone\":\"on\",\"activity\":\"on\",\"attachment\":\"on\",\"bug_report\":\"off\",\"task\":\"on\",\"tracker_details\":\"on\",\"timesheet\":\"on\",\"password_protected\":\"on\"}', '2025-02-08 10:15:47', '2025-02-08 10:24:50'),
(111, 'Customer', NULL, 'on_hold', 0, '2022-03-22', '2023-03-22', NULL, 'Optio reiciendis no', 'USD', 'pre', 48, 1, 'Quis ut nihil cumque', 'false', '0', 'true', 'Esse laborum Eos m', 12, NULL, '2025-02-10 07:03:40', '2025-02-10 07:03:40'),
(112, 'Test Project', 'projects/1739185894.png', 'on_hold', 20000, '2025-02-10', '2025-02-28', NULL, '₹', 'INR', 'pre', 48, 1, 'This is a python project.', 'false', '0', 'true', 'python,python project', 200, '{\"member\":\"on\",\"milestone\":\"off\",\"basic_details\":\"on\",\"activity\":\"off\",\"attachment\":\"on\",\"bug_report\":\"on\",\"task\":\"off\",\"tracker_details\":\"off\",\"timesheet\":\"off\" ,\"password_protected\":\"off\"}', '2025-02-10 11:11:34', '2025-02-10 11:11:34'),
(113, 'all user common project', NULL, 'on_hold', 5000, '2025-02-14', '2025-02-28', NULL, '₹', 'INR', 'pre', 364, 1, 'This is common user project.', 'false', '0', 'true', '', 200, '{\"member\":\"on\",\"milestone\":\"off\",\"basic_details\":\"on\",\"activity\":\"off\",\"attachment\":\"on\",\"bug_report\":\"on\",\"task\":\"off\",\"tracker_details\":\"off\",\"timesheet\":\"off\" ,\"password_protected\":\"off\"}', '2025-02-14 06:08:08', '2025-02-14 06:08:08'),
(114, 'New Pro', NULL, 'on_hold', 6000, '2025-02-14', '2025-06-30', NULL, '₹', 'INR', 'pre', 48, 1, 'This is a pro project.', 'false', '0', 'true', '', 1200, '{\"member\":\"on\",\"milestone\":\"off\",\"basic_details\":\"on\",\"activity\":\"off\",\"attachment\":\"on\",\"bug_report\":\"on\",\"task\":\"off\",\"tracker_details\":\"off\",\"timesheet\":\"off\" ,\"password_protected\":\"off\"}', '2025-02-14 07:37:18', '2025-02-14 07:37:18'),
(115, 'Sanjivani Project', NULL, 'on_hold', 2000, '2025-02-14', '2025-02-28', NULL, '₹', 'INR', 'pre', 48, 1, 'This is a Sanjivani project.', 'false', '0', 'true', 'Sanjani', 2000, '{\"member\":\"on\",\"milestone\":\"off\",\"basic_details\":\"on\",\"activity\":\"off\",\"attachment\":\"on\",\"bug_report\":\"on\",\"task\":\"off\",\"tracker_details\":\"off\",\"timesheet\":\"off\" ,\"password_protected\":\"off\"}', '2025-02-14 10:53:22', '2025-02-14 10:53:22'),
(116, 'My Project 95', NULL, 'on_hold', 1, '2025-02-14', '2025-04-30', NULL, '₹', 'INR', 'pre', 48, 1, 'This is a test project.', 'false', '0', 'true', '', 1, '{\"member\":\"on\",\"milestone\":\"off\",\"basic_details\":\"on\",\"activity\":\"off\",\"attachment\":\"on\",\"bug_report\":\"on\",\"task\":\"off\",\"tracker_details\":\"off\",\"timesheet\":\"off\" ,\"password_protected\":\"off\"}', '2025-02-14 11:02:14', '2025-02-14 11:02:14'),
(117, 'Mini Project', NULL, 'on_hold', 2, '2025-02-14', '2025-02-28', NULL, '₹', 'INR', 'pre', 48, 1, '', 'false', '0', 'true', '', 2, '{\"member\":\"on\",\"milestone\":\"off\",\"basic_details\":\"on\",\"activity\":\"off\",\"attachment\":\"on\",\"bug_report\":\"on\",\"task\":\"off\",\"tracker_details\":\"off\",\"timesheet\":\"off\" ,\"password_protected\":\"off\"}', '2025-02-14 11:05:15', '2025-02-14 11:05:15'),
(119, 'Dipakstone project', NULL, 'on_hold', 5000, '2025-02-14', '2025-02-28', NULL, '₹', 'INR', 'pre', 48, 1, '', 'false', '0', 'true', '', 200, '{\"member\":\"on\",\"milestone\":\"off\",\"basic_details\":\"on\",\"activity\":\"off\",\"attachment\":\"on\",\"bug_report\":\"on\",\"task\":\"off\",\"tracker_details\":\"off\",\"timesheet\":\"off\" ,\"password_protected\":\"off\"}', '2025-02-14 11:40:04', '2025-02-14 11:40:04'),
(120, 'new', 'projects/1741259526.png', 'on_hold', 0, '2025-03-06', '2025-03-23', NULL, 'Lek', 'ALL', 'pre', 2, 1, 'desc', 'false', '0', 'true', '', 1, '{\"member\":\"on\",\"milestone\":\"off\",\"basic_details\":\"on\",\"activity\":\"off\",\"attachment\":\"on\",\"bug_report\":\"on\",\"task\":\"off\",\"tracker_details\":\"off\",\"timesheet\":\"off\" ,\"password_protected\":\"off\"}', '2025-03-06 11:12:06', '2025-03-06 11:12:06'),
(121, 'task', 'projects/1744879705.png', 'in_progress', 0, '2025-04-17', '2025-04-17', NULL, 'Lek', 'ALL', 'pre', 398, 1, 'assaasassaasassaasassaas', 'false', '0', 'true', '', 0, '{\"member\":\"on\",\"milestone\":\"off\",\"basic_details\":\"on\",\"activity\":\"off\",\"attachment\":\"on\",\"bug_report\":\"on\",\"task\":\"off\",\"tracker_details\":\"off\",\"timesheet\":\"off\" ,\"password_protected\":\"off\"}', '2025-04-17 08:48:25', '2025-04-17 08:55:36'),
(122, 'test123', 'projects/1744965677.png', 'on_hold', 20000, '2025-04-18', '2025-04-18', NULL, 'Lek', 'ALL', 'pre', 400, 1, 'testing', 'false', '0', 'true', '', 2, '{\"member\":\"on\",\"milestone\":\"off\",\"basic_details\":\"on\",\"activity\":\"off\",\"attachment\":\"on\",\"bug_report\":\"on\",\"task\":\"off\",\"tracker_details\":\"off\",\"timesheet\":\"off\" ,\"password_protected\":\"off\"}', '2025-04-18 08:41:17', '2025-04-18 08:41:17'),
(124, 'Test1234', 'projects/1745036347.png', 'in_progress', 8, '2025-04-19', '2025-04-19', NULL, 'Lek', 'ALL', 'pre', 400, 1, '', 'false', '0', 'true', '', 9, '{\"basic_details\":\"on\",\"member\":\"on\",\"milestone\":\"off\",\"activity\":\"off\",\"attachment\":\"on\",\"bug_report\":\"off\",\"task\":\"off\",\"tracker_details\":\"off\",\"timesheet\":\"off\",\"password_protected\":\"off\"}', '2025-04-19 04:19:07', '2025-04-24 04:14:47'),
(125, 'y', NULL, 'on_hold', 0, '2025-04-24', '2025-04-24', NULL, 'Lek', 'ALL', 'pre', 400, 1, '', 'false', '0', 'true', '', 0, '{\"member\":\"on\",\"milestone\":\"off\",\"basic_details\":\"on\",\"activity\":\"off\",\"attachment\":\"on\",\"bug_report\":\"on\",\"task\":\"off\",\"tracker_details\":\"off\",\"timesheet\":\"off\" ,\"password_protected\":\"off\"}', '2025-04-24 04:37:57', '2025-04-24 04:37:57'),
(126, 'a', NULL, 'on_hold', 0, '2025-04-24', '2025-04-24', NULL, 'Lek', 'ALL', 'pre', 400, 1, '', 'false', '0', 'true', '', 0, '{\"member\":\"on\",\"milestone\":\"off\",\"basic_details\":\"on\",\"activity\":\"off\",\"attachment\":\"on\",\"bug_report\":\"on\",\"task\":\"off\",\"tracker_details\":\"off\",\"timesheet\":\"off\" ,\"password_protected\":\"off\"}', '2025-04-24 04:38:09', '2025-04-24 04:38:09'),
(127, 'b', NULL, 'on_hold', 0, '2025-04-24', '2025-04-24', NULL, 'Lek', 'ALL', 'pre', 400, 1, '', 'false', '0', 'true', '', 0, '{\"member\":\"on\",\"milestone\":\"off\",\"basic_details\":\"on\",\"activity\":\"off\",\"attachment\":\"on\",\"bug_report\":\"on\",\"task\":\"off\",\"tracker_details\":\"off\",\"timesheet\":\"off\" ,\"password_protected\":\"off\"}', '2025-04-24 04:38:19', '2025-04-24 04:38:19'),
(128, 'c', NULL, 'on_hold', 0, '2025-04-24', '2025-04-24', NULL, 'Lek', 'ALL', 'pre', 400, 1, '', 'false', '0', 'true', '', 0, '{\"member\":\"on\",\"milestone\":\"off\",\"basic_details\":\"on\",\"activity\":\"off\",\"attachment\":\"on\",\"bug_report\":\"on\",\"task\":\"off\",\"tracker_details\":\"off\",\"timesheet\":\"off\" ,\"password_protected\":\"off\"}', '2025-04-24 04:38:30', '2025-04-24 04:38:30'),
(129, 'd', NULL, 'on_hold', 0, '2025-04-24', '2025-04-24', NULL, 'Lek', 'ALL', 'pre', 400, 1, '', 'false', '0', 'true', '', 0, '{\"member\":\"on\",\"milestone\":\"off\",\"basic_details\":\"on\",\"activity\":\"off\",\"attachment\":\"on\",\"bug_report\":\"on\",\"task\":\"off\",\"tracker_details\":\"off\",\"timesheet\":\"off\" ,\"password_protected\":\"off\"}', '2025-04-24 04:38:40', '2025-04-24 04:38:40'),
(130, 'e', NULL, 'on_hold', 0, '2025-04-24', '2025-04-24', NULL, 'Lek', 'ALL', 'pre', 400, 1, '', 'false', '0', 'true', '', 0, '{\"member\":\"on\",\"milestone\":\"off\",\"basic_details\":\"on\",\"activity\":\"off\",\"attachment\":\"on\",\"bug_report\":\"on\",\"task\":\"off\",\"tracker_details\":\"off\",\"timesheet\":\"off\" ,\"password_protected\":\"off\"}', '2025-04-24 04:38:51', '2025-04-24 04:38:51'),
(131, 'f', NULL, 'on_hold', 0, '2025-04-24', '2025-04-24', NULL, 'Lek', 'ALL', 'pre', 400, 1, '', 'false', '0', 'true', '', 0, '{\"member\":\"on\",\"milestone\":\"off\",\"basic_details\":\"on\",\"activity\":\"off\",\"attachment\":\"on\",\"bug_report\":\"on\",\"task\":\"off\",\"tracker_details\":\"off\",\"timesheet\":\"off\" ,\"password_protected\":\"off\"}', '2025-04-24 04:39:10', '2025-04-24 04:39:10'),
(132, 'f', NULL, 'on_hold', 0, '2025-04-24', '2025-04-24', NULL, 'Lek', 'ALL', 'pre', 400, 1, '', 'false', '0', 'true', '', 0, '{\"member\":\"on\",\"milestone\":\"off\",\"basic_details\":\"on\",\"activity\":\"off\",\"attachment\":\"on\",\"bug_report\":\"on\",\"task\":\"off\",\"tracker_details\":\"off\",\"timesheet\":\"off\" ,\"password_protected\":\"off\"}', '2025-04-24 04:39:11', '2025-04-24 04:39:11'),
(133, 'f', NULL, 'on_hold', 0, '2025-04-24', '2025-04-24', NULL, 'Lek', 'ALL', 'pre', 400, 1, '', 'false', '0', 'true', '', 0, '{\"member\":\"on\",\"milestone\":\"off\",\"basic_details\":\"on\",\"activity\":\"off\",\"attachment\":\"on\",\"bug_report\":\"on\",\"task\":\"off\",\"tracker_details\":\"off\",\"timesheet\":\"off\" ,\"password_protected\":\"off\"}', '2025-04-24 04:39:14', '2025-04-24 04:39:14'),
(134, 'g', NULL, 'on_hold', 0, '2025-04-24', '2025-04-24', NULL, 'Lek', 'ALL', 'pre', 400, 1, '', 'false', '0', 'true', '', 0, '{\"member\":\"on\",\"milestone\":\"off\",\"basic_details\":\"on\",\"activity\":\"off\",\"attachment\":\"on\",\"bug_report\":\"on\",\"task\":\"off\",\"tracker_details\":\"off\",\"timesheet\":\"off\" ,\"password_protected\":\"off\"}', '2025-04-24 04:39:23', '2025-04-24 04:39:23'),
(135, 'h', NULL, 'on_hold', 0, '2025-04-24', '2025-04-24', NULL, 'Lek', 'ALL', 'pre', 400, 1, '', 'false', '0', 'true', '', 0, '{\"member\":\"on\",\"milestone\":\"off\",\"basic_details\":\"on\",\"activity\":\"off\",\"attachment\":\"on\",\"bug_report\":\"on\",\"task\":\"off\",\"tracker_details\":\"off\",\"timesheet\":\"off\" ,\"password_protected\":\"off\"}', '2025-04-24 04:39:34', '2025-04-24 04:39:34'),
(136, 'h', NULL, 'on_hold', 0, '2025-04-24', '2025-04-24', NULL, 'Lek', 'ALL', 'pre', 400, 1, '', 'false', '0', 'true', '', 0, '{\"member\":\"on\",\"milestone\":\"off\",\"basic_details\":\"on\",\"activity\":\"off\",\"attachment\":\"on\",\"bug_report\":\"on\",\"task\":\"off\",\"tracker_details\":\"off\",\"timesheet\":\"off\" ,\"password_protected\":\"off\"}', '2025-04-24 04:39:36', '2025-04-24 04:39:36');

-- --------------------------------------------------------

--
-- Table structure for table `project_email_templates`
--

CREATE TABLE `project_email_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `template_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_email_templates`
--

INSERT INTO `project_email_templates` (`id`, `template_id`, `project_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2024-04-10 07:46:29', '2024-04-10 07:46:29'),
(2, 2, 1, 1, '2024-04-10 07:46:29', '2024-04-10 07:46:29'),
(3, 3, 1, 1, '2024-04-10 07:46:29', '2024-04-10 07:46:29'),
(4, 4, 1, 1, '2024-04-10 07:46:29', '2024-04-10 07:46:29'),
(5, 5, 1, 1, '2024-04-10 07:46:29', '2024-04-10 07:46:29'),
(6, 1, 2, 1, '2024-05-09 08:04:27', '2024-05-09 08:04:27'),
(7, 2, 2, 1, '2024-05-09 08:04:27', '2024-05-09 08:04:27'),
(8, 3, 2, 1, '2024-05-09 08:04:27', '2024-05-09 08:04:27'),
(9, 4, 2, 1, '2024-05-09 08:04:27', '2024-05-09 08:04:27'),
(10, 5, 2, 1, '2024-05-09 08:04:27', '2024-05-09 08:04:27'),
(11, 1, 3, 1, '2024-05-23 07:18:30', '2024-05-23 07:18:30'),
(12, 2, 3, 1, '2024-05-23 07:18:30', '2024-05-23 07:18:30'),
(13, 3, 3, 1, '2024-05-23 07:18:30', '2024-05-23 07:18:30'),
(14, 4, 3, 1, '2024-05-23 07:18:30', '2024-05-23 07:18:30'),
(15, 5, 3, 1, '2024-05-23 07:18:30', '2024-05-23 07:18:30'),
(16, 1, 4, 1, '2024-05-23 08:09:11', '2024-05-23 08:09:11'),
(17, 2, 4, 1, '2024-05-23 08:09:11', '2024-05-23 08:09:11'),
(18, 3, 4, 1, '2024-05-23 08:09:11', '2024-05-23 08:09:11'),
(19, 4, 4, 1, '2024-05-23 08:09:11', '2024-05-23 08:09:11'),
(20, 5, 4, 1, '2024-05-23 08:09:11', '2024-05-23 08:09:11'),
(21, 1, 5, 1, '2024-05-23 09:38:18', '2024-05-23 09:38:18'),
(22, 2, 5, 1, '2024-05-23 09:38:18', '2024-05-23 09:38:18'),
(23, 3, 5, 1, '2024-05-23 09:38:18', '2024-05-23 09:38:18'),
(24, 4, 5, 1, '2024-05-23 09:38:18', '2024-05-23 09:38:18'),
(25, 5, 5, 1, '2024-05-23 09:38:18', '2024-05-23 09:38:18'),
(26, 1, 6, 1, '2024-06-03 11:09:30', '2024-06-03 11:09:30'),
(27, 2, 6, 1, '2024-06-03 11:09:30', '2024-06-03 11:09:30'),
(28, 3, 6, 1, '2024-06-03 11:09:30', '2024-06-03 11:09:30'),
(29, 4, 6, 1, '2024-06-03 11:09:30', '2024-06-03 11:09:30'),
(30, 5, 6, 1, '2024-06-03 11:09:30', '2024-06-03 11:09:30'),
(31, 1, 7, 1, '2024-06-04 11:52:04', '2024-06-04 11:52:04'),
(32, 2, 7, 1, '2024-06-04 11:52:04', '2024-06-04 11:52:04'),
(33, 3, 7, 1, '2024-06-04 11:52:04', '2024-06-04 11:52:04'),
(34, 4, 7, 1, '2024-06-04 11:52:04', '2024-06-04 11:52:04'),
(35, 5, 7, 1, '2024-06-04 11:52:04', '2024-06-04 11:52:04'),
(36, 1, 8, 1, '2024-06-06 05:25:13', '2024-06-06 05:25:13'),
(37, 2, 8, 1, '2024-06-06 05:25:13', '2024-06-06 05:25:13'),
(38, 3, 8, 1, '2024-06-06 05:25:13', '2024-06-06 05:25:13'),
(39, 4, 8, 1, '2024-06-06 05:25:13', '2024-06-06 05:25:13'),
(40, 5, 8, 1, '2024-06-06 05:25:13', '2024-06-06 05:25:13'),
(41, 1, 9, 1, '2024-06-06 08:06:08', '2024-06-06 08:06:08'),
(42, 2, 9, 1, '2024-06-06 08:06:08', '2024-06-06 08:06:08'),
(43, 3, 9, 1, '2024-06-06 08:06:08', '2024-06-06 08:06:08'),
(44, 4, 9, 1, '2024-06-06 08:06:08', '2024-06-06 08:06:08'),
(45, 5, 9, 1, '2024-06-06 08:06:08', '2024-06-06 08:06:08'),
(46, 1, 10, 1, '2024-07-09 05:42:50', '2024-07-09 05:42:50'),
(47, 2, 10, 1, '2024-07-09 05:42:50', '2024-07-09 05:42:50'),
(48, 3, 10, 1, '2024-07-09 05:42:50', '2024-07-09 05:42:50'),
(49, 4, 10, 1, '2024-07-09 05:42:50', '2024-07-09 05:42:50'),
(50, 5, 10, 1, '2024-07-09 05:42:50', '2024-07-09 05:42:50'),
(51, 1, 11, 1, '2024-07-09 06:51:44', '2024-07-09 06:51:44'),
(52, 2, 11, 1, '2024-07-09 06:51:44', '2024-07-09 06:51:44'),
(53, 3, 11, 1, '2024-07-09 06:51:44', '2024-07-09 06:51:44'),
(54, 4, 11, 1, '2024-07-09 06:51:44', '2024-07-09 06:51:44'),
(55, 5, 11, 1, '2024-07-09 06:51:44', '2024-07-09 06:51:44'),
(56, 1, 12, 1, '2024-07-17 10:56:56', '2024-07-17 10:56:56'),
(57, 2, 12, 1, '2024-07-17 10:56:56', '2024-07-17 10:56:56'),
(58, 3, 12, 1, '2024-07-17 10:56:56', '2024-07-17 10:56:56'),
(59, 4, 12, 1, '2024-07-17 10:56:56', '2024-07-17 10:56:56'),
(60, 5, 12, 1, '2024-07-17 10:56:56', '2024-07-17 10:56:56'),
(61, 1, 13, 1, '2024-07-17 11:06:46', '2024-07-17 11:06:46'),
(62, 2, 13, 1, '2024-07-17 11:06:46', '2024-07-17 11:06:46'),
(63, 3, 13, 1, '2024-07-17 11:06:46', '2024-07-17 11:06:46'),
(64, 4, 13, 1, '2024-07-17 11:06:46', '2024-07-17 11:06:46'),
(65, 5, 13, 1, '2024-07-17 11:06:46', '2024-07-17 11:06:46'),
(66, 1, 14, 1, '2024-07-17 11:35:14', '2024-07-17 11:35:14'),
(67, 2, 14, 1, '2024-07-17 11:35:14', '2024-07-17 11:35:14'),
(68, 3, 14, 1, '2024-07-17 11:35:14', '2024-07-17 11:35:14'),
(69, 4, 14, 1, '2024-07-17 11:35:14', '2024-07-17 11:35:14'),
(70, 5, 14, 1, '2024-07-17 11:35:14', '2024-07-17 11:35:14'),
(71, 1, 15, 1, '2024-07-18 04:53:33', '2024-07-18 04:53:33'),
(72, 2, 15, 1, '2024-07-18 04:53:33', '2024-07-18 04:53:33'),
(73, 3, 15, 1, '2024-07-18 04:53:33', '2024-07-18 04:53:33'),
(74, 4, 15, 1, '2024-07-18 04:53:33', '2024-07-18 04:53:33'),
(75, 5, 15, 1, '2024-07-18 04:53:33', '2024-07-18 04:53:33'),
(76, 1, 16, 1, '2024-07-18 07:48:35', '2024-07-18 07:48:35'),
(77, 2, 16, 1, '2024-07-18 07:48:35', '2024-07-18 07:48:35'),
(78, 3, 16, 1, '2024-07-18 07:48:35', '2024-07-18 07:48:35'),
(79, 4, 16, 1, '2024-07-18 07:48:35', '2024-07-18 07:48:35'),
(80, 5, 16, 1, '2024-07-18 07:48:35', '2024-07-18 07:48:35'),
(81, 1, 17, 1, '2024-07-18 10:05:04', '2024-07-18 10:05:04'),
(82, 2, 17, 1, '2024-07-18 10:05:04', '2024-07-18 10:05:04'),
(83, 3, 17, 1, '2024-07-18 10:05:04', '2024-07-18 10:05:04'),
(84, 4, 17, 1, '2024-07-18 10:05:04', '2024-07-18 10:05:04'),
(85, 5, 17, 1, '2024-07-18 10:05:04', '2024-07-18 10:05:04'),
(86, 1, 18, 1, '2024-07-18 10:32:56', '2024-07-18 10:32:56'),
(87, 2, 18, 1, '2024-07-18 10:32:56', '2024-07-18 10:32:56'),
(88, 3, 18, 1, '2024-07-18 10:32:56', '2024-07-18 10:32:56'),
(89, 4, 18, 1, '2024-07-18 10:32:56', '2024-07-18 10:32:56'),
(90, 5, 18, 1, '2024-07-18 10:32:56', '2024-07-18 10:32:56'),
(91, 1, 19, 1, '2024-07-18 10:33:06', '2024-07-18 10:33:06'),
(92, 2, 19, 1, '2024-07-18 10:33:06', '2024-07-18 10:33:06'),
(93, 3, 19, 1, '2024-07-18 10:33:06', '2024-07-18 10:33:06'),
(94, 4, 19, 1, '2024-07-18 10:33:06', '2024-07-18 10:33:06'),
(95, 5, 19, 1, '2024-07-18 10:33:06', '2024-07-18 10:33:06'),
(96, 1, 20, 1, '2024-07-18 11:02:56', '2024-07-18 11:02:56'),
(97, 2, 20, 1, '2024-07-18 11:02:56', '2024-07-18 11:02:56'),
(98, 3, 20, 1, '2024-07-18 11:02:56', '2024-07-18 11:02:56'),
(99, 4, 20, 1, '2024-07-18 11:02:56', '2024-07-18 11:02:56'),
(100, 5, 20, 1, '2024-07-18 11:02:56', '2024-07-18 11:02:56'),
(101, 1, 21, 1, '2024-07-18 11:10:22', '2024-07-18 11:10:22'),
(102, 2, 21, 1, '2024-07-18 11:10:22', '2024-07-18 11:10:22'),
(103, 3, 21, 1, '2024-07-18 11:10:22', '2024-07-18 11:10:22'),
(104, 4, 21, 1, '2024-07-18 11:10:22', '2024-07-18 11:10:22'),
(105, 5, 21, 1, '2024-07-18 11:10:22', '2024-07-18 11:10:22'),
(106, 1, 22, 1, '2024-07-18 11:41:50', '2024-07-18 11:41:50'),
(107, 2, 22, 1, '2024-07-18 11:41:50', '2024-07-18 11:41:50'),
(108, 3, 22, 1, '2024-07-18 11:41:50', '2024-07-18 11:41:50'),
(109, 4, 22, 1, '2024-07-18 11:41:50', '2024-07-18 11:41:50'),
(110, 5, 22, 1, '2024-07-18 11:41:50', '2024-07-18 11:41:50'),
(111, 1, 23, 1, '2024-07-18 11:51:21', '2024-07-18 11:51:21'),
(112, 2, 23, 1, '2024-07-18 11:51:21', '2024-07-18 11:51:21'),
(113, 3, 23, 1, '2024-07-18 11:51:21', '2024-07-18 11:51:21'),
(114, 4, 23, 1, '2024-07-18 11:51:21', '2024-07-18 11:51:21'),
(115, 5, 23, 1, '2024-07-18 11:51:21', '2024-07-18 11:51:21'),
(116, 1, 24, 1, '2024-07-18 11:56:56', '2024-07-18 11:56:56'),
(117, 2, 24, 1, '2024-07-18 11:56:56', '2024-07-18 11:56:56'),
(118, 3, 24, 1, '2024-07-18 11:56:56', '2024-07-18 11:56:56'),
(119, 4, 24, 1, '2024-07-18 11:56:56', '2024-07-18 11:56:56'),
(120, 5, 24, 1, '2024-07-18 11:56:56', '2024-07-18 11:56:56'),
(121, 1, 25, 1, '2024-07-18 12:03:33', '2024-07-18 12:03:33'),
(122, 2, 25, 1, '2024-07-18 12:03:33', '2024-07-18 12:03:33'),
(123, 3, 25, 1, '2024-07-18 12:03:33', '2024-07-18 12:03:33'),
(124, 4, 25, 1, '2024-07-18 12:03:33', '2024-07-18 12:03:33'),
(125, 5, 25, 1, '2024-07-18 12:03:33', '2024-07-18 12:03:33'),
(126, 1, 26, 1, '2024-07-18 12:16:38', '2024-07-18 12:16:38'),
(127, 2, 26, 1, '2024-07-18 12:16:38', '2024-07-18 12:16:38'),
(128, 3, 26, 1, '2024-07-18 12:16:38', '2024-07-18 12:16:38'),
(129, 4, 26, 1, '2024-07-18 12:16:38', '2024-07-18 12:16:38'),
(130, 5, 26, 1, '2024-07-18 12:16:38', '2024-07-18 12:16:38'),
(131, 1, 27, 1, '2024-07-19 04:18:35', '2024-07-19 04:18:35'),
(132, 2, 27, 1, '2024-07-19 04:18:35', '2024-07-19 04:18:35'),
(133, 3, 27, 1, '2024-07-19 04:18:35', '2024-07-19 04:18:35'),
(134, 4, 27, 1, '2024-07-19 04:18:35', '2024-07-19 04:18:35'),
(135, 5, 27, 1, '2024-07-19 04:18:35', '2024-07-19 04:18:35'),
(136, 1, 28, 1, '2024-07-19 05:34:32', '2024-07-19 05:34:32'),
(137, 2, 28, 1, '2024-07-19 05:34:32', '2024-07-19 05:34:32'),
(138, 3, 28, 1, '2024-07-19 05:34:32', '2024-07-19 05:34:32'),
(139, 4, 28, 1, '2024-07-19 05:34:32', '2024-07-19 05:34:32'),
(140, 5, 28, 1, '2024-07-19 05:34:32', '2024-07-19 05:34:32'),
(141, 1, 29, 1, '2024-07-19 07:25:42', '2024-07-19 07:25:42'),
(142, 2, 29, 1, '2024-07-19 07:25:42', '2024-07-19 07:25:42'),
(143, 3, 29, 1, '2024-07-19 07:25:42', '2024-07-19 07:25:42'),
(144, 4, 29, 1, '2024-07-19 07:25:42', '2024-07-19 07:25:42'),
(145, 5, 29, 1, '2024-07-19 07:25:42', '2024-07-19 07:25:42'),
(146, 1, 30, 1, '2024-07-19 07:26:19', '2024-07-19 07:26:19'),
(147, 2, 30, 1, '2024-07-19 07:26:19', '2024-07-19 07:26:19'),
(148, 3, 30, 1, '2024-07-19 07:26:19', '2024-07-19 07:26:19'),
(149, 4, 30, 1, '2024-07-19 07:26:19', '2024-07-19 07:26:19'),
(150, 5, 30, 1, '2024-07-19 07:26:19', '2024-07-19 07:26:19'),
(151, 1, 31, 1, '2024-07-19 07:43:57', '2024-07-19 07:43:57'),
(152, 2, 31, 1, '2024-07-19 07:43:57', '2024-07-19 07:43:57'),
(153, 3, 31, 1, '2024-07-19 07:43:57', '2024-07-19 07:43:57'),
(154, 4, 31, 1, '2024-07-19 07:43:57', '2024-07-19 07:43:57'),
(155, 5, 31, 1, '2024-07-19 07:43:57', '2024-07-19 07:43:57'),
(156, 1, 32, 1, '2024-07-19 07:51:02', '2024-07-19 07:51:02'),
(157, 2, 32, 1, '2024-07-19 07:51:02', '2024-07-19 07:51:02'),
(158, 3, 32, 1, '2024-07-19 07:51:02', '2024-07-19 07:51:02'),
(159, 4, 32, 1, '2024-07-19 07:51:02', '2024-07-19 07:51:02'),
(160, 5, 32, 1, '2024-07-19 07:51:02', '2024-07-19 07:51:02'),
(161, 1, 33, 1, '2024-07-25 07:26:45', '2024-07-25 07:26:45'),
(162, 2, 33, 1, '2024-07-25 07:26:45', '2024-07-25 07:26:45'),
(163, 3, 33, 1, '2024-07-25 07:26:45', '2024-07-25 07:26:45'),
(164, 4, 33, 1, '2024-07-25 07:26:45', '2024-07-25 07:26:45'),
(165, 5, 33, 1, '2024-07-25 07:26:45', '2024-07-25 07:26:45'),
(166, 1, 34, 1, '2024-07-26 07:30:59', '2024-07-26 07:30:59'),
(167, 2, 34, 1, '2024-07-26 07:30:59', '2024-07-26 07:30:59'),
(168, 3, 34, 1, '2024-07-26 07:30:59', '2024-07-26 07:30:59'),
(169, 4, 34, 1, '2024-07-26 07:30:59', '2024-07-26 07:30:59'),
(170, 5, 34, 1, '2024-07-26 07:30:59', '2024-07-26 07:30:59'),
(171, 1, 35, 1, '2024-07-26 07:46:06', '2024-07-26 07:46:06'),
(172, 2, 35, 1, '2024-07-26 07:46:06', '2024-07-26 07:46:06'),
(173, 3, 35, 1, '2024-07-26 07:46:06', '2024-07-26 07:46:06'),
(174, 4, 35, 1, '2024-07-26 07:46:06', '2024-07-26 07:46:06'),
(175, 5, 35, 1, '2024-07-26 07:46:06', '2024-07-26 07:46:06'),
(176, 1, 36, 1, '2024-07-26 07:48:54', '2024-07-26 07:48:54'),
(177, 2, 36, 1, '2024-07-26 07:48:54', '2024-07-26 07:48:54'),
(178, 3, 36, 1, '2024-07-26 07:48:54', '2024-07-26 07:48:54'),
(179, 4, 36, 1, '2024-07-26 07:48:54', '2024-07-26 07:48:54'),
(180, 5, 36, 1, '2024-07-26 07:48:54', '2024-07-26 07:48:54'),
(181, 1, 37, 1, '2024-07-26 11:25:36', '2024-07-26 11:25:36'),
(182, 2, 37, 1, '2024-07-26 11:25:36', '2024-07-26 11:25:36'),
(183, 3, 37, 1, '2024-07-26 11:25:36', '2024-07-26 11:25:36'),
(184, 4, 37, 1, '2024-07-26 11:25:36', '2024-07-26 11:25:36'),
(185, 5, 37, 0, '2024-07-26 11:25:36', '2024-07-27 06:49:37'),
(186, 1, 38, 1, '2024-07-27 10:12:18', '2024-07-27 10:12:18'),
(187, 2, 38, 1, '2024-07-27 10:12:18', '2024-07-27 10:12:18'),
(188, 3, 38, 1, '2024-07-27 10:12:18', '2024-07-27 10:12:18'),
(189, 4, 38, 1, '2024-07-27 10:12:18', '2024-07-27 10:12:18'),
(190, 5, 38, 1, '2024-07-27 10:12:18', '2024-07-27 10:12:18'),
(191, 1, 39, 1, '2024-07-29 07:39:40', '2024-07-29 07:39:40'),
(192, 2, 39, 1, '2024-07-29 07:39:40', '2024-07-29 07:39:40'),
(193, 3, 39, 1, '2024-07-29 07:39:40', '2024-07-29 07:39:40'),
(194, 4, 39, 1, '2024-07-29 07:39:40', '2024-07-29 07:39:40'),
(195, 5, 39, 1, '2024-07-29 07:39:40', '2024-07-29 07:39:40'),
(196, 1, 40, 1, '2024-07-29 07:39:57', '2024-07-29 07:39:57'),
(197, 2, 40, 1, '2024-07-29 07:39:57', '2024-07-29 07:39:57'),
(198, 3, 40, 1, '2024-07-29 07:39:57', '2024-07-29 07:39:57'),
(199, 4, 40, 1, '2024-07-29 07:39:57', '2024-07-29 07:39:57'),
(200, 5, 40, 1, '2024-07-29 07:39:57', '2024-07-29 07:39:57'),
(201, 1, 41, 1, '2024-07-29 07:40:12', '2024-07-29 07:40:12'),
(202, 2, 41, 1, '2024-07-29 07:40:12', '2024-07-29 07:40:12'),
(203, 3, 41, 1, '2024-07-29 07:40:12', '2024-07-29 07:40:12'),
(204, 4, 41, 1, '2024-07-29 07:40:12', '2024-07-29 07:40:12'),
(205, 5, 41, 1, '2024-07-29 07:40:12', '2024-07-29 07:40:12'),
(206, 1, 42, 1, '2024-07-29 07:45:24', '2024-07-29 07:45:24'),
(207, 2, 42, 1, '2024-07-29 07:45:24', '2024-07-29 07:45:24'),
(208, 3, 42, 1, '2024-07-29 07:45:24', '2024-07-29 07:45:24'),
(209, 4, 42, 1, '2024-07-29 07:45:24', '2024-07-29 07:45:24'),
(210, 5, 42, 1, '2024-07-29 07:45:24', '2024-07-29 07:45:24'),
(211, 1, 43, 1, '2024-07-29 07:45:32', '2024-07-29 07:45:32'),
(212, 2, 43, 1, '2024-07-29 07:45:32', '2024-07-29 07:45:32'),
(213, 3, 43, 1, '2024-07-29 07:45:32', '2024-07-29 07:45:32'),
(214, 4, 43, 1, '2024-07-29 07:45:32', '2024-07-29 07:45:32'),
(215, 5, 43, 1, '2024-07-29 07:45:32', '2024-07-29 07:45:32'),
(216, 1, 44, 1, '2024-07-29 07:45:36', '2024-07-29 07:45:36'),
(217, 2, 44, 1, '2024-07-29 07:45:36', '2024-07-29 07:45:36'),
(218, 3, 44, 1, '2024-07-29 07:45:36', '2024-07-29 07:45:36'),
(219, 4, 44, 1, '2024-07-29 07:45:36', '2024-07-29 07:45:36'),
(220, 5, 44, 1, '2024-07-29 07:45:36', '2024-07-29 07:45:36'),
(221, 1, 45, 1, '2024-07-29 08:02:28', '2024-07-29 08:02:28'),
(222, 2, 45, 1, '2024-07-29 08:02:28', '2024-07-29 08:02:28'),
(223, 3, 45, 1, '2024-07-29 08:02:28', '2024-07-29 08:02:28'),
(224, 4, 45, 1, '2024-07-29 08:02:28', '2024-07-29 08:02:28'),
(225, 5, 45, 1, '2024-07-29 08:02:28', '2024-07-29 08:02:28'),
(226, 1, 46, 1, '2024-07-29 08:03:06', '2024-07-29 08:03:06'),
(227, 2, 46, 1, '2024-07-29 08:03:06', '2024-07-29 08:03:06'),
(228, 3, 46, 1, '2024-07-29 08:03:06', '2024-07-29 08:03:06'),
(229, 4, 46, 1, '2024-07-29 08:03:06', '2024-07-29 08:03:06'),
(230, 5, 46, 1, '2024-07-29 08:03:06', '2024-07-29 08:03:06'),
(231, 1, 47, 1, '2024-07-29 08:05:11', '2024-07-29 08:05:11'),
(232, 2, 47, 1, '2024-07-29 08:05:11', '2024-07-29 08:05:11'),
(233, 3, 47, 1, '2024-07-29 08:05:11', '2024-07-29 08:05:11'),
(234, 4, 47, 1, '2024-07-29 08:05:11', '2024-07-29 08:05:11'),
(235, 5, 47, 1, '2024-07-29 08:05:11', '2024-07-29 08:05:11'),
(236, 1, 48, 1, '2024-07-29 08:05:20', '2024-07-29 08:05:20'),
(237, 2, 48, 1, '2024-07-29 08:05:20', '2024-07-29 08:05:20'),
(238, 3, 48, 1, '2024-07-29 08:05:20', '2024-07-29 08:05:20'),
(239, 4, 48, 1, '2024-07-29 08:05:20', '2024-07-29 08:05:20'),
(240, 5, 48, 1, '2024-07-29 08:05:20', '2024-07-29 08:05:20'),
(241, 1, 49, 1, '2024-07-29 08:05:27', '2024-07-29 08:05:27'),
(242, 2, 49, 1, '2024-07-29 08:05:27', '2024-07-29 08:05:27'),
(243, 3, 49, 1, '2024-07-29 08:05:27', '2024-07-29 08:05:27'),
(244, 4, 49, 1, '2024-07-29 08:05:27', '2024-07-29 08:05:27'),
(245, 5, 49, 1, '2024-07-29 08:05:27', '2024-07-29 08:05:27'),
(246, 1, 50, 1, '2024-07-29 08:05:34', '2024-07-29 08:05:34'),
(247, 2, 50, 1, '2024-07-29 08:05:34', '2024-07-29 08:05:34'),
(248, 3, 50, 1, '2024-07-29 08:05:34', '2024-07-29 08:05:34'),
(249, 4, 50, 1, '2024-07-29 08:05:34', '2024-07-29 08:05:34'),
(250, 5, 50, 1, '2024-07-29 08:05:34', '2024-07-29 08:05:34'),
(251, 1, 51, 1, '2024-07-29 08:05:40', '2024-07-29 08:05:40'),
(252, 2, 51, 1, '2024-07-29 08:05:40', '2024-07-29 08:05:40'),
(253, 3, 51, 1, '2024-07-29 08:05:40', '2024-07-29 08:05:40'),
(254, 4, 51, 1, '2024-07-29 08:05:40', '2024-07-29 08:05:40'),
(255, 5, 51, 1, '2024-07-29 08:05:40', '2024-07-29 08:05:40'),
(256, 1, 52, 1, '2024-08-07 07:55:19', '2024-08-07 07:55:19'),
(257, 2, 52, 1, '2024-08-07 07:55:19', '2024-08-07 07:55:19'),
(258, 3, 52, 1, '2024-08-07 07:55:19', '2024-08-07 07:55:19'),
(259, 4, 52, 1, '2024-08-07 07:55:19', '2024-08-07 07:55:19'),
(260, 5, 52, 1, '2024-08-07 07:55:19', '2024-08-07 07:55:19'),
(261, 1, 53, 1, '2024-08-07 07:56:28', '2024-08-07 07:56:28'),
(262, 2, 53, 1, '2024-08-07 07:56:28', '2024-08-07 07:56:28'),
(263, 3, 53, 1, '2024-08-07 07:56:28', '2024-08-07 07:56:28'),
(264, 4, 53, 1, '2024-08-07 07:56:28', '2024-08-07 07:56:28'),
(265, 5, 53, 1, '2024-08-07 07:56:28', '2024-08-07 07:56:28'),
(266, 1, 54, 1, '2024-08-07 08:03:32', '2024-08-07 08:03:32'),
(267, 2, 54, 1, '2024-08-07 08:03:32', '2024-08-07 08:03:32'),
(268, 3, 54, 1, '2024-08-07 08:03:32', '2024-08-07 08:03:32'),
(269, 4, 54, 1, '2024-08-07 08:03:32', '2024-08-07 08:03:32'),
(270, 5, 54, 1, '2024-08-07 08:03:32', '2024-08-07 08:03:32'),
(271, 1, 55, 1, '2024-08-07 09:47:16', '2024-08-07 09:47:16'),
(272, 2, 55, 1, '2024-08-07 09:47:16', '2024-08-07 09:47:16'),
(273, 3, 55, 1, '2024-08-07 09:47:16', '2024-08-07 09:47:16'),
(274, 4, 55, 1, '2024-08-07 09:47:16', '2024-08-07 09:47:16'),
(275, 5, 55, 1, '2024-08-07 09:47:16', '2024-08-07 09:47:16'),
(276, 1, 56, 1, '2024-08-07 09:50:14', '2024-08-07 09:50:14'),
(277, 2, 56, 1, '2024-08-07 09:50:14', '2024-08-07 09:50:14'),
(278, 3, 56, 1, '2024-08-07 09:50:14', '2024-08-07 09:50:14'),
(279, 4, 56, 1, '2024-08-07 09:50:14', '2024-08-07 09:50:14'),
(280, 5, 56, 1, '2024-08-07 09:50:14', '2024-08-07 09:50:14'),
(281, 1, 57, 1, '2024-08-08 11:21:16', '2024-08-08 11:21:16'),
(282, 2, 57, 1, '2024-08-08 11:21:16', '2024-08-08 11:21:16'),
(283, 3, 57, 1, '2024-08-08 11:21:16', '2024-08-08 11:21:16'),
(284, 4, 57, 1, '2024-08-08 11:21:16', '2024-08-08 11:21:16'),
(285, 5, 57, 1, '2024-08-08 11:21:16', '2024-08-08 11:21:16'),
(286, 1, 58, 1, '2024-08-08 11:22:03', '2024-08-08 11:22:03'),
(287, 2, 58, 1, '2024-08-08 11:22:03', '2024-08-08 11:22:03'),
(288, 3, 58, 1, '2024-08-08 11:22:03', '2024-08-08 11:22:03'),
(289, 4, 58, 1, '2024-08-08 11:22:03', '2024-08-08 11:22:03'),
(290, 5, 58, 1, '2024-08-08 11:22:03', '2024-08-08 11:22:03'),
(291, 1, 59, 1, '2024-08-08 11:35:07', '2024-08-08 11:35:07'),
(292, 2, 59, 1, '2024-08-08 11:35:07', '2024-08-08 11:35:07'),
(293, 3, 59, 1, '2024-08-08 11:35:07', '2024-08-08 11:35:07'),
(294, 4, 59, 1, '2024-08-08 11:35:07', '2024-08-08 11:35:07'),
(295, 5, 59, 1, '2024-08-08 11:35:07', '2024-08-08 11:35:07'),
(296, 1, 60, 1, '2024-08-08 12:27:36', '2024-08-08 12:27:36'),
(297, 2, 60, 1, '2024-08-08 12:27:36', '2024-08-08 12:27:36'),
(298, 3, 60, 1, '2024-08-08 12:27:36', '2024-08-08 12:27:36'),
(299, 4, 60, 1, '2024-08-08 12:27:36', '2024-08-08 12:27:36'),
(300, 5, 60, 1, '2024-08-08 12:27:36', '2024-08-08 12:27:36'),
(301, 1, 61, 1, '2024-08-08 12:27:51', '2024-08-08 12:27:51'),
(302, 2, 61, 1, '2024-08-08 12:27:51', '2024-08-08 12:27:51'),
(303, 3, 61, 1, '2024-08-08 12:27:51', '2024-08-08 12:27:51'),
(304, 4, 61, 1, '2024-08-08 12:27:51', '2024-08-08 12:27:51'),
(305, 5, 61, 1, '2024-08-08 12:27:51', '2024-08-08 12:27:51'),
(306, 1, 62, 1, '2024-08-08 12:27:55', '2024-08-08 12:27:55'),
(307, 2, 62, 1, '2024-08-08 12:27:55', '2024-08-08 12:27:55'),
(308, 3, 62, 1, '2024-08-08 12:27:55', '2024-08-08 12:27:55'),
(309, 4, 62, 1, '2024-08-08 12:27:55', '2024-08-08 12:27:55'),
(310, 5, 62, 1, '2024-08-08 12:27:55', '2024-08-08 12:27:55'),
(311, 1, 63, 1, '2024-08-08 12:27:59', '2024-08-08 12:27:59'),
(312, 2, 63, 1, '2024-08-08 12:27:59', '2024-08-08 12:27:59'),
(313, 3, 63, 1, '2024-08-08 12:27:59', '2024-08-08 12:27:59'),
(314, 4, 63, 1, '2024-08-08 12:27:59', '2024-08-08 12:27:59'),
(315, 5, 63, 1, '2024-08-08 12:27:59', '2024-08-08 12:27:59'),
(316, 1, 64, 1, '2024-08-08 12:28:02', '2024-08-08 12:28:02'),
(317, 2, 64, 1, '2024-08-08 12:28:02', '2024-08-08 12:28:02'),
(318, 3, 64, 1, '2024-08-08 12:28:02', '2024-08-08 12:28:02'),
(319, 4, 64, 1, '2024-08-08 12:28:02', '2024-08-08 12:28:02'),
(320, 5, 64, 1, '2024-08-08 12:28:02', '2024-08-08 12:28:02'),
(321, 1, 65, 1, '2024-08-08 12:28:06', '2024-08-08 12:28:06'),
(322, 2, 65, 1, '2024-08-08 12:28:06', '2024-08-08 12:28:06'),
(323, 3, 65, 1, '2024-08-08 12:28:06', '2024-08-08 12:28:06'),
(324, 4, 65, 1, '2024-08-08 12:28:06', '2024-08-08 12:28:06'),
(325, 5, 65, 1, '2024-08-08 12:28:06', '2024-08-08 12:28:06'),
(326, 1, 66, 1, '2024-08-08 12:28:10', '2024-08-08 12:28:10'),
(327, 2, 66, 1, '2024-08-08 12:28:10', '2024-08-08 12:28:10'),
(328, 3, 66, 1, '2024-08-08 12:28:10', '2024-08-08 12:28:10'),
(329, 4, 66, 1, '2024-08-08 12:28:10', '2024-08-08 12:28:10'),
(330, 5, 66, 1, '2024-08-08 12:28:10', '2024-08-08 12:28:10'),
(331, 1, 67, 1, '2024-09-04 07:09:03', '2024-09-04 07:09:03'),
(332, 2, 67, 1, '2024-09-04 07:09:03', '2024-09-04 07:09:03'),
(333, 3, 67, 1, '2024-09-04 07:09:03', '2024-09-04 07:09:03'),
(334, 4, 67, 1, '2024-09-04 07:09:03', '2024-09-04 07:09:03'),
(335, 5, 67, 1, '2024-09-04 07:09:03', '2024-09-04 07:09:03'),
(336, 1, 68, 1, '2024-09-04 07:20:34', '2024-09-04 07:20:34'),
(337, 2, 68, 1, '2024-09-04 07:20:34', '2024-09-04 07:20:34'),
(338, 3, 68, 1, '2024-09-04 07:20:34', '2024-09-04 07:20:34'),
(339, 4, 68, 1, '2024-09-04 07:20:34', '2024-09-04 07:20:34'),
(340, 5, 68, 1, '2024-09-04 07:20:34', '2024-09-04 07:20:34'),
(341, 1, 69, 1, '2024-09-04 10:23:14', '2024-09-04 10:23:14'),
(342, 2, 69, 1, '2024-09-04 10:23:14', '2024-09-04 10:23:14'),
(343, 3, 69, 1, '2024-09-04 10:23:14', '2024-09-04 10:23:14'),
(344, 4, 69, 1, '2024-09-04 10:23:14', '2024-09-04 10:23:14'),
(345, 5, 69, 1, '2024-09-04 10:23:14', '2024-09-04 10:23:14'),
(346, 1, 70, 1, '2024-09-05 10:30:54', '2024-09-05 10:30:54'),
(347, 2, 70, 1, '2024-09-05 10:30:54', '2024-09-05 10:30:54'),
(348, 3, 70, 1, '2024-09-05 10:30:54', '2024-09-05 10:30:54'),
(349, 4, 70, 1, '2024-09-05 10:30:54', '2024-09-05 10:30:54'),
(350, 5, 70, 1, '2024-09-05 10:30:54', '2024-09-05 10:30:54'),
(351, 1, 71, 1, '2024-09-05 10:50:57', '2024-09-05 10:50:57'),
(352, 2, 71, 1, '2024-09-05 10:50:57', '2024-09-05 10:50:57'),
(353, 3, 71, 1, '2024-09-05 10:50:57', '2024-09-05 10:50:57'),
(354, 4, 71, 1, '2024-09-05 10:50:57', '2024-09-05 10:50:57'),
(355, 5, 71, 1, '2024-09-05 10:50:57', '2024-09-05 10:50:57'),
(356, 1, 72, 1, '2024-09-28 12:57:48', '2024-09-28 12:57:48'),
(357, 2, 72, 1, '2024-09-28 12:57:48', '2024-09-28 12:57:48'),
(358, 3, 72, 1, '2024-09-28 12:57:48', '2024-09-28 12:57:48'),
(359, 4, 72, 1, '2024-09-28 12:57:48', '2024-09-28 12:57:48'),
(360, 5, 72, 1, '2024-09-28 12:57:48', '2024-09-28 12:57:48'),
(361, 1, 73, 1, '2024-09-28 13:34:38', '2024-09-28 13:34:38'),
(362, 2, 73, 1, '2024-09-28 13:34:38', '2024-09-28 13:34:38'),
(363, 3, 73, 1, '2024-09-28 13:34:38', '2024-09-28 13:34:38'),
(364, 4, 73, 1, '2024-09-28 13:34:38', '2024-09-28 13:34:38'),
(365, 5, 73, 1, '2024-09-28 13:34:38', '2024-09-28 13:34:38'),
(366, 1, 74, 1, '2024-09-30 07:29:58', '2024-09-30 07:29:58'),
(367, 2, 74, 1, '2024-09-30 07:29:58', '2024-09-30 07:29:58'),
(368, 3, 74, 1, '2024-09-30 07:29:58', '2024-09-30 07:29:58'),
(369, 4, 74, 1, '2024-09-30 07:29:58', '2024-09-30 07:29:58'),
(370, 5, 74, 1, '2024-09-30 07:29:58', '2024-09-30 07:29:58'),
(371, 1, 75, 1, '2024-09-30 07:30:12', '2024-09-30 07:30:12'),
(372, 2, 75, 1, '2024-09-30 07:30:12', '2024-09-30 07:30:12'),
(373, 3, 75, 1, '2024-09-30 07:30:12', '2024-09-30 07:30:12'),
(374, 4, 75, 1, '2024-09-30 07:30:12', '2024-09-30 07:30:12'),
(375, 5, 75, 1, '2024-09-30 07:30:12', '2024-09-30 07:30:12'),
(376, 1, 76, 1, '2024-09-30 07:31:25', '2024-09-30 07:31:25'),
(377, 2, 76, 1, '2024-09-30 07:31:25', '2024-09-30 07:31:25'),
(378, 3, 76, 1, '2024-09-30 07:31:25', '2024-09-30 07:31:25'),
(379, 4, 76, 1, '2024-09-30 07:31:25', '2024-09-30 07:31:25'),
(380, 5, 76, 1, '2024-09-30 07:31:25', '2024-09-30 07:31:25'),
(381, 1, 77, 1, '2024-09-30 07:32:15', '2024-09-30 07:32:15'),
(382, 2, 77, 1, '2024-09-30 07:32:15', '2024-09-30 07:32:15'),
(383, 3, 77, 1, '2024-09-30 07:32:15', '2024-09-30 07:32:15'),
(384, 4, 77, 1, '2024-09-30 07:32:15', '2024-09-30 07:32:15'),
(385, 5, 77, 1, '2024-09-30 07:32:15', '2024-09-30 07:32:15'),
(386, 1, 78, 1, '2024-09-30 07:33:13', '2024-09-30 07:33:13'),
(387, 2, 78, 1, '2024-09-30 07:33:13', '2024-09-30 07:33:13'),
(388, 3, 78, 1, '2024-09-30 07:33:13', '2024-09-30 07:33:13'),
(389, 4, 78, 1, '2024-09-30 07:33:13', '2024-09-30 07:33:13'),
(390, 5, 78, 1, '2024-09-30 07:33:13', '2024-09-30 07:33:13'),
(391, 1, 79, 1, '2024-09-30 07:33:30', '2024-09-30 07:33:30'),
(392, 2, 79, 1, '2024-09-30 07:33:30', '2024-09-30 07:33:30'),
(393, 3, 79, 1, '2024-09-30 07:33:30', '2024-09-30 07:33:30'),
(394, 4, 79, 1, '2024-09-30 07:33:30', '2024-09-30 07:33:30'),
(395, 5, 79, 1, '2024-09-30 07:33:30', '2024-09-30 07:33:30'),
(396, 1, 80, 1, '2024-09-30 07:33:37', '2024-09-30 07:33:37'),
(397, 2, 80, 1, '2024-09-30 07:33:37', '2024-09-30 07:33:37'),
(398, 3, 80, 1, '2024-09-30 07:33:37', '2024-09-30 07:33:37'),
(399, 4, 80, 1, '2024-09-30 07:33:37', '2024-09-30 07:33:37'),
(400, 5, 80, 1, '2024-09-30 07:33:37', '2024-09-30 07:33:37'),
(401, 1, 81, 1, '2024-10-01 05:48:55', '2024-10-01 05:48:55'),
(402, 2, 81, 1, '2024-10-01 05:48:55', '2024-10-01 05:48:55'),
(403, 3, 81, 1, '2024-10-01 05:48:55', '2024-10-01 05:48:55'),
(404, 4, 81, 1, '2024-10-01 05:48:55', '2024-10-01 05:48:55'),
(405, 5, 81, 1, '2024-10-01 05:48:55', '2024-10-01 05:48:55'),
(406, 1, 82, 1, '2024-10-01 07:25:31', '2024-10-01 07:25:31'),
(407, 2, 82, 1, '2024-10-01 07:25:31', '2024-10-01 07:25:31'),
(408, 3, 82, 1, '2024-10-01 07:25:31', '2024-10-01 07:25:31'),
(409, 4, 82, 1, '2024-10-01 07:25:31', '2024-10-01 07:25:31'),
(410, 5, 82, 1, '2024-10-01 07:25:31', '2024-10-01 07:25:31'),
(411, 1, 83, 1, '2024-10-01 07:27:01', '2024-10-01 07:27:01'),
(412, 2, 83, 1, '2024-10-01 07:27:01', '2024-10-01 07:27:01'),
(413, 3, 83, 1, '2024-10-01 07:27:01', '2024-10-01 07:27:01'),
(414, 4, 83, 1, '2024-10-01 07:27:01', '2024-10-01 07:27:01'),
(415, 5, 83, 1, '2024-10-01 07:27:01', '2024-10-01 07:27:01'),
(416, 1, 84, 1, '2024-10-01 09:48:40', '2024-10-01 09:48:40'),
(417, 2, 84, 1, '2024-10-01 09:48:40', '2024-10-01 09:48:40'),
(418, 3, 84, 1, '2024-10-01 09:48:40', '2024-10-01 09:48:40'),
(419, 4, 84, 1, '2024-10-01 09:48:40', '2024-10-01 09:48:40'),
(420, 5, 84, 1, '2024-10-01 09:48:40', '2024-10-01 09:48:40'),
(421, 1, 85, 1, '2024-10-01 11:08:45', '2024-10-01 11:08:45'),
(422, 2, 85, 1, '2024-10-01 11:08:45', '2024-10-01 11:08:45'),
(423, 3, 85, 1, '2024-10-01 11:08:45', '2024-10-01 11:08:45'),
(424, 4, 85, 1, '2024-10-01 11:08:45', '2024-10-01 11:08:45'),
(425, 5, 85, 1, '2024-10-01 11:08:45', '2024-10-01 11:08:45'),
(426, 1, 86, 1, '2024-10-01 12:25:14', '2024-10-01 12:25:14'),
(427, 2, 86, 1, '2024-10-01 12:25:14', '2024-10-01 12:25:14'),
(428, 3, 86, 1, '2024-10-01 12:25:14', '2024-10-01 12:25:14'),
(429, 4, 86, 1, '2024-10-01 12:25:14', '2024-10-01 12:25:14'),
(430, 5, 86, 1, '2024-10-01 12:25:14', '2024-10-01 12:25:14'),
(431, 1, 87, 1, '2024-10-01 12:26:10', '2024-10-01 12:26:10'),
(432, 2, 87, 1, '2024-10-01 12:26:10', '2024-10-01 12:26:10'),
(433, 3, 87, 1, '2024-10-01 12:26:10', '2024-10-01 12:26:10'),
(434, 4, 87, 1, '2024-10-01 12:26:10', '2024-10-01 12:26:10'),
(435, 5, 87, 1, '2024-10-01 12:26:10', '2024-10-01 12:26:10'),
(436, 1, 88, 1, '2024-10-01 13:59:54', '2024-10-01 13:59:54'),
(437, 2, 88, 1, '2024-10-01 13:59:54', '2024-10-01 13:59:54'),
(438, 3, 88, 1, '2024-10-01 13:59:54', '2024-10-01 13:59:54'),
(439, 4, 88, 1, '2024-10-01 13:59:54', '2024-10-01 13:59:54'),
(440, 5, 88, 1, '2024-10-01 13:59:54', '2024-10-01 13:59:54'),
(441, 1, 89, 1, '2024-10-09 13:10:05', '2024-10-09 13:10:05'),
(442, 2, 89, 1, '2024-10-09 13:10:05', '2024-10-09 13:10:05'),
(443, 3, 89, 1, '2024-10-09 13:10:05', '2024-10-09 13:10:05'),
(444, 4, 89, 1, '2024-10-09 13:10:05', '2024-10-09 13:10:05'),
(445, 5, 89, 1, '2024-10-09 13:10:05', '2024-10-09 13:10:05'),
(446, 1, 90, 1, '2024-10-09 13:16:54', '2024-10-09 13:16:54'),
(447, 2, 90, 1, '2024-10-09 13:16:54', '2024-10-09 13:16:54'),
(448, 3, 90, 1, '2024-10-09 13:16:54', '2024-10-09 13:16:54'),
(449, 4, 90, 1, '2024-10-09 13:16:54', '2024-10-09 13:16:54'),
(450, 5, 90, 1, '2024-10-09 13:16:54', '2024-10-09 13:16:54'),
(451, 1, 91, 1, '2024-10-09 13:16:59', '2024-10-09 13:16:59'),
(452, 2, 91, 1, '2024-10-09 13:16:59', '2024-10-09 13:16:59'),
(453, 3, 91, 1, '2024-10-09 13:16:59', '2024-10-09 13:16:59'),
(454, 4, 91, 1, '2024-10-09 13:16:59', '2024-10-09 13:16:59'),
(455, 5, 91, 1, '2024-10-09 13:16:59', '2024-10-09 13:16:59'),
(456, 1, 92, 1, '2024-10-09 13:17:05', '2024-10-09 13:17:05'),
(457, 2, 92, 1, '2024-10-09 13:17:05', '2024-10-09 13:17:05'),
(458, 3, 92, 1, '2024-10-09 13:17:05', '2024-10-09 13:17:05'),
(459, 4, 92, 1, '2024-10-09 13:17:05', '2024-10-09 13:17:05'),
(460, 5, 92, 1, '2024-10-09 13:17:05', '2024-10-09 13:17:05'),
(461, 1, 93, 1, '2024-10-09 13:17:11', '2024-10-09 13:17:11'),
(462, 2, 93, 1, '2024-10-09 13:17:11', '2024-10-09 13:17:11'),
(463, 3, 93, 1, '2024-10-09 13:17:11', '2024-10-09 13:17:11'),
(464, 4, 93, 1, '2024-10-09 13:17:11', '2024-10-09 13:17:11'),
(465, 5, 93, 1, '2024-10-09 13:17:11', '2024-10-09 13:17:11'),
(466, 1, 94, 1, '2024-10-09 13:17:16', '2024-10-09 13:17:16'),
(467, 2, 94, 1, '2024-10-09 13:17:16', '2024-10-09 13:17:16'),
(468, 3, 94, 1, '2024-10-09 13:17:16', '2024-10-09 13:17:16'),
(469, 4, 94, 1, '2024-10-09 13:17:16', '2024-10-09 13:17:16'),
(470, 5, 94, 1, '2024-10-09 13:17:16', '2024-10-09 13:17:16'),
(471, 1, 95, 1, '2024-10-09 13:26:21', '2024-10-09 13:26:21'),
(472, 2, 95, 1, '2024-10-09 13:26:21', '2024-10-09 13:26:21'),
(473, 3, 95, 1, '2024-10-09 13:26:21', '2024-10-09 13:26:21'),
(474, 4, 95, 1, '2024-10-09 13:26:21', '2024-10-09 13:26:21'),
(475, 5, 95, 1, '2024-10-09 13:26:21', '2024-10-09 13:26:21'),
(476, 1, 96, 1, '2024-10-10 06:20:12', '2024-10-10 06:20:12'),
(477, 2, 96, 1, '2024-10-10 06:20:12', '2024-10-10 06:20:12'),
(478, 3, 96, 1, '2024-10-10 06:20:12', '2024-10-10 06:20:12'),
(479, 4, 96, 1, '2024-10-10 06:20:12', '2024-10-10 06:20:12'),
(480, 5, 96, 1, '2024-10-10 06:20:12', '2024-10-10 06:20:12'),
(481, 1, 97, 1, '2024-10-10 06:20:21', '2024-10-10 06:20:21'),
(482, 2, 97, 1, '2024-10-10 06:20:21', '2024-10-10 06:20:21'),
(483, 3, 97, 1, '2024-10-10 06:20:21', '2024-10-10 06:20:21'),
(484, 4, 97, 1, '2024-10-10 06:20:21', '2024-10-10 06:20:21'),
(485, 5, 97, 1, '2024-10-10 06:20:21', '2024-10-10 06:20:21'),
(486, 1, 98, 1, '2024-10-10 06:20:26', '2024-10-10 06:20:26'),
(487, 2, 98, 1, '2024-10-10 06:20:26', '2024-10-10 06:20:26'),
(488, 3, 98, 1, '2024-10-10 06:20:26', '2024-10-10 06:20:26'),
(489, 4, 98, 1, '2024-10-10 06:20:26', '2024-10-10 06:20:26'),
(490, 5, 98, 1, '2024-10-10 06:20:26', '2024-10-10 06:20:26'),
(491, 1, 99, 1, '2024-10-10 06:20:29', '2024-10-10 06:20:29'),
(492, 2, 99, 1, '2024-10-10 06:20:29', '2024-10-10 06:20:29'),
(493, 3, 99, 1, '2024-10-10 06:20:29', '2024-10-10 06:20:29'),
(494, 4, 99, 1, '2024-10-10 06:20:29', '2024-10-10 06:20:29'),
(495, 5, 99, 1, '2024-10-10 06:20:29', '2024-10-10 06:20:29'),
(496, 1, 100, 1, '2024-10-10 06:20:33', '2024-10-10 06:20:33'),
(497, 2, 100, 1, '2024-10-10 06:20:33', '2024-10-10 06:20:33'),
(498, 3, 100, 1, '2024-10-10 06:20:33', '2024-10-10 06:20:33'),
(499, 4, 100, 1, '2024-10-10 06:20:33', '2024-10-10 06:20:33'),
(500, 5, 100, 1, '2024-10-10 06:20:33', '2024-10-10 06:20:33'),
(501, 1, 101, 1, '2024-10-10 06:41:07', '2024-10-10 06:41:07'),
(502, 2, 101, 1, '2024-10-10 06:41:07', '2024-10-10 06:41:07'),
(503, 3, 101, 1, '2024-10-10 06:41:07', '2024-10-10 06:41:07'),
(504, 4, 101, 1, '2024-10-10 06:41:07', '2024-10-10 06:41:07'),
(505, 5, 101, 1, '2024-10-10 06:41:07', '2024-10-10 06:41:07'),
(506, 1, 102, 1, '2024-10-10 07:11:21', '2024-10-10 07:11:21'),
(507, 2, 102, 1, '2024-10-10 07:11:21', '2024-10-10 07:11:21'),
(508, 3, 102, 1, '2024-10-10 07:11:21', '2024-10-10 07:11:21'),
(509, 4, 102, 1, '2024-10-10 07:11:21', '2024-10-10 07:11:21'),
(510, 5, 102, 1, '2024-10-10 07:11:21', '2024-10-10 07:11:21'),
(511, 1, 103, 1, '2024-10-10 07:12:00', '2024-10-10 07:12:00'),
(512, 2, 103, 1, '2024-10-10 07:12:00', '2024-10-10 07:12:00'),
(513, 3, 103, 1, '2024-10-10 07:12:00', '2024-10-10 07:12:00'),
(514, 4, 103, 1, '2024-10-10 07:12:00', '2024-10-10 07:12:00'),
(515, 5, 103, 1, '2024-10-10 07:12:00', '2024-10-10 07:12:00'),
(516, 1, 104, 1, '2024-11-25 06:26:05', '2024-11-25 12:05:48'),
(517, 2, 104, 1, '2024-11-25 06:26:05', '2024-11-25 06:26:05'),
(518, 3, 104, 1, '2024-11-25 06:26:05', '2024-11-25 06:26:05'),
(519, 4, 104, 1, '2024-11-25 06:26:05', '2024-11-25 06:26:05'),
(520, 5, 104, 1, '2024-11-25 06:26:05', '2024-11-25 06:26:05'),
(521, 1, 105, 1, '2024-11-25 06:38:22', '2024-11-25 06:38:22'),
(522, 2, 105, 1, '2024-11-25 06:38:22', '2024-11-25 06:38:22'),
(523, 3, 105, 1, '2024-11-25 06:38:22', '2024-11-25 06:38:22'),
(524, 4, 105, 1, '2024-11-25 06:38:22', '2024-11-25 06:38:22'),
(525, 5, 105, 1, '2024-11-25 06:38:22', '2024-11-25 06:38:22'),
(526, 1, 106, 1, '2024-12-03 08:00:05', '2024-12-03 08:00:05'),
(527, 2, 106, 1, '2024-12-03 08:00:05', '2024-12-03 08:00:05'),
(528, 3, 106, 1, '2024-12-03 08:00:05', '2024-12-03 08:00:05'),
(529, 4, 106, 1, '2024-12-03 08:00:05', '2024-12-03 08:00:05'),
(530, 5, 106, 1, '2024-12-03 08:00:05', '2024-12-03 08:00:05'),
(531, 1, 107, 1, '2024-12-03 10:10:17', '2024-12-03 10:10:17'),
(532, 2, 107, 1, '2024-12-03 10:10:17', '2024-12-03 10:10:17'),
(533, 3, 107, 1, '2024-12-03 10:10:17', '2024-12-03 10:10:17'),
(534, 4, 107, 1, '2024-12-03 10:10:17', '2024-12-03 10:10:17'),
(535, 5, 107, 1, '2024-12-03 10:10:17', '2024-12-03 10:10:17'),
(536, 1, 108, 1, '2025-02-08 08:20:33', '2025-02-08 08:20:33'),
(537, 2, 108, 1, '2025-02-08 08:20:33', '2025-02-08 08:20:33'),
(538, 3, 108, 1, '2025-02-08 08:20:33', '2025-02-08 08:20:33'),
(539, 4, 108, 1, '2025-02-08 08:20:33', '2025-02-08 08:20:33'),
(540, 5, 108, 1, '2025-02-08 08:20:33', '2025-02-08 08:20:33'),
(541, 1, 109, 1, '2025-02-08 08:27:15', '2025-02-08 08:27:15'),
(542, 2, 109, 1, '2025-02-08 08:27:15', '2025-02-08 08:27:15'),
(543, 3, 109, 1, '2025-02-08 08:27:15', '2025-02-08 08:27:15'),
(544, 4, 109, 1, '2025-02-08 08:27:15', '2025-02-08 08:27:15'),
(545, 5, 109, 1, '2025-02-08 08:27:15', '2025-02-08 08:27:15'),
(546, 1, 110, 1, '2025-02-08 10:15:47', '2025-02-08 10:15:47'),
(547, 2, 110, 1, '2025-02-08 10:15:47', '2025-02-08 10:15:47'),
(548, 3, 110, 1, '2025-02-08 10:15:47', '2025-02-08 10:15:47'),
(549, 4, 110, 1, '2025-02-08 10:15:47', '2025-02-08 10:15:47'),
(550, 5, 110, 1, '2025-02-08 10:15:47', '2025-02-08 10:15:47'),
(551, 1, 111, 1, '2025-02-10 07:03:40', '2025-02-10 07:03:40'),
(552, 2, 111, 1, '2025-02-10 07:03:40', '2025-02-10 07:03:40'),
(553, 3, 111, 1, '2025-02-10 07:03:40', '2025-02-10 07:03:40'),
(554, 4, 111, 1, '2025-02-10 07:03:40', '2025-02-10 07:03:40'),
(555, 5, 111, 1, '2025-02-10 07:03:40', '2025-02-10 07:03:40'),
(556, 1, 112, 1, '2025-02-10 11:11:34', '2025-02-10 11:11:34'),
(557, 2, 112, 1, '2025-02-10 11:11:34', '2025-02-10 11:11:34'),
(558, 3, 112, 1, '2025-02-10 11:11:34', '2025-02-10 11:11:34'),
(559, 4, 112, 1, '2025-02-10 11:11:34', '2025-02-10 11:11:34'),
(560, 5, 112, 1, '2025-02-10 11:11:34', '2025-02-10 11:11:34'),
(561, 1, 113, 1, '2025-02-14 06:08:08', '2025-02-14 06:08:08'),
(562, 2, 113, 1, '2025-02-14 06:08:08', '2025-02-14 06:08:08'),
(563, 3, 113, 1, '2025-02-14 06:08:08', '2025-02-14 06:08:08'),
(564, 4, 113, 1, '2025-02-14 06:08:08', '2025-02-14 06:08:08'),
(565, 5, 113, 1, '2025-02-14 06:08:08', '2025-02-14 06:08:08'),
(566, 1, 114, 1, '2025-02-14 07:37:18', '2025-02-14 07:37:18'),
(567, 2, 114, 1, '2025-02-14 07:37:18', '2025-02-14 07:37:18'),
(568, 3, 114, 1, '2025-02-14 07:37:18', '2025-02-14 07:37:18'),
(569, 4, 114, 1, '2025-02-14 07:37:18', '2025-02-14 07:37:18'),
(570, 5, 114, 1, '2025-02-14 07:37:18', '2025-02-14 07:37:18'),
(571, 1, 115, 1, '2025-02-14 10:53:22', '2025-02-14 10:53:22'),
(572, 2, 115, 1, '2025-02-14 10:53:22', '2025-02-14 10:53:22'),
(573, 3, 115, 1, '2025-02-14 10:53:22', '2025-02-14 10:53:22'),
(574, 4, 115, 1, '2025-02-14 10:53:22', '2025-02-14 10:53:22'),
(575, 5, 115, 1, '2025-02-14 10:53:22', '2025-02-14 10:53:22'),
(576, 1, 116, 1, '2025-02-14 11:02:14', '2025-02-14 11:02:14'),
(577, 2, 116, 1, '2025-02-14 11:02:14', '2025-02-14 11:02:14'),
(578, 3, 116, 1, '2025-02-14 11:02:14', '2025-02-14 11:02:14'),
(579, 4, 116, 1, '2025-02-14 11:02:14', '2025-02-14 11:02:14'),
(580, 5, 116, 1, '2025-02-14 11:02:14', '2025-02-14 11:02:14'),
(581, 1, 117, 1, '2025-02-14 11:05:15', '2025-02-14 11:05:15'),
(582, 2, 117, 1, '2025-02-14 11:05:15', '2025-02-14 11:05:15'),
(583, 3, 117, 1, '2025-02-14 11:05:15', '2025-02-14 11:05:15'),
(584, 4, 117, 1, '2025-02-14 11:05:15', '2025-02-14 11:05:15'),
(585, 5, 117, 1, '2025-02-14 11:05:15', '2025-02-14 11:05:15'),
(586, 1, 118, 1, '2025-02-14 11:09:58', '2025-02-14 11:09:58'),
(587, 2, 118, 1, '2025-02-14 11:09:58', '2025-02-14 11:09:58'),
(588, 3, 118, 1, '2025-02-14 11:09:58', '2025-02-14 11:09:58'),
(589, 4, 118, 1, '2025-02-14 11:09:58', '2025-02-14 11:09:58'),
(590, 5, 118, 1, '2025-02-14 11:09:58', '2025-02-14 11:09:58'),
(591, 1, 119, 1, '2025-02-14 11:40:04', '2025-02-14 11:40:04'),
(592, 2, 119, 1, '2025-02-14 11:40:04', '2025-02-14 11:40:04'),
(593, 3, 119, 1, '2025-02-14 11:40:04', '2025-02-14 11:40:04'),
(594, 4, 119, 1, '2025-02-14 11:40:04', '2025-02-14 11:40:04'),
(595, 5, 119, 1, '2025-02-14 11:40:04', '2025-02-14 11:40:04'),
(596, 1, 120, 1, '2025-02-14 11:40:40', '2025-02-14 11:40:40'),
(597, 2, 120, 1, '2025-02-14 11:40:40', '2025-02-14 11:40:40'),
(598, 3, 120, 1, '2025-02-14 11:40:40', '2025-02-14 11:40:40'),
(599, 4, 120, 1, '2025-02-14 11:40:40', '2025-02-14 11:40:40'),
(600, 5, 120, 1, '2025-02-14 11:40:40', '2025-02-14 11:40:40'),
(601, 1, 121, 1, '2025-02-18 10:32:01', '2025-02-18 10:32:01'),
(602, 2, 121, 1, '2025-02-18 10:32:01', '2025-02-18 10:32:01'),
(603, 3, 121, 1, '2025-02-18 10:32:01', '2025-02-18 10:32:01'),
(604, 4, 121, 1, '2025-02-18 10:32:01', '2025-02-18 10:32:01'),
(605, 5, 121, 1, '2025-02-18 10:32:01', '2025-02-18 10:32:01'),
(606, 1, 120, 1, '2025-03-06 11:12:06', '2025-03-06 11:12:06'),
(607, 2, 120, 1, '2025-03-06 11:12:06', '2025-03-06 11:12:06'),
(608, 3, 120, 1, '2025-03-06 11:12:06', '2025-03-06 11:12:06'),
(609, 4, 120, 1, '2025-03-06 11:12:06', '2025-03-06 11:12:06'),
(610, 5, 120, 1, '2025-03-06 11:12:06', '2025-03-06 11:12:06'),
(611, 1, 121, 1, '2025-04-17 08:48:25', '2025-04-17 08:48:25'),
(612, 2, 121, 1, '2025-04-17 08:48:25', '2025-04-17 08:48:25'),
(613, 3, 121, 1, '2025-04-17 08:48:25', '2025-04-17 08:48:25'),
(614, 4, 121, 1, '2025-04-17 08:48:25', '2025-04-17 08:48:25'),
(615, 5, 121, 1, '2025-04-17 08:48:25', '2025-04-17 08:48:25'),
(616, 1, 122, 1, '2025-04-18 08:41:17', '2025-04-18 08:41:17'),
(617, 2, 122, 1, '2025-04-18 08:41:17', '2025-04-18 08:41:17'),
(618, 3, 122, 1, '2025-04-18 08:41:17', '2025-04-18 08:41:17'),
(619, 4, 122, 1, '2025-04-18 08:41:17', '2025-04-18 08:41:17'),
(620, 5, 122, 1, '2025-04-18 08:41:17', '2025-04-18 08:41:17'),
(621, 1, 123, 1, '2025-04-18 08:44:25', '2025-04-18 08:44:25'),
(622, 2, 123, 1, '2025-04-18 08:44:25', '2025-04-18 08:44:25'),
(623, 3, 123, 1, '2025-04-18 08:44:25', '2025-04-18 08:44:25'),
(624, 4, 123, 1, '2025-04-18 08:44:25', '2025-04-18 08:44:25'),
(625, 5, 123, 1, '2025-04-18 08:44:25', '2025-04-18 08:44:25'),
(626, 1, 124, 1, '2025-04-19 04:19:07', '2025-04-19 04:19:07'),
(627, 2, 124, 1, '2025-04-19 04:19:07', '2025-04-19 04:19:07'),
(628, 3, 124, 1, '2025-04-19 04:19:07', '2025-04-19 04:19:07'),
(629, 4, 124, 1, '2025-04-19 04:19:07', '2025-04-19 04:19:07'),
(630, 5, 124, 1, '2025-04-19 04:19:07', '2025-04-19 04:19:07'),
(631, 1, 125, 1, '2025-04-24 04:37:57', '2025-04-24 04:37:57'),
(632, 2, 125, 1, '2025-04-24 04:37:57', '2025-04-24 04:37:57'),
(633, 3, 125, 1, '2025-04-24 04:37:57', '2025-04-24 04:37:57'),
(634, 4, 125, 1, '2025-04-24 04:37:57', '2025-04-24 04:37:57'),
(635, 5, 125, 1, '2025-04-24 04:37:57', '2025-04-24 04:37:57'),
(636, 1, 126, 1, '2025-04-24 04:38:10', '2025-04-24 04:38:10'),
(637, 2, 126, 1, '2025-04-24 04:38:10', '2025-04-24 04:38:10'),
(638, 3, 126, 1, '2025-04-24 04:38:10', '2025-04-24 04:38:10'),
(639, 4, 126, 1, '2025-04-24 04:38:10', '2025-04-24 04:38:10'),
(640, 5, 126, 1, '2025-04-24 04:38:10', '2025-04-24 04:38:10'),
(641, 1, 127, 1, '2025-04-24 04:38:19', '2025-04-24 04:38:19'),
(642, 2, 127, 1, '2025-04-24 04:38:19', '2025-04-24 04:38:19'),
(643, 3, 127, 1, '2025-04-24 04:38:19', '2025-04-24 04:38:19'),
(644, 4, 127, 1, '2025-04-24 04:38:19', '2025-04-24 04:38:19'),
(645, 5, 127, 1, '2025-04-24 04:38:19', '2025-04-24 04:38:19'),
(646, 1, 128, 1, '2025-04-24 04:38:30', '2025-04-24 04:38:30'),
(647, 2, 128, 1, '2025-04-24 04:38:30', '2025-04-24 04:38:30'),
(648, 3, 128, 1, '2025-04-24 04:38:30', '2025-04-24 04:38:30'),
(649, 4, 128, 1, '2025-04-24 04:38:30', '2025-04-24 04:38:30'),
(650, 5, 128, 1, '2025-04-24 04:38:30', '2025-04-24 04:38:30'),
(651, 1, 129, 1, '2025-04-24 04:38:40', '2025-04-24 04:38:40'),
(652, 2, 129, 1, '2025-04-24 04:38:40', '2025-04-24 04:38:40'),
(653, 3, 129, 1, '2025-04-24 04:38:40', '2025-04-24 04:38:40'),
(654, 4, 129, 1, '2025-04-24 04:38:40', '2025-04-24 04:38:40'),
(655, 5, 129, 1, '2025-04-24 04:38:40', '2025-04-24 04:38:40'),
(656, 1, 130, 1, '2025-04-24 04:38:52', '2025-04-24 04:38:52'),
(657, 2, 130, 1, '2025-04-24 04:38:52', '2025-04-24 04:38:52'),
(658, 3, 130, 1, '2025-04-24 04:38:52', '2025-04-24 04:38:52'),
(659, 4, 130, 1, '2025-04-24 04:38:52', '2025-04-24 04:38:52'),
(660, 5, 130, 1, '2025-04-24 04:38:52', '2025-04-24 04:38:52'),
(661, 1, 131, 1, '2025-04-24 04:39:10', '2025-04-24 04:39:10'),
(662, 2, 131, 1, '2025-04-24 04:39:10', '2025-04-24 04:39:10'),
(663, 3, 131, 1, '2025-04-24 04:39:10', '2025-04-24 04:39:10'),
(664, 4, 131, 1, '2025-04-24 04:39:10', '2025-04-24 04:39:10'),
(665, 5, 131, 1, '2025-04-24 04:39:10', '2025-04-24 04:39:10'),
(666, 1, 132, 1, '2025-04-24 04:39:11', '2025-04-24 04:39:11'),
(667, 2, 132, 1, '2025-04-24 04:39:11', '2025-04-24 04:39:11'),
(668, 3, 132, 1, '2025-04-24 04:39:11', '2025-04-24 04:39:11'),
(669, 4, 132, 1, '2025-04-24 04:39:11', '2025-04-24 04:39:11'),
(670, 5, 132, 1, '2025-04-24 04:39:11', '2025-04-24 04:39:11'),
(671, 1, 133, 1, '2025-04-24 04:39:14', '2025-04-24 04:39:14'),
(672, 2, 133, 1, '2025-04-24 04:39:14', '2025-04-24 04:39:14'),
(673, 3, 133, 1, '2025-04-24 04:39:14', '2025-04-24 04:39:14'),
(674, 4, 133, 1, '2025-04-24 04:39:14', '2025-04-24 04:39:14'),
(675, 5, 133, 1, '2025-04-24 04:39:14', '2025-04-24 04:39:14'),
(676, 1, 134, 1, '2025-04-24 04:39:23', '2025-04-24 04:39:23'),
(677, 2, 134, 1, '2025-04-24 04:39:23', '2025-04-24 04:39:23'),
(678, 3, 134, 1, '2025-04-24 04:39:23', '2025-04-24 04:39:23'),
(679, 4, 134, 1, '2025-04-24 04:39:23', '2025-04-24 04:39:23'),
(680, 5, 134, 1, '2025-04-24 04:39:23', '2025-04-24 04:39:23'),
(681, 1, 135, 1, '2025-04-24 04:39:34', '2025-04-24 04:39:34'),
(682, 2, 135, 1, '2025-04-24 04:39:34', '2025-04-24 04:39:34'),
(683, 3, 135, 1, '2025-04-24 04:39:34', '2025-04-24 04:39:34'),
(684, 4, 135, 1, '2025-04-24 04:39:34', '2025-04-24 04:39:34'),
(685, 5, 135, 1, '2025-04-24 04:39:34', '2025-04-24 04:39:34'),
(686, 1, 136, 1, '2025-04-24 04:39:37', '2025-04-24 04:39:37'),
(687, 2, 136, 1, '2025-04-24 04:39:37', '2025-04-24 04:39:37'),
(688, 3, 136, 1, '2025-04-24 04:39:37', '2025-04-24 04:39:37'),
(689, 4, 136, 1, '2025-04-24 04:39:37', '2025-04-24 04:39:37'),
(690, 5, 136, 1, '2025-04-24 04:39:37', '2025-04-24 04:39:37');

-- --------------------------------------------------------

--
-- Table structure for table `project_tasks`
--

CREATE TABLE `project_tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `estimated_hrs` int(11) NOT NULL DEFAULT '0',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `priority` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'medium',
  `priority_color` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assign_to` text COLLATE utf8mb4_unicode_ci,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `milestone_id` int(11) NOT NULL DEFAULT '0',
  `stage_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `time_tracking` int(11) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `is_favourite` int(11) NOT NULL DEFAULT '0',
  `is_complete` int(11) NOT NULL DEFAULT '0',
  `marked_at` date DEFAULT NULL,
  `progress` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_tasks`
--

INSERT INTO `project_tasks` (`id`, `title`, `description`, `estimated_hrs`, `start_date`, `end_date`, `priority`, `priority_color`, `assign_to`, `project_id`, `milestone_id`, `stage_id`, `order`, `time_tracking`, `created_by`, `is_favourite`, `is_complete`, `marked_at`, `progress`, `created_at`, `updated_at`) VALUES
(1, 'Landing Page', '', 5, '2024-04-10', '2024-04-10', 'critical', NULL, '', 1, 0, 1, 0, 0, 0, 0, 0, NULL, '0', '2024-04-10 07:48:53', '2024-04-10 07:48:53'),
(2, 'todo task test', 'efsdv dhrturtu', 4, '2024-06-03', '2024-06-03', 'high', NULL, '', 5, 0, 17, 0, 1, 0, 0, 0, NULL, '0', '2024-06-03 09:50:36', '2024-06-03 10:32:03'),
(3, 'todo task test', 'rt rthdrtrdty', 4, '2024-06-03', '2024-06-03', 'critical', '#8e44ad', '', 5, 0, 17, 2, 1, 0, 0, 0, NULL, '19', '2024-06-03 09:50:51', '2024-06-03 13:08:23'),
(4, 'ysrt rt', 'h rthrtyh rthyr', 54, '2024-06-03', '2024-06-03', 'critical', NULL, '', 5, 0, 19, 0, 0, 0, 0, 0, NULL, '0', '2024-06-03 09:51:30', '2024-06-03 09:51:30'),
(5, 'fg trhy dh', 'd fhdh r', 55, '2024-06-03', '2024-06-03', 'critical', NULL, '', 5, 0, 18, 0, 1, 0, 0, 0, NULL, '0', '2024-06-03 09:57:42', '2024-06-03 10:34:03'),
(6, 'yr nrty rt', 'rthd uty', 56, '2024-06-03', '2024-06-03', 'medium', NULL, '', 5, 0, 20, 1, 0, 0, 0, 1, '2024-06-03', '0', '2024-06-03 09:58:04', '2024-06-03 13:08:25'),
(7, 'demo', 'htffghgh', 10, '2024-06-03', '2024-06-27', 'high', NULL, '9,12,11', 2, 0, 6, 1, 0, 0, 0, 0, NULL, '0', '2024-06-03 11:12:48', '2024-06-03 12:51:44'),
(8, 'test att', 'safs adrgserg', 3454, '2024-06-05', '2024-06-27', 'medium', NULL, '13,17', 5, 1, 17, 0, 1, 0, 0, 0, NULL, '0', '2024-06-04 07:35:41', '2024-06-05 10:27:48'),
(9, 'fdfff', 'sadfgfdhgh', 10, '2024-06-04', '2024-06-04', 'critical', NULL, '19', 7, 0, 26, 1, 0, 0, 0, 0, NULL, '0', '2024-06-04 12:12:53', '2024-06-04 12:13:39'),
(28, 'T1', 'Abcd', 1, '2024-07-22', '2024-07-23', 'high', NULL, '', 27, 18, 106, 0, 0, 0, 0, 0, NULL, '0', '2024-07-22 08:02:58', '2024-07-22 08:02:58'),
(29, 'T2', 'abcd', 1, '2024-07-22', '2024-07-23', 'critical', NULL, '', 27, 17, 107, 0, 0, 0, 0, 0, NULL, '0', '2024-07-22 08:03:39', '2024-07-22 08:03:39'),
(30, 'T1', 'cdsvcdc', 10, '2024-07-26', '2024-07-26', 'critical', NULL, '', 32, 25, 128, 1, 0, 0, 0, 0, NULL, '0', '2024-07-26 07:26:11', '2024-08-09 11:06:50'),
(31, 'T1', 'dsvdsvvfdv', 1000, '2024-07-26', '2024-07-26', 'critical', NULL, '', 33, 20, 131, 0, 0, 0, 0, 0, NULL, '0', '2024-07-26 07:28:17', '2024-07-26 07:28:17'),
(32, 'T1', 'vcdsvcds', 1000, '2024-07-25', '2024-07-25', 'critical', NULL, '', 33, 21, 131, 0, 0, 0, 0, 0, NULL, '0', '2024-07-26 07:29:22', '2024-08-07 11:43:13'),
(34, 'T1', 'wdwqdwqd', 100, '2024-07-26', '2024-07-26', 'medium', NULL, '45', 33, 21, 131, 0, 0, 0, 0, 0, NULL, '0', '2024-07-26 07:54:56', '2024-07-26 07:54:56'),
(35, 'T1', 'dcdsc', 100, '2024-07-26', '2024-07-26', 'critical', NULL, '', 33, 20, 131, 0, 0, 0, 0, 0, NULL, '0', '2024-07-26 07:56:38', '2024-07-26 07:56:38'),
(42, 'T2', 'task 2', 10, '2024-08-22', '2024-08-24', 'critical', NULL, '', 32, 25, 127, 0, 0, 0, 0, 0, NULL, '0', '2024-08-22 12:26:31', '2024-10-10 13:23:37'),
(44, 'jk', 'hj', 7, '2024-09-05', '2024-09-05', 'medium', NULL, '9', 2, 0, 5, 0, 0, 0, 0, 0, NULL, '0', '2024-09-05 09:53:29', '2024-09-05 09:53:54'),
(45, 'Header', 'fgfgggjghj', 11, '2024-09-05', '2024-09-04', 'critical', NULL, '49', 69, 0, 276, 0, 0, 0, 0, 0, NULL, '0', '2024-09-05 10:01:30', '2024-09-05 10:03:23'),
(46, 'dg', 'dfg', 3, '2024-09-05', '2024-09-05', 'critical', NULL, '9', 2, 0, 5, 0, 0, 0, 0, 0, NULL, '0', '2024-09-05 10:17:25', '2024-09-05 10:17:25'),
(49, 'Header', 'demo', 11, '2024-09-05', '2024-09-05', 'critical', NULL, '9', 70, 0, 280, 0, 0, 0, 0, 0, NULL, '0', '2024-09-05 10:36:42', '2024-09-05 10:36:42'),
(50, 'ert', 'wet', 45, '2024-09-05', '2024-09-05', 'critical', NULL, '9', 70, 0, 280, 0, 0, 0, 0, 0, NULL, '0', '2024-09-05 10:36:43', '2024-09-05 10:36:43'),
(51, 'AditiOne', 'fgh', 45, '2024-09-05', '2024-09-05', 'critical', NULL, '49,9', 70, 0, 280, 0, 0, 0, 0, 0, NULL, '0', '2024-09-05 10:41:06', '2024-09-05 10:41:06'),
(54, 'jk', 'hj', 7, '2024-09-05', '2024-09-05', 'medium', NULL, '9', 76, 44, 304, 0, 0, 0, 0, 0, NULL, '0', '2024-09-30 07:31:25', '2024-09-30 07:31:25'),
(55, 'dg', 'dfg', 3, '2024-09-05', '2024-09-05', 'critical', NULL, '9', 76, 46, 304, 0, 0, 0, 0, 0, NULL, '0', '2024-09-30 07:31:25', '2024-09-30 07:31:25'),
(56, 'demo', 'htffghgh', 10, '2024-06-03', '2024-06-27', 'high', NULL, '9,12,11', 76, 7, 305, 1, 0, 0, 0, 0, NULL, '0', '2024-09-30 07:31:25', '2024-09-30 07:31:25'),
(62, 'sdf', 'sdf', 35, '2024-10-01', '2024-10-01', 'high', NULL, '48', 85, 0, 340, 0, 0, 0, 0, 0, NULL, '0', '2024-10-01 12:10:00', '2024-10-01 12:10:00'),
(63, 'et', 'et', 56, '2024-10-01', '2024-10-01', 'critical', NULL, '48', 85, 0, 341, 0, 0, 0, 0, 0, NULL, '0', '2024-10-01 12:10:12', '2024-10-01 12:10:12'),
(64, 'tyu', 'yu', 56, '2024-10-01', '2024-10-25', 'critical', NULL, '48', 85, 0, 342, 1, 0, 0, 0, 0, NULL, '0', '2024-10-01 12:10:26', '2024-10-01 12:11:42'),
(65, 'ytu', 'ytu', 7, '2024-10-01', '2024-10-18', 'critical', NULL, '48', 85, 0, 343, 0, 0, 0, 0, 1, '2024-10-01', '0', '2024-10-01 12:11:32', '2024-10-01 12:11:32'),
(66, 'test task', '', 45, '2024-10-01', '2024-10-01', 'high', NULL, '48', 87, 0, 348, 0, 0, 0, 0, 0, NULL, '0', '2024-10-01 13:43:41', '2024-10-01 13:43:41'),
(67, 'test123', '', 4, '2024-10-01', '2024-10-01', 'critical', NULL, '48', 88, 0, 355, 1, 0, 0, 0, 1, '2024-10-01', '0', '2024-10-01 14:00:28', '2024-10-01 14:00:36'),
(68, 'jhhj', '', 65, '2024-10-01', '2024-10-01', 'critical', NULL, '48', 88, 0, 353, 0, 0, 0, 0, 0, NULL, '0', '2024-10-01 14:01:14', '2024-10-01 14:01:14'),
(69, 'TA1', '', 100, '2024-10-09', '2024-10-09', 'critical', NULL, '45', 33, 20, 131, 0, 0, 0, 0, 0, NULL, '0', '2024-10-09 13:05:48', '2024-10-09 13:05:48'),
(71, 'Task1', '', 3, '2024-10-10', '2024-10-10', 'critical', NULL, '45', 33, 20, 132, 0, 0, 0, 0, 0, NULL, '0', '2024-10-10 07:33:37', '2024-10-10 07:33:37'),
(74, 'T1', 'NA', 10, '2024-11-27', '2024-11-27', 'critical', '#3498db', '62,45', 104, 36, 417, 1, 0, 0, 0, 0, NULL, '0', '2024-11-27 13:12:03', '2024-12-03 10:56:45'),
(75, 'Added login and register page', 'Added login and register page with backend', 3, '2024-12-03', '2024-12-03', 'high', '#2ecc71', '65', 84, 0, 339, 0, 0, 0, 0, 1, '2025-02-10', '0', '2024-12-03 09:31:50', '2025-02-10 07:08:41'),
(76, 'half don', 'dffsdsfsdf', 12, '2024-12-03', '2024-12-03', 'high', NULL, '65', 84, 0, 337, 1, 0, 0, 0, 0, NULL, '0', '2024-12-03 09:32:15', '2025-02-10 07:15:42'),
(77, 'Task inReview', 'hfghfhf', 12, '2024-12-03', '2024-12-03', 'critical', NULL, '65', 84, 0, 338, 1, 0, 0, 0, 0, NULL, '0', '2024-12-03 09:32:36', '2024-12-03 09:32:40'),
(78, 'Task Done', 'hggfhgfhh', 3434, '2024-12-03', '2024-12-03', 'critical', NULL, '51,65', 84, 0, 339, 0, 0, 0, 0, 1, '2024-12-03', '0', '2024-12-03 09:33:21', '2024-12-03 09:33:21'),
(79, 'Home page done', 'Home page design has been done.', 12, '2024-12-03', '2024-12-04', 'high', NULL, '65', 84, 37, 339, 0, 0, 0, 0, 1, '2024-12-03', '0', '2024-12-03 09:58:59', '2024-12-03 09:59:37'),
(80, 'kjbjk', 'nkljnl', 3213, '2024-12-03', '2024-12-12', 'medium', NULL, '48,64', 84, 37, 337, 0, 0, 0, 0, 0, NULL, '0', '2024-12-03 11:16:18', '2025-02-10 07:15:42'),
(81, 'Home page backend', 'This is a task description.', 2, '2025-02-08', '2025-02-20', 'high', '#2ecc71', '365', 110, 38, 444, 0, 0, 0, 0, 1, '2025-02-08', '0', '2025-02-08 10:30:11', '2025-02-08 10:34:28'),
(82, 'new me task', 'dfff', 1, '2025-02-08', '2025-02-20', 'medium', NULL, '365', 110, 38, 442, 0, 0, 0, 0, 0, NULL, '0', '2025-02-08 10:50:21', '2025-02-13 12:56:38'),
(83, 'test task', '', 45, '2024-10-01', '2024-10-01', 'high', NULL, '48', 111, 66, 445, 0, 0, 0, 0, 0, NULL, '0', '2025-02-10 07:03:40', '2025-02-10 07:03:40'),
(84, 'Project open task', 'this is project open task', 456, '2025-02-10', '2025-02-12', 'high', NULL, '64', 84, 0, 336, 0, 0, 0, 0, 0, NULL, '0', '2025-02-10 07:14:56', '2025-02-10 07:14:56'),
(85, 'task one', 'ssadas', 5656, '2025-02-14', '2025-02-15', 'high', NULL, '381', 109, 0, 438, 0, 0, 0, 0, 0, NULL, '0', '2025-02-14 06:01:38', '2025-02-14 06:01:38'),
(86, 'cvfsdf', 'dfsdfdfs', 56456, '2025-02-14', '2025-02-14', 'medium', NULL, '381', 109, 0, 440, 0, 0, 0, 0, 1, '2025-02-14', '0', '2025-02-14 06:02:31', '2025-02-14 06:03:05'),
(87, 'nhnfg', 'fghgfhf', 35656, '2025-02-14', '2025-02-14', 'medium', NULL, '382', 108, 0, 435, 0, 0, 0, 0, 0, NULL, '0', '2025-02-14 06:04:01', '2025-02-14 06:04:01'),
(88, 'dfdf', 'dfsdfs', 345, '2025-02-14', '2025-02-14', 'high', NULL, '382', 108, 0, 434, 0, 0, 0, 0, 0, NULL, '0', '2025-02-14 06:04:34', '2025-02-14 06:04:34'),
(89, 'Dedign first figma', 'Design figma', 11, '2025-02-14', '2025-02-17', 'high', NULL, '364,366,381,382', 113, 0, 453, 0, 0, 0, 0, 0, NULL, '0', '2025-02-14 06:09:12', '2025-02-14 06:09:12'),
(90, 'Task Tracker', 'This is a task tracker.', 10, '2025-02-15', '2025-02-22', 'critical', NULL, '64', 84, 37, 336, 0, 0, 0, 0, 0, NULL, '0', '2025-02-15 08:12:53', '2025-02-15 08:12:53'),
(92, 'test cad', 'rfrfg rwewrtw', 5353, '2025-02-21', '2025-02-25', 'critical', NULL, '365', 110, 0, 441, 0, 0, 0, 0, 0, NULL, '0', '2025-02-21 06:53:41', '2025-02-21 06:53:41'),
(93, 'calendar task', 'test calendar task', 22, '2025-02-21', '2025-02-22', 'high', NULL, '365', 110, 0, 442, 0, 0, 0, 0, 0, NULL, '0', '2025-02-21 07:02:55', '2025-02-21 07:02:55'),
(95, 'abc', 'abcd', 5, '2025-04-22', '2025-04-22', 'critical', NULL, '400', 124, 0, 501, 0, 0, 0, 0, 0, NULL, '0', '2025-04-22 06:33:51', '2025-04-22 06:33:51'),
(96, 'abc', 'test', 9, '2025-04-22', '2025-04-22', 'critical', NULL, '400', 124, 0, 499, 0, 0, 0, 0, 0, NULL, '0', '2025-04-22 07:09:40', '2025-04-22 07:13:25');

-- --------------------------------------------------------

--
-- Table structure for table `project_task_timers`
--

CREATE TABLE `project_task_timers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `task_id` int(11) NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_task_timers`
--

INSERT INTO `project_task_timers` (`id`, `task_id`, `start_time`, `end_time`, `created_at`, `updated_at`) VALUES
(1, 2, '2024-06-03 10:32:03', NULL, '2024-06-03 10:32:03', '2024-06-03 10:32:03'),
(2, 3, '2024-06-03 10:32:58', NULL, '2024-06-03 10:32:58', '2024-06-03 10:32:58'),
(3, 5, '2024-06-03 10:34:03', NULL, '2024-06-03 10:34:03', '2024-06-03 10:34:03'),
(4, 8, '2024-06-04 07:37:21', '2024-06-04 11:14:35', '2024-06-04 07:37:21', '2024-06-04 11:14:35'),
(5, 8, '2024-06-04 11:14:55', NULL, '2024-06-04 11:14:55', '2024-06-04 11:14:55'),
(6, 9, '2024-06-04 12:13:08', '2024-06-04 12:13:39', '2024-06-04 12:13:08', '2024-06-04 12:13:39'),
(7, 16, '2024-07-18 09:19:59', NULL, '2024-07-18 09:19:59', '2024-07-18 09:19:59'),
(8, 10, '2024-07-18 11:30:59', '2024-07-18 12:52:32', '2024-07-18 11:30:59', '2024-07-18 12:52:32'),
(9, 36, '2024-07-27 10:25:26', NULL, '2024-07-27 10:25:26', '2024-07-27 10:25:26'),
(10, 26, '2024-08-21 10:03:07', '2024-08-21 12:08:07', '2024-08-21 10:03:07', '2024-08-21 12:08:07'),
(11, 41, '2024-08-21 10:07:14', '2024-08-22 12:10:39', '2024-08-21 10:07:14', '2024-08-22 12:10:39'),
(12, 15, '2024-08-21 12:09:26', '2024-08-21 12:11:54', '2024-08-21 12:09:26', '2024-08-21 12:11:54'),
(13, 17, '2024-08-21 12:09:40', '2024-08-21 12:10:01', '2024-08-21 12:09:40', '2024-08-21 12:10:01'),
(14, 10, '2024-08-21 12:12:26', '2024-08-21 12:13:04', '2024-08-21 12:12:26', '2024-08-21 12:13:04'),
(15, 15, '2024-08-22 07:17:09', '2024-08-22 07:33:56', '2024-08-22 07:17:09', '2024-08-22 07:33:56'),
(16, 37, '2024-08-22 07:35:12', NULL, '2024-08-22 07:35:12', '2024-08-22 07:35:12'),
(17, 41, '2024-08-23 05:40:29', '2024-08-23 07:08:02', '2024-08-23 05:40:29', '2024-08-23 07:08:02'),
(18, 73, '2024-11-27 10:47:38', '2024-11-27 10:55:33', '2024-11-27 10:47:38', '2024-11-27 10:55:33'),
(19, 74, '2024-12-03 10:55:21', '2024-12-03 10:56:45', '2024-12-03 10:55:21', '2024-12-03 10:56:45'),
(20, 75, '2024-12-03 11:09:24', '2024-12-03 11:11:49', '2024-12-03 11:09:24', '2024-12-03 11:11:49'),
(21, 82, '2025-02-12 19:23:24', '2025-02-12 19:25:38', '2025-02-12 13:53:24', '2025-02-12 13:55:38');

-- --------------------------------------------------------

--
-- Table structure for table `project_users`
--

CREATE TABLE `project_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_permission` text COLLATE utf8mb4_unicode_ci,
  `invited_by` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_users`
--

INSERT INTO `project_users` (`id`, `project_id`, `user_id`, `permission`, `user_permission`, `invited_by`, `created_at`, `updated_at`) VALUES
(1, 1, 6, 'owner', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 0, '2024-04-10 07:46:29', '2024-04-10 07:46:29'),
(3, 2, 12, 'client', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 9, '2024-05-09 08:42:49', '2024-05-09 08:42:49'),
(8, 5, 17, 'client', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 13, '2024-06-03 10:21:39', '2024-06-03 10:21:39'),
(39, 27, 37, 'user', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 35, '2024-07-19 05:25:13', '2024-07-19 05:25:13'),
(41, 28, 37, 'user', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 35, '2024-07-19 07:20:36', '2024-07-19 07:20:36'),
(42, 27, 42, 'client', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 35, '2024-07-19 07:22:40', '2024-07-19 07:22:40'),
(43, 28, 42, 'user', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 35, '2024-07-19 07:23:15', '2024-07-19 07:23:15'),
(47, 29, 37, 'client', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 35, '2024-07-19 07:26:28', '2024-07-19 07:26:28'),
(52, 27, 44, 'client', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 35, '2024-07-20 11:52:18', '2024-07-20 11:52:18'),
(115, 76, 12, 'client', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 9, '2024-09-30 07:31:25', '2024-09-30 07:31:25'),
(130, 84, 48, 'owner', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 0, '2024-10-01 09:48:40', '2024-10-01 09:48:40'),
(131, 84, 51, 'client', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 48, '2024-10-01 09:50:44', '2024-10-01 09:50:44'),
(132, 85, 48, 'owner', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 0, '2024-10-01 11:08:45', '2024-10-01 11:08:45'),
(134, 87, 48, 'owner', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 0, '2024-10-01 12:26:10', '2024-10-01 12:26:10'),
(135, 88, 48, 'owner', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 0, '2024-10-01 13:59:54', '2024-10-01 13:59:54'),
(155, 106, 64, 'owner', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 0, '2024-12-03 08:00:05', '2024-12-03 08:00:05'),
(156, 84, 65, 'client', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 48, '2024-12-03 08:31:46', '2024-12-03 08:31:46'),
(158, 84, 64, 'user', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 48, '2024-12-03 10:13:10', '2024-12-03 10:13:10'),
(159, 108, 364, 'owner', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 0, '2025-02-08 08:20:33', '2025-02-08 08:20:33'),
(160, 109, 364, 'owner', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 0, '2025-02-08 08:27:15', '2025-02-08 08:27:15'),
(161, 110, 48, 'owner', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 0, '2025-02-08 10:15:47', '2025-02-08 10:15:47'),
(162, 110, 365, 'user', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 48, '2025-02-08 10:16:30', '2025-02-08 10:16:30'),
(163, 111, 48, 'owner', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 0, '2025-02-10 07:03:40', '2025-02-10 07:03:40'),
(164, 112, 48, 'owner', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 0, '2025-02-10 11:11:34', '2025-02-10 11:11:34'),
(165, 110, 51, 'client', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 48, '2025-02-10 11:17:33', '2025-02-10 11:17:33'),
(166, 109, 381, 'user', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 364, '2025-02-14 06:01:09', '2025-02-14 06:01:09'),
(167, 108, 382, 'user', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 364, '2025-02-14 06:03:28', '2025-02-14 06:03:28'),
(168, 113, 364, 'owner', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 0, '2025-02-14 06:08:08', '2025-02-14 06:08:08'),
(169, 113, 366, 'user', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 364, '2025-02-14 06:08:15', '2025-02-14 06:08:15'),
(170, 113, 381, 'user', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 364, '2025-02-14 06:08:16', '2025-02-14 06:08:16'),
(171, 113, 382, 'user', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 364, '2025-02-14 06:08:17', '2025-02-14 06:08:17'),
(172, 114, 48, 'owner', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 0, '2025-02-14 07:37:18', '2025-02-14 07:37:18'),
(173, 114, 51, 'client', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 48, '2025-02-14 07:41:58', '2025-02-14 07:41:58'),
(174, 115, 48, 'owner', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 0, '2025-02-14 10:53:22', '2025-02-14 10:53:22'),
(175, 116, 48, 'owner', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 0, '2025-02-14 11:02:14', '2025-02-14 11:02:14'),
(176, 117, 48, 'owner', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 0, '2025-02-14 11:05:15', '2025-02-14 11:05:15'),
(178, 119, 365, 'owner', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 0, '2025-02-14 11:40:04', '2025-02-14 11:40:04'),
(180, 119, 383, 'client', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 365, '2025-02-14 11:51:09', '2025-02-14 11:51:09'),
(181, 120, 2, 'owner', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 0, '2025-03-06 11:12:06', '2025-03-06 11:12:06'),
(182, 121, 398, 'owner', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 0, '2025-04-17 08:48:25', '2025-04-17 08:48:25'),
(183, 122, 400, 'owner', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 0, '2025-04-18 08:41:17', '2025-04-18 08:41:17'),
(185, 124, 400, 'owner', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 0, '2025-04-19 04:19:07', '2025-04-19 04:19:07'),
(186, 124, 401, 'user', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 400, '2025-04-24 04:05:18', '2025-04-24 04:05:18'),
(187, 124, 398, 'client', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 400, '2025-04-24 04:23:26', '2025-04-24 04:23:26'),
(188, 125, 400, 'owner', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 0, '2025-04-24 04:37:57', '2025-04-24 04:37:57'),
(189, 126, 400, 'owner', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 0, '2025-04-24 04:38:09', '2025-04-24 04:38:09'),
(190, 127, 400, 'owner', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 0, '2025-04-24 04:38:19', '2025-04-24 04:38:19'),
(191, 128, 400, 'owner', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 0, '2025-04-24 04:38:30', '2025-04-24 04:38:30'),
(192, 129, 400, 'owner', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 0, '2025-04-24 04:38:40', '2025-04-24 04:38:40'),
(193, 130, 400, 'owner', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 0, '2025-04-24 04:38:51', '2025-04-24 04:38:51'),
(194, 131, 400, 'owner', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 0, '2025-04-24 04:39:10', '2025-04-24 04:39:10'),
(195, 132, 400, 'owner', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 0, '2025-04-24 04:39:11', '2025-04-24 04:39:11'),
(196, 133, 400, 'owner', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 0, '2025-04-24 04:39:14', '2025-04-24 04:39:14'),
(197, 134, 400, 'owner', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 0, '2025-04-24 04:39:23', '2025-04-24 04:39:23'),
(198, 135, 400, 'owner', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 0, '2025-04-24 04:39:34', '2025-04-24 04:39:34'),
(199, 136, 400, 'owner', '[\"create milestone\",\"edit milestone\",\"delete milestone\",\"create task\",\"edit task\",\"delete task\",\"show task\",\"move task\",\"create timesheet\",\"show as admin timesheet\",\"create expense\",\"show expense\",\"show activity\",\"project setting\"]', 0, '2025-04-24 04:39:36', '2025-04-24 04:39:36');

-- --------------------------------------------------------

--
-- Table structure for table `referral_settings`
--

CREATE TABLE `referral_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `percentage` int(11) NOT NULL,
  `minimum_threshold_amount` int(11) NOT NULL,
  `is_enable` int(11) NOT NULL DEFAULT '0',
  `guideline` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `referral_settings`
--

INSERT INTO `referral_settings` (`id`, `percentage`, `minimum_threshold_amount`, `is_enable`, `guideline`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 5, 200, 1, '<p>test <span style=\"background-color: rgb(18, 38, 63); color: rgb(255, 255, 255); font-size: 24px;\">Referral Program</span></p>', 1, '2024-06-06 07:57:22', '2024-06-06 07:58:04');

-- --------------------------------------------------------

--
-- Table structure for table `referral_transactions`
--

CREATE TABLE `referral_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `plan_price` decimal(15,2) NOT NULL DEFAULT '0.00',
  `commission` int(11) NOT NULL,
  `referral_code` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'local_storage_validation', '3dm,ai,avi,bin,bmp,c,css,csv,doc,docx,jpeg,jpg,pdf,php,png,xls,xlsx,xml,zip', 1, NULL, NULL),
(2, 'wasabi_storage_validation', 'jpg,jpeg,png,xlsx,xls,csv,pdf', 1, NULL, NULL),
(3, 's3_storage_validation', 'jpg,jpeg,png,xlsx,xls,csv,pdf', 1, NULL, NULL),
(4, 'local_storage_max_upload_size', '2048001', 1, NULL, NULL),
(5, 'wasabi_max_upload_size', '2048000', 1, NULL, NULL),
(6, 's3_max_upload_size', '2048000', 1, NULL, NULL),
(7, 'storage_setting', 'local', 1, NULL, NULL),
(8, 'mail_driver', 'smtp', 1, '2024-02-26 12:15:35', '2025-04-10 13:31:02'),
(9, 'mail_host', 'smtp-relay.brevo.com', 1, '2024-02-26 12:15:35', '2025-04-10 13:31:02'),
(10, 'mail_port', '587', 1, '2024-02-26 12:15:35', '2025-04-10 13:31:02'),
(11, 'mail_username', '6eef12002@smtp-brevo.com', 1, '2024-02-26 12:15:35', '2025-04-10 13:31:02'),
(12, 'mail_password', 'xsmtpsib-a7cf709d1b372e662324bbe79f73c91fb512bace9d772a160205f3d25eb2a686-hcv32NOAZEfgSVKa', 1, '2024-02-26 12:15:35', '2025-04-10 13:31:02'),
(13, 'mail_encryption', 'TLS', 1, '2024-02-26 12:15:35', '2025-04-10 13:31:02'),
(14, 'mail_from_address', 'do-not-reply@taskmagix.com', 1, '2024-02-26 12:15:35', '2025-04-10 13:31:02'),
(15, 'mail_from_name', 'Task Magix', 1, '2024-02-26 12:15:35', '2025-04-10 13:31:02'),
(16, 'header_text', 'Task Magix', 1, '2024-02-26 12:33:53', '2025-03-04 12:37:10'),
(17, 'footer_text', 'Task Magix', 1, '2024-02-26 12:33:53', '2025-03-04 12:37:10'),
(18, 'default_language', 'en', 1, '2024-02-26 12:33:53', '2025-03-04 12:37:10'),
(19, 'SIGNUP', 'on', 1, '2024-02-26 12:33:53', '2025-03-04 12:37:10'),
(20, 'enable_landing', 'off', 1, '2024-02-26 12:33:53', '2025-03-04 12:37:10'),
(21, 'color', '#449fc6', 1, '2024-02-26 12:33:53', '2025-03-04 12:37:10'),
(22, 'footer_link_1', 'Support', 1, '2024-02-26 12:33:53', '2025-02-10 05:19:00'),
(23, 'footer_value_1', '#', 1, '2024-02-26 12:33:53', '2025-02-10 05:19:00'),
(24, 'footer_link_2', 'Terms', 1, '2024-02-26 12:33:53', '2025-02-10 05:19:00'),
(25, 'footer_value_2', '#', 1, '2024-02-26 12:33:53', '2025-02-10 05:19:00'),
(26, 'footer_link_3', 'Privacy', 1, '2024-02-26 12:33:53', '2025-02-10 05:19:00'),
(27, 'footer_value_3', '#', 1, '2024-02-26 12:33:53', '2025-02-10 05:19:00'),
(28, 'enable_rtl', 'off', 1, '2024-02-26 12:33:53', '2025-03-04 12:37:10'),
(29, 'timezone', 'Asia/Calcutta', 1, '2024-02-26 12:33:53', '2025-03-04 12:37:10'),
(30, 'gdpr_cookie', 'off', 1, '2024-02-26 12:33:53', '2025-03-04 12:37:10'),
(31, 'verification_btn', 'on', 1, '2024-02-26 12:33:53', '2025-03-04 12:37:10'),
(32, 'cookie_text', '', 1, '2024-02-26 12:33:53', '2025-03-04 12:37:10'),
(101, 'recaptcha_module', 'no', 1, NULL, NULL),
(102, 'google_recaptcha_key', '6LfX5NwqAAAAAA0WCX56tDELRw6YyztN0yVyMldu', 1, NULL, NULL),
(103, 'google_recaptcha_secret', '6LfX5NwqAAAAAI0as6WavLOfbKffCeDJPXpDe1tE', 1, NULL, NULL),
(107, 'color', '#51459d', 3, '2024-02-28 09:45:22', '2024-02-28 09:45:29'),
(108, 'default_owner_language', 'en', 3, '2024-02-28 09:45:22', '2024-02-28 09:45:29'),
(109, 'enable_rtl', 'off', 3, '2024-02-28 09:45:22', '2024-02-28 09:45:29'),
(181, 'color', '#449fc6', 9, '2024-05-09 08:48:50', '2024-05-09 08:48:54'),
(182, 'default_owner_language', 'en', 9, '2024-05-09 08:48:50', '2024-05-09 08:48:54'),
(183, 'enable_rtl', 'off', 9, '2024-05-09 08:48:50', '2024-05-09 08:48:54'),
(405, 'color', '#449fc6', 13, '2024-05-23 09:21:32', '2024-07-01 12:56:40'),
(406, 'enable_rtl', 'off', 13, '2024-05-23 09:21:32', '2024-07-01 12:56:40'),
(407, 'default_owner_language', 'en', 13, '2024-05-23 09:21:32', '2024-07-01 12:56:40'),
(605, 'color', '#51459d', 33, '2024-07-08 12:07:49', '2024-07-08 12:08:04'),
(606, 'default_owner_language', 'en', 33, '2024-07-08 12:07:49', '2024-07-08 12:08:04'),
(607, 'enable_rtl', 'off', 33, '2024-07-08 12:07:49', '2024-07-08 12:08:04'),
(620, 'color', '#449fc6', 35, '2024-07-17 12:50:14', '2024-07-22 06:44:14'),
(621, 'enable_rtl', 'off', 35, '2024-07-17 12:50:14', '2024-07-22 06:44:14'),
(622, 'default_owner_language', 'en', 35, '2024-07-17 12:50:14', '2024-07-22 06:44:14'),
(656, 'color', '#449fc6', 39, '2024-07-18 07:23:48', '2024-08-24 06:44:03'),
(657, 'default_owner_language', 'en', 39, '2024-07-18 07:23:48', '2024-08-24 06:44:03'),
(658, 'enable_rtl', 'off', 39, '2024-07-18 07:23:48', '2024-08-24 06:44:03'),
(881, 'zoom_account_id', '', 39, '2024-08-24 06:53:01', '2024-08-24 06:53:01'),
(882, 'zoom_client_id', '', 39, '2024-08-24 06:53:01', '2024-08-24 06:53:01'),
(883, 'zoom_client_secret', '', 39, '2024-08-24 06:53:01', '2024-08-24 06:53:01'),
(890, 'pusher_app_id', '1859945', 1, '2024-09-04 12:34:57', '2024-10-07 13:05:36'),
(891, 'pusher_app_key', '4371c35223642ebdcedc', 1, '2024-09-04 12:34:57', '2024-10-07 13:05:36'),
(892, 'pusher_app_secret', '768554c8b55e0cf2b1fc', 1, '2024-09-04 12:34:57', '2024-10-07 13:05:36'),
(893, 'pusher_app_cluster', 'ap2', 1, '2024-09-04 12:34:57', '2024-10-07 13:05:36'),
(900, 'disable_lang', 'off', 1, NULL, NULL),
(1099, 'enable_cookie', 'on', 1, '2024-10-08 09:41:18', '2024-10-08 09:41:18'),
(1100, 'cookie_logging', 'on', 1, '2024-10-08 09:41:18', '2024-10-08 09:41:18'),
(1101, 'cookie_title', 'We use cookies!', 1, '2024-10-08 09:41:18', '2024-10-08 09:41:18'),
(1102, 'cookie_description', 'Hi, this website uses essential cookies to ensure its proper operation and tracking cookies to understand how you interact with it', 1, '2024-10-08 09:41:18', '2024-10-08 09:41:18'),
(1103, 'necessary_cookies', 'on', 1, '2024-10-08 09:41:18', '2024-10-08 09:41:18'),
(1104, 'strictly_cookie_title', 'Strictly necessary cookies', 1, '2024-10-08 09:41:18', '2024-10-08 09:41:18'),
(1105, 'strictly_cookie_description', 'These cookies are essential for the proper functioning of my website. Without these cookies, the website would not work properly', 1, '2024-10-08 09:41:18', '2024-10-08 09:41:18'),
(1106, 'more_information_title', 'For any queries in relation to our policy on cookies and your choices, please contact us', 1, '2024-10-08 09:41:18', '2024-10-08 09:41:18'),
(1107, 'contactus_url', '#', 1, '2024-10-08 09:41:18', '2024-10-08 09:41:18'),
(1250, 'meta_image', '1739165025_meta_image.png', 1, '2025-02-10 05:23:45', '2025-02-10 05:23:45'),
(1251, 'meta_keywords', 'task magix', 1, '2025-02-10 05:23:45', '2025-02-10 05:23:45'),
(1252, 'meta_description', 'Taskmagix dashboard', 1, '2025-02-10 05:23:45', '2025-02-10 05:23:45'),
(1253, 'zoom_account_id', '3rdLNZtnQFmSPxtMICJkog', 48, '2025-02-10 09:55:24', '2025-02-10 09:55:24'),
(1254, 'zoom_client_id', 'DNEfrJ3TsC6uEodCQfaTQ', 48, '2025-02-10 09:55:24', '2025-02-10 09:55:24'),
(1255, 'zoom_client_secret', 'kDOBS4MQoS0OxX6VBNeb5lm4rGQv2lJ8', 48, '2025-02-10 09:55:24', '2025-02-10 09:55:24'),
(1256, 'slack_webhook', 'https://hooks.slack.com/services/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', 48, '2025-02-10 10:04:00', '2025-02-10 10:04:00'),
(1257, 'is_project_enabled', '1', 48, '2025-02-10 10:04:00', '2025-02-10 10:04:00'),
(1258, 'task_notification', '1', 48, '2025-02-10 10:04:00', '2025-02-10 10:04:00'),
(1259, 'invoice_notificaation', '1', 48, '2025-02-10 10:04:00', '2025-02-10 10:04:00'),
(1260, 'task_move_notificaation', '1', 48, '2025-02-10 10:04:00', '2025-02-10 10:04:00'),
(1261, 'mileston_notificaation', '1', 48, '2025-02-10 10:04:00', '2025-02-10 10:04:00'),
(1262, 'milestone_status_notificaation', '1', 48, '2025-02-10 10:04:00', '2025-02-10 10:04:00'),
(1263, 'invoice_status_notificaation', '1', 48, '2025-02-10 10:04:00', '2025-02-10 10:04:00'),
(1264, 'telegram_accestoken', '8141047415:AAHXAr8Q952dROStRgCRy4eR7yzAJ93n6aE', 48, '2025-02-10 10:27:32', '2025-02-10 10:27:32'),
(1265, 'telegram_chatid', '5799465228', 48, '2025-02-10 10:27:32', '2025-02-10 10:27:32'),
(1266, 'telegram_is_project_enabled', '1', 48, '2025-02-10 10:27:32', '2025-02-10 10:27:32'),
(1267, 'telegram_task_notification', '1', 48, '2025-02-10 10:27:32', '2025-02-10 10:27:32'),
(1268, 'telegram_invoice_notificaation', '1', 48, '2025-02-10 10:27:32', '2025-02-10 10:27:32'),
(1269, 'telegram_task_move_notificaation', '1', 48, '2025-02-10 10:27:32', '2025-02-10 10:27:32'),
(1270, 'telegram_mileston_notificaation', '1', 48, '2025-02-10 10:27:32', '2025-02-10 10:27:32'),
(1271, 'telegram_milestone_status_notificaation', '1', 48, '2025-02-10 10:27:32', '2025-02-10 10:27:32'),
(1272, 'telegram_invoice_status_notificaation', '1', 48, '2025-02-10 10:27:32', '2025-02-10 10:27:32'),
(1273, 'is_enabled', 'on', 48, '2025-02-10 11:01:26', '2025-02-10 11:01:26'),
(1274, 'google_calender_json_file', '30a973434eddfb14204a73f929ebfadb/30a973434eddfb14204a73f929ebfadb.json', 48, '2025-02-10 11:01:26', '2025-02-10 11:01:26'),
(1275, 'google_clender_id', 'dipak.dreamsint@gmail.com', 48, '2025-02-10 11:01:26', '2025-02-10 11:01:26'),
(1279, 'mail_driver', 'smtp', 48, '2025-02-10 11:04:41', '2025-02-12 11:05:01'),
(1280, 'mail_host', 'smtp.gmail.com', 48, '2025-02-10 11:04:41', '2025-02-12 11:05:01'),
(1281, 'mail_port', '587', 48, '2025-02-10 11:04:41', '2025-02-12 11:05:01'),
(1282, 'mail_username', 'dipak.dreamsint@gmail.com', 48, '2025-02-10 11:04:41', '2025-02-12 11:05:01'),
(1283, 'mail_password', 'aozlwuegpkivuqoj', 48, '2025-02-10 11:04:41', '2025-02-12 11:05:01'),
(1284, 'mail_encryption', 'TLS', 48, '2025-02-10 11:04:41', '2025-02-12 11:05:01'),
(1285, 'mail_from_address', 'dipak.kavathe@dreamsinternational.in', 48, '2025-02-10 11:04:41', '2025-02-12 11:05:01'),
(1286, 'mail_from_name', 'Dipak Kavathe', 48, '2025-02-10 11:04:41', '2025-02-12 11:05:01'),
(1327, 'color', '#449fc6', 365, '2025-02-12 14:23:31', '2025-02-12 14:23:35'),
(1328, 'enable_rtl', 'off', 365, '2025-02-12 14:23:31', '2025-02-12 14:23:35'),
(1329, 'default_owner_language', 'en', 365, '2025-02-12 14:23:31', '2025-02-12 14:23:35'),
(1377, 'color', '#449fc6', 48, '2025-02-12 14:24:44', '2025-02-18 10:52:17'),
(1378, 'enable_rtl', 'off', 48, '2025-02-12 14:24:44', '2025-02-18 10:52:17'),
(1379, 'default_owner_language', 'en', 48, '2025-02-12 14:24:44', '2025-02-18 10:52:17'),
(1394, 'chatgpt_key', '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', 1, '2025-02-12 14:29:03', '2025-02-12 14:29:03'),
(1395, 'chatgpt_model', 'gpt-3.5-turbo', 1, '2025-02-12 14:29:03', '2025-02-12 14:29:03'),
(1396, 'mail_driver', 'smtp', 365, '2025-02-14 12:01:17', '2025-02-14 12:01:17'),
(1397, 'mail_host', 'smtp.gmail.com', 365, '2025-02-14 12:01:17', '2025-02-14 12:01:17'),
(1398, 'mail_port', '587', 365, '2025-02-14 12:01:17', '2025-02-14 12:01:17'),
(1399, 'mail_username', 'dipak.dreamsint@gmail.com', 365, '2025-02-14 12:01:17', '2025-02-14 12:01:17'),
(1400, 'mail_password', 'aozlwuegpkivuqoj', 365, '2025-02-14 12:01:17', '2025-02-14 12:01:17'),
(1401, 'mail_encryption', 'TLS', 365, '2025-02-14 12:01:17', '2025-02-14 12:01:17'),
(1402, 'mail_from_address', 'dipak.dreamsint@gmail.com', 365, '2025-02-14 12:01:17', '2025-02-14 12:01:17'),
(1403, 'mail_from_name', 'Dipak Kavathe', 365, '2025-02-14 12:01:17', '2025-02-14 12:01:17'),
(1415, '_token', 'PCadOaJxrJLJmyEneZhcxOVwVdTf0v6jKOgzoh82', 48, '2025-02-18 10:45:03', '2025-02-18 10:45:14'),
(1439, 'color', '#449fc6', 400, '2025-04-24 04:33:27', '2025-04-24 04:33:39'),
(1440, 'enable_rtl', 'off', 400, '2025-04-24 04:33:27', '2025-04-24 04:33:39'),
(1441, 'default_owner_language', 'en', 400, '2025-04-24 04:33:27', '2025-04-24 04:33:39');

-- --------------------------------------------------------

--
-- Table structure for table `task_checklists`
--

CREATE TABLE `task_checklists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `task_id` int(11) NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `task_checklists`
--

INSERT INTO `task_checklists` (`id`, `name`, `task_id`, `user_type`, `created_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'disha Checklist', 3, 'User', 13, 0, '2024-06-03 10:33:23', '2024-06-03 10:33:23'),
(2, 'fsdf ae f', 5, 'User', 13, 0, '2024-06-03 10:34:11', '2024-06-03 10:34:11'),
(3, 'demo', 9, 'User', 19, 0, '2024-06-04 12:14:19', '2024-06-04 12:14:19'),
(10, 'API created', 81, 'User', 365, 0, '2025-02-08 10:33:26', '2025-02-08 10:33:26'),
(11, 'API integrated', 81, 'User', 365, 0, '2025-02-08 10:33:40', '2025-02-08 10:33:40');

-- --------------------------------------------------------

--
-- Table structure for table `task_comments`
--

CREATE TABLE `task_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `task_id` int(11) NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `task_comments`
--

INSERT INTO `task_comments` (`id`, `comment`, `task_id`, `user_type`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'dsc df', 3, 'User', 13, '2024-06-03 10:33:36', '2024-06-03 10:33:36'),
(2, 'bnvbnbn', 9, 'User', 19, '2024-06-04 12:14:28', '2024-06-04 12:14:28'),
(11, 'strat new task now', 75, 'User', 48, '2024-12-03 11:09:43', '2024-12-03 11:09:43'),
(12, 'API create and Integrated.', 81, 'User', 365, '2025-02-08 10:34:19', '2025-02-08 10:34:19'),
(13, 'abc', 96, 'User', 400, '2025-04-24 04:10:42', '2025-04-24 04:10:42'),
(14, 'abc', 96, 'User', 400, '2025-04-24 04:10:42', '2025-04-24 04:10:42'),
(15, 'abc', 96, 'User', 400, '2025-04-24 04:10:43', '2025-04-24 04:10:43'),
(16, 'abc', 96, 'User', 400, '2025-04-24 04:10:44', '2025-04-24 04:10:44');

-- --------------------------------------------------------

--
-- Table structure for table `task_files`
--

CREATE TABLE `task_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `task_id` int(11) NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `task_files`
--

INSERT INTO `task_files` (`id`, `file`, `name`, `extension`, `file_size`, `task_id`, `user_type`, `created_by`, `created_at`, `updated_at`) VALUES
(1, '81717499615_anime-landscape-for-desktop-sea-ships-colorful-clouds-scenic-tree-horizon-wallpaper.jpg', 'anime-landscape-for-desktop-sea-ships-colorful-clouds-scenic-tree-horizon-wallpaper.jpg', 'jpg', '1566.84 MB', 8, 'User', 13, '2024-06-04 11:13:35', '2024-06-04 11:13:35'),
(2, '91717503263_drag.png', 'drag.png', 'png', '15.7 MB', 9, 'User', 19, '2024-06-04 12:14:23', '2024-06-04 12:14:23'),
(6, '811739010829_174861.png', '174861.png', 'png', '11.5 MB', 81, 'User', 365, '2025-02-08 10:33:49', '2025-02-08 10:33:49');

-- --------------------------------------------------------

--
-- Table structure for table `task_stages`
--

CREATE TABLE `task_stages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `complete` tinyint(1) NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `order` int(11) NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `task_stages`
--

INSERT INTO `task_stages` (`id`, `name`, `complete`, `project_id`, `order`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Todo', 0, 1, 0, 6, '2024-04-10 07:46:29', '2024-04-10 07:46:29'),
(2, 'In Progress', 0, 1, 1, 6, '2024-04-10 07:46:29', '2024-04-10 07:46:29'),
(3, 'Review', 0, 1, 2, 6, '2024-04-10 07:46:29', '2024-04-10 07:46:29'),
(4, 'Done', 1, 1, 3, 6, '2024-04-10 07:46:29', '2024-04-10 07:46:29'),
(5, 'Todo', 0, 2, 0, 9, '2024-05-09 08:04:27', '2024-05-09 08:04:27'),
(6, 'In Progress', 0, 2, 1, 9, '2024-05-09 08:04:27', '2024-05-09 08:04:27'),
(7, 'Review', 0, 2, 2, 9, '2024-05-09 08:04:27', '2024-05-09 08:04:27'),
(8, 'Done', 1, 2, 3, 9, '2024-05-09 08:04:27', '2024-05-09 08:05:25'),
(9, 'Todo', 0, 3, 0, 13, '2024-05-23 07:18:30', '2024-05-23 07:18:30'),
(10, 'In Progress', 0, 3, 1, 13, '2024-05-23 07:18:30', '2024-05-23 07:18:30'),
(11, 'Review', 0, 3, 2, 13, '2024-05-23 07:18:30', '2024-05-23 07:18:30'),
(12, 'Done', 1, 3, 3, 13, '2024-05-23 07:18:30', '2024-05-23 07:18:30'),
(13, 'Todo', 0, 4, 0, 13, '2024-05-23 08:09:11', '2024-05-23 08:09:11'),
(14, 'In Progress', 0, 4, 1, 13, '2024-05-23 08:09:11', '2024-05-23 08:09:11'),
(15, 'Review', 0, 4, 2, 13, '2024-05-23 08:09:11', '2024-05-23 08:09:11'),
(16, 'Done', 1, 4, 3, 13, '2024-05-23 08:09:11', '2024-05-23 08:09:11'),
(17, 'Todo', 0, 5, 0, 13, '2024-05-23 09:38:18', '2024-05-23 09:38:18'),
(18, 'In Progress', 0, 5, 1, 13, '2024-05-23 09:38:18', '2024-05-23 09:38:18'),
(19, 'Review', 0, 5, 2, 13, '2024-05-23 09:38:18', '2024-05-23 09:38:18'),
(20, 'Done', 1, 5, 3, 13, '2024-05-23 09:38:18', '2024-05-23 09:38:18'),
(21, 'Todo', 0, 6, 1, 18, '2024-06-03 11:09:30', '2024-06-03 11:10:01'),
(22, 'In Progress', 0, 6, 0, 18, '2024-06-03 11:09:30', '2024-06-03 11:10:01'),
(23, 'Review', 0, 6, 2, 18, '2024-06-03 11:09:30', '2024-06-03 11:09:30'),
(24, 'Done', 1, 6, 3, 18, '2024-06-03 11:09:30', '2024-06-03 11:10:01'),
(25, 'Todo', 0, 7, 0, 19, '2024-06-04 11:52:04', '2024-06-04 11:52:04'),
(26, 'In Progress', 0, 7, 1, 19, '2024-06-04 11:52:04', '2024-06-04 11:52:04'),
(27, 'Review', 0, 7, 2, 19, '2024-06-04 11:52:04', '2024-06-04 11:52:04'),
(28, 'Done', 1, 7, 3, 19, '2024-06-04 11:52:04', '2024-06-04 11:52:04'),
(29, 'Todo', 0, 8, 0, 13, '2024-06-06 05:25:13', '2024-06-06 05:25:13'),
(30, 'In Progress', 0, 8, 1, 13, '2024-06-06 05:25:13', '2024-06-06 05:25:13'),
(31, 'Review', 0, 8, 2, 13, '2024-06-06 05:25:13', '2024-06-06 05:25:13'),
(32, 'Done', 1, 8, 3, 13, '2024-06-06 05:25:13', '2024-06-06 05:25:13'),
(33, 'Todo', 0, 9, 0, 13, '2024-06-06 08:06:08', '2024-06-06 08:06:08'),
(34, 'In Progress', 0, 9, 1, 13, '2024-06-06 08:06:08', '2024-06-06 08:06:08'),
(35, 'Review', 0, 9, 2, 13, '2024-06-06 08:06:08', '2024-06-06 08:06:08'),
(36, 'Done', 1, 9, 3, 13, '2024-06-06 08:06:08', '2024-06-06 08:06:08'),
(37, 'Todo', 0, 10, 0, 33, '2024-07-09 05:42:50', '2024-07-09 05:42:50'),
(38, 'In Progress', 0, 10, 1, 33, '2024-07-09 05:42:50', '2024-07-09 05:42:50'),
(39, 'Review', 0, 10, 2, 33, '2024-07-09 05:42:50', '2024-07-09 05:42:50'),
(40, 'Done', 1, 10, 3, 33, '2024-07-09 05:42:50', '2024-07-09 05:42:50'),
(41, 'Todo', 0, 11, 0, 33, '2024-07-09 06:51:44', '2024-07-09 06:51:44'),
(42, 'In Progress', 0, 11, 1, 33, '2024-07-09 06:51:44', '2024-07-09 06:51:44'),
(43, 'Review', 0, 11, 2, 33, '2024-07-09 06:51:44', '2024-07-09 06:51:44'),
(44, 'Done', 1, 11, 3, 33, '2024-07-09 06:51:44', '2024-07-09 06:51:44'),
(106, 'Todo', 0, 27, 0, 35, '2024-07-19 04:18:35', '2024-07-19 04:18:35'),
(107, 'In Progress', 0, 27, 1, 35, '2024-07-19 04:18:35', '2024-07-19 04:18:35'),
(108, 'Review', 0, 27, 2, 35, '2024-07-19 04:18:35', '2024-07-19 04:18:35'),
(109, 'Done', 0, 27, 3, 35, '2024-07-19 04:18:35', '2024-07-19 04:24:23'),
(110, 'Save', 1, 27, 4, 0, '2024-07-19 04:24:23', '2024-07-19 04:24:23'),
(111, 'Todo', 0, 28, 0, 35, '2024-07-19 05:34:32', '2024-07-19 05:34:32'),
(112, 'In Progress', 0, 28, 1, 35, '2024-07-19 05:34:32', '2024-07-19 05:34:32'),
(113, 'Review', 0, 28, 2, 35, '2024-07-19 05:34:32', '2024-07-19 05:34:32'),
(114, 'Done', 1, 28, 3, 35, '2024-07-19 05:34:32', '2024-07-19 05:34:32'),
(115, 'Todo', 0, 29, 0, 35, '2024-07-19 07:25:42', '2024-07-19 07:25:42'),
(116, 'In Progress', 0, 29, 1, 35, '2024-07-19 07:25:42', '2024-07-19 07:25:42'),
(117, 'Review', 0, 29, 2, 35, '2024-07-19 07:25:42', '2024-07-19 07:25:42'),
(118, 'Done', 1, 29, 3, 35, '2024-07-19 07:25:42', '2024-07-19 07:25:42'),
(123, 'Todo', 0, 31, 0, 35, '2024-07-19 07:43:57', '2024-07-19 07:43:57'),
(124, 'In Progress', 0, 31, 1, 35, '2024-07-19 07:43:57', '2024-07-19 07:43:57'),
(125, 'Review', 0, 31, 2, 35, '2024-07-19 07:43:57', '2024-07-19 07:43:57'),
(126, 'Done', 1, 31, 3, 35, '2024-07-19 07:43:57', '2024-07-19 07:43:57'),
(127, 'Todo', 0, 32, 0, 39, '2024-07-19 07:51:02', '2024-07-19 07:51:02'),
(128, 'In Progress', 0, 32, 1, 39, '2024-07-19 07:51:02', '2024-07-19 07:51:02'),
(129, 'Review', 0, 32, 2, 39, '2024-07-19 07:51:02', '2024-07-19 07:51:02'),
(130, 'Done', 1, 32, 3, 39, '2024-07-19 07:51:02', '2024-07-26 06:51:47'),
(131, 'Todo', 0, 33, 0, 45, '2024-07-25 07:26:45', '2024-07-25 07:26:45'),
(132, 'In Progress', 0, 33, 1, 45, '2024-07-25 07:26:45', '2024-08-08 12:02:34'),
(133, 'Review', 0, 33, 2, 45, '2024-07-25 07:26:45', '2024-08-08 12:02:35'),
(134, 'Done', 0, 33, 3, 45, '2024-07-25 07:26:45', '2024-08-08 12:03:04'),
(239, 'Review after Done', 1, 33, 4, 0, '2024-08-08 12:03:04', '2024-08-08 12:03:04'),
(276, 'Todo', 0, 69, 0, 49, '2024-09-04 10:23:14', '2024-09-04 10:23:14'),
(277, 'In Progress', 0, 69, 1, 49, '2024-09-04 10:23:14', '2024-09-04 10:23:14'),
(278, 'Review', 0, 69, 2, 49, '2024-09-04 10:23:14', '2024-09-04 10:23:14'),
(279, 'Done', 1, 69, 3, 49, '2024-09-04 10:23:14', '2024-09-04 10:23:14'),
(280, 'Todo', 0, 70, 0, 49, '2024-09-05 10:30:54', '2024-09-05 10:30:54'),
(281, 'In Progress', 0, 70, 1, 49, '2024-09-05 10:30:54', '2024-09-05 10:30:54'),
(282, 'Review', 0, 70, 2, 49, '2024-09-05 10:30:54', '2024-09-05 10:30:54'),
(283, 'Done', 1, 70, 3, 49, '2024-09-05 10:30:54', '2024-09-05 10:30:54'),
(304, 'Todo', 0, 76, 0, 9, '2024-09-30 07:31:25', '2024-09-30 07:31:25'),
(305, 'In Progress', 0, 76, 1, 9, '2024-09-30 07:31:25', '2024-09-30 07:31:25'),
(306, 'Review', 0, 76, 2, 9, '2024-09-30 07:31:25', '2024-09-30 07:31:25'),
(307, 'Done', 1, 76, 3, 9, '2024-09-30 07:31:25', '2024-09-30 07:31:25'),
(332, 'Todo', 0, 83, 0, 9, '2024-10-01 07:27:01', '2024-10-01 07:27:01'),
(333, 'In Progress', 0, 83, 1, 9, '2024-10-01 07:27:01', '2024-10-01 07:27:01'),
(334, 'Review', 0, 83, 2, 9, '2024-10-01 07:27:01', '2024-10-01 07:27:01'),
(335, 'Done', 1, 83, 3, 9, '2024-10-01 07:27:01', '2024-10-01 07:27:01'),
(336, 'Todo', 0, 84, 0, 48, '2024-10-01 09:48:40', '2024-10-01 09:48:40'),
(337, 'In Progress', 0, 84, 1, 48, '2024-10-01 09:48:40', '2024-10-01 09:48:40'),
(338, 'Review', 0, 84, 2, 48, '2024-10-01 09:48:40', '2024-10-01 09:48:40'),
(339, 'Done', 1, 84, 3, 48, '2024-10-01 09:48:40', '2024-10-01 09:48:40'),
(340, 'Todo', 0, 85, 0, 48, '2024-10-01 11:08:45', '2024-10-01 11:08:45'),
(341, 'In Progress', 0, 85, 1, 48, '2024-10-01 11:08:45', '2024-10-01 11:08:45'),
(342, 'Review', 0, 85, 2, 48, '2024-10-01 11:08:45', '2024-10-01 11:08:45'),
(343, 'Done', 1, 85, 3, 48, '2024-10-01 11:08:45', '2024-10-01 11:08:45'),
(348, 'Todo', 0, 87, 0, 48, '2024-10-01 12:26:10', '2024-10-01 12:26:10'),
(349, 'In Progress', 0, 87, 1, 48, '2024-10-01 12:26:10', '2024-10-01 12:26:10'),
(350, 'Review', 0, 87, 2, 48, '2024-10-01 12:26:10', '2024-10-01 12:26:10'),
(351, 'Done', 1, 87, 3, 48, '2024-10-01 12:26:10', '2024-10-01 12:26:10'),
(352, 'Todo', 0, 88, 0, 48, '2024-10-01 13:59:54', '2024-10-01 13:59:54'),
(353, 'In Progress', 0, 88, 1, 48, '2024-10-01 13:59:54', '2024-10-01 13:59:54'),
(354, 'Review', 0, 88, 2, 48, '2024-10-01 13:59:54', '2024-10-01 13:59:54'),
(355, 'Done', 1, 88, 3, 48, '2024-10-01 13:59:54', '2024-10-01 13:59:54'),
(364, 'Todo', 0, 91, 0, 39, '2024-10-09 13:16:59', '2024-10-09 13:16:59'),
(365, 'In Progress', 0, 91, 1, 39, '2024-10-09 13:16:59', '2024-10-09 13:16:59'),
(366, 'Review', 0, 91, 2, 39, '2024-10-09 13:16:59', '2024-10-09 13:16:59'),
(367, 'Done', 1, 91, 3, 39, '2024-10-09 13:16:59', '2024-10-09 13:16:59'),
(380, 'Todo', 0, 95, 0, 39, '2024-10-09 13:26:21', '2024-10-09 13:26:21'),
(381, 'In Progress', 0, 95, 1, 39, '2024-10-09 13:26:21', '2024-10-09 13:26:21'),
(382, 'Review', 0, 95, 2, 39, '2024-10-09 13:26:21', '2024-10-09 13:26:21'),
(383, 'Done', 1, 95, 3, 39, '2024-10-09 13:26:21', '2024-10-09 13:26:21'),
(400, 'Todo', 0, 100, 0, 39, '2024-10-10 06:20:33', '2024-10-10 06:20:33'),
(401, 'In Progress', 0, 100, 1, 39, '2024-10-10 06:20:33', '2024-10-10 06:20:33'),
(402, 'Review', 0, 100, 2, 39, '2024-10-10 06:20:33', '2024-10-10 06:20:33'),
(403, 'Done', 1, 100, 3, 39, '2024-10-10 06:20:33', '2024-10-10 06:20:33'),
(412, 'Todo', 0, 103, 0, 39, '2024-10-10 07:12:00', '2024-10-10 07:12:00'),
(413, 'In Progress', 0, 103, 1, 39, '2024-10-10 07:12:00', '2024-10-10 07:12:00'),
(414, 'Review', 0, 103, 2, 39, '2024-10-10 07:12:00', '2024-10-10 07:12:00'),
(415, 'Done', 1, 103, 3, 39, '2024-10-10 07:12:00', '2024-10-10 07:12:00'),
(416, 'Todo', 0, 104, 0, 62, '2024-11-25 06:26:05', '2024-11-25 06:26:05'),
(417, 'In Progress', 0, 104, 1, 62, '2024-11-25 06:26:05', '2024-11-25 06:26:05'),
(418, 'Review', 0, 104, 2, 62, '2024-11-25 06:26:05', '2024-11-25 06:26:05'),
(419, 'Done', 0, 104, 3, 62, '2024-11-25 06:26:05', '2024-11-27 11:42:47'),
(424, 't1', 1, 104, 4, 0, '2024-11-27 11:42:47', '2024-11-27 11:42:47'),
(425, 'Todo', 0, 106, 0, 64, '2024-12-03 08:00:05', '2024-12-03 08:00:05'),
(426, 'In Progress', 0, 106, 1, 64, '2024-12-03 08:00:05', '2024-12-03 08:00:05'),
(427, 'Review', 0, 106, 2, 64, '2024-12-03 08:00:05', '2024-12-03 08:00:05'),
(428, 'Done', 1, 106, 3, 64, '2024-12-03 08:00:05', '2024-12-03 08:00:05'),
(429, 'Todo', 0, 107, 0, 62, '2024-12-03 10:10:17', '2024-12-03 10:10:17'),
(430, 'In Progress', 0, 107, 1, 62, '2024-12-03 10:10:17', '2024-12-03 10:10:17'),
(431, 'Review', 0, 107, 2, 62, '2024-12-03 10:10:17', '2024-12-03 10:10:17'),
(432, 'Done', 1, 107, 3, 62, '2024-12-03 10:10:17', '2024-12-03 10:10:17'),
(433, 'Todo', 0, 108, 0, 364, '2025-02-08 08:20:33', '2025-02-08 08:20:33'),
(434, 'In Progress', 0, 108, 1, 364, '2025-02-08 08:20:33', '2025-02-08 08:20:33'),
(435, 'Review', 0, 108, 2, 364, '2025-02-08 08:20:33', '2025-02-08 08:20:33'),
(436, 'Done', 1, 108, 3, 364, '2025-02-08 08:20:33', '2025-02-08 08:20:33'),
(437, 'Todo', 0, 109, 0, 364, '2025-02-08 08:27:15', '2025-02-08 08:27:15'),
(438, 'In Progress', 0, 109, 1, 364, '2025-02-08 08:27:15', '2025-02-08 08:27:15'),
(439, 'Review', 0, 109, 2, 364, '2025-02-08 08:27:15', '2025-02-08 08:27:15'),
(440, 'Done', 1, 109, 3, 364, '2025-02-08 08:27:15', '2025-02-08 08:27:15'),
(441, 'Todo', 0, 110, 0, 48, '2025-02-08 10:15:47', '2025-02-08 10:15:47'),
(442, 'In Progress', 0, 110, 1, 48, '2025-02-08 10:15:47', '2025-02-08 10:15:47'),
(443, 'Review', 0, 110, 2, 48, '2025-02-08 10:15:47', '2025-02-08 10:15:47'),
(444, 'Done', 1, 110, 3, 48, '2025-02-08 10:15:47', '2025-02-08 10:15:47'),
(445, 'Todo', 0, 111, 0, 48, '2025-02-10 07:03:40', '2025-02-10 07:03:40'),
(446, 'In Progress', 0, 111, 1, 48, '2025-02-10 07:03:40', '2025-02-10 07:03:40'),
(447, 'Review', 0, 111, 2, 48, '2025-02-10 07:03:40', '2025-02-10 07:03:40'),
(448, 'Done', 1, 111, 3, 48, '2025-02-10 07:03:40', '2025-02-10 07:03:40'),
(449, 'Todo', 0, 112, 0, 48, '2025-02-10 11:11:34', '2025-02-10 11:11:34'),
(450, 'In Progress', 0, 112, 1, 48, '2025-02-10 11:11:34', '2025-02-10 11:11:34'),
(451, 'Review', 0, 112, 2, 48, '2025-02-10 11:11:34', '2025-02-10 11:11:34'),
(452, 'Done', 1, 112, 3, 48, '2025-02-10 11:11:34', '2025-02-10 11:11:34'),
(453, 'Todo', 0, 113, 0, 364, '2025-02-14 06:08:08', '2025-02-14 06:08:08'),
(454, 'In Progress', 0, 113, 1, 364, '2025-02-14 06:08:08', '2025-02-14 06:08:08'),
(455, 'Review', 0, 113, 2, 364, '2025-02-14 06:08:08', '2025-02-14 06:08:08'),
(456, 'Done', 1, 113, 3, 364, '2025-02-14 06:08:08', '2025-02-14 06:08:08'),
(457, 'Todo', 0, 114, 0, 48, '2025-02-14 07:37:18', '2025-02-14 07:37:18'),
(458, 'In Progress', 0, 114, 1, 48, '2025-02-14 07:37:18', '2025-02-14 07:37:18'),
(459, 'Review', 0, 114, 2, 48, '2025-02-14 07:37:18', '2025-02-14 07:37:18'),
(460, 'Done', 1, 114, 3, 48, '2025-02-14 07:37:18', '2025-02-14 07:37:18'),
(461, 'Todo', 0, 115, 0, 48, '2025-02-14 10:53:22', '2025-02-14 10:53:22'),
(462, 'In Progress', 0, 115, 1, 48, '2025-02-14 10:53:22', '2025-02-14 10:53:22'),
(463, 'Review', 0, 115, 2, 48, '2025-02-14 10:53:22', '2025-02-14 10:53:22'),
(464, 'Done', 1, 115, 3, 48, '2025-02-14 10:53:22', '2025-02-14 10:53:22'),
(465, 'Todo', 0, 116, 0, 48, '2025-02-14 11:02:14', '2025-02-14 11:02:14'),
(466, 'In Progress', 0, 116, 1, 48, '2025-02-14 11:02:14', '2025-02-14 11:02:14'),
(467, 'Review', 0, 116, 2, 48, '2025-02-14 11:02:14', '2025-02-14 11:02:14'),
(468, 'Done', 1, 116, 3, 48, '2025-02-14 11:02:14', '2025-02-14 11:02:14'),
(469, 'Todo', 0, 117, 0, 48, '2025-02-14 11:05:15', '2025-02-14 11:05:15'),
(470, 'In Progress', 0, 117, 1, 48, '2025-02-14 11:05:15', '2025-02-14 11:05:15'),
(471, 'Review', 0, 117, 2, 48, '2025-02-14 11:05:15', '2025-02-14 11:05:15'),
(472, 'Done', 1, 117, 3, 48, '2025-02-14 11:05:15', '2025-02-14 11:05:15'),
(477, 'Todo', 0, 119, 0, 365, '2025-02-14 11:40:04', '2025-02-14 11:40:04'),
(478, 'In Progress', 0, 119, 1, 365, '2025-02-14 11:40:04', '2025-02-14 11:40:04'),
(479, 'Review', 0, 119, 2, 365, '2025-02-14 11:40:04', '2025-02-14 11:40:04'),
(480, 'Done', 1, 119, 3, 365, '2025-02-14 11:40:04', '2025-02-14 11:40:04'),
(481, 'To do', 0, 120, 0, 2, '2025-03-06 11:12:06', '2025-03-06 11:12:06'),
(482, 'In Progress', 0, 120, 1, 2, '2025-03-06 11:12:06', '2025-03-06 11:12:06'),
(483, 'Review', 0, 120, 2, 2, '2025-03-06 11:12:06', '2025-03-06 11:12:06'),
(484, 'Done', 1, 120, 3, 2, '2025-03-06 11:12:06', '2025-03-06 11:12:06'),
(485, 'To do', 0, 121, 0, 398, '2025-04-17 08:48:25', '2025-04-17 08:48:25'),
(486, 'In Progress', 0, 121, 1, 398, '2025-04-17 08:48:25', '2025-04-17 08:48:25'),
(487, 'Review', 0, 121, 2, 398, '2025-04-17 08:48:25', '2025-04-17 08:48:25'),
(488, 'Done', 1, 121, 3, 398, '2025-04-17 08:48:25', '2025-04-17 08:48:25'),
(489, 'To do', 0, 122, 0, 400, '2025-04-18 08:41:17', '2025-04-18 08:41:17'),
(490, 'In Progress', 0, 122, 1, 400, '2025-04-18 08:41:17', '2025-04-18 08:41:17'),
(491, 'Review', 0, 122, 2, 400, '2025-04-18 08:41:17', '2025-04-18 08:41:17'),
(492, 'Done', 1, 122, 3, 400, '2025-04-18 08:41:17', '2025-04-18 08:41:17'),
(499, '1', 0, 124, 0, 400, '2025-04-19 04:19:07', '2025-04-24 04:12:50'),
(500, 'In Progress2', 0, 124, 1, 400, '2025-04-19 04:19:07', '2025-04-24 04:12:50'),
(501, 'Review4', 0, 124, 2, 400, '2025-04-19 04:19:07', '2025-04-24 04:12:50'),
(503, 'Done6', 1, 124, 3, 0, '2025-04-19 05:34:23', '2025-04-24 04:12:50'),
(504, 'To do', 0, 125, 0, 400, '2025-04-24 04:37:57', '2025-04-24 04:37:57'),
(505, 'In Progress', 0, 125, 1, 400, '2025-04-24 04:37:57', '2025-04-24 04:37:57'),
(506, 'Review', 0, 125, 2, 400, '2025-04-24 04:37:57', '2025-04-24 04:37:57'),
(507, 'Done', 1, 125, 3, 400, '2025-04-24 04:37:57', '2025-04-24 04:37:57'),
(508, 'To do', 0, 126, 0, 400, '2025-04-24 04:38:10', '2025-04-24 04:38:10'),
(509, 'In Progress', 0, 126, 1, 400, '2025-04-24 04:38:10', '2025-04-24 04:38:10'),
(510, 'Review', 0, 126, 2, 400, '2025-04-24 04:38:10', '2025-04-24 04:38:10'),
(511, 'Done', 1, 126, 3, 400, '2025-04-24 04:38:10', '2025-04-24 04:38:10'),
(512, 'To do', 0, 127, 0, 400, '2025-04-24 04:38:19', '2025-04-24 04:38:19'),
(513, 'In Progress', 0, 127, 1, 400, '2025-04-24 04:38:19', '2025-04-24 04:38:19'),
(514, 'Review', 0, 127, 2, 400, '2025-04-24 04:38:19', '2025-04-24 04:38:19'),
(515, 'Done', 1, 127, 3, 400, '2025-04-24 04:38:19', '2025-04-24 04:38:19'),
(516, 'To do', 0, 128, 0, 400, '2025-04-24 04:38:30', '2025-04-24 04:38:30'),
(517, 'In Progress', 0, 128, 1, 400, '2025-04-24 04:38:30', '2025-04-24 04:38:30'),
(518, 'Review', 0, 128, 2, 400, '2025-04-24 04:38:30', '2025-04-24 04:38:30'),
(519, 'Done', 1, 128, 3, 400, '2025-04-24 04:38:30', '2025-04-24 04:38:30'),
(520, 'To do', 0, 129, 0, 400, '2025-04-24 04:38:40', '2025-04-24 04:38:40'),
(521, 'In Progress', 0, 129, 1, 400, '2025-04-24 04:38:40', '2025-04-24 04:38:40'),
(522, 'Review', 0, 129, 2, 400, '2025-04-24 04:38:40', '2025-04-24 04:38:40'),
(523, 'Done', 1, 129, 3, 400, '2025-04-24 04:38:40', '2025-04-24 04:38:40'),
(524, 'To do', 0, 130, 0, 400, '2025-04-24 04:38:52', '2025-04-24 04:38:52'),
(525, 'In Progress', 0, 130, 1, 400, '2025-04-24 04:38:52', '2025-04-24 04:38:52'),
(526, 'Review', 0, 130, 2, 400, '2025-04-24 04:38:52', '2025-04-24 04:38:52'),
(527, 'Done', 1, 130, 3, 400, '2025-04-24 04:38:52', '2025-04-24 04:38:52'),
(528, 'To do', 0, 131, 0, 400, '2025-04-24 04:39:10', '2025-04-24 04:39:10'),
(529, 'In Progress', 0, 131, 1, 400, '2025-04-24 04:39:10', '2025-04-24 04:39:10'),
(530, 'Review', 0, 131, 2, 400, '2025-04-24 04:39:10', '2025-04-24 04:39:10'),
(531, 'Done', 1, 131, 3, 400, '2025-04-24 04:39:10', '2025-04-24 04:39:10'),
(532, 'To do', 0, 132, 0, 400, '2025-04-24 04:39:11', '2025-04-24 04:39:11'),
(533, 'In Progress', 0, 132, 1, 400, '2025-04-24 04:39:11', '2025-04-24 04:39:11'),
(534, 'Review', 0, 132, 2, 400, '2025-04-24 04:39:11', '2025-04-24 04:39:11'),
(535, 'Done', 1, 132, 3, 400, '2025-04-24 04:39:11', '2025-04-24 04:39:11'),
(536, 'To do', 0, 133, 0, 400, '2025-04-24 04:39:14', '2025-04-24 04:39:14'),
(537, 'In Progress', 0, 133, 1, 400, '2025-04-24 04:39:14', '2025-04-24 04:39:14'),
(538, 'Review', 0, 133, 2, 400, '2025-04-24 04:39:14', '2025-04-24 04:39:14'),
(539, 'Done', 1, 133, 3, 400, '2025-04-24 04:39:14', '2025-04-24 04:39:14'),
(540, 'To do', 0, 134, 0, 400, '2025-04-24 04:39:23', '2025-04-24 04:39:23'),
(541, 'In Progress', 0, 134, 1, 400, '2025-04-24 04:39:23', '2025-04-24 04:39:23'),
(542, 'Review', 0, 134, 2, 400, '2025-04-24 04:39:23', '2025-04-24 04:39:23'),
(543, 'Done', 1, 134, 3, 400, '2025-04-24 04:39:23', '2025-04-24 04:39:23'),
(544, 'To do', 0, 135, 0, 400, '2025-04-24 04:39:34', '2025-04-24 04:39:34'),
(545, 'In Progress', 0, 135, 1, 400, '2025-04-24 04:39:34', '2025-04-24 04:39:34'),
(546, 'Review', 0, 135, 2, 400, '2025-04-24 04:39:34', '2025-04-24 04:39:34'),
(547, 'Done', 1, 135, 3, 400, '2025-04-24 04:39:34', '2025-04-24 04:39:34'),
(548, 'To do', 0, 136, 0, 400, '2025-04-24 04:39:36', '2025-04-24 04:39:36'),
(549, 'In Progress', 0, 136, 1, 400, '2025-04-24 04:39:37', '2025-04-24 04:39:37'),
(550, 'Review', 0, 136, 2, 400, '2025-04-24 04:39:37', '2025-04-24 04:39:37'),
(551, 'Done', 1, 136, 3, 400, '2025-04-24 04:39:37', '2025-04-24 04:39:37');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double(25,2) NOT NULL DEFAULT '0.00',
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `name`, `rate`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'demo', 10.00, 9, '2024-05-09 08:35:18', '2024-05-09 08:35:18'),
(2, 'test tax', 35.00, 13, '2024-06-03 10:25:35', '2024-06-03 10:25:35'),
(3, 'demo', 1.00, 19, '2024-06-04 11:54:15', '2024-06-04 11:54:15'),
(4, 'T', 1.00, 35, '2024-07-17 11:50:24', '2024-07-17 11:50:24'),
(5, 'T1', 1.00, 35, '2024-07-18 05:49:06', '2024-07-18 05:49:06'),
(6, 'GST', 1.00, 39, '2024-07-19 07:14:12', '2024-08-24 09:37:28'),
(7, 'GST', 10.00, 62, '2024-12-03 09:41:54', '2024-12-03 09:41:54'),
(8, 'Dipak', 15.00, 64, '2024-12-03 10:21:11', '2024-12-03 10:21:11'),
(9, 'Tax5', 5.00, 48, '2024-12-03 11:24:24', '2025-02-12 11:03:50');

-- --------------------------------------------------------

--
-- Table structure for table `templates`
--

CREATE TABLE `templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `template_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prompt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `module` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_json` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_tone` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `templates`
--

INSERT INTO `templates` (`id`, `template_name`, `prompt`, `module`, `field_json`, `is_tone`, `created_at`, `updated_at`) VALUES
(1, 'subject', 'generate contract subject for this contract description ##description##', 'contract', '{\"field\":[{\"label\":\"Proposal Description\",\"placeholder\":\"e.g.Terms and Conditions\",\"field_type\":\"textarea\",\"field_name\":\"description\"}]}', 0, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(2, 'descriptions', 'generate contract description for this contract subject ##subject##', 'contract', '{\"field\":[{\"label\":\"Contract Subject\",\"placeholder\":\"e.g.Legal Protection,Terms and Conditions\",\"field_type\":\"textarea\",\"field_name\":\"subject\"}]}', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(3, 'contract_description', 'generate contract description for this contract subject ##subject##', 'contracts', '{\"field\":[{\"label\":\"Contract Subject\",\"placeholder\":\"e.g.Legal Protection,Terms and Conditions\",\"field_type\":\"textarea\",\"field_name\":\"subject\"}]}', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(4, 'note', 'generate contract brief description for title \'##name##\' and cover all point that sutiable to contract title', 'contract_note', '{\"field\":[{\"label\":\"Contract Name\",\"placeholder\":\"e.g. product return condition \",\"field_type\":\"text_box\",\"field_name\":\"name\"}]}', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(5, 'comments', 'generate short and valuable comment for contract title \'##name##\' and focus on this \'##decsription##\'', 'contract_comments', '{\"field\":[{\"label\":\"Contract Name\",\"placeholder\":\"e.g. product return condition \",\"field_type\":\"text_box\",\"field_name\":\"name\"},{\"label\":\"Description\",\"placeholder\":\"e.g. good product \",\"field_type\":\"textarea\",\"field_name\":\"decsription\"}]}', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(6, 'name', 'generate contract subject for this contract description ##description##', 'contract_type', '{\"field\":[{\"label\":\"Contract Description\",\"placeholder\":\"e.g.\",\"field_type\":\"textarea\",\"field_name\":\"description\"}]}', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(7, 'title', 'Create creative product names:  ##description## \n\nSeed words: ##keywords## \n\n', 'project', '{\"field\":[{\"label\":\"Project Description\",\"placeholder\":\"e.g.Efficiency and Optimization,Business Growth and Expansion\",\"field_type\":\"textarea\",\"field_name\":\"description\"}]}', 0, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(8, 'descriptions', 'Write a short and innovative description for Project  which Topic is:\n ##title## \n\nnProject Information:\n ##description##.', 'project', '{\"field\":[{\"label\":\"Project Name\",\"placeholder\":\"Project Name\",\"field_type\":\"text_box\",\"field_name\":\"title\"},{\"label\":\"Project Information\",\"placeholder\":\"Project Information\",\"field_type\":\"textarea\",\"field_name\":\"description\"}]}', 0, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(9, 'invoices_settings', 'Write a short and innovative description for Project  which Topic is:\n ##title## \n\nnProject Information:\n ##description##.', 'invoice_footer_title', '{\"field\":[{\"label\":\"Project Name\",\"placeholder\":\"Project Name\",\"field_type\":\"text_box\",\"field_name\":\"title\"},{\"label\":\"Project Information\",\"placeholder\":\"Project Information\",\"field_type\":\"textarea\",\"field_name\":\"description\"}]}', 0, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(10, 'title', 'Generate a task name for a project in an ##project_name##, specifically related to ##instruction##.', 'project_task', '{\"field\":[{\"label\":\"Project name\",\"placeholder\":\"e.g.Solving Problems\",\"field_type\":\"text_box\",\"field_name\":\"project_name\"},{\"label\":\"Task Instruction\",\"placeholder\":\"e.g.Data Analysis\",\"field_type\":\"textarea\",\"field_name\":\"instruction\"}]}', 0, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(11, 'description', 'Generate short task description for a project in an ##project_name##, specifically related to ##instruction##.', 'project_task', '{\"field\":[{\"label\":\"Project name\",\"placeholder\":\"e.g.\",\"field_type\":\"text_box\",\"field_name\":\"project_name\"},{\"label\":\"Task Instruction\",\"placeholder\":\"e.g.\",\"field_type\":\"textarea\",\"field_name\":\"instruction\"}]}', 0, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(12, 'comment', 'Generate tiny and valuable comment for a project in an ##project_name##, specifically related to ##instruction##.', 'task_show', '{\"field\":[{\"label\":\"Project name\",\"placeholder\":\"e.g.\",\"field_type\":\"text_box\",\"field_name\":\"project_name\"},{\"label\":\"Task Instruction\",\"placeholder\":\"e.g.\",\"field_type\":\"textarea\",\"field_name\":\"instruction\"}]}', 0, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(13, 'title', 'Generate a milestone name for a ##project_name##,specifically related to ##instruction##.', 'project_milestone', '{\"field\":[{\"label\":\"Milestone Description\",\"placeholder\":\"e.g.Design Approved\",\"field_type\":\"textarea\",\"field_name\":\"description\"},{\"label\":\" Instruction\",\"placeholder\":\"e.g. incorporated feedback and revisions\",\"field_type\":\"textarea\",\"field_name\":\"instruction\"}]}', 0, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(14, 'description', 'Generate description milestone  for a  ##project_name##, specifically related to ##milestone_name##.', 'project_milestone', '{\"field\":[{\"label\":\"Project name\",\"placeholder\":\"e.g.\",\"field_type\":\"text_box\",\"field_name\":\"project_name\"},{\"label\":\"Milestone Name\",\"placeholder\":\"e.g.\",\"field_type\":\"text_box\",\"field_name\":\"milestone_name\"}]}', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(15, 'title', 'Generate a list of Zoom meeting topics for ##description## metting. The purpose of the meeting is to  ##description##. Structure the topics to ensure a productive discussion.', 'zoom_meeting', '{\"field\":[{\"label\":\"Meeting description \",\"placeholder\":\"e.g.Remote Collaboration\",\"field_type\":\"textarea\",\"field_name\":\"description\"}]}', 0, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(16, 'content', 'Generate a meeting notification message for an ##topic## meeting. Include the date, time, location, and a brief agenda with three key discussion points.', 'notification_template', '{\"field\":[{\"label\":\"Notification Message\",\"placeholder\":\"e.g.brief explanation of the purpose or background of the notification\",\"field_type\":\"textarea\",\"field_name\":\"topic\"}]}', 0, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(17, 'description', 'generate short catchy description  for expense of ##description##', 'expenses', '{\"field\":[{\"label\":\"Expense detail \",\"placeholder\":\"e.g. 12 computer\",\"field_type\":\"textarea\",\"field_name\":\"description\"}]} ', 0, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(18, 'notes', 'Generate content for confirming a successful  add payment . Write a message to inform the recipient that the add payment has been successfully completed. The content should be concise, informative. Include the necessary  details,##note## to convey the successful transfe information.plase not cotent should be without header,footer', 'invoices', '{\"field\":[{\"label\":\"Notes\",\"placeholder\":\"e.g. any notes\",\"field_type\":\"textarea\",\"field_name\":\"note\"}]}', 0, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(19, 'name', 'generate category name of expense that indule this thing ##keyword##', 'expenses', '{\"field\":[{\"label\":\"Expense type/item \",\"placeholder\":\"e.g. computer\",\"field_type\":\"textarea\",\"field_name\":\"keyword\"}]} ', 0, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(20, 'name', 'please suggest subscription plan  name  for this  :  ##description##  for my business', 'plan', '{\"field\":[{\"label\":\"What is your plan about?\",\"placeholder\":\"e.g. Describe your plan details \",\"field_type\":\"textarea\",\"field_name\":\"description\"}]}', 0, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(21, 'description', 'please suggest subscription plan  description  for this  :  ##title##:  for my business', 'plan', '{\"field\":[{\"label\":\"What is your plan title?\",\"placeholder\":\"e.g. Pro Resller,Exclusive Access\",\"field_type\":\"text_box\",\"field_name\":\"title\"}]}', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(22, 'name', 'give 10 catchy only name of Offer or discount Coupon for : ##keywords##', 'coupon', '{\"field\":[{\"label\":\"Seed words\",\"placeholder\":\"e.g.coupon will provide you with a discount on your selected plan\",\"field_type\":\"text_box\",\"field_name\":\"keywords\"}]}', 0, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(23, 'meta_keywords', 'Write SEO meta title for:\n\n ##description## \n\nWebsite name is:\n ##title## \n\nSeed words:\n ##keywords## \n\n', 'seo', '{\"field\":[{\"label\":\"Website Name\",\"placeholder\":\"e.g. Amazon, Google\",\"field_type\":\"text_box\",\"field_name\":\"title\"},{\"label\":\"Website Description\",\"placeholder\":\"e.g. Describe what your website or business do\",\"field_type\":\"textarea\",\"field_name\":\"description\"},{\"label\":\"Keywords\",\"placeholder\":\"e.g.  cloud services, databases\",\"field_type\":\"text_box\",\"field_name\":\"keywords\"}]}', 0, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(24, 'meta_description', 'Write SEO meta description for:\n\n ##description## \n\nWebsite name is:\n ##title## \n\nSeed words:\n ##keywords## \n\n', 'seo', '{\"field\":[{\"label\":\"Website Name\",\"placeholder\":\"e.g. Amazon, Google\",\"field_type\":\"text_box\",\"field_name\":\"title\"},{\"label\":\"Website Description\",\"placeholder\":\"e.g. Describe what your website or business do\",\"field_type\":\"textarea\",\"field_name\":\"description\"},{\"label\":\"Keywords\",\"placeholder\":\"e.g.  cloud services, databases\",\"field_type\":\"text_box\",\"field_name\":\"keywords\"}]}', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(25, 'cookie_title', 'please suggest me cookie title for this ##description## website which i can use in my website cookie', 'cookie', '{\"field\":[{\"label\":\"Website Name or Info\",\"placeholder\":\"e.g. example website \",\"field_type\":\"textarea\",\"field_name\":\"title\"}]}', 0, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(26, 'cookie_description', 'please suggest me  Cookie description for this cookie title ##title##  which i can use in my website cookie', 'cookie', '{\"field\":[{\"label\":\"Cookie Title \",\"placeholder\":\"e.g. example website \",\"field_type\":\"text_box\",\"field_name\":\"title\"}]}', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(27, 'strictly_cookie_title', 'please suggest me only Strictly Cookie Title for this ##description## website which i can use in my website cookie', 'cookie', '{\"field\":[{\"label\":\"Website Name or Info\",\"placeholder\":\"e.g. example website \",\"field_type\":\"textarea\",\"field_name\":\"title\"}]}', 0, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(28, 'strictly_cookie_description', 'please suggest me Strictly Cookie description for this Strictly cookie title ##title##  which i can use in my website cookie', 'cookie', '{\"field\":[{\"label\":\"Strictly Cookie Title \",\"placeholder\":\"e.g. example website \",\"field_type\":\"text_box\",\"field_name\":\"title\"}]}', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(29, 'more_information_title', 'I need assistance in crafting compelling content for my ##web_name## website\'s \'Contact Us\' page of my website. The page should provide relevant information to users, encourage them to reach out for inquiries, support, and feedback, and reflect the unique value proposition of my business.', 'cookie', '{\"field\":[{\"label\":\"Websit Name\",\"placeholder\":\"e.g. example website \",\"field_type\":\"text_box\",\"field_name\":\"web_name\"}]}', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(30, 'content', 'generate email template for ##type##', 'email_template', '{\"field\":[{\"label\":\"Email Type\",\"placeholder\":\"e.g. new user,new client\",\"field_type\":\"text_box\",\"field_name\":\"type\"}]}', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55'),
(31, 'description', 'give short and valuable description of how much work on  for a ##task_name## in ##project_name##', 'timesheet', '{\"field\":[{\"label\":\"Project Name\",\"placeholder\":\"Project Name\",\"field_type\":\"text_box\",\"field_name\":\"project_name\"},{\"label\":\"Task Name\",\"placeholder\":\"Task Name\",\"field_type\":\"text_box\",\"field_name\":\"task_name\"}]}', 1, '2024-02-26 12:05:55', '2024-02-26 12:05:55');

-- --------------------------------------------------------

--
-- Table structure for table `timesheets`
--

CREATE TABLE `timesheets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL DEFAULT '0',
  `date` date NOT NULL,
  `time` time NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `timesheets`
--

INSERT INTO `timesheets` (`id`, `project_id`, `task_id`, `date`, `time`, `description`, `created_by`, `created_at`, `updated_at`) VALUES
(32, 84, 78, '2024-12-02', '02:20:00', 'gfuisdghishfisd', 65, '2024-12-03 09:35:22', '2024-12-03 09:35:22'),
(33, 84, 78, '2024-12-02', '02:10:00', 'fddfsdfsd', 65, '2024-12-03 09:35:47', '2024-12-03 09:35:47'),
(35, 84, 75, '2024-12-03', '00:02:25', NULL, 48, '2024-12-03 11:11:49', '2024-12-03 11:11:49'),
(36, 110, 81, '2025-02-03', '04:40:00', 'ghviugifs fsghf sfisg', 48, '2025-02-08 10:46:55', '2025-02-08 10:46:55'),
(37, 110, 82, '2025-02-08', '04:20:00', 'ddd ddDwd', 48, '2025-02-08 10:50:59', '2025-02-08 10:50:59'),
(38, 110, 82, '2025-02-10', '02:20:00', 'dsdsadsa sdaadasd', 48, '2025-02-10 08:09:23', '2025-02-10 08:09:23'),
(39, 110, 82, '2025-02-10', '05:30:00', 'ujdtydrtyr tyrtyr', 365, '2025-02-10 08:09:59', '2025-02-10 08:09:59'),
(40, 110, 82, '2025-02-12', '03:30:00', 'tteretrtgh gergrtgrtggt', 365, '2025-02-12 10:49:59', '2025-02-12 10:49:59'),
(41, 110, 82, '2025-02-11', '12:30:00', 'kkfyuyf yu', 48, '2025-02-12 10:59:29', '2025-02-12 10:59:29'),
(42, 110, 82, '2025-02-12', '00:02:14', NULL, 365, '2025-02-12 13:55:38', '2025-02-12 13:55:38'),
(43, 110, 82, '2025-02-12', '08:20:00', '', 48, '2025-02-15 05:30:29', '2025-02-15 06:01:45'),
(44, 110, 82, '2025-02-13', '12:30:00', 'ddfsfd fdfv', 48, '2025-02-15 05:34:31', '2025-02-15 05:47:15'),
(45, 110, 82, '2025-02-13', '06:40:00', 'Dipak Test1 Timesheet', 365, '2025-02-15 05:36:44', '2025-02-15 05:36:44'),
(46, 110, 82, '2025-02-14', '09:20:00', 'sadssd', 48, '2025-02-15 05:46:36', '2025-02-15 06:00:04'),
(47, 110, 82, '2025-02-15', '00:00:00', 'dasdsada', 48, '2025-02-15 05:56:13', '2025-02-15 05:56:13');

-- --------------------------------------------------------

--
-- Table structure for table `time_trackers`
--

CREATE TABLE `time_trackers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `task_id` int(11) DEFAULT NULL,
  `tag_id` text COLLATE utf8mb4_unicode_ci,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_billable` int(11) NOT NULL DEFAULT '0',
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `total_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `is_active` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `time_trackers`
--

INSERT INTO `time_trackers` (`id`, `project_id`, `task_id`, `tag_id`, `name`, `is_billable`, `start_time`, `end_time`, `total_time`, `is_active`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 84, 90, NULL, NULL, 0, '2025-02-15 13:43:41', '2025-02-15 13:45:29', '108', '0', 48, '2025-02-15 08:13:42', '2025-02-15 08:15:30'),
(2, 84, 90, NULL, NULL, 0, '2025-02-15 13:56:22', '2025-02-15 13:58:27', '125', '0', 48, '2025-02-15 08:26:22', '2025-02-15 08:28:27'),
(3, 84, 90, NULL, NULL, 0, '2025-02-17 11:53:44', '2025-02-17 11:55:57', '133', '0', 48, '2025-02-17 06:23:44', '2025-02-17 06:25:57'),
(4, 84, 90, NULL, NULL, 0, '2025-02-17 12:16:31', NULL, '0', '1', 48, '2025-02-17 06:46:32', '2025-02-17 06:46:32');

-- --------------------------------------------------------

--
-- Table structure for table `track_photos`
--

CREATE TABLE `track_photos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `track_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `img_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `track_photos`
--

INSERT INTO `track_photos` (`id`, `track_id`, `user_id`, `img_path`, `time`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 48, 'uploads/traker_images/3/1739773484494_3.jpg', '2025-02-17 11:54:44', '1', '2025-02-17 06:24:45', '2025-02-17 06:24:45'),
(2, 3, 48, 'uploads/traker_images/3/1739773544590_3.jpg', '2025-02-17 11:55:44', '1', '2025-02-17 06:25:44', '2025-02-17 06:25:44');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_orders`
--

CREATE TABLE `transaction_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `req_amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `req_user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skills` text COLLATE utf8mb4_unicode_ci,
  `is_active` int(11) NOT NULL DEFAULT '1',
  `referral_code` int(11) NOT NULL DEFAULT '0',
  `used_referral_code` int(11) NOT NULL DEFAULT '0',
  `commission_amount` int(11) NOT NULL DEFAULT '0',
  `is_invited` int(11) NOT NULL DEFAULT '0',
  `is_disable` int(11) NOT NULL DEFAULT '1',
  `lang` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `facebook` text COLLATE utf8mb4_unicode_ci,
  `whatsapp` text COLLATE utf8mb4_unicode_ci,
  `instagram` text COLLATE utf8mb4_unicode_ci,
  `likedin` text COLLATE utf8mb4_unicode_ci,
  `mode` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'light',
  `is_trial_done` smallint(6) NOT NULL DEFAULT '0',
  `is_plan_purchased` smallint(6) NOT NULL DEFAULT '0',
  `interested_plan_id` smallint(6) NOT NULL DEFAULT '0',
  `is_register_trial` smallint(6) NOT NULL DEFAULT '0',
  `plan` int(11) DEFAULT NULL,
  `plan_expire_date` date DEFAULT NULL,
  `storage_limit` double(8,2) NOT NULL DEFAULT '0.00',
  `payment_subscription_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requested_plan` int(11) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `active_status` tinyint(1) NOT NULL DEFAULT '0',
  `dark_mode` tinyint(1) NOT NULL DEFAULT '0',
  `messenger_color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#2180f3',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `type`, `avatar`, `created_by`, `phone`, `dob`, `gender`, `skills`, `is_active`, `referral_code`, `used_referral_code`, `commission_amount`, `is_invited`, `is_disable`, `lang`, `facebook`, `whatsapp`, `instagram`, `likedin`, `mode`, `is_trial_done`, `is_plan_purchased`, `interested_plan_id`, `is_register_trial`, `plan`, `plan_expire_date`, `storage_limit`, `payment_subscription_id`, `requested_plan`, `details`, `remember_token`, `last_login_at`, `active_status`, `dark_mode`, `messenger_color`, `created_at`, `updated_at`) VALUES
(1, 'Dhiraj Jain', 'admin@taskmagix.com', '2024-02-26 12:05:54', '$2y$10$jR.pXtYEmsaogSxJfK0mmup6dbeNdjTuFLdnR6/605.sWHYCrnpO.', 'admin', 'avatars/1_avatar1744028188.png', 0, '9898989898', '2003-10-08', 'male', '', 1, 0, 0, 0, 0, 1, 'en', '', '', '', '', 'light', 0, 0, 0, 0, NULL, NULL, 0.00, NULL, 0, NULL, '', '2025-05-07 23:02:46', 0, 0, '#2180f3', '2024-02-26 12:05:54', '2025-05-07 17:32:46'),
(2, 'Owner', 'owner@example.com', '2024-02-26 12:05:54', '$2y$10$pFejmo/j217hjllURlyNWuHUdnpCHcFiAjlfbaxDoK5KZqLvamvyW', 'owner', NULL, 1, '7654333123887', '2025-03-11', 'male', '', 1, 265465, 0, 0, 0, 1, 'en', '', '98876656567676', '', '', 'light', 1, 0, 0, 0, 2, '2025-03-21', 0.15, NULL, 0, NULL, NULL, '2025-02-10 11:18:33', 0, 0, '#2180f3', '2024-02-26 12:05:54', '2025-03-07 07:00:03'),
(3, 'Ram', 'ramdreams19@gmail.com', '2024-02-28 09:34:54', '$2y$10$xQC/jhKmekNaI.cPhQllOOMf8.9g706U8M61ZfNYXtuPJnl5rXRky', 'owner', 'avatars/3_avatar1709113571.PNG', 1, '7894563212', '2000-12-19', 'male', '', 1, 265465, 0, 0, 0, 1, 'en', '', '', '', '', 'light', 0, 0, 0, 0, 1, NULL, 0.02, NULL, 0, NULL, NULL, '2024-02-28 15:22:55', 0, 0, '#2180f3', '2024-02-28 09:33:40', '2024-02-28 09:53:24'),
(4, 'Ankit', 'test@gmail.com', '2024-03-30 11:32:08', '$2y$10$sZzfQNFeH6swG8iaICblDuK5iaLwtC1p9QN/9We8//8dSGd9s/j/m', 'user', NULL, 2, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 'en', NULL, NULL, NULL, NULL, 'light', 0, 0, 0, 0, 1, NULL, 0.00, NULL, 0, NULL, NULL, NULL, 0, 0, '#2180f3', '2024-03-30 11:32:08', '2025-03-04 07:46:15'),
(6, 'Ankit lalwani', 'ankulalwani@gmail.com', '2024-04-10 07:44:32', '$2y$10$hZekCmQaoFwCpuKuK9OMburUWxmt3V/5R4uZNasXzqQrENOrznqdq', 'owner', NULL, 1, NULL, NULL, NULL, NULL, 1, 265465, 0, 0, 0, 1, 'en', NULL, NULL, NULL, NULL, 'light', 0, 0, 0, 0, 1, NULL, 0.00, NULL, 0, NULL, NULL, '2024-04-10 13:14:31', 0, 0, '#2180f3', '2024-04-10 07:43:04', '2024-04-10 07:44:32'),
(7, 'Ankit lalwani', 'ankitenark@gmail.com', '2024-04-10 07:51:02', '$2y$10$EKNZ28paJUg7BDUHK7r56eWI7AHaA0YepUzCaMnKAuFa/4nVsdHlS', 'user', NULL, 6, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 'en', NULL, NULL, NULL, NULL, 'light', 0, 0, 0, 0, 1, NULL, 0.00, NULL, 0, NULL, NULL, NULL, 0, 0, '#2180f3', '2024-04-10 07:51:02', '2025-02-13 11:02:36'),
(8, 'Ankit outlook', 'ankitlalwani@outlook.com', '2024-04-10 07:51:43', '$2y$10$5JZPDNbO4dCvKKsxr0ErBORTqnM5sxja9giUK7RadrOmM1IzhJd3q', 'client', NULL, 6, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 'en', NULL, NULL, NULL, NULL, 'light', 0, 0, 0, 0, 1, NULL, 0.00, NULL, 0, NULL, NULL, NULL, 0, 0, '#2180f3', '2024-04-10 07:51:43', '2024-04-10 07:51:43'),
(48, 'Dipak', 'dipak.kavathe@dreamsinternational.in', '2024-09-03 11:07:32', '$2y$10$18ySTrzpzeGxZ.YTSB5sIO6OE1nKUQjgfNBVO96uGXfMKmJLz5dJW', 'owner', 'avatars/48_avatar1735105679.png', 1, '7894585858', '2025-02-01', 'male', 'fgg,gf,gdfg', 1, 342081, 0, 0, 0, 1, 'en', 'https://www.facebook.com/dipakkavathe', '9858654785', 'https://www.instagram.com/dipak', 'https://www.linkedin.com/dipak', 'light', 0, 1, 0, 0, 7, '2025-03-22', 0.56, NULL, 0, '{\"light_logo\":\"logo\\/logo.png\",\"dark_logo\":\"logo\\/logo-dark.png\",\"address\":\"Swargate\",\"city\":\"Pune\",\"state\":\"Maharastra\",\"zipcode\":\"411042\",\"country\":\"India\",\"telephone\":\"1954784589\",\"invoice_template\":\"template7\",\"invoice_color\":\"003580\",\"invoice_logo\":\"logo\\/logo.png\",\"invoice_footer_title\":\"\\u00a9 2025 Task Magix. All Rights Reserved. One XL Info LLP.\",\"invoice_footer_note\":\"A product by 1XL.COM\",\"interval_time\":\"1\"}', NULL, '2025-03-05 15:27:13', 0, 0, '#2180f3', '2024-09-03 11:07:05', '2025-03-05 09:57:13'),
(51, 'DipakK', 'dipak.dreamsint@gmail.com', '2024-10-01 09:50:44', '$2y$10$AmoTr6mfY.9JykLJaVFtg.CRjvHWlCmpoeuc70Skgh/BpMaBbBTTa', 'client', NULL, 48, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 1, 'en', NULL, NULL, NULL, NULL, 'light', 0, 0, 0, 0, 1, NULL, 0.00, NULL, 0, '{\"light_logo\":\"logo\\/logo.png\",\"dark_logo\":\"logo\\/logo-dark.png\",\"address\":\"Swargate\",\"city\":\"Pune\",\"state\":\"Maharastra\",\"zipcode\":\"410212\",\"country\":\"India\",\"telephone\":\"1954784589\",\"invoice_template\":\"template1\",\"invoice_color\":\"ffffff\",\"invoice_logo\":\"logo\\/logo.png\",\"invoice_footer_title\":\"\",\"invoice_footer_note\":\"\",\"interval_time\":\"\"}', NULL, '2025-02-20 15:13:26', 0, 0, '#2180f3', '2024-10-01 09:50:44', '2025-02-20 09:43:26'),
(64, 'bifapo', 'bifapo6788@ikowat.com', '2024-12-03 07:49:27', '$2y$10$GuHDEc.L0jrYYWYNayglmuW8YdW/qnlHIMMZuxQpzYOSWgcvDvONi', 'user', 'avatars/64_avatar1735105804.png', 48, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 1, 'en', NULL, NULL, NULL, NULL, 'light', 0, 0, 0, 0, 1, NULL, 0.00, NULL, 0, NULL, NULL, '2025-02-10 12:40:39', 0, 0, '#2180f3', '2024-12-03 07:49:27', '2025-02-13 11:02:36'),
(65, 'lixejif', 'lixejif330@ikowat.com', '2024-12-03 07:50:38', '$2y$10$usSMzs7rONtC2.CYVdB8tuvZDdzwCyCDGOm5b4yybhLVnhsZTeOHa', 'client', NULL, 48, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 1, 'en', NULL, NULL, NULL, NULL, 'light', 0, 0, 0, 0, 1, NULL, 0.00, NULL, 0, '{\"light_logo\":\"logo\\/logo.png\",\"dark_logo\":\"logo\\/logo-dark.png\",\"address\":\"ujghgj\",\"city\":\"hjghg\",\"state\":\"hjghj\",\"zipcode\":\"201201\",\"country\":\"jghfh\",\"telephone\":\"5896532145\",\"invoice_template\":\"template1\",\"invoice_color\":\"ffffff\",\"invoice_logo\":\"logo\\/logo.png\",\"invoice_footer_title\":\"\",\"invoice_footer_note\":\"\",\"interval_time\":\"\"}', NULL, '2024-12-03 13:22:56', 0, 0, '#2180f3', '2024-12-03 07:50:38', '2024-12-03 09:39:29'),
(66, 'UserTest', 'testuser@gmail.com', '2024-12-03 07:56:11', '$2y$10$zFaL0Pc2fOhl5ThQrZWAyunyjVeS.RLnJVcGHOHnFgWIpjwRiNkVK', 'user', NULL, 64, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 'en', NULL, NULL, NULL, NULL, 'light', 0, 0, 0, 0, 1, NULL, 0.00, NULL, 0, NULL, NULL, NULL, 0, 0, '#2180f3', '2024-12-03 07:56:11', '2025-02-13 11:02:36'),
(69, 'richa wadekar', 'ruchadreams2309@gmail.com', '2024-12-27 08:15:43', '$2y$10$cXbOmWXAnGmCnjB2wwrC/u3aoy8UbyU5xAfZzGBYlH8j9Pwb5l.dy', 'owner', NULL, 1, NULL, NULL, NULL, NULL, 1, 670614, 0, 0, 0, 1, 'en', NULL, NULL, NULL, NULL, 'light', 0, 0, 0, 0, 7, '2025-03-22', 0.00, NULL, 0, NULL, NULL, NULL, 0, 0, '#2180f3', '2024-12-27 08:15:26', '2025-02-22 12:21:49'),
(364, 'Dipak maildrop', 'dipaktest@maildrop.cc', '2025-02-08 07:10:47', '$2y$10$PL2uMR8u437qVJD679xLZeCfvenFhZN2ffAE0FZdpEkDAwnS0k50q', 'owner', NULL, 1, NULL, NULL, NULL, NULL, 1, 450115, 0, 0, 0, 1, 'en', NULL, NULL, NULL, NULL, 'light', 2, 1, 0, 0, 7, '2025-03-22', 0.00, NULL, 0, NULL, 'UZO9DtOOExtXsLztN5ZehOcvig8M2nH0SjC6eUaTlHPF6FL7di49joOr7LKA', '2025-02-14 11:30:11', 0, 0, '#2180f3', '2025-02-08 07:10:14', '2025-02-22 12:21:57'),
(365, 'dipaktestone', 'dipaktest1@maildrop.cc', '2025-02-08 09:56:30', '$2y$10$Dy9CYqHcdzhzrXC0dpiF5.VaGcZqzGsQQltx98a/c8b7f3SSCThFm', 'user', 'avatars/365_avatar1739176271.jpg', 48, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 1, 'en', NULL, NULL, NULL, NULL, 'light', 0, 0, 0, 0, 1, NULL, 0.00, NULL, 0, NULL, NULL, '2025-02-15 12:10:53', 0, 0, '#2180f3', '2025-02-08 09:56:30', '2025-02-15 06:40:53'),
(366, 'dipaktesttwo', 'dipaktest2@maildrop.cc', '2025-02-08 13:21:30', '$2y$10$3RjFeR/P0Nku3PUvlU5Tw.U9OpIKFbCVTqrPK6yNhBdkTVNAhmJ0i', 'user', NULL, 364, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 1, 'en', NULL, NULL, NULL, NULL, 'light', 0, 0, 0, 0, 1, NULL, 0.00, NULL, 0, NULL, NULL, '2025-02-13 13:30:39', 0, 0, '#2180f3', '2025-02-08 13:21:30', '2025-02-14 06:08:15'),
(381, 'dipak test user', 'dipaktestuser@maildrop.cc', '2025-02-12 10:01:41', '$2y$10$6sKQJd6SY8pQQT5BFWubmuAoRgAQDn8n0ieBMs.qiopyVdSQZeAEC', 'user', NULL, 364, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 1, 'en', NULL, NULL, NULL, NULL, 'light', 0, 0, 0, 0, 1, NULL, 0.00, NULL, 0, NULL, NULL, NULL, 0, 0, '#2180f3', '2025-02-12 10:01:41', '2025-02-14 06:01:09'),
(382, 'dipaktestone two', 'dipaktestuser2@maildrop.cc', '2025-02-12 10:16:30', '$2y$10$qrtD/bBaREW8pjN1PliKieX/ztBR2Cz1XkgGnrZFbG89Vt6/d8r4m', 'user', NULL, 364, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 1, 'en', NULL, NULL, NULL, NULL, 'light', 0, 0, 0, 0, 1, NULL, 0.00, NULL, 0, NULL, NULL, NULL, 0, 0, '#2180f3', '2025-02-12 10:16:30', '2025-02-14 06:03:28'),
(383, 'dipak client', 'dipakclient@maildrop.cc', '2025-02-14 11:50:17', '$2y$10$pLv7UOJomonOEbAQnnMoqe9BBlg870owTzxZTflo9J3l/HGMK8Cay', 'client', NULL, 365, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 1, 'en', NULL, NULL, NULL, NULL, 'light', 0, 0, 0, 0, 1, NULL, 0.00, NULL, 0, NULL, NULL, NULL, 0, 0, '#2180f3', '2025-02-14 11:50:17', '2025-02-14 11:51:09'),
(386, 'lfRntMYwfJO', 'sivousshannan@yahoo.com', NULL, '$2y$10$jr6VHZusKdyRQoPc0xWYzO5SKFP29GgizmegAri1WqqcDYTp0SfR2', 'owner', NULL, 1, NULL, NULL, NULL, NULL, 1, 210154, 0, 0, 0, 1, 'en', NULL, NULL, NULL, NULL, 'light', 0, 0, 0, 0, NULL, NULL, 0.00, NULL, 0, NULL, NULL, NULL, 0, 0, '#2180f3', '2025-02-24 12:58:13', '2025-02-24 12:58:13'),
(387, 'xQWoSREWxCF', 'spwfmynjxpbt@yahoo.com', NULL, '$2y$10$5MlfQsBubtIJmoH0cADknOUP1zZxqcmmCEhBNy0bGpPhUzMiMPJaC', 'owner', NULL, 1, NULL, NULL, NULL, NULL, 1, 889644, 0, 0, 0, 1, 'en', NULL, NULL, NULL, NULL, 'light', 0, 0, 0, 0, NULL, NULL, 0.00, NULL, 0, NULL, NULL, NULL, 0, 0, '#2180f3', '2025-02-24 14:07:30', '2025-02-24 14:07:30'),
(388, 'DBfLdKSczpUBAsl', 'ojwpsuikvuubi@yahoo.com', NULL, '$2y$10$budPjLfv5vDC74EU3JxCee9Kb94eZsy1/zOMN9UQTYK6kD2JXDSXO', 'owner', NULL, 1, NULL, NULL, NULL, NULL, 1, 785929, 0, 0, 0, 1, 'en', NULL, NULL, NULL, NULL, 'light', 0, 0, 0, 0, NULL, NULL, 0.00, NULL, 0, NULL, NULL, NULL, 0, 0, '#2180f3', '2025-02-24 20:05:09', '2025-02-24 20:05:09'),
(389, 'ghgrgrg', 'pratik.oriontech@gmail.com', '2025-03-07 06:56:32', '$2y$10$1XznezpXD2ruFxlsN9hlnuGABjbIMBiD4jelnmhBGiszgAWcu4V4S', 'client', NULL, 2, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 'en', NULL, NULL, NULL, NULL, 'light', 0, 0, 0, 0, 1, NULL, 0.00, NULL, 0, NULL, NULL, NULL, 0, 0, '#2180f3', '2025-03-07 06:56:32', '2025-03-07 06:56:32'),
(395, 'efewwrew', 'sixodos421@dpcos.com', NULL, '$2y$10$8VNWN9ZLMXsTmH5wyIH.Y.HqvQMhEqF.de1AhRWRDbEPS4AsNAR76', 'owner', NULL, 1, NULL, NULL, NULL, NULL, 1, 872554, 0, 0, 0, 1, 'en', NULL, NULL, NULL, NULL, 'light', 0, 0, 0, 0, 1, NULL, 0.00, NULL, 0, NULL, NULL, '2025-04-10 19:16:07', 0, 0, '#2180f3', '2025-04-10 13:37:11', '2025-04-10 13:46:07'),
(396, 'vitthal', 'vitthal.b.oriontech@gmail.com', '2025-04-11 05:25:03', '$2y$10$ebQMrXKs.clQraEWhOzp4e.XfXt6uPwFg8Vegjj3qUliVBPJrTjMG', 'owner', NULL, 1, NULL, NULL, NULL, NULL, 1, 989378, 0, 0, 0, 1, 'en', NULL, NULL, NULL, NULL, 'light', 0, 0, 0, 0, NULL, NULL, 0.00, NULL, 0, NULL, NULL, NULL, 0, 0, '#2180f3', '2025-04-11 05:21:54', '2025-04-11 05:25:03'),
(397, 'abcd', 'komal.oriontech@gmail.com', NULL, '$2y$10$bnFjiYzBe2K/tX0BXh23wOkZamUMgqp.MIaYaMMQQKEoW1aZYgABu', 'owner', NULL, 1, NULL, NULL, NULL, NULL, 1, 354216, 0, 0, 0, 1, 'en', NULL, NULL, NULL, NULL, 'light', 0, 0, 0, 0, NULL, NULL, 0.00, NULL, 0, NULL, NULL, NULL, 0, 0, '#2180f3', '2025-04-17 08:37:03', '2025-04-17 08:37:03'),
(398, 'nikita', 'nikita.oriontech@gmail.com', '2025-04-17 08:42:54', '$2y$10$mqr/OipNOznDz6pW/61Eeu8mk9ac//.6tzYM0ATpGybY9E5sH6x56', 'owner', NULL, 1, NULL, NULL, NULL, NULL, 1, 477777, 0, 0, 1, 1, 'en', NULL, NULL, NULL, NULL, 'light', 0, 0, 0, 0, 1, NULL, 0.44, NULL, 0, NULL, NULL, '2025-04-17 14:12:53', 0, 0, '#2180f3', '2025-04-17 08:40:53', '2025-04-24 04:23:26'),
(399, 'test', 'nikita@gmail.com', '2025-04-17 08:54:02', '$2y$10$BfPGTo2LoDyCtI0fhbIkceQBVisvKW.VWqFeCVPNhYl012FtJPO9m', 'user', NULL, 398, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 'en', NULL, NULL, NULL, NULL, 'light', 0, 0, 0, 0, 1, NULL, 0.00, NULL, 0, NULL, NULL, NULL, 0, 0, '#2180f3', '2025-04-17 08:54:02', '2025-04-17 08:54:02'),
(400, 'Tester', 'tanishka.oriontech@gmail.com', '2025-04-18 07:43:08', '$2y$10$I8RjyzRMoWwOdE9NKJ45aewXRy8cnwLcDzxOxLJX2xl37gJy/0dG2', 'owner', 'avatars/400_avatar1745039019.PNG', 1, NULL, NULL, NULL, NULL, 1, 575675, 0, 0, 0, 1, 'en', NULL, NULL, NULL, NULL, 'light', 0, 1, 0, 0, 3, '2025-06-07', 0.79, NULL, 3, NULL, NULL, '2025-04-24 09:32:18', 0, 0, '#2180f3', '2025-04-18 07:42:18', '2025-05-07 17:33:09'),
(401, 'poonam', 'poonam.oriontech@gmail.com', '2025-04-18 09:43:45', '$2y$10$2JfD0ZOuCFRu/s.pqsp9WuOY7NeBMaLMlIt2TQH668ZPr7G9sWMBG', 'user', NULL, 400, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 1, 'en', NULL, NULL, NULL, NULL, 'light', 0, 0, 0, 0, 1, NULL, 0.00, NULL, 0, NULL, NULL, NULL, 0, 0, '#2180f3', '2025-04-18 09:43:45', '2025-04-24 04:05:18'),
(402, 'ajay', 'yofey84450@exitings.com', '2025-05-07 17:23:31', '$2y$10$URwlnwhhumyu20fThzkKNedQbOml01obIBknUl9ifGGNdP4sAT8vm', 'owner', NULL, 1, NULL, NULL, NULL, NULL, 1, 723325, 0, 0, 0, 1, 'en', NULL, NULL, NULL, NULL, 'light', 0, 0, 0, 0, NULL, NULL, 0.00, NULL, 0, NULL, NULL, NULL, 0, 0, '#2180f3', '2025-05-07 17:22:38', '2025-05-07 17:22:38');

-- --------------------------------------------------------

--
-- Table structure for table `user_contacts`
--

CREATE TABLE `user_contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_contacts`
--

INSERT INTO `user_contacts` (`id`, `parent_id`, `user_id`, `role`, `created_at`, `updated_at`) VALUES
(1, 2, 4, 'user', '2024-03-30 11:32:09', '2024-03-30 11:32:09'),
(2, 6, 7, 'user', '2024-04-10 07:51:03', '2024-04-10 07:51:03'),
(3, 6, 8, 'client', '2024-04-10 07:51:44', '2024-04-10 07:51:44'),
(5, 9, 9, 'client', '2024-05-09 08:15:02', '2024-05-09 08:15:02'),
(7, 9, 12, 'user', '2024-05-09 08:24:34', '2024-05-09 08:24:34'),
(8, 13, 14, 'user', '2024-05-23 08:07:32', '2024-05-23 08:07:32'),
(9, 13, 15, 'client', '2024-05-23 09:37:08', '2024-05-23 09:37:08'),
(11, 13, 17, 'client', '2024-06-03 10:21:39', '2024-06-03 10:21:39'),
(12, 18, 16, 'client', '2024-06-03 11:07:47', '2024-06-03 11:07:47'),
(14, 13, 20, 'user', '2024-06-04 13:42:04', '2024-06-04 13:42:04'),
(15, 13, 21, 'user', '2024-06-05 10:26:10', '2024-06-05 10:26:10'),
(16, 13, 22, 'user', '2024-06-05 10:36:46', '2024-06-05 10:36:46'),
(17, 13, 23, 'user', '2024-06-05 10:45:57', '2024-06-05 10:45:57'),
(18, 13, 24, 'user', '2024-06-05 11:01:27', '2024-06-05 11:01:27'),
(19, 13, 25, 'user', '2024-06-06 06:06:37', '2024-06-06 06:06:37'),
(20, 13, 30, 'user', '2024-06-06 08:08:44', '2024-06-06 08:08:44'),
(21, 9, 31, 'user', '2024-06-07 06:19:21', '2024-06-07 06:19:21'),
(22, 35, 37, 'user', '2024-07-17 11:19:45', '2024-07-17 11:19:45'),
(24, 39, 41, 'user', '2024-07-18 07:50:59', '2024-07-18 07:50:59'),
(26, 39, 39, 'client', '2024-07-19 07:15:00', '2024-07-19 07:15:00'),
(28, 35, 42, 'client', '2024-07-19 07:22:40', '2024-07-19 07:22:40'),
(29, 39, 43, 'client', '2024-07-19 07:49:17', '2024-07-19 07:49:17'),
(30, 35, 44, 'client', '2024-07-20 11:52:18', '2024-07-20 11:52:18'),
(31, 45, 46, 'client', '2024-07-25 08:16:06', '2024-07-25 08:16:06'),
(32, 45, 39, 'user', '2024-07-25 08:24:23', '2024-07-25 08:24:23'),
(33, 39, 47, 'user', '2024-07-26 07:37:48', '2024-07-26 07:37:48'),
(35, 49, 50, 'client', '2024-09-04 10:02:01', '2024-09-04 10:02:01'),
(36, 49, 9, 'user', '2024-09-05 10:32:33', '2024-09-05 10:32:33'),
(37, 9, 49, 'user', '2024-09-05 10:33:20', '2024-09-05 10:33:20'),
(38, 9, 50, 'client', '2024-10-01 06:14:25', '2024-10-01 06:14:25'),
(39, 48, 51, 'client', '2024-10-01 09:50:44', '2024-10-01 09:50:44'),
(41, 62, 39, 'client', '2024-11-25 12:53:34', '2024-11-25 12:53:34'),
(42, 62, 45, 'user', '2024-11-27 13:59:12', '2024-11-27 13:59:12'),
(43, 48, 64, 'user', '2024-12-03 07:49:28', '2024-12-03 07:49:28'),
(44, 48, 65, 'client', '2024-12-03 07:50:38', '2024-12-03 07:50:38'),
(45, 64, 66, 'user', '2024-12-03 07:56:11', '2024-12-03 07:56:11'),
(46, 62, 67, 'client', '2024-12-03 11:21:31', '2024-12-03 11:21:31'),
(47, 48, 365, 'user', '2025-02-08 09:56:31', '2025-02-08 09:56:31'),
(48, 364, 366, 'user', '2025-02-08 13:21:31', '2025-02-08 13:21:31'),
(49, 364, 381, 'user', '2025-02-12 10:01:43', '2025-02-12 10:01:43'),
(50, 364, 382, 'user', '2025-02-12 10:16:30', '2025-02-12 10:16:30'),
(51, 365, 383, 'client', '2025-02-14 11:50:17', '2025-02-14 11:50:17'),
(52, 2, 389, 'client', '2025-03-07 06:56:32', '2025-03-07 06:56:32'),
(53, 398, 399, 'user', '2025-04-17 08:54:02', '2025-04-17 08:54:02'),
(54, 400, 400, 'user', '2025-04-18 08:11:45', '2025-04-18 08:11:45'),
(55, 400, 401, 'user', '2025-04-18 09:43:45', '2025-04-18 09:43:45'),
(56, 400, 398, 'client', '2025-04-19 04:10:19', '2025-04-19 04:10:19');

-- --------------------------------------------------------

--
-- Table structure for table `user_coupons`
--

CREATE TABLE `user_coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user` int(11) NOT NULL,
  `coupon` int(11) NOT NULL,
  `order` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_to_dos`
--

CREATE TABLE `user_to_dos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_complete` tinyint(1) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_to_dos`
--

INSERT INTO `user_to_dos` (`id`, `title`, `is_complete`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '-', 1, 9, '2024-05-09 08:54:41', '2024-05-30 07:49:40'),
(2, '-', 1, 9, '2024-05-09 08:54:43', '2024-05-30 07:49:40'),
(3, 'A to Z', 1, 39, '2024-07-18 07:42:02', '2024-07-27 10:04:36'),
(5, 'A to Z', 1, 45, '2024-07-25 07:24:54', '2024-07-25 07:25:11'),
(11, 'hfhgfhf', 1, 48, '2025-02-18 06:56:18', '2025-02-18 06:56:22'),
(12, 'dsfsdfs', 0, 48, '2025-02-18 07:10:36', '2025-02-18 07:10:36'),
(13, 'test', 0, 400, '2025-04-22 06:45:23', '2025-04-22 06:45:23');

-- --------------------------------------------------------

--
-- Table structure for table `webhooks`
--

CREATE TABLE `webhooks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `webhooks`
--

INSERT INTO `webhooks` (`id`, `module`, `url`, `method`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Invoice Status Updated', 'https://hooks.slack.com/services/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', 'POST', 9, '2024-05-09 08:36:33', '2024-05-09 08:36:33'),
(2, 'New Project', 'https://hooks.slack.com/services/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', 'POST', 48, '2025-02-10 11:03:09', '2025-02-10 11:03:09');

-- --------------------------------------------------------

--
-- Table structure for table `zoom_meetings`
--

CREATE TABLE `zoom_meetings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meeting_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `project_id` int(11) NOT NULL DEFAULT '0',
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `duration` int(11) NOT NULL DEFAULT '0',
  `start_url` text COLLATE utf8mb4_unicode_ci,
  `join_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'waiting',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `zoom_meetings`
--

INSERT INTO `zoom_meetings` (`id`, `title`, `meeting_id`, `client_id`, `project_id`, `user_id`, `password`, `start_date`, `duration`, `start_url`, `join_url`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Test zoom metting', '83004709546', '51', 110, '365', '12345', '2025-02-10 11:21:00', 30, 'https://us05web.zoom.us/s/83004709546?zak=eyJ0eXAiOiJKV1QiLCJzdiI6IjAwMDAwMSIsInptX3NrbSI6InptX28ybSIsImFsZyI6IkhTMjU2In0.eyJpc3MiOiJ3ZWIiLCJjbHQiOjAsIm1udW0iOiI4MzAwNDcwOTU0NiIsImF1ZCI6ImNsaWVudHNtIiwidWlkIjoiU1pXT1R6cHBSSi02UG5SdmZKdXJYdyIsInppZCI6ImMzYjEzNTQzMjU3NTQ2N2ZiOGY3MTZkZjhkMmY2ODE1Iiwic2siOiIwIiwic3R5IjoxMDAsIndjZCI6InVzMDUiLCJleHAiOjE3MzkxOTM1OTAsImlhdCI6MTczOTE4NjM5MCwiYWlkIjoiM3JkTE5adG5RRm1TUHh0TUlDSmtvZyIsImNpZCI6IiJ9.UH8p0C7qdk5sj82IDTIfTP6jknX8uOB4q3R7FJ92L5s', 'https://us05web.zoom.us/j/83004709546?pwd=f251hSC6iW9p9Bcgzkf7DpUou6vZQe.1', 'waiting', 48, '2025-02-10 11:19:50', '2025-02-21 07:34:07'),
(2, 'test metting', '85237658646', '0', 84, '64', '', '2025-02-13 18:30:00', 10, 'https://us05web.zoom.us/s/85237658646?zak=eyJ0eXAiOiJKV1QiLCJzdiI6IjAwMDAwMSIsInptX3NrbSI6InptX28ybSIsImFsZyI6IkhTMjU2In0.eyJpc3MiOiJ3ZWIiLCJjbHQiOjAsIm1udW0iOiI4NTIzNzY1ODY0NiIsImF1ZCI6ImNsaWVudHNtIiwidWlkIjoiU1pXT1R6cHBSSi02UG5SdmZKdXJYdyIsInppZCI6IjkzY2YzNTZhZTY3MDRhMWQ4Y2Y5ZDAxNWYyM2NhZmU1Iiwic2siOiIwIiwic3R5IjoxMDAsIndjZCI6InVzMDUiLCJleHAiOjE3Mzk1Mzk1MTcsImlhdCI6MTczOTUzMjMxNywiYWlkIjoiM3JkTE5adG5RRm1TUHh0TUlDSmtvZyIsImNpZCI6IiJ9.gliVbx8WJwSIKXgpgdIgkNCk_ImvOB2Gn8yhqA9LLU4', 'https://us05web.zoom.us/j/85237658646?pwd=Vah9rmfmqH1FAhAGXMXOOIo9iKJFkB.1', 'waiting', 48, '2025-02-14 11:25:16', '2025-02-21 07:34:07'),
(3, 'test meeting 2', '87879135211', '0', 110, '365', '', '2025-02-14 11:28:00', 10, 'https://us05web.zoom.us/s/87879135211?zak=eyJ0eXAiOiJKV1QiLCJzdiI6IjAwMDAwMSIsInptX3NrbSI6InptX28ybSIsImFsZyI6IkhTMjU2In0.eyJpc3MiOiJ3ZWIiLCJjbHQiOjAsIm1udW0iOiI4Nzg3OTEzNTIxMSIsImF1ZCI6ImNsaWVudHNtIiwidWlkIjoiU1pXT1R6cHBSSi02UG5SdmZKdXJYdyIsInppZCI6ImI0N2VjZDEzZWExMjQ0Yzg5OTdjZjVkYWJmMjI0N2EyIiwic2siOiIwIiwic3R5IjoxMDAsIndjZCI6InVzMDUiLCJleHAiOjE3Mzk1Mzk2MTEsImlhdCI6MTczOTUzMjQxMSwiYWlkIjoiM3JkTE5adG5RRm1TUHh0TUlDSmtvZyIsImNpZCI6IiJ9.aNtrH__shqOn7FRMBJCIZE1LDfYvYyVhXGGueYOk7Co', 'https://us05web.zoom.us/j/87879135211?pwd=fc4Ti0Ydi756tbm3gaHRB6hwtevVM0.1', 'waiting', 48, '2025-02-14 11:26:50', '2025-02-21 07:34:08'),
(4, 'test meeting 3', '83519418426', '0', 84, '64', '', '2025-02-14 11:32:00', 31, 'https://us05web.zoom.us/s/83519418426?zak=eyJ0eXAiOiJKV1QiLCJzdiI6IjAwMDAwMSIsInptX3NrbSI6InptX28ybSIsImFsZyI6IkhTMjU2In0.eyJpc3MiOiJ3ZWIiLCJjbHQiOjAsIm1udW0iOiI4MzUxOTQxODQyNiIsImF1ZCI6ImNsaWVudHNtIiwidWlkIjoiU1pXT1R6cHBSSi02UG5SdmZKdXJYdyIsInppZCI6IjJhYjRkYTY3NjcwYjQzZGM4NDY5MmUyZjIyN2ZlMGYwIiwic2siOiIwIiwic3R5IjoxMDAsIndjZCI6InVzMDUiLCJleHAiOjE3Mzk1Mzk5MTcsImlhdCI6MTczOTUzMjcxNywiYWlkIjoiM3JkTE5adG5RRm1TUHh0TUlDSmtvZyIsImNpZCI6IiJ9.DVKnRS0J40DoLSus8SPTICHgkel0FxgD2rNdRHc2c0Y', 'https://us05web.zoom.us/j/83519418426?pwd=zQ7St8rUlHXRVIDXvhfCl5gLaPQoIu.1', 'waiting', 48, '2025-02-14 11:31:56', '2025-02-21 07:34:08'),
(6, 'test G meet', '84539427926', '51', 110, '365', 'Dipak@123', '2025-02-25 04:30:00', 60, 'https://us05web.zoom.us/s/84539427926?zak=eyJ0eXAiOiJKV1QiLCJzdiI6IjAwMDAwMSIsInptX3NrbSI6InptX28ybSIsImFsZyI6IkhTMjU2In0.eyJpc3MiOiJ3ZWIiLCJjbHQiOjAsIm1udW0iOiI4NDUzOTQyNzkyNiIsImF1ZCI6ImNsaWVudHNtIiwidWlkIjoiU1pXT1R6cHBSSi02UG5SdmZKdXJYdyIsInppZCI6IjhkNDI5Y2M0MGM4NTQ1MTFhYzQ0YWRjNDVkNjg1NWNmIiwic2siOiIwIiwic3R5IjoxMDAsIndjZCI6InVzMDUiLCJleHAiOjE3NDAxMjk4OTIsImlhdCI6MTc0MDEyMjY5MiwiYWlkIjoiM3JkTE5adG5RRm1TUHh0TUlDSmtvZyIsImNpZCI6IiJ9.IXTP8mBNLZIIXrbrMuqYr-Xc4beBHK4ujpdixj3JUVA', 'https://us05web.zoom.us/j/84539427926?pwd=Ngc5FZooftjUFyrNwYaBCKwbOvbiuv.1', 'waiting', 48, '2025-02-21 07:24:52', '2025-02-21 07:34:08'),
(7, 'test 2 zoom meeting google calendar', '85228807799', '51', 110, '365', 'Dipak@123', '2025-02-25 04:30:00', 60, 'https://us05web.zoom.us/s/85228807799?zak=eyJ0eXAiOiJKV1QiLCJzdiI6IjAwMDAwMSIsInptX3NrbSI6InptX28ybSIsImFsZyI6IkhTMjU2In0.eyJpc3MiOiJ3ZWIiLCJjbHQiOjAsIm1udW0iOiI4NTIyODgwNzc5OSIsImF1ZCI6ImNsaWVudHNtIiwidWlkIjoiU1pXT1R6cHBSSi02UG5SdmZKdXJYdyIsInppZCI6ImI5YWMwODJjZDRlNDQ5YTFiYjdkNDhhZTQ3ODIyNTczIiwic2siOiIwIiwic3R5IjoxMDAsIndjZCI6InVzMDUiLCJleHAiOjE3NDAxMzA0NDUsImlhdCI6MTc0MDEyMzI0NSwiYWlkIjoiM3JkTE5adG5RRm1TUHh0TUlDSmtvZyIsImNpZCI6IiJ9.UGjXBZluc_R7x7vbzHOQVKvoOF3Q146vkCDlndzkfFg', 'https://us05web.zoom.us/j/85228807799?pwd=zA6hD7bQaou9ftDlcLgVTQhsi8VkWr.1', 'waiting', 48, '2025-02-21 07:34:05', '2025-02-21 07:34:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banktransfers`
--
ALTER TABLE `banktransfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ch_favorites`
--
ALTER TABLE `ch_favorites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ch_messages`
--
ALTER TABLE `ch_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contracts`
--
ALTER TABLE `contracts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contract_attechments`
--
ALTER TABLE `contract_attechments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contract_comments`
--
ALTER TABLE `contract_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contract_notes`
--
ALTER TABLE `contract_notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contract_types`
--
ALTER TABLE `contract_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_template_langs`
--
ALTER TABLE `email_template_langs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_payments`
--
ALTER TABLE `invoice_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_products`
--
ALTER TABLE `invoice_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_details`
--
ALTER TABLE `login_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `milestones`
--
ALTER TABLE `milestones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_templates`
--
ALTER TABLE `notification_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_template_langs`
--
ALTER TABLE `notification_template_langs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_settings`
--
ALTER TABLE `payment_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payment_settings_name_created_by_unique` (`name`,`created_by`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plans_name_unique` (`name`);

--
-- Indexes for table `plan_requests`
--
ALTER TABLE `plan_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_email_templates`
--
ALTER TABLE `project_email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_tasks`
--
ALTER TABLE `project_tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_task_timers`
--
ALTER TABLE `project_task_timers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_users`
--
ALTER TABLE `project_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referral_settings`
--
ALTER TABLE `referral_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referral_transactions`
--
ALTER TABLE `referral_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_name_created_by_unique` (`name`,`created_by`);

--
-- Indexes for table `task_checklists`
--
ALTER TABLE `task_checklists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task_comments`
--
ALTER TABLE `task_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task_files`
--
ALTER TABLE `task_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task_stages`
--
ALTER TABLE `task_stages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `templates`
--
ALTER TABLE `templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timesheets`
--
ALTER TABLE `timesheets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `time_trackers`
--
ALTER TABLE `time_trackers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `track_photos`
--
ALTER TABLE `track_photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction_orders`
--
ALTER TABLE `transaction_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_contacts`
--
ALTER TABLE `user_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_coupons`
--
ALTER TABLE `user_coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_to_dos`
--
ALTER TABLE `user_to_dos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `webhooks`
--
ALTER TABLE `webhooks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zoom_meetings`
--
ALTER TABLE `zoom_meetings`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=310;

--
-- AUTO_INCREMENT for table `banktransfers`
--
ALTER TABLE `banktransfers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contracts`
--
ALTER TABLE `contracts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `contract_attechments`
--
ALTER TABLE `contract_attechments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `contract_comments`
--
ALTER TABLE `contract_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contract_notes`
--
ALTER TABLE `contract_notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contract_types`
--
ALTER TABLE `contract_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `email_template_langs`
--
ALTER TABLE `email_template_langs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `invoice_payments`
--
ALTER TABLE `invoice_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `invoice_products`
--
ALTER TABLE `invoice_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `login_details`
--
ALTER TABLE `login_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=406;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `milestones`
--
ALTER TABLE `milestones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `notification_templates`
--
ALTER TABLE `notification_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `notification_template_langs`
--
ALTER TABLE `notification_template_langs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `payment_settings`
--
ALTER TABLE `payment_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1089;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `plan_requests`
--
ALTER TABLE `plan_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT for table `project_email_templates`
--
ALTER TABLE `project_email_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=691;

--
-- AUTO_INCREMENT for table `project_tasks`
--
ALTER TABLE `project_tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `project_task_timers`
--
ALTER TABLE `project_task_timers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `project_users`
--
ALTER TABLE `project_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200;

--
-- AUTO_INCREMENT for table `referral_settings`
--
ALTER TABLE `referral_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `referral_transactions`
--
ALTER TABLE `referral_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1442;

--
-- AUTO_INCREMENT for table `task_checklists`
--
ALTER TABLE `task_checklists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `task_comments`
--
ALTER TABLE `task_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `task_files`
--
ALTER TABLE `task_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `task_stages`
--
ALTER TABLE `task_stages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=552;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `templates`
--
ALTER TABLE `templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `timesheets`
--
ALTER TABLE `timesheets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `time_trackers`
--
ALTER TABLE `time_trackers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `track_photos`
--
ALTER TABLE `track_photos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transaction_orders`
--
ALTER TABLE `transaction_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=403;

--
-- AUTO_INCREMENT for table `user_contacts`
--
ALTER TABLE `user_contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `user_coupons`
--
ALTER TABLE `user_coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_to_dos`
--
ALTER TABLE `user_to_dos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `webhooks`
--
ALTER TABLE `webhooks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `zoom_meetings`
--
ALTER TABLE `zoom_meetings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
