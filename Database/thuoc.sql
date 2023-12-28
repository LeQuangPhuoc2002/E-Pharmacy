-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 26, 2023 lúc 05:30 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `thuoc`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL,
  `admin_username` varchar(255) NOT NULL,
  `admin_password` varchar(255) NOT NULL,
  `phonenumber` varchar(15) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `admins`
--

INSERT INTO `admins` (`admin_id`, `admin_username`, `admin_password`, `phonenumber`, `email`, `name`) VALUES
(1, 'phuoc', '202cb962ac59075b964b07152d234b70', '9999999999', 'phuoc@gmail.com', 'Quang Phuoc'),
(2, 'nhan', '202cb962ac59075b964b07152d234b70', '1111111111', 'nhan@gmail.com', 'Thanh Nhan');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `cart`
--

INSERT INTO `cart` (`cart_id`, `user_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart_item`
--

CREATE TABLE `cart_item` (
  `cart_item_id` int(11) NOT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `cart_item`
--

INSERT INTO `cart_item` (`cart_item_id`, `cart_id`, `product_id`, `quantity`) VALUES
(4, 2, 38, 3),
(5, 2, 5, 2),
(6, 2, 2, 1),
(7, 2, 1, 1),
(8, 13, 1, 1),
(9, 14, 1, 1),
(35, 5, 5, 36),
(36, 3, 3, 4),
(37, 6, 6, 6),
(41, 18, 2, 3),
(42, 18, 1, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_image` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `category_image`) VALUES
(1, 'Thuốc kháng dị ấn', 'image1.jpeg'),
(2, 'Thuốc cảm lạnh', 'image2.jpeg'),
(3, 'Thuốc da liễu', 'image3.jpeg'),
(4, 'Thuốc Mắt/Tai/Mũi', 'image4.jpeg'),
(5, 'Giảm đau/hạ sốt', 'image5.jpg'),
(6, 'Thuốc thần kinh', 'image6.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `CommentID` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `CommentText` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`CommentID`, `user_id`, `product_id`, `CommentText`) VALUES
(1, 1, 1, 'sản phẩm này tuyệt với quá'),
(2, 1, 1, 'sadasd'),
(3, 1, 1, 'sadasd'),
(4, 15, 1, 'sdasdsad'),
(5, 18, 1, 'sản phẩm tạm được'),
(6, 18, 2, 'hay lắm'),
(7, 18, 2, 'tạm được'),
(8, 18, 3, 'ádasdasd'),
(9, 1, 8, 'dfdsfds'),
(10, 15, 3, 'sản phẩm này rất tuêtj'),
(11, 15, 57, 'được quá shop ơi'),
(12, 15, 53, 'dấdassad'),
(13, 1, 6, 'quá tuyệt'),
(14, 15, 57, 'he\r\n'),
(15, 15, 74, 'Oke thuốc tốt quá shop ơi'),
(16, 1, 1, 'dsasdas');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order`
--

INSERT INTO `order` (`order_id`, `user_id`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_detail`
--

CREATE TABLE `order_detail` (
  `order_detail_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order_detail`
--

INSERT INTO `order_detail` (`order_detail_id`, `order_id`, `product_id`, `quantity`) VALUES
(5, 1, 1, 2),
(6, 1, 1, 2),
(7, 1, 3, 2),
(8, 1, 3, 2),
(9, 1, 35, 1),
(10, 2, 32, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `price`, `category_id`, `image`, `description`, `quantity`) VALUES
(1, 'Agilodin 10g (Hộp 10 vỉ x 10 viên)', 11, 1, 'image1.webp', 'Agilodin 10g là một sản phẩm chăm sóc sức khỏe hàng đầu được thiết kế để giúp giảm triệu chứng cảm lạnh và dường như không có tác dụng phụ.', 100),
(2, 'Descallerg (Hộp 1 vỉ x 10 viên)', 8, 1, 'image2.webp', 'Descallerg là một sản phẩm chuyên dụng để giảm các triệu chứng dị ứng một cách hiệu quả, giúp bạn thoải mái hơn trong mùa dịch.', 150),
(3, 'Bostanex (Hộp 3 vỉ x 10 viên)', 16, 1, 'image3.webp', 'Bostanex là một sản phẩm dùng để hỗ trợ hệ tiêu hóa và giảm các vấn đề liên quan đến dạ dày.', 120),
(4, 'Cetimed 10mg (Hộp 1 vỉ x 10 viên)', 13, 1, 'image4.webp', 'Cetimed 10mg là một loại thuốc chống dị ứng có thể giúp giảm các triệu chứng như sổ mũi, ngứa mắt và hắt hơi.', 80),
(5, 'Zyrtec 60ml (Hộp 1 chai)', 25, 1, 'image5.webp', 'Zyrtec 60ml là một dung dịch chống dị ứng dùng cho trẻ em, giúp giảm các triệu chứng như ngứa và sổ mũi.', 90),
(6, 'Clorpheniramin (Hộp 10 vỉ x 20 viên)', 19, 1, 'image6.webp', 'Clorpheniramin là một loại thuốc chống dị ứng có thể giúp giảm các triệu chứng như nổi mẩn, ngứa và sổ mũi.', 110),
(7, 'Desbebe (Chai 60ml)', 14, 1, 'image7.webp', 'Desbebe là một sản phẩm chăm sóc da dành cho trẻ em, giúp giữ ẩm và bảo vệ da khỏi các vấn đề như khô da và kích ứng.', 70),
(8, 'Fegra 120mg (Hộp 1 vỉ x 10 viên)', 10, 1, 'image8.webp', 'Fegra 120mg là một loại thuốc chống dị ứng có thể giúp giảm các triệu chứng như ngứa, đau và đỏ do dị ứng.', 130),
(9, 'Fegra 180 (Hộp 1 vỉ x 10 viên)', 12, 1, 'image9.webp', 'Fegra 180 là một loại thuốc chống dị ứng mạnh mẽ, phù hợp cho những người có các triệu chứng nặng.', 100),
(10, 'Gimfastnew 180 (Hộp 2 vỉ x 10 viên)', 29, 1, 'image10.webp', 'Gimfastnew 180 là một sản phẩm chăm sóc sức khỏe chuyên sâu, giúp giảm triệu chứng dị ứng một cách hiệu quả.', 80),
(11, 'Acetylcystein 200 Imexpharm (10 vỉ x 10 viên)', 16, 2, 'image11.webp', 'Acetylcystein 200 Imexpharm là một loại thuốc chống vi khuẩn và giảm đau, thường được sử dụng để điều trị bệnh nhiễm trùng.', 90),
(12, 'Acetylcystein (Hộp 10 vỉ x 10 viên)', 13, 2, 'image12.webp', 'Acetylcystein là một chất làm sạch phổi và giúp loại bỏ đàm đặc trong trường hợp viêm phổi hoặc các vấn đề về đường hô hấp.', 120),
(13, 'AcetylCystein Boston 200 (Hộp 30 gói)', 20, 2, 'image13.webp', 'AcetylCystein Boston 200 là một loại thuốc chống vi khuẩn và giảm đau, thường được sử dụng để điều trị bệnh nhiễm trùng.', 80),
(14, 'Becacold-E (Hộp 5 vỉ x 20 viên)', 17, 2, 'image14.webp', 'Becacold-E là một sản phẩm đa tác dụng, giúp giảm cảm lạnh, đau nhức và làm dịu cảm giác khó chịu.', 110),
(15, 'Becacold-S (Hộp 5 vỉ x 20 viên)', 19, 2, 'image15.webp', 'Becacold-S là một sản phẩm đa tác dụng, giúp giảm cảm lạnh, đau nhức và làm dịu cảm giác khó chịu.', 100),
(16, 'Bổ phế TW 3( 125ml)', 22, 2, 'image16.webp', 'Bổ phế TW 3 là một sản phẩm bổ sung dưỡng chất, giúp cung cấp năng lượng và hỗ trợ sức khỏe toàn diện.', 90),
(17, 'Brometic 2mg/10ml (4 vỉ x 5 ống x 10ml)', 14, 2, 'image17.webp', 'Brometic là một loại thuốc dùng để điều trị ho và các vấn đề liên quan đến đường hô hấp.', 120),
(18, 'Halixol (Chai 100ml)', 20, 2, 'image18.webp', 'Halixol là một loại siro dùng để giảm triệu chứng ho, đặc biệt hiệu quả trong trường hợp ho đờm.', 80),
(19, 'Siro Prospan (chai 100ml)', 17, 2, 'image19.jpg', 'Siro Prospan là một sản phẩm siro tự nhiên, giúp giảm triệu chứng ho và làm dịu cảm giác khó chịu trong họng.', 110),
(20, 'Siro trị ho Bạch Ngân PV (Chai 100ml)', 22, 2, 'image20.webp', 'Siro trị ho Bạch Ngân PV là một sản phẩm truyền thống, được sử dụng để giảm triệu chứng ho và kích thích sự thông thoáng đường hô hấp.', 100),
(21, 'Avircrem 5g (Hộp 1 tuýp)', 8, 3, 'image21.webp', 'Avircrem 5g là một loại kem chống vi khuẩn, được sử dụng để điều trị các vấn đề da như viêm nhiễm và kích ứng.', 90),
(22, 'Betadine Antiseptic Sol 10% (Chai 125ml)', 15, 3, 'image22.webp', 'Betadine Antiseptic Sol 10% là một dung dịch chống nhiễm khuẩn, thích hợp để sử dụng trên vết thương và da bị tổn thương.', 80),
(23, 'Biafine (Hộp 1 tuýp 93g)', 20, 3, 'image23.webp', 'Biafine là một loại kem dưỡng da chăm sóc da sau khi bị tổn thương hoặc cháy nắng, giúp tái tạo và làm dịu da.', 100),
(24, 'Calamine Leopard Brand (Chai 60ml)', 13, 3, 'image24.webp', 'Calamine Leopard Brand là một loại sáng da và chống ngứa, thích hợp cho việc điều trị vết thương nhẹ và kích ứng da.', 110),
(25, 'Canesten Cream 10g (Hộp 1 tuýp)', 10, 3, 'image25.webp', 'Canesten Cream 10g là một loại kem chống nấm, được sử dụng để điều trị các vấn đề nấm da như nấm ngứa.', 120),
(26, 'Alcool 90 độ (Chai 60ml)', 5, 3, 'image26.webp', 'Alcool 90 độ là một dung dịch chống khuẩn, thường được sử dụng để làm sạch vết thương hoặc bề mặt da.', 130),
(27, 'Xanh Methylen 1% (chai 20ml)', 9, 3, 'image27.webp', 'Xanh Methylen 1% là một loại dung dịch chống khuẩn và chống nhiễm trùng, thường được sử dụng trong quá trình phẫu thuật và chăm sóc da.', 70),
(28, 'Remos Anti-Itch (Tuýp 10g)', 6, 3, 'image28.webp', 'Remos Anti-Itch là một loại kem chống ngứa, giúp giảm cảm giác ngứa và kích thích da.', 90),
(29, 'LeoPovidone 2g (Tuýp 20g)', 8, 3, 'image29.webp', 'LeoPovidone 2g là một loại kem chống nhiễm khuẩn, thích hợp để sử dụng trên vết thương và da bị tổn thương.', 80),
(30, 'Calcrem (tuýp 15g)', 9, 3, 'image30.webp', 'Calcrem là một loại kem chăm sóc da, giúp làm dịu và tái tạo da, phù hợp cho việc sử dụng hàng ngày.', 100),
(31, 'Benita (Chai xịt 120 liều)', 15, 4, 'image31.webp', 'Benita là một sản phẩm xịt họng chăm sóc sức khỏe, giúp giảm cảm lạnh và đau họng một cách hiệu quả.', 90),
(32, 'Boric 3% (Chai 10ml)', 8, 4, 'image32.webp', 'Boric 3% là một loại dung dịch chăm sóc mắt, thích hợp để làm sạch và dưỡng mắt.', 80),
(33, 'Natri Clorid 0.9% (10ml)', 8, 4, 'image33.webp', 'Natri Clorid 0.9% là một loại dung dịch dùng để làm sạch và dưỡng mắt, phù hợp cho việc sử dụng hàng ngày.', 100),
(34, 'Vrohto For Kid (13ml)', 9, 4, 'image34.webp', 'Vrohto For Kid là một loại thuốc nhỏ mắt dành cho trẻ em, giúp giảm mệt mắt và kích thích sự thoải mái.', 110),
(35, 'Daigaku (Lọ 15ml)', 12, 4, 'image35.webp', 'Daigaku là một sản phẩm chăm sóc mắt, giúp giảm mệt mắt và cung cấp dưỡng chất cho mắt.', 120),
(36, 'Systane (15ml)', 13, 4, 'image36.webp', 'Systane là một loại thuốc nhỏ mắt dùng để giảm cảm giác khô và mệt mắt.', 130),
(37, 'Thuốc nhỏ mắt Optive (15ml)', 15, 4, 'image37.webp', 'Thuốc nhỏ mắt Optive là một loại dung dịch dùng để giảm cảm giác khô và kích thích sự thoải mái cho mắt.', 90),
(38, 'VRohto Lycee (13ml)', 13, 4, 'image38.webp', 'VRohto Lycee là một sản phẩm chăm sóc mắt, giúp giảm mệt mắt và kích thích sự thoải mái.', 80),
(39, 'Vrohto Antibacterial Drop (13ml)', 15, 4, 'image39.webp', 'Vrohto Antibacterial Drop là một loại thuốc nhỏ mắt chống khuẩn, giúp giảm nguy cơ nhiễm trùng.', 100),
(40, 'Otrivin 0.05% 10ml (Hộp 1 chai)', 11, 4, 'image40.webp', 'Otrivin 0.05% là một loại thuốc nhỏ mũi, giúp giảm ngứa và nghẹt mũi một cách hiệu quả.', 120),
(41, 'Agiparofen 525mg (Hộp 5 vỉ x 10 viên)', 6, 5, 'image41.webp', 'Agiparofen 525mg là một loại thuốc giảm đau và hạ sốt hiệu quả, phù hợp cho cả người lớn và trẻ em.', 80),
(42, 'Bidivon 400mg (Hộp 10 vỉ x 10 viên)', 8, 5, 'image42.webp', 'Bidivon 400mg là một sản phẩm chăm sóc sức khỏe hàng đầu được thiết kế để giúp giảm triệu chứng cảm lạnh và dường như không có tác dụng phụ.', 120),
(43, 'Bosfen 400 (Hộp 5 vỉ x 10 viên)', 12, 5, 'image43.webp', 'Bosfen 400 là một loại thuốc chống vi khuẩn và giảm đau, thường được sử dụng để điều trị các vấn đề nhiễm trùng.', 100),
(44, 'Glotadol Extra (Hộp 10 vỉ x 10 viên)', 15, 5, 'image44.webp', 'Glotadol Extra là một loại thuốc chống đau mạnh mẽ, phù hợp cho những người có đau cơ và xương.', 90),
(45, 'Hapacol 325 (Hộp 1 chai x 100 viên)', 22, 5, 'image45.webp', 'Hapacol 325 là một sản phẩm giảm đau và hạ sốt hiệu quả, thích hợp cho người trưởng thành.', 110),
(46, 'Lessenol Extra (Hộp 10 vỉ x 10 viên)', 17, 5, 'image46.webp', 'Lessenol Extra là một loại thuốc giảm đau và hạ sốt, giúp giảm các triệu chứng khó chịu.', 70),
(47, 'Lessenol 500 (Hộp 10 vỉ x 10 viên)', 13, 5, 'image47.webp', 'Lessenol 500 là một loại thuốc giảm đau và hạ sốt, giúp giảm các triệu chứng khó chịu.', 100),
(48, 'Paralmax Extra (Hộp 15 vỉ x 12 viên)', 19, 5, 'image48.webp', 'Paralmax Extra là một loại thuốc giảm đau và hạ sốt mạnh mẽ, phù hợp cho những người có triệu chứng nặng.', 80),
(49, 'Panadol Extra Optizorb (Hộp 12 vỉ x 10 viên)', 15, 5, 'image49.jpg', 'Panadol Extra Optizorb là một loại thuốc giảm đau và hạ sốt hiệu quả, thích hợp cho người trưởng thành.', 90),
(50, 'Sirô điều trị giảm các chứng cảm thông thường Tiffy (30ml)', 12, 5, 'image50.webp', 'Sirô điều trị giảm các chứng cảm thông thường Tiffy là một sản phẩm tự nhiên giúp giảm các triệu chứng cảm lạnh.', 120),
(51, 'Aleucin 500mg (Hộp 3 vỉ x 10 viên)', 10, 6, 'image51.webp', 'Aleucin 500mg là một loại thuốc bổ sung chất dinh dưỡng, giúp cung cấp năng lượng và hỗ trợ sức khỏe toàn diện.', 90),
(52, 'Giloba (Hộp 3 vỉ x 10 viên)', 11, 6, 'image52.webp', 'Giloba là một loại thuốc hỗ trợ tuần hoàn máu, giúp cải thiện trí não và tăng cường trí nhớ.', 80),
(53, 'Hoạt huyết dưỡng não (Hộp 1 vỉ x 20 viên)', 14, 6, 'image53.webp', 'Hoạt huyết dưỡng não là một sản phẩm chăm sóc sức khỏe dành cho não, giúp tăng cường sự tỉnh táo và tập trung.', 100),
(54, 'Tebonin 120mg (Hộp 2 vỉ x 15 viên)', 15, 6, 'image54.webp', 'Tebonin 120mg là một loại thuốc hỗ trợ tuần hoàn máu, giúp tăng cường sự linh hoạt của máu và oxy trong cơ thể.', 110),
(55, 'Stilux-60 (Hộp 10 vỉ x 10 viên)', 19, 6, 'image55.webp', 'Stilux-60 là một loại thuốc giảm đau và làm dịu cảm giác đau nhanh chóng, thích hợp cho những người có các vấn đề về đau nhức cơ xương.', 70),
(56, 'Tanganil 500mg (3 vỉ x 10 viên)', 14, 6, 'image56.webp', 'Tanganil 500mg là một loại thuốc bổ sung axit amin, giúp cung cấp năng lượng và hỗ trợ sức khỏe toàn diện.', 90),
(57, 'Ginkor Fort Cap (Hộp 3 vỉ x 10 viên)', 17, 6, 'image57.webp', 'Ginkor Fort Cap là một loại thuốc hỗ trợ tuần hoàn máu, giúp cải thiện sự linh hoạt và giảm mệt mỏi chân.', 80),
(58, 'Hoạt huyết Nhất Nhất (3 vỉ x 10 viên/hộp)', 20, 6, 'image58.jpg', 'Hoạt huyết Nhất Nhất là một sản phẩm chăm sóc sức khỏe dành cho cơ thể, giúp kích thích sự hoạt động của máu.', 100),
(59, 'Vasoclean Sol 10ml (Hộp 2 vỉ x 10 ống)', 13, 6, 'image59.webp', 'Vasoclean Sol 10ml là một loại dung dịch hỗ trợ làm sạch và bảo vệ mắt, giúp duy trì sự thoải mái cho đôi mắt.', 120),
(60, 'Tanakan (Hộp 2 vỉ x 15 viên)', 15, 6, 'image60.jpg', 'Tanakan là một loại thuốc hỗ trợ tuần hoàn máu, giúp tăng cường sự linh hoạt và giảm nguy cơ các vấn đề về trí nhớ.', 90),
(71, 'Lê Phước', 2, 3, 'image4_2.png', 'sdasd', 3),
(74, 'thuốc ba sao', 300, 2, 'image4_3.png', 'Thuốc này rất tốt nha mọi người', 30),
(75, 'thuốc đâu đầu', 10, 3, 'a1212.png', 'sản phẩm này rất tuyệt', 30);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phonenumber` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `phonenumber`, `name`, `email`) VALUES
(1, 'tin', '202cb962ac59075b964b07152d234b70', '1234567890', 'Nguyen Tin', 'tin@gmail.com'),
(2, 'sang', '202cb962ac59075b964b07152d234b70', '9876543210', 'Xuan Sang', 'sang@gmail.com'),
(3, 'Minh', '202cb962ac59075b964b07152d234b70', '777777777', 'Nhat Minh', 'minh@gmail.com'),
(5, '123', '202cb962ac59075b964b07152d234b70', '123', 'Iphone 19', '123'),
(6, 'thanh', '202cb962ac59075b964b07152d234b70', '321', 'thanh', 'thanh@gmail.com'),
(7, 'non', '202cb962ac59075b964b07152d234b70', '1231231231', 'non', 'non@gmail.com'),
(8, 'nin', '202cb962ac59075b964b07152d234b70', '132321321', 'nin', 'nin@gmail.com'),
(9, 'npn', '202cb962ac59075b964b07152d234b70', '1231231232', 'npn', 'npn@gmail.com'),
(10, 'mom', '202cb962ac59075b964b07152d234b70', 'mom', 'mom', 'mom@gmail.com'),
(11, 'mưm', '202cb962ac59075b964b07152d234b70', '3232323232', 'mqm', 'mưm@gmail.com'),
(12, 'ew', '202cb962ac59075b964b07152d234b70', '3231231231312', 'ew', 'ew@gmail.com'),
(13, 'NguyenVanHung', '202cb962ac59075b964b07152d234b70', '88888888888', 'NguyenVanHung', 'hung@gmail.com'),
(14, 'lethiba', '202cb962ac59075b964b07152d234b70', '123131231', 'lethiba', 'hai@gmail.com'),
(15, 'Phước', 'd8ac68ab0e90be76d76dfff37ce60dfc', '100094080573830668316', 'Phước Lê Quang', '20t1020652@husc.edu.vn'),
(16, 'Đạt', 'c35db5562b1686e54290497cf20cb882', '103419631334948565884', 'Đạt Lê Quang', '22t1020065@husc.edu.vn'),
(17, 'Trần Hữu Nhật', 'b743adaad72066b6988723dd0f565a6f', '100490354243692270736', 'Trần Hữu Nhật Minh', '20t1020460@husc.edu.vn'),
(18, 'dungggg', '202cb962ac59075b964b07152d234b70', '3333332323', 'dunggg', 'dungggg@gmail.com'),
(19, 'Tín', '942c06548008af5831218ce798dace59', '113171407385834088765', 'Tín Nguyễn Văn', '20t1020110@husc.edu.vn');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `cart_item`
--
ALTER TABLE `cart_item`
  ADD PRIMARY KEY (`cart_item_id`),
  ADD KEY `cart_id` (`cart_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`CommentID`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`order_detail_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `cart_item`
--
ALTER TABLE `cart_item`
  MODIFY `cart_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `CommentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `order_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Các ràng buộc cho bảng `cart_item`
--
ALTER TABLE `cart_item`
  ADD CONSTRAINT `cart_item_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`),
  ADD CONSTRAINT `cart_item_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Các ràng buộc cho bảng `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Các ràng buộc cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`),
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
