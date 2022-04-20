-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 04, 2022 at 06:19 PM
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
(11, 'test project', 'Residential', 'Architect', '2021-12-12', 'test', '100000', '200000', '50', '100000', 'mozare', 'nikolay', 'nikolay@gmail.com', '123456789', 'test', 'test', 'test', 'test', 'state', 'test', 'Completed', '1639160178_veriprof-scope.pdf', '10', '2021-12-10 07:28:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_projects`
--
ALTER TABLE `tbl_projects`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_projects`
--
ALTER TABLE `tbl_projects`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
