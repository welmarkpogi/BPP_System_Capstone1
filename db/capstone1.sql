-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 03, 2024 at 07:02 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `capstone1`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `thumbnail` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`id`, `title`, `content`, `thumbnail`, `created_at`, `updated_at`, `deleted_at`) VALUES
(42, 'Update', 'Way Office ugma kay holiday', '20241103063643173061220367270beb555b6.jpg', '2024-11-03 05:36:43', NULL, NULL),
(43, 'Sample', 'Sample ra mo gana ba ang vedio eyyy', '20241103063842173061232267270c629dfdc.jpg', '2024-11-03 05:38:42', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `certificates`
--

CREATE TABLE `certificates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `url` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `certificates`
--

INSERT INTO `certificates` (`id`, `name`, `url`) VALUES
(1, 'Barangay Certificate', 'generate_brgy_cert.php'),
(2, 'Cutting Permit', 'generate_cuttingpermit.php'),
(3, '4ps Certification', 'generate_fpscert.php'),
(4, 'Certificate of Indigency', 'generate_indi_cert.php'),
(5, 'Business Clearance', 'generate_business_permit.php'),
(6, 'Cutting Permit', 'generate_cuttingpermit.php');

-- --------------------------------------------------------

--
-- Table structure for table `certificate_requests`
--

CREATE TABLE `certificate_requests` (
  `id` int(10) UNSIGNED NOT NULL,
  `resident_id` int(10) UNSIGNED NOT NULL,
  `payment_id` int(10) UNSIGNED DEFAULT NULL,
  `certificate_id` int(10) UNSIGNED NOT NULL,
  `status` enum('resolved','rejected','pending') NOT NULL DEFAULT 'pending',
  `memo` varchar(100) DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`data`)),
  `url` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `resident_id` int(10) UNSIGNED DEFAULT NULL,
  `details` varchar(100) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `mode` enum('online','cash') NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `user_id`, `resident_id`, `details`, `amount`, `mode`, `created_at`, `updated_at`, `deleted_at`) VALUES
(6, 11, 1, 'Barangay Clearance Payment', '200.00', 'online', '2022-05-22 09:35:30', NULL, NULL),
(7, 11, 1, 'Certificate of Indigency Payment', '200.00', 'online', '2022-05-22 09:52:50', NULL, NULL),
(8, 11, 1, 'Certificate of Indigency Payment', '2.00', 'online', '2022-05-22 09:53:39', NULL, NULL),
(9, 11, 6, 'Business Permit Payment', '2.00', 'online', '2022-05-22 10:23:47', NULL, NULL),
(10, 11, 2, '4PS Certification Payment', '21.00', 'online', '2022-05-22 10:34:12', NULL, NULL),
(11, 11, 13, 'Barangay Clearance Payment', '12.00', 'online', '2022-05-22 12:56:10', NULL, NULL),
(12, 11, 13, 'Barangay Clearance Payment', '12.00', 'online', '2022-05-22 12:56:26', NULL, NULL),
(13, 11, 13, 'Barangay Clearance Payment', '12.00', 'online', '2022-05-22 12:56:36', NULL, NULL),
(14, 11, 1, 'Cutting Permit Payment', '123.00', 'online', '2022-05-22 13:04:13', NULL, NULL),
(15, 11, 9, 'Barangay Clearance Payment', '222.00', 'online', '2022-05-24 15:38:50', NULL, NULL),
(16, 11, 9, 'Barangay Clearance Payment', '12.00', 'online', '2022-05-24 15:40:10', NULL, NULL),
(17, 11, 9, 'Business Permit Payment', '12312.00', 'online', '2022-06-03 15:31:50', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `purok`
--

CREATE TABLE `purok` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `details` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `purok`
--

INSERT INTO `purok` (`id`, `name`, `details`) VALUES
(1, 'Purok 1', 'Camolinas'),
(2, 'Purok 2', 'Atabay'),
(3, 'Purok 3', 'Puso'),
(4, 'Purok 4', 'Caumbay'),
(5, 'Purok 5', 'Kasadya'),
(6, 'Purok 6', 'Kalan'),
(7, 'Purok 7', 'Housing'),
(8, 'Purok 8', 'Ubos'),
(9, 'Purok 9', 'Sambagan');

-- --------------------------------------------------------

--
-- Table structure for table `residents`
--

CREATE TABLE `residents` (
  `id` int(10) UNSIGNED NOT NULL,
  `national_id` varchar(100) DEFAULT NULL,
  `account_id` int(10) UNSIGNED NOT NULL,
  `citizenship` varchar(50) DEFAULT NULL,
  `picture` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `firstname` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `middlename` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `lastname` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `alias` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  `birthplace` varchar(80) CHARACTER SET utf8mb4 DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `civilstatus` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  `gender` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  `purok_id` int(10) UNSIGNED NOT NULL,
  `voterstatus` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  `identified_as` varchar(30) CHARACTER SET utf8mb4 DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `occupation` varchar(100) DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `resident_type` int(11) DEFAULT 1,
  `is_4ps` tinyint(1) DEFAULT 0,
  `is_pwd` tinyint(1) DEFAULT 0,
  `is_senior` tinyint(1) DEFAULT 0,
  `remarks` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `residents`
--

INSERT INTO `residents` (`id`, `national_id`, `account_id`, `citizenship`, `picture`, `firstname`, `middlename`, `lastname`, `alias`, `birthplace`, `birthdate`, `age`, `civilstatus`, `gender`, `purok_id`, `voterstatus`, `identified_as`, `phone`, `email`, `occupation`, `address`, `resident_type`, `is_4ps`, `is_pwd`, `is_senior`, `remarks`, `created_at`, `updated_at`, `deleted_at`) VALUES
(16, '123', 107, 'filipino', NULL, 'Welmark', 'Centillas', 'Sevellita', 'Migs', 'Caumbay Cordova', '2024-11-03', 1, 'Single', 'Male', 3, 'Yes', NULL, '123456', 'welmarksevellita@gmail.com', 'Student', 'Caumbay', 1, 0, 1, 0, NULL, '2024-11-03 05:23:34', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblblotter`
--

CREATE TABLE `tblblotter` (
  `id` int(11) NOT NULL,
  `complainant` varchar(100) DEFAULT NULL,
  `respondent` varchar(100) DEFAULT NULL,
  `victim` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `details` varchar(10000) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblblotter`
--

INSERT INTO `tblblotter` (`id`, `complainant`, `respondent`, `victim`, `type`, `location`, `date`, `time`, `details`, `status`) VALUES
(10, 'Joe Rizal', 'Nora Selos', 'Joe Rizal', 'Amicable', 'Pob 1 Catbalogan, Samar', '2020-11-02', '00:30:00', ' Sustento sa Anaak ', 'Scheduled'),
(19, 'Girl Topak', 'Boy Topak', 'Girl Topak', 'Incident', 'Manila', '2021-01-13', '11:11:00', 'Mga Topakin na Pamilya', 'Active'),
(26, 'baliw', 'luka', 'marites', 'Amicable', 'Looc', '2021-04-30', '13:09:00', 'Donec sollicitudin molestie malesuada. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Sed porttitor lectus nibh. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula.', 'Settled'),
(27, 'Ian', 'annie may', 'Riza', 'Amicable', 'Arado City', '2022-04-18', '15:59:00', 'Gin Suntok', 'Scheduled');

-- --------------------------------------------------------

--
-- Table structure for table `tblbrgy_info`
--

CREATE TABLE `tblbrgy_info` (
  `id` int(11) NOT NULL,
  `province` varchar(100) DEFAULT NULL,
  `town` varchar(100) DEFAULT NULL,
  `brgy_name` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `text` text DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `city_logo` varchar(100) DEFAULT NULL,
  `brgy_logo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblbrgy_info`
--

INSERT INTO `tblbrgy_info` (`id`, `province`, `town`, `brgy_name`, `number`, `text`, `image`, `city_logo`, `brgy_logo`) VALUES
(1, 'Cebu', 'Cordova', 'Barangay Poblacion', '0919-4567893', 'Location of Poblacion, Cordova, Cebu, Philippines\r\nPoblacion is one of the Barangays of Cordova.\r\nCordova is in the Province of Cebu\r\nThe province of Cebu is in Region 7 “ Central Visayas.\r\nHistory of Poblacion, Cordova, Cebu, Philippines\r\nContribute your knowledge about the history of Poblacion\r\n\r\nPeople of Poblacion, Cordova, Cebu, Philippines\r\nTotal Population of Poblacion\r\n\r\nElected Government Officials of Poblacion, Cordova, Cebu, Philippines\r\nRepublic Act No. 11462 Approved: 03 December 2019: \r\nThat the barangay and sangguniang kabataan elections on the second Monday of May 2020 shall be postponed to December 5, 2022. The elected barangay officials as of May 14, 2018 will serve until December of 2022.', '03112024061056BPC-Logo.jpg', '03112024061056BPC-Logo.jpg', '03112024061056BPC-Logo.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tblchairmanship`
--

CREATE TABLE `tblchairmanship` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblchairmanship`
--

INSERT INTO `tblchairmanship` (`id`, `title`) VALUES
(2, 'Presiding Officer'),
(3, 'Committee on Appropriation'),
(4, 'Committee on Peace & Order'),
(5, 'Committee on Health'),
(6, 'Committee on Education'),
(7, 'Committee on Rules'),
(8, 'Committee on Infrastructure '),
(9, 'Committee on Solid Waste'),
(10, 'Committee on Sports'),
(11, 'No Chairmanship');

-- --------------------------------------------------------

--
-- Table structure for table `tbldocuments`
--

CREATE TABLE `tbldocuments` (
  `no` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `requested_documents` varchar(50) DEFAULT NULL,
  `purpose` varchar(50) DEFAULT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbldocuments`
--

INSERT INTO `tbldocuments` (`no`, `name`, `email`, `number`, `requested_documents`, `purpose`, `date`) VALUES
(1, 'amar', 'amar@gmail.com', 910201645, 'certificate', 'school', '2022-04-20 06:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tblfpscert`
--

CREATE TABLE `tblfpscert` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `current_location` varchar(100) DEFAULT NULL,
  `applied` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblfpscert`
--

INSERT INTO `tblfpscert` (`id`, `name`, `current_location`, `applied`) VALUES
(1, 'RENATO R. ALMO', 'Metro Manila', '2022-04-15'),
(2, 'Annie May Barrera', 'Manila', '2022-04-18'),
(3, 'trytr', '5454', '2022-05-21');

-- --------------------------------------------------------

--
-- Table structure for table `tblofficials`
--

CREATE TABLE `tblofficials` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `chairmanship` varchar(50) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `termstart` date DEFAULT NULL,
  `termend` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblofficials`
--

INSERT INTO `tblofficials` (`id`, `name`, `chairmanship`, `position`, `termstart`, `termend`, `status`) VALUES
(1, 'Ritchell S. Basillote', '2', '4', '2021-04-29', '2021-05-01', 'Active'),
(4, 'Mark Anthony Degamo', '3', '7', '2021-04-03', '2021-04-24', 'Active'),
(5, 'Levi Berdin', '4', '8', '2021-04-03', '2022-03-24', 'Active'),
(6, 'Bernie Empaces', '5', '9', '2021-10-13', '2022-10-26', 'Active'),
(7, 'Joseph Vilonta', '6', '10', '2020-05-21', '2021-04-03', 'Active'),
(10, 'John doe', '9', '13', '2020-06-18', '2021-04-03', 'Active'),
(11, 'Levi Berdin', '10', '14', '2020-07-08', '2021-04-03', 'Active'),
(12, 'AMY  ZARAGOSA', '11', '15', '2020-07-08', '2021-04-03', 'Active'),
(13, 'Welmark Sevellita', '11', '16', '2020-10-07', '2021-04-03', 'Active'),
(14, 'Ernie Jeash Villahermosa', '5', NULL, '2022-05-18', '2022-05-20', 'Active'),
(15, 'Ernie Jeash Villahermosa', '5', NULL, '2022-05-18', '2022-05-20', 'Active'),
(16, 'Ernie Jeash Villahermosa', '5', NULL, '2022-05-18', '2022-05-20', 'Active'),
(17, 'Lorenz Inoc', '5', '10', '2022-05-18', '2022-05-20', 'Active'),
(18, 'Glourios Hope Cuyos', '5', '10', '2022-05-18', '2022-05-20', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `tblpermit`
--

CREATE TABLE `tblpermit` (
  `id` int(11) NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `owner1` varchar(200) DEFAULT NULL,
  `owner2` varchar(80) DEFAULT NULL,
  `nature` varchar(220) DEFAULT NULL,
  `applied` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblpermit`
--

INSERT INTO `tblpermit` (`id`, `name`, `owner1`, `owner2`, `nature`, `applied`) VALUES
(4, 'SH Food Group 1', 'SH Food Group 1', 'SH Food Group 2', 'SH Food Group 1', '2021-04-30'),
(5, 'Atrium Salon & Studio', 'SH Food Group 213', '', 'Atrium Salon & Studio', '2021-04-30'),
(6, '12', '123', '123', '123', '2022-05-22'),
(7, '123', '123', '123', '123', '2022-06-03'),
(8, '123', '123', '123', '123', '2022-06-03');

-- --------------------------------------------------------

--
-- Table structure for table `tblposition`
--

CREATE TABLE `tblposition` (
  `id` int(11) NOT NULL,
  `position` varchar(50) DEFAULT NULL,
  `order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblposition`
--

INSERT INTO `tblposition` (`id`, `position`, `order`) VALUES
(4, 'Barangay Captain', 1),
(12, 'Barangay Kagawad', 7),
(14, 'SK Chairman', 9),
(15, 'Secretary', 10),
(16, 'Treasurer', 11);

-- --------------------------------------------------------

--
-- Table structure for table `tblprecinct`
--

CREATE TABLE `tblprecinct` (
  `id` int(11) NOT NULL,
  `precinct` varchar(100) DEFAULT NULL,
  `details` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblprecinct`
--

INSERT INTO `tblprecinct` (`id`, `precinct`, `details`) VALUES
(1, '09097750237', 'DSWD Poblacion');

-- --------------------------------------------------------

--
-- Table structure for table `tblrequest`
--

CREATE TABLE `tblrequest` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `pcs` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `applied` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblrequest`
--

INSERT INTO `tblrequest` (`id`, `name`, `pcs`, `type`, `location`, `applied`) VALUES
(1, 'Annie May Barrera', 6, 'coconut', 'buri', '2022-04-15'),
(2, 'RENATO R. ALMO', 6, 'nara', 'Dist. 8', '2022-04-15'),
(3, 'Ian Figuracion', 100, 'Flywood', 'Arado City', '2022-04-18'),
(4, 'trytr', 12, '12', '122', '2022-05-22');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_support`
--

CREATE TABLE `tbl_support` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `number` varchar(20) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_support`
--

INSERT INTO `tbl_support` (`id`, `name`, `email`, `number`, `subject`, `message`, `date`) VALUES
(1, 'Annie May C. Barrera', 'anniemaybarrera@gmail.com', '09102016346', 'data', 'Hello sir can I have a COPY OF BRGY. CERTIFICATE?', '2022-04-18 21:01:17'),
(2, 'Annie May C. Barrera', 'anniemaybarrera@gmail.com', '09102016346', 'Clearance', 'school', '2022-04-20 23:53:27'),
(7, 'amar', 'waylimthai@gmail.com', '0987666666', 'technical', 'bb', '2022-04-21 01:50:45'),
(8, '12', '1231@asdasd.ad', '12', '12', '12', '2022-05-30 12:21:12'),
(9, '12', '1231@asdasd.ad', '12', '12', '12', '2022-05-30 12:22:57');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `user_type` enum('administrator','staff','user') NOT NULL,
  `avatar` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `user_type`, `avatar`, `created_at`) VALUES
(11, 'admin', '5b2d560b3f2640cadc2ff50ca64bdd936f77eb2d', 'administrator', 'data:image/jpeg;base64,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', '2021-05-03 02:33:03');
INSERT INTO `users` (`id`, `username`, `password`, `user_type`, `avatar`, `created_at`) VALUES
(14, 'staff', '6ccb4b7c39a6e77f76ecfa935a855c6c46ad5611', 'staff', 'data:image/jpeg;base64,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', '2022-04-18 04:11:54');
INSERT INTO `users` (`id`, `username`, `password`, `user_type`, `avatar`, `created_at`) VALUES
(106, 'mark', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'administrator', 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/4gHYSUNDX1BST0ZJTEUAAQEAAAHIAAAAAAQwAABtbnRyUkdCIFhZWiAH4AABAAEAAAAAAABhY3NwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQAA9tYAAQAAAADTLQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAlkZXNjAAAA8AAAACRyWFlaAAABFAAAABRnWFlaAAABKAAAABRiWFlaAAABPAAAABR3dHB0AAABUAAAABRyVFJDAAABZAAAAChnVFJDAAABZAAAAChiVFJDAAABZAAAAChjcHJ0AAABjAAAADxtbHVjAAAAAAAAAAEAAAAMZW5VUwAAAAgAAAAcAHMAUgBHAEJYWVogAAAAAAAAb6IAADj1AAADkFhZWiAAAAAAAABimQAAt4UAABjaWFlaIAAAAAAAACSgAAAPhAAAts9YWVogAAAAAAAA9tYAAQAAAADTLXBhcmEAAAAAAAQAAAACZmYAAPKnAAANWQAAE9AAAApbAAAAAAAAAABtbHVjAAAAAAAAAAEAAAAMZW5VUwAAACAAAAAcAEcAbwBvAGcAbABlACAASQBuAGMALgAgADIAMAAxADb/2wBDAAMCAgMCAgMDAwMEAwMEBQgFBQQEBQoHBwYIDAoMDAsKCwsNDhIQDQ4RDgsLEBYQERMUFRUVDA8XGBYUGBIUFRT/2wBDAQMEBAUEBQkFBQkUDQsNFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBT/wAARCAD6AdQDASIAAhEBAxEB/8QAGwAAAwEBAQEBAAAAAAAAAAAAAAECAwQFBgn/xAA2EAABBAEDAwMDAwMEAQUBAAABAAIRITEDEkFRYXEEIoETMpGhscFC0eEFFPDxMyMkNFJicv/EABgBAQEBAQEAAAAAAAAAAAAAAAEAAgME/8QAHxEBAQEBAQACAwEBAAAAAAAAAAERITFBYQJRcRKB/9oADAMBAAIRAxEAPwD8vzaEIU9BhEgBCIlSCZ6yYShAzakMWn5QbPJQDFYUADHVPM2jiqQB1pZpMTIFokHqkOo/VOI8qZMQRzISkiCqi8wlEgk2staAN3HwnNZhTJrBVbTRIvhOMmIHN/ugX8KbIiITzQUorbEEwSeAmbnak3OZTs9lkqOYRPe0AHbYpIAAGBXdCOdoISFt/wDqnG4SQiBERaUQEnlVtJsZ6FLbIMGlUH+r9kVJDYJT+mfhExkJkUpJdp3Js+UEEjqrLI7qoIHCt/Z+WUkz3Q1sO/wtRpkioCYZAzfZScrh7hArwiIPKs/+SOVUAag/hO4OEGjKNsc/C0cwGOEtsGM+VnVfpA0+pKe27vpCvZ7bTYzbnP4Uv6zLAAeFJnFrYtkir6jCTgSDSNPjFzSBUoILYqVq5k9v1SIgd0hmBEZ+FJZa1OmXtglS4EOglMoRtg5uOVLbdF0tdhgTSQaJoSe6bTGQGbVlsnp5VFsCAEtp8p0faA0WQSgTghWAfHcIa0otTMsrMoiJ6rU3nwoiSWhP+iktgSpcLWjmEA9eYSAgCplOpPF/9p0IMJ7eQiLr/pWgmkGj/wBI2yeflPYQLpPb0VupBP8AwoVx4QnGWKEIWnQJkQiKQoaOiB+CjCoN5KKgB0Si0NBJT231HZCNuMpgACSSkGlpuAqIApFXkA+3BpBJAgX5UzeDKZBANR8oEptkCAm4gwJrspaDcTKqIylFEtoINDp5QAbr9VQbYGOcLJwgMTnwmBd33RZKYET/AHUsOJF2nt6UkTBiiqImOiF4YBmCkR+UwJJKNlGo8qQggRKUxW0+VYGK/Ce0C5tBS0TZM+E9oOYPlMwee1I2XRKtWJDeFQHBKe0qi2o4UsSAN1FVHIAnunEVEAp7CcLN60V90y2GzBKbWkuifyqDCZgq6PpyOa36gAHCZaGarSMeU4P1+aVOAGo2pWtSy2qghGwxBtUSIrCRb/8ApZOANGIn4QWGbyFQgmrATIzUoHjMWSImEwyanjC0GleRPlItLSQeeU/xZqDYog+FIG3Jz2WjW+6MczCewiz+yFjI6YzKz1Gw4cyuhzQTER1WWo2GnsqVWIDLkmgkWQ4kGFWRmAApDtzZFDstaElpDpwmAMHB5RuEFMxfbqodJwg5tL6cjumfcKohNpqHBSTGKvwkByceFrIHEDuoJg4BCliSN03PdIsMzmOypvuF4VBognCtxMiyX3JKYZVCFWeECSeydCHNJrnqUtpE3WCtDDiIg8Ic2456K34WVAdAoflCtra5QtcTkGUGBSAEQurQFowjnunFiCoErBAAESpg9ECsZ7oqHCA2RKYgm8oBQTz46JgxmipNcqoJ7IzgOSbCAZ6V1SaB1j4SEk3Kp+l9r3d0zTcSpABjPlUaFGe8oxDOED5lO4kkeUgDOalB6BeBSoT0gdEgIFKs+VLCEThXEiP3SbZspgcWb4UooCBTk2tmCTKQaRATEiRxwsrptdBjAQCYooEtcSCCO6AYH79U5q0jQzfRU01/ZJoANX5ROJtWalNmLV7twkBSBWfhW1t0itQDxCoiQLDUthkn8J7SIP8ACIrYbRtyJQesYTBPXCRbHQIWstQBzzaGNaMJPkOJ2yVbBAxSfg4BBkZIVNG6CYnlZtaQa6rRtIHQWwcKmgT5Q23gkDwqIE+08oNDiRzCn7h/Kp0mEFxo0fCJgnE/TIBJKW2BZrur30ScpH7VJB9wJCh/2RfytNTsBBUvdMDspf1zNMgnPZOC4YkJgQOL7JNkCxA8LSxJABsUkZJgKiATNnyjm8JBbI5rsk0XITdjIlA/5Clz1W0m+FDjBHJ6QqcbEGAk4GABKFelk5T+6IKQAFT5Vhpc7AEKCIO667oc0k8+UAe8hW5u5pjATqz9JgAXnghEiBMyra32A/sk0A7qIlGwXjOz/wAlC1aABeUK0ccG6DQ+ERZQZCUQeq9BPiUDIRik2yPhVqgGeqIkzH5TiiEAUDyhbgqRz8JgYi0QIwkGzEgkfspKDeUgRXCbobUFA8WsowZkzAHZIQQbAlAaanKbgCVeINnlMWR+qP8AnVF9FI6NIEYJEo/qnhMePhChEEjt0T5jCIgRhMTdqRgyQBnsrDsyPkqAJwrAkgfspKIAAMJdia7JAwntkzz2Ql1HVKYgHxSMY+ZREEHjohr+Ftg4KpsD5TieEHJTlpaMYCIvoAt2aQAJ+FytJBmYWw9S4ESa7q+hsjQaTS/FQn9ETRVM1QWArUEOgjKrGmY0dotsFSdKeV1bJs47qnaRJESOiGXnO0juPNI+kYgX4XQ7TP1SEyHMOPCDOsBog9ZA6JjTzVLoLA672oY07iBgdkFzO0AzEgymGGSOnVdDtP3ZmeU/owLvuhOQsdIsJucRETu6BdRYAJCX05zJi1X7V45SSRQlTM0RA7ldTtLOAEfSkN57K8ZcjmmBFCUtQQ2QLXa7SrI/CwOiHNNKp64jXNpMdJg2VpqaQDqH5WbQC9wFK+EHTHIPhIuBFZAVFstGcqNtkQExXo2yZikRZjCCXCBFoszI/wAqZ4ckt/5akWe5TDpbYH4SJEf4UeGKz4wrEjvPdQQIBn9EwQPtAVV4pxGAP0Utj5Wg9wkWeigFxMKi1UEHspDSSSBXFpzPSUD3HKJoREIWoZIwPwhG1h5tkQTSNsFATbHK9TYNc/CbYDeqYzXhIAd/ws8BkbalLn+6e3aYz4TAEQcqiKeMynBiB+AgDqK6hUGm4QUAGT1TgjEDynFkDIVBsz3RasKC4Y+UCBEifhAgVX4VDqL7FXwiJ9tUmBATAgdEXj8QolFWnEVmUxIwIREYVoswhz+qBIxQ7oieVbWSKtR9AkGQmZyfhPaIgxKVOH+EBMbruzyqBI4TiJP7JAScT4Vqw4nMfATBIahzY/qT2mc/5U14A6lTJcZkDspbxI+FdBHvIBN4TBkdAlE2gAkjojC309rTJFrrY/TgDcuH6ZypDSDMWqbS9jTLCQS4EYhdDXMw18npC8KXt6hUNR7STJCh8vQO1+s4F0nFq9kt4NYK8c+ocNQw4krRnq3gZn4TdPHqN0+hjrS0GjMCe5XmM9c4ZE2uvT/1AEgGvCP89PPl0/TnqJ5Kn6JMgT8hMerEQSPK109ZmpFkeFZjWRkzSgEWD3FqDpuaMZ5XYABe6kP0gT7c/ugWbHIdPc2hhNmgTgR5XWzSJEG+SYtV9LbMYTkZkcR9OQCQPNrI6TYOZ6QvS+mSwj9VzO0tjiSbnoq7eK8eV6jTAc0sErAaLQ7qei9P1OiGtJ+TS5m6ZOBlZ+he+Oc6BcDACzdpARx8LtcC1oH8LJwMkQIjkK/zfha5jpzY/ZZnTAJml3fQBDYGeQsn6MyItUHjla0efhLaQ49OBC6msAP2yp1NL3N6dVeBzObtAOfhAEA1+Vvskkx+Ejp7e0q9LFszZVmKI63K12BpP7lBYDI/ZawMSOwHlMgzj5W/0ZaaWZZHBhZSQ93BEeUI+niCELWfSefAQbqbQWwQTc8pg1Vhdd/Q9INnm0QRz5TA3VghU75MDlG2pIgT/CvaGizKTWyLiFUGOijpAEWI8IAueVQEVGEx0yhnUwTfPZOLVQY7JmSEa0zLb4VAF0xxyCpawk1S2YOtLWrGYrurgD/mEBoizXYJR0EhHqogc4Qeg5VbYAT2wBypIa2RKtjYmaCBEBULzKzpgBmiZCRaiBHhXA8yo++oaDQmvCprYGE4jslbSARR4V0kWkn+ye3uqa2RQpG2sUg4kUZOVREigENAjHwqg3/CgREIuiE2td0rumAREFQaB5DYP4TZqNBwPlZSN0H9E4aTmFS4sbgjspeAQYUMozMFMmcwflaTm1P/ACE89VY9vgodTinVKRD4VsAM57qCIP7K9OQZNBE9X9dEOLf7rdhBDatczHGKiO66NKiCRJ7Jodek8m6E91u3c6jYBz0XMxokAQZP4XQGu08/os406dPUDdtiVuX7gBAM9lysdLRRJELoYZgAQeStSZD2qOltaSTJI6LJ4biY8croe4kxG4GpC5XnbqUT0go+2pjm9Rph8iOLIC5xpNAJA7CV1+pkFpP9lyhzjuseVnusmzRY4kzHwsX6EknldmmGtY6TlZa8C7nqVZ86rc+HO1oa2CQeyzfpZrPRbtYXmIEdUFu6RBjplTHnrlDRgQD3Uv0pG6IjkLqbpkxt4yrOlLSaP8o1WRwN0y4dO3JQ5gcYAEro2e4ggYruqDIMk2VofxzHTO0FMaVRtbVXytxpQdvHRW3SDRee6NWa5maWzTMRJVO9PuBPIXWdIAVAd05SGkZqPyqdDhHpxGB+J/lC7j6bqwk9kJyfs4+XLe0gI2xgQtA0gdSjYdtUt3g4gRPZG2M/3Vhkf5T27eJVwIFYH4VAggUhok5VbCK/RB9SKAgIIINhVtdF8Hom1pHNJ8SOITdMStGsk90th3YBRzTiA2CJvwrDDtEC1QYSIi1QaR4UqmDt7pQ5bR0CTG2Zyoe1MAi0nA7gAtA2qlJrRJNz5TWsRElWdOR/ZPnkkqiKRUzDCE2jqtNstx8BGwifHKzOpmG/KbtO5ICtrRVBVUYM900xnsqkiYHRaE3WYWeTByjycaAhvKYIivwkJPQpQYx8I/qObr8JFwmMoMkdlIaZ4tI6smspihMqSJOYCbWg/wBQJVgqxIOcrdrC4iqChmnZwQt26e4NBkcpniz4R/tmlziQtG+jY4NEz4Kgs36hJBIFwt2Nk042rTPsn/6ftEz+qpnoOZBtaBmZOOVqwFsneJ/KJmnIxb6MtdYPhW30kEQJB6Bb/VgTuBOYT+s6byVr05HKfTao1W7YDRmV1jRLmiHiBmFQcXNgQIUh73OEQRFo35ZxoxpDgbhasoY/KzGrEA1XKr6waKnuJWvTmNg/bMiT0lZ6z4AODOCUm6wJI/qWXqXMcw7gDByFzpy/Cdcl4MURxK5mHY1wHt60tdTWa1o2mZ4WI1QHEmuyZlZxclpBYfKnU1TtgyeqNPWuavgqdbVJkHH8ItFH1WtoZISabgEtJUagAhwEkflJr3B88flUlZtaueGAZpNry5sTE8AqHghtRJ6JRBrpaMsalUYLbylrNOo1m37geQp3B2pE/otdNrnVz3OVdFVtEBxsjomQJoEk4gUkN26CcXBC1e9stcQQRSM5p3g2FjqAvujTPuIJE9QFLny4gGDmFem1oJkyc0tZjCN7ZMz+YQtDqN06xziUK2B8wQBeZ6oaATUfhW0DwlMVQW/EgiBbY8qgwkTVojdCREGpnoVLRtBEJhllJpdy21bmkCc9lfHqmJDNwwqbpgymCCYwU+IFd1ncaJrQOCpiRYpV5mSgCv7ppwmirN9FcEUMpxt7oMk9O6pfhGBx15RtAqbhTQq090Ht25UeJEtEJtEYj8JGXnKsOoQflEq4Mz/ZABEhMY4nuk50mInwpT7IVgqxjoVO3oZJuE5g4lPxxbDaIbcpDEkflSXTivCRf2Wdpz9LJAOfwoc8TUKHaoaJJhcup60WGie61lqdjtZjG+6AufV/1ACmCY5XC55eZJlJdJ+MjOtn+r1HHMdgszqOdlxUoWwe49SjcepSQpNGep1NM+15Hyu3Q/1hzKeJ7hechFmp7mn67S1iSDZOCV0N1SSIoL5sEgyKK69D1zmkB9gchYv4nXt/XIBq+6009TcAaNdV57dcPbIuuq6NLW2iOi5tbK7RqAVFQqDqiwub60xmEzqExH6Ia35dmlrEix+UnGx7h+Vzh3SfCe+B2CWZc9dbCATuN/lM6kNr3eAuZuoAy7lPeCLvhPIfY6dx+nM1+qjX1KhpEdVidUgDaPlZO1PE9VnYNaF4dAnyuV2oRqbajqqaZBWT/bqAk2U1af1drmgHPHRaO9xJJwFz6jJLS10coMgUMI4FFxa7oO6Pr7gBMQsXOOceeVjvDQSSRfCWHezVbH3YyqBcXUYBxa4Q4tbij1WrNYhvHSVf9WtjABszKvT9VNCyAuV+oRgyMRwnpgEySKNAIlNx1t9QS4tIMnuqbrUWGZXMSCQY27eCFsHQKpPGc+WgeyjOLpQ7WMEtNfqszqwbg+U2Plk/bCB8tBqPI5KFLIc0EgnwhWX9nXlCjKZduEg+e6CBHbmU2gQIgdl03F4iCBHATbJdM2m9gBnPZABBr29kelIcS4jHdDQeXOI6K4gSgAuE/kI4lNjbiT3TDJIyEMbRik6ubHVGnSJmR1TDNo/spA9xnBWzRHZWdI2+0ZPypZHuEz8YVumJEkJMDbPThPg8S1sm1L2GCY7LQ2wZCks3AWfEK39lAYAYBk9JVhvY0p+ntM2VoT0TkwxJad2KCYEiYynRGL7JgV9yvgpAqIykQG9fynUZOOEtsTEo8UZudQpY62uzTvnotniGyRAGV5Wo7fqOd1Kfx/HVaepqu1DJPwpawvNBPTZvMYXfo6UNA6Lds/ESa59P0ZNuNdlqPSNiIXbpaJe6x+FqfSgCTjouf+rflufi8/8A2zQPtBKD6Zhst/C7dTTDBQz+yxMcI2t5JHM707DilB9ONpoLrLQSpLAPCf8AVZ/zHG7QvP6QoOku5wBWTtMn/C1/q6zfxcew9FJBHC6nNisFQQCBJ/ytf6Zxnp6rtN0gr09D1DdRpcD7ui8zUZtM8JaeodN4cFWaJx7jdaAAMwra+SSDfK4muO0GwSFYfg8LGGOv607qyqLyWg9VziiDEKy4E5hZpvW31ifHQ4VfVgAgcLAECSTHlMmqNrQ2t2vMH+CpLzOc9Asw8gd+VL3bgTiFmpbSbA/ZY67hublp57J7g6CCJWGvqndfShKp3kVUXOic8KjqEgyZ6BZfVkDp2KZf8Dsr6on7USIs3OFjqmG+08qy8AGyetLJ5loINIi1q0kgAn8Jltm5A4CxaS3jjqr3+2Epe4ObiVQJ3C8c8Ln32RcpjWmpEeVYNjpL4dMT4VO1TuBwVy7z1kodqyD06I0Ok68GKITLy4dDC5924Ck26u0G0faxq3XIEbZ/VCwDzFH8IW+rIcnjraOlCQiIb1Q0E5x0VbPhQyTBofyk3k9UFkCJgdke4UJB6q34VMnhAk4tSAIAJtMAm5gdFQ/ahcgV1QTEjlAaTg4+FJbGVExxyrDyPKTBM8q6BFSOieUAEgC0g6vumeqeagT2VNAJgCPKpF4TjDb6IZUxNDlW4bupjok6DUAHqn4Wo3AOz8Jk0DB/KsskCInsp2mTQgLM3xqp3WBKoOddkAcQg4uE23kiE+co9ABcZx4CTjwI7ygvG7oOZUmDJEQiWrXL6t+3SOOi85d3rz7Plcui2XLrPNV9b6GmA3MeV3aTbHXusNNgaDBC6tMbACSuN7XX8Z+3Vpj2yIPxEJOcGSCKS0dUEEfmsrQMBOYCm/453agFRlZOcTf2g9l0/Sbu79Vnq6DhOIV6ZK53RHVSRMqyyDHPITGmXHEIZtYExk13UlwdyDHULV7C2eR4WRElaz5CXfhZOYOyt0CjlSapLF6kwRYELBzYK6TFysdQS8LcrFehpCGNAqlQUtcKE0VU/wDYWL6WjMUrqP8A6nKzDpAAgdymDJAnlXtSyG5IJ+VIcXExhVOeBkWs5IFcqGYqZMfwlJaTAvlLcZnlIvJ7AUiJL3RF8rMjcm+gEnmrFqXRMNEFNuo2DJlYzwBE5UkcAwVZ+1uNHarRcKTqAgnqsnA9OUAYEKzGdqi6uUB2Twlni0TAi5HCkrcIrKQeQ6f3pSQTyfBQPutQ1oXnnKAZBCmBPQ8Wjdt4hXDWm4nJQ7UgwKWO7a7v0VMJccqzeppvJ4B/VCz3E4n4QtZRrsBM8kcUgkuyEBhgQ4g9EbXNPA+FkzcAJdhJxJFwfCbQYJN9kFlGKT4Lf2ILQTz2R9w6qYk2ZKsU3H5VltQ2UblItvhW6oHVIkuEEx2V41xWm3JGeUTDpGO6bBtrriENbDiRZx1hUz5BteASSL7qxAbIsrFwh2FYc4n2t/KvsgiJJMVSkDccq956SrAAAiu0KRCgITj/AKRtkmOOyDmCTKqt0UCavqsyZqfhXMmySfwkYaKkwlE5oHlTVzXVBs2ZWT3R9zpCPlph69s6Ujquf07eYHyuj1B3N2xlZaQ2w2YPK3bwfLoaJ/qtXLto5T0WzUT8LR7vpCYscLnyujNz3NEAAGMrI+p19O4J8J/7vUc47dOT+FgfXOG72gRwV0kYrpH+pkUWH4XXo+u03s9wJXnbtRzA8t9p4VMAeBMjwn/hn5fb1Gv0tadvt+VQ+np5hc+l6XUDQ7gqNcgVMrO/p0/4rX1dMHEjsvP1vUsaTtFqngPdEwO4WbhAJDfaMmFr/TnazPqXahnbxwoL3uIpaHVbG7afwk3W7wpjpMJwU6L2/m1Z9wkLMO98YIWTXSTMAWnuxKzabC0MbUW8H2c+0icdE90CQLUmoQCMj9UGqc53Ge6C9zRhRbknAjumUasahm8hM6gcIg/CzmiJMd1IoTkIyK1ZfDbyCiZMkghZugCSI5RFTMqHVRMH9Ahoji1FgyCVIeSQVNLe0kYCGg7rMDup+oSCDPlLfAn91A3SXBKADeU2uDsGBynAAMFQIhIirz1TI2xWVJA4AmUImnP4zSrdAiO2UAAz04lAnbVdk1akmGgm47qgZxhAgt4KkAhxER3CU0a0mZhCkGb/AHCE8D0mS2y35AQ5pNgjvaTiR/YqQ8iv1WfuKc5VDBCCQBmD0UkkmQTCQhwl36q078Q25VEAHqp7hUB7g4lUQ+mSZx5TLKu/BVFwLrypyavwrxZi2jeKFpktGR+Spa6Tkq+DDo7K8X9TDXEYhabdo6KGNDqyehVPd3x2UhQuEmug9Sgt3WVAcciQrY01cQRXtd0TJgEkCO6gOgjMi5KT3fUJAieydWKp0eFDwbiZ8IbAnr0T1LZ4tHykAFwMSsPUCXMEWSunduA5HZYaumN04IWsCQ0A4mFD9MHUkVCTtT6Qjrz1RpE1OOgRZldHV6ed7Q0SV1amm8HcW4WPpTtIOQu/U9SdVm0CAia1nHlamiHXEXwsz6FjiSbcu1zZKGaN4/K1OD/OuE6BcQDJHRdXpP8ATH6j6aWtXUNMAXUdV2aXr2aLQMAdE37P4/jKw1dI6GjsMx+y8f1EyYwvZ9X6zT1NP227K8bXfdmVmTW/ymOeKiyraCKBcG/oqbtN4W30vbuArqntcccTvSBrpBB6BTqMn7sx0wuo5KAKMyEdGOZvsEcdVJZvIK6HMi54WI5hM50NGDabNqiKswfKlnlXE2fysj0nOG24lONtlIn2dEpMYsKSsmO/ISOScobAtOJOaVQkxBIBhKe1eUOFERCQHt/unkWAj2mLSY3cw3fFqw2jArqp08/5V8H1IEhZubC1INm1k8GQIM9lTgwE1AylEtTgmJGEnUeo6hKEkCAU2nuDKUAtoYUjNJnQ0JnFpGJEQgktKjdHtjCz/C1nyBKQioz5U7rquyATMYViaV2Uv+6LHhSCSewQPyFIR/8AqEJ30QnQ9ExPKCJEEAQoNzyRlOa6dSifa9NwuvwlhTvgwbTjc7+UfKON3jyqggcz1Q2YkkQpDgXQJhKVJKpjYbB/BUl20xJK0mRMfhGYd/QbAvbSpzSZMV+6UjNgdOSqBm4VqPSBAzX5SeXb5cPxyipkgwOEnO5JvyqpYIfiApLpgGvKQabJOe6GtkmUQ+FskE88JiZlpk8hPaWuNRPdKdomM55T/FDHtJn8INgmSUAg4kSpcS0kYApK1TPdByM4UuEzA+Vc7BchFk5pXU5xpgC/tWTmtY6Gkgd11uJcC1c+qwAj9in1rW2m6RfwupjvZ9uFxaR4iui6dN0GJo9UeNz1sDNjHMKriqhJpMURHQocDEttM/JtzvH1NUB7vaBOUjp6bnS14jorfpRTgZ6rm1dNgcSXSR0TeqeNz6dwHtxPBXHr6e03av8A3ZZQmFhr+rBuD8oxm1H0XPxR8rp9K9zdT6bvtK5BrOcJOFek+HB17uE+VjXZrsDXe3BwsXAVavUfuMgnusHEtND5VSTyHTdeFgRK0e4xAwkxhPuiyhzq2mZnphWTI48SpaAOZ7Kstwsj4TuMQP0QZ6wge090Ahwv5TGoe2QP5SsXhM+3A+ETzn9kUcItJMhSAcSPwqJdMjCTXHdhG1WgtgCRPaVAJBm/CtwmyVEw6cpg/gdzgFRHug8chaH7cws3CDJM1+FIGSeimAIjnoma+VJIGP1TPpE7GIUi38/mFe6Tt/ZKCKi1rajdg1+eVIE2M+FTr6kpFxBI5RIDExcd5Cki+iHTOSU5kWPBV6QATxHdUQ4FSadcpyDwT26KRTP9UISkdQPiUI4sehNzEDolM0f0USHEU4BWIweUswGZkZ4Ve45EkJNEAk4WkwDcni1ncaxjrOhk3XUrAPc07m3GV1PG8QVzn0zhQd7VqZQ6A7cATlal5H9+qxZQjlUROBKl/GzGteAQUD2zkXdKbHNJmTZtSP6k0Ut+8Z+EEl1nHQJtAcPHVZ9agaTIn8qw8AwT3kpAyftj/wDpQ9xbhpMLU/QW50DqUA+zBnkSuF3+oAPDRpk9ZXY3UDoMFvMEqwwwwlwivKTmOBJkqG+pYXmQboLV0QeB5RdRtdtbZEqt8dlhvAIEgk8Ss/V6x0wA2TPATOp1SW5z1WOq3cyeQsPRP1SHNJJb5wup8OZBx1R2Fhoui5hbbyYhczf/AEyRIhbMdEDPZW41PHVpapJzHyt/rhowHfwuVj2zMSJWhINHCNa2o9R6vTa07hJ7LjPqNwPA7LbV027twAMLJ4Y5sFoHhbnerXPrarQIEklYjVaGmV1HT0yRwsdRrJMX5T9isyWmHBaD3YAWWxvAWrWbR1PQquObZr/bc0st3uFhM0sz1ys3p2gyTBMd1p0UsAndBIK12jmfwrkHSHSPlPExCNp5whoIJquEfZ6l0zlNgLgiTJ6/sqaTMQq9GgxMcILoiEgJc7iOUHMAlZ4YRviO6CbFQm47TYTMkAp1m/SACXf2UkQT1C0AqY/VZAkvrCtH8EzMCFJwRgLQiqBjuodVwJUulO4KHQKKbjffqkbOeUkgNufwnkG0FsiAK7FABAsq99HSDhu6oyc5RGExQMCVJLpB+6CkRXKZaMqsWcJ8SMgYTm7HZOY4nqUAncJx3Ct0kC5uCEIM9J8IUz11vc4ucWi8qmS5omZKAd+YBREkdlknzBEkK5nypNC5KJrNrWcKnHbAFouyTJ8pEzBkThUJJjPOEeQe1JbY48KxAnvhJ0E90xZmQIVvEZjGAkCRQBQ91mMJhvsvPlVmrTLqHJ5QGxYkDoFIk5VtMdgOqMsvDpsHukikOcS0kUENuhaTvsP7LXfRnHGz0zHajveTqAzC6NbUYxpaXBpIgFHp2kS6AHE5U67Xarmt2As5JOFXvqP07C4MLiCAPbGF0PdRmh3Ufa0cQs9Z4Gmd+OvVFmtbjBuno/VBBdObwUvU6xbrANoxS20dFkNcDJ6lTq+l36zXyNvQLUyMq9GJ0ySPcTnqt3mBH7pMDWtAAiOFP2gilm7bxrHPrGXAKWaxYQDd8o1HS+DgILSR1HlFljTo09UnqAFu128AgEDsvOBLJjBXX6bX3DMAUiRqcaS0Eg0ein6LdSttrR0HEFB1C0CBPhb/AIr6wd6YG/tHSVB0mtAuyt9XWMcfyubeXHsnQlzQIohKkHrM+Vk/UjKMZtDnTgyVLfcQFG6Tdq9E75BuE+B0tdDQIgDFJmYmb6KGugWfwqbBCwgXQCKKd9LURImL6LQWIKkg+M9UYOPwg7SOnhBFdSrwYDbqoRwqmwI4UBxyZTNQYMdCs+qAt3GLzlN1ACLQ01yiLOPlbnPAlwAPRI+yEy2aNAqDgfuVXqxQB3dfCh9Zn4WmIOCpcCW0ZR6sZk3OEHtZCboIsmlABdMGFeHDaZEccqYjkFMUIq0hc3fUpUIOgkc8qjMEBOADMwkQSrYkukuBlVJNVKl4JPPdKYMz+i16OnPtIgnsEAz0/KDBgYQCCVYQHkCjSEAThteEIyJ3X1CBNdVLPuKomI8/wsaN0wbzk4hDnQ0VB7lA4SkwE7jM6GmyJkBXMCZpZ6VuK0dhnyrCRaAavmk7DpMI1BExSTfvI4VTinSRSo+1v+U9UARAjCepTTFWmeaLxLXEgxjsUHrz3Sih4V6ggkcf9I+j6nc6G9Ak7VaBLjA6lDOVyetPsatfQldjH7oeI2ooatvE9Fjon/248LDR/wDkjyVQ+O5xA6rPU95De60d9zfCAAdOYvqqd6vaUtY2gEE0IAhLk+FP9ARJM1uzF7qkAYUP1JcfClYatOKM6z/rQ5wLu37qgK4U6YkFatAh1KOoNxNQk5u01U8pO+2eU22R8I8K/qvaIyDyj6xuaSafcfKoAF2FqeKVLtbceVA1eg+IVEAccqNXhN4tQ57iJNKQJzJR/V8KnAfTBi1WZ0MnDNwcwk15aawtC0TgZWT6cVqdHrdurNSLWg1IGVx8/K0ZgJwV1bwYA5TJhw/VY9FqOFjFpvcIwpBkRKcAk0oaPd8q84lTW0x+UTAAJKpgBYZE2lGUXnEC6KNFUbHHVJn3JOwfP8rXIvDJFAwoMD+FT8hGq0A4HC5j5IUwdUGxKbs/Cz4Hj+U+LSB/XgqSYbi1f9UcWoj3hW/LUhCrIo4KnM3XRW/KzdTfla9VUHe6IlAIJOBF5Q0D6RMXGUNHtKqKCQKgie6znbi1oz7Vm/7vhUGnJ4pMGO57JkfspZbhK0VDUcOiE2W1Cv8AMGv/2Q==', '2024-11-03 04:50:39'),
(107, 'Migs', '7b669e244506916aa2fdc1d60b9bc4e001df533f', 'user', 'data:image/jpeg;base64,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', '2024-11-03 05:23:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `certificate_requests`
--
ALTER TABLE `certificate_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resident_id` (`resident_id`),
  ADD KEY `payment_id` (`payment_id`),
  ADD KEY `certificate_id` (`certificate_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `resident_id` (`resident_id`);

--
-- Indexes for table `purok`
--
ALTER TABLE `purok`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `residents`
--
ALTER TABLE `residents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `purok_id` (`purok_id`);

--
-- Indexes for table `tblblotter`
--
ALTER TABLE `tblblotter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblbrgy_info`
--
ALTER TABLE `tblbrgy_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblchairmanship`
--
ALTER TABLE `tblchairmanship`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbldocuments`
--
ALTER TABLE `tbldocuments`
  ADD PRIMARY KEY (`no`);

--
-- Indexes for table `tblfpscert`
--
ALTER TABLE `tblfpscert`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblofficials`
--
ALTER TABLE `tblofficials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblpermit`
--
ALTER TABLE `tblpermit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblposition`
--
ALTER TABLE `tblposition`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblprecinct`
--
ALTER TABLE `tblprecinct`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblrequest`
--
ALTER TABLE `tblrequest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_support`
--
ALTER TABLE `tbl_support`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `certificates`
--
ALTER TABLE `certificates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `certificate_requests`
--
ALTER TABLE `certificate_requests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `purok`
--
ALTER TABLE `purok`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `residents`
--
ALTER TABLE `residents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tblblotter`
--
ALTER TABLE `tblblotter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tblbrgy_info`
--
ALTER TABLE `tblbrgy_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblchairmanship`
--
ALTER TABLE `tblchairmanship`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbldocuments`
--
ALTER TABLE `tbldocuments`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblfpscert`
--
ALTER TABLE `tblfpscert`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblofficials`
--
ALTER TABLE `tblofficials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tblpermit`
--
ALTER TABLE `tblpermit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tblposition`
--
ALTER TABLE `tblposition`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tblprecinct`
--
ALTER TABLE `tblprecinct`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblrequest`
--
ALTER TABLE `tblrequest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_support`
--
ALTER TABLE `tbl_support`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `certificate_requests`
--
ALTER TABLE `certificate_requests`
  ADD CONSTRAINT `certificate_requests_ibfk_1` FOREIGN KEY (`resident_id`) REFERENCES `residents` (`id`),
  ADD CONSTRAINT `certificate_requests_ibfk_2` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`),
  ADD CONSTRAINT `certificate_requests_ibfk_3` FOREIGN KEY (`certificate_id`) REFERENCES `certificates` (`id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`resident_id`) REFERENCES `residents` (`id`);

--
-- Constraints for table `residents`
--
ALTER TABLE `residents`
  ADD CONSTRAINT `residents_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `residents_ibfk_2` FOREIGN KEY (`purok_id`) REFERENCES `purok` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
