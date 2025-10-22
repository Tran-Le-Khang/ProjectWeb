-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th8 12, 2025 lúc 10:46 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `watch_store`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `brand_image` varchar(255) DEFAULT NULL,
  `brand_origin` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `brands`
--

INSERT INTO `brands` (`id`, `name`, `brand_image`, `brand_origin`) VALUES
(1, 'Casio', 'casio.png', 'Nhật Bản'),
(2, 'MVW', 'mvw.png', 'Việt Nam'),
(3, 'Citizen', 'citizen.png', 'Nhật Bản'),
(4, 'Orient', 'orient.png', 'Nhật Bản'),
(5, 'Thụy Sỹ', 'thuysy.png', 'Thụy Sỹ'),
(6, 'Smartwatch', 'smartwatch.png', 'Mỹ'),
(7, 'Elio', 'elio.png', 'Việt Nam');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart_items`
--

CREATE TABLE `cart_items` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `cart_items`
--

INSERT INTO `cart_items` (`id`, `user_id`, `product_id`, `quantity`, `created_at`, `updated_at`) VALUES
(31, 15, 12, 1, '2025-08-07 17:33:20', '2025-08-07 17:47:23'),
(62, 5, 1, 1, '2025-08-12 19:13:20', '2025-08-12 19:13:20'),
(63, 5, 7, 1, '2025-08-12 19:14:50', '2025-08-12 19:14:50');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(3, 'PHỤ KIỆN'),
(1, 'ĐỒNG HỒ NAM'),
(2, 'ĐỒNG HỒ NỮ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chat_messages`
--

CREATE TABLE `chat_messages` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chat_messages`
--

INSERT INTO `chat_messages` (`id`, `user_id`, `receiver_id`, `message`, `created_at`) VALUES
(1, 11, 2, 'Có mẫu dưới 2 triệu không?', '2025-08-06 13:38:10'),
(2, 2, 11, 'Có bạn ơi', '2025-08-06 13:49:58'),
(4, 5, 2, 'Đồng hồ này có chống nước không?', '2025-08-12 11:57:28'),
(5, 8, 5, 'bạn muốn hỏi sản phẩm nào ạ', '2025-08-12 11:59:25'),
(6, 5, 2, 'G-Shock 46 ạ', '2025-08-12 12:00:09'),
(7, 2, 5, 'Sản phẩm này có chống nước ạ', '2025-08-12 12:00:32');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `discount_codes`
--

CREATE TABLE `discount_codes` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `discount_type` enum('percent','fixed') NOT NULL,
  `discount_value` decimal(10,0) NOT NULL,
  `max_usage` int(11) DEFAULT 1,
  `used_count` int(11) DEFAULT 0,
  `expired_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `start_at` datetime DEFAULT current_timestamp(),
  `min_order_amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `discount_codes`
--

INSERT INTO `discount_codes` (`id`, `code`, `discount_type`, `discount_value`, `max_usage`, `used_count`, `expired_at`, `created_at`, `start_at`, `min_order_amount`) VALUES
(1, 'Ưu đãi nhỏ tháng 8', 'fixed', 15000, 100, 12, '2025-08-25 12:00:00', '2025-07-22 22:37:32', '2025-07-22 12:00:00', 99000),
(3, 'Ưu đãi giữa tháng 8', 'fixed', 20000, 10, 2, '2025-08-14 12:00:00', '2025-08-11 20:53:13', '2025-08-11 12:00:00', 2000000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `customer_email` varchar(255) DEFAULT NULL,
  `customer_address` varchar(255) DEFAULT NULL,
  `customer_phone` varchar(20) DEFAULT NULL,
  `total_price` decimal(12,2) DEFAULT NULL,
  `status` enum('Chờ xử lý','Đang xử lý','Đang vận chuyển','Đã giao','Đã hủy') DEFAULT 'Đang xử lý',
  `payment_method` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `discount_code` varchar(50) DEFAULT NULL,
  `discount_amount` int(11) DEFAULT 0,
  `cancel_request` tinyint(4) DEFAULT 0,
  `cancel_approved` tinyint(4) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `customer_name`, `username`, `customer_email`, `customer_address`, `customer_phone`, `total_price`, `status`, `payment_method`, `created_at`, `discount_code`, `discount_amount`, `cancel_request`, `cancel_approved`, `user_id`) VALUES
(1, 'b2105617', 'b2105617', 'tranlekhang2003@gmail.com', 'Ấp 1, xã Vị Thanh 1, Thành phố Cần Thơ', '0967898241', 63564000.00, 'Đã giao', 'cod', '2025-08-13 01:16:51', '', 0, 0, NULL, NULL),
(2, 'b2105617', 'b2105617', 'tranlekhang2003@gmail.com', 'Ấp 1, xã Vị Thanh 1, Thành phố Cần Thơ', '0967898241', 8330000.00, 'Đang vận chuyển', 'cod', '2025-08-13 01:17:39', '', 0, 0, NULL, NULL),
(3, 'b2105617', 'b2105617', 'tranlekhang2003@gmail.com', 'Ấp 1, xã Vị Thanh 1, Thành phố Cần Thơ', '0967898241', 11130000.00, 'Đã giao', 'cod', '2025-08-13 01:18:00', '', 0, 0, NULL, NULL),
(4, 'b2105617', 'b2105617', 'tranlekhang2003@gmail.com', 'Ấp 1, xã Vị Thanh 1, Thành phố Cần Thơ', '0967898241', 3030000.00, 'Chờ xử lý', 'cod', '2025-08-13 01:19:21', '', 0, 0, NULL, NULL),
(5, 'b2105617', 'b2105617', 'tranlekhang2003@gmail.com', 'Ấp 1, xã Vị Thanh 1, Thành phố Cần Thơ', '0967898241', 927000.00, 'Đang xử lý', 'e_wallet', '2025-08-13 01:21:08', 'Ưu đãi nhỏ tháng 8', 15000, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_name`, `quantity`, `price`) VALUES
(30, 1, 1, 'G-Shock 46 mm Nam GA-B001CBR-1ADR', 15, 2962000.00),
(31, 1, 3, 'MVW 41 mm Nam MS095-01', 12, 1592000.00),
(32, 2, 6, 'Nam Thụy Sỹ Automatic', 1, 4800000.00),
(33, 2, 10, 'Nam Citizen Classic', 1, 3500000.00),
(34, 3, 9, 'Nam MVW Sport', 1, 3700000.00),
(35, 3, 10, 'Nam Citizen Classic', 1, 3500000.00),
(36, 3, 12, 'Nữ Citizen Eco-Drive', 1, 3900000.00),
(37, 4, 17, 'Nữ Elio Chic', 1, 3000000.00),
(38, 5, 2, 'CASIO 30.2 mm Nam A158WA-1DF', 1, 912000.00);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payment_logs`
--

CREATE TABLE `payment_logs` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `request_id` varchar(100) DEFAULT NULL,
  `momo_trans_id` varchar(100) DEFAULT NULL,
  `amount` decimal(12,2) DEFAULT NULL,
  `result_code` int(11) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `pay_type` varchar(50) DEFAULT NULL,
  `signature` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(11,3) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `quantity` int(11) DEFAULT 0,
  `original_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `is_visible` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `image`, `created_at`, `quantity`, `original_price`, `is_featured`, `brand_id`, `category_id`, `deleted_at`, `is_visible`) VALUES
