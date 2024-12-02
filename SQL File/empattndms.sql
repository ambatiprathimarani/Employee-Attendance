-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2024 at 08:02 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `empattndms`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`id`, `name`, `email`, `mobile`, `password`, `create_date`) VALUES
(1, 'admin', 'admin@gmail.com', '1234567891', '5c428d8875d2948607f3e3fe134d71b4', '2024-01-05 11:25:17');

-- --------------------------------------------------------

--
-- Table structure for table `tblattendance`
--

CREATE TABLE `tblattendance` (
  `id` int(11) NOT NULL,
  `empId` varchar(255) DEFAULT NULL,
  `checkInTime` datetime DEFAULT NULL,
  `checkInIP` varbinary(16) DEFAULT NULL,
  `remark` mediumtext DEFAULT NULL,
  `checkOutTime` datetime DEFAULT NULL,
  `postingTime` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbldepartment`
--

CREATE TABLE `tbldepartment` (
  `id` int(11) NOT NULL,
  `DepartmentName` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbldepartment`
--

INSERT INTO `tbldepartment` (`id`, `DepartmentName`) VALUES
(4, 'Account'),
(6, 'Admin'),
(7, 'Operations'),
(9, 'IT'),
(11, 'Sales');

-- --------------------------------------------------------

--
-- Table structure for table `tblemployee`
--

CREATE TABLE `tblemployee` (
  `id` int(11) NOT NULL,
  `EmpId` varchar(45) DEFAULT NULL,
  `fname` varchar(45) DEFAULT NULL,
  `lname` varchar(45) DEFAULT NULL,
  `department_name` varchar(100) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `photo` varchar(200) DEFAULT NULL,
  `dob` varchar(45) DEFAULT NULL,
  `date_of_joining` varchar(45) DEFAULT NULL,
  `password` varchar(450) DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblemployee`
--

INSERT INTO `tblemployee` (`id`, `EmpId`, `fname`, `lname`, `department_name`, `email`, `mobile`, `country`, `state`, `city`, `address`, `photo`, `dob`, `date_of_joining`, `password`, `create_date`) VALUES
(5, 'emp123', 'ex', 'ex', '4', 'ex@ex.com', '1234567891', '', '', '', '', '../uploads/default.jpg', '', '', '482c811da5d5b4bc6d497ffa98491e38', '2024-12-02 06:48:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblattendance`
--
ALTER TABLE `tblattendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbldepartment`
--
ALTER TABLE `tbldepartment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblemployee`
--
ALTER TABLE `tblemployee`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblattendance`
--
ALTER TABLE `tblattendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbldepartment`
--
ALTER TABLE `tbldepartment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tblemployee`
--
ALTER TABLE `tblemployee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
