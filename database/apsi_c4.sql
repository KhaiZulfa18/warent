-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 05 Des 2022 pada 05.17
-- Versi server: 8.0.30
-- Versi PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apsi c4`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `administrator`
--

CREATE TABLE `administrator` (
  `id_admin` varchar(25) NOT NULL,
  `password` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `data penyewaan`
--

CREATE TABLE `data penyewaan` (
  `id_admin` varchar(25) NOT NULL,
  `kode_rak` int NOT NULL,
  `kapasitas_rak` int NOT NULL,
  `nama_barang` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penyewa gudang`
--

CREATE TABLE `penyewa gudang` (
  `id_penyewa` varchar(25) NOT NULL,
  `kode_rak` int NOT NULL,
  `password` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel transaksi`
--

CREATE TABLE `tabel transaksi` (
  `kode_transaksi` int NOT NULL,
  `nomor_pembayaran` int NOT NULL,
  `kode_rak` int NOT NULL,
  `id_penyewa` varchar(25) NOT NULL,
  `id_admin` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `data penyewaan`
--
ALTER TABLE `data penyewaan`
  ADD PRIMARY KEY (`kode_rak`),
  ADD UNIQUE KEY `id_admin` (`id_admin`);

--
-- Indeks untuk tabel `penyewa gudang`
--
ALTER TABLE `penyewa gudang`
  ADD PRIMARY KEY (`id_penyewa`),
  ADD UNIQUE KEY `kode_rak` (`kode_rak`);

--
-- Indeks untuk tabel `tabel transaksi`
--
ALTER TABLE `tabel transaksi`
  ADD PRIMARY KEY (`kode_transaksi`),
  ADD UNIQUE KEY `kode_rak` (`kode_rak`,`id_penyewa`,`id_admin`),
  ADD KEY `id_admin` (`id_admin`),
  ADD KEY `id_penyewa` (`id_penyewa`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `data penyewaan`
--
ALTER TABLE `data penyewaan`
  ADD CONSTRAINT `data penyewaan_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `administrator` (`id_admin`);

--
-- Ketidakleluasaan untuk tabel `penyewa gudang`
--
ALTER TABLE `penyewa gudang`
  ADD CONSTRAINT `penyewa gudang_ibfk_1` FOREIGN KEY (`kode_rak`) REFERENCES `data penyewaan` (`kode_rak`);

--
-- Ketidakleluasaan untuk tabel `tabel transaksi`
--
ALTER TABLE `tabel transaksi`
  ADD CONSTRAINT `tabel transaksi_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `administrator` (`id_admin`),
  ADD CONSTRAINT `tabel transaksi_ibfk_2` FOREIGN KEY (`id_penyewa`) REFERENCES `penyewa gudang` (`id_penyewa`),
  ADD CONSTRAINT `tabel transaksi_ibfk_3` FOREIGN KEY (`kode_rak`) REFERENCES `data penyewaan` (`kode_rak`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