(1, 'G-Shock 46 mm Nam GA-B001CBR-1ADR', 'Đồng hồ G-Shock GA-B001CBR-1ADR lấy cảm hứng từ những trang sách khoa học viễn tưởng mang phong cách tương lai với màu sắc nổi bật, tạo nên những điểm nhấn độc đáo và bắt mắt.\r\nKhung viền của mẫu đồng hồ nam này làm từ Carbon + nhựa Resin - đây là chất liệu có độ bền cao, khối lượng nhẹ, cùng khả năng chịu va đập tốt và có thể chống chịu được trong môi trường khắc nghiệt một cách vượt trội. Chất liệu dây đeo làm từ nhựa an toàn không gây cảm giác nặng tay khi đeo.\r\nMặt kính đồng hồ được sử dụng kính khoáng (Mineral) có độ cứng cao, chịu lực tốt.\r\n', 2962000.000, 'dhn1.jpg', '2025-03-20 20:10:00', 85, 4323000.00, 1, 1, 1, NULL, 1),
(2, 'CASIO 30.2 mm Nam A158WA-1DF', 'Thiết kế sang trọng, kết hợp công nghệ hiện đại.\r\nKhung viền của mẫu đồng hồ nam này làm từ Carbon + nhựa Resin - đây là chất liệu có độ bền cao, khối lượng nhẹ, cùng khả năng chịu va đập tốt và có thể chống chịu được trong môi trường khắc nghiệt một cách vượt trội. Chất liệu dây đeo làm từ nhựa an toàn không gây cảm giác nặng tay khi đeo.\r\nMặt kính đồng hồ được sử dụng kính khoáng (Mineral) có độ cứng cao, chịu lực tốt.', 912000.000, 'dhn2.jpg', '2025-03-20 20:12:00', 9, 1014000.00, 1, 1, 1, NULL, 1),
(3, 'MVW 41 mm Nam MS095-01', 'Mặt số thể thao, phù hợp cho nam giới trẻ trung.\r\nKhung viền của mẫu đồng hồ nam này làm từ Carbon + nhựa Resin - đây là chất liệu có độ bền cao, khối lượng nhẹ, cùng khả năng chịu va đập tốt và có thể chống chịu được trong môi trường khắc nghiệt một cách vượt trội. Chất liệu dây đeo làm từ nhựa an toàn không gây cảm giác nặng tay khi đeo.\r\nMặt kính đồng hồ được sử dụng kính khoáng (Mineral) có độ cứng cao, chịu lực tốt.', 1592000.000, 'dhn3.jpg', '2025-03-20 20:15:00', 88, 1990000.00, 1, 2, 1, NULL, 1),
(4, 'CITIZEN 37 mm Nam BM6770-51E', 'Công nghệ sạc ánh sáng, không cần thay pin, phù hợp cho nam.\r\nKhung viền của mẫu đồng hồ nam này làm từ Carbon + nhựa Resin - đây là chất liệu có độ bền cao, khối lượng nhẹ, cùng khả năng chịu va đập tốt và có thể chống chịu được trong môi trường khắc nghiệt một cách vượt trội. Chất liệu dây đeo làm từ nhựa an toàn không gây cảm giác nặng tay khi đeo.\r\nMặt kính đồng hồ được sử dụng kính khoáng (Mineral) có độ cứng cao, chịu lực tốt.', 3900000.000, 'dhn4.jpg', '2025-03-20 20:25:00', 200, 4200000.00, 0, 3, 1, NULL, 1),
(5, 'ORIENT Bambino 40.8 mm Nam FAC00003W0', 'Thiết kế cổ điển với mặt kính cong tinh tế.\r\nKhung viền của mẫu đồng hồ nam này làm từ Carbon + nhựa Resin - đây là chất liệu có độ bền cao, khối lượng nhẹ, cùng khả năng chịu va đập tốt và có thể chống chịu được trong môi trường khắc nghiệt một cách vượt trội. Chất liệu dây đeo làm từ nhựa an toàn không gây cảm giác nặng tay khi đeo.\r\nMặt kính đồng hồ được sử dụng kính khoáng (Mineral) có độ cứng cao, chịu lực tốt.', 3500000.000, 'dhn5.jpg', '2025-03-20 20:30:00', 300, 4000000.00, 0, 4, 1, NULL, 1),
(6, 'Nam Thụy Sỹ Automatic', 'Thiết kế tinh tế, máy cơ tự động cao cấp.\r\nKhung viền của mẫu đồng hồ nam này làm từ Carbon + nhựa Resin - đây là chất liệu có độ bền cao, khối lượng nhẹ, cùng khả năng chịu va đập tốt và có thể chống chịu được trong môi trường khắc nghiệt một cách vượt trội. Chất liệu dây đeo làm từ nhựa an toàn không gây cảm giác nặng tay khi đeo.\r\nMặt kính đồng hồ được sử dụng kính khoáng (Mineral) có độ cứng cao, chịu lực tốt.', 4800000.000, 'dhn6.jpg', '2025-03-20 20:35:00', 100, 5100000.00, 0, 5, 1, NULL, 1),
(7, 'Nam Smartwatch Series 5', 'Nhiều tính năng thông minh hỗ trợ sức khỏe.\r\nKhung viền của mẫu đồng hồ nam này làm từ Carbon + nhựa Resin - đây là chất liệu có độ bền cao, khối lượng nhẹ, cùng khả năng chịu va đập tốt và có thể chống chịu được trong môi trường khắc nghiệt một cách vượt trội. Chất liệu dây đeo làm từ nhựa an toàn không gây cảm giác nặng tay khi đeo.\r\nMặt kính đồng hồ được sử dụng kính khoáng (Mineral) có độ cứng cao, chịu lực tốt.', 2920000.000, '689b7efa597cf-dhn7.jpg', '2025-03-20 20:40:00', 60, 3200000.00, 0, 6, 1, NULL, 1),
(8, 'Nam Elio Classic', 'Phong cách tối giản, phù hợp với nhiều trang phục.\r\nKhung viền của mẫu đồng hồ nam này làm từ Carbon + nhựa Resin - đây là chất liệu có độ bền cao, khối lượng nhẹ, cùng khả năng chịu va đập tốt và có thể chống chịu được trong môi trường khắc nghiệt một cách vượt trội. Chất liệu dây đeo làm từ nhựa an toàn không gây cảm giác nặng tay khi đeo.\r\nMặt kính đồng hồ được sử dụng kính khoáng (Mineral) có độ cứng cao, chịu lực tốt.', 3100000.000, 'dhn8.jpg', '2025-03-20 20:45:00', 102, 3400000.00, 0, 7, 1, NULL, 1),
(9, 'Nam MVW Sport', 'Thiết kế thể thao mạnh mẽ.\r\nKhung viền của mẫu đồng hồ nam này làm từ Carbon + nhựa Resin - đây là chất liệu có độ bền cao, khối lượng nhẹ, cùng khả năng chịu va đập tốt và có thể chống chịu được trong môi trường khắc nghiệt một cách vượt trội. Chất liệu dây đeo làm từ nhựa an toàn không gây cảm giác nặng tay khi đeo.\r\nMặt kính đồng hồ được sử dụng kính khoáng (Mineral) có độ cứng cao, chịu lực tốt.', 3700000.000, 'dhn9.jpg', '2025-03-20 20:50:00', 81, 4000000.00, 0, 2, 1, NULL, 1),
(10, 'Nam Citizen Classic', 'Sự kết hợp giữa cổ điển và hiện đại.\r\nKhung viền của mẫu đồng hồ nam này làm từ Carbon + nhựa Resin - đây là chất liệu có độ bền cao, khối lượng nhẹ, cùng khả năng chịu va đập tốt và có thể chống chịu được trong môi trường khắc nghiệt một cách vượt trội. Chất liệu dây đeo làm từ nhựa an toàn không gây cảm giác nặng tay khi đeo.\r\nMặt kính đồng hồ được sử dụng kính khoáng (Mineral) có độ cứng cao, chịu lực tốt.', 3500000.000, 'dhn10.jpg', '2025-03-20 20:55:00', 63, 3800000.00, 0, 3, 1, NULL, 1),
(11, 'Nữ Casio Sheen', 'Thiết kế sang trọng với pha lê Swarovski.\r\nKhung viền của mẫu đồng hồ nam này làm từ Carbon + nhựa Resin - đây là chất liệu có độ bền cao, khối lượng nhẹ, cùng khả năng chịu va đập tốt và có thể chống chịu được trong môi trường khắc nghiệt một cách vượt trội. Chất liệu dây đeo làm từ nhựa an toàn không gây cảm giác nặng tay khi đeo.\r\nMặt kính đồng hồ được sử dụng kính khoáng (Mineral) có độ cứng cao, chịu lực tốt.', 3200000.000, 'dhn11.jpg', '2025-03-20 21:00:00', 6, 3500000.00, 0, 1, 2, NULL, 1),
(12, 'Nữ Citizen Eco-Drive', 'Hoạt động bằng năng lượng ánh sáng, thiết kế thanh lịch.\r\nKhung viền của mẫu đồng hồ nam này làm từ Carbon + nhựa Resin - đây là chất liệu có độ bền cao, khối lượng nhẹ, cùng khả năng chịu va đập tốt và có thể chống chịu được trong môi trường khắc nghiệt một cách vượt trội. Chất liệu dây đeo làm từ nhựa an toàn không gây cảm giác nặng tay khi đeo.\r\nMặt kính đồng hồ được sử dụng kính khoáng (Mineral) có độ cứng cao, chịu lực tốt.', 3900000.000, 'dhn12.jpg', '2025-03-20 21:05:00', 4, 4200000.00, 1, 3, 2, NULL, 1),
(13, 'Nữ Orient Sun & Moon', 'Thiết kế độc đáo với mặt số lịch trăng sao.\r\nKhung viền của mẫu đồng hồ nam này làm từ Carbon + nhựa Resin - đây là chất liệu có độ bền cao, khối lượng nhẹ, cùng khả năng chịu va đập tốt và có thể chống chịu được trong môi trường khắc nghiệt một cách vượt trội. Chất liệu dây đeo làm từ nhựa an toàn không gây cảm giác nặng tay khi đeo.\r\nMặt kính đồng hồ được sử dụng kính khoáng (Mineral) có độ cứng cao, chịu lực tốt.', 3600000.000, 'dhn13.jpg', '2025-03-20 21:10:00', 4, 3900000.00, 0, 4, 2, NULL, 1),
(14, 'Nam MVW Classic', 'Phong cách đơn giản nhưng tinh tế.\r\nKhung viền của mẫu đồng hồ nam này làm từ Carbon + nhựa Resin - đây là chất liệu có độ bền cao, khối lượng nhẹ, cùng khả năng chịu va đập tốt và có thể chống chịu được trong môi trường khắc nghiệt một cách vượt trội. Chất liệu dây đeo làm từ nhựa an toàn không gây cảm giác nặng tay khi đeo.\r\nMặt kính đồng hồ được sử dụng kính khoáng (Mineral) có độ cứng cao, chịu lực tốt.', 3400000.000, 'dhn14.jpg', '2025-03-20 21:15:00', 4, 3700000.00, 1, 2, 1, NULL, 1),
(15, 'Nữ Thụy Sỹ Luxury', 'Đồng hồ cao cấp với chất liệu sang trọng.\r\nKhung viền của mẫu đồng hồ nam này làm từ Carbon + nhựa Resin - đây là chất liệu có độ bền cao, khối lượng nhẹ, cùng khả năng chịu va đập tốt và có thể chống chịu được trong môi trường khắc nghiệt một cách vượt trội. Chất liệu dây đeo làm từ nhựa an toàn không gây cảm giác nặng tay khi đeo.\r\nMặt kính đồng hồ được sử dụng kính khoáng (Mineral) có độ cứng cao, chịu lực tốt.', 4800000.000, 'dhn15.jpg', '2025-03-20 21:20:00', 1, 5200000.00, 0, 5, 2, NULL, 1),
(16, 'Nữ Smartwatch Mini', 'Đồng hồ thông minh với kiểu dáng nhỏ gọn.\r\nKhung viền của mẫu đồng hồ nam này làm từ Carbon + nhựa Resin - đây là chất liệu có độ bền cao, khối lượng nhẹ, cùng khả năng chịu va đập tốt và có thể chống chịu được trong môi trường khắc nghiệt một cách vượt trội. Chất liệu dây đeo làm từ nhựa an toàn không gây cảm giác nặng tay khi đeo.\r\nMặt kính đồng hồ được sử dụng kính khoáng (Mineral) có độ cứng cao, chịu lực tốt.', 2800000.000, 'dhn16.jpg', '2025-03-20 21:25:00', 12, 3100000.00, 0, 6, 2, NULL, 1),
(17, 'Nữ Elio Chic', 'Phong cách nữ tính, trẻ trung.\r\nKhung viền của mẫu đồng hồ nam này làm từ Carbon + nhựa Resin - đây là chất liệu có độ bền cao, khối lượng nhẹ, cùng khả năng chịu va đập tốt và có thể chống chịu được trong môi trường khắc nghiệt một cách vượt trội. Chất liệu dây đeo làm từ nhựa an toàn không gây cảm giác nặng tay khi đeo.\r\nMặt kính đồng hồ được sử dụng kính khoáng (Mineral) có độ cứng cao, chịu lực tốt.', 3000000.000, 'dhn17.jpg', '2025-03-20 21:30:00', 9, 3300000.00, 0, 7, 2, NULL, 1),
(18, 'Nữ Casio Vintage', 'Thiết kế cổ điển, phù hợp với phong cách retro.\r\nKhung viền của mẫu đồng hồ nam này làm từ Carbon + nhựa Resin - đây là chất liệu có độ bền cao, khối lượng nhẹ, cùng khả năng chịu va đập tốt và có thể chống chịu được trong môi trường khắc nghiệt một cách vượt trội. Chất liệu dây đeo làm từ nhựa an toàn không gây cảm giác nặng tay khi đeo.\r\nMặt kính đồng hồ được sử dụng kính khoáng (Mineral) có độ cứng cao, chịu lực tốt.', 3100000.000, 'dhn18.jpg', '2025-03-20 21:35:00', 8, 3400000.00, 0, 1, 2, NULL, 1),
(19, 'Nam MVW Elegant', 'Phong cách sang trọng, thanh lịch.', 3600000.000, 'dhn19.jpg', '2025-03-20 21:40:00', 6, 3900000.00, 0, 2, 1, NULL, 1),
(20, 'Nữ Citizen Modern', 'Thiết kế hiện đại, phù hợp với nhiều dịp.\r\nKhung viền của mẫu đồng hồ nam này làm từ Carbon + nhựa Resin - đây là chất liệu có độ bền cao, khối lượng nhẹ, cùng khả năng chịu va đập tốt và có thể chống chịu được trong môi trường khắc nghiệt một cách vượt trội. Chất liệu dây đeo làm từ nhựa an toàn không gây cảm giác nặng tay khi đeo.\r\nMặt kính đồng hồ được sử dụng kính khoáng (Mineral) có độ cứng cao, chịu lực tốt.', 3700000.000, '67dd93a57c78f-dhn20.jpg', '2025-03-20 21:45:00', 7, 4000000.00, 0, 3, 2, NULL, 1),
(56, 'Dây da cao cấp', 'Dây da chính hãng Casio, thiết kế sang trọng, bền bỉ.', 69000.000, 'day_da_casio.jpg', '2025-03-22 07:59:06', 9, 80000.00, 0, 1, 3, NULL, 1),
(57, 'Dây kim loại chống gỉ', 'Dây kim loại MVW chất liệu cao cấp, chống gỉ sét.', 69000.000, 'day_kim_loai_mvw.jpg', '2025-03-22 07:59:06', 5, 80000.00, 0, 2, 3, NULL, 1),
(58, 'Dây vải thể thao', 'Dây vải Citizen siêu bền, phong cách thể thao năng động.', 69000.000, 'day_vai_citizen.jpg', '2025-03-22 07:59:06', 15, 80000.00, 0, 3, 3, NULL, 1),
(59, 'Dây da cá sấu', 'Dây da cá sấu cao cấp chính hãng Orient.', 69000.000, 'day_da_orient.jpg', '2025-03-22 07:59:06', 4, 80000.00, 0, 4, 3, NULL, 1),
(60, 'Dây thép không gỉ', 'Dây thép cao cấp của thương hiệu Thụy Sỹ, đẳng cấp và bền bỉ.', 69000.000, 'day_thep_thuy_sy.jpg', '2025-03-22 07:59:06', 7, 80000.00, 0, 5, 3, NULL, 1),
(61, 'Dây silicone chống nước', 'Dây silicone Elio chống nước, mềm mại và thoải mái.', 69000.000, 'day_silicone_elio.jpg', '2025-03-22 07:59:06', 12, 80000.00, 0, 7, 3, NULL, 1),
(62, 'Dây da bò cao cấp', 'Dây da bò chính hãng Casio, mềm mại và bền bỉ.', 69000.000, 'day_da_bo_casio.jpg', '2025-03-22 08:07:42', 19, 90000.00, 0, 1, 3, NULL, 1),
(63, 'Dây thép mạ vàng', 'Dây thép không gỉ mạ vàng cao cấp, tạo vẻ sang trọng.', 69000.000, 'day_thep_vang_mvw.jpg', '2025-03-22 08:07:42', 14, 100000.00, 0, 2, 3, NULL, 1),
(64, 'Dây vải dù chống nước', 'Dây vải dù chống nước, thích hợp cho người năng động.', 69000.000, 'day_vai_du_citizen.jpg', '2025-03-22 08:07:42', 10, 70000.00, 0, 3, 3, NULL, 1),
(65, 'Dây silicone thoáng khí', 'Dây silicone có lỗ thoáng khí, phù hợp khi chơi thể thao.', 69000.000, 'day_silicone_thoang_khi_elio.jpg', '2025-03-22 08:07:42', 18, 89000.00, 0, 7, 3, NULL, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_details`
--

CREATE TABLE `product_details` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `target_user` varchar(255) DEFAULT NULL,
  `diameter` varchar(100) DEFAULT NULL,
  `strap_material` varchar(255) DEFAULT NULL,
  `strap_width` varchar(255) DEFAULT NULL,
  `frame_material` varchar(255) DEFAULT NULL,
  `thickness` varchar(100) DEFAULT NULL,
  `glass_material` varchar(255) DEFAULT NULL,
  `battery_life` varchar(255) DEFAULT NULL,
  `water_resistance` varchar(255) DEFAULT NULL,
  `utilities` text DEFAULT NULL,
  `power_source` varchar(255) DEFAULT NULL,
  `movement_type` varchar(255) DEFAULT NULL,
  `manufacture_location` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product_details`
--

INSERT INTO `product_details` (`id`, `product_id`, `target_user`, `diameter`, `strap_material`, `strap_width`, `frame_material`, `thickness`, `glass_material`, `battery_life`, `water_resistance`, `utilities`, `power_source`, `movement_type`, `manufacture_location`) VALUES
(1, 1, 'Nam', '46mm', 'Nhựa', '23mm', 'Carbon + Nhựa', '13.8mm', 'Kính khoáng Mineral', 'Khoảng 2 năm', '20 ATM - bơi,lặn', 'Âm bấm phím\r\nBluetooth\r\nĐồng hồ 24 giờ\r\nBáo thức\r\nBấm giờ thể thao\r\nĐèn LED\r\nBấm giờ đếm ngược\r\nKim dạ quang\r\nLịch ngày - thứ\r\nGiờ thế giới\r\nTìm điện thoại', 'Pin', 'Pin(Quartz)', 'Nhật Bản/Thái Lan/Trung Quốc (tùy lô hàng)'),
(2, 4, 'Nam', '37 mm', 'Hợp kim', '20 mm', 'Thép không gỉ', '7.9 mm', 'Kính Sapphire', 'Hãng không công bố', '3 ATM - Rửa tay, đi mưa', 'Lịch ngày', 'Ánh sáng', 'Eco-Drive', 'Nhật Bản/ Thái Lan/ Trung Quốc (tùy lô hàng)'),
(3, 2, 'Nam', '37 mm', 'Hợp kim', '20 mm', 'Thép không gỉ', '7.9 mm', 'Kính Sapphire', 'Hãng không công bố', '3 ATM - Rửa tay, đi mưa', 'Lịch ngày', 'Ánh sáng', 'Eco-Drive', 'Hãng không công bố'),
(4, 3, 'Nam', '37 mm', 'Hợp kim', '20 mm', 'Thép không gỉ', '7.9 mm', 'Kính Sapphire', 'Hãng không công bố', '3 ATM - Rửa tay, đi mưa', 'Lịch ngày', 'Ánh sáng', 'Eco-Drive', 'Hãng không công bố'),
(5, 5, 'Nam', '37 mm', 'Hợp kim', '20 mm', 'Thép không gỉ', '7.9 mm', 'Kính Sapphire', 'Hãng không công bố', '3 ATM - Rửa tay, đi mưa', 'Lịch ngày', 'Ánh sáng', 'Eco-Drive', 'Hãng không công bố'),
(6, 6, 'Nam', '37 mm', 'Hợp kim', '20 mm', 'Thép không gỉ', '7.9 mm', 'Kính Sapphire', 'Hãng không công bố', '3 ATM - Rửa tay, đi mưa', 'Lịch ngày', 'Ánh sáng', 'Eco-Drive', 'Hãng không công bố'),
(7, 7, 'Nam', '37 mm', 'Hợp kim', '20 mm', 'Thép không gỉ', '7.9 mm', 'Kính Sapphire', 'Hãng không công bố', '3 ATM - Rửa tay, đi mưa', 'Lịch ngày', 'Ánh sáng', 'Eco-Drive', 'Hãng không công bố'),
(8, 8, 'Nam', '37 mm', 'Hợp kim', '20 mm', 'Thép không gỉ', '7.9 mm', 'Kính Sapphire', 'Hãng không công bố', '3 ATM - Rửa tay, đi mưa', 'Lịch ngày', 'Ánh sáng', 'Eco-Drive', 'Hãng không công bố'),
(9, 9, 'Nam', '37 mm', 'Hợp kim', '20 mm', 'Thép không gỉ', '7.9 mm', 'Kính Sapphire', 'Hãng không công bố', '3 ATM - Rửa tay, đi mưa', 'Lịch ngày', 'Ánh sáng', 'Eco-Drive', 'Hãng không công bố'),
(10, 10, 'Nam', '37 mm', 'Hợp kim', '20 mm', 'Thép không gỉ', '7.9 mm', 'Kính Sapphire', 'Hãng không công bố', '3 ATM - Rửa tay, đi mưa', 'Lịch ngày', 'Ánh sáng', 'Eco-Drive', 'Hãng không công bố'),
(11, 11, 'Nữ', '37 mm', 'Hợp kim', '20 mm', 'Thép không gỉ', '7.9 mm', 'Kính Sapphire', 'Hãng không công bố', '3 ATM - Rửa tay, đi mưa', 'Lịch ngày', 'Ánh sáng', 'Eco-Drive', 'Hãng không công bố'),
(12, 12, 'Nữ', '37 mm', 'Hợp kim', '20 mm', 'Thép không gỉ', '7.9 mm', 'Kính Sapphire', 'Hãng không công bố', '3 ATM - Rửa tay, đi mưa', 'Lịch ngày', 'Ánh sáng', 'Eco-Drive', 'Hãng không công bố'),
(13, 13, 'Nữ', '37 mm', 'Hợp kim', '20 mm', 'Thép không gỉ', '7.9 mm', 'Kính Sapphire', 'Hãng không công bố', '3 ATM - Rửa tay, đi mưa', 'Lịch ngày', 'Ánh sáng', 'Eco-Drive', 'Hãng không công bố'),
(14, 14, 'Nam', '37 mm', 'Hợp kim', '20 mm', 'Thép không gỉ', '7.9 mm', 'Kính Sapphire', 'Hãng không công bố', '3 ATM - Rửa tay, đi mưa', 'Lịch ngày', 'Ánh sáng', 'Eco-Drive', 'Hãng không công bố'),
(15, 15, 'Nữ', '37 mm', 'Hợp kim', '20 mm', 'Thép không gỉ', '7.9 mm', 'Kính Sapphire', 'Hãng không công bố', '3 ATM - Rửa tay, đi mưa', 'Lịch ngày', 'Ánh sáng', 'Eco-Drive', 'Hãng không công bố'),
(16, 16, 'Nữ', '37 mm', 'Hợp kim', '20 mm', 'Thép không gỉ', '7.9 mm', 'Kính Sapphire', 'Hãng không công bố', '3 ATM - Rửa tay, đi mưa', 'Lịch ngày', 'Ánh sáng', 'Eco-Drive', 'Hãng không công bố'),
(17, 17, 'Nữ', '37 mm', 'Hợp kim', '20 mm', 'Thép không gỉ', '7.9 mm', 'Kính Sapphire', 'Hãng không công bố', '3 ATM - Rửa tay, đi mưa', 'Lịch ngày', 'Ánh sáng', 'Eco-Drive', 'Hãng không công bố'),
(18, 18, 'Nữ', '37 mm', 'Hợp kim', '20 mm', 'Thép không gỉ', '7.9 mm', 'Kính Sapphire', 'Hãng không công bố', '3 ATM - Rửa tay, đi mưa', 'Lịch ngày', 'Ánh sáng', 'Eco-Drive', 'Hãng không công bố'),
(19, 19, 'Nam', '37 mm', 'Hợp kim', '20 mm', 'Thép không gỉ', '7.9 mm', 'Kính Sapphire', 'Hãng không công bố', '3 ATM - Rửa tay, đi mưa', 'Lịch ngày', 'Ánh sáng', 'Eco-Drive', 'Hãng không công bố'),
(20, 20, 'Nữ', '37 mm', 'Hợp kim', '20 mm', 'Thép không gỉ', '7.9 mm', 'Kính Sapphire', 'Hãng không công bố', '3 ATM - Rửa tay, đi mưa', 'Lịch ngày', 'Ánh sáng', 'Eco-Drive', 'Hãng không công bố'),
(21, 56, 'Unisex', NULL, 'Da', '20 mm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Hãng không công bố'),
(22, 57, 'Unisex', NULL, 'Hợp kim', '20 mm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Hãng không công bố'),
(23, 58, 'Unisex', NULL, 'Hợp kim', '20 mm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Hãng không công bố'),
(24, 59, 'Unisex', NULL, 'Hợp kim', '20 mm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Hãng không công bố'),
(25, 60, 'Unisex', NULL, 'Hợp kim', '20 mm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Hãng không công bố'),
(26, 61, 'Unisex', NULL, 'Hợp kim', '20 mm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Hãng không công bố'),
(27, 62, 'Unisex', NULL, 'Hợp kim', '20 mm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Hãng không công bố'),
(28, 63, 'Unisex', NULL, 'Hợp kim', '20 mm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Hãng không công bố'),
(29, 64, 'Unisex', NULL, 'Hợp kim', '20 mm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Hãng không công bố'),
(30, 65, 'Unisex', NULL, 'Hợp kim', '20 mm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Hãng không công bố');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_images`
--

CREATE TABLE `product_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image_path`, `created_at`) VALUES
(1, 1, 'dhn1-1.jpg', '2025-08-04 14:32:40'),
(2, 1, 'dhn1-2.jpg', '2025-08-04 14:32:40'),
(3, 1, 'dhn1-3.jpg', '2025-08-04 14:32:40'),
(4, 1, 'dhn1-4.jpg', '2025-08-04 14:32:40'),
(5, 1, 'dhn1-5.jpg', '2025-08-04 14:32:40'),
(7, 2, 'dhn2-2.jpg', '2025-08-04 15:06:59'),
(8, 2, 'dhn2-3.jpg', '2025-08-04 15:06:59'),
(9, 2, 'dhn2-4.jpg', '2025-08-04 15:06:59'),
(10, 2, 'dhn2-5.jpg', '2025-08-04 15:06:59'),
(12, 2, 'dhn2-7.jpg', '2025-08-04 15:06:59'),
(14, 3, 'dhn3-1.jpg', '2025-08-04 15:55:45'),
(15, 3, 'dhn3-2.jpg', '2025-08-04 15:55:45'),
(16, 3, 'dhn3-3.jpg', '2025-08-04 15:55:45'),
(17, 3, 'dhn3-4.jpg', '2025-08-04 15:55:45'),
(18, 3, 'dhn3-5.jpg', '2025-08-04 15:55:45'),
(19, 3, 'dhn3-6.jpeg', '2025-08-04 15:55:45'),
(20, 4, 'dhn4-1.jpg', '2025-08-07 11:37:54'),
(21, 4, 'dhn4-2.jpg', '2025-08-07 11:37:54'),
(22, 4, 'dhn4-3.jpg', '2025-08-07 11:37:54'),
(23, 4, 'dhn4-4.jpg', '2025-08-07 11:37:54'),
(24, 4, 'dhn4-5.jpg', '2025-08-07 11:37:54'),
(25, 4, 'dhn4-6.jpg', '2025-08-07 11:37:54');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_news`
--

CREATE TABLE `product_news` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `summary` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product_news`
--

INSERT INTO `product_news` (`id`, `title`, `summary`, `content`, `image`, `created_at`) VALUES
(1, 'Top 5 đồng hồ bán chạy tháng 8', 'Khám phá các mẫu đồng hồ hot nhất hiện nay...', 'Nội dung chi tiết ở đây...', 'news1.png', '2025-08-06 23:02:58'),
(2, 'Xu hướng đồng hồ thông minh 2025', 'Những mẫu smart watch đang làm mưa làm gió...', 'Nội dung chi tiết ở đây...', 'news2.png', '2025-08-06 23:02:58'),
(3, 'Top 5 đồng hồ bán chạy tháng 9', 'Khám phá các mẫu đồng hồ hot nhất tháng này được người dùng ưa chuộng nhất...', '2025\r\n\r\n🎯 Giới thiệu\r\nTrong tháng 8 và đầu tháng 9, thị trường đồng hồ ghi nhận sự tăng trưởng mạnh mẽ với doanh số vượt bậc ở nhiều phân khúc. Dẫn đầu xu hướng là những mẫu đồng hồ vừa có thiết kế tinh tế, độ bền cao, vừa phù hợp với phong cách sống hiện đại và đa dạng.\r\n\r\nDưới đây là top 5 mẫu đồng hồ được người tiêu dùng lựa chọn nhiều nhất tại hệ thống trong tháng 9:\r\n\r\n1. ⌚ Casio G-Shock GA-2100\r\nLý do bán chạy: Thiết kế thể thao, khả năng chống sốc và chống nước tuyệt vời, phù hợp với giới trẻ năng động.\r\n\r\nGiá bán: ~3.200.000đ\r\nĐiểm nổi bật:\r\nKhung vỏ carbon siêu nhẹ\r\nPin dùng 3-5 năm\r\nPhù hợp cả nam và nữ\r\n\r\n2. ⌚ Seiko 5 Sports Automatic\r\nLý do bán chạy: Đồng hồ cơ giá tốt, thiết kế cổ điển pha hiện đại, nổi bật với độ hoàn thiện cao trong tầm giá.\r\n\r\nGiá bán: ~5.800.000đ\r\nĐiểm nổi bật:\r\nMáy tự động bền bỉ (caliber 4R36)\r\nMặt kính Hardlex chống xước\r\nLịch ngày-thứ rõ ràng\r\n\r\n3. ⌚ Orient Bambino Gen 4\r\nLý do bán chạy: Dòng dresswatch quốc dân, đẹp - sang - giá hợp lý, phù hợp dân văn phòng và nam giới trung niên.\r\n\r\nGiá bán: ~4.900.000đ\r\nĐiểm nổi bật:\r\nThiết kế kính cong cổ điển\r\nMáy cơ tự động chuẩn Nhật\r\nĐường kính phù hợp cổ tay người Việt\r\n\r\n4. ⌚ Citizen Eco-Drive AW1231-58E\r\nLý do bán chạy: Không cần thay pin, năng lượng ánh sáng thân thiện môi trường, thiết kế sang trọng.\r\n\r\nGiá bán: ~5.300.000đ\r\nĐiểm nổi bật:\r\nBộ máy Eco-Drive siêu bền\r\nDây kim loại chống gỉ\r\nMặt số tối giản, dễ nhìn\r\n\r\n5. ⌚ Xiaomi Watch S3\r\nLý do bán chạy: Smartwatch mới ra mắt, giá rẻ, tính năng phong phú, thiết kế đẹp.\r\n\r\nGiá bán: ~2.500.000đ\r\nĐiểm nổi bật:\r\nTheo dõi sức khỏe, nhịp tim, giấc ngủ\r\nGiao diện tùy biến\r\nTương thích tốt với Android/iOS\r\n\r\n📌 Tổng kết\r\n5 mẫu đồng hồ trên là đại diện tiêu biểu cho các dòng sản phẩm từ cơ - pin - năng lượng ánh sáng - thông minh, đáp ứng mọi nhu cầu người dùng từ thời trang, công việc đến thể thao, công nghệ.\r\n\r\nHãy theo dõi chuyên mục Tin tức sản phẩm hàng tháng để cập nhật những mẫu hot nhất, chương trình khuyến mãi hấp dẫn và mẹo chọn đồng hồ phù hợp với bạn.\r\n\r\n', 'news3.png', '2025-08-06 23:11:37'),
(4, 'Xu hướng đồng hồ thông minh năm 2025', 'Những mẫu smartwatch đang làm mưa làm gió trong giới công nghệ hiện nay...', '📱 Xu Hướng Đồng Hồ Thông Minh Năm 2025\r\nNăm 2025 đánh dấu bước nhảy vọt của ngành công nghiệp đồng hồ thông minh, khi các thương hiệu lớn không chỉ tập trung vào thiết kế mà còn tích hợp các công nghệ AI, cảm biến sinh học, và khả năng tương tác sâu với hệ sinh thái công nghệ.\r\n\r\n🔥 Những cái tên dẫn đầu xu hướng\r\n1. Apple Watch Series 10\r\nApple tiếp tục giữ vững vị thế tiên phong với thiết kế mỏng nhẹ, viền cong tràn cạnh và màn hình MicroLED siêu sắc nét.\r\n\r\nSeries 10 được trang bị AI sức khỏe cá nhân, theo dõi giấc ngủ chuyên sâu, đo mức độ stress, và dự đoán chu kỳ sinh học.\r\n\r\nHỗ trợ tính năng “Health Coach” tự động đề xuất lịch tập luyện và nghỉ ngơi dựa trên dữ liệu sinh học hằng ngày.\r\n\r\n2. Samsung Galaxy Watch Ultra\r\nSamsung ra mắt dòng Ultra với thiết kế mạnh mẽ, pin ấn tượng lên đến 5 ngày.\r\n\r\nCảm biến nhiệt độ da, đo huyết áp, điện tâm đồ (ECG) được cải tiến với độ chính xác cao hơn.\r\n\r\nĐồng hồ có thể đồng bộ trực tiếp với Samsung SmartThings để điều khiển nhà thông minh.\r\n\r\n3. Garmin Venu 4X\r\nHướng tới người dùng thể thao và dã ngoại chuyên nghiệp.\r\n\r\nTích hợp GPS siêu chính xác, cảnh báo mất nước, theo dõi VO2 Max và phục hồi cơ bắp.\r\n\r\nGiao diện đơn giản, pin lên tới 2 tuần.\r\n\r\n🤖 Tích hợp AI – Xu hướng chủ đạo\r\nKhông chỉ đơn thuần là thiết bị theo dõi sức khỏe, đồng hồ thông minh năm 2025 còn:\r\n\r\nHọc thói quen người dùng để tối ưu thông báo, ứng dụng và thời lượng pin.\r\n\r\nGợi ý hành vi dựa trên nhịp sinh học: nhắc nghỉ ngơi, uống nước, thiền...\r\n\r\nHỗ trợ điều khiển bằng giọng nói AI mạnh hơn, dịch ngôn ngữ theo thời gian thực (real-time translation).\r\n\r\n🌍 Thiết kế và thời trang cũng lên ngôi\r\nĐồng hồ không chỉ là công cụ công nghệ mà còn trở thành phụ kiện thời trang cao cấp.\r\n\r\nXu hướng mặt tròn quay lại mạnh mẽ, dây đeo có thể thay đổi dễ dàng (modular strap).\r\n\r\nMàu sắc pastel, vỏ titan, dây sợi tái chế thân thiện môi trường được ưa chuộng.\r\n\r\n📌 Kết luận\r\nĐồng hồ thông minh năm 2025 không còn chỉ là công cụ theo dõi thể chất mà trở thành trợ lý cá nhân thông minh trên cổ tay. Với khả năng hiểu và phản hồi người dùng ngày càng sâu sắc, chúng hứa hẹn sẽ trở thành một phần không thể thiếu trong cuộc sống hiện đại.\r\n\r\n👉 Nếu bạn đang tìm kiếm một chiếc đồng hồ thông minh vừa thời trang, vừa hỗ trợ sức khỏe toàn diện – 2025 là năm lý tưởng để nâng cấp!\r\n\r\n', 'news4.jpg', '2025-08-06 23:11:37'),
(5, 'Mẹo chọn đồng hồ phù hợp với từng dịp', 'Đồng hồ không chỉ là công cụ xem giờ mà còn là phụ kiện thời trang...', 'Bạn nên chọn đồng hồ dây da cho dịp trang trọng, đồng hồ thể thao cho hoạt động ngoài trời và smartwatch cho công việc hằng ngày...', 'news5.jpg', '2025-08-06 23:11:37'),
(6, 'So sánh đồng hồ cơ và đồng hồ điện tử', 'Hai loại đồng hồ phổ biến nhất hiện nay, bạn nên chọn loại nào?', 'Đồng hồ cơ mang nét cổ điển và đẳng cấp, trong khi đồng hồ điện tử hiện đại, đa chức năng và dễ dùng. Cùng phân tích ưu/nhược điểm của từng loại...', 'news6.jpg', '2025-08-06 23:11:37');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `rating` tinyint(1) NOT NULL,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `reviews`
--

INSERT INTO `reviews` (`id`, `product_id`, `customer_name`, `rating`, `comment`, `created_at`) VALUES
(1, 1, 'khang', 5, 'sản phẩm đẹp', '2025-03-22 07:10:25'),
(3, 1, 'khang tran', 3, 'hơi tệ', '2025-03-22 07:37:39'),
(4, 1, 'phong', 5, 'tốt', '2025-03-22 07:43:03'),
(5, 6, 'phong tran', 2, 'được', '2025-03-22 08:13:04'),
(6, 6, 'khang tran', 5, 'sản phẩm đẹp lắm', '2025-07-10 14:22:20'),
(10, 1, 'Trần Lê Khang', 4, 'Tốt\r\n', '2025-08-12 04:28:51');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sales_report`
--

CREATE TABLE `sales_report` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `total_sales` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `sales_report`
--

INSERT INTO `sales_report` (`id`, `date`, `total_sales`) VALUES
(1, '0000-00-00', 1500000.00);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `stock_history`
--

CREATE TABLE `stock_history` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `change_quantity` int(11) NOT NULL,
  `change_type` enum('in','out') NOT NULL,
  `change_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `import_price` decimal(10,2) DEFAULT NULL,
  `export_price` decimal(10,2) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `stock_history`
--

INSERT INTO `stock_history` (`id`, `product_id`, `change_quantity`, `change_type`, `change_date`, `import_price`, `export_price`, `user_id`) VALUES
(61, 1, 1, 'in', '2025-07-16 14:12:41', 4200000.00, NULL, 2),
(63, 1, 1, 'out', '2025-07-16 14:23:31', NULL, 4500000.00, 2),
(64, 1, 2, 'in', '2025-07-23 14:13:27', 4500000.00, NULL, 2),
(65, 1, 3, 'in', '2025-08-04 15:42:38', 2962000.00, NULL, 2),
(66, 1, 10, 'in', '2025-08-05 08:41:19', 2926000.00, NULL, 2),
(67, 2, 10, 'in', '2025-08-07 09:24:00', 900000.00, NULL, 2),
(68, 3, 5, 'in', '2025-08-07 09:28:33', 1500000.00, NULL, 2),
(69, 5, 5, 'in', '2025-08-07 09:29:47', 3300000.00, NULL, 8),
(75, 1, 10, 'in', '2025-08-12 15:57:53', 2962000.00, NULL, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('customer','admin','staff') DEFAULT 'customer',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `avatar` varchar(255) DEFAULT NULL,
  `gender` enum('Nam','Nữ','Khác') DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `birthday` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`, `is_deleted`, `created_at`, `avatar`, `gender`, `address`, `phone`, `birthday`) VALUES
