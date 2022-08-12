-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 12, 2022 at 09:19 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `veriprof`
--

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `file` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_bids`
--

INSERT INTO `tbl_bids` (`id`, `name`, `surname`, `professional_reg_no`, `email_add`, `cell`, `bidder`, `client_department`, `bid_no`, `short_description`, `created_by`, `created_at`, `file`) VALUES
(1, 'Mdingwa', 'Nyathi', '21118', 'nurvwshop@gmail.', '0723386835', 'Sivago Architect', 'DoH', 'WIMS 22222', 'Tender title', '41', '2022-01-11 10:53:21.000000', '1641934401_WIMS 22222.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_business`
--

CREATE TABLE `tbl_business` (
  `id` bigint(255) NOT NULL,
  `pname` varchar(64) CHARACTER SET utf16 NOT NULL,
  `pcouncil` varchar(64) CHARACTER SET utf16 NOT NULL,
  `pcipc_reg_no` varchar(100) CHARACTER SET utf16 NOT NULL,
  `ptype` enum('CC','Sole Proprietor','Private','Public','Inc','Partnership','Business Trust') CHARACTER SET utf16 NOT NULL DEFAULT 'Sole Proprietor',
  `director` varchar(128) CHARACTER SET utf16 NOT NULL,
  `dir_prof_regno` varchar(128) CHARACTER SET utf16 NOT NULL,
  `owned` varchar(128) CHARACTER SET utf16 NOT NULL,
  `status` enum('Unverified','Verified','Pending') CHARACTER SET utf16 NOT NULL DEFAULT 'Unverified',
  `verified_by` varchar(128) CHARACTER SET utf16 DEFAULT NULL,
  `verified_at` date DEFAULT NULL,
  `created_by` varchar(128) CHARACTER SET utf16 NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_business`
--

INSERT INTO `tbl_business` (`id`, `pname`, `pcouncil`, `pcipc_reg_no`, `ptype`, `director`, `dir_prof_regno`, `owned`, `status`, `verified_by`, `verified_at`, `created_by`, `updated_at`) VALUES
(19, 'dev', 'dev', 'dev', 'CC', 'dev', 'dev', '12', 'Unverified', '', '0000-00-00', '38', '2022-01-13');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_equips`
--

CREATE TABLE `tbl_equips` (
  `id` bigint(128) NOT NULL,
  `buzi_id` int(255) NOT NULL,
  `name` varchar(100) CHARACTER SET utf16 DEFAULT NULL,
  `filename` varchar(128) CHARACTER SET utf16 DEFAULT NULL,
  `flag` varchar(100) CHARACTER SET utf16 DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET utf16 DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_equips`
--

INSERT INTO `tbl_equips` (`id`, `buzi_id`, `name`, `filename`, `flag`, `created_by`, `updated_at`) VALUES
(10, 19, 'dev', '1642105090_VeriProf -Tonito\'s Feedback.pdf', 'soft', '38', '2022-01-13 10:52:02'),
(11, 19, 'dev', '1642105093_VeriProf -Tonito\'s Feedback.pdf', 'hard', '38', '2022-01-13 10:52:02');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_id`
--

CREATE TABLE `tbl_id` (
  `id` bigint(255) NOT NULL,
  `profile_id` int(255) NOT NULL,
  `buzi_id` int(255) NOT NULL,
  `office_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_last_login`
--

CREATE TABLE `tbl_last_login` (
  `id` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  `sessionData` varchar(2048) NOT NULL,
  `machineIp` varchar(1024) NOT NULL,
  `userAgent` varchar(128) NOT NULL,
  `agentString` varchar(1024) NOT NULL,
  `platform` varchar(128) NOT NULL,
  `createdDtm` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_last_login`
--

INSERT INTO `tbl_last_login` (`id`, `userId`, `sessionData`, `machineIp`, `userAgent`, `agentString`, `platform`, `createdDtm`) VALUES
(1, 1, '{\"role\":\"1\",\"roleText\":\"Administrator\",\"name\":\"System Administrator\",\"mobile\":\"9890098900\",\"picpath\":\"assets\\/icon-66.png\"}', '::1', 'Chrome 98.0.4758.102', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36', 'Windows 10', '2022-03-07 21:11:00'),
(2, 1, '{\"role\":\"1\",\"roleText\":\"Administrator\",\"name\":\"System Administrator\",\"mobile\":\"9890098900\",\"picpath\":\"assets\\/icon-66.png\"}', '::1', 'Chrome 98.0.4758.102', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36', 'Windows 10', '2022-03-09 03:46:10'),
(3, 1, '{\"role\":\"1\",\"roleText\":\"Administrator\",\"name\":\"System Administrator\",\"mobile\":\"9890098900\",\"picpath\":\"assets\\/icon-66.png\"}', '::1', 'Chrome 98.0.4758.102', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36', 'Windows 10', '2022-03-09 03:46:27'),
(4, 1, '{\"role\":\"1\",\"roleText\":\"Administrator\",\"name\":\"System Administrator\",\"mobile\":\"9890098900\",\"picpath\":\"assets\\/icon-66.png\"}', '::1', 'Chrome 99.0.4844.51', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36', 'Windows 10', '2022-03-13 00:12:06'),
(5, 1, '{\"role\":\"1\",\"roleText\":\"Administrator\",\"name\":\"System Administrator\",\"mobile\":\"9890098900\",\"picpath\":\"assets\\/icon-66.png\"}', '::1', 'Chrome 99.0.4844.51', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36', 'Windows 10', '2022-03-13 00:12:17'),
(6, 1, '{\"role\":\"1\",\"roleText\":\"Administrator\",\"name\":\"System Administrator\",\"mobile\":\"9890098900\",\"picpath\":\"assets\\/icon-66.png\"}', '::1', 'Chrome 99.0.4844.51', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36', 'Windows 10', '2022-03-13 09:03:59'),
(7, 1, '{\"role\":\"1\",\"roleText\":\"Administrator\",\"name\":\"System Administrator\",\"mobile\":\"9890098900\",\"picpath\":\"assets\\/icon-66.png\"}', '::1', 'Chrome 99.0.4844.51', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36', 'Windows 10', '2022-03-14 23:23:06'),
(8, 1, '{\"role\":\"1\",\"roleText\":\"Administrator\",\"name\":\"System Administrator\",\"mobile\":\"9890098900\",\"picpath\":\"assets\\/icon-66.png\"}', '::1', 'Chrome 99.0.4844.51', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36', 'Windows 10', '2022-03-15 02:37:04'),
(9, 1, '{\"role\":\"1\",\"roleText\":\"Administrator\",\"name\":\"System Administrator\",\"mobile\":\"9890098900\",\"picpath\":\"assets\\/icon-66.png\"}', '::1', 'Chrome 99.0.4844.51', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36', 'Windows 10', '2022-03-15 11:21:35'),
(10, 1, '{\"role\":\"1\",\"roleText\":\"Administrator\",\"name\":\"System Administrator\",\"mobile\":\"9890098900\",\"picpath\":\"assets\\/icon-66.png\"}', '::1', 'Chrome 99.0.4844.51', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36', 'Windows 10', '2022-03-15 11:23:31'),
(11, 1, '{\"role\":\"1\",\"roleText\":\"Administrator\",\"name\":\"System Administrator\",\"mobile\":\"9890098900\",\"picpath\":\"assets\\/icon-66.png\"}', '::1', 'Chrome 99.0.4844.51', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36', 'Windows 10', '2022-03-15 11:52:15'),
(12, 1, '{\"role\":\"1\",\"roleText\":\"Administrator\",\"name\":\"System Administrator\",\"mobile\":\"9890098900\",\"picpath\":\"assets\\/icon-66.png\"}', '::1', 'Chrome 99.0.4844.51', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36', 'Windows 10', '2022-03-15 12:14:40'),
(13, 1, '{\"role\":\"1\",\"roleText\":\"Administrator\",\"name\":\"System Administrator\",\"mobile\":\"9890098900\",\"picpath\":\"assets\\/icon-66.png\"}', '::1', 'Chrome 99.0.4844.51', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36', 'Windows 10', '2022-03-15 20:48:04'),
(14, 1, '{\"role\":\"1\",\"roleText\":\"Administrator\",\"name\":\"System Administrator\",\"mobile\":\"9890098900\",\"picpath\":\"assets\\/icon-66.png\"}', '::1', 'Chrome 99.0.4844.51', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36', 'Windows 10', '2022-03-16 08:49:51'),
(15, 1, '{\"role\":\"1\",\"roleText\":\"Administrator\",\"name\":\"System Administrator\",\"mobile\":\"9890098900\",\"picpath\":\"assets\\/icon-66.png\"}', '::1', 'Chrome 99.0.4844.51', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36', 'Windows 10', '2022-03-16 13:02:22'),
(16, 1, '{\"role\":\"1\",\"roleText\":\"Administrator\",\"name\":\"System Administrator\",\"mobile\":\"9890098900\",\"picpath\":\"assets\\/icon-66.png\"}', '::1', 'Chrome 99.0.4844.74', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36', 'Windows 10', '2022-03-16 22:36:47'),
(17, 1, '{\"role\":\"1\",\"roleText\":\"Administrator\",\"name\":\"System Administrator\",\"mobile\":\"9890098900\",\"picpath\":\"assets\\/icon-66.png\"}', '::1', 'Chrome 99.0.4844.74', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36', 'Windows 10', '2022-03-17 02:22:37'),
(18, 1, '{\"role\":\"1\",\"roleText\":\"Administrator\",\"name\":\"System Administrator\",\"mobile\":\"9890098900\",\"picpath\":\"assets\\/icon-66.png\"}', '::1', 'Chrome 99.0.4844.74', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36', 'Windows 10', '2022-03-17 20:51:00'),
(19, 1, '{\"role\":\"1\",\"roleText\":\"Administrator\",\"name\":\"System Administrator\",\"mobile\":\"9890098900\",\"picpath\":\"assets\\/icon-66.png\"}', '::1', 'Chrome 99.0.4844.74', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36', 'Windows 10', '2022-03-18 20:43:04'),
(20, 1, '{\"role\":\"1\",\"roleText\":\"Administrator\",\"name\":\"System Administrator\",\"mobile\":\"9890098900\",\"picpath\":\"assets\\/icon-66.png\"}', '::1', 'Chrome 99.0.4844.74', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36', 'Windows 10', '2022-03-19 05:26:33'),
(21, 1, '{\"role\":\"1\",\"roleText\":\"Administrator\",\"name\":\"System Administrator\",\"mobile\":\"9890098900\",\"picpath\":\"assets\\/icon-66.png\"}', '::1', 'Chrome 100.0.4896.127', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', 'Windows 10', '2022-04-27 11:42:02'),
(22, 1, '{\"role\":\"1\",\"roleText\":\"Administrator\",\"name\":\"System Administrator\",\"mobile\":\"9890098900\",\"picpath\":\"assets\\/icon-66.png\"}', '::1', 'Chrome 101.0.4951.67', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'Windows 10', '2022-05-25 10:29:27'),
(23, 1, '{\"role\":\"1\",\"roleText\":\"Administrator\",\"name\":\"System Administrator\",\"mobile\":\"9890098900\",\"picpath\":\"assets\\/icon-66.png\"}', '::1', 'Chrome 102.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'Windows 10', '2022-06-18 18:16:56'),
(24, 1, '{\"role\":\"1\",\"roleText\":\"Administrator\",\"name\":\"System Administrator\",\"mobile\":\"9890098900\",\"picpath\":\"assets\\/icon-66.png\"}', '192.168.5.61', 'Chrome 104.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'Windows 10', '2022-08-12 19:01:39'),
(25, 1, '{\"role\":\"1\",\"roleText\":\"Administrator\",\"name\":\"System Administrator\",\"mobile\":\"9890098900\",\"picpath\":\"assets\\/icon-66.png\"}', '192.168.5.61', 'Chrome 104.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'Windows 10', '2022-08-13 01:44:01');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_offices`
--

CREATE TABLE `tbl_offices` (
  `id` bigint(255) NOT NULL,
  `buzi_id` int(255) NOT NULL,
  `phone` varchar(128) CHARACTER SET utf16 NOT NULL,
  `email` varchar(128) CHARACTER SET utf16 NOT NULL,
  `res_prof_name` varchar(128) CHARACTER SET utf16 NOT NULL,
  `res_prof_reg` varchar(128) CHARACTER SET utf16 NOT NULL,
  `created_by` varchar(128) CHARACTER SET utf16 NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `verify_by` varchar(128) CHARACTER SET utf16 DEFAULT NULL,
  `verify_at` datetime(6) DEFAULT NULL,
  `filename` varchar(128) CHARACTER SET utf16 NOT NULL,
  `status` enum('Unverified','Verified','Pending') CHARACTER SET utf8 NOT NULL DEFAULT 'Unverified',
  `is_head` enum('1','0') CHARACTER SET utf16 NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_offices`
--

INSERT INTO `tbl_offices` (`id`, `buzi_id`, `phone`, `email`, `res_prof_name`, `res_prof_reg`, `created_by`, `created_at`, `verify_by`, `verify_at`, `filename`, `status`, `is_head`) VALUES
(31, 19, '12345681353', 'dev@gmail.com', 'dev', 'dev', '38', '2022-01-13 10:52:02.000000', '', '0000-00-00 00:00:00.000000', '1642105051_VeriProf -Tonito\'s_Feedback.pdf', 'Unverified', '1'),
(32, 19, '798645138', 'dev@gmail.com', 'dev', 'dev', '38', '2022-01-13 10:52:02.000000', '', '0000-00-00 00:00:00.000000', '1642105086_VeriProf -Tonito\'s_Feedback.pdf', 'Unverified', '0');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pay`
--

CREATE TABLE `tbl_pay` (
  `id` int(8) DEFAULT NULL,
  `account` enum('General','Pro') NOT NULL,
  `amount` enum('0','89.99') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_plans`
--

CREATE TABLE `tbl_plans` (
  `id` bigint(255) NOT NULL,
  `verify_code` varchar(128) NOT NULL,
  `client_name` varchar(300) NOT NULL,
  `client_address_line_1` varchar(300) NOT NULL,
  `client_address_line_2` varchar(300) NOT NULL,
  `client_city` varchar(300) NOT NULL,
  `client_province` varchar(100) NOT NULL,
  `client_zipcode` varchar(100) NOT NULL,
  `erfno` int(100) NOT NULL,
  `hia_sensitivity` varchar(300) NOT NULL,
  `municipal` varchar(300) NOT NULL,
  `professional_name` varchar(300) NOT NULL,
  `professional_reg_number` varchar(300) NOT NULL,
  `professional` varchar(300) NOT NULL,
  `contact_email` varchar(128) NOT NULL,
  `contact_phone` varchar(128) NOT NULL,
  `contact_address_line_1` varchar(300) NOT NULL,
  `contact_address_line_2` varchar(300) NOT NULL,
  `contact_city` varchar(100) NOT NULL,
  `contact_province` varchar(100) NOT NULL,
  `contact_zipcode` varchar(100) NOT NULL,
  `project_plan_no` varchar(300) NOT NULL,
  `project_title` varchar(300) NOT NULL,
  `occupancy` varchar(300) NOT NULL,
  `project_cost` varchar(300) NOT NULL,
  `project_area` varchar(300) NOT NULL,
  `project_address_line_1` varchar(300) NOT NULL,
  `project_address_line_2` varchar(300) NOT NULL,
  `project_city` varchar(300) NOT NULL,
  `project_province` varchar(300) NOT NULL,
  `project_zipcode` varchar(300) NOT NULL,
  `responsible_qs` varchar(192) CHARACTER SET utf8 NOT NULL,
  `file` varchar(300) NOT NULL,
  `certificate` varchar(128) CHARACTER SET utf16 COLLATE utf16_german2_ci NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_plans`
--

INSERT INTO `tbl_plans` (`id`, `verify_code`, `client_name`, `client_address_line_1`, `client_address_line_2`, `client_city`, `client_province`, `client_zipcode`, `erfno`, `hia_sensitivity`, `municipal`, `professional_name`, `professional_reg_number`, `professional`, `contact_email`, `contact_phone`, `contact_address_line_1`, `contact_address_line_2`, `contact_city`, `contact_province`, `contact_zipcode`, `project_plan_no`, `project_title`, `occupancy`, `project_cost`, `project_area`, `project_address_line_1`, `project_address_line_2`, `project_city`, `project_province`, `project_zipcode`, `responsible_qs`, `file`, `certificate`, `created_by`, `created_at`) VALUES
(1, '97359', 'Sivago Architect', '58 Dover St', 'Dpuglassville ', 'Durban', 'KwaZulu-Natal', '2194', 235, '25', 'Buffalo City Metropolitan Municipality', 'Tonito Kester', 'sacp35243', 'Tonito Samuel', 'tonito@errandr.co.za', '0611978335', '271 Kent Avenue', 'Ferndale Ext 16', 'Randburg', '19450000', '2194', '713O2', 'Residential Accomodation Complex ', '736', '18000', '26000', 'Bilton Avenue Stand 235', 'Milworl', 'Jozini', 'KwaZulu-Natal', '0872', 'Tonito Samuel', '1641997354_GHJozi Mandate.pdf', '1641997359_Residential_Accomodation_Complex .pdf', '39', '2022-01-12 04:22:39'),
(2, '76902', 'Nythi', 'address1', 'address2', 'city', 'Limpopo', 'zipcode', 0, 'verprof', 'Ba-Phalaborwa Local Municipality', 'Nikolay', '123456', 'nikolay', 'test@gmail.com', '123456789', 'address1', 'address2', 'city', 'cost', 'zipcode', '9IF99', 'veriprof', 'veriprof', '3333', '100km', 'address1', 'address2', 'city', 'Limpopo', 'zipcode', '123456', '1642076900_VeriProf -Tonito\'s Feedback.pdf', '1642076902_veriprof.pdf', '38', '2022-01-13 02:28:22');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_profile`
--

CREATE TABLE `tbl_profile` (
  `id` bigint(255) NOT NULL,
  `name` varchar(128) CHARACTER SET utf16 NOT NULL,
  `surname` varchar(128) CHARACTER SET utf16 NOT NULL,
  `id_no` varchar(100) CHARACTER SET utf16 NOT NULL,
  `council` enum('SACAP','ECSA','SACQSP','SACPMP') CHARACTER SET utf16 NOT NULL DEFAULT 'SACAP',
  `reg_no` varchar(64) CHARACTER SET utf16 NOT NULL,
  `employer` varchar(64) CHARACTER SET utf16 DEFAULT NULL,
  `employer_requirPDF` varchar(64) CHARACTER SET utf8 NOT NULL,
  `exp_year` varchar(32) CHARACTER SET utf16 NOT NULL,
  `full_part` varchar(25) CHARACTER SET utf8 NOT NULL,
  `jtitle` varchar(128) NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` enum('Unverified','Verified','Pending') CHARACTER SET utf16 NOT NULL DEFAULT 'Unverified',
  `verified_by` varchar(128) CHARACTER SET utf16 DEFAULT NULL,
  `verified_at` date DEFAULT NULL,
  `user_id` varchar(128) CHARACTER SET utf16 NOT NULL,
  `is_director` enum('1','0') CHARACTER SET utf16 NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_profile`
--

INSERT INTO `tbl_profile` (`id`, `name`, `surname`, `id_no`, `council`, `reg_no`, `employer`, `employer_requirPDF`, `exp_year`, `full_part`, `jtitle`, `updated_at`, `status`, `verified_by`, `verified_at`, `user_id`, `is_director`) VALUES
(1, 'Mdingwa', 'Nyathi', '7505166165184', 'SACAP', '21118', 'Sivago', '1641933454_e.t-dc-blue-digital-quick-setup_(1).pdf', '20 year', '100', 'Principal Architect', '2022-01-12 02:59:58', 'Unverified', NULL, NULL, '41', '1'),
(2, 'Tonito', 'Samuel', 'A034526718', 'SACAP', 'scap826475', 'Varitec Engineers', '1641997633_GHJozi_Mandate.pdf', '5years', '100', 'Chief Engineer', '2022-01-12 04:28:11', 'Unverified', NULL, NULL, '39', '1'),
(3, 'Nikolay', 'dev', 'dev', 'SACAP', '111', 'Nythi', '1642076439_20211018_VeriProf_comments.pdf', '6 year', '25', 'app dev', '2022-01-13 02:20:46', 'Unverified', NULL, NULL, '38', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_projects`
--

CREATE TABLE `tbl_projects` (
  `id` bigint(255) NOT NULL,
  `title` varchar(300) NOT NULL,
  `type` varchar(100) NOT NULL,
  `prof_type` varchar(100) NOT NULL,
  `year` varchar(10) NOT NULL,
  `description` varchar(255) NOT NULL,
  `const_cost` varchar(128) NOT NULL,
  `final_cost` varchar(128) NOT NULL,
  `variable` varchar(128) NOT NULL,
  `prof_cost` varchar(255) NOT NULL,
  `client_name` varchar(100) DEFAULT NULL,
  `pl_name` varchar(128) NOT NULL,
  `pl_email` varchar(100) DEFAULT NULL,
  `pl_phone` varchar(100) DEFAULT NULL,
  `proj_street1` varchar(100) NOT NULL,
  `proj_street2` varchar(100) NOT NULL,
  `proj_street3` varchar(128) CHARACTER SET utf16 NOT NULL,
  `proj_city` varchar(100) NOT NULL,
  `proj_state` varchar(100) NOT NULL,
  `proj_zip` varchar(100) NOT NULL,
  `status` enum('Completed','Ongoing','Cancelled') NOT NULL DEFAULT 'Ongoing',
  `file` varchar(64) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `completed_at` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_projects`
--

INSERT INTO `tbl_projects` (`id`, `title`, `type`, `prof_type`, `year`, `description`, `const_cost`, `final_cost`, `variable`, `prof_cost`, `client_name`, `pl_name`, `pl_email`, `pl_phone`, `proj_street1`, `proj_street2`, `proj_street3`, `proj_city`, `proj_state`, `proj_zip`, `status`, `file`, `created_by`, `completed_at`) VALUES
(1, 'Cwaka clinic', 'Hospital', 'Architect', '2017-10-10', 'New ideal type clinic', '60000000', '0', '90.9090909090909', '6000000', 'DoH', 'Kemele Moloi', 'kemele.moli@kznworks.co.za', '2772 010 0514', '2134', 'xxxxxxxx', 'Cwaka Kzn Midlands', 'Cwaka', 'kzn', '3000', 'Ongoing', '1641927539_e.t-dc-blue-digital-quick-setup.pdf', '41', ''),
(2, 'test project', 'Residential', 'Quantity Surveyor', '2022-01-12', 'test', '1111', '0', '33.33333333333333', '2222', 'Mozare', 'Nikolay', 'test@gmail.com', '123456789', 'ert', 'gps', 'street', 'city', 'state', 'postal', 'Ongoing', '1642076767_VeriProf -Tonito\'s_Feedback.pdf', '38', ''),
(3, 'last', 'Residential', 'Quantity Surveyor', '2022-01-06', 'last', '777', '0', '50', '777', 'last', 'last', 'last@gmail.com', '123456879', 'last', 'last', 'last', 'last', 'last', 'last', 'Ongoing', '1642077656_VeriProf -Tonito\'s_Feedback.pdf', '38', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_reports`
--

CREATE TABLE `tbl_reports` (
  `id` bigint(128) NOT NULL,
  `accessor` varchar(128) DEFAULT NULL,
  `report_type` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` bigint(255) NOT NULL,
  `filename` varchar(128) DEFAULT NULL,
  `data` text NOT NULL,
  `report_content` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_reports`
--

INSERT INTO `tbl_reports` (`id`, `accessor`, `report_type`, `created_at`, `created_by`, `filename`, `data`, `report_content`) VALUES
(1, 'Mdingwa Nyathi', 'Project', '2022-01-12 03:04:40', 40, '1641992680_Project.pdf', '[{\"id\":1,\"key\":\"TITLE\",\"val\":\"Cwaka clinic\",\"status\":0},{\"id\":2,\"key\":\"TYPE\",\"val\":\"Hospital\",\"status\":1},{\"id\":3,\"key\":\"PROFESS TYPE\",\"val\":\"Architect\",\"status\":1},{\"id\":4,\"key\":\"YEAR\",\"val\":\"2017-10-10\",\"status\":1},{\"id\":5,\"key\":\"DESCRIPTION\",\"val\":\"New ideal type clinic\",\"status\":1},{\"id\":6,\"key\":\"CONST COST\",\"val\":\"60000000\",\"status\":0},{\"id\":7,\"key\":\"FINAL COST\",\"val\":\"0\",\"status\":1},{\"id\":8,\"key\":\"VARIABLE\",\"val\":\"90.9090909090909\",\"status\":0},{\"id\":9,\"key\":\"PROFESS COST\",\"val\":\"6000000\",\"status\":0},{\"id\":10,\"key\":\"CLIENT NAME\",\"val\":\"DoH\",\"status\":1},{\"id\":11,\"key\":\"PROJECT LEADER NAME\",\"val\":\"Kemele Moloi\",\"status\":1},{\"id\":12,\"key\":\"PROJECT LEADER EMAIL\",\"val\":\"kemele.moli@kznworks.co.za\",\"status\":1},{\"id\":13,\"key\":\"PROJECT LEADER PHONE\",\"val\":\"2772 010 0514\",\"status\":1},{\"id\":14,\"key\":\"PROJECT STREET1\",\"val\":\"2134\",\"status\":1},{\"id\":15,\"key\":\"PROJECT STREET2\",\"val\":\"xxxxxxxx\",\"status\":1},{\"id\":16,\"key\":\"PROJECT STREET3\",\"val\":\"Cwaka Kzn Midlands\",\"status\":1},{\"id\":17,\"key\":\"PROJECT CITY\",\"val\":\"Cwaka\",\"status\":1},{\"id\":18,\"key\":\"PROJECT STATE\",\"val\":\"kzn\",\"status\":1},{\"id\":19,\"key\":\"PROJECT ZIP\",\"val\":\"3000\",\"status\":1},{\"id\":20,\"key\":\"STATUS\",\"val\":\"Ongoing\",\"status\":1},{\"id\":21,\"key\":\"COMPLETED AT\",\"val\":\"\",\"status\":1}]', ''),
(2, 'Mdingwa Nyathi', 'Profile', '2022-01-12 03:05:49', 40, '1641992749_Profile.pdf', '[{\"id\":1,\"key\":\"NAME\",\"val\":\"Mdingwa\",\"status\":0},{\"id\":2,\"key\":\"SURNAME\",\"val\":\"Nyathi\",\"status\":1},{\"id\":3,\"key\":\"COUNCIL\",\"val\":\"SACAP\",\"status\":1},{\"id\":4,\"key\":\"REG NO\",\"val\":\"21118\",\"status\":1},{\"id\":5,\"key\":\"EMPLOYER\",\"val\":\"Sivago\",\"status\":1},{\"id\":6,\"key\":\"EMPLOYER REQUIRPDF\",\"val\":\"1641933454_e.t-dc-blue-digital-quick-setup_(1).pdf\",\"status\":1},{\"id\":7,\"key\":\"EXPERIENCE YEAR\",\"val\":\"20 year\",\"status\":1},{\"id\":8,\"key\":\"FULL PART\",\"val\":\"100\",\"status\":1},{\"id\":9,\"key\":\"JOB TITLE \",\"val\":\"Principal Architect\",\"status\":1},{\"id\":10,\"key\":\"STATUS\",\"val\":\"Unverified\",\"status\":1}]', '');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_roles`
--

CREATE TABLE `tbl_roles` (
  `roleId` tinyint(4) NOT NULL COMMENT 'role id',
  `role` varchar(50) NOT NULL COMMENT 'role text'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_roles`
--

INSERT INTO `tbl_roles` (`roleId`, `role`) VALUES
(1, 'Administrator'),
(2, 'Assessor'),
(3, 'Professional');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_schedule`
--

CREATE TABLE `tbl_schedule` (
  `id` bigint(255) NOT NULL,
  `name` varchar(128) NOT NULL,
  `verify_target` varchar(128) NOT NULL,
  `date` datetime(6) NOT NULL,
  `location` varchar(128) DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf16 NOT NULL,
  `is_done` enum('1','0') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_schedule`
--

INSERT INTO `tbl_schedule` (`id`, `name`, `verify_target`, `date`, `location`, `created_by`, `is_done`) VALUES
(1, 'Mdingwa Nyathi', 'mdingwa@sivago.co.za', '2022-01-12 15:10:27.039000', 'Durban', '40', '0'),
(2, 'Mdingwa Nyathi', 'mdingwa@sivago.co.za', '2022-01-13 20:09:48.238000', 'Durban', '40', '0');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_staffs`
--

CREATE TABLE `tbl_staffs` (
  `id` bigint(128) NOT NULL,
  `buzi_id` int(255) NOT NULL,
  `name` varchar(100) CHARACTER SET utf16 DEFAULT NULL,
  `surname` varchar(100) CHARACTER SET utf16 DEFAULT NULL,
  `jtitle` varchar(100) CHARACTER SET utf16 DEFAULT NULL,
  `exp_year` varchar(100) CHARACTER SET utf16 DEFAULT NULL,
  `prof_reg_no` varchar(100) CHARACTER SET utf16 DEFAULT NULL,
  `phone` varchar(100) CHARACTER SET utf16 DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf16 DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET utf16 DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `status` enum('Unverified','Verified','Pending') CHARACTER SET utf16 DEFAULT 'Unverified',
  `office_id` varchar(255) CHARACTER SET utf16 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_staffs`
--

INSERT INTO `tbl_staffs` (`id`, `buzi_id`, `name`, `surname`, `jtitle`, `exp_year`, `prof_reg_no`, `phone`, `email`, `created_by`, `created_at`, `status`, `office_id`) VALUES
(3, 19, 'dev', 'dev', 'dev', '3year', 'dev', '7879465132', 'dev@gmail.com', '38', '2022-01-13 10:52:02', 'Unverified', '32');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`userId`, `email`, `password`, `name`, `mobile`, `roleId`, `account_type`, `isDeleted`, `createdDtm`, `updatedDtm`, `picpath`) VALUES
(1, 'mdigwa@gmail.com', '$2y$10$2Wi1e2vdrUPEBlTHgtp38eBJFQhij48910nT5e/77vK.fPg7awQWq', 'System Administrator', '9890098900', 1, 'free', 0, '2020-08-28 18:56:49', '2020-09-24 12:58:57', 'assets/icon-66.png'),
(2, 'accessor@gmail.com', '$2y$10$ZvhX1nFKZnkDE4V4C6Djx.Ge2Dpd.rru4RdINhXYsvIPyPUbnjW8O', 'Assessors', '9890098900', 2, 'free', 0, '2020-08-28 17:49:56', '2020-09-24 13:08:17', 'assets/icon-66.png'),
(3, 'professional@gmail.com', '$2y$10$thyWmo1jHYQTbT6P.lIWk.vUmHwYwIrbPUti/7h/pBnD024N7/O5S', 'Professional', '9890098900', 3, 'free', 0, '2020-08-28 17:50:22', '2020-09-24 13:08:08', 'assets/icon-66.png'),
(37, 'pragmatismer666@gmail.com', '$2y$10$t2614wD/q2GLiNDQeyI0GeUbMmpIXtV5iIcxnhDoQeCIR6ojc1VSm', 'Nikolay', '1234567890', 2, 'free', 0, '2022-01-11 09:55:50', '2022-01-11 09:55:50', 'assets/icon-66.png'),
(38, 'pragmatismer@gmail.com', '$2y$10$WiKwwXWn.ojDC12iPzcat.W2lS6cmqVkMgHxytn4Dc.MUeDKOGT3m', 'Nikolay', '1234567890', 3, 'free', 0, '2022-01-11 10:15:39', '2022-01-11 10:15:39', 'assets/icon-66.png'),
(39, 'tonito@1voice.world', '$2y$10$yIBOYd4nZmLaEH1rsF8xRuq7oyxLJCaHFLb/JIUo2Yujj9A0rwF52', 'Tonito Kester', '0611978335', 3, 'free', 0, '2022-01-11 12:03:12', '2022-01-11 12:03:12', 'assets/icon-66.png'),
(40, 'mdigwa@gmail.com', '$2y$10$2Wi1e2vdrUPEBlTHgtp38eBJFQhij48910nT5e/77vK.fPg7awQWq', 'Mdingwa Nyathi', '0718881882', 2, 'free', 0, '2022-01-11 12:08:35', '2022-01-11 12:08:35', 'assets/icon-66.png'),
(41, 'nurvwshop@gmail.com', '$2y$10$2Wi1e2vdrUPEBlTHgtp38eBJFQhij48910nT5e/77vK.fPg7awQWq', 'Nurvwshop', '0723386835', 3, 'pro', 0, '2022-01-11 20:51:39', '2022-03-15 06:14:14', 'assets/icon-66.png');

-- --------------------------------------------------------

--
-- Table structure for table `verify_zone_tbl`
--

CREATE TABLE `verify_zone_tbl` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(128) NOT NULL,
  `SACAP_ID` varchar(128) DEFAULT NULL,
  `SA_ID` varchar(100) DEFAULT NULL,
  `passport_ID` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_business`
--
ALTER TABLE `tbl_business`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tbl_equips`
--
ALTER TABLE `tbl_equips`
  MODIFY `id` bigint(128) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_id`
--
ALTER TABLE `tbl_id`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_last_login`
--
ALTER TABLE `tbl_last_login`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `tbl_offices`
--
ALTER TABLE `tbl_offices`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `tbl_plans`
--
ALTER TABLE `tbl_plans`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_profile`
--
ALTER TABLE `tbl_profile`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_projects`
--
ALTER TABLE `tbl_projects`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_reports`
--
ALTER TABLE `tbl_reports`
  MODIFY `id` bigint(128) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_reset_password`
--
ALTER TABLE `tbl_reset_password`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_roles`
--
ALTER TABLE `tbl_roles`
  MODIFY `roleId` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT 'role id', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_schedule`
--
ALTER TABLE `tbl_schedule`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_staffs`
--
ALTER TABLE `tbl_staffs`
  MODIFY `id` bigint(128) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
