# ************************************************************
# Sequel Ace SQL dump
# Version 20062
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: localhost (MySQL 8.0.32)
# Database: sequence_app
# Generation Time: 2024-02-25 17:48:45 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table failed_jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table genres
# ------------------------------------------------------------

DROP TABLE IF EXISTS `genres`;

CREATE TABLE `genres` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `genres_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;

INSERT INTO `genres` (`id`, `name`, `created_at`, `updated_at`)
VALUES
	(1,'hip-hop','2024-02-01 14:34:46','2024-02-01 14:34:46'),
	(2,'rnb','2024-02-01 14:34:46','2024-02-01 14:34:46'),
	(3,'house','2024-02-01 14:34:46','2024-02-01 14:34:46'),
	(4,'pop','2024-02-01 14:34:46','2024-02-01 14:34:46'),
	(5,'trap','2024-02-01 14:34:46','2024-02-01 14:34:46'),
	(6,'soul','2024-02-01 14:34:46','2024-02-01 14:34:46'),
	(7,'deep house','2024-02-01 14:34:46','2024-02-01 14:34:46'),
	(8,'techno','2024-02-01 14:34:46','2024-02-01 14:34:46'),
	(9,'edm','2024-02-01 14:34:46','2024-02-01 14:34:46'),
	(10,'tech house','2024-02-01 14:34:46','2024-02-01 14:34:46'),
	(11,'rock','2024-02-01 14:34:46','2024-02-01 14:34:46'),
	(12,'funk','2024-02-01 14:34:46','2024-02-01 14:34:46'),
	(13,'downtempo','2024-02-01 14:34:46','2024-02-01 14:34:46'),
	(14,'lo-fi','2024-02-01 14:34:46','2024-02-01 14:34:46'),
	(15,'lo-fi hip-hop','2024-02-01 14:34:46','2024-02-01 14:34:46'),
	(16,'cinematic','2024-02-01 14:34:46','2024-02-01 14:34:46'),
	(17,'jazz','2024-02-01 14:34:46','2024-02-01 14:34:46'),
	(18,'synthwave','2024-02-01 14:34:46','2024-02-01 14:34:46'),
	(19,'future bass','2024-02-01 14:34:46','2024-02-01 14:34:46'),
	(20,'neo soul','2024-02-01 14:34:46','2024-02-01 14:34:46'),
	(21,'afropop & afrobeats','2024-02-01 14:34:46','2024-02-01 14:34:46'),
	(22,'boom bap','2024-02-01 14:34:46','2024-02-01 14:34:46'),
	(23,'uk garage','2024-02-01 14:34:46','2024-02-01 14:34:46'),
	(24,'indie rock','2024-02-01 14:34:46','2024-02-01 14:34:46'),
	(25,'progressive house','2024-02-01 14:34:46','2024-02-01 14:34:46'),
	(26,'reggaeton','2024-02-01 14:34:46','2024-02-01 14:34:46'),
	(27,'disco','2024-02-01 14:34:46','2024-02-01 14:34:46'),
	(28,'dancehall','2024-02-01 14:34:46','2024-02-01 14:34:46'),
	(29,'dubstep','2024-02-01 14:34:46','2024-02-01 14:34:46'),
	(30,'drum and bass','2024-02-01 14:34:46','2024-02-01 14:34:46'),
	(31,'ambient','2024-02-01 14:34:46','2024-02-01 14:34:46'),
	(32,'indie dance','2024-02-01 14:34:46','2024-02-01 14:34:46'),
	(33,'trance','2024-02-01 14:34:46','2024-02-01 14:34:46'),
	(34,'experimental','2024-02-01 14:34:46','2024-02-01 14:34:46'),
	(35,'drill','2024-02-01 14:34:46','2024-02-01 14:34:46'),
	(36,'folk','2024-02-01 14:34:46','2024-02-01 14:34:46'),
	(37,'future house','2024-02-01 14:34:46','2024-02-01 14:34:46'),
	(38,'heavy metal','2024-02-01 14:34:46','2024-02-01 14:34:46'),
	(39,'indie pop','2024-02-01 14:34:46','2024-02-01 14:34:46'),
	(40,'hyperpop','2024-02-01 14:34:46','2024-02-01 14:34:46'),
	(41,'uk drill','2024-02-01 14:34:47','2024-02-01 14:34:47'),
	(42,'electro','2024-02-01 14:34:47','2024-02-01 14:34:47'),
	(43,'tearout dubstep','2024-02-01 14:34:47','2024-02-01 14:34:47'),
	(44,'synth-pop','2024-02-01 14:34:47','2024-02-01 14:34:47'),
	(45,'breakbeat','2024-02-01 14:34:47','2024-02-01 14:34:47'),
	(46,'minimal techno','2024-02-01 14:34:47','2024-02-01 14:34:47');

/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table instruments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `instruments`;

CREATE TABLE `instruments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `instruments_instrument_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `instruments` WRITE;
/*!40000 ALTER TABLE `instruments` DISABLE KEYS */;

INSERT INTO `instruments` (`id`, `name`, `created_at`, `updated_at`)
VALUES
	(1,'drums','2024-02-01 15:00:38','2024-02-01 15:00:38'),
	(2,'synth','2024-02-01 15:00:38','2024-02-01 15:00:38'),
	(3,'live sounds','2024-02-01 15:00:38','2024-02-01 15:00:38'),
	(4,'guitar','2024-02-01 15:00:38','2024-02-01 15:00:38'),
	(5,'keys','2024-02-01 15:00:38','2024-02-01 15:00:38'),
	(6,'hats','2024-02-01 15:00:38','2024-02-01 15:00:38'),
	(7,'percussion','2024-02-01 15:00:38','2024-02-01 15:00:38'),
	(8,'snares','2024-02-01 15:00:38','2024-02-01 15:00:38'),
	(9,'vocals','2024-02-01 15:00:38','2024-02-01 15:00:38'),
	(10,'kicks','2024-02-01 15:00:38','2024-02-01 15:00:38'),
	(11,'piano','2024-02-01 15:00:38','2024-02-01 15:00:38'),
	(12,'electric guitar','2024-02-01 15:00:38','2024-02-01 15:00:38'),
	(13,'toms','2024-02-01 15:00:38','2024-02-01 15:00:38'),
	(14,'rims','2024-02-01 15:00:38','2024-02-01 15:00:38'),
	(15,'808','2024-02-01 15:00:38','2024-02-01 15:00:38'),
	(16,'electric piano','2024-02-01 15:00:38','2024-02-01 15:00:38'),
	(17,'claps','2024-02-01 15:00:38','2024-02-01 15:00:38'),
	(18,'shakers','2024-02-01 15:00:38','2024-02-01 15:00:38'),
	(19,'cymbals','2024-02-01 15:00:38','2024-02-01 15:00:38'),
	(20,'crash','2024-02-01 15:00:38','2024-02-01 15:00:38'),
	(21,'juno','2024-02-01 15:00:38','2024-02-01 15:00:38');

/*!40000 ALTER TABLE `instruments` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `jobs`;

CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table likes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `likes`;

CREATE TABLE `likes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `sample_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `likes_user_id_sample_id_unique` (`user_id`,`sample_id`),
  KEY `likes_sample_id_foreign` (`sample_id`),
  CONSTRAINT `likes_sample_id_foreign` FOREIGN KEY (`sample_id`) REFERENCES `samples` (`id`) ON DELETE CASCADE,
  CONSTRAINT `likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;

