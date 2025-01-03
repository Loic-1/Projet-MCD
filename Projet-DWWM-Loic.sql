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
  `alt` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table projet-dwwm-loic.category : ~8 rows (environ)
INSERT INTO `category` (`id`, `name`, `photo`, `alt`) VALUES
	(2, 'Entrée', 'tmp', NULL),
	(3, 'Plat', 'tmp', NULL),
	(4, 'Dessert', 'tmp', NULL),
	(6, 'Apéritifs', 'tmp', NULL),
	(7, 'Végétarien', 'tmp', NULL),
	(8, 'Petit déjeuner', 'tmp', NULL),
	(9, 'Boisson', 'tmp', NULL),
	(10, 'Rapide', 'tmp', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table projet-dwwm-loic.comment : ~6 rows (environ)
INSERT INTO `comment` (`id`, `title`, `content`, `creation_date`, `user_id`, `recipe_id`) VALUES
	(9, 'gfedzsz', 'kjjhgf', '2024-12-24 09:42:05', 5, 35),
	(10, 'hrtght', 'qgzgazgt\'(r', '2024-12-24 09:42:11', 5, 35),
	(11, '3', '3', '2024-12-24 09:42:17', 5, 35),
	(12, '4', '4', '2024-12-24 09:42:23', 5, 35),
	(13, '5', '5', '2024-12-24 09:42:28', 5, 35),
	(14, '6', '6', '2024-12-24 09:42:37', 5, 36);

-- Listage de la structure de table projet-dwwm-loic. compilation
CREATE TABLE IF NOT EXISTS `compilation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_AD5F8DF2A76ED395` (`user_id`),
  CONSTRAINT `FK_AD5F8DF2A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

-- Listage des données de la table projet-dwwm-loic.contain : ~0 rows (environ)

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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table projet-dwwm-loic.favorite : ~0 rows (environ)

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
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `recipe_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_14B7841859D8A214` (`recipe_id`),
  CONSTRAINT `FK_14B7841859D8A214` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table projet-dwwm-loic.photo : ~2 rows (environ)
INSERT INTO `photo` (`id`, `url`, `alt`, `recipe_id`, `name`) VALUES
	(9, NULL, NULL, 37, 'dfbf0a80ffbbebdaf9a332777be28147.webp'),
	(10, NULL, NULL, 37, '8b4b44b63a55e9b345e8d85a2fcdf200.webp');

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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table projet-dwwm-loic.recipe : ~3 rows (environ)
INSERT INTO `recipe` (`id`, `name`, `preparation_time`, `instructions`, `note`, `category_id`, `user_id`) VALUES
	(35, 'Salade niçoise', 15, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Error temporibus repudiandae exercitationem provident quos, porro quas ducimus sequi inventore, ut, enim animi nemo illo ipsum similique necessitatibus explicabo eaque recusandae.\r\nMollitia, eos sit nemo aperiam aspernatur autem odit, eaque quam quibusdam rerum aliquid blanditiis expedita maiores. Dicta, sunt expedita! Facilis sed magni placeat nobis assumenda vitae animi dolorem quas molestiae!\r\nRerum fugiat vero sunt placeat illum quos hic in, exercitationem distinctio officia dicta. Magnam magni tempore molestias, repudiandae tempora minus quod velit assumenda, id dolore aliquid aspernatur ratione reiciendis unde?\r\nOdit illo, dolore error tempore dicta officiis maxime enim quo corrupti ipsa magni quae obcaecati quasi magnam culpa cumque delectus saepe ut laboriosam aut numquam sed at accusantium ratione? Nesciunt!\r\nDicta, vero eligendi? Beatae, veniam quod voluptate, tenetur assumenda dicta laborum repellat maxime itaque quas cupiditate! Hic beatae neque et cupiditate. Voluptate alias nesciunt quas et sapiente repellat id. Dicta.', 8, 2, 5),
	(36, 'Steak frites', 15, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Error temporibus repudiandae exercitationem provident quos, porro quas ducimus sequi inventore, ut, enim animi nemo illo ipsum similique necessitatibus explicabo eaque recusandae.\r\nMollitia, eos sit nemo aperiam aspernatur autem odit, eaque quam quibusdam rerum aliquid blanditiis expedita maiores. Dicta, sunt expedita! Facilis sed magni placeat nobis assumenda vitae animi dolorem quas molestiae!\r\nRerum fugiat vero sunt placeat illum quos hic in, exercitationem distinctio officia dicta. Magnam magni tempore molestias, repudiandae tempora minus quod velit assumenda, id dolore aliquid aspernatur ratione reiciendis unde?\r\nOdit illo, dolore error tempore dicta officiis maxime enim quo corrupti ipsa magni quae obcaecati quasi magnam culpa cumque delectus saepe ut laboriosam aut numquam sed at accusantium ratione? Nesciunt!\r\nDicta, vero eligendi? Beatae, veniam quod voluptate, tenetur assumenda dicta laborum repellat maxime itaque quas cupiditate! Hic beatae neque et cupiditate. Voluptate alias nesciunt quas et sapiente repellat id. Dicta.', 5, 3, 5),
	(37, 'Loïc', 1474, '3211436', 10, 2, 7);

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
  `selector` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashed_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table projet-dwwm-loic.save : ~0 rows (environ)

-- Listage de la structure de table projet-dwwm-loic. tag
CREATE TABLE IF NOT EXISTS `tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table projet-dwwm-loic.user : ~4 rows (environ)
INSERT INTO `user` (`id`, `email`, `pseudo`, `password`, `registration_date`, `profile_picture`, `alt`, `biography`, `roles`, `is_verified`) VALUES
	(5, 'user1@test.fr', 'user1', '$2y$13$MFIFx30jEGVNIWSsN2/6KuLgjgryw5AUuAc8/XFLK/lLE/YsuNwC2', '2024-12-13 07:39:35', 'C:\\Users\\Loïc\\AppData\\Local\\Temp\\php39A8.tmp', NULL, 'Je suis user1', '[]', 1),
	(6, 'user2@test.fr', 'user2', '$2y$13$/xJGxlnjBSHp4gBktAGwxeCXKS0W167WkdIZyGOzZvlQuaOGyvT.y', '2024-12-13 15:02:21', NULL, NULL, NULL, '[]', 0),
	(7, 'user3@test.fr', 'user3', '$2y$13$LFiKPyHT0Smqj3SE2da6uOw.NhE7BmPGRZRGhUMObQE0vNGLE2mnm', '2024-12-16 14:37:19', NULL, NULL, NULL, '[]', 0),
	(8, 'user4@test.fr', 'user4', '$2y$13$gyUZQwxdKYwVayycZRpkFugRwP9zDrfZCQZwhM4unLXJn9jEAWF2a', '2024-12-17 15:53:03', NULL, NULL, NULL, '[]', 0);

-- Listage de la structure de table projet-dwwm-loic. user_followees
CREATE TABLE IF NOT EXISTS `user_followees` (
  `user_source` int NOT NULL,
  `user_target` int NOT NULL,
  PRIMARY KEY (`user_source`,`user_target`),
  KEY `IDX_816BF4D53AD8644E` (`user_source`),
  KEY `IDX_816BF4D5233D34C1` (`user_target`),
  CONSTRAINT `FK_816BF4D5233D34C1` FOREIGN KEY (`user_target`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_816BF4D53AD8644E` FOREIGN KEY (`user_source`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table projet-dwwm-loic.user_followees : ~3 rows (environ)
INSERT INTO `user_followees` (`user_source`, `user_target`) VALUES
	(5, 6),
	(5, 7),
	(5, 8);

-- Listage de la structure de table projet-dwwm-loic. user_followers
CREATE TABLE IF NOT EXISTS `user_followers` (
  `user_source` int NOT NULL,
  `user_target` int NOT NULL,
  PRIMARY KEY (`user_source`,`user_target`),
  KEY `IDX_84E870433AD8644E` (`user_source`),
  KEY `IDX_84E87043233D34C1` (`user_target`),
  CONSTRAINT `FK_84E87043233D34C1` FOREIGN KEY (`user_target`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_84E870433AD8644E` FOREIGN KEY (`user_source`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table projet-dwwm-loic.user_followers : ~3 rows (environ)
INSERT INTO `user_followers` (`user_source`, `user_target`) VALUES
	(6, 5),
	(7, 5),
	(8, 5);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
