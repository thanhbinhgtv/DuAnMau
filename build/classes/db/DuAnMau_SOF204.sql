CREATE DATABASE Binhpro
Go
USE BinhPro
Go
----TẠO BẢNG NhanVien
IF Object_ID('NhanVien') is not null
	drop table NhanVien
Create table NhanVien
(
	MaNV		Nvarchar(20) not null,
	MatKhau		Nvarchar(50) not null,
	HoTen		Nvarchar(50) not null,
	VaiTro		Bit not null Default 0,
	Constraint PK_NhanVien Primary key(MaNV),
)
----TẠO BẢNG NguoiHoc
IF Object_ID('NguoiHoc') is not null
	drop table NguoiHoc
Create table NguoiHoc
(
	MaNH		Nvarchar(20) not null,
	HoTen		Nvarchar(50) not null,
	NgaySinh	Date not null,
	GioiTinh	Bit not null Default 0,
	DienThoai	Nvarchar(50) not null,
	Email		Nvarchar(50) not null,
	GhiChu		Nvarchar(250) null,
	MaNV		Nvarchar(20) not  null,
	NgayDK		Date not null Default Getdate(),
	Constraint PK_NguoiHoc Primary key(MaNH),
	Constraint FK_NguoiHoc_NhanVien Foreign Key(MaNV) References NhanVien,
)
----TẠO BẢNG ChuyenDe
IF Object_ID('ChuyenDe') is not null
	drop table ChuyenDe
Create table ChuyenDe
(
	MaCD		Nvarchar(20) not null,
	TenCD		Nvarchar(50) not null,
	HocPhi		Float not null,
	ThoiLuong	Int not null,
	Hinh		Nvarchar(50) not null,
	MoTa		Nvarchar(250) not null,
	Constraint PK_ChuyenDe Primary key(MaCD),
)
----TẠO BẢNG KhoaHoc
IF Object_ID('KhoaHoc') is not null
	drop table KhoaHoc
Create table KhoaHoc
(
	MaKH	Int Identity(1,1) not null,
	MaCD	Nvarchar(20) not null,
	HocPhi		Float not null Default 0,
	ThoiLuong	Int not null Default 0,
	NgayKG		Date not null,
	GhiChu		Nvarchar(250) null,
	MaNV	Nvarchar(20) not null,
	NgayTao		Date not null Default Getdate(),
	Constraint PK_KhoaHoc_HocVien Primary Key(MaKH),
	Constraint FK_KhoaHoc_ChuyenDe Foreign Key(MaCD) References ChuyenDe On Update Cascade,
	Constraint FK_KhoaHoc_NhanVien Foreign Key(MaNV) References NhanVien On Update Cascade,
)
----TẠO BẢNG HocVien
IF Object_ID('HocVien') is not null
	drop table HocVien