INSERT INTO `likes` (`id`, `user_id`, `sample_id`, `created_at`, `updated_at`)
VALUES
	(48,1,49,'2024-02-25 16:48:03','2024-02-25 16:48:03');

/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_100000_create_password_reset_tokens_table',1),
	(3,'2019_08_19_000000_create_failed_jobs_table',1),
	(4,'2019_12_14_000001_create_personal_access_tokens_table',1),
	(5,'2023_10_12_080227_create_genres_table',1),
	(6,'2023_10_12_080250_create_instruments_table',1),
	(7,'2023_10_13_094_create_samples_table',2),
	(8,'2023_10_13_095512_create_tags_table',2),
	(9,'2023_10_20_115704_create_likes_table',2),
	(10,'2012_01_22_152654_make_type_nullable_in_samples_table',3),
	(11,'200_11_07_150835_add_profile_picture_to_users_table',4),
	(12,'2023_11_24_151511_add_bio_to_users_table',5),
	(13,'2024_01_19_174600_create_jobs_table',5),
	(14,'2024_02_01_145531_rename_instrument_to_name_in_instruments_table',5),
	(15,'2024_02_01_145915_create_sample_tag_table',5),
	(16,'2024_02_01_151336_remove_id_from_sample_tag_table',6),
	(17,'2024_02_01_152833_rename_sample_tag_table_to_sample_tags',7);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_reset_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_reset_tokens`;

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table personal_access_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table sample_tag
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sample_tag`;

