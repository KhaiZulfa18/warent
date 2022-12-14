-- -------------------------------------------------------------
-- TablePlus 5.1.0(468)
--
-- https://tableplus.com/
--
-- Database: warent
-- Generation Time: 2022-12-13 19:04:42.6010
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `booking`;
CREATE TABLE `booking` (
  `kode_booking` varchar(8) NOT NULL,
  `id_mobil` int NOT NULL,
  `tgl_mulai` date NOT NULL,
  `tgl_selesai` date NOT NULL,
  `durasi` int NOT NULL,
  `driver` int NOT NULL,
  `status` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `pickup` varchar(30) NOT NULL,
  `tgl_booking` date NOT NULL,
  `bukti_bayar` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`kode_booking`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `cek_booking`;
CREATE TABLE `cek_booking` (
  `kode_booking` varchar(8) NOT NULL,
  `id_mobil` int NOT NULL,
  `tgl_booking` varchar(10) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `merek`;
CREATE TABLE `merek` (
  `id_merek` int NOT NULL AUTO_INCREMENT,
  `nama_merek` varchar(120) NOT NULL,
  `CreationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_merek`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `mobil`;
CREATE TABLE `mobil` (
  `id_mobil` int NOT NULL AUTO_INCREMENT,
  `nama_mobil` varchar(150) DEFAULT NULL,
  `id_merek` int DEFAULT NULL,
  `nopol` varchar(20) NOT NULL,
  `deskripsi` longtext,
  `harga` int DEFAULT NULL,
  `bb` varchar(100) DEFAULT NULL,
  `tahun` int DEFAULT NULL,
  `seating` int DEFAULT NULL,
  `image1` varchar(120) DEFAULT NULL,
  `image2` varchar(120) DEFAULT NULL,
  `image3` varchar(120) DEFAULT NULL,
  `image4` varchar(120) DEFAULT NULL,
  `image5` varchar(120) DEFAULT NULL,
  `AirConditioner` int DEFAULT NULL,
  `PowerDoorLocks` int DEFAULT NULL,
  `AntiLockBrakingSystem` int DEFAULT NULL,
  `BrakeAssist` int DEFAULT NULL,
  `PowerSteering` int DEFAULT NULL,
  `DriverAirbag` int DEFAULT NULL,
  `PassengerAirbag` int DEFAULT NULL,
  `PowerWindows` int DEFAULT NULL,
  `CDPlayer` int DEFAULT NULL,
  `CentralLocking` int DEFAULT NULL,
  `CrashSensor` int DEFAULT NULL,
  `LeatherSeats` int DEFAULT NULL,
  `RegDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_mobil`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `rak`;
CREATE TABLE `rak` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(20) NOT NULL,
  `kode_rek` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `keterangan` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `kapasitas` int DEFAULT NULL,
  `biaya` int DEFAULT NULL,
  `tgl_buat` date DEFAULT NULL,
  `image1` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `image2` varchar(120) DEFAULT NULL,
  `image3` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `nama_user` varchar(120) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `telp` char(11) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `ktp` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kk` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

INSERT INTO `admin` (`id`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '2022-12-12 12:50:41');

INSERT INTO `merek` (`id_merek`, `nama_merek`, `CreationDate`, `UpdationDate`) VALUES
(14, 'Honda', '2019-06-08 01:05:23', NULL),
(15, 'MercedesBenz', '2019-06-08 01:29:46', NULL);

INSERT INTO `mobil` (`id_mobil`, `nama_mobil`, `id_merek`, `nopol`, `deskripsi`, `harga`, `bb`, `tahun`, `seating`, `image1`, `image2`, `image3`, `image4`, `image5`, `AirConditioner`, `PowerDoorLocks`, `AntiLockBrakingSystem`, `BrakeAssist`, `PowerSteering`, `DriverAirbag`, `PassengerAirbag`, `PowerWindows`, `CDPlayer`, `CentralLocking`, `CrashSensor`, `LeatherSeats`, `RegDate`, `UpdationDate`) VALUES
(10, 'RakSatu', 14, 'B 7730 NSP', 'Honda Freed 1500 cc transmision automatic seating capacity 6', 1000000, 'Bensin', 2012, 6, 'Honda-Freed-front.jpg', 'Honda-Freed-front.jpg', 'Honda-Freed-Interior.jpg', 'Honda-Freed-front.jpg', 'Honda-Freed-Interior.jpg', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2019-06-08 01:09:49', '2022-12-04 11:22:26'),
(11, 'RakDua', 14, 'B 9990 RXY', 'Honda CRV Tahun 2011', 1000000, 'Bensin', 2011, 5, 'Honda-CRV-2011-Front.jpg', 'Honda-CRV-2011-Rear.jpg', 'Honda-CRV-2011-Interior.jpg', 'Honda-CRV-2011-Rear.jpg', 'Honda-CRV-2011-Front.jpg', 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 0, '2019-06-08 01:27:37', NULL),
(12, 'RakTiga', 15, 'B 56789 OPX', 'Mercedes Benz C Class 1800 CC', 1000000, 'Bensin', 2012, 5, 'Merci-Cclass-service1.jpg', 'Merci-Cclass-service2.jpg', 'Merci-Cclass-service3.jpg', 'Merci-Cclass-service3.jpg', 'Merci-Cclass-service1.jpg', 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, '2019-06-08 01:32:21', NULL);

INSERT INTO `users` (`id_user`, `nama_user`, `email`, `password`, `telp`, `alamat`, `ktp`, `kk`, `RegDate`, `UpdationDate`) VALUES
(7, 'Yusuf', 'yusuf@gmail.com', 'dd2eb170076a5dec97cdbbbbff9a4405', '', '', '07092022132814id.png', '07092022132814id (1).png', '2022-09-07 18:28:14', '2022-12-04 12:57:20'),
(8, 'Widya Prastika', 'widya@gmail.com', '9146bfc09df862ee46fa9b512c72f9a6', '08977788898', 'Jl. Ahmad Yani', '07092022132849id.png', '07092022132849id (1).png', '2022-09-07 18:28:49', NULL),
(10, 'Andika', 'andiki@gmail.com', '0fc502878c8255bd1ffaa832fdcde0b6', '', '', '', '', '2022-12-03 13:17:36', '2022-12-03 13:18:32'),
(11, 'user', 'user@gmail.com', '21232f297a57a5a743894a0e4a801fc3', NULL, NULL, '', '', '2022-12-12 16:18:31', '2022-12-13 00:06:10');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;