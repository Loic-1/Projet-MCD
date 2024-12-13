-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.30 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour projet-dwwm-loic
CREATE DATABASE IF NOT EXISTS `projet-dwwm-loic` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `projet-dwwm-loic`;

-- Listage de la structure de table projet-dwwm-loic. category
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table projet-dwwm-loic.category : ~3 rows (environ)
INSERT INTO `category` (`id`, `name`, `photo`, `alt`) VALUES
	(2, 'Entrée', 'tmp', NULL),
	(3, 'Plat', 'tmp', NULL),
	(4, 'Dessert', 'tmp', NULL);

-- Listage de la structure de table projet-dwwm-loic. comment
CREATE TABLE IF NOT EXISTS `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `user_id` int NOT NULL,
  `recipe_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9474526CA76ED395` (`user_id`),
  KEY `IDX_9474526C59D8A214` (`recipe_id`),
  CONSTRAINT `FK_9474526C59D8A214` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`),
  CONSTRAINT `FK_9474526CA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table projet-dwwm-loic.comment : ~2 rows (environ)
INSERT INTO `comment` (`id`, `title`, `content`, `creation_date`, `user_id`, `recipe_id`) VALUES
	(1, 'comment1', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Neque ut amet quia veniam, exercitationem dolorum doloribus maiores. A, iusto suscipit! Explicabo, cupiditate sint quos officia nihil deleniti veritatis excepturi nostrum.', '2024-12-13 16:14:26', 6, 5),
	(2, 'comment2', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Neque ut amet quia veniam, exercitationem dolorum doloribus maiores. A, iusto suscipit! Explicabo, cupiditate sint quos officia nihil deleniti veritatis excepturi nostrum.', '2024-12-13 16:17:24', 5, 5);

-- Listage de la structure de table projet-dwwm-loic. compilation
CREATE TABLE IF NOT EXISTS `compilation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_AD5F8DF2A76ED395` (`user_id`),
  CONSTRAINT `FK_AD5F8DF2A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table projet-dwwm-loic.compilation : ~0 rows (environ)

-- Listage de la structure de table projet-dwwm-loic. contain
CREATE TABLE IF NOT EXISTS `contain` (
  `id` int NOT NULL AUTO_INCREMENT,
  `recipe_id` int NOT NULL,
  `ingredient_id` int NOT NULL,
  `quantity` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4BEFF7C859D8A214` (`recipe_id`),
  KEY `IDX_4BEFF7C8933FE08C` (`ingredient_id`),
  CONSTRAINT `FK_4BEFF7C859D8A214` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`),
  CONSTRAINT `FK_4BEFF7C8933FE08C` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table projet-dwwm-loic.contain : ~4 rows (environ)
INSERT INTO `contain` (`id`, `recipe_id`, `ingredient_id`, `quantity`) VALUES
	(5, 5, 3, 10),
	(6, 5, 6, 1),
	(7, 5, 7, 0.2),
	(8, 5, 2, 10);

-- Listage de la structure de table projet-dwwm-loic. favorite
CREATE TABLE IF NOT EXISTS `favorite` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `recipe_id` int NOT NULL,
  `register_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_68C58ED959D8A214` (`recipe_id`),
  KEY `IDX_68C58ED9A76ED395` (`user_id`),
  CONSTRAINT `FK_68C58ED959D8A214` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`),
  CONSTRAINT `FK_68C58ED9A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table projet-dwwm-loic.favorite : ~0 rows (environ)

