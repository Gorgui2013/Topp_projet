-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Oct 04, 2021 at 06:54 PM
-- Server version: 5.7.28
-- PHP Version: 7.4.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `topp_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20211003144910', '2021-10-03 14:49:29', 489),
('DoctrineMigrations\\Version20211003232341', '2021-10-03 23:24:02', 6694);

-- --------------------------------------------------------

--
-- Table structure for table `projet`
--

DROP TABLE IF EXISTS `projet`;
CREATE TABLE IF NOT EXISTS `projet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `begin` datetime NOT NULL,
  `end` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_50159CA9A76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projet`
--

INSERT INTO `projet` (`id`, `user_id`, `name`, `description`, `begin`, `end`, `created_at`, `updated_at`) VALUES
(9, 1, 'Site web My Porfolio', 'Création de mon porfolio pour le web', '2021-09-24 00:00:00', '2021-09-28 00:00:00', '2021-10-04 18:16:42', '2021-10-04 18:16:42'),
(10, 1, 'Projet Génie Logiciel', 'Réalisation du projet génie logiciel avant le 04 Oct 2021', '2021-09-01 00:00:00', '2021-10-04 00:00:00', '2021-10-04 18:33:38', '2021-10-04 18:33:38');

-- --------------------------------------------------------

--
-- Table structure for table `step`
--

DROP TABLE IF EXISTS `step`;
CREATE TABLE IF NOT EXISTS `step` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projet_id` int(11) DEFAULT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_43B9FE3CC18272` (`projet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `step`
--

