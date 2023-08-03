-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 03, 2023 at 01:31 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydata2`
--

-- --------------------------------------------------------

--
-- Table structure for table `car_wash_list`
--

CREATE TABLE `car_wash_list` (
  `CWL_ID` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `CWL_product` varchar(50) DEFAULT NULL,
  `CWL_price` int(11) DEFAULT NULL,
  `CWL_quantity` int(11) DEFAULT NULL,
  `CWL_total_price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pro_item`
--

CREATE TABLE `pro_item` (
  `Pro_id` int(11) NOT NULL,
  `Pro_name` varchar(50) DEFAULT NULL,
  `Pro_price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pro_item`
--

INSERT INTO `pro_item` (`Pro_id`, `Pro_name`, `Pro_price`) VALUES
(8, 'รถจักยานยนต์', 80),
(9, 'รถเก๋ง', 150),
(10, 'รถกะบะ', 200),
(11, 'รถตู้', 350);

-- --------------------------------------------------------

--
-- Table structure for table `status_car`
--

CREATE TABLE `status_car` (
  `SC_id` int(5) NOT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `SC_status` varchar(50) DEFAULT NULL,
  `SC_service_name` varchar(50) DEFAULT NULL,
  `SC_username` varchar(50) DEFAULT NULL,
  `SC_vehicle_registration` varchar(50) DEFAULT NULL,
  `SC_phone` varchar(50) DEFAULT NULL,
  `SC_Date` varchar(50) DEFAULT NULL,
  `SC_price` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `status_car`
--

INSERT INTO `status_car` (`SC_id`, `user_id`, `SC_status`, `SC_service_name`, `SC_username`, `SC_vehicle_registration`, `SC_phone`, `SC_Date`, `SC_price`) VALUES
(1, '0', 'รับรถแล้ว', 'x', 'x', 'x', 'x', 'x', 'x'),
(2, '5', 'รอชำระเงิน', '\"2\"	\"5\"	\"รอคิว\"	\"21\"	\"ad\"	\"ada\"	\"d\"	\"2023-05-12T03', 'ad', 'ada', 'd', '2023-05-12T03:32:27.161Z', '600'),
(3, '5', 'รับรถแล้ว', '33', 'ad', 'ad', 'aaaaaaaa', '2023-05-12T04:22:01.673Z', '600'),
(4, '5', 'รอชำระเงิน', '34', '42', '2525', '255', '2023-05-12T05:13:22.129Z', '600'),
(5, '5', 'รอชำระเงิน', '35', 'a', 'a', 'a', '2023-05-12T05:57:38.873Z', '600'),
(6, '7', 'รับรถแล้ว', '36', 'ad', 'ad', 'ad', '2023-05-12T06:03:27.048Z', '600'),
(7, '7', 'รอชำระเงิน', '37', 'a', 'a', 'a', '2023-05-12T06:09:42.208Z', '600'),
(8, '5', 'รอชำระเงิน', '48', 'mi\'', 'gg', '0632668599', '2023-05-13T03:31:49.350Z', '1000'),
(9, '5', 'รอชำระเงิน', '49', 'ad', 'ad', 'ad', '2023-05-13T03:33:28.750Z', '200'),
(10, '5', 'รอชำระเงิน', '49', 'ad', 'ad', 'ad', '2023-05-13T03:33:29.886Z', '200'),
(11, '5', 'รอชำระเงิน', '49', 'ad', 'ad', 'ad', '2023-05-13T03:33:34.598Z', '200'),
(12, '5', 'รอชำระเงิน', '49', 'ad', 'ad', 'ad', '2023-05-13T03:33:35.053Z', '200'),
(13, '5', 'รอชำระเงิน', '49', 'ad', 'ad', 'ad', '2023-05-13T03:33:35.254Z', '200'),
(14, '5', 'รอชำระเงิน', '49', 'ad', 'ad', 'ad', '2023-05-13T03:33:35.430Z', '200'),
(15, '5', 'รอชำระเงิน', '49', 'ad', 'ad', 'ad', '2023-05-13T03:33:36.333Z', '200'),
(16, '5', 'รอชำระเงิน', '49', 'ad', 'ad', 'ad', '2023-05-13T03:33:36.509Z', '200'),
(17, '5', 'รอชำระเงิน', '49', 'ad', 'ad', 'ad', '2023-05-13T03:34:00.206Z', '200'),
(18, '5', 'รอชำระเงิน', '49', 'ad', 'ad', 'ad', '2023-05-13T03:34:22.558Z', '200'),
(19, '5', 'รอชำระเงิน', '50', 'awd', 'ad', 'ad', '2023-05-13T03:38:57.876Z', '200'),
(20, '5', 'รอชำระเงิน', '51', 'ทรง๐ฤทธิ์', 'ฏฏ-999', '0632658488', '2023-05-13T04:17:42.486Z', '20'),
(21, '5', 'รอชำระเงิน', '52', 'ทรง', 'ทว-5563', '0935663222', '2023-05-13T04:50:38.969Z', '20'),
(22, '7', 'รอชำระเงิน', '53', '208133', 'jo-9999', '2000001635111', '2023-05-13T05:00:07.600Z', '20'),
(23, '7', 'รอชำระเงิน', 'llL', 'ad', 'ad', 'd', '2023-05-13T05:02:48.992Z', '20'),
(24, '5', 'รับรถแล้ว', 'รถกะบะ', 'pam', 'dd12', '0650010510', '2023-06-09T04:28:47.901Z', '200'),
(25, '5', 'รอคิว', 'รถเก๋ง', 'pnn', 'ff22', '06500111', '2023-06-09T06:08:38.438Z', '150');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `users_name` varchar(120) NOT NULL,
  `password` varchar(50) NOT NULL,
  `user_status` varchar(120) DEFAULT NULL COMMENT 'ผู้แจ้งซ่อม/เจ้าหน้าที่รับเรื่อง',
  `names` varchar(120) DEFAULT NULL,
  `phone` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `users_name`, `password`, `user_status`, `names`, `phone`) VALUES
(4, 'admin', '1234', 'admin', 'admin', '0981307100'),
(5, 'user', '1234', 'user', 'admin', '0620011013'),
(14, 'pam', '123', 'admin', 'admin', '0620011013'),
(15, 'admin2', '1234\r\n', 'user', 'song', '1234'),
(17, 'pam', '1234', 'user', 'pam', '0650010510');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `car_wash_list`
--
ALTER TABLE `car_wash_list`
  ADD PRIMARY KEY (`CWL_ID`) USING BTREE;

--
-- Indexes for table `pro_item`
--
ALTER TABLE `pro_item`
  ADD PRIMARY KEY (`Pro_id`);

--
-- Indexes for table `status_car`
--
ALTER TABLE `status_car`
  ADD PRIMARY KEY (`SC_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `car_wash_list`
--
ALTER TABLE `car_wash_list`
  MODIFY `CWL_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `pro_item`
--
ALTER TABLE `pro_item`
  MODIFY `Pro_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `status_car`
--
ALTER TABLE `status_car`
  MODIFY `SC_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
