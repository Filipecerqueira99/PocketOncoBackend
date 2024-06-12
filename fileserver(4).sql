-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 12, 2024 at 10:38 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fileserver`
--

-- --------------------------------------------------------

--
-- Table structure for table `awards`
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
-- Dumping data for table `awards`
--

INSERT INTO `awards` (`idAwards`, `description`, `goal`, `category_id`, `createdAt`, `updatedAt`) VALUES
(1, 'Iniciante', 20, 1, '2024-06-05 16:33:16', '2024-06-05 16:33:16'),
(2, 'Intermediário', 150, 1, '2024-06-05 16:33:16', '2024-06-05 16:33:16'),
(3, 'Bons conhecimentos', 200, 1, '2024-06-05 16:33:16', '2024-06-05 16:33:16'),
(4, 'Perito', 300, 1, '2024-06-05 16:33:16', '2024-06-05 16:33:16');

-- --------------------------------------------------------

--
-- Table structure for table `awardsuservalues`
--

CREATE TABLE `awardsuservalues` (
  `idAwardsUserValues` int(11) NOT NULL,
  `current_value` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `awardsuservalues`
--

INSERT INTO `awardsuservalues` (`idAwardsUserValues`, `current_value`, `user_id`, `category_id`, `createdAt`, `updatedAt`) VALUES
(6, 29, 1, 1, '2024-06-08 19:23:34', '2024-06-09 14:51:30'),
(7, 37, 1, 2, '2024-06-08 19:23:34', '2024-06-09 14:51:30'),
(8, 120, 1, 3, '2024-06-08 19:23:34', '2024-06-09 14:51:30'),
(9, 201, 1, 4, '2024-06-08 19:23:34', '2024-06-09 14:51:30'),
(10, 250, 1, 5, '2024-06-08 19:23:34', '2024-06-09 14:51:30'),
(11, 300, 1, 6, '2024-06-08 19:23:34', '2024-06-09 14:51:30'),
(12, 400, 1, 7, '2024-06-08 19:23:34', '2024-06-09 14:51:30'),
(13, 0, 1, 8, '2024-06-08 19:23:34', '2024-06-09 14:51:30'),
(14, 1, 1, 9, '2024-06-08 19:23:34', '2024-06-09 14:51:30'),
(15, 0, 2, 1, '2024-06-08 22:16:25', '2024-06-08 22:16:25'),
(16, 0, 2, 2, '2024-06-08 22:16:25', '2024-06-08 22:16:25'),
(17, 0, 2, 3, '2024-06-08 22:16:25', '2024-06-08 22:16:25'),
(18, 0, 2, 4, '2024-06-08 22:16:25', '2024-06-08 22:16:25'),
(19, 0, 2, 5, '2024-06-08 22:16:25', '2024-06-08 22:16:25'),
(20, 0, 2, 6, '2024-06-08 22:16:25', '2024-06-08 22:16:25'),
(21, 0, 2, 7, '2024-06-08 22:16:25', '2024-06-08 22:16:25'),
(22, 0, 2, 8, '2024-06-08 22:16:25', '2024-06-08 22:16:25'),
(23, 0, 2, 9, '2024-06-08 22:16:25', '2024-06-08 22:16:25');

-- --------------------------------------------------------

--
-- Table structure for table `missions`
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

--
-- Dumping data for table `missions`
--

INSERT INTO `missions` (`idMission`, `user_id`, `description`, `current_value`, `goal`, `category_id`, `completed`, `createdAt`, `updatedAt`) VALUES
(41, 1, 'Completa aulas na temática Ansiedade!', 0, 1, 5, 0, '2024-06-09 21:51:26', '2024-06-09 21:51:26'),
(42, 1, 'Completa aulas na temática Fadiga!', 0, 5, 4, 0, '2024-06-09 21:51:26', '2024-06-09 21:51:26'),
(43, 1, 'Completa aulas na temática Diarreia!', 0, 3, 7, 0, '2024-06-09 21:51:26', '2024-06-09 21:51:26');

-- --------------------------------------------------------

--
-- Table structure for table `performances`
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
-- Table structure for table `questioncategories`
--

CREATE TABLE `questioncategories` (
  `idquestionCategory` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questioncategories`
--

