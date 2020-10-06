-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 06, 2020 at 01:55 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chat`
--

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `chat_id` int(4) NOT NULL,
  `chat_user_id` int(3) NOT NULL,
  `chat_user2_id` int(3) NOT NULL,
  `chat_message` text NOT NULL,
  `chat_sent_by` int(1) NOT NULL,
  `chat_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`chat_id`, `chat_user_id`, `chat_user2_id`, `chat_message`, `chat_sent_by`, `chat_date`) VALUES
(1, 1, 2, 'Zdravo, sta se radi? ', 1, '2020-08-01 08:37:00'),
(2, 1, 2, 'Evo nista, kod tebe? ', 2, '2020-08-05 09:41:00'),
(3, 2, 1, 'asdasdadsadasdas', 1, '2020-08-16 04:27:14'),
(4, 1, 2, 'asdasdsadasdada', 1, '2020-08-18 12:16:45'),
(96, 1, 3, 'Sta se radi?', 1, '2020-08-19 13:56:15'),
(131, 1, 3, 'Cao, cao. :)\n', 1, '2020-08-21 12:22:52'),
(132, 1, 3, 'Zdravo, evo me. :)', 1, '2020-09-08 12:12:55'),
(133, 3, 1, 'Zdravo, izvni sto kasnim sa odgovorom. :)', 3, '2020-09-08 14:40:46'),
(134, 1, 3, 'Sve je ok. :)\n', 1, '2020-09-08 14:48:56'),
(135, 3, 1, 'Sta ima? \n', 3, '2020-09-08 14:50:51'),
(136, 3, 1, 'asdasdasdasda', 3, '2020-09-08 14:52:55'),
(137, 1, 3, 'asdasdasdad', 1, '2020-09-08 15:59:39'),
(138, 3, 1, 'Sve je ok. ;)', 3, '2020-09-08 16:03:04');

-- --------------------------------------------------------

--
-- Table structure for table `chats_from`
--

CREATE TABLE `chats_from` (
  `chat_id` int(4) NOT NULL,
  `chat_user_id` int(4) NOT NULL,
  `chat_user_from` int(4) NOT NULL,
  `chat_type` varchar(10) NOT NULL DEFAULT 'received',
  `chat_message` varchar(255) NOT NULL,
  `chat_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chats_from`
--

INSERT INTO `chats_from` (`chat_id`, `chat_user_id`, `chat_user_from`, `chat_type`, `chat_message`, `chat_date`) VALUES
(1, 1, 2, 'received', 'Zdravo, sta se radi? ', '2020-08-07 04:24:00'),
(2, 1, 2, 'received', 'Super, bas mi je drago da to cujem. ', '2020-08-15 06:33:00');

-- --------------------------------------------------------

--
-- Table structure for table `chats_to`
--

CREATE TABLE `chats_to` (
  `chat_id` int(4) NOT NULL,
  `chat_to_user_id` int(4) NOT NULL,
  `chat_user_id_to` int(4) NOT NULL,
  `chat_type` varchar(10) NOT NULL DEFAULT 'sent',
  `chat_message` varchar(255) NOT NULL,
  `chat_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chats_to`
--

INSERT INTO `chats_to` (`chat_id`, `chat_to_user_id`, `chat_user_id_to`, `chat_type`, `chat_message`, `chat_date`) VALUES
(1, 1, 2, 'sent', 'Super sam, hvala na pitanju! ', '2020-08-04 06:33:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(3) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `users_pass` varchar(255) NOT NULL,
  `user_picture` varchar(100) NOT NULL,
  `user_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `users_pass`, `user_picture`, `user_status`) VALUES
(1, 'Anna Powell', 'annapass', 'img/anna.jpeg', 1),
(2, 'John Peters', 'johnpass', 'img/john.jpeg', 0),
(3, 'Jess Stones', 'jesspass', 'img/jess.jpg', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`chat_id`);

--
-- Indexes for table `chats_from`
--
ALTER TABLE `chats_from`
  ADD PRIMARY KEY (`chat_id`);

--
-- Indexes for table `chats_to`
--
ALTER TABLE `chats_to`
  ADD PRIMARY KEY (`chat_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `chat_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT for table `chats_from`
--
ALTER TABLE `chats_from`
  MODIFY `chat_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `chats_to`
--
ALTER TABLE `chats_to`
  MODIFY `chat_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
