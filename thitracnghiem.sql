USE [master]
GO
/****** Object:  Database [ThiTracNghiem]    Script Date: 1/7/2024 2:10:32 PM ******/
CREATE DATABASE [ThiTracNghiem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ThiTracNghiem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ThiTracNghiem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ThiTracNghiem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ThiTracNghiem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ThiTracNghiem] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ThiTracNghiem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ThiTracNghiem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ThiTracNghiem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ThiTracNghiem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ThiTracNghiem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ThiTracNghiem] SET ARITHABORT OFF 
GO
ALTER DATABASE [ThiTracNghiem] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ThiTracNghiem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ThiTracNghiem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ThiTracNghiem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ThiTracNghiem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ThiTracNghiem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ThiTracNghiem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ThiTracNghiem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ThiTracNghiem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ThiTracNghiem] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ThiTracNghiem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ThiTracNghiem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ThiTracNghiem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ThiTracNghiem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ThiTracNghiem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ThiTracNghiem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ThiTracNghiem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ThiTracNghiem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ThiTracNghiem] SET  MULTI_USER 
GO
ALTER DATABASE [ThiTracNghiem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ThiTracNghiem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ThiTracNghiem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ThiTracNghiem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ThiTracNghiem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ThiTracNghiem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ThiTracNghiem', N'ON'
GO
ALTER DATABASE [ThiTracNghiem] SET QUERY_STORE = OFF
GO
USE [ThiTracNghiem]
GO
/****** Object:  User [Nguyen]    Script Date: 1/7/2024 2:10:32 PM ******/
CREATE USER [Nguyen] FOR LOGIN [Nguyen] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Classes]    Script Date: 1/7/2024 2:10:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classes](
	[ClassID] [int] NOT NULL,
	[TenLop] [nvarchar](255) NULL,
	[MonHocChinh] [int] NULL,
	[KhoaID] [int] NULL,
	[ChuyenNganhID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamResults]    Script Date: 1/7/2024 2:10:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamResults](
	[ResultID] [int] NOT NULL,
	[NguoiThi] [int] NULL,
	[DeThiID] [int] NULL,
	[DiemSo] [float] NULL,
	[ThoiGianHoanThanh] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[ResultID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exams]    Script Date: 1/7/2024 2:10:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exams](
	[ExamID] [int] NOT NULL,
	[ThoiGianThi] [time](7) NULL,
	[MonHocID] [int] NULL,
	[NguoiTaoDeThi] [int] NULL,
	[KyThiID] [int] NULL,
	[Exam] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ExamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faculties]    Script Date: 1/7/2024 2:10:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculties](
	[FacultyID] [int] NOT NULL,
	[TenKhoa] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[FacultyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedBack]    Script Date: 1/7/2024 2:10:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedBack](
	[FeedbackID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[ExamID] [int] NOT NULL,
	[Feedback] [nvarchar](max) NULL,
 CONSTRAINT [PK_FeedBack] PRIMARY KEY CLUSTERED 
(
	[FeedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LichThi]    Script Date: 1/7/2024 2:10:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichThi](
	[LichThiID] [int] NOT NULL,
	[NgayThi] [datetime] NULL,
	[TenKyThi] [nvarchar](255) NULL,
 CONSTRAINT [PK_LichThi] PRIMARY KEY CLUSTERED 
(
	[LichThiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Majors]    Script Date: 1/7/2024 2:10:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Majors](
	[MajorID] [int] NOT NULL,
	[TenChuyenNganh] [nvarchar](255) NULL,
	[KhoaID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MajorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 1/7/2024 2:10:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[QuestionID] [int] NOT NULL,
	[NoiDungCauHoi] [nvarchar](max) NULL,
	[DeThiID] [int] NULL,
	[A] [nvarchar](255) NULL,
	[B] [nvarchar](255) NULL,
	[C] [nvarchar](255) NULL,
	[D] [nvarchar](255) NULL,
	[DapAn] [char](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[QuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 1/7/2024 2:10:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[SubjectID] [int] NOT NULL,
	[TenMonHoc] [nvarchar](255) NULL,
	[MoTaMonHoc] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[SubjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 1/7/2024 2:10:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] NOT NULL,
	[MatKhau] [nvarchar](255) NULL,
	[HoTen] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[GioiTinh] [bit] NULL,
	[NgaySinh] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Exams] ([ExamID], [ThoiGianThi], [MonHocID], [NguoiTaoDeThi], [KyThiID], [Exam]) VALUES (1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Questions] ([QuestionID], [NoiDungCauHoi], [DeThiID], [A], [B], [C], [D], [DapAn]) VALUES (1, N'Phát biểu nào sau đây đúng?', 1, N'Đường kính bằng bán kính.', N'Đường kính hơn bán kính 2 đơn vị.', N'Đường kính gấp 2 lần bán kính.', N'Bán kính gấp 2 lần đường kính.', N'C ')
INSERT [dbo].[Questions] ([QuestionID], [NoiDungCauHoi], [DeThiID], [A], [B], [C], [D], [DapAn]) VALUES (2, N'157% = ……..', 1, N'157', N'15,7', N'1,57', N'0,157', N'C ')
INSERT [dbo].[Questions] ([QuestionID], [NoiDungCauHoi], [DeThiID], [A], [B], [C], [D], [DapAn]) VALUES (3, N'412,3 x …… = 4,123. Số điền vào chỗ chấm là:', 1, N'100', N'10', N'0,1', N'0,01', N'D ')
INSERT [dbo].[Questions] ([QuestionID], [NoiDungCauHoi], [DeThiID], [A], [B], [C], [D], [DapAn]) VALUES (4, N'Có bao nhiêu số tự nhiên y thỏa mãn điều kiện 3,2 x y < 15,6', 1, N'7', N'6', N'5', N'4', N'C ')
INSERT [dbo].[Questions] ([QuestionID], [NoiDungCauHoi], [DeThiID], [A], [B], [C], [D], [DapAn]) VALUES (5, N'Một thuyền khi xuôi dòng có vận tốc là 13,2 km/giờ. Vận tốc của thuyền khi ngược dòng là 7,4 km/giờ. Như vậy vận tốc của dòng nước là:', 1, N'5,8 km/giờ', N'2,9 km/giờ', N'6,8 km/giờ', N'10,3 km/giờ', N'B ')
INSERT [dbo].[Questions] ([QuestionID], [NoiDungCauHoi], [DeThiID], [A], [B], [C], [D], [DapAn]) VALUES (6, N'Số thích hợp điền vào chỗ chấm để 7m325cm3 = ……. cm3 là:', 1, N'7000025', N'700025', N'70025', N'7025', N'A ')
INSERT [dbo].[Questions] ([QuestionID], [NoiDungCauHoi], [DeThiID], [A], [B], [C], [D], [DapAn]) VALUES (7, N'Cho hình tròn có đường kính là 10cm. Diện tích của hình tròn đó là:', 1, N'314 cm2', N'15,7 cm2', N'31,4 cm2', N'78,5 cm2', N'D ')
INSERT [dbo].[Questions] ([QuestionID], [NoiDungCauHoi], [DeThiID], [A], [B], [C], [D], [DapAn]) VALUES (8, N'Số thập phân gồm 55 đơn vị, 7 phần trăm, 2 phần nghìn viết là:', 1, N'55,720', N'55,072', N'55,027', N'55,702', N'B ')
INSERT [dbo].[Questions] ([QuestionID], [NoiDungCauHoi], [DeThiID], [A], [B], [C], [D], [DapAn]) VALUES (9, N'Phép trừ 712,54 - 48,9 có kết quả đúng là:', 1, N'70,765', N'223,54', N'663,64', N'707,65', N'C ')
INSERT [dbo].[Questions] ([QuestionID], [NoiDungCauHoi], [DeThiID], [A], [B], [C], [D], [DapAn]) VALUES (10, N'Một hình hộp chữ nhật có thể tích 300dm3, chiều dài 15dm, chiều rộng 5dm. Vậy chiều cao của hình hộp chữ nhật là:', 1, N'10dm', N'4dm', N'8dm', N'6dm', N'B ')
INSERT [dbo].[Questions] ([QuestionID], [NoiDungCauHoi], [DeThiID], [A], [B], [C], [D], [DapAn]) VALUES (11, N'Viết số thích hợp vào chỗ chấm: 55 ha 17 m2 = ..........ha', 1, N'55,17', N'550,017', N'55,017', N'55,000,017', N'B ')
INSERT [dbo].[Questions] ([QuestionID], [NoiDungCauHoi], [DeThiID], [A], [B], [C], [D], [DapAn]) VALUES (12, N'Lớp học có 18 nữ và 12 nam. Hỏi số học sinh nữ chiếm bao nhiêu phần trăm số học sinh cả lớp?', 1, N'150%', N'60%', N'40%', N'80%', N'B ')
INSERT [dbo].[Questions] ([QuestionID], [NoiDungCauHoi], [DeThiID], [A], [B], [C], [D], [DapAn]) VALUES (13, N'Số lớn nhất trong các số thập phân: 4,031; 4,31; 4,103; 4,130 là:', 1, N'4,031', N'4,31', N'4,103', N'4,130', N'B ')
INSERT [dbo].[Questions] ([QuestionID], [NoiDungCauHoi], [DeThiID], [A], [B], [C], [D], [DapAn]) VALUES (14, N'Một hình hộp chữ nhật có chiều dài 3,5m; chiều rộng 2m; chiều cao 1,5m. Thể tích hình hộp chữ nhật đó là?', 1, N'7m3', N'1,05m', N'10,5m3', N'105m3', N'C ')
INSERT [dbo].[Questions] ([QuestionID], [NoiDungCauHoi], [DeThiID], [A], [B], [C], [D], [DapAn]) VALUES (15, N'1 phút 15 giây = ?', 1, N'1,15 phút', N'1,25 phút', N'115 giây', N'1,25 giây', N'B ')
INSERT [dbo].[Questions] ([QuestionID], [NoiDungCauHoi], [DeThiID], [A], [B], [C], [D], [DapAn]) VALUES (16, N'Diện tích hình tròn có đường kính 2 cm là:', 1, N'3,14 cm2', N'6,28 cm2', N'6,28 cm', N'12,56 cm2', N'A ')
INSERT [dbo].[Questions] ([QuestionID], [NoiDungCauHoi], [DeThiID], [A], [B], [C], [D], [DapAn]) VALUES (17, N'Một hình thang có trung bình cộng hai đáy là 5cm và chiều cao là 3,2 cm thì diện tích hình thang đó là:', 1, N'8 cm2', N'32 cm2', N'16 cm2', N'164 cm2', N'C ')
INSERT [dbo].[Questions] ([QuestionID], [NoiDungCauHoi], [DeThiID], [A], [B], [C], [D], [DapAn]) VALUES (18, N'Một ô tô đi quãng đường AB dài 120 km mất 2 giờ 30 phút. Vận tốc ô tô là:', 1, N'80 km/giờ', N'60 km/giờ', N'50 km/giờ', N'48 km/giờ', N'D ')
INSERT [dbo].[Questions] ([QuestionID], [NoiDungCauHoi], [DeThiID], [A], [B], [C], [D], [DapAn]) VALUES (19, N'Chữ số 9 trong số 25, 309 thuộc hàng nào?', 1, N'Hàng đơn vị', N'Hàng trăm', N'Hàng phần trăm', N'Hàng phần nghìn', N'D ')
INSERT [dbo].[Questions] ([QuestionID], [NoiDungCauHoi], [DeThiID], [A], [B], [C], [D], [DapAn]) VALUES (20, N'Thể tích của một hình lập phương có cạnh 5 dm là:', 1, N'125 dm3', N'100 dm2', N'100 dm3', N'125 dm2', N'A ')
INSERT [dbo].[Questions] ([QuestionID], [NoiDungCauHoi], [DeThiID], [A], [B], [C], [D], [DapAn]) VALUES (21, N'Cách tính diện tích hình thang có đáy lớn là 25 cm, đáy nhỏ 21 cm và chiều cao 8 cm là:', 1, N'(25 x 21) x 8 : 2', N'(25 + 21) x 8 : 2', N'(25 + 21) : 8 x 2', N'(25 x 21) : 8 x 2', N'B ')
INSERT [dbo].[Questions] ([QuestionID], [NoiDungCauHoi], [DeThiID], [A], [B], [C], [D], [DapAn]) VALUES (22, N'Số bé nhất trong các số: 3,055; 3,050; 3,005; 3,505 là:', 1, N'3,505', N'3,050', N'3,005', N'3,055', N'C ')
INSERT [dbo].[Questions] ([QuestionID], [NoiDungCauHoi], [DeThiID], [A], [B], [C], [D], [DapAn]) VALUES (23, N'Trung bình một người thợ làm một sản phẩm hết 1 giờ 30 phút. Người đó làm 5 sản phẩm mất bao lâu?', 1, N'7 giờ 30 phút', N'7 giờ 50 phút', N'6 giờ 50 phút', N'6 giờ 15 phút', N'A ')
INSERT [dbo].[Questions] ([QuestionID], [NoiDungCauHoi], [DeThiID], [A], [B], [C], [D], [DapAn]) VALUES (24, N'Có bao nhiêu số thập phân ở giữa 0,5 và 0,6:', 1, N' Không có số nào', N'1 số', N'9 số', N'Rất nhiều số', N'D ')
INSERT [dbo].[Questions] ([QuestionID], [NoiDungCauHoi], [DeThiID], [A], [B], [C], [D], [DapAn]) VALUES (25, N'Tìm một số biết 20% của nó là 16. Số đó là:', 1, N'0,8', N'8', N'80', N'800', N'C ')
INSERT [dbo].[Questions] ([QuestionID], [NoiDungCauHoi], [DeThiID], [A], [B], [C], [D], [DapAn]) VALUES (26, N'Một hình lập phương có diện tích xung quanh là 36 dm2. Thể tích hình lập phương đó là:', 1, N'27 dm3', N'2700 cm3', N'54 dm3', N'27000 cm3', N'A ')
INSERT [dbo].[Questions] ([QuestionID], [NoiDungCauHoi], [DeThiID], [A], [B], [C], [D], [DapAn]) VALUES (27, N'Chữ số 5 trong số 162,57 chỉ:', 1, N'5 đơn vị', N'5 phần trăm', N'5 chục', N'5 phần mười', N'D ')
INSERT [dbo].[Questions] ([QuestionID], [NoiDungCauHoi], [DeThiID], [A], [B], [C], [D], [DapAn]) VALUES (28, N'5840g = .... kg', 1, N'58,4kg', N'5,84kg', N'0,584kg', N'0,0584kg', N'B ')
INSERT [dbo].[Questions] ([QuestionID], [NoiDungCauHoi], [DeThiID], [A], [B], [C], [D], [DapAn]) VALUES (29, N'Có 20 viên bi, trong đó có 3 viên bi nâu, 4 viên bi xanh, 5 viên bi đỏ, 8 viên bi vàng. Như vậy 1/5 số viên bi có màu: (1 điểm)', 1, N'Nâu', N'Đỏ', N'Xanh', N'Trắng', N'C ')
INSERT [dbo].[Questions] ([QuestionID], [NoiDungCauHoi], [DeThiID], [A], [B], [C], [D], [DapAn]) VALUES (30, N'Khoảng thời gian từ lúc 9 giờ kém 10 phút đến 9 giờ 30 phút là:', 1, N'10 phút', N'20 phút', N'30 phút', N'40 phút', N'D ')
INSERT [dbo].[Questions] ([QuestionID], [NoiDungCauHoi], [DeThiID], [A], [B], [C], [D], [DapAn]) VALUES (31, N'Một huyện có 320ha đất trồng cây cà phê và 480ha đất trồng cây cao su. Hỏi diện tích đất trồng cây cao su bằng bao nhiêu phần trăm diện tích đất trồng cây cà phê?', 1, N'150%', N'15%', N'1500%', N'105%', N'A ')
INSERT [dbo].[Questions] ([QuestionID], [NoiDungCauHoi], [DeThiID], [A], [B], [C], [D], [DapAn]) VALUES (32, N'Hình lập phương có cạnh là 5m. Vậy thể tích hình đó là:', 1, N'150 m3', N'125 m3', N'100 m3', N'25 m3', N'B ')
GO
INSERT [dbo].[Users] ([UserID], [MatKhau], [HoTen], [Email], [GioiTinh], [NgaySinh]) VALUES (1, N'2123', N'Nguyen', N'nguyentranlht@gmail.com', 1, CAST(N'2003-01-22' AS Date))
GO
ALTER TABLE [dbo].[Classes]  WITH CHECK ADD FOREIGN KEY([ChuyenNganhID])
REFERENCES [dbo].[Majors] ([MajorID])
GO
ALTER TABLE [dbo].[Classes]  WITH CHECK ADD FOREIGN KEY([KhoaID])
REFERENCES [dbo].[Faculties] ([FacultyID])
GO
ALTER TABLE [dbo].[Classes]  WITH CHECK ADD FOREIGN KEY([MonHocChinh])
REFERENCES [dbo].[Subjects] ([SubjectID])
GO
ALTER TABLE [dbo].[ExamResults]  WITH CHECK ADD FOREIGN KEY([DeThiID])
REFERENCES [dbo].[Exams] ([ExamID])
GO
ALTER TABLE [dbo].[ExamResults]  WITH CHECK ADD FOREIGN KEY([NguoiThi])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Exams]  WITH CHECK ADD FOREIGN KEY([MonHocID])
REFERENCES [dbo].[Subjects] ([SubjectID])
GO
ALTER TABLE [dbo].[Exams]  WITH CHECK ADD FOREIGN KEY([NguoiTaoDeThi])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Exams]  WITH CHECK ADD  CONSTRAINT [FK_Exams_LichThi] FOREIGN KEY([KyThiID])
REFERENCES [dbo].[LichThi] ([LichThiID])
GO
ALTER TABLE [dbo].[Exams] CHECK CONSTRAINT [FK_Exams_LichThi]
GO
ALTER TABLE [dbo].[FeedBack]  WITH CHECK ADD  CONSTRAINT [FK_FeedBack_Exams] FOREIGN KEY([ExamID])
REFERENCES [dbo].[Exams] ([ExamID])
GO
ALTER TABLE [dbo].[FeedBack] CHECK CONSTRAINT [FK_FeedBack_Exams]
GO
ALTER TABLE [dbo].[FeedBack]  WITH CHECK ADD  CONSTRAINT [FK_FeedBack_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[FeedBack] CHECK CONSTRAINT [FK_FeedBack_Users]
GO
ALTER TABLE [dbo].[Majors]  WITH CHECK ADD FOREIGN KEY([KhoaID])
REFERENCES [dbo].[Faculties] ([FacultyID])
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD FOREIGN KEY([DeThiID])
REFERENCES [dbo].[Exams] ([ExamID])
GO
/****** Object:  StoredProcedure [dbo].[GETTABLEQUESTION]    Script Date: 1/7/2024 2:10:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GETTABLEQUESTION]
AS
BEGIN
    SELECT * FROM Questions
END
GO
/****** Object:  StoredProcedure [dbo].[UserLogin]    Script Date: 1/7/2024 2:10:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserLogin]
    @Username NVARCHAR(50),
    @Password NVARCHAR(50),
    @LoginSuccess BIT OUTPUT
AS
BEGIN
    IF EXISTS (SELECT * FROM Users WHERE Email = @Username AND MatKhau = @Password)
        SET @LoginSuccess = 1  -- Đăng nhập thành công
    ELSE
        SET @LoginSuccess = 0  -- Tên người dùng hoặc mật khẩu không hợp lệ
END
GO
USE [master]
GO
ALTER DATABASE [ThiTracNghiem] SET  READ_WRITE 
GO
