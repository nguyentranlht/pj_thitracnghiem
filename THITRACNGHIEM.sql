USE [master]
GO
/****** Object:  Database [ThiTracNghiem]    Script Date: 03/01/2024 9:03:06 PM ******/
drop DATABASE [ThiTracNghiem]
go
CREATE DATABASE [ThiTracNghiem]
GO
ALTER DATABASE [ThiTracNghiem] SET COMPATIBILITY_LEVEL = 150
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
ALTER DATABASE [ThiTracNghiem] SET QUERY_STORE = OFF
GO
USE [ThiTracNghiem]
GO
/****** Object:  Table [dbo].[Answers]    Script Date: 03/01/2024 9:03:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answers](
	[ID] [int] NOT NULL,
	[CauHoiID] [int] NULL,
	[NoiDungCauHoi] [nvarchar](max) NULL,
	[DapAnDung] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Classes]    Script Date: 03/01/2024 9:03:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classes](
	[ID] [int] NOT NULL,
	[TenLop] [nvarchar](255) NULL,
	[MonHocChinh] [int] NULL,
	[ChuyenNganhID] [int] NULL,
	[KhoaID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamResults]    Script Date: 03/01/2024 9:03:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamResults](
	[ID] [int] NOT NULL,
	[NguoiThi] [int] NULL,
	[DeThiID] [int] NULL,
	[DiemSo] [float] NULL,
	[ThoiGianHoanThanh] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exams]    Script Date: 03/01/2024 9:03:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exams](
	[ID] [int] NOT NULL,
	[TieuDeDeThi] [nvarchar](255) NULL,
	[ThoiGianThi] [datetime] NULL,
	[MonHocID] [int] NULL,
	[NguoiTaoDeThi] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faculties]    Script Date: 03/01/2024 9:03:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculties](
	[ID] [int] NOT NULL,
	[TenKhoa] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grades]    Script Date: 03/01/2024 9:03:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grades](
	[ID] [int] NOT NULL,
	[NguoiThi] [int] NULL,
	[MonHocID] [int] NULL,
	[DiemSo] [float] NULL,
	[NgayCapNhatDiem] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Major]    Script Date: 03/01/2024 9:03:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Major](
	[ID] [int] NOT NULL,
	[TenChuyenNganh] [nvarchar](255) NULL,
	[KhoaID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 03/01/2024 9:03:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[ID] [int] NOT NULL,
	[NoiDungCauHoi] [nvarchar](max) NULL,
	[A] Ntext NULL,
	[B] Ntext NULL,
	[C] Ntext NULL,
	[D] Ntext NULL,
	[MonHocID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 03/01/2024 9:03:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[ID] [int] NOT NULL,
	[TenMonHoc] [nvarchar](255) NULL,
	[MoTaMonHoc] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 03/01/2024 9:03:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] NOT NULL,
	[Email] [varchar](255) NULL,
	[MatKhau] [varchar](255) NULL,
	[TenDayDu] [nvarchar](255) NULL,
	[GioiTinh] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Classes] ([ID], [TenLop], [MonHocChinh], [ChuyenNganhID], [KhoaID]) VALUES (1, N'21DTHD4', 1, 1, 1)
INSERT [dbo].[Classes] ([ID], [TenLop], [MonHocChinh], [ChuyenNganhID], [KhoaID]) VALUES (2, N'21DNNA1', 4, 3, 3)
INSERT [dbo].[Classes] ([ID], [TenLop], [MonHocChinh], [ChuyenNganhID], [KhoaID]) VALUES (3, N'21DQTB3', 5, 5, 3)
GO
INSERT [dbo].[Faculties] ([ID], [TenKhoa]) VALUES (1, N'Công nghệ thông tin')
INSERT [dbo].[Faculties] ([ID], [TenKhoa]) VALUES (2, N'Quản trị kinh doanh')
INSERT [dbo].[Faculties] ([ID], [TenKhoa]) VALUES (3, N'Ngoại ngữ')
GO
INSERT [dbo].[Major] ([ID], [TenChuyenNganh], [KhoaID]) VALUES (1, N'Công nghệ phần mềm', 1)
INSERT [dbo].[Major] ([ID], [TenChuyenNganh], [KhoaID]) VALUES (2, N'Mạng máy tính', 1)
INSERT [dbo].[Major] ([ID], [TenChuyenNganh], [KhoaID]) VALUES (3, N'Ngôn ngữ Anh', 3)
INSERT [dbo].[Major] ([ID], [TenChuyenNganh], [KhoaID]) VALUES (4, N'Tài chính nhân sự', 2)
INSERT [dbo].[Major] ([ID], [TenChuyenNganh], [KhoaID]) VALUES (5, N'Kế toán', 2)
GO
INSERT [dbo].[Subjects] ([ID], [TenMonHoc], [MoTaMonHoc]) VALUES (1, N'Lập trình mạng', NULL)
INSERT [dbo].[Subjects] ([ID], [TenMonHoc], [MoTaMonHoc]) VALUES (2, N'Công nghệ phần mềm', NULL)
INSERT [dbo].[Subjects] ([ID], [TenMonHoc], [MoTaMonHoc]) VALUES (3, N'Tiếng Anh 1', NULL)
INSERT [dbo].[Subjects] ([ID], [TenMonHoc], [MoTaMonHoc]) VALUES (4, N'Tiếng Anh 6', NULL)
INSERT [dbo].[Subjects] ([ID], [TenMonHoc], [MoTaMonHoc]) VALUES (5, N'Kinh tế vi mô', NULL)
GO
INSERT [dbo].[Questions] ([ID], [NoiDungCauHoi], [A], [B], [C], [D]) VALUES (1, N'Phát biểu nào sau đây đúng?', N'Đường kính bằng bán kính.', N'Đường kính hơn bán kính 2 đơn vị.', N'Đường kính gấp 2 lần bán kính.', N'Bán kính gấp 2 lần đường kính.')
INSERT [dbo].[Questions] ([ID], [NoiDungCauHoi], [A], [B], [C], [D]) VALUES (2, N'157% = ……..', N'157', N'15,7', N'1,57', N'0,157')
INSERT [dbo].[Questions] ([ID], [NoiDungCauHoi], [A], [B], [C], [D]) VALUES (3, N'412,3 x …… = 4,123. Số điền vào chỗ chấm là:', N'100', N'10', N'0,1', N'0,01')
INSERT [dbo].[Questions] ([ID], [NoiDungCauHoi], [A], [B], [C], [D]) VALUES (4, N'Có bao nhiêu số tự nhiên y thỏa mãn điều kiện 3,2 x y < 15,6', N'7', N'6', N'5', N'4')
INSERT [dbo].[Questions] ([ID], [NoiDungCauHoi], [A], [B], [C], [D]) VALUES (5, N'Một thuyền khi xuôi dòng có vận tốc là 13,2 km/giờ. Vận tốc của thuyền khi ngược dòng là 7,4 km/giờ. Như vậy vận tốc của dòng nước là:', N'5,8 km/giờ', N'2,9 km/giờ', N'6,8 km/giờ', N'10,3 km/giờ')
INSERT [dbo].[Questions] ([ID], [NoiDungCauHoi], [A], [B], [C], [D]) VALUES (6, N'Số thích hợp điền vào chỗ chấm để 7m325cm3 = ……. cm3 là:', N'7000025', N'700025', N'70025', N'7025')
INSERT [dbo].[Questions] ([ID], [NoiDungCauHoi], [A], [B], [C], [D]) VALUES (7, N'Cho hình tròn có đường kính là 10cm. Diện tích của hình tròn đó là:', N'314 cm2', N'15,7 cm2', N'31,4 cm2', N'78,5 cm2')
INSERT [dbo].[Questions] ([ID], [NoiDungCauHoi], [A], [B], [C], [D]) VALUES (8, N'Số thập phân gồm 55 đơn vị, 7 phần trăm, 2 phần nghìn viết là:', N'55,720', N'55,072', N'55,027', N'55,702')
INSERT [dbo].[Questions] ([ID], [NoiDungCauHoi], [A], [B], [C], [D]) VALUES (9, N'Phép trừ 712,54 - 48,9 có kết quả đúng là:', N'70,765', N'223,54', N'663,64', N'707,65')
INSERT [dbo].[Questions] ([ID], [NoiDungCauHoi], [A], [B], [C], [D]) VALUES (10, N'Một hình hộp chữ nhật có thể tích 300dm3, chiều dài 15dm, chiều rộng 5dm. Vậy chiều cao của hình hộp chữ nhật là:', N'10dm', N'4dm', N'8dm', N'6dm')
INSERT [dbo].[Questions] ([ID], [NoiDungCauHoi], [A], [B], [C], [D]) VALUES (11, N'Viết số thích hợp vào chỗ chấm: 55 ha 17 m2 = ..........ha', N'55,17', N'550,017', N'55,017', N'55,000,017')
INSERT [dbo].[Questions] ([ID], [NoiDungCauHoi], [A], [B], [C], [D]) VALUES (12, N'Lớp học có 18 nữ và 12 nam. Hỏi số học sinh nữ chiếm bao nhiêu phần trăm số học sinh cả lớp?', N'150%', N'60%', N'40%', N'80%')
INSERT [dbo].[Questions] ([ID], [NoiDungCauHoi], [A], [B], [C], [D]) VALUES (13, N'Số lớn nhất trong các số thập phân: 4,031; 4,31; 4,103; 4,130 là:', N'4,031', N'4,31', N'4,103', N'4,130')
INSERT [dbo].[Questions] ([ID], [NoiDungCauHoi], [A], [B], [C], [D]) VALUES (14, N'Một hình hộp chữ nhật có chiều dài 3,5m; chiều rộng 2m; chiều cao 1,5m. Thể tích hình hộp chữ nhật đó là?', N'7m3', N'1,05m', N'10,5m3', N'105m3')
INSERT [dbo].[Questions] ([ID], [NoiDungCauHoi], [A], [B], [C], [D]) VALUES (15, N'1 phút 15 giây = ?', N'1,15 phút', N'1,25 phút', N'115 giây', N'1,25 giây')
INSERT [dbo].[Questions] ([ID], [NoiDungCauHoi], [A], [B], [C], [D]) VALUES (16, N'Diện tích hình tròn có đường kính 2 cm là:', N'3,14 cm2', N'6,28 cm2', N'6,28 cm', N'12,56 cm2')
INSERT [dbo].[Questions] ([ID], [NoiDungCauHoi], [A], [B], [C], [D]) VALUES (17, N'Một hình thang có trung bình cộng hai đáy là 5cm và chiều cao là 3,2 cm thì diện tích hình thang đó là:', N'8 cm2', N'32 cm2', N'16 cm2', N'164 cm2')
INSERT [dbo].[Questions] ([ID], [NoiDungCauHoi], [A], [B], [C], [D]) VALUES (18, N'Một ô tô đi quãng đường AB dài 120 km mất 2 giờ 30 phút. Vận tốc ô tô là:', N'80 km/giờ', N'60 km/giờ', N'50 km/giờ', N'48 km/giờ')
INSERT [dbo].[Questions] ([ID], [NoiDungCauHoi], [A], [B], [C], [D]) VALUES (19, N'Chữ số 9 trong số 25, 309 thuộc hàng nào?', N'Hàng đơn vị', N'Hàng trăm', N'Hàng phần trăm', N'Hàng phần nghìn')
INSERT [dbo].[Questions] ([ID], [NoiDungCauHoi], [A], [B], [C], [D]) VALUES (20, N'Thể tích của một hình lập phương có cạnh 5 dm là:', N'125 dm3', N'100 dm2', N'100 dm3', N'125 dm2')
INSERT [dbo].[Questions] ([ID], [NoiDungCauHoi], [A], [B], [C], [D]) VALUES (21, N'Cách tính diện tích hình thang có đáy lớn là 25 cm, đáy nhỏ 21 cm và chiều cao 8 cm là:', N'(25 x 21) x 8 : 2', N'(25 + 21) x 8 : 2', N'(25 + 21) : 8 x 2', N'(25 x 21) : 8 x 2')
INSERT [dbo].[Questions] ([ID], [NoiDungCauHoi], [A], [B], [C], [D]) VALUES (22, N'Số bé nhất trong các số: 3,055; 3,050; 3,005; 3,505 là:', N'3,505', N'3,050', N'3,005', N'3,055')
INSERT [dbo].[Questions] ([ID], [NoiDungCauHoi], [A], [B], [C], [D]) VALUES (23, N'Trung bình một người thợ làm một sản phẩm hết 1 giờ 30 phút. Người đó làm 5 sản phẩm mất bao lâu?', N'7 giờ 30 phút', N'7 giờ 50 phút', N'6 giờ 50 phút', N'6 giờ 15 phút')
INSERT [dbo].[Questions] ([ID], [NoiDungCauHoi], [A], [B], [C], [D]) VALUES (24, N'Có bao nhiêu số thập phân ở giữa 0,5 và 0,6:', N' Không có số nào', N'1 số', N'9 số', N'Rất nhiều số')
INSERT [dbo].[Questions] ([ID], [NoiDungCauHoi], [A], [B], [C], [D]) VALUES (25, N'Tìm một số biết 20% của nó là 16. Số đó là:', N'0,8', N'8', N'80', N'800')
INSERT [dbo].[Questions] ([ID], [NoiDungCauHoi], [A], [B], [C], [D]) VALUES (26, N'Một hình lập phương có diện tích xung quanh là 36 dm2. Thể tích hình lập phương đó là:', N'27 dm3', N'2700 cm3', N'54 dm3', N'27000 cm3')
INSERT [dbo].[Questions] ([ID], [NoiDungCauHoi], [A], [B], [C], [D]) VALUES (27, N'Chữ số 5 trong số 162,57 chỉ:', N'5 đơn vị', N'5 phần trăm', N'5 chục', N'5 phần mười')
INSERT [dbo].[Questions] ([ID], [NoiDungCauHoi], [A], [B], [C], [D]) VALUES (28, N'5840g = .... kg', N'58,4kg', N'5,84kg', N'0,584kg', N'0,0584kg')
INSERT [dbo].[Questions] ([ID], [NoiDungCauHoi], [A], [B], [C], [D]) VALUES (29, N'Có 20 viên bi, trong đó có 3 viên bi nâu, 4 viên bi xanh, 5 viên bi đỏ, 8 viên bi vàng. Như vậy 1/5 số viên bi có màu: (1 điểm)', N'Nâu', N'Đỏ', N'Xanh', N'Trắng')
INSERT [dbo].[Questions] ([ID], [NoiDungCauHoi], [A], [B], [C], [D]) VALUES (30, N'Khoảng thời gian từ lúc 9 giờ kém 10 phút đến 9 giờ 30 phút là:', N'10 phút', N'20 phút', N'30 phút', N'40 phút')
INSERT [dbo].[Questions] ([ID], [NoiDungCauHoi], [A], [B], [C], [D]) VALUES (31, N'Một huyện có 320ha đất trồng cây cà phê và 480ha đất trồng cây cao su. Hỏi diện tích đất trồng cây cao su bằng bao nhiêu phần trăm diện tích đất trồng cây cà phê?', N'150%', N'15%', N'1500%', N'105%')
INSERT [dbo].[Questions] ([ID], [NoiDungCauHoi], [A], [B], [C], [D]) VALUES (32, N'Hình lập phương có cạnh là 5m. Vậy thể tích hình đó là:', N'150 m3', N'125 m3', N'100 m3', N'25 m3')
go
INSERT [dbo].[Answers] ([ID], [CauHoiID], [NoiDungCauHoi], [DapAnDung]) VALUES (1,1, N'Phát biểu nào sau đây đúng?', N'C')
INSERT [dbo].[Answers] ([ID], [CauHoiID], [NoiDungCauHoi], [DapAnDung]) VALUES (2,2, N'157% = ……..', N'C')
INSERT [dbo].[Answers] ([ID], [CauHoiID], [NoiDungCauHoi], [DapAnDung]) VALUES (3,3, N'412,3 x …… = 4,123. Số điền vào chỗ chấm là:', N'D')
INSERT [dbo].[Answers] ([ID], [CauHoiID], [NoiDungCauHoi], [DapAnDung]) VALUES (4,4, N'Có bao nhiêu số tự nhiên y thỏa mãn điều kiện 3,2 x y < 15,6', N'C')
INSERT [dbo].[Answers] ([ID], [CauHoiID], [NoiDungCauHoi], [DapAnDung]) VALUES (5,5, N'Một thuyền khi xuôi dòng có vận tốc là 13,2 km/giờ. Vận tốc của thuyền khi ngược dòng là 7,4 km/giờ. Như vậy vận tốc của dòng nước là:', N'B')
INSERT [dbo].[Answers] ([ID], [CauHoiID], [NoiDungCauHoi], [DapAnDung]) VALUES (6,6, N'Số thích hợp điền vào chỗ chấm để 7m325cm3 = ……. cm3 là:', N'A')
INSERT [dbo].[Answers] ([ID], [CauHoiID], [NoiDungCauHoi], [DapAnDung]) VALUES (7,7, N'Cho hình tròn có đường kính là 10cm. Diện tích của hình tròn đó là:', N'D')
INSERT [dbo].[Answers] ([ID], [CauHoiID], [NoiDungCauHoi], [DapAnDung]) VALUES (8,8, N'Số thập phân gồm 55 đơn vị, 7 phần trăm, 2 phần nghìn viết là:', N'B')
INSERT [dbo].[Answers] ([ID], [CauHoiID], [NoiDungCauHoi], [DapAnDung]) VALUES (9,9, N'Phép trừ 712,54 - 48,9 có kết quả đúng là:', N'C')
INSERT [dbo].[Answers] ([ID], [CauHoiID], [NoiDungCauHoi], [DapAnDung]) VALUES (10,10, N'Một hình hộp chữ nhật có thể tích 300dm3, chiều dài 15dm, chiều rộng 5dm. Vậy chiều cao của hình hộp chữ nhật là:', N'B')
INSERT [dbo].[Answers] ([ID], [CauHoiID], [NoiDungCauHoi], [DapAnDung]) VALUES (11,11, N'Viết số thích hợp vào chỗ chấm: 55 ha 17 m2 = ..........ha', N'B')
INSERT [dbo].[Answers] ([ID], [CauHoiID], [NoiDungCauHoi], [DapAnDung]) VALUES (12,12, N'Lớp học có 18 nữ và 12 nam. Hỏi số học sinh nữ chiếm bao nhiêu phần trăm số học sinh cả lớp?', N'B')
INSERT [dbo].[Answers] ([ID], [CauHoiID], [NoiDungCauHoi], [DapAnDung]) VALUES (13,13, N'Số lớn nhất trong các số thập phân: 4,031; 4,31; 4,103; 4,130 là:', N'B')
INSERT [dbo].[Answers] ([ID], [CauHoiID], [NoiDungCauHoi], [DapAnDung]) VALUES (14,14, N'Một hình hộp chữ nhật có chiều dài 3,5m; chiều rộng 2m; chiều cao 1,5m. Thể tích hình hộp chữ nhật đó là?', N'C')
INSERT [dbo].[Answers] ([ID], [CauHoiID], [NoiDungCauHoi], [DapAnDung]) VALUES (15,15, N'1 phút 15 giây = ?', N'B')
INSERT [dbo].[Answers] ([ID], [CauHoiID], [NoiDungCauHoi], [DapAnDung]) VALUES (16,16, N'Diện tích hình tròn có đường kính 2 cm là:', N'A')
INSERT [dbo].[Answers] ([ID], [CauHoiID], [NoiDungCauHoi], [DapAnDung]) VALUES (17,17, N'Một hình thang có trung bình cộng hai đáy là 5cm và chiều cao là 3,2 cm thì diện tích hình thang đó là:', N'C')
INSERT [dbo].[Answers] ([ID], [CauHoiID], [NoiDungCauHoi], [DapAnDung]) VALUES (18,18, N'Một ô tô đi quãng đường AB dài 120 km mất 2 giờ 30 phút. Vận tốc ô tô là:', N'D')
INSERT [dbo].[Answers] ([ID], [CauHoiID], [NoiDungCauHoi], [DapAnDung]) VALUES (19,19, N'Chữ số 9 trong số 25, 309 thuộc hàng nào?', N'D')
INSERT [dbo].[Answers] ([ID], [CauHoiID], [NoiDungCauHoi], [DapAnDung]) VALUES (20,20, N'Thể tích của một hình lập phương có cạnh 5 dm là:', N'A')
INSERT [dbo].[Answers] ([ID], [CauHoiID], [NoiDungCauHoi], [DapAnDung]) VALUES (21,21, N'Cách tính diện tích hình thang có đáy lớn là 25 cm, đáy nhỏ 21 cm và chiều cao 8 cm là:', N'B')
INSERT [dbo].[Answers] ([ID], [CauHoiID], [NoiDungCauHoi], [DapAnDung]) VALUES (22,22, N'Số bé nhất trong các số: 3,055; 3,050; 3,005; 3,505 là:', N'C')
INSERT [dbo].[Answers] ([ID], [CauHoiID], [NoiDungCauHoi], [DapAnDung]) VALUES (23,23, N'Trung bình một người thợ làm một sản phẩm hết 1 giờ 30 phút. Người đó làm 5 sản phẩm mất bao lâu?', N'A')
INSERT [dbo].[Answers] ([ID], [CauHoiID], [NoiDungCauHoi], [DapAnDung]) VALUES (24,24, N'Có bao nhiêu số thập phân ở giữa 0,5 và 0,6:', N'D')
INSERT [dbo].[Answers] ([ID], [CauHoiID], [NoiDungCauHoi], [DapAnDung]) VALUES (25,25, N'Tìm một số biết 20% của nó là 16. Số đó là:', N'C')
INSERT [dbo].[Answers] ([ID], [CauHoiID], [NoiDungCauHoi], [DapAnDung]) VALUES (26,26, N'Một hình lập phương có diện tích xung quanh là 36 dm2. Thể tích hình lập phương đó là:', N'A')
INSERT [dbo].[Answers] ([ID], [CauHoiID], [NoiDungCauHoi], [DapAnDung]) VALUES (27,27, N'Chữ số 5 trong số 162,57 chỉ:', N'D')
INSERT [dbo].[Answers] ([ID], [CauHoiID], [NoiDungCauHoi], [DapAnDung]) VALUES (28,28, N'5840g = .... kg', N'B')
INSERT [dbo].[Answers] ([ID], [CauHoiID], [NoiDungCauHoi], [DapAnDung]) VALUES (29,29, N'Có 20 viên bi, trong đó có 3 viên bi nâu, 4 viên bi xanh, 5 viên bi đỏ, 8 viên bi vàng. Như vậy 1/5 số viên bi có màu: (1 điểm)', N'C')
INSERT [dbo].[Answers] ([ID], [CauHoiID], [NoiDungCauHoi], [DapAnDung]) VALUES (30,30, N'Khoảng thời gian từ lúc 9 giờ kém 10 phút đến 9 giờ 30 phút là:', N'D')
INSERT [dbo].[Answers] ([ID], [CauHoiID], [NoiDungCauHoi], [DapAnDung]) VALUES (31,31, N'Một huyện có 320ha đất trồng cây cà phê và 480ha đất trồng cây cao su. Hỏi diện tích đất trồng cây cao su bằng bao nhiêu phần trăm diện tích đất trồng cây cà phê?', N'A')
INSERT [dbo].[Answers] ([ID], [CauHoiID], [NoiDungCauHoi], [DapAnDung]) VALUES (32,32, N'Hình lập phương có cạnh là 5m. Vậy thể tích hình đó là:', N'B')
go
INSERT [dbo].[Users] ([ID], [Email], [MatKhau], [TenDayDu], [GioiTinh]) VALUES (1, N'leduyLTM@gmail.com', N'8103', N'Lê Duy', 1)
GO
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD FOREIGN KEY([CauHoiID])
REFERENCES [dbo].[Questions] ([ID])
GO
ALTER TABLE [dbo].[Classes]  WITH CHECK ADD FOREIGN KEY([ChuyenNganhID])
REFERENCES [dbo].[Major] ([ID])
GO
ALTER TABLE [dbo].[Classes]  WITH CHECK ADD FOREIGN KEY([KhoaID])
REFERENCES [dbo].[Faculties] ([ID])
GO
ALTER TABLE [dbo].[Classes]  WITH CHECK ADD FOREIGN KEY([MonHocChinh])
REFERENCES [dbo].[Subjects] ([ID])
GO
ALTER TABLE [dbo].[ExamResults]  WITH CHECK ADD FOREIGN KEY([DeThiID])
REFERENCES [dbo].[Exams] ([ID])
GO
ALTER TABLE [dbo].[ExamResults]  WITH CHECK ADD FOREIGN KEY([NguoiThi])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Exams]  WITH CHECK ADD FOREIGN KEY([MonHocID])
REFERENCES [dbo].[Subjects] ([ID])
GO
ALTER TABLE [dbo].[Exams]  WITH CHECK ADD FOREIGN KEY([NguoiTaoDeThi])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Grades]  WITH CHECK ADD FOREIGN KEY([MonHocID])
REFERENCES [dbo].[Subjects] ([ID])
GO
ALTER TABLE [dbo].[Grades]  WITH CHECK ADD FOREIGN KEY([NguoiThi])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Major]  WITH CHECK ADD FOREIGN KEY([KhoaID])
REFERENCES [dbo].[Faculties] ([ID])
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD FOREIGN KEY([MonHocID])
REFERENCES [dbo].[Subjects] ([ID])
GO
USE [master]
GO
ALTER DATABASE [ThiTracNghiem] SET  READ_WRITE 
GO
