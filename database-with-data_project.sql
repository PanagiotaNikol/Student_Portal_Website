-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 24, 2025 at 08:49 PM
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
-- Database: `database project`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `COURSE_ID` varchar(100) NOT NULL,
  `COURSE_NAME` varchar(100) DEFAULT NULL,
  `ECTS` varchar(20) DEFAULT NULL,
  `ACADEMIC_PROGRAM` varchar(100) DEFAULT NULL,
  `CATEGORY` varchar(100) DEFAULT NULL,
  `COURSE_WEIGHT` varchar(100) DEFAULT NULL,
  `SEMESTER` varchar(20) DEFAULT NULL,
  `PREPEQUISITE_COURSES` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`COURSE_ID`, `COURSE_NAME`, `ECTS`, `ACADEMIC_PROGRAM`, `CATEGORY`, `COURSE_WEIGHT`, `SEMESTER`, `PREPEQUISITE_COURSES`) VALUES
('C01', 'Πληροφοριακά Συστήματα', '5', 'Πληροφορική', 'Υποχρεωτικό', '1', '3', NULL),
('C02', 'Δίκτυα', '5', 'Πληροφορική', 'Υποχρεωτικό', '1', '3', NULL),
('C03', 'Παραγωγικά', '5', 'Πληροφορική', 'Υποχρεωτικό', '1', '4', NULL),
('C04', 'Βάσεις Δεδομένων ', '5', 'Πληροφορική', 'Υποχρεωτικό', '1', '4', NULL),
('C05', 'Γραμμική Άλγεβρα', '5', 'Πληροφορική', 'Υποχρεωτικό', '1', '1', NULL),
('C06', 'Θεωρία Υπολογισμού', '5', 'Πληροφορική', 'Υποχρεωτικό', '1', '1', NULL),
('C07', 'Θεωρία Αλγορίθμων', '5', 'Πληροφορική', 'Υποχρεωτικό', '1', '2', NULL),
('C08', 'Ανάπτυξη Εφαρμογών ', '5', 'Πληροφορική', 'Υποχρεωτικό', '1', '2', NULL),
('C09', 'Αρχιτεκτονικη Υπολογιστών', '5', 'Πληροφορική', 'Υποχρεωτικό', '1', '5', NULL),
('C10', 'Προγραμματιμσος Η/Υ', '5', 'Πληροφορική', 'Υποχρεωτικό', '1', '6', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `DEPARTMENT_ID` varchar(100) NOT NULL,
  `DEPT_NAME` varchar(100) DEFAULT NULL,
  `WEBSITE` varchar(100) DEFAULT NULL,
  `DEPT_LOCATION` varchar(100) DEFAULT NULL,
  `ADDRESS` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `PHONE` varchar(100) DEFAULT NULL,
  `SOCIAL_MEDIA` varchar(100) DEFAULT NULL,
  `MIN_DURATION_OF_STUDIES` varchar(100) DEFAULT NULL,
  `PROFESSOR_ID` varchar(100) DEFAULT NULL,
  `COURSE_ID` varchar(100) DEFAULT NULL,
  `STUDENT_ID` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`DEPARTMENT_ID`, `DEPT_NAME`, `WEBSITE`, `DEPT_LOCATION`, `ADDRESS`, `EMAIL`, `PHONE`, `SOCIAL_MEDIA`, `MIN_DURATION_OF_STUDIES`, `PROFESSOR_ID`, `COURSE_ID`, `STUDENT_ID`) VALUES
