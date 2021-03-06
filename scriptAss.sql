USE [master]
GO
/****** Object:  Database [AssDB]    Script Date: 3/12/2022 7:41:40 PM ******/
CREATE DATABASE [AssDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AssDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AssDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AssDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AssDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AssDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AssDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AssDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AssDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AssDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AssDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AssDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [AssDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AssDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AssDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AssDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AssDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AssDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AssDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AssDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AssDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AssDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AssDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AssDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AssDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AssDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AssDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AssDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AssDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AssDB] SET RECOVERY FULL 
GO
ALTER DATABASE [AssDB] SET  MULTI_USER 
GO
ALTER DATABASE [AssDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AssDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AssDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AssDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AssDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AssDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AssDB', N'ON'
GO
ALTER DATABASE [AssDB] SET QUERY_STORE = OFF
GO
USE [AssDB]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 3/12/2022 7:41:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[categoryID] [nvarchar](50) NOT NULL,
	[categoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 3/12/2022 7:41:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[orderID] [int] NOT NULL,
	[orderDate] [nvarchar](50) NULL,
	[total] [int] NULL,
	[userID] [nvarchar](50) NOT NULL,
	[status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblOrder] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 3/12/2022 7:41:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[detailID] [int] NOT NULL,
	[price] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[orderID] [int] NOT NULL,
	[productID] [int] NOT NULL,
 CONSTRAINT [PK_tblOrderDetail] PRIMARY KEY CLUSTERED 
(
	[detailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 3/12/2022 7:41:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[productID] [int] NOT NULL,
	[productName] [nvarchar](50) NULL,
	[image] [nvarchar](255) NULL,
	[price] [int] NULL,
	[quantity] [int] NULL,
	[categoryID] [nvarchar](50) NOT NULL,
	[importDate] [nvarchar](50) NULL,
	[usingDate] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblProduct] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 3/12/2022 7:41:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [nvarchar](50) NOT NULL,
	[roleName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblRoles] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 3/12/2022 7:41:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [nvarchar](50) NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[roleID] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[birthday] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'TU', N'tuber')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'VEG', N'vegetable')
GO
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID], [status]) VALUES (1, N'20/03/2022', 3000, N'SE150449', N'1')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID], [status]) VALUES (2, N'11-03-2022', 3000, N'1', N'1')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID], [status]) VALUES (3, N'11/03/2022', 25000, N'SE150449', N'1')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID], [status]) VALUES (4, N'11/03/2022', 37500, N'SE150449', N'1')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID], [status]) VALUES (5, N'12/03/2022', 103500, N'SE150449', N'1')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID], [status]) VALUES (6, N'12/03/2022', 62000, N'SE150449', N'1')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID], [status]) VALUES (7, N'12/03/2022', 91000, N'SE150449', N'1')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID], [status]) VALUES (8, N'12/03/2022', 50000, N'SE150449', N'1')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID], [status]) VALUES (9, N'12/03/2022', 125000, N'SE150449', N'1')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID], [status]) VALUES (10, N'12/03/2022', 35000, N'SE150449', N'1')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID], [status]) VALUES (11, N'12/03/2022', 22800, N'SE150449', N'1')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID], [status]) VALUES (12, N'12/03/2022', 42600, N'SE150449', N'1')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID], [status]) VALUES (13, N'12/03/2022', 100000, N'hoahoang', N'1')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID], [status]) VALUES (14, N'12/03/2022', 25000, N'SE150449', N'1')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID], [status]) VALUES (15, N'12/03/2022', 25000, N'SE150449', N'1')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID], [status]) VALUES (16, N'12/03/2022', 25000, N'SE150449', N'1')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID], [status]) VALUES (17, N'12/03/2022', 12000, N'SE150449', N'1')
GO
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (1, 4000, 3, 17, 1)
GO
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate]) VALUES (1, N'Rau ram 100g', N'1.jpg', 4000, 10, N'VEG', N'06/03/2022', N'24/03/2022')
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate]) VALUES (2, N'Cà Rốt Đà Lạt 500g', N'2.jpg', 12500, 10, N'TU', N'06/03/2022', N'20/03/2022')
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate]) VALUES (3, N'Khoai Tây 500g', N'3.jpg', 12500, 10, N'TU', N'06/03/2022', N'20/03/2022')
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate]) VALUES (4, N'Hành Tây 300g', N'4.jpg', 7000, 10, N'TU', N'07/03/2022', N'20/03/2022')
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate]) VALUES (5, N'Xà lách lô lô xanh 500g
', N'5.jpg', 14200, 10, N'VEG', N'07/03/2022', N'20/03/2022')
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate]) VALUES (6, N'Rau Cần Nước 500g
', N'6.jpg', 16100, 10, N'VEG', N'07/03/2022', N'20/03/2022')
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate]) VALUES (7, N'Xà lách xoong Đà Lạt 500g
', N'7.jpg', 17100, 10, N'VEG', N'07/03/2022', N'20/03/2022')
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate]) VALUES (8, N'Rau muống 300g
', N'8.jpg', 11400, 10, N'VEG', N'07/03/2022', N'20/03/2022')
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate]) VALUES (9, N'Bắp cải thảo 500g
', N'9.jpg', 9500, 10, N'VEG', N'07/03/2022', N'20/03/2022')
GO
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'AD', N'admin')
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'US', N'user')
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [email], [status]) VALUES (N'1', N'phatph', N'pword', N'AD', N'15A Tan Hoa', N'24/05/2001', N'0833231854', N'phatphse150445@fpt.edu.vn', N'1')
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [email], [status]) VALUES (N'4', N'UserTest', N'1', N'US', N'adbdc ', N'20/02/1999', N'0939402894', N'dfkaodsj@gmail.com', N'1')
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [email], [status]) VALUES (N'hieutrung', N'Tran Hieu trung', N'1', N'US', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [email], [status]) VALUES (N'hoahoang', N'Hoang Quang Hoa', N'1', N'US', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [email], [status]) VALUES (N'hungphat', N'Hung Phat', N'1', N'AD', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [email], [status]) VALUES (N'nguyenle', N'Linh NGUYEN', N'1', N'US', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [email], [status]) VALUES (N'SE150445', N'Pham Hung Phat', N'123', N'AD', N'46E Tan Hoa 2', N'14/07/2001', N'0833231856', N'hungphatpl1@gmail.com', N'1')
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [email], [status]) VALUES (N'SE150449', N'Truong Minh Tue', N'1', N'US', N'Long Truong', N'23/01/2001', N'0833231928', N'mtue2022@gmail.com', N'1')
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK_tblOrder_tblUsers2] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK_tblOrder_tblUsers2]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblOrder1] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrder] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblOrder1]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblProduct1] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProduct] ([productID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblProduct1]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK_tblProduct_tblCategory] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategory] ([categoryID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK_tblProduct_tblCategory]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblRoles] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblRoles]
GO
USE [master]
GO
ALTER DATABASE [AssDB] SET  READ_WRITE 
GO
