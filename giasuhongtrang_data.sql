-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 03, 2019 lúc 06:11 AM
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
-- Đang đổ dữ liệu cho bảng `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(62, 'Nhom 01');

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

--
-- Đang đổ dữ liệu cho bảng `accounts_major`
--

INSERT INTO `accounts_major` (`id`, `name_major`) VALUES
(6, 'Giáo viên Toán'),
(7, 'Giáo viên hóa'),
(8, 'Giáo viên tin học'),
(9, 'Giao viên tiếng anh');

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
--
-- Đang đổ dữ liệu cho bảng `giasu_calendar_group`
--

INSERT INTO `giasu_calendar_group` (`id`, `day`, `start_time`, `end_time`, `note`, `group_impl_id`) VALUES
(205, '2019-08-14', '06:00:00.000000', '07:00:00.000000', '', 62),
(209, '2019-08-01', '07:00:00.000000', '09:00:00.000000', '', 62),
(210, '2019-08-02', '07:00:00.000000', '09:00:00.000000', '', 62),
(211, '2019-08-03', '07:00:00.000000', '09:00:00.000000', '', 62),
(212, '2019-08-01', '09:00:00.000000', '10:00:00.000000', '', 62);

--
-- Đang đổ dữ liệu cho bảng `giasu_calendar_group_users_impled`
--

INSERT INTO `giasu_calendar_group_users_impled` (`id`, `calendar_group_id`, `profile_id`) VALUES
(144, 205, 2),
(148, 205, 3),
(149, 210, 2),
(150, 211, 2),
(151, 211, 3);

--
-- Đang đổ dữ liệu cho bảng `giasu_carouselslide`
--

INSERT INTO `giasu_carouselslide` (`id`, `title`, `description`, `image`, `date_published`, `pathURL`) VALUES
(1, 'Gia sư Hồng Trang', 'Nơi gởi gấm niềm tin của học sinh và phụ huynh', 'carousel/home_slider_1_mBdLnga.jpg', '2019-03-15', NULL),
(2, 'Thông báo chiêu sinh', 'Nhận dạy kèm các môn Toán - Lý - Hóa - Anh Văn từ lớp 1 đến lớp 12', 'carousel/giasuhongtrang_EMBtGsx.jpg', '2019-03-15', NULL);

--
-- Đang đổ dữ liệu cho bảng `giasu_category`
--

INSERT INTO `giasu_category` (`id`, `cate_name`, `cate_description`, `cate_image`) VALUES
(1, 'Toán', 'Toán học', ''),
(2, 'Hóa', 'Description', ''),
(3, 'Lý', 'Vật lý học', '');

--
-- Đang đổ dữ liệu cho bảng `giasu_course`
--

INSERT INTO `giasu_course` (`id`, `course_name`, `course_description`, `course_target`, `course_require`, `course_image`, `course_duration`, `course_status`, `course_price`, `course_cate_id`) VALUES
(6, 'Hóa học 8', '<p>Chương tr&igrave;nh Ho&aacute; Học 8 cung cấp cho c&aacute;c em những hiểu biết sơ lược, c&oacute; hệ thống về c&aacute;c kh&aacute;i niệm cơ bản như: Chất, nguy&ecirc;n tử, ph&acirc;n tử, c&ocirc;ng thức ho&aacute; học, phương tr&igrave;nh ho&aacute; học, mol, phản ứng ho&aacute; học, dung dịch, nồng độ dung dịch v&agrave; độ tan; Định luật bảo to&agrave;n khối lượng v&agrave; một số chất, hợp chất ho&aacute; học quan trọng như: Oxi, Hiđro, Oxit, Axit, Bazơ, Muối,...</p>', 'Sau khi học xong khóa học này, học sinh có thể:\r\n- Nắm được các khái niệm cơ bản về chất, nguyên tử, phân tử, công thức phân tử\r\n- Biết viết công thức hóa học của chất\r\n- Biết viết phương trình hóa học', '', 'courses/chemistry_7gJKjjd_8CtTUvJ.jpg', '10 tháng', 0, 500, 2),
(7, 'Hóa học 9', '<p>Chương tr&igrave;nh ho&aacute; học lớp 9 cung cấp cho cho bạn đọc những hiểu biết s&acirc;u hơn về cấu tạo của vật chất xung quanh, ngo&agrave;i ra c&ograve;n c&oacute; những biến đổi ho&aacute; học v&agrave; ứng dụng của ch&uacute;ng trong cuộc sống lao động, sản xuất hiện đại. Ngo&agrave;i ra bạn đọc cũng sẽ lần đầu được tiếp cận với chất hữu cơ, bao gồm c&aacute;c hiđrocacbon v&agrave; dẫn xuất của ch&uacute;ng.</p>', 'Khóa học này giúp cho học sinh có kiến thức về:<br/>\r\n- Hóa học vô cơ <br/>\r\n- HÓa học hữu cơ <br/>\r\n- Các hợp chất hidrocacbon và các dẫn xuất của chúng', '', 'courses/course_4_kNBjCb9.jpg', '10 tháng', 1, 500, 2),
(8, 'Hóa học 10', '<p>Chương tr&igrave;nh H&oacute;a học 10 cung cấp cho c&aacute;c em những kiến thức bổ &iacute;ch về H&oacute;a học đại cương v&agrave; một phần H&oacute;a học v&ocirc; cơ. C&aacute;c em sẽ biết nguy&ecirc;n tử được cấu tạo như thế n&agrave;o, thế n&agrave;o l&agrave; c&aacute;c nguy&ecirc;n tố h&oacute;a học, quy tắc sắp xếp c&aacute;c nguy&ecirc;n tố h&oacute;a học trong bảng hệ thống tuần ho&agrave;n ra sao,c&aacute;c kiến thức về tốc độ phản ứng, c&acirc;n bằng h&oacute;a học, đặc điểm v&agrave; t&iacute;nh chất h&oacute;a học của c&aacute;c nguy&ecirc;n tố phi kim điển h&igrave;nh như nh&oacute;m halogen, oxi - lưu huỳnh...</p>', 'Khóa học này giúp cho các em có thể:<br/>\r\n- Nắm được thành phần cấu tạo nguyên tử<br/>\r\n- Nắm được bảng tuần hoàn các nguyên tố hóa học<br/>\r\n- Nắm được các loại liên kết hóa học trong phân tử<br/>\r\n- Nắm được các loại phản ứng hóa học<br/>', '', 'courses/chemistry_QSmwqJR.jpg', '10 tháng', 1, 500, 2);

--
-- Đang đổ dữ liệu cho bảng `giasu_course_course_students`
--

INSERT INTO `giasu_course_course_students` (`id`, `course_id`, `profile_id`) VALUES
(6, 6, 2),
(8, 6, 3),
(7, 7, 4),
(3, 8, 5);

--
-- Đang đổ dữ liệu cho bảng `giasu_course_course_teachers`
--

INSERT INTO `giasu_course_course_teachers` (`id`, `course_id`, `profile_id`) VALUES
(1, 6, 1),
(2, 7, 2),
(3, 8, 2);

--
-- Đang đổ dữ liệu cho bảng `giasu_lesson`
--

INSERT INTO `giasu_lesson` (`id`, `lesson_name`, `lesson_recap`, `lesson_target`, `lesson_detail`, `lesson_image`, `lesson_doc`, `lesson_video`, `lesson_status`, `lesson_order`, `lesson_course_id`) VALUES
(1, 'Nguyên tử', 'Mọi vật thể tự nhiên hay nhân tạo đều được tạo ra từ chất này hay chất khác. Thể còn các chất được tạo ra từ đâu? Ngày nay khoa học đã có câu trả lời rõ ràng cho câu hỏi này hay chưa? Bài “Nguyên tử” sau đây sẽ giúp trả lời câu hỏi trên một cách rõ ràng nhất.', 'Nắm được nguyên tử', '<p><strong><em>1.&nbsp;&nbsp;</em></strong><strong><em>Định nghĩa</em></strong></p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Nguy&ecirc;n tử l&agrave; hạt v&ocirc; c&ugrave;ng nhỏ, trung ho&agrave; về điện, cấu tạo n&ecirc;n c&aacute;c chất.</p>\r\n\r\n<p><strong><em>2. Cấu tạo</em></strong></p>\r\n\r\n<p><strong><em><img alt=\"\" src=\"https://img.toanhoc247.com/picture/2016/0512/5_1.PNG\" style=\"height:164px; width:604px\" /></em></strong></p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp;-&nbsp;&nbsp;&nbsp;&nbsp;Nguy&ecirc;n tử lu&ocirc;n trung h&ograve;a về điện &rarr;</p>\r\n\r\n<p><strong><u>Ch&uacute; &yacute;:</u></strong>&nbsp;Hiđro l&agrave; nguy&ecirc;n tử đặc biệt chỉ c&oacute; duy nhất một hạt proton.</p>\r\n\r\n<p>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Trong nguy&ecirc;n tử, c&aacute;c&nbsp;<strong>e</strong>&nbsp;chuyển động rất nhanh v&agrave; sắp xếp th&agrave;nh từng lớp từ trong ra ngo&agrave;i.</p>\r\n\r\n<p>+ Lớp 1: c&oacute; tối đa 2e</p>\r\n\r\n<p>+ Lớp 2, 3, 4&hellip; &nbsp;tối đa 8e</p>\r\n\r\n<p>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Khối lượng nguy&ecirc;n tử = số P + số N + số e = số P + số N (v&igrave; e c&oacute; khối lượng rất nhỏ n&ecirc;n bỏ qua).</p>', 'courses/cau-tao-nguyen-tu_7zglDgD.jpg', '', 'https://www.youtube.com/watch?v=1xSQlwWGT8M', 1, 1, 6),
(2, 'Đơn chất, hợp chất', 'Ta đã biết các chất được cấu tạo nên từ nguyên tử mà mỗi loại nguyên tử lại là một nguyên tố hóa học. Vậy ta có thể nói: Chất được tạo từ nguyên tố hóa học có được không? Tùy theo có chất được tạo nên từ một, hai hay ba nguyên tố. Dựa vào đó, người ta phân loại chất. Bài viết dưới đây sẽ giúp bạn đọc hiểu rõ hơn về cách phân loại chất.', 'Nắm được đơn chất, hợp chất', '<p><strong>I<em>.&nbsp;<u>Đơn chất:</u></em></strong></p>\r\n\r\n<p><strong>1.&nbsp;<u>Đơn chất l&agrave; g&igrave;?</u></strong></p>\r\n\r\n<p>- Kh&iacute; oxi tạo n&ecirc;n từ nguy&ecirc;n tố O.</p>\r\n\r\n<p>- K.loại Natri&nbsp; tạo n&ecirc;n từ nguy&ecirc;n tố Na.</p>\r\n\r\n<p>- K.loại nh&ocirc;m tạo n&ecirc;n từ nguy&ecirc;n tố Al.</p>\r\n\r\n<p>* Vậy kh&iacute; oxi, kim loại Na, Al gọi l&agrave; đơn chất.</p>\r\n\r\n<p><strong>*<em>&nbsp;<u>Định nghĩa</u>:</em></strong>&nbsp;Đơn chất do 1 nguy&ecirc;n tố ho&aacute; học cấu tạo n&ecirc;n.</p>\r\n\r\n<p>- Đơn chất kim loại: Dẫn điện, dẫn nhiệt, c&oacute; &aacute;nh kim.</p>\r\n\r\n<p>- Đơn chất phi kim: Kh&ocirc;ng dẫn điện, dẫn nhiệt, kh&ocirc;ng c&oacute; &aacute;nh kim.</p>\r\n\r\n<p><strong><em>*<u>Kết luận</u></em></strong>: Đ/c do 1 NTHH cấu tạo n&ecirc;n. Gồm 2 loại đơn chất :</p>\r\n\r\n<p>+ Kim loại.</p>\r\n\r\n<p>+ Phi kim.</p>\r\n\r\n<p><strong>2<u>.Đặc điểm cấu tạo</u>:</strong></p>\r\n\r\n<p>- Đơn chất KL: Nguy&ecirc;n tử sắp xếp kh&iacute;t&nbsp; nhau v&agrave; theo một trật tự x&aacute;c định.</p>\r\n\r\n<p>- Đơn chất PK: Nguy&ecirc;n tử li&ecirc;n kết với nhau theo một số nhất định (Thường l&agrave; 2).</p>\r\n\r\n<p><strong><em>II.<u>Hợp chất</u>:</em></strong></p>\r\n\r\n<p><strong>1.<u>Hợp chất l&agrave; g&igrave;?</u></strong></p>\r\n\r\n<p><strong><em>VD:</em></strong></p>\r\n\r\n<p><strong>-</strong>Nước: H<sub>2</sub>O&nbsp;&nbsp;&nbsp; &nbsp;Nguy&ecirc;n tố H&nbsp;&nbsp;&nbsp;&nbsp; v&agrave; O.</p>\r\n\r\n<p>-M.ăn: NaCl&nbsp;&nbsp; &nbsp;&nbsp;Nguy&ecirc;n tố Na v&agrave; Cl.</p>\r\n\r\n<p>-A.sunfuric: H<sub>2</sub>SO<sub>4</sub>Nguy&ecirc;n tố H, S v&agrave; O.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<sub>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</sub></p>\r\n\r\n<p><strong><em>* Định nghĩa:</em></strong>&nbsp;Hợp chất l&agrave; những chất tạo n&ecirc;n từ 2 NTHH trở l&ecirc;n.</p>\r\n\r\n<p>- Hợp chất gồm:</p>\r\n\r\n<p>&nbsp;&nbsp; + Hợp chất v&ocirc; cơ:</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; H<sub>2</sub>O, NaOH, NaCl, H<sub>2</sub>SO<sub>4</sub>....</p>\r\n\r\n<p>&nbsp;&nbsp; + Hợp chất hữu cơ:</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CH<sub>4&nbsp;</sub>(M&ecirc; tan), C<sub>12</sub>H<sub>22</sub>O<sub>11&nbsp;</sub>(đường),</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; C<sub>2</sub>H<sub>2&nbsp;</sub>(Axetilen), C<sub>2</sub>H<sub>4&nbsp;</sub>(Etilen)....</p>\r\n\r\n<p><strong>2<u>.Đặc điểm cấu tạo</u>:</strong></p>\r\n\r\n<p>- Trong hợp chất: Nguy&ecirc;n tố li&ecirc;n kết với nhau theo một tỷ lệ v&agrave; một thứ tự nhất định</p>\r\n\r\n<p><strong><em>III.&nbsp;<u>Ph&acirc;n tử</u>:</em></strong></p>\r\n\r\n<p><strong>1<u>.Định nghĩa</u>:</strong></p>\r\n\r\n<p><strong><u>VD:</u></strong>&nbsp;- Kh&iacute; hiđro, oxi : 2 nguy&ecirc;n tử c&ugrave;ng loại li&ecirc;n kết với nhau.</p>\r\n\r\n<p>- Nước : 2H li&ecirc;n kết với 1O.</p>\r\n\r\n<p>- Muối ăn: 1Na li&ecirc;n kết với 1Cl.</p>\r\n\r\n<p><strong><em>* Định nghĩa:</em></strong>&nbsp; Ph&acirc;n tử l&agrave; hạt đại diện cho chất, gồm một số nguy&ecirc;n tử li&ecirc;n kết với nhau v&agrave; thể hiện đầy đủ t&iacute;nh chất ho&aacute; học của chất.</p>\r\n\r\n<p><strong>2<u>.Ph&acirc;n tử khối</u>:</strong></p>\r\n\r\n<p>*&nbsp;<strong><em><u>Định nghĩa</u>:</em></strong></p>\r\n\r\n<p>&nbsp;<strong>VD:</strong>O<sub>2</sub>&nbsp;= 2.16 = 32 đvC ; Cl<sub>2</sub>&nbsp;= 71 đvC.</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CaCO<sub>3</sub>&nbsp;= 100 đvC&nbsp;&nbsp; ; H<sub>2</sub>SO<sub>4</sub>&nbsp;= 98 đvC.</p>\r\n\r\n<p><strong><em>IV.<u>Trạng th&aacute;i của chất:</u></em></strong></p>\r\n\r\n<p>- Mỗi mẫu chất l&agrave; một tập hợp v&ocirc; c&ugrave;ng lớn những hạt nguy&ecirc;n tử hay ph&acirc;n tử .</p>\r\n\r\n<p>- Tuỳ điều kiện m&ocirc;ĩ chất c&oacute; thể ở 3 trạng th&aacute;i: rắn, lỏng, kh&iacute;.ở trạng th&aacute;i kh&iacute; c&aacute;c hạt c&aacute;ch xa nhau.</p>\r\n\r\n<p><strong>So s&aacute;nh đơn chất v&agrave; hợp chất</strong></p>\r\n\r\n<table border=\"1\" cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"vertical-align:top\">\r\n			<p>&nbsp;</p>\r\n			</td>\r\n			<td style=\"vertical-align:top\">\r\n			<p><strong>Đơn chất</strong></p>\r\n			</td>\r\n			<td style=\"vertical-align:top\">\r\n			<p><strong>Hợp chất</strong></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top\">\r\n			<p>VD</p>\r\n			</td>\r\n			<td style=\"vertical-align:top\">\r\n			<p>Sắt, đồng, oxi, nitơ, than ch&igrave;&hellip;</p>\r\n			</td>\r\n			<td style=\"vertical-align:top\">\r\n			<p>Nước, muối ăn, đường&hellip;</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top\">\r\n			<p>K/N</p>\r\n			</td>\r\n			<td style=\"vertical-align:top\">\r\n			<p>L&agrave; những chất do 1 nguy&ecirc;n tố ho&aacute; học cấu tạo n&ecirc;n</p>\r\n			</td>\r\n			<td style=\"vertical-align:top\">\r\n			<p>L&agrave; những chất do 2 hay nhiều nguy&ecirc;n tố ho&aacute; học cấu tạo n&ecirc;n</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top\">\r\n			<p>Ph&acirc;n loại</p>\r\n			</td>\r\n			<td style=\"vertical-align:top\">\r\n			<p>Gồm 2 loại: Kim loại v&agrave; phi kim.</p>\r\n			</td>\r\n			<td style=\"vertical-align:top\">\r\n			<p>Gồm 2 loại: hợp chất v&ocirc; cơ v&agrave; hợp chất hữu cơ</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top\">\r\n			<p>Ph&acirc;n tử</p>\r\n\r\n			<p>(hạt đại diện)</p>\r\n			</td>\r\n			<td style=\"vertical-align:top\">\r\n			<p>- Gồm 1 nguy&ecirc;n tử: kim loại v&agrave; phi kim rắn</p>\r\n\r\n			<p>- Gồm c&aacute;c nguy&ecirc;n tử c&ugrave;ng loại: Phi kim lỏng v&agrave; kh&iacute;</p>\r\n			</td>\r\n			<td style=\"vertical-align:top\">\r\n			<p>- Gồm c&aacute;c nguy&ecirc;n tử kh&aacute;c loại thuộc c&aacute;c nguy&ecirc;n tố ho&aacute; học kh&aacute;c nhau</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top\">\r\n			<p>CTHH</p>\r\n			</td>\r\n			<td style=\"vertical-align:top\">\r\n			<p>- Kim loại v&agrave; phi kim rắn:</p>\r\n\r\n			<p>CTHH &ordm; KHHH&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (A)</p>\r\n\r\n			<p>- Phi kim lỏng v&agrave; kh&iacute;:</p>\r\n\r\n			<p>CTHH = KHHH + chỉ số&nbsp;&nbsp;&nbsp; (A<sub>x</sub>)</p>\r\n			</td>\r\n			<td style=\"vertical-align:top\">\r\n			<p>CTHH = KHHH của c&aacute;c nguy&ecirc;n tố + c&aacute;c chỉ số tương ứng</p>\r\n\r\n			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; A<sub>x</sub>B<sub>y</sub></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p><strong>&nbsp;</strong></p>\r\n\r\n<p><strong>So s&aacute;nh nguy&ecirc;n tử v&agrave; ph&acirc;n tử</strong></p>\r\n\r\n<table border=\"1\" cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"vertical-align:top\">\r\n			<p>&nbsp;</p>\r\n			</td>\r\n			<td style=\"vertical-align:top\">\r\n			<p><strong>nguy&ecirc;n tử</strong></p>\r\n			</td>\r\n			<td style=\"vertical-align:top\">\r\n			<p><strong>ph&acirc;n tử</strong></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top\">\r\n			<p>Định nghĩa</p>\r\n			</td>\r\n			<td style=\"vertical-align:top\">\r\n			<p>L&agrave; hạt v&ocirc; c&ugrave;ng nhỏ, trung ho&agrave; về điện, cấu tạo n&ecirc;n c&aacute;c chất</p>\r\n			</td>\r\n			<td style=\"vertical-align:top\">\r\n			<p>L&agrave; hạt v&ocirc; c&ugrave;ng nhỏ, đại diện cho chất v&agrave; mang đầy đủ t&iacute;nh chất của chất</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top\">\r\n			<p>Sự biến đổi trong phản ứng ho&aacute; học.</p>\r\n			</td>\r\n			<td style=\"vertical-align:top\">\r\n			<p>Nguy&ecirc;n tử được bảo to&agrave;n trong c&aacute;c phản ứng ho&aacute; học.</p>\r\n			</td>\r\n			<td style=\"vertical-align:top\">\r\n			<p>Li&ecirc;n kết giữa c&aacute;c nguy&ecirc;n tử trong ph&acirc;n tử thay đổi l&agrave;m cho ph&acirc;n tử n&agrave;y biến đổi th&agrave;nh ph&acirc;n tử kh&aacute;c</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:top\">\r\n			<p>Khối lượng</p>\r\n			</td>\r\n			<td style=\"vertical-align:top\">\r\n			<p>Nguy&ecirc;n tử khối (NTK) cho biết độ nặng nhẹ kh&aacute;c nhau giữa c&aacute;c nguy&ecirc;n tử v&agrave; l&agrave; đại lượng đặc trưng cho mỗi nguy&ecirc;n tố</p>\r\n\r\n			<p>NTK l&agrave; khối lượng của nguy&ecirc;n tử t&iacute;nh bằng đơn vị Cacbon</p>\r\n			</td>\r\n			<td style=\"vertical-align:top\">\r\n			<p>Ph&acirc;n tử khối (PTK) l&agrave; khối lượng của 1 ph&acirc;n tử t&iacute;nh bằng đơn vị Cacbon</p>\r\n\r\n			<p>PTK = tổng khối lượng c&aacute;c nguy&ecirc;n tử c&oacute; trong ph&acirc;n tử.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p><strong>&nbsp;</strong></p>', '', '', NULL, 1, 2, 6);

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

--
-- Đang đổ dữ liệu cho bảng `giasu_practice`
--

INSERT INTO `giasu_practice` (`id`, `pratice_name`, `practice_detail`, `pratice_answer`, `pratice_lesson_id`) VALUES
(1, 'Bài 1', '<p>Nguy&ecirc;n tử A c&oacute; tổng số hạt l&agrave; 52, trong đ&oacute; số hạt mang điện nhiều hơn số hạt kh&ocirc;ng mang điện l&agrave; 16. T&iacute;nh số hạt từng loại.</p>', '<p><span style=\"font-size:16px\">Ki&ecirc;́n thức c&acirc;̀n chú ý đ&ecirc;̉ giải bài t&acirc;̣p dạng này:</span></p>\r\n\r\n<p><span style=\"font-size:16px\">- Nguy&ecirc;n tử g&ocirc;̀m 3 loại hạt: hạt proton và electron mang đi&ecirc;̣n; hạt noron kh&ocirc;ng mang đi&ecirc;̣n.</span></p>\r\n\r\n<p><span style=\"font-size:16px\">- T&ocirc;̉ng s&ocirc;́ hạt của nguy&ecirc;n tử: X = p + e + n = 2p +n (Vì ở trạng trái trung hòa v&ecirc;̀ đi&ecirc;̣n, s&ocirc;́ hạt proton bằng s&ocirc;́ hạt electron)</span></p>\r\n\r\n<p><span style=\"font-size:16px\">- S&ocirc;́ kh&ocirc;́i: A = p + n</span></p>\r\n\r\n<p><span style=\"font-size:16px\">** Áp dụng:</span></p>\r\n\r\n<p><span style=\"font-size:16px\">A:&nbsp;&nbsp;2p + n&nbsp;= 52</span></p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; 2p - n = 16</p>\r\n\r\n<p>--&gt; p = e = 12, n&nbsp;= 8&nbsp;&nbsp;</p>', 1);

--
-- Đang đổ dữ liệu cho bảng `giasu_dopractice`
--

INSERT INTO `giasu_dopractice` (`id`, `answer`, `practice_id`, `user_id`) VALUES
(1, '<p>Chào các bạn</p>\n', 1, 1);

--
-- Đang đổ dữ liệu cho bảng `giasu_register_course`
--

INSERT INTO `giasu_register_course` (`id`, `status`, `course_register_id`, `user_register_id`) VALUES
(10, 0, 6, 1),
(14, 0, 7, 1);

--
-- Đang đổ dữ liệu cho bảng `giasu_review_course`
--

INSERT INTO `giasu_review_course` (`course_id`, `star1`, `star2`, `star3`, `star4`, `star5`) VALUES
(6, 5, 0, 0, 0, 0),
(7, 0, 0, 0, 0, 0),
(8, 3, 0, 0, 0, 0);

--
-- Đang đổ dữ liệu cho bảng `giasu_review_lesson`
--

INSERT INTO `giasu_review_lesson` (`lesson_id`, `star1`, `star2`, `star3`, `star4`, `star5`) VALUES
(1, 0, 0, 0, 0, 0),
(2, 0, 0, 0, 0, 0);

--
-- Đang đổ dữ liệu cho bảng `giasu_student_group`
--

INSERT INTO `giasu_student_group` (`id`, `date_created`, `belong_course_id`, `created_by_id`, `group_id`) VALUES
(15, '2019-08-12 00:55:24.798256', 6, 1, 62);

--
-- Đang đổ dữ liệu cho bảng `giasu_student_group_member`
--

INSERT INTO `giasu_student_group_member` (`id`, `student_group_id`, `profile_id`) VALUES
(22, 15, 2),
(32, 15, 3);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
