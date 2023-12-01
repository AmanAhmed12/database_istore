-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2023 at 06:44 AM
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
-- Database: `apple_istore`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

CREATE TABLE `administrator` (
  `admin_id` varchar(10) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(25) NOT NULL,
  `email` varchar(20) NOT NULL,
  `account_type` varchar(10) NOT NULL,
  `Status` varchar(10) NOT NULL DEFAULT 'deactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `administrator`
--

INSERT INTO `administrator` (`admin_id`, `username`, `password`, `email`, `account_type`, `Status`) VALUES
('A001', 'manager1', 'Amn@12345', 'manager1@gmail.com', 'manager', 'active'),
('A002', 'manager2', 'Amn@54321', 'manager2@gmail.com', 'manager', 'deactive'),
('A004', 'manager4', 'Man4@1234', 'man4@gmail.com', 'manager', 'deactive'),
('A005', 'manager5', 'Man5@1234', 'manager5@gmail.com', 'manager', 'deactive');

-- --------------------------------------------------------

--
-- Table structure for table `product_details`
--

CREATE TABLE `product_details` (
  `product_id` varchar(10) NOT NULL,
  `category` varchar(20) NOT NULL,
  `product_name` varchar(20) NOT NULL,
  `purchase_quantity` int(10) NOT NULL DEFAULT 0,
  `purchase_price` int(100) NOT NULL DEFAULT 0,
  `purchase_total` int(100) NOT NULL DEFAULT 0,
  `remaining_quantity` int(200) NOT NULL,
  `admin_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_details`
--

INSERT INTO `product_details` (`product_id`, `category`, `product_name`, `purchase_quantity`, `purchase_price`, `purchase_total`, `remaining_quantity`, `admin_id`) VALUES
('I001', 'Iphone', '2s', 7, 1000, 7000, 2, 'A001'),
('I002', 'Apple_Watch', 'watch', 6, 2000, 12000, 3, 'A001');

-- --------------------------------------------------------

--
-- Table structure for table `sales_detail`
--

CREATE TABLE `sales_detail` (
  `Invoice_No` int(20) NOT NULL,
  `category` varchar(20) NOT NULL,
  `product_name` varchar(20) NOT NULL,
  `sales_quantity` int(100) NOT NULL,
  `sales_price` int(100) NOT NULL,
  `sales_total` int(100) NOT NULL,
  `user_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales_detail`
--

INSERT INTO `sales_detail` (`Invoice_No`, `category`, `product_name`, `sales_quantity`, `sales_price`, `sales_total`, `user_id`) VALUES
(67, 'Iphone', '2s', 3, 1000, 3000, 'U001'),
(68, 'Iphone', '2s', 2, 1000, 2000, 'U001'),
(69, 'Apple_Watch', 'watch', 3, 2000, 6000, 'U001');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` varchar(20) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `account_type` varchar(10) NOT NULL,
  `Status` varchar(10) NOT NULL DEFAULT 'deactive',
  `admin_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `email`, `account_type`, `Status`, `admin_id`) VALUES
('U001', 'cashier1', 'Amn@12345', 'cashier1@gmail.com', 'cashier', 'active', 'A001'),
('U002', 'cashier2', 'Amn@54321', 'cashier2@gmail.com', 'cashier', 'active', 'A001'),
('U003', 'cashier3', 'Amn@11111', 'cashier3@gmail.com', 'cashier', 'active', 'A001'),
('U004', 'cashier4', 'Cash4@123', 'cashier4@gmail.com', 'cashier', 'active', 'A001'),
('U005', 'cashier5', 'Cash5@123', 'cashier5@gmail.com', 'cashier', 'active', 'A001');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `product_details`
--
ALTER TABLE `product_details`
  ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `category` (`category`),
  ADD UNIQUE KEY `product_name_2` (`product_name`),
  ADD KEY `admin_id` (`admin_id`),
  ADD KEY `product_name` (`product_name`);

--
-- Indexes for table `sales_detail`
--
ALTER TABLE `sales_detail`
  ADD PRIMARY KEY (`Invoice_No`),
  ADD KEY `category` (`category`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sales_detail`
--
ALTER TABLE `sales_detail`
  MODIFY `Invoice_No` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product_details`
--
ALTER TABLE `product_details`
  ADD CONSTRAINT `product_details_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `administrator` (`admin_id`);

--
-- Constraints for table `sales_detail`
--
ALTER TABLE `sales_detail`
  ADD CONSTRAINT `sales_detail_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `administrator` (`admin_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