(2, 'admin', 'admin@123.com', '$2y$10$DzT83V1nUZw5tAL7TSGgYOHiRQpfJB0QTdo.K95C.vSY1X9WnKFtu', 'admin', 0, '2024-11-25 15:16:38', '', NULL, NULL, NULL, NULL),
(5, 'khang123', 'tiktoktrend772003@gmail.com', '$2y$10$cTVQhB/G4ffimm7mZywKiOFU765msM3qhXHvVhaHWAZx5T4h0vD7y', 'customer', 0, '2025-03-21 12:26:35', '', NULL, NULL, NULL, NULL),
(7, 'b2105617', 'tranlekhang2003@gmail.com', '$2y$10$2mjDhyJlgXXjtI65pjA0cug3moFTrzFRvG1rjL7aE2jNsANe0llMq', 'customer', 0, '2025-03-21 17:38:12', 'admin/uploads/user/1754225020_ss_cc9d63cac270bfc60ff323948475100758d57e01.1920x1080.jpg', 'Nam', 'Ấp 1, xã Vị Thanh 1, Thành phố Cần Thơ', '0967898241', '2003-07-07'),
(8, 'Khang', 'phuong01258386050@gmail.com', '$2y$10$E833pLOzYVsZ701rQpMD0.6vbjvh1Yv/7qoIMFOlvReL2WIcaef8W', 'staff', 0, '2025-03-22 06:46:35', '', NULL, '', '', '0000-00-00'),
(10, 'sat', 'sat123@gmail.com', '$2y$10$c9/vphNR4K8971eEz/5qje3AokbOlMZgJd9Fa50Or9JLVoQcNoWpS', 'staff', 0, '2025-07-13 11:44:28', NULL, NULL, '', '', '0000-00-00'),
(11, 'Phương', 'phuong0102@gmail.com', '$2y$10$1oHu6p/ZiPWoYQheM2Z7beuHG4fxprMYnPHyNERxMqNkcopyiAwfe', 'staff', 0, '2025-07-16 14:15:15', '', NULL, '', '', '0000-00-00'),
(15, 'khangtranle', 'trankhang332003@gmail.com', '$2y$10$SBy7ONL0yeiYLr6w0ax1mOKUxAzcsANWhbKcawQQvsqvP1ohnJB5S', 'customer', 0, '2025-08-02 16:59:25', '', NULL, '', '', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_discount_codes`
--

CREATE TABLE `user_discount_codes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `discount_code_id` int(11) NOT NULL,
  `used` tinyint(1) DEFAULT 0,
  `saved_at` datetime DEFAULT current_timestamp(),
  `used_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user_discount_codes`
--

INSERT INTO `user_discount_codes` (`id`, `user_id`, `discount_code_id`, `used`, `saved_at`, `used_at`) VALUES
(2, 5, 1, 1, '2025-07-29 13:48:53', '2025-07-29 13:49:08'),
(6, 15, 1, 0, '2025-08-07 17:24:10', NULL),
(9, 5, 3, 0, '2025-08-12 19:16:47', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vnpay_transactions`
--

CREATE TABLE `vnpay_transactions` (
  `id` int(11) NOT NULL,
  `txn_ref` varchar(255) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `status` varchar(50) DEFAULT 'pending',
  `response_code` varchar(10) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `vnpay_transactions`
--

INSERT INTO `vnpay_transactions` (`id`, `txn_ref`, `order_id`, `amount`, `status`, `response_code`, `message`, `created_at`) VALUES
(22, '5_1755022868', 5, 927000, 'success', '00', '', '2025-08-13 01:21:08');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_cart` (`user_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `receiver_id` (`receiver_id`);

--
-- Chỉ mục cho bảng `discount_codes`
--
ALTER TABLE `discount_codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_orders_user` (`user_id`);

--
-- Chỉ mục cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `fk_order_items_product` (`product_id`);

--
-- Chỉ mục cho bảng `payment_logs`
--
ALTER TABLE `payment_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_brand` (`brand_id`),
  ADD KEY `fk_category` (`category_id`);

--
-- Chỉ mục cho bảng `product_details`
--
ALTER TABLE `product_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `product_news`
--
ALTER TABLE `product_news`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `sales_report`
--
ALTER TABLE `sales_report`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `stock_history`
--
ALTER TABLE `stock_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `fk_user_stock` (`user_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user_discount_codes`
--
ALTER TABLE `user_discount_codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_discount` (`user_id`,`discount_code_id`),
  ADD KEY `fk_discount` (`discount_code_id`);

--
-- Chỉ mục cho bảng `vnpay_transactions`
--
ALTER TABLE `vnpay_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `chat_messages`
--
ALTER TABLE `chat_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `discount_codes`
--
ALTER TABLE `discount_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT cho bảng `payment_logs`
--
ALTER TABLE `payment_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT cho bảng `product_details`
--
ALTER TABLE `product_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `product_news`
--
ALTER TABLE `product_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `sales_report`
--
ALTER TABLE `sales_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `stock_history`
--
ALTER TABLE `stock_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `user_discount_codes`
--
ALTER TABLE `user_discount_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `vnpay_transactions`
--
ALTER TABLE `vnpay_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD CONSTRAINT `chat_messages_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chat_messages_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `fk_order_items_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `payment_logs`
--
ALTER TABLE `payment_logs`
  ADD CONSTRAINT `payment_logs_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_brand` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  ADD CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Các ràng buộc cho bảng `product_details`
--
ALTER TABLE `product_details`
  ADD CONSTRAINT `product_details_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `stock_history`
--
ALTER TABLE `stock_history`
  ADD CONSTRAINT `fk_user_stock` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `user_discount_codes`
--
ALTER TABLE `user_discount_codes`
  ADD CONSTRAINT `fk_discount` FOREIGN KEY (`discount_code_id`) REFERENCES `discount_codes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `vnpay_transactions`
--
ALTER TABLE `vnpay_transactions`
  ADD CONSTRAINT `vnpay_transactions_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
