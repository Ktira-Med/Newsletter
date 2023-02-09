-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : jeu. 09 fév. 2023 à 13:44
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

-- --------------------------------------------------------

--
-- Structure de la table `interests`
--

CREATE TABLE `interests` (
  `id` int NOT NULL,
  `interest_label` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `interests`
--

INSERT INTO `interests` (`id`, `interest_label`) VALUES
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
-- Structure de la table `origins`
--

CREATE TABLE `origins` (
  `id` int NOT NULL,
  `origin_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `origins`
--

INSERT INTO `origins` (`id`, `origin_label`) VALUES
(1, 'A friend told me about it'),
(2, 'Research on the Internet'),
(3, 'Advertisement in a magazine');

-- --------------------------------------------------------

--
-- Structure de la table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` int NOT NULL,
  `created_on` datetime NOT NULL,
  `email` varchar(255) NOT NULL,
  `firstname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `lastname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `origin_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `subscribers`
--

INSERT INTO `subscribers` (`id`, `created_on`, `email`, `firstname`, `lastname`, `origin_id`) VALUES
(56, '2023-02-09 13:40:54', 'alfred.dupont@gmail.com', 'Alfred', 'Dupont', NULL),
(57, '2023-02-09 13:40:54', 'b.lav@hotmail.fr', 'Bertrand', 'Lavoisier', NULL),
(58, '2023-02-09 13:40:54', 'sarahlamine@gmail.com', 'Sarah', 'Lamine', NULL),
(59, '2023-02-09 13:40:54', 'mo78@laposte.net', 'Mohamed', 'Ben Salam', NULL);

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
-- Index pour la table `interests`
--
ALTER TABLE `interests`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `interest` (`interest_label`);

--
-- Index pour la table `origins`
--
ALTER TABLE `origins`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `origin-id` (`origin_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `interests`
--
ALTER TABLE `interests`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `origins`
--
ALTER TABLE `origins`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `fill_interest`
--
ALTER TABLE `fill_interest`
  ADD CONSTRAINT `Fk_interest_id` FOREIGN KEY (`interest_id`) REFERENCES `interests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_subscriber_id` FOREIGN KEY (`subscriber_id`) REFERENCES `subscribers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `subscribers`
--
ALTER TABLE `subscribers`
  ADD CONSTRAINT `Fk_origin_id` FOREIGN KEY (`origin_id`) REFERENCES `origins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
