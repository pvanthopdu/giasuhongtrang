-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th9 09, 2019 lúc 04:19 AM
-- Phiên bản máy phục vụ: 10.1.26-MariaDB
-- Phiên bản PHP: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `giasuhongtrang`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `accounts_major`
--

CREATE TABLE `accounts_major` (
  `id` int(11) NOT NULL,
  `name_major` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `accounts_major`
--

INSERT INTO `accounts_major` (`id`, `name_major`) VALUES
(6, 'Giáo viên Toán'),
(7, 'Giáo viên hóa'),
(8, 'Giáo viên tin học'),
(9, 'Giao viên tiếng anh');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `accounts_profile`
--

CREATE TABLE `accounts_profile` (
  `id` int(11) NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `birthdate` date DEFAULT NULL,
  `role` smallint(5) UNSIGNED DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `gender` longtext COLLATE utf8_unicode_ci NOT NULL,
  `infor` longtext COLLATE utf8_unicode_ci NOT NULL,
  `major_id` int(11) DEFAULT NULL,
  `point` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `accounts_profile`
--

INSERT INTO `accounts_profile` (`id`, `image`, `location`, `birthdate`, `role`, `user_id`, `gender`, `infor`, `major_id`, `point`) VALUES
(1, 'profile/tho_4x6_2Eqj6lQ.jpg', 'Quang Ngai', '1985-05-30', 2, 1, 'Mr', 'Tôi là Phạm Văn Tho, tốt nghiệp Đại học Bách Khoa Đà Nẵng ngành Công nghệ thông tin năm 2009. Hiện đang giảng dạy tại Đại học Phạm Văn Đồng.', 8, 0),
(2, 'profile/trang_hong_2j2tlUW.jpg', 'Quang Ngai', '2019-06-08', 2, 2, 'Mrs', 'Tôi là Nguyễn Thị Hồng Trang, tốt nghiệp sư phạm Hóa Đại học sư pham Quy Nhơn năm 2013. Hiện đang giảng dạy trong TP Quảng Ngãi. Đã có nhiều năm kinh nghiệm trong giảng dạy, ôn thi TN THPT, luyện thi đại học.', 7, 0),
(3, 'profile/trinh_vo_DLUm3pn.jpg', 'Quang Ngai', '1985-05-30', 2, 3, 'Mrs', 'Tôi là Võ Thị Trinh, tốt nghiệp ngành sư phạm toán trường Đại học Quy Nhơn năm 2011. Tôi đã có nhiều năm giảng dạy toán cấp 2, 3, ôn thi TN và luyện thi đại học.', 6, 0),
(4, 'profile/trinh_VHu3RGI.jpg', 'Quang Ngai', NULL, 2, 4, 'Miss', 'Tôi là Nguyễn Thị Hồng Trinh, đã có nhiều năm kinh nghiệm trong giảng dạy', 9, 0),
(5, 'profile/default.jpg', '', NULL, NULL, 5, '', '', NULL, 0),
(7, 'profile/default.jpg', '', NULL, NULL, 7, '', '', NULL, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(62, 'Nhom 01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add answer', 7, 'add_answer'),
(26, 'Can change answer', 7, 'change_answer'),
(27, 'Can delete answer', 7, 'delete_answer'),
(28, 'Can view answer', 7, 'view_answer'),
(29, 'Can add carousel slide', 8, 'add_carouselslide'),
(30, 'Can change carousel slide', 8, 'change_carouselslide'),
(31, 'Can delete carousel slide', 8, 'delete_carouselslide'),
(32, 'Can view carousel slide', 8, 'view_carouselslide'),
(33, 'Can add category', 9, 'add_category'),
(34, 'Can change category', 9, 'change_category'),
(35, 'Can delete category', 9, 'delete_category'),
(36, 'Can view category', 9, 'view_category'),
(37, 'Can add comment_lesson', 10, 'add_comment_lesson'),
(38, 'Can change comment_lesson', 10, 'change_comment_lesson'),
(39, 'Can delete comment_lesson', 10, 'delete_comment_lesson'),
(40, 'Can view comment_lesson', 10, 'view_comment_lesson'),
(41, 'Can add Liên hệ', 11, 'add_contact'),
(42, 'Can change Liên hệ', 11, 'change_contact'),
(43, 'Can delete Liên hệ', 11, 'delete_contact'),
(44, 'Can view Liên hệ', 11, 'view_contact'),
(45, 'Can add course', 12, 'add_course'),
(46, 'Can change course', 12, 'change_course'),
(47, 'Can delete course', 12, 'delete_course'),
(48, 'Can view course', 12, 'view_course'),
(49, 'Can add lesson', 13, 'add_lesson'),
(50, 'Can change lesson', 13, 'change_lesson'),
(51, 'Can delete lesson', 13, 'delete_lesson'),
(52, 'Can view lesson', 13, 'view_lesson'),
(53, 'Can add practice', 14, 'add_practice'),
(54, 'Can change practice', 14, 'change_practice'),
(55, 'Can delete practice', 14, 'delete_practice'),
(56, 'Can view practice', 14, 'view_practice'),
(57, 'Can add questions', 15, 'add_questions'),
(58, 'Can change questions', 15, 'change_questions'),
(59, 'Can delete questions', 15, 'delete_questions'),
(60, 'Can view questions', 15, 'view_questions'),
(61, 'Can add Bài đánh giá kết thúc bài học', 16, 'add_quiz_lesson'),
(62, 'Can change Bài đánh giá kết thúc bài học', 16, 'change_quiz_lesson'),
(63, 'Can delete Bài đánh giá kết thúc bài học', 16, 'delete_quiz_lesson'),
(64, 'Can view Bài đánh giá kết thúc bài học', 16, 'view_quiz_lesson'),
(65, 'Can add quiz_lesson_ user_do', 17, 'add_quiz_lesson_user_do'),
(66, 'Can change quiz_lesson_ user_do', 17, 'change_quiz_lesson_user_do'),
(67, 'Can delete quiz_lesson_ user_do', 17, 'delete_quiz_lesson_user_do'),
(68, 'Can view quiz_lesson_ user_do', 17, 'view_quiz_lesson_user_do'),
(69, 'Can add quiz_ score_ lesson', 18, 'add_quiz_score_lesson'),
(70, 'Can change quiz_ score_ lesson', 18, 'change_quiz_score_lesson'),
(71, 'Can delete quiz_ score_ lesson', 18, 'delete_quiz_score_lesson'),
(72, 'Can view quiz_ score_ lesson', 18, 'view_quiz_score_lesson'),
(73, 'Can add register_course', 19, 'add_register_course'),
(74, 'Can change register_course', 19, 'change_register_course'),
(75, 'Can delete register_course', 19, 'delete_register_course'),
(76, 'Can view register_course', 19, 'view_register_course'),
(77, 'Can add Danh sách đăng ký tham gia khóa học', 20, 'add_register_course_temp'),
(78, 'Can change Danh sách đăng ký tham gia khóa học', 20, 'change_register_course_temp'),
(79, 'Can delete Danh sách đăng ký tham gia khóa học', 20, 'delete_register_course_temp'),
(80, 'Can view Danh sách đăng ký tham gia khóa học', 20, 'view_register_course_temp'),
(81, 'Can add review_course', 21, 'add_review_course'),
(82, 'Can change review_course', 21, 'change_review_course'),
(83, 'Can delete review_course', 21, 'delete_review_course'),
(84, 'Can view review_course', 21, 'view_review_course'),
(85, 'Can add review_lesson', 22, 'add_review_lesson'),
(86, 'Can change review_lesson', 22, 'change_review_lesson'),
(87, 'Can delete review_lesson', 22, 'delete_review_lesson'),
(88, 'Can view review_lesson', 22, 'view_review_lesson'),
(89, 'Can add profile', 23, 'add_profile'),
(90, 'Can change profile', 23, 'change_profile'),
(91, 'Can delete profile', 23, 'delete_profile'),
(92, 'Can view profile', 23, 'view_profile'),
(93, 'Can add major', 24, 'add_major'),
(94, 'Can change major', 24, 'change_major'),
(95, 'Can delete major', 24, 'delete_major'),
(96, 'Can view major', 24, 'view_major'),
(97, 'Can add do practice', 25, 'add_dopractice'),
(98, 'Can change do practice', 25, 'change_dopractice'),
(99, 'Can delete do practice', 25, 'delete_dopractice'),
(100, 'Can view do practice', 25, 'view_dopractice'),
(101, 'Can add library image', 26, 'add_libraryimage'),
(102, 'Can change library image', 26, 'change_libraryimage'),
(103, 'Can delete library image', 26, 'delete_libraryimage'),
(104, 'Can view library image', 26, 'view_libraryimage'),
(105, 'Can add custom_group', 27, 'add_custom_group'),
(106, 'Can change custom_group', 27, 'change_custom_group'),
(107, 'Can delete custom_group', 27, 'delete_custom_group'),
(108, 'Can view custom_group', 27, 'view_custom_group'),
(109, 'Can add calendar_ group', 28, 'add_calendar_group'),
(110, 'Can change calendar_ group', 28, 'change_calendar_group'),
(111, 'Can delete calendar_ group', 28, 'delete_calendar_group'),
(112, 'Can view calendar_ group', 28, 'view_calendar_group'),
(113, 'Can add student_ group', 29, 'add_student_group'),
(114, 'Can change student_ group', 29, 'change_student_group'),
(115, 'Can delete student_ group', 29, 'delete_student_group'),
(116, 'Can view student_ group', 29, 'view_student_group');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$120000$8P8U4BlMayFU$1fDHBq1yQGbHDIar1UIFHIVdEAY6ZqlzZV7s8Rq5qjc=', '2019-08-18 01:16:48.000000', 1, 'pvantho', 'Phạm Văn', 'Tho', 'pvantho@gmail.com', 1, 1, '2019-06-08 03:09:13.000000'),
(2, 'pbkdf2_sha256$120000$ydUkOZ9tQF9l$m4ggOLESf5uzcGJ6hr+6juFR2xxVK9YtzTgven4oh38=', '2019-06-08 03:42:31.000000', 0, 'tranghong', 'Nguyễn Thị', 'Hồng Trang', 'sakeopa@gmail.com', 0, 1, '2019-06-08 03:39:34.000000'),
(3, 'pbkdf2_sha256$120000$W9BnJNRci8Am$d7WyGpeI/ZJENxjeYCq4xjLso+P6n8I6aA4SEMfW+Gw=', '2019-06-08 03:46:46.000000', 0, 'trinhvo', 'Võ Thị', 'Trinh', 'sakeopa@gmail.com', 0, 1, '2019-06-08 03:44:05.000000'),
(4, 'pbkdf2_sha256$120000$3uAsCvHUum4g$X5Ke+mfECD3uXdMDEgJjdzUr9YTXPi3fKTMB9/3aRL4=', '2019-06-08 03:48:31.000000', 0, 'hongtrinh', 'Nguyễn Thị', 'Hồng Tring', 'sakeopa@gmail.com', 0, 1, '2019-06-08 03:48:09.000000'),
(5, 'pbkdf2_sha256$120000$3JxqJdeJJdxf$GGMhlDOwrAgYschvdl9ydJWqGElwEEyPkb7fq12pF4c=', '2019-06-15 06:53:40.469372', 1, 'thopham', '', '', 'pvantho@gmail.com', 1, 1, '2019-06-15 06:53:16.014132'),
(7, 'pbkdf2_sha256$120000$OfrFVoY9GBBw$6hn9xpGspymzsLr5TpzQyuGYi9uU49nLB4Zrd3MpYBA=', '2019-09-07 02:05:56.219392', 1, 'nhucuong', '', '', 'nhucuong@gmail.com', 1, 1, '2019-09-07 02:05:41.922566');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2019-06-08 03:09:53.620992', '6', 'Giáo viên Toán', 1, '[{\"added\": {}}]', 24, 1),
(2, '2019-06-08 03:10:00.644413', '7', 'Giáo viên hóa', 1, '[{\"added\": {}}]', 24, 1),
(3, '2019-06-08 03:10:07.390900', '8', 'Giáo viên tin học', 1, '[{\"added\": {}}]', 24, 1),
(4, '2019-06-08 03:10:15.287875', '9', 'Giao viên tiếng anh', 1, '[{\"added\": {}}]', 24, 1),
(5, '2019-06-08 03:28:03.882803', '6', 'Hóa học 8', 1, '[{\"added\": {}}]', 12, 1),
(6, '2019-06-08 03:31:42.233508', '6', 'Hóa học 8', 1, '[{\"added\": {}}]', 21, 1),
(7, '2019-06-08 03:39:01.418827', '1', 'pvantho', 2, '[{\"changed\": {\"fields\": [\"first_name\", \"last_name\"]}}, {\"changed\": {\"name\": \"profile\", \"object\": \"pvantho\", \"fields\": [\"infor\", \"birthdate\", \"gender\", \"image\", \"location\", \"role\", \"major\"]}}]', 4, 1),
(8, '2019-06-08 03:39:34.879024', '2', 'tranghong', 1, '[{\"added\": {}}]', 4, 1),
(9, '2019-06-08 03:42:35.586904', '2', 'tranghong', 2, '[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\", \"last_login\"]}}, {\"changed\": {\"name\": \"profile\", \"object\": \"tranghong\", \"fields\": [\"infor\", \"birthdate\", \"gender\", \"location\", \"role\", \"major\"]}}]', 4, 1),
(10, '2019-06-08 03:43:13.330092', '2', 'tranghong', 2, '[{\"changed\": {\"name\": \"profile\", \"object\": \"tranghong\", \"fields\": [\"image\"]}}]', 4, 1),
(11, '2019-06-08 03:44:05.715932', '3', 'trinhvo', 1, '[{\"added\": {}}]', 4, 1),
(12, '2019-06-08 03:47:01.620226', '3', 'trinhvo', 2, '[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\", \"last_login\"]}}, {\"changed\": {\"name\": \"profile\", \"object\": \"trinhvo\", \"fields\": [\"infor\", \"birthdate\", \"gender\", \"image\", \"location\", \"role\", \"major\"]}}]', 4, 1),
(13, '2019-06-08 03:48:10.169781', '4', 'hongtrinh', 1, '[{\"added\": {}}]', 4, 1),
(14, '2019-06-08 03:49:32.562494', '4', 'hongtrinh', 2, '[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\", \"last_login\"]}}, {\"changed\": {\"name\": \"profile\", \"object\": \"hongtrinh\", \"fields\": [\"infor\", \"gender\", \"image\", \"location\", \"role\", \"major\"]}}]', 4, 1),
(15, '2019-06-08 06:41:22.788192', '7', 'Hóa học 9', 1, '[{\"added\": {}}]', 12, 1),
(16, '2019-06-08 06:58:14.460956', '8', 'Hóa học 10', 1, '[{\"added\": {}}]', 12, 1),
(17, '2019-06-08 09:35:31.784204', '1', 'Nguyên tử', 1, '[{\"added\": {}}]', 13, 1),
(18, '2019-06-08 09:41:27.455093', '2', 'Đơn chất, hợp chất', 1, '[{\"added\": {}}]', 13, 1),
(19, '2019-06-08 14:23:58.732346', '1', 'Nguyên tử', 2, '[{\"changed\": {\"fields\": [\"lesson_order\"]}}]', 13, 1),
(20, '2019-06-08 14:24:08.044513', '2', 'Đơn chất, hợp chất', 2, '[{\"changed\": {\"fields\": [\"lesson_order\"]}}]', 13, 1),
(21, '2019-06-09 08:09:11.537944', '1', 'Nguyên tử', 2, '[]', 13, 1),
(22, '2019-06-09 08:15:09.495119', '1', 'Nguyên tử', 2, '[{\"changed\": {\"fields\": [\"lesson_video\"]}}]', 13, 1),
(23, '2019-06-09 08:15:52.342176', '1', 'Nguyên tử', 2, '[{\"changed\": {\"fields\": [\"lesson_doc\"]}}]', 13, 1),
(24, '2019-06-09 08:58:49.255966', '1', 'Nguyên tử', 2, '[]', 13, 1),
(25, '2019-06-10 08:45:00.451544', '1', 'Bài 1', 1, '[{\"added\": {}}]', 14, 1),
(26, '2019-06-14 07:00:16.973722', '1', 'Nguyên tử', 2, '[{\"changed\": {\"fields\": [\"lesson_image\"]}}]', 13, 1),
(27, '2019-06-14 15:16:54.261472', '1', 'pvantho', 2, '[{\"changed\": {\"name\": \"profile\", \"object\": \"pvantho\", \"fields\": [\"image\"]}}]', 4, 1),
(28, '2019-06-14 15:49:51.944127', '1', 'pvantho', 2, '[]', 4, 1),
(29, '2019-06-15 06:55:04.486346', '1', 'pvantho', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 5),
(30, '2019-06-15 07:16:00.311627', '5', 'pvantho Hóa học 10', 3, '', 19, 1),
(31, '2019-06-15 07:16:00.320125', '4', 'pvantho Hóa học 9', 3, '', 19, 1),
(32, '2019-06-15 07:16:00.325124', '1', 'pvantho Hóa học 8', 3, '', 19, 1),
(33, '2019-06-15 09:00:42.208959', '7', 'Hóa học 9', 2, '[{\"changed\": {\"fields\": [\"course_students\"]}}]', 12, 1),
(34, '2019-06-15 09:02:33.950549', '8', 'Hóa học 10', 2, '[{\"changed\": {\"fields\": [\"course_students\"]}}]', 12, 1),
(35, '2019-06-15 09:04:49.565987', '7', 'Hóa học 9', 2, '[{\"changed\": {\"fields\": [\"course_students\"]}}]', 12, 1),
(36, '2019-06-16 13:02:27.126191', '6', 'Hóa học 8', 2, '[]', 21, 1),
(37, '2019-06-18 08:16:08.519643', '7', 'Hóa học 9', 2, '[]', 12, 1),
(38, '2019-06-18 08:18:53.940167', '7', 'Hóa học 9', 2, '[]', 12, 1),
(39, '2019-06-18 08:19:36.284373', '8', 'Hóa học 10', 2, '[]', 12, 1),
(40, '2019-06-18 08:23:14.448546', '1', 'Nguyên tử', 2, '[]', 13, 1),
(41, '2019-06-18 08:23:22.144740', '2', 'Đơn chất, hợp chất', 2, '[]', 13, 1),
(42, '2019-06-18 08:52:46.374712', '8', 'Hóa học 10', 2, '[{\"changed\": {\"fields\": [\"star1\"]}}]', 21, 1),
(44, '2019-07-10 13:51:11.161750', '7', 'pvantho-Hóa học 10', 3, '', 19, 1),
(45, '2019-07-10 14:15:33.998761', '5', 'Quảng Ngãi', 3, '', 20, 1),
(46, '2019-07-10 14:15:34.011459', '4', 'Quảng Ngãi', 3, '', 20, 1),
(47, '2019-07-10 14:15:34.020460', '3', 'pvantho', 3, '', 20, 1),
(48, '2019-07-10 14:15:34.024960', '2', 'Quảng Ngãi', 3, '', 20, 1),
(49, '2019-07-10 14:15:34.029457', '1', 'Quảng Ngãi', 3, '', 20, 1),
(50, '2019-07-10 23:40:58.026628', '6', 'Hóa học 8', 2, '[{\"changed\": {\"fields\": [\"course_students\"]}}]', 12, 1),
(51, '2019-07-10 23:41:11.457655', '7', 'Hóa học 9', 2, '[{\"changed\": {\"fields\": [\"course_students\"]}}]', 12, 1),
(52, '2019-07-10 23:41:23.016408', '8', 'Hóa học 10', 2, '[{\"changed\": {\"fields\": [\"course_students\"]}}]', 12, 1),
(53, '2019-07-10 23:49:48.895862', '8', 'pvantho-Hóa học 10', 3, '', 19, 1),
(54, '2019-07-10 23:49:48.913360', '6', 'pvantho-Hóa học 8', 3, '', 19, 1),
(55, '2019-07-11 07:56:40.778507', '13', 'Quảng Ngãi', 3, '', 20, 1),
(56, '2019-07-11 07:56:40.785020', '12', 'Trang Hong', 3, '', 20, 1),
(57, '2019-07-11 07:56:40.789019', '11', 'Quảng Ngãi', 3, '', 20, 1),
(58, '2019-07-11 07:56:40.803521', '10', 'pvantho', 3, '', 20, 1),
(59, '2019-07-11 07:56:40.808005', '9', 'pcanb', 3, '', 20, 1),
(60, '2019-07-11 07:56:40.812507', '8', 'pvantho', 3, '', 20, 1),
(61, '2019-07-11 07:56:40.816023', '7', 'pvantho', 3, '', 20, 1),
(62, '2019-07-11 07:56:40.820518', '6', 'pvantho', 3, '', 20, 1),
(63, '2019-07-16 09:35:57.805631', '1', 'Một giờ học ở trung tâm', 1, '[{\"added\": {}}]', 26, 1),
(64, '2019-07-16 09:36:25.797263', '2', 'Học viên tiêu biểu', 1, '[{\"added\": {}}]', 26, 1),
(65, '2019-07-16 09:36:47.519902', '3', 'Thảo luận nhóm', 1, '[{\"added\": {}}]', 26, 1),
(66, '2019-07-16 09:37:47.617144', '4', 'không gian học tập tại trung tâm', 1, '[{\"added\": {}}]', 26, 1),
(67, '2019-07-16 09:39:04.796914', '5', 'Lớp học hóa', 1, '[{\"added\": {}}]', 26, 1),
(68, '2019-07-16 09:39:46.467964', '6', 'Thực nghiệm hóa học', 1, '[{\"added\": {}}]', 26, 1),
(69, '2019-07-17 09:43:15.405133', '15', 'Nhóm hóa 8_1', 1, '[{\"added\": {}}]', 3, 1),
(70, '2019-07-17 09:46:29.166706', '15', 'Nhóm hóa 8_2', 2, '[{\"changed\": {\"fields\": [\"name\"]}}]', 3, 1),
(71, '2019-07-17 09:47:53.021134', '17', 'Nhóm hóa 8_3', 1, '[{\"added\": {}}]', 3, 1),
(72, '2019-07-17 09:49:28.254287', '18', 'Trang Hong', 1, '[{\"added\": {}}]', 3, 1),
(73, '2019-07-17 09:49:53.786882', '19', 'Tho', 1, '[{\"added\": {}}]', 3, 1),
(74, '2019-07-17 09:56:12.614391', '21', 'Quảng Ngãi', 1, '[{\"added\": {}}]', 3, 1),
(75, '2019-07-17 10:22:40.898517', '22', 'Trang Hong 22', 1, '[{\"added\": {}}]', 3, 1),
(76, '2019-07-17 10:25:16.638748', '22', 'Trang Hong 22', 3, '', 3, 1),
(77, '2019-07-17 10:25:16.648249', '21', 'Quảng Ngãi', 3, '', 3, 1),
(78, '2019-07-17 10:25:16.652247', '19', 'Tho', 3, '', 3, 1),
(79, '2019-07-17 10:25:16.656247', '18', 'Trang Hong', 3, '', 3, 1),
(80, '2019-07-17 10:25:16.660248', '17', 'Nhóm hóa 8_3', 3, '', 3, 1),
(81, '2019-07-17 10:25:16.664271', '15', 'Nhóm hóa 8_2', 3, '', 3, 1),
(82, '2019-07-17 14:02:54.447853', '25', 'Trang Hong', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"custom_group\", \"object\": \"Trang Hong\"}}]', 3, 1),
(83, '2019-07-19 00:06:09.276146', '25', 'Trang Hong', 2, '[]', 3, 1),
(84, '2019-07-19 07:40:58.130914', '27', 'Nhóm hóa 8_2', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"custom_group\", \"object\": \"Nho\\u0301m ho\\u0301a 8_2\"}}]', 3, 1),
(85, '2019-07-19 07:53:56.224133', '1', '2019-07-19', 1, '[{\"added\": {}}]', 28, 1),
(86, '2019-07-19 07:55:01.004800', '2', '2019-07-19', 1, '[{\"added\": {}}]', 28, 1),
(87, '2019-07-19 08:12:08.484602', '3', '2019-07-19', 1, '[{\"added\": {}}]', 28, 1),
(88, '2019-07-19 15:47:26.847063', '4', '2019-07-20', 1, '[{\"added\": {}}]', 28, 1),
(89, '2019-07-20 00:27:38.847771', '5', '2019-07-20:Trang Hong', 1, '[{\"added\": {}}]', 28, 1),
(90, '2019-07-20 00:30:15.586520', '28', 'Nhóm hóa 9_1', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"custom_group\", \"object\": \"Nho\\u0301m ho\\u0301a 9_1\"}}]', 3, 1),
(91, '2019-07-21 11:46:36.956663', '33', 'Quảng Ngãi 003', 3, '', 3, 1),
(92, '2019-07-21 11:46:36.963655', '31', 'Quảng Ngãi 02', 3, '', 3, 1),
(93, '2019-07-21 11:46:36.970664', '30', 'Quảng Ngãi 01', 3, '', 3, 1),
(94, '2019-07-21 11:46:36.976655', '29', 'Quảng Ngãi', 3, '', 3, 1),
(95, '2019-07-21 11:46:36.982654', '25', 'Trang Hong', 3, '', 3, 1),
(96, '2019-07-22 01:58:08.482926', '37', 'Quảng Ngãi 03', 3, '', 3, 1),
(97, '2019-07-22 01:58:08.493926', '36', 'Quảng Ngãi -2', 3, '', 3, 1),
(98, '2019-07-22 01:58:08.498428', '35', 'Trang Hong', 3, '', 3, 1),
(99, '2019-07-22 01:58:08.502924', '34', 'Quảng Ngãi', 3, '', 3, 1),
(100, '2019-07-22 01:58:08.507926', '32', 'Nhóm hóa 8_4', 3, '', 3, 1),
(101, '2019-07-22 01:58:08.512927', '28', 'Nhóm hóa 9_1', 3, '', 3, 1),
(102, '2019-07-22 01:58:08.517926', '27', 'Nhóm hóa 8_2', 3, '', 3, 1),
(103, '2019-07-22 08:51:13.563126', '40', 'Hóa hoc 8_nhóm 1', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"custom_group\", \"object\": \"Ho\\u0301a hoc 8_nho\\u0301m 1\"}}]', 3, 1),
(104, '2019-07-22 09:03:48.683513', '40', 'Hóa hoc 8_nhóm 1', 2, '[{\"added\": {\"name\": \"custom_group\", \"object\": \"Ho\\u0301a hoc 8_nho\\u0301m 1\"}}]', 3, 1),
(105, '2019-07-22 09:04:16.884989', '41', 'Hóa hoc 8_nhóm 2', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"custom_group\", \"object\": \"Ho\\u0301a hoc 8_nho\\u0301m 2\"}}]', 3, 1),
(106, '2019-07-22 09:04:29.485075', '42', 'Hóa hoc 8_nhóm 3', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"custom_group\", \"object\": \"Ho\\u0301a hoc 8_nho\\u0301m 3\"}}]', 3, 1),
(107, '2019-07-22 09:06:12.814762', '43', 'Hóa hoc 8_nhóm 4', 1, '[{\"added\": {}}]', 3, 1),
(108, '2019-07-22 09:23:21.513896', '40', 'Hóa hoc 8_nhóm 1', 2, '[{\"added\": {\"name\": \"student_ group\", \"object\": \"Ho\\u0301a hoc 8_nho\\u0301m 1\"}}, {\"added\": {\"name\": \"Li\\u0323ch ho\\u0323c nho\\u0301m\", \"object\": \"2019-07-22:Ho\\u0301a hoc 8_nho\\u0301m 1\"}}]', 3, 1),
(109, '2019-07-22 09:45:17.898116', '2', '2019-07-22:Hóa hoc 8_nhóm 1', 1, '[{\"added\": {}}]', 28, 1),
(110, '2019-07-22 09:45:49.708709', '3', '2019-07-22:Hóa hoc 8_nhóm 3', 1, '[{\"added\": {}}]', 28, 1),
(111, '2019-07-24 09:15:22.549680', '41', 'Hóa hoc 8_nhóm 2', 2, '[{\"added\": {\"name\": \"student_ group\", \"object\": \"Ho\\u0301a hoc 8_nho\\u0301m 2\"}}]', 3, 1),
(112, '2019-07-24 12:18:31.096911', '6', 'Hóa học 8', 2, '[{\"changed\": {\"fields\": [\"course_students\"]}}]', 12, 1),
(113, '2019-07-25 07:56:32.737479', '44', 'Hóa học 8_nhóm 5', 3, '', 3, 1),
(114, '2019-07-25 08:05:05.752611', '45', 'Hóa học 8_Nhóm 5', 3, '', 3, 1),
(115, '2019-07-25 08:11:54.468665', '47', 'Nhóm 6', 3, '', 3, 1),
(116, '2019-07-25 08:29:21.740637', '51', 'nhom 10', 3, '', 3, 1),
(117, '2019-07-25 08:29:21.749639', '50', 'nhoms 8', 3, '', 3, 1),
(118, '2019-07-27 14:44:02.731565', '56', 'thopha', 3, '', 3, 1),
(119, '2019-07-27 14:44:02.740934', '55', '', 3, '', 3, 1),
(120, '2019-07-27 14:44:02.749050', '54', 'thopham', 3, '', 3, 1),
(121, '2019-08-03 08:57:55.456427', '67', 'nhom 17', 3, '', 3, 1),
(122, '2019-08-03 08:57:55.463441', '66', 'nhom 16', 3, '', 3, 1),
(123, '2019-08-03 08:57:55.467429', '65', 'nhom 15', 3, '', 3, 1),
(124, '2019-08-03 08:57:55.472430', '64', 'nhom 13', 3, '', 3, 1),
(125, '2019-08-03 08:57:55.477429', '63', 'nhom 14', 3, '', 3, 1),
(126, '2019-08-03 08:57:55.481429', '59', 'Nhom 12', 3, '', 3, 1),
(127, '2019-08-03 08:57:55.484443', '58', 'Nhom 11', 3, '', 3, 1),
(128, '2019-08-03 08:57:55.488469', '57', 'Nhom 10', 3, '', 3, 1),
(129, '2019-08-03 08:57:55.492470', '53', 'Nhom 9', 3, '', 3, 1),
(130, '2019-08-03 08:57:55.497451', '52', 'Nhom 8', 3, '', 3, 1),
(131, '2019-08-03 08:57:55.501457', '49', 'Nhom 7', 3, '', 3, 1),
(132, '2019-08-03 08:57:55.505433', '48', 'Nhóm 6', 3, '', 3, 1),
(133, '2019-08-05 15:36:51.923601', '46', 'Hóa học 8_nhóm 5', 2, '[{\"added\": {\"name\": \"Li\\u0323ch ho\\u0323c nho\\u0301m\", \"object\": \"2019-08-06:Ho\\u0301a ho\\u0323c 8_nho\\u0301m 5\"}}]', 3, 1),
(134, '2019-08-05 15:39:06.935031', '46', 'Hóa học 8_nhóm 5', 2, '[{\"changed\": {\"name\": \"Li\\u0323ch ho\\u0323c nho\\u0301m\", \"object\": \"2019-08-06:Ho\\u0301a ho\\u0323c 8_nho\\u0301m 5\", \"fields\": [\"start_time\", \"end_time\"]}}]', 3, 1),
(135, '2019-08-05 15:40:26.239946', '41', 'Hóa hoc 8_nhóm 2', 2, '[{\"changed\": {\"name\": \"student_ group\", \"object\": \"Ho\\u0301a hoc 8_nho\\u0301m 2\", \"fields\": [\"member\"]}}]', 3, 1),
(136, '2019-08-05 15:40:43.441482', '41', 'Hóa hoc 8_nhóm 2', 2, '[]', 3, 1),
(137, '2019-08-05 15:41:50.694640', '42', 'Hóa hoc 8_nhóm 3', 2, '[{\"added\": {\"name\": \"student_ group\", \"object\": \"Ho\\u0301a hoc 8_nho\\u0301m 3\"}}, {\"changed\": {\"name\": \"Li\\u0323ch ho\\u0323c nho\\u0301m\", \"object\": \"2019-07-22:Ho\\u0301a hoc 8_nho\\u0301m 3\", \"fields\": [\"start_time\", \"end_time\"]}}]', 3, 1),
(138, '2019-08-05 15:42:02.443774', '43', 'Hóa hoc 8_nhóm 4', 2, '[{\"added\": {\"name\": \"student_ group\", \"object\": \"Ho\\u0301a hoc 8_nho\\u0301m 4\"}}]', 3, 1),
(139, '2019-08-05 15:43:58.743857', '42', 'Hóa hoc 8_nhóm 3', 2, '[{\"changed\": {\"name\": \"Li\\u0323ch ho\\u0323c nho\\u0301m\", \"object\": \"2019-07-22:Ho\\u0301a hoc 8_nho\\u0301m 3\", \"fields\": [\"start_time\", \"end_time\", \"users_impled\"]}}]', 3, 1),
(140, '2019-08-06 09:28:57.874285', '6', 'Hóa học 8', 2, '[]', 12, 1),
(141, '2019-08-06 09:30:12.170208', '42', 'Hóa hoc 8_nhóm 3', 2, '[{\"changed\": {\"name\": \"student_ group\", \"object\": \"Ho\\u0301a hoc 8_nho\\u0301m 3\", \"fields\": [\"member\"]}}, {\"changed\": {\"name\": \"Li\\u0323ch ho\\u0323c nho\\u0301m\", \"object\": \"2019-07-22:Ho\\u0301a hoc 8_nho\\u0301m 3\", \"fields\": [\"start_time\", \"end_time\", \"users_impled\"]}}]', 3, 1),
(142, '2019-08-06 09:36:47.803584', '6', 'Hóa học 8', 2, '[{\"changed\": {\"fields\": [\"course_students\"]}}]', 12, 1),
(143, '2019-08-06 09:37:31.313422', '42', 'Hóa hoc 8_nhóm 3', 2, '[{\"changed\": {\"name\": \"student_ group\", \"object\": \"Ho\\u0301a hoc 8_nho\\u0301m 3\", \"fields\": [\"member\"]}}, {\"changed\": {\"name\": \"Li\\u0323ch ho\\u0323c nho\\u0301m\", \"object\": \"2019-07-22:Ho\\u0301a hoc 8_nho\\u0301m 3\", \"fields\": [\"start_time\", \"end_time\", \"users_impled\"]}}]', 3, 1),
(144, '2019-08-06 09:53:24.179014', '42', 'Hóa hoc 8_nhóm 3', 2, '[{\"changed\": {\"name\": \"student_ group\", \"object\": \"Ho\\u0301a hoc 8_nho\\u0301m 3\", \"fields\": [\"member\"]}}, {\"changed\": {\"name\": \"Li\\u0323ch ho\\u0323c nho\\u0301m\", \"object\": \"2019-07-22:Ho\\u0301a hoc 8_nho\\u0301m 3\", \"fields\": [\"start_time\", \"end_time\"]}}]', 3, 1),
(145, '2019-08-08 09:28:25.659963', '46', 'Hóa học 8_nhóm 5', 2, '[{\"changed\": {\"name\": \"student_ group\", \"object\": \"Ho\\u0301a ho\\u0323c 8_nho\\u0301m 5\", \"fields\": [\"member\"]}}]', 3, 1),
(146, '2019-08-08 09:29:47.339179', '46', 'Hóa học 8_nhóm 5', 2, '[{\"changed\": {\"name\": \"Li\\u0323ch ho\\u0323c nho\\u0301m\", \"object\": \"2019-08-06:Ho\\u0301a ho\\u0323c 8_nho\\u0301m 5\", \"fields\": [\"users_impled\"]}}]', 3, 1),
(147, '2019-08-08 09:31:28.400201', '46', 'Hóa học 8_nhóm 5', 2, '[{\"added\": {\"name\": \"Li\\u0323ch ho\\u0323c nho\\u0301m\", \"object\": \"2019-08-06:Ho\\u0301a ho\\u0323c 8_nho\\u0301m 5\"}}]', 3, 1),
(148, '2019-08-10 03:09:46.296719', '58', 'Hoa hoc_nhom 15', 3, '', 3, 1),
(149, '2019-08-10 03:09:46.304721', '56', 'Hoa hoc_nhom10', 3, '', 3, 1),
(150, '2019-08-10 03:09:46.309220', '55', 'nhom 2', 3, '', 3, 1),
(151, '2019-08-10 03:09:46.313220', '54', 'nhom 1', 3, '', 3, 1),
(152, '2019-08-10 03:09:46.317223', '50', 'Nhom 19', 3, '', 3, 1),
(153, '2019-08-10 04:00:59.833455', '6', '2019-08-11:Hóa hoc 8_nhóm 1', 3, '', 28, 1),
(154, '2019-08-10 04:01:08.456436', '21', '2019-08-10:Nhóm 2', 3, '', 28, 1),
(155, '2019-08-10 04:01:16.464200', '15', '2019-08-11:Hóa hoc 8_nhóm 1', 3, '', 28, 1),
(156, '2019-08-10 04:01:23.898391', '20', '2019-08-10:Nhóm 2', 3, '', 28, 1),
(157, '2019-08-10 04:02:04.105300', '19', '2019-08-10:Nhóm 2', 3, '', 28, 1),
(158, '2019-08-10 04:02:15.087627', '13', '2019-08-11:Hóa hoc 8_nhóm 1', 3, '', 28, 1),
(159, '2019-08-10 04:02:22.619429', '11', '2019-08-11:Hóa hoc 8_nhóm 1', 3, '', 28, 1),
(160, '2019-08-10 04:22:34.300577', '24', '2019-08-10:Nhóm 2', 3, '', 28, 1),
(161, '2019-08-10 04:22:41.210173', '23', '2019-08-10:Nhóm 2', 3, '', 28, 1),
(162, '2019-08-10 04:22:48.083095', '22', '2019-08-10:Nhóm 2', 3, '', 28, 1),
(163, '2019-08-10 04:27:40.229472', '26', '2019-08-10:Nhóm 2', 3, '', 28, 1),
(164, '2019-08-10 04:27:47.567965', '25', '2019-08-10:Nhóm 2', 3, '', 28, 1),
(165, '2019-08-10 07:10:02.610978', '32', '2019-08-10:Nhóm 1', 1, '[{\"added\": {}}]', 28, 1),
(166, '2019-08-10 07:10:23.260704', '29', '2019-08-10:Nhóm 2', 3, '', 28, 1),
(167, '2019-08-10 07:10:30.322660', '31', '2019-08-10:Nhóm 2', 3, '', 28, 1),
(168, '2019-08-10 07:10:37.766569', '27', '2019-08-10:Nhóm 2', 3, '', 28, 1),
(169, '2019-08-10 07:11:14.450260', '30', '2019-08-10:Nhóm 2', 3, '', 28, 1),
(170, '2019-08-10 07:11:25.722078', '32', '2019-08-10:Nhóm 1', 3, '', 28, 1),
(171, '2019-08-10 07:11:36.493812', '8', '2019-08-11:Hóa hoc 8_nhóm 1', 2, '[]', 28, 1),
(172, '2019-08-10 07:12:03.677471', '33', '2019-08-11:Nhóm 1', 1, '[{\"added\": {}}]', 28, 1),
(173, '2019-08-10 07:12:18.893422', '33', '2019-08-11:Nhóm 1', 2, '[]', 28, 1),
(174, '2019-08-10 07:13:31.414412', '34', '2019-08-11:Nhóm 1', 1, '[{\"added\": {}}]', 28, 1),
(175, '2019-08-11 01:10:46.076302', '37', '2019-08-11:Nhóm 2', 2, '[{\"changed\": {\"fields\": [\"users_impled\"]}}]', 28, 1),
(176, '2019-08-11 01:11:23.393139', '39', '2019-08-13:Nhóm 2', 2, '[{\"changed\": {\"fields\": [\"users_impled\"]}}]', 28, 1),
(177, '2019-08-11 03:45:24.079380', '40', 'Hóa hoc 8_nhóm 1', 3, '', 3, 1),
(178, '2019-08-11 03:47:02.175463', '59', 'Nhóm 1', 2, '[{\"deleted\": {\"name\": \"Li\\u0323ch ho\\u0323c nho\\u0301m\", \"object\": \"2019-08-11:Nho\\u0301m 1\"}}, {\"deleted\": {\"name\": \"Li\\u0323ch ho\\u0323c nho\\u0301m\", \"object\": \"2019-08-11:Nho\\u0301m 1\"}}]', 3, 1),
(179, '2019-08-11 03:47:33.545706', '59', 'Nhóm 1', 2, '[{\"deleted\": {\"name\": \"Li\\u0323ch ho\\u0323c nho\\u0301m\", \"object\": \"2019-08-11:Nho\\u0301m 1\"}}, {\"deleted\": {\"name\": \"Li\\u0323ch ho\\u0323c nho\\u0301m\", \"object\": \"2019-08-11:Nho\\u0301m 1\"}}]', 3, 1),
(180, '2019-08-11 03:49:12.055870', '60', 'Nhóm 2', 3, '', 3, 1),
(181, '2019-08-11 03:49:12.062372', '59', 'Nhóm 1', 3, '', 3, 1),
(182, '2019-08-11 03:49:12.066376', '49', 'Hóa hoc 8_nhóm 8', 3, '', 3, 1),
(183, '2019-08-11 03:49:12.070376', '48', 'Hóa hoc 8_nhóm 7', 3, '', 3, 1),
(184, '2019-08-11 03:49:12.074875', '47', 'Hóa hoc 8_nhóm 6', 3, '', 3, 1),
(185, '2019-08-11 03:49:12.079375', '46', 'Hóa học 8_nhóm 5', 3, '', 3, 1),
(186, '2019-08-11 03:49:12.088901', '43', 'Hóa hoc 8_nhóm 4', 3, '', 3, 1),
(187, '2019-08-11 03:49:12.097876', '42', 'Hóa hoc 8_nhóm 3', 3, '', 3, 1),
(188, '2019-08-11 03:49:12.101878', '41', 'Hóa hoc 8_nhóm 2', 3, '', 3, 1),
(189, '2019-08-11 07:15:39.258139', '61', 'Nhóm 01', 3, '', 3, 1),
(190, '2019-08-12 23:57:49.601480', '62', 'Nhom 02', 2, '[{\"deleted\": {\"name\": \"Li\\u0323ch ho\\u0323c nho\\u0301m\", \"object\": \"2019-08-13:Nhom 02\"}}]', 3, 1),
(191, '2019-08-13 09:21:44.803524', '62', 'Nhom 02', 2, '[{\"added\": {\"name\": \"Li\\u0323ch ho\\u0323c nho\\u0301m\", \"object\": \"2019-08-13:Nhom 02\"}}]', 3, 1),
(192, '2019-08-13 09:37:08.809384', '62', 'Nhom 02', 2, '[{\"added\": {\"name\": \"Li\\u0323ch ho\\u0323c nho\\u0301m\", \"object\": \"2019-08-13:Nhom 02\"}}]', 3, 1),
(193, '2019-08-13 09:38:07.965292', '62', 'Nhom 02', 2, '[{\"added\": {\"name\": \"Li\\u0323ch ho\\u0323c nho\\u0301m\", \"object\": \"2019-08-13:Nhom 02\"}}]', 3, 1),
(194, '2019-08-13 09:39:14.050347', '62', 'Nhom 02', 2, '[{\"added\": {\"name\": \"Li\\u0323ch ho\\u0323c nho\\u0301m\", \"object\": \"2019-08-13:Nhom 02\"}}]', 3, 1),
(195, '2019-08-13 09:40:59.070923', '62', 'Nhom 02', 2, '[{\"added\": {\"name\": \"Li\\u0323ch ho\\u0323c nho\\u0301m\", \"object\": \"2019-08-13:Nhom 02\"}}, {\"added\": {\"name\": \"Li\\u0323ch ho\\u0323c nho\\u0301m\", \"object\": \"2019-08-13:Nhom 02\"}}]', 3, 1),
(196, '2019-08-13 09:44:52.563998', '62', 'Nhom 02', 2, '[{\"added\": {\"name\": \"Li\\u0323ch ho\\u0323c nho\\u0301m\", \"object\": \"2019-08-13:Nhom 02\"}}]', 3, 1),
(197, '2019-08-13 09:45:53.491217', '62', 'Nhom 02', 2, '[{\"added\": {\"name\": \"Li\\u0323ch ho\\u0323c nho\\u0301m\", \"object\": \"2019-08-13:Nhom 02\"}}]', 3, 1),
(198, '2019-08-13 09:46:44.330079', '62', 'Nhom 02', 2, '[{\"added\": {\"name\": \"Li\\u0323ch ho\\u0323c nho\\u0301m\", \"object\": \"2019-08-14:Nhom 02\"}}, {\"added\": {\"name\": \"Li\\u0323ch ho\\u0323c nho\\u0301m\", \"object\": \"2019-08-14:Nhom 02\"}}]', 3, 1),
(199, '2019-08-13 09:50:54.759366', '62', 'Nhom 02', 2, '[{\"added\": {\"name\": \"Li\\u0323ch ho\\u0323c nho\\u0301m\", \"object\": \"2019-08-13:Nhom 02\"}}, {\"added\": {\"name\": \"Li\\u0323ch ho\\u0323c nho\\u0301m\", \"object\": \"2019-08-13:Nhom 02\"}}]', 3, 1),
(200, '2019-08-13 10:07:37.094509', '62', 'Nhom 02', 2, '[{\"changed\": {\"name\": \"Li\\u0323ch ho\\u0323c nho\\u0301m\", \"object\": \"2019-08-13:Nhom 02\", \"fields\": [\"start_time\", \"end_time\"]}}, {\"changed\": {\"name\": \"Li\\u0323ch ho\\u0323c nho\\u0301m\", \"object\": \"2019-08-13:Nhom 02\", \"fields\": [\"start_time\"]}}]', 3, 1),
(201, '2019-08-14 09:45:02.869143', '62', 'Nhom 02', 2, '[{\"added\": {\"name\": \"Li\\u0323ch ho\\u0323c nho\\u0301m\", \"object\": \"2019-08-14:Nhom 02\"}}]', 3, 1),
(202, '2019-08-15 09:35:12.090059', '62', 'Nhom 01', 2, '[]', 3, 1),
(203, '2019-09-07 02:06:24.896057', '1', 'pvantho', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 7),
(204, '2019-09-07 02:07:27.471373', '2', 'Thông báo chiêu sinh-2019-03-15', 2, '[{\"changed\": {\"fields\": [\"image\"]}}]', 8, 7),
(205, '2019-09-07 02:07:40.294601', '1', 'Gia sư Hồng Trang-2019-03-15', 2, '[{\"changed\": {\"fields\": [\"image\"]}}]', 8, 7),
(206, '2019-09-07 02:08:52.821221', '6', 'Hóa học 8', 2, '[{\"changed\": {\"fields\": [\"course_image\"]}}]', 12, 7),
(207, '2019-09-07 02:09:13.087626', '7', 'Hóa học 9', 2, '[{\"changed\": {\"fields\": [\"course_image\"]}}]', 12, 7),
(208, '2019-09-07 02:09:32.002121', '8', 'Hóa học 10', 2, '[{\"changed\": {\"fields\": [\"course_image\"]}}]', 12, 7),
(209, '2019-09-07 02:11:50.015101', '1', 'pvantho', 2, '[{\"changed\": {\"name\": \"profile\", \"object\": \"Mr. Pha\\u0323m V\\u0103n Tho\", \"fields\": [\"image\"]}}]', 4, 7),
(210, '2019-09-07 02:12:21.003161', '6', 'trangohng', 3, '', 4, 7),
(211, '2019-09-07 02:14:54.076181', '2', 'tranghong', 2, '[{\"changed\": {\"name\": \"profile\", \"object\": \"Mrs. Nguy\\u00ea\\u0303n Thi\\u0323 H\\u00f4\\u0300ng Trang\", \"fields\": [\"image\"]}}]', 4, 7),
(212, '2019-09-07 02:15:15.947226', '1', 'pvantho', 2, '[{\"changed\": {\"name\": \"profile\", \"object\": \"Mr. Pha\\u0323m V\\u0103n Tho\", \"fields\": [\"image\"]}}]', 4, 7),
(213, '2019-09-07 02:15:31.759994', '4', 'hongtrinh', 2, '[{\"changed\": {\"name\": \"profile\", \"object\": \"Miss. Nguy\\u00ea\\u0303n Thi\\u0323 H\\u00f4\\u0300ng Tring\", \"fields\": [\"image\"]}}]', 4, 7),
(214, '2019-09-07 02:15:45.399812', '3', 'trinhvo', 2, '[{\"changed\": {\"name\": \"profile\", \"object\": \"Mrs. Vo\\u0303 Thi\\u0323 Trinh\", \"fields\": [\"image\"]}}]', 4, 7);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(24, 'accounts', 'major'),
(23, 'accounts', 'profile'),
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'giasu', 'answer'),
(28, 'giasu', 'calendar_group'),
(8, 'giasu', 'carouselslide'),
(9, 'giasu', 'category'),
(10, 'giasu', 'comment_lesson'),
(11, 'giasu', 'contact'),
(12, 'giasu', 'course'),
(27, 'giasu', 'custom_group'),
(25, 'giasu', 'dopractice'),
(13, 'giasu', 'lesson'),
(26, 'giasu', 'libraryimage'),
(14, 'giasu', 'practice'),
(15, 'giasu', 'questions'),
(16, 'giasu', 'quiz_lesson'),
(17, 'giasu', 'quiz_lesson_user_do'),
(18, 'giasu', 'quiz_score_lesson'),
(19, 'giasu', 'register_course'),
(20, 'giasu', 'register_course_temp'),
(21, 'giasu', 'review_course'),
(22, 'giasu', 'review_lesson'),
(29, 'giasu', 'student_group'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2019-06-08 03:06:01.424159'),
(2, 'auth', '0001_initial', '2019-06-08 03:06:02.789156'),
(3, 'accounts', '0001_initial', '2019-06-08 03:06:02.943657'),
(4, 'accounts', '0002_profile_gender', '2019-06-08 03:06:03.061163'),
(5, 'accounts', '0003_auto_20190308_1914', '2019-06-08 03:06:03.175841'),
(6, 'accounts', '0004_profile_infor', '2019-06-08 03:06:03.255226'),
(7, 'accounts', '0005_auto_20190317_1000', '2019-06-08 03:06:03.268728'),
(8, 'accounts', '0006_auto_20190601_2159', '2019-06-08 03:06:03.390775'),
(9, 'accounts', '0007_auto_20190601_2202', '2019-06-08 03:06:03.721785'),
(10, 'admin', '0001_initial', '2019-06-08 03:06:03.974780'),
(11, 'admin', '0002_logentry_remove_auto_add', '2019-06-08 03:06:03.993284'),
(12, 'admin', '0003_logentry_add_action_flag_choices', '2019-06-08 03:06:04.014782'),
(13, 'contenttypes', '0002_remove_content_type_name', '2019-06-08 03:06:04.206382'),
(14, 'auth', '0002_alter_permission_name_max_length', '2019-06-08 03:06:04.341337'),
(15, 'auth', '0003_alter_user_email_max_length', '2019-06-08 03:06:04.508334'),
(16, 'auth', '0004_alter_user_username_opts', '2019-06-08 03:06:04.524953'),
(17, 'auth', '0005_alter_user_last_login_null', '2019-06-08 03:06:04.607301'),
(18, 'auth', '0006_require_contenttypes_0002', '2019-06-08 03:06:04.614299'),
(19, 'auth', '0007_alter_validators_add_error_messages', '2019-06-08 03:06:04.632297'),
(20, 'auth', '0008_alter_user_username_max_length', '2019-06-08 03:06:04.744536'),
(21, 'auth', '0009_alter_user_last_name_max_length', '2019-06-08 03:06:04.869029'),
(22, 'giasu', '0001_initial', '2019-06-08 03:06:10.655357'),
(23, 'sessions', '0001_initial', '2019-06-08 03:06:10.744512'),
(24, 'giasu', '0002_auto_20190608_2122', '2019-06-08 14:23:18.156413'),
(25, 'giasu', '0003_auto_20190609_1003', '2019-06-09 03:03:51.231840'),
(26, 'giasu', '0004_auto_20190609_1015', '2019-06-09 03:15:38.555800'),
(27, 'giasu', '0005_auto_20190609_1038', '2019-06-09 03:38:12.860184'),
(28, 'giasu', '0006_auto_20190615_1608', '2019-06-15 09:09:01.798051'),
(29, 'giasu', '0002_dopractice', '2019-07-09 09:13:57.405658'),
(30, 'giasu', '0003_auto_20190709_1613', '2019-07-09 09:13:57.464330'),
(31, 'giasu', '0004_libraryimage', '2019-07-16 09:11:48.232279'),
(32, 'giasu', '0005_auto_20190717_0629', '2019-07-17 07:08:42.845682'),
(33, 'giasu', '0006_custom_group', '2019-07-17 07:08:43.131674'),
(34, 'giasu', '0007_auto_20190717_1642', '2019-07-17 09:42:54.323090'),
(35, 'giasu', '0008_auto_20190717_1725', '2019-07-17 10:25:32.239855'),
(36, 'giasu', '0009_auto_20190717_2102', '2019-07-17 14:02:34.804284'),
(37, 'giasu', '0010_calendar_group', '2019-07-18 07:38:32.186480'),
(38, 'giasu', '0011_auto_20190718_1443', '2019-07-18 07:43:15.449013'),
(39, 'giasu', '0012_auto_20190718_1444', '2019-07-18 07:44:14.413034'),
(40, 'giasu', '0013_auto_20190718_1453', '2019-07-18 07:53:18.201741'),
(41, 'giasu', '0014_auto_20190718_2312', '2019-07-18 16:12:27.149953'),
(42, 'giasu', '0002_auto_20190722_1526', '2019-07-22 08:27:26.171753'),
(43, 'giasu', '0002_auto_20190722_1547', '2019-07-22 08:48:00.398125'),
(44, 'giasu', '0002_auto_20190722_1556', '2019-07-22 08:56:25.024550'),
(45, 'giasu', '0003_auto_20190722_1556', '2019-07-22 08:56:40.033013'),
(46, 'giasu', '0004_auto_20190722_1558', '2019-07-22 09:00:06.343262'),
(47, 'giasu', '0002_auto_20190722_1600', '2019-07-22 09:00:57.487196'),
(48, 'giasu', '0002_auto_20190722_1603', '2019-07-22 09:03:14.892535'),
(49, 'giasu', '0003_auto_20190722_1613', '2019-07-22 09:13:24.829381'),
(50, 'giasu', '0004_auto_20190722_1643', '2019-07-22 09:44:00.666279'),
(51, 'giasu', '0005_auto_20190810_1030', '2019-08-10 03:30:53.382576'),
(52, 'giasu', '0006_auto_20190810_1040', '2019-08-10 03:41:03.351371');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('08ahzzuizcn1o6o8hrdzyotqomj8epzy', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-06 07:51:37.428071'),
('0xc91jff3stg2n610h3fog06ovhz66u6', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-01 10:15:59.156739'),
('1fuf3kw3v5yyje97t749zlrfxbmq9xzh', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-15 15:43:45.040187'),
('1khrieh9ntz0gzvm3rh51jacaicxxlt0', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-08 23:35:40.858356'),
('1lotic2vd6piv571bsyvfr5o8i7xdz1t', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-31 08:57:22.595672'),
('1r31xro0k4i4azld8q2zcwreiiisv08l', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-02 10:04:44.128191'),
('1w9c5mtyr0ul6na08fbbuouaac5ok62o', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-10 01:29:08.299230'),
('1wkvxegfzrog9cdh9hdkbu2at41hhn9q', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-15 13:41:11.658436'),
('2xcwy38lunlcztpy2bm9y1dy4hkswyc2', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-30 16:15:39.379063'),
('2yftkz6hmx8mq4vut78j21tz85kyeqbl', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-09-01 01:16:48.684679'),
('2yjgkt0wttd44r4dl5pfeaqi2myi7ecx', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-09 09:47:34.804718'),
('39bkuju3pox9tiw0ggptt69s1c08y7rx', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-31 13:26:29.374044'),
('3didqwgzykn8gmj3cg2i6flwaf3hlseo', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-29 01:13:22.969397'),
('3e6yr1bgnexpgb2wg0u01d05lcxa6cgt', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-10 09:33:15.635364'),
('40sh6qxi5puxp9fww0nvuj1c9kdbh5ax', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-28 09:03:36.282602'),
('45bp627p76bffrjmtonx485mqkap0vwj', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-07-23 09:39:19.374544'),
('49n3aaqfx6d3w5inq8igwwieumxe4cr5', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-15 08:59:44.524919'),
('4dvb73r2sxzk6d8bokmu7c7ha16fmyat', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-07-30 09:03:14.386483'),
('4emum7wvf2399ksesy7l8tbf779w0e59', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-24 08:23:50.630068'),
('4jaiw68g5147pvoeb8cilf6s5ztd6vv5', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-07 09:05:46.607481'),
('4tbjmll4f9gn3dl4bnreviral5l74ku4', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-31 10:03:38.358335'),
('50plj85s6hef041d7xzp0dg15ljz8kmu', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-29 09:03:26.953224'),
('51amjgmyh15nrdvd0kqop69962c396pg', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-08 15:18:41.069336'),
('619g9witz74pdaci2kl1vvhtqiqcaadh', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-24 00:00:45.256826'),
('6c3fj25gqcbwxribi2ugoqwxzxkang3g', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-01 09:46:42.481368'),
('6dd2znvezjvbii034gt4zlcn9ah0dtr6', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-02 16:14:50.013343'),
('7lalxl48wchn598adu2008blvgc72rvc', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-15 14:25:52.584983'),
('8b7uvf3gkmvbo35ql6ckm4p3vzhnysch', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-31 13:24:15.114689'),
('8dz8hq0x1zzyrd2ljcwhxtk03fonqfbt', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-07-24 13:53:03.724550'),
('8ie5sk0rv4hu591ohbwn1o1yitzgnehk', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-01 10:09:36.089855'),
('8lp4rom5wk556wm21zzgleokw9pc6bb9', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-24 08:11:37.729409'),
('940hlncwm4oatchz79h79ark752r5dvj', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-09 09:37:28.161844'),
('989b8voefv2pysc2m19ieel6j5vsu3f6', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-10 15:09:39.801903'),
('9a4qrylgjtj48wan90fn77kh3zb4fw4i', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-29 01:19:17.224171'),
('9ah13wjjm64gahmutblm6xumknzkglgh', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-15 13:50:52.098151'),
('9cejg1zaebtxkczdz6ip4h0vvhupbad5', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-16 07:58:04.688492'),
('atufv25fo297hn3w7ayn22epl50vndw6', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-02 14:57:18.022139'),
('b43x2kvhjo8g3zbf8bykx53080tvhvf6', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-30 09:08:10.139314'),
('bt219k0wwz4op0obvw01nsi84wj2ashd', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-08 14:08:36.003103'),
('bvb5ru7d63r5vsve4mer4wzhlv0rjvjk', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-01 09:38:58.357866'),
('cynhlpuamf1gv2su6klaic652ubnyhqm', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-04 10:14:45.643276'),
('d7coyaifyle6irzpopz9zprn1sve06s0', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-05 01:39:32.483278'),
('degrh9yr586y8ul46753ctgce1zrpi04', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-10 08:04:00.780275'),
('e8ko6lovz5oh6ccb3wlmr3xsj9gutgyt', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-24 03:00:47.603753'),
('eb849slw86jzzngjknnapz200abutr26', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-16 07:16:06.980080'),
('ee0fgf7fn88aeju2352622skq409hm7e', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-02 23:39:04.855600'),
('enzpu0jzf36du0iekndcdvqsu47w2fnn', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-15 08:23:21.356690'),
('erueya0otc5kjsmjx52dxy6vomy7pl82', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-20 09:13:46.253166'),
('ey5aob4nlqdwmp25dtliggktjhto7mmx', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-07 08:33:53.118442'),
('f3ps2usskb1hldmy5h61gd2hu07o2249', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-10 15:59:27.390874'),
('f5d6uo9oruf65ps6a79lq3c69a0eany8', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-07-24 08:30:23.862806'),
('fsiaba4ilpp10837pk8b4yszv1phxjlq', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-02 14:05:09.739400'),
('fw54sp1pxai43a2rsuwgsjvdye6ern6q', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-13 08:18:27.665053'),
('g41f2vfubt8saftz81affw0aiknj5v24', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-15 13:28:36.993947'),
('gie788eaetr54yt04eypetk73d1dt1dy', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-28 14:59:31.829835'),
('h91v3wsrk5xdg2h9s9sdnzuoyrzxryq2', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-15 09:08:04.525418'),
('hgknzxhns499tzlyctygnxc3jft7xt77', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-19 14:41:38.886886'),
('hlt1176iz5cl5lmokhzxlg89t9br2yxe', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-29 01:09:35.885694'),
('hpomhkltihyg4x5y9pot05ysxslzi3fb', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-31 09:49:54.660243'),
('i8wwqeg8clh3oi3jru9lnfo9ewce6ba1', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-07-25 16:06:36.222732'),
('ihb71geyiijhhf3l9fccqkdpr73h1lkg', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-19 15:29:45.907647'),
('iqmsyijorhgz8oiiv5eaq5byymzotvur', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-07-24 12:12:03.702510'),
('iw86jz0gq2myf5cnqgawy4g483f3d9bt', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-29 09:45:46.168481'),
('j4vggnarb235b4yqeab7p3iivolupzhw', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-07-24 08:02:42.334209'),
('jjuw4q921tc5mjaeq6x0sx79kp4mop1f', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-10 08:20:13.701095'),
('k1s0ooqqj7kbrtkkcl0ok4g4lybdi2kn', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-29 02:02:03.401636'),
('k22mlp6eq697xefdr5yqqf48lgaopdos', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-08 08:32:49.512381'),
('k5sinmuvwjamz63vf01rkjhtc4hlx3q5', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-16 07:41:04.126621'),
('k8q2urwpi34vvax80o4fblvhlnq9zniv', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-31 09:04:01.415269'),
('lrhk86ottwbetusl414zkxlzel3ltzdu', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-07-25 14:48:03.522877'),
('lt5rs0ngta61ebgsf8pfnmscqz27ruye', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-09 16:10:52.448167'),
('mdtsf5jlryq2d7n2j1y25e5pb8nsdchy', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-31 07:08:26.412218'),
('mqt42fd8v4ops3oyzv53v5dpavc9stic', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-10 08:14:37.065998'),
('mwkvnniggr0xqjgsaholdysgfqoxf3br', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-07-26 09:20:05.812570'),
('mz9c9h4cngk1x89fsaq95q4k5jkjhc3l', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-02 23:30:33.272733'),
('ng9437h9nzozebyfjpgchp16ns5h7cit', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-24 01:41:21.934940'),
('nkw5jd4jji3z8yg8ujv1xcywhi0x24oc', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-09 14:29:15.590659'),
('nnktos0ma6n43clilsd5hzzdh6pvyxe2', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-13 14:10:30.542875'),
('no883624rneoym9dfwb79pdj0bhz1p2q', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-07-24 13:57:11.778041'),
('npmjung6fkn2a3vsugnlqeld8eqv0gw6', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-10 04:24:50.864540'),
('o7q3e7k2qi8rnahzc5ejoqhchyhbucde', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-10 08:54:45.430148'),
('oupzt8mh2zid5rps325e6jod36q2auew', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-02 10:30:29.509219'),
('porxzybxg223g5154npzqv59zu36ow70', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-10 00:47:25.030532'),
('px4t3lvo54khyc4c6t8o2mgleg77c5m8', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-02 15:42:49.406253'),
('qckmeytiov4hduue1liowierjr1y82fs', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-10 09:19:28.094119'),
('qcxkhw00bixujf5qmczyksm0nao12g8r', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-29 08:00:45.340663'),
('qgmlxt2kdl1f5cbqelckdpqlq8yyk6p5', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-12 14:22:31.387203'),
('qt55l7cyfth9b3l004emyg1md475f85f', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-23 14:32:14.519998'),
('qx5kpf20jeqp75ati1sk01kelm9ld9zk', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-01 09:43:05.623208'),
('qzyp2pun6va9db7zhi5wm7rmcsb0lti3', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-31 07:52:54.634684'),
('ro74rdcvp1a9mooyvhrpmox7nkzng1bs', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-15 13:52:28.251271'),
('s55nfjzl2qdepgx04e7zpnji0j88a1z4', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-10 09:30:34.669250'),
('tt3u5bly003jx9a6kcjs8e2bvk5w6ksl', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-10 14:41:10.717520'),
('u5666lz290eai9j3ot1hsu0ukhvqihk2', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-16 07:49:19.695060'),
('u9ayhaw3pp1ikig82gdrjz65yi5j7udz', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-25 03:23:25.881086'),
('u9hkwgetfdz8kbwb8httvhyhtnqxstak', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-07 13:49:49.964268'),
('ue33rdlitaghit42h371lrhs2i23nuoc', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-02 09:55:22.280995'),
('uf5nqbx64np4t4clm77vz0z2xxq13rp3', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-31 07:28:12.976680'),
('ujn5btotbg5uspklv59ajh3j0yguf7sy', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-07-25 07:56:27.822435'),
('umjuuckenqoxzjvaixhhtrx0hwvs18tv', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-07-24 12:04:48.988457'),
('uoo3hna38r9edsvt431wikkgo83do4qa', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-10 14:44:54.948747'),
('uundqrnbycivktwzbhx4zu82z1gq5luq', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-15 15:08:53.141486'),
('vgkk7v10i2zurmujnx61cx0cwe1bv07g', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-28 15:59:28.098548'),
('vhnifomltmw07eiohrqvl3woko6onts6', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-07-24 14:19:25.193262'),
('vjo8j4tjgkbxpzr0dmmeq13k41dgaga1', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-15 08:18:03.589778'),
('w2esfr2v7e2vr0t3uwdifh2smoyzc2mw', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-13 09:30:58.672595'),
('weaefn6puru1tzokmr7r4wb55khini9u', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-13 16:04:04.297808'),
('wlujx9gan4bc060wo456oyh0i86y0uhn', 'M2Q4YWI3NDgxNDc3OTgyODY3YzJmNmY2NWRjNTgwYWI5Y2NmMTBhMDp7Il9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiY2FjOWRkMTkwZTdiNjJjYTRhZjgyNTUzZTliODE4NDMzZGExNTY2In0=', '2019-09-21 02:06:24.914056'),
('x06lna7jt9eo42m0q74r12d1bhm4qf3r', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-09 13:56:05.803069'),
('x8y1cbrji2j3yrfzl1xg95ho6c93eiq7', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-10 14:26:31.674455'),
('xc9ou7tn2i0q562nxydtkin17mrhe9p0', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-02 14:44:36.444645'),
('xhlzaotji9q44hbrvywber42gblduqdx', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-07-22 15:41:58.781958'),
('xpez1di0g4mdm0qr7iag87c8mh6xuzja', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-07 14:26:31.700048'),
('y7eraaaicwrwz47mfwpss3nty33nlhhb', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-29 08:38:39.028975'),
('yhi5sl7mfx9kz2v0c6qyftb5og834emy', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-06 08:31:51.493329'),
('yqjra0ab1t9plditzuh6h72a8dre3gob', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-22 09:28:10.920128'),
('yrc37dy2u3ti6qkw8r530fniq0mpe8m2', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-23 16:12:20.738515'),
('ze4ii07eo2xbrh7kntsd1gmu1ixivezt', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-13 15:00:14.055492'),
('zh79b7wrev478gv5mz7k0dmku2ep8scr', 'Y2FhNjg1ZTg2OTBjNjVmYmY0MTVlNDgzYWQxYjM0NzIxZTk0MDBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YzViMzFjYTFlZjc4ZmM2NTdiMzFlYTMwNGQ3MzhiMTYzYzRmYTZjIn0=', '2019-08-10 04:44:47.773202');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giasu_answer`
--

CREATE TABLE `giasu_answer` (
  `id` int(11) NOT NULL,
  `answer` longtext COLLATE utf8_unicode_ci NOT NULL,
  `weight` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giasu_calendar_group`
--

CREATE TABLE `giasu_calendar_group` (
  `id` int(11) NOT NULL,
  `day` date NOT NULL,
  `start_time` time(6) NOT NULL,
  `end_time` time(6) NOT NULL,
  `note` longtext COLLATE utf8_unicode_ci,
  `group_impl_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `giasu_calendar_group`
--

INSERT INTO `giasu_calendar_group` (`id`, `day`, `start_time`, `end_time`, `note`, `group_impl_id`) VALUES
(205, '2019-08-14', '06:00:00.000000', '07:00:00.000000', '', 62),
(209, '2019-08-01', '07:00:00.000000', '09:00:00.000000', '', 62),
(210, '2019-08-02', '07:00:00.000000', '09:00:00.000000', '', 62),
(211, '2019-08-03', '07:00:00.000000', '09:00:00.000000', '', 62),
(212, '2019-08-01', '09:00:00.000000', '10:00:00.000000', '', 62);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giasu_calendar_group_users_impled`
--

CREATE TABLE `giasu_calendar_group_users_impled` (
  `id` int(11) NOT NULL,
  `calendar_group_id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `giasu_calendar_group_users_impled`
--

INSERT INTO `giasu_calendar_group_users_impled` (`id`, `calendar_group_id`, `profile_id`) VALUES
(144, 205, 2),
(148, 205, 3),
(149, 210, 2),
(150, 211, 2),
(151, 211, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giasu_carouselslide`
--

CREATE TABLE `giasu_carouselslide` (
  `id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `date_published` date NOT NULL,
  `pathURL` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `giasu_carouselslide`
--

INSERT INTO `giasu_carouselslide` (`id`, `title`, `description`, `image`, `date_published`, `pathURL`) VALUES
(1, 'Gia sư Hồng Trang', 'Nơi gởi gấm niềm tin của học sinh và phụ huynh', 'carousel/home_slider_1_mBdLnga.jpg', '2019-03-15', NULL),
(2, 'Thông báo chiêu sinh', 'Nhận dạy kèm các môn Toán - Lý - Hóa - Anh Văn từ lớp 1 đến lớp 12', 'carousel/giasuhongtrang_EMBtGsx.jpg', '2019-03-15', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giasu_category`
--

CREATE TABLE `giasu_category` (
  `id` int(11) NOT NULL,
  `cate_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `cate_description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `cate_image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `giasu_category`
--

INSERT INTO `giasu_category` (`id`, `cate_name`, `cate_description`, `cate_image`) VALUES
(1, 'Toán', 'Toán học', ''),
(2, 'Hóa', 'Description', ''),
(3, 'Lý', 'Vật lý học', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giasu_comment_lesson`
--

CREATE TABLE `giasu_comment_lesson` (
  `id` int(11) NOT NULL,
  `comment_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `comment_detail` longtext COLLATE utf8_unicode_ci NOT NULL,
  `comment_parent` int(11) NOT NULL,
  `comment_lesson_id` int(11) NOT NULL,
  `comment_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giasu_contact`
--

CREATE TABLE `giasu_contact` (
  `id` int(11) NOT NULL,
  `name_contact` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone_contact` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `email_contact` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `msg_contact` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status_contact` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giasu_course`
--

CREATE TABLE `giasu_course` (
  `id` int(11) NOT NULL,
  `course_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `course_description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `course_target` longtext COLLATE utf8_unicode_ci NOT NULL,
  `course_require` longtext COLLATE utf8_unicode_ci,
  `course_image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `course_duration` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `course_status` tinyint(1) NOT NULL,
  `course_price` int(11) NOT NULL,
  `course_cate_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `giasu_course`
--

INSERT INTO `giasu_course` (`id`, `course_name`, `course_description`, `course_target`, `course_require`, `course_image`, `course_duration`, `course_status`, `course_price`, `course_cate_id`) VALUES
(6, 'Hóa học 8', '<p>Chương tr&igrave;nh Ho&aacute; Học 8 cung cấp cho c&aacute;c em những hiểu biết sơ lược, c&oacute; hệ thống về c&aacute;c kh&aacute;i niệm cơ bản như: Chất, nguy&ecirc;n tử, ph&acirc;n tử, c&ocirc;ng thức ho&aacute; học, phương tr&igrave;nh ho&aacute; học, mol, phản ứng ho&aacute; học, dung dịch, nồng độ dung dịch v&agrave; độ tan; Định luật bảo to&agrave;n khối lượng v&agrave; một số chất, hợp chất ho&aacute; học quan trọng như: Oxi, Hiđro, Oxit, Axit, Bazơ, Muối,...</p>', 'Sau khi học xong khóa học này, học sinh có thể:\r\n- Nắm được các khái niệm cơ bản về chất, nguyên tử, phân tử, công thức phân tử\r\n- Biết viết công thức hóa học của chất\r\n- Biết viết phương trình hóa học', '', 'courses/chemistry_7gJKjjd_8CtTUvJ.jpg', '10 tháng', 0, 500, 2),
(7, 'Hóa học 9', '<p>Chương tr&igrave;nh ho&aacute; học lớp 9 cung cấp cho cho bạn đọc những hiểu biết s&acirc;u hơn về cấu tạo của vật chất xung quanh, ngo&agrave;i ra c&ograve;n c&oacute; những biến đổi ho&aacute; học v&agrave; ứng dụng của ch&uacute;ng trong cuộc sống lao động, sản xuất hiện đại. Ngo&agrave;i ra bạn đọc cũng sẽ lần đầu được tiếp cận với chất hữu cơ, bao gồm c&aacute;c hiđrocacbon v&agrave; dẫn xuất của ch&uacute;ng.</p>', 'Khóa học này giúp cho học sinh có kiến thức về:<br/>\r\n- Hóa học vô cơ <br/>\r\n- HÓa học hữu cơ <br/>\r\n- Các hợp chất hidrocacbon và các dẫn xuất của chúng', '', 'courses/course_4_kNBjCb9.jpg', '10 tháng', 1, 500, 2),
(8, 'Hóa học 10', '<p>Chương tr&igrave;nh H&oacute;a học 10 cung cấp cho c&aacute;c em những kiến thức bổ &iacute;ch về H&oacute;a học đại cương v&agrave; một phần H&oacute;a học v&ocirc; cơ. C&aacute;c em sẽ biết nguy&ecirc;n tử được cấu tạo như thế n&agrave;o, thế n&agrave;o l&agrave; c&aacute;c nguy&ecirc;n tố h&oacute;a học, quy tắc sắp xếp c&aacute;c nguy&ecirc;n tố h&oacute;a học trong bảng hệ thống tuần ho&agrave;n ra sao,c&aacute;c kiến thức về tốc độ phản ứng, c&acirc;n bằng h&oacute;a học, đặc điểm v&agrave; t&iacute;nh chất h&oacute;a học của c&aacute;c nguy&ecirc;n tố phi kim điển h&igrave;nh như nh&oacute;m halogen, oxi - lưu huỳnh...</p>', 'Khóa học này giúp cho các em có thể:<br/>\r\n- Nắm được thành phần cấu tạo nguyên tử<br/>\r\n- Nắm được bảng tuần hoàn các nguyên tố hóa học<br/>\r\n- Nắm được các loại liên kết hóa học trong phân tử<br/>\r\n- Nắm được các loại phản ứng hóa học<br/>', '', 'courses/chemistry_QSmwqJR.jpg', '10 tháng', 1, 500, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giasu_course_course_students`
--

CREATE TABLE `giasu_course_course_students` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `giasu_course_course_students`
--

INSERT INTO `giasu_course_course_students` (`id`, `course_id`, `profile_id`) VALUES
(6, 6, 2),
(8, 6, 3),
(7, 7, 4),
(3, 8, 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giasu_course_course_teachers`
--

CREATE TABLE `giasu_course_course_teachers` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `giasu_course_course_teachers`
--

INSERT INTO `giasu_course_course_teachers` (`id`, `course_id`, `profile_id`) VALUES
(1, 6, 1),
(2, 7, 2),
(3, 8, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giasu_dopractice`
--

CREATE TABLE `giasu_dopractice` (
  `id` int(11) NOT NULL,
  `answer` longtext COLLATE utf8_unicode_ci NOT NULL,
  `practice_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `giasu_dopractice`
--

INSERT INTO `giasu_dopractice` (`id`, `answer`, `practice_id`, `user_id`) VALUES
(1, '<p>Chào các bạn</p>\n', 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giasu_lesson`
--

CREATE TABLE `giasu_lesson` (
  `id` int(11) NOT NULL,
  `lesson_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lesson_recap` longtext COLLATE utf8_unicode_ci NOT NULL,
  `lesson_target` longtext COLLATE utf8_unicode_ci NOT NULL,
  `lesson_detail` longtext COLLATE utf8_unicode_ci NOT NULL,
  `lesson_image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lesson_doc` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lesson_video` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lesson_status` tinyint(1) NOT NULL,
  `lesson_order` int(11) NOT NULL,
  `lesson_course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `giasu_lesson`
--

INSERT INTO `giasu_lesson` (`id`, `lesson_name`, `lesson_recap`, `lesson_target`, `lesson_detail`, `lesson_image`, `lesson_doc`, `lesson_video`, `lesson_status`, `lesson_order`, `lesson_course_id`) VALUES
(1, 'Nguyên tử', 'Mọi vật thể tự nhiên hay nhân tạo đều được tạo ra từ chất này hay chất khác. Thể còn các chất được tạo ra từ đâu? Ngày nay khoa học đã có câu trả lời rõ ràng cho câu hỏi này hay chưa? Bài “Nguyên tử” sau đây sẽ giúp trả lời câu hỏi trên một cách rõ ràng nhất.', 'Nắm được nguyên tử', '<p><strong><em>1.&nbsp;&nbsp;</em></strong><strong><em>Định nghĩa</em></strong></p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Nguy&ecirc;n tử l&agrave; hạt v&ocirc; c&ugrave;ng nhỏ, trung ho&agrave; về điện, cấu tạo n&ecirc;n c&aacute;c chất.</p>\r\n\r\n<p><strong><em>2. Cấu tạo</em></strong></p>\r\n\r\n<p><strong><em><img alt=\"\" src=\"https://img.toanhoc247.com/picture/2016/0512/5_1.PNG\" style=\"height:164px; width:604px\" /></em></strong></p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp;-&nbsp;&nbsp;&nbsp;&nbsp;Nguy&ecirc;n tử lu&ocirc;n trung h&ograve;a về điện &rarr;</p>\r\n\r\n<p><strong><u>Ch&uacute; &yacute;:</u></strong>&nbsp;Hiđro l&agrave; nguy&ecirc;n tử đặc biệt chỉ c&oacute; duy nhất một hạt proton.</p>\r\n\r\n<p>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Trong nguy&ecirc;n tử, c&aacute;c&nbsp;<strong>e</strong>&nbsp;chuyển động rất nhanh v&agrave; sắp xếp th&agrave;nh từng lớp từ trong ra ngo&agrave;i.</p>\r\n\r\n<p>+ Lớp 1: c&oacute; tối đa 2e</p>\r\n\r\n<p>+ Lớp 2, 3, 4&hellip; &nbsp;tối đa 8e</p>\r\n\r\n<p>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Khối lượng nguy&ecirc;n tử = số P + số N + số e = số P + số N (v&igrave; e c&oacute; khối lượng rất nhỏ n&ecirc;n bỏ qua).</p>', 'courses/cau-tao-nguyen-tu_7zglDgD.jpg', '', 'https://www.youtube.com/watch?v=1xSQlwWGT8M', 1, 1, 6),
(2, 'Đơn chất, hợp chất', 'Ta đã biết các chất được cấu tạo nên từ nguyên tử mà mỗi loại nguyên tử lại là một nguyên tố hóa học. Vậy ta có thể nói: Chất được tạo từ nguyên tố hóa học có được không? Tùy theo có chất được tạo nên từ một, hai hay ba nguyên tố. Dựa vào đó, người ta phân loại chất. Bài viết dưới đây sẽ giúp bạn đọc hiểu rõ hơn về cách phân loại chất.', 'Nắm được đơn chất, hợp chất', '<p><strong>I<em>.&nbsp;<u>Đơn chất:</u></em></strong></p>\r\n\r\n<p><strong>1.&nbsp;<u>Đơn chất l&agrave; g&igrave;?</u></strong></p>\r\n\r\n<p>- Kh&iacute; oxi tạo n&ecirc;n từ nguy&ecirc;n tố O.</p>\r\n\r\n<p>- K.loại Natri&nbsp; tạo n&ecirc;n từ nguy&ecirc;n tố Na.</p>\r\n\r\n<p>- K.loại nh&ocirc;m tạo n&ecirc;n từ nguy&ecirc;n tố Al.</p>\r\n\r\n<p>* Vậy kh&iacute; oxi, kim loại Na, Al gọi l&agrave; đơn chất.</p>\r\n\r\n<p><strong>*<em>&nbsp;<u>Định nghĩa</u>:</em></strong>&nbsp;Đơn chất do 1 nguy&ecirc;n tố ho&aacute; học cấu tạo n&ecirc;n.</p>\r\n\r\n<p>- Đơn chất kim loại: Dẫn điện, dẫn nhiệt, c&oacute; &aacute;nh kim.</p>\r\n\r\n<p>- Đơn chất phi kim: Kh&ocirc;ng dẫn điện, dẫn nhiệt, kh&ocirc;ng c&oacute; &aacute;nh kim.</p>\r\n\r\n<p><strong><em>*<u>Kết luận</u></em></strong>: Đ/c do 1 NTHH cấu tạo n&ecirc;n. Gồm 2 loại đơn chất :</p>\r\n\r\n<p>+ Kim loại.</p>\r\n\r\n<p>+ Phi kim.</p>\r\n\r\n<p><strong>2<u>.Đặc điểm cấu tạo</u>:</strong></p>\r\n\r\n<p>- Đơn chất KL: Nguy&ecirc;n tử sắp xếp kh&iacute;t&nbsp; nhau v&agrave; theo một trật tự x&aacute;c định.</p>\r\n\r\n<p>- Đơn chất PK: Nguy&ecirc;n tử li&ecirc;n kết với nhau theo một số nhất định (Thường l&agrave; 2).</p>\r\n\r\n<p><strong><em>II.<u>Hợp chất</u>:</em></strong></p>\r\n\r\n<p><strong>1.<u>Hợp chất l&agrave; g&igrave;?</u></strong></p>\r\n\r\n<p><strong><em>VD:</em></strong></p>\r\n\r\n<p><strong>-</strong>Nước: H<sub>2</sub>O&nbsp;&nbsp;&nbsp; &nbsp;Nguy&ecirc;n tố H&nbsp;&nbsp;&nbsp;&nbsp; v&agrave; O.</p>\r\n\r\n<p>-M.ăn: NaCl&nbsp;&nbsp; &nbsp;&nbsp;Nguy&ecirc;n tố Na v&agrave; Cl.</p>\r\n\r\n<p>-A.sunfuric: H<sub>2</sub>SO<sub>4</sub>Nguy&ecirc;n tố H, S v&agrave; O.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<sub>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</sub></p>\r\n\r\n<p><strong><em>* Định nghĩa:</em></strong>&nbsp;Hợp chất l&agrave; những chất tạo n&ecirc;n từ 2 NTHH trở l&ecirc;n.</p>\r\n\r\n<p>- Hợp chất gồm:</p>\r\n\r\n<p>&nbsp;&nbsp; + Hợp chất v&ocirc; cơ:</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; H<sub>2</sub>O, NaOH, NaCl, H<sub>2</sub>SO<sub>4</sub>....</p>\r\n\r\n<p>&nbsp;&nbsp; + Hợp chất hữu cơ:</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CH<sub>4&nbsp;</sub>(M&ecirc; tan), C<sub>12</sub>H<sub>22</sub>O<sub>11&nbsp;</sub>(đường),</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; C<sub>2</sub>H<sub>2&nbsp;</sub>(Axetilen), C<sub>2</sub>H<sub>4&nbsp;</sub>(Etilen)....</p>\r\n\r\n<p><strong>2<u>.Đặc điểm cấu tạo</u>:</strong></p>\r\n\r\n<p>- Trong hợp chất: Nguy&ecirc;n tố li&ecirc;n kết với nhau theo một tỷ lệ v&agrave; một thứ tự nhất định</p>\r\n\r\n<p><strong><em>III.&nbsp;<u>Ph&acirc;n tử</u>:</em></strong></p>\r\n\r\n<p><strong>1<u>.Định nghĩa</u>:</strong></p>\r\n\r\n<p><strong><u>VD:</u></strong>&nbsp;- Kh&iacute; hiđro, oxi : 2 nguy&ecirc;n tử c&ugrave;ng loại li&ecirc;n kết với nhau.</p>\r\n\r\n<p>- Nước : 2H li&ecirc;n kết với 1O.</p>\r\n\r\n<p>- Muối ăn: 1Na li&ecirc;n kết với 1Cl.</p>\r\n\r\n<p><strong><em>* Định nghĩa:</em></strong>&nbsp; Ph&acirc;n tử l&agrave; hạt đại diện cho chất, gồm một số nguy&ecirc;n tử li&ecirc;n kết với nhau v&agrave; thể hiện đầy đủ t&iacute;nh chất ho&aacute; học của chất.</p>\r\n\r\n<p><strong>2<u>.Ph&acirc;n tử khối</u>:</strong></p>\r\n\r\n<p>*&nbsp;<strong><em><u>Định nghĩa</u>:</em></strong></p>\r\n\r\n<p>&nbsp;<strong>VD:</strong>O<sub>2</sub>&nbsp;= 2.16 = 32 đvC ; Cl<sub>2</sub>&nbsp;= 71 đvC.</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CaCO<sub>3</sub>&nbsp;= 100 đvC&nbsp;&nbsp; ; H<sub>2</sub>SO<sub>4</sub>&nbsp;= 98 đvC.</p>\r\n\r\n<p><strong><em>IV.<u>Trạng th&aacute;i của chất:</u></em></strong></p>\r\n\r\n<p>- Mỗi mẫu chất l&agrave; một tập hợp v&ocirc; c&ugrave;ng lớn những hạt nguy&ecirc;n tử hay ph&acirc;n tử .</p>\r\n\r\n<p>- Tuỳ điều kiện m&ocirc;ĩ chất c&oacute; thể ở 3 trạng th&aacute;i: rắn, lỏng, kh&iacute;.ở trạng th&aacute;i kh&iacute; c&aacute;c hạt c&aacute;ch xa nhau.</p>\r\n\r\n<p><strong>So s&aacute;nh đơn chất v&agrave; hợp chất</strong></p>\r\n\r\n<table border=\"1\" cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"vertical-align:top\">\r\n			<p>&nbsp;</p>\r\n			</td>\r\n			<td style=\"vertical-align:top\">\r\n			<p><strong>Đơn chất</strong></p>\r\n			</td>\r\n			<td style=\"vertical-align:top\">\r\n			<p><strong>Hợp chất</strong></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top\">\r\n			<p>VD</p>\r\n			</td>\r\n			<td style=\"vertical-align:top\">\r\n			<p>Sắt, đồng, oxi, nitơ, than ch&igrave;&hellip;</p>\r\n			</td>\r\n			<td style=\"vertical-align:top\">\r\n			<p>Nước, muối ăn, đường&hellip;</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top\">\r\n			<p>K/N</p>\r\n			</td>\r\n			<td style=\"vertical-align:top\">\r\n			<p>L&agrave; những chất do 1 nguy&ecirc;n tố ho&aacute; học cấu tạo n&ecirc;n</p>\r\n			</td>\r\n			<td style=\"vertical-align:top\">\r\n			<p>L&agrave; những chất do 2 hay nhiều nguy&ecirc;n tố ho&aacute; học cấu tạo n&ecirc;n</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top\">\r\n			<p>Ph&acirc;n loại</p>\r\n			</td>\r\n			<td style=\"vertical-align:top\">\r\n			<p>Gồm 2 loại: Kim loại v&agrave; phi kim.</p>\r\n			</td>\r\n			<td style=\"vertical-align:top\">\r\n			<p>Gồm 2 loại: hợp chất v&ocirc; cơ v&agrave; hợp chất hữu cơ</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top\">\r\n			<p>Ph&acirc;n tử</p>\r\n\r\n			<p>(hạt đại diện)</p>\r\n			</td>\r\n			<td style=\"vertical-align:top\">\r\n			<p>- Gồm 1 nguy&ecirc;n tử: kim loại v&agrave; phi kim rắn</p>\r\n\r\n			<p>- Gồm c&aacute;c nguy&ecirc;n tử c&ugrave;ng loại: Phi kim lỏng v&agrave; kh&iacute;</p>\r\n			</td>\r\n			<td style=\"vertical-align:top\">\r\n			<p>- Gồm c&aacute;c nguy&ecirc;n tử kh&aacute;c loại thuộc c&aacute;c nguy&ecirc;n tố ho&aacute; học kh&aacute;c nhau</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top\">\r\n			<p>CTHH</p>\r\n			</td>\r\n			<td style=\"vertical-align:top\">\r\n			<p>- Kim loại v&agrave; phi kim rắn:</p>\r\n\r\n			<p>CTHH &ordm; KHHH&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (A)</p>\r\n\r\n			<p>- Phi kim lỏng v&agrave; kh&iacute;:</p>\r\n\r\n			<p>CTHH = KHHH + chỉ số&nbsp;&nbsp;&nbsp; (A<sub>x</sub>)</p>\r\n			</td>\r\n			<td style=\"vertical-align:top\">\r\n			<p>CTHH = KHHH của c&aacute;c nguy&ecirc;n tố + c&aacute;c chỉ số tương ứng</p>\r\n\r\n			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; A<sub>x</sub>B<sub>y</sub></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p><strong>&nbsp;</strong></p>\r\n\r\n<p><strong>So s&aacute;nh nguy&ecirc;n tử v&agrave; ph&acirc;n tử</strong></p>\r\n\r\n<table border=\"1\" cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"vertical-align:top\">\r\n			<p>&nbsp;</p>\r\n			</td>\r\n			<td style=\"vertical-align:top\">\r\n			<p><strong>nguy&ecirc;n tử</strong></p>\r\n			</td>\r\n			<td style=\"vertical-align:top\">\r\n			<p><strong>ph&acirc;n tử</strong></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top\">\r\n			<p>Định nghĩa</p>\r\n			</td>\r\n			<td style=\"vertical-align:top\">\r\n			<p>L&agrave; hạt v&ocirc; c&ugrave;ng nhỏ, trung ho&agrave; về điện, cấu tạo n&ecirc;n c&aacute;c chất</p>\r\n			</td>\r\n			<td style=\"vertical-align:top\">\r\n			<p>L&agrave; hạt v&ocirc; c&ugrave;ng nhỏ, đại diện cho chất v&agrave; mang đầy đủ t&iacute;nh chất của chất</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top\">\r\n			<p>Sự biến đổi trong phản ứng ho&aacute; học.</p>\r\n			</td>\r\n			<td style=\"vertical-align:top\">\r\n			<p>Nguy&ecirc;n tử được bảo to&agrave;n trong c&aacute;c phản ứng ho&aacute; học.</p>\r\n			</td>\r\n			<td style=\"vertical-align:top\">\r\n			<p>Li&ecirc;n kết giữa c&aacute;c nguy&ecirc;n tử trong ph&acirc;n tử thay đổi l&agrave;m cho ph&acirc;n tử n&agrave;y biến đổi th&agrave;nh ph&acirc;n tử kh&aacute;c</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top\">\r\n			<p>Khối lượng</p>\r\n			</td>\r\n			<td style=\"vertical-align:top\">\r\n			<p>Nguy&ecirc;n tử khối (NTK) cho biết độ nặng nhẹ kh&aacute;c nhau giữa c&aacute;c nguy&ecirc;n tử v&agrave; l&agrave; đại lượng đặc trưng cho mỗi nguy&ecirc;n tố</p>\r\n\r\n			<p>NTK l&agrave; khối lượng của nguy&ecirc;n tử t&iacute;nh bằng đơn vị Cacbon</p>\r\n			</td>\r\n			<td style=\"vertical-align:top\">\r\n			<p>Ph&acirc;n tử khối (PTK) l&agrave; khối lượng của 1 ph&acirc;n tử t&iacute;nh bằng đơn vị Cacbon</p>\r\n\r\n			<p>PTK = tổng khối lượng c&aacute;c nguy&ecirc;n tử c&oacute; trong ph&acirc;n tử.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p><strong>&nbsp;</strong></p>', '', '', NULL, 1, 2, 6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giasu_libraryimage`
--

CREATE TABLE `giasu_libraryimage` (
  `id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `giasu_libraryimage`
--

INSERT INTO `giasu_libraryimage` (`id`, `title`, `image`) VALUES
(1, 'Một giờ học ở trung tâm', 'libraryImage/course_5.jpg'),
(2, 'Học viên tiêu biểu', 'libraryImage/event_1.jpg'),
(3, 'Thảo luận nhóm', 'libraryImage/course_8.jpg'),
(4, 'không gian học tập tại trung tâm', 'libraryImage/course_image.jpg'),
(5, 'Lớp học hóa', 'libraryImage/blog_images_1.jpg'),
(6, 'Thực nghiệm hóa học', 'libraryImage/course_7.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giasu_practice`
--

CREATE TABLE `giasu_practice` (
  `id` int(11) NOT NULL,
  `pratice_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `practice_detail` longtext COLLATE utf8_unicode_ci NOT NULL,
  `pratice_answer` longtext COLLATE utf8_unicode_ci NOT NULL,
  `pratice_lesson_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `giasu_practice`
--

INSERT INTO `giasu_practice` (`id`, `pratice_name`, `practice_detail`, `pratice_answer`, `pratice_lesson_id`) VALUES
(1, 'Bài 1', '<p>Nguy&ecirc;n tử A c&oacute; tổng số hạt l&agrave; 52, trong đ&oacute; số hạt mang điện nhiều hơn số hạt kh&ocirc;ng mang điện l&agrave; 16. T&iacute;nh số hạt từng loại.</p>', '<p><span style=\"font-size:16px\">Ki&ecirc;́n thức c&acirc;̀n chú ý đ&ecirc;̉ giải bài t&acirc;̣p dạng này:</span></p>\r\n\r\n<p><span style=\"font-size:16px\">- Nguy&ecirc;n tử g&ocirc;̀m 3 loại hạt: hạt proton và electron mang đi&ecirc;̣n; hạt noron kh&ocirc;ng mang đi&ecirc;̣n.</span></p>\r\n\r\n<p><span style=\"font-size:16px\">- T&ocirc;̉ng s&ocirc;́ hạt của nguy&ecirc;n tử: X = p + e + n = 2p +n (Vì ở trạng trái trung hòa v&ecirc;̀ đi&ecirc;̣n, s&ocirc;́ hạt proton bằng s&ocirc;́ hạt electron)</span></p>\r\n\r\n<p><span style=\"font-size:16px\">- S&ocirc;́ kh&ocirc;́i: A = p + n</span></p>\r\n\r\n<p><span style=\"font-size:16px\">** Áp dụng:</span></p>\r\n\r\n<p><span style=\"font-size:16px\">A:&nbsp;&nbsp;2p + n&nbsp;= 52</span></p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; 2p - n = 16</p>\r\n\r\n<p>--&gt; p = e = 12, n&nbsp;= 8&nbsp;&nbsp;</p>', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giasu_questions`
--

CREATE TABLE `giasu_questions` (
  `id` int(11) NOT NULL,
  `question` longtext COLLATE utf8_unicode_ci NOT NULL,
  `feedback` longtext COLLATE utf8_unicode_ci,
  `correct_answer_id` int(11) DEFAULT NULL,
  `ques_lesson_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giasu_questions_answers`
--

CREATE TABLE `giasu_questions_answers` (
  `id` int(11) NOT NULL,
  `questions_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giasu_quiz_lesson`
--

CREATE TABLE `giasu_quiz_lesson` (
  `id` int(11) NOT NULL,
  `description_quiz` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status_quiz` tinyint(1) NOT NULL,
  `count_quiz` int(11) NOT NULL,
  `time_quiz` int(11) NOT NULL,
  `times_quiz` int(11) NOT NULL,
  `lesson_quiz_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giasu_quiz_lesson_question_quiz`
--

CREATE TABLE `giasu_quiz_lesson_question_quiz` (
  `id` int(11) NOT NULL,
  `quiz_lesson_id` int(11) NOT NULL,
  `questions_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giasu_quiz_lesson_user_do`
--

CREATE TABLE `giasu_quiz_lesson_user_do` (
  `id` int(11) NOT NULL,
  `answer_quiz` longtext COLLATE utf8_unicode_ci NOT NULL,
  `lesson_quiz_id` int(11) NOT NULL,
  `question_quiz_id` int(11) NOT NULL,
  `user_quiz_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giasu_quiz_lesson_user_quiz`
--

CREATE TABLE `giasu_quiz_lesson_user_quiz` (
  `id` int(11) NOT NULL,
  `quiz_lesson_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giasu_quiz_score_lesson`
--

CREATE TABLE `giasu_quiz_score_lesson` (
  `id` int(11) NOT NULL,
  `mark` int(11) NOT NULL,
  `number_of_times` int(11) NOT NULL,
  `quiz_lesson_id` int(11) NOT NULL,
  `user_score_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giasu_register_course`
--

CREATE TABLE `giasu_register_course` (
  `id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `course_register_id` int(11) NOT NULL,
  `user_register_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `giasu_register_course`
--

INSERT INTO `giasu_register_course` (`id`, `status`, `course_register_id`, `user_register_id`) VALUES
(10, 0, 6, 1),
(14, 0, 7, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giasu_register_course_temp`
--

CREATE TABLE `giasu_register_course_temp` (
  `id` int(11) NOT NULL,
  `name_register` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone_register` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `msg_register` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status_register` tinyint(1) NOT NULL,
  `course_register_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giasu_review_course`
--

CREATE TABLE `giasu_review_course` (
  `course_id` int(11) NOT NULL,
  `star1` int(11) NOT NULL,
  `star2` int(11) NOT NULL,
  `star3` int(11) NOT NULL,
  `star4` int(11) NOT NULL,
  `star5` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `giasu_review_course`
--

INSERT INTO `giasu_review_course` (`course_id`, `star1`, `star2`, `star3`, `star4`, `star5`) VALUES
(6, 5, 0, 0, 0, 0),
(7, 0, 0, 0, 0, 0),
(8, 3, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giasu_review_lesson`
--

CREATE TABLE `giasu_review_lesson` (
  `lesson_id` int(11) NOT NULL,
  `star1` int(11) NOT NULL,
  `star2` int(11) NOT NULL,
  `star3` int(11) NOT NULL,
  `star4` int(11) NOT NULL,
  `star5` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `giasu_review_lesson`
--

INSERT INTO `giasu_review_lesson` (`lesson_id`, `star1`, `star2`, `star3`, `star4`, `star5`) VALUES
(1, 0, 0, 0, 0, 0),
(2, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giasu_student_group`
--

CREATE TABLE `giasu_student_group` (
  `id` int(11) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `belong_course_id` int(11) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `giasu_student_group`
--

INSERT INTO `giasu_student_group` (`id`, `date_created`, `belong_course_id`, `created_by_id`, `group_id`) VALUES
(15, '2019-08-12 00:55:24.798256', 6, 1, 62);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giasu_student_group_member`
--

CREATE TABLE `giasu_student_group_member` (
  `id` int(11) NOT NULL,
  `student_group_id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `giasu_student_group_member`
--

INSERT INTO `giasu_student_group_member` (`id`, `student_group_id`, `profile_id`) VALUES
(22, 15, 2),
(32, 15, 3);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `accounts_major`
--
ALTER TABLE `accounts_major`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `accounts_profile`
--
ALTER TABLE `accounts_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `accounts_profile_major_id_9ca8867b_fk_accounts_major_id` (`major_id`);

--
-- Chỉ mục cho bảng `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Chỉ mục cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Chỉ mục cho bảng `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Chỉ mục cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Chỉ mục cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Chỉ mục cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Chỉ mục cho bảng `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Chỉ mục cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Chỉ mục cho bảng `giasu_answer`
--
ALTER TABLE `giasu_answer`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `giasu_calendar_group`
--
ALTER TABLE `giasu_calendar_group`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `giasu_calendar_group_users_impled`
--
ALTER TABLE `giasu_calendar_group_users_impled`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `giasu_carouselslide`
--
ALTER TABLE `giasu_carouselslide`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `giasu_category`
--
ALTER TABLE `giasu_category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `giasu_comment_lesson`
--
ALTER TABLE `giasu_comment_lesson`
  ADD PRIMARY KEY (`id`),
  ADD KEY `giasu_comment_lesson_comment_lesson_id_c5e0f6fb_fk_giasu_les` (`comment_lesson_id`),
  ADD KEY `giasu_comment_lesson_comment_user_id_40b6eeae_fk_auth_user_id` (`comment_user_id`);

--
-- Chỉ mục cho bảng `giasu_contact`
--
ALTER TABLE `giasu_contact`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `giasu_course`
--
ALTER TABLE `giasu_course`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `course_name` (`course_name`),
  ADD KEY `giasu_course_course_cate_id_ca5e0ae4_fk_giasu_category_id` (`course_cate_id`);

--
-- Chỉ mục cho bảng `giasu_course_course_students`
--
ALTER TABLE `giasu_course_course_students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `giasu_course_course_students_course_id_profile_id_64033da4_uniq` (`course_id`,`profile_id`),
  ADD KEY `giasu_course_course__profile_id_1d4815be_fk_accounts_` (`profile_id`);

--
-- Chỉ mục cho bảng `giasu_course_course_teachers`
--
ALTER TABLE `giasu_course_course_teachers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `giasu_course_course_teachers_course_id_profile_id_05c96c6f_uniq` (`course_id`,`profile_id`),
  ADD KEY `giasu_course_course__profile_id_37135cb7_fk_accounts_` (`profile_id`);

--
-- Chỉ mục cho bảng `giasu_dopractice`
--
ALTER TABLE `giasu_dopractice`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `giasu_dopractice_user_id_practice_id_9184c528_uniq` (`user_id`,`practice_id`),
  ADD KEY `giasu_dopractice_practice_id_0dfb0af7_fk_giasu_practice_id` (`practice_id`);

--
-- Chỉ mục cho bảng `giasu_lesson`
--
ALTER TABLE `giasu_lesson`
  ADD PRIMARY KEY (`id`),
  ADD KEY `giasu_lesson_lesson_course_id_0311d1f7_fk_giasu_course_id` (`lesson_course_id`);

--
-- Chỉ mục cho bảng `giasu_libraryimage`
--
ALTER TABLE `giasu_libraryimage`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `giasu_practice`
--
ALTER TABLE `giasu_practice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `giasu_practice_pratice_lesson_id_b2b15407_fk_giasu_lesson_id` (`pratice_lesson_id`);

--
-- Chỉ mục cho bảng `giasu_questions`
--
ALTER TABLE `giasu_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `giasu_questions_correct_answer_id_2b3efd65_fk_giasu_answer_id` (`correct_answer_id`),
  ADD KEY `giasu_questions_ques_lesson_id_d9d49117_fk_giasu_lesson_id` (`ques_lesson_id`);

--
-- Chỉ mục cho bảng `giasu_questions_answers`
--
ALTER TABLE `giasu_questions_answers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `giasu_questions_answers_questions_id_answer_id_8aee79d9_uniq` (`questions_id`,`answer_id`),
  ADD KEY `giasu_questions_answers_answer_id_fe386fa0_fk_giasu_answer_id` (`answer_id`);

--
-- Chỉ mục cho bảng `giasu_quiz_lesson`
--
ALTER TABLE `giasu_quiz_lesson`
  ADD PRIMARY KEY (`id`),
  ADD KEY `giasu_quiz_lesson_lesson_quiz_id_47b4ebef_fk_giasu_lesson_id` (`lesson_quiz_id`);

--
-- Chỉ mục cho bảng `giasu_quiz_lesson_question_quiz`
--
ALTER TABLE `giasu_quiz_lesson_question_quiz`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `giasu_quiz_lesson_questi_quiz_lesson_id_questions_e0955a9d_uniq` (`quiz_lesson_id`,`questions_id`),
  ADD KEY `giasu_quiz_lesson_qu_questions_id_31d126a9_fk_giasu_que` (`questions_id`);

--
-- Chỉ mục cho bảng `giasu_quiz_lesson_user_do`
--
ALTER TABLE `giasu_quiz_lesson_user_do`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `giasu_quiz_lesson_user_d_lesson_quiz_id_user_quiz_4702012f_uniq` (`lesson_quiz_id`,`user_quiz_id`,`question_quiz_id`),
  ADD KEY `giasu_quiz_lesson_us_question_quiz_id_5556faee_fk_giasu_que` (`question_quiz_id`),
  ADD KEY `giasu_quiz_lesson_user_do_user_quiz_id_9a145728_fk_auth_user_id` (`user_quiz_id`);

--
-- Chỉ mục cho bảng `giasu_quiz_lesson_user_quiz`
--
ALTER TABLE `giasu_quiz_lesson_user_quiz`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `giasu_quiz_lesson_user_quiz_quiz_lesson_id_user_id_444022e2_uniq` (`quiz_lesson_id`,`user_id`),
  ADD KEY `giasu_quiz_lesson_user_quiz_user_id_adba1469_fk_auth_user_id` (`user_id`);

--
-- Chỉ mục cho bảng `giasu_quiz_score_lesson`
--
ALTER TABLE `giasu_quiz_score_lesson`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `giasu_quiz_score_lesson_quiz_lesson_id_user_scor_12da1c9b_uniq` (`quiz_lesson_id`,`user_score_id`),
  ADD KEY `giasu_quiz_score_lesson_user_score_id_62cff812_fk_auth_user_id` (`user_score_id`);

--
-- Chỉ mục cho bảng `giasu_register_course`
--
ALTER TABLE `giasu_register_course`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `giasu_register_course_user_register_id_course__45b0a966_uniq` (`user_register_id`,`course_register_id`),
  ADD KEY `giasu_register_cours_course_register_id_69a99344_fk_giasu_cou` (`course_register_id`);

--
-- Chỉ mục cho bảng `giasu_register_course_temp`
--
ALTER TABLE `giasu_register_course_temp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `giasu_register_cours_course_register_id_0b2905b5_fk_giasu_cou` (`course_register_id`);

--
-- Chỉ mục cho bảng `giasu_review_course`
--
ALTER TABLE `giasu_review_course`
  ADD PRIMARY KEY (`course_id`);

--
-- Chỉ mục cho bảng `giasu_review_lesson`
--
ALTER TABLE `giasu_review_lesson`
  ADD PRIMARY KEY (`lesson_id`);

--
-- Chỉ mục cho bảng `giasu_student_group`
--
ALTER TABLE `giasu_student_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `group_id` (`group_id`),
  ADD KEY `giasu_student_group_belong_course_id_dd38749f_fk_giasu_course_id` (`belong_course_id`),
  ADD KEY `giasu_student_group_created_by_id_3682b838_fk_accounts_` (`created_by_id`);

--
-- Chỉ mục cho bảng `giasu_student_group_member`
--
ALTER TABLE `giasu_student_group_member`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `giasu_student_group_memb_student_group_id_profile_bf62e3e1_uniq` (`student_group_id`,`profile_id`),
  ADD KEY `giasu_student_group__profile_id_9f67d5b9_fk_accounts_` (`profile_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `accounts_major`
--
ALTER TABLE `accounts_major`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT cho bảng `accounts_profile`
--
ALTER TABLE `accounts_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT cho bảng `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;
--
-- AUTO_INCREMENT cho bảng `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=215;
--
-- AUTO_INCREMENT cho bảng `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT cho bảng `giasu_answer`
--
ALTER TABLE `giasu_answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `giasu_calendar_group`
--
ALTER TABLE `giasu_calendar_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=213;
--
-- AUTO_INCREMENT cho bảng `giasu_calendar_group_users_impled`
--
ALTER TABLE `giasu_calendar_group_users_impled`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;
--
-- AUTO_INCREMENT cho bảng `giasu_carouselslide`
--
ALTER TABLE `giasu_carouselslide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT cho bảng `giasu_category`
--
ALTER TABLE `giasu_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT cho bảng `giasu_comment_lesson`
--
ALTER TABLE `giasu_comment_lesson`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `giasu_contact`
--
ALTER TABLE `giasu_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `giasu_course`
--
ALTER TABLE `giasu_course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT cho bảng `giasu_course_course_students`
--
ALTER TABLE `giasu_course_course_students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT cho bảng `giasu_course_course_teachers`
--
ALTER TABLE `giasu_course_course_teachers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT cho bảng `giasu_dopractice`
--
ALTER TABLE `giasu_dopractice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT cho bảng `giasu_lesson`
--
ALTER TABLE `giasu_lesson`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT cho bảng `giasu_libraryimage`
--
ALTER TABLE `giasu_libraryimage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT cho bảng `giasu_practice`
--
ALTER TABLE `giasu_practice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT cho bảng `giasu_questions`
--
ALTER TABLE `giasu_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `giasu_questions_answers`
--
ALTER TABLE `giasu_questions_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `giasu_quiz_lesson`
--
ALTER TABLE `giasu_quiz_lesson`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `giasu_quiz_lesson_question_quiz`
--
ALTER TABLE `giasu_quiz_lesson_question_quiz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `giasu_quiz_lesson_user_do`
--
ALTER TABLE `giasu_quiz_lesson_user_do`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `giasu_quiz_lesson_user_quiz`
--
ALTER TABLE `giasu_quiz_lesson_user_quiz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `giasu_quiz_score_lesson`
--
ALTER TABLE `giasu_quiz_score_lesson`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `giasu_register_course`
--
ALTER TABLE `giasu_register_course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT cho bảng `giasu_register_course_temp`
--
ALTER TABLE `giasu_register_course_temp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `giasu_student_group`
--
ALTER TABLE `giasu_student_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT cho bảng `giasu_student_group_member`
--
ALTER TABLE `giasu_student_group_member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `accounts_profile`
--
ALTER TABLE `accounts_profile`
  ADD CONSTRAINT `accounts_profile_major_id_9ca8867b_fk_accounts_major_id` FOREIGN KEY (`major_id`) REFERENCES `accounts_major` (`id`),
  ADD CONSTRAINT `accounts_profile_user_id_49a85d32_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Các ràng buộc cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Các ràng buộc cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `giasu_comment_lesson`
--
ALTER TABLE `giasu_comment_lesson`
  ADD CONSTRAINT `giasu_comment_lesson_comment_lesson_id_c5e0f6fb_fk_giasu_les` FOREIGN KEY (`comment_lesson_id`) REFERENCES `giasu_lesson` (`id`),
  ADD CONSTRAINT `giasu_comment_lesson_comment_user_id_40b6eeae_fk_auth_user_id` FOREIGN KEY (`comment_user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `giasu_course`
--
ALTER TABLE `giasu_course`
  ADD CONSTRAINT `giasu_course_course_cate_id_ca5e0ae4_fk_giasu_category_id` FOREIGN KEY (`course_cate_id`) REFERENCES `giasu_category` (`id`);

--
-- Các ràng buộc cho bảng `giasu_course_course_students`
--
ALTER TABLE `giasu_course_course_students`
  ADD CONSTRAINT `giasu_course_course__course_id_409d61c5_fk_giasu_cou` FOREIGN KEY (`course_id`) REFERENCES `giasu_course` (`id`),
  ADD CONSTRAINT `giasu_course_course__profile_id_1d4815be_fk_accounts_` FOREIGN KEY (`profile_id`) REFERENCES `accounts_profile` (`id`);

--
-- Các ràng buộc cho bảng `giasu_course_course_teachers`
--
ALTER TABLE `giasu_course_course_teachers`
  ADD CONSTRAINT `giasu_course_course__course_id_0aa339de_fk_giasu_cou` FOREIGN KEY (`course_id`) REFERENCES `giasu_course` (`id`),
  ADD CONSTRAINT `giasu_course_course__profile_id_37135cb7_fk_accounts_` FOREIGN KEY (`profile_id`) REFERENCES `accounts_profile` (`id`);

--
-- Các ràng buộc cho bảng `giasu_dopractice`
--
ALTER TABLE `giasu_dopractice`
  ADD CONSTRAINT `giasu_dopractice_practice_id_0dfb0af7_fk_giasu_practice_id` FOREIGN KEY (`practice_id`) REFERENCES `giasu_practice` (`id`),
  ADD CONSTRAINT `giasu_dopractice_user_id_036c1c8a_fk_accounts_profile_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_profile` (`id`);

--
-- Các ràng buộc cho bảng `giasu_lesson`
--
ALTER TABLE `giasu_lesson`
  ADD CONSTRAINT `giasu_lesson_lesson_course_id_0311d1f7_fk_giasu_course_id` FOREIGN KEY (`lesson_course_id`) REFERENCES `giasu_course` (`id`);

--
-- Các ràng buộc cho bảng `giasu_practice`
--
ALTER TABLE `giasu_practice`
  ADD CONSTRAINT `giasu_practice_pratice_lesson_id_b2b15407_fk_giasu_lesson_id` FOREIGN KEY (`pratice_lesson_id`) REFERENCES `giasu_lesson` (`id`);

--
-- Các ràng buộc cho bảng `giasu_questions`
--
ALTER TABLE `giasu_questions`
  ADD CONSTRAINT `giasu_questions_correct_answer_id_2b3efd65_fk_giasu_answer_id` FOREIGN KEY (`correct_answer_id`) REFERENCES `giasu_answer` (`id`),
  ADD CONSTRAINT `giasu_questions_ques_lesson_id_d9d49117_fk_giasu_lesson_id` FOREIGN KEY (`ques_lesson_id`) REFERENCES `giasu_lesson` (`id`);

--
-- Các ràng buộc cho bảng `giasu_questions_answers`
--
ALTER TABLE `giasu_questions_answers`
  ADD CONSTRAINT `giasu_questions_answ_questions_id_b3a029a1_fk_giasu_que` FOREIGN KEY (`questions_id`) REFERENCES `giasu_questions` (`id`),
  ADD CONSTRAINT `giasu_questions_answers_answer_id_fe386fa0_fk_giasu_answer_id` FOREIGN KEY (`answer_id`) REFERENCES `giasu_answer` (`id`);

--
-- Các ràng buộc cho bảng `giasu_quiz_lesson`
--
ALTER TABLE `giasu_quiz_lesson`
  ADD CONSTRAINT `giasu_quiz_lesson_lesson_quiz_id_47b4ebef_fk_giasu_lesson_id` FOREIGN KEY (`lesson_quiz_id`) REFERENCES `giasu_lesson` (`id`);

--
-- Các ràng buộc cho bảng `giasu_quiz_lesson_question_quiz`
--
ALTER TABLE `giasu_quiz_lesson_question_quiz`
  ADD CONSTRAINT `giasu_quiz_lesson_qu_questions_id_31d126a9_fk_giasu_que` FOREIGN KEY (`questions_id`) REFERENCES `giasu_questions` (`id`),
  ADD CONSTRAINT `giasu_quiz_lesson_qu_quiz_lesson_id_b5f80306_fk_giasu_qui` FOREIGN KEY (`quiz_lesson_id`) REFERENCES `giasu_quiz_lesson` (`id`);

--
-- Các ràng buộc cho bảng `giasu_quiz_lesson_user_do`
--
ALTER TABLE `giasu_quiz_lesson_user_do`
  ADD CONSTRAINT `giasu_quiz_lesson_us_lesson_quiz_id_e39e20e4_fk_giasu_qui` FOREIGN KEY (`lesson_quiz_id`) REFERENCES `giasu_quiz_lesson` (`id`),
  ADD CONSTRAINT `giasu_quiz_lesson_us_question_quiz_id_5556faee_fk_giasu_que` FOREIGN KEY (`question_quiz_id`) REFERENCES `giasu_questions` (`id`),
  ADD CONSTRAINT `giasu_quiz_lesson_user_do_user_quiz_id_9a145728_fk_auth_user_id` FOREIGN KEY (`user_quiz_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `giasu_quiz_lesson_user_quiz`
--
ALTER TABLE `giasu_quiz_lesson_user_quiz`
  ADD CONSTRAINT `giasu_quiz_lesson_us_quiz_lesson_id_a9e3c560_fk_giasu_qui` FOREIGN KEY (`quiz_lesson_id`) REFERENCES `giasu_quiz_lesson` (`id`),
  ADD CONSTRAINT `giasu_quiz_lesson_user_quiz_user_id_adba1469_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `giasu_quiz_score_lesson`
--
ALTER TABLE `giasu_quiz_score_lesson`
  ADD CONSTRAINT `giasu_quiz_score_les_quiz_lesson_id_c307b234_fk_giasu_qui` FOREIGN KEY (`quiz_lesson_id`) REFERENCES `giasu_quiz_lesson` (`id`),
  ADD CONSTRAINT `giasu_quiz_score_lesson_user_score_id_62cff812_fk_auth_user_id` FOREIGN KEY (`user_score_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `giasu_register_course`
--
ALTER TABLE `giasu_register_course`
  ADD CONSTRAINT `giasu_register_cours_course_register_id_69a99344_fk_giasu_cou` FOREIGN KEY (`course_register_id`) REFERENCES `giasu_course` (`id`),
  ADD CONSTRAINT `giasu_register_cours_user_register_id_41b289d3_fk_accounts_` FOREIGN KEY (`user_register_id`) REFERENCES `accounts_profile` (`id`);

--
-- Các ràng buộc cho bảng `giasu_register_course_temp`
--
ALTER TABLE `giasu_register_course_temp`
  ADD CONSTRAINT `giasu_register_cours_course_register_id_0b2905b5_fk_giasu_cou` FOREIGN KEY (`course_register_id`) REFERENCES `giasu_course` (`id`);

--
-- Các ràng buộc cho bảng `giasu_review_course`
--
ALTER TABLE `giasu_review_course`
  ADD CONSTRAINT `giasu_review_course_course_id_b6a92004_fk_giasu_course_id` FOREIGN KEY (`course_id`) REFERENCES `giasu_course` (`id`);

--
-- Các ràng buộc cho bảng `giasu_review_lesson`
--
ALTER TABLE `giasu_review_lesson`
  ADD CONSTRAINT `giasu_review_lesson_lesson_id_67b11d93_fk_giasu_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `giasu_lesson` (`id`);

--
-- Các ràng buộc cho bảng `giasu_student_group`
--
ALTER TABLE `giasu_student_group`
  ADD CONSTRAINT `giasu_student_group_belong_course_id_dd38749f_fk_giasu_course_id` FOREIGN KEY (`belong_course_id`) REFERENCES `giasu_course` (`id`),
  ADD CONSTRAINT `giasu_student_group_created_by_id_3682b838_fk_accounts_` FOREIGN KEY (`created_by_id`) REFERENCES `accounts_profile` (`id`),
  ADD CONSTRAINT `giasu_student_group_group_id_e15bbe56_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Các ràng buộc cho bảng `giasu_student_group_member`
--
ALTER TABLE `giasu_student_group_member`
  ADD CONSTRAINT `giasu_student_group__profile_id_9f67d5b9_fk_accounts_` FOREIGN KEY (`profile_id`) REFERENCES `accounts_profile` (`id`),
  ADD CONSTRAINT `giasu_student_group__student_group_id_74a77512_fk_giasu_stu` FOREIGN KEY (`student_group_id`) REFERENCES `giasu_student_group` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
