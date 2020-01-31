-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 31 Jan 2020 pada 06.55
-- Versi server: 10.4.8-MariaDB
-- Versi PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_sekolahabsen`
--
CREATE DATABASE IF NOT EXISTS `db_sekolahabsen` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_sekolahabsen`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `data`
--

CREATE TABLE `data` (
  `id` int(12) NOT NULL,
  `myname` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `data`
--

INSERT INTO `data` (`id`, `myname`) VALUES
(1, 'Panca,  31'),
(2, 'Panca,  31'),
(3, 'Panca,  31'),
(4, 'Panca,  31'),
(5, 'Panca,  31');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_11_27_080335_create_posts_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `posts`
--

INSERT INTO `posts` (`id`, `title`, `updated_at`, `created_at`) VALUES
(3, 'Imelda', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'hjhjsajh', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'PANCA ADNAN', '2019-11-27 10:54:35', '2019-11-27 10:54:35');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_absensi_pelajaran`
--

CREATE TABLE `tb_absensi_pelajaran` (
  `id` int(12) NOT NULL,
  `id_kartu` varchar(14) NOT NULL,
  `id_pelajaran` int(12) NOT NULL,
  `tanggal` date NOT NULL,
  `w_in` time NOT NULL,
  `w_out` time NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_absensi_pelajaran`
--

INSERT INTO `tb_absensi_pelajaran` (`id`, `id_kartu`, `id_pelajaran`, `tanggal`, `w_in`, `w_out`, `updated_at`, `created_at`) VALUES
(12, '505683015', 3, '2019-12-02', '12:59:39', '18:16:35', '2019-12-02 12:59:39', '2019-12-02 12:59:39'),
(14, '08486333331', 4, '2019-12-02', '13:43:24', '14:33:43', '2019-12-02 13:43:24', '2019-12-02 13:43:24'),
(15, '08486333331', 6, '2019-12-02', '16:52:33', '16:52:36', '2019-12-02 16:52:33', '2019-12-02 16:52:33'),
(16, '505683015', 6, '2019-12-02', '16:55:12', '18:16:35', '2019-12-02 16:55:13', '2019-12-02 16:55:13'),
(18, '505683015', 6, '2019-12-04', '18:16:27', '18:16:35', '2019-12-04 18:16:27', '2019-12-04 18:16:27'),
(22, '4866454', 3, '2020-01-02', '11:04:41', '00:00:00', '2020-01-02 11:04:41', '2020-01-02 11:04:41'),
(23, '505683015', 3, '2020-01-02', '11:06:42', '12:00:00', '2020-01-02 11:06:42', '2020-01-02 11:06:42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_absensi_sekolah`
--

CREATE TABLE `tb_absensi_sekolah` (
  `id` int(12) NOT NULL,
  `id_kartu` varchar(14) NOT NULL,
  `datang` time NOT NULL,
  `pulang` time NOT NULL,
  `tanggal` date NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_absensi_sekolah`
--

INSERT INTO `tb_absensi_sekolah` (`id`, `id_kartu`, `datang`, `pulang`, `tanggal`, `updated_at`, `created_at`) VALUES
(1, '2474601362', '16:33:03', '16:33:05', '2019-11-26', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, '08486333337', '10:47:09', '12:18:44', '2019-12-02', '2019-12-02 10:47:09', '2019-12-02 10:47:09'),
(4, '505683015', '10:51:12', '10:58:35', '2019-12-02', '2019-12-02 10:51:12', '2019-12-02 10:51:12'),
(6, '21323123123123', '11:08:42', '18:57:30', '2019-12-02', '2019-12-02 11:08:42', '2019-12-02 11:08:42'),
(7, '2474601362', '16:50:05', '16:51:54', '2019-12-02', '2019-12-02 16:50:05', '2019-12-02 16:50:05'),
(8, '21323123123123', '14:20:53', '15:56:19', '2019-12-03', '2019-12-03 14:20:54', '2019-12-03 14:20:54'),
(9, '08486333337', '15:56:10', '15:56:14', '2019-12-03', '2019-12-03 15:56:11', '2019-12-03 15:56:11'),
(10, '21323123123123', '10:46:06', '16:44:35', '2019-12-04', '2019-12-04 10:46:06', '2019-12-04 10:46:06'),
(11, '21323123123123', '16:29:10', '00:00:00', '2019-12-18', '2019-12-18 16:29:10', '2019-12-18 16:29:10'),
(12, '21323123123123', '10:15:17', '00:00:00', '2019-12-23', '2019-12-23 10:15:19', '2019-12-23 10:15:19'),
(13, '21323123123123', '10:52:36', '11:01:44', '2020-01-02', '2020-01-02 10:52:36', '2020-01-02 10:52:36'),
(14, '08486333337', '11:04:50', '00:00:00', '2020-01-02', '2020-01-02 11:04:50', '2020-01-02 11:04:50'),
(15, '21323123123123', '17:43:26', '17:51:48', '2020-01-08', '2020-01-08 17:43:26', '2020-01-08 17:43:26'),
(16, '21323123123123', '12:45:24', '00:00:00', '2020-01-10', '2020-01-10 12:45:27', '2020-01-10 12:45:27'),
(17, '21323123123123', '13:02:30', '13:02:31', '2020-01-15', '2020-01-15 13:02:30', '2020-01-15 13:02:30');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_absensi_solat`
--

CREATE TABLE `tb_absensi_solat` (
  `id` int(12) NOT NULL,
  `id_kartu` varchar(14) NOT NULL,
  `id_solat` int(12) NOT NULL,
  `tanggal` date NOT NULL,
  `w_in` time NOT NULL,
  `w_out` time NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_absensi_solat`
--

INSERT INTO `tb_absensi_solat` (`id`, `id_kartu`, `id_solat`, `tanggal`, `w_in`, `w_out`, `updated_at`, `created_at`) VALUES
(87435, '3236623792', 2, '2020-01-28', '14:09:44', '14:10:31', '2020-01-28 14:09:46', '2020-01-28 14:09:46'),
(87436, '2474601362', 2, '2020-01-28', '14:11:37', '14:12:10', '2020-01-28 14:11:38', '2020-01-28 14:11:38'),
(87437, '1900149287', 2, '2020-01-28', '14:13:22', '14:13:55', '2020-01-28 14:13:23', '2020-01-28 14:13:23'),
(87438, '2474601362', 3, '2020-01-28', '16:16:47', '17:05:17', '2020-01-28 16:16:48', '2020-01-28 16:16:48'),
(87439, '3236623792', 3, '2020-01-28', '16:33:57', '17:21:32', '2020-01-28 16:33:58', '2020-01-28 16:33:58'),
(87443, '4866454', 3, '2020-01-28', '17:19:13', '17:21:33', '2020-01-28 17:19:13', '2020-01-28 17:19:13'),
(88689, '2474601362', 3, '2020-01-30', '17:00:09', '17:08:56', '2020-01-30 17:00:10', '2020-01-30 17:00:10'),
(88692, '4866454', 3, '2020-01-30', '17:05:28', '17:24:27', '2020-01-30 17:05:28', '2020-01-30 17:05:28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jadwal`
--

CREATE TABLE `tb_jadwal` (
  `id_jadwal` int(12) NOT NULL,
  `nama_jadwal` varchar(15) NOT NULL,
  `id_katagori` int(12) NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_jadwal`
--

INSERT INTO `tb_jadwal` (`id_jadwal`, `nama_jadwal`, `id_katagori`, `jam_mulai`, `jam_selesai`) VALUES
(1, 'Ipa', 12, '12:00:00', '14:00:00'),
(2, 'IpS', 12, '15:00:00', '17:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_katagori_jadwal`
--

CREATE TABLE `tb_katagori_jadwal` (
  `id_katagori` int(12) NOT NULL,
  `nama_katagori` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_katagori_jadwal`
--

INSERT INTO `tb_katagori_jadwal` (`id_katagori`, `nama_katagori`) VALUES
(12, 'Kelas1'),
(13, 'tk');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pelajaran`
--

CREATE TABLE `tb_pelajaran` (
  `id` int(12) NOT NULL,
  `Pelajaran` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_pelajaran`
--

INSERT INTO `tb_pelajaran` (`id`, `Pelajaran`) VALUES
(1, 'pelajaran 1'),
(2, 'pelajaran 2'),
(3, 'pelajaran 3'),
(4, 'pelajaran 4'),
(5, 'pelajaran 5'),
(6, 'pelajaran 6');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_reader`
--

CREATE TABLE `tb_reader` (
  `No_Reader` int(12) NOT NULL,
  `Ip_Addres` varchar(40) NOT NULL,
  `Lokasi_Reader` varchar(120) NOT NULL,
  `id_jadwal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_reader`
--

INSERT INTO `tb_reader` (`No_Reader`, `Ip_Addres`, `Lokasi_Reader`, `id_jadwal`) VALUES
(1, '192.168.1.201', 'Kelas', 12),
(2, '192.168.1.210', 'TK', 13),
(3, '192.168.1.202', 'Masjid', 12);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_siswa`
--

CREATE TABLE `tb_siswa` (
  `id_kartu` varchar(14) NOT NULL,
  `Nama` varchar(12) NOT NULL,
  `updated_at` datetime DEFAULT current_timestamp(),
  `created_at` datetime DEFAULT current_timestamp(),
  `katagori` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_siswa`
--

INSERT INTO `tb_siswa` (`id_kartu`, `Nama`, `updated_at`, `created_at`, `katagori`) VALUES
('08486333331', 'Khellthuzard', '2019-11-28 07:23:28', '2019-11-28 07:23:28', 'Siswa'),
('08486333337', 'Miracle', '2019-11-28 06:40:22', '2019-11-28 06:40:22', 'Pegawai Umum'),
('1900149287', 'mira', '2020-01-28 13:47:25', '2020-01-28 13:47:25', 'Siswa'),
('21323123123123', 'Izrael', '2019-11-28 06:44:09', '2019-11-28 06:44:09', 'Admin'),
('2474601362', 'PANCA ADNAN', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Pegawai Umum'),
('3236623792', 'Panca', '2019-11-28 08:58:31', '2019-11-28 08:58:31', 'Siswa'),
('43434565643', 'jfyjjhhjhhf', '2020-01-02 10:42:02', '2020-01-02 10:42:02', 'Siswa'),
('4866454', 'Panc', '2020-01-02 10:44:41', '2020-01-02 10:44:41', 'Siswa'),
('505683015', 'Imelda', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Guru'),
('6r688679669', 'Panca A A', '2020-01-02 10:43:07', '2020-01-02 10:43:07', 'Pegawai Umum');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_solat`
--

CREATE TABLE `tb_solat` (
  `id_solat` int(12) NOT NULL,
  `solat` varchar(14) NOT NULL,
  `in` time NOT NULL,
  `out` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_solat`
--

INSERT INTO `tb_solat` (`id_solat`, `solat`, `in`, `out`) VALUES
(1, 'SUBUH', '04:00:00', '06:00:00'),
(2, 'DUHUR', '11:30:00', '14:59:00'),
(3, 'ASHAR', '15:00:59', '17:59:59'),
(4, 'MAGRIB', '18:00:00', '18:59:00'),
(5, 'ISYAK', '19:00:00', '23:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `data`
--
ALTER TABLE `data`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_absensi_pelajaran`
--
ALTER TABLE `tb_absensi_pelajaran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pelajaran` (`id_pelajaran`),
  ADD KEY `id_kartupelajaran` (`id_kartu`);

--
-- Indeks untuk tabel `tb_absensi_sekolah`
--
ALTER TABLE `tb_absensi_sekolah`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kartu` (`id_kartu`);

--
-- Indeks untuk tabel `tb_absensi_solat`
--
ALTER TABLE `tb_absensi_solat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_solat` (`id_solat`),
  ADD KEY `id_kartu` (`id_kartu`);

--
-- Indeks untuk tabel `tb_jadwal`
--
ALTER TABLE `tb_jadwal`
  ADD PRIMARY KEY (`id_jadwal`),
  ADD KEY `fk_katagori` (`id_katagori`);

--
-- Indeks untuk tabel `tb_katagori_jadwal`
--
ALTER TABLE `tb_katagori_jadwal`
  ADD PRIMARY KEY (`id_katagori`);

--
-- Indeks untuk tabel `tb_pelajaran`
--
ALTER TABLE `tb_pelajaran`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_reader`
--
ALTER TABLE `tb_reader`
  ADD PRIMARY KEY (`No_Reader`),
  ADD KEY `fk_jadwal` (`id_jadwal`);

--
-- Indeks untuk tabel `tb_siswa`
--
ALTER TABLE `tb_siswa`
  ADD PRIMARY KEY (`id_kartu`);

--
-- Indeks untuk tabel `tb_solat`
--
ALTER TABLE `tb_solat`
  ADD PRIMARY KEY (`id_solat`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `data`
--
ALTER TABLE `data`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tb_absensi_pelajaran`
--
ALTER TABLE `tb_absensi_pelajaran`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `tb_absensi_sekolah`
--
ALTER TABLE `tb_absensi_sekolah`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `tb_absensi_solat`
--
ALTER TABLE `tb_absensi_solat`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88895;

--
-- AUTO_INCREMENT untuk tabel `tb_jadwal`
--
ALTER TABLE `tb_jadwal`
  MODIFY `id_jadwal` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tb_katagori_jadwal`
--
ALTER TABLE `tb_katagori_jadwal`
  MODIFY `id_katagori` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `tb_reader`
--
ALTER TABLE `tb_reader`
  MODIFY `No_Reader` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tb_solat`
--
ALTER TABLE `tb_solat`
  MODIFY `id_solat` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_absensi_pelajaran`
--
ALTER TABLE `tb_absensi_pelajaran`
  ADD CONSTRAINT `id_kartupelajaran` FOREIGN KEY (`id_kartu`) REFERENCES `tb_siswa` (`id_kartu`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_pelajaran` FOREIGN KEY (`id_pelajaran`) REFERENCES `tb_pelajaran` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_absensi_sekolah`
--
ALTER TABLE `tb_absensi_sekolah`
  ADD CONSTRAINT `id_kartu` FOREIGN KEY (`id_kartu`) REFERENCES `tb_siswa` (`id_kartu`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_absensi_solat`
--
ALTER TABLE `tb_absensi_solat`
  ADD CONSTRAINT `id_solat` FOREIGN KEY (`id_solat`) REFERENCES `tb_solat` (`id_solat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_absensi_solat_ibfk_1` FOREIGN KEY (`id_kartu`) REFERENCES `tb_siswa` (`id_kartu`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_jadwal`
--
ALTER TABLE `tb_jadwal`
  ADD CONSTRAINT `fk_katagori` FOREIGN KEY (`id_katagori`) REFERENCES `tb_katagori_jadwal` (`id_katagori`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_reader`
--
ALTER TABLE `tb_reader`
  ADD CONSTRAINT `fk_jadwal` FOREIGN KEY (`id_jadwal`) REFERENCES `tb_katagori_jadwal` (`id_katagori`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
