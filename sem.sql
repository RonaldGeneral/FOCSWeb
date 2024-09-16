-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2024-09-16 11:47:59
-- 服务器版本： 10.4.32-MariaDB
-- PHP 版本： 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `sem`
--

-- --------------------------------------------------------

--
-- 表的结构 `branch`
--

CREATE TABLE `branch` (
  `BranchID` int(11) NOT NULL,
  `BranchName` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 转存表中的数据 `branch`
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
-- 表的结构 `course`
--

CREATE TABLE `course` (
  `CourseID` int(11) NOT NULL,
  `CourseName` varchar(40) NOT NULL,
  `CourseDesc` varchar(200) DEFAULT NULL COMMENT 'course description'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `progbranch`
--

CREATE TABLE `progbranch` (
  `ProgrammeID` int(11) NOT NULL,
  `BranchID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 转存表中的数据 `progbranch`
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
-- 表的结构 `progcourse`
--

CREATE TABLE `progcourse` (
  `ProgrammeID` int(11) NOT NULL,
  `CourseID` int(11) NOT NULL,
  `Year` int(11) DEFAULT NULL COMMENT 'Year of the course provide'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `programme`
--

CREATE TABLE `programme` (
  `ProgrammeID` int(11) NOT NULL,
  `ProgrammeName` varchar(100) NOT NULL,
  `StudyYear` int(11) NOT NULL,
  `ReqID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 转存表中的数据 `programme`
--

INSERT INTO `programme` (`ProgrammeID`, `ProgrammeName`, `StudyYear`, `ReqID`) VALUES
(1, 'Foundation in Computing', 1, 1),
(2, 'Diploma in Computer Science', 2, 2),
(3, 'Diploma in Information Technology', 2, 3),
(4, 'Diploma in Software Engineering', 2, 4),
(5, 'Bachelor of Science (Honours) in Managemement Mathematics with Computing', 3, 5),
(6, 'Bachelor of Information Systems (Honours) in Enterprise Information Systems', 3, 6),
(7, 'Bachelor of Computer Science (Honours) interactive Software Technology', 3, 7),
(8, 'Bachelor of Information Technology (Honours) in Information Security', 3, 8),
(9, 'Bachelor of Computer Science (Honours) in Data Science', 3, 9),
(10, 'Bachelor of Information Technology (Honours) in Software Systems Development', 3, 10),
(11, 'Bachelor of Software Engineering (Honours)', 3, 11),
(12, 'Master of Computer Science', 2, 12),
(13, 'Master of Information Technology', 2, 13),
(14, 'Master of Science in Mathematical Sciences', 2, 14),
(15, 'Doctor of Philosophy (Computer Science)', 3, 15),
(16, 'Doctor of Philosophy (Information Technology)', 3, 16),
(17, 'Doctor of Philosophy (Mathematical Sciences)', 3, 17);

-- --------------------------------------------------------

--
-- 表的结构 `requirement`
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
-- 转存表中的数据 `requirement`
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
-- 转储表的索引
--

--
-- 表的索引 `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`BranchID`);

--
-- 表的索引 `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`CourseID`);

--
-- 表的索引 `progbranch`
--
ALTER TABLE `progbranch`
  ADD PRIMARY KEY (`ProgrammeID`,`BranchID`),
  ADD KEY `BranchID` (`BranchID`);

--
-- 表的索引 `progcourse`
--
ALTER TABLE `progcourse`
  ADD PRIMARY KEY (`ProgrammeID`,`CourseID`),
  ADD KEY `CourseID` (`CourseID`);

--
-- 表的索引 `programme`
--
ALTER TABLE `programme`
  ADD PRIMARY KEY (`ProgrammeID`),
  ADD KEY `ReqID` (`ReqID`);

--
-- 表的索引 `requirement`
--
ALTER TABLE `requirement`
  ADD PRIMARY KEY (`ReqID`);

--
-- 限制导出的表
--

--
-- 限制表 `progbranch`
--
ALTER TABLE `progbranch`
  ADD CONSTRAINT `progbranch_ibfk_1` FOREIGN KEY (`BranchID`) REFERENCES `branch` (`BranchID`),
  ADD CONSTRAINT `progbranch_ibfk_2` FOREIGN KEY (`ProgrammeID`) REFERENCES `programme` (`ProgrammeID`);

--
-- 限制表 `progcourse`
--
ALTER TABLE `progcourse`
  ADD CONSTRAINT `progcourse_ibfk_1` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CourseID`),
  ADD CONSTRAINT `progcourse_ibfk_2` FOREIGN KEY (`ProgrammeID`) REFERENCES `programme` (`ProgrammeID`);

--
-- 限制表 `programme`
--
ALTER TABLE `programme`
  ADD CONSTRAINT `programme_ibfk_2` FOREIGN KEY (`ReqID`) REFERENCES `requirement` (`ReqID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