-- Listage de la structure de table projet-dwwm-loic. friend
CREATE TABLE IF NOT EXISTS `friend` (
  `id` int NOT NULL AUTO_INCREMENT,
  `follower_id` int NOT NULL,
  `followee_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_55EEAC61AC24F853` (`follower_id`),
  KEY `IDX_55EEAC6161EA9775` (`followee_id`),
  CONSTRAINT `FK_55EEAC6161EA9775` FOREIGN KEY (`followee_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_55EEAC61AC24F853` FOREIGN KEY (`follower_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table projet-dwwm-loic.friend : ~0 rows (environ)

-- Listage de la structure de table projet-dwwm-loic. ingredient
CREATE TABLE IF NOT EXISTS `ingredient` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price_unit` double NOT NULL,
  `unit` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table projet-dwwm-loic.ingredient : ~6 rows (environ)
INSERT INTO `ingredient` (`id`, `name`, `price_unit`, `unit`) VALUES
	(2, 'Sel', 0.25, 'g'),
	(3, 'Poivre', 0.25, 'g'),
	(4, 'Farine', 0.6, 'kg'),
	(5, 'Sucre', 1.5, 'kg'),
	(6, 'Salade', 1, 'u'),
	(7, 'Thon', 25, 'kg');

-- Listage de la structure de table projet-dwwm-loic. message
CREATE TABLE IF NOT EXISTS `message` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `sender_id` int NOT NULL,
  `receiver_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B6BD307FF624B39D` (`sender_id`),
  KEY `IDX_B6BD307FCD53EDB6` (`receiver_id`),
  CONSTRAINT `FK_B6BD307FCD53EDB6` FOREIGN KEY (`receiver_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_B6BD307FF624B39D` FOREIGN KEY (`sender_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table projet-dwwm-loic.message : ~0 rows (environ)

-- Listage de la structure de table projet-dwwm-loic. messenger_messages
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table projet-dwwm-loic.messenger_messages : ~0 rows (environ)

-- Listage de la structure de table projet-dwwm-loic. photo
CREATE TABLE IF NOT EXISTS `photo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `recipe_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_14B7841859D8A214` (`recipe_id`),
  CONSTRAINT `FK_14B7841859D8A214` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table projet-dwwm-loic.photo : ~4 rows (environ)
INSERT INTO `photo` (`id`, `url`, `alt`, `recipe_id`) VALUES
	(5, 'https://th.bing.com/th/id/OIP.J5F_fEX8aB4O9Hw5WwfE9QHaHa?w=175&h=180&c=7&r=0&o=5&pid=1.7', 'Éclair au chocolat', 7),
	(6, 'https://www.twofatbellies.com/wp-content/uploads/2011/03/SLR-Feb-March-387.jpg', 'Steak frites', 6),
	(7, 'https://bing.com/th?id=OSK.996621e554ec268329972d6e4714a4ab', 'Salade niçoise', 5),
	(8, 'https://th.bing.com/th/id/R.d1c2ae27164edad7393c57e84c328bd8?rik=HfcFN28zMnBQWg&pid=ImgRaw&r=0', 'Salade niçoise', 5);

-- Listage de la structure de table projet-dwwm-loic. recipe
CREATE TABLE IF NOT EXISTS `recipe` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `preparation_time` int NOT NULL,
  `instructions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` double DEFAULT NULL,
  `category_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_DA88B13712469DE2` (`category_id`),
  KEY `IDX_DA88B137A76ED395` (`user_id`),
  CONSTRAINT `FK_DA88B13712469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `FK_DA88B137A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table projet-dwwm-loic.recipe : ~7 rows (environ)
INSERT INTO `recipe` (`id`, `name`, `preparation_time`, `instructions`, `note`, `category_id`, `user_id`) VALUES
	(5, 'Salade niçoise', 10, 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Suscipit perferendis amet expedita eligendi dignissimos numquam assumenda adipisci quo! Quae, magni eveniet quaerat provident id temporibus inventore reiciendis ipsum eligendi magnam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Suscipit perferendis amet expedita eligendi dignissimos numquam assumenda adipisci quo! Quae, magni eveniet quaerat provident id temporibus inventore reiciendis ipsum eligendi magnam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Suscipit perferendis amet expedita eligendi dignissimos numquam assumenda adipisci quo! Quae, magni eveniet quaerat provident id temporibus inventore reiciendis ipsum eligendi magnam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Suscipit perferendis amet expedita eligendi dignissimos numquam assumenda adipisci quo! Quae, magni eveniet quaerat provident id temporibus inventore reiciendis ipsum eligendi magnam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Suscipit perferendis amet expedita eligendi dignissimos numquam assumenda adipisci quo! Quae, magni eveniet quaerat provident id temporibus inventore reiciendis ipsum eligendi magnam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Suscipit perferendis amet expedita eligendi dignissimos numquam assumenda adipisci quo! Quae, magni eveniet quaerat provident id temporibus inventore reiciendis ipsum eligendi magnam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Suscipit perferendis amet expedita eligendi dignissimos numquam assumenda adipisci quo! Quae, magni eveniet quaerat provident id temporibus inventore reiciendis ipsum eligendi magnam.', 10, 2, 5),
	(6, 'Steak frites', 10, 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Suscipit perferendis amet expedita eligendi dignissimos numquam assumenda adipisci quo! Quae, magni eveniet quaerat provident id temporibus inventore reiciendis ipsum eligendi magnam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Suscipit perferendis amet expedita eligendi dignissimos numquam assumenda adipisci quo! Quae, magni eveniet quaerat provident id temporibus inventore reiciendis ipsum eligendi magnam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Suscipit perferendis amet expedita eligendi dignissimos numquam assumenda adipisci quo! Quae, magni eveniet quaerat provident id temporibus inventore reiciendis ipsum eligendi magnam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Suscipit perferendis amet expedita eligendi dignissimos numquam assumenda adipisci quo! Quae, magni eveniet quaerat provident id temporibus inventore reiciendis ipsum eligendi magnam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Suscipit perferendis amet expedita eligendi dignissimos numquam assumenda adipisci quo! Quae, magni eveniet quaerat provident id temporibus inventore reiciendis ipsum eligendi magnam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Suscipit perferendis amet expedita eligendi dignissimos numquam assumenda adipisci quo! Quae, magni eveniet quaerat provident id temporibus inventore reiciendis ipsum eligendi magnam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Suscipit perferendis amet expedita eligendi dignissimos numquam assumenda adipisci quo! Quae, magni eveniet quaerat provident id temporibus inventore reiciendis ipsum eligendi magnam.', 10, 3, 5),
	(7, 'Éclair au chocolat', 10, 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Suscipit perferendis amet expedita eligendi dignissimos numquam assumenda adipisci quo! Quae, magni eveniet quaerat provident id temporibus inventore reiciendis ipsum eligendi magnam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Suscipit perferendis amet expedita eligendi dignissimos numquam assumenda adipisci quo! Quae, magni eveniet quaerat provident id temporibus inventore reiciendis ipsum eligendi magnam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Suscipit perferendis amet expedita eligendi dignissimos numquam assumenda adipisci quo! Quae, magni eveniet quaerat provident id temporibus inventore reiciendis ipsum eligendi magnam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Suscipit perferendis amet expedita eligendi dignissimos numquam assumenda adipisci quo! Quae, magni eveniet quaerat provident id temporibus inventore reiciendis ipsum eligendi magnam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Suscipit perferendis amet expedita eligendi dignissimos numquam assumenda adipisci quo! Quae, magni eveniet quaerat provident id temporibus inventore reiciendis ipsum eligendi magnam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Suscipit perferendis amet expedita eligendi dignissimos numquam assumenda adipisci quo! Quae, magni eveniet quaerat provident id temporibus inventore reiciendis ipsum eligendi magnam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Suscipit perferendis amet expedita eligendi dignissimos numquam assumenda adipisci quo! Quae, magni eveniet quaerat provident id temporibus inventore reiciendis ipsum eligendi magnam.', 10, 4, 5),
	(27, 'test connecté', 111, 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Suscipit perferendis amet expedita eligendi dignissimos numquam assumenda adipisci quo! Quae, magni eveniet quaerat provident id temporibus inventore reiciendis ipsum eligendi magnam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Suscipit perferendis amet expedita eligendi dignissimos numquam assumenda adipisci quo! Quae, magni eveniet quaerat provident id temporibus inventore reiciendis ipsum eligendi magnam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Suscipit perferendis amet expedita eligendi dignissimos numquam assumenda adipisci quo! Quae, magni eveniet quaerat provident id temporibus inventore reiciendis ipsum eligendi magnam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Suscipit perferendis amet expedita eligendi dignissimos numquam assumenda adipisci quo! Quae, magni eveniet quaerat provident id temporibus inventore reiciendis ipsum eligendi magnam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Suscipit perferendis amet expedita eligendi dignissimos numquam assumenda adipisci quo! Quae, magni eveniet quaerat provident id temporibus inventore reiciendis ipsum eligendi magnam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Suscipit perferendis amet expedita eligendi dignissimos numquam assumenda adipisci quo! Quae, magni eveniet quaerat provident id temporibus inventore reiciendis ipsum eligendi magnam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Suscipit perferendis amet expedita eligendi dignissimos numquam assumenda adipisci quo! Quae, magni eveniet quaerat provident id temporibus inventore reiciendis ipsum eligendi magnam.', 4, 2, 5),
	(28, 'test connecté', 111, 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Suscipit perferendis amet expedita eligendi dignissimos numquam assumenda adipisci quo! Quae, magni eveniet quaerat provident id temporibus inventore reiciendis ipsum eligendi magnam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Suscipit perferendis amet expedita eligendi dignissimos numquam assumenda adipisci quo! Quae, magni eveniet quaerat provident id temporibus inventore reiciendis ipsum eligendi magnam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Suscipit perferendis amet expedita eligendi dignissimos numquam assumenda adipisci quo! Quae, magni eveniet quaerat provident id temporibus inventore reiciendis ipsum eligendi magnam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Suscipit perferendis amet expedita eligendi dignissimos numquam assumenda adipisci quo! Quae, magni eveniet quaerat provident id temporibus inventore reiciendis ipsum eligendi magnam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Suscipit perferendis amet expedita eligendi dignissimos numquam assumenda adipisci quo! Quae, magni eveniet quaerat provident id temporibus inventore reiciendis ipsum eligendi magnam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Suscipit perferendis amet expedita eligendi dignissimos numquam assumenda adipisci quo! Quae, magni eveniet quaerat provident id temporibus inventore reiciendis ipsum eligendi magnam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Suscipit perferendis amet expedita eligendi dignissimos numquam assumenda adipisci quo! Quae, magni eveniet quaerat provident id temporibus inventore reiciendis ipsum eligendi magnam.', NULL, 3, 5),
	(29, 'test connecté', 111, 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Suscipit perferendis amet expedita eligendi dignissimos numquam assumenda adipisci quo! Quae, magni eveniet quaerat provident id temporibus inventore reiciendis ipsum eligendi magnam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Suscipit perferendis amet expedita eligendi dignissimos numquam assumenda adipisci quo! Quae, magni eveniet quaerat provident id temporibus inventore reiciendis ipsum eligendi magnam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Suscipit perferendis amet expedita eligendi dignissimos numquam assumenda adipisci quo! Quae, magni eveniet quaerat provident id temporibus inventore reiciendis ipsum eligendi magnam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Suscipit perferendis amet expedita eligendi dignissimos numquam assumenda adipisci quo! Quae, magni eveniet quaerat provident id temporibus inventore reiciendis ipsum eligendi magnam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Suscipit perferendis amet expedita eligendi dignissimos numquam assumenda adipisci quo! Quae, magni eveniet quaerat provident id temporibus inventore reiciendis ipsum eligendi magnam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Suscipit perferendis amet expedita eligendi dignissimos numquam assumenda adipisci quo! Quae, magni eveniet quaerat provident id temporibus inventore reiciendis ipsum eligendi magnam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Suscipit perferendis amet expedita eligendi dignissimos numquam assumenda adipisci quo! Quae, magni eveniet quaerat provident id temporibus inventore reiciendis ipsum eligendi magnam.', NULL, 2, 5),
	(30, 'test Connecté', 11, 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Suscipit perferendis amet expedita eligendi dignissimos numquam assumenda adipisci quo! Quae, magni eveniet quaerat provident id temporibus inventore reiciendis ipsum eligendi magnam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Suscipit perferendis amet expedita eligendi dignissimos numquam assumenda adipisci quo! Quae, magni eveniet quaerat provident id temporibus inventore reiciendis ipsum eligendi magnam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Suscipit perferendis amet expedita eligendi dignissimos numquam assumenda adipisci quo! Quae, magni eveniet quaerat provident id temporibus inventore reiciendis ipsum eligendi magnam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Suscipit perferendis amet expedita eligendi dignissimos numquam assumenda adipisci quo! Quae, magni eveniet quaerat provident id temporibus inventore reiciendis ipsum eligendi magnam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Suscipit perferendis amet expedita eligendi dignissimos numquam assumenda adipisci quo! Quae, magni eveniet quaerat provident id temporibus inventore reiciendis ipsum eligendi magnam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Suscipit perferendis amet expedita eligendi dignissimos numquam assumenda adipisci quo! Quae, magni eveniet quaerat provident id temporibus inventore reiciendis ipsum eligendi magnam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Suscipit perferendis amet expedita eligendi dignissimos numquam assumenda adipisci quo! Quae, magni eveniet quaerat provident id temporibus inventore reiciendis ipsum eligendi magnam.', NULL, 2, 5);

-- Listage de la structure de table projet-dwwm-loic. recipe_compilation
CREATE TABLE IF NOT EXISTS `recipe_compilation` (
  `compilation_id` int NOT NULL,
  `recipe_id` int NOT NULL,
  PRIMARY KEY (`recipe_id`,`compilation_id`),
  KEY `IDX_79ADC39659D8A214` (`recipe_id`),
  KEY `IDX_79ADC396A5F8C840` (`compilation_id`),
  CONSTRAINT `FK_79ADC39659D8A214` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_79ADC396A5F8C840` FOREIGN KEY (`compilation_id`) REFERENCES `compilation` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table projet-dwwm-loic.recipe_compilation : ~0 rows (environ)

-- Listage de la structure de table projet-dwwm-loic. reset_password_request
CREATE TABLE IF NOT EXISTS `reset_password_request` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `selector` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashed_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requested_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `expires_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_7CE748AA76ED395` (`user_id`),
  CONSTRAINT `FK_7CE748AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table projet-dwwm-loic.reset_password_request : ~0 rows (environ)

-- Listage de la structure de table projet-dwwm-loic. save
CREATE TABLE IF NOT EXISTS `save` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `compilation_id` int NOT NULL,
  `register_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_55663ADEA76ED395` (`user_id`),
  KEY `IDX_55663ADEA5F8C840` (`compilation_id`),
  CONSTRAINT `FK_55663ADEA5F8C840` FOREIGN KEY (`compilation_id`) REFERENCES `compilation` (`id`),
  CONSTRAINT `FK_55663ADEA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table projet-dwwm-loic.save : ~0 rows (environ)

-- Listage de la structure de table projet-dwwm-loic. tag
CREATE TABLE IF NOT EXISTS `tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table projet-dwwm-loic.tag : ~0 rows (environ)

-- Listage de la structure de table projet-dwwm-loic. tag_compilation
CREATE TABLE IF NOT EXISTS `tag_compilation` (
  `compilation_id` int NOT NULL,
  `tag_id` int NOT NULL,
  PRIMARY KEY (`tag_id`,`compilation_id`),
  KEY `IDX_B196F712BAD26311` (`tag_id`),
  KEY `IDX_B196F712A5F8C840` (`compilation_id`),
  CONSTRAINT `FK_B196F712A5F8C840` FOREIGN KEY (`compilation_id`) REFERENCES `compilation` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B196F712BAD26311` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table projet-dwwm-loic.tag_compilation : ~0 rows (environ)

-- Listage de la structure de table projet-dwwm-loic. user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pseudo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `registration_date` datetime NOT NULL,
  `profile_picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `biography` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `roles` json NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_IDENTIFIER_EMAIL` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table projet-dwwm-loic.user : ~2 rows (environ)
INSERT INTO `user` (`id`, `email`, `pseudo`, `password`, `registration_date`, `profile_picture`, `alt`, `biography`, `roles`, `is_verified`) VALUES
	(5, 'user1@test.fr', 'user1', '$2y$13$MFIFx30jEGVNIWSsN2/6KuLgjgryw5AUuAc8/XFLK/lLE/YsuNwC2', '2024-12-13 07:39:35', NULL, NULL, NULL, '[]', 1),
	(6, 'user2@test.fr', 'user2', '$2y$13$/xJGxlnjBSHp4gBktAGwxeCXKS0W167WkdIZyGOzZvlQuaOGyvT.y', '2024-12-13 15:02:21', NULL, NULL, NULL, '[]', 0);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
