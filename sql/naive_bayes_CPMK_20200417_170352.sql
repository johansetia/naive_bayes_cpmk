-- Valentina Studio --
-- MySQL dump --
-- ---------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
-- ---------------------------------------------------------


-- DROP DATABASE "naive_bayes_CPMK" ------------------------
DROP DATABASE IF EXISTS `naive_bayes_CPMK`;
-- ---------------------------------------------------------


-- CREATE DATABASE "naive_bayes_CPMK" ----------------------
CREATE DATABASE `naive_bayes_CPMK` CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `naive_bayes_CPMK`;
-- ---------------------------------------------------------


-- CREATE TABLE "mahasiswa" ------------------------------------
CREATE TABLE `mahasiswa` ( 
	`id` Int( 10 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`jenis_kelamin` Enum( 'L', 'P' ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`status_mhs` Enum( 'MHS', 'KERJA' ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`pernikahan` Enum( 'SUDAH', 'BELUM' ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`ipk_grade` Enum( 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J' ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`status_kelulusan` Enum( 'TEPAT', 'TERLAMBAT' ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 37;
-- -------------------------------------------------------------


-- Dump data of "mahasiswa" --------------------------------
INSERT INTO `mahasiswa`(`id`,`jenis_kelamin`,`status_mhs`,`pernikahan`,`ipk_grade`,`status_kelulusan`) VALUES ( '1', 'L', 'MHS', 'BELUM', 'D', 'TEPAT' );
INSERT INTO `mahasiswa`(`id`,`jenis_kelamin`,`status_mhs`,`pernikahan`,`ipk_grade`,`status_kelulusan`) VALUES ( '2', 'L', 'KERJA', 'BELUM', 'D', 'TEPAT' );
INSERT INTO `mahasiswa`(`id`,`jenis_kelamin`,`status_mhs`,`pernikahan`,`ipk_grade`,`status_kelulusan`) VALUES ( '3', 'P', 'MHS', 'BELUM', 'D', 'TEPAT' );
INSERT INTO `mahasiswa`(`id`,`jenis_kelamin`,`status_mhs`,`pernikahan`,`ipk_grade`,`status_kelulusan`) VALUES ( '4', 'P', 'MHS', 'SUDAH', 'C', 'TEPAT' );
INSERT INTO `mahasiswa`(`id`,`jenis_kelamin`,`status_mhs`,`pernikahan`,`ipk_grade`,`status_kelulusan`) VALUES ( '5', 'L', 'KERJA', 'SUDAH', 'D', 'TEPAT' );
INSERT INTO `mahasiswa`(`id`,`jenis_kelamin`,`status_mhs`,`pernikahan`,`ipk_grade`,`status_kelulusan`) VALUES ( '6', 'L', 'KERJA', 'SUDAH', 'F', 'TERLAMBAT' );
INSERT INTO `mahasiswa`(`id`,`jenis_kelamin`,`status_mhs`,`pernikahan`,`ipk_grade`,`status_kelulusan`) VALUES ( '7', 'P', 'KERJA', 'SUDAH', 'D', 'TERLAMBAT' );
INSERT INTO `mahasiswa`(`id`,`jenis_kelamin`,`status_mhs`,`pernikahan`,`ipk_grade`,`status_kelulusan`) VALUES ( '8', 'P', 'KERJA', 'BELUM', 'E', 'TERLAMBAT' );
INSERT INTO `mahasiswa`(`id`,`jenis_kelamin`,`status_mhs`,`pernikahan`,`ipk_grade`,`status_kelulusan`) VALUES ( '9', 'L', 'KERJA', 'BELUM', 'E', 'TERLAMBAT' );
INSERT INTO `mahasiswa`(`id`,`jenis_kelamin`,`status_mhs`,`pernikahan`,`ipk_grade`,`status_kelulusan`) VALUES ( '10', 'P', 'MHS', 'SUDAH', 'F', 'TERLAMBAT' );
INSERT INTO `mahasiswa`(`id`,`jenis_kelamin`,`status_mhs`,`pernikahan`,`ipk_grade`,`status_kelulusan`) VALUES ( '11', 'P', 'MHS', 'BELUM', 'F', 'TERLAMBAT' );
INSERT INTO `mahasiswa`(`id`,`jenis_kelamin`,`status_mhs`,`pernikahan`,`ipk_grade`,`status_kelulusan`) VALUES ( '12', 'P', 'MHS', 'BELUM', 'C', 'TEPAT' );
INSERT INTO `mahasiswa`(`id`,`jenis_kelamin`,`status_mhs`,`pernikahan`,`ipk_grade`,`status_kelulusan`) VALUES ( '13', 'L', 'KERJA', 'SUDAH', 'D', 'TEPAT' );
INSERT INTO `mahasiswa`(`id`,`jenis_kelamin`,`status_mhs`,`pernikahan`,`ipk_grade`,`status_kelulusan`) VALUES ( '14', 'L', 'MHS', 'SUDAH', 'D', 'TEPAT' );
INSERT INTO `mahasiswa`(`id`,`jenis_kelamin`,`status_mhs`,`pernikahan`,`ipk_grade`,`status_kelulusan`) VALUES ( '15', 'L', 'MHS', 'BELUM', 'H', 'TERLAMBAT' );
INSERT INTO `mahasiswa`(`id`,`jenis_kelamin`,`status_mhs`,`pernikahan`,`ipk_grade`,`status_kelulusan`) VALUES ( '16', 'P', 'MHS', 'BELUM', 'A', 'TEPAT' );
INSERT INTO `mahasiswa`(`id`,`jenis_kelamin`,`status_mhs`,`pernikahan`,`ipk_grade`,`status_kelulusan`) VALUES ( '17', 'L', 'KERJA', 'BELUM', 'A', 'TEPAT' );
INSERT INTO `mahasiswa`(`id`,`jenis_kelamin`,`status_mhs`,`pernikahan`,`ipk_grade`,`status_kelulusan`) VALUES ( '18', 'P', 'MHS', 'BELUM', 'B', 'TEPAT' );
INSERT INTO `mahasiswa`(`id`,`jenis_kelamin`,`status_mhs`,`pernikahan`,`ipk_grade`,`status_kelulusan`) VALUES ( '19', 'L', 'KERJA', 'BELUM', 'B', 'TEPAT' );
INSERT INTO `mahasiswa`(`id`,`jenis_kelamin`,`status_mhs`,`pernikahan`,`ipk_grade`,`status_kelulusan`) VALUES ( '20', 'P', 'KERJA', 'SUDAH', 'C', 'TEPAT' );
INSERT INTO `mahasiswa`(`id`,`jenis_kelamin`,`status_mhs`,`pernikahan`,`ipk_grade`,`status_kelulusan`) VALUES ( '21', 'L', 'KERJA', 'BELUM', 'B', 'TEPAT' );
INSERT INTO `mahasiswa`(`id`,`jenis_kelamin`,`status_mhs`,`pernikahan`,`ipk_grade`,`status_kelulusan`) VALUES ( '22', 'P', 'KERJA', 'SUDAH', 'F', 'TERLAMBAT' );
INSERT INTO `mahasiswa`(`id`,`jenis_kelamin`,`status_mhs`,`pernikahan`,`ipk_grade`,`status_kelulusan`) VALUES ( '23', 'P', 'KERJA', 'BELUM', 'E', 'TERLAMBAT' );
INSERT INTO `mahasiswa`(`id`,`jenis_kelamin`,`status_mhs`,`pernikahan`,`ipk_grade`,`status_kelulusan`) VALUES ( '24', 'L', 'KERJA', 'BELUM', 'E', 'TERLAMBAT' );
INSERT INTO `mahasiswa`(`id`,`jenis_kelamin`,`status_mhs`,`pernikahan`,`ipk_grade`,`status_kelulusan`) VALUES ( '25', 'P', 'KERJA', 'SUDAH', 'D', 'TERLAMBAT' );
INSERT INTO `mahasiswa`(`id`,`jenis_kelamin`,`status_mhs`,`pernikahan`,`ipk_grade`,`status_kelulusan`) VALUES ( '26', 'P', 'KERJA', 'SUDAH', 'G', 'TERLAMBAT' );
INSERT INTO `mahasiswa`(`id`,`jenis_kelamin`,`status_mhs`,`pernikahan`,`ipk_grade`,`status_kelulusan`) VALUES ( '27', 'P', 'KERJA', 'BELUM', 'G', 'TERLAMBAT' );
INSERT INTO `mahasiswa`(`id`,`jenis_kelamin`,`status_mhs`,`pernikahan`,`ipk_grade`,`status_kelulusan`) VALUES ( '28', 'L', 'MHS', 'BELUM', 'A', 'TEPAT' );
INSERT INTO `mahasiswa`(`id`,`jenis_kelamin`,`status_mhs`,`pernikahan`,`ipk_grade`,`status_kelulusan`) VALUES ( '29', 'L', 'MHS', 'BELUM', 'A', 'TEPAT' );
INSERT INTO `mahasiswa`(`id`,`jenis_kelamin`,`status_mhs`,`pernikahan`,`ipk_grade`,`status_kelulusan`) VALUES ( '30', 'P', 'MHS', 'BELUM', 'B', 'TEPAT' );
INSERT INTO `mahasiswa`(`id`,`jenis_kelamin`,`status_mhs`,`pernikahan`,`ipk_grade`,`status_kelulusan`) VALUES ( '31', 'P', 'MHS', 'SUDAH', 'A', 'TEPAT' );
INSERT INTO `mahasiswa`(`id`,`jenis_kelamin`,`status_mhs`,`pernikahan`,`ipk_grade`,`status_kelulusan`) VALUES ( '32', 'P', 'MHS', 'SUDAH', 'B', 'TEPAT' );
INSERT INTO `mahasiswa`(`id`,`jenis_kelamin`,`status_mhs`,`pernikahan`,`ipk_grade`,`status_kelulusan`) VALUES ( '33', 'P', 'KERJA', 'SUDAH', 'E', 'TERLAMBAT' );
INSERT INTO `mahasiswa`(`id`,`jenis_kelamin`,`status_mhs`,`pernikahan`,`ipk_grade`,`status_kelulusan`) VALUES ( '34', 'L', 'KERJA', 'SUDAH', 'D', 'TEPAT' );
INSERT INTO `mahasiswa`(`id`,`jenis_kelamin`,`status_mhs`,`pernikahan`,`ipk_grade`,`status_kelulusan`) VALUES ( '35', 'L', 'KERJA', 'BELUM', 'D', 'TEPAT' );
INSERT INTO `mahasiswa`(`id`,`jenis_kelamin`,`status_mhs`,`pernikahan`,`ipk_grade`,`status_kelulusan`) VALUES ( '36', 'L', 'KERJA', 'SUDAH', 'E', 'TERLAMBAT' );
-- ---------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


