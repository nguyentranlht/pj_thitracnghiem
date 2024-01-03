USE [master]
GO
/****** Object:  Database [ThiTracNghiem]    Script Date: 03/01/2024 9:03:06 PM ******/
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
	[NoiDungDapAn] [nvarchar](max) NULL,
	[CauHoiID] [int] NULL,
	[DapAnDung] [bit] NULL,
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
