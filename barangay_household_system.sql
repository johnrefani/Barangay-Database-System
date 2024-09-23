-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2022 at 10:56 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `barangay_household_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `barangay official`
--

CREATE TABLE `barangay official` (
  `official_id` varchar(15) NOT NULL,
  `official_full_name` varchar(50) NOT NULL,
  `official_contact` varchar(11) NOT NULL,
  `official_gender` varchar(10) NOT NULL,
  `official_age` int(2) NOT NULL,
  `official_position` varchar(20) NOT NULL,
  `term_start` varchar(50) NOT NULL,
  `term_end` varchar(50) NOT NULL,
  `household_number` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barangay official`
--

INSERT INTO `barangay official` (`official_id`, `official_full_name`, `official_contact`, `official_gender`, `official_age`, `official_position`, `term_start`, `term_end`, `household_number`) VALUES
('22-2022', 'Amelia Jane Sevilla', '09123996568', 'Female', 19, 'SK', '2018-05-14', '2021-05-14', 1),
('A113-B224', 'Millie Martinez', '09987654321', 'Female', 21, 'SK', '2018-05-14', '2021-05-14', 2),
('A999-B999', 'John Snow', '09753124680', 'Male', 24, 'System Admin', '2018-05-14', '2021-05-14', 1),
('B995-E773', 'Nina Sevilla', '09123456789', 'Female', 19, 'SK', '2018-05-14', '2021-05-14', 1);

-- --------------------------------------------------------

--
-- Table structure for table `household`
--

CREATE TABLE `household` (
  `household_number` int(6) NOT NULL,
  `household_family` varchar(50) NOT NULL,
  `purok_number` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `household`
--

INSERT INTO `household` (`household_number`, `household_family`, `purok_number`) VALUES
(1, 'Sevilla', 1),
(2, 'Martinez', 2),
(3, 'Dela Cruz', 4);

-- --------------------------------------------------------

--
-- Table structure for table `purok`
--

CREATE TABLE `purok` (
  `purok_number` int(1) NOT NULL,
  `street_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `purok`
--

INSERT INTO `purok` (`purok_number`, `street_name`) VALUES
(1, 'Labo Road'),
(2, 'San Antonio Road'),
(3, 'Tulay Na Lupa Road'),
(4, 'Looban');

-- --------------------------------------------------------

--
-- Table structure for table `resident`
--

CREATE TABLE `resident` (
  `res_id` varchar(11) NOT NULL,
  `res_full_name` varchar(50) NOT NULL,
  `res_age` int(2) NOT NULL,
  `res_gender` varchar(10) NOT NULL,
  `res_birth_date` varchar(50) NOT NULL,
  `res_birth_place` varchar(100) NOT NULL,
  `res_citizenship` varchar(20) NOT NULL,
  `res_marital_status` varchar(20) NOT NULL,
  `res_religion` varchar(20) NOT NULL,
  `job` varchar(20) DEFAULT NULL,
  `household_number` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `resident`
--

INSERT INTO `resident` (`res_id`, `res_full_name`, `res_age`, `res_gender`, `res_birth_date`, `res_birth_place`, `res_citizenship`, `res_marital_status`, `res_religion`, `job`, `household_number`) VALUES
('22-2022', 'Amelia Jane Sevilla', 19, 'Female', '2002-06-16', 'Daet Provincial Hospital', 'Filipino', 'Single', 'Catholic', 'Student', 1);

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `transaction_number` int(15) NOT NULL,
  `transaction_date` varchar(50) NOT NULL,
  `purpose_of_use` varchar(50) NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `res_id` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`transaction_number`, `transaction_date`, `purpose_of_use`, `cost`, `res_id`) VALUES
(1, 'Thursday, 19 May 2022', 'Certification', '100.00', '22-2022');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `official_id` varchar(15) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`official_id`, `username`, `password`) VALUES
('A999-B999', 'admin', 'admin'),
('A999-B999', 'Cognkc', 'Ycvuqp'),
('A113-B224', 'Millie', 'Parfait'),
('B995-E773', 'Nina', 'Kosaka'),
('A999-B999', 'test', 'test'),
('A999-B999', 'user', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barangay official`
--
ALTER TABLE `barangay official`
  ADD PRIMARY KEY (`official_id`),
  ADD KEY `Barangay Official_fk0` (`household_number`);

--
-- Indexes for table `household`
--
ALTER TABLE `household`
  ADD PRIMARY KEY (`household_number`),
  ADD KEY `Household_fk0` (`purok_number`);

--
-- Indexes for table `purok`
--
ALTER TABLE `purok`
  ADD PRIMARY KEY (`purok_number`);

--
-- Indexes for table `resident`
--
ALTER TABLE `resident`
  ADD PRIMARY KEY (`res_id`),
  ADD KEY `Resident_fk0` (`household_number`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`transaction_number`),
  ADD KEY `Transaction_fk0` (`res_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `official_id` (`official_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `household`
--
ALTER TABLE `household`
  MODIFY `household_number` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `purok`
--
ALTER TABLE `purok`
  MODIFY `purok_number` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `transaction_number` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barangay official`
--
ALTER TABLE `barangay official`
  ADD CONSTRAINT `Barangay Official_fk0` FOREIGN KEY (`household_number`) REFERENCES `household` (`household_number`);

--
-- Constraints for table `household`
--
ALTER TABLE `household`
  ADD CONSTRAINT `Household_fk0` FOREIGN KEY (`purok_number`) REFERENCES `purok` (`purok_number`);

--
-- Constraints for table `resident`
--
ALTER TABLE `resident`
  ADD CONSTRAINT `Resident_fk0` FOREIGN KEY (`household_number`) REFERENCES `household` (`household_number`);

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `Transaction_fk0` FOREIGN KEY (`res_id`) REFERENCES `resident` (`res_id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `User_fk0` FOREIGN KEY (`official_id`) REFERENCES `barangay official` (`official_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
