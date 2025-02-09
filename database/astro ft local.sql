-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 09, 2025 at 06:19 PM
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
-- Database: `astro`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `password`) VALUES
(1, 'admin', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2'),
(2, 'thevindu', 'd5f12e53a182c062b6bf30c1445153faff12269a'),
(3, 'tysm', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `image` varchar(100) NOT NULL,
  `subtotal` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `pid`, `name`, `price`, `quantity`, `image`, `subtotal`) VALUES
(26, 6, 2, 'tysm', 912, 1, 'home-img-1.png', 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_agents`
--

CREATE TABLE `delivery_agents` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `password` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `delivery_agents`
--

INSERT INTO `delivery_agents` (`id`, `name`, `phone`, `password`) VALUES
(3, 'Thevindu Wickramaarachchi', '0705228470', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_assignments`
--

CREATE TABLE `delivery_assignments` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `delivery_agent_id` int(11) NOT NULL,
  `status` enum('pending','picked_up','delivered','cancelled') DEFAULT 'pending',
  `picked_up_at` timestamp NULL DEFAULT NULL,
  `delivered_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `delivery_assignments`
--

INSERT INTO `delivery_assignments` (`id`, `order_id`, `delivery_agent_id`, `status`, `picked_up_at`, `delivered_at`) VALUES
(3, 2, 3, 'delivered', '2025-02-09 17:06:00', '2025-02-09 17:06:01');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `name`, `email`, `number`, `message`) VALUES
(1, 2, 'sdasfs', 'fasfas@gmail.com', '12312', 'fasfas'),
(2, 0, 'tysm', '232@gmail.com', '2312321', 'Hello how are you'),
(3, 3, 'Thevindu', 'itsthw9@gmail.com', '0705228470', 'Hello there'),
(4, 3, 'tysm', 't@gmail.com', '21321', 'e21sfsa');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `number` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` int(100) NOT NULL,
  `placed_on` date NOT NULL DEFAULT current_timestamp(),
  `payment_status` varchar(20) NOT NULL DEFAULT 'pending',
  `order_status` enum('pending','picked_up','delivered','cancelled') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `number`, `email`, `method`, `address`, `total_products`, `total_price`, `placed_on`, `payment_status`, `order_status`) VALUES
(2, 2, 'casdasd', '12312', 'safasfas@gmail.com', 'paytm', 'flat no. sfasfas, fasfas, fasfas, fasfas, fsafas - 21312', 'tysm (900 x 1) - ', 900, '2025-02-02', 'completed', 'delivered'),
(7, 6, 'dsd', '123123', 'asdas@gmail.com', 'cash on delivery', 'flat no. 2312, dsa, adas, sdadas, sdsad - 123123', 'tysm (900 x 1)', 900, '2025-02-07', 'completed', 'delivered'),
(8, 6, 'casdas', '213123', 'das@gmail.com', 'cash on delivery', 'flat no. 321, 323, 232, 323, 123 - 23213', 'tysm (900 x 1), mail (123 x 1)', 1023, '2025-02-07', 'pending', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `details` varchar(500) NOT NULL,
  `price` int(10) NOT NULL,
  `image_01` varchar(100) NOT NULL,
  `image_02` varchar(100) NOT NULL,
  `image_03` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `details`, `price`, `image_01`, `image_02`, `image_03`) VALUES
(1, 'Headset', 'Hello', 420, 'home-img-3.png', 'Retail markdown-amico.png', 'home-img-3.png'),
(2, 'tysm', 'This is phone please buy it', 912, 'home-img-1.png', 'home-img-1.png', 'home-img-1.png'),
(4, 'Casing', 'Casing please buy it very cheap', 100, 'casing.png', 'casing.png', 'casing.png');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL CHECK (`rating` >= 1 and `rating` <= 5),
  `review_text` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `product_id`, `user_id`, `rating`, `review_text`, `created_at`, `updated_at`) VALUES
(1, 2, 6, 3, 'Very bad', '2025-02-08 04:35:59', '2025-02-08 05:19:49'),
(2, 2, 6, 5, 'Good one', '2025-02-08 04:36:08', '2025-02-08 05:19:49'),
(3, 4, 6, 3, 'Quite expensivesd', '2025-02-08 04:38:07', '2025-02-08 05:24:55'),
(4, 4, 6, 3, 'Quite expensivesd', '2025-02-08 04:40:09', '2025-02-08 05:24:55'),
(5, 4, 6, 3, 'Quite expensivesd', '2025-02-08 04:40:19', '2025-02-08 05:24:55'),
(6, 4, 6, 3, 'Quite expensivesd', '2025-02-08 04:40:54', '2025-02-08 05:24:55'),
(15, 1, 6, 5, 'Why', '2025-02-08 05:25:13', '2025-02-08 05:27:41');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(2, 'ThevinduW', 'itsthw9@gmail.com', '784e9240155834852dff458a730cceb50229df32'),
(4, 'asdas', 'thevinduh21@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
(5, 'mc', 'demo@gmail.com', '7c222fb2927d828af22f592134e8932480637c0d'),
(6, 'ThevinduH', 'th@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2'),
(7, 'THW', 't@t.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `user_id`, `pid`, `name`, `price`, `image`) VALUES
(18, 6, 4, 'Casing', 100, 'casing.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_agents`
--
ALTER TABLE `delivery_agents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- Indexes for table `delivery_assignments`
--
ALTER TABLE `delivery_assignments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_order_assignment` (`order_id`),
  ADD KEY `fk_delivery_agent` (`delivery_agent_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `delivery_agents`
--
ALTER TABLE `delivery_agents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `delivery_assignments`
--
ALTER TABLE `delivery_assignments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `delivery_assignments`
--
ALTER TABLE `delivery_assignments`
  ADD CONSTRAINT `fk_delivery_agent` FOREIGN KEY (`delivery_agent_id`) REFERENCES `delivery_agents` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