CREATE TABLE `sample_tag` (
  `sample_id` bigint unsigned NOT NULL,
  `tag_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `sample_tag_sample_id_foreign` (`sample_id`),
  KEY `sample_tag_tag_id_foreign` (`tag_id`),
  CONSTRAINT `sample_tag_sample_id_foreign` FOREIGN KEY (`sample_id`) REFERENCES `samples` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sample_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `sample_tag` WRITE;
/*!40000 ALTER TABLE `sample_tag` DISABLE KEYS */;

INSERT INTO `sample_tag` (`sample_id`, `tag_id`, `created_at`, `updated_at`)
VALUES
	(46,29,NULL,NULL),
	(46,30,NULL,NULL),
	(47,22,NULL,NULL),
	(48,14,NULL,NULL),
	(48,23,NULL,NULL),
	(48,39,NULL,NULL),
	(49,21,NULL,NULL),
	(50,6,NULL,NULL),
	(51,31,NULL,NULL),
	(51,36,NULL,NULL),
	(51,22,NULL,NULL);

/*!40000 ALTER TABLE `sample_tag` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table samples
# ------------------------------------------------------------

DROP TABLE IF EXISTS `samples`;

CREATE TABLE `samples` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bpm` int unsigned NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `genre_id` bigint unsigned NOT NULL,
  `instrument_id` bigint unsigned NOT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `samples_genre_id_foreign` (`genre_id`),
  KEY `samples_instrument_id_foreign` (`instrument_id`),
  KEY `samples_user_id_foreign` (`user_id`),
  CONSTRAINT `samples_genre_id_foreign` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`) ON DELETE CASCADE,
  CONSTRAINT `samples_instrument_id_foreign` FOREIGN KEY (`instrument_id`) REFERENCES `instruments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `samples_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `samples` WRITE;
/*!40000 ALTER TABLE `samples` DISABLE KEYS */;

INSERT INTO `samples` (`id`, `title`, `bpm`, `key`, `scale`, `type`, `genre_id`, `instrument_id`, `file_path`, `user_id`, `created_at`, `updated_at`)
VALUES
	(46,'Bumbum 90',90,'C','major',NULL,24,13,'samples/441b746d-ca63-4036-9239-67f5a48d127e.wav',5,'2024-02-25 16:43:37','2024-02-25 16:43:37'),
	(47,'Vocals Falco',89,'G','minor',NULL,11,2,'samples/8b9a2328-eb55-48b6-9f68-cbe83014c62f.mp3',5,'2024-02-25 16:44:48','2024-02-25 16:44:48'),
	(48,'forgotten riff',126,'D','minor',NULL,22,17,'samples/72e00a34-3ec0-4f2c-b351-517c5293a72e.wav',5,'2024-02-25 16:45:12','2024-02-25 16:45:12'),
	(49,'Hi hats one shot',151,'D','minor',NULL,32,14,'samples/5745ea59-7689-4905-b335-d47632ca68dd.wav',1,'2024-02-25 16:46:10','2024-02-25 16:46:10'),
	(50,'swum hi hat one shot',153,'C#','minor',NULL,24,1,'samples/96c2c745-a9f7-4ad5-949b-11f97ffdc005.wav',1,'2024-02-25 16:46:49','2024-02-25 16:46:49'),
	(51,'housinger',154,'D','minor',NULL,36,12,'samples/cdaad869-2546-4f06-87c2-ee22f0dc08b9.wav',1,'2024-02-25 16:47:25','2024-02-25 17:00:25');

/*!40000 ALTER TABLE `samples` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tags`;

CREATE TABLE `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;

INSERT INTO `tags` (`id`, `name`, `created_at`, `updated_at`)
VALUES
	(1,'Acoustic',NULL,NULL),
	(2,'Electronic',NULL,NULL),
	(3,'Distorted',NULL,NULL),
	(4,'Clean',NULL,NULL),
	(5,'Bright',NULL,NULL),
	(6,'Dark',NULL,NULL),
	(7,'Warm',NULL,NULL),
	(8,'Cold',NULL,NULL),
	(9,'Metallic',NULL,NULL),
	(10,'Wooden',NULL,NULL),
	(11,'Slow',NULL,NULL),
	(12,'Medium',NULL,NULL),
	(13,'Fast',NULL,NULL),
	(14,'Upbeat',NULL,NULL),
	(15,'Downbeat',NULL,NULL),
	(16,'Rhythmic',NULL,NULL),
	(17,'Syncopated',NULL,NULL),
	(18,'Steady',NULL,NULL),
	(19,'Variable',NULL,NULL),
	(20,'Loop',NULL,NULL),
	(21,'Energetic',NULL,NULL),
	(22,'Relaxed',NULL,NULL),
	(23,'Melancholic',NULL,NULL),
	(24,'Happy',NULL,NULL),
	(25,'Sad',NULL,NULL),
	(26,'Aggressive',NULL,NULL),
	(27,'Soothing',NULL,NULL),
	(28,'Mysterious',NULL,NULL),
	(29,'Romantic',NULL,NULL),
	(30,'Uplifting',NULL,NULL),
	(31,'Cinematic',NULL,NULL),
	(32,'Vintage',NULL,NULL),
	(33,'Modern',NULL,NULL),
	(34,'Futuristic',NULL,NULL),
	(35,'Ethnic',NULL,NULL),
	(36,'Experimental',NULL,NULL),
	(37,'Ambient',NULL,NULL),
	(38,'Textured',NULL,NULL),
	(39,'Spatial',NULL,NULL),
	(40,'Layered',NULL,NULL);

/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_private` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `profile_picture_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `username`, `email`, `password`, `is_private`, `created_at`, `updated_at`, `profile_picture_path`, `bio`)
VALUES
	(1,'KennisBeats','beats@gmail.com','$2y$10$HLx4mXl56p.hngCi2xku6OwnfLdKwDTWYLGXP3r0x5/iUqPR191je',0,'2024-02-01 14:35:36','2024-02-23 09:12:42','profile_pictures/dfef93e2-1414-41e1-8767-605dcfc17d0a.jpg',NULL),
	(2,'Armin-Aadmin','armin@web.de','$2y$10$tprBOoHxcnZOy7HwfYMHaOrJtYQv2wJbMB2EI.t7GYYiwnBfohdJW',0,'2024-02-03 13:41:37','2024-02-06 07:37:41','profile_pictures/309260ad-c73b-4f76-aa0f-09e2c35fedab.png',NULL),
	(3,'Hello123','test@test.de','$2y$10$9ApGdJ4esYF2Cy22UCt9Lu3FcnA2Cl.bWITy11bp8cegEELc/VYzC',0,'2024-02-03 14:20:02','2024-02-03 14:23:55','profile_pictures/d7fb315a-3cdc-405b-8e4d-891100555feb.jpg',NULL),
	(4,'TestAcc','testacc@hotmail.de','$2y$10$B5vktXGR5IxijGAczHzUMuoEjbxWGfka4aV3Id7gKa4X7CkVucW1u',0,'2024-02-04 07:55:06','2024-02-04 07:55:06',NULL,NULL),
	(5,'Test-Producer','testacc@hotmail.com','$2y$10$Gwedfi/UDLP4ExgE7.xfmueKOyrR.ZvH3xhMA2ogmJ7Of1dBJCU4a',0,'2024-02-06 08:26:51','2024-02-06 09:19:40','profile_pictures/9c76892d-1b54-45b0-9224-ca9f3fccb2c5.png',NULL),
	(17,'testuser','testuser@test.de','$2y$10$KeLGF.Bez0VX6CFFr3XraOw3M1hWxlVMaGdkS8LOxwbrTcME0SU9W',0,'2024-02-25 12:21:59','2024-02-25 14:58:10','profile_pictures/c8f7e59d-499b-48d3-87cf-79ecdf22f262.jpg',NULL);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
