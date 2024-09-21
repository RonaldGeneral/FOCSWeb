-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 21, 2024 at 10:27 PM
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
-- Database: `sem`
--

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `BranchID` int(11) NOT NULL,
  `BranchName` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`BranchID`, `BranchName`) VALUES
(1, 'Kuala Lumpur Main Campus'),
(2, 'Penang Branch Campus'),
(3, 'Johor Branch Campus'),
(4, 'Perak Branch Campus'),
(5, 'Pahang Branch Campus'),
(6, 'Sabah Branch Campus');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `CourseID` int(11) NOT NULL,
  `CourseName` varchar(40) NOT NULL,
  `CourseDesc` varchar(200) DEFAULT NULL COMMENT 'course description'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`CourseID`, `CourseName`, `CourseDesc`) VALUES
(1, 'Agile Software Development', 'Learn agile practices of developing software in a flexible and iterative way, focusing on collaboration, customer satisfaction, and continuous improvement, with frequent releases and adaptability to c'),
(2, 'Graphics Programming', 'Focuses on the theory and practice of creating visual elements using computer programming, involving techniques like 2D and 3D rendering, animation, and game development.'),
(3, 'Introduction to Programming', NULL),
(4, 'English Language', NULL),
(5, 'Information Technology Essentials', NULL),
(6, 'Mathematics', NULL),
(7, 'Data Management', NULL),
(8, 'Web Development', NULL),
(9, 'Statistics', NULL),
(10, 'English For Communication', NULL),
(11, 'Introduction to Multimedia', NULL),
(12, 'Introduction to Operating Systems', NULL),
(13, 'Emerging Trends in IT', NULL),
(14, 'Algebra & Trigonometry', NULL),
(15, 'Calculus', NULL),
(16, 'Computer Architecture', NULL),
(17, 'Systems Analysis and Design', NULL),
(18, 'Ethics in Computing', NULL),
(19, 'Calculus and Algebra', NULL),
(20, 'Database Development and Applications', NULL),
(21, 'Software Development Fundamentals', 'Explore the foundational principles of software development. Learn essential programming concepts, data structures, algorithms, and software design methodologies. Gain hands-on experience building pra'),
(22, 'Probability and Statistics', 'Explore fundamental concepts in probability and statistics.  Learn to analyze data, make predictions, and draw meaningful conclusions from random events.  Develop skills in hypothesis testing, confide'),
(23, 'Fundamentals of Computer Networks', NULL),
(24, 'Discrete Mathematics', 'Explore fundamental concepts in discrete mathematics, including logic, set theory, counting techniques, graph theory, and discrete probability. Develop essential problem-solving skills for computer sc'),
(25, 'Industrial Training', NULL),
(26, 'Introduction to Interface Design', NULL),
(27, 'Introduction to Cybersecurity', 'Explore the fundamental principles of cybersecurity, covering threats, vulnerabilities, and security controls. Learn about ethical hacking techniques, risk management, and security best practices. \n'),
(28, 'Web and Mobile Systems', NULL),
(29, 'Cloud Computing', NULL),
(30, 'Information Management', NULL),
(31, 'Web-Based Integrated Systems', NULL),
(32, 'Database Management', NULL),
(33, 'Software Engineering', 'Explore principles of software design, development, and maintenance. Learn to analyze requirements, build efficient code, and implement testing strategies.\n'),
(34, 'Computer Organisation and Architecture', NULL),
(35, 'Object-Oriented Programming', NULL),
(36, 'Data Structures and Algorithms', NULL),
(37, 'Artificial Intelligence', NULL),
(38, 'Software Testing', NULL),
(39, 'Software Maintenance', NULL),
(40, 'Software Project Management', 'This course equips students with the skills to plan, manage, and execute software projects effectively. It covers methodologies, risk management, communication, and team leadership. \n'),
(41, 'Project I', NULL),
(42, 'Project II', NULL),
(43, 'Industrial Training (6 months)', NULL),
(44, 'Data Science', 'Learn to extract insights from data using statistical analysis, machine learning, and programming. This course equips students with the skills to collect, clean, analyze, and interpret data to solve r'),
(45, 'Machine Learning', 'Explore the fundamentals of machine learning, covering algorithms, model building, and data analysis techniques.  You\'ll learn how to apply these concepts to real-world problems, developing practical '),
(46, 'Integrative Programming', NULL),
(47, 'Internet of Things', NULL),
(48, 'Information Technology Infrastructure', NULL),
(49, 'Research Methodology', 'Explore the scientific approach to research. Develop skills in designing, conducting, and analyzing research projects.  Learn to interpret findings and communicate results effectively. \n'),
(50, 'Master Research', 'Develop advanced research skills, explore research methodologies, and refine your research proposal. Conduct independent research projects under expert guidance, culminating in a thesis defense. \n'),
(51, 'Special Topic', 'Explore specialized areas of study in depth. Delve into current research and emerging trends.  Develop critical thinking and advanced problem-solving skills. \n'),
(52, 'Doctoral Research', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `electivecourse`
--

CREATE TABLE `electivecourse` (
  `ElectiveID` int(11) NOT NULL,
  `Prerequisite` text DEFAULT NULL,
  `Career` text DEFAULT NULL,
  `Exam` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `electivecourse`
--

INSERT INTO `electivecourse` (`ElectiveID`, `Prerequisite`, `Career`, `Exam`) VALUES
(1, 'Software Engineering', 'Agile Project Manager#Scrum Master#Agile Coach', 'BAIT3343 '),
(2, NULL, 'Game Developer#3D Graphics Programmer#Virtual Reality (VR) Developer', 'BACS2173 '),
(21, NULL, 'Software Developer#Web Developer#Mobile App Developer#Quality Assurance Tester', 'BAIT1173'),
(22, NULL, 'Data Scientist#Statistician#Actuary#Quantitative Analyst (Quant)', 'BAMS1054'),
(24, NULL, 'Software Engineer#Data Scientist#Computer Scientist#Cryptographer', 'BAMS1013'),
(27, NULL, 'Security Analyst#Cybersecurity Consultant#Penetration Tester#Information Security Manager', 'AMIS1003'),
(33, 'System Analysis and Design', 'Software Developer#Software Engineer#Web Developer#Mobile App Developer', 'BACS2163'),
(40, NULL, 'Software Project Manager#Agile Project Manager#Scrum Master#IT Project Manager', 'BAIT3153'),
(44, NULL, 'Data Scientist#Machine Learning Engineer#Data Analyst#Data Engineer', 'BACS3013'),
(45, 'Artificial Intelligence', 'Machine Learning Engineer#Data Scientist#AI Researcher#Data Analyst', 'BMCS2113'),
(49, 'Project II', 'Research Scientist#Data Analyst#Market Research Analyst#Survey Researcher', 'MBDM5094'),
(50, NULL, 'Research Scientist#Data Analyst#University Professor#Research Consultant', NULL),
(51, NULL, 'Research Assistant#Data Analyst#Content Creator#Project Manager', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `electivegroup`
--

CREATE TABLE `electivegroup` (
  `GroupCode` varchar(11) NOT NULL,
  `ProgCourseID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `electivegroup`
--

INSERT INTO `electivegroup` (`GroupCode`, `ProgCourseID`) VALUES
('EG01', 3),
('EG01', 4),
('EG01', 5),
('EG01', 61),
('EG01', 63),
('EG01', 71),
('EG01', 72),
('EG03', 51),
('EG03', 54),
('EG03', 58),
('EG03', 59),
('EG06', 1),
('EG06', 2);

-- --------------------------------------------------------

--
-- Table structure for table `progbranch`
--

CREATE TABLE `progbranch` (
  `ProgrammeID` int(11) NOT NULL,
  `BranchID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `progbranch`
--

INSERT INTO `progbranch` (`ProgrammeID`, `BranchID`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(2, 3),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(4, 6),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(9, 2),
(10, 1),
(10, 2),
(10, 3),
(10, 4),
(10, 5),
(10, 6),
(11, 1),
(11, 2),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1);

-- --------------------------------------------------------

--
-- Table structure for table `progcourse`
--

CREATE TABLE `progcourse` (
  `ID` int(11) NOT NULL,
  `ProgrammeID` int(11) NOT NULL,
  `CourseID` int(11) NOT NULL,
  `Year` int(11) DEFAULT NULL COMMENT 'Year of the course provide'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `progcourse`
--

INSERT INTO `progcourse` (`ID`, `ProgrammeID`, `CourseID`, `Year`) VALUES
(1, 11, 1, NULL),
(2, 11, 2, NULL),
(3, 12, 49, NULL),
(4, 12, 50, NULL),
(5, 12, 51, NULL),
(6, 13, 49, NULL),
(7, 13, 50, NULL),
(8, 13, 51, NULL),
(9, 14, 49, NULL),
(10, 14, 50, NULL),
(11, 14, 51, NULL),
(12, 15, 49, NULL),
(13, 15, 52, NULL),
(14, 15, 51, NULL),
(15, 16, 49, NULL),
(16, 16, 52, NULL),
(17, 16, 51, NULL),
(18, 17, 49, NULL),
(19, 17, 52, NULL),
(20, 17, 51, NULL),
(21, 1, 4, NULL),
(22, 1, 3, NULL),
(23, 1, 5, NULL),
(24, 1, 6, NULL),
(25, 1, 32, NULL),
(26, 2, 16, NULL),
(27, 2, 17, NULL),
(28, 2, 18, NULL),
(29, 2, 19, NULL),
(30, 2, 25, NULL),
(31, 3, 26, NULL),
(32, 3, 31, NULL),
(33, 3, 18, NULL),
(34, 3, 28, NULL),
(35, 3, 25, NULL),
(36, 4, 15, NULL),
(37, 4, 33, NULL),
(38, 4, 12, NULL),
(39, 4, 3, NULL),
(40, 4, 25, NULL),
(41, 5, 15, NULL),
(42, 5, 14, NULL),
(43, 5, 22, NULL),
(44, 5, 35, NULL),
(45, 5, 25, NULL),
(46, 6, 32, NULL),
(47, 6, 35, NULL),
(48, 6, 28, NULL),
(49, 6, 46, NULL),
(50, 6, 43, NULL),
(51, 7, 21, NULL),
(52, 7, 2, NULL),
(53, 7, 15, NULL),
(54, 7, 24, NULL),
(55, 7, 43, NULL),
(56, 8, 47, NULL),
(57, 8, 29, NULL),
(58, 8, 27, NULL),
(59, 8, 22, NULL),
(60, 8, 43, NULL),
(61, 9, 44, NULL),
(62, 9, 37, NULL),
(63, 9, 45, NULL),
(64, 9, 35, NULL),
(65, 9, 43, NULL),
(66, 10, 32, NULL),
(67, 10, 36, NULL),
(68, 10, 47, NULL),
(69, 10, 49, NULL),
(70, 10, 43, 0),
(71, 11, 33, NULL),
(72, 11, 40, NULL),
(73, 11, 43, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `programme`
--

CREATE TABLE `programme` (
  `ProgrammeID` int(11) NOT NULL,
  `ProgrammeName` varchar(100) NOT NULL,
  `StudyYear` int(11) NOT NULL,
  `ReqID` int(11) NOT NULL,
  `Fees` double(10,2) DEFAULT NULL,
  `Career` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `programme`
--

INSERT INTO `programme` (`ProgrammeID`, `ProgrammeName`, `StudyYear`, `ReqID`, `Fees`, `Career`) VALUES
(1, 'Foundation in Computing', 1, 1, 10200.00, NULL),
(2, 'Diploma in Computer Science', 2, 2, 19300.00, 'Programmers#Systems Analysts#Mobile Application Developers'),
(3, 'Diploma in Information Technology', 2, 3, 19300.00, 'Programmers#Systems Analysts#Network Support Officers#IT Support Executives#IT Executives#Web and Mobile Developers'),
(4, 'Diploma in Software Engineering', 2, 4, 19300.00, 'Junior Software Engineers#Junior Software Developers#Junior Software Testers#Junior Web Developers#Junior Database Administrators#Junior Systems Analysts'),
(5, 'Bachelor of Science (Honours) in Managemement Mathematics with Computing', 3, 5, 37200.00, 'Quantitative Analysts#Quality Managers#Research Officers#Investment Analysts#Financial Analysts'),
(6, 'Bachelor of Information Systems (Honours) in Enterprise Information Systems', 3, 6, 37800.00, 'ERP Consultants#Business and Systems Analysts#Business Process Consultants#Business Intelligence Specialists#Data Warehouse Developers'),
(7, 'Bachelor of Computer Science (Honours) interactive Software Technology', 3, 7, 37800.00, 'Games Designers#Games Programmers#Games Software Engineers#Games Producers#Games Testers'),
(8, 'Bachelor of Information Technology (Honours) in Information Security', 3, 8, 37800.00, 'Information Security Analysts#Information Security Consultants#Information Security Managers#Information Security Engineers#Information Security Administrators'),
(9, 'Bachelor of Computer Science (Honours) in Data Science', 3, 9, 37800.00, 'Data Scientists#Data Engineers#Data Analysts#Data Modelling Engineers#Software Developers'),
(10, 'Bachelor of Information Technology (Honours) in Software Systems Development', 3, 10, 37800.00, 'Programmers#Web Developers#Multimedia Developers#Mobile Application Developers#Systems Analysts'),
(11, 'Bachelor of Software Engineering (Honours)', 3, 11, 37800.00, 'Software Engineers#Software Testers#Software Quality Assurance Engineers#Software Developers#Software Architects'),
(12, 'Master of Computer Science', 2, 12, NULL, 'Researcher#R&D Analyst#Academician#Consultant#Software Engineer'),
(13, 'Master of Information Technology', 2, 13, NULL, 'Researcher#Business Development Executive#Product Development Executive#Market Analyst#Product Planner'),
(14, 'Master of Science in Mathematical Sciences', 2, 14, NULL, 'Business Analysis Consultant#Data Analyst#Data Scientist#Insurance underwriter#Machine Learning Engineer'),
(15, 'Doctor of Philosophy (Computer Science)', 3, 15, NULL, 'Lead Researcher#Senior Data Scientist#Senior Big Data Analyst#Senior Data Engineer#Senior Product Planner'),
(16, 'Doctor of Philosophy (Information Technology)', 3, 16, NULL, 'Lead Researcher#Senior Business Development Executive#Senior Product Development Executive#Senior Market Analyst#Senior Product Planner'),
(17, 'Doctor of Philosophy (Mathematical Sciences)', 3, 17, NULL, 'Business Consultant#Research Scientist (Maths)#Senior Data Scientist#Senior Academicians in Institutions of Higher#Learning');

-- --------------------------------------------------------

--
-- Table structure for table `requirement`
--

CREATE TABLE `requirement` (
  `ReqID` int(11) NOT NULL,
  `SPMNo` int(11) DEFAULT NULL COMMENT 'Number of credit',
  `SPMGrade` char(11) DEFAULT NULL COMMENT 'Grade needed',
  `OLevelNo` int(11) DEFAULT NULL,
  `OLevelGrade` char(11) DEFAULT NULL,
  `UECNo` int(11) DEFAULT NULL,
  `UECGrade` char(11) DEFAULT NULL,
  `STPMNo` int(11) DEFAULT NULL,
  `STPMGrade` char(11) DEFAULT NULL,
  `ALevelNo` int(11) DEFAULT NULL,
  `ALevelGrade` char(11) DEFAULT NULL,
  `minCGPA` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `requirement`
--

INSERT INTO `requirement` (`ReqID`, `SPMNo`, `SPMGrade`, `OLevelNo`, `OLevelGrade`, `UECNo`, `UECGrade`, `STPMNo`, `STPMGrade`, `ALevelNo`, `ALevelGrade`, `minCGPA`) VALUES
(1, 5, 'C', 5, 'C', 3, 'B', NULL, NULL, NULL, NULL, NULL),
(2, 3, 'C', 3, 'C', 3, 'B', NULL, NULL, NULL, NULL, NULL),
(3, 3, 'C', 3, 'C', 3, 'B', NULL, NULL, NULL, NULL, NULL),
(4, 3, 'C', 3, 'C', 3, 'B', NULL, NULL, NULL, NULL, NULL),
(5, NULL, NULL, NULL, NULL, 5, 'B', 2, 'C', 2, 'D', 0.00),
(6, NULL, NULL, NULL, NULL, 5, 'B', 2, 'C', 2, 'D', 2.50),
(7, NULL, NULL, NULL, NULL, 2, 'B', 2, 'C', 2, 'D', 2.50),
(8, NULL, NULL, NULL, NULL, 5, 'B', 2, 'C', 2, 'D', 2.50),
(9, NULL, NULL, NULL, NULL, 2, 'B', 2, 'C', 2, 'D', 2.50),
(10, NULL, NULL, NULL, NULL, 5, 'B', 2, 'C', 2, 'D', 2.50),
(11, NULL, NULL, NULL, NULL, 2, 'B', 2, 'C', 2, 'D', 2.50),
(12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`BranchID`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`CourseID`);

--
-- Indexes for table `electivecourse`
--
ALTER TABLE `electivecourse`
  ADD PRIMARY KEY (`ElectiveID`);

--
-- Indexes for table `electivegroup`
--
ALTER TABLE `electivegroup`
  ADD PRIMARY KEY (`GroupCode`,`ProgCourseID`),
  ADD KEY `ProgCourseID` (`ProgCourseID`);

--
-- Indexes for table `progbranch`
--
ALTER TABLE `progbranch`
  ADD PRIMARY KEY (`ProgrammeID`,`BranchID`),
  ADD KEY `BranchID` (`BranchID`);

--
-- Indexes for table `progcourse`
--
ALTER TABLE `progcourse`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ProgrammeID` (`ProgrammeID`,`CourseID`),
  ADD KEY `CourseID` (`CourseID`);

--
-- Indexes for table `programme`
--
ALTER TABLE `programme`
  ADD PRIMARY KEY (`ProgrammeID`),
  ADD KEY `ReqID` (`ReqID`);

--
-- Indexes for table `requirement`
--
ALTER TABLE `requirement`
  ADD PRIMARY KEY (`ReqID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `CourseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `electivecourse`
--
ALTER TABLE `electivecourse`
  MODIFY `ElectiveID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `progcourse`
--
ALTER TABLE `progcourse`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `electivecourse`
--
ALTER TABLE `electivecourse`
  ADD CONSTRAINT `electivecourse_ibfk_1` FOREIGN KEY (`ElectiveID`) REFERENCES `course` (`CourseID`);

--
-- Constraints for table `electivegroup`
--
ALTER TABLE `electivegroup`
  ADD CONSTRAINT `electivegroup_ibfk_1` FOREIGN KEY (`ProgCourseID`) REFERENCES `progcourse` (`ID`);

--
-- Constraints for table `progbranch`
--
ALTER TABLE `progbranch`
  ADD CONSTRAINT `progbranch_ibfk_1` FOREIGN KEY (`BranchID`) REFERENCES `branch` (`BranchID`),
  ADD CONSTRAINT `progbranch_ibfk_2` FOREIGN KEY (`ProgrammeID`) REFERENCES `programme` (`ProgrammeID`);

--
-- Constraints for table `progcourse`
--
ALTER TABLE `progcourse`
  ADD CONSTRAINT `progcourse_ibfk_1` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CourseID`),
  ADD CONSTRAINT `progcourse_ibfk_2` FOREIGN KEY (`ProgrammeID`) REFERENCES `programme` (`ProgrammeID`);

--
-- Constraints for table `programme`
--
ALTER TABLE `programme`
  ADD CONSTRAINT `programme_ibfk_2` FOREIGN KEY (`ReqID`) REFERENCES `requirement` (`ReqID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