INSERT INTO `step` (`id`, `projet_id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(8, 9, 'Design', 'definition du design de mon porfolio', '2021-10-04 18:17:11', '2021-10-04 18:17:11'),
(9, 9, 'Back-end', 'développement du back-end', '2021-10-04 18:24:06', '2021-10-04 18:24:06'),
(10, 9, 'test', 'faire les tests', '2021-10-04 18:26:55', '2021-10-04 18:26:55'),
(11, 9, 'Déploiement', 'Déployer mon application', '2021-10-04 18:27:50', '2021-10-04 18:27:50'),
(14, 10, 'Choix du projet', 'faire des recherche', '2021-10-04 18:34:15', '2021-10-04 18:34:15'),
(15, 10, 'Design', 'travailler sur le design du projet', '2021-10-04 18:36:04', '2021-10-04 18:36:04'),
(16, 10, 'Développement', 'Développement de la partie back-end', '2021-10-04 18:39:01', '2021-10-04 18:39:01'),
(17, 10, 'Rapport projet', 'écrire le rapport du projet', '2021-10-04 18:43:01', '2021-10-04 18:43:01');

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
CREATE TABLE IF NOT EXISTS `task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `step_id` int(11) DEFAULT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `begin` datetime NOT NULL,
  `end` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_527EDB2573B21E9C` (`step_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `task`
--

INSERT INTO `task` (`id`, `step_id`, `name`, `description`, `begin`, `end`, `created_at`, `updated_at`) VALUES
(14, 8, 'cahier de charge', 'définition de mon cahier de charge', '2021-09-24 00:00:00', '2021-09-25 00:00:00', '2021-10-04 18:18:41', '2021-10-04 18:18:41'),
(15, 8, 'Wireframe', 'dessiner le prototype sur wireframe.cc', '2021-09-25 00:00:00', '2021-09-25 00:00:00', '2021-10-04 18:20:24', '2021-10-04 18:20:24'),
(16, 8, 'template', 'création du template sur webflow', '2021-09-25 00:00:00', '2021-09-27 00:00:00', '2021-10-04 18:21:31', '2021-10-04 18:21:31'),
(17, 8, 'Charte grafique', 'définition de la charte graphique', '2021-09-27 00:00:00', '2021-09-27 00:00:00', '2021-10-04 18:23:25', '2021-10-04 18:23:25'),
(19, 9, 'Technologies', 'Prise de main', '2021-09-27 00:00:00', '2021-09-27 00:00:00', '2021-10-04 18:25:50', '2021-10-04 18:25:50'),
(20, 9, 'Développement', 'développer la back-end', '2021-09-27 00:00:00', '2021-09-28 00:00:00', '2021-10-04 18:26:34', '2021-10-04 18:26:34'),
(21, 10, 'test', 'tester les fontionnalités', '2021-09-28 00:00:00', '2021-09-28 00:00:00', '2021-10-04 18:27:21', '2021-10-04 18:27:21'),
(22, 11, 'Déploiement', 'déployer l\'application', '2021-09-28 00:00:00', '2021-09-28 00:00:00', '2021-10-04 18:28:23', '2021-10-04 18:28:23'),
(23, 14, 'Recherche', 'faire des recherches sur la gestion des tache', '2021-09-01 00:00:00', '2021-09-04 00:00:00', '2021-10-04 18:34:56', '2021-10-04 18:34:56'),
(24, 14, 'Définition du projet', 'définir un projet dans le sujet de chercher', '2021-09-04 00:00:00', '2021-09-06 00:00:00', '2021-10-04 18:35:37', '2021-10-04 18:35:37'),
(25, 15, 'Wireframe', 'Définir un prototype sur wireframe.cc', '2021-09-06 00:00:00', '2021-09-07 00:00:00', '2021-10-04 18:36:40', '2021-10-04 18:36:40'),
(26, 15, 'Charte grafique', 'définir la charte graphique', '2021-09-07 00:00:00', '2021-09-10 00:00:00', '2021-10-04 18:37:29', '2021-10-04 18:37:29'),
(27, 15, 'template', 'réaliser le template avec bootstrap', '2021-09-10 00:00:00', '2021-09-12 00:00:00', '2021-10-04 18:38:17', '2021-10-04 18:38:17'),
(28, 16, 'Choix technologie', 'Choisir les technologie', '2021-09-12 00:00:00', '2021-09-13 00:00:00', '2021-10-04 18:39:32', '2021-10-04 18:39:32'),
(29, 16, 'Back-end', 'Travailler sur la back-end', '2021-09-13 00:00:00', '2021-09-15 00:00:00', '2021-10-04 18:40:04', '2021-10-04 18:40:04'),
(30, 16, 'Intégration template', 'Intégrer le template', '2021-09-16 00:00:00', '2021-09-17 00:00:00', '2021-10-04 18:40:49', '2021-10-04 18:40:49'),
(31, 16, 'Tests', 'Faire les tests', '2021-09-19 00:00:00', '2021-09-22 00:00:00', '2021-10-04 18:41:30', '2021-10-04 18:41:30'),
(32, 16, 'Dépôt sur github', 'Préparer le projet et le déposer sur github', '2021-09-24 00:00:00', '2021-09-25 00:00:00', '2021-10-04 18:42:38', '2021-10-04 18:42:38'),
(33, 17, 'Rédiger rapposrt du projet', 'Rédiger le rapport du projet', '2021-09-28 00:00:00', '2021-10-02 00:00:00', '2021-10-04 18:43:54', '2021-10-04 18:43:54'),
(34, 17, 'Envoyer', 'Envoyer le projet', '2021-10-04 00:00:00', '2021-10-04 00:00:00', '2021-10-04 18:44:28', '2021-10-04 18:44:28');

-- --------------------------------------------------------

--
-- Table structure for table `task_user`
--

DROP TABLE IF EXISTS `task_user`;
CREATE TABLE IF NOT EXISTS `task_user` (
  `task_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`task_id`,`user_id`),
  KEY `IDX_FE2042328DB60186` (`task_id`),
  KEY `IDX_FE204232A76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649F85E0677` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `roles`, `password`) VALUES
(1, 'fallou', '[\"ROLE_USER\"]', '$2y$13$xjAxFmTPT1TIeT7hygw.UOXFgzi9dnvlLLdDplpt4SG8MRK3/odEa'),
(2, 'diattara', '[\"ROLE_USER\"]', '$2y$13$xjAxFmTPT1TIeT7hygw.UOXFgzi9dnvlLLdDplpt4SG8MRK3/odEa');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `projet`
--
ALTER TABLE `projet`
  ADD CONSTRAINT `FK_50159CA9A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `step`
--
ALTER TABLE `step`
  ADD CONSTRAINT `FK_43B9FE3CC18272` FOREIGN KEY (`projet_id`) REFERENCES `projet` (`id`);

--
-- Constraints for table `task`
--
ALTER TABLE `task`
  ADD CONSTRAINT `FK_527EDB2573B21E9C` FOREIGN KEY (`step_id`) REFERENCES `step` (`id`);

--
-- Constraints for table `task_user`
--
ALTER TABLE `task_user`
  ADD CONSTRAINT `FK_FE2042328DB60186` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_FE204232A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
