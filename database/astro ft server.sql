-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 09, 2025 at 05:23 PM
-- Server version: 8.0.41-0ubuntu0.22.04.1
-- PHP Version: 8.1.2-1ubuntu2.20

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
  `id` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `password`) VALUES
(1, 'admin', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2'),
(3, 'admintest', '51eac6b471a284d3341d8c0c63d0f1a286262a18');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `pid` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int NOT NULL,
  `quantity` int NOT NULL,
  `image` varchar(100) NOT NULL,
  `subtotal` decimal(10,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `pid`, `name`, `price`, `quantity`, `image`, `subtotal`) VALUES
(51, 6, 3, 'Headset', 92, 1, 'home-img-3.png', '0.00'),
(57, 9, 5, 'AMD Ryzen 7 7700X', 300, 1, 'cpu.jpg', '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_agents`
--

CREATE TABLE `delivery_agents` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `password` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `delivery_agents`
--

INSERT INTO `delivery_agents` (`id`, `name`, `phone`, `password`) VALUES
(1, 'ThevinduW', '0705228470', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_assignments`
--

CREATE TABLE `delivery_assignments` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `delivery_agent_id` int NOT NULL,
  `status` enum('pending','picked_up','delivered','cancelled') DEFAULT 'pending',
  `picked_up_at` timestamp NULL DEFAULT NULL,
  `delivered_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `delivery_assignments`
--

INSERT INTO `delivery_assignments` (`id`, `order_id`, `delivery_agent_id`, `status`, `picked_up_at`, `delivered_at`) VALUES
(1, 4, 1, 'delivered', '2025-02-09 17:19:22', '2025-02-09 17:19:33');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `name`, `email`, `number`, `message`) VALUES
(3, 5, 'Rayan Perera', 'rayanp2004@gmail.com', '0778671711', 'Is this in stock?'),
(4, 5, 'Rayan Perera', 'rayanp2004@gmail.com', '0778671711', 'When will it ship?'),
(5, 5, 'Rayan Perera', 'rayanp2004@gmail.com', '0778671711', 'Payment not working!'),
(7, 5, 'Rayan Perera', 'rayanp2004@gmail.com', '0778671711', 'Any discounts available?'),
(8, 5, 'Rayan Perera', 'rayanp2004@gmail.com', '0778671711', 'How to return?'),
(9, 5, 'Rayan Perera', 'rayanp2004@gmail.com', '0778671711', 'Where&#39;s my order?'),
(10, 4, 'Madhuka', 'madhuka@gmail.com', '0771234567', 'Processor eka thibbat ko pc other parts'),
(11, 5, 'Rayan Perera', 'rayanp2004@gmail.com', '0778671711', 'Change my order!'),
(12, 5, 'Rayan Perera', 'rayanp2004@gmail.com', '0778671711', 'Need a refund.'),
(13, 5, 'Rayan Perera', 'rayanp2004@gmail.com', '0778671711', 'Cancel my order!'),
(14, 5, 'Rayan Perera', 'rayanp2004@gmail.com', '0778671711', 'Great product, thanks!'),
(15, 5, 'Rayan Perera', 'rayanp2004@gmail.com', '0778671711', 'Delivery is late!'),
(16, 5, 'Rayan Perera', 'rayanp2004@gmail.com', '0778671711', 'Support was helpful!'),
(17, 5, 'Rayan Perera', 'rayanp2004@gmail.com', '0778671711', 'Item arrived damaged!'),
(18, 5, 'Rayan Perera', 'rayanp2004@gmail.com', '0778671711', 'More payment options?'),
(19, 5, 'Rayan Perera', 'rayanp2004@gmail.com', '0778671711', 'How much is shipping?'),
(21, 5, 'Rayan Perera', 'rayanp2004@gmail.com', '0778671711', 'When will restock?'),
(22, 5, 'Rayan Perera', 'rayanp2004@gmail.com', '0778671711', 'Any warranty included?'),
(23, 7, 'usha', 'u@hh.com', '93837346', 'hi');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `number` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` int NOT NULL,
  `placed_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `payment_status` varchar(20) NOT NULL DEFAULT 'pending',
  `order_status` enum('pending','picked_up','delivered','cancelled') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `number`, `email`, `method`, `address`, `total_products`, `total_price`, `placed_on`, `payment_status`, `order_status`) VALUES
(1, 1, 'ThevinduW', '2312321', 't@gmail.com', 'cash on delivery', 'flat no. sfasfas, dsfsd, Kadawatha, Western Province, Sri Lanka - 11850', 'Headset (92 x 5), AMD Ryzen 7 7700X (300 x 9), Logitech Headset (70 x 4), EPSON Printer (400 x 8), Mouse (25 x 4), MSI Monitor (200 x 2), MSI Laptop (1200 x 5), Keyboard (40 x 15), SSD (20 x 21), External Hard Disk (50 x 40)', 16160, '2025-02-04 10:34:42', 'pending', 'pending'),
(2, 1, 'tysm', '2312321', 'thevinduh21@gmail.com', 'credit card', 'flat no. sfasfas, fasfas, Kadawatha, Western Province, Sri Lanka - 11850', 'Headset (92 x 1)', 92, '2025-02-04 11:07:28', 'pending', 'pending'),
(4, 1, 'ThevinduW', '2312321', 't@gmail.com', 'cash on delivery', 'flat no. sfasfas, dsfsd, Kadawatha, Western Province, Sri Lanka - 11850', 'Headset (92 x 1), AMD Ryzen 7 7700X (300 x 3), EPSON Printer (400 x 2), Keyboard (40 x 13)', 2312, '2025-02-05 16:47:22', 'completed', 'delivered'),
(5, 4, 'Malwana Madhuka Mals', '0771234567', 'madhukaaththanayaka@gmail.com', 'paytm', 'flat no. 43, Bibila Road, Hulandawa, Monaragala, Uva, Sri Lanka - 91000', 'AMD Ryzen 7 7700X (300 x 1), Mouse (25 x 1), MSI Monitor (200 x 1), SSD (20 x 1), External Hard Disk (50 x 1), Headset (92 x 1), Keyboard (40 x 1)', 727, '2025-02-05 18:21:28', 'pending', 'pending'),
(6, 4, 'Malwana Madhuka Mals', '0771234567', 'madhukaaththanayaka@gmail.com', 'cash on delivery', 'flat no. 43, Bibila Road, Hulandawa, Monaragala, Uva, Sri Lanka - 91000', 'AMD Ryzen 7 7700X (300 x 7)', 2100, '2025-02-05 18:24:22', 'pending', 'pending'),
(7, 4, 'Malwana Madhuka Mals', '0771234567', 'madhukaaththanayaka@gmail.com', 'cash on delivery', 'flat no. 43, Bibila Road, Hulandawa, Monaragala, Uva, Sri Lanka - 91000', 'Logitech Headset (70 x 20)', 1400, '2025-02-05 18:25:12', 'completed', 'pending'),
(8, 5, 'Rayan Perera', '0778671711', 'rayanp2004@gmail.com', 'cash on delivery', 'flat no. 8/7, 1st lane, Katuwawala Mawatha, Embillawaththa , maharagama, maharagama, western, Sri Lanka - 10280', 'AMD Ryzen 7 7700X (300 x 28)', 8400, '2025-02-05 18:26:11', 'completed', 'pending'),
(9, 4, 'Malwana Madhuka Mals', '0771234567', 'madhukaaththanayaka@gmail.com', 'cash on delivery', 'flat no. 43, Bibila Road, Hulandawa, Monaragala, Uva, Sri Lanka - 91000', 'MSI Laptop (1200 x 99), Headset (92 x 99), Logitech Headset (70 x 99), EPSON Printer (400 x 99), Mouse (25 x 99), MSI Monitor (200 x 99), Keyboard (40 x 99), External Hard Disk (50 x 99), SSD (20 x 99)', 207603, '2025-02-05 18:47:38', 'completed', 'pending'),
(10, 6, 'Malwana Madhuka Mals', '0758973807', 'madhukaaththanayaka@gmail.com', 'cash on delivery', 'flat no. 43, Bibila Road, Hulandawa, Monaragala, western, Sri Lanka - 91000', 'Headset (92 x 6), AMD Ryzen 7 7700X (300 x 3), EPSON Printer (400 x 2), Keyboard (40 x 1), MSI Laptop (1200 x 1)', 3492, '2025-02-06 03:27:16', 'completed', 'pending'),
(11, 1, 'usha', '577676767', 'u@f.vcom', 'cash on delivery', 'flat no. gfgfgfg, gfgfgfg, hghgh, gfgfgfg, sl - 65666755', 'AMD Ryzen 7 7700X (300 x 1)', 300, '2025-02-06 04:15:41', 'completed', 'pending'),
(12, 8, 'Thevindu', '93837346', 'hello@thevin.du', 'cash on delivery', 'flat no. sfasfas, dsfsd, Kadawatha, Western Province, Sri Lanka - 11850', 'AMD Ryzen 7 7700X (300 x 1), Logitech Headset (70 x 3), EPSON Printer (400 x 2)', 1310, '2025-02-06 15:24:50', 'completed', 'pending'),
(13, 10, 'asf', '123123', 'safsafsa@gmail.com', 'cash on delivery', 'flat no. fasfas, fsafas, fsafas, fasfas, fasfas - 231233', 'Logitech Headset (70 x 3), EPSON Printer (400 x 2)', 1010, '2025-02-08 05:39:12', 'completed', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `details` varchar(500) NOT NULL,
  `price` int NOT NULL,
  `image_01` varchar(100) NOT NULL,
  `image_02` varchar(100) NOT NULL,
  `image_03` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `details`, `price`, `image_01`, `image_02`, `image_03`) VALUES
(3, 'Headset', 'This is headset', 92, 'home-img-3.png', 'images (4).jpeg', 'images (5).jpeg'),
(5, 'AMD Ryzen 7 7700X', 'AMD CPUs are high-performance processors known for their multi-core architecture, offering efficient parallel processing capabilities and competitive pricing. They utilize the Zen microarchitecture, delivering strong performance in gaming, content creation, and multi-threaded applications while supporting cutting-edge technologies like PCIe 4.0 and DDR4 memory.', 300, 'cpu.jpg', 'cpu.jpg', 'cpu.jpg'),
(6, 'Logitech Headset', 'Logitech headsets are known for their comfort, durability, and high-quality sound performance, designed for both gaming and professional use. Featuring advanced noise-canceling microphones, customizable sound profiles, and ergonomic designs, they cater to long hours of use with both wired and wireless options for various needs.', 70, 'headphone.jpg', 'headphone.jpg', 'headphone.jpg'),
(7, 'EPSON Printer', 'Epson printers are renowned for their reliability and high-quality printing, catering to both personal and professional use. They feature advanced technologies like PrecisionCore printheads, eco-friendly ink solutions, and versatile functionalities, including printing, scanning, and copying, with options for wireless and mobile connectivity.', 400, 'printer.png', 'printer.png', 'printer.png'),
(8, 'Mouse', 'A computer mouse is a handheld pointing device that enables users to interact with a computer&#39;s graphical interface by moving a cursor and executing commands through clicks. Modern mice come in various types, including optical, laser, and wireless, with additional features like customizable buttons, ergonomic designs, and high DPI for precise tracking.', 25, 'mouse.jpg', 'mouse.jpg', 'mouse.jpg'),
(9, 'MSI Monitor', 'MSI monitors are high-performance displays designed for gaming, productivity, and content creation, featuring vibrant colors and smooth visuals. They offer advanced features like high refresh rates, low response times, adaptive sync technologies, and ergonomic designs for an immersive and comfortable user experience.', 200, 'monitor.png', 'monitor.png', 'monitor.png'),
(10, 'MSI Laptop', 'MSI laptops are premium devices known for their high performance, durable build, and innovative designs, catering to gamers, creators, and professionals. They feature powerful hardware, including the latest Intel or AMD processors, NVIDIA GPUs, advanced cooling systems, and vibrant displays with high refresh rates for seamless multitasking and immersive experiences.', 1200, 'laptop.jpg', 'laptop.jpg', 'laptop.jpg'),
(11, 'Keyboard', 'A keyboard is an input device used to type text and execute commands on a computer, featuring an arrangement of keys for letters, numbers, and functions. Modern keyboards come in various types, including mechanical, membrane, and ergonomic designs, with additional features like RGB lighting, programmable keys, and wireless connectivity for enhanced user experience.', 40, 'keyboard.jpg', 'keyboard.jpg', 'keyboard.jpg'),
(12, 'External Hard Disk', 'An external hard drive is a portable storage device that connects to a computer via USB or other interfaces, offering additional space for data backup and transfer. Available in HDD or SSD formats, they provide varying capacities, fast read/write speeds, and durability for storing large files, making them ideal for personal and professional use.', 50, 'externalhard.jpg', 'externalhard.jpg', 'externalhard.jpg'),
(13, 'SSD', 'An SSD (Solid State Drive) is a high-speed storage device that uses flash memory to store data, offering faster read and write speeds compared to traditional hard drives. Known for their durability, energy efficiency, and compact design, SSDs significantly improve system performance, making them ideal for modern laptops, desktops, and servers.', 20, 'ssd.png', 'ssd.png', 'ssd.png'),
(19, 'iguguo', 'ufyfi', 67, 'camera-1.webp', 'camera-1.webp', 'camera-1.webp'),
(20, 'admin', 'eefrtb tbet  eve   ee  ', 1200, 'IMG_3481.JPG', 'IMG_3485.JPG', 'IMG_3484.JPG');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `user_id` int NOT NULL,
  `rating` int NOT NULL,
  `review_text` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `product_id`, `user_id`, `rating`, `review_text`, `created_at`) VALUES
