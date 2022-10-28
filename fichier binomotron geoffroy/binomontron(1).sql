-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : db
-- Généré le : ven. 28 oct. 2022 à 12:17
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `binomontron`
--

-- --------------------------------------------------------

--
-- Structure de la table `eleves`
--

CREATE TABLE `eleves` (
  `noms` varchar(50) NOT NULL,
  `prénoms` varchar(50) NOT NULL,
  `adresse_mail` varchar(50) NOT NULL,
  `id` int NOT NULL,
  `xp` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `eleves`
--

INSERT INTO `eleves` (`noms`, `prénoms`, `adresse_mail`, `id`, `xp`) VALUES
('LE GRAND', 'Kevin', 'kevin.le-grand@isen-ouest.yncrea.fr', 1, 1),
('PETIARD', 'Harold', 'harold.petiard@isen-ouest.yncrea.fr', 2, 1),
('SCANU', 'David', 'david.scanu@isen-ouest.yncrea.fr', 3, 1),
('ANCELIN', 'Antoine', 'antoine.ancelin@isen-ouest.yncrea.fr', 4, 1),
('JOURNAUX', 'Johann', 'johann.journaux@isen-ouest.yncrea.fr', 5, 1),
('LEBARBIER', 'Charley', 'charley.lebarbier@isen-ouest.yncrea.fr', 6, 1),
('DIABY', 'Amadou', 'amadou.diaby@isen-ouest.yncrea.fr', 7, 1),
('DAUMER', 'Geoffroy', 'geoffroy.daumer@isen-ouest.yncrea.fr', 8, 1),
('JULES', 'Dimitri', 'dimitri.jules@isen-ouest.yncrea.fr', 9, 1),
('GUERIN', 'Basile', 'basile.guerin@isen-ouest.yncrea.fr', 10, 1),
('OSWALD', 'Viacheslav', 'viacheslav.oswald@isen-ouest.yncrea.fr', 11, 1),
('DUSSART', 'Ramata Soraya', 'ramata-soraya.dussart@isen-ouest.yncrea.fr', 12, 1),
('ZOUITEN', 'Guinel', 'guinel.zouiten@isen-ouest.yncrea.fr', 13, 1);

-- --------------------------------------------------------

--
-- Structure de la table `eleve_groupe`
--

CREATE TABLE `eleve_groupe` (
  `id_eleve_groupe` int NOT NULL,
  `id_eleves` varchar(50) NOT NULL,
  `id_groupes` int NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `eleve_groupe`
--

INSERT INTO `eleve_groupe` (`id_eleve_groupe`, `id_eleves`, `id_groupes`, `date`) VALUES
(1, 'Charley', 1, '2022-10-28'),
(2, 'Harold', 1, '2022-10-28'),
(3, 'David', 2, '2022-10-28'),
(4, 'Kevin', 2, '2022-10-28'),
(5, 'Geoffroy', 3, '2022-10-28'),
(6, 'Johann', 3, '2022-10-28'),
(7, 'Viacheslav', 4, '2022-10-28'),
(8, 'Antoine', 4, '2022-10-28'),
(9, 'Guinel', 5, '2022-10-28'),
(10, 'Ramata Soraya', 5, '2022-10-28'),
(11, 'Basile', 6, '2022-10-28'),
(12, 'Amadou', 6, '2022-10-28'),
(13, 'Dimitri', 7, '2022-10-28');

-- --------------------------------------------------------

--
-- Structure de la table `experience`
--

CREATE TABLE `experience` (
  `niveau experience` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_xp` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `experience`
--

INSERT INTO `experience` (`niveau experience`, `id_xp`) VALUES
('aucune', 1),
('a deja essayé un peu de coder', 2),
('bon ', 3);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `eleves`
--
ALTER TABLE `eleves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `xp` (`xp`);

--
-- Index pour la table `eleve_groupe`
--
ALTER TABLE `eleve_groupe`
  ADD PRIMARY KEY (`id_eleve_groupe`),
  ADD KEY `id_eleves` (`id_eleves`),
  ADD KEY `id_groupes` (`id_groupes`);

--
-- Index pour la table `experience`
--
ALTER TABLE `experience`
  ADD PRIMARY KEY (`id_xp`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `eleves`
--
ALTER TABLE `eleves`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `eleve_groupe`
--
ALTER TABLE `eleve_groupe`
  MODIFY `id_eleve_groupe` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT pour la table `experience`
--
ALTER TABLE `experience`
  MODIFY `id_xp` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `eleves`
--
ALTER TABLE `eleves`
  ADD CONSTRAINT `eleves_ibfk_1` FOREIGN KEY (`xp`) REFERENCES `experience` (`id_xp`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
