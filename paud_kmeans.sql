-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 25 Des 2025 pada 04.56
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `paud_kmeans`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `anak`
--

CREATE TABLE `anak` (
  `id_anak` int(11) NOT NULL,
  `nama_anak` varchar(100) DEFAULT NULL,
  `jenis_kelamin` enum('L','P') DEFAULT NULL,
  `usia` int(11) DEFAULT NULL,
  `kelas` varchar(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `anak`
--

INSERT INTO `anak` (`id_anak`, `nama_anak`, `jenis_kelamin`, `usia`, `kelas`, `created_at`) VALUES
(12, 'ABBAS ALY ZAENAL ABIDDIN', 'L', 5, '1', '2025-12-16 03:58:09'),
(13, 'ADIGUNA SANTOSO', 'L', 5, '1', '2025-12-16 03:58:09'),
(14, 'AHMAD FERDINANSYAH', 'L', 5, '1', '2025-12-16 03:58:09'),
(16, 'ALDEVANO GIBRAN VIDIANTO', 'L', 5, '1', '2025-12-16 03:58:09'),
(17, 'ALIFA KARINA KUMAIRA', 'P', 5, '1', '2025-12-16 03:58:09'),
(18, 'ALVINO HAFIZH MUWAFFAQ', 'L', 5, '1', '2025-12-16 03:58:09'),
(19, 'ARUNIKA QUEENSA MAULANA', 'P', 5, '1', '2025-12-16 03:58:09'),
(20, 'CALLISTA ZIA AL MAHIRA', 'P', 5, '1', '2025-12-16 03:58:09'),
(21, 'CARISHA QAILA HAKIM', 'P', 5, '1', '2025-12-16 03:58:09'),
(22, 'DZAKI MUHAMMAD IHSAN', 'L', 5, '1', '2025-12-16 03:58:09'),
(23, 'ELKHANO BRILIAN ALDAMA', 'L', 5, '1', '2025-12-16 03:58:09'),
(24, 'ELZIAN ANANDY ZAYN', 'L', 5, '1', '2025-12-16 03:58:09'),
(25, 'ERINA ANGGRAINI', 'P', 5, '1', '2025-12-16 03:58:09'),
(26, 'FIONA DANASTRI AZ-ZAHRA', 'P', 5, '1', '2025-12-16 03:58:09'),
(27, 'HAFIDZAH LILI KIRANA', 'P', 5, '1', '2025-12-16 03:58:09'),
(28, 'IKHSANUL SHAHBAZ WISTARA', 'L', 5, '1', '2025-12-16 03:58:09'),
(29, 'IZZ AVISHA OMAR KEIFANNOVA', 'P', 5, '1', '2025-12-16 03:58:09'),
(30, 'KENZO AKARSH ABHINAYA', 'L', 5, '1', '2025-12-16 03:58:09'),
(31, 'LUTHFAN ALFARIZQY', 'L', 5, '1', '2025-12-16 03:58:09'),
(32, 'MAGHFIROTUZADA ALISYA ADITYA', 'P', 5, '1', '2025-12-16 03:58:09'),
(33, 'MIRZA ZIANDRU ARDHANA ATHA', 'L', 5, '1', '2025-12-16 03:58:09'),
(34, 'MUHAMMAD BILAL HANAFI', 'L', 5, '1', '2025-12-16 03:58:09'),
(35, 'NABILA KEISYA RAMADHANI', 'P', 5, '1', '2025-12-16 03:58:09'),
(36, 'NURI TATA AYU NING ATI', 'P', 5, '1', '2025-12-16 03:58:09'),
(37, 'RAHARDIAN MAHARDIKA', 'L', 5, '1', '2025-12-16 03:58:09'),
(38, 'REFINDA PRAMUDHITA HUSNA', 'P', 5, '1', '2025-12-16 03:58:09'),
(39, 'RENATA CHERILYN FAZRINA', 'P', 5, '1', '2025-12-16 03:58:09'),
(40, 'REONA ZEA', 'P', 5, '1', '2025-12-16 03:58:09'),
(41, 'VIONA NAUFALYN LUBNA', 'P', 5, '1', '2025-12-16 03:58:09'),
(42, 'ZELINE AYU ANINDYA', 'P', 5, '1', '2025-12-16 03:58:09'),
(43, 'AKSA NAUFAL ATHAR', 'L', 5, '1', '2025-12-16 08:03:22');

-- --------------------------------------------------------

--
-- Struktur dari tabel `aspek_perkembangan`
--

CREATE TABLE `aspek_perkembangan` (
  `id_aspek` int(11) NOT NULL,
  `nama_aspek` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `aspek_perkembangan`
--

INSERT INTO `aspek_perkembangan` (`id_aspek`, `nama_aspek`) VALUES
(1, 'Nilai Agama dan Moral'),
(2, 'Fisik Motorik'),
(3, 'Kognitif'),
(4, 'Bahasa'),
(5, 'Sosial Emosional'),
(6, 'Seni');

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru`
--

CREATE TABLE `guru` (
  `id_guru` int(11) NOT NULL,
  `nama_guru` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `guru`
--

INSERT INTO `guru` (`id_guru`, `nama_guru`, `username`, `password`, `created_at`) VALUES
(1, 'qonik atul mardiyah', 'qonik_atul', '$2y$10$jcWlBPQXbaxJ1JObDfOJO.O3fp1r1LIcYJS1ppRlgqUKjMTG7zzOi', '2025-12-14 02:57:52');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kmeans_hasil`
--

CREATE TABLE `kmeans_hasil` (
  `id` int(11) NOT NULL,
  `id_anak` int(11) DEFAULT NULL,
  `cluster` int(11) DEFAULT NULL,
  `nilai_total` float DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kmeans_hasil`
--

INSERT INTO `kmeans_hasil` (`id`, `id_anak`, `cluster`, `nilai_total`, `created_at`) VALUES
(1, 12, 1, 1.6667, '2025-12-16 23:41:35'),
(2, 13, 2, 2.3333, '2025-12-16 23:41:35'),
(3, 14, 3, 2.5, '2025-12-16 23:41:35'),
(4, 16, 2, 2.1667, '2025-12-16 23:41:35'),
(5, 17, 2, 2.3333, '2025-12-16 23:41:35'),
(6, 18, 3, 2.5, '2025-12-16 23:41:35'),
(7, 19, 3, 2.5, '2025-12-16 23:41:35'),
(8, 20, 4, 2.6667, '2025-12-16 23:41:35'),
(9, 21, 3, 2.5, '2025-12-16 23:41:35'),
(10, 22, 4, 2.8333, '2025-12-16 23:41:35'),
(11, 23, 4, 3, '2025-12-16 23:41:35'),
(12, 24, 4, 2.8333, '2025-12-16 23:41:35'),
(13, 25, 4, 2.8333, '2025-12-16 23:41:35'),
(14, 26, 4, 2.6667, '2025-12-16 23:41:35'),
(15, 27, 2, 2.1667, '2025-12-16 23:41:35'),
(16, 28, 1, 2, '2025-12-16 23:41:35'),
(17, 29, 2, 2.1667, '2025-12-16 23:41:35'),
(18, 30, 2, 2.3333, '2025-12-16 23:41:35'),
(19, 31, 3, 2.5, '2025-12-16 23:41:35'),
(20, 32, 4, 2.6667, '2025-12-16 23:41:35'),
(21, 33, 3, 2.5, '2025-12-16 23:41:35'),
(22, 34, 3, 2.5, '2025-12-16 23:41:35'),
(23, 35, 2, 2.3333, '2025-12-16 23:41:35'),
(24, 36, 2, 2.3333, '2025-12-16 23:41:35'),
(25, 37, 3, 2.5, '2025-12-16 23:41:35'),
(26, 38, 2, 2.1667, '2025-12-16 23:41:35'),
(27, 39, 3, 2.5, '2025-12-16 23:41:35'),
(28, 40, 2, 2.3333, '2025-12-16 23:41:35'),
(29, 41, 2, 2.3333, '2025-12-16 23:41:35'),
(30, 42, 1, 2, '2025-12-16 23:41:35'),
(31, 43, 1, 2, '2025-12-16 23:41:35');

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai_perkembangan`
--

CREATE TABLE `nilai_perkembangan` (
  `id_nilai` int(11) NOT NULL,
  `id_anak` int(11) DEFAULT NULL,
  `id_aspek` int(11) DEFAULT NULL,
  `nilai` enum('BM','KM','SM','K') NOT NULL,
  `nilai_angka` int(11) DEFAULT NULL,
  `tgl_input` date DEFAULT NULL,
  `id_guru` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `nilai_perkembangan`
--

INSERT INTO `nilai_perkembangan` (`id_nilai`, `id_anak`, `id_aspek`, `nilai`, `nilai_angka`, `tgl_input`, `id_guru`) VALUES
(1, 12, 1, 'BM', 1, '2025-12-16', 1),
(2, 12, 2, 'KM', 2, '2025-12-16', 1),
(3, 12, 3, 'KM', 2, '2025-12-16', 1),
(4, 12, 4, 'BM', 1, '2025-12-16', 1),
(5, 12, 5, 'SM', 3, '2025-12-16', 1),
(6, 12, 6, 'BM', 1, '2025-12-16', 1),
(7, 13, 1, 'KM', 2, '2025-12-16', 1),
(8, 13, 2, 'SM', 3, '2025-12-16', 1),
(9, 13, 3, 'KM', 2, '2025-12-16', 1),
(10, 13, 4, 'KM', 2, '2025-12-16', 1),
(11, 13, 5, 'SM', 3, '2025-12-16', 1),
(12, 13, 6, 'KM', 2, '2025-12-16', 1),
(13, 14, 1, 'KM', 2, '2025-12-16', 1),
(14, 14, 2, 'SM', 3, '2025-12-16', 1),
(15, 14, 3, 'SM', 3, '2025-12-16', 1),
(16, 14, 4, 'SM', 3, '2025-12-16', 1),
(17, 14, 5, 'KM', 2, '2025-12-16', 1),
(18, 14, 6, 'KM', 2, '2025-12-16', 1),
(25, 16, 3, 'SM', 3, '2025-12-16', 1),
(26, 16, 4, 'KM', 2, '2025-12-16', 1),
(27, 16, 2, 'KM', 2, '2025-12-16', 1),
(28, 16, 5, 'KM', 2, '2025-12-16', 1),
(29, 16, 6, 'KM', 2, '2025-12-16', 1),
(30, 16, 1, 'KM', 2, '2025-12-16', 1),
(32, 17, 3, 'SM', 3, '2025-12-16', 1),
(33, 17, 4, 'KM', 2, '2025-12-16', 1),
(34, 17, 2, 'SM', 3, '2025-12-16', 1),
(35, 17, 5, 'KM', 2, '2025-12-16', 1),
(36, 17, 6, 'KM', 2, '2025-12-16', 1),
(37, 17, 1, 'KM', 2, '2025-12-16', 1),
(38, 18, 3, 'SM', 3, '2025-12-16', 1),
(39, 18, 4, 'KM', 2, '2025-12-16', 1),
(40, 18, 2, 'SM', 3, '2025-12-16', 1),
(41, 18, 5, 'KM', 2, '2025-12-16', 1),
(42, 18, 6, 'SM', 3, '2025-12-16', 1),
(43, 18, 1, 'KM', 2, '2025-12-16', 1),
(44, 19, 3, 'SM', 3, '2025-12-16', 1),
(45, 19, 4, 'KM', 2, '2025-12-16', 1),
(46, 19, 2, 'SM', 3, '2025-12-16', 1),
(47, 19, 5, 'KM', 2, '2025-12-16', 1),
(48, 19, 6, 'SM', 3, '2025-12-16', 1),
(49, 19, 1, 'KM', 2, '2025-12-16', 1),
(50, 20, 3, 'SM', 3, '2025-12-16', 1),
(51, 20, 4, 'KM', 2, '2025-12-16', 1),
(52, 20, 2, 'SM', 3, '2025-12-16', 1),
(53, 20, 5, 'SM', 3, '2025-12-16', 1),
(54, 20, 6, 'SM', 3, '2025-12-16', 1),
(55, 20, 1, 'KM', 2, '2025-12-16', 1),
(56, 21, 3, 'KM', 2, '2025-12-16', 1),
(57, 21, 4, 'KM', 2, '2025-12-16', 1),
(58, 21, 2, 'SM', 3, '2025-12-16', 1),
(59, 21, 5, 'SM', 3, '2025-12-16', 1),
(60, 21, 6, 'SM', 3, '2025-12-16', 1),
(61, 21, 1, 'KM', 2, '2025-12-16', 1),
(62, 22, 3, 'SM', 3, '2025-12-16', 1),
(63, 22, 4, 'KM', 2, '2025-12-16', 1),
(64, 22, 2, 'SM', 3, '2025-12-16', 1),
(65, 22, 5, 'SM', 3, '2025-12-16', 1),
(66, 22, 6, 'SM', 3, '2025-12-16', 1),
(67, 22, 1, 'SM', 3, '2025-12-16', 1),
(68, 23, 3, 'SM', 3, '2025-12-16', 1),
(69, 23, 4, 'SM', 3, '2025-12-16', 1),
(70, 23, 2, 'SM', 3, '2025-12-16', 1),
(71, 23, 5, 'SM', 3, '2025-12-16', 1),
(72, 23, 6, 'SM', 3, '2025-12-16', 1),
(73, 23, 1, 'SM', 3, '2025-12-16', 1),
(74, 24, 3, 'SM', 3, '2025-12-16', 1),
(75, 24, 4, 'SM', 3, '2025-12-16', 1),
(76, 24, 2, 'SM', 3, '2025-12-16', 1),
(77, 24, 5, 'KM', 2, '2025-12-16', 1),
(78, 24, 6, 'SM', 3, '2025-12-16', 1),
(79, 24, 1, 'SM', 3, '2025-12-16', 1),
(80, 25, 3, 'SM', 3, '2025-12-16', 1),
(81, 25, 4, 'SM', 3, '2025-12-16', 1),
(82, 25, 2, 'SM', 3, '2025-12-16', 1),
(83, 25, 5, 'KM', 2, '2025-12-16', 1),
(84, 25, 6, 'SM', 3, '2025-12-16', 1),
(85, 25, 1, 'SM', 3, '2025-12-16', 1),
(86, 26, 3, 'SM', 3, '2025-12-16', 1),
(87, 26, 4, 'KM', 2, '2025-12-16', 1),
(88, 26, 2, 'SM', 3, '2025-12-16', 1),
(89, 26, 5, 'KM', 2, '2025-12-16', 1),
(90, 26, 6, 'SM', 3, '2025-12-16', 1),
(91, 26, 1, 'SM', 3, '2025-12-16', 1),
(92, 36, 3, 'BM', 1, '2025-12-16', 1),
(93, 36, 4, 'KM', 2, '2025-12-16', 1),
(94, 36, 2, 'SM', 3, '2025-12-16', 1),
(95, 36, 5, 'KM', 2, '2025-12-16', 1),
(96, 36, 6, 'SM', 3, '2025-12-16', 1),
(97, 36, 1, 'SM', 3, '2025-12-16', 1),
(159, 42, 1, 'KM', 2, '2025-12-16', 1),
(160, 42, 2, 'KM', 2, '2025-12-16', 1),
(161, 42, 3, 'KM', 2, '2025-12-16', 1),
(162, 42, 4, 'KM', 2, '2025-12-16', 1),
(163, 42, 5, 'KM', 2, '2025-12-16', 1),
(164, 42, 6, 'KM', 2, '2025-12-16', 1),
(165, 41, 1, 'SM', 3, '2025-12-16', 1),
(166, 41, 2, 'KM', 2, '2025-12-16', 1),
(167, 41, 3, 'KM', 2, '2025-12-16', 1),
(168, 41, 4, 'SM', 3, '2025-12-16', 1),
(169, 41, 5, 'KM', 2, '2025-12-16', 1),
(170, 41, 6, 'KM', 2, '2025-12-16', 1),
(171, 40, 1, 'KM', 2, '2025-12-16', 1),
(172, 40, 2, 'KM', 2, '2025-12-16', 1),
(173, 40, 3, 'SM', 3, '2025-12-16', 1),
(174, 40, 4, 'SM', 3, '2025-12-16', 1),
(175, 40, 5, 'KM', 2, '2025-12-16', 1),
(176, 40, 6, 'KM', 2, '2025-12-16', 1),
(177, 39, 1, 'KM', 2, '2025-12-16', 1),
(178, 39, 2, 'KM', 2, '2025-12-16', 1),
(179, 39, 3, 'SM', 3, '2025-12-16', 1),
(180, 39, 4, 'SM', 3, '2025-12-16', 1),
(181, 39, 5, 'KM', 2, '2025-12-16', 1),
(182, 39, 6, 'SM', 3, '2025-12-16', 1),
(183, 38, 1, 'KM', 2, '2025-12-16', 1),
(184, 38, 2, 'KM', 2, '2025-12-16', 1),
(185, 38, 3, 'KM', 2, '2025-12-16', 1),
(186, 38, 4, 'KM', 2, '2025-12-16', 1),
(187, 38, 5, 'KM', 2, '2025-12-16', 1),
(188, 38, 6, 'SM', 3, '2025-12-16', 1),
(189, 37, 1, 'SM', 3, '2025-12-16', 1),
(190, 37, 2, 'SM', 3, '2025-12-16', 1),
(191, 37, 3, 'KM', 2, '2025-12-16', 1),
(192, 37, 4, 'KM', 2, '2025-12-16', 1),
(193, 37, 5, 'KM', 2, '2025-12-16', 1),
(194, 37, 6, 'SM', 3, '2025-12-16', 1),
(222, 27, 3, 'KM', 2, '2025-12-16', 1),
(223, 27, 4, 'KM', 2, '2025-12-16', 1),
(224, 27, 2, 'KM', 2, '2025-12-16', 1),
(225, 27, 5, 'KM', 2, '2025-12-16', 1),
(226, 27, 6, 'KM', 2, '2025-12-16', 1),
(227, 27, 1, 'SM', 3, '2025-12-16', 1),
(228, 28, 3, 'KM', 2, '2025-12-16', 1),
(229, 28, 4, 'BM', 1, '2025-12-16', 1),
(230, 28, 2, 'KM', 2, '2025-12-16', 1),
(231, 28, 5, 'KM', 2, '2025-12-16', 1),
(232, 28, 6, 'KM', 2, '2025-12-16', 1),
(233, 28, 1, 'SM', 3, '2025-12-16', 1),
(234, 29, 3, 'KM', 2, '2025-12-16', 1),
(235, 29, 4, 'KM', 2, '2025-12-16', 1),
(236, 29, 2, 'KM', 2, '2025-12-16', 1),
(237, 29, 5, 'KM', 2, '2025-12-16', 1),
(238, 29, 6, 'KM', 2, '2025-12-16', 1),
(239, 29, 1, 'SM', 3, '2025-12-16', 1),
(240, 30, 3, 'BM', 1, '2025-12-16', 1),
(241, 30, 4, 'KM', 2, '2025-12-16', 1),
(242, 30, 2, 'SM', 3, '2025-12-16', 1),
(243, 30, 5, 'SM', 3, '2025-12-16', 1),
(244, 30, 6, 'KM', 2, '2025-12-16', 1),
(245, 30, 1, 'SM', 3, '2025-12-16', 1),
(246, 31, 3, 'KM', 2, '2025-12-16', 1),
(247, 31, 4, 'SM', 3, '2025-12-16', 1),
(248, 31, 2, 'SM', 3, '2025-12-16', 1),
(249, 31, 5, 'SM', 3, '2025-12-16', 1),
(250, 31, 6, 'BM', 1, '2025-12-16', 1),
(251, 31, 1, 'SM', 3, '2025-12-16', 1),
(252, 32, 3, 'KM', 2, '2025-12-16', 1),
(253, 32, 4, 'SM', 3, '2025-12-16', 1),
(254, 32, 2, 'SM', 3, '2025-12-16', 1),
(255, 32, 5, 'SM', 3, '2025-12-16', 1),
(256, 32, 6, 'KM', 2, '2025-12-16', 1),
(257, 32, 1, 'SM', 3, '2025-12-16', 1),
(258, 33, 3, 'SM', 3, '2025-12-16', 1),
(259, 33, 4, 'KM', 2, '2025-12-16', 1),
(260, 33, 2, 'KM', 2, '2025-12-16', 1),
(261, 33, 5, 'SM', 3, '2025-12-16', 1),
(262, 33, 6, 'KM', 2, '2025-12-16', 1),
(263, 33, 1, 'SM', 3, '2025-12-16', 1),
(264, 34, 3, 'SM', 3, '2025-12-16', 1),
(265, 34, 4, 'KM', 2, '2025-12-16', 1),
(266, 34, 2, 'KM', 2, '2025-12-16', 1),
(267, 34, 5, 'SM', 3, '2025-12-16', 1),
(268, 34, 6, 'KM', 2, '2025-12-16', 1),
(269, 34, 1, 'SM', 3, '2025-12-16', 1),
(270, 35, 3, 'SM', 3, '2025-12-16', 1),
(271, 35, 4, 'KM', 2, '2025-12-16', 1),
(272, 35, 2, 'KM', 2, '2025-12-16', 1),
(273, 35, 5, 'KM', 2, '2025-12-16', 1),
(274, 35, 6, 'SM', 3, '2025-12-16', 1),
(275, 35, 1, 'KM', 2, '2025-12-16', 1),
(285, 43, 1, 'KM', 2, '2025-12-16', NULL),
(286, 43, 2, 'KM', 2, '2025-12-16', NULL),
(287, 43, 3, 'KM', 2, '2025-12-16', NULL),
(288, 43, 4, 'KM', 2, '2025-12-16', NULL),
(289, 43, 5, 'KM', 2, '2025-12-16', NULL),
(290, 43, 6, 'KM', 2, '2025-12-16', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `rekomendasi_aspek`
--

CREATE TABLE `rekomendasi_aspek` (
  `id_rek_aspek` int(11) NOT NULL,
  `id_aspek` int(11) DEFAULT NULL,
  `kategori` varchar(100) DEFAULT NULL,
  `rekomendasi` text DEFAULT NULL,
  `dibuat_pada` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `rekomendasi_aspek`
--

INSERT INTO `rekomendasi_aspek` (`id_rek_aspek`, `id_aspek`, `kategori`, `rekomendasi`, `dibuat_pada`) VALUES
(1, 1, 'BM', 'Biasakan anak mengikuti doa bersama walau belum mau mengucap.', '2025-12-14 10:21:26'),
(2, 1, 'KM', 'Ajak anak mengulang salam dan doa pendek secara perlahan.', '2025-12-14 10:21:26'),
(3, 1, 'SM', 'Latih anak mempraktikkan salam, terima kasih, dan maaf dalam kegiatan sehari-hari.', '2025-12-14 10:21:26'),
(4, 1, 'K', 'Berikan tugas kecil seperti memimpin doa atau memberi salam pada teman.', '2025-12-14 10:21:26'),
(5, 2, 'BM', 'Latihan berjalan di garis tanah tanpa tuntutan.', '2025-12-14 10:21:26'),
(6, 2, 'KM', 'Latihan melompat di lingkaran tali meski belum seimbang.', '2025-12-14 10:21:26'),
(7, 2, 'SM', 'Berlari ringan mengelilingi halaman dengan arahan guru.', '2025-12-14 10:21:26'),
(8, 2, 'K', 'Menyeimbangkan badan di atas balok atau kayu secara mandiri.', '2025-12-14 10:21:26'),
(9, 3, 'BM', 'Mengenalkan warna dan bentuk dasar tanpa tuntutan menjawab.', '2025-12-14 10:21:26'),
(10, 3, 'KM', 'Mengelompokkan benda seperti daun dan batu dengan bimbingan.', '2025-12-14 10:21:26'),
(11, 3, 'SM', 'Menghitung benda 1 sampai 5 dengan cukup tepat.', '2025-12-14 10:21:26'),
(12, 3, 'K', 'Mengurutkan benda dari kecil ke besar secara mandiri.', '2025-12-14 10:21:26'),
(13, 4, 'BM', 'Ajak anak menyimak cerita meski belum merespon.', '2025-12-14 10:21:26'),
(14, 4, 'KM', 'Latihan menjawab pertanyaan satu kata seperti apa atau ini.', '2025-12-14 10:21:26'),
(15, 4, 'SM', 'Latihan mengungkapkan kalimat dua sampai tiga kata.', '2025-12-14 10:21:26'),
(16, 4, 'K', 'Anak dapat bercerita pendek tentang kegiatan di rumah.', '2025-12-14 10:21:26'),
(17, 5, 'BM', 'Mengajak anak bermain berdampingan tanpa interaksi terlebih dahulu.', '2025-12-14 10:21:26'),
(18, 5, 'KM', 'Anak mulai mau berbagi mainan meski kadang masih menolak.', '2025-12-14 10:21:26'),
(19, 5, 'SM', 'Anak sering menunggu giliran dengan arahan guru.', '2025-12-14 10:21:26'),
(20, 5, 'K', 'Anak konsisten menunjukkan sikap sopan dan mampu mengelola emosi dengan baik.', '2025-12-14 10:21:26'),
(21, 6, 'BM', 'Membiarkan anak mencoret bebas menggunakan alat apapun.', '2025-12-14 10:21:26'),
(22, 6, 'KM', 'Menggambar bentuk sederhana dengan contoh dari guru.', '2025-12-14 10:21:26'),
(23, 6, 'SM', 'Menyanyi atau menari mengikuti irama secara rutin.', '2025-12-14 10:21:26'),
(24, 6, 'K', 'Membuat karya seni sederhana seperti kolase daun atau cap tangan tanpa banyak bantuan.', '2025-12-14 10:21:26'),
(25, 1, 'SM', 'mulai ajar anak untuk menghafal doa harian pendek', '2025-12-14 11:16:11');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rekomendasi_klaster`
--

CREATE TABLE `rekomendasi_klaster` (
  `id` int(11) NOT NULL,
  `id_anak` int(11) DEFAULT NULL,
  `rekomendasi` text DEFAULT NULL,
  `dibuat_pada` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `rekomendasi_klaster`
--

INSERT INTO `rekomendasi_klaster` (`id`, `id_anak`, `rekomendasi`, `dibuat_pada`) VALUES
(95, 28, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 04:15:43'),
(96, 12, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan seni dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 04:15:43'),
(98, 28, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 04:15:43'),
(99, 36, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan kognitif dan sosial emosional masih perlu penguatan.', '2025-12-16 04:15:43'),
(100, 35, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan fisik motorik dan sosial emosional masih perlu penguatan.', '2025-12-16 04:15:43'),
(101, 36, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan kognitif dan sosial emosional masih perlu penguatan.', '2025-12-16 04:15:43'),
(102, 30, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan kognitif dan seni masih perlu penguatan.', '2025-12-16 04:15:43'),
(103, 29, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan seni dan fisik motorik masih perlu penguatan.', '2025-12-16 04:15:43'),
(104, 27, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan seni dan fisik motorik masih perlu penguatan.', '2025-12-16 04:15:43'),
(105, 17, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan seni dan sosial emosional masih perlu penguatan.', '2025-12-16 04:15:43'),
(106, 35, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan fisik motorik dan sosial emosional masih perlu penguatan.', '2025-12-16 04:15:43'),
(107, 16, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan seni dan fisik motorik masih perlu penguatan.', '2025-12-16 04:15:43'),
(108, 27, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan seni dan fisik motorik masih perlu penguatan.', '2025-12-16 04:15:43'),
(109, 13, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan seni dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 04:15:43'),
(110, 30, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan kognitif dan seni masih perlu penguatan.', '2025-12-16 04:15:43'),
(111, 29, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan seni dan fisik motorik masih perlu penguatan.', '2025-12-16 04:15:43'),
(112, 14, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan seni dan sosial emosional masih perlu penguatan.', '2025-12-16 04:15:43'),
(113, 31, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan seni dan kognitif masih perlu penguatan.', '2025-12-16 04:15:43'),
(114, 33, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan seni dan fisik motorik masih perlu penguatan.', '2025-12-16 04:15:43'),
(115, 21, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 04:15:43'),
(116, 34, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan seni dan fisik motorik masih perlu penguatan.', '2025-12-16 04:15:43'),
(117, 19, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan sosial emosional dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 04:15:43'),
(118, 34, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan seni dan fisik motorik masih perlu penguatan.', '2025-12-16 04:15:43'),
(119, 31, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan seni dan kognitif masih perlu penguatan.', '2025-12-16 04:15:43'),
(120, 33, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan seni dan fisik motorik masih perlu penguatan.', '2025-12-16 04:15:43'),
(121, 18, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan sosial emosional dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 04:15:43'),
(122, 32, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan seni dan kognitif masih perlu penguatan.', '2025-12-16 04:15:43'),
(123, 26, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan sosial emosional dan bahasa masih perlu penguatan.', '2025-12-16 04:15:43'),
(124, 25, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan sosial emosional dan seni masih perlu penguatan.', '2025-12-16 04:15:43'),
(125, 24, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan sosial emosional dan seni masih perlu penguatan.', '2025-12-16 04:15:43'),
(126, 23, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan seni dan fisik motorik masih perlu penguatan.', '2025-12-16 04:15:43'),
(127, 22, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 04:15:43'),
(128, 20, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 04:15:43'),
(129, 32, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan seni dan kognitif masih perlu penguatan.', '2025-12-16 04:15:43'),
(130, 26, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan sosial emosional dan bahasa masih perlu penguatan.', '2025-12-16 04:15:43'),
(131, 12, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 05:40:47'),
(132, 13, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan seni dan sosial emosional masih perlu penguatan.', '2025-12-16 05:40:47'),
(134, 14, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan sosial emosional dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 05:40:47'),
(135, 12, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 05:43:55'),
(136, 13, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan seni dan sosial emosional masih perlu penguatan.', '2025-12-16 05:43:55'),
(138, 14, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan sosial emosional dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 05:43:55'),
(139, 12, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 05:44:08'),
(140, 13, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan seni dan sosial emosional masih perlu penguatan.', '2025-12-16 05:44:08'),
(141, 36, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan kognitif dan bahasa masih perlu penguatan.', '2025-12-16 05:44:08'),
(142, 17, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 05:44:08'),
(143, 16, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 05:44:08'),
(145, 18, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan bahasa dan sosial emosional masih perlu penguatan.', '2025-12-16 05:44:08'),
(146, 19, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan bahasa dan sosial emosional masih perlu penguatan.', '2025-12-16 05:44:08'),
(147, 14, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan sosial emosional dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 05:44:08'),
(148, 21, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan bahasa dan kognitif masih perlu penguatan.', '2025-12-16 05:44:08'),
(149, 26, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan bahasa dan sosial emosional masih perlu penguatan.', '2025-12-16 05:44:08'),
(150, 25, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan sosial emosional dan bahasa masih perlu penguatan.', '2025-12-16 05:44:08'),
(151, 24, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan sosial emosional dan bahasa masih perlu penguatan.', '2025-12-16 05:44:08'),
(152, 23, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 05:44:08'),
(153, 22, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 05:44:08'),
(154, 20, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan bahasa dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 05:44:08'),
(155, 12, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 05:44:30'),
(156, 13, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan seni dan sosial emosional masih perlu penguatan.', '2025-12-16 05:44:30'),
(157, 36, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan kognitif dan bahasa masih perlu penguatan.', '2025-12-16 05:44:30'),
(158, 17, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 05:44:30'),
(159, 16, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 05:44:30'),
(161, 18, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan bahasa dan sosial emosional masih perlu penguatan.', '2025-12-16 05:44:30'),
(162, 19, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan bahasa dan sosial emosional masih perlu penguatan.', '2025-12-16 05:44:30'),
(163, 14, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan sosial emosional dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 05:44:30'),
(164, 21, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan bahasa dan kognitif masih perlu penguatan.', '2025-12-16 05:44:30'),
(165, 26, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan bahasa dan sosial emosional masih perlu penguatan.', '2025-12-16 05:44:30'),
(166, 25, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan sosial emosional dan bahasa masih perlu penguatan.', '2025-12-16 05:44:30'),
(167, 24, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan sosial emosional dan bahasa masih perlu penguatan.', '2025-12-16 05:44:30'),
(168, 23, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 05:44:30'),
(169, 22, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 05:44:30'),
(170, 20, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan bahasa dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 05:44:30'),
(171, 12, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 06:00:42'),
(172, 42, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan fisik motorik dan sosial emosional masih perlu penguatan.', '2025-12-16 06:00:42'),
(173, 13, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan seni dan sosial emosional masih perlu penguatan.', '2025-12-16 06:00:42'),
(174, 40, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan fisik motorik dan sosial emosional masih perlu penguatan.', '2025-12-16 06:00:42'),
(175, 41, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan fisik motorik dan sosial emosional masih perlu penguatan.', '2025-12-16 06:00:42'),
(176, 38, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan fisik motorik dan sosial emosional masih perlu penguatan.', '2025-12-16 06:00:42'),
(177, 17, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 06:00:42'),
(178, 16, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 06:00:42'),
(180, 36, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan kognitif dan bahasa masih perlu penguatan.', '2025-12-16 06:00:42'),
(181, 37, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan sosial emosional dan bahasa masih perlu penguatan.', '2025-12-16 06:00:42'),
(182, 39, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan fisik motorik dan sosial emosional masih perlu penguatan.', '2025-12-16 06:00:42'),
(183, 21, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan bahasa dan kognitif masih perlu penguatan.', '2025-12-16 06:00:42'),
(184, 19, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan bahasa dan sosial emosional masih perlu penguatan.', '2025-12-16 06:00:42'),
(185, 18, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan bahasa dan sosial emosional masih perlu penguatan.', '2025-12-16 06:00:42'),
(186, 14, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan sosial emosional dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 06:00:42'),
(187, 26, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan bahasa dan sosial emosional masih perlu penguatan.', '2025-12-16 06:00:42'),
(188, 25, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan sosial emosional dan bahasa masih perlu penguatan.', '2025-12-16 06:00:42'),
(189, 24, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan sosial emosional dan bahasa masih perlu penguatan.', '2025-12-16 06:00:42'),
(190, 22, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 06:00:42'),
(191, 20, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan bahasa dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 06:00:42'),
(192, 23, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 06:00:42'),
(193, 12, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan seni dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 06:06:05'),
(194, 28, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 06:06:05'),
(195, 42, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan seni dan fisik motorik masih perlu penguatan.', '2025-12-16 06:06:05'),
(196, 13, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan seni dan sosial emosional masih perlu penguatan.', '2025-12-16 06:06:05'),
(198, 41, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan seni dan fisik motorik masih perlu penguatan.', '2025-12-16 06:06:05'),
(199, 40, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan seni dan fisik motorik masih perlu penguatan.', '2025-12-16 06:06:05'),
(200, 38, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan fisik motorik dan sosial emosional masih perlu penguatan.', '2025-12-16 06:06:05'),
(201, 36, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan kognitif dan bahasa masih perlu penguatan.', '2025-12-16 06:06:05'),
(202, 35, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 06:06:05'),
(203, 30, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan kognitif dan bahasa masih perlu penguatan.', '2025-12-16 06:06:05'),
(204, 29, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 06:06:05'),
(205, 27, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 06:06:05'),
(206, 16, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 06:06:05'),
(207, 17, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 06:06:05'),
(208, 39, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan fisik motorik dan sosial emosional masih perlu penguatan.', '2025-12-16 06:06:05'),
(209, 18, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 06:06:05'),
(210, 37, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan sosial emosional dan bahasa masih perlu penguatan.', '2025-12-16 06:06:05'),
(211, 19, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 06:06:05'),
(212, 34, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 06:06:05'),
(213, 33, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 06:06:05'),
(214, 31, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan seni dan kognitif masih perlu penguatan.', '2025-12-16 06:06:05'),
(215, 21, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 06:06:05'),
(216, 14, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan seni dan sosial emosional masih perlu penguatan.', '2025-12-16 06:06:05'),
(217, 32, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan seni dan kognitif masih perlu penguatan.', '2025-12-16 06:06:05'),
(218, 25, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan sosial emosional dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 06:06:05'),
(219, 26, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan bahasa dan sosial emosional masih perlu penguatan.', '2025-12-16 06:06:05'),
(220, 23, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 06:06:05'),
(221, 22, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan bahasa dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 06:06:05'),
(222, 20, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 06:06:05'),
(223, 24, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan sosial emosional dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 06:06:05'),
(224, 12, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan seni dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 06:06:53'),
(225, 28, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 06:06:53'),
(226, 42, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan seni dan fisik motorik masih perlu penguatan.', '2025-12-16 06:06:53'),
(227, 13, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan seni dan sosial emosional masih perlu penguatan.', '2025-12-16 06:06:53'),
(229, 41, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan seni dan fisik motorik masih perlu penguatan.', '2025-12-16 06:06:53'),
(230, 40, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan seni dan fisik motorik masih perlu penguatan.', '2025-12-16 06:06:53'),
(231, 38, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan fisik motorik dan sosial emosional masih perlu penguatan.', '2025-12-16 06:06:53'),
(232, 36, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan kognitif dan bahasa masih perlu penguatan.', '2025-12-16 06:06:53'),
(233, 35, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 06:06:53'),
(234, 30, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan kognitif dan bahasa masih perlu penguatan.', '2025-12-16 06:06:53'),
(235, 29, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 06:06:53'),
(236, 27, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 06:06:53'),
(237, 16, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 06:06:53'),
(238, 17, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 06:06:53'),
(239, 39, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan fisik motorik dan sosial emosional masih perlu penguatan.', '2025-12-16 06:06:53'),
(240, 18, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 06:06:53'),
(241, 37, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan sosial emosional dan bahasa masih perlu penguatan.', '2025-12-16 06:06:53'),
(242, 19, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 06:06:53'),
(243, 34, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 06:06:53'),
(244, 33, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 06:06:53'),
(245, 31, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan seni dan kognitif masih perlu penguatan.', '2025-12-16 06:06:53'),
(246, 21, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 06:06:53'),
(247, 14, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan seni dan sosial emosional masih perlu penguatan.', '2025-12-16 06:06:53'),
(248, 32, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan seni dan kognitif masih perlu penguatan.', '2025-12-16 06:06:53'),
(249, 25, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan sosial emosional dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 06:06:53'),
(250, 26, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan bahasa dan sosial emosional masih perlu penguatan.', '2025-12-16 06:06:53'),
(251, 23, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 06:06:53'),
(252, 22, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan bahasa dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 06:06:53'),
(253, 20, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 06:06:53'),
(254, 24, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan sosial emosional dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 06:06:53'),
(255, 12, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan seni dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 07:59:48'),
(256, 28, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 07:59:48'),
(257, 42, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan seni dan fisik motorik masih perlu penguatan.', '2025-12-16 07:59:48'),
(258, 13, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan seni dan sosial emosional masih perlu penguatan.', '2025-12-16 07:59:48'),
(260, 41, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan seni dan fisik motorik masih perlu penguatan.', '2025-12-16 07:59:48'),
(261, 40, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan seni dan fisik motorik masih perlu penguatan.', '2025-12-16 07:59:48'),
(262, 38, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan fisik motorik dan sosial emosional masih perlu penguatan.', '2025-12-16 07:59:48'),
(263, 36, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan kognitif dan bahasa masih perlu penguatan.', '2025-12-16 07:59:48'),
(264, 35, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 07:59:48'),
(265, 30, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan kognitif dan bahasa masih perlu penguatan.', '2025-12-16 07:59:48'),
(266, 29, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 07:59:48'),
(267, 27, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 07:59:48'),
(268, 16, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 07:59:48'),
(269, 17, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 07:59:48'),
(270, 39, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan fisik motorik dan sosial emosional masih perlu penguatan.', '2025-12-16 07:59:48'),
(271, 18, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 07:59:48'),
(272, 37, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan sosial emosional dan bahasa masih perlu penguatan.', '2025-12-16 07:59:48'),
(273, 19, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 07:59:48'),
(274, 34, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 07:59:48'),
(275, 33, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 07:59:48'),
(276, 31, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan seni dan kognitif masih perlu penguatan.', '2025-12-16 07:59:48'),
(277, 21, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 07:59:48'),
(278, 14, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan seni dan sosial emosional masih perlu penguatan.', '2025-12-16 07:59:48'),
(279, 32, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan seni dan kognitif masih perlu penguatan.', '2025-12-16 07:59:48'),
(280, 25, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan sosial emosional dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 07:59:48'),
(281, 26, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan bahasa dan sosial emosional masih perlu penguatan.', '2025-12-16 07:59:48'),
(282, 23, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 07:59:48'),
(283, 22, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan bahasa dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 07:59:48'),
(284, 20, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 07:59:48'),
(285, 24, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan sosial emosional dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 07:59:48'),
(286, 12, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan seni dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 08:50:03'),
(287, 28, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 08:50:03'),
(288, 29, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 08:50:03'),
(289, 30, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan kognitif dan bahasa masih perlu penguatan.', '2025-12-16 08:50:03'),
(290, 35, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 08:50:03'),
(291, 36, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan kognitif dan bahasa masih perlu penguatan.', '2025-12-16 08:50:03'),
(292, 38, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan fisik motorik dan sosial emosional masih perlu penguatan.', '2025-12-16 08:50:03'),
(293, 40, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan seni dan fisik motorik masih perlu penguatan.', '2025-12-16 08:50:03'),
(294, 41, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan seni dan fisik motorik masih perlu penguatan.', '2025-12-16 08:50:03'),
(295, 42, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan seni dan fisik motorik masih perlu penguatan.', '2025-12-16 08:50:03'),
(296, 27, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 08:50:03'),
(297, 43, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan seni dan fisik motorik masih perlu penguatan.', '2025-12-16 08:50:03'),
(298, 16, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 08:50:03'),
(299, 17, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 08:50:03'),
(300, 14, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan seni dan sosial emosional masih perlu penguatan.', '2025-12-16 08:50:03'),
(301, 39, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan fisik motorik dan sosial emosional masih perlu penguatan.', '2025-12-16 08:50:03'),
(302, 37, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan sosial emosional dan bahasa masih perlu penguatan.', '2025-12-16 08:50:03'),
(303, 18, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 08:50:03'),
(304, 19, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 08:50:03'),
(305, 34, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 08:50:03'),
(306, 33, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 08:50:03'),
(307, 32, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan seni dan kognitif masih perlu penguatan.', '2025-12-16 08:50:03'),
(308, 25, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan sosial emosional dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 08:50:03'),
(309, 26, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan bahasa dan sosial emosional masih perlu penguatan.', '2025-12-16 08:50:03'),
(310, 23, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 08:50:03'),
(311, 22, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan bahasa dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 08:50:03'),
(312, 21, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 08:50:03'),
(313, 20, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 08:50:03'),
(314, 31, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan seni dan kognitif masih perlu penguatan.', '2025-12-16 08:50:03'),
(315, 24, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan sosial emosional dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 08:50:03'),
(316, 13, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan fisik motorik dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 08:50:03'),
(317, 12, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan seni dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 08:50:11'),
(318, 28, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 08:50:11'),
(319, 29, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 08:50:11'),
(320, 30, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan kognitif dan bahasa masih perlu penguatan.', '2025-12-16 08:50:11'),
(321, 35, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 08:50:11'),
(322, 36, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan kognitif dan bahasa masih perlu penguatan.', '2025-12-16 08:50:11'),
(323, 38, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan fisik motorik dan sosial emosional masih perlu penguatan.', '2025-12-16 08:50:11'),
(324, 40, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan seni dan fisik motorik masih perlu penguatan.', '2025-12-16 08:50:11'),
(325, 41, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan seni dan fisik motorik masih perlu penguatan.', '2025-12-16 08:50:11'),
(326, 42, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan seni dan fisik motorik masih perlu penguatan.', '2025-12-16 08:50:11'),
(327, 27, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 08:50:11'),
(328, 43, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan seni dan fisik motorik masih perlu penguatan.', '2025-12-16 08:50:11'),
(329, 16, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 08:50:11'),
(330, 17, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 08:50:11'),
(331, 14, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan seni dan sosial emosional masih perlu penguatan.', '2025-12-16 08:50:11'),
(332, 39, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan fisik motorik dan sosial emosional masih perlu penguatan.', '2025-12-16 08:50:11'),
(333, 37, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan sosial emosional dan bahasa masih perlu penguatan.', '2025-12-16 08:50:11'),
(334, 18, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 08:50:11'),
(335, 19, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 08:50:11'),
(336, 34, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 08:50:11'),
(337, 33, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 08:50:11'),
(338, 32, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan seni dan kognitif masih perlu penguatan.', '2025-12-16 08:50:11'),
(339, 25, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan sosial emosional dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 08:50:11'),
(340, 26, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan bahasa dan sosial emosional masih perlu penguatan.', '2025-12-16 08:50:11'),
(341, 23, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 08:50:11'),
(342, 22, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan bahasa dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 08:50:11'),
(343, 21, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 08:50:11'),
(344, 20, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 08:50:11'),
(345, 31, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan seni dan kognitif masih perlu penguatan.', '2025-12-16 08:50:11'),
(346, 24, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan sosial emosional dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 08:50:11'),
(347, 13, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan fisik motorik dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 08:50:11'),
(348, 12, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan seni dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 08:50:45'),
(349, 42, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan seni dan fisik motorik masih perlu penguatan.', '2025-12-16 08:50:45'),
(350, 38, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan fisik motorik dan sosial emosional masih perlu penguatan.', '2025-12-16 08:50:45'),
(351, 29, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 08:50:45'),
(352, 28, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 08:50:45'),
(353, 27, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 08:50:45'),
(354, 43, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan seni dan fisik motorik masih perlu penguatan.', '2025-12-16 08:50:45'),
(355, 16, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 08:50:45'),
(356, 33, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 08:50:45'),
(357, 34, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 08:50:45'),
(358, 35, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 08:50:45'),
(359, 36, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan kognitif dan bahasa masih perlu penguatan.', '2025-12-16 08:50:45'),
(360, 37, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan sosial emosional dan bahasa masih perlu penguatan.', '2025-12-16 08:50:45'),
(361, 14, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan seni dan sosial emosional masih perlu penguatan.', '2025-12-16 08:50:45'),
(362, 39, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan fisik motorik dan sosial emosional masih perlu penguatan.', '2025-12-16 08:50:45'),
(363, 40, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan seni dan fisik motorik masih perlu penguatan.', '2025-12-16 08:50:45'),
(364, 41, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan seni dan fisik motorik masih perlu penguatan.', '2025-12-16 08:50:45'),
(365, 32, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan seni dan kognitif masih perlu penguatan.', '2025-12-16 08:50:45'),
(366, 31, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan seni dan kognitif masih perlu penguatan.', '2025-12-16 08:50:45'),
(367, 30, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan kognitif dan bahasa masih perlu penguatan.', '2025-12-16 08:50:45'),
(368, 20, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 08:50:45'),
(369, 21, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 08:50:45'),
(370, 19, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 08:50:45'),
(371, 26, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan bahasa dan sosial emosional masih perlu penguatan.', '2025-12-16 08:50:45'),
(372, 18, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 08:50:45'),
(373, 17, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 08:50:45'),
(374, 25, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan sosial emosional dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 08:50:45'),
(375, 24, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan sosial emosional dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 08:50:45'),
(376, 22, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan bahasa dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 08:50:45'),
(377, 23, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 08:50:45'),
(378, 13, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan fisik motorik dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 08:50:45'),
(379, 12, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan seni dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 08:53:23'),
(380, 42, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan seni dan fisik motorik masih perlu penguatan.', '2025-12-16 08:53:23'),
(381, 28, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 08:53:23'),
(382, 43, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan seni dan fisik motorik masih perlu penguatan.', '2025-12-16 08:53:23'),
(383, 29, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 08:53:23'),
(384, 30, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan kognitif dan bahasa masih perlu penguatan.', '2025-12-16 08:53:23'),
(385, 35, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 08:53:23'),
(386, 36, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan kognitif dan bahasa masih perlu penguatan.', '2025-12-16 08:53:23'),
(387, 38, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan fisik motorik dan sosial emosional masih perlu penguatan.', '2025-12-16 08:53:23'),
(388, 40, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan seni dan fisik motorik masih perlu penguatan.', '2025-12-16 08:53:23'),
(389, 41, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan seni dan fisik motorik masih perlu penguatan.', '2025-12-16 08:53:23'),
(390, 13, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan seni dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 08:53:23'),
(391, 27, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 08:53:23'),
(392, 16, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 08:53:23'),
(393, 17, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 08:53:23'),
(394, 21, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 08:53:23'),
(395, 34, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 08:53:23'),
(396, 33, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 08:53:23'),
(397, 39, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan fisik motorik dan sosial emosional masih perlu penguatan.', '2025-12-16 08:53:23'),
(398, 31, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan seni dan kognitif masih perlu penguatan.', '2025-12-16 08:53:23'),
(399, 19, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 08:53:23'),
(400, 18, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 08:53:23'),
(401, 14, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan seni dan sosial emosional masih perlu penguatan.', '2025-12-16 08:53:23'),
(402, 37, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan sosial emosional dan bahasa masih perlu penguatan.', '2025-12-16 08:53:23'),
(403, 20, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 08:53:23'),
(404, 22, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan bahasa dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 08:53:23'),
(405, 32, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan seni dan kognitif masih perlu penguatan.', '2025-12-16 08:53:23'),
(406, 23, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 08:53:23'),
(407, 24, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan sosial emosional dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 08:53:23'),
(408, 25, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan sosial emosional dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 08:53:23'),
(409, 26, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan bahasa dan sosial emosional masih perlu penguatan.', '2025-12-16 08:53:23'),
(410, 12, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan seni dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 22:25:43'),
(411, 42, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan fisik motorik dan sosial emosional masih perlu penguatan.', '2025-12-16 22:25:43'),
(412, 28, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 22:25:43'),
(413, 43, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan fisik motorik dan sosial emosional masih perlu penguatan.', '2025-12-16 22:25:43'),
(414, 29, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 22:25:43'),
(415, 30, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan kognitif dan bahasa masih perlu penguatan.', '2025-12-16 22:25:43'),
(416, 35, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan bahasa dan sosial emosional masih perlu penguatan.', '2025-12-16 22:25:43'),
(417, 36, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan kognitif dan bahasa masih perlu penguatan.', '2025-12-16 22:25:43'),
(418, 38, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan fisik motorik dan sosial emosional masih perlu penguatan.', '2025-12-16 22:25:43'),
(419, 40, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan fisik motorik dan sosial emosional masih perlu penguatan.', '2025-12-16 22:25:43'),
(420, 41, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan fisik motorik dan sosial emosional masih perlu penguatan.', '2025-12-16 22:25:43'),
(421, 13, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 22:25:43'),
(422, 27, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 22:25:43'),
(423, 16, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 22:25:43'),
(424, 17, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 22:25:43'),
(425, 21, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan bahasa dan kognitif masih perlu penguatan.', '2025-12-16 22:25:43'),
(426, 34, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 22:25:43'),
(427, 33, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 22:25:43'),
(428, 39, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan fisik motorik dan sosial emosional masih perlu penguatan.', '2025-12-16 22:25:43'),
(429, 31, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan seni dan kognitif masih perlu penguatan.', '2025-12-16 22:25:43'),
(430, 19, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan bahasa dan sosial emosional masih perlu penguatan.', '2025-12-16 22:25:43'),
(431, 18, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan bahasa dan sosial emosional masih perlu penguatan.', '2025-12-16 22:25:43'),
(432, 14, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan sosial emosional dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 22:25:43'),
(433, 37, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan sosial emosional dan bahasa masih perlu penguatan.', '2025-12-16 22:25:43'),
(434, 20, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 22:25:43'),
(435, 22, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan bahasa dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 22:25:43'),
(436, 32, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan seni dan kognitif masih perlu penguatan.', '2025-12-16 22:25:43'),
(437, 23, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 22:25:43'),
(438, 24, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan sosial emosional dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 22:25:43'),
(439, 25, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan sosial emosional dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 22:25:43'),
(440, 26, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan bahasa dan sosial emosional masih perlu penguatan.', '2025-12-16 22:25:43'),
(441, 12, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan seni dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 22:48:19'),
(442, 42, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan seni dan fisik motorik masih perlu penguatan.', '2025-12-16 22:48:19'),
(443, 28, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 22:48:19'),
(444, 43, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan seni dan fisik motorik masih perlu penguatan.', '2025-12-16 22:48:19'),
(445, 29, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 22:48:19'),
(446, 30, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan kognitif dan bahasa masih perlu penguatan.', '2025-12-16 22:48:19'),
(447, 35, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 22:48:19'),
(448, 36, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan kognitif dan bahasa masih perlu penguatan.', '2025-12-16 22:48:19'),
(449, 38, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan fisik motorik dan sosial emosional masih perlu penguatan.', '2025-12-16 22:48:19'),
(450, 40, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan seni dan fisik motorik masih perlu penguatan.', '2025-12-16 22:48:19'),
(451, 41, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan seni dan fisik motorik masih perlu penguatan.', '2025-12-16 22:48:19'),
(452, 13, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan seni dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 22:48:19'),
(453, 27, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 22:48:19'),
(454, 16, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 22:48:19'),
(455, 17, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 22:48:19'),
(456, 21, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 22:48:19'),
(457, 34, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 22:48:19'),
(458, 33, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 22:48:19'),
(459, 39, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan fisik motorik dan sosial emosional masih perlu penguatan.', '2025-12-16 22:48:19'),
(460, 31, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan seni dan kognitif masih perlu penguatan.', '2025-12-16 22:48:19'),
(461, 19, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 22:48:19'),
(462, 18, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 22:48:19');
INSERT INTO `rekomendasi_klaster` (`id`, `id_anak`, `rekomendasi`, `dibuat_pada`) VALUES
(463, 14, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan seni dan sosial emosional masih perlu penguatan.', '2025-12-16 22:48:19'),
(464, 37, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan sosial emosional dan bahasa masih perlu penguatan.', '2025-12-16 22:48:19'),
(465, 20, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 22:48:19'),
(466, 22, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan bahasa dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 22:48:19'),
(467, 32, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan seni dan kognitif masih perlu penguatan.', '2025-12-16 22:48:19'),
(468, 23, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 22:48:19'),
(469, 24, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan sosial emosional dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 22:48:19'),
(470, 25, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan sosial emosional dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 22:48:20'),
(471, 26, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan bahasa dan sosial emosional masih perlu penguatan.', '2025-12-16 22:48:20'),
(472, 12, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan seni dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 23:47:35'),
(473, 42, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan seni dan fisik motorik masih perlu penguatan.', '2025-12-16 23:47:35'),
(474, 28, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 23:47:35'),
(475, 43, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan seni dan fisik motorik masih perlu penguatan.', '2025-12-16 23:47:35'),
(476, 29, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 23:47:35'),
(477, 30, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan kognitif dan bahasa masih perlu penguatan.', '2025-12-16 23:47:35'),
(478, 35, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 23:47:35'),
(479, 36, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan kognitif dan bahasa masih perlu penguatan.', '2025-12-16 23:47:35'),
(480, 38, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan fisik motorik dan sosial emosional masih perlu penguatan.', '2025-12-16 23:47:35'),
(481, 40, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan seni dan fisik motorik masih perlu penguatan.', '2025-12-16 23:47:35'),
(482, 41, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan seni dan fisik motorik masih perlu penguatan.', '2025-12-16 23:47:35'),
(483, 13, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan seni dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 23:47:35'),
(484, 27, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-16 23:47:35'),
(485, 16, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 23:47:35'),
(486, 17, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 23:47:35'),
(487, 21, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 23:47:35'),
(488, 34, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan fisik motorik dan bahasa masih perlu penguatan.', '2025-12-16 23:47:35'),
(489, 33, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan fisik motorik dan bahasa masih perlu penguatan.', '2025-12-16 23:47:35'),
(490, 39, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan fisik motorik dan sosial emosional masih perlu penguatan.', '2025-12-16 23:47:35'),
(491, 31, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan seni dan kognitif masih perlu penguatan.', '2025-12-16 23:47:35'),
(492, 19, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 23:47:35'),
(493, 18, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 23:47:35'),
(494, 14, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan seni dan sosial emosional masih perlu penguatan.', '2025-12-16 23:47:35'),
(495, 37, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan kognitif dan sosial emosional masih perlu penguatan.', '2025-12-16 23:47:35'),
(496, 20, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-16 23:47:35'),
(497, 22, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan bahasa dan fisik motorik masih perlu penguatan.', '2025-12-16 23:47:35'),
(498, 32, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan seni dan kognitif masih perlu penguatan.', '2025-12-16 23:47:35'),
(499, 23, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan fisik motorik dan nilai agama dan moral masih perlu penguatan.', '2025-12-16 23:47:35'),
(500, 24, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan sosial emosional dan fisik motorik masih perlu penguatan.', '2025-12-16 23:47:35'),
(501, 25, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan sosial emosional dan fisik motorik masih perlu penguatan.', '2025-12-16 23:47:35'),
(502, 26, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan bahasa dan sosial emosional masih perlu penguatan.', '2025-12-16 23:47:35'),
(503, 12, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-19 03:37:41'),
(504, 42, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan fisik motorik dan sosial emosional masih perlu penguatan.', '2025-12-19 03:37:41'),
(505, 28, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-19 03:37:41'),
(506, 43, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan fisik motorik dan sosial emosional masih perlu penguatan.', '2025-12-19 03:37:41'),
(507, 29, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-19 03:37:41'),
(508, 30, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan kognitif dan bahasa masih perlu penguatan.', '2025-12-19 03:37:41'),
(509, 35, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan bahasa dan sosial emosional masih perlu penguatan.', '2025-12-19 03:37:41'),
(510, 36, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan kognitif dan bahasa masih perlu penguatan.', '2025-12-19 03:37:41'),
(511, 38, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan fisik motorik dan sosial emosional masih perlu penguatan.', '2025-12-19 03:37:41'),
(512, 40, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan fisik motorik dan sosial emosional masih perlu penguatan.', '2025-12-19 03:37:41'),
(513, 41, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan fisik motorik dan sosial emosional masih perlu penguatan.', '2025-12-19 03:37:41'),
(514, 13, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-19 03:37:41'),
(515, 27, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-19 03:37:41'),
(516, 16, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-19 03:37:41'),
(517, 17, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-19 03:37:41'),
(518, 21, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan bahasa dan kognitif masih perlu penguatan.', '2025-12-19 03:37:41'),
(519, 34, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-19 03:37:41'),
(520, 33, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-19 03:37:41'),
(521, 39, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan fisik motorik dan sosial emosional masih perlu penguatan.', '2025-12-19 03:37:41'),
(522, 31, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan seni dan kognitif masih perlu penguatan.', '2025-12-19 03:37:41'),
(523, 19, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan bahasa dan sosial emosional masih perlu penguatan.', '2025-12-19 03:37:41'),
(524, 18, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan bahasa dan sosial emosional masih perlu penguatan.', '2025-12-19 03:37:41'),
(525, 14, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan sosial emosional dan nilai agama dan moral masih perlu penguatan.', '2025-12-19 03:37:41'),
(526, 37, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan sosial emosional dan bahasa masih perlu penguatan.', '2025-12-19 03:37:41'),
(527, 20, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan bahasa dan nilai agama dan moral masih perlu penguatan.', '2025-12-19 03:37:41'),
(528, 22, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-19 03:37:41'),
(529, 32, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan seni dan kognitif masih perlu penguatan.', '2025-12-19 03:37:41'),
(530, 23, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-19 03:37:41'),
(531, 24, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan sosial emosional dan bahasa masih perlu penguatan.', '2025-12-19 03:37:41'),
(532, 25, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan sosial emosional dan bahasa masih perlu penguatan.', '2025-12-19 03:37:41'),
(533, 26, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan bahasa dan sosial emosional masih perlu penguatan.', '2025-12-19 03:37:41'),
(534, 12, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-20 06:23:59'),
(535, 12, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-20 06:23:59'),
(536, 42, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan seni dan fisik motorik masih perlu penguatan.', '2025-12-20 06:23:59'),
(537, 42, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan seni dan fisik motorik masih perlu penguatan.', '2025-12-20 06:23:59'),
(538, 28, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan bahasa dan sosial emosional masih perlu penguatan.', '2025-12-20 06:23:59'),
(539, 28, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-20 06:23:59'),
(540, 43, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan seni dan fisik motorik masih perlu penguatan.', '2025-12-20 06:23:59'),
(541, 43, 'Ananda masuk klaster 1 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-20 06:23:59'),
(542, 29, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-20 06:23:59'),
(543, 29, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-20 06:23:59'),
(544, 30, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan kognitif dan bahasa masih perlu penguatan.', '2025-12-20 06:23:59'),
(545, 30, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan kognitif dan bahasa masih perlu penguatan.', '2025-12-20 06:23:59'),
(546, 35, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-20 06:23:59'),
(547, 35, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-20 06:23:59'),
(548, 36, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan kognitif dan sosial emosional masih perlu penguatan.', '2025-12-20 06:23:59'),
(549, 36, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan kognitif dan bahasa masih perlu penguatan.', '2025-12-20 06:23:59'),
(550, 38, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan kognitif dan fisik motorik masih perlu penguatan.', '2025-12-20 06:23:59'),
(551, 38, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan fisik motorik dan sosial emosional masih perlu penguatan.', '2025-12-20 06:23:59'),
(552, 40, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan fisik motorik dan sosial emosional masih perlu penguatan.', '2025-12-20 06:23:59'),
(553, 40, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan fisik motorik dan sosial emosional masih perlu penguatan.', '2025-12-20 06:23:59'),
(554, 41, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan fisik motorik dan sosial emosional masih perlu penguatan.', '2025-12-20 06:23:59'),
(555, 41, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan fisik motorik dan sosial emosional masih perlu penguatan.', '2025-12-20 06:23:59'),
(556, 13, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-20 06:23:59'),
(557, 13, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-20 06:23:59'),
(558, 27, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-20 06:23:59'),
(559, 27, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-20 06:23:59'),
(560, 16, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-20 06:23:59'),
(561, 16, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-20 06:23:59'),
(562, 17, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-20 06:23:59'),
(563, 17, 'Ananda masuk klaster 2 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-20 06:23:59'),
(564, 21, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan bahasa dan kognitif masih perlu penguatan.', '2025-12-20 06:23:59'),
(565, 21, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan bahasa dan kognitif masih perlu penguatan.', '2025-12-20 06:23:59'),
(566, 34, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-20 06:23:59'),
(567, 34, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-20 06:23:59'),
(568, 33, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-20 06:23:59'),
(569, 33, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan bahasa dan seni masih perlu penguatan.', '2025-12-20 06:23:59'),
(570, 39, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan fisik motorik dan sosial emosional masih perlu penguatan.', '2025-12-20 06:23:59'),
(571, 39, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan fisik motorik dan sosial emosional masih perlu penguatan.', '2025-12-20 06:23:59'),
(572, 31, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan seni dan kognitif masih perlu penguatan.', '2025-12-20 06:23:59'),
(573, 31, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan seni dan kognitif masih perlu penguatan.', '2025-12-20 06:23:59'),
(574, 19, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan bahasa dan sosial emosional masih perlu penguatan.', '2025-12-20 06:23:59'),
(575, 19, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan bahasa dan sosial emosional masih perlu penguatan.', '2025-12-20 06:23:59'),
(576, 18, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan bahasa dan sosial emosional masih perlu penguatan.', '2025-12-20 06:23:59'),
(577, 14, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan sosial emosional dan nilai agama dan moral masih perlu penguatan.', '2025-12-20 06:23:59'),
(578, 18, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-20 06:23:59'),
(579, 37, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan kognitif dan sosial emosional masih perlu penguatan.', '2025-12-20 06:23:59'),
(580, 14, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan seni dan sosial emosional masih perlu penguatan.', '2025-12-20 06:23:59'),
(581, 20, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-20 06:23:59'),
(582, 37, 'Ananda masuk klaster 3 dikarenakan nilai perkembangan kognitif dan sosial emosional masih perlu penguatan.', '2025-12-20 06:23:59'),
(583, 22, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan bahasa dan fisik motorik masih perlu penguatan.', '2025-12-20 06:23:59'),
(584, 20, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan nilai agama dan moral dan bahasa masih perlu penguatan.', '2025-12-20 06:23:59'),
(585, 32, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan seni dan kognitif masih perlu penguatan.', '2025-12-20 06:23:59'),
(586, 22, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan bahasa dan fisik motorik masih perlu penguatan.', '2025-12-20 06:23:59'),
(587, 23, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan fisik motorik dan nilai agama dan moral masih perlu penguatan.', '2025-12-20 06:23:59'),
(588, 32, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan seni dan kognitif masih perlu penguatan.', '2025-12-20 06:23:59'),
(589, 24, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan sosial emosional dan fisik motorik masih perlu penguatan.', '2025-12-20 06:23:59'),
(590, 23, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan fisik motorik dan nilai agama dan moral masih perlu penguatan.', '2025-12-20 06:23:59'),
(591, 25, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan sosial emosional dan fisik motorik masih perlu penguatan.', '2025-12-20 06:23:59'),
(592, 24, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan sosial emosional dan fisik motorik masih perlu penguatan.', '2025-12-20 06:23:59'),
(593, 26, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan bahasa dan sosial emosional masih perlu penguatan.', '2025-12-20 06:23:59'),
(594, 25, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan sosial emosional dan fisik motorik masih perlu penguatan.', '2025-12-20 06:23:59'),
(595, 26, 'Ananda masuk klaster 4 dikarenakan nilai perkembangan bahasa dan sosial emosional masih perlu penguatan.', '2025-12-20 06:23:59');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `anak`
--
ALTER TABLE `anak`
  ADD PRIMARY KEY (`id_anak`);

--
-- Indeks untuk tabel `aspek_perkembangan`
--
ALTER TABLE `aspek_perkembangan`
  ADD PRIMARY KEY (`id_aspek`);

--
-- Indeks untuk tabel `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`id_guru`);

--
-- Indeks untuk tabel `kmeans_hasil`
--
ALTER TABLE `kmeans_hasil`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_anak` (`id_anak`);

--
-- Indeks untuk tabel `nilai_perkembangan`
--
ALTER TABLE `nilai_perkembangan`
  ADD PRIMARY KEY (`id_nilai`),
  ADD KEY `id_anak` (`id_anak`),
  ADD KEY `id_aspek` (`id_aspek`),
  ADD KEY `id_guru` (`id_guru`);

--
-- Indeks untuk tabel `rekomendasi_aspek`
--
ALTER TABLE `rekomendasi_aspek`
  ADD PRIMARY KEY (`id_rek_aspek`),
  ADD KEY `id_aspek` (`id_aspek`);

--
-- Indeks untuk tabel `rekomendasi_klaster`
--
ALTER TABLE `rekomendasi_klaster`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_anak` (`id_anak`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `anak`
--
ALTER TABLE `anak`
  MODIFY `id_anak` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT untuk tabel `aspek_perkembangan`
--
ALTER TABLE `aspek_perkembangan`
  MODIFY `id_aspek` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `guru`
--
ALTER TABLE `guru`
  MODIFY `id_guru` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `kmeans_hasil`
--
ALTER TABLE `kmeans_hasil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT untuk tabel `nilai_perkembangan`
--
ALTER TABLE `nilai_perkembangan`
  MODIFY `id_nilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=291;

--
-- AUTO_INCREMENT untuk tabel `rekomendasi_aspek`
--
ALTER TABLE `rekomendasi_aspek`
  MODIFY `id_rek_aspek` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `rekomendasi_klaster`
--
ALTER TABLE `rekomendasi_klaster`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=596;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `kmeans_hasil`
--
ALTER TABLE `kmeans_hasil`
  ADD CONSTRAINT `kmeans_hasil_ibfk_1` FOREIGN KEY (`id_anak`) REFERENCES `anak` (`id_anak`);

--
-- Ketidakleluasaan untuk tabel `nilai_perkembangan`
--
ALTER TABLE `nilai_perkembangan`
  ADD CONSTRAINT `nilai_perkembangan_ibfk_1` FOREIGN KEY (`id_anak`) REFERENCES `anak` (`id_anak`),
  ADD CONSTRAINT `nilai_perkembangan_ibfk_2` FOREIGN KEY (`id_aspek`) REFERENCES `aspek_perkembangan` (`id_aspek`),
  ADD CONSTRAINT `nilai_perkembangan_ibfk_3` FOREIGN KEY (`id_guru`) REFERENCES `guru` (`id_guru`);

--
-- Ketidakleluasaan untuk tabel `rekomendasi_aspek`
--
ALTER TABLE `rekomendasi_aspek`
  ADD CONSTRAINT `rekomendasi_aspek_ibfk_1` FOREIGN KEY (`id_aspek`) REFERENCES `aspek_perkembangan` (`id_aspek`);

--
-- Ketidakleluasaan untuk tabel `rekomendasi_klaster`
--
ALTER TABLE `rekomendasi_klaster`
  ADD CONSTRAINT `rekomendasi_klaster_ibfk_1` FOREIGN KEY (`id_anak`) REFERENCES `anak` (`id_anak`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
