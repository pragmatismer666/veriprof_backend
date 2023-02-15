-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 15, 2023 at 06:52 AM
-- Server version: 10.3.37-MariaDB-cll-lve
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `veriprof_back`
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

--
-- Dumping data for table `tbl_bids`
--

INSERT INTO `tbl_bids` (`id`, `name`, `surname`, `professional_reg_no`, `email_add`, `cell`, `bidder`, `client_department`, `bid_no`, `short_description`, `created_by`, `created_at`, `file`) VALUES
(1, 'Test Bid', 'Test Bid', '123456789', 'nurvwshop@gmail.', '0723386835', 'Toni', 'Nyathi', '20507', 'Mobile project', '41', '2022-12-08 04:52:02.000000', '1670514722_20507.pdf'),
(2, 'Mdingwa', 'Nyathi', 'PrArch 21118', 'mdingwa@sivago.c', '0723386835', 'Sivago Architect', 'DPW', '14899', 'New university campus', '41', '2023-01-21 12:38:52.000000', '1674297532_14899.pdf');

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

--
-- Dumping data for table `tbl_business`
--

INSERT INTO `tbl_business` (`id`, `pname`, `pcouncil`, `pcipc_reg_no`, `ptype`, `status`, `verified_by`, `verified_at`, `created_by`, `updated_at`) VALUES
(1, 'Sivago Architects CC', '40002', '2011/068953/23', 'CC', 'Verified', '', '0000-00-00', '41', '2023-02-08');

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

--
-- Dumping data for table `tbl_directors`
--

INSERT INTO `tbl_directors` (`id`, `buzi_id`, `name`, `prof_reg_no`, `owned`, `created_by`, `created_at`, `status`) VALUES
(1, 1, 'Tomi', '456789', '15', 41, '2022-12-08 09:07:17', 'Pending'),
(2, 1, 'Nikon', '456', '10', 41, '2022-12-08 09:07:17', 'Pending');

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

--
-- Dumping data for table `tbl_equips`
--

