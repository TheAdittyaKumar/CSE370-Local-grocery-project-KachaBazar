-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2025 at 02:18 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kachabazardb`
--

-- --------------------------------------------------------

--
-- Table structure for table `contain`
--

CREATE TABLE `contain` (
  `GRitem_id` int(11) NOT NULL,
  `ORorder_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `grocery_items`
--

CREATE TABLE `grocery_items` (
  `item_id` int(11) NOT NULL,
  `Groc_name` varchar(100) NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `Groc_quantity` int(11) DEFAULT NULL,
  `SEseller_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grocery_items`
--

INSERT INTO `grocery_items` (`item_id`, `Groc_name`, `status`, `category`, `description`, `price`, `Groc_quantity`, `SEseller_id`) VALUES
(2, 'Tomato', 'Available', 'Vegetables', 'Fresh tomatoes from the Bay of Bengal', 70.00, 3, 3),
(3, 'Starship Chocolate Milk', 'Available', 'Dairy', 'Greatest chocolate milk', 30.00, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `order_id` int(11) NOT NULL,
  `ORdate_time` datetime DEFAULT current_timestamp(),
  `total_bill` decimal(10,2) DEFAULT NULL,
  `ORpayment_status` varchar(50) DEFAULT NULL,
  `UScustomer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ratings&review`
--

CREATE TABLE `ratings&review` (
  `review_id` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` between 1 and 5),
  `review` text DEFAULT NULL,
  `Rdate_time` datetime DEFAULT current_timestamp(),
  `SEseller_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE `seller` (
  `seller_id` int(11) NOT NULL,
  `seller_name` varchar(100) NOT NULL,
  `store_name` varchar(100) NOT NULL,
  `seller_email` varchar(255) NOT NULL,
  `seller_password` varchar(100) NOT NULL,
  `date` date DEFAULT NULL,
  `store_location` varchar(255) DEFAULT NULL,
  `store_description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `seller`
--

INSERT INTO `seller` (`seller_id`, `seller_name`, `store_name`, `seller_email`, `seller_password`, `date`, `store_location`, `store_description`) VALUES
(3, 'seller', 'Gulshan Grocers', 'seller@gmail.com', 'seller', '2025-04-27', '8/3 Lake Circus, Kalabagan, Dhaka 1205, Bangladesh', 'Gulshan Grocers, Dhaka’s cozy পাড়ার দোকান! We’re a family-run store offering তাজা veggies, fruits, মশলা, rice, and daily essentials at দামি prices. Shop with us for quick, friendly service and a taste of বাড়ির মতো warmth!'),
(4, 'seller2', 'Dhanmondi Grocers', 'seller2@gmail.com', 'seller', '2025-04-27', 'Bracu', 'Bracu badda');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `customer_id` int(11) NOT NULL,
  `admin` tinyint(1) DEFAULT 0,
  `customer` tinyint(1) DEFAULT 1,
  `Uname` varchar(100) NOT NULL,
  `PhoneNo` varchar(20) DEFAULT NULL,
  `Upassword` varchar(100) NOT NULL,
  `Uemail` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`customer_id`, `admin`, `customer`, `Uname`, `PhoneNo`, `Upassword`, `Uemail`) VALUES
(1, 0, 1, 'Demo', '01789047464', 'demo', 'demo@gmail.com'),
(2, 1, 0, 'Admin', '01985496950', 'admin', 'admin@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `UScustomer_id` int(11) NOT NULL,
  `USadmin` tinyint(1) DEFAULT 0,
  `UScustomer` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contain`
--
ALTER TABLE `contain`
  ADD PRIMARY KEY (`GRitem_id`,`ORorder_id`),
  ADD KEY `ORorder_id` (`ORorder_id`);

--
-- Indexes for table `grocery_items`
--
ALTER TABLE `grocery_items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `SEseller_id` (`SEseller_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `UScustomer_id` (`UScustomer_id`);

--
-- Indexes for table `ratings&review`
--
ALTER TABLE `ratings&review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `SEseller_id` (`SEseller_id`);

--
-- Indexes for table `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`seller_id`),
  ADD UNIQUE KEY `seller_email` (`seller_email`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `Uemail` (`Uemail`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`UScustomer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `grocery_items`
--
ALTER TABLE `grocery_items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ratings&review`
--
ALTER TABLE `ratings&review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seller`
--
ALTER TABLE `seller`
  MODIFY `seller_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contain`
--
ALTER TABLE `contain`
  ADD CONSTRAINT `contain_ibfk_1` FOREIGN KEY (`GRitem_id`) REFERENCES `grocery_items` (`item_id`),
  ADD CONSTRAINT `contain_ibfk_2` FOREIGN KEY (`ORorder_id`) REFERENCES `order` (`order_id`);

--
-- Constraints for table `grocery_items`
--
ALTER TABLE `grocery_items`
  ADD CONSTRAINT `grocery_items_ibfk_1` FOREIGN KEY (`SEseller_id`) REFERENCES `seller` (`seller_id`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`UScustomer_id`) REFERENCES `user` (`customer_id`);

--
-- Constraints for table `ratings&review`
--
ALTER TABLE `ratings&review`
  ADD CONSTRAINT `ratings&review_ibfk_1` FOREIGN KEY (`SEseller_id`) REFERENCES `seller` (`seller_id`);

--
-- Constraints for table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`UScustomer_id`) REFERENCES `user` (`customer_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