Create table HocVien
(
	MaHV	Int Identity not null,
	MaKH	Int not null,
	MaNH	Nvarchar(20) not null,
	Diem	Float not null Default 0,
	Constraint PK_HocVien Primary key(MaHV),
	Constraint FK_HocVien_KhoaHoc Foreign Key(MaKH) References KhoaHoc,
	Constraint FK_HocVien_NguoiHoc Foreign Key(MaNH) References NguoiHoc,
)
------Nhan Vien
Delete From NhanVien
Insert Into NhanVien Values('NV1', '123', 'Thanh Binh', 1)
Insert Into NhanVien Values('NV2', '123', 'Thanh Loan', 0)
Insert Into NhanVien Values('NV3', '123', 'Hoang Thao', 0)
------Nguoi Hoc
Delete From NguoiHoc
Insert Into NguoiHoc Values('PH09268', 'Thanh Binh' ,'1996-06-19', 1,  '0973800896', 'binh@fpt.edu.vn', '', 'NV1', '2020-01-15')
Insert Into NguoiHoc Values('PH09265', 'Nguyen Hang','2000-08-22', 0,  '0973800855', 'hang@fpt.edu.vn', '', 'NV2', '2020-01-19')
Insert Into NguoiHoc Values('PH09263', 'Hoang Thao','1998-03-11', 0,  '0973800862', 'thao@fpt.edu.vn', '', 'NV3', '2020-01-25')
------Chuyen De
Delete From ChuyenDe
Insert Into ChuyenDe Values('Java1', N'Công Nghệ', 150, 5, 'GAME.png', N'Tốt')
Insert Into ChuyenDe Values('Java2', N'Khoa Học', 200, 3, 'HTCS.jpg', N'Rất Tốt')
Insert Into ChuyenDe Values('Java3', N'Lập Trình Java', 220, 3, 'INMA.jpg', N'Chưa Tốt')
Insert Into ChuyenDe Values('HTML5', N'WebSite', 150, 5, 'Capture.PNG', N'Tốt')
Insert Into ChuyenDe Values('Web22', N'Web Nâng Cao', 200, 3, 'MOWE.png', N'Rất Tốt')
Insert Into ChuyenDe Values('MOB30', N'Lập Trình PHP', 220, 3, 'LAYO.jpg', N'Chưa Tốt')
------Khoa Hoc
Delete From KhoaHoc
Insert Into KhoaHoc Values('Java1', 150, 5, '2020-01-20', '', 'NV1', '2020-01-14')
Insert Into KhoaHoc Values('Java2', 200, 3, '2020-01-22', '', 'NV2', '2020-01-14')
Insert Into KhoaHoc Values('Java3', 220, 3, '2020-01-24', '', 'NV3', '2020-01-14')
Insert Into KhoaHoc Values('HTML5', 150, 5, '2020-01-20', '', 'NV1', '2020-01-14')
Insert Into KhoaHoc Values('Web22', 200, 3, '2020-01-22', '', 'NV2', '2020-01-14')
Insert Into KhoaHoc Values('MOB30', 220, 3, '2020-01-24', '', 'NV3', '2020-01-14')
------Hoc Vien
Delete From HocVien
Insert Into HocVien Values(35, 'PH09268', 10)
Insert Into HocVien Values(36, 'PH09265', 8)
Insert Into HocVien Values(37, 'PH09263', 6)
Insert Into HocVien Values(38, 'PH09268', 10)
Insert Into HocVien Values(39, 'PH09265', 8)
Insert Into HocVien Values(40, 'PH09263', 6)

Select * From NhanVien
Select * From NguoiHoc
Select * From ChuyenDe
Select * From KhoaHoc
Select * From HocVien
---------
CREATE PROC [dbo].[sp_BangDiem](@MaKH INT)
AS BEGIN
	SELECT
		nh.MaNH,
		nh.HoTen,
		hv.Diem
	FROM HocVien hv
		JOIN NguoiHoc nh ON nh.MaNH=hv.MaNH
	WHERE hv.MaKH = @MaKH
	ORDER BY hv.Diem DESC
END
---------
CREATE PROC [dbo].[sp_ThongKeDiem]
AS BEGIN
	SELECT
		TenCD ChuyenDe,
		COUNT(MaHV) SoHV,
		MIN(Diem) ThapNhat,
		MAX(Diem) CaoNhat,
		AVG(Diem) TrungBinh
	FROM KhoaHoc kh
		JOIN HocVien hv ON kh.MaKH=hv.MaKH
		JOIN ChuyenDe cd ON cd.MaCD=kh.MaCD
	GROUP BY TenCD
END
---------

CREATE PROC [dbo].[sp_ThongKeDoanhThu](@Year INT)
AS BEGIN
	SELECT
		TenCD ChuyenDe,
		COUNT(DISTINCT kh.MaKH) SoKH,
		COUNT(hv.MaHV) SoHV,
		SUM(kh.HocPhi) DoanhThu,
		MIN(kh.HocPhi) ThapNhat,
		MAX(kh.HocPhi) CaoNhat,
		AVG(kh.HocPhi) TrungBinh
	FROM KhoaHoc kh
		JOIN HocVien hv ON kh.MaKH=hv.MaKH
		JOIN ChuyenDe cd ON cd.MaCD=kh.MaCD
	WHERE YEAR(NgayKG) = @Year
	GROUP BY TenCD
END
---------
CREATE PROC [dbo].[sp_ThongKeNguoiHoc]
AS BEGIN
	SELECT
		YEAR(NgayDK) Nam,
		COUNT(*) SoLuong,
		MIN(NgayDK) DauTien,
		MAX(NgayDK) CuoiCung
	FROM NguoiHoc
	GROUP BY YEAR(NgayDK)
END

Exec sp_ThongKeDoanhThu 2020
Exec sp_ThongKeNguoiHoc

SELECT hv.*, nh.HoTen 
FROM hocVien hv JOIN nguoiHoc nh ON nh.MaNH=hv.MaNH WHERE MaKH=50