INSERT INTO `tbl_equips` (`id`, `buzi_id`, `name`, `filename`, `flag`, `created_by`, `updated_at`) VALUES
(1, 1, 'php', 'office/1670530018_PDf__test.pdf', 'soft', '41', '2022-12-08 09:07:17'),
(2, 1, 'pc', 'office/1670530033_PDf__test.pdf', 'hard', '41', '2022-12-08 09:07:17'),
(3, 1, 'microsoft office', 'office/1674219175_RFQ001586_-_APPOINTMENT_OF_A_PROFESSIONAL_SERVICE_PROVIDER_TO_UNDERTAKE_CONDITIONAL_ASSESSMENT_OF_THE_EXISITNG_RAMPARTS_BUILDINGS_AND_SURROUNDING_WALLS_AT_THE_CONSTITUTION_HILL_PRECINCT.pdf', 'soft', '41', '2023-01-20 02:53:21'),
(4, 1, 'desktop computer', 'office/1674219197_H22-017AI.pdf', 'hard', '41', '2023-01-20 02:53:21');

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
(19, 41, '{\"userId\":\"41\",\"roleNum\":\"3\",\"role\":\"Professional\",\"name\":\"Nurvwshop\",\"mobile\":\"0723386835\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '192.168.5.61', 'Chrome 87.0.4280.141', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'Android', '2022-11-01 10:55:59', '0956a55192ee2dd961a84aef8f6821118f3411c1d2e0067420b7981e484a5b29'),
(20, 1, '{\"role\":\"1\",\"roleText\":\"Administrator\",\"name\":\"System Administrator\",\"mobile\":\"9890098900\",\"picpath\":\"assets\\/icon-66.png\"}', '::1', 'Chrome 106.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Windows 10', '2022-11-02 09:24:06', 'admin'),
(21, 41, '{\"userId\":\"41\",\"roleNum\":\"3\",\"role\":\"Professional\",\"name\":\"Nurvwshop\",\"mobile\":\"0723386835\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '192.168.5.61', 'Chrome 87.0.4280.141', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'Android', '2022-11-17 16:23:05', '9b3a029bf15f174df6107e61ab73128c202a864138e7144fbf31e00d43447111'),
(22, 41, '{\"userId\":\"41\",\"roleNum\":\"3\",\"role\":\"Professional\",\"name\":\"Nurvwshop\",\"mobile\":\"0723386835\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '192.168.5.61', 'Chrome 87.0.4280.141', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'Android', '2022-11-17 21:27:19', '34fb308d4416b0d6cfc363892eca1aa828a752e1301d3de935dd6f4ca35c2494'),
(23, 41, '{\"userId\":\"41\",\"roleNum\":\"3\",\"role\":\"Professional\",\"name\":\"Nurvwshop\",\"mobile\":\"0723386835\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '192.168.5.61', 'Chrome 87.0.4280.141', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'Android', '2022-12-05 16:50:34', 'd4dc2f9763c005cba330c64aa4a5d0d6fe3ef7e6d4741f40b5530910638c9014'),
(24, 40, '{\"userId\":\"40\",\"roleNum\":\"2\",\"role\":\"Assessor\",\"name\":\"Mdingwa Nyathi\",\"mobile\":\"0718881882\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '192.168.5.61', 'Chrome 87.0.4280.141', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'Android', '2022-12-05 22:11:20', '7d1238bcabf75a4d1f9c2b136634143c028aa3c8d040b2468960adbc945d53ec'),
(25, 41, '{\"userId\":\"41\",\"roleNum\":\"3\",\"role\":\"Professional\",\"name\":\"Nurvwshop\",\"mobile\":\"0723386835\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '192.168.5.61', 'Safari 604.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'iOS', '2022-12-06 04:10:43', 'cda7a5d50c1ad13ca6954ec7ce3a44e2f612487dca34d5181e88570cc4335544'),
(26, 41, '{\"userId\":\"41\",\"roleNum\":\"3\",\"role\":\"Professional\",\"name\":\"Nurvwshop\",\"mobile\":\"0723386835\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '192.168.5.61', 'Safari 604.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'iOS', '2022-12-08 20:52:45', 'c14f77f7189534d69f9aa8349a8100d33d95bae1a8fc7848c8186d8e947c8fc0'),
(27, 40, '{\"userId\":\"40\",\"roleNum\":\"2\",\"role\":\"Assessor\",\"name\":\"Mdingwa Nyathi\",\"mobile\":\"0718881882\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '192.168.5.61', 'Safari 604.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'iOS', '2022-12-08 22:57:18', 'ddfbf880becbabf480999140573acdd39d1854991862eaf4b1abb049aefd411d'),
(28, 41, '{\"userId\":\"41\",\"roleNum\":\"3\",\"role\":\"Professional\",\"name\":\"Nurvwshop\",\"mobile\":\"0723386835\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '192.168.5.61', 'Safari 604.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'iOS', '2022-12-09 02:30:07', 'fa9af80ba70b346fceab1a0daa5161cbc6863f88601aeb40280fab4f049cad65'),
(29, 40, '{\"userId\":\"40\",\"roleNum\":\"2\",\"role\":\"Assessor\",\"name\":\"Mdingwa Nyathi\",\"mobile\":\"0718881882\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '192.168.5.61', 'Safari 604.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'iOS', '2022-12-09 03:37:20', 'ee4da2488093de05151a69978a80ebf999baeacd56df596c46f197af4808d6ec'),
(30, 40, '{\"userId\":\"40\",\"roleNum\":\"2\",\"role\":\"Assessor\",\"name\":\"Mdingwa Nyathi\",\"mobile\":\"0718881882\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '192.168.5.61', 'Chrome 87.0.4280.141', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'Android', '2022-12-09 20:46:00', 'ebf5ebf41f8531c9846b2828531faa006794e1f0c4b05eaf05e5dc3346fe3cc5'),
(31, 40, '{\"userId\":\"40\",\"roleNum\":\"2\",\"role\":\"Assessor\",\"name\":\"Mdingwa Nyathi\",\"mobile\":\"0718881882\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '192.168.5.61', 'Chrome 87.0.4280.141', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'Android', '2022-12-11 19:09:24', '10fb1ec587f90f5554e1626e20af264408115782ea2d5b9de005d0409e4fbb63'),
(32, 40, '{\"userId\":\"40\",\"roleNum\":\"2\",\"role\":\"Assessor\",\"name\":\"Mdingwa Nyathi\",\"mobile\":\"0718881882\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '192.168.5.61', 'Chrome 87.0.4280.141', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'Android', '2022-12-14 01:09:11', '0d993f55a431c4de74de4c46f0c9afe002fec3417b813ac7c1f5dda88d5626be'),
(33, 40, '{\"userId\":\"40\",\"roleNum\":\"2\",\"role\":\"Assessor\",\"name\":\"Mdingwa Nyathi\",\"mobile\":\"0718881882\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '192.168.5.61', 'Chrome 87.0.4280.141', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'Android', '2022-12-14 19:12:59', '97e112abb079ac09b3f4296383212abb81915c83efa1529db812fa43a2394fd8'),
(34, 40, '{\"userId\":\"40\",\"roleNum\":\"2\",\"role\":\"Assessor\",\"name\":\"Mdingwa Nyathi\",\"mobile\":\"0718881882\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '192.168.5.61', 'Chrome 87.0.4280.141', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'Android', '2022-12-17 12:06:28', '92c453295c3c3b672fd7ed4ca2742b90b74d3445356bc0a66d617fb8b433f5a7'),
(35, 41, '{\"userId\":\"41\",\"roleNum\":\"3\",\"role\":\"Professional\",\"name\":\"Nurvwshop\",\"mobile\":\"0723386835\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '192.168.5.61', 'Chrome 87.0.4280.141', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'Android', '2022-12-19 11:05:35', 'd3b11e9ae7c8fd60c26b02fce4fdd23ef749cc383e7cfa2a597f65164c06de5a'),
(36, 40, '{\"userId\":\"40\",\"roleNum\":\"2\",\"role\":\"Assessor\",\"name\":\"Mdingwa Nyathi\",\"mobile\":\"0718881882\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '192.168.5.61', 'Chrome 87.0.4280.141', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'Android', '2022-12-19 11:39:55', '955fa5f1f70caf66e328927801061db64ea1b1dc7af8e45d52043c679610b854'),
(37, 40, '{\"userId\":\"40\",\"roleNum\":\"2\",\"role\":\"Assessor\",\"name\":\"Mdingwa Nyathi\",\"mobile\":\"0718881882\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '192.168.5.61', 'Chrome 87.0.4280.141', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'Android', '2022-12-21 19:18:39', '464706429ab82cf9aea9ed518ab56280d0133fd441ded09f072ec9378ad624bd'),
(38, 41, '{\"userId\":\"41\",\"roleNum\":\"3\",\"role\":\"Professional\",\"name\":\"Nurvwshop\",\"mobile\":\"0723386835\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '192.168.5.61', 'Chrome 87.0.4280.141', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'Android', '2023-01-06 10:58:10', '603a6cf23d4ba17a882e363d05617610c8396b97fbfe23be6ac74f6db12aa43f'),
(39, 41, '{\"userId\":\"41\",\"roleNum\":\"3\",\"role\":\"Professional\",\"name\":\"Nurvwshop\",\"mobile\":\"0723386835\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '192.168.5.61', 'Chrome 87.0.4280.141', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'Android', '2023-01-06 22:20:02', '9f697cadb9d09bbd6b6cd51ac6815481e0c9c81e1440f183bf4c676ac6513b17'),
(40, 41, '{\"userId\":\"41\",\"roleNum\":\"3\",\"role\":\"Professional\",\"name\":\"Nurvwshop\",\"mobile\":\"0723386835\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '192.168.5.61', 'Chrome 87.0.4280.141', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'Android', '2023-01-09 22:47:19', 'efe8e0e9f5af687fe87cd854e73a451f792e85cf4590f875297f07be8d1f73c2'),
(41, 40, '{\"userId\":\"40\",\"roleNum\":\"2\",\"role\":\"Assessor\",\"name\":\"Mdingwa Nyathi\",\"mobile\":\"0718881882\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '192.168.5.61', 'Chrome 87.0.4280.141', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'Android', '2023-01-10 03:29:04', '7be654b252313b724b23eb5e4e65cf24ce08c235b29af8424843ccecb79dcc07'),
(42, 40, '{\"userId\":\"40\",\"roleNum\":\"2\",\"role\":\"Assessor\",\"name\":\"Mdingwa Nyathi\",\"mobile\":\"0718881882\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '183.182.105.91', 'Chrome 83.0.4103.106', 'Mozilla/5.0 (Linux; Android 11; Android SDK built for x86 Build/RSR1.210210.001.A1; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/83.0.4103.106 Mobile Safari/537.36', 'Android', '2023-01-09 22:58:14', '56f96c0bed08ddc389c295958c50f2903d2a61d8693a9506278f0245e87e6311'),
(43, 1, '{\"role\":\"1\",\"roleText\":\"Administrator\",\"name\":\"System Administrator\",\"mobile\":\"9890098900\",\"picpath\":\"assets\\/icon-66.png\"}', '183.182.105.91', 'Chrome 108.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'Windows 10', '2023-01-09 23:25:20', 'admin'),
(44, 41, '{\"userId\":\"41\",\"roleNum\":\"3\",\"role\":\"Professional\",\"name\":\"Nurvwshop\",\"mobile\":\"0723386835\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '183.182.105.91', 'Chrome 83.0.4103.106', 'Mozilla/5.0 (Linux; Android 11; Android SDK built for x86 Build/RSR1.210210.001.A1; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/83.0.4103.106 Mobile Safari/537.36', 'Android', '2023-01-10 06:17:59', '63cfe43809c29062b38812f53e8a1871913545566369852f5260526aebd2208f'),
(45, 40, '{\"userId\":\"40\",\"roleNum\":\"2\",\"role\":\"Assessor\",\"name\":\"Mdingwa Nyathi\",\"mobile\":\"0718881882\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '183.182.105.91', 'Chrome 83.0.4103.106', 'Mozilla/5.0 (Linux; Android 11; Android SDK built for x86 Build/RSR1.210210.001.A1; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/83.0.4103.106 Mobile Safari/537.36', 'Android', '2023-01-10 06:20:53', '0b9ff3bfc71f1c1004a955c456768b4bb77245f2f79886469e43406317f3b8c5'),
(46, 41, '{\"userId\":\"41\",\"roleNum\":\"3\",\"role\":\"Professional\",\"name\":\"Nurvwshop\",\"mobile\":\"0723386835\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '183.182.105.91', 'Chrome 83.0.4103.106', 'Mozilla/5.0 (Linux; Android 11; Android SDK built for x86 Build/RSR1.210210.001.A1; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/83.0.4103.106 Mobile Safari/537.36', 'Android', '2023-01-10 06:23:14', '4e8282ae22365a8f65e0fa583cefd01fe0aed8f592eeb352a80db2d16b07d366'),
(47, 40, '{\"userId\":\"40\",\"roleNum\":\"2\",\"role\":\"Assessor\",\"name\":\"Mdingwa Nyathi\",\"mobile\":\"0718881882\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '183.182.105.91', 'Chrome 83.0.4103.106', 'Mozilla/5.0 (Linux; Android 11; Android SDK built for x86 Build/RSR1.210210.001.A1; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/83.0.4103.106 Mobile Safari/537.36', 'Android', '2023-01-10 07:19:30', '155215461df498b5a3aa4eabf89b87caf9e8c886ee9539cc3801a406178da557'),
(48, 40, '{\"userId\":\"40\",\"roleNum\":\"2\",\"role\":\"Assessor\",\"name\":\"Mdingwa Nyathi\",\"mobile\":\"0718881882\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '105.224.106.137', 'Chrome 108.0.5359.128', 'Mozilla/5.0 (Linux; Android 9; SM-N950F Build/PPR1.180610.011; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/108.0.5359.128 Mobile Safari/537.36', 'Android', '2023-01-10 19:19:48', 'fd5088135a2e269c6b4a6ada45e2bd9e78fddf54838f1e22d43dff8b3496ad6d'),
(49, 41, '{\"userId\":\"41\",\"roleNum\":\"3\",\"role\":\"Professional\",\"name\":\"Nurvwshop\",\"mobile\":\"0723386835\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '105.224.106.137', 'Chrome 108.0.5359.128', 'Mozilla/5.0 (Linux; Android 9; SM-N950F Build/PPR1.180610.011; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/108.0.5359.128 Mobile Safari/537.36', 'Android', '2023-01-10 19:28:48', '17acec0dea24372c492a460b6dc17daacf24f0c1e00a37abc68cc4ec9fec5a6e'),
(50, 41, '{\"userId\":\"41\",\"roleNum\":\"3\",\"role\":\"Professional\",\"name\":\"Nurvwshop\",\"mobile\":\"0723386835\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '105.224.106.137', 'Chrome 108.0.5359.128', 'Mozilla/5.0 (Linux; Android 9; SM-N950F Build/PPR1.180610.011; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/108.0.5359.128 Mobile Safari/537.36', 'Android', '2023-01-10 19:40:11', 'ee10ef3eab331851dd3da8c4c801e4b4283d66a726d22d0d19c485796a4a15cd'),
(51, 41, '{\"userId\":\"41\",\"roleNum\":\"3\",\"role\":\"Professional\",\"name\":\"Nurvwshop\",\"mobile\":\"0723386835\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '105.224.106.137', 'Chrome 108.0.5359.128', 'Mozilla/5.0 (Linux; Android 9; SM-N950F Build/PPR1.180610.011; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/108.0.5359.128 Mobile Safari/537.36', 'Android', '2023-01-10 19:40:31', 'b43fd25e6e6270b991bccb0c4f1403f3a2bc21d722b808ab2add09ba96c30def'),
(52, 41, '{\"userId\":\"41\",\"roleNum\":\"3\",\"role\":\"Professional\",\"name\":\"Nurvwshop\",\"mobile\":\"0723386835\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '105.224.106.137', 'Chrome 108.0.5359.128', 'Mozilla/5.0 (Linux; Android 9; SM-N950F Build/PPR1.180610.011; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/108.0.5359.128 Mobile Safari/537.36', 'Android', '2023-01-10 19:40:31', 'a84edd5080340eb03552ece9305cae4c4471a675ea4866d360e6a8e6615c51f6'),
(53, 41, '{\"userId\":\"41\",\"roleNum\":\"3\",\"role\":\"Professional\",\"name\":\"Nurvwshop\",\"mobile\":\"0723386835\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '105.224.106.137', 'Chrome 108.0.5359.128', 'Mozilla/5.0 (Linux; Android 9; SM-N950F Build/PPR1.180610.011; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/108.0.5359.128 Mobile Safari/537.36', 'Android', '2023-01-10 19:40:42', 'cdd63304d89b1a9ed97abee5ff563c9508c3eac99f0c88d7a17dc6df57313d85'),
(54, 41, '{\"userId\":\"41\",\"roleNum\":\"3\",\"role\":\"Professional\",\"name\":\"Nurvwshop\",\"mobile\":\"0723386835\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '105.224.106.137', 'Chrome 108.0.5359.128', 'Mozilla/5.0 (Linux; Android 9; SM-N950F Build/PPR1.180610.011; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/108.0.5359.128 Mobile Safari/537.36', 'Android', '2023-01-10 19:40:42', '05132763291a72df4bb5c111a9a55f86a5d08d60e6a5548cc697b05f37d4e6f6'),
(55, 40, '{\"userId\":\"40\",\"roleNum\":\"2\",\"role\":\"Assessor\",\"name\":\"Mdingwa Nyathi\",\"mobile\":\"0718881882\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '105.186.243.13', 'Chrome 108.0.5359.128', 'Mozilla/5.0 (Linux; Android 9; SM-N950F Build/PPR1.180610.011; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/108.0.5359.128 Mobile Safari/537.36', 'Android', '2023-01-12 08:09:45', '0d3df01d940f1958145919b9cae4db81651e9c24f0abb8f074cce4febb6f125d'),
(56, 40, '{\"userId\":\"40\",\"roleNum\":\"2\",\"role\":\"Assessor\",\"name\":\"Mdingwa Nyathi\",\"mobile\":\"0718881882\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '105.186.243.13', 'Chrome 108.0.5359.128', 'Mozilla/5.0 (Linux; Android 9; SM-N950F Build/PPR1.180610.011; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/108.0.5359.128 Mobile Safari/537.36', 'Android', '2023-01-12 08:17:42', 'f5c9845e82a6f56769322b7b2721133ecbbd526c25e4b74582f20301df1b6981'),
(57, 40, '{\"userId\":\"40\",\"roleNum\":\"2\",\"role\":\"Assessor\",\"name\":\"Mdingwa Nyathi\",\"mobile\":\"0718881882\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '183.182.104.121', 'Chrome 94.0.4606.85', 'Mozilla/5.0 (Linux; Android 11; SM-A035F Build/RP1A.200720.012; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/94.0.4606.85 Mobile Safari/537.36', 'Android', '2023-01-12 08:17:50', '1b85fb00d55a56b99f84ad7e2e74e02ca4b727dc7070f7d2db5c66ade4d74175'),
(58, 41, '{\"userId\":\"41\",\"roleNum\":\"3\",\"role\":\"Professional\",\"name\":\"Nurvwshop\",\"mobile\":\"0723386835\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '183.182.104.121', 'Chrome 94.0.4606.85', 'Mozilla/5.0 (Linux; Android 11; SM-A035F Build/RP1A.200720.012; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/94.0.4606.85 Mobile Safari/537.36', 'Android', '2023-01-12 11:53:50', '102e37b6d5a696eb249bd56bf7089ca6aeea3c67f70e972bdef18bb2b14a3f08'),
(59, 40, '{\"userId\":\"40\",\"roleNum\":\"2\",\"role\":\"Assessor\",\"name\":\"Mdingwa Nyathi\",\"mobile\":\"0718881882\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '183.182.104.121', 'Chrome 94.0.4606.85', 'Mozilla/5.0 (Linux; Android 11; SM-A035F Build/RP1A.200720.012; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/94.0.4606.85 Mobile Safari/537.36', 'Android', '2023-01-12 12:00:34', '135437947fa0bb2610563c4acde3824bbd20af5d4ff113984f24194d6445ddb1'),
(60, 41, '{\"userId\":\"41\",\"roleNum\":\"3\",\"role\":\"Professional\",\"name\":\"Nurvwshop\",\"mobile\":\"0723386835\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '183.182.104.121', 'Chrome 108.0.5359.128', 'Mozilla/5.0 (Linux; Android 12; SM-A035F Build/SP1A.210812.016; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/108.0.5359.128 Mobile Safari/537.36', 'Android', '2023-01-12 16:11:46', '6ae9deb84fd5f10ae7a5e99b5307886291e34c56d45d08fd9132d2c910e95e31'),
(61, 40, '{\"userId\":\"40\",\"roleNum\":\"2\",\"role\":\"Assessor\",\"name\":\"Mdingwa Nyathi\",\"mobile\":\"0718881882\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '183.182.104.121', 'Chrome 108.0.5359.128', 'Mozilla/5.0 (Linux; Android 12; SM-A035F Build/SP1A.210812.016; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/108.0.5359.128 Mobile Safari/537.36', 'Android', '2023-01-12 20:06:14', 'dcb37a0589b5cbb90b8d7844fa8358d7a6978743ab7e1869bf83785d29cf2da8'),
(62, 41, '{\"userId\":\"41\",\"roleNum\":\"3\",\"role\":\"Professional\",\"name\":\"Nurvwshop\",\"mobile\":\"0723386835\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '105.224.53.28', 'Chrome 108.0.5359.128', 'Mozilla/5.0 (Linux; Android 9; SM-N950F Build/PPR1.180610.011; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/108.0.5359.128 Mobile Safari/537.36', 'Android', '2023-01-17 09:25:50', '907830519f88f549575e588b41c18424cca21cf7f344f143d36cc502375dce3c'),
(63, 41, '{\"userId\":\"41\",\"roleNum\":\"3\",\"role\":\"Professional\",\"name\":\"Nurvwshop\",\"mobile\":\"0723386835\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '183.182.105.91', 'Chrome 87.0.4280.141', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Mobile Safari/537.36', 'Android', '2023-01-17 11:20:51', 'eae1ad1caea5419224a2e5786e16c2e51f6eb521b51dea31503cfdde2e98e962'),
(64, 41, '{\"userId\":\"41\",\"roleNum\":\"3\",\"role\":\"Professional\",\"name\":\"Nurvwshop\",\"mobile\":\"0723386835\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '105.224.53.28', 'Chrome 108.0.5359.128', 'Mozilla/5.0 (Linux; Android 13; SM-S908E Build/TP1A.220624.014; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/108.0.5359.128 Mobile Safari/537.36', 'Android', '2023-01-17 21:25:30', '5cce622715947d471a50cb970255ba670b74646b878bc92e5e810bbfe53e2dda'),
(65, 41, '{\"userId\":\"41\",\"roleNum\":\"3\",\"role\":\"Professional\",\"name\":\"Nurvwshop\",\"mobile\":\"0723386835\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '105.224.53.28', 'Chrome 108.0.5359.128', 'Mozilla/5.0 (Linux; Android 13; SM-S908E Build/TP1A.220624.014; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/108.0.5359.128 Mobile Safari/537.36', 'Android', '2023-01-17 21:31:58', '101d7b1b7a8e7007558c717af17364f6102790e9c1c60fe363686255ff52a579'),
(66, 41, '{\"userId\":\"41\",\"roleNum\":\"3\",\"role\":\"Professional\",\"name\":\"Nurvwshop\",\"mobile\":\"0723386835\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '41.115.52.125', 'Chrome 108.0.5359.128', 'Mozilla/5.0 (Linux; Android 13; SM-S908E Build/TP1A.220624.014; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/108.0.5359.128 Mobile Safari/537.36', 'Android', '2023-01-19 17:20:33', 'd8ce9a1f66dbdcf388346f16471c2c4e07970fca85383e5a0b741a41ff77dc90'),
(67, 41, '{\"userId\":\"41\",\"roleNum\":\"3\",\"role\":\"Professional\",\"name\":\"Nurvwshop\",\"mobile\":\"0723386835\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '105.224.14.203', 'Chrome 108.0.5359.128', 'Mozilla/5.0 (Linux; Android 13; SM-S908E Build/TP1A.220624.014; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/108.0.5359.128 Mobile Safari/537.36', 'Android', '2023-01-21 10:49:45', 'c8a2beb1854fd2142fd2da79359cadbc314e3d39afe9011e238ae9bf24e64f03'),
(68, 41, '{\"userId\":\"41\",\"roleNum\":\"3\",\"role\":\"Professional\",\"name\":\"Nurvwshop\",\"mobile\":\"0723386835\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '105.224.14.203', 'Chrome 108.0.5359.128', 'Mozilla/5.0 (Linux; Android 13; SM-S908E Build/TP1A.220624.014; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/108.0.5359.128 Mobile Safari/537.36', 'Android', '2023-01-21 10:49:45', '63214353b4efeb64bf97d9e5da2832e94ea783a2f833e7ee3641176905e1eea0'),
(69, 40, '{\"userId\":\"40\",\"roleNum\":\"2\",\"role\":\"Assessor\",\"name\":\"Mdingwa Nyathi\",\"mobile\":\"0718881882\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '105.224.14.203', 'Chrome 108.0.5359.128', 'Mozilla/5.0 (Linux; Android 13; SM-S908E Build/TP1A.220624.014; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/108.0.5359.128 Mobile Safari/537.36', 'Android', '2023-01-21 12:54:28', '0072f8359b0ef7a621282208259ba296b3decde90831bebcdd4faf40da8c3313'),
(70, 40, '{\"userId\":\"40\",\"roleNum\":\"2\",\"role\":\"Assessor\",\"name\":\"Mdingwa Nyathi\",\"mobile\":\"0718881882\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '105.224.14.203', 'Chrome 108.0.5359.128', 'Mozilla/5.0 (Linux; Android 13; SM-S908E Build/TP1A.220624.014; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/108.0.5359.128 Mobile Safari/537.36', 'Android', '2023-01-21 12:54:28', '5402e1dd4acc55b07257faa64f9e3ba6f0ee22edc9b2a2df43131d4f469ba609'),
(71, 40, '{\"userId\":\"40\",\"roleNum\":\"2\",\"role\":\"Assessor\",\"name\":\"Mdingwa Nyathi\",\"mobile\":\"0718881882\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '105.224.14.203', 'Chrome 108.0.5359.128', 'Mozilla/5.0 (Linux; Android 13; SM-S908E Build/TP1A.220624.014; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/108.0.5359.128 Mobile Safari/537.36', 'Android', '2023-01-21 12:54:28', '86fb1ab21c556f7490981ad91ea336680639839e578ecb28889fb5753ca6e8f5'),
(72, 40, '{\"userId\":\"40\",\"roleNum\":\"2\",\"role\":\"Assessor\",\"name\":\"Mdingwa Nyathi\",\"mobile\":\"0718881882\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '105.224.14.203', 'Chrome 108.0.5359.128', 'Mozilla/5.0 (Linux; Android 13; SM-S908E Build/TP1A.220624.014; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/108.0.5359.128 Mobile Safari/537.36', 'Android', '2023-01-21 12:54:29', 'ec4e4fe5cc809a53a160152d0b76add44e72c1bcad9cdd8030300b3382869bfa'),
(73, 40, '{\"userId\":\"40\",\"roleNum\":\"2\",\"role\":\"Assessor\",\"name\":\"Mdingwa Nyathi\",\"mobile\":\"0718881882\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '105.224.14.203', 'Chrome 108.0.5359.128', 'Mozilla/5.0 (Linux; Android 13; SM-S908E Build/TP1A.220624.014; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/108.0.5359.128 Mobile Safari/537.36', 'Android', '2023-01-21 12:54:29', '2849ef65c97cae6a2871ab76280fc68acab5b691fb4e6b33f5ef2aa53e45793a'),
(74, 40, '{\"userId\":\"40\",\"roleNum\":\"2\",\"role\":\"Assessor\",\"name\":\"Mdingwa Nyathi\",\"mobile\":\"0718881882\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '105.224.14.203', 'Chrome 108.0.5359.128', 'Mozilla/5.0 (Linux; Android 13; SM-S908E Build/TP1A.220624.014; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/108.0.5359.128 Mobile Safari/537.36', 'Android', '2023-01-21 12:54:29', 'b9a12c657d7483c2d98ef1a8378b7efa32a9918f135e62381f60535077fde226'),
(75, 41, '{\"userId\":\"41\",\"roleNum\":\"3\",\"role\":\"Professional\",\"name\":\"Nurvwshop\",\"mobile\":\"0723386835\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '41.115.120.39', 'Chrome 108.0.5359.128', 'Mozilla/5.0 (Linux; Android 13; SM-S908E Build/TP1A.220624.014; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/108.0.5359.128 Mobile Safari/537.36', 'Android', '2023-01-21 17:56:02', '90ffa4c3b58443a03764bea3551d5b45aee84f95c17a9e360bdec6634929cd15'),
(76, 40, '{\"userId\":\"40\",\"roleNum\":\"2\",\"role\":\"Assessor\",\"name\":\"Mdingwa Nyathi\",\"mobile\":\"0718881882\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '105.224.117.103', 'Chrome 108.0.5359.128', 'Mozilla/5.0 (Linux; Android 13; SM-S908E Build/TP1A.220624.014; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/108.0.5359.128 Mobile Safari/537.36', 'Android', '2023-01-22 07:16:32', '618c586b2c1d4b47a1441ed8bc8d5ddac41b36c5012f32382e5d46ce1bd5f5db'),
(77, 40, '{\"userId\":\"40\",\"roleNum\":\"2\",\"role\":\"Assessor\",\"name\":\"Mdingwa Nyathi\",\"mobile\":\"0718881882\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '183.182.104.121', 'Chrome 109.0.5414.85', 'Mozilla/5.0 (Linux; Android 12; SM-A035F Build/SP1A.210812.016; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/109.0.5414.85 Mobile Safari/537.36', 'Android', '2023-01-22 09:53:31', '5de7e34736d0959782cf6d757f564c57cf44711245d9ee90730abe9a4a738df1'),
(78, 41, '{\"userId\":\"41\",\"roleNum\":\"3\",\"role\":\"Professional\",\"name\":\"Nurvwshop\",\"mobile\":\"0723386835\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '41.115.70.174', 'Chrome 108.0.5359.128', 'Mozilla/5.0 (Linux; Android 13; SM-S908E Build/TP1A.220624.014; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/108.0.5359.128 Mobile Safari/537.36', 'Android', '2023-01-24 14:24:00', '305fce289f632f37f897c753e53f1f040fe262d678baca2c8105600d00210009'),
(79, 40, '{\"userId\":\"40\",\"roleNum\":\"2\",\"role\":\"Assessor\",\"name\":\"Mdingwa Nyathi\",\"mobile\":\"0718881882\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '41.115.70.174', 'Chrome 108.0.5359.128', 'Mozilla/5.0 (Linux; Android 13; SM-S908E Build/TP1A.220624.014; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/108.0.5359.128 Mobile Safari/537.36', 'Android', '2023-01-24 14:34:48', '2a9b66338f2070b0e56d5630eae61d79a96811d71e39c0b4031d4bae3ee2598b'),
(80, 41, '{\"userId\":\"41\",\"roleNum\":\"3\",\"role\":\"Professional\",\"name\":\"Nurvwshop\",\"mobile\":\"0723386835\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '41.115.34.164', 'Chrome 109.0.5414.85', 'Mozilla/5.0 (Linux; Android 13; SM-S908E Build/TP1A.220624.014; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/109.0.5414.85 Mobile Safari/537.36', 'Android', '2023-02-03 18:12:52', '2e77b1fcd9c64035c5a653d9152f456cfbf49ae5aaae08fc1775360e45fb5cc2'),
(81, 41, '{\"userId\":\"41\",\"roleNum\":\"3\",\"role\":\"Professional\",\"name\":\"Nurvwshop\",\"mobile\":\"0723386835\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '183.182.105.91', 'Chrome 109.0.5414.117', 'Mozilla/5.0 (Linux; Android 12; SM-A035F Build/SP1A.210812.016; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/109.0.5414.117 Mobile Safari/537.36', 'Android', '2023-02-06 13:04:39', '8e178ee42d26b0c7db75b95e9de9f21d00c3ffef9a1b401a3bbaee8fd86204b2'),
(82, 40, '{\"userId\":\"40\",\"roleNum\":\"2\",\"role\":\"Assessor\",\"name\":\"Mdingwa Nyathi\",\"mobile\":\"0718881882\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '183.182.105.91', 'Chrome 109.0.5414.117', 'Mozilla/5.0 (Linux; Android 12; SM-A035F Build/SP1A.210812.016; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/109.0.5414.117 Mobile Safari/537.36', 'Android', '2023-02-06 13:21:55', 'bb535fe97b3b17a409aaa1c924717c84584f8ad4fcb88f743c50d6e7fed10251'),
(83, 41, '{\"userId\":\"41\",\"roleNum\":\"3\",\"role\":\"Professional\",\"name\":\"Nurvwshop\",\"mobile\":\"0723386835\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '183.182.105.91', 'Chrome 109.0.5414.117', 'Mozilla/5.0 (Linux; Android 12; SM-A035F Build/SP1A.210812.016; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/109.0.5414.117 Mobile Safari/537.36', 'Android', '2023-02-06 14:40:28', 'd98b79492e9d36875b9b0dbe65437b56425075a60babe11114012a7b873878d9'),
(84, 40, '{\"userId\":\"40\",\"roleNum\":\"2\",\"role\":\"Assessor\",\"name\":\"Mdingwa Nyathi\",\"mobile\":\"0718881882\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '183.182.105.91', 'Chrome 109.0.0.0', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Mobile Safari/537.36', 'Android', '2023-02-11 06:03:34', 'c5d877424cb01699875a7116a986533a6e0daa823ae5196e850e8bd62e01f657'),
(85, 41, '{\"userId\":\"41\",\"roleNum\":\"3\",\"role\":\"Professional\",\"name\":\"Nurvwshop\",\"mobile\":\"0723386835\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '183.182.105.91', 'Chrome 109.0.0.0', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Mobile Safari/537.36', 'Android', '2023-02-11 06:03:51', 'fa9848de520d307b88ed01759e7362a1bb0e37c65698b2359ec049e26dd8f7d8'),
(86, 41, '{\"userId\":\"41\",\"roleNum\":\"3\",\"role\":\"Professional\",\"name\":\"Nurvwshop\",\"mobile\":\"0723386835\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '183.182.105.91', 'Chrome 109.0.0.0', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Mobile Safari/537.36', 'Android', '2023-02-12 14:23:43', '2f3f84eff6cd3e306045c0504d14768ec6ab6ee421c35f35b9ce9ad62ccfbe26'),
(87, 41, '{\"userId\":\"41\",\"roleNum\":\"3\",\"role\":\"Professional\",\"name\":\"Nurvwshop\",\"mobile\":\"0723386835\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '183.182.105.91', 'Chrome 109.0.0.0', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Mobile Safari/537.36', 'Android', '2023-02-13 06:03:04', 'c102a25bc0455b2eea15ff15481525b9ebaca1df9a58019faf6229ecd01f29bc'),
(88, 41, '{\"userId\":\"41\",\"roleNum\":\"3\",\"role\":\"Professional\",\"accountType\":\"pro\",\"name\":\"Nurvwshop\",\"mobile\":\"0723386835\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '183.182.104.121', 'Chrome 109.0.5414.117', 'Mozilla/5.0 (Linux; Android 12; SM-A035F Build/SP1A.210812.016; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/109.0.5414.117 Mobile Safari/537.36', 'Android', '2023-02-13 13:08:33', '9d769537ec5d270ff330132ee2567f75a888a89f3b1f5ec044d17e9d57cdeefa'),
(89, 41, '{\"userId\":\"41\",\"roleNum\":\"3\",\"role\":\"Professional\",\"accountType\":\"pro\",\"name\":\"Nurvwshop\",\"mobile\":\"0723386835\",\"picpath\":\"assets\\/icon-66.png\",\"isLoggedIn\":true}', '183.182.104.121', 'Chrome 109.0.5414.117', 'Mozilla/5.0 (Linux; Android 12; SM-A035F Build/SP1A.210812.016; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/109.0.5414.117 Mobile Safari/537.36', 'Android', '2023-02-13 13:25:36', '8df65d3a65f73fe9eca7fe6f19d7cf27eddd3a875b77eb41e63f72b022d1d6d7');

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

--
-- Dumping data for table `tbl_offices`
--

INSERT INTO `tbl_offices` (`id`, `buzi_id`, `address`, `phone`, `email`, `res_prof_name`, `res_prof_reg`, `created_by`, `created_at`, `verified_by`, `verified_at`, `file_address`, `file_certificate`, `status`, `is_head`) VALUES
(1, 1, 'South', '123456789', 'south@gmail.com', 'Toni', '123456', '41', '2022-12-08 09:07:17.000000', '40', '2023-01-10 07:20:23.000000', 'office/1670529898_PDf__test.pdf', 'office/1670529903_PDf__test_2.pdf', 'Verified', '1'),
(2, 1, 'vien', '4567891320', 'vien@gmail.com', 'nikonlay', '789564132', '41', '2022-12-08 09:07:17.000000', '40', '2023-01-10 07:23:20.000000', 'office/1670529994_PDf__test.pdf', 'office/1670529999_PDf__test_1.pdf', 'Verified', '0'),
(6, 1, 'bbb2', '126263636368', 'bbb2@gmail.com', 'bbb2', 'bbb2', '41', '2023-01-12 08:05:02.000000', '40', '2023-01-24 02:35:26.000000', 'office/1673546699_CV_new.pdf', 'office/1673546700_CV_new.pdf', 'Verified', '0'),
(7, 1, '55 Glen Grey Drive Waterfall', '27718881882', 'info@sivago.co.za', 'Mdingwa Nyathi', 'PrArch 21118', '41', '2023-01-20 02:53:21.000000', '', '0000-00-00 00:00:00.000000', 'office/1674219153_H22-013AI.pdf', 'office/1674219155_H22-017AI.pdf', 'Unverified', '0'),
(8, 1, '55 glen grey drive waterfall', '7198765446789', 'mdingwa@sivago.co.za ', 'Mdingwa Nyathi', 'PrArch 21118', '41', '2023-01-21 11:18:01.000000', '40', '2023-01-21 12:56:20.000000', 'office/1674292673_H22-013AI.pdf', 'office/1674292676_H22-013AI.pdf', 'Verified', '0');

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

--
-- Dumping data for table `tbl_plans`
--

INSERT INTO `tbl_plans` (`id`, `verify_code`, `client_name`, `client_address_line_1`, `client_address_line_2`, `client_city`, `client_province`, `client_zipcode`, `erfno`, `hia_sensitivity`, `municipal`, `professional_reg_number`, `professional`, `contact_email`, `contact_phone`, `contact_address_line_1`, `contact_address_line_2`, `contact_city`, `contact_province`, `contact_zipcode`, `project_plan_no`, `project_title`, `occupancy`, `project_cost`, `project_area`, `project_address_line_1`, `project_address_line_2`, `project_city`, `project_province`, `project_zipcode`, `responsible_qs`, `file`, `certificate`, `created_by`, `created_at`, `updated_at`, `status_request`) VALUES
(2, '77610', 'Developer', 'address', 'address', 'address', 'KwaZulu-Natal', '123456', 123456, 'test', 'Ba-Phalaborwa Local Municipality', '123456', 'test', 'address@gmail.com', '123456789', 'address', 'address', 'address', '123456', '123456', 'Z8Y97', 'Save Button success', 'test', '123456', '123546', 'address', 'address', 'address', 'Gauteng', '123456', 'test', 'plan/1667177499_PDf__test.pdf', '1670253022_Save Button success.pdf', '41', '2022-10-31 01:53:30', '2022-12-05 04:10:22', 'Yes'),
(3, '97162', 'DOH', '55 Glen grey Dr', 'Waterfall', 'Durban', 'KwaZulu-Natal', '3610', 1234, 'Low', 'Amahlathi Local Municipality', 'PrArch 21118', 'Mdingwa Nyathi', 'mdingwa@sivago.co.za', '0718881882', '55 Glen Grey Dr', 'Waterfall', 'Durban', '2000', '3610', '43FXG', 'DOH Wash bays', 'H4', '60 000 000.00', '5000', '55 Glen Grey Dr', 'Waterfall', 'Durban', 'KwaZulu-Natal', '3610', 'Asa QS', 'plan/1674296919_L_MPATA_7466_TEGELA.pdf', '1674297162_DOH Wash bays.pdf', '41', '2023-01-21 12:32:42', '2023-01-21 12:32:42', 'Yes'),
(4, '14232', 'develop', 'develop1', 'develop2', 'city1', 'Free State', '01000', 123456, 'develop', 'Ba-Phalaborwa Local Municipality', '456789', 'develop', 'develop@gmail.com', '123456789', 'develop', 'develop', 'city3', 'Limpopo', '03000', '5LUR9', 'develop', 'develop', '123456789', 'bigger', 'develop', 'developcity2', 'city2', 'Mpumalanga', '02000', 'develop', 'plan/1676214161_SouCV.pdf', '1676214232_develop.pdf', '41', '2023-02-12 05:03:52', '2023-02-12 05:03:52', 'Yes');

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

--
-- Dumping data for table `tbl_profile`
--

INSERT INTO `tbl_profile` (`id`, `name`, `surname`, `id_no`, `council`, `reg_no`, `employer`, `appointment`, `pratical_certification`, `qualification`, `cv`, `exp_year`, `full_part`, `jtitle`, `updated_at`, `status`, `status_request`, `verified_by`, `verified_at`, `user_id`, `is_director`) VALUES
(1, 'Mdingwa', 'Nyathi', '7505166165184', 'SACAP', 'PrArch 21118', 'Sivago Architects CC', 'profile/1674291089_H22-013AI.pdf', 'profile/1674291091_H22-013AI.pdf', 'profile/1674291096_H22-013AI.pdf', 'profile/1674291107_H22-017AI.pdf', '6 year', '100', 'Professional Architect', '2023-02-13', 'Verified', 'Yes', '40', '2023-01-10', '41', '1');

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

--
-- Dumping data for table `tbl_projects`
--

INSERT INTO `tbl_projects` (`id`, `title`, `type`, `prof_type`, `started_at`, `description`, `const_cost`, `final_cost`, `variable`, `prof_cost`, `client_name`, `pl_name`, `pl_email`, `pl_phone`, `proj_address`, `proj_gps`, `proj_street`, `proj_city`, `proj_state`, `proj_zip`, `status`, `status_verify`, `appointment`, `pratical_certification`, `final_certification`, `final_account`, `created_by`, `completed_at`, `status_verified`, `verified_at`, `verified_by`) VALUES
(1, 'update', 'Residential', 'Project Manager', '2022-09-01', 'test', '100000', '100000', '9999900.00', '100000', 'test', 'test', 'test@gmail.com', '1234567890', 'update', 'test', 'test', 'test', 'test', '000000', 'Completed', '0', 'project/1664859154_PDf__test.pdf', '', '', '', '41', '', 'Unverified', NULL, NULL),
(2, 'Add save', 'Residential', 'Project Manager', '2022-11-01', 'Add Save Button', '100000', '100000', '0.00', '50000', 'Tomi', 'Nikolay', 'nurvwshop@gmail.com', '1234567890', '13456', '123456', 'Street', 'City', 'State', '123456', 'Completed', '1', 'project/1670234912_PDf__test.pdf', 'project/1670234919_PDf__test_2.pdf', 'project/1670234924_PDf__test_2.pdf', 'project/1670234927_PDf__test.pdf', '41', '2022-12-30', 'Verified', '2023-01-10 07:24:30', '40'),
(3, 'Social App', 'Residential', 'Project Manager', '2022-12-06', 'Social Mobile App', '200000', '150000', '-33.33', '100000', 'Nyathi', 'Toni', 'toni@gmail.com', '123456789', '123456789', '123456789', 'Toni Street', 'Capital', 'Capital', '00000', 'Completed', '0', 'project/1671422844_PDf__test.pdf', 'project/1671422956_PDf__test_1.pdf', 'project/1671422964_PDf__test_2.pdf', 'project/1671422966_PDf__test_3.pdf', '41', '2022-12-30', 'Unverified', NULL, NULL),
(4, 'DOH Washbays', 'Hospital', 'Architect', '2023-01-01', 'New EMS wash bays for DOH', '60 000 000.00', '0', '50.00', '6 000 000.00', 'DOH', 'Mdingwa Nyathi', 'mdingwa @sivago.co.za', '27718881882', '1234', '00000000', 'Unit 1 Katzenellenbogen, 72 Goodhope st.,', 'Ladysmith', 'KZN', '3370', 'Ongoing', '1', 'project/1673941315_ZNB9794.2020-H.pdf', '', '', '', '41', '', 'Verified', '2023-01-21 05:46:30', '40'),
(5, 'Mayors walk PMB', 'Hospital', 'Architect', '2023-01-01', 'Upgrades to DOH Archives', '65000000', '63000000', '6299999896.83', '6500000', 'DOH', 'Dube', 'dube@doh.co.za', '27710001889', '1234', '101010101', 'PMB', 'PMB', 'KZN', '1234', 'Completed', '1', 'project/1674141862_H22-017AI.pdf', 'project/1674141864_H22-017AI.pdf', 'project/1674141868_H22-017AI.pdf', 'project/1674141871_H22-013AI.pdf', '41', '', 'Unverified', NULL, NULL);

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

--
-- Dumping data for table `tbl_reports`
--

INSERT INTO `tbl_reports` (`id`, `accessor`, `profess`, `content_id`, `report_type`, `created_at`, `created_by`, `filename`, `data`, `score`) VALUES
(1, 'Mdingwa Nyathi', '41', '1', 'office', '2023-01-10 07:20:23', '40', '1673371223_office.pdf', '[{\"id\":1,\"key\":\"ADDRESS\",\"val\":\"South\",\"status\":0},{\"id\":2,\"key\":\"PHONE\",\"val\":\"123456789\",\"status\":0},{\"id\":3,\"key\":\"EMAIL\",\"val\":\"south@gmail.com\",\"status\":0},{\"id\":4,\"key\":\"RES PROF NAME \",\"val\":\"Toni\",\"status\":0},{\"id\":5,\"key\":\"FILE ADDRESS\",\"val\":\"Uploaded\",\"status\":1},{\"id\":6,\"key\":\"FILE CERTIFICATE\",\"val\":\"Uploaded\",\"status\":1},{\"id\":7,\"key\":\"IS HEAD\",\"val\":\"1\",\"status\":1},{\"id\":8,\"key\":\"PNAME\",\"val\":\"WWW\",\"status\":0},{\"id\":9,\"key\":\"PCIPC REG NO \",\"val\":\"456789\",\"status\":1},{\"id\":10,\"key\":\"PTYPE\",\"val\":\"CC\",\"status\":0},{\"id\":11,\"key\":\"SCHEDULE DATA\",\"val\":\"2023-01-11T12:27\",\"status\":1},{\"id\":12,\"key\":\"SCHEDULE STATUS\",\"val\":\"0\",\"status\":1}]', '50.00%'),
(2, 'Mdingwa Nyathi', '41', '2', 'office', '2023-01-10 07:23:20', '40', '1673371400_office.pdf', '[{\"id\":1,\"key\":\"ADDRESS\",\"val\":\"vien\",\"status\":1},{\"id\":2,\"key\":\"PHONE\",\"val\":\"4567891320\",\"status\":1},{\"id\":3,\"key\":\"EMAIL\",\"val\":\"vien@gmail.com\",\"status\":1},{\"id\":4,\"key\":\"RES PROF NAME \",\"val\":\"nikonlay\",\"status\":0},{\"id\":5,\"key\":\"FILE ADDRESS\",\"val\":\"Uploaded\",\"status\":1},{\"id\":6,\"key\":\"FILE CERTIFICATE\",\"val\":\"Uploaded\",\"status\":0},{\"id\":7,\"key\":\"IS HEAD\",\"val\":\"0\",\"status\":0},{\"id\":8,\"key\":\"PNAME\",\"val\":\"WWW\",\"status\":0},{\"id\":9,\"key\":\"PCIPC REG NO \",\"val\":\"456789\",\"status\":0},{\"id\":10,\"key\":\"PTYPE\",\"val\":\"CC\",\"status\":1},{\"id\":11,\"key\":\"SCHEDULE DATA\",\"val\":\"2023-01-11T19:22\",\"status\":1},{\"id\":12,\"key\":\"SCHEDULE STATUS\",\"val\":\"0\",\"status\":0}]', '50.00%'),
(3, 'Mdingwa Nyathi', '41', '2', 'project', '2023-01-10 07:24:30', '40', '1673371470_project.pdf', '[{\"id\":1,\"key\":\"TITLE\",\"val\":\"Add save\",\"status\":0},{\"id\":2,\"key\":\"TYPE\",\"val\":\"Residential\",\"status\":0},{\"id\":3,\"key\":\"PROFESS TYPE\",\"val\":\"Project Manager\",\"status\":0},{\"id\":4,\"key\":\"STARTED AT\",\"val\":\"2022-11-01\",\"status\":1},{\"id\":5,\"key\":\"DESCRIPTION\",\"val\":\"Add Save Button\",\"status\":0},{\"id\":6,\"key\":\"CONST COST\",\"val\":\"100000\",\"status\":1},{\"id\":7,\"key\":\"FINAL COST\",\"val\":\"100000\",\"status\":0},{\"id\":8,\"key\":\"VARIATION \",\"val\":\"0.00\",\"status\":0},{\"id\":9,\"key\":\"PROFESS COST\",\"val\":\"50000\",\"status\":0},{\"id\":10,\"key\":\"CLIENT NAME\",\"val\":\"Tomi\",\"status\":1},{\"id\":11,\"key\":\"PROJECT LEADER NAME\",\"val\":\"Nikolay\",\"status\":0},{\"id\":12,\"key\":\"PROJECT LEADER EMAIL\",\"val\":\"nurvwshop@gmail.com\",\"status\":1},{\"id\":13,\"key\":\"PROJECT LEADER PHONE\",\"val\":\"1234567890\",\"status\":1},{\"id\":14,\"key\":\"PROJECT ADDRESS\",\"val\":\"13456\",\"status\":1},{\"id\":15,\"key\":\"PROJECT GPS\",\"val\":\"123456\",\"status\":0},{\"id\":16,\"key\":\"PROJECT STREET\",\"val\":\"Street\",\"status\":0},{\"id\":17,\"key\":\"PROJECT CITY\",\"val\":\"City\",\"status\":0},{\"id\":18,\"key\":\"PROJECT STATE\",\"val\":\"State\",\"status\":0},{\"id\":19,\"key\":\"PROJECT ZIP\",\"val\":\"123456\",\"status\":0},{\"id\":20,\"key\":\"STATUS\",\"val\":\"Completed\",\"status\":0},{\"id\":21,\"key\":\"STATUS VERIFY\",\"val\":\"1\",\"status\":1},{\"id\":22,\"key\":\"APPOINTMENT\",\"val\":\"Uploaded\",\"status\":0},{\"id\":23,\"key\":\"FINAL CERTIFICATION\",\"val\":\"Uploaded\",\"status\":0},{\"id\":24,\"key\":\"FINAL ACCOUNT\",\"val\":\"Uploaded\",\"status\":0},{\"id\":25,\"key\":\"COMPLETED AT\",\"val\":\"2022-12-30\",\"status\":1},{\"id\":26,\"key\":\"SCHEDULE DATA\",\"val\":\"2023-01-11T19:23\",\"status\":0},{\"id\":27,\"key\":\"SCHEDULE STATUS\",\"val\":\"0\",\"status\":0}]', '29.63%'),
(4, 'Mdingwa Nyathi', '41', '1', 'profile', '2023-01-10 07:26:26', '40', '1673371586_profile.pdf', '[{\"id\":1,\"key\":\"NAME\",\"val\":\"devTest\",\"status\":0},{\"id\":2,\"key\":\"SURNAME\",\"val\":\"test\",\"status\":0},{\"id\":3,\"key\":\"COUNCIL\",\"val\":\"SACAP\",\"status\":0},{\"id\":4,\"key\":\"REG NO\",\"val\":\"123456789\",\"status\":0},{\"id\":5,\"key\":\"EMPLOYER\",\"val\":\"Nyathi\",\"status\":0},{\"id\":6,\"key\":\"APPOINTMENT\",\"val\":\"Uploaded\",\"status\":0},{\"id\":7,\"key\":\"QUALIFICATION\",\"val\":\"None\",\"status\":0},{\"id\":8,\"key\":\"CV\",\"val\":\"Uploaded\",\"status\":0},{\"id\":9,\"key\":\"EXPERIENCE YEAR\",\"val\":\"6 year\",\"status\":0},{\"id\":10,\"key\":\"FULL PART\",\"val\":\"25\",\"status\":0},{\"id\":11,\"key\":\"JOB TITLE \",\"val\":\"Mobile Developement\",\"status\":0},{\"id\":12,\"key\":\"STATUS REQUEST\",\"val\":\"No\",\"status\":0},{\"id\":13,\"key\":\"SCHEDULE DATA\",\"val\":\"2023-01-18T10:53\",\"status\":0},{\"id\":14,\"key\":\"SCHEDULE STATUS\",\"val\":\"0\",\"status\":0}]', '28.57%'),
(5, 'Mdingwa Nyathi', '41', '8', 'office', '2023-01-21 12:56:20', '40', '1674298580_office.pdf', '[{\"id\":1,\"key\":\"ADDRESS\",\"val\":\"55 glen grey drive waterfall\",\"status\":0},{\"id\":2,\"key\":\"PHONE\",\"val\":\"7198765446789\",\"status\":0},{\"id\":3,\"key\":\"EMAIL\",\"val\":\"mdingwa@sivago.co.za \",\"status\":0},{\"id\":4,\"key\":\"RES PROF NAME \",\"val\":\"Mdingwa Nyathi\",\"status\":0},{\"id\":5,\"key\":\"FILE ADDRESS\",\"val\":\"Uploaded\",\"status\":0},{\"id\":6,\"key\":\"FILE CERTIFICATE\",\"val\":\"Uploaded\",\"status\":0},{\"id\":7,\"key\":\"IS HEAD\",\"val\":\"0\",\"status\":0},{\"id\":8,\"key\":\"PNAME\",\"val\":\"Sivago Architects CC\",\"status\":0},{\"id\":9,\"key\":\"PCIPC REG NO \",\"val\":\"2011\\/068953\\/23\",\"status\":0},{\"id\":10,\"key\":\"PTYPE\",\"val\":\"CC\",\"status\":0},{\"id\":11,\"key\":\"SCHEDULE DATA\",\"val\":\"2023-01-22T12:56\",\"status\":0},{\"id\":12,\"key\":\"SCHEDULE STATUS\",\"val\":\"0\",\"status\":0}]', '0%'),
(6, 'Mdingwa Nyathi', '41', '4', 'project', '2023-01-21 05:46:30', '40', '1674315990_project.pdf', '[{\"id\":1,\"key\":\"TITLE\",\"val\":\"DOH Washbays\",\"status\":1},{\"id\":2,\"key\":\"TYPE\",\"val\":\"Hospital\",\"status\":1},{\"id\":3,\"key\":\"PROFESS TYPE\",\"val\":\"Architect\",\"status\":1},{\"id\":4,\"key\":\"STARTED AT\",\"val\":\"2023-01-01\",\"status\":1},{\"id\":5,\"key\":\"DESCRIPTION\",\"val\":\"New EMS wash bays for DOH\",\"status\":0},{\"id\":6,\"key\":\"CONST COST\",\"val\":\"60 000 000.00\",\"status\":0},{\"id\":7,\"key\":\"FINAL COST\",\"val\":\"0\",\"status\":0},{\"id\":8,\"key\":\"VARIATION \",\"val\":\"50.00\",\"status\":0},{\"id\":9,\"key\":\"PROFESS COST\",\"val\":\"6 000 000.00\",\"status\":1},{\"id\":10,\"key\":\"CLIENT NAME\",\"val\":\"DOH\",\"status\":1},{\"id\":11,\"key\":\"PROJECT LEADER NAME\",\"val\":\"Mdingwa Nyathi\",\"status\":1},{\"id\":12,\"key\":\"PROJECT LEADER EMAIL\",\"val\":\"mdingwa @sivago.co.za\",\"status\":0},{\"id\":13,\"key\":\"PROJECT LEADER PHONE\",\"val\":\"27718881882\",\"status\":0},{\"id\":14,\"key\":\"PROJECT ADDRESS\",\"val\":\"1234\",\"status\":0},{\"id\":15,\"key\":\"PROJECT GPS\",\"val\":\"00000000\",\"status\":0},{\"id\":16,\"key\":\"PROJECT STREET\",\"val\":\"Unit 1 Katzenellenbogen, 72 Goodhope st.,\",\"status\":0},{\"id\":17,\"key\":\"PROJECT CITY\",\"val\":\"Ladysmith\",\"status\":1},{\"id\":18,\"key\":\"PROJECT STATE\",\"val\":\"KZN\",\"status\":1},{\"id\":19,\"key\":\"PROJECT ZIP\",\"val\":\"3370\",\"status\":0},{\"id\":20,\"key\":\"STATUS\",\"val\":\"Ongoing\",\"status\":1},{\"id\":21,\"key\":\"STATUS VERIFY\",\"val\":\"1\",\"status\":0},{\"id\":22,\"key\":\"APPOINTMENT\",\"val\":\"Uploaded\",\"status\":1},{\"id\":23,\"key\":\"FINAL CERTIFICATION\",\"val\":\"None\",\"status\":1},{\"id\":24,\"key\":\"FINAL ACCOUNT\",\"val\":\"None\",\"status\":0},{\"id\":25,\"key\":\"COMPLETED AT\",\"val\":\"None\",\"status\":1},{\"id\":26,\"key\":\"SCHEDULE DATA\",\"val\":\"2023-01-22T17:45\",\"status\":1},{\"id\":27,\"key\":\"SCHEDULE STATUS\",\"val\":\"0\",\"status\":1}]', '55.56%'),
(7, 'Mdingwa Nyathi', '41', '6', 'office', '2023-01-24 02:35:26', '40', '1674563726_office.pdf', '[{\"id\":1,\"key\":\"ADDRESS\",\"val\":\"bbb2\",\"status\":1},{\"id\":2,\"key\":\"PHONE\",\"val\":\"126263636368\",\"status\":1},{\"id\":3,\"key\":\"EMAIL\",\"val\":\"bbb2@gmail.com\",\"status\":1},{\"id\":4,\"key\":\"RES PROF NAME \",\"val\":\"bbb2\",\"status\":0},{\"id\":5,\"key\":\"FILE ADDRESS\",\"val\":\"Uploaded\",\"status\":0},{\"id\":6,\"key\":\"FILE CERTIFICATE\",\"val\":\"Uploaded\",\"status\":1},{\"id\":7,\"key\":\"IS HEAD\",\"val\":\"0\",\"status\":1},{\"id\":8,\"key\":\"PNAME\",\"val\":\"Sivago Architects CC\",\"status\":0},{\"id\":9,\"key\":\"PCIPC REG NO \",\"val\":\"2011\\/068953\\/23\",\"status\":1},{\"id\":10,\"key\":\"PTYPE\",\"val\":\"CC\",\"status\":0},{\"id\":11,\"key\":\"SCHEDULE DATA\",\"val\":\"2023-01-25T14:35\",\"status\":1},{\"id\":12,\"key\":\"SCHEDULE STATUS\",\"val\":\"0\",\"status\":1}]', '66.67%');

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
  `verify_user_id` varchar(255) NOT NULL,
  `verify_target` enum('office','project','profile','business') NOT NULL DEFAULT 'profile',
  `date` varchar(64) NOT NULL,
  `verify_content_id` varchar(255) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `is_done` enum('1','0') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_schedule`
--

INSERT INTO `tbl_schedule` (`id`, `verify_user_id`, `verify_target`, `date`, `verify_content_id`, `created_by`, `is_done`) VALUES
(1, '41', 'profile', '2023-01-18T10:53', '1', '40', '1'),
(3, '41', 'office', '2023-01-11T12:27', '1', '40', '1'),
(4, '41', 'office', '2023-01-11T19:22', '2', '40', '1'),
(5, '41', 'project', '2023-01-11T19:23', '2', '40', '1'),
(6, '41', 'office', '2023-01-22T12:56', '8', '40', '1'),
(7, '41', 'project', '2023-01-22T17:45', '5', '40', '0'),
(8, '41', 'project', '2023-01-22T17:45', '4', '40', '1'),
(9, '41', 'office', '2023-01-25T14:35', '6', '40', '1');

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

--
-- Dumping data for table `tbl_staffs`
--

INSERT INTO `tbl_staffs` (`id`, `buzi_id`, `name`, `surname`, `jtitle`, `exp_year`, `prof_reg_no`, `phone`, `email`, `file_appointment`, `file_prof_registration`, `file_qualification`, `file_cv`, `created_by`, `created_at`, `status`, `office_id`) VALUES
(1, 1, 'hstaff1', 'hstaff', 'mobile', '4year', '123456', '123456781300', 'mobile@gmail.com', 'office/1670528612_PDf__test.pdf', 'office/1670528619_PDf__test_1.pdf', 'office/1670528626_PDf__test_2.pdf', 'office/1670528628_PDf__test_3.pdf', '41', '2022-12-08 08:44:40', 'Unverified', '1'),
(2, 1, 'staff1', 'WWW', 'MOBILE', '3year', '7524', '45612318543', 'mobile@gmail.com', 'office/1670529948_PDf__test.pdf', 'office/1670529955_PDf__test_1.pdf', 'office/1670529961_PDf__test_2.pdf', 'office/1670529966_PDf__test_3.pdf', '41', '2022-12-08 09:07:17', 'Unverified', '2'),
(3, 1, 'Mhelo', 'Sibindi', 'Tech', '4year', '1234', '1234', 'mhelo@sivago.co.za', 'office/1674218599_H22-013AI.pdf', 'office/1674218602_H22-017AI.pdf', 'office/1674218607_H22-017AI.pdf', 'office/1674218608_H22-017AI.pdf', '41', '2023-01-20 02:43:38', 'Unverified', '2'),
(4, 1, 'Mhelo', 'Sibindi', 'Technologist', '4year', '1234', '277188818882', 'mhelo@sivago.co.za', 'office/1674219090_H22-017AI.pdf', 'office/1674219090_H22-026AI_230111_183225.pdf', 'office/1674219090_H22-017AI.pdf', 'office/1674219090_H22-013AI.pdf', '41', '2023-01-20 02:53:21', 'Unverified', '7');

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
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_business`
--
ALTER TABLE `tbl_business`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_directors`
--
ALTER TABLE `tbl_directors`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_equips`
--
ALTER TABLE `tbl_equips`
  MODIFY `id` bigint(128) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_id`
--
ALTER TABLE `tbl_id`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_last_login`
--
ALTER TABLE `tbl_last_login`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `tbl_offices`
--
ALTER TABLE `tbl_offices`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_plans`
--
ALTER TABLE `tbl_plans`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_profile`
--
ALTER TABLE `tbl_profile`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_projects`
--
ALTER TABLE `tbl_projects`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_reports`
--
ALTER TABLE `tbl_reports`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_staffs`
--
ALTER TABLE `tbl_staffs`
  MODIFY `id` bigint(128) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
