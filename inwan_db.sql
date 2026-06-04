-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 04 juin 2026 à 17:05
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `inwan_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `interventions`
--

CREATE TABLE `interventions` (
  `id` int(11) NOT NULL,
  `signalement_id` int(11) NOT NULL,
  `technicien_id` int(11) NOT NULL,
  `superviseur_id` int(11) NOT NULL,
  `date_affectation` datetime DEFAULT current_timestamp(),
  `date_debut` datetime DEFAULT NULL,
  `date_fin` datetime DEFAULT NULL,
  `rapport_technicien` text DEFAULT NULL,
  `pieces_utilisees` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `interventions`
--

INSERT INTO `interventions` (`id`, `signalement_id`, `technicien_id`, `superviseur_id`, `date_affectation`, `date_debut`, `date_fin`, `rapport_technicien`, `pieces_utilisees`) VALUES
(2, 4, 5, 3, '2026-05-22 23:40:15', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `photos`
--

CREATE TABLE `photos` (
  `id` int(11) NOT NULL,
  `signalement_id` int(11) NOT NULL,
  `chemin_photo` varchar(255) NOT NULL,
  `type_media` enum('photo','video') DEFAULT 'photo',
  `date_upload` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `photos`
--

INSERT INTO `photos` (`id`, `signalement_id`, `chemin_photo`, `type_media`, `date_upload`) VALUES
(1, 1, '../uploads/1775593174_84afb584e9d24b0d8ef1a9cdf5dd3940.jpg', 'photo', '2026-04-07 20:19:34'),
(2, 1, '../uploads/1775596303_84afb584e9d24b0d8ef1a9cdf5dd3940.jpg', 'photo', '2026-04-07 21:11:43'),
(3, 2, '../uploads/1775596471_6b40f0d5b9f74a4f871697c8f2153273.jpg', 'photo', '2026-04-07 21:14:31'),
(4, 3, '../uploads/1775596552_6b40f0d5b9f74a4f871697c8f2153273.jpg', 'photo', '2026-04-07 21:15:52'),
(5, 4, '../uploads/1775600535_84afb584e9d24b0d8ef1a9cdf5dd3940.jpg', 'photo', '2026-04-07 22:22:15');

-- --------------------------------------------------------

--
-- Structure de la table `signalements`
--

CREATE TABLE `signalements` (
  `id` int(11) NOT NULL,
  `agent_id` int(11) NOT NULL,
  `equipement` varchar(255) NOT NULL,
  `type_panne` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `urgence` enum('faible','moyen','urgent','critique') DEFAULT 'moyen',
  `statut` enum('en_attente','valide','affecte','en_cours','termine','en_attente_chef','valide_chef','transmis_manager','valide_manager','affectation_superviseur','refuse_chef','refuse_manager') DEFAULT 'en_attente',
  `date_signalement` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_validation_chef` datetime DEFAULT NULL,
  `date_transmission_manager` datetime DEFAULT NULL,
  `date_validation_manager` datetime DEFAULT NULL,
  `date_affectation_superviseur` datetime DEFAULT NULL,
  `date_debut_intervention` datetime DEFAULT NULL,
  `date_fin_intervention` datetime DEFAULT NULL,
  `commentaire_manager` text DEFAULT NULL,
  `reponse_superviseur` text DEFAULT NULL,
  `message_manager_lu` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `signalements`
--

INSERT INTO `signalements` (`id`, `agent_id`, `equipement`, `type_panne`, `description`, `urgence`, `statut`, `date_signalement`, `date_validation_chef`, `date_transmission_manager`, `date_validation_manager`, `date_affectation_superviseur`, `date_debut_intervention`, `date_fin_intervention`, `commentaire_manager`, `reponse_superviseur`, `message_manager_lu`) VALUES
(1, 1, 'Convoyeur 2', 'Électrique', 'kmfbiwqho', 'faible', 'en_attente_chef', '2026-04-07 20:18:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(2, 1, 'Convoyeur 2', 'Électrique', 'jsduzuda_ha', 'faible', 'en_attente_chef', '2026-04-07 21:14:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(3, 1, 'Convoyeur 2', 'Électrique', 'jnksqhio', 'faible', 'valide_chef', '2026-04-07 21:14:54', '2026-05-21 18:50:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(4, 1, 'Convoyeur 2', 'Mécanique', 'NJQSHIO', 'faible', 'affectation_superviseur', '2026-04-07 22:21:26', '2026-05-21 18:39:19', '2026-05-22 17:11:12', '2026-05-22 17:40:31', '2026-05-22 23:40:15', NULL, NULL, 'on ça va tu peux faire le nécessaire', NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `id` int(11) NOT NULL,
  `nom_complet` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `role` enum('agent','chef_equipe','superviseur','manager','technicien') NOT NULL,
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id`, `nom_complet`, `email`, `mot_de_passe`, `role`, `date_creation`) VALUES
(1, 'Jean Agent', 'jean@agent.inwan.cd', '123456', 'agent', '2026-04-02 20:13:07'),
(2, 'Pierre Chef', 'pierre@chef.inwan.cd', '123456', 'chef_equipe', '2026-04-02 20:13:07'),
(3, 'Marie Superviseur', 'marie@superviseur.inwan.cd', '123456', 'superviseur', '2026-04-02 20:13:07'),
(4, 'Kabongo Manager', 'kabongo@manager.inwan.cd', '123456', 'manager', '2026-04-02 20:13:07'),
(5, 'Marc Technicien', 'marc@technicien.inwan.cd', '123456', 'technicien', '2026-04-02 20:13:07');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `interventions`
--
ALTER TABLE `interventions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `signalement_id` (`signalement_id`),
  ADD KEY `technicien_id` (`technicien_id`),
  ADD KEY `superviseur_id` (`superviseur_id`);

--
-- Index pour la table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `signalement_id` (`signalement_id`);

--
-- Index pour la table `signalements`
--
ALTER TABLE `signalements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `agent_id` (`agent_id`);

--
-- Index pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `interventions`
--
ALTER TABLE `interventions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `signalements`
--
ALTER TABLE `signalements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `interventions`
--
ALTER TABLE `interventions`
  ADD CONSTRAINT `interventions_ibfk_1` FOREIGN KEY (`signalement_id`) REFERENCES `signalements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `interventions_ibfk_2` FOREIGN KEY (`technicien_id`) REFERENCES `utilisateurs` (`id`),
  ADD CONSTRAINT `interventions_ibfk_3` FOREIGN KEY (`superviseur_id`) REFERENCES `utilisateurs` (`id`);

--
-- Contraintes pour la table `photos`
--
ALTER TABLE `photos`
  ADD CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`signalement_id`) REFERENCES `signalements` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `signalements`
--
ALTER TABLE `signalements`
  ADD CONSTRAINT `signalements_ibfk_1` FOREIGN KEY (`agent_id`) REFERENCES `utilisateurs` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
