-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 04, 2024 lúc 12:32 PM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `qldienthoai`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietdondat`
--

CREATE TABLE `chitietdondat` (
  `Machitietdondat` int(11) NOT NULL,
  `Soluong` int(11) NOT NULL,
  `Giadon` int(11) NOT NULL,
  `Madondat` int(11) NOT NULL,
  `Masanpham` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `chitietdondat`
--

INSERT INTO `chitietdondat` (`Machitietdondat`, `Soluong`, `Giadon`, `Madondat`, `Masanpham`) VALUES
(2, 2, 1200000, 6, 4),
(3, 1, 1200000, 7, 21),
(4, 1, 34000000, 8, 2),
(5, 1, 34000000, 9, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietnhapkho`
--

CREATE TABLE `chitietnhapkho` (
  `Machitietnhap` int(11) NOT NULL,
  `Soluong` int(11) NOT NULL,
  `Manhapkho` int(11) NOT NULL,
  `Masanpham` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `chitietnhapkho`
--

INSERT INTO `chitietnhapkho` (`Machitietnhap`, `Soluong`, `Manhapkho`, `Masanpham`) VALUES
(1, 15, 1, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietsp`
--

CREATE TABLE `chitietsp` (
  `Machitietsp` int(11) NOT NULL,
  `Masp` int(11) NOT NULL,
  `IMEI` int(11) NOT NULL,
  `Tinhtrangban` varchar(50) NOT NULL,
  `Machitietnhapkho` int(11) NOT NULL,
  `Machitietdondat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dactrung`
--

CREATE TABLE `dactrung` (
  `Madactrung` int(11) NOT NULL,
  `Maloaidactrung` int(11) NOT NULL,
  `Tendactrung` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `dactrung`
--

INSERT INTO `dactrung` (`Madactrung`, `Maloaidactrung`, `Tendactrung`) VALUES
(1, 1, 'LED'),
(2, 1, 'OLED'),
(3, 4, '64G'),
(4, 4, '32G'),
(5, 2, 'A16'),
(6, 2, 'A17'),
(7, 5, 'Xanh'),
(8, 5, 'Đỏ'),
(9, 3, '4G'),
(10, 3, '6G'),
(12, 6, '6 Tháng'),
(13, 6, '12 Tháng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dondat`
--

CREATE TABLE `dondat` (
  `Madondat` int(11) NOT NULL,
  `Thoigian` datetime(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `total` int(11) NOT NULL,
  `Loaidondat` varchar(50) NOT NULL,
  `Trangthaitt` int(11) NOT NULL,
  `Manhanvien` int(11) NOT NULL,
  `Makhachhang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `dondat`
--

INSERT INTO `dondat` (`Madondat`, `Thoigian`, `name`, `address`, `phone`, `total`, `Loaidondat`, `Trangthaitt`, `Manhanvien`, `Makhachhang`) VALUES
(6, '2023-11-08 23:28:46.000000', 'Manh Thu', 'Manh jkbUDGUQWIHDO', '0483248720', 2400000, 'Dat', 0, 6, 7),
(7, '2023-11-09 07:39:50.000000', 'Manh Thu', 'Manh jkbUDGUQWIHDO', '0483248720', 1200000, 'Dat', 2, 6, 7),
(8, '2023-11-15 21:28:08.000000', 'Manh Thu', 'Ha Noi', '0483248720', 34000000, 'Dat', 3, 6, 7),
(9, '2023-11-16 10:41:07.000000', 'Manh Thu', 'Ha Noi', '0483248720', 34000000, 'Dat', 1, 0, 7);

--
-- Bẫy `dondat`
--
DELIMITER $$
CREATE TRIGGER `dondat_time` BEFORE INSERT ON `dondat` FOR EACH ROW BEGIN
    SET NEW.Thoigian = NOW();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dtsp`
--

CREATE TABLE `dtsp` (
  `Madtsp` int(11) NOT NULL,
  `Masp` int(11) NOT NULL,
  `Madactrung` int(11) NOT NULL,
  `Ten` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `dtsp`
--

INSERT INTO `dtsp` (`Madtsp`, `Masp`, `Madactrung`, `Ten`) VALUES
(12, 1, 1, 'IP16_LED'),
(13, 1, 3, ''),
(14, 1, 5, ''),
(15, 1, 7, ''),
(16, 1, 9, ''),
(17, 1, 12, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaidactrung`
--

CREATE TABLE `loaidactrung` (
  `Maloaidactrung` int(11) NOT NULL,
  `Tenloaidactrung` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `loaidactrung`
--

INSERT INTO `loaidactrung` (`Maloaidactrung`, `Tenloaidactrung`) VALUES
(1, 'Màn hình'),
(2, 'Chíp'),
(3, 'Ram'),
(4, 'Bộ nhớ'),
(5, 'Màu'),
(6, 'Bảo hành');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaisp`
--

CREATE TABLE `loaisp` (
  `Maloaisp` int(11) NOT NULL,
  `Tenloaisp` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `loaisp`
--

INSERT INTO `loaisp` (`Maloaisp`, `Tenloaisp`) VALUES
(0, 'Apple'),
(1, 'Samsung'),
(3, 'Xiaomi'),
(5, 'IMac');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhapkho`
--

CREATE TABLE `nhapkho` (
  `Manhapkho` int(11) NOT NULL,
  `Thoigian` datetime(6) NOT NULL,
  `Trangthaitt` int(11) NOT NULL,
  `Manhanvien` int(11) NOT NULL,
  `MaNCC` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `nhapkho`
--

INSERT INTO `nhapkho` (`Manhapkho`, `Thoigian`, `Trangthaitt`, `Manhanvien`, `MaNCC`) VALUES
(1, '2023-10-02 22:15:43.000000', 3, 1, 2),
(2, '2023-11-07 13:36:08.000000', 1, 2, 1),
(4, '2023-11-09 07:44:52.000000', 1, 6, 1);

--
-- Bẫy `nhapkho`
--
DELIMITER $$
CREATE TRIGGER `nhapkho_time` BEFORE INSERT ON `nhapkho` FOR EACH ROW BEGIN
    SET NEW.Thoigian = NOW();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `Masp` int(11) NOT NULL,
  `Maloaisp` int(11) NOT NULL,
  `Tensp` varchar(50) NOT NULL,
  `Soluong` int(11) NOT NULL,
  `Dongianhap` int(11) NOT NULL,
  `Dongiaban` int(11) NOT NULL,
  `Hinhanh` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`Masp`, `Maloaisp`, `Tensp`, `Soluong`, `Dongianhap`, `Dongiaban`, `Hinhanh`) VALUES
(1, 1, 'Iphone16', 10, 3000000, 34000000, 'ip.jpg'),
(2, 0, 'Iphone14', 10, 3000000, 34000000, 'ip3.jpg'),
(3, 0, 'Iphone13', 3, 2000000, 24000000, 'ip4.jpg'),
(4, 0, 'Iphone 11', 10, 1000000, 1200000, 'ip5.jpg'),
(20, 1, 'Samsung 10', 10, 1200000, 3000000, 'ss5.jpg'),
(21, 3, 'Xiaomi 1', 15, 500000, 1200000, 'mi3.jpg'),
(22, 3, 'xM12', 10, 1000000, 1200000, 'vid-1.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoan`
--

CREATE TABLE `taikhoan` (
  `Mataikhoan` int(11) NOT NULL,
  `Tendangnhap` varchar(50) NOT NULL,
  `Matkhau` varchar(50) NOT NULL,
  `Loaitaikhoan` varchar(50) NOT NULL,
  `Hoten` varchar(50) NOT NULL,
  `Diachi` varchar(50) NOT NULL,
  `Gioitinh` varchar(50) NOT NULL,
  `SDT` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `taikhoan`
--

INSERT INTO `taikhoan` (`Mataikhoan`, `Tendangnhap`, `Matkhau`, `Loaitaikhoan`, `Hoten`, `Diachi`, `Gioitinh`, `SDT`) VALUES
(0, 'xxxxxx', 'xxxxxx', 'Chưa xác định', 'xxxxxx', 'xxxxxx', 'xxxxxx', 'xxxxxx'),
(1, 'NV', 'ngthu321', 'NV', '', '', '', ''),
(2, 'NCC', 'ngthu321', 'NCC', '', '', '', ''),
(4, 'KH', 'ngthu321', 'NV', '', '', '', ''),
(6, 'ngmanh321', '8de06fd249375fa96540fa1d6a6f7f93', 'NV', 'Manh Nguyen', '', '', ''),
(7, 'ngthu321', '8de06fd249375fa96540fa1d6a6f7f93', 'KH', 'Manh Thu', 'Ha Noi', 'Nam', '0483248720');

--
-- Bẫy `taikhoan`
--
DELIMITER $$
CREATE TRIGGER `new_tk` BEFORE INSERT ON `taikhoan` FOR EACH ROW set new.Loaitaikhoan = 'KH'
$$
DELIMITER ;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chitietdondat`
--
ALTER TABLE `chitietdondat`
  ADD PRIMARY KEY (`Machitietdondat`),
  ADD KEY `FK_chitietdondat_dondat` (`Madondat`),
  ADD KEY `FK_chitietdondat_sanpham` (`Masanpham`);

--
-- Chỉ mục cho bảng `chitietnhapkho`
--
ALTER TABLE `chitietnhapkho`
  ADD PRIMARY KEY (`Machitietnhap`),
  ADD KEY `FK_chitietnhapkho_nhapkho` (`Manhapkho`),
  ADD KEY `FK_chitietnhapkho_sanpham` (`Masanpham`);

--
-- Chỉ mục cho bảng `chitietsp`
--
ALTER TABLE `chitietsp`
  ADD PRIMARY KEY (`Machitietsp`),
  ADD KEY `FK_chitietsp_sanpham` (`Masp`),
  ADD KEY `FK_chitietsp_chitietnhapkho` (`Machitietnhapkho`),
  ADD KEY `FK_chitietsp_chitietdondat` (`Machitietdondat`);

--
-- Chỉ mục cho bảng `dactrung`
--
ALTER TABLE `dactrung`
  ADD PRIMARY KEY (`Madactrung`),
  ADD UNIQUE KEY `Maloaidactrung` (`Maloaidactrung`,`Madactrung`) USING BTREE;

--
-- Chỉ mục cho bảng `dondat`
--
ALTER TABLE `dondat`
  ADD PRIMARY KEY (`Madondat`),
  ADD UNIQUE KEY `Thoigian` (`Thoigian`,`Makhachhang`) USING BTREE,
  ADD KEY `FK_dondat_khachhang` (`Makhachhang`),
  ADD KEY `FK_dondat_nhanvien` (`Manhanvien`);

--
-- Chỉ mục cho bảng `dtsp`
--
ALTER TABLE `dtsp`
  ADD PRIMARY KEY (`Madtsp`),
  ADD UNIQUE KEY `dtsp_unique` (`Masp`,`Madactrung`),
  ADD KEY `FK_dtsp_dt` (`Madactrung`);

--
-- Chỉ mục cho bảng `loaidactrung`
--
ALTER TABLE `loaidactrung`
  ADD PRIMARY KEY (`Maloaidactrung`);

--
-- Chỉ mục cho bảng `loaisp`
--
ALTER TABLE `loaisp`
  ADD PRIMARY KEY (`Maloaisp`);

--
-- Chỉ mục cho bảng `nhapkho`
--
ALTER TABLE `nhapkho`
  ADD PRIMARY KEY (`Manhapkho`),
  ADD UNIQUE KEY `Thoigian` (`Thoigian`,`Manhapkho`) USING BTREE,
  ADD KEY `FK_nhapkho_nhanvien` (`Manhanvien`),
  ADD KEY `FK_nhapkho_NCC` (`MaNCC`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`Masp`),
  ADD KEY `FK_sanpham_loaisp` (`Maloaisp`);

--
-- Chỉ mục cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`Mataikhoan`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `chitietdondat`
--
ALTER TABLE `chitietdondat`
  MODIFY `Machitietdondat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `chitietnhapkho`
--
ALTER TABLE `chitietnhapkho`
  MODIFY `Machitietnhap` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `chitietsp`
--
ALTER TABLE `chitietsp`
  MODIFY `Machitietsp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `dactrung`
--
ALTER TABLE `dactrung`
  MODIFY `Madactrung` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `dondat`
--
ALTER TABLE `dondat`
  MODIFY `Madondat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `dtsp`
--
ALTER TABLE `dtsp`
  MODIFY `Madtsp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `loaidactrung`
--
ALTER TABLE `loaidactrung`
  MODIFY `Maloaidactrung` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `loaisp`
--
ALTER TABLE `loaisp`
  MODIFY `Maloaisp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `nhapkho`
--
ALTER TABLE `nhapkho`
  MODIFY `Manhapkho` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `Masp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  MODIFY `Mataikhoan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chitietdondat`
--
ALTER TABLE `chitietdondat`
  ADD CONSTRAINT `FK_chitietdondat_dondat` FOREIGN KEY (`Madondat`) REFERENCES `dondat` (`Madondat`),
  ADD CONSTRAINT `FK_chitietdondat_sanpham` FOREIGN KEY (`Masanpham`) REFERENCES `sanpham` (`Masp`);

--
-- Các ràng buộc cho bảng `chitietnhapkho`
--
ALTER TABLE `chitietnhapkho`
  ADD CONSTRAINT `FK_chitietnhapkho_nhapkho` FOREIGN KEY (`Manhapkho`) REFERENCES `nhapkho` (`Manhapkho`),
  ADD CONSTRAINT `FK_chitietnhapkho_sanpham` FOREIGN KEY (`Masanpham`) REFERENCES `sanpham` (`Masp`);

--
-- Các ràng buộc cho bảng `chitietsp`
--
ALTER TABLE `chitietsp`
  ADD CONSTRAINT `FK_chitietsp_chitietdondat` FOREIGN KEY (`Machitietdondat`) REFERENCES `chitietdondat` (`Machitietdondat`),
  ADD CONSTRAINT `FK_chitietsp_chitietnhapkho` FOREIGN KEY (`Machitietnhapkho`) REFERENCES `chitietnhapkho` (`Machitietnhap`),
  ADD CONSTRAINT `FK_chitietsp_sanpham` FOREIGN KEY (`Masp`) REFERENCES `sanpham` (`Masp`);

--
-- Các ràng buộc cho bảng `dactrung`
--
ALTER TABLE `dactrung`
  ADD CONSTRAINT `FK_dactrung_loaidactrung` FOREIGN KEY (`Maloaidactrung`) REFERENCES `loaidactrung` (`Maloaidactrung`);

--
-- Các ràng buộc cho bảng `dondat`
--
ALTER TABLE `dondat`
  ADD CONSTRAINT `FK_dondat_khachhang` FOREIGN KEY (`Makhachhang`) REFERENCES `taikhoan` (`Mataikhoan`),
  ADD CONSTRAINT `FK_dondat_nhanvien` FOREIGN KEY (`Manhanvien`) REFERENCES `taikhoan` (`Mataikhoan`);

--
-- Các ràng buộc cho bảng `dtsp`
--
ALTER TABLE `dtsp`
  ADD CONSTRAINT `FK_dtsp_dt` FOREIGN KEY (`Madactrung`) REFERENCES `dactrung` (`Madactrung`),
  ADD CONSTRAINT `FK_dtsp_sanpham` FOREIGN KEY (`Masp`) REFERENCES `sanpham` (`Masp`);

--
-- Các ràng buộc cho bảng `nhapkho`
--
ALTER TABLE `nhapkho`
  ADD CONSTRAINT `FK_nhapkho_NCC` FOREIGN KEY (`MaNCC`) REFERENCES `taikhoan` (`Mataikhoan`),
  ADD CONSTRAINT `FK_nhapkho_nhanvien` FOREIGN KEY (`Manhanvien`) REFERENCES `taikhoan` (`Mataikhoan`);

--
-- Các ràng buộc cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `FK_sanpham_loaisp` FOREIGN KEY (`Maloaisp`) REFERENCES `loaisp` (`Maloaisp`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