('D01', 'Πληροφορικής', 'https://cs0.example.com', 'Αθήνα', 'Οδός 0', 'cs0@example.com', '2100000', '@csdept0', '4 έτη', 'P01', 'C01', 'S01'),
('D02', 'Πληροφορικής', 'https://cs1.example.com', 'Αθήνα', 'Οδός 1', 'cs1@example.com', '2100001', '@csdept1', '4 έτη', 'P02', 'C02', 'S02'),
('D03', 'Πληροφορικής', 'https://cs2.example.com', 'Αθήνα', 'Οδός 2', 'cs2@example.com', '2100002', '@csdept2', '4 έτη', 'P03', 'C03', 'S03'),
('D04', 'Πληροφορικής', 'https://cs3.example.com', 'Αθήνα', 'Οδός 3', 'cs3@example.com', '2100003', '@csdept3', '4 έτη', 'P04', 'C04', 'S04'),
('D05', 'Πληροφορικής', 'https://cs4.example.com', 'Αθήνα', 'Οδός 4', 'cs4@example.com', '2100004', '@csdept4', '4 έτη', 'P05', 'C05', 'S05'),
('D06', 'Πληροφορικής', 'https://cs5.example.com', 'Αθήνα', 'Οδός 5', 'cs5@example.com', '2100005', '@csdept5', '4 έτη', 'P06', 'C06', 'S06'),
('D07', 'Πληροφορικής', 'https://cs6.example.com', 'Αθήνα', 'Οδός 6', 'cs6@example.com', '2100006', '@csdept6', '4 έτη', 'P07', 'C07', 'S07'),
('D08', 'Πληροφορικής', 'https://cs7.example.com', 'Αθήνα', 'Οδός 7', 'cs7@example.com', '2100007', '@csdept7', '4 έτη', 'P08', 'C08', 'S08'),
('D09', 'Πληροφορικής', 'https://cs8.example.com', 'Αθήνα', 'Οδός 8', 'cs8@example.com', '2100008', '@csdept8', '4 έτη', 'P09', 'C09', 'S09'),
('D10', 'Πληροφορικής', 'https://cs9.example.com', 'Αθήνα', 'Οδός 9', 'cs9@example.com', '2100009', '@csdept9', '4 έτη', 'P10', 'C10', 'S10');

-- --------------------------------------------------------

--
-- Table structure for table `graduation_project`
--

