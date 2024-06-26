USE [master]
GO
/****** Object:  Database [Shop]    Script Date: 3/22/2024 9:52:22 AM ******/
CREATE DATABASE [Shop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Shop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Shop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Shop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Shop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Shop] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Shop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Shop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Shop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Shop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Shop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Shop] SET ARITHABORT OFF 
GO
ALTER DATABASE [Shop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Shop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Shop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Shop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Shop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Shop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Shop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Shop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Shop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Shop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Shop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Shop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Shop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Shop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Shop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Shop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Shop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Shop] SET RECOVERY FULL 
GO
ALTER DATABASE [Shop] SET  MULTI_USER 
GO
ALTER DATABASE [Shop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Shop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Shop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Shop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Shop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Shop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Shop', N'ON'
GO
ALTER DATABASE [Shop] SET QUERY_STORE = ON
GO
ALTER DATABASE [Shop] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Shop]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/22/2024 9:52:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Role] [int] NOT NULL,
	[Image] [varchar](255) NULL,
	[Phone] [int] NULL,
	[Address] [nvarchar](255) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/22/2024 9:52:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 3/22/2024 9:52:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Account_id] [int] NOT NULL,
	[Product_id] [int] NOT NULL,
	[Image] [nvarchar](100) NULL,
	[Quantity] [int] NOT NULL,
	[TotalPrice] [float] NOT NULL,
	[Address] [nvarchar](255) NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 3/22/2024 9:52:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Order_id] [int] NOT NULL,
	[Product_id] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/22/2024 9:52:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[Account_id] [int] NOT NULL,
	[Category_id] [int] NOT NULL,
	[Image] [varchar](255) NULL,
	[Price] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Status] [bit] NOT NULL,
	[Description] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([ID], [Name], [Username], [Password], [Role], [Image], [Phone], [Address]) VALUES (1, N'Võ Hoàng', N'vohoang2811a@gmail.com', N'123', 1, NULL, NULL, NULL)
