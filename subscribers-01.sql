-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : jeu. 11 mai 2023 à 15:15
-- Version du serveur : 8.0.30
-- Version de PHP : 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `subscribers-01`
--

-- --------------------------------------------------------

--
-- Structure de la table `fill_interest`
--

CREATE TABLE `fill_interest` (
  `subscriber_id` int NOT NULL,
  `interest_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `fill_interest`
--

INSERT INTO `fill_interest` (`subscriber_id`, `interest_id`) VALUES
(145, 4);

-- --------------------------------------------------------

--
-- Structure de la table `interest`
--

CREATE TABLE `interest` (
  `id` int NOT NULL,
  `interest_label` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `interest`
--

INSERT INTO `interest` (`id`, `interest_label`) VALUES
(4, 'Art\r\n'),
(5, 'Contemporary'),
(7, 'Digital art\r\n'),
(8, 'Facilities'),
(6, 'Movies'),
(1, 'Paint'),
(3, 'Photography'),
(2, 'Sculpture');

-- --------------------------------------------------------

--
-- Structure de la table `origine`
--

CREATE TABLE `origine` (
  `id` int NOT NULL,
  `origine_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `origine`
--

INSERT INTO `origine` (`id`, `origine_label`) VALUES
(1, 'A friend told me about it'),
(2, 'Research on the Internet'),
(3, 'Advertisement in a magazine');

-- --------------------------------------------------------

--
-- Structure de la table `subscriber`
--

CREATE TABLE `subscriber` (
  `id` int NOT NULL,
  `created_on` datetime NOT NULL,
  `email` varchar(255) NOT NULL,
  `firstname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `lastname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `origin_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `subscriber`
--

INSERT INTO `subscriber` (`id`, `created_on`, `email`, `firstname`, `lastname`, `origin_id`) VALUES
(56, '2023-02-09 13:40:54', 'alfred.dupont@gmail.com', 'Alfred', 'Dupont', NULL),
(57, '2023-02-09 13:40:54', 'b.lav@hotmail.fr', 'Bertrand', 'Lavoisier', NULL),
(58, '2023-02-09 13:40:54', 'sarahlamine@gmail.com', 'Sarah', 'Lamine', NULL),
(145, '2023-05-01 21:06:53', 'mo78@laposte.net', 'Mohamed', 'Ben Salam', NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `fill_interest`
--
ALTER TABLE `fill_interest`
  ADD KEY `Fk_subscriber_id` (`subscriber_id`),
  ADD KEY `Fk_interest_id` (`interest_id`);

--
-- Index pour la table `interest`
--
ALTER TABLE `interest`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `interest` (`interest_label`);

--
-- Index pour la table `origine`
--
ALTER TABLE `origine`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `subscriber`
--
ALTER TABLE `subscriber`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `origin-id` (`origin_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `interest`
--
ALTER TABLE `interest`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `origine`
--
ALTER TABLE `origine`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `subscriber`
--
ALTER TABLE `subscriber`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `fill_interest`
--
ALTER TABLE `fill_interest`
  ADD CONSTRAINT `Fk_interest_id` FOREIGN KEY (`interest_id`) REFERENCES `interest` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_subscriber_id` FOREIGN KEY (`subscriber_id`) REFERENCES `subscriber` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `subscriber`
--
ALTER TABLE `subscriber`
  ADD CONSTRAINT `Fk_origin_id` FOREIGN KEY (`origin_id`) REFERENCES `origine` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
