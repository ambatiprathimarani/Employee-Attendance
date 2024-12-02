-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 29, 2024 at 01:33 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

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
(1, 'admin', 'admin@gmail.com', '1234567890', '5c428d8875d2948607f3e3fe134d71b4', '2024-01-05 11:25:17');

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

--
-- Dumping data for table `tblattendance`
--

INSERT INTO `tblattendance` (`id`, `empId`, `checkInTime`, `checkInIP`, `remark`, `checkOutTime`, `postingTime`) VALUES
(1, '3', '2024-01-24 18:09:17', 0x3132372e302e302e31, '', NULL, '2024-01-24 17:09:17'),
(4, '3', '2024-01-28 16:55:18', 0x3132372e302e302e31, 'NA', '2024-01-28 17:49:49', '2024-01-28 15:55:18');

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
(9, 'IT');

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
(1, 'Emp12345', 'Rahul', 'Singh', '4', 'sss@gmail.com', '9999999999', 'India', 'UP', 'Lucknow', 'H324 ABC Apartment\r\n                  ', '../uploads/1668969654-doctor.png', '1998-02-03', '2022-03-26', '5c428d8875d2948607f3e3fe134d71b4', '2024-01-09 17:16:41'),
(2, 'Emp123456', 'badal', 'Kumar', '4', 'badal@gmail.com', '9999999999', 'India', 'UP', 'Noida', 'KKKKKK', '../uploads/1648318541-blog.jpg', '2022-03-26', '2022-03-27', 'f925916e2754e5e03f75dd58a5733251', '2024-01-10 18:15:41'),
(3, '10806121', 'Anuj', 'Kumar', '9', 'ak234@test.com', '1234567891', 'India', 'UP', 'Ghazibad', 'A 123 ABC Aprtment', '../uploads/1669081889-security-guard.png', '1996-06-04', '2022-10-14', 'f925916e2754e5e03f75dd58a5733251', '2024-01-11 01:51:29');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbldepartment`
--
ALTER TABLE `tbldepartment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tblemployee`
--
ALTER TABLE `tblemployee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
