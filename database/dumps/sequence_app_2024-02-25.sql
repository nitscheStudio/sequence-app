# ************************************************************
# Sequel Ace SQL dump
# Version 20062
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: localhost (MySQL 8.0.32)
# Database: sequence_app
# Generation Time: 2024-02-25 14:24:28 +0000
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
	(1,1,8,'2024-02-01 16:47:09','2024-02-01 16:47:09'),
	(2,1,6,'2024-02-01 16:47:10','2024-02-01 16:47:10'),
	(3,1,5,'2024-02-04 20:05:55','2024-02-04 20:05:55'),
	(9,5,8,'2024-02-06 08:31:21','2024-02-06 08:31:21'),
	(10,5,10,'2024-02-06 08:31:23','2024-02-06 08:31:23'),
	(11,5,11,'2024-02-06 08:31:25','2024-02-06 08:31:25'),
	(12,5,14,'2024-02-06 08:31:25','2024-02-06 08:31:25'),
	(13,5,17,'2024-02-06 08:31:28','2024-02-06 08:31:28'),
	(20,1,2,'2024-02-08 14:45:25','2024-02-08 14:45:25'),
	(22,2,22,'2024-02-12 19:58:05','2024-02-12 19:58:05'),
	(23,6,26,'2024-02-13 13:43:24','2024-02-13 13:43:24'),
	(25,6,22,'2024-02-13 13:43:27','2024-02-13 13:43:27'),
	(26,6,29,'2024-02-13 21:02:34','2024-02-13 21:02:34'),
	(28,1,11,'2024-02-16 17:40:00','2024-02-16 17:40:00'),
	(29,1,32,'2024-02-19 20:49:31','2024-02-19 20:49:31'),
	(31,2,33,'2024-02-20 16:11:47','2024-02-20 16:11:47'),
	(32,2,29,'2024-02-20 16:11:48','2024-02-20 16:11:48'),
	(33,1,31,'2024-02-21 16:08:20','2024-02-21 16:08:20'),
	(35,1,29,'2024-02-21 21:24:43','2024-02-21 21:24:43'),
	(40,1,21,'2024-02-22 09:09:24','2024-02-22 09:09:24');

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
	(8,14,NULL,NULL),
	(8,30,NULL,NULL),
	(9,14,NULL,NULL),
	(9,28,NULL,NULL),
	(10,13,NULL,NULL),
	(10,23,NULL,NULL),
	(10,27,NULL,NULL),
	(11,26,NULL,NULL),
	(11,18,NULL,NULL),
	(11,6,NULL,NULL),
	(14,5,NULL,NULL),
	(14,20,NULL,NULL),
	(15,37,NULL,NULL),
	(15,4,NULL,NULL),
	(16,22,NULL,NULL),
	(16,27,NULL,NULL),
	(17,17,NULL,NULL),
	(17,38,NULL,NULL),
	(17,28,NULL,NULL),
	(18,22,NULL,NULL),
	(18,9,NULL,NULL),
	(18,39,NULL,NULL),
	(19,14,NULL,NULL),
	(19,30,NULL,NULL),
	(20,28,NULL,NULL),
	(20,23,NULL,NULL),
	(21,21,NULL,NULL),
	(21,17,NULL,NULL),
	(22,4,NULL,NULL),
	(26,12,NULL,NULL),
	(28,13,NULL,NULL),
	(29,3,NULL,NULL),
	(29,28,NULL,NULL),
	(29,36,NULL,NULL),
	(31,26,NULL,NULL),
	(32,4,NULL,NULL),
	(32,27,NULL,NULL),
	(32,26,NULL,NULL),
	(33,18,NULL,NULL),
	(35,29,NULL,NULL),
	(36,21,NULL,NULL),
	(36,15,NULL,NULL);

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
	(2,'Tin Loop Dark Guitar',140,'D','minor',NULL,3,2,'samples/28382f1f-3982-403e-991a-932c697596c1_wav',1,'2024-02-01 15:14:51','2024-02-01 15:14:51'),
	(4,'gerfgedf',120,'C#','major',NULL,24,3,'samples/2642c6b7-c82d-4048-b0cf-f7bbd675f95b_wav',1,'2024-02-01 16:07:19','2024-02-01 16:07:19'),
	(5,'dsfads',40,'C','minor',NULL,14,2,'samples/04e4e65c-994d-4e84-89af-87b5cb7e7c6a_wav',1,'2024-02-01 16:11:39','2024-02-01 16:11:39'),
	(6,'Drum Loop',115,'C#','major',NULL,27,1,'samples/039bb0ab-3cd5-4556-a5cc-9d0afd24f5b1_wav',1,'2024-02-01 16:23:36','2024-02-01 16:23:36'),
	(8,'5% Tint',140,'D','minor',NULL,31,17,'samples/a9620b97-7431-417c-be47-3b0ddcb3bbfd_wav',1,'2024-02-01 16:46:24','2024-02-01 16:46:24'),
	(9,'GFDGAF',40,'D','minor',NULL,31,15,'samples/7440ae75-b3a4-4ea0-8e76-e202021a783b_wav',1,'2024-02-01 16:54:25','2024-02-01 16:54:25'),
	(10,'Vox RIP SCREW',100,'C#','major',NULL,1,9,'samples/f8beeb3b-e11a-4160-b0b5-60d2f1e83bd7_wav',1,'2024-02-02 07:37:55','2024-02-02 07:37:55'),
	(11,'Moog Bass',89,'D','minor',NULL,18,15,'samples/3b9fd0e2-5bc5-47bd-b518-efaa4bc6cfc2_wav',1,'2024-02-02 07:39:01','2024-02-02 07:39:01'),
	(14,'Riser FX2',125,'C#','minor',NULL,39,2,'samples/01b3aef7-3827-4ba4-b5d5-49a7389c6d15_wav',1,'2024-02-05 08:40:23','2024-02-05 11:08:31'),
	(15,'instrumental',90,'F','major',NULL,35,2,'samples/9cf3c551-51ea-4d3e-9f0f-aee8190ece04_wav',1,'2024-02-05 18:28:42','2024-02-05 18:28:42'),
	(16,'dsfgddsfg',58,'C#','major',NULL,31,15,'samples/5b4bd779-2ae3-4951-a578-e8feed01c02a_wav',1,'2024-02-05 18:58:02','2024-02-05 18:58:02'),
	(17,'Pharaoleee',96,'C#','minor',NULL,43,5,'samples/afbc9c31-fee8-4c1e-96e2-1bc44a21137e_mp3',2,'2024-02-06 07:38:53','2024-02-06 07:38:53'),
	(18,'Test Samples',125,'A','major',NULL,36,4,'samples/cddc9775-4be1-4c8b-b2da-a1984800078c_mp3',5,'2024-02-06 08:27:36','2024-02-06 08:27:36'),
	(19,'dsafdsfsd',87,'G','minor',NULL,39,21,'samples/be84c468-e785-43c6-9e63-0a61dfe5a76e_mp3',5,'2024-02-06 08:54:39','2024-02-06 08:54:39'),
	(20,'fdsghasfdhg',89,'D','minor',NULL,31,17,'samples/f562f6bd-8e7f-4921-bfde-ea0a386786b3_wav',5,'2024-02-06 09:14:00','2024-02-06 09:14:00'),
	(21,'Hello Cooper',89,'D','minor',NULL,39,11,'samples/876d7b24-4659-4f23-a19e-4420ddcb1767_mp3',1,'2024-02-08 10:46:52','2024-02-08 10:46:52'),
	(22,'jkojmolk',189,'C#','minor',NULL,14,2,'samples/ccd56a51-4195-41d7-863e-9b77a4d1c9ba_mp3',1,'2024-02-11 15:28:15','2024-02-11 15:28:15'),
	(26,'Wollen lieben',40,'D','major',NULL,8,21,'samples/3d2e4bf6-112a-475f-9e8d-5d572dd4b772_mp3',2,'2024-02-12 19:31:16','2024-02-12 19:37:57'),
	(28,'dshfjkdsfg',56,'D','major',NULL,17,8,'samples/e442cf2d-4f0c-425d-9048-dc0d970250ae_mp3',6,'2024-02-13 14:07:51','2024-02-13 14:07:51'),
	(29,'DM ist teurer als Rossmann',120,'C#','major',NULL,20,21,'samples/66c0e004-fce7-4cf4-ae3e-04ecb433c30a_wav',6,'2024-02-13 17:36:25','2024-02-13 17:36:25'),
	(31,'Certified Hood Classic',79,'C','major',NULL,1,9,'samples/1fe043d8-bf05-4356-8cd0-edb5957262bb_wav',1,'2024-02-19 13:14:10','2024-02-19 13:14:10'),
	(32,'Dj Dropz',89,'D','minor',NULL,22,17,'samples/d2d102c2-65b2-4680-ab34-3371a041a000_wav',1,'2024-02-19 13:26:29','2024-02-19 13:26:29'),
	(33,'fdgsgdfg',156,'C#','minor',NULL,24,2,'samples/2c5e99e0-641d-4b92-bd79-31be21a4039f_wav',1,'2024-02-19 13:34:07','2024-02-19 13:34:07'),
	(35,'sdgDSGFFD',84,'C','minor',NULL,17,13,'samples/2a423063-3507-4c38-9a10-dafed837accd_wav',1,'2024-02-21 11:47:59','2024-02-21 11:47:59'),
	(36,'grfdfgfg',65,'C#','minor',NULL,22,17,'samples/794703c6-d5a3-4f6e-9033-f36be431cc0c_wav',1,'2024-02-21 16:09:06','2024-02-21 16:09:06');

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
	(6,'MörekBeats','mörekbeats@gmail.com','$2y$10$rgZfPVGmzcXWwoWaGtlZQOIipSoeIX40Yw.YrrXySXX2B8wIFykWe',0,'2024-02-13 13:42:26','2024-02-13 14:09:43','profile_pictures/f01c6c31-214f-49cf-a5b6-eedbedc1a6b1.jpg',NULL),
	(17,'testuser','testuser@test.de','$2y$10$KeLGF.Bez0VX6CFFr3XraOw3M1hWxlVMaGdkS8LOxwbrTcME0SU9W',0,'2024-02-25 12:21:59','2024-02-25 12:21:59',NULL,NULL);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
