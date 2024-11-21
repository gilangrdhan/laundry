-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 21, 2024 at 09:54 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `angkatan3_laundry`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `nama_customer` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `nama_customer`, `phone`, `address`, `created_at`, `updated_at`) VALUES
(1, 'vierra', '88', 'Gandaria', '2024-11-15 03:20:07', '2024-11-15 04:18:23'),
(2, 'iyan', '666', 'jakarta pusat', '2024-11-15 04:24:25', '2024-11-15 04:24:25'),
(3, 'tiro', '9090', 'tanah abang', '2024-11-15 04:27:42', '2024-11-15 04:34:47');

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `id` int(11) NOT NULL,
  `nama_level` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`id`, `nama_level`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2024-11-13 06:44:21', '2024-11-13 06:44:21'),
(3, 'operator', '2024-11-13 06:45:05', '2024-11-14 07:35:52');

-- --------------------------------------------------------

--
-- Table structure for table `paket`
--

CREATE TABLE `paket` (
  `id` int(11) NOT NULL,
  `nama_paket` varchar(50) NOT NULL,
  `harga` int(11) NOT NULL,
  `deskripsi` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `paket`
--

INSERT INTO `paket` (`id`, `nama_paket`, `harga`, `deskripsi`, `created_at`, `updated_at`) VALUES
(1, 'gosok', 4000, 'pewangi extra', '2024-11-15 05:26:36', '2024-11-15 06:41:29'),
(2, 'Cuci dan Gosok', 6000, 'terbungkus rapih', '2024-11-15 06:42:56', '2024-11-15 06:42:56'),
(3, 'Paket Besar', 7000, 'Sprei , karpet , mantel', '2024-11-15 06:43:38', '2024-11-15 06:43:38');

-- --------------------------------------------------------

--
-- Table structure for table `trans_laundry_pickup`
--

CREATE TABLE `trans_laundry_pickup` (
  `id` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `pickup_date` date NOT NULL,
  `pickup_pay` double(10,2) NOT NULL,
  `pickup_change` float NOT NULL,
  `note` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trans_laundry_pickup`
--

INSERT INTO `trans_laundry_pickup` (`id`, `id_customer`, `id_order`, `pickup_date`, `pickup_pay`, `pickup_change`, `note`, `created_at`, `updated_at`) VALUES
(1, 0, 0, '2024-11-21', 30000.00, 8000, '', '2024-11-21 04:27:55', '2024-11-21 04:27:55'),
(2, 0, 0, '2024-11-21', 20000.00, 12000, '', '2024-11-21 04:28:22', '2024-11-21 04:28:22'),
(3, 0, 0, '2024-11-21', 30000.00, 8000, '', '2024-11-21 04:31:07', '2024-11-21 04:31:07'),
(4, 0, 0, '2024-11-21', 10000.00, 2000, '', '2024-11-21 04:49:23', '2024-11-21 04:49:23'),
(5, 0, 0, '2024-11-21', 100000.00, 12000, '', '2024-11-21 05:57:10', '2024-11-21 05:57:10'),
(6, 2, 20, '2024-11-21', 11000.00, 3000, '', '2024-11-21 06:01:49', '2024-11-21 06:01:49'),
(7, 3, 21, '2024-11-21', 100000.00, 12000, '', '2024-11-21 06:03:57', '2024-11-21 06:03:57'),
(8, 1, 19, '2024-11-21', 30000.00, 8000, '', '2024-11-21 06:52:50', '2024-11-21 06:52:50');

-- --------------------------------------------------------

--
-- Table structure for table `trans_order`
--

CREATE TABLE `trans_order` (
  `id` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `no_transaksi` varchar(50) NOT NULL,
  `tanggal_laundry` date NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trans_order`
--

INSERT INTO `trans_order` (`id`, `id_customer`, `no_transaksi`, `tanggal_laundry`, `status`, `created_at`, `updated_at`) VALUES
(19, 1, 'INV2011240001', '2024-11-28', 1, '2024-11-20 04:55:59', '2024-11-21 06:52:50'),
(20, 2, 'INV21112400020', '2024-11-22', 1, '2024-11-21 01:19:42', '2024-11-21 05:02:28'),
(21, 3, 'INV21112400021', '2024-11-29', 1, '2024-11-21 04:59:15', '2024-11-21 06:03:57'),
(22, 1, 'INV21112400022', '2024-11-25', 0, '2024-11-21 06:53:47', '2024-11-21 06:53:47');

-- --------------------------------------------------------

--
-- Table structure for table `trans_order_detail`
--

CREATE TABLE `trans_order_detail` (
  `id` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `id_paket` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL,
  `catatan` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trans_order_detail`
--

INSERT INTO `trans_order_detail` (`id`, `id_order`, `id_paket`, `qty`, `subtotal`, `catatan`, `created_at`, `updated_at`) VALUES
(23, 19, 1, 1, 4000, '', '2024-11-20 04:55:59', '2024-11-20 04:55:59'),
(24, 19, 2, 3, 18000, '', '2024-11-20 04:55:59', '2024-11-20 04:55:59'),
(25, 20, 1, 1, 4000, '', '2024-11-21 01:19:42', '2024-11-21 01:19:42'),
(26, 20, 1, 1, 4000, '', '2024-11-21 01:19:42', '2024-11-21 01:19:42'),
(27, 21, 3, 12, 84000, '', '2024-11-21 04:59:15', '2024-11-21 04:59:15'),
(28, 21, 1, 1, 4000, '', '2024-11-21 04:59:15', '2024-11-21 04:59:15'),
(29, 22, 2, 2, 12000, '', '2024-11-21 06:53:47', '2024-11-21 06:53:47'),
(30, 22, 1, 2, 8000, '', '2024-11-21 06:53:47', '2024-11-21 06:53:47');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `id_level` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `id_level`, `nama`, `email`, `username`, `password`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'admin@gmail.com', 'admin', '1234', '2024-11-13 06:43:45', '2024-11-14 08:01:40'),
(3, 3, 'operator', 'operator@gmail.com', 'operator', '123', '2024-11-13 08:36:58', '2024-11-15 01:42:40'),
(10, 3, 'vino', 'vino@gmail.com', 'vinoooo', '123', '2024-11-14 07:44:22', '2024-11-14 07:44:22'),
(12, 3, 'viera2', 'viera@gmail.com', 'viera', '123', '2024-11-15 02:37:42', '2024-11-15 02:38:34'),
(13, 3, 'Wijaya', 'wijaya@gmail.com', 'wijaya', '123', '2024-11-15 04:20:00', '2024-11-15 04:20:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paket`
--
ALTER TABLE `paket`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trans_laundry_pickup`
--
ALTER TABLE `trans_laundry_pickup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trans_order`
--
ALTER TABLE `trans_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trans_order_detail`
--
ALTER TABLE `trans_order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_ibfk_1` (`id_level`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `level`
--
ALTER TABLE `level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `paket`
--
ALTER TABLE `paket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `trans_laundry_pickup`
--
ALTER TABLE `trans_laundry_pickup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `trans_order`
--
ALTER TABLE `trans_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `trans_order_detail`
--
ALTER TABLE `trans_order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `level` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
