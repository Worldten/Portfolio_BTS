-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Lun 20 Mai 2019 à 18:44
-- Version du serveur :  10.1.37-MariaDB-0+deb9u1
-- Version de PHP :  7.0.33-0+deb9u3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `Agence_Soleil`
--

-- --------------------------------------------------------

--
-- Structure de la table `bien`
--

CREATE TABLE `bien` (
  `reference_bien` int(11) NOT NULL,
  `type_bien` varchar(25) DEFAULT NULL,
  `nom_bien` varchar(25) NOT NULL,
  `ville_bien` varchar(25) NOT NULL,
  `adresse1_bien` varchar(64) NOT NULL,
  `quartier_bien` varchar(25) NOT NULL,
  `prix_bien` decimal(15,3) NOT NULL,
  `surface_bien` int(11) NOT NULL,
  `piece_bien` int(11) NOT NULL,
  `charge_bien` int(25) NOT NULL,
  `date_constructionbien` date NOT NULL,
  `cp_bien` varchar(25) NOT NULL,
  `adresse2_bien` varchar(25) NOT NULL,
  `autorise_bien` varchar(15) NOT NULL,
  `ref_personne` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `location`
--

CREATE TABLE `location` (
  `ref_loc` int(11) NOT NULL,
  `date_contrat_loc` date NOT NULL,
  `date_entree_loc` date NOT NULL,
  `date_sortie_loc` date NOT NULL,
  `etat_paiement_frais_loc` varchar(25) NOT NULL,
  `reference_bien` int(11) NOT NULL,
  `ref_personne` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE `message` (
  `id_message` int(11) NOT NULL,
  `texte_message` varchar(256) NOT NULL,
  `ref_personne` int(11) NOT NULL,
  `reference_bien` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

CREATE TABLE `personne` (
  `ref_personne` int(11) NOT NULL,
  `adresse1_personne` varchar(25) NOT NULL,
  `categorie_personne` varchar(25) NOT NULL,
  `tel_personne` varchar(25) NOT NULL,
  `prenom_personne` varchar(25) NOT NULL,
  `age_personne` int(11) NOT NULL,
  `mail_personne` varchar(25) NOT NULL,
  `adresse2_personne` varchar(25) DEFAULT NULL,
  `cp_personne` varchar(25) NOT NULL,
  `nom_personne` varchar(25) NOT NULL,
  `username_personne` varchar(32) NOT NULL,
  `mdp_personne` varchar(32) NOT NULL,
  `admin_personne` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `bien`
--
ALTER TABLE `bien`
  ADD PRIMARY KEY (`reference_bien`),
  ADD KEY `FK_BIEN_ref_personne` (`ref_personne`);

--
-- Index pour la table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`ref_loc`),
  ADD KEY `FK_LOCATION_reference_bien` (`reference_bien`),
  ADD KEY `FK_LOCATION_ref_personne` (`ref_personne`);

--
-- Index pour la table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id_message`),
  ADD KEY `fk_ref_bien_message` (`reference_bien`),
  ADD KEY `fk_ref_user_message` (`ref_personne`);

--
-- Index pour la table `personne`
--
ALTER TABLE `personne`
  ADD PRIMARY KEY (`ref_personne`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `bien`
--
ALTER TABLE `bien`
  MODIFY `reference_bien` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `location`
--
ALTER TABLE `location`
  MODIFY `ref_loc` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `message`
--
ALTER TABLE `message`
  MODIFY `id_message` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `personne`
--
ALTER TABLE `personne`
  MODIFY `ref_personne` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `bien`
--
ALTER TABLE `bien`
  ADD CONSTRAINT `FK_BIEN_ref_personne` FOREIGN KEY (`ref_personne`) REFERENCES `personne` (`ref_personne`);

--
-- Contraintes pour la table `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `FK_LOCATION_ref_personne` FOREIGN KEY (`ref_personne`) REFERENCES `personne` (`ref_personne`),
  ADD CONSTRAINT `FK_LOCATION_reference_bien` FOREIGN KEY (`reference_bien`) REFERENCES `bien` (`reference_bien`);

--
-- Contraintes pour la table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `fk_ref_bien_message` FOREIGN KEY (`reference_bien`) REFERENCES `bien` (`reference_bien`),
  ADD CONSTRAINT `fk_ref_user_message` FOREIGN KEY (`ref_personne`) REFERENCES `personne` (`ref_personne`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