INSERT INTO `questioncategories` (`idquestionCategory`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'Dor', '2024-05-27 17:58:02', '2024-05-27 17:58:02'),
(2, 'Dispneia', '2024-06-08 00:56:10', '2024-06-08 00:56:10'),
(3, 'Insónia', '2024-06-08 00:56:10', '2024-06-08 00:56:10'),
(4, 'Fadiga', '2024-06-08 00:56:10', '2024-06-08 00:56:10'),
(5, 'Ansiedade', '2024-06-08 00:56:10', '2024-06-08 00:56:10'),
(6, 'Anorexia', '2024-06-08 00:56:10', '2024-06-08 00:56:10'),
(7, 'Diarreia', '2024-06-08 00:56:10', '2024-06-08 00:56:10'),
(8, 'Obstipação', '2024-06-08 00:56:10', '2024-06-08 00:56:10'),
(9, 'Vómitos', '2024-06-08 00:56:10', '2024-06-08 00:56:10');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
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

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`idQuestion`, `description`, `answer1`, `answer2`, `answer3`, `answer4`, `correctAnswer`, `explanation`, `tip`, `type_id`, `category_id`, `createdAt`, `updatedAt`) VALUES
(26, 'É verdade que pode estar a pieira. (Também conhecido por: “chieira” ou “gatinhos”).', '', '', '', '', 1, 'Verdadeiro, nomeadamente no cancro do pulmão.', 'Este sintoma está frequentemente associado a condições respiratórias, como o cancro de pulmão.', 2, 2, '2024-06-09 15:11:13', '2024-06-09 15:11:13'),
(27, 'Como se caracteriza a dispneia?', 'Não é mensurável', 'Cada profissional de saúde decide por si', 'Existe uma escala (escala de MRC) que auxilia a caracterização', 'Existe uma escala (escala de Borg)', 3, 'A dispneia é caracterizada pela sensação de falta de ar ou dificuldade em respirar. Não é um sintoma facilmente mensurável como a temperatura ou a pressão arterial, sendo mais subjetivo e baseado na percepção do paciente. Embora existam escalas, como a escala de MRC (Medical Research Council) e a escala de Borg, que podem auxiliar na avaliação da dispneia, sua interpretação pode variar entre profissionais de saúde. Essas escalas ajudam a quantificar o grau de dispneia com base na atividade física ou na sensação de esforço respiratório percebida pelo paciente.', 'A dispneia é frequentemente descrita como uma sensação de falta de ar ou dificuldade em respirar.', 1, 2, '2024-06-09 15:20:17', '2024-06-09 15:20:17'),
(28, 'É verdade que a dispneia nunca é um sintoma de alarme?', '', '', '', '', 0, 'Associado a outros sintomas pode estar associado a emergência oncológicas, como o tamponamento cardíaco.', 'A dispneia pode indicar condições médicas graves e deve ser avaliada por um profissional de saúde.', 2, 2, '2024-06-09 15:20:17', '2024-06-09 15:20:17'),
(29, 'É verdade que a acupuntura não está associada a benefícios na melhoria da dor em oncologia.', '', '', '', '', 2, 'Alguns estudos sugerem que a acupuntura pode ter alguns benefícios como terapêutica adjuvante na gestão da dor em oncologia.', 'Alguns estudos sugerem benefícios da acupuntura como terapia complementar para aliviar a dor em pacientes oncológicos.', 2, 1, '2024-06-09 15:29:32', '2024-06-09 15:29:32'),
(30, 'A dor é um sintoma que conseguimos medir objetivamente e identificar facilmente a causa.', '', '', '', '', 2, 'A dor é um sintoma multidimensional (física, sensorial e emocional) e subjetivo (pois só o próprio indivíduo a pode sentir e reportar-nos a sua experiência) para o qual nem sempre é possível identificar uma causa orgânica.', 'A dor é um sintoma complexo e subjetivo, muitas vezes não relacionado diretamente a uma causa específica e pode variar significativamente entre indivíduos.', 2, 1, '2024-06-09 15:29:32', '2024-06-09 15:29:32'),
(31, 'Como se progride no tratamento da dor? Ordena as opções.', 'Analgésicos não opioides, como paracetamol (ex: benuron) ou AINEs (ex: brufene ou aspirina)', 'Opióides fracos, como tramadol', 'Opioides fortes, como morfina', 'Técnicas invasivas para controlo da dor', 1234, 'No tratamento da dor, geralmente se progride de analgésicos não opioides, como paracetamol (ex: benuron) ou AINEs (ex: brufene ou aspirina), para opioides fracos, como tramadol, depois para opioides fortes, como morfina, e em seguida para técnicas invasivas para controle da dor.', 'No tratamento da dor, geralmente se progride de analgésicos não opioides, como paracetamol (ex: benuron) ou AINEs (ex: brufene ou aspirina), para opioides fracos, como tramadol, depois para opioides fortes, como morfina, e em seguida para técnicas invasivas para controle da dor.', 4, 1, '2024-06-09 15:29:32', '2024-06-09 15:29:32'),
(32, 'É verdade que o sonolência (contrária à insónia) nunca pode ser um sintoma oncológico.', '', '', '', '', 2, 'A sonolência também pode estar associada à oncologia, nomeadamente associada a outros sintomas como a fadiga ou manifestando efeitos secundários da medicação ou alterações cerebrais.', 'A sonolência também pode estar associada à oncologia, especialmente como efeito colateral de certos tratamentos ou como parte de sintomas relacionados à doença, como fadiga.', 2, 3, '2024-06-09 15:34:52', '2024-06-09 15:34:52'),
(33, 'É verdade que existem plantas, como a valeriana, que podem ter efeitos benéficos na insónia, apesar de não serem um medicamento.', '', '', '', '', 1, 'Alguns fitoterápicos, como a valeriana, têm sido estudados por seus potenciais efeitos benéficos na insônia, embora não sejam considerados medicamentos no sentido tradicional.', 'Alguns fitoterápicos, como a valeriana, têm sido estudados por seus potenciais efeitos benéficos na insônia, embora não sejam considerados medicamentos no sentido tradicional.\n', 2, 3, '2024-06-09 15:34:52', '2024-06-09 15:34:52'),
(36, 'A fadiga não é sempre expectável associada ao cancro, em caso de fadiga persistente que interfere com as tarefas da vida diária é importante contactar o seu médico.', '', '', '', '', 1, 'Embora a fadiga seja comum em pacientes com câncer, se for persistente e afetar significativamente as atividades diárias, é importante procurar orientação médica para avaliação e gerenciamento adequados.', 'Embora a fadiga seja comum em pacientes com câncer, se for persistente e afetar significativamente as atividades diárias, é importante procurar orientação médica para avaliação e gerenciamento adequados.', 2, 4, '2024-06-09 15:36:41', '2024-06-09 15:36:41'),
(37, 'O que pode ajudar a gerir a fadiga? Seleciona a falsa.', 'Exercício físico moderado, como caminhada e natação.', 'Hidratação e alimentação equilibrada e diversificada.', 'Manter-se de cama durante a maior parte do dia para evitar esforços.', 'Dividir os seus afazeres ao longo do dia, intercalados com períodos breves (<1 hora) de descanso.', 3, 'Manter-se de cama durante a maior parte do dia pode, na verdade, piorar a fadiga, levando a um declínio na condição física e no bem-estar mental. Atividades físicas moderadas, uma boa hidratação e alimentação, e a divisão de tarefas com intervalos de descanso são todas estratégias eficazes para a gestão da fadiga.', 'Pense no que ajuda a manter o corpo e a mente ativos e equilibrados ao longo do dia. Atividades que promovem a circulação sanguínea, fornecem nutrientes e permitem descanso adequado são geralmente benéficas. Evitar a inatividade prolongada e manter uma rotina equilibrada costuma ser a chave para gerir a fadiga de forma eficaz.', 1, 4, '2024-06-09 15:36:41', '2024-06-09 15:36:41'),
(38, 'Plantas, como a passiflora, não têm efeitos benéficos na ansiedade porque não são considerados medicamentos.', '', '', '', '', 2, 'A fitoterapia pode ter um papel adjuvante importante na gestão da ansiedade ligeira a moderada.', 'Fitoterápicos, como a passiflora, podem desempenhar um papel na gestão da ansiedade leve a moderada, embora não sejam classificados como medicamentos tradicionais.\n', 2, 4, '2024-06-09 15:41:36', '2024-06-09 15:41:36'),
(39, 'Estratégias como meditação, ioga e rir são estratégias não medicamentosas que ajudam a gerir a ansiedade.', '', '', '', '', 1, 'Técnicas de relaxamento, como meditação, ioga e risoterapia, podem ser eficazes na gestão da ansiedade, oferecendo abordagens não medicamentosas para o seu controle.', 'Técnicas de relaxamento, como meditação, ioga e risoterapia, podem ser eficazes na gestão da ansiedade, oferecendo abordagens não medicamentosas para o seu controle.', 2, 4, '2024-06-09 15:41:36', '2024-06-09 15:41:36'),
(40, 'O que é a anorexia?', 'É um sintoma que se caracteriza pela perda de apetite.', 'É uma doença que se caracteriza por uma diminuição da ingestão alimentar, associada a medo de ganhar peso e distorção da imagem corporal.', 'É um sintoma que se caracteriza pela perda do paladar.', 'É uma doença que se caracteriza por episódios de grande ingestão alimentar alternados com episódios de comportamento compensatório (como a toma de laxantes).', 1, 'Anorexia é uma condição caracterizada por uma diminuição significativa na ingestão de alimentos, frequentemente associada a um medo intenso de ganhar peso e uma distorção da imagem corporal.', 'Anorexia é uma condição caracterizada por uma diminuição significativa na ingestão de alimentos, frequentemente associada a um medo intenso de ganhar peso e uma distorção da imagem corporal.', 1, 6, '2024-06-09 15:43:20', '2024-06-09 15:43:20'),
(41, 'Que estratégias podem ajudar em caso de anorexia? Selecione a falsa.', 'Refeições mais pequenas e frequentes.', 'Beber grandes quantidades de líquidos durante as refeições.Falso, pois fará com que se sinta saciado mais depressa.', 'Ser flexível, comer quando tiver apetite e não em horários pré-definidos.', 'Evitar alimentos que causam inchaço, como repolho, brócolis e feijão; ou indigestão, como alimentos picantes.', 2, 'Falso, pois fará com que se sinta saciado mais depressa.', 'Evitar alimentos que causam inchaço, como repolho, brócolis e feijão, ou indigestão, como alimentos picantes, não é uma estratégia recomendada para ajudar em casos de anorexia.', 1, 6, '2024-06-09 15:43:20', '2024-06-09 15:43:20'),
(42, 'Como se caracteriza as fezes?', 'Existe uma escala (escala de Bristol) que auxilia a caracterização.', 'Cada profissional de saúde decide por si.', 'A descrição dada pelo paciente não deve ser tida em consideração.', 'Apenas se pode caracterizar se o doente deve levar uma amostra para a consulta.', 1, 'As fezes podem ser caracterizadas de acordo com a Escala de Bristol, que descreve diferentes tipos de fezes com base em sua forma e consistência, auxiliando na avaliação da saúde gastrointestinal.', 'As fezes podem ser caracterizadas de acordo com a Escala de Bristol, que descreve diferentes tipos de fezes com base em sua forma e consistência, auxiliando na avaliação da saúde gastrointestinal.', 1, 7, '2024-06-09 15:45:51', '2024-06-09 15:45:51'),
(43, 'É verdade que devemos reforçar a hidratação durante episódios de diarreia.', '', '', '', '', 1, 'A diarreia pode ser um sintoma auto-limitado que não precisa de medicação. No entanto, é importante reforçar a hidratação enquanto o quadro se resolve para evitar outras complicações.', 'Durante episódios de diarreia, é importante reforçar a hidratação para evitar a desidratação, pois a perda de líquidos pode ser significativa.', 2, 7, '2024-06-09 15:45:51', '2024-06-09 15:45:51'),
(44, 'Como sabemos se devemos valorizar a obstipação?', 'Devemos valorizar, assim que ficamos um dia sem defecar.', 'Devemos valorizar alterações persistentes do nosso trânsito intestinal, mesmo que seja normal para as pessoas que nos rodeiam.', 'Apenas devemos valorizar, se as pessoas que nos rodeiam considerarem que também não é normal para elas.', 'Só devemos valorizar se estivermos mais de 10 dias sem defecar.', 2, 'Devemos valorizar alterações persistentes no trânsito intestinal, mesmo que seja considerado normal pelas pessoas ao nosso redor.', 'Devemos valorizar alterações persistentes no trânsito intestinal, mesmo que seja considerado normal pelas pessoas ao nosso redor.', 1, 8, '2024-06-09 15:51:24', '2024-06-09 15:51:24'),
(45, 'É verdade que a atividade física regular pode ajudar com os sintomas de obstipação.', '', '', '', '', 1, 'Estimular o movimento intestinal e promove o funcionamento saudável do trato gastrointestinal.', 'Estimular o movimento intestinal e promove o funcionamento saudável do trato gastrointestinal.', 2, 8, '2024-06-09 15:51:24', '2024-06-09 15:51:24'),
(46, 'É verdade que existe medicação que pode ajudar com os vómitos.', '', '', '', '', 1, 'Existe uma classe de fármacos chamados de anti-eméticos que pode ajudar com este sintoma.', 'Existe uma classe de medicamentos chamados antieméticos que podem ajudar no controle e alívio dos vômitos.', 2, 9, '2024-06-09 15:52:48', '2024-06-09 15:52:48'),
(47, 'Qual a origem deste sintoma?', 'É um sintoma da doença.', 'É um efeito secundário da medicação.', 'Não se sabe, porque não é um sintoma comum em oncologia.', 'Pode ser um sintoma da doença ou um efeito secundário da medicação.', 4, 'Os vômitos podem ter origem tanto na própria doença quanto como efeito secundário de certos medicamentos utilizados no tratamento do câncer.', 'Os vômitos podem ter origem tanto na própria doença quanto como efeito secundário de certos medicamentos utilizados no tratamento do cancro.', 1, 9, '2024-06-09 15:52:48', '2024-06-09 15:52:48'),
(76, 'Qual dos seguintes é um analgésico comumente usado para tratar dor leve a moderada?', 'Paracetamol', 'Ibuprofeno', 'Morfina', 'Aspirina', 1, 'Paracetamol é frequentemente usado para dor leve a moderada.', 'É um medicamento comum encontrado em casa.', 1, 1, '2024-06-09 16:34:55', '2024-06-09 16:34:55'),
(77, 'A dor no cancro pode ser controlada com medicamentos adequados.', '', '', '', '', 1, 'Verdadeiro, com a medicação correta, a dor pode ser bem controlada.', 'Considere os tipos de medicamentos disponíveis.', 2, 1, '2024-06-09 16:34:55', '2024-06-09 16:34:55'),
(78, 'Ordene do mais eficaz para o menos eficaz no tratamento da dor oncológica.', 'Opioides', 'Analgésicos não-opioides', 'Adjuvantes analgésicos', 'Medicamentos tópicos', 1234, 'Os opioides são geralmente os mais eficazes, seguidos pelos analgésicos não-opioides e adjuvantes.', 'Pense na intensidade da dor que cada medicamento pode tratar.', 4, 1, '2024-06-09 16:34:55', '2024-06-09 16:34:55'),
(79, 'Qual é uma técnica comum para aliviar a dispneia?', 'Exercícios de respiração', 'Dieta especial', 'Exercícios de força', 'Medicamentos antivirais', 1, 'Os exercícios de respiração podem ajudar a aliviar a dispneia.', 'É uma técnica que ajuda a melhorar a função pulmonar.', 1, 2, '2024-06-09 16:34:55', '2024-06-09 16:34:55'),
(80, 'A dispneia pode ser um sintoma de cancro de pulmão.', '', '', '', '', 1, 'Verdadeiro, a dispneia é frequentemente um sintoma de cancro de pulmão.', 'Considere os sintomas respiratórios comuns em cancro de pulmão.', 2, 2, '2024-06-09 16:34:55', '2024-06-09 16:34:55'),
(81, 'Ordene as estratégias de manejo da dispneia do mais eficaz para o menos eficaz.', 'Oxigenoterapia', 'Ventilação não invasiva', 'Exercícios de respiração', 'Posicionamento adequado', 1234, 'Oxigenoterapia e ventilação não invasiva são geralmente mais eficazes.', 'Pense nas intervenções médicas primeiro.', 4, 2, '2024-06-09 16:34:55', '2024-06-09 16:34:55'),
(82, 'Qual das seguintes é uma estratégia para melhorar o sono?', 'Meditar antes de dormir', 'Beber café à noite', 'Fazer exercícios pesados antes de dormir', 'Assistir televisão na cama', 1, 'Meditar pode ajudar a relaxar e melhorar o sono.', 'Considere práticas de relaxamento.', 1, 3, '2024-06-09 16:34:55', '2024-06-09 16:34:55'),
(83, 'Evitar telas antes de dormir pode ajudar a melhorar a qualidade do sono.', '', '', '', '', 1, 'Verdadeiro, a luz azul das telas pode interferir no sono.', 'Pense nos hábitos saudáveis para dormir.', 2, 3, '2024-06-09 16:34:55', '2024-06-09 16:34:55'),
(84, 'Ordene as intervenções para insônia do mais eficaz para o menos eficaz.', 'Terapia cognitivo-comportamental', 'Medicação para dormir', 'Higiene do sono', 'Suplementos de melatonina', 1234, 'A terapia cognitivo-comportamental é geralmente mais eficaz.', 'Pense nas abordagens mais sustentáveis a longo prazo.', 4, 3, '2024-06-09 16:34:55', '2024-06-09 16:34:55'),
(85, 'Qual é uma maneira comum de gerenciar a fadiga relacionada ao cancro?', 'Descansar frequentemente', 'Evitar todas as atividades físicas', 'Tomar estimulantes', 'Dormir o dia todo', 1, 'Descansar frequentemente pode ajudar a gerenciar a fadiga.', 'Pense em como equilibrar a atividade e o descanso.', 1, 4, '2024-06-09 16:34:55', '2024-06-09 16:34:55'),
(86, 'Manter uma rotina regular de exercícios pode ajudar a reduzir a fadiga.', '', '', '', '', 1, 'Verdadeiro, exercícios regulares podem melhorar os níveis de energia.', 'Considere os benefícios do exercício para a saúde.', 2, 4, '2024-06-09 16:34:55', '2024-06-09 16:34:55'),
(87, 'Ordene as abordagens para lidar com a fadiga do mais importante para o menos importante.', 'Descanso adequado', 'Nutrição balanceada', 'Exercício leve', 'Terapia ocupacional', 1234, 'Descanso adequado é crucial, seguido por nutrição e exercício.', 'Pense no equilíbrio entre descanso e atividade.', 4, 4, '2024-06-09 16:34:55', '2024-06-09 16:34:55'),
(88, 'Qual é uma técnica comum para reduzir a ansiedade em pacientes com cancro?', 'Terapia cognitivo-comportamental', 'Evitar falar sobre sentimentos', 'Tomar café', 'Exercícios físicos intensos', 1, 'A terapia cognitivo-comportamental pode ser eficaz na redução da ansiedade.', 'Considere abordagens terapêuticas.', 1, 5, '2024-06-09 16:34:55', '2024-06-09 16:34:55'),
(89, 'A meditação pode ajudar a reduzir a ansiedade.', '', '', '', '', 1, 'Verdadeiro, a meditação é uma prática útil para reduzir a ansiedade.', 'Pense em técnicas de relaxamento.', 2, 5, '2024-06-09 16:34:55', '2024-06-09 16:34:55'),
(90, 'Ordene as técnicas para reduzir a ansiedade do mais eficaz para o menos eficaz.', 'Terapia cognitivo-comportamental', 'Meditação', 'Exercício físico', 'Grupos de apoio', 1234, 'A terapia cognitivo-comportamental é geralmente mais eficaz, seguida por meditação e exercício.', 'Pense nas abordagens que têm impacto direto no estado mental.', 4, 5, '2024-06-09 16:34:55', '2024-06-09 16:34:55'),
(91, 'Qual é uma intervenção nutricional comum para anorexia em pacientes com cancro?', 'Pequenas refeições frequentes', 'Jejum intermitente', 'Aumento de alimentos processados', 'Redução de ingestão de líquidos', 1, 'Pequenas refeições frequentes podem ajudar a aumentar a ingestão calórica.', 'Considere estratégias que aumentem a ingestão calórica sem sobrecarregar o paciente.', 1, 6, '2024-06-09 16:34:55', '2024-06-09 16:34:55'),
(92, 'Suplementos nutricionais podem ser úteis para pacientes com anorexia relacionada ao cancro.', '', '', '', '', 1, 'Verdadeiro, suplementos nutricionais podem ajudar a aumentar a ingestão calórica e de nutrientes.', 'Pense em opções de fácil digestão.', 2, 6, '2024-06-09 16:34:55', '2024-06-09 16:34:55'),
(93, 'Ordene as abordagens para combater a anorexia do mais eficaz para o menos eficaz.', 'Pequenas refeições frequentes', 'Suplementos nutricionais', 'Alimentos ricos em calorias', 'Aconselhamento nutricional', 1234, 'Pequenas refeições frequentes são geralmente mais eficazes, seguidas por suplementos e alimentos ricos em calorias.', 'Pense nas abordagens mais práticas e imediatas.', 4, 6, '2024-06-09 16:34:55', '2024-06-09 16:34:55'),
(94, 'Qual é uma medida preventiva para diarreia em pacientes com cancro?', 'Manter hidratação adequada', 'Evitar todos os alimentos sólidos', 'Tomar antibióticos sem prescrição', 'Reduzir a ingestão de líquidos', 1, 'Manter a hidratação adequada é crucial para prevenir a diarreia.', 'Considere a importância da hidratação.', 1, 7, '2024-06-09 16:34:55', '2024-06-09 16:34:55'),
(95, 'A diarreia pode levar à desidratação se não for tratada adequadamente.', '', '', '', '', 1, 'Verdadeiro, a diarreia pode causar desidratação se não for gerenciada.', 'Pense nas consequências da perda de líquidos.', 2, 7, '2024-06-09 16:34:55', '2024-06-09 16:34:55'),
(96, 'Ordene as intervenções para diarreia do mais importante para o menos importante.', 'Hidratação adequada', 'Dieta BRAT (Banana, Arroz, Purê de Maçã, Torrada)', 'Medicamentos antidiarreicos', 'Probióticos', 1234, 'A hidratação é crucial, seguida pela dieta BRAT e medicamentos.', 'Pense nas intervenções imediatas e eficazes.', 4, 7, '2024-06-09 16:34:55', '2024-06-09 16:34:55'),
(97, 'Qual das seguintes é uma maneira comum de prevenir a obstipação em pacientes com cancro?', 'Aumentar a ingestão de fibras', 'Reduzir a ingestão de líquidos', 'Evitar atividades físicas', 'Tomar suplementos de cálcio', 1, 'Aumentar a ingestão de fibras pode ajudar a prevenir a obstipação.', 'Considere os benefícios das fibras na dieta.', 1, 8, '2024-06-09 16:34:55', '2024-06-09 16:34:55'),
(98, 'Beber água suficiente pode ajudar a prevenir a obstipação.', '', '', '', '', 1, 'Verdadeiro, a hidratação adequada é importante para prevenir a obstipação.', 'Pense na importância da água para o sistema digestivo.', 2, 8, '2024-06-09 16:34:55', '2024-06-09 16:34:55'),
(99, 'Ordene as medidas para prevenir a obstipação do mais importante para o menos importante.', 'Hidratação adequada', 'Dieta rica em fibras', 'Exercício regular', 'Uso de laxantes quando necessário', 1234, 'A hidratação adequada é crucial, seguida por uma dieta rica em fibras e exercício regular.', 'Pense nas medidas mais naturais e preventivas primeiro.', 4, 8, '2024-06-09 16:34:55', '2024-06-09 16:34:55'),
(100, 'Qual é uma maneira comum de gerenciar náuseas e vômitos em pacientes com cancro?', 'Tomar antieméticos prescritos', 'Evitar todos os alimentos', 'Tomar analgésicos', 'Aumentar a ingestão de alimentos gordurosos', 1, 'Antieméticos prescritos são comumente usados para gerenciar náuseas e vômitos.', 'Considere os medicamentos específicos para náuseas.', 1, 9, '2024-06-09 16:34:55', '2024-06-09 16:34:55'),
(101, 'Comer pequenas refeições frequentes pode ajudar a reduzir náuseas.', '', '', '', '', 1, 'Verdadeiro, pequenas refeições frequentes podem ajudar a controlar as náuseas.', 'Pense em como o estômago reage a grandes refeições.', 2, 9, '2024-06-09 16:34:55', '2024-06-09 16:34:55'),
(102, 'Ordene as abordagens para controlar náuseas e vômitos do mais importante para o menos importante.', 'Antieméticos', 'Pequenas refeições frequentes', 'Hidratação adequada', 'Evitar alimentos desencadeantes', 1234, 'Antieméticos são frequentemente mais eficazes, seguidos por pequenas refeições e hidratação.', 'Pense nas abordagens medicamentosas e dietéticas.', 4, 9, '2024-06-09 16:34:55', '2024-06-09 16:34:55');

