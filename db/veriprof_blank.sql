-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 14, 2023 at 06:11 AM
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
-- Database: `veriprof_blank`
--

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `session_id` varchar(64) NOT NULL DEFAULT '0',
  `ip_address` varchar(64) NOT NULL DEFAULT '0',
  `user_agent` varchar(128) NOT NULL,
  `last_activity` int(64) UNSIGNED NOT NULL DEFAULT 0,
  `user_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bids`
--

CREATE TABLE `tbl_bids` (
  `id` bigint(255) NOT NULL,
  `name` varchar(32) NOT NULL,
  `surname` varchar(16) NOT NULL,
  `professional_reg_no` varchar(16) NOT NULL,
  `email_add` varchar(16) NOT NULL,
  `cell` varchar(16) NOT NULL,
  `bidder` varchar(16) NOT NULL,
  `client_department` varchar(16) NOT NULL,
  `bid_no` varchar(16) NOT NULL,
  `short_description` varchar(255) NOT NULL,
  `created_by` varchar(8) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `file` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_business`
--

CREATE TABLE `tbl_business` (
  `id` bigint(255) NOT NULL,
  `pname` varchar(64) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `pcouncil` varchar(64) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `pcipc_reg_no` varchar(100) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `ptype` enum('CC','Sole Proprietor','Private','Public','Inc','Partnership','Business Trust') CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL DEFAULT 'Sole Proprietor',
  `status` enum('Unverified','Verified') CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL DEFAULT 'Unverified',
  `verified_by` varchar(128) CHARACTER SET utf16 COLLATE utf16_general_ci DEFAULT NULL,
  `verified_at` date DEFAULT NULL,
  `created_by` varchar(128) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_directors`
--

CREATE TABLE `tbl_directors` (
  `id` bigint(255) NOT NULL,
  `buzi_id` bigint(255) NOT NULL,
  `name` varchar(128) NOT NULL,
  `prof_reg_no` varchar(128) NOT NULL,
  `owned` varchar(128) NOT NULL,
  `created_by` bigint(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `status` enum('Pending','Unverified','Verified') NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_equips`
--

CREATE TABLE `tbl_equips` (
  `id` bigint(128) NOT NULL,
  `buzi_id` int(255) NOT NULL,
  `name` varchar(100) CHARACTER SET utf16 COLLATE utf16_general_ci DEFAULT NULL,
  `filename` varchar(255) CHARACTER SET utf16 COLLATE utf16_general_ci DEFAULT NULL,
  `flag` varchar(100) CHARACTER SET utf16 COLLATE utf16_general_ci DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET utf16 COLLATE utf16_general_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_id`
--

CREATE TABLE `tbl_id` (
  `id` bigint(255) NOT NULL,
  `profile_id` int(255) NOT NULL,
  `buzi_id` int(255) NOT NULL,
  `office_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_last_login`
--

CREATE TABLE `tbl_last_login` (
  `id` bigint(255) NOT NULL,
  `userId` bigint(255) NOT NULL,
  `sessionData` varchar(1024) NOT NULL,
  `machineIp` varchar(64) NOT NULL,
  `userAgent` varchar(255) NOT NULL,
  `agentString` varchar(1024) NOT NULL,
  `platform` varchar(64) NOT NULL,
  `createdDtm` datetime NOT NULL DEFAULT current_timestamp(),
  `token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_offices`
--

CREATE TABLE `tbl_offices` (
  `id` bigint(255) NOT NULL,
  `buzi_id` int(255) NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `res_prof_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `res_prof_reg` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_by` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `verified_by` varchar(128) CHARACTER SET utf16 COLLATE utf16_general_ci DEFAULT NULL,
  `verified_at` datetime(6) DEFAULT NULL,
  `file_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `file_certificate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` enum('Unverified','Verified') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Unverified',
  `is_head` enum('1','0') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pay`
--

CREATE TABLE `tbl_pay` (
  `id` int(8) DEFAULT NULL,
  `account` enum('General','Pro') NOT NULL,
  `amount` enum('0','89.99') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_plans`
--

CREATE TABLE `tbl_plans` (
  `id` bigint(255) NOT NULL,
  `verify_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `client_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `client_address_line_1` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `client_address_line_2` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `client_city` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `client_province` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `client_zipcode` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `erfno` int(64) NOT NULL,
  `hia_sensitivity` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `municipal` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `professional_reg_number` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `professional` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `contact_email` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `contact_phone` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `contact_address_line_1` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `contact_address_line_2` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `contact_city` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `contact_province` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `contact_zipcode` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `project_plan_no` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `project_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `occupancy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `project_cost` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `project_area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `project_address_line_1` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `project_address_line_2` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `project_city` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `project_province` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `project_zipcode` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `responsible_qs` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `file` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `certificate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status_request` enum('Yes','No') NOT NULL DEFAULT 'No'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_profile`
--

CREATE TABLE `tbl_profile` (
  `id` bigint(255) NOT NULL,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `surname` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_no` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `council` enum('SACAP','ECSA','SACQSP','SACPMP') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'SACAP',
  `reg_no` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `employer` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `appointment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pratical_certification` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `qualification` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `exp_year` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `full_part` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `jtitle` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `updated_at` date NOT NULL,
  `status` enum('Unverified','Verified') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Unverified',
  `status_request` enum('Yes','No') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'No',
  `verified_by` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `verified_at` date DEFAULT NULL,
  `user_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_director` enum('1','0') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_projects`
--

CREATE TABLE `tbl_projects` (
  `id` bigint(255) NOT NULL,
  `title` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `prof_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `started_at` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `const_cost` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `final_cost` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `variable` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `prof_cost` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `client_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pl_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pl_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pl_phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `proj_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `proj_gps` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `proj_street` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `proj_city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `proj_state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `proj_zip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` enum('Completed','Ongoing','Cancelled') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Ongoing',
  `status_verify` enum('1','0') NOT NULL DEFAULT '0',
  `appointment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pratical_certification` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `final_certification` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `final_account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `completed_at` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status_verified` enum('Verified','Unverified') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Unverified',
  `verified_at` datetime DEFAULT NULL,
  `verified_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_reports`
--

CREATE TABLE `tbl_reports` (
  `id` bigint(255) NOT NULL,
  `accessor` varchar(128) DEFAULT NULL,
  `profess` varchar(255) NOT NULL,
  `content_id` varchar(255) NOT NULL,
  `report_type` enum('office','project','profile','business') NOT NULL DEFAULT 'office',
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(255) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `data` text NOT NULL,
  `score` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_reset_password`
--

CREATE TABLE `tbl_reset_password` (
  `id` bigint(20) NOT NULL,
  `email` varchar(128) NOT NULL,
  `activation_id` varchar(32) NOT NULL,
  `agent` varchar(512) NOT NULL,
  `client_ip` varchar(32) NOT NULL,
  `isDeleted` tinyint(4) NOT NULL DEFAULT 0,
  `createdBy` bigint(20) NOT NULL DEFAULT 1,
  `createdDtm` datetime NOT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedDtm` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_roles`
--

CREATE TABLE `tbl_roles` (
  `roleId` tinyint(4) NOT NULL COMMENT 'role id',
  `role` varchar(50) NOT NULL COMMENT 'role text'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_schedule`
--

CREATE TABLE `tbl_schedule` (
  `id` bigint(255) NOT NULL,
  `verify_user_id` varchar(255) NOT NULL,
  `verify_target` enum('office','project','profile','business') NOT NULL DEFAULT 'profile',
  `date` varchar(64) NOT NULL,
  `verify_content_id` varchar(255) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `is_done` enum('1','0') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_staffs`
--

CREATE TABLE `tbl_staffs` (
  `id` bigint(128) NOT NULL,
  `buzi_id` int(255) NOT NULL,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `surname` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `jtitle` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `exp_year` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `prof_reg_no` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `file_appointment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `file_prof_registration` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `file_qualification` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `file_cv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_by` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `status` enum('Unverified','Verified','Pending') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Unverified',
  `office_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `userId` int(11) NOT NULL,
  `email` varchar(128) NOT NULL COMMENT 'login email',
  `password` varchar(128) NOT NULL COMMENT 'hashed login password',
  `name` varchar(128) DEFAULT NULL COMMENT 'full name of user',
  `mobile` varchar(20) DEFAULT NULL,
  `roleId` tinyint(4) NOT NULL DEFAULT 4,
  `account_type` enum('free','pro') NOT NULL DEFAULT 'free',
  `isDeleted` tinyint(4) NOT NULL DEFAULT 0,
  `createdDtm` datetime NOT NULL,
  `updatedDtm` datetime DEFAULT NULL,
  `picpath` varchar(128) NOT NULL DEFAULT 'assets/icon-66.png'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`userId`, `email`, `password`, `name`, `mobile`, `roleId`, `account_type`, `isDeleted`, `createdDtm`, `updatedDtm`, `picpath`) VALUES
(1, 'mdigwa@gmail.com', '$2y$10$2Wi1e2vdrUPEBlTHgtp38eBJFQhij48910nT5e/77vK.fPg7awQWq', 'System Administrator', '9890098900', 1, 'free', 0, '2020-08-28 18:56:49', '2020-09-24 12:58:57', 'assets/icon-66.png'),
(2, 'accessor@gmail.com', '$2y$10$ZvhX1nFKZnkDE4V4C6Djx.Ge2Dpd.rru4RdINhXYsvIPyPUbnjW8O', 'Assessors', '9890098900', 2, 'free', 0, '2020-08-28 17:49:56', '2020-09-24 13:08:17', 'assets/icon-66.png'),
(3, 'professional@gmail.com', '$2y$10$thyWmo1jHYQTbT6P.lIWk.vUmHwYwIrbPUti/7h/pBnD024N7/O5S', 'Professional', '9890098900', 3, 'free', 0, '2020-08-28 17:50:22', '2020-09-24 13:08:08', 'assets/icon-66.png'),
(37, 'pragmatismer666@gmail.com', '$2y$10$t2614wD/q2GLiNDQeyI0GeUbMmpIXtV5iIcxnhDoQeCIR6ojc1VSm', 'Nikolay', '1234567890', 2, 'free', 0, '2022-01-11 09:55:50', '2022-01-11 09:55:50', 'assets/icon-66.png'),
(42, 'pragmatismer@gmail.com', '$2y$10$XQrNY7ZBScxFmI6AE1Q65ud7GGISUMcIfm3tbiWEuF9CXGtOXNyXe', 'Pragmatismer', '1234567890', 3, 'free', 0, '2022-10-11 17:04:40', '2022-10-11 17:04:40', 'assets/icon-66.png'),
(39, 'tonito@1voice.world', '$2y$10$yIBOYd4nZmLaEH1rsF8xRuq7oyxLJCaHFLb/JIUo2Yujj9A0rwF52', 'Tonito Kester', '0611978335', 3, 'free', 0, '2022-01-11 12:03:12', '2022-01-11 12:03:12', 'assets/icon-66.png'),
(40, 'mdigwa@gmail.com', '$2y$10$2Wi1e2vdrUPEBlTHgtp38eBJFQhij48910nT5e/77vK.fPg7awQWq', 'Mdingwa Nyathi', '0718881882', 2, 'free', 0, '2022-01-11 12:08:35', '2022-01-11 12:08:35', 'assets/icon-66.png'),
(41, 'nurvwshop@gmail.com', '$2y$10$2Wi1e2vdrUPEBlTHgtp38eBJFQhij48910nT5e/77vK.fPg7awQWq', 'Nurvwshop', '0723386835', 3, 'pro', 0, '2022-01-11 20:51:39', '2022-03-15 06:14:14', 'assets/icon-66.png');

-- --------------------------------------------------------

--
-- Table structure for table `verify_zone_tbl`
--

CREATE TABLE `verify_zone_tbl` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(255) NOT NULL,
  `SACAP_ID` varchar(256) DEFAULT NULL,
  `SA_ID` varchar(256) DEFAULT NULL,
  `passport_ID` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `last_activity_idx` (`last_activity`);

--
-- Indexes for table `tbl_bids`
--
ALTER TABLE `tbl_bids`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_business`
--
ALTER TABLE `tbl_business`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_directors`
--
ALTER TABLE `tbl_directors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_equips`
--
ALTER TABLE `tbl_equips`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_id`
--
ALTER TABLE `tbl_id`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_last_login`
--
ALTER TABLE `tbl_last_login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_offices`
--
ALTER TABLE `tbl_offices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_pay`
--
ALTER TABLE `tbl_pay`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `tbl_plans`
--
ALTER TABLE `tbl_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_profile`
--
ALTER TABLE `tbl_profile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_projects`
--
ALTER TABLE `tbl_projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_reports`
--
ALTER TABLE `tbl_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_reset_password`
--
ALTER TABLE `tbl_reset_password`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_roles`
--
ALTER TABLE `tbl_roles`
  ADD PRIMARY KEY (`roleId`);

--
-- Indexes for table `tbl_schedule`
--
ALTER TABLE `tbl_schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_staffs`
--
ALTER TABLE `tbl_staffs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `verify_zone_tbl`
--
ALTER TABLE `verify_zone_tbl`
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_bids`
--
ALTER TABLE `tbl_bids`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_business`
--
ALTER TABLE `tbl_business`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_directors`
--
ALTER TABLE `tbl_directors`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_equips`
--
ALTER TABLE `tbl_equips`
  MODIFY `id` bigint(128) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_id`
--
ALTER TABLE `tbl_id`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_last_login`
--
ALTER TABLE `tbl_last_login`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_offices`
--
ALTER TABLE `tbl_offices`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_plans`
--
ALTER TABLE `tbl_plans`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_profile`
--
ALTER TABLE `tbl_profile`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_projects`
--
ALTER TABLE `tbl_projects`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_reports`
--
ALTER TABLE `tbl_reports`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_reset_password`
--
ALTER TABLE `tbl_reset_password`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_roles`
--
ALTER TABLE `tbl_roles`
  MODIFY `roleId` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT 'role id';

--
-- AUTO_INCREMENT for table `tbl_schedule`
--
ALTER TABLE `tbl_schedule`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_staffs`
--
ALTER TABLE `tbl_staffs`
  MODIFY `id` bigint(128) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
