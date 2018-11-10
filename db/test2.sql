-- phpMyAdmin SQL Dump
-- version 4.7.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  sam. 10 nov. 2018 à 11:01
-- Version du serveur :  5.7.18
-- Version de PHP :  7.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `test2`
--

-- --------------------------------------------------------

--
-- Structure de la table `adapte_a_une_classe_de_niveau`
--

CREATE TABLE `adapte_a_une_classe_de_niveau` (
  `id` int(11) NOT NULL,
  `duree` int(11) NOT NULL,
  `CLA_ID` int(11) NOT NULL,
  `DIFF_ID` int(11) NOT NULL,
  `ENO_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add Jointure Enonce-Difficulté-BO', 7, 'add_adapteauneclassedeniveau'),
(26, 'Can change Jointure Enonce-Difficulté-BO', 7, 'change_adapteauneclassedeniveau'),
(27, 'Can delete Jointure Enonce-Difficulté-BO', 7, 'delete_adapteauneclassedeniveau'),
(28, 'Can view Jointure Enonce-Difficulté-BO', 7, 'view_adapteauneclassedeniveau'),
(29, 'Can add Jointure Enonce-Image', 8, 'add_imagesassociees'),
(30, 'Can change Jointure Enonce-Image', 8, 'change_imagesassociees'),
(31, 'Can delete Jointure Enonce-Image', 8, 'delete_imagesassociees'),
(32, 'Can view Jointure Enonce-Image', 8, 'view_imagesassociees'),
(33, 'Can add Jointure Questions-Compétence', 9, 'add_questioncompetence'),
(34, 'Can change Jointure Questions-Compétence', 9, 'change_questioncompetence'),
(35, 'Can delete Jointure Questions-Compétence', 9, 'delete_questioncompetence'),
(36, 'Can view Jointure Questions-Compétence', 9, 'view_questioncompetence'),
(37, 'Can add Jointure Questions-Sujet', 10, 'add_questionconnaissance'),
(38, 'Can change Jointure Questions-Sujet', 10, 'change_questionconnaissance'),
(39, 'Can delete Jointure Questions-Sujet', 10, 'delete_questionconnaissance'),
(40, 'Can view Jointure Questions-Sujet', 10, 'view_questionconnaissance'),
(41, 'Can add Jointure Enonce-Biblio', 11, 'add_redigedans'),
(42, 'Can change Jointure Enonce-Biblio', 11, 'change_redigedans'),
(43, 'Can delete Jointure Enonce-Biblio', 11, 'delete_redigedans'),
(44, 'Can view Jointure Enonce-Biblio', 11, 'view_redigedans'),
(45, 'Can add Jointure Correction-Biblio', 12, 'add_setrouvedans'),
(46, 'Can change Jointure Correction-Biblio', 12, 'change_setrouvedans'),
(47, 'Can delete Jointure Correction-Biblio', 12, 'delete_setrouvedans'),
(48, 'Can view Jointure Correction-Biblio', 12, 'view_setrouvedans'),
(49, 'Can add Table Auteur', 13, 'add_tauteur'),
(50, 'Can change Table Auteur', 13, 'change_tauteur'),
(51, 'Can delete Table Auteur', 13, 'delete_tauteur'),
(52, 'Can view Table Auteur', 13, 'view_tauteur'),
(53, 'Can add Table Références biblio', 14, 'add_tbibliographie'),
(54, 'Can change Table Références biblio', 14, 'change_tbibliographie'),
(55, 'Can delete Table Références biblio', 14, 'delete_tbibliographie'),
(56, 'Can view Table Références biblio', 14, 'view_tbibliographie'),
(57, 'Can add Table BO', 15, 'add_tboclasse'),
(58, 'Can change Table BO', 15, 'change_tboclasse'),
(59, 'Can delete Table BO', 15, 'delete_tboclasse'),
(60, 'Can view Table BO', 15, 'view_tboclasse'),
(61, 'Can add Table Compétence', 16, 'add_tcompetences'),
(62, 'Can change Table Compétence', 16, 'change_tcompetences'),
(63, 'Can delete Table Compétence', 16, 'delete_tcompetences'),
(64, 'Can view Table Compétence', 16, 'view_tcompetences'),
(65, 'Can add Table Correction', 17, 'add_tcorrection'),
(66, 'Can change Table Correction', 17, 'change_tcorrection'),
(67, 'Can delete Table Correction', 17, 'delete_tcorrection'),
(68, 'Can view Table Correction', 17, 'view_tcorrection'),
(69, 'Can add Table Difficulté', 18, 'add_tdifficulte'),
(70, 'Can change Table Difficulté', 18, 'change_tdifficulte'),
(71, 'Can delete Table Difficulté', 18, 'delete_tdifficulte'),
(72, 'Can view Table Difficulté', 18, 'view_tdifficulte'),
(73, 'Can add Table Editeur', 19, 'add_tediteur'),
(74, 'Can change Table Editeur', 19, 'change_tediteur'),
(75, 'Can delete Table Editeur', 19, 'delete_tediteur'),
(76, 'Can view Table Editeur', 19, 'view_tediteur'),
(77, 'Can add Table Enoncé', 20, 'add_tenonce'),
(78, 'Can change Table Enoncé', 20, 'change_tenonce'),
(79, 'Can delete Table Enoncé', 20, 'delete_tenonce'),
(80, 'Can view Table Enoncé', 20, 'view_tenonce'),
(81, 'Can add Table Ensemble', 21, 'add_tensemble'),
(82, 'Can change Table Ensemble', 21, 'change_tensemble'),
(83, 'Can delete Table Ensemble', 21, 'delete_tensemble'),
(84, 'Can view Table Ensemble', 21, 'view_tensemble'),
(85, 'Can add Table image', 22, 'add_timages'),
(86, 'Can change Table image', 22, 'change_timages'),
(87, 'Can delete Table image', 22, 'delete_timages'),
(88, 'Can view Table image', 22, 'view_timages'),
(89, 'Can add Table Classification', 23, 'add_tsujetclassification'),
(90, 'Can change Table Classification', 23, 'change_tsujetclassification'),
(91, 'Can delete Table Classification', 23, 'delete_tsujetclassification'),
(92, 'Can view Table Classification', 23, 'view_tsujetclassification'),
(93, 'Can add Table Type', 24, 'add_ttype'),
(94, 'Can change Table Type', 24, 'change_ttype'),
(95, 'Can delete Table Type', 24, 'delete_ttype'),
(96, 'Can view Table Type', 24, 'view_ttype'),
(97, 'Can add Table Variante', 25, 'add_tvariantes'),
(98, 'Can change Table Variante', 25, 'change_tvariantes'),
(99, 'Can delete Table Variante', 25, 'delete_tvariantes'),
(100, 'Can view Table Variante', 25, 'view_tvariantes');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$120000$WXQCqE6ltfIF$HXTA+pQmw40qNdZYBgmcKARoxTFTuKbk4aDaQqMBcsQ=', '2018-11-09 19:19:47.811251', 1, 'chaos', '', '', 'chaos@matheuxfous.xyz', 1, 1, '2018-11-09 19:19:39.307370');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2018-11-09 20:04:43.820323', '1', 'Sciences', 1, '[{\"added\": {}}]', 23, 1),
(2, '2018-11-09 20:04:56.988780', '2', 'Mathématiques', 1, '[{\"added\": {}}]', 23, 1),
(3, '2018-11-09 20:05:06.980267', '3', 'Physique', 1, '[{\"added\": {}}]', 23, 1),
(4, '2018-11-09 20:16:11.949154', '1', '(1) RMS', 1, '[{\"added\": {}}]', 21, 1),
(5, '2018-11-09 20:16:21.279585', '2', '(2) RMS QR', 1, '[{\"added\": {}}]', 21, 1),
(6, '2018-11-09 20:31:03.580149', '1', 'Publié', 1, '[{\"added\": {}}]', 14, 1),
(7, '2018-11-09 21:25:49.518071', '1', 'Application directe', 1, '[{\"added\": {}}]', 24, 1),
(8, '2018-11-09 21:25:55.348044', '2', 'QCM', 1, '[{\"added\": {}}]', 24, 1),
(9, '2018-11-09 21:29:07.444479', '1', 'Chercher', 1, '[{\"added\": {}}]', 16, 1);

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'monSite', 'adapteauneclassedeniveau'),
(8, 'monSite', 'imagesassociees'),
(9, 'monSite', 'questioncompetence'),
(10, 'monSite', 'questionconnaissance'),
(11, 'monSite', 'redigedans'),
(12, 'monSite', 'setrouvedans'),
(13, 'monSite', 'tauteur'),
(14, 'monSite', 'tbibliographie'),
(15, 'monSite', 'tboclasse'),
(16, 'monSite', 'tcompetences'),
(17, 'monSite', 'tcorrection'),
(18, 'monSite', 'tdifficulte'),
(19, 'monSite', 'tediteur'),
(20, 'monSite', 'tenonce'),
(21, 'monSite', 'tensemble'),
(22, 'monSite', 'timages'),
(23, 'monSite', 'tsujetclassification'),
(24, 'monSite', 'ttype'),
(25, 'monSite', 'tvariantes'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Structure de la table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2018-11-09 19:15:24.297352'),
(2, 'auth', '0001_initial', '2018-11-09 19:15:26.750739'),
(3, 'admin', '0001_initial', '2018-11-09 19:15:27.198117'),
(4, 'admin', '0002_logentry_remove_auto_add', '2018-11-09 19:15:27.209271'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2018-11-09 19:15:27.221850'),
(6, 'contenttypes', '0002_remove_content_type_name', '2018-11-09 19:15:27.449529'),
(7, 'auth', '0002_alter_permission_name_max_length', '2018-11-09 19:15:27.599774'),
(8, 'auth', '0003_alter_user_email_max_length', '2018-11-09 19:15:27.743097'),
(9, 'auth', '0004_alter_user_username_opts', '2018-11-09 19:15:27.757655'),
(10, 'auth', '0005_alter_user_last_login_null', '2018-11-09 19:15:27.894300'),
(11, 'auth', '0006_require_contenttypes_0002', '2018-11-09 19:15:27.897594'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2018-11-09 19:15:27.911622'),
(13, 'auth', '0008_alter_user_username_max_length', '2018-11-09 19:15:28.032458'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2018-11-09 19:15:28.166699'),
(15, 'monSite', '0001_initial', '2018-11-09 19:15:43.816801'),
(16, 'sessions', '0001_initial', '2018-11-09 19:15:44.117218');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('hx6s6e0e5enggcmiol2trsx5cnrvzz68', 'MDFjMGFlMDM0NzJkYWI5MDJjYmM5MWZhNzVmMDM0ODJkZGUzMjgzMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5YWRjMGY0ZWQxMDEyYjI2MmIxNjQzMzAwMWJlNmVlNWI3ZjkzNjVmIn0=', '2018-11-23 19:19:47.815103');

-- --------------------------------------------------------

--
-- Structure de la table `images_associees`
--

CREATE TABLE `images_associees` (
  `id` int(11) NOT NULL,
  `ENO_ID` int(11) NOT NULL,
  `IMA_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `question_competence`
--

CREATE TABLE `question_competence` (
  `id` int(11) NOT NULL,
  `Num_question` int(11) NOT NULL,
  `COMP_ID` int(11) NOT NULL,
  `ENO_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `question_connaissance`
--

CREATE TABLE `question_connaissance` (
  `id` int(11) NOT NULL,
  `Num_question` int(11) NOT NULL,
  `ENO_ID` int(11) NOT NULL,
  `SUJ_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `redige_dans`
--

CREATE TABLE `redige_dans` (
  `id` int(11) NOT NULL,
  `page` int(11) NOT NULL,
  `prenote` varchar(1000) DEFAULT NULL,
  `postnote` varchar(1000) DEFAULT NULL,
  `BIB_ID` int(11) NOT NULL,
  `ENO_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `se_trouve_dans`
--

CREATE TABLE `se_trouve_dans` (
  `id` int(11) NOT NULL,
  `page` int(11) DEFAULT NULL,
  `prenote` varchar(1000) DEFAULT NULL,
  `postnote` varchar(1000) DEFAULT NULL,
  `BIB_ID` int(11) NOT NULL,
  `COR_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `T_AUTEUR`
--

CREATE TABLE `T_AUTEUR` (
  `AUT_ID` int(11) NOT NULL,
  `AUT_NOM` varchar(25) NOT NULL,
  `AUT_PRENOM` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `T_BIBLIOGRAPHIE`
--

CREATE TABLE `T_BIBLIOGRAPHIE` (
  `BIB_ID` int(11) NOT NULL,
  `BIB_TITRE` varchar(25) NOT NULL,
  `BIB_SOUS_TITRE` longtext,
  `BIB_ISBN` bigint(20) DEFAULT NULL,
  `BIB_URL` longtext,
  `BIB_ANNEE` date DEFAULT NULL,
  `BIB_BIBLATEX` longtext NOT NULL,
  `lft` int(10) UNSIGNED NOT NULL,
  `rght` int(10) UNSIGNED NOT NULL,
  `tree_id` int(10) UNSIGNED NOT NULL,
  `level` int(10) UNSIGNED NOT NULL,
  `EDI_ID` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `T_BIBLIOGRAPHIE`
--

INSERT INTO `T_BIBLIOGRAPHIE` (`BIB_ID`, `BIB_TITRE`, `BIB_SOUS_TITRE`, `BIB_ISBN`, `BIB_URL`, `BIB_ANNEE`, `BIB_BIBLATEX`, `lft`, `rght`, `tree_id`, `level`, `EDI_ID`, `parent_id`) VALUES
(1, 'Publié', 'Toute source publiée', NULL, '', NULL, '@', 1, 2, 1, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `T_BIBLIOGRAPHIE_bib_aut_id`
--

CREATE TABLE `T_BIBLIOGRAPHIE_bib_aut_id` (
  `id` int(11) NOT NULL,
  `tbibliographie_id` int(11) NOT NULL,
  `tauteur_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `T_BO_CLASSE`
--

CREATE TABLE `T_BO_CLASSE` (
  `CLA_ID` int(11) NOT NULL,
  `CLA_Label` longtext NOT NULL,
  `CLA_INFOS` longtext,
  `CLA_ANNEE_BO_DEPART` date NOT NULL,
  `CLA_ANNEE_BO_FIN` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `T_COMPETENCES`
--

CREATE TABLE `T_COMPETENCES` (
  `COMP_ID` int(11) NOT NULL,
  `COMP_LABEL` longtext NOT NULL,
  `COMP_INFOS` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `T_COMPETENCES`
--

INSERT INTO `T_COMPETENCES` (`COMP_ID`, `COMP_LABEL`, `COMP_INFOS`) VALUES
(1, 'Chercher', '...');

-- --------------------------------------------------------

--
-- Structure de la table `T_CORRECTION`
--

CREATE TABLE `T_CORRECTION` (
  `COR_ID` int(11) NOT NULL,
  `COR_LATEX` longtext,
  `COR_QCM_BOOL` tinyint(1) NOT NULL,
  `COR_ALEATOIRE_BOOL` tinyint(1) NOT NULL,
  `COR_LUA_BOOL` tinyint(1) NOT NULL,
  `COR_PYTHON_BOOL` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `T_DIFFICULTE`
--

CREATE TABLE `T_DIFFICULTE` (
  `DIFF_ID` int(11) NOT NULL,
  `DIFF_label` longtext NOT NULL,
  `DIFF_echelle` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `T_EDITEUR`
--

CREATE TABLE `T_EDITEUR` (
  `EDI_ID` int(11) NOT NULL,
  `EDI_NOM` varchar(25) NOT NULL,
  `EDI_LIEU` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `T_ENONCE`
--

CREATE TABLE `T_ENONCE` (
  `ENO_ID` int(11) NOT NULL,
  `ENO_TITRE` varchar(255) NOT NULL,
  `ENO_LATEX` longtext,
  `ENO_QCM_BOOL` tinyint(1) NOT NULL,
  `ENO_ALEATOIRE_BOOL` tinyint(1) NOT NULL,
  `ENO_LUA_BOOL` tinyint(1) NOT NULL,
  `ENO_PYTHON_BOOL` tinyint(1) NOT NULL,
  `ENO_NOMBRE_QUESTIONS` smallint(6) NOT NULL,
  `COR_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `T_ENONCE_eno_classification`
--

CREATE TABLE `T_ENONCE_eno_classification` (
  `id` int(11) NOT NULL,
  `tenonce_id` int(11) NOT NULL,
  `tsujetclassification_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `T_ENONCE_eno_comp`
--

CREATE TABLE `T_ENONCE_eno_comp` (
  `id` int(11) NOT NULL,
  `tenonce_id` int(11) NOT NULL,
  `tcompetences_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `T_ENONCE_eno_ens`
--

CREATE TABLE `T_ENONCE_eno_ens` (
  `id` int(11) NOT NULL,
  `tenonce_id` int(11) NOT NULL,
  `tensemble_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `T_ENONCE_eno_evalue`
--

CREATE TABLE `T_ENONCE_eno_evalue` (
  `id` int(11) NOT NULL,
  `tenonce_id` int(11) NOT NULL,
  `tsujetclassification_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `T_ENONCE_eno_type`
--

CREATE TABLE `T_ENONCE_eno_type` (
  `id` int(11) NOT NULL,
  `tenonce_id` int(11) NOT NULL,
  `ttype_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `T_ENONCE_eno_variantes`
--

CREATE TABLE `T_ENONCE_eno_variantes` (
  `id` int(11) NOT NULL,
  `tenonce_id` int(11) NOT NULL,
  `tvariantes_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `T_ENSEMBLE`
--

CREATE TABLE `T_ENSEMBLE` (
  `ENS_ID` int(11) NOT NULL,
  `ENS_NOM` varchar(25) NOT NULL,
  `lft` int(10) UNSIGNED NOT NULL,
  `rght` int(10) UNSIGNED NOT NULL,
  `tree_id` int(10) UNSIGNED NOT NULL,
  `level` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `T_ENSEMBLE`
--

INSERT INTO `T_ENSEMBLE` (`ENS_ID`, `ENS_NOM`, `lft`, `rght`, `tree_id`, `level`, `parent_id`) VALUES
(1, 'RMS', 1, 4, 1, 0, NULL),
(2, 'RMS QR', 2, 3, 1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `T_IMAGES`
--

CREATE TABLE `T_IMAGES` (
  `IMA_ID` int(11) NOT NULL,
  `IMA_TITRE` varchar(255) NOT NULL,
  `ima_file` varchar(100) DEFAULT NULL,
  `IMA_THUMBURL` varchar(255) NOT NULL,
  `IMA_FILENAME` varchar(255) NOT NULL,
  `IMA_HASH` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `T_IMAGES`
--

INSERT INTO `T_IMAGES` (`IMA_ID`, `IMA_TITRE`, `ima_file`, `IMA_THUMBURL`, `IMA_FILENAME`, `IMA_HASH`) VALUES
(1, 'fonctions1.png', '/Users/chaos/www/Projets/exercices/monSite/media/upload/images/823c26aa4a3da2e4123582c58bc82e4a.png', '/monSite/upload/thumbs/bb0d833792c3c96fbb844ca04cd1b492.jpg', 'fonctions1.png', 'a5e949259d886e6e');

-- --------------------------------------------------------

--
-- Structure de la table `T_SUJET_CLASSIFICATION`
--

CREATE TABLE `T_SUJET_CLASSIFICATION` (
  `SUJ_ID` int(11) NOT NULL,
  `SUJ_NOM` varchar(100) NOT NULL,
  `SUJ_INFOS` longtext,
  `lft` int(10) UNSIGNED NOT NULL,
  `rght` int(10) UNSIGNED NOT NULL,
  `tree_id` int(10) UNSIGNED NOT NULL,
  `level` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `T_SUJET_CLASSIFICATION`
--

INSERT INTO `T_SUJET_CLASSIFICATION` (`SUJ_ID`, `SUJ_NOM`, `SUJ_INFOS`, `lft`, `rght`, `tree_id`, `level`, `parent_id`) VALUES
(1, 'Sciences', '', 1, 6, 1, 0, NULL),
(2, 'Mathématiques', '', 2, 3, 1, 1, 1),
(3, 'Physique', '', 4, 5, 1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `T_TYPE`
--

CREATE TABLE `T_TYPE` (
  `TYP_ID` int(11) NOT NULL,
  `TYP_LABEL` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `T_TYPE`
--

INSERT INTO `T_TYPE` (`TYP_ID`, `TYP_LABEL`) VALUES
(1, 'Application directe'),
(2, 'QCM');

-- --------------------------------------------------------

--
-- Structure de la table `T_VARIANTES`
--

CREATE TABLE `T_VARIANTES` (
  `VAR_ID` int(11) NOT NULL,
  `VAR_LABEL` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `adapte_a_une_classe_de_niveau`
--
ALTER TABLE `adapte_a_une_classe_de_niveau`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `adapte_a_une_classe_de_n_ENO_ID_CLA_ID_DIFF_ID_706bc926_uniq` (`ENO_ID`,`CLA_ID`,`DIFF_ID`),
  ADD KEY `adapte_a_une_classe__CLA_ID_6e25294c_fk_T_BO_CLAS` (`CLA_ID`),
  ADD KEY `adapte_a_une_classe__DIFF_ID_63d4b8ec_fk_T_DIFFICU` (`DIFF_ID`);

--
-- Index pour la table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Index pour la table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Index pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Index pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Index pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Index pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Index pour la table `images_associees`
--
ALTER TABLE `images_associees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `images_associees_ENO_ID_IMA_ID_9751f4ab_uniq` (`ENO_ID`,`IMA_ID`),
  ADD KEY `images_associees_IMA_ID_e7674f43_fk_T_IMAGES_IMA_ID` (`IMA_ID`);

--
-- Index pour la table `question_competence`
--
ALTER TABLE `question_competence`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `question_competence_ENO_ID_COMP_ID_Num_question_2ba5b6fe_uniq` (`ENO_ID`,`COMP_ID`,`Num_question`),
  ADD KEY `question_competence_COMP_ID_d6c60bc1_fk_T_COMPETENCES_COMP_ID` (`COMP_ID`);

--
-- Index pour la table `question_connaissance`
--
ALTER TABLE `question_connaissance`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `question_connaissance_ENO_ID_SUJ_ID_Num_question_90759add_uniq` (`ENO_ID`,`SUJ_ID`,`Num_question`),
  ADD KEY `question_connaissanc_SUJ_ID_ff679fda_fk_T_SUJET_C` (`SUJ_ID`);

--
-- Index pour la table `redige_dans`
--
ALTER TABLE `redige_dans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `redige_dans_ENO_ID_BIB_ID_b3aaf1f8_uniq` (`ENO_ID`,`BIB_ID`),
  ADD KEY `redige_dans_BIB_ID_a51193b2_fk_T_BIBLIOGRAPHIE_BIB_ID` (`BIB_ID`);

--
-- Index pour la table `se_trouve_dans`
--
ALTER TABLE `se_trouve_dans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `se_trouve_dans_COR_ID_BIB_ID_9f700d72_uniq` (`COR_ID`,`BIB_ID`),
  ADD KEY `se_trouve_dans_BIB_ID_72f6c8df_fk_T_BIBLIOGRAPHIE_BIB_ID` (`BIB_ID`);

--
-- Index pour la table `T_AUTEUR`
--
ALTER TABLE `T_AUTEUR`
  ADD PRIMARY KEY (`AUT_ID`);

--
-- Index pour la table `T_BIBLIOGRAPHIE`
--
ALTER TABLE `T_BIBLIOGRAPHIE`
  ADD PRIMARY KEY (`BIB_ID`),
  ADD KEY `T_BIBLIOGRAPHIE_lft_c6981f5f` (`lft`),
  ADD KEY `T_BIBLIOGRAPHIE_rght_f9d7636c` (`rght`),
  ADD KEY `T_BIBLIOGRAPHIE_tree_id_5272c263` (`tree_id`),
  ADD KEY `T_BIBLIOGRAPHIE_level_ebadc249` (`level`),
  ADD KEY `T_BIBLIOGRAPHIE_EDI_ID_39e4020a_fk_T_EDITEUR_EDI_ID` (`EDI_ID`),
  ADD KEY `T_BIBLIOGRAPHIE_parent_id_069f5795` (`parent_id`);

--
-- Index pour la table `T_BIBLIOGRAPHIE_bib_aut_id`
--
ALTER TABLE `T_BIBLIOGRAPHIE_bib_aut_id`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `T_BIBLIOGRAPHIE_bib_aut__tbibliographie_id_tauteu_7914065e_uniq` (`tbibliographie_id`,`tauteur_id`),
  ADD KEY `T_BIBLIOGRAPHIE_bib__tauteur_id_e8750600_fk_T_AUTEUR_` (`tauteur_id`);

--
-- Index pour la table `T_BO_CLASSE`
--
ALTER TABLE `T_BO_CLASSE`
  ADD PRIMARY KEY (`CLA_ID`);

--
-- Index pour la table `T_COMPETENCES`
--
ALTER TABLE `T_COMPETENCES`
  ADD PRIMARY KEY (`COMP_ID`);

--
-- Index pour la table `T_CORRECTION`
--
ALTER TABLE `T_CORRECTION`
  ADD PRIMARY KEY (`COR_ID`);

--
-- Index pour la table `T_DIFFICULTE`
--
ALTER TABLE `T_DIFFICULTE`
  ADD PRIMARY KEY (`DIFF_ID`);

--
-- Index pour la table `T_EDITEUR`
--
ALTER TABLE `T_EDITEUR`
  ADD PRIMARY KEY (`EDI_ID`);

--
-- Index pour la table `T_ENONCE`
--
ALTER TABLE `T_ENONCE`
  ADD PRIMARY KEY (`ENO_ID`),
  ADD KEY `T_ENONCE_COR_ID_06d74d11_fk_T_CORRECTION_COR_ID` (`COR_ID`);

--
-- Index pour la table `T_ENONCE_eno_classification`
--
ALTER TABLE `T_ENONCE_eno_classification`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `T_ENONCE_eno_classificat_tenonce_id_tsujetclassif_5eeab326_uniq` (`tenonce_id`,`tsujetclassification_id`),
  ADD KEY `T_ENONCE_eno_classif_tsujetclassification_1a85f56b_fk_T_SUJET_C` (`tsujetclassification_id`);

--
-- Index pour la table `T_ENONCE_eno_comp`
--
ALTER TABLE `T_ENONCE_eno_comp`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `T_ENONCE_eno_comp_tenonce_id_tcompetences_id_42c4f840_uniq` (`tenonce_id`,`tcompetences_id`),
  ADD KEY `T_ENONCE_eno_comp_tcompetences_id_e7235403_fk_T_COMPETE` (`tcompetences_id`);

--
-- Index pour la table `T_ENONCE_eno_ens`
--
ALTER TABLE `T_ENONCE_eno_ens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `T_ENONCE_eno_ens_tenonce_id_tensemble_id_1fc3c1f1_uniq` (`tenonce_id`,`tensemble_id`),
  ADD KEY `T_ENONCE_eno_ens_tensemble_id_38489533_fk_T_ENSEMBLE_ENS_ID` (`tensemble_id`);

--
-- Index pour la table `T_ENONCE_eno_evalue`
--
ALTER TABLE `T_ENONCE_eno_evalue`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `T_ENONCE_eno_evalue_tenonce_id_tsujetclassif_65bfc6e4_uniq` (`tenonce_id`,`tsujetclassification_id`),
  ADD KEY `T_ENONCE_eno_evalue_tsujetclassification_5de7f010_fk_T_SUJET_C` (`tsujetclassification_id`);

--
-- Index pour la table `T_ENONCE_eno_type`
--
ALTER TABLE `T_ENONCE_eno_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `T_ENONCE_eno_type_tenonce_id_ttype_id_687e5a5c_uniq` (`tenonce_id`,`ttype_id`),
  ADD KEY `T_ENONCE_eno_type_ttype_id_136725ad_fk_T_TYPE_TYP_ID` (`ttype_id`);

--
-- Index pour la table `T_ENONCE_eno_variantes`
--
ALTER TABLE `T_ENONCE_eno_variantes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `T_ENONCE_eno_variantes_tenonce_id_tvariantes_id_21bba6da_uniq` (`tenonce_id`,`tvariantes_id`),
  ADD KEY `T_ENONCE_eno_variant_tvariantes_id_4b32dba3_fk_T_VARIANT` (`tvariantes_id`);

--
-- Index pour la table `T_ENSEMBLE`
--
ALTER TABLE `T_ENSEMBLE`
  ADD PRIMARY KEY (`ENS_ID`),
  ADD KEY `T_ENSEMBLE_lft_fdce5d5f` (`lft`),
  ADD KEY `T_ENSEMBLE_rght_e1774b05` (`rght`),
  ADD KEY `T_ENSEMBLE_tree_id_4f299800` (`tree_id`),
  ADD KEY `T_ENSEMBLE_level_28387a2b` (`level`),
  ADD KEY `T_ENSEMBLE_parent_id_04ba4bd3` (`parent_id`);

--
-- Index pour la table `T_IMAGES`
--
ALTER TABLE `T_IMAGES`
  ADD PRIMARY KEY (`IMA_ID`);

--
-- Index pour la table `T_SUJET_CLASSIFICATION`
--
ALTER TABLE `T_SUJET_CLASSIFICATION`
  ADD PRIMARY KEY (`SUJ_ID`),
  ADD KEY `T_SUJET_CLASSIFICATION_lft_e94b5d2e` (`lft`),
  ADD KEY `T_SUJET_CLASSIFICATION_rght_c3fd5ece` (`rght`),
  ADD KEY `T_SUJET_CLASSIFICATION_tree_id_d3f9a9c0` (`tree_id`),
  ADD KEY `T_SUJET_CLASSIFICATION_level_1a2b6825` (`level`),
  ADD KEY `T_SUJET_CLASSIFICATION_parent_id_005884f9` (`parent_id`);

--
-- Index pour la table `T_TYPE`
--
ALTER TABLE `T_TYPE`
  ADD PRIMARY KEY (`TYP_ID`);

--
-- Index pour la table `T_VARIANTES`
--
ALTER TABLE `T_VARIANTES`
  ADD PRIMARY KEY (`VAR_ID`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `adapte_a_une_classe_de_niveau`
--
ALTER TABLE `adapte_a_une_classe_de_niveau`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT pour la table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT pour la table `images_associees`
--
ALTER TABLE `images_associees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `question_competence`
--
ALTER TABLE `question_competence`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `question_connaissance`
--
ALTER TABLE `question_connaissance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `redige_dans`
--
ALTER TABLE `redige_dans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `se_trouve_dans`
--
ALTER TABLE `se_trouve_dans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `T_AUTEUR`
--
ALTER TABLE `T_AUTEUR`
  MODIFY `AUT_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `T_BIBLIOGRAPHIE`
--
ALTER TABLE `T_BIBLIOGRAPHIE`
  MODIFY `BIB_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `T_BIBLIOGRAPHIE_bib_aut_id`
--
ALTER TABLE `T_BIBLIOGRAPHIE_bib_aut_id`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `T_BO_CLASSE`
--
ALTER TABLE `T_BO_CLASSE`
  MODIFY `CLA_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `T_COMPETENCES`
--
ALTER TABLE `T_COMPETENCES`
  MODIFY `COMP_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `T_CORRECTION`
--
ALTER TABLE `T_CORRECTION`
  MODIFY `COR_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `T_DIFFICULTE`
--
ALTER TABLE `T_DIFFICULTE`
  MODIFY `DIFF_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `T_EDITEUR`
--
ALTER TABLE `T_EDITEUR`
  MODIFY `EDI_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `T_ENONCE`
--
ALTER TABLE `T_ENONCE`
  MODIFY `ENO_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `T_ENONCE_eno_classification`
--
ALTER TABLE `T_ENONCE_eno_classification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `T_ENONCE_eno_comp`
--
ALTER TABLE `T_ENONCE_eno_comp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `T_ENONCE_eno_ens`
--
ALTER TABLE `T_ENONCE_eno_ens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `T_ENONCE_eno_evalue`
--
ALTER TABLE `T_ENONCE_eno_evalue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `T_ENONCE_eno_type`
--
ALTER TABLE `T_ENONCE_eno_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `T_ENONCE_eno_variantes`
--
ALTER TABLE `T_ENONCE_eno_variantes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `T_ENSEMBLE`
--
ALTER TABLE `T_ENSEMBLE`
  MODIFY `ENS_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `T_IMAGES`
--
ALTER TABLE `T_IMAGES`
  MODIFY `IMA_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `T_SUJET_CLASSIFICATION`
--
ALTER TABLE `T_SUJET_CLASSIFICATION`
  MODIFY `SUJ_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `T_TYPE`
--
ALTER TABLE `T_TYPE`
  MODIFY `TYP_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `adapte_a_une_classe_de_niveau`
--
ALTER TABLE `adapte_a_une_classe_de_niveau`
  ADD CONSTRAINT `adapte_a_une_classe__CLA_ID_6e25294c_fk_T_BO_CLAS` FOREIGN KEY (`CLA_ID`) REFERENCES `T_BO_CLASSE` (`CLA_ID`),
  ADD CONSTRAINT `adapte_a_une_classe__DIFF_ID_63d4b8ec_fk_T_DIFFICU` FOREIGN KEY (`DIFF_ID`) REFERENCES `T_DIFFICULTE` (`DIFF_ID`),
  ADD CONSTRAINT `adapte_a_une_classe_de_niveau_ENO_ID_599af88b_fk_T_ENONCE_ENO_ID` FOREIGN KEY (`ENO_ID`) REFERENCES `T_ENONCE` (`ENO_ID`);

--
-- Contraintes pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Contraintes pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Contraintes pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `images_associees`
--
ALTER TABLE `images_associees`
  ADD CONSTRAINT `images_associees_ENO_ID_3d8e4c8d_fk_T_ENONCE_ENO_ID` FOREIGN KEY (`ENO_ID`) REFERENCES `T_ENONCE` (`ENO_ID`),
  ADD CONSTRAINT `images_associees_IMA_ID_e7674f43_fk_T_IMAGES_IMA_ID` FOREIGN KEY (`IMA_ID`) REFERENCES `T_IMAGES` (`IMA_ID`);

--
-- Contraintes pour la table `question_competence`
--
ALTER TABLE `question_competence`
  ADD CONSTRAINT `question_competence_COMP_ID_d6c60bc1_fk_T_COMPETENCES_COMP_ID` FOREIGN KEY (`COMP_ID`) REFERENCES `T_COMPETENCES` (`COMP_ID`),
  ADD CONSTRAINT `question_competence_ENO_ID_ec03ccfb_fk_T_ENONCE_ENO_ID` FOREIGN KEY (`ENO_ID`) REFERENCES `T_ENONCE` (`ENO_ID`);

--
-- Contraintes pour la table `question_connaissance`
--
ALTER TABLE `question_connaissance`
  ADD CONSTRAINT `question_connaissanc_SUJ_ID_ff679fda_fk_T_SUJET_C` FOREIGN KEY (`SUJ_ID`) REFERENCES `T_SUJET_CLASSIFICATION` (`SUJ_ID`),
  ADD CONSTRAINT `question_connaissance_ENO_ID_e468cf7f_fk_T_ENONCE_ENO_ID` FOREIGN KEY (`ENO_ID`) REFERENCES `T_ENONCE` (`ENO_ID`);

--
-- Contraintes pour la table `redige_dans`
--
ALTER TABLE `redige_dans`
  ADD CONSTRAINT `redige_dans_BIB_ID_a51193b2_fk_T_BIBLIOGRAPHIE_BIB_ID` FOREIGN KEY (`BIB_ID`) REFERENCES `T_BIBLIOGRAPHIE` (`BIB_ID`),
  ADD CONSTRAINT `redige_dans_ENO_ID_ec35906a_fk_T_ENONCE_ENO_ID` FOREIGN KEY (`ENO_ID`) REFERENCES `T_ENONCE` (`ENO_ID`);

--
-- Contraintes pour la table `se_trouve_dans`
--
ALTER TABLE `se_trouve_dans`
  ADD CONSTRAINT `se_trouve_dans_BIB_ID_72f6c8df_fk_T_BIBLIOGRAPHIE_BIB_ID` FOREIGN KEY (`BIB_ID`) REFERENCES `T_BIBLIOGRAPHIE` (`BIB_ID`),
  ADD CONSTRAINT `se_trouve_dans_COR_ID_7d41941f_fk_T_CORRECTION_COR_ID` FOREIGN KEY (`COR_ID`) REFERENCES `T_CORRECTION` (`COR_ID`);

--
-- Contraintes pour la table `T_BIBLIOGRAPHIE`
--
ALTER TABLE `T_BIBLIOGRAPHIE`
  ADD CONSTRAINT `T_BIBLIOGRAPHIE_EDI_ID_39e4020a_fk_T_EDITEUR_EDI_ID` FOREIGN KEY (`EDI_ID`) REFERENCES `T_EDITEUR` (`EDI_ID`),
  ADD CONSTRAINT `T_BIBLIOGRAPHIE_parent_id_069f5795_fk_T_BIBLIOGRAPHIE_BIB_ID` FOREIGN KEY (`parent_id`) REFERENCES `T_BIBLIOGRAPHIE` (`BIB_ID`);

--
-- Contraintes pour la table `T_BIBLIOGRAPHIE_bib_aut_id`
--
ALTER TABLE `T_BIBLIOGRAPHIE_bib_aut_id`
  ADD CONSTRAINT `T_BIBLIOGRAPHIE_bib__tauteur_id_e8750600_fk_T_AUTEUR_` FOREIGN KEY (`tauteur_id`) REFERENCES `T_AUTEUR` (`AUT_ID`),
  ADD CONSTRAINT `T_BIBLIOGRAPHIE_bib__tbibliographie_id_82f8a5b6_fk_T_BIBLIOG` FOREIGN KEY (`tbibliographie_id`) REFERENCES `T_BIBLIOGRAPHIE` (`BIB_ID`);

--
-- Contraintes pour la table `T_ENONCE`
--
ALTER TABLE `T_ENONCE`
  ADD CONSTRAINT `T_ENONCE_COR_ID_06d74d11_fk_T_CORRECTION_COR_ID` FOREIGN KEY (`COR_ID`) REFERENCES `T_CORRECTION` (`COR_ID`);

--
-- Contraintes pour la table `T_ENONCE_eno_classification`
--
ALTER TABLE `T_ENONCE_eno_classification`
  ADD CONSTRAINT `T_ENONCE_eno_classif_tenonce_id_9d1bb9d2_fk_T_ENONCE_` FOREIGN KEY (`tenonce_id`) REFERENCES `T_ENONCE` (`ENO_ID`),
  ADD CONSTRAINT `T_ENONCE_eno_classif_tsujetclassification_1a85f56b_fk_T_SUJET_C` FOREIGN KEY (`tsujetclassification_id`) REFERENCES `T_SUJET_CLASSIFICATION` (`SUJ_ID`);

--
-- Contraintes pour la table `T_ENONCE_eno_comp`
--
ALTER TABLE `T_ENONCE_eno_comp`
  ADD CONSTRAINT `T_ENONCE_eno_comp_tcompetences_id_e7235403_fk_T_COMPETE` FOREIGN KEY (`tcompetences_id`) REFERENCES `T_COMPETENCES` (`COMP_ID`),
  ADD CONSTRAINT `T_ENONCE_eno_comp_tenonce_id_b91f334b_fk_T_ENONCE_ENO_ID` FOREIGN KEY (`tenonce_id`) REFERENCES `T_ENONCE` (`ENO_ID`);

--
-- Contraintes pour la table `T_ENONCE_eno_ens`
--
ALTER TABLE `T_ENONCE_eno_ens`
  ADD CONSTRAINT `T_ENONCE_eno_ens_tenonce_id_4fd2e4b6_fk_T_ENONCE_ENO_ID` FOREIGN KEY (`tenonce_id`) REFERENCES `T_ENONCE` (`ENO_ID`),
  ADD CONSTRAINT `T_ENONCE_eno_ens_tensemble_id_38489533_fk_T_ENSEMBLE_ENS_ID` FOREIGN KEY (`tensemble_id`) REFERENCES `T_ENSEMBLE` (`ENS_ID`);

--
-- Contraintes pour la table `T_ENONCE_eno_evalue`
--
ALTER TABLE `T_ENONCE_eno_evalue`
  ADD CONSTRAINT `T_ENONCE_eno_evalue_tenonce_id_60c6383b_fk_T_ENONCE_ENO_ID` FOREIGN KEY (`tenonce_id`) REFERENCES `T_ENONCE` (`ENO_ID`),
  ADD CONSTRAINT `T_ENONCE_eno_evalue_tsujetclassification_5de7f010_fk_T_SUJET_C` FOREIGN KEY (`tsujetclassification_id`) REFERENCES `T_SUJET_CLASSIFICATION` (`SUJ_ID`);

--
-- Contraintes pour la table `T_ENONCE_eno_type`
--
ALTER TABLE `T_ENONCE_eno_type`
  ADD CONSTRAINT `T_ENONCE_eno_type_tenonce_id_6115e570_fk_T_ENONCE_ENO_ID` FOREIGN KEY (`tenonce_id`) REFERENCES `T_ENONCE` (`ENO_ID`),
  ADD CONSTRAINT `T_ENONCE_eno_type_ttype_id_136725ad_fk_T_TYPE_TYP_ID` FOREIGN KEY (`ttype_id`) REFERENCES `T_TYPE` (`TYP_ID`);

--
-- Contraintes pour la table `T_ENONCE_eno_variantes`
--
ALTER TABLE `T_ENONCE_eno_variantes`
  ADD CONSTRAINT `T_ENONCE_eno_variant_tvariantes_id_4b32dba3_fk_T_VARIANT` FOREIGN KEY (`tvariantes_id`) REFERENCES `T_VARIANTES` (`VAR_ID`),
  ADD CONSTRAINT `T_ENONCE_eno_variantes_tenonce_id_a4408165_fk_T_ENONCE_ENO_ID` FOREIGN KEY (`tenonce_id`) REFERENCES `T_ENONCE` (`ENO_ID`);

--
-- Contraintes pour la table `T_ENSEMBLE`
--
ALTER TABLE `T_ENSEMBLE`
  ADD CONSTRAINT `T_ENSEMBLE_parent_id_04ba4bd3_fk_T_ENSEMBLE_ENS_ID` FOREIGN KEY (`parent_id`) REFERENCES `T_ENSEMBLE` (`ENS_ID`);

--
-- Contraintes pour la table `T_SUJET_CLASSIFICATION`
--
ALTER TABLE `T_SUJET_CLASSIFICATION`
  ADD CONSTRAINT `T_SUJET_CLASSIFICATI_parent_id_005884f9_fk_T_SUJET_C` FOREIGN KEY (`parent_id`) REFERENCES `T_SUJET_CLASSIFICATION` (`SUJ_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