(1, 11, 4, 2, 'Too bad', '2025-02-08 05:02:44'),
(2, 11, 4, 2, 'Too bad', '2025-02-08 05:05:07'),
(3, 11, 4, 2, 'Too bad', '2025-02-08 05:05:12'),
(4, 3, 10, 4, 'Good headset', '2025-02-08 05:34:49');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(1, 'ThevinduW', 't@gmail.com', '7c222fb2927d828af22f592134e8932480637c0d'),
(4, 'Madhuka', 'madhuka@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2'),
(5, 'rayan', 'rayanp2004@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
(6, 'User1', 'user1@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
(7, 'usha', 'u@hh.com', '8cb2237d0679ca88db6464eac60da96345513964'),
(8, 'Thevindu', 'hello@thevin.du', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220'),
(9, 'desan', 'desandinsanda@gmail.com', '8e28515810f17a2ad95bb03cde83af33ed67c435'),
(10, 'TZ', 't@dev.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `pid` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `user_id`, `pid`, `name`, `price`, `image`) VALUES
(13, 6, 5, 'AMD Ryzen 7 7700X', 300, 'cpu.jpg'),
(14, 1, 6, 'Logitech Headset', 70, 'headphone.jpg'),
(15, 8, 9, 'MSI Monitor', 200, 'monitor.png'),
(16, 8, 10, 'MSI Laptop', 1200, 'laptop.jpg');

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `delivery_agents`
--
ALTER TABLE `delivery_agents`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `delivery_assignments`
--
ALTER TABLE `delivery_assignments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