INSERT [dbo].[Account] ([ID], [Name], [Username], [Password], [Role], [Image], [Phone], [Address]) VALUES (1011, N'Hoàng', N'vah2112@gmail.com', N'123', 2, N'IMG_0137.JPG', 978129806, N'Từ Sơn - Bắc Ninh')
INSERT [dbo].[Account] ([ID], [Name], [Username], [Password], [Role], [Image], [Phone], [Address]) VALUES (2031, N'Anh Hoàng', N'hoangdz', N'12321', 2, NULL, 312412481, N'Hà Nội')
INSERT [dbo].[Account] ([ID], [Name], [Username], [Password], [Role], [Image], [Phone], [Address]) VALUES (2033, N'Nguyen The Dat', N'tuannt2', N'123', 2, NULL, NULL, NULL)
INSERT [dbo].[Account] ([ID], [Name], [Username], [Password], [Role], [Image], [Phone], [Address]) VALUES (2034, N'Nguyen Trung Kien', N'kienNT2', N'123', 2, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [CategoryName]) VALUES (1, N'Quần Áo Nam')
INSERT [dbo].[Category] ([ID], [CategoryName]) VALUES (2, N'Quần Áo Nữ')
INSERT [dbo].[Category] ([ID], [CategoryName]) VALUES (3, N'Áo Khoác')
INSERT [dbo].[Category] ([ID], [CategoryName]) VALUES (4, N'Phụ Kiện')
INSERT [dbo].[Category] ([ID], [CategoryName]) VALUES (5, N'Giày Dép Nam')
INSERT [dbo].[Category] ([ID], [CategoryName]) VALUES (6, N'Giày Dép Nữ')
INSERT [dbo].[Category] ([ID], [CategoryName]) VALUES (7, N'Váy')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [Account_id], [Product_id], [Image], [Quantity], [TotalPrice], [Address], [Date]) VALUES (1064, 1011, 1039, N'Thanh toán khi nh?n hàng', 0, 440000, N'Từ Sơn - Bắc Ninh', CAST(N'2024-03-12' AS Date))
INSERT [dbo].[Order] ([ID], [Account_id], [Product_id], [Image], [Quantity], [TotalPrice], [Address], [Date]) VALUES (1065, 1011, 1039, N'Thanh toán chuyển khoản', 1, 1589999, N'Từ Sơn - Bắc Ninh', CAST(N'2024-03-12' AS Date))
INSERT [dbo].[Order] ([ID], [Account_id], [Product_id], [Image], [Quantity], [TotalPrice], [Address], [Date]) VALUES (1066, 1011, 1039, N'Thanh toán chuyển khoản', 2, 280000, N'Từ Sơn - Bắc Ninh', CAST(N'2024-03-14' AS Date))
INSERT [dbo].[Order] ([ID], [Account_id], [Product_id], [Image], [Quantity], [TotalPrice], [Address], [Date]) VALUES (1067, 1011, 1039, N'Thanh toán khi nhận hàng', 3, 440000, N'Từ Sơn - Bắc Ninh', CAST(N'2024-03-15' AS Date))
INSERT [dbo].[Order] ([ID], [Account_id], [Product_id], [Image], [Quantity], [TotalPrice], [Address], [Date]) VALUES (1068, 1011, 1039, N'Thanh toán chuyển khoản', 4, 165000, N'Từ Sơn - Bắc Ninh', CAST(N'2024-03-15' AS Date))
INSERT [dbo].[Order] ([ID], [Account_id], [Product_id], [Image], [Quantity], [TotalPrice], [Address], [Date]) VALUES (1071, 2033, 1056, NULL, 2, 246000, N'ádfsgfdsagfds', CAST(N'2024-03-20' AS Date))
INSERT [dbo].[Order] ([ID], [Account_id], [Product_id], [Image], [Quantity], [TotalPrice], [Address], [Date]) VALUES (1072, 2034, 1056, NULL, 1, 123000, N'HÀ Nội', CAST(N'2024-03-20' AS Date))
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([ID], [Order_id], [Product_id], [Quantity]) VALUES (1, 1064, 1041, 1)
INSERT [dbo].[OrderDetail] ([ID], [Order_id], [Product_id], [Quantity]) VALUES (2, 1064, 1040, 1)
INSERT [dbo].[OrderDetail] ([ID], [Order_id], [Product_id], [Quantity]) VALUES (3, 1065, 1040, 3)
INSERT [dbo].[OrderDetail] ([ID], [Order_id], [Product_id], [Quantity]) VALUES (4, 1065, 1054, 2)
INSERT [dbo].[OrderDetail] ([ID], [Order_id], [Product_id], [Quantity]) VALUES (5, 1065, 1053, 1)
INSERT [dbo].[OrderDetail] ([ID], [Order_id], [Product_id], [Quantity]) VALUES (6, 1065, 1041, 3)
INSERT [dbo].[OrderDetail] ([ID], [Order_id], [Product_id], [Quantity]) VALUES (7, 1065, 1042, 1)
INSERT [dbo].[OrderDetail] ([ID], [Order_id], [Product_id], [Quantity]) VALUES (8, 1066, 1054, 1)
INSERT [dbo].[OrderDetail] ([ID], [Order_id], [Product_id], [Quantity]) VALUES (9, 1066, 1053, 1)
INSERT [dbo].[OrderDetail] ([ID], [Order_id], [Product_id], [Quantity]) VALUES (10, 1066, 1049, 1)
INSERT [dbo].[OrderDetail] ([ID], [Order_id], [Product_id], [Quantity]) VALUES (11, 1067, 1040, 1)
INSERT [dbo].[OrderDetail] ([ID], [Order_id], [Product_id], [Quantity]) VALUES (12, 1067, 1041, 1)
INSERT [dbo].[OrderDetail] ([ID], [Order_id], [Product_id], [Quantity]) VALUES (13, 1068, 1055, 1)
INSERT [dbo].[OrderDetail] ([ID], [Order_id], [Product_id], [Quantity]) VALUES (14, 1068, 1053, 1)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [ProductName], [Account_id], [Category_id], [Image], [Price], [Quantity], [Status], [Description]) VALUES (1039, N'Áo sơ mi cộc tay bé trai trắng', 1, 3, N'https://bizweb.dktcdn.net/thumb/1024x1024/100/447/555/products/untitled-capture1085-https://bizweb.dktcdn.net/thumb/1024x1024/100/447/555/products/untitled-capture1085-1690298752294.jpg', 259000, 13, 0, NULL)
INSERT [dbo].[Product] ([ID], [ProductName], [Account_id], [Category_id], [Image], [Price], [Quantity], [Status], [Description]) VALUES (1040, N'Chân váy nhung phối cúc bé gái - Lovekids', 1, 7, N'https://lovekids.vn/wp-content/uploads/2021/11/GMG21SK00402-1.jpg-595x793.png', 160000, 14, 1, NULL)
INSERT [dbo].[Product] ([ID], [ProductName], [Account_id], [Category_id], [Image], [Price], [Quantity], [Status], [Description]) VALUES (1041, N'Áo khoác nhung tăm túi hộp bé trai - Lovekids', 1, 3, N'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lk4ytqdt3lx08a', 250000, 15, 1, NULL)
INSERT [dbo].[Product] ([ID], [ProductName], [Account_id], [Category_id], [Image], [Price], [Quantity], [Status], [Description]) VALUES (1042, N'Áo khoác dạng vest màu trơn bé trai - Lovekids', 1, 3, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqhapg3uZm8y9V3FEB8yxW8qoyD2t7YR69N8RiHo__iA&s', 159999, 25, 1, NULL)
INSERT [dbo].[Product] ([ID], [ProductName], [Account_id], [Category_id], [Image], [Price], [Quantity], [Status], [Description]) VALUES (1044, N'Áo phông tay ngắn bé trai hình khủng long ', 1, 1, N'https://down-vn.img.susercontent.com/file/a6321bed9d5af2200e9990be1ed41e0a', 350000, 14, 1, NULL)
INSERT [dbo].[Product] ([ID], [ProductName], [Account_id], [Category_id], [Image], [Price], [Quantity], [Status], [Description]) VALUES (1046, N'Áo thun bé gái Rabity cotton hình thỏ', 1, 2, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-PW5VfsYhbYmVIjCzDLUKA18HR0h5XAGeq_45Rhn2Vw&s', 245000, 14, 1, NULL)
INSERT [dbo].[Product] ([ID], [ProductName], [Account_id], [Category_id], [Image], [Price], [Quantity], [Status], [Description]) VALUES (1047, N'Áo dài cho bé gái ILABY cách tân ', 1, 2, N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lr2mjlezxnkp4a', 145000, 43, 1, NULL)
INSERT [dbo].[Product] ([ID], [ProductName], [Account_id], [Category_id], [Image], [Price], [Quantity], [Status], [Description]) VALUES (1048, N'Set áo in vân mây kèm chân váy cho bé gái ILABY ', 1, 2, N'https://content.pancake.vn/1/s2250x150/fwebp/da/13/9c/7f/ef26ad2281ae65b32bec71855c0a70409b1255f152d5f23f7bcda5db.jpg', 420000, 40, 1, NULL)
INSERT [dbo].[Product] ([ID], [ProductName], [Account_id], [Category_id], [Image], [Price], [Quantity], [Status], [Description]) VALUES (1049, N'Mũ cói dây hình bông hoa cho bé gái Rabity', 1, 4, N'https://product.hstatic.net/1000290074/product/_dsc0575_copy_fefe17350ada4850980143e0af9b9b80.jpg', 120000, 23, 1, NULL)
INSERT [dbo].[Product] ([ID], [ProductName], [Account_id], [Category_id], [Image], [Price], [Quantity], [Status], [Description]) VALUES (1050, N'Áo thun bé trai dài tay RABITY cổ tròn', 1, 1, N'https://product.hstatic.net/1000290074/product/_nik9597_7f1d7f3171184029b790f5f85c6dec53.jpg', 150000, 21, 1, NULL)
INSERT [dbo].[Product] ([ID], [ProductName], [Account_id], [Category_id], [Image], [Price], [Quantity], [Status], [Description]) VALUES (1051, N'Áo vest cho bé gái ILABY chất liệu nhung tăm', 1, 2, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7kuyxYHdmc-i5ToeGiTJTTT1KKN-QL69kmPaYaGHc4w&s', 230000, 43, 1, NULL)
INSERT [dbo].[Product] ([ID], [ProductName], [Account_id], [Category_id], [Image], [Price], [Quantity], [Status], [Description]) VALUES (1052, N'Váy nỉ dài tay dáng suông LK0283 - Lovekids', 1, 7, N'https://salt.tikicdn.com/cache/w400/ts/product/c1/82/83/68aacfc83b425631f4f6609c0cb7303d.jpg', 249000, 57, 1, NULL)
INSERT [dbo].[Product] ([ID], [ProductName], [Account_id], [Category_id], [Image], [Price], [Quantity], [Status], [Description]) VALUES (1053, N'Giày Thể Thao Màu Trắng Cổ Thấp', 1, 6, N'https://dosi-in.com/file/detailed/496/dosiin-urban-outfits-giay-sneaker-nu-trang-urban-outfits-co-thap-phoi-mau-gsk-dang-the-thao-han-496173.jpg?w=1000&h=1000&fit=fill&fm=webp', 90000, 67, 1, NULL)
INSERT [dbo].[Product] ([ID], [ProductName], [Account_id], [Category_id], [Image], [Price], [Quantity], [Status], [Description]) VALUES (1054, N'Kẹp tóc nơ AMILA dễ thương cho bé gái', 1, 4, N'https://cf.shopee.vn/file/sg-11134201-22120-cjp9rvwavnlv2b', 40000, 10, 1, NULL)
INSERT [dbo].[Product] ([ID], [ProductName], [Account_id], [Category_id], [Image], [Price], [Quantity], [Status], [Description]) VALUES (1055, N'Mũ trùm tai AMILA chất liệu dày dặn ấm áp', 1, 2, N'https://down-vn.img.susercontent.com/file/sg-11134201-7rblq-lnse7gi99x517a', 45000, 34, 1, NULL)
INSERT [dbo].[Product] ([ID], [ProductName], [Account_id], [Category_id], [Image], [Price], [Quantity], [Status], [Description]) VALUES (1056, N'Áo hoodie AMILA dáng rộng họa tiết hoạt hình', 1, 1, N'https://down-vn.img.susercontent.com/file/a181c30d8102f45907a7f9e836b07100', 123000, 11, 0, NULL)
INSERT [dbo].[Product] ([ID], [ProductName], [Account_id], [Category_id], [Image], [Price], [Quantity], [Status], [Description]) VALUES (1057, N'AMILA Giày Thể Thao Phối Lưới', 1, 5, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFmmQpZdFcgevdEa8JISN8tz7Di39eEpCeDkobAyXAwA&s', 145000, 32, 1, NULL)
INSERT [dbo].[Product] ([ID], [ProductName], [Account_id], [Category_id], [Image], [Price], [Quantity], [Status], [Description]) VALUES (1058, N'ÁO Nam', 1, 1, N'', 120000, 5, 1, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Account] FOREIGN KEY([Account_id])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Account]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Product] FOREIGN KEY([Product_id])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Product]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([Order_id])
REFERENCES [dbo].[Order] ([ID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([Product_id])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Account] FOREIGN KEY([Account_id])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Account]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([Category_id])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
USE [master]
GO
ALTER DATABASE [Shop] SET  READ_WRITE 
GO
