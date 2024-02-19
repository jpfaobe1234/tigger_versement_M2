-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 19 fév. 2024 à 11:41
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
-- Base de données : `versement_boss`
--

-- --------------------------------------------------------

--
-- Structure de la table `audit`
--

CREATE TABLE `audit` (
  `id_audit` int(11) NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  `date_operation` datetime NOT NULL DEFAULT current_timestamp(),
  `id_vir` int(11) DEFAULT NULL,
  `id_client` int(11) DEFAULT NULL,
  `nom_client` varchar(50) DEFAULT NULL,
  `date_vir` date DEFAULT NULL,
  `montant_ancien` int(11) DEFAULT NULL,
  `montant_nouveau` int(11) DEFAULT NULL,
  `utilisateur` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `audit`
--

INSERT INTO `audit` (`id_audit`, `type`, `date_operation`, `id_vir`, `id_client`, `nom_client`, `date_vir`, `montant_ancien`, `montant_nouveau`, `utilisateur`) VALUES
(1, 'Ajout', '2024-02-16 09:46:50', 1, 1, 'Rakoto', '2024-02-16', 0, 10000, 'Simple'),
(2, 'Ajout', '2024-02-16 09:50:52', 2, 1, 'Rakoto', '2024-02-16', 10000, 20000, 'Simple'),
(3, 'Ajout', '2024-02-16 09:51:26', 3, 2, 'Nandrasana', '2024-02-16', 0, 20000, 'Simple'),
(4, 'Ajout', '2024-02-16 09:54:45', 4, 1, 'Rakoto', '2024-02-16', 20000, 10000, 'Simple'),
(5, 'Ajout', '2024-02-16 10:01:38', 1, 1, 'Rakoto', '2024-02-16', 10000, 5000, 'Simple'),
(6, 'Update Virement', '2024-02-16 10:06:44', 1, 1, 'Rakoto', '2024-02-16', 5000, 100000, 'Simple'),
(7, 'Update Virement', '2024-02-16 10:19:26', 2, 1, 'Rakoto', '2024-02-16', 20000, 20000, 'Simple Up'),
(8, 'Update Virement', '2024-02-16 10:20:47', 2, 1, 'Rakoto', '2024-02-16', 20000, 30000, 'Simple Up'),
(9, 'Update Virement', '2024-02-16 10:23:09', 2, 1, 'Rakoto', '2024-02-16', 30000, 50000, 'Simple Up'),
(10, 'Update Virement', '2024-02-16 10:23:42', 2, 1, 'Rakoto', '2024-02-16', 50000, 10000, 'Simple Up'),
(11, 'Suppression Virement', '2024-02-16 10:37:35', 4, 1, 'Rakoto', '2024-02-16', 10000, 0, 'Simple'),
(12, 'Suppression Virement', '2024-02-18 16:37:06', 1, 1, 'Rakoto', '2024-02-16', 100000, 0, 'Simple'),
(13, 'Suppression Virement', '2024-02-18 16:37:14', 2, 1, 'Rakoto', '2024-02-16', 10000, 0, 'Simple Up'),
(14, 'Ajout', '2024-02-18 17:14:08', 5, 1, 'Rakoto', '2024-02-18', 0, 20000, 'Bi'),
(15, 'Ajout', '2024-02-18 17:18:29', 6, 2, 'Nandrasana', '2024-02-18', 20000, 20000, 'Bi'),
(16, 'Ajout', '2024-02-18 17:31:38', 7, 1, 'Rakoto', '2024-02-18', 20000, 0, ''),
(17, 'Suppression Virement', '2024-02-18 17:31:45', 7, 1, 'Rakoto', '2024-02-18', 0, 0, ''),
(18, 'Update Virement', '2024-02-18 17:40:43', 6, 2, 'Nandrasana', '2024-02-18', 20000, 20000, 'Bi'),
(19, 'Update Virement', '2024-02-18 17:51:14', 6, 2, 'Nandrasana', '2024-02-18', 20000, 20000, 'RAkoto'),
(20, 'Update Virement', '2024-02-18 17:57:25', 6, 2, 'Nandrasana', '2024-02-18', 20000, 20000, 'Clara'),
(21, 'Suppression Virement', '2024-02-18 17:57:50', 3, 2, 'Nandrasana', '2024-02-16', 20000, 0, 'Simple'),
(22, 'Ajout', '2024-02-19 06:48:38', 8, 4, 'wirus', '2024-02-19', 0, 20000, 'Bi'),
(23, 'Update Virement', '2024-02-19 06:49:28', 8, 4, 'wirus', '2024-02-19', 20000, 20, 'Bi'),
(24, 'Ajout', '2024-02-19 11:25:35', 9, 4, 'wirus', '2024-02-19', 20, 20000, 'rakoto'),
(25, 'Ajout', '2024-02-19 11:30:31', 10, 4, 'wirus', '2024-02-19', 20000, 300, 'madame'),
(26, 'Ajout', '2024-02-19 11:31:43', 11, 4, 'wirus', '2024-02-19', 300, 10000, 'madame'),
(27, 'Ajout', '2024-02-19 11:33:04', 12, 5, 'wirus', '2024-02-19', 0, 10000, 'madame'),
(28, 'Ajout', '2024-02-19 11:35:54', 13, 5, 'wirus', '2024-02-19', 10000, 10000, 'madame'),
(29, 'Update Virement', '2024-02-19 11:37:09', 13, 5, 'wirus', '2024-02-19', 10000, 5000, 'madame'),
(30, 'Update Virement', '2024-02-19 11:37:25', 13, 5, 'wirus', '2024-02-19', 5000, 10000, 'madame'),
(31, 'Ajout', '2024-02-19 11:38:36', 14, 5, 'wirus', '2024-02-19', 10000, 30000, 'madame'),
(32, 'Update Virement', '2024-02-19 11:40:48', 14, 5, 'wirus', '2024-02-19', 30000, 50000, 'rakoto');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id_client` int(11) NOT NULL,
  `nom_client` varchar(50) DEFAULT NULL,
  `solde` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id_client`, `nom_client`, `solde`) VALUES
