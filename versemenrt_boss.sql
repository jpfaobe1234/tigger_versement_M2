-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 16 fév. 2024 à 09:38
-- Version du serveur : 5.7.40
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `versement_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `audit`
--

DROP TABLE IF EXISTS `audit`;
CREATE TABLE IF NOT EXISTS `audit` (
  `id_audit` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) DEFAULT NULL,
  `date_operation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_vir` int(11) DEFAULT NULL,
  `id_client` int(11) DEFAULT NULL,
  `nom_client` varchar(50) DEFAULT NULL,
  `date_vir` date DEFAULT NULL,
  `montant_ancien` int(11) DEFAULT NULL,
  `montant_nouveau` int(11) DEFAULT NULL,
  `utilisateur` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_audit`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

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
(11, 'Suppression Virement', '2024-02-16 10:37:35', 4, 1, 'Rakoto', '2024-02-16', 10000, 0, 'Simple');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id_client` int(11) NOT NULL AUTO_INCREMENT,
  `nom_client` varchar(50) DEFAULT NULL,
  `solde` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_client`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id_client`, `nom_client`, `solde`) VALUES
(1, 'Rakoto', 20000),
(2, 'Nandrasana', 20000);

-- --------------------------------------------------------

--
-- Structure de la table `virement`
--

DROP TABLE IF EXISTS `virement`;
CREATE TABLE IF NOT EXISTS `virement` (
  `id_vir` int(11) NOT NULL AUTO_INCREMENT,
  `id_client` int(11) DEFAULT NULL,
  `montant` int(11) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `utilisateur` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_vir`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `virement`
--

INSERT INTO `virement` (`id_vir`, `id_client`, `montant`, `date`, `utilisateur`) VALUES
(1, 1, 100000, '2024-02-16 09:46:50', 'Simple'),
(2, 1, 10000, '2024-02-16 09:46:50', 'Simple Up'),
(3, 2, 20000, '2024-02-16 09:46:50', 'Simple');

--
-- Déclencheurs `virement`
--
DROP TRIGGER IF EXISTS `ajout_virement`;
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
    SET solde = solde - NEW.montant
    WHERE id_client = NEW.id_client;
    -- ----------------------------
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `delete_virement`;
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
DROP TRIGGER IF EXISTS `update_virement`;
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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