CREATE TABLE `graduation_project` (
  `GP_ID` varchar(100) NOT NULL,
  `GP_TITLE` varchar(100) DEFAULT NULL,
  `COMPULSORY` varchar(100) DEFAULT NULL,
  `RESTRICTIONS` varchar(100) DEFAULT NULL,
  `MIN_COMPLETION_TIME` varchar(100) DEFAULT NULL,
  `MAX_COMPLETION_TIME` varchar(100) DEFAULT NULL,
  `STUDENT_ID` varchar(100) DEFAULT NULL,
  `DEPARTMENT_ID` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `graduation_project`
--

INSERT INTO `graduation_project` (`GP_ID`, `GP_TITLE`, `COMPULSORY`, `RESTRICTIONS`, `MIN_COMPLETION_TIME`, `MAX_COMPLETION_TIME`, `STUDENT_ID`, `DEPARTMENT_ID`) VALUES
('GP01', 'Multi-layered bandwidth-monitored attitude', 'Ναι', '', '6 μήνες', '12 μήνες', 'S01', 'D01'),
('GP02', 'Future-proofed bandwidth-monitored analyzer', 'Ναι', '', '6 μήνες', '12 μήνες', 'S02', 'D02'),
('GP03', 'Reverse-engineered encompassing neural-net', 'Ναι', '', '6 μήνες', '12 μήνες', 'S03', 'D03'),
('GP04', 'Centralized disintermediate moderator', 'Ναι', '', '6 μήνες', '12 μήνες', 'S04', 'D04'),
('GP05', 'Advanced incremental architecture', 'Ναι', '', '6 μήνες', '12 μήνες', 'S05', 'D05'),
('GP06', 'Vision-oriented grid-enabled hub', 'Ναι', '', '6 μήνες', '12 μήνες', 'S06', 'D06'),
('GP07', 'Distributed interactive extranet', 'Ναι', '', '6 μήνες', '12 μήνες', 'S07', 'D07'),
('GP08', 'Optimized exuding ability', 'Ναι', '', '6 μήνες', '12 μήνες', 'S08', 'D08'),
('GP09', 'Extended asynchronous model', 'Ναι', '', '6 μήνες', '12 μήνες', 'S09', 'D09'),
('GP10', 'Synchronized radical focus group', 'Ναι', '', '6 μήνες', '12 μήνες', 'S10', 'D10');

-- --------------------------------------------------------

--
-- Table structure for table `postgraduate`
--

CREATE TABLE `postgraduate` (
  `STUDENT_ID` varchar(100) NOT NULL,
  `FIRST_DEGREE` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `postgraduate`
--

INSERT INTO `postgraduate` (`STUDENT_ID`, `FIRST_DEGREE`) VALUES
('S09', 'Μηχανικός Αεροσκαφών'),
('S10', 'Τεχνικός - Ειδικός Εφαρμογών Πληροφορικής'),
('S11', 'Ανάπτυξη και Σχεδίαση Πληροφοριακών Συστημάτων'),
('S12', 'Μαθηματικός'),
('S13', 'Μηχανικός Η/Υ '),
('S14', 'Φυσικός');

-- --------------------------------------------------------

--
-- Table structure for table `professor`
--

CREATE TABLE `professor` (
  `PROFESSOR_ID` varchar(100) NOT NULL,
  `FULL_NAME` varchar(100) DEFAULT NULL,
  `PHONE` varchar(20) DEFAULT NULL,
  `SPECIALIZATION` varchar(100) DEFAULT NULL,
  `ACADEMIC_RANK` varchar(100) DEFAULT NULL,
  `ADDRESS` varchar(100) DEFAULT NULL,
  `FIELD_OF_STUDY` varchar(100) DEFAULT NULL,
  `STUDENT_ID` varchar(100) DEFAULT NULL,
  `GP_ID` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `professor`
--

INSERT INTO `professor` (`PROFESSOR_ID`, `FULL_NAME`, `PHONE`, `SPECIALIZATION`, `ACADEMIC_RANK`, `ADDRESS`, `FIELD_OF_STUDY`, `STUDENT_ID`, `GP_ID`) VALUES
('P01', 'Θεοδόσης Καλαμαράκης', '2750 324324', 'Πληροφορική', 'Καθηγητής', 'Κερκίνης 4,, 46626 Ρόδος', 'Πληροφορική', 'S01', 'GP01'),
('P02', 'Θεώνη Πέτση', '6944 599 023', 'Πληροφορική', 'Καθηγητής', 'Ζεμενού 1,, ΤΚ 80099 Άρτα', 'Πληροφορική', 'S02', 'GP02'),
('P03', 'Ευδοκία Μαυροείδη', '+306922195797', 'Πληροφορική', 'Καθηγητής', 'Μιχαηλίδου 67,, 99094 Πύργος', 'Πληροφορική', 'S03', 'GP03'),
('P04', 'Οδυσσέας-Βασίλης Φαλιέρος', '+306953296455', 'Πληροφορική', 'Καθηγητής', 'Λανθίου 66-14,, 39679 Καρπενήσι', 'Πληροφορική', 'S04', 'GP04'),
('P05', 'Μάρκος-Ίων Αμπλιάνιτης', '2370 297250', 'Πληροφορική', 'Καθηγητής', 'Μανασσή 262-096,, 686 18 Σάμος', 'Πληροφορική', 'S05', 'GP05'),
('P06', 'Τζένη-Γκόλφω Μηλιάδου', '+306996962062', 'Πληροφορική', 'Καθηγητής', 'Πάρ. Ματεσίου 39,, ΤΚ 904 50 Χανιά', 'Πληροφορική', 'S06', 'GP06'),
('P07', 'Σαμουήλ Κωτσίδης', '2620157795', 'Πληροφορική', 'Καθηγητής', 'Πάντου 12,, 67929 Σέρρες', 'Πληροφορική', 'S07', 'GP07'),
('P08', 'Κωνσταντία Νάσσου', '2570 232470', 'Πληροφορική', 'Καθηγητής', 'Λεωφ. Μύστακας 14,, ΤΚ 49238 Καλαμάτα', 'Πληροφορική', 'S08', 'GP08'),
('P09', 'Μικές-Βενέτιος Σιγανός', '+30 6938 516140', 'Πληροφορική', 'Καθηγητής', 'Πλατεία Κοχύλου 47,, 736 02 Λευκάδα', 'Πληροφορική', 'S09', 'GP09'),
('P10', 'Αγαπητός Φραγκόπουλος', '2420 982881', 'Πληροφορική', 'Καθηγητής', 'Πλατεία Καταβόθρας 56,, ΤΚ 17450 Άμφισσα', 'Πληροφορική', 'S10', 'GP10');

-- --------------------------------------------------------

--
-- Table structure for table `registers`
--

CREATE TABLE `registers` (
  `STUDENT_ID` varchar(100) DEFAULT NULL,
  `COURSE_ID` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registers`
--

INSERT INTO `registers` (`STUDENT_ID`, `COURSE_ID`) VALUES
('S01', 'C01'),
('S02', 'C02'),
('S03', 'C03'),
('S04', 'C04'),
('S05', 'C05'),
('S06', 'C06'),
('S07', 'C07'),
('S08', 'C08'),
('S09', 'C09'),
('S10', 'C10');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `STUDENT_ID` varchar(100) NOT NULL,
  `FULL_NAME` varchar(100) DEFAULT NULL,
  `ADDRESS` varchar(100) DEFAULT NULL,
  `PHONE` varchar(20) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `ADVISOR` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`STUDENT_ID`, `FULL_NAME`, `ADDRESS`, `PHONE`, `EMAIL`, `ADVISOR`) VALUES
('S01', 'Μαλαμάτη Τουρνά', 'Πάροδος Τριλόφου 110-387,, 81734 Κόρινθος', '210 870 5486', 'garyfallia.roussou@stamouli.gr', 'Θεοδόσης Καλαμαράκης'),
('S02', 'Λουκάς Αντωνιάδης', 'Μαυρομμάτας 53-14,, 28743 Ηγουμενίτσα', '(+30) 2040 468800', 'fevronia.toli@kalogiannaki.com', 'Θεώνη Πέτση'),
('S03', 'Γιώργος Φυδάνης', 'Σαρδών 27,, 18935 Χαλκίδα', '210 214 1712', 'antigoni.mpalli@smardas.gr', 'Ευδοκία Μαυροειδή'),
('S04', 'Σωφρονία Πεμούση', 'Λαφυστίου 81,, 191 63 Χαλκίδα', '+302318352074', 'matina.daras@pippas.com', 'Οδυσσέας-Βασίλης Φαλιέρος'),
('S05', 'Βαλάντω Κώτσου', 'Ρόκκα 691-474,, ΤΚ 32464 Ιωάννινα', '(+30) 6984 852091', 'polykarpos27@hol.gr', 'Μάρκος-Ιων Αμπλιανίτης'),
('S06', 'Δράκων Τσεμπερλίδης', 'Πάροδος Ποντισμένου 187,, 15142 Ερμούπολη', '6926 338735', 'voultsidou.zinon@kaffe.com', 'Τζένη-Γκολφω Μηλιάδου'),
('S07', 'Παναγιώτης Μανούκας', 'Ζαχαρίου 97,, 80881 Καβάλα', '2960 397 069', 'spordilis.euterpi@pankidou-emmanouil.gr', 'Σαμουήλ Κωστίδης'),
('S08', 'Σολομών Αργυρής', 'Βραχατίου 89,, 07459 Κομοτηνή', '+302164926613', 'anaxagoras53@manolakis-kotsionopoulou.gr', 'Κωσταντίνα Νασσού'),
('S09', 'Ελένη-Νομική Συβιλιά', 'Πλ. Αρφαρών 6,, 441 91 Κομοτηνή', '+30 6964 284594', 'valantis.avramidis@stamouli-kostoulas.gr', 'Μικές-Βενέτιος Σιγανός'),
('S10', 'Σεβαστιανός Γρηγορόπουλος', 'Πάρ. Ψάκας 01,, 35628 Χαλκίδα', '2810 294 799', 'afentra.theologos@petta.com', 'Αγαπητός Φραγκόπουλος'),
('S11', 'Πολυτίμη Γεωργιάδου', 'Ακριτοχωρίου 3,, 62065 Θεσσαλονίκη', '2960 534 563', 'kleovoulos08@googlemail.gr', 'Θεοδόσης Καλαμαράκης'),
('S12', 'Παύλος Κωστίδης', 'Δωματίων 6,, ΤΚ 88417 Πρέβεζα', '6941 512 057', 'fountzoulas.zafeiria@tzigkoura.gr', 'Θεώνη Πέτση'),
('S13', 'Μεταξία Καραμανλή', 'Νεγράδων 919-846,, ΤΚ 69355 Ερμούπολη', '2670504712', 'vagiani21@oikonomopoulou-georgakopoulou.com', 'Θεώνη Πέτση'),
('S14', 'Νεοκλής Φωτόπουλος', 'Πλ. Σύμης 27,, ΤΚ 977 75 Κατερίνη', '24960 07 083', 'thiseus26@gmail.com', 'Κωσταντίνα Νασσού'),
('S15', 'Ακριβή Σόφρα', 'Λεωφ. Απιδίων 3,, 52590 Ιωάννινα', '2102522731', 'riosifidou@forthnet.gr', 'Θεώνη Πέτση'),
('S16', 'Ελισάβετ Ασουχίδου', 'Δαμαβόλου 23,, ΤΚ 062 61 Κόρινθος', '2218091723', 'xkatevatis@hol.gr', 'Θεοδόσης Καλαμαράκης'),
('S17', 'Αδαμάντιος Κατσαντώνης', 'Λεωφ. Μαρμάρου 268,, 18764 Ηγουμενίτσα', '6952 361796', 'minas47@otenet.gr', 'Τζένη-Γκολφω Μηλιάδου'),
('S18', 'Σεμίνα-Ιακωβίνα Σπανοχριστοδούλου', 'Βερενίκης 89,, ΤΚ 859 68 Έδεσσα', '2670 809 518', 'mtheodoropoulou@gmail.com', 'Τζένη-Γκολφω Μηλιάδου'),
('S19', 'Δράκων Γιαννακόπουλος', 'Σαρδών 6,, ΤΚ 94849 Δράμα', '210 397 0452', 'xvlachodimou@papatrechas.com', 'Τζένη-Γκολφω Μηλιάδου'),
('S20', 'Φανούριος Τσοπανίδης', 'Πάροδος Πυλωρίου 2,, 425 17 Κομοτηνή', '6945 478903', 'uchristofori@tarnaris.org', 'Θεοδόσης Καλαμαράκης');

-- --------------------------------------------------------

--
-- Table structure for table `teaches`
--

CREATE TABLE `teaches` (
  `PROFESSOR_ID` varchar(100) DEFAULT NULL,
  `COURSE_ID` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teaches`
--

INSERT INTO `teaches` (`PROFESSOR_ID`, `COURSE_ID`) VALUES
('P01', 'C01'),
('P02', 'C02'),
('P03', 'C03'),
('P04', 'C04'),
('P05', 'C05'),
('P06', 'C06'),
('P07', 'C07'),
('P08', 'C08'),
('P09', 'C09'),
('P10', 'C10');

-- --------------------------------------------------------

--
-- Table structure for table `teaching_certification`
--

CREATE TABLE `teaching_certification` (
  `STUDENT_ID` varchar(100) NOT NULL,
  `DEPARTMENT_OF_EDUCATION` varchar(100) DEFAULT NULL,
  `UNIVERSITY_OF_ORIGIN` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teaching_certification`
--

INSERT INTO `teaching_certification` (`STUDENT_ID`, `DEPARTMENT_OF_EDUCATION`, `UNIVERSITY_OF_ORIGIN`) VALUES
('S15', 'Υπουργείο Παιδείας', 'Ιονίο Πανεπιστήμιο'),
('S16', 'Υπουργείο Παιδείας', 'Ιονιο Πανεπιστήμιο'),
('S17', 'Υπουργείο Παιδείας', 'Ιόνιο Πανεπιστήμιο'),
('S18', 'Υπουργείο Παιδείας', 'Ιόνιο Πανεπιστήμιο'),
('S19', 'Υπουργείο Παιδείας', 'Ιόνιο Πανεπιστήμιο'),
('S20', 'Υπουργείο Παιδείας', 'Ιόνιο Πανεπιστήμιο');

-- --------------------------------------------------------

--
-- Table structure for table `undergraduate`
--

CREATE TABLE `undergraduate` (
  `STUDENT_ID` varchar(100) NOT NULL,
  `MODE_OF_ADMISSION` varchar(100) DEFAULT NULL,
  `SCHOOL_OF_ORIGIN` varchar(100) DEFAULT NULL,
  `ADMISSION_RANK` int(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `undergraduate`
--

INSERT INTO `undergraduate` (`STUDENT_ID`, `MODE_OF_ADMISSION`, `SCHOOL_OF_ORIGIN`, `ADMISSION_RANK`) VALUES
('S01', 'Πανελλαδικές', '5ο Γελ Κορίνθου', 1829),
('S02', 'Πανελλαδικές', '4ο Γελ Ηγουμενίτσας', 1630),
('S03', 'Πανελλαδικές', '15ο Γελ Χαλκίδας', 1088),
('S04', 'Πανελλαδικές', '2ο Γελ Χαλκίδας', 1895),
('S05', 'Πανελλαδικές', '3ο Γελ Ιωαννίνων', 1545),
('S06', 'Πανελλαδικές', '18ο Γελ Ερμουπόλεως', 1839),
('S07', 'Πανελλαδικές', '7ο Γελ Καβάλας', 1090),
('S08', 'Πανελλαδικές', '8ο Γελ Κομοτηνής', 1026);

-- --------------------------------------------------------

--
-- Table structure for table `was_examined`
--

CREATE TABLE `was_examined` (
  `STUDENT_ID` varchar(100) DEFAULT NULL,
  `COURSE_ID` varchar(100) DEFAULT NULL,
  `GRADE` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `was_examined`
--

INSERT INTO `was_examined` (`STUDENT_ID`, `COURSE_ID`, `GRADE`) VALUES
('S01', 'C01', 5),
('S02', 'C02', 8),
('S03', 'C03', 9),
('S04', 'C04', 10),
('S05', 'C05', 9),
('S06', 'C06', 8),
('S07', 'C07', 5),
('S08', 'C08', 8),
('S09', 'C09', 10),
('S10', 'C10', 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`COURSE_ID`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`DEPARTMENT_ID`),
  ADD KEY `PROFESSOR_ID` (`PROFESSOR_ID`),
  ADD KEY `COURSE_ID` (`COURSE_ID`),
  ADD KEY `STUDENT_ID` (`STUDENT_ID`);

--
-- Indexes for table `graduation_project`
--
ALTER TABLE `graduation_project`
  ADD PRIMARY KEY (`GP_ID`),
  ADD KEY `STUDENT_ID` (`STUDENT_ID`),
  ADD KEY `DEPARTMENT_ID` (`DEPARTMENT_ID`);

--
-- Indexes for table `postgraduate`
--
ALTER TABLE `postgraduate`
  ADD PRIMARY KEY (`STUDENT_ID`);

--
-- Indexes for table `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`PROFESSOR_ID`),
  ADD KEY `STUDENT_ID` (`STUDENT_ID`),
  ADD KEY `GP_ID` (`GP_ID`);

--
-- Indexes for table `registers`
--
ALTER TABLE `registers`
  ADD KEY `STUDENT_ID` (`STUDENT_ID`),
  ADD KEY `COURSE_ID` (`COURSE_ID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`STUDENT_ID`);

--
-- Indexes for table `teaches`
--
ALTER TABLE `teaches`
  ADD KEY `PROFESSOR_ID` (`PROFESSOR_ID`),
  ADD KEY `COURSE_ID` (`COURSE_ID`);

--
-- Indexes for table `teaching_certification`
--
ALTER TABLE `teaching_certification`
  ADD PRIMARY KEY (`STUDENT_ID`);

--
-- Indexes for table `undergraduate`
--
ALTER TABLE `undergraduate`
  ADD PRIMARY KEY (`STUDENT_ID`);

--
-- Indexes for table `was_examined`
--
ALTER TABLE `was_examined`
  ADD KEY `STUDENT_ID` (`STUDENT_ID`),
  ADD KEY `COURSE_ID` (`COURSE_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`PROFESSOR_ID`) REFERENCES `professor` (`PROFESSOR_ID`),
  ADD CONSTRAINT `department_ibfk_2` FOREIGN KEY (`COURSE_ID`) REFERENCES `courses` (`COURSE_ID`),
  ADD CONSTRAINT `department_ibfk_3` FOREIGN KEY (`STUDENT_ID`) REFERENCES `student` (`STUDENT_ID`);

--
-- Constraints for table `graduation_project`
--
ALTER TABLE `graduation_project`
  ADD CONSTRAINT `graduation_project_ibfk_1` FOREIGN KEY (`STUDENT_ID`) REFERENCES `student` (`STUDENT_ID`),
  ADD CONSTRAINT `graduation_project_ibfk_2` FOREIGN KEY (`DEPARTMENT_ID`) REFERENCES `department` (`DEPARTMENT_ID`);

--
-- Constraints for table `postgraduate`
--
ALTER TABLE `postgraduate`
  ADD CONSTRAINT `postgraduate_ibfk_1` FOREIGN KEY (`STUDENT_ID`) REFERENCES `student` (`STUDENT_ID`);

--
-- Constraints for table `professor`
--
ALTER TABLE `professor`
  ADD CONSTRAINT `professor_ibfk_1` FOREIGN KEY (`STUDENT_ID`) REFERENCES `student` (`STUDENT_ID`),
  ADD CONSTRAINT `professor_ibfk_2` FOREIGN KEY (`GP_ID`) REFERENCES `graduation_project` (`GP_ID`);

--
-- Constraints for table `registers`
--
ALTER TABLE `registers`
  ADD CONSTRAINT `registers_ibfk_1` FOREIGN KEY (`STUDENT_ID`) REFERENCES `student` (`STUDENT_ID`),
  ADD CONSTRAINT `registers_ibfk_2` FOREIGN KEY (`COURSE_ID`) REFERENCES `courses` (`COURSE_ID`);

--
-- Constraints for table `teaches`
--
ALTER TABLE `teaches`
  ADD CONSTRAINT `teaches_ibfk_1` FOREIGN KEY (`PROFESSOR_ID`) REFERENCES `professor` (`PROFESSOR_ID`),
  ADD CONSTRAINT `teaches_ibfk_2` FOREIGN KEY (`COURSE_ID`) REFERENCES `courses` (`COURSE_ID`);

--
-- Constraints for table `teaching_certification`
--
ALTER TABLE `teaching_certification`
  ADD CONSTRAINT `teaching_certification_ibfk_1` FOREIGN KEY (`STUDENT_ID`) REFERENCES `student` (`STUDENT_ID`);

--
-- Constraints for table `undergraduate`
--
ALTER TABLE `undergraduate`
  ADD CONSTRAINT `undergraduate_ibfk_1` FOREIGN KEY (`STUDENT_ID`) REFERENCES `student` (`STUDENT_ID`);

--
-- Constraints for table `was_examined`
--
ALTER TABLE `was_examined`
  ADD CONSTRAINT `was_examined_ibfk_1` FOREIGN KEY (`STUDENT_ID`) REFERENCES `student` (`STUDENT_ID`),
  ADD CONSTRAINT `was_examined_ibfk_2` FOREIGN KEY (`COURSE_ID`) REFERENCES `courses` (`COURSE_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
