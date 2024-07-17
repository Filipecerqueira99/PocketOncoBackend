-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 17-Jul-2024 às 13:06
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

-- --------------------------------------------------------

--
-- Estrutura da tabela `awardsuservalues`
--

CREATE TABLE `awardsuservalues` (
  `idAwardsUserValues` int(11) NOT NULL,
  `current_value` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `completed` int(11) NOT NULL DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Estrutura da tabela `questions`
--

CREATE TABLE `questions` (
  `idQuestion` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `answer1` varchar(255) NOT NULL,
  `answer2` varchar(255) NOT NULL,
  `answer3` varchar(255) NOT NULL,
  `answer4` varchar(255) NOT NULL,
  `correctAnswer` int(11) NOT NULL,
  `explanation` varchar(1000) NOT NULL,
  `tip` varchar(500) NOT NULL,
  `type_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Estrutura da tabela `userconditions`
--

CREATE TABLE `userconditions` (
  `idUserCondition` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `questionCategory_id` int(11) NOT NULL,
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
  `today` int(11) NOT NULL DEFAULT 0,
  `img` varchar(255) NOT NULL DEFAULT 'img1',
  `passwordCode` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  ADD KEY `category_id` (`category_id`);

--
-- Índices para tabela `missions`
--
ALTER TABLE `missions`
  ADD PRIMARY KEY (`idMission`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `missions_ibfk_2` (`category_id`);

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
  ADD KEY `user_id` (`user_id`),
  ADD KEY `questionCategory_id` (`questionCategory_id`);

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
  MODIFY `idAwards` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `awardsuservalues`
--
ALTER TABLE `awardsuservalues`
  MODIFY `idAwardsUserValues` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `missions`
--
ALTER TABLE `missions`
  MODIFY `idMission` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `performances`
--
ALTER TABLE `performances`
  MODIFY `idPerformance` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `questioncategories`
--
ALTER TABLE `questioncategories`
  MODIFY `idquestionCategory` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `questions`
--
ALTER TABLE `questions`
  MODIFY `idQuestion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `questiontypes`
--
ALTER TABLE `questiontypes`
  MODIFY `idquestionType` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `userconditions`
--
ALTER TABLE `userconditions`
  MODIFY `idUserCondition` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `userfriends`
--
ALTER TABLE `userfriends`
  MODIFY `idUserFriends` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `userfriendsrequests`
--
ALTER TABLE `userfriendsrequests`
  MODIFY `idUserFriendsRequests` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `awardsuservalues_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `questioncategories` (`idquestionCategory`);

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
  ADD CONSTRAINT `userconditions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`idUser`),
  ADD CONSTRAINT `userconditions_ibfk_2` FOREIGN KEY (`questionCategory_id`) REFERENCES `questioncategories` (`idquestionCategory`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
