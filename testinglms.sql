-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 13, 2023 at 11:59 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testinglms`
--

-- --------------------------------------------------------

--
-- Table structure for table `books_1`
--

CREATE TABLE `books_1` (
  `id` int(11) NOT NULL,
  `isbn` varchar(17) NOT NULL,
  `recommendedAge` varchar(40) DEFAULT NULL,
  `title` varchar(72) DEFAULT NULL,
  `price` varchar(7) DEFAULT NULL,
  `author` varchar(27) DEFAULT NULL,
  `is_avail` int(1) NOT NULL,
  `is_pending` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `books_1`
--

INSERT INTO `books_1` (`id`, `isbn`, `recommendedAge`, `title`, `price`, `author`, `is_avail`, `is_pending`) VALUES
(1, '978-1-60309-502-0', 'Mature (16+)', 'Animal Stories', '$19.99', 'Peter Hoey', 0, 0),
(2, '978-1-60309-517-4', ' ', 'Ashes', '$19.99', 'Ortiz Álvaro', 1, 0),
(3, '978-1-60309-520-4', 'Middle Grade (8-11+)', 'Cosmic Cadets (Book One): Contact!', '$14.99', 'Crane| Ben| Alves| Mimi ILT', 1, 0),
(4, '978-1-60309-454-2', 'Young Adult (13+)', 'Cosmoknights (Book One)', '$19.99', 'Templer Hannah', 1, 0),
(5, '978-1-60309-492-4', 'Mature (16+)', 'The Delicacy', '$24.99', 'Albon James', 1, 0),
(6, '978-1-60309-513-6', 'Young Adult (13+)', 'Doughnuts and Doom', '$14.99', 'Lorinczi Balazs', 0, 0),
(7, '978-1-60309-514-3', 'Young Readers (4-8+)', 'Dragon Puncher (Book 3): Dragon Puncher Punches Back', '$9.99', 'Kochalka James', 1, 0),
(8, '978-1-60309-508-2', 'For Adults Only (18+)', 'Edmund White’s A Boy’s Own Story: The Graphic Novel', '$29.99', 'White Edmund', 1, 0),
(9, '978-1-60309-038-4', 'Young Adult (13+)', 'Essex County', '$29.95', 'Lemire Jeff', 1, 0),
(10, '978-1-60309-515-0', 'Young Adult (13+) & Mature (16+)', 'F.A.R.M. System', '$19.99', 'Koslowski Rich', 1, 0),
(11, '978-1-60309-505-1', 'For Adults Only (18+)', 'Free Pass', '$19.99', 'Hanshaw Julian', 1, 0),
(12, '978-1-60309-469-6', 'Mature (18+)', 'From Hell: Master Edition -- HARDCOVER', '$49.99', 'Moore Alan', 1, 1),
(13, '978-1-60309-344-6', 'Mature (16+)', 'The Fun Family', ' $24.99', 'Frisch Benjamin', 1, 0),
(14, '978-1-60309-504-4', 'Young Readers (4-8+)', 'Glork Patrol (Book Two): Glork Patrol Takes a Bath', '$9.99', 'Kochalka James', 1, 0),
(15, '978-1-60309-521-1', 'Young Readers (4-8+)', 'Glork Patrol (Book Three): Glork Patrol and the Magic Robot', '$9.99', 'Kochalka James', 1, 0),
(16, '978-1-891830-02-0', 'Mature (16+)', 'Hey Mister (Vol 1): After School Special by Sickman-Garner', '$7.95', 'Sickman-Garner Pete', 1, 0),
(17, '978-1-891830-25-9', 'Mature (16+)', 'Hey Mister (Vol 3): The Fall Collection by S-Garner', '$12.95', 'Pete Sickman-Garner', 1, 0),
(18, '978-1-60309-030-8', 'Mature (16+)', 'Hey Mister: Come Hell or Highwater Pants', '$14.95', 'Sickman-Garner Pete', 1, 0),
(19, '978-1-60309-412-2', 'Young Adult (13+)', 'Home Time: Under the River', '$24.99', 'Whyte Campbell', 1, 0),
(20, '978-1-891830-91-4', 'Young Adult (13+)', 'Incredible Change-Bots One', '$14.95', 'Brown Jeffrey', 1, 0),
(21, '978-1-60309-067-4', 'Young Adult (13+)', 'Incredible Change-Bots Two', '$14.95', 'Brown Jeffrey', 1, 0),
(22, '978-1-60309-015-5', 'All Ages', 'Johnny Boo (Book 2): Twinkle Power', '$9.95', 'Kochalka James', 1, 0),
(23, '978-1-60309-041-4', 'All Ages', 'Johnny Boo (Book 3): Happy Apples', '$9.95', 'Kochalka James', 1, 0),
(24, '978-1-60309-084-1', 'All Ages', 'Johnny Boo (Book 5): Does Something!', '$9.95', 'Kochalka James', 0, 0),
(25, '978-1-60309-349-1', 'All Ages', 'Johnny Boo (Book 6): Zooms to the Moon!', '$9.95', 'Kochalka James', 1, 0),
(26, '978-1-60309-384-2', 'All ages (4-8+)', 'Johnny Boo (Book 7): Goes Like This!', '$9.99', 'Kochalka James', 1, 0),
(27, '978-1-60309-503-7', 'Young Readers (4-8+)', 'Johnny Boo (Book 13): Johnny Boo Goes to School', '$9.99', 'Kochalka James', 1, 0),
(28, '978-1-60309-368-2', 'All Ages', 'Johnny Boo Meets Dragon Puncher!', '$9.99', 'Kochalka James', 1, 0),
(29, '978-1-60309-385-9', 'All ages (4-8+)', 'Johnny Boo\'s Big Boo Box (Slipcase Set of Books 1-5)', ' $39.99', 'Kochalka James', 1, 0),
(30, '978-1-60309-500-6', 'YA (13+)', 'Junkwraith', '$24.99', 'Richey Ellinor', 1, 0),
(31, '978-1-60309-467-2', 'Middle grade (9+)', 'Kodi', '$14.99', 'Cullum Jared', 1, 0),
(32, '978-1-60309-329-3', 'Mature Reader (16+)', 'The League of Extraordinary Gentlemen (Vol III): Century - HARDCOVER', '$29.95', 'Alan MOORE', 1, 0),
(33, '978-1-60309-496-2', 'Mature Readers (16+)', 'The League of Extraordinary Gentlemen (Vol IV): The Tempest (TPB)', '$19.99', 'Moore Alan', 1, 0),
(34, '978-1-60309-456-6', 'Mature Readers (16+)', 'The League of Extraordinary Gentlemen (Vol IV): The Tempest -- HARDCOVER', '$29.99', 'Moore Alan', 1, 0),
(35, '978-1-60309-436-8', 'Adults Only (18+)', 'Lost Girls (Expanded Edition)', '$49.99', 'Moore Alan', 1, 0),
(36, '978-1-60309-506-8', 'Mature Readers (16+)', 'Loved and Lost: A Relationship Trilogy', '$29.99', 'Brown Jeffrey', 1, 0),
(37, '978-1-60309-395-8', 'Young Adult (13+)', 'March (Trilogy Slipcase Set)', '$49.99', 'Lewis John', 1, 0),
(38, '978-1-60309-300-2', 'Young Adult (13+)', 'March: Book One', '$14.95', 'John Lewis', 1, 0),
(39, '978-1-60309-402-3', 'Young Adult (13+)', 'March: Book Three', '$19.99', 'John Lewis', 1, 0),
(40, '978-1-60309-396-5', '', 'March: Book Three -- HARDCOVER', '$29.99', 'John Lewis', 1, 0),
(41, '978-1-60309-491-7', 'All Ages', 'Monster on the Hill (Expanded Edition)', '$19.95', 'Rob Harrell', 1, 0),
(42, '978-1-60309-274-6', 'Mature (16+)', 'Nemo: Heart of Ice', '$14.95', 'Alan Moore', 1, 0),
(43, '978-1-60309-355-2', 'Mature (16+)', 'Nemo: River of Ghosts', '$14.95', 'Alan Moore', 1, 0),
(44, '978-1-60309-320-0', 'Mature (16+)', 'Nemo: The Roses of Berlin', '$14.95', 'Alan Moore', 1, 0),
(45, '978-1-60309-489-4', 'Young Adult (13+)', 'Onion Skin', '$14.99', 'Edgar Camacho', 1, 0),
(46, '978-1-60309-510-5', 'Middle-Grade (12+)', ' Order of the Night Jay (Book One): The Forest Beckons', '$14.99', 'Jonathan Schnapp', 1, 0),
(47, '978-1-60309-377-4', 'Mature Reader (16+)', 'Our Expanding Universe', '$19.99', 'Alex Robinson', 1, 0),
(48, '978-1-60309-481-8', 'Mature Readers (16+)', 'Parenthesis', '$19.99', 'Élodie Durand', 1, 0),
(49, '978-1-60309-325-5', '', 'Pinocchio Vampire Slayer (Vol. 2): The Great Puppet Theater', 'TBD', 'Van Jenses', 1, 0),
(50, '978-1-60309-512-9', 'General/Adult (with YA crossover appeal)', 'Radical: My Year with a Socialist Senator', '$24.99', 'Sofia Warren', 1, 0),
(51, '978-1-60309-501-3', 'Middle Grade (8+)', 'Red Panda & Moon Bear (Book Two): The Curse of the Evil Eye', '$14.99', 'Jarod Roselló', 1, 0),
(52, '978-1-60309-413-9', 'All Ages (8+)', 'Return of the Dapper Men (Deluxe Edition)', '$34.99', 'Jim McCann', 1, 0),
(53, '978-1-60309-490-0', 'Mature (16+)', 'Rivers', '$19.99', 'David Gaffney', 1, 0),
(54, '978-1-60309-499-3', 'Young Adult (13+)', 'Secret Passages', '$19.99', 'Axelle Lenoir', 1, 0),
(55, '978-1-60309-519-8', 'Middle Grade(8-11+)', 'Skull Cat (Book One): Skull Cat and the Curious Castle', '$14.99', 'Normal Shurliff', 1, 0),
(56, '978-1-60309-418-4', 'Mature (16+)', 'Super Tokyoland', '$24.99', 'Benjamin Reiss', 1, 0),
(57, '978-1-60309-516-7', 'Young Adult (13+)', 'Super Trash Clash', '$14.99', 'Edgar Camacho', 1, 0),
(58, '978-1-68405-089-5', 'Mature (18+)', 'Superf*ckers Forever', '$17.99', 'James Kochalka', 1, 0),
(59, '978-1-60309-411-5', 'All Ages (8+)', 'Surfside Girls (Book One): The Secret of Danger Point', '$14.99', 'Kim Dwinell', 1, 0),
(60, '978-1-60309-447-4', 'All Ages (8+)', 'Surfside Girls (Book Two): The Mystery at the Old Rancho', '$14.99', 'Kim Dwinell', 1, 0),
(61, '978-1-60309-494-8', 'All Ages (8+)', 'The Science of Surfing: A Surfside Girls Guide to the Ocean', '$9.99', 'Kim Dwinell', 1, 0),
(62, '978-1-60309-045-2', 'Mature (16+)', 'The Surrogates Owner\'s Manual', '$39.95', 'Robert Venditti', 1, 0),
(63, '978-1-60309-258-6', 'Mature (16+)', 'The Surrogates: Case Files #1', 'TBD', 'Robert Venditti', 1, 0),
(64, '978-1-60309-450-4', 'Young Adult (13+)', 'They Called Us Enemy', '$19.99', 'George Takei', 1, 0),
(65, '978-1-60309-470-2', 'Young Adult (13+)', 'They Called Us Enemy: Expanded Hardcover Edition', '$29.99', 'George Take', 1, 0),
(66, '978-0-9801023-3-8', 'Mature (16+)', 'Tonoharu (Part Two)', '$19.95', 'Lars Martinson', 1, 0),
(67, '978-0-9801023-1-4', 'Mature (16+)', 'Tonoharu (Part Three)', '$24.95', 'Lars Martinson', 1, 0),
(68, '978-1-60309-392-7', 'Young Adult (13+)', 'The Underwater Welder - HARDCOVER', '$29.99', 'Jeff Lemire', 1, 0),
(69, '978-1-60309-398-9', 'Young Adult (13+)', 'The Underwater Welder - SIGNED & NUMBERED HARDCOVER', '$49.99', 'Jeff Lemire', 1, 0),
(70, '978-1-60309-074-2', 'Young Adult (13+)', 'The Underwater Welder', '$19.95', 'Jeff Lemire', 1, 0),
(71, '978-1-60309-035-3', 'Mature (16+)', 'Voice of the Fire', '$14.95', 'Alan Moore', 1, 0),
(72, '978-1-60309-507-5', 'Mature Readers (16+)', 'Voice of the Fire (25th Anniversary Edition)', '$14.99', 'Alan Moore', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `path` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `path`) VALUES
(1, 0x696d616765732f696d6167652e6a7067),
(2, 0x696d616765732f696d6167652e6a7067),
(3, 0x696d616765732f696d6167652e6a7067),
(4, 0x696d616765732f696d6167652e6a7067),
(5, 0x696d616765732f696d6167652e6a7067),
(6, 0x696d616765732f696d6167652e6a7067),
(7, 0x696d616765732f696d6167652e6a7067);

-- --------------------------------------------------------

--
-- Table structure for table `librarian`
--

CREATE TABLE `librarian` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `username` varchar(25) NOT NULL,
  `pass` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `librarian`
--

INSERT INTO `librarian` (`id`, `name`, `username`, `pass`) VALUES
(1, 'Aguilar, Stephen Joaquin ', 'librarian', 'password');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fName` varchar(50) NOT NULL,
  `bdate` date NOT NULL,
  `username` varchar(35) NOT NULL,
  `pass` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fName`, `bdate`, `username`, `pass`) VALUES
(2, 'aaaaaaaa', '1221-12-12', '1111111111', '12121212'),
(46, 'hannah grampa', '1111-11-11', 'leemae123', 'password'),
(47, 'asdasdasd', '1111-11-11', 'tipanpogi420', 'password'),
(48, 'Aguilar, Stephen Joaquin G.', '2002-09-19', 'admin420', 'password');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books_1`
--
ALTER TABLE `books_1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `librarian`
--
ALTER TABLE `librarian`
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
-- AUTO_INCREMENT for table `books_1`
--
ALTER TABLE `books_1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `librarian`
--
ALTER TABLE `librarian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