(1, 'Rabe', 20000),
(2, 'Nandrasana', 20000),
(5, 'wirus', 70000);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id_utilisateur` int(11) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `role` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id_utilisateur`, `email`, `password`, `role`) VALUES
(1, 'rakoto', 'rakoto', 'admin'),
(2, 'madame', 'madame', 'simple');

-- --------------------------------------------------------

--
-- Structure de la table `virement`
--

CREATE TABLE `virement` (
  `id_vir` int(11) NOT NULL,
  `id_client` int(11) DEFAULT NULL,
  `montant` int(11) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `utilisateur` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `virement`
--

INSERT INTO `virement` (`id_vir`, `id_client`, `montant`, `date`, `utilisateur`) VALUES
(6, 2, 20000, '2024-02-18 17:18:29', 'Clara'),
(5, 1, 20000, '2024-02-18 17:14:08', 'Bi'),
(8, 4, 20, '2024-02-19 06:48:38', 'Bi'),
(9, 4, 20000, '2024-02-19 11:25:35', 'rakoto'),
(10, 4, 300, '2024-02-19 11:30:31', 'madame'),
(11, 4, 10000, '2024-02-19 11:31:43', 'madame'),
(12, 5, 10000, '2024-02-19 11:33:04', 'madame'),
(13, 5, 10000, '2024-02-19 11:35:54', 'madame'),
(14, 5, 50000, '2024-02-19 11:38:36', 'rakoto');

--
-- Déclencheurs `virement`
--
DELIMITER $$
CREATE TRIGGER `ajout_virement` AFTER INSERT ON `virement` FOR EACH ROW BEGIN
	-- Insert into audit --    
    -- ----recuperer montant Ancien ---
    DECLARE montant_ancien DECIMAL(10,2);
    
    SELECT montant INTO montant_ancien
    FROM virement
    WHERE id_client = NEW.id_client
    AND id_vir < (
    SELECT MAX(id_vir)
    FROM virement
    WHERE id_client = NEW.id_client)
    ORDER BY id_vir DESC
    LIMIT 1;
    
    IF montant_ancien IS NULL THEN
        SET montant_ancien = 0;
    END IF;
    -- FIN RECUPE Montant -------
    INSERT INTO audit (
    	type, id_vir, id_client, nom_client, date_vir, montant_ancien, montant_nouveau, utilisateur
    ) VALUES (
    	'Ajout', NEW.id_vir, NEW.id_client,
        (SELECT nom_client FROM client WHERE id_client = NEW.id_client), NEW.date, montant_ancien, NEW.montant, NEW.utilisateur       
    );
    -- FIN INSERT AUDIT-------------------
    -- UPADTE SOLDE ----
    UPDATE client
    SET solde = solde + NEW.montant
    WHERE id_client = NEW.id_client;
    -- ----------------------------
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `delete_virement` BEFORE DELETE ON `virement` FOR EACH ROW BEGIN
    DECLARE diff_sold DECIMAL(10,2);
    DECLARE montant_ancien DECIMAL(10,2);
    
	-- Insert into audit --    
    -- ----recuperer montant Ancien ---
    SET montant_ancien = OLD.montant;
    -- FIN RECUPE Montant -------
    INSERT INTO audit (
    	type, id_vir, id_client, nom_client, date_vir, montant_ancien, montant_nouveau, utilisateur
    ) VALUES (
    	'Suppression Virement', OLD.id_vir, OLD.id_client,
        (SELECT nom_client FROM client WHERE id_client = OLD.id_client), OLD.date, montant_ancien, 0, OLD.utilisateur     );
    -- FIN INSERT AUDIT-------------
    
    -- UPADTE SOLDE ----------------
    UPDATE client
    SET solde = solde - OLD.montant
    WHERE id_client = OLD.id_client;
    -- ----------------------------

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_virement` BEFORE UPDATE ON `virement` FOR EACH ROW BEGIN
    DECLARE diff_sold DECIMAL(10,2);
    DECLARE montant_ancien DECIMAL(10,2);
    
	-- Insert into audit --    
    -- ----recuperer montant Ancien ---
    SET montant_ancien = OLD.montant;
    -- FIN RECUPE Montant -------
    INSERT INTO audit (
    	type, id_vir, id_client, nom_client, date_vir, montant_ancien, montant_nouveau, utilisateur
    ) VALUES (
    	'Update Virement', NEW.id_vir, NEW.id_client,
        (SELECT nom_client FROM client WHERE id_client = NEW.id_client), NEW.date, montant_ancien, NEW.montant, NEW.utilisateur       
    );
    -- FIN INSERT AUDIT-------------
    -- UPADTE SOLDE ----------------
    SET diff_sold = NEW.montant - OLD.montant;
    
    UPDATE client
    SET solde = solde + diff_sold
    WHERE id_client = NEW.id_client;
    -- ----------------------------

END
$$
DELIMITER ;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `audit`
--
ALTER TABLE `audit`
  ADD PRIMARY KEY (`id_audit`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_utilisateur`);

--
-- Index pour la table `virement`
--
ALTER TABLE `virement`
  ADD PRIMARY KEY (`id_vir`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `audit`
--
ALTER TABLE `audit`
  MODIFY `id_audit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `virement`
--
ALTER TABLE `virement`
  MODIFY `id_vir` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
