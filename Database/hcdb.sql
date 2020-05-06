-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2020 at 11:53 AM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Table structure for table `creditcardetails`
--

CREATE TABLE `creditcardetails` (
  `id` int(11) NOT NULL,
  `cardNo` int(11) NOT NULL,
  `cvv` int(11) NOT NULL,
  `ccHolderName` varchar(50) NOT NULL,
  `ccExpDate` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `creditcardetails`
--

INSERT INTO `creditcardetails` (`id`, `cardNo`, `cvv`, `ccHolderName`, `ccExpDate`) VALUES
(24, 123, 12, 'Thushan', '10/100');




-- Indexes for table `creditcardetails`
--
ALTER TABLE `creditcardetails`
  ADD PRIMARY KEY (`id`);


--
-- AUTO_INCREMENT for table `creditcardetails`
--
ALTER TABLE `creditcardetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
