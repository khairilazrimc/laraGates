-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
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


-- Dumping database structure for laragates
CREATE DATABASE IF NOT EXISTS `laragates` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `laragates`;

-- Dumping structure for table laragates.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
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

-- Dumping data for table laragates.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table laragates.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laragates.migrations: ~0 rows (approximately)
REPLACE INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(15, '2014_10_12_000000_create_users_table', 1),
	(16, '2014_10_12_100000_create_password_reset_tokens_table', 1),
	(17, '2019_08_19_000000_create_failed_jobs_table', 1),
	(18, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(19, '2023_02_28_064052_create_posts_table', 1);

-- Dumping structure for table laragates.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laragates.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table laragates.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
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

-- Dumping data for table laragates.personal_access_tokens: ~0 rows (approximately)

-- Dumping structure for table laragates.posts
CREATE TABLE IF NOT EXISTS `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_user_id_foreign` (`user_id`),
  CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laragates.posts: ~8 rows (approximately)
REPLACE INTO `posts` (`id`, `user_id`, `title`, `description`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Natus dignissimos voluptate aperiam velit fugit deserunt pariatur.', 'Deleniti ut voluptatibus nobis laborum.', '2023-02-28 02:19:28', '2023-02-28 02:19:28'),
	(2, 2, 'Quis qui consequatur natus et veniam.', 'Ab repellat vel quasi ut earum ipsam.', '2023-02-28 02:19:28', '2023-02-28 02:19:28'),
	(3, 3, 'Laudantium non qui temporibus cumque ipsam pariatur.', 'Velit aperiam sapiente occaecati consectetur.', '2023-02-28 02:19:28', '2023-02-28 02:19:28'),
	(4, 1, 'Consequuntur placeat est rerum vel.', 'Doloribus voluptatum tempora aut ipsum tempore similique laboriosam.', '2023-02-28 02:19:28', '2023-02-28 02:19:28'),
	(5, 2, 'Dolores magni consectetur est atque.', 'Eaque recusandae iusto facilis veniam vitae hic alias.', '2023-02-28 02:19:28', '2023-02-28 02:19:28'),
	(6, 3, 'Mollitia sit rerum sed id ea soluta enim voluptatem.', 'Hic iure ut placeat alias magnam ullam eos.', '2023-02-28 02:19:28', '2023-02-28 02:19:28'),
	(7, 2, 'Accusamus dolores occaecati hic.', 'Non dolor corporis ipsa beatae dolor sint odit quas.', '2023-02-28 02:19:28', '2023-02-28 02:19:28'),
	(8, 3, 'Consequatur voluptatem non magnam ad aut doloribus.', 'Pariatur dolorum dolores est nihil doloremque fuga dolores.', '2023-02-28 02:19:28', '2023-02-28 02:19:28');

-- Dumping structure for table laragates.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','viewer','editor') COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laragates.users: ~3 rows (approximately)
REPLACE INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Dev', 'dev@gmail.com', NULL, '$2y$10$pwXLHqIw7chjQYerVj5B1.B.JVzWH5WUgk9Kju4bGoH4G2W1VrSB2', 'admin', NULL, '2023-02-28 02:19:28', '2023-02-28 02:19:28'),
	(2, 'Pegawai', 'pegawai@gmail.com', NULL, '$2y$10$VDd5N9lt5WgsC2EvfzDfJu9htzivHKxDPRjAPqfGOUiN0vILTOBPG', 'editor', NULL, '2023-02-28 02:19:28', '2023-02-28 02:19:28'),
	(3, 'Public', 'public@gmail.com', NULL, '$2y$10$XZ4XHnBd0ZK5K.s0jUvTzu2D5fOxD9mFMhl40EBiGFRl3imfJOopm', 'viewer', NULL, '2023-02-28 02:19:28', '2023-02-28 02:19:28');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
