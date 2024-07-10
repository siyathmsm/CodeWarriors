-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 08, 2024 at 07:33 PM
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
-- Database: `code_warriors`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` int(11) NOT NULL,
  `question_type` varchar(255) NOT NULL,
  `q1` text DEFAULT NULL,
  `q2` text DEFAULT NULL,
  `q3` text DEFAULT NULL,
  `q4` text DEFAULT NULL,
  `q5` text DEFAULT NULL,
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `create_session`
--

CREATE TABLE `create_session` (
  `sessionid` varchar(10) NOT NULL,
  `passcode` varchar(20) NOT NULL,
  `coursecode` varchar(20) NOT NULL,
  `topic` varchar(50) NOT NULL,
  `starttime` varchar(10) NOT NULL,
  `endtime` varchar(10) NOT NULL,
  `duration` varchar(50) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `edit_profile`
--

CREATE TABLE `edit_profile` (
  `id` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phoneno` varchar(20) NOT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mcq`
--

CREATE TABLE `mcq` (
  `qid` int(11) NOT NULL,
  `q1` varchar(100) NOT NULL,
  `q1a1` varchar(20) NOT NULL,
  `q1a2` varchar(20) NOT NULL,
  `q1a3` varchar(20) NOT NULL,
  `q1a4` varchar(20) NOT NULL,
  `q1correctanswer` varchar(20) NOT NULL,
  `q2` varchar(100) NOT NULL,
  `q2a1` varchar(20) NOT NULL,
  `q2a2` varchar(20) NOT NULL,
  `q2a3` varchar(20) NOT NULL,
  `q2a4` varchar(20) NOT NULL,
  `q2correctanswer` varchar(20) NOT NULL,
  `q3` varchar(100) NOT NULL,
  `q3a1` varchar(20) NOT NULL,
  `q3a2` varchar(20) NOT NULL,
  `q3a3` varchar(20) NOT NULL,
  `q3a4` varchar(20) NOT NULL,
  `q3correctanswer` varchar(20) NOT NULL,
  `q4` varchar(100) NOT NULL,
  `q4a1` varchar(20) NOT NULL,
  `q4a2` varchar(20) NOT NULL,
  `q4a3` varchar(20) NOT NULL,
  `q4a4` varchar(20) NOT NULL,
  `q4correctanswer` varchar(20) NOT NULL,
  `q5` varchar(100) NOT NULL,
  `q5a1` varchar(20) NOT NULL,
  `q5a2` varchar(20) NOT NULL,
  `q5a3` varchar(20) NOT NULL,
  `q5a4` varchar(20) NOT NULL,
  `q5correctanswer` varchar(20) NOT NULL,
  `questiontype` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `owa`
--

CREATE TABLE `owa` (
  `qid` int(11) NOT NULL,
  `questiontype` varchar(10) NOT NULL,
  `q1` varchar(100) NOT NULL,
  `a1` varchar(10) NOT NULL,
  `q2` varchar(100) NOT NULL,
  `a2` varchar(10) NOT NULL,
  `q3` varchar(100) NOT NULL,
  `a3` varchar(10) NOT NULL,
  `q4` varchar(100) NOT NULL,
  `a4` varchar(10) NOT NULL,
  `q5` varchar(100) NOT NULL,
  `a5` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `register_lecturer`
--

CREATE TABLE `register_lecturer` (
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phoneno` int(10) NOT NULL,
  `password` varchar(20) NOT NULL,
  `is_activated` varchar(64) NOT NULL,
  `activation_token` int(64) NOT NULL,
  `reset_token` int(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `register_student`
--

CREATE TABLE `register_student` (
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phoneno` int(10) NOT NULL,
  `password` varchar(15) NOT NULL,
  `is_activated` varchar(64) NOT NULL,
  `activation_token` int(64) NOT NULL,
  `reset_token` int(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `score`
--

CREATE TABLE `score` (
  `sessionid` varchar(64) NOT NULL,
  `firstname` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL,
  `score` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `score`
--

INSERT INTO `score` (`sessionid`, `firstname`, `email`, `score`) VALUES
('123456', 'Siyath MSM', 'siyathmsm2000@gmail.com', 50);

-- --------------------------------------------------------

--
-- Table structure for table `yesno`
--

CREATE TABLE `yesno` (
  `qid` int(11) NOT NULL,
  `questiontype` varchar(10) NOT NULL,
  `q1` varchar(100) NOT NULL,
  `a1` varchar(10) NOT NULL,
  `q2` varchar(100) NOT NULL,
  `a2` varchar(10) NOT NULL,
  `q3` varchar(100) NOT NULL,
  `a3` varchar(10) NOT NULL,
  `q4` varchar(100) NOT NULL,
  `a4` varchar(10) NOT NULL,
  `q5` varchar(100) NOT NULL,
  `a5` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `create_session`
--
ALTER TABLE `create_session`
  ADD PRIMARY KEY (`sessionid`);

--
-- Indexes for table `edit_profile`
--
ALTER TABLE `edit_profile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mcq`
--
ALTER TABLE `mcq`
  ADD PRIMARY KEY (`qid`);

--
-- Indexes for table `owa`
--
ALTER TABLE `owa`
  ADD PRIMARY KEY (`qid`);

--
-- Indexes for table `register_lecturer`
--
ALTER TABLE `register_lecturer`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `register_student`
--
ALTER TABLE `register_student`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `score`
--
ALTER TABLE `score`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `yesno`
--
ALTER TABLE `yesno`
  ADD PRIMARY KEY (`qid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `edit_profile`
--
ALTER TABLE `edit_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `mcq`
--
ALTER TABLE `mcq`
  MODIFY `qid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `owa`
--
ALTER TABLE `owa`
  MODIFY `qid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `yesno`
--
ALTER TABLE `yesno`
  MODIFY `qid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
