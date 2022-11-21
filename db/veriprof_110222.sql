-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 02, 2022 at 03:10 AM
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
  `session_id` varchar(64) NOT NULL DEFAULT '0',
  `ip_address` varchar(64) NOT NULL DEFAULT '0',
  `user_agent` varchar(128) NOT NULL,
  `last_activity` int(64) UNSIGNED NOT NULL DEFAULT 0,
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
  `file` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_bids`
--

INSERT INTO `tbl_bids` (`id`, `name`, `surname`, `professional_reg_no`, `email_add`, `cell`, `bidder`, `client_department`, `bid_no`, `short_description`, `created_by`, `created_at`, `file`) VALUES
(1, 'veriprof', 'dev', '123456789', 'nurvwshop@gmail.', '0723386835', 'dev', 'Nyitha', '67673', 'Hope to get job.', '41', '2022-11-01 09:00:54.000000', '1667332854_67673.pdf');

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
(1, 'Veriprof', '123456', 'dev', 'CC', 'Nikon', '123456', '15', 'Unverified', '', '0000-00-00', '41', '2022-11-01');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_equips`
--

CREATE TABLE `tbl_equips` (
  `id` bigint(128) NOT NULL,
  `buzi_id` int(255) NOT NULL,
  `name` varchar(100) CHARACTER SET utf16 DEFAULT NULL,
  `filename` varchar(255) CHARACTER SET utf16 DEFAULT NULL,
  `flag` varchar(100) CHARACTER SET utf16 DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET utf16 DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_equips`
--

INSERT INTO `tbl_equips` (`id`, `buzi_id`, `name`, `filename`, `flag`, `created_by`, `updated_at`) VALUES
(1, 1, 'env', 'office/1667318100_PDf__test.pdf', 'soft', '41', '2022-11-01 04:55:35'),
(2, 1, 'test', 'office/1667318115_PDf__test_2.pdf', 'soft', '41', '2022-11-01 04:55:35'),
(3, 1, 'pc', 'office/1667318133_PDf__test_1.pdf', 'hard', '41', '2022-11-01 04:55:35');

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
  `id` bigint(255) NOT NULL,
  `userId` bigint(255) NOT NULL,
  `sessionData` varchar(1024) NOT NULL,
  `machineIp` varchar(64) NOT NULL,
  `userAgent` varchar(255) NOT NULL,
  `agentString` varchar(1024) NOT NULL,
  `platform` varchar(64) NOT NULL,
  `createdDtm` datetime NOT NULL DEFAULT current_timestamp(),
  `token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_last_login`
--

INSERT INTO `tbl_last_login` (`id`, `userId`, `sessionData`, `machineIp`, `userAgent`, `agentString`, `platform`, `createdDtm`, `token`) VALUES
(1, 1, '{\"role\":\"1\",\"roleText\":\"Administrator\",\"name\":\"System Administrator\",\"mobile\":\"9890098900\",\"picpath\":\"assets\\/icon-66.png\"}', '::1', 'Chrome 106.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Windows 10', '2022-10-12 04:39:29', 'admin'),
(2, 1, '{\"role\":\"1\",\"roleText\":\"Administrator\",\"name\":\"System Administrator\",\"mobile\":\"9890098900\",\"picpath\":\"assets\\/icon-66.png\"}', '::1', 'Chrome 106.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Windows 10', '2022-10-12 04:39:40', 'admin'),
(3, 41, '{\"userId\":\"41\",\"role\":\"3\",\"roleText\":\"Professional\",\"name\":\"Nurvwshop\",\"mobile\":\"0723386835\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '192.168.5.61', 'Chrome 87.0.4280.141', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'Android', '2022-10-12 04:44:58', '4f3fdec74cdf2c7e39ac41cee7f6061dace88fa303dc31b36b2699a6dae7619e'),
(4, 41, '{\"userId\":\"41\",\"role\":\"3\",\"roleText\":\"Professional\",\"name\":\"Nurvwshop\",\"mobile\":\"0723386835\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '192.168.5.61', 'Chrome 87.0.4280.141', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'Android', '2022-10-12 05:17:14', '46b331049fa594466b3c264b0a62859b583bc430cf882363e68585d57ec5269a'),
(5, 41, '{\"userId\":\"41\",\"role\":\"3\",\"roleText\":\"Professional\",\"name\":\"Nurvwshop\",\"mobile\":\"0723386835\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '192.168.5.61', 'Chrome 87.0.4280.141', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'Android', '2022-10-12 05:21:21', 'd186a6c18a77f0f9cd2b1337615a1449c15e5efcf79c34c9d6b8c98a66fd5566'),
(6, 41, '{\"userId\":\"41\",\"roleNum\":\"3\",\"role\":\"Professional\",\"name\":\"Nurvwshop\",\"mobile\":\"0723386835\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '192.168.5.61', 'Chrome 87.0.4280.141', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'Android', '2022-10-12 05:43:52', '776a6ad599005240843e15abb33b6f0c906b90cef71963658a6181ee0f70f662'),
(7, 40, '{\"userId\":\"40\",\"roleNum\":\"2\",\"role\":\"Assessor\",\"name\":\"Mdingwa Nyathi\",\"mobile\":\"0718881882\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '192.168.5.61', 'Chrome 87.0.4280.141', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'Android', '2022-10-12 05:47:33', 'dd387c81388cc166fbd0684317b5728d618eddb3a7e3641d86ddfc6335489192'),
(8, 42, '{\"userId\":\"42\",\"roleNum\":\"3\",\"role\":\"Professional\",\"name\":\"Pragmatismer\",\"mobile\":\"1234567890\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '192.168.5.61', 'Chrome 87.0.4280.141', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'Android', '2022-10-12 05:54:11', '1379092ff5dcb8465510d7ed15a5bddf634cb2a01e7b43e9ce16b297208dddd0'),
(9, 1, '{\"role\":\"1\",\"roleText\":\"Administrator\",\"name\":\"System Administrator\",\"mobile\":\"9890098900\",\"picpath\":\"assets\\/icon-66.png\"}', '::1', 'Chrome 106.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Windows 10', '2022-10-12 06:00:21', 'admin'),
(10, 1, '{\"role\":\"1\",\"roleText\":\"Administrator\",\"name\":\"System Administrator\",\"mobile\":\"9890098900\",\"picpath\":\"assets\\/icon-66.png\"}', '::1', 'Chrome 106.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Windows 10', '2022-10-12 10:34:11', 'admin'),
(11, 1, '{\"role\":\"1\",\"roleText\":\"Administrator\",\"name\":\"System Administrator\",\"mobile\":\"9890098900\",\"picpath\":\"assets\\/icon-66.png\"}', '::1', 'Chrome 106.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Windows 10', '2022-10-12 10:41:14', 'admin'),
(12, 1, '{\"role\":\"1\",\"roleText\":\"Administrator\",\"name\":\"System Administrator\",\"mobile\":\"9890098900\",\"picpath\":\"assets\\/icon-66.png\"}', '::1', 'Chrome 106.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Windows 10', '2022-10-12 10:49:05', 'admin'),
(13, 41, '{\"userId\":\"41\",\"roleNum\":\"3\",\"role\":\"Professional\",\"name\":\"Nurvwshop\",\"mobile\":\"0723386835\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '192.168.5.61', 'Chrome 87.0.4280.141', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'Android', '2022-10-12 10:58:33', 'c9eb21903eb468dfe4f38dcad0982699a7853c1ac096d6bbcac2c29281b3002f'),
(14, 41, '{\"userId\":\"41\",\"roleNum\":\"3\",\"role\":\"Professional\",\"name\":\"Nurvwshop\",\"mobile\":\"0723386835\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '192.168.5.61', 'Chrome 87.0.4280.141', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'Android', '2022-10-12 11:00:27', '0753c51bbe08a277fe302a7862eb3fd1c106158a00cde24ab23419f7290c8668'),
(15, 41, '{\"userId\":\"41\",\"roleNum\":\"3\",\"role\":\"Professional\",\"name\":\"Nurvwshop\",\"mobile\":\"0723386835\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '192.168.5.61', 'Chrome 87.0.4280.141', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'Android', '2022-10-12 22:42:33', 'bf38b9f71433f2f787998a4055d44c0482dd6e6d8595f6d49c306021ed18ef11'),
(16, 41, '{\"userId\":\"41\",\"roleNum\":\"3\",\"role\":\"Professional\",\"name\":\"Nurvwshop\",\"mobile\":\"0723386835\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '192.168.5.61', 'Chrome 87.0.4280.141', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'Android', '2022-10-12 22:43:50', 'f407e48793f9ba41c8d4cc56cda39ff879ad52e0e626385036807835e969b95c'),
(17, 41, '{\"userId\":\"41\",\"roleNum\":\"3\",\"role\":\"Professional\",\"name\":\"Nurvwshop\",\"mobile\":\"0723386835\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '192.168.5.61', 'Chrome 87.0.4280.141', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'Android', '2022-10-12 22:45:08', 'b924560a10b89918c5919196ee6f28bdf480808206893c872b2d7745dd7386a3'),
(18, 41, '{\"userId\":\"41\",\"roleNum\":\"3\",\"role\":\"Professional\",\"name\":\"Nurvwshop\",\"mobile\":\"0723386835\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '192.168.5.61', 'Chrome 87.0.4280.141', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'Android', '2022-10-31 07:47:34', 'eddaad7f2b04bb44a1d516952482019b384b37375feb948535c083b861a4adc4'),
(19, 41, '{\"userId\":\"41\",\"roleNum\":\"3\",\"role\":\"Professional\",\"name\":\"Nurvwshop\",\"mobile\":\"0723386835\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '192.168.5.61', 'Chrome 87.0.4280.141', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'Android', '2022-11-01 10:55:59', '0956a55192ee2dd961a84aef8f6821118f3411c1d2e0067420b7981e484a5b29');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_offices`
--

CREATE TABLE `tbl_offices` (
  `id` bigint(255) NOT NULL,
  `buzi_id` int(255) NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 NOT NULL,
  `phone` varchar(128) CHARACTER SET utf8 NOT NULL,
  `email` varchar(128) CHARACTER SET utf8 NOT NULL,
  `res_prof_name` varchar(128) CHARACTER SET utf8 NOT NULL,
  `res_prof_reg` varchar(128) CHARACTER SET utf8 NOT NULL,
  `created_by` varchar(128) CHARACTER SET utf8 NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `verify_by` varchar(128) CHARACTER SET utf16 DEFAULT NULL,
  `verify_at` datetime(6) DEFAULT NULL,
  `file_address` varchar(255) CHARACTER SET utf8 NOT NULL,
  `file_certificate` varchar(255) CHARACTER SET utf8 NOT NULL,
  `status` enum('Unverified','Verified','Pending') CHARACTER SET utf8 NOT NULL DEFAULT 'Unverified',
  `is_head` enum('1','0') CHARACTER SET utf8 NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_offices`
--

INSERT INTO `tbl_offices` (`id`, `buzi_id`, `address`, `phone`, `email`, `res_prof_name`, `res_prof_reg`, `created_by`, `created_at`, `verify_by`, `verify_at`, `file_address`, `file_certificate`, `status`, `is_head`) VALUES
(1, 1, 'Vientiane', '1234567891', 'pragmatiser@gmail.com', 'Nikon', '12345689', '41', '2022-11-01 05:43:10.000000', '', '0000-00-00 00:00:00.000000', 'office/1667314759_PDf__test.pdf', 'office/1667314763_PDf__test_1.pdf', 'Unverified', '1'),
(2, 1, 'staff', '12345681', 'staff@gmail.com', 'staff', 'staff', '41', '2022-11-01 05:47:19.000000', '', '0000-00-00 00:00:00.000000', 'office/1667319587_PDf__test.pdf', 'office/1667319590_PDf__test_3.pdf', 'Unverified', '0');

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
  `verify_code` varchar(128) CHARACTER SET utf8 NOT NULL,
  `client_name` varchar(128) CHARACTER SET utf8 NOT NULL,
  `client_address_line_1` varchar(128) CHARACTER SET utf8 NOT NULL,
  `client_address_line_2` varchar(128) CHARACTER SET utf8 NOT NULL,
  `client_city` varchar(128) CHARACTER SET utf8 NOT NULL,
  `client_province` varchar(128) CHARACTER SET utf8 NOT NULL,
  `client_zipcode` varchar(64) CHARACTER SET utf8 NOT NULL,
  `erfno` int(64) NOT NULL,
  `hia_sensitivity` varchar(128) CHARACTER SET utf8 NOT NULL,
  `municipal` varchar(128) CHARACTER SET utf8 NOT NULL,
  `professional_reg_number` varchar(128) CHARACTER SET utf8 NOT NULL,
  `professional` varchar(128) CHARACTER SET utf8 NOT NULL,
  `contact_email` varchar(128) CHARACTER SET utf8 NOT NULL,
  `contact_phone` varchar(128) CHARACTER SET utf8 NOT NULL,
  `contact_address_line_1` varchar(128) CHARACTER SET utf8 NOT NULL,
  `contact_address_line_2` varchar(128) CHARACTER SET utf8 NOT NULL,
  `contact_city` varchar(128) CHARACTER SET utf8 NOT NULL,
  `contact_province` varchar(128) CHARACTER SET utf8 NOT NULL,
  `contact_zipcode` varchar(128) CHARACTER SET utf8 NOT NULL,
  `project_plan_no` varchar(128) CHARACTER SET utf8 NOT NULL,
  `project_title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `occupancy` varchar(255) CHARACTER SET utf8 NOT NULL,
  `project_cost` varchar(128) CHARACTER SET utf8 NOT NULL,
  `project_area` varchar(255) CHARACTER SET utf8 NOT NULL,
  `project_address_line_1` varchar(128) CHARACTER SET utf8 NOT NULL,
  `project_address_line_2` varchar(128) CHARACTER SET utf8 NOT NULL,
  `project_city` varchar(128) CHARACTER SET utf8 NOT NULL,
  `project_province` varchar(128) CHARACTER SET utf8 NOT NULL,
  `project_zipcode` varchar(64) CHARACTER SET utf8 NOT NULL,
  `responsible_qs` varchar(255) CHARACTER SET utf8 NOT NULL,
  `file` varchar(255) CHARACTER SET utf8 NOT NULL,
  `certificate` varchar(255) CHARACTER SET utf8 NOT NULL,
  `created_by` varchar(255) CHARACTER SET utf8 NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_plans`
--

INSERT INTO `tbl_plans` (`id`, `verify_code`, `client_name`, `client_address_line_1`, `client_address_line_2`, `client_city`, `client_province`, `client_zipcode`, `erfno`, `hia_sensitivity`, `municipal`, `professional_reg_number`, `professional`, `contact_email`, `contact_phone`, `contact_address_line_1`, `contact_address_line_2`, `contact_city`, `contact_province`, `contact_zipcode`, `project_plan_no`, `project_title`, `occupancy`, `project_cost`, `project_area`, `project_address_line_1`, `project_address_line_2`, `project_city`, `project_province`, `project_zipcode`, `responsible_qs`, `file`, `certificate`, `created_by`, `created_at`) VALUES
(1, '40925', 'Dev', 'test', 'test', 'test', 'KwaZulu-Natal', '00000', 123456789, 'test', 'Ba-Phalaborwa Local Municipality', '123456789', 'test', 'test@gmail.com', '1234567890', 'test', 'test', 'test', '123456789', '12300', '85XQ3', 'test', 'test', '123456789', '123456789', 'test', 'test', 'test', 'Gauteng', '11111', 'test', 'plan/1665440118_PDf__test.pdf', '1665440925_test.pdf', '41', '2022-10-11 12:28:45'),
(2, '77610', 'Dev', 'address', 'address', 'address', 'KwaZulu-Natal', '123456', 123456, 'test', 'Ba-Phalaborwa Local Municipality', '123456', 'test', 'address@gmail.com', '123456789', 'address', 'address', 'address', '123456', '123456', 'Z8Y97', 'PDF Bottom', 'test', '123456', '123546', 'address', 'address', 'address', 'Gauteng', '123456', 'test', 'plan/1667177499_PDf__test.pdf', '1667177610_PDF Bottom.pdf', '41', '2022-10-31 01:53:30');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_profile`
--

CREATE TABLE `tbl_profile` (
  `id` bigint(255) NOT NULL,
  `name` varchar(128) CHARACTER SET utf8 NOT NULL,
  `surname` varchar(128) CHARACTER SET utf8 NOT NULL,
  `id_no` varchar(128) CHARACTER SET utf8 NOT NULL,
  `council` enum('SACAP','ECSA','SACQSP','SACPMP') CHARACTER SET utf8 NOT NULL DEFAULT 'SACAP',
  `reg_no` varchar(64) CHARACTER SET utf8 NOT NULL,
  `employer` varchar(128) CHARACTER SET utf8 NOT NULL,
  `appointment` varchar(255) CHARACTER SET utf8 NOT NULL,
  `pratical_certification` varchar(255) CHARACTER SET utf8 NOT NULL,
  `cv` varchar(255) CHARACTER SET utf8 NOT NULL,
  `exp_year` varchar(32) CHARACTER SET utf8 NOT NULL,
  `full_part` varchar(32) CHARACTER SET utf8 NOT NULL,
  `jtitle` varchar(128) CHARACTER SET utf8 NOT NULL,
  `updated_at` date NOT NULL,
  `status` enum('Unverified','Verified','Pending') CHARACTER SET utf8 NOT NULL DEFAULT 'Unverified',
  `verified_by` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `verified_at` date DEFAULT NULL,
  `user_id` varchar(128) CHARACTER SET utf8 NOT NULL,
  `is_director` enum('1','0') CHARACTER SET utf8 NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_profile`
--

INSERT INTO `tbl_profile` (`id`, `name`, `surname`, `id_no`, `council`, `reg_no`, `employer`, `appointment`, `pratical_certification`, `cv`, `exp_year`, `full_part`, `jtitle`, `updated_at`, `status`, `verified_by`, `verified_at`, `user_id`, `is_director`) VALUES
(1, 'devTest', 'test', '123456789', 'SACAP', '123456789', 'Nyathi', 'profile/1665438135_PDf__test.pdf', 'profile/1665438141_PDf__test_1.pdf', 'profile/1665438144_PDf__test_3.pdf', '6 year', '25', 'Mobile Developement', '2022-11-01', 'Unverified', NULL, NULL, '41', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_projects`
--

CREATE TABLE `tbl_projects` (
  `id` bigint(255) NOT NULL,
  `title` varchar(300) CHARACTER SET utf8 NOT NULL,
  `type` varchar(64) CHARACTER SET utf8 NOT NULL,
  `prof_type` varchar(64) CHARACTER SET utf8 NOT NULL,
  `started_at` varchar(32) CHARACTER SET utf8 NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 NOT NULL,
  `const_cost` varchar(64) CHARACTER SET utf8 NOT NULL,
  `final_cost` varchar(64) CHARACTER SET utf8 NOT NULL,
  `variable` varchar(64) CHARACTER SET utf8 NOT NULL,
  `prof_cost` varchar(255) CHARACTER SET utf8 NOT NULL,
  `client_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `pl_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `pl_email` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `pl_phone` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `proj_address` varchar(255) CHARACTER SET utf8 NOT NULL,
  `proj_gps` varchar(255) CHARACTER SET utf8 NOT NULL,
  `proj_street` varchar(255) CHARACTER SET utf8 NOT NULL,
  `proj_city` varchar(255) CHARACTER SET utf8 NOT NULL,
  `proj_state` varchar(255) CHARACTER SET utf8 NOT NULL,
  `proj_zip` varchar(64) CHARACTER SET utf8 NOT NULL,
  `status` enum('Completed','Ongoing','Cancelled') CHARACTER SET utf8 NOT NULL DEFAULT 'Ongoing',
  `status_verify` enum('1','0') NOT NULL DEFAULT '0',
  `appointment` varchar(255) CHARACTER SET utf8 NOT NULL,
  `pratical_certification` varchar(255) CHARACTER SET utf8 NOT NULL,
  `final_certification` varchar(255) CHARACTER SET utf8 NOT NULL,
  `final_account` varchar(255) CHARACTER SET utf8 NOT NULL,
  `created_by` varchar(255) CHARACTER SET utf8 NOT NULL,
  `completed_at` varchar(256) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_projects`
--

INSERT INTO `tbl_projects` (`id`, `title`, `type`, `prof_type`, `started_at`, `description`, `const_cost`, `final_cost`, `variable`, `prof_cost`, `client_name`, `pl_name`, `pl_email`, `pl_phone`, `proj_address`, `proj_gps`, `proj_street`, `proj_city`, `proj_state`, `proj_zip`, `status`, `status_verify`, `appointment`, `pratical_certification`, `final_certification`, `final_account`, `created_by`, `completed_at`) VALUES
(1, 'update', 'Residential', 'Project Manager', '2022-09-01', 'test', '100000', '10000', '9999900.00', '100000', 'test', 'test', 'test@gmail.com', '1234567890', 'update', 'test', 'test', 'test', 'test', '000000', '', '1', 'project/1664859154_PDf__test.pdf', 'project/1664859162_PDf__test_1.pdf', 'project/1664859165_PDf__test_2.pdf', 'project/1664859167_PDf__test_3.pdf', '41', '');

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
  `filename` varchar(256) DEFAULT NULL,
  `data` text NOT NULL,
  `report_content` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `name` varchar(128) CHARACTER SET utf8 NOT NULL,
  `surname` varchar(128) CHARACTER SET utf8 NOT NULL,
  `jtitle` varchar(128) CHARACTER SET utf8 NOT NULL,
  `exp_year` varchar(128) CHARACTER SET utf8 NOT NULL,
  `prof_reg_no` varchar(128) CHARACTER SET utf8 NOT NULL,
  `phone` varchar(128) CHARACTER SET utf8 NOT NULL,
  `email` varchar(128) CHARACTER SET utf8 NOT NULL,
  `file_appointment` varchar(255) CHARACTER SET utf8 NOT NULL,
  `file_cv` varchar(255) CHARACTER SET utf8 NOT NULL,
  `created_by` varchar(128) CHARACTER SET utf8 NOT NULL,
  `created_at` datetime NOT NULL,
  `status` enum('Unverified','Verified','Pending') CHARACTER SET utf8 NOT NULL DEFAULT 'Unverified',
  `office_id` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_staffs`
--

INSERT INTO `tbl_staffs` (`id`, `buzi_id`, `name`, `surname`, `jtitle`, `exp_year`, `prof_reg_no`, `phone`, `email`, `file_appointment`, `file_cv`, `created_by`, `created_at`, `status`, `office_id`) VALUES
(1, 1, 'staff', 'staff', 'staff', '6year', 'staff', '123458', 'staff@gmail.com', 'office/1667319569_PDf__test.pdf', 'office/1667319572_PDf__test_2.pdf', '41', '2022-11-01 05:20:01', 'Unverified', '1'),
(3, 1, 'dev', 'dev', 'dev', '5year', '12345689521', '123456852', 'dev@gmail.com', 'office/1667331326_PDf__test_3.pdf', '', '41', '2022-11-01 08:50:58', 'Unverified', '2');

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
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_business`
--
ALTER TABLE `tbl_business`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_equips`
--
ALTER TABLE `tbl_equips`
  MODIFY `id` bigint(128) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_id`
--
ALTER TABLE `tbl_id`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_last_login`
--
ALTER TABLE `tbl_last_login`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tbl_offices`
--
ALTER TABLE `tbl_offices`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_plans`
--
ALTER TABLE `tbl_plans`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_profile`
--
ALTER TABLE `tbl_profile`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_projects`
--
ALTER TABLE `tbl_projects`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
