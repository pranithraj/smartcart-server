-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2018 at 03:08 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smartcart`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(10) DEFAULT NULL,
  `item_id` int(10) DEFAULT NULL,
  `quantity` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cart_index`
--

CREATE TABLE `cart_index` (
  `cartid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart_index`
--

INSERT INTO `cart_index` (`cartid`) VALUES
(0),
(221),
(224),
(225),
(231),
(310),
(334),
(525),
(555),
(557),
(657),
(687),
(888),
(963),
(1000),
(1111),
(1234),
(2155),
(2543),
(5557),
(5581),
(5712),
(8854),
(9997),
(55451);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(10) NOT NULL,
  `lid` int(10) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `price` int(10) DEFAULT NULL,
  `stock` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `lid`, `name`, `price`, `stock`) VALUES
(1005, 28, 'Cardamom', 42, 62),
(1120, 15, 'Basmati Rice', 125, 62),
(1517, 26, 'Tomato Puree', 110, 87),
(1527, 22, 'Coriander Powder', 56, 55),
(1587, 26, 'Mint Leaves', 24, 74),
(2681, 87, 'Tomato', 30, 47),
(3369, 54, 'Garam Masala', 54, 13),
(4634, 50, 'Plain Yogurt', 17, 74),
(5522, 71, 'Chicken', 250, 67),
(5585, 20, 'Saffron', 200, 68),
(5874, 21, 'Salt', 17, 400),
(6655, 37, 'Chilli Powder', 17, 58),
(7785, 36, 'Cumin', 210, 71),
(8574, 26, 'Garlic Paste', 72, 88);

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `lid` int(10) NOT NULL,
  `x` varchar(10) DEFAULT NULL,
  `y` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`lid`, `x`, `y`) VALUES
(1120, '15', '20');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(10) NOT NULL,
  `uid` int(10) DEFAULT NULL,
  `cart_id` int(10) DEFAULT NULL,
  `payment` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `recipe`
--

CREATE TABLE `recipe` (
  `rid` int(10) DEFAULT NULL,
  `item_id` int(100) DEFAULT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recipe`
--

INSERT INTO `recipe` (`rid`, `item_id`, `quantity`) VALUES
(1150, 1120, 600),
(1150, 1005, 8),
(1150, 5522, 1),
(1150, 6655, 1),
(1150, 1527, 1),
(1150, 7785, 2),
(1150, 3369, 1),
(1150, 8574, 1),
(1150, 1587, 4),
(1150, 4634, 6),
(1150, 5585, 2),
(1150, 5874, 1),
(1150, 2681, 3),
(1150, 1517, 1);

-- --------------------------------------------------------

--
-- Table structure for table `recipe_index`
--

CREATE TABLE `recipe_index` (
  `rid` int(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recipe_index`
--

INSERT INTO `recipe_index` (`rid`, `name`, `image`) VALUES
(1150, 'Biryani', 'https://jwalanam.in/wp-content/uploads/2017/08/chicken_biriyani.jpg'),
(1151, 'Bisi Bele Bhath', 'https://www.ndtv.com/cooks/images/bisi%20bele%20bhaat.jpg'),
(1152, 'Hyderabadi Biryani', 'https://i0.wp.com/swatisani.net/kitchen/wp-content/uploads/2015/10/IMG_9526.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `uid` int(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `rfid` int(100) DEFAULT NULL,
  `password` varchar(200) NOT NULL,
  `cart_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uid`, `username`, `rfid`, `password`, `cart_id`) VALUES
(3910, 'code', 65653131, 'helloworld', NULL),
(6874, 'rolf', 654655454, 'pinkfloyd', 310);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD KEY `item_id` (`item_id`),
  ADD KEY `cart_id` (`cart_id`);

--
-- Indexes for table `cart_index`
--
ALTER TABLE `cart_index`
  ADD PRIMARY KEY (`cartid`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`lid`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `cart_id` (`cart_id`);

--
-- Indexes for table `recipe`
--
ALTER TABLE `recipe`
  ADD KEY `item_id` (`item_id`),
  ADD KEY `rid` (`rid`);

--
-- Indexes for table `recipe_index`
--
ALTER TABLE `recipe_index`
  ADD PRIMARY KEY (`rid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `user_ibfk_6` (`cart_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`cart_id`) REFERENCES `cart_index` (`cartid`) ON DELETE CASCADE;

--
-- Constraints for table `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `location_ibfk_1` FOREIGN KEY (`lid`) REFERENCES `items` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`cart_id`) REFERENCES `cart_index` (`cartid`) ON DELETE CASCADE;

--
-- Constraints for table `recipe`
--
ALTER TABLE `recipe`
  ADD CONSTRAINT `recipe_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `recipe_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `recipe_index` (`rid`) ON DELETE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_6` FOREIGN KEY (`cart_id`) REFERENCES `cart_index` (`cartid`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
