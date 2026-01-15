-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 15, 2026 at 03:23 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookborrow_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(150) NOT NULL,
  `category` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `cover_img` varchar(255) DEFAULT 'default_book.jpg',
  `stock` int(11) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `image` varchar(255) DEFAULT 'default.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `title`, `author`, `category`, `description`, `cover_img`, `stock`, `created_at`, `image`) VALUES
(1, 'The Alchemist', 'Paulo Coelho', 'Fiction', 'A novel about following your dreams.', 'default_book.jpg', 1, '2026-01-15 08:48:09', 'The Alchemist.jpg'),
(2, 'Atomic Habits', 'James Clear', 'Non-Fiction', 'Small changes, remarkable results.', 'default_book.jpg', 1, '2026-01-15 08:48:09', 'Atomic Habits.jpg'),
(3, '1984', 'George Orwell', 'Science', 'Dystopian social science fiction novel.', 'default_book.jpg', 1, '2026-01-15 08:48:09', '1984.jpg'),
(4, 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', 'A classic of modern American literature.', 'default_book.jpg', 1, '2026-01-15 08:48:09', 'To Kill a Mockingbird.jpg'),
(5, 'Sapiens', 'Yuval Noah Harari', 'Science', 'A brief history of humankind.', 'default_book.jpg', 1, '2026-01-15 08:48:09', 'Sapiens.jpg'),
(6, 'The Quran', 'Anonymous, Muhammad A.S. Abdel Haleem', 'islam, religion', 'The Qur\'an is the supreme authority in Islam', 'The Quran.jpg', 1, '2026-01-15 11:49:52', 'The Quran.jpg'),
(7, 'The Things You Can See Only When You Slow Down', 'Haemin Sunim', 'Nonfiction', '“Wise advice on how to reflect and slow down.” — Elle', 'the things.jpg', 1, '2026-01-15 11:49:52', 'the things.jpg'),
(8, 'The Geography of Bliss', 'Eric Weiner', 'Nonfiction, travel', 'Both revealing and inspirational,', 'the bliss.jpg', 1, '2026-01-15 11:54:05', 'the bliss.jpg'),
(9, 'The Titan’s Curse', 'Rick Riordan', 'Fantasy', 'find yourself in combat with a half-lion, half-human.\r\n', 'the titan.jpg', 1, '2026-01-15 11:54:05', 'the titan.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE `loans` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `loan_date` date NOT NULL,
  `due_date` date NOT NULL,
  `return_date` date DEFAULT NULL,
  `status` enum('Borrowed','Returned','Overdue') DEFAULT 'Borrowed'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loans`
--

INSERT INTO `loans` (`id`, `user_id`, `book_id`, `loan_date`, `due_date`, `return_date`, `status`) VALUES
(1, 2, 2, '2024-10-01', '2024-10-15', NULL, 'Returned'),
(2, 2, 1, '2024-09-15', '2024-09-25', NULL, 'Overdue'),
(3, 2, 2, '2026-01-15', '2026-01-22', NULL, 'Returned'),
(4, 2, 7, '2026-01-15', '2026-01-22', NULL, 'Borrowed'),
(5, 2, 6, '2026-01-15', '2026-01-22', NULL, 'Returned');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `created_at`) VALUES
(1, 'admin', 'admin123', 'admin', '2026-01-15 08:48:09'),
(2, 'arofah_user', 'user123', 'user', '2026-01-15 08:48:09'),
(3, 'rezki_user', 'user123', 'user', '2026-01-15 08:48:09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `loans`
--
ALTER TABLE `loans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `loans`
--
ALTER TABLE `loans`
  ADD CONSTRAINT `loans_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `loans_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