-- --------------------------------------------------------

--
-- Table structure for table `questiontypes`
--

CREATE TABLE `questiontypes` (
  `idquestionType` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questiontypes`
--

INSERT INTO `questiontypes` (`idquestionType`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'multiplechoice', '2024-05-27 18:00:35', '2024-05-27 18:00:35'),
(2, 'truefalse', '2024-05-27 18:00:41', '2024-05-27 18:00:41'),
(3, 'drag', '2024-05-27 18:00:51', '2024-05-27 18:00:51'),
(4, 'order', '2024-05-27 18:01:22', '2024-05-27 18:01:22');

-- --------------------------------------------------------

--
-- Table structure for table `userconditions`
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
-- Table structure for table `userfriends`
--

CREATE TABLE `userfriends` (
  `idUserFriends` int(11) NOT NULL,
  `idUser1` int(11) NOT NULL,
  `idUser2` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userfriends`
--

INSERT INTO `userfriends` (`idUserFriends`, `idUser1`, `idUser2`, `createdAt`, `updatedAt`) VALUES
(10, 1, 3, '2024-06-05 10:39:24', '2024-06-05 10:39:24'),
(11, 1, 4, '2024-06-05 10:39:24', '2024-06-05 10:39:24'),
(12, 1, 5, '2024-06-05 10:39:24', '2024-06-05 10:39:24'),
(14, 1, 2, '2024-06-05 15:45:55', '2024-06-05 15:45:55'),
(15, 2, 1, '2024-06-05 15:45:55', '2024-06-05 15:45:55');

-- --------------------------------------------------------

--
-- Table structure for table `userfriendsrequests`
--

CREATE TABLE `userfriendsrequests` (
  `idUserFriendsRequests` int(11) NOT NULL,
  `idUser1` int(11) NOT NULL,
  `idUser2` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userfriendsrequests`
--

INSERT INTO `userfriendsrequests` (`idUserFriendsRequests`, `idUser1`, `idUser2`, `createdAt`, `updatedAt`) VALUES
(12, 1, 6, '2024-06-05 16:16:57', '2024-06-05 16:16:57');

-- --------------------------------------------------------

--
-- Table structure for table `users`
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
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`idUser`, `email`, `password`, `first_name`, `last_name`, `age`, `streak`, `level`, `points`, `weekly_points`, `today`, `img`, `createdAt`, `updatedAt`) VALUES
(1, 'filipe@gmail.com', '$2a$10$KrSWBKOPLXmNtukBzDED1.TJz82fLWZlKzEby8YUBCPIP4JThD5/a', 'Filipe', 'Cerqueira', 24, 9, 7, 32, 0, 12, 'img11', '2024-05-14 18:39:43', '2024-06-12 08:34:17'),
(2, 'joao@gmail.com', '$2a$10$5qPkd7xbf0wqSobsmq661Oew68Gi62Ry/EAgIhqG8F05i2Rzrl43S', 'joao', 'miguel', 23, 2, 3, 23, 34, 0, 'img1', '2024-06-04 14:11:36', '2024-06-04 14:11:36'),
(3, 'manuel@gmail.com', '$2a$10$5qPkd7xbf0wqSobsmq661Oew68Gi62Ry/EAgIhqG8F05i2Rzrl43S', 'manuel', 'miguel', 21, 6, 9, 78, 86, 0, 'img3', '2024-06-04 14:11:36', '2024-06-04 14:11:36'),
(4, 'jose@gmail.com', '$2a$10$5qPkd7xbf0wqSobsmq661Oew68Gi62Ry/EAgIhqG8F05i2Rzrl43S', 'jose', 'andre', 22, 3, 2, 45, 56, 0, 'img4', '2024-06-04 14:11:36', '2024-06-04 14:11:36'),
(5, 'mariana@gmail.com', '$2a$10$5qPkd7xbf0wqSobsmq661Oew68Gi62Ry/EAgIhqG8F05i2Rzrl43S', 'mariana', 'costa', 24, 5, 6, 11, 130, 0, 'img5', '2024-06-04 14:11:36', '2024-06-04 14:11:36'),
(6, 'johny@gmail.com', '$2a$10$5qPkd7xbf0wqSobsmq661Oew68Gi62Ry/EAgIhqG8F05i2Rzrl43S', 'johny', 'costa', 24, 5, 6, 11, 130, 0, 'img8', '2024-06-04 14:11:36', '2024-06-04 14:11:36'),
(7, 'Miguel@gmail.com', '$2a$10$5qPkd7xbf0wqSobsmq661Oew68Gi62Ry/EAgIhqG8F05i2Rzrl43S', 'Miguel', 'Pereira', 24, 5, 6, 11, 130, 0, 'img6', '2024-06-04 14:11:36', '2024-06-04 14:11:36'),
(8, 'Luna@gmail.com', '$2a$10$5qPkd7xbf0wqSobsmq661Oew68Gi62Ry/EAgIhqG8F05i2Rzrl43S', 'Luna', 'José', 24, 5, 6, 11, 130, 0, 'img2', '2024-06-04 14:11:36', '2024-06-04 14:11:36'),
(9, 'Antonio@gmail.com', '$2a$10$5qPkd7xbf0wqSobsmq661Oew68Gi62Ry/EAgIhqG8F05i2Rzrl43S', 'Antonio', 'Maria', 24, 5, 6, 11, 130, 0, 'img3', '2024-06-04 14:11:36', '2024-06-04 14:11:36'),
(10, 'Raquel@gmail.com', '$2a$10$5qPkd7xbf0wqSobsmq661Oew68Gi62Ry/EAgIhqG8F05i2Rzrl43S', 'Raquel', 'Joana', 24, 5, 6, 11, 130, 0, 'img5', '2024-06-04 14:11:36', '2024-06-04 14:11:36'),
(11, 'Laurinda@gmail.com', '$2a$10$5qPkd7xbf0wqSobsmq661Oew68Gi62Ry/EAgIhqG8F05i2Rzrl43S', 'Laurinda', 'Joana', 24, 5, 6, 11, 130, 0, 'img6', '2024-06-04 14:11:36', '2024-06-04 14:11:36'),
(12, 'Matilde@gmail.com', '$2a$10$5qPkd7xbf0wqSobsmq661Oew68Gi62Ry/EAgIhqG8F05i2Rzrl43S', 'Matilde', 'Joana', 24, 5, 6, 11, 130, 0, 'img12', '2024-06-04 14:11:36', '2024-06-04 14:11:36'),
(13, 'paulo@gmail.com', '$2a$10$/cotYFXDNQ3tViK3qQ4GSumu7Uc0Pdc8PixhSjaVoz0rRM6Sohdq6', 'Paulo', 'Matias', 34, 1, 1, 0, 0, 0, 'img9', '2024-06-05 17:02:53', '2024-06-05 17:02:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `awards`
--
ALTER TABLE `awards`
  ADD PRIMARY KEY (`idAwards`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `awardsuservalues`
--
ALTER TABLE `awardsuservalues`
  ADD PRIMARY KEY (`idAwardsUserValues`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `missions`
--
ALTER TABLE `missions`
  ADD PRIMARY KEY (`idMission`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `missions_ibfk_2` (`category_id`);

--
-- Indexes for table `performances`
--
ALTER TABLE `performances`
  ADD PRIMARY KEY (`idPerformance`),
  ADD UNIQUE KEY `correct_answers` (`correct_answers`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `questioncategories`
--
ALTER TABLE `questioncategories`
  ADD PRIMARY KEY (`idquestionCategory`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`idQuestion`),
  ADD UNIQUE KEY `description` (`description`),
  ADD KEY `type_id` (`type_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `questiontypes`
--
ALTER TABLE `questiontypes`
  ADD PRIMARY KEY (`idquestionType`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `userconditions`
--
ALTER TABLE `userconditions`
  ADD PRIMARY KEY (`idUserCondition`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `questionCategory_id` (`questionCategory_id`);

--
-- Indexes for table `userfriends`
--
ALTER TABLE `userfriends`
  ADD PRIMARY KEY (`idUserFriends`);

--
-- Indexes for table `userfriendsrequests`
--
ALTER TABLE `userfriendsrequests`
  ADD PRIMARY KEY (`idUserFriendsRequests`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idUser`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `awards`
--
ALTER TABLE `awards`
  MODIFY `idAwards` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `awardsuservalues`
--
ALTER TABLE `awardsuservalues`
  MODIFY `idAwardsUserValues` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `missions`
--
ALTER TABLE `missions`
  MODIFY `idMission` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `performances`
--
ALTER TABLE `performances`
  MODIFY `idPerformance` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `questioncategories`
--
ALTER TABLE `questioncategories`
  MODIFY `idquestionCategory` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `idQuestion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `questiontypes`
--
ALTER TABLE `questiontypes`
  MODIFY `idquestionType` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `userconditions`
--
ALTER TABLE `userconditions`
  MODIFY `idUserCondition` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userfriends`
--
ALTER TABLE `userfriends`
  MODIFY `idUserFriends` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `userfriendsrequests`
--
ALTER TABLE `userfriendsrequests`
  MODIFY `idUserFriendsRequests` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `awards`
--
ALTER TABLE `awards`
  ADD CONSTRAINT `awards_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `questioncategories` (`idquestionCategory`);

--
-- Constraints for table `awardsuservalues`
--
ALTER TABLE `awardsuservalues`
  ADD CONSTRAINT `awardsuservalues_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`idUser`),
  ADD CONSTRAINT `awardsuservalues_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `questionCategories` (`idquestionCategory`);

--
-- Constraints for table `missions`
--
ALTER TABLE `missions`
  ADD CONSTRAINT `missions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`idUser`),
  ADD CONSTRAINT `missions_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `questioncategories` (`idquestionCategory`);

--
-- Constraints for table `performances`
--
ALTER TABLE `performances`
  ADD CONSTRAINT `performances_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `questioncategories` (`idquestionCategory`),
  ADD CONSTRAINT `performances_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`idUser`);

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `questiontypes` (`idquestionType`),
  ADD CONSTRAINT `questions_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `questioncategories` (`idquestionCategory`);

--
-- Constraints for table `userconditions`
--
ALTER TABLE `userconditions`
  ADD CONSTRAINT `userconditions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`idUser`),
  ADD CONSTRAINT `userconditions_ibfk_2` FOREIGN KEY (`questionCategory_id`) REFERENCES `questioncategories` (`idquestionCategory`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
