-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 05-Jun-2024 às 23:51
-- Versão do servidor: 10.4.32-MariaDB
-- versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `fileserver`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `awards`
--

CREATE TABLE `awards` (
  `idAwards` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `goal` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `awards`
--

INSERT INTO `awards` (`idAwards`, `description`, `goal`, `category_id`, `createdAt`, `updatedAt`) VALUES
(1, 'Iniciante', 20, 1, '2024-06-05 16:33:16', '2024-06-05 16:33:16'),
(2, 'Intermediário', 150, 1, '2024-06-05 16:33:16', '2024-06-05 16:33:16'),
(3, 'Bons conhecimentos', 200, 1, '2024-06-05 16:33:16', '2024-06-05 16:33:16'),
(4, 'Perito', 300, 1, '2024-06-05 16:33:16', '2024-06-05 16:33:16');

-- --------------------------------------------------------

--
-- Estrutura da tabela `awardsuservalues`
--

CREATE TABLE `awardsuservalues` (
  `idAwardsUserValues` int(11) NOT NULL,
  `current_value` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `award_id` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `awardsuservalues`
--

INSERT INTO `awardsuservalues` (`idAwardsUserValues`, `current_value`, `user_id`, `award_id`, `createdAt`, `updatedAt`) VALUES
(1, 20, 1, 1, '2024-06-05 16:33:49', '2024-06-05 16:33:49'),
(2, 20, 1, 2, '2024-06-05 16:33:49', '2024-06-05 16:33:49'),
(3, 20, 1, 3, '2024-06-05 16:33:49', '2024-06-05 16:33:49'),
(4, 20, 1, 4, '2024-06-05 16:33:49', '2024-06-05 16:33:49');

-- --------------------------------------------------------

--
-- Estrutura da tabela `missions`
--

CREATE TABLE `missions` (
  `idMission` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `current_value` int(11) NOT NULL,
  `goal` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `missions`
--

INSERT INTO `missions` (`idMission`, `user_id`, `description`, `current_value`, `goal`, `category_id`, `createdAt`, `updatedAt`) VALUES
(1, 1, 'missãoo numero um', 0, 5, 1, '2024-06-05 16:01:59', '2024-06-05 16:01:59'),
(2, 1, ' missãoo numero doismissãoo numero doismissãoo numero doismissãoo numero dois', 4, 4, 1, '2024-06-05 16:01:59', '2024-06-05 16:01:59'),
(3, 1, 'missãoo numero tres', 4, 10, 1, '2024-06-05 16:01:59', '2024-06-05 16:01:59');

-- --------------------------------------------------------

--
-- Estrutura da tabela `performances`
--

CREATE TABLE `performances` (
  `idPerformance` int(11) NOT NULL,
  `correct_answers` int(11) NOT NULL,
  `wrong_answers` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `questioncategories`
--

CREATE TABLE `questioncategories` (
  `idquestionCategory` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `questioncategories`
--

INSERT INTO `questioncategories` (`idquestionCategory`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'tumor', '2024-05-27 17:58:02', '2024-05-27 17:58:02');

-- --------------------------------------------------------

--
-- Estrutura da tabela `questions`
--

CREATE TABLE `questions` (
  `idQuestion` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `answer1` varchar(255) NOT NULL,
  `answer2` varchar(255) NOT NULL,
  `answer3` varchar(255) DEFAULT NULL,
  `answer4` varchar(255) DEFAULT NULL,
  `correctAnswer` int(11) NOT NULL,
  `explanation` varchar(255) NOT NULL,
  `tip` varchar(255) NOT NULL,
  `type_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `questions`
--

INSERT INTO `questions` (`idQuestion`, `description`, `answer1`, `answer2`, `answer3`, `answer4`, `correctAnswer`, `explanation`, `tip`, `type_id`, `category_id`, `createdAt`, `updatedAt`) VALUES
(1, 'Pergunta escolha multipla 1?', 'Esta reposta está errada - 1', 'Esta é a resposta correcta', 'Esta reposta está errada - 3', 'Esta reposta está errada - 4', 2, 'Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. ', 'Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. ', 1, 1, '2024-05-27 18:01:32', '2024-05-27 18:01:32'),
(2, 'Pergunta verdadeiro ou false 1?', '', '', '', '', 1, 'Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. ', 'Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. ', 2, 1, '2024-05-27 18:01:32', '2024-05-27 18:01:32'),
(3, 'Pergunta ordenar 1?', 'Esta reposta é a número - 1', 'Esta reposta é a número - 2', 'Esta reposta é a número - 3', 'Esta reposta é a número - 4', 4321, 'Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. ', 'Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. ', 4, 1, '2024-05-27 18:01:32', '2024-05-27 18:01:32'),
(4, 'Pergunta escolha multipla 2?', 'Esta reposta está errada - 1', 'Esta reposta está errada - 2', 'Esta é a resposta correcta', 'Esta reposta está errada - 4', 3, 'Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. ', 'Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. ', 1, 1, '2024-05-27 18:01:32', '2024-05-27 18:01:32'),
(6, 'Pergunta verdadeiro ou false 2?', '', '', '', '', 2, 'Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. ', 'Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. ', 2, 1, '2024-05-27 18:01:32', '2024-05-27 18:01:32'),
(7, 'Pergunta ordenar 2?', 'Esta reposta é a número - 1', 'Esta reposta é a número - 2', 'Esta reposta é a número - 3', 'Esta reposta é a número - 4', 1234, 'Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. ', 'Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. ', 4, 1, '2024-05-27 18:01:32', '2024-05-27 18:01:32'),
(8, 'Pergunta escolha multipla 3?', 'Esta reposta está errada - 1', 'Esta é a resposta correcta', 'Esta reposta está errada - 3', 'Esta reposta está errada - 4', 2, 'Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. ', 'Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'Pergunta verdadeiro ou false 3?', '', '', '', '', 1, 'Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. ', 'Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. ', 2, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'Pergunta ordenar 3?', 'Esta reposta é a número - 1', 'Esta reposta é a número - 2', 'Esta reposta é a número - 3', 'Esta reposta é a número - 4', 4321, 'Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. ', 'Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. ', 4, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'Pergunta escolha multipla 4?', 'Esta reposta está errada - 1', 'Esta reposta está errada - 2', 'Esta é a resposta correcta', 'Esta reposta está errada - 4', 3, 'Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. ', 'Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'Pergunta verdadeiro ou false 4?', '', '', '', '', 2, 'Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. ', 'Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. ', 2, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'Pergunta ordenar 4?', 'Esta reposta é a número - 1', 'Esta reposta é a número - 2', 'Esta reposta é a número - 3', 'Esta reposta é a número - 4', 1234, 'Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. ', 'Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. ', 4, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'Pergunta escolha multipla 5?', 'Esta reposta está errada - 1', 'Esta é a resposta correcta', 'Esta reposta está errada - 3', 'Esta reposta está errada - 4', 2, 'Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. ', 'Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 'Pergunta verdadeiro ou false 5?', '', '', '', '', 1, 'Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. ', 'Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. ', 2, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 'Pergunta ordenar 5?', 'Esta reposta é a número - 1', 'Esta reposta é a número - 2', 'Esta reposta é a número - 3', 'Esta reposta é a número - 4', 4321, 'Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. ', 'Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. ', 4, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 'Pergunta escolha multipla 6?', 'Esta reposta está errada - 1', 'Esta reposta está errada - 2', 'Esta é a resposta correcta', 'Esta reposta está errada - 4', 3, 'Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. ', 'Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 'Pergunta verdadeiro ou false 6?', '', '', '', '', 2, 'Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. ', 'Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. ', 2, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 'Pergunta ordenar 6?', 'Esta reposta é a número - 1', 'Esta reposta é a número - 2', 'Esta reposta é a número - 3', 'Esta reposta é a número - 4', 1234, 'Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. ', 'Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. ', 4, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 'Pergunta escolha multipla 7?', 'Esta reposta está errada - 1', 'Esta é a resposta correcta', 'Esta reposta está errada - 3', 'Esta reposta está errada - 4', 2, 'Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. ', 'Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 'Pergunta verdadeiro ou false 7?', '', '', '', '', 1, 'Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. ', 'Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. ', 2, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 'Pergunta ordenar 7?', 'Esta reposta é a número - 1', 'Esta reposta é a número - 2', 'Esta reposta é a número - 3', 'Esta reposta é a número - 4', 4321, 'Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. ', 'Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. ', 4, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 'Pergunta escolha multipla 8?', 'Esta reposta está errada - 1', 'Esta reposta está errada - 2', 'Esta é a resposta correcta', 'Esta reposta está errada - 4', 3, 'Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. ', 'Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. ', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 'Pergunta verdadeiro ou false 8?', '', '', '', '', 2, 'Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. ', 'Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. ', 2, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 'Pergunta ordenar 8?', 'Esta reposta é a número - 1', 'Esta reposta é a número - 2', 'Esta reposta é a número - 3', 'Esta reposta é a número - 4', 1234, 'Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. Explicação mega detalhada. ', 'Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. Uma dica fundamental. ', 4, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `questiontypes`
--

CREATE TABLE `questiontypes` (
  `idquestionType` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `questiontypes`
--

INSERT INTO `questiontypes` (`idquestionType`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'multiplechoice', '2024-05-27 18:00:35', '2024-05-27 18:00:35'),
(2, 'truefalse', '2024-05-27 18:00:41', '2024-05-27 18:00:41'),
(3, 'drag', '2024-05-27 18:00:51', '2024-05-27 18:00:51'),
(4, 'order', '2024-05-27 18:01:22', '2024-05-27 18:01:22');

-- --------------------------------------------------------

--
-- Estrutura da tabela `userconditions`
--

CREATE TABLE `userconditions` (
  `idUserCondition` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `userfriends`
--

CREATE TABLE `userfriends` (
  `idUserFriends` int(11) NOT NULL,
  `idUser1` int(11) NOT NULL,
  `idUser2` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `userfriends`
--

INSERT INTO `userfriends` (`idUserFriends`, `idUser1`, `idUser2`, `createdAt`, `updatedAt`) VALUES
(10, 1, 3, '2024-06-05 10:39:24', '2024-06-05 10:39:24'),
(11, 1, 4, '2024-06-05 10:39:24', '2024-06-05 10:39:24'),
(12, 1, 5, '2024-06-05 10:39:24', '2024-06-05 10:39:24'),
(14, 1, 2, '2024-06-05 15:45:55', '2024-06-05 15:45:55'),
(15, 2, 1, '2024-06-05 15:45:55', '2024-06-05 15:45:55');

-- --------------------------------------------------------

--
-- Estrutura da tabela `userfriendsrequests`
--

CREATE TABLE `userfriendsrequests` (
  `idUserFriendsRequests` int(11) NOT NULL,
  `idUser1` int(11) NOT NULL,
  `idUser2` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `userfriendsrequests`
--

INSERT INTO `userfriendsrequests` (`idUserFriendsRequests`, `idUser1`, `idUser2`, `createdAt`, `updatedAt`) VALUES
(12, 1, 6, '2024-06-05 16:16:57', '2024-06-05 16:16:57');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `idUser` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `streak` int(11) NOT NULL DEFAULT 0,
  `level` int(11) NOT NULL DEFAULT 1,
  `points` int(11) NOT NULL DEFAULT 0,
  `weekly_points` int(11) NOT NULL DEFAULT 0,
  `img` varchar(255) NOT NULL DEFAULT 'img1',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`idUser`, `email`, `password`, `first_name`, `last_name`, `age`, `streak`, `level`, `points`, `weekly_points`, `img`, `createdAt`, `updatedAt`) VALUES
(1, 'filipe@gmail.com', '$2a$10$KrSWBKOPLXmNtukBzDED1.TJz82fLWZlKzEby8YUBCPIP4JThD5/a', 'Filipe', 'Cerqueira', 24, 4, 6, 54, 0, 'img11', '2024-05-14 18:39:43', '2024-06-05 17:21:01'),
(2, 'joao@gmail.com', '$2a$10$5qPkd7xbf0wqSobsmq661Oew68Gi62Ry/EAgIhqG8F05i2Rzrl43S', 'joao', 'miguel', 23, 2, 3, 23, 34, 'img1', '2024-06-04 14:11:36', '2024-06-04 14:11:36'),
(3, 'manuel@gmail.com', '$2a$10$5qPkd7xbf0wqSobsmq661Oew68Gi62Ry/EAgIhqG8F05i2Rzrl43S', 'manuel', 'miguel', 21, 6, 9, 78, 86, 'img3', '2024-06-04 14:11:36', '2024-06-04 14:11:36'),
(4, 'jose@gmail.com', '$2a$10$5qPkd7xbf0wqSobsmq661Oew68Gi62Ry/EAgIhqG8F05i2Rzrl43S', 'jose', 'andre', 22, 3, 2, 45, 56, 'img4', '2024-06-04 14:11:36', '2024-06-04 14:11:36'),
(5, 'mariana@gmail.com', '$2a$10$5qPkd7xbf0wqSobsmq661Oew68Gi62Ry/EAgIhqG8F05i2Rzrl43S', 'mariana', 'costa', 24, 5, 6, 11, 130, 'img5', '2024-06-04 14:11:36', '2024-06-04 14:11:36'),
(6, 'johny@gmail.com', '$2a$10$5qPkd7xbf0wqSobsmq661Oew68Gi62Ry/EAgIhqG8F05i2Rzrl43S', 'johny', 'costa', 24, 5, 6, 11, 130, 'img8', '2024-06-04 14:11:36', '2024-06-04 14:11:36'),
(7, 'Miguel@gmail.com', '$2a$10$5qPkd7xbf0wqSobsmq661Oew68Gi62Ry/EAgIhqG8F05i2Rzrl43S', 'Miguel', 'Pereira', 24, 5, 6, 11, 130, 'img6', '2024-06-04 14:11:36', '2024-06-04 14:11:36'),
(8, 'Luna@gmail.com', '$2a$10$5qPkd7xbf0wqSobsmq661Oew68Gi62Ry/EAgIhqG8F05i2Rzrl43S', 'Luna', 'José', 24, 5, 6, 11, 130, 'img2', '2024-06-04 14:11:36', '2024-06-04 14:11:36'),
(9, 'Antonio@gmail.com', '$2a$10$5qPkd7xbf0wqSobsmq661Oew68Gi62Ry/EAgIhqG8F05i2Rzrl43S', 'Antonio', 'Maria', 24, 5, 6, 11, 130, 'img3', '2024-06-04 14:11:36', '2024-06-04 14:11:36'),
(10, 'Raquel@gmail.com', '$2a$10$5qPkd7xbf0wqSobsmq661Oew68Gi62Ry/EAgIhqG8F05i2Rzrl43S', 'Raquel', 'Joana', 24, 5, 6, 11, 130, 'img5', '2024-06-04 14:11:36', '2024-06-04 14:11:36'),
(11, 'Laurinda@gmail.com', '$2a$10$5qPkd7xbf0wqSobsmq661Oew68Gi62Ry/EAgIhqG8F05i2Rzrl43S', 'Laurinda', 'Joana', 24, 5, 6, 11, 130, 'img6', '2024-06-04 14:11:36', '2024-06-04 14:11:36'),
(12, 'Matilde@gmail.com', '$2a$10$5qPkd7xbf0wqSobsmq661Oew68Gi62Ry/EAgIhqG8F05i2Rzrl43S', 'Matilde', 'Joana', 24, 5, 6, 11, 130, 'img12', '2024-06-04 14:11:36', '2024-06-04 14:11:36'),
(13, 'paulo@gmail.com', '$2a$10$/cotYFXDNQ3tViK3qQ4GSumu7Uc0Pdc8PixhSjaVoz0rRM6Sohdq6', 'Paulo', 'Matias', 34, 1, 1, 0, 0, 'img9', '2024-06-05 17:02:53', '2024-06-05 17:02:53');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `awards`
--
ALTER TABLE `awards`
  ADD PRIMARY KEY (`idAwards`),
  ADD KEY `category_id` (`category_id`);

--
-- Índices para tabela `awardsuservalues`
--
ALTER TABLE `awardsuservalues`
  ADD PRIMARY KEY (`idAwardsUserValues`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `award_id` (`award_id`);

--
-- Índices para tabela `missions`
--
ALTER TABLE `missions`
  ADD PRIMARY KEY (`idMission`),
  ADD KEY `user_id` (`user_id`);

--
-- Índices para tabela `performances`
--
ALTER TABLE `performances`
  ADD PRIMARY KEY (`idPerformance`),
  ADD UNIQUE KEY `correct_answers` (`correct_answers`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Índices para tabela `questioncategories`
--
ALTER TABLE `questioncategories`
  ADD PRIMARY KEY (`idquestionCategory`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Índices para tabela `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`idQuestion`),
  ADD UNIQUE KEY `description` (`description`),
  ADD KEY `type_id` (`type_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Índices para tabela `questiontypes`
--
ALTER TABLE `questiontypes`
  ADD PRIMARY KEY (`idquestionType`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Índices para tabela `userconditions`
--
ALTER TABLE `userconditions`
  ADD PRIMARY KEY (`idUserCondition`),
  ADD UNIQUE KEY `description` (`description`),
  ADD KEY `user_id` (`user_id`);

--
-- Índices para tabela `userfriends`
--
ALTER TABLE `userfriends`
  ADD PRIMARY KEY (`idUserFriends`);

--
-- Índices para tabela `userfriendsrequests`
--
ALTER TABLE `userfriendsrequests`
  ADD PRIMARY KEY (`idUserFriendsRequests`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idUser`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `awards`
--
ALTER TABLE `awards`
  MODIFY `idAwards` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `awardsuservalues`
--
ALTER TABLE `awardsuservalues`
  MODIFY `idAwardsUserValues` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `missions`
--
ALTER TABLE `missions`
  MODIFY `idMission` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `performances`
--
ALTER TABLE `performances`
  MODIFY `idPerformance` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `questioncategories`
--
ALTER TABLE `questioncategories`
  MODIFY `idquestionCategory` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `questions`
--
ALTER TABLE `questions`
  MODIFY `idQuestion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de tabela `questiontypes`
--
ALTER TABLE `questiontypes`
  MODIFY `idquestionType` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `userconditions`
--
ALTER TABLE `userconditions`
  MODIFY `idUserCondition` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `userfriends`
--
ALTER TABLE `userfriends`
  MODIFY `idUserFriends` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `userfriendsrequests`
--
ALTER TABLE `userfriendsrequests`
  MODIFY `idUserFriendsRequests` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `awards`
--
ALTER TABLE `awards`
  ADD CONSTRAINT `awards_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `questioncategories` (`idquestionCategory`);

--
-- Limitadores para a tabela `awardsuservalues`
--
ALTER TABLE `awardsuservalues`
  ADD CONSTRAINT `awardsuservalues_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`idUser`),
  ADD CONSTRAINT `awardsuservalues_ibfk_2` FOREIGN KEY (`award_id`) REFERENCES `awards` (`idAwards`);

--
-- Limitadores para a tabela `missions`
--
ALTER TABLE `missions`
  ADD CONSTRAINT `missions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`idUser`),
  ADD CONSTRAINT `missions_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `questioncategories` (`idquestionCategory`);

--
-- Limitadores para a tabela `performances`
--
ALTER TABLE `performances`
  ADD CONSTRAINT `performances_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `questioncategories` (`idquestionCategory`),
  ADD CONSTRAINT `performances_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`idUser`);

--
-- Limitadores para a tabela `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `questiontypes` (`idquestionType`),
  ADD CONSTRAINT `questions_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `questioncategories` (`idquestionCategory`);

--
-- Limitadores para a tabela `userconditions`
--
ALTER TABLE `userconditions`
  ADD CONSTRAINT `userconditions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`idUser`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
