-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 19 avr. 2024 à 09:31
-- Version du serveur :  10.3.17-MariaDB
-- Version de PHP :  7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `mgsb`
--

-- --------------------------------------------------------

--
-- Structure de la table `etat`
--

CREATE TABLE `etat` (
  `id` int(11) NOT NULL,
  `libelle` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `etat`
--

INSERT INTO `etat` (`id`, `libelle`) VALUES
(1, 'Créer'),
(2, 'Cloturée'),
(3, 'Validée'),
(4, 'Mise en paiement'),
(5, 'Rembourser');

-- --------------------------------------------------------

--
-- Structure de la table `fichefrais`
--

CREATE TABLE `fichefrais` (
  `id` int(11) NOT NULL,
  `nbJustificatif` int(11) NOT NULL,
  `montantValide` float NOT NULL,
  `dateMotif` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `mois` text NOT NULL,
  `annee` int(11) NOT NULL,
  `etat_id` int(11) NOT NULL DEFAULT 1,
  `user_id` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `fichefrais`
--

INSERT INTO `fichefrais` (`id`, `nbJustificatif`, `montantValide`, `dateMotif`, `mois`, `annee`, `etat_id`, `user_id`) VALUES
(6, 156, 554, '2023-11-29 23:00:00', 'novembre', 2023, 1, '87161a0b-a17f-4a67-9286-c5f5d98f685e'),
(7, 4455, 455, '2023-11-08 23:00:00', 'novembre', 2023, 1, '87161a0b-a17f-4a67-9286-c5f5d98f685e'),
(8, 14552, 7862, '2023-11-14 23:00:00', 'decembre', 2023, 1, '87161a0b-a17f-4a67-9286-c5f5d98f685e'),
(9, 123, 999, '2024-03-06 14:06:44', '07', 2024, 1, '9ca81cba-62d8-408c-9c13-eb9611e211ab'),
(13, 666, 45, '2024-03-14 15:21:43', '12', 2024, 1, '9ca81cba-62d8-408c-9c13-eb9611e211ab'),
(15, 123, 465, '2024-03-14 13:45:20', '02', 2024, 1, '9ca81cba-62d8-408c-9c13-eb9611e211ab'),
(16, 741, 852, '2024-03-14 14:22:43', '12', 2024, 1, '9ca81cba-62d8-408c-9c13-eb9611e211ab'),
(17, 7410, 12321, '2024-03-14 14:50:33', '6', 2004, 1, '9ca81cba-62d8-408c-9c13-eb9611e211ab');

-- --------------------------------------------------------

--
-- Structure de la table `fichefrais_lignefraisforfait`
--

CREATE TABLE `fichefrais_lignefraisforfait` (
  `FicheFrais_id` int(11) NOT NULL,
  `LigneFraisForfait_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `fichefrais_lignefraisforfait`
--

INSERT INTO `fichefrais_lignefraisforfait` (`FicheFrais_id`, `LigneFraisForfait_id`) VALUES
(9, 2),
(9, 3);

-- --------------------------------------------------------

--
-- Structure de la table `fichefrais_lignefraishorsforfait`
--

CREATE TABLE `fichefrais_lignefraishorsforfait` (
  `FicheFrais_id` int(11) NOT NULL,
  `LigneFraisHorsForfait_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `fichefrais_lignefraishorsforfait`
--

INSERT INTO `fichefrais_lignefraishorsforfait` (`FicheFrais_id`, `LigneFraisHorsForfait_id`) VALUES
(6, 3),
(9, 3);

-- --------------------------------------------------------

--
-- Structure de la table `fraisforfait`
--

CREATE TABLE `fraisforfait` (
  `id` int(11) NOT NULL,
  `libelle` text NOT NULL,
  `montant` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `fraisforfait`
--

INSERT INTO `fraisforfait` (`id`, `libelle`, `montant`) VALUES
(1, 'hotel', 17),
(2, 'repas', 10),
(3, 'parking', 12),
(4, 'fdfed', 123);

-- --------------------------------------------------------

--
-- Structure de la table `lignefraisforfait`
--

CREATE TABLE `lignefraisforfait` (
  `id` int(11) NOT NULL,
  `FraisForfait_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `quantite` int(11) NOT NULL,
  `montant` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `lignefraisforfait`
--

INSERT INTO `lignefraisforfait` (`id`, `FraisForfait_id`, `date`, `quantite`, `montant`) VALUES
(2, 1, '2023-11-10', 2, NULL),
(3, 2, '2023-11-10', 5, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `lignefraishorsforfait`
--

CREATE TABLE `lignefraishorsforfait` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `montant` float NOT NULL,
  `libelle` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `lignefraishorsforfait`
--

INSERT INTO `lignefraishorsforfait` (`id`, `date`, `montant`, `libelle`) VALUES
(3, '2024-03-13', 53, 'velo'),
(4, '2024-03-14', 120, 'taxi'),
(5, '2024-03-14', 122, 'ty');

-- --------------------------------------------------------

--
-- Structure de la table `log`
--

CREATE TABLE `log` (
  `log_id` int(11) NOT NULL,
  `log_user` varchar(100) NOT NULL,
  `log_heure` datetime(6) NOT NULL,
  `log_auth` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` char(36) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `mdpapi` varchar(255) DEFAULT NULL,
  `cleapi` varchar(256) NOT NULL,
  `htoken` datetime(6) NOT NULL,
  `api_token` varchar(255) DEFAULT NULL,
  `activation_date` datetime DEFAULT NULL,
  `secret` varchar(32) DEFAULT NULL,
  `secret_verified` tinyint(1) DEFAULT NULL,
  `tos_date` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `is_superuser` tinyint(1) NOT NULL DEFAULT 0,
  `role` varchar(255) DEFAULT 'user',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `additional_data` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `first_name`, `last_name`, `mdpapi`, `cleapi`, `htoken`, `api_token`, `activation_date`, `secret`, `secret_verified`, `tos_date`, `active`, `is_superuser`, `role`, `created`, `modified`, `additional_data`, `last_login`) VALUES
('79c3bea7-2a88-45a6-be85-731658168c43', '12345', '12345@gmail.com', '12345', 'test12345', 'test12345', '05e8ce2cf80a83210f0d5d4e88ab3660', '', '0000-00-00 00:00:00.000000', '', NULL, NULL, NULL, '2023-11-16 14:15:44', 1, 0, 'user', '2023-11-16 14:15:44', '2023-11-17 07:55:29', NULL, NULL),
('87161a0b-a17f-4a67-9286-c5f5d98f685e', 'superadmin', 'superadmin@example.com', '$2y$10$OiYlbp9h/KqtZUAZW.M3vOixP8D04nXIyggoPMvHOHRtNYvSyjwAy', NULL, NULL, NULL, '', '0000-00-00 00:00:00.000000', NULL, NULL, NULL, NULL, NULL, 1, 1, 'superuser', '2023-10-12 14:27:13', '2023-10-12 14:27:13', NULL, '2023-11-17 08:07:11'),
('87994b67-d89d-4a0e-ad66-ce47740a7753', 'test', 'test@gmail.com', 'testunitaire', 'test', 'unitaire', 'michel', '', '0000-00-00 00:00:00.000000', '', NULL, NULL, NULL, '2023-11-14 10:09:12', 1, 0, 'user', '2023-11-14 10:09:12', '2023-11-17 07:55:46', NULL, '2023-11-17 07:56:18'),
('9ca81cba-62d8-408c-9c13-eb9611e211ab', 'test123', 'test123@gmail.com', 'test123', 'test123', 'test123', 'jacques', '296ca1ad9db95383d27f4ea440ef5495', '2024-04-19 10:18:05.000000', '', NULL, NULL, NULL, '2023-11-16 13:32:04', 1, 0, 'user', '2023-11-16 13:32:04', '2023-11-17 07:56:00', NULL, NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `etat`
--
ALTER TABLE `etat`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `fichefrais`
--
ALTER TABLE `fichefrais`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fichefrais_ibfk_1` (`user_id`),
  ADD KEY `etat_id` (`etat_id`);

--
-- Index pour la table `fichefrais_lignefraisforfait`
--
ALTER TABLE `fichefrais_lignefraisforfait`
  ADD PRIMARY KEY (`FicheFrais_id`,`LigneFraisForfait_id`) USING BTREE,
  ADD KEY `LigneFraisForfait_id` (`LigneFraisForfait_id`);

--
-- Index pour la table `fichefrais_lignefraishorsforfait`
--
ALTER TABLE `fichefrais_lignefraishorsforfait`
  ADD KEY `FicheFrais_id` (`FicheFrais_id`),
  ADD KEY `LigneFraisHorsForfait` (`LigneFraisHorsForfait_id`);

--
-- Index pour la table `fraisforfait`
--
ALTER TABLE `fraisforfait`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `lignefraisforfait`
--
ALTER TABLE `lignefraisforfait`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FraisForfait_id` (`FraisForfait_id`);

--
-- Index pour la table `lignefraishorsforfait`
--
ALTER TABLE `lignefraishorsforfait`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`log_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `etat`
--
ALTER TABLE `etat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `fichefrais`
--
ALTER TABLE `fichefrais`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `fichefrais_lignefraisforfait`
--
ALTER TABLE `fichefrais_lignefraisforfait`
  MODIFY `FicheFrais_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `fraisforfait`
--
ALTER TABLE `fraisforfait`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `lignefraisforfait`
--
ALTER TABLE `lignefraisforfait`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `lignefraishorsforfait`
--
ALTER TABLE `lignefraishorsforfait`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `log`
--
ALTER TABLE `log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `fichefrais`
--
ALTER TABLE `fichefrais`
  ADD CONSTRAINT `fichefrais_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fichefrais_ibfk_2` FOREIGN KEY (`etat_id`) REFERENCES `etat` (`id`);

--
-- Contraintes pour la table `fichefrais_lignefraisforfait`
--
ALTER TABLE `fichefrais_lignefraisforfait`
  ADD CONSTRAINT `fichefrais_lignefraisforfait_ibfk_1` FOREIGN KEY (`FicheFrais_id`) REFERENCES `fichefrais` (`id`),
  ADD CONSTRAINT `fichefrais_lignefraisforfait_ibfk_2` FOREIGN KEY (`LigneFraisForfait_id`) REFERENCES `lignefraisforfait` (`id`);

--
-- Contraintes pour la table `fichefrais_lignefraishorsforfait`
--
ALTER TABLE `fichefrais_lignefraishorsforfait`
  ADD CONSTRAINT `fichefrais_lignefraishorsforfait_ibfk_1` FOREIGN KEY (`FicheFrais_id`) REFERENCES `fichefrais` (`id`),
  ADD CONSTRAINT `fichefrais_lignefraishorsforfait_ibfk_2` FOREIGN KEY (`LigneFraisHorsForfait_id`) REFERENCES `lignefraishorsforfait` (`id`);

--
-- Contraintes pour la table `lignefraisforfait`
--
ALTER TABLE `lignefraisforfait`
  ADD CONSTRAINT `lignefraisforfait_ibfk_1` FOREIGN KEY (`FraisForfait_id`) REFERENCES `fraisforfait` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
