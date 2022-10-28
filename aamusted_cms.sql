-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 28, 2022 at 10:38 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
CREATE DATABASE aamusted_cms;

-- Database: `aamusted_cms`
--
USE aamusted_cms;

-- --------------------------------------------------------

--
-- Table structure for table `academic_year`
--

CREATE TABLE `academic_year` (
  `academic_year_id` int(11) NOT NULL,
  `academic_year` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `academic_year`
--

INSERT INTO `academic_year` (`academic_year_id`, `academic_year`) VALUES
(1, '2019/2020'),
(2, '2020/2021'),
(3, '2021/2022'),
(5, '2022/2023'),
(14, '2030/2031'),
(18, '2031/2032'),
(23, '2019/2029');

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `bank_id` int(11) NOT NULL,
  `bank` int(100) NOT NULL,
  `branch` varchar(50) NOT NULL,
  `acc_no` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `certificate`
--

CREATE TABLE `certificate` (
  `cert_id` int(11) NOT NULL,
  `academic_yr` int(11) NOT NULL,
  `stud_id` int(11) NOT NULL,
  `prog_id` int(11) NOT NULL,
  `class` varchar(20) NOT NULL,
  `serial` varchar(50) NOT NULL,
  `picture` varchar(36) NOT NULL,
  `collected` int(11) NOT NULL,
  `date_created` date NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `certificate`
--

INSERT INTO `certificate` (`cert_id`, `academic_yr`, `stud_id`, `prog_id`, `class`, `serial`, `picture`, `collected`, `date_created`, `user_id`) VALUES
(1, 1, 2, 1, 'First Class', '11', 'ed7ef8fe043919d163dab55e634d458d.jpg', 1, '2020-06-10', 1),
(2, 1, 1, 1, 'First Class', '12', 'b9be583700a076168c8eeb5b3c05018d.png', 0, '2020-06-10', 1),
(3, 2, 3, 3, 'Second Class (Upper ', '13', '25017a6e408d57296dad3a600bf3e7ed.jpg', 1, '2020-06-10', 1),
(4, 2, 5, 3, 'Second Class (Upper ', '14', '771931573ca54c374f225c4d8d7944b2.png', 0, '2020-06-10', 1),
(5, 1, 4, 4, 'Second Class (Lower ', '15', 'e07675853d7cb00e77613026b093d6b0.jpg', 0, '2020-06-10', 1);

-- --------------------------------------------------------

--
-- Table structure for table `claims`
--

CREATE TABLE `claims` (
  `claim_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `claim_type` int(11) NOT NULL,
  `claim_status` int(11) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `claim_header`
--

CREATE TABLE `claim_header` (
  `claim_header_id` int(11) NOT NULL,
  `claim_header` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `claim_header`
--

INSERT INTO `claim_header` (`claim_header_id`, `claim_header`) VALUES
(1, 'External supervision'),
(2, 'Internal Supervision or Examination'),
(3, 'Excess Marking of Scripts'),
(4, 'Claim Part-Time Teaching and T&T'),
(5, 'Claim For Extra Teaching Load'),
(6, 'me'),
(7, 'NewClaim');

-- --------------------------------------------------------

--
-- Table structure for table `claim_type_table`
--

CREATE TABLE `claim_type_table` (
  `claim_type_id` int(11) NOT NULL,
  `claim_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `claim_type_table`
--

INSERT INTO `claim_type_table` (`claim_type_id`, `claim_type`) VALUES
(1, 'Supervision'),
(3, 'Examination');

-- --------------------------------------------------------

--
-- Table structure for table `collection`
--

CREATE TABLE `collection` (
  `date` date NOT NULL,
  `certificate_serial` varchar(20) NOT NULL,
  `dispatched_by` varchar(255) NOT NULL,
  `received_by` varchar(255) NOT NULL,
  `signature` varchar(255) NOT NULL,
  `collection_id` int(11) NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `other_name` varchar(50) NOT NULL,
  `other_staff_id` varchar(15) NOT NULL,
  `other_dept_id` varchar(100) NOT NULL,
  `other_phone_number` varchar(10) NOT NULL,
  `other_signature` varchar(50) NOT NULL,
  `other_rank` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `collection`
--

INSERT INTO `collection` (`date`, `certificate_serial`, `dispatched_by`, `received_by`, `signature`, `collection_id`, `phone_number`, `other_name`, `other_staff_id`, `other_dept_id`, `other_phone_number`, `other_signature`, `other_rank`) VALUES
('2020-06-10', '11', 'Daniel Danso Essel', '1', '', 1, '', 'Mills Abeiku Godfred', '', '', '', '', ''),
('2020-06-10', '13', 'Daniel Danso Essel', '3', '', 2, '', 'Osei  Emmanuel', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_id` int(11) NOT NULL,
  `course_code` varchar(50) NOT NULL,
  `course_title` varchar(225) NOT NULL,
  `max_scripts_number` int(11) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `course_code`, `course_title`, `max_scripts_number`, `dept_id`, `date_created`) VALUES
(1, 'ITC241', 'Database Development And Implementation', 300, 1, '2022-09-25 09:00:20'),
(2, 'EDCR242', 'Trends In Education and Social Management in Ghana', 300, 5, '2022-10-10 06:09:19'),
(3, 'dsdff', 'sdrf', 300, 1, '2022-10-10 06:18:20'),
(4, 'TEL111', 'Telecom101', 30, 10, '2022-10-21 13:27:59');

-- --------------------------------------------------------

--
-- Table structure for table `degree_type_table`
--

CREATE TABLE `degree_type_table` (
  `degree_id` int(11) NOT NULL,
  `degree` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `degree_type_table`
--

INSERT INTO `degree_type_table` (`degree_id`, `degree`) VALUES
(1, 'Bachelor'),
(2, 'HND');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `dept_id` int(11) NOT NULL,
  `dept_name` varchar(500) NOT NULL,
  `faculty_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dept_id`, `dept_name`, `faculty_id`) VALUES
(1, 'Information Technology Education', 10),
(2, 'Mathematics Education', 10),
(4, 'Management Education', 11),
(5, 'Social Studies Education', 11),
(6, 'Geography Education', 11),
(7, 'Business', 12),
(8, 'English Language Education', 13),
(9, 'Accounting Education', 10),
(10, 'department1', 14);

-- --------------------------------------------------------

--
-- Table structure for table `excess_marking`
--

CREATE TABLE `excess_marking` (
  `ex_id` int(11) NOT NULL,
  `academic_year_id` int(11) NOT NULL,
  `semester_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `degree_id` int(11) NOT NULL,
  `total_scripts_marked` int(11) NOT NULL,
  `max_scripts_number` int(11) NOT NULL,
  `rate` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `excess_marking`
--

INSERT INTO `excess_marking` (`ex_id`, `academic_year_id`, `semester_id`, `course_id`, `degree_id`, `total_scripts_marked`, `max_scripts_number`, `rate`, `amount`, `status`, `user_id`, `dept_id`, `date_created`) VALUES
(1, 1, 1, 1, 2, 400, 300, 5, 400, 3, 1, 1, '2022-08-30 12:21:44'),
(4, 1, 1, 1, 1, 40, 300, 0, 0, 0, 1, 1, '2022-10-07 05:09:12'),
(5, 1, 1, 1, 1, 248, 300, 20, 0, 1, 1, 1, '2022-10-07 06:29:56'),
(6, 1, 1, 1, 1, 4203, 300, 20, 78060, 2, 1, 2, '2022-10-07 06:30:47'),
(7, 1, 1, 2, 1, 400, 300, 20, 2000, 2, 1, 5, '2022-10-10 07:29:01'),
(8, 2, 1, 1, 1, 30, 300, 20, 0, 1, 8, 1, '2022-10-19 16:20:29'),
(9, 1, 1, 2, 1, 0, 300, 20, 0, 1, 8, 1, '2022-10-21 13:05:51'),
(10, 1, 1, 1, 1, 200, 300, 20, 0, 1, 8, 1, '2022-10-24 19:08:04'),
(11, 1, 1, 1, 1, 599, 300, 20, 5980, 0, 1, 1, '2022-10-26 15:48:14');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `faculty_id` int(11) NOT NULL,
  `faculty_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`faculty_id`, `faculty_name`) VALUES
(10, 'Science Education'),
(11, 'Social Science Education'),
(12, 'Business'),
(13, 'Languages Education'),
(14, 'faculty1');

-- --------------------------------------------------------

--
-- Table structure for table `internal_claim`
--

CREATE TABLE `internal_claim` (
  `internal_claim_id` int(11) NOT NULL,
  `claim_type_id` int(11) NOT NULL,
  `academic_year_id` int(11) NOT NULL,
  `degree_id` int(11) NOT NULL,
  `stud_id` varchar(20) NOT NULL,
  `project_title` varchar(255) NOT NULL,
  `rate` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL,
  `dept_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `internal_claim`
--

INSERT INTO `internal_claim` (`internal_claim_id`, `claim_type_id`, `academic_year_id`, `degree_id`, `stud_id`, `project_title`, `rate`, `amount`, `status`, `date_created`, `user_id`, `dept_id`) VALUES
(1, 1, 1, 1, '20254', 'claims management system', 1, 20, 2, '2022-09-10 08:36:31', 1, 1),
(2, 1, 1, 1, '5254', 'claim', 20, 20, 1, '2022-10-18 17:26:55', 1, 1),
(3, 0, 1, 1, '6524156', 'hyhjghbn', 20, 20, 1, '2022-10-18 17:27:24', 1, 2),
(4, 1, 1, 1, '6524156', 'hyhjghbn', 20, 20, 1, '2022-10-18 17:29:41', 1, 2),
(5, 1, 1, 1, '4859', 'gfrg', 20, 20, 1, '2022-10-18 21:17:19', 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `internal_claim_verification`
--

CREATE TABLE `internal_claim_verification` (
  `id` int(11) NOT NULL,
  `int_claim_id` int(11) NOT NULL,
  `academic_year_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `logged_in_user`
--

CREATE TABLE `logged_in_user` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `logged_in_user`
--

INSERT INTO `logged_in_user` (`id`, `user_id`, `date_time`) VALUES
(53, 7, '2022-10-19 15:54:06'),
(58, 3, '2022-10-19 16:24:20'),
(70, 9, '2022-10-21 13:40:27'),
(80, 1, '2022-10-26 17:31:55'),
(81, 8, '2022-10-26 17:33:00');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts_history`
--

CREATE TABLE `login_attempts_history` (
  `login_attempts_history_id` int(11) NOT NULL,
  `state` varchar(10) NOT NULL DEFAULT '0',
  `user_name` varchar(100) NOT NULL,
  `user_password` varchar(10) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login_attempts_history`
--

INSERT INTO `login_attempts_history` (`login_attempts_history_id`, `state`, `user_name`, `user_password`, `date_created`) VALUES
(1, 'fail', 'Roots', 'Root@12345', '2020-06-09 19:49:39'),
(2, 'fail', 'Administrator', 'Root@12345', '2020-06-09 19:49:50'),
(3, 'fail', 'Uew', 'Root@12345', '2020-06-09 19:51:05'),
(4, 'fail', 'UewRoot', 'Root@12345', '2020-06-09 19:51:11'),
(5, 'fail', 'Root', 'Root@12345', '2022-08-23 13:44:53'),
(6, 'fail', 'akwasiacheampong', 'Openfor4me', '2022-08-23 13:47:51'),
(7, 'fail', 'Root', 'password', '2022-08-23 18:32:01'),
(8, 'fail', 'root', 'password', '2022-09-27 13:58:01'),
(9, 'fail', 'root', 'password', '2022-09-27 13:59:11'),
(10, 'fail', 'Danny', '123456', '2022-10-19 15:53:08');

-- --------------------------------------------------------

--
-- Table structure for table `login_history`
--

CREATE TABLE `login_history` (
  `login_history_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `state` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login_history`
--

INSERT INTO `login_history` (`login_history_id`, `user_id`, `date_created`, `state`) VALUES
(1, 1, '2020-06-09 19:22:18', 'Logout'),
(2, 1, '2020-06-09 19:22:19', 'Login'),
(3, 1, '2020-06-09 19:49:25', 'Logout'),
(4, 1, '2020-06-09 19:49:27', 'Login'),
(5, 1, '2020-06-09 19:49:35', 'Logout'),
(6, 1, '2020-06-09 19:49:59', 'Login'),
(7, 3, '2020-06-09 19:50:14', 'Login'),
(8, 1, '2020-06-09 19:50:56', 'Logout'),
(9, 1, '2020-06-09 19:51:16', 'Login'),
(10, 3, '2020-06-10 00:27:39', 'Logout'),
(11, 1, '2020-06-10 00:27:42', 'Login'),
(12, 1, '2020-06-10 00:28:38', 'Login'),
(13, 1, '2022-08-22 11:02:36', 'Login'),
(14, 1, '2022-08-23 13:47:30', 'login'),
(15, 1, '2022-08-23 13:47:45', 'logout'),
(16, 1, '2022-08-23 13:48:05', 'login'),
(17, 1, '2022-08-23 14:15:48', 'Login'),
(18, 1, '2022-08-23 18:32:10', 'Login'),
(19, 1, '2022-08-27 12:20:23', 'Login'),
(20, 1, '2022-08-30 09:42:49', 'Login'),
(21, 1, '2022-08-30 19:06:52', 'Login'),
(22, 1, '2022-08-30 19:07:03', 'Login'),
(23, 1, '2022-09-01 09:35:00', 'Login'),
(24, 1, '2022-09-05 09:10:15', 'Login'),
(25, 1, '2022-09-10 07:58:02', 'Login'),
(26, 1, '2022-09-12 14:06:00', 'Login'),
(27, 1, '2022-09-19 11:02:32', 'Login'),
(28, 1, '2022-09-24 19:03:56', 'Login'),
(29, 1, '2022-09-27 13:59:31', 'Login'),
(30, 1, '2022-09-30 12:44:19', 'Login'),
(31, 1, '2022-10-04 09:26:30', 'Login'),
(32, 1, '2022-10-04 18:33:09', 'Login'),
(33, 7, '2022-10-04 19:33:09', 'Login'),
(34, 7, '2022-10-04 19:39:48', 'Login'),
(35, 7, '2022-10-04 19:40:19', 'Login'),
(36, 7, '2022-10-04 19:43:04', 'Login'),
(37, 7, '2022-10-04 19:43:09', 'Login'),
(38, 1, '2022-10-04 19:43:23', 'Login'),
(39, 1, '2022-10-06 19:09:12', 'Login'),
(40, 7, '2022-10-06 19:16:59', 'Login'),
(41, 1, '2022-10-06 20:04:16', 'Login'),
(42, 1, '2022-10-07 10:11:32', 'Login'),
(43, 7, '2022-10-07 10:23:10', 'Login'),
(44, 1, '2022-10-07 10:23:56', 'Login'),
(45, 1, '2022-10-07 10:24:07', 'Login'),
(46, 1, '2022-10-08 07:25:06', 'Login'),
(47, 1, '2022-10-10 05:50:37', 'Login'),
(48, 1, '2022-10-11 22:37:09', 'Login'),
(49, 1, '2022-10-17 15:26:21', 'Login'),
(50, 1, '2022-10-18 13:36:10', 'Login'),
(51, 1, '2022-10-18 16:46:13', 'Login'),
(52, 7, '2022-10-18 20:36:56', 'Login'),
(53, 1, '2022-10-18 20:37:18', 'Login'),
(54, 1, '2022-10-18 20:37:56', 'Login'),
(55, 7, '2022-10-18 20:38:21', 'Login'),
(56, 1, '2022-10-18 20:38:49', 'Login'),
(57, 7, '2022-10-18 20:39:21', 'Login'),
(58, 1, '2022-10-18 21:54:48', 'Login'),
(59, 1, '2022-10-19 15:52:55', 'Login'),
(60, 7, '2022-10-19 15:54:06', 'Login'),
(61, 1, '2022-10-19 15:55:09', 'Login'),
(62, 8, '2022-10-19 15:59:52', 'Login'),
(63, 1, '2022-10-19 16:03:54', 'Login'),
(64, 8, '2022-10-19 16:18:40', 'Login'),
(65, 3, '2022-10-19 16:24:20', 'Login'),
(66, 1, '2022-10-19 18:06:53', 'Login'),
(67, 8, '2022-10-20 09:59:52', 'Login'),
(68, 1, '2022-10-20 16:25:05', 'Login'),
(69, 1, '2022-10-20 16:56:26', 'Login'),
(70, 8, '2022-10-20 16:56:35', 'Login'),
(71, 1, '2022-10-20 17:05:57', 'Login'),
(72, 8, '2022-10-21 13:02:29', 'Login'),
(73, 1, '2022-10-21 13:07:26', 'Login'),
(74, 8, '2022-10-21 13:28:09', 'Login'),
(75, 9, '2022-10-21 13:30:33', 'Login'),
(76, 8, '2022-10-21 13:39:19', 'Login'),
(77, 9, '2022-10-21 13:40:27', 'Login'),
(78, 8, '2022-10-24 18:56:23', 'Login'),
(79, 8, '2022-10-24 19:07:46', 'Login'),
(80, 8, '2022-10-26 16:10:09', 'Login'),
(81, 1, '2022-10-26 16:11:00', 'Login'),
(82, 8, '2022-10-26 16:13:34', 'Login'),
(83, 1, '2022-10-26 16:14:03', 'Login'),
(84, 8, '2022-10-26 16:14:55', 'Login'),
(85, 1, '2022-10-26 17:16:40', 'Login'),
(86, 8, '2022-10-26 17:17:06', 'Login'),
(87, 1, '2022-10-26 17:31:55', 'Login'),
(88, 8, '2022-10-26 17:33:00', 'Login');

-- --------------------------------------------------------

--
-- Table structure for table `payhead`
--

CREATE TABLE `payhead` (
  `payhead_id` int(11) NOT NULL,
  `claim_header_id` int(11) NOT NULL,
  `claim_type_id` int(11) NOT NULL,
  `item` varchar(50) NOT NULL,
  `degree_type_id` int(11) DEFAULT NULL,
  `rate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payhead`
--

INSERT INTO `payhead` (`payhead_id`, `claim_header_id`, `claim_type_id`, `item`, `degree_type_id`, `rate`) VALUES
(1, 2, 1, '', 1, 20),
(2, 2, 2, '', 1, 200),
(3, 1, 2, '', 1, 80),
(4, 3, 2, '20', 1, 20);

-- --------------------------------------------------------

--
-- Table structure for table `program`
--

CREATE TABLE `program` (
  `prog_id` int(11) NOT NULL,
  `prog_name` varchar(500) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `qual_level` varchar(255) NOT NULL,
  `faculty_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `program`
--

INSERT INTO `program` (`prog_id`, `prog_name`, `dept_id`, `qual_level`, `faculty_id`) VALUES
(1, 'ICT', 1, 'Degree', 10),
(2, 'Maths', 2, 'Degree', 10),
(3, 'Poli Science', 4, 'Degree', 11),
(4, 'Human Resouce Managment', 7, 'Degree', 12),
(5, 'Linguistics', 8, 'Degree', 13),
(6, 'Telecom', 10, 'Degree', 14);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `role_name`) VALUES
(1, 'Root'),
(2, 'Admin'),
(3, 'Head Of Department'),
(4, 'Lecturer'),
(11, 'Accountant');

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

CREATE TABLE `semester` (
  `semester_id` int(11) NOT NULL,
  `semester` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `semester`
--

INSERT INTO `semester` (`semester_id`, `semester`) VALUES
(1, 2),
(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `stud_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  `faculty_id` int(11) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `academic_year_id` int(11) NOT NULL,
  `staff_id` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` int(20) NOT NULL,
  `default_pass_change` tinyint(1) NOT NULL,
  `date_created` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`stud_id`, `name`, `user_name`, `user_password`, `faculty_id`, `dept_id`, `role_id`, `academic_year_id`, `staff_id`, `email`, `phone`, `default_pass_change`, `date_created`) VALUES
(1, 'Godfred', 'Abeiku', 'Mills', 10, 1, 1, 1, '5151570056', '', 0, 0, '2020-06-07'),
(2, 'Enock', '', 'Ofori', 10, 1, 1, 1, '5151570042', '', 0, 0, '2020-06-07'),
(3, 'Emmanuel', '', 'Osei', 11, 4, 3, 2, '5151570001', '', 0, 0, '2020-06-07'),
(4, 'John', '', 'Doe', 12, 7, 4, 5, '5161570006', '', 0, 0, '2020-06-07'),
(5, 'Jane', '', 'Doe', 11, 4, 3, 2, '200004465', '', 0, 0, '2020-06-07');

-- --------------------------------------------------------

--
-- Table structure for table `system_permission`
--

CREATE TABLE `system_permission` (
  `system_permission_id` int(11) NOT NULL,
  `user_action` varchar(255) NOT NULL,
  `action_link` text NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `group_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_permission`
--

INSERT INTO `system_permission` (`system_permission_id`, `user_action`, `action_link`, `display_name`, `group_number`) VALUES
(1, 'manage_academic_year', '<li>\r\n                                        <a href=\"academic_year.php\" style=\"color:#ffffff\" title=\"  Academic Year\" data-filter-tags=\"application intel analytics dashboard\">\r\n                                        <i class=\"fal fa-pencil\" style=\"color:#ffffff\"></i>\r\n                                            <span class=\"nav-link-text\" data-i18n=\"nav.application_intel_analytics_dashboard\">  Academic Year</span>\r\n                                        </a>\r\n                                    </li>', 'Manage Academic Year', 1),
(2, 'manage_faculty', '<li>\r\n                                        <a href=\"faculty.php\" style=\"color:#ffffff\" title=\"  Faculty\" data-filter-tags=\"application intel analytics dashboard\">\r\n                                        <i class=\"fal fa-pencil\" style=\"color:#ffffff\"></i>\r\n                                            <span class=\"nav-link-text\" data-i18n=\"nav.application_intel_analytics_dashboard\">Faculty</span>\r\n                                        </a>\r\n                                    </li>', 'Manage Faculty', 1),
(3, 'manage_department', '<li>\r\n                                        <a href=\"department.php\" style=\"color:#ffffff\" title=\"  Department\" data-filter-tags=\"application intel analytics dashboard\">\r\n                                        <i class=\"fal fa-pencil\" style=\"color:#ffffff\"></i>\r\n                                            <span class=\"nav-link-text\" data-i18n=\"nav.application_intel_analytics_dashboard\">  Department</span>\r\n                                        </a>\r\n                                    </li>', 'Manage Department', 1),
(4, 'manage_program', '<li>\r\n                                        <a href=\"program.php\" style=\"color:#ffffff\" title=\"  Program\" data-filter-tags=\"application intel analytics dashboard\">\r\n                                        <i class=\"fal fa-pencil\" style=\"color:#ffffff\"></i>\r\n                                            <span class=\"nav-link-text\" data-i18n=\"nav.application_intel_analytics_dashboard\">  Program</span>\r\n                                        </a>\r\n                                    </li>', 'Manage Program', 1),
(5, 'manage_student', '<li>\r\n                                        <a href=\"student.php\" title=\"Student\" style=\"color:#ffffff\" data-filter-tags=\"application intel analytics dashboard\">\r\n                                        <i class=\"fal fa-pencil\" style=\"color:#ffffff\"></i>\r\n                                            <span class=\"nav-link-text\" data-i18n=\"nav.application_intel_analytics_dashboard\">  Student</span>\r\n                                        </a>\r\n                                    </li>', 'Manage Student', 1),
(6, 'manage_role', ' <li>\r\n                                        <a href=\"role.php\" title=\"User\" style=\"color:#ffffff\" data-filter-tags=\"application intel analytics dashboard\">\r\n                                        <i class=\"fal fa-pencil\" style=\"color:#ffffff\"></i>\r\n                                            <span class=\"nav-link-text\" data-i18n=\"nav.application_intel_analytics_dashboard\">  Role</span>\r\n                                        </a>\r\n                                    </li>', 'Manage Role', 1),
(7, 'excess_script_marking_claim', '<li>\r\n                                <a href=\"claim.php\" style=\"color:#ffffff\" title=\"Log Claim\" data-filter-tags=\"application intel analytics dashboard\">\r\n                                <i class=\"fal fa-pen\" style=\"color:#ffffff\"></i>\r\n                                    <span class=\"nav-link-text\" data-i18n=\"nav.application_intel_analytics_dashboard\">Log Excess Script Marking Claim</span>\r\n                                </a>\r\n                            </li>', 'Excess Script Marking Claim', 3),
(9, 'dashboard', '<li>\r\n                                <a href=\"dashboard.php\" style=\"color:#ffffff\" title=\"Issue Certificate\" data-filter-tags=\"application intel analytics dashboard\">\r\n                                <i class=\"fal fa-chart-area\" style=\"color:#ffffff\"></i>\r\n                                    <span class=\"nav-link-text\" data-i18n=\"nav.application_intel_analytics_dashboard\">Dashboard</span>\r\n                                </a>\r\n                            </li>', 'Dashboard', 0),
(10, 'manage_user', '<li> <a href=\"users.php\" style=\"color:#ffffff\" title=\"  User\" data-filter-tags=\"application intel analytics dashboard\"> <i class=\"fal fa-pencil\" style=\"color:#ffffff\"></i> <span class=\"nav-link-text\" data-i18n=\"nav.application_intel_analytics_dashboard\">  User</span> </a> </li>', 'Manage User', 1),
(11, 'manage_permission', ' <li>\r\n                                        <a href=\"permission.php\" style=\"color:#ffffff\" title=\"  User\" data-filter-tags=\"application intel analytics dashboard\">\r\n                                        <i class=\"fal fa-pencil\" style=\"color:#ffffff\"></i>\r\n                                            <span class=\"nav-link-text\" data-i18n=\"nav.application_intel_analytics_dashboard\">  Permission</span>\r\n                                        </a>\r\n                                    </li>', 'Manage Permission', 1),
(12, 'view_excess_scripts_claims_report', '<li>\r\n                                        <a href=\"claim_added_report.php\" style=\"color:#ffffff\" title=\"claims report\" data-filter-tags=\"application intel analytics dashboard\">\r\n                                        <i class=\"fal fa-chart-area\" style=\"color:#ffffff\"></i>\r\n                                            <span class=\"nav-link-text\" data-i18n=\"nav.application_intel_analytics_dashboard\">Excess Scripts Claims Report</span>\r\n                                        </a>\r\n                                    </li>', 'Excess Scripts Claims Report', 2),
(13, 'view_internal_supervision_claim_report', '<li>\r\n                                        <a href=\"internal_claim_report.php\" style=\"color:#ffffff\" title=\"claim\" data-filter-tags=\"application intel analytics dashboard\">\r\n                                        <i class=\"fal fa-chart-area\" style=\"color:#ffffff\"></i>\r\n                                            <span class=\"nav-link-text\" data-i18n=\"nav.application_intel_analytics_dashboard\">Internal Supervision Claims Report</span>\r\n                                        </a>\r\n                                    </li>', 'Internal Supervision Claims Report', 2),
(14, 'view_claim_pending', '<li>\r\n                                        <a href=\"claim_pending_report.php\" style=\"color:#ffffff\" title=\"  Claims Report\" data-filter-tags=\"application intel analytics dashboard\">\r\n                                        <i class=\"fal fa-chart-area\" style=\"color:#ffffff\"></i>\r\n                                            <span class=\"nav-link-text\" data-i18n=\"nav.application_intel_analytics_dashboard\">Claim Pending Aprroval</span>\r\n                                        </a>\r\n                                    </li>', 'Claims Pending Approval', 2),
(15, 'view_user_logs', '<li>\r\n                                        <a href=\"user_logs.php\" style=\"color:#ffffff\" title=\"  User Logs\" data-filter-tags=\"application intel analytics dashboard\">\r\n                                        <i class=\"fal fa-chart-area\" style=\"color:#ffffff\"></i>\r\n                                            <span class=\"nav-link-text\" data-i18n=\"nav.application_intel_analytics_dashboard\">  User Logs</span>\r\n                                        </a>\r\n                                    </li>', 'User Logs', 2),
(17, 'view_verification_history', '<li>\r\n                                        <a href=\"certificate_verification_report.php\" style=\"color:#ffffff\" title=\"Verification History\" data-filter-tags=\"application intel analytics dashboard\">\r\n                                        <i class=\"fal fa-chart-area\" style=\"color:#ffffff\"></i>\r\n                                            <span class=\"nav-link-text\" data-i18n=\"nav.application_intel_analytics_dashboard\"> Verification History</span>\r\n                                        </a>\r\n                                    </li>', 'Verification History', 2),
(18, 'manage semester', '<li>\r\n                                        <a href=\"semester.php\" style=\"color:#ffffff\" title=\" Semester\" data-filter-tags=\"application intel analytics dashboard\">\r\n                                        <i class=\"fal fa-pencil\" style=\"color:#ffffff\"></i>\r\n                                            <span class=\"nav-link-text\" data-i18n=\"nav.application_intel_analytics_dashboard\">  Semester</span>\r\n                                        </a>\r\n                                    </li>', 'Manage Semester', 1),
(19, 'manage payhead', '<li>\r\n                                        <a href=\"payhead.php\" style=\"color:#ffffff\" title=\"Payhead\" data-filter-tags=\"application intel analytics dashboard\">\r\n                                        <i class=\"fal fa-pencil\" style=\"color:#ffffff\"></i>\r\n                                            <span class=\"nav-link-text\" data-i18n=\"nav.application_intel_analytics_dashboard\">  Payhead</span>\r\n                                        </a>\r\n                                    </li>', 'Manage Payhead', 1),
(20, 'manage course', '<li>\r\n                                        <a href=\"course.php\" style=\"color:#ffffff\" title=\"Course\" data-filter-tags=\"application intel analytics dashboard\">\r\n                                        <i class=\"fal fa-pencil\" style=\"color:#ffffff\"></i>\r\n                                            <span class=\"nav-link-text\" data-i18n=\"nav.application_intel_analytics_dashboard\">  Course</span>\r\n                                        </a>\r\n                                    </li>', 'Manage Course', 1),
(21, 'manage claim header', '<li>\r\n                                        <a href=\"claim_header.php\" style=\"color:#ffffff\" title=\"  claim header\" data-filter-tags=\"application intel analytics dashboard\">\r\n                                        <i class=\"fal fa-pencil\" style=\"color:#ffffff\"></i>\r\n                                            <span class=\"nav-link-text\" data-i18n=\"nav.application_intel_analytics_dashboard\">  Claim Header</span>\r\n                                        </a>\r\n                                    </li>', 'Manage Claim Header', 1),
(22, 'manage claim type', '<li>\r\n                                        <a href=\"claim_type.php\" style=\"color:#ffffff\" title=\"  claim type\" data-filter-tags=\"application intel analytics dashboard\">\r\n                                        <i class=\"fal fa-pencil\" style=\"color:#ffffff\"></i>\r\n                                            <span class=\"nav-link-text\" data-i18n=\"nav.application_intel_analytics_dashboard\">  Claim Type</span>\r\n                                        </a>\r\n                                    </li>', 'Manage Claim Type', 1),
(23, 'manage degree type', '<li>\r\n                                        <a href=\"degree.php\" style=\"color:#ffffff\" title=\"Degree Type\" data-filter-tags=\"application intel analytics dashboard\">\r\n                                        <i class=\"fal fa-pencil\" style=\"color:#ffffff\"></i>\r\n                                            <span class=\"nav-link-text\" data-i18n=\"nav.application_intel_analytics_dashboard\">  Degree </span>\r\n                                        </a>\r\n                                    </li>', 'Manage Degree Type', 1),
(24, 'internal_supervision_claim', '<li>\r\n                                <a href=\"internal_sup_claim.php\" style=\"color:#ffffff\" title=\"Log Claim\" data-filter-tags=\"application intel analytics dashboard\">\r\n                                <i class=\"fal fa-pen\" style=\"color:#ffffff\"></i>\r\n                                    <span class=\"nav-link-text\" data-i18n=\"nav.application_intel_analytics_dashboard\">Log Internal Supervision Claim</span>\r\n                                </a>', 'Internal Supervision Claim', 3),
(25, 'external_supervision_claim', '<li>\r\n                                <a href=\"external_sup_claim.php\" style=\"color:#ffffff\" title=\"Log Claim\" data-filter-tags=\"application intel analytics dashboard\">\r\n                                <i class=\"fal fa-pen\" style=\"color:#ffffff\"></i>\r\n                                    <span class=\"nav-link-text\" data-i18n=\"nav.application_intel_analytics_dashboard\">Log External Supervision Claim</span>\r\n                                </a>', 'External Supervision Claim', 3),
(26, 'HOD_Internal_sup_claim', '<li>\r\n                                <a href=\"hod_internal_sup_claim.php\" style=\"color:#ffffff\" title=\"Log Claim\" data-filter-tags=\"application intel analytics dashboard\">\r\n                                <i class=\"fal fa-dot-circle-o\" style=\"color:#ffffff\"></i>\r\n                                    <span class=\"nav-link-text\" data-i18n=\"nav.application_intel_analytics_dashboard\">Internal Supervision Claim</span>\r\n                                </a>', 'HOD Internal Supervision Claim', 4),
(27, 'account_internal_sup_claim', '<li>\r\n                                <a href=\"acc_internal_sup_claim.php\" style=\"color:#ffffff\" title=\"Log Claim\" data-filter-tags=\"application intel analytics dashboard\">\r\n                                <i class=\"fal fa-pen\" style=\"color:#ffffff\"></i>\r\n                                    <span class=\"nav-link-text\" data-i18n=\"nav.application_intel_analytics_dashboard\">Internal Supervision Claim</span>\r\n                                </a>', 'Accountant Internal Supervision Claim', 5),
(28, 'HOD_excess_script_marking_claims', '<li>\r\n                                <a href=\"hod_excess_review.php\" style=\"color:#ffffff\" title=\"Log Claim\" data-filter-tags=\"application intel analytics dashboard\">\r\n                                <i class=\"fal fa-dot-circle-o\" style=\"color:#ffffff\"></i>\r\n                                    <span class=\"nav-link-text\" data-i18n=\"nav.application_intel_analytics_dashboard\">HOD Excess Script Marking Claim Review</span>\r\n                                </a>', 'HOD Excess Script Marking Claims Review', 4),
(29, 'accountant_excess_script_marking_claims', '<li>\r\n                                <a href=\"acc_excess_review.php\" style=\"color:#ffffff\" title=\"Log Claim\" data-filter-tags=\"application intel analytics dashboard\">\r\n                                <i class=\"fal fa-dot-circle-o\" style=\"color:#ffffff\"></i>\r\n                                    <span class=\"nav-link-text\" data-i18n=\"nav.application_intel_analytics_dashboard\">Accountant Excess Script Marking Claim Review</span>\r\n                                </a>', 'Accountant Excess Script Marking Claims Review', 5);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(40) NOT NULL,
  `user_password` varchar(32) NOT NULL,
  `role_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `staff_id` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `bank_id` int(11) NOT NULL,
  `faculty_id` int(11) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `phone` int(50) NOT NULL,
  `default_pass_changed` tinyint(1) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `user_password`, `role_id`, `name`, `staff_id`, `email`, `bank_id`, `faculty_id`, `dept_id`, `phone`, `default_pass_changed`, `date_created`) VALUES
(1, 'Root', 'Root@12345', 1, 'Daniel Danso Essel', '12354', 'emai@email.com', 0, 12, 1, 2485, 0, '2022-08-22 11:22:09'),
(2, 'Admin', 'Admin@me', 2, 'Godfred Mills', '25565', 'Admin@me', 0, 10, 2, 248565, 0, '2022-08-22 11:22:09'),
(3, 'Anoq', '12345', 3, 'Enock Ofori', '4665412', 'akwasi@akwasi.com', 0, 15, 5, 24582625, 0, '2022-08-22 11:22:09'),
(7, 'nti', 'Root@12345', 3, 'semester_id Nti', '5465', 'akwasidehaan@gmail.com', 0, 10, 1, 242623557, 0, '2022-10-04 19:16:39'),
(8, 'Mr. Ben', '123456', 4, 'Benedict Yaw', '231600', 'adjeibenedict140@gmail.com', 0, 10, 1, 558353202, 0, '2022-10-19 15:59:37'),
(9, 'Mr. Sam', '12345', 11, 'Samuel Osei', '20000', 'samosei@gmail.com', 0, 10, 1, 558353202, 0, '2022-10-21 13:16:57');

-- --------------------------------------------------------

--
-- Table structure for table `user_permission`
--

CREATE TABLE `user_permission` (
  `permission_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `system_permission_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_permission`
--

INSERT INTO `user_permission` (`permission_id`, `role_id`, `system_permission_id`, `user_id`) VALUES
(63, 2, 1, 0),
(64, 2, 2, 0),
(65, 2, 3, 0),
(66, 2, 4, 0),
(67, 2, 5, 0),
(68, 2, 7, 0),
(69, 2, 8, 0),
(70, 2, 9, 0),
(71, 2, 12, 0),
(72, 2, 13, 0),
(73, 2, 14, 0),
(197, 1, 1, 0),
(198, 1, 2, 0),
(199, 1, 3, 0),
(200, 1, 4, 0),
(201, 1, 5, 0),
(202, 1, 6, 0),
(203, 1, 7, 0),
(204, 1, 8, 0),
(205, 1, 9, 0),
(206, 1, 10, 0),
(207, 1, 11, 0),
(208, 1, 12, 0),
(209, 1, 13, 0),
(210, 1, 14, 0),
(211, 1, 15, 0),
(212, 1, 16, 0),
(213, 1, 17, 0),
(214, 1, 18, 0),
(215, 1, 19, 0),
(216, 1, 20, 0),
(217, 1, 21, 0),
(218, 1, 22, 0),
(219, 1, 23, 0),
(220, 1, 24, 0),
(221, 1, 25, 0),
(222, 1, 26, 0),
(223, 1, 27, 0),
(224, 1, 28, 0),
(225, 1, 29, 0),
(233, 3, 7, 0),
(234, 3, 9, 0),
(235, 3, 28, 0),
(236, 3, 24, 0),
(237, 3, 26, 0),
(238, 4, 7, 0),
(239, 4, 9, 0),
(240, 4, 15, 0),
(241, 4, 24, 0),
(242, 4, 25, 0),
(243, 11, 9, 0),
(244, 11, 14, 0),
(245, 11, 15, 0),
(246, 11, 19, 0),
(247, 11, 27, 0),
(248, 11, 29, 0);

-- --------------------------------------------------------

--
-- Table structure for table `verification_history`
--

CREATE TABLE `verification_history` (
  `verification_history_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cert_id` int(11) NOT NULL,
  `is_index_number` int(11) NOT NULL DEFAULT 0,
  `is_name` int(11) NOT NULL DEFAULT 0,
  `is_serial` int(11) NOT NULL DEFAULT 0,
  `valid` int(11) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `verification_history`
--

INSERT INTO `verification_history` (`verification_history_id`, `user_id`, `cert_id`, `is_index_number`, `is_name`, `is_serial`, `valid`, `date_created`) VALUES
(1, 1, 2, 1, 0, 0, 0, '2020-06-10 02:11:42'),
(2, 1, 2, 0, 0, 1, 0, '2020-06-10 02:38:48'),
(3, 1, 1, 0, 1, 0, 1, '2020-06-10 02:41:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic_year`
--
ALTER TABLE `academic_year`
  ADD PRIMARY KEY (`academic_year_id`);

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`bank_id`);

--
-- Indexes for table `certificate`
--
ALTER TABLE `certificate`
  ADD PRIMARY KEY (`cert_id`),
  ADD KEY `academic_year_constraint` (`academic_yr`);

--
-- Indexes for table `claims`
--
ALTER TABLE `claims`
  ADD PRIMARY KEY (`claim_id`);

--
-- Indexes for table `claim_header`
--
ALTER TABLE `claim_header`
  ADD PRIMARY KEY (`claim_header_id`);

--
-- Indexes for table `claim_type_table`
--
ALTER TABLE `claim_type_table`
  ADD PRIMARY KEY (`claim_type_id`);

--
-- Indexes for table `collection`
--
ALTER TABLE `collection`
  ADD PRIMARY KEY (`collection_id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `degree_type_table`
--
ALTER TABLE `degree_type_table`
  ADD PRIMARY KEY (`degree_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`dept_id`),
  ADD KEY `faculty_id` (`faculty_id`);

--
-- Indexes for table `excess_marking`
--
ALTER TABLE `excess_marking`
  ADD PRIMARY KEY (`ex_id`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`faculty_id`);

--
-- Indexes for table `internal_claim`
--
ALTER TABLE `internal_claim`
  ADD PRIMARY KEY (`internal_claim_id`);

--
-- Indexes for table `internal_claim_verification`
--
ALTER TABLE `internal_claim_verification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logged_in_user`
--
ALTER TABLE `logged_in_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_attempts_history`
--
ALTER TABLE `login_attempts_history`
  ADD PRIMARY KEY (`login_attempts_history_id`);

--
-- Indexes for table `login_history`
--
ALTER TABLE `login_history`
  ADD PRIMARY KEY (`login_history_id`);

--
-- Indexes for table `payhead`
--
ALTER TABLE `payhead`
  ADD PRIMARY KEY (`payhead_id`);

--
-- Indexes for table `program`
--
ALTER TABLE `program`
  ADD PRIMARY KEY (`prog_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`semester_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`stud_id`);

--
-- Indexes for table `system_permission`
--
ALTER TABLE `system_permission`
  ADD PRIMARY KEY (`system_permission_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_permission`
--
ALTER TABLE `user_permission`
  ADD PRIMARY KEY (`permission_id`);

--
-- Indexes for table `verification_history`
--
ALTER TABLE `verification_history`
  ADD PRIMARY KEY (`verification_history_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academic_year`
--
ALTER TABLE `academic_year`
  MODIFY `academic_year_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `bank`
--
ALTER TABLE `bank`
  MODIFY `bank_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `certificate`
--
ALTER TABLE `certificate`
  MODIFY `cert_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `claims`
--
ALTER TABLE `claims`
  MODIFY `claim_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `claim_header`
--
ALTER TABLE `claim_header`
  MODIFY `claim_header_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `claim_type_table`
--
ALTER TABLE `claim_type_table`
  MODIFY `claim_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `collection`
--
ALTER TABLE `collection`
  MODIFY `collection_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `degree_type_table`
--
ALTER TABLE `degree_type_table`
  MODIFY `degree_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `dept_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `excess_marking`
--
ALTER TABLE `excess_marking`
  MODIFY `ex_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `faculty_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `internal_claim`
--
ALTER TABLE `internal_claim`
  MODIFY `internal_claim_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `internal_claim_verification`
--
ALTER TABLE `internal_claim_verification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logged_in_user`
--
ALTER TABLE `logged_in_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `login_attempts_history`
--
ALTER TABLE `login_attempts_history`
  MODIFY `login_attempts_history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `login_history`
--
ALTER TABLE `login_history`
  MODIFY `login_history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `payhead`
--
ALTER TABLE `payhead`
  MODIFY `payhead_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `program`
--
ALTER TABLE `program`
  MODIFY `prog_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `semester`
--
ALTER TABLE `semester`
  MODIFY `semester_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `stud_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `system_permission`
--
ALTER TABLE `system_permission`
  MODIFY `system_permission_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user_permission`
--
ALTER TABLE `user_permission`
  MODIFY `permission_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=249;

--
-- AUTO_INCREMENT for table `verification_history`
--
ALTER TABLE `verification_history`
  MODIFY `verification_history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `certificate`
--
ALTER TABLE `certificate`
  ADD CONSTRAINT `academic_year_constraint` FOREIGN KEY (`academic_yr`) REFERENCES `academic_year` (`academic_year_id`);

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `faculty_id` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`faculty_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
