USE [master]
GO
/****** Object:  Database [BirdeePlatform]    Script Date: 8/2/2023 7:34:21 PM ******/
CREATE DATABASE [BirdeePlatform]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BirdeePlatform', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MYDATA\MSSQL\DATA\BirdeePlatform.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BirdeePlatform_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MYDATA\MSSQL\DATA\BirdeePlatform_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BirdeePlatform] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BirdeePlatform].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BirdeePlatform] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BirdeePlatform] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BirdeePlatform] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BirdeePlatform] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BirdeePlatform] SET ARITHABORT OFF 
GO
ALTER DATABASE [BirdeePlatform] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BirdeePlatform] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BirdeePlatform] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BirdeePlatform] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BirdeePlatform] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BirdeePlatform] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BirdeePlatform] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BirdeePlatform] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BirdeePlatform] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BirdeePlatform] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BirdeePlatform] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BirdeePlatform] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BirdeePlatform] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BirdeePlatform] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BirdeePlatform] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BirdeePlatform] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BirdeePlatform] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BirdeePlatform] SET RECOVERY FULL 
GO
ALTER DATABASE [BirdeePlatform] SET  MULTI_USER 
GO
ALTER DATABASE [BirdeePlatform] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BirdeePlatform] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BirdeePlatform] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BirdeePlatform] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BirdeePlatform] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BirdeePlatform] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BirdeePlatform', N'ON'
GO
ALTER DATABASE [BirdeePlatform] SET QUERY_STORE = OFF
GO
USE [BirdeePlatform]
GO
/****** Object:  Table [dbo].[Best_Seller]    Script Date: 8/2/2023 7:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Best_Seller](
	[ProductID] [int] NULL,
	[deleteFlag] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bird_Details]    Script Date: 8/2/2023 7:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bird_Details](
	[ProductID] [int] NULL,
	[dob] [date] NULL,
	[gender] [bit] NULL,
	[height] [float] NULL,
	[weight] [float] NULL,
	[origin] [nvarchar](250) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 8/2/2023 7:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](255) NOT NULL,
	[Status] [bit] NOT NULL,
	[Description] [text] NULL,
	[TagId] [int] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Collections]    Script Date: 8/2/2023 7:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Collections](
	[CollectionID] [int] IDENTITY(1,1) NOT NULL,
	[CollectionName] [nvarchar](255) NOT NULL,
	[link] [varchar](max) NULL,
	[Status] [bit] NOT NULL,
	[Description] [text] NULL,
 CONSTRAINT [PK_Collections] PRIMARY KEY CLUSTERED 
(
	[CollectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image_Product]    Script Date: 8/2/2023 7:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image_Product](
	[ProductID] [int] NULL,
	[image] [text] NULL,
	[deleteFlag] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[New_Arrival]    Script Date: 8/2/2023 7:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[New_Arrival](
	[ProductID] [int] NOT NULL,
	[deleteFlag] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 8/2/2023 7:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailsId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[TotalPrice] [money] NULL,
	[Rate] [float] NULL,
	[Comment] [nvarchar](max) NULL,
	[IsRated] [bit] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 8/2/2023 7:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] NOT NULL,
	[OrderFromUser] [int] NULL,
	[Customer_Name] [nvarchar](255) NULL,
	[Customer_Email] [varchar](255) NULL,
	[Customer_Phone] [varchar](20) NULL,
	[Customer_Address] [nvarchar](255) NULL,
	[DateTime] [datetime] NOT NULL,
	[PaymentMethod] [int] NOT NULL,
	[DeliverStatus] [int] NULL,
	[TotalOrder] [money] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 8/2/2023 7:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentId] [int] NOT NULL,
	[Method] [nvarchar](255) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Collection]    Script Date: 8/2/2023 7:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Collection](
	[ProductId] [int] NOT NULL,
	[CollectionId] [int] NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
 CONSTRAINT [Product_Collection_PKs] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[CollectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Tag]    Script Date: 8/2/2023 7:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Tag](
	[ProductId] [int] NOT NULL,
	[TagId] [int] NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
 CONSTRAINT [Product_Tag_PKs] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 8/2/2023 7:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Price] [money] NULL,
	[Quantity] [int] NULL,
	[Status] [bit] NULL,
	[ClassType] [int] NULL,
	[ClassValue] [nvarchar](50) NULL,
	[createDate] [date] NULL,
	[ParentId] [int] NULL,
	[CategoryId] [int] NULL,
	[IsParent] [bit] NULL,
	[ShopID] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[DeleteFlag] [bit] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rate_Product]    Script Date: 8/2/2023 7:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rate_Product](
	[RateID] [int] IDENTITY(1,1) NOT NULL,
	[Rate] [float] NULL,
	[Comment] [nvarchar](max) NULL,
	[CustomerID] [int] NULL,
	[ProductID] [int] NULL,
	[Date] [date] NULL,
	[deleteFlag] [bit] NULL,
 CONSTRAINT [PK_Rate_Product] PRIMARY KEY CLUSTERED 
(
	[RateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 8/2/2023 7:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](255) NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusOrder]    Script Date: 8/2/2023 7:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusOrder](
	[StatusOrderID] [int] NOT NULL,
	[StatusValue] [nvarchar](255) NULL,
 CONSTRAINT [PK_StatusOrder] PRIMARY KEY CLUSTERED 
(
	[StatusOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 8/2/2023 7:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[TagId] [int] IDENTITY(1,1) NOT NULL,
	[TagName] [nvarchar](255) NOT NULL,
	[Status] [bit] NOT NULL,
	[Description] [text] NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 8/2/2023 7:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[TypeID] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 8/2/2023 7:34:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](255) NULL,
	[Email] [varchar](255) NULL,
	[EmailID] [text] NULL,
	[Password] [varchar](255) NULL,
	[Phone] [varchar](10) NULL,
	[DOB] [date] NULL,
	[Address] [nvarchar](max) NULL,
	[Avatar] [text] NULL,
	[gender] [nvarchar](50) NULL,
	[RoleID] [int] NULL,
	[ManagerID] [int] NULL,
	[Status] [bit] NULL,
	[Description] [nvarchar](max) NULL,
	[DeleteFlag] [bit] NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Best_Seller] ([ProductID], [deleteFlag]) VALUES (3, 0)
INSERT [dbo].[Best_Seller] ([ProductID], [deleteFlag]) VALUES (6, 0)
INSERT [dbo].[Best_Seller] ([ProductID], [deleteFlag]) VALUES (12, 0)
INSERT [dbo].[Best_Seller] ([ProductID], [deleteFlag]) VALUES (7, 0)
GO
INSERT [dbo].[Bird_Details] ([ProductID], [dob], [gender], [height], [weight], [origin]) VALUES (1, CAST(N'2023-06-12' AS Date), 1, 5.4, 34.3, N'VN')
INSERT [dbo].[Bird_Details] ([ProductID], [dob], [gender], [height], [weight], [origin]) VALUES (2, CAST(N'2023-05-28' AS Date), 0, 2.3, 34.2, N'US')
INSERT [dbo].[Bird_Details] ([ProductID], [dob], [gender], [height], [weight], [origin]) VALUES (3, CAST(N'2023-04-14' AS Date), 1, 5.2, 43.3, N'US')
INSERT [dbo].[Bird_Details] ([ProductID], [dob], [gender], [height], [weight], [origin]) VALUES (4, CAST(N'2023-05-17' AS Date), 0, 3.4, 53, N'AU')
INSERT [dbo].[Bird_Details] ([ProductID], [dob], [gender], [height], [weight], [origin]) VALUES (5, CAST(N'2023-05-05' AS Date), 1, 3.4, 43, N'UK')
INSERT [dbo].[Bird_Details] ([ProductID], [dob], [gender], [height], [weight], [origin]) VALUES (6, CAST(N'2023-05-23' AS Date), 1, 6.6, 23, N'VN')
INSERT [dbo].[Bird_Details] ([ProductID], [dob], [gender], [height], [weight], [origin]) VALUES (7, CAST(N'2023-04-30' AS Date), 0, 3.4, 23, N'VN')
INSERT [dbo].[Bird_Details] ([ProductID], [dob], [gender], [height], [weight], [origin]) VALUES (8, CAST(N'2023-06-06' AS Date), 0, 6.5, 43, N'UK')
INSERT [dbo].[Bird_Details] ([ProductID], [dob], [gender], [height], [weight], [origin]) VALUES (9, CAST(N'2023-04-30' AS Date), 1, 7.2, 35, N'US')
INSERT [dbo].[Bird_Details] ([ProductID], [dob], [gender], [height], [weight], [origin]) VALUES (39, CAST(N'2023-07-27' AS Date), 1, 12, 12, N'Vn')
INSERT [dbo].[Bird_Details] ([ProductID], [dob], [gender], [height], [weight], [origin]) VALUES (41, CAST(N'2023-08-02' AS Date), 0, 12, 12, N'VN')
INSERT [dbo].[Bird_Details] ([ProductID], [dob], [gender], [height], [weight], [origin]) VALUES (33, CAST(N'2023-07-15' AS Date), 0, 12, 12, N'VN')
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Status], [Description], [TagId]) VALUES (1, N'Chim Cảnh', 1, NULL, 1)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Status], [Description], [TagId]) VALUES (2, N'Chim giống', 1, NULL, 1)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Status], [Description], [TagId]) VALUES (3, N'Cám chim', 1, NULL, 3)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Status], [Description], [TagId]) VALUES (4, N'Hạt', 1, NULL, 3)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Status], [Description], [TagId]) VALUES (5, N'Cám tăng trưởng', 1, NULL, 3)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Status], [Description], [TagId]) VALUES (6, N'Máng nước', 1, NULL, 5)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Status], [Description], [TagId]) VALUES (7, N'Máng thức ăn', 1, NULL, 5)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Status], [Description], [TagId]) VALUES (8, N'Lồng chim cảnh', 1, NULL, 7)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Status], [Description], [TagId]) VALUES (12, N'Nhà chim bồ câu', 1, NULL, 7)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Collections] ON 

INSERT [dbo].[Collections] ([CollectionID], [CollectionName], [link], [Status], [Description]) VALUES (1, N'Thú vui nuôi chim', N'https://bizweb.dktcdn.net/thumb/compact/100/450/808/collections/10-37c9706f-413a-4123-b0d6-07905851440b.png?v=1648550713910', 1, NULL)
INSERT [dbo].[Collections] ([CollectionID], [CollectionName], [link], [Status], [Description]) VALUES (3, N'Phụ kiện nổi bật', N'https://bizweb.dktcdn.net/thumb/compact/100/450/808/collections/9-228daf39-c660-4d00-9cc0-b9bbdb8f0e1d.png?v=1648550696500', 1, NULL)
INSERT [dbo].[Collections] ([CollectionID], [CollectionName], [link], [Status], [Description]) VALUES (4, N'Sản phẩm hot', N'https://bizweb.dktcdn.net/thumb/compact/100/450/808/collections/cuo-c-so-ng-thu-o-ng-nga-y.png?v=1648549034233', 1, NULL)
INSERT [dbo].[Collections] ([CollectionID], [CollectionName], [link], [Status], [Description]) VALUES (5, N'Người mới', N'https://bizweb.dktcdn.net/thumb/compact/100/450/808/collections/thu-gia-n.png?v=1648549150917', 1, NULL)
SET IDENTITY_INSERT [dbo].[Collections] OFF
GO
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (39, N'/images/2023-07-27T200042.540Untitled Diagram.drawio (13).png', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (2, N'https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2021/04/5cb00187-hinh-dai-dien-vet-kieng.jpg', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (3, N'https://naipet.com/wp-content/uploads/2017/03/ky-thuat-chon-chim-cu-gay.jpg', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (33, N'/images/2023-07-15T004300.225User details (4).png', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (40, N'/images/2023-07-27T200121.730Untitled Diagram.drawio (11).png', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (41, N'/images/2023-08-02T180411.683Untitled Diagram.drawio (11).png', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (4, N'https://vcdn-dulich.vnecdn.net/2019/12/26/chim-9542-1577363880.jpg', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (5, N'https://vietnamwildlife.files.wordpress.com/2021/12/pna_5322_l2048.jpg?w=2048', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (6, N'https://www.thukieng.com/wp-content/uploads/2017/07/gia-mua-ban-chim-hoa-mi-1.jpg', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (7, N'https://runghoangda.com/wp-content/uploads/2022/06/vet-Lovebird-1.jpg', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (8, N'https://vcdn-dulich.vnecdn.net/2019/12/26/chim-9542-1577363880.jpg', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (9, N'https://redsvn.net/wp-content/uploads/2021/10/img_616f81e80d51f.jpg', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (10, N'https://vcdn-dulich.vnecdn.net/2019/12/26/chim-9542-1577363880.jpg', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (11, N'https://bizweb.dktcdn.net/thumb/1024x1024/100/263/045/products/z4183064164276-a078ec090468b44fccd13da4f15fc4b1.jpg?v=1678848260617', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (12, N'https://sc01.alicdn.com/kf/HTB1qP09mwKTBuNkSne1q6yJoXXaN/200065609/HTB1qP09mwKTBuNkSne1q6yJoXXaN.jpg', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (13, N'https://lzd-img-global.slatic.net/g/p/8eb6009dba1edef59aca486a2e12311a.jpg_720x720q80.jpg', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (15, N'https://vn-live-01.slatic.net/p/143421766fc6e9cd1df8c5507d2d7888.jpg', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (1, N'https://image-us.eva.vn/upload/4-2021/images/2021-10-01/image1-1633053449-421-width600height450.jpg', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (1, N'https://runghoangda.com/wp-content/uploads/2022/06/vet-Lovebird-1.jpg', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (1, N'https://vietnamwildlife.files.wordpress.com/2021/12/pna_5322_l2048.jpg?w=2048', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (38, N'/images/2023-07-21T224100.145Untitled Diagram.drawio (12).png', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (38, N'/images/2023-07-21T224100.150Untitled Diagram.drawio (11).png', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (38, N'/images/2023-07-21T224100.152Untitled Diagram.drawio (10).png', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (16, N'https://cf.shopee.vn/file/sg-11134201-23020-4p6z2yyl3wnvb3', 0)
GO
INSERT [dbo].[New_Arrival] ([ProductID], [deleteFlag]) VALUES (1, 0)
INSERT [dbo].[New_Arrival] ([ProductID], [deleteFlag]) VALUES (2, 0)
INSERT [dbo].[New_Arrival] ([ProductID], [deleteFlag]) VALUES (8, 0)
INSERT [dbo].[New_Arrival] ([ProductID], [deleteFlag]) VALUES (15, 0)
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [Quantity], [TotalPrice], [Rate], [Comment], [IsRated]) VALUES (63, 1, 3, 1, 280.0000, 4, N'okela', 1)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [Quantity], [TotalPrice], [Rate], [Comment], [IsRated]) VALUES (64, 1, 12, 2, 180.0000, 5, N'mic check', 1)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [Quantity], [TotalPrice], [Rate], [Comment], [IsRated]) VALUES (65, 2, 6, 1, 350.0000, NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [Quantity], [TotalPrice], [Rate], [Comment], [IsRated]) VALUES (66, 3, 7, 2, 960.0000, NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [Quantity], [TotalPrice], [Rate], [Comment], [IsRated]) VALUES (68, 4, 3, 1, 280.0000, NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [Quantity], [TotalPrice], [Rate], [Comment], [IsRated]) VALUES (69, 4, 12, 1, 90.0000, NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [Quantity], [TotalPrice], [Rate], [Comment], [IsRated]) VALUES (70, 5, 6, 1, 350.0000, NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [Quantity], [TotalPrice], [Rate], [Comment], [IsRated]) VALUES (71, 6, 3, 1, 280.0000, NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [Quantity], [TotalPrice], [Rate], [Comment], [IsRated]) VALUES (72, 6, 12, 1, 90.0000, NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [Quantity], [TotalPrice], [Rate], [Comment], [IsRated]) VALUES (73, 7, 6, 1, 350.0000, NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [Quantity], [TotalPrice], [Rate], [Comment], [IsRated]) VALUES (74, 8, 7, 1, 480.0000, NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [Quantity], [TotalPrice], [Rate], [Comment], [IsRated]) VALUES (79, 10, 6, 1, 350.0000, NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [Quantity], [TotalPrice], [Rate], [Comment], [IsRated]) VALUES (80, 11, 7, 1, 480.0000, NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [Quantity], [TotalPrice], [Rate], [Comment], [IsRated]) VALUES (81, 12, 12, 1, 90.0000, NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [Quantity], [TotalPrice], [Rate], [Comment], [IsRated]) VALUES (82, 12, 3, 1, 280.0000, NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [Quantity], [TotalPrice], [Rate], [Comment], [IsRated]) VALUES (83, 13, 6, 1, 350.0000, NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [Quantity], [TotalPrice], [Rate], [Comment], [IsRated]) VALUES (84, 14, 7, 1, 480.0000, NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [Quantity], [TotalPrice], [Rate], [Comment], [IsRated]) VALUES (87, 16, 6, 1, 350.0000, NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [Quantity], [TotalPrice], [Rate], [Comment], [IsRated]) VALUES (88, 17, 7, 1, 480.0000, NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [Quantity], [TotalPrice], [Rate], [Comment], [IsRated]) VALUES (89, 18, 12, 1, 90.0000, NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [Quantity], [TotalPrice], [Rate], [Comment], [IsRated]) VALUES (90, 18, 3, 1, 280.0000, NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [Quantity], [TotalPrice], [Rate], [Comment], [IsRated]) VALUES (91, 19, 6, 1, 350.0000, NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [Quantity], [TotalPrice], [Rate], [Comment], [IsRated]) VALUES (92, 20, 7, 1, 480.0000, NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [Quantity], [TotalPrice], [Rate], [Comment], [IsRated]) VALUES (93, 21, 12, 1, 90.0000, NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [Quantity], [TotalPrice], [Rate], [Comment], [IsRated]) VALUES (94, 21, 3, 1, 280.0000, 5, N'Oke đấy chứ', 1)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [Quantity], [TotalPrice], [Rate], [Comment], [IsRated]) VALUES (95, 22, 6, 1, 350.0000, NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [Quantity], [TotalPrice], [Rate], [Comment], [IsRated]) VALUES (96, 23, 7, 1, 480.0000, NULL, NULL, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [Quantity], [TotalPrice], [Rate], [Comment], [IsRated]) VALUES (97, 24, 12, 1, 90.0000, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
INSERT [dbo].[Orders] ([OrderID], [OrderFromUser], [Customer_Name], [Customer_Email], [Customer_Phone], [Customer_Address], [DateTime], [PaymentMethod], [DeliverStatus], [TotalOrder]) VALUES (1, 3, N'Quyền Hải Long', N'satff2@gmail.com', N'0979867986', N'SG', CAST(N'2023-08-02T00:00:00.000' AS DateTime), 1, 3, 480.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderFromUser], [Customer_Name], [Customer_Email], [Customer_Phone], [Customer_Address], [DateTime], [PaymentMethod], [DeliverStatus], [TotalOrder]) VALUES (2, 3, N'Quyền Hải Long', N'satff2@gmail.com', N'0979867986', N'SG', CAST(N'2023-08-02T00:00:00.000' AS DateTime), 1, 1, 370.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderFromUser], [Customer_Name], [Customer_Email], [Customer_Phone], [Customer_Address], [DateTime], [PaymentMethod], [DeliverStatus], [TotalOrder]) VALUES (3, 3, N'Quyền Hải Long', N'satff2@gmail.com', N'0979867986', N'SG', CAST(N'2023-08-02T00:00:00.000' AS DateTime), 1, 4, 980.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderFromUser], [Customer_Name], [Customer_Email], [Customer_Phone], [Customer_Address], [DateTime], [PaymentMethod], [DeliverStatus], [TotalOrder]) VALUES (4, 3, N'Quyền Hải Long', N'satff2@gmail.com', N'0567567567', N'okela', CAST(N'2023-08-02T00:00:00.000' AS DateTime), 1, 1, 370.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderFromUser], [Customer_Name], [Customer_Email], [Customer_Phone], [Customer_Address], [DateTime], [PaymentMethod], [DeliverStatus], [TotalOrder]) VALUES (5, 3, N'Quyền Hải Long', N'satff2@gmail.com', N'0567567567', N'okela', CAST(N'2023-08-02T00:00:00.000' AS DateTime), 1, 1, 500.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderFromUser], [Customer_Name], [Customer_Email], [Customer_Phone], [Customer_Address], [DateTime], [PaymentMethod], [DeliverStatus], [TotalOrder]) VALUES (6, 3, N'Quyền Hải Long', N'satff2@gmail.com', N'0987654324', N'asdgsdf', CAST(N'2023-08-02T00:00:00.000' AS DateTime), 1, 5, 390.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderFromUser], [Customer_Name], [Customer_Email], [Customer_Phone], [Customer_Address], [DateTime], [PaymentMethod], [DeliverStatus], [TotalOrder]) VALUES (7, 3, N'Quyền Hải Long', N'satff2@gmail.com', N'0987654324', N'asdgsdf', CAST(N'2023-08-02T00:00:00.000' AS DateTime), 1, 1, 370.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderFromUser], [Customer_Name], [Customer_Email], [Customer_Phone], [Customer_Address], [DateTime], [PaymentMethod], [DeliverStatus], [TotalOrder]) VALUES (8, 3, N'Quyền Hải Long', N'satff2@gmail.com', N'0987654324', N'asdgsdf', CAST(N'2023-08-02T00:00:00.000' AS DateTime), 1, 1, 500.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderFromUser], [Customer_Name], [Customer_Email], [Customer_Phone], [Customer_Address], [DateTime], [PaymentMethod], [DeliverStatus], [TotalOrder]) VALUES (10, 3, N'Quyền Hải Long', N'satff2@gmail.com', N'0897897986', N'Hai Noi', CAST(N'2023-08-02T00:00:00.000' AS DateTime), 1, 1, 370.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderFromUser], [Customer_Name], [Customer_Email], [Customer_Phone], [Customer_Address], [DateTime], [PaymentMethod], [DeliverStatus], [TotalOrder]) VALUES (11, 3, N'Quyền Hải Long', N'satff2@gmail.com', N'0897897986', N'Hai Noi', CAST(N'2023-08-02T00:00:00.000' AS DateTime), 1, 1, 500.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderFromUser], [Customer_Name], [Customer_Email], [Customer_Phone], [Customer_Address], [DateTime], [PaymentMethod], [DeliverStatus], [TotalOrder]) VALUES (12, 3, N'Quyền Hải Long', N'satff2@gmail.com', N'9087990808', N'Sai Gon', CAST(N'2023-08-02T00:00:00.000' AS DateTime), 1, 4, 390.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderFromUser], [Customer_Name], [Customer_Email], [Customer_Phone], [Customer_Address], [DateTime], [PaymentMethod], [DeliverStatus], [TotalOrder]) VALUES (13, 3, N'Quyền Hải Long', N'satff2@gmail.com', N'9087990808', N'Sai Gon', CAST(N'2023-08-02T00:00:00.000' AS DateTime), 1, 4, 370.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderFromUser], [Customer_Name], [Customer_Email], [Customer_Phone], [Customer_Address], [DateTime], [PaymentMethod], [DeliverStatus], [TotalOrder]) VALUES (14, 3, N'Quyền Hải Long', N'satff2@gmail.com', N'9087990808', N'Sai Gon', CAST(N'2023-08-02T00:00:00.000' AS DateTime), 1, 1, 500.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderFromUser], [Customer_Name], [Customer_Email], [Customer_Phone], [Customer_Address], [DateTime], [PaymentMethod], [DeliverStatus], [TotalOrder]) VALUES (16, 3, N'Quyền Hải Long', N'satff2@gmail.com', N'0978896778', N'HCM', CAST(N'2023-08-02T00:00:00.000' AS DateTime), 1, 1, 370.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderFromUser], [Customer_Name], [Customer_Email], [Customer_Phone], [Customer_Address], [DateTime], [PaymentMethod], [DeliverStatus], [TotalOrder]) VALUES (17, 3, N'Quyền Hải Long', N'satff2@gmail.com', N'0978896778', N'HCM', CAST(N'2023-08-02T00:00:00.000' AS DateTime), 1, 1, 500.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderFromUser], [Customer_Name], [Customer_Email], [Customer_Phone], [Customer_Address], [DateTime], [PaymentMethod], [DeliverStatus], [TotalOrder]) VALUES (18, 3, N'Quyền Hải Long', N'satff2@gmail.com', N'0798798687', N'Bình Dương', CAST(N'2023-08-02T00:00:00.000' AS DateTime), 1, 6, 390.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderFromUser], [Customer_Name], [Customer_Email], [Customer_Phone], [Customer_Address], [DateTime], [PaymentMethod], [DeliverStatus], [TotalOrder]) VALUES (19, 3, N'Quyền Hải Long', N'satff2@gmail.com', N'0798798687', N'Bình Dương', CAST(N'2023-08-02T00:00:00.000' AS DateTime), 1, 1, 370.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderFromUser], [Customer_Name], [Customer_Email], [Customer_Phone], [Customer_Address], [DateTime], [PaymentMethod], [DeliverStatus], [TotalOrder]) VALUES (20, 3, N'Quyền Hải Long', N'satff2@gmail.com', N'0798798687', N'Bình Dương', CAST(N'2023-08-02T00:00:00.000' AS DateTime), 1, 1, 500.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderFromUser], [Customer_Name], [Customer_Email], [Customer_Phone], [Customer_Address], [DateTime], [PaymentMethod], [DeliverStatus], [TotalOrder]) VALUES (21, 3, N'Quyền Hải Long', N'satff2@gmail.com', N'0897956857', N'Tét', CAST(N'2023-08-02T00:00:00.000' AS DateTime), 1, 3, 390.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderFromUser], [Customer_Name], [Customer_Email], [Customer_Phone], [Customer_Address], [DateTime], [PaymentMethod], [DeliverStatus], [TotalOrder]) VALUES (22, 3, N'Quyền Hải Long', N'satff2@gmail.com', N'0897956857', N'Tét', CAST(N'2023-08-02T00:00:00.000' AS DateTime), 1, 4, 370.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderFromUser], [Customer_Name], [Customer_Email], [Customer_Phone], [Customer_Address], [DateTime], [PaymentMethod], [DeliverStatus], [TotalOrder]) VALUES (23, 3, N'Quyền Hải Long', N'satff2@gmail.com', N'0897956857', N'Tét', CAST(N'2023-08-02T00:00:00.000' AS DateTime), 1, 1, 500.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderFromUser], [Customer_Name], [Customer_Email], [Customer_Phone], [Customer_Address], [DateTime], [PaymentMethod], [DeliverStatus], [TotalOrder]) VALUES (24, 3, N'Quyền Hải Long', N'satff2@gmail.com', N'0456745645', N'mic check mic check', CAST(N'2023-08-02T00:00:00.000' AS DateTime), 2, 5, 110.0000)
GO
INSERT [dbo].[Payments] ([PaymentId], [Method], [Status]) VALUES (1, N'Ship COD', 1)
INSERT [dbo].[Payments] ([PaymentId], [Method], [Status]) VALUES (2, N'Chuyển khoản', 1)
INSERT [dbo].[Payments] ([PaymentId], [Method], [Status]) VALUES (3, N'Paypal', 0)
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [ShopID], [Description], [DeleteFlag]) VALUES (1, N'Chim vành khuyên', 220.0000, 30, 0, 1, N'Chim trưởng thành', NULL, NULL, 2, 1, 12, N'Đây là mô tả', 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [ShopID], [Description], [DeleteFlag]) VALUES (2, N'Vẹt xanh', 220.0000, 0, 1, NULL, NULL, NULL, NULL, 1, 1, 12, N'Đây là mô tả', 0)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [ShopID], [Description], [DeleteFlag]) VALUES (3, N'Chim Cu Gáy', 280.0000, 58, 1, NULL, NULL, NULL, NULL, 2, 1, 12, N'Đây là mô tả', 0)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [ShopID], [Description], [DeleteFlag]) VALUES (4, N'Chích chòe than', 320.0000, 45, 1, NULL, NULL, NULL, NULL, 2, 1, 13, N'Đây là mô tả', 0)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [ShopID], [Description], [DeleteFlag]) VALUES (5, N'Sáo đầu trắng', 480.0000, 12, 1, NULL, NULL, NULL, NULL, 2, 1, 12, N'Đây là mô tả', 0)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [ShopID], [Description], [DeleteFlag]) VALUES (6, N'Chim họa mi bổi', 350.0000, 9, 1, NULL, NULL, NULL, 5, 1, 1, 13, NULL, 0)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [ShopID], [Description], [DeleteFlag]) VALUES (7, N'Sáo đầu trắng', 480.0000, 14, 1, NULL, NULL, NULL, 5, 2, 1, 16, N'Đây là mô tả', 0)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [ShopID], [Description], [DeleteFlag]) VALUES (8, N'Chim cánh cụt', 90.0000, 0, 1, NULL, NULL, NULL, NULL, 1, 1, 16, N'Đây là mô tả', 0)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [ShopID], [Description], [DeleteFlag]) VALUES (9, N'Chim sáo', 90.0000, 34, 1, NULL, NULL, NULL, 8, 2, 1, 13, NULL, 0)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [ShopID], [Description], [DeleteFlag]) VALUES (10, N'Lồng chim vuông', 90.0000, 2, 1, NULL, NULL, NULL, 8, 8, 1, 12, N'', 0)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [ShopID], [Description], [DeleteFlag]) VALUES (11, N'Cám chim', 90.0000, 42, 1, NULL, NULL, NULL, 8, 3, 1, 16, NULL, 0)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [ShopID], [Description], [DeleteFlag]) VALUES (12, N'Lồng tròn xanh', 90.0000, 14, 1, 2, N'20x60cm', NULL, 8, 8, 1, 12, NULL, 0)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [ShopID], [Description], [DeleteFlag]) VALUES (13, N'Khay đựng nước', 750.0000, 10, 0, NULL, NULL, NULL, NULL, 6, 1, 13, N'Đây là mô tả', 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [ShopID], [Description], [DeleteFlag]) VALUES (15, N'Máng thức ăn tròn', 390.0000, 23, 1, NULL, NULL, NULL, NULL, 7, 1, 16, N'Đây là mô tả', 0)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [ShopID], [Description], [DeleteFlag]) VALUES (16, N'Khay nước tự động', 180.0000, 19, 1, NULL, NULL, NULL, NULL, 6, 1, 12, N'Đây là mô tả', 0)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [ShopID], [Description], [DeleteFlag]) VALUES (33, N'Gấu trúc ống', 120.0000, 10, 0, NULL, NULL, CAST(N'2023-07-15' AS Date), NULL, 2, 1, 12, N'', 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [ShopID], [Description], [DeleteFlag]) VALUES (38, N'test', 123.0000, 123, 0, NULL, NULL, CAST(N'2023-07-21' AS Date), NULL, 4, 1, 12, N'', 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [ShopID], [Description], [DeleteFlag]) VALUES (39, N'Hải', 123.0000, 12, 1, NULL, NULL, CAST(N'2023-07-27' AS Date), NULL, 2, 1, 13, N'', 0)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [ShopID], [Description], [DeleteFlag]) VALUES (40, N'Long thành', 12.0000, 12, 0, NULL, NULL, CAST(N'2023-07-27' AS Date), NULL, 4, 1, 13, N'', 0)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [ShopID], [Description], [DeleteFlag]) VALUES (41, N'chim chim', 123.0000, 12, 1, NULL, NULL, CAST(N'2023-08-02' AS Date), NULL, 1, 1, 12, N'check', 0)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName], [DeleteFlag]) VALUES (1, N'Admin', 0)
INSERT [dbo].[Role] ([RoleID], [RoleName], [DeleteFlag]) VALUES (2, N'Staff', 0)
INSERT [dbo].[Role] ([RoleID], [RoleName], [DeleteFlag]) VALUES (3, N'Customer', 0)
INSERT [dbo].[Role] ([RoleID], [RoleName], [DeleteFlag]) VALUES (4, N'Shop', 0)
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
INSERT [dbo].[StatusOrder] ([StatusOrderID], [StatusValue]) VALUES (1, N'Chờ xác nhận')
INSERT [dbo].[StatusOrder] ([StatusOrderID], [StatusValue]) VALUES (2, N'Đang vận chuyển')
INSERT [dbo].[StatusOrder] ([StatusOrderID], [StatusValue]) VALUES (3, N'Hoàn thành')
INSERT [dbo].[StatusOrder] ([StatusOrderID], [StatusValue]) VALUES (4, N'Bị hủy')
INSERT [dbo].[StatusOrder] ([StatusOrderID], [StatusValue]) VALUES (5, N'Bị từ chối')
INSERT [dbo].[StatusOrder] ([StatusOrderID], [StatusValue]) VALUES (6, N'Giao hàng thất bại')
GO
SET IDENTITY_INSERT [dbo].[Tags] ON 

INSERT [dbo].[Tags] ([TagId], [TagName], [Status], [Description]) VALUES (1, N'Chim', 1, NULL)
INSERT [dbo].[Tags] ([TagId], [TagName], [Status], [Description]) VALUES (3, N'Thức ăn', 1, NULL)
INSERT [dbo].[Tags] ([TagId], [TagName], [Status], [Description]) VALUES (5, N'Máng', 1, NULL)
INSERT [dbo].[Tags] ([TagId], [TagName], [Status], [Description]) VALUES (7, N'Lồng chim', 1, NULL)
SET IDENTITY_INSERT [dbo].[Tags] OFF
GO
INSERT [dbo].[Type] ([TypeID], [Name]) VALUES (1, N'Loại')
INSERT [dbo].[Type] ([TypeID], [Name]) VALUES (2, N'Kích thước')
INSERT [dbo].[Type] ([TypeID], [Name]) VALUES (3, N'Màu sắc')
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description], [DeleteFlag]) VALUES (1, N'Nguyễn Ánh Linh', N'admin@gmail.com', NULL, N'53e6086284353cb73d4979f08537d950', N'0987654321', CAST(N'1999-12-02' AS Date), N'Hà Nội', NULL, N'Nữ', 1, NULL, 1, NULL, 0)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description], [DeleteFlag]) VALUES (2, N'Đào Phúc Lộ', N'satff1@gmail.com', NULL, N'53e6086284353cb73d4979f08537d950', N'0987283476', CAST(N'1992-02-15' AS Date), N'Hà nội', NULL, N'Nữ', 2, 1, 1, NULL, 0)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description], [DeleteFlag]) VALUES (3, N'Quyền Hải Long', N'satff2@gmail.com', NULL, N'53e6086284353cb73d4979f08537d950', N'0332837477', CAST(N'2002-06-23' AS Date), N'Lao Cai', NULL, N'Nam', 3, NULL, 1, NULL, 0)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description], [DeleteFlag]) VALUES (4, N'Nguyễn Quang Huy', N'satff3@gmail.com', NULL, N'53e6086284353cb73d4979f08537d950', N'0982678876', CAST(N'2001-05-04' AS Date), N'Hà Nội', NULL, N'Nam', 3, NULL, 1, NULL, 0)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description], [DeleteFlag]) VALUES (6, N'Vũ Duy N am', N'satff5@gmail.co', NULL, N'53e6086284353cb73d4979f08537d950', N'0983123122', CAST(N'2001-10-06' AS Date), N'Hải, Nọi', NULL, N'Nam', 2, 1, 1, NULL, 0)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description], [DeleteFlag]) VALUES (7, N'Nguyen Duc Minh', NULL, NULL, N'53e6086284353cb73d4979f08537d950', NULL, NULL, NULL, NULL, N'Nam', 3, NULL, 1, NULL, 0)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description], [DeleteFlag]) VALUES (8, N'Nguyen Duc Minh', NULL, N'108801319630039114694', N'53e6086284353cb73d4979f08537d950', NULL, NULL, NULL, NULL, NULL, 3, NULL, 1, NULL, 0)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description], [DeleteFlag]) VALUES (10, N'Minh Nguyen', N'minhnd101001@gmail.com', NULL, N'53e6086284353cb73d4979f08537d950', N'0987654321', NULL, N'helooooooooo', NULL, N'Nam', 3, NULL, 0, NULL, 0)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description], [DeleteFlag]) VALUES (11, N'Nguyen Minh', NULL, N'118315661978952123595', NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, 1, NULL, 0)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description], [DeleteFlag]) VALUES (12, N'Tuấn Thành', N'nono@gmail.com', NULL, N'53e6086284353cb73d4979f08537d950', N'1234567890', NULL, N'Hà Nội', NULL, N'Nam', 4, 2, 1, NULL, 0)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description], [DeleteFlag]) VALUES (13, N'Từ Chinh', N'khongco@gmail.com', NULL, N'53e6086284353cb73d4979f08537d950', N'3534543256', NULL, N'Hà Nội', NULL, N'Nam', 4, 6, 1, NULL, 0)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description], [DeleteFlag]) VALUES (14, N'Nguyen Duc Minh', N'ndminh.work@gmail.com', NULL, N'87f05a0cbe61ddf3197b067a01225c9c', N'0987654321', CAST(N'2023-06-06' AS Date), N'Hà Nội', NULL, NULL, 3, NULL, 1, NULL, 0)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description], [DeleteFlag]) VALUES (15, N'helo', N'efgsdgk@gmail.com', NULL, N'53e6086284353cb73d4979f08537d950', N'0987654321', CAST(N'2023-06-15' AS Date), N'Hà Nội', NULL, N'Nam', 3, NULL, 1, NULL, 0)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description], [DeleteFlag]) VALUES (16, N'Hải Anh', N'shop1@gmail.com', NULL, N'202cb962ac59075b964b07152d234b70', N'0987654321', CAST(N'2002-06-13' AS Date), N'', NULL, N'Nữ', 4, 2, 1, NULL, 0)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description], [DeleteFlag]) VALUES (17, N'Minh Nguyễn', NULL, N'106099637354725921371', NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, 1, NULL, 0)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description], [DeleteFlag]) VALUES (18, N'Minh Nguyen', NULL, N'100337919530334669808', NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, 1, NULL, 0)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description], [DeleteFlag]) VALUES (19, N'Đức Hải', N'sdfsad@gmail.com', NULL, N'25d55ad283aa400af464c76d713c07ad', N'1231233333', CAST(N'2023-07-14' AS Date), N'dfgsdfg', NULL, NULL, 3, NULL, 1, NULL, 0)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description], [DeleteFlag]) VALUES (20, N'Hải Anh', N'cus6@gmail.com', NULL, N'a11b66e058a6de4997d6b88b9f3f0bfb', N'1231233444', CAST(N'2023-07-21' AS Date), N'Ha Noi', NULL, NULL, 3, NULL, 1, NULL, 0)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description], [DeleteFlag]) VALUES (22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, 1, NULL, 0)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description], [DeleteFlag]) VALUES (23, N'Trần Trí Dũ', N'sdfsdfsd@gmail.com', NULL, N'c66790e8e7422226de56fe91f08a1534', N'1231233333', CAST(N'2023-06-27' AS Date), N'Ha Noi', NULL, N'2023-06-27', 2, NULL, 1, NULL, 0)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description], [DeleteFlag]) VALUES (25, N'tran tri dung', N'shoptest@gmail.com', NULL, N'53e6086284353cb73d4979f08537d950', N'1231233444', CAST(N'2006-07-06' AS Date), N'Quan Hoa,Hà Nội', NULL, NULL, 3, NULL, 1, NULL, 0)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description], [DeleteFlag]) VALUES (26, N'shop check', N'shoptest2@gmail.com', NULL, N'53e6086284353cb73d4979f08537d950', N'1231231231', CAST(N'2023-07-08' AS Date), N'Hà nội', NULL, NULL, 3, NULL, 1, NULL, 0)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description], [DeleteFlag]) VALUES (27, N'adasdasda', N'shop12@gmailcom', NULL, N'53e6086284353cb73d4979f08537d950', N'3423423412', CAST(N'2023-06-30' AS Date), N'Hà nội', NULL, NULL, 3, NULL, 1, NULL, 0)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description], [DeleteFlag]) VALUES (28, N'final', N'shopfinal@gmail.com', NULL, N'53e6086284353cb73d4979f08537d950', N'3423423423', CAST(N'2023-07-05' AS Date), N'Hà nội', NULL, NULL, 3, NULL, 1, NULL, 0)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description], [DeleteFlag]) VALUES (29, N'cuoi', N'shopcuoi@gmail.com', NULL, N'53e6086284353cb73d4979f08537d950', N'1234234234', CAST(N'2023-07-07' AS Date), N'1231231231', NULL, NULL, 3, NULL, 1, NULL, 0)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description], [DeleteFlag]) VALUES (30, N'checkcheck', N'shopcheck@gmail.com', NULL, N'53e6086284353cb73d4979f08537d950', N'1231232312', CAST(N'2023-07-01' AS Date), N'sdfasdfasd', NULL, NULL, 4, 2, 0, NULL, 0)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description], [DeleteFlag]) VALUES (31, N'Hai Anh', N'shopdemo@gmail.com', NULL, N'53e6086284353cb73d4979f08537d950', N'1012312312', CAST(N'2020-02-05' AS Date), N'Hà nội', NULL, NULL, 4, 6, 1, NULL, 0)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description], [DeleteFlag]) VALUES (32, N'Vũ Trịnh Nhật', N'nhatvt@gmail.com', NULL, N'53e6086284353cb73d4979f08537d950', N'0987654567', CAST(N'1999-07-10' AS Date), N'Hà nội', NULL, N'1999-07-10', 2, 1, 1, NULL, 0)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description], [DeleteFlag]) VALUES (33, N'Hải Nam Anh', N'anhhn@gmail.com', NULL, N'53e6086284353cb73d4979f08537d950', N'0987654865', CAST(N'1999-07-05' AS Date), N'Hà nội', NULL, N'1999-07-05', 2, 1, 1, NULL, 0)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description], [DeleteFlag]) VALUES (34, N'Trần Anh Khải', N'khaita@gmail.com', NULL, N'53e6086284353cb73d4979f08537d950', N'0956452653', CAST(N'1999-03-04' AS Date), N'Hải Phòng', NULL, N'1999-03-04', 2, 1, 1, NULL, 0)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description], [DeleteFlag]) VALUES (35, N'Nhân', N'nhan@gmail.com', NULL, N'53e6086284353cb73d4979f08537d950', N'0975632834', CAST(N'1998-07-24' AS Date), N'Hà nội', NULL, NULL, 2, 1, 1, NULL, 0)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description], [DeleteFlag]) VALUES (36, N'Nguyễn Duy Nhất', N'nhatnd@gmail.com', NULL, N'53e6086284353cb73d4979f08537d950', N'0987637264', CAST(N'2000-08-04' AS Date), N'Quan Hoa,Hà Nội', NULL, NULL, 2, 1, 1, NULL, 0)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description], [DeleteFlag]) VALUES (37, N'Test', N'safs@gmail.com', NULL, N'53e6086284353cb73d4979f08537d950', N'0987654321', CAST(N'2023-07-12' AS Date), N'Hà nội', NULL, N'2023-07-12', 2, 1, 0, NULL, 1)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description], [DeleteFlag]) VALUES (38, N'Test', N'abcdxyz@gmail.com', NULL, N'a11b66e058a6de4997d6b88b9f3f0bfb', N'0987654321', CAST(N'2023-07-08' AS Date), N'Hà Nội', NULL, NULL, 4, 2, 1, NULL, 0)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [gender], [RoleID], [ManagerID], [Status], [Description], [DeleteFlag]) VALUES (39, N'Test', N'asdf@gmial.com', NULL, N'a11b66e058a6de4997d6b88b9f3f0bfb', N'0968678768', CAST(N'2023-06-29' AS Date), N'Hà nội', NULL, NULL, 4, 35, 1, NULL, 0)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Best_Seller]  WITH CHECK ADD  CONSTRAINT [FK_Best_Seller_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Best_Seller] CHECK CONSTRAINT [FK_Best_Seller_Products]
GO
ALTER TABLE [dbo].[Bird_Details]  WITH CHECK ADD  CONSTRAINT [FK_Bird_Details_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Bird_Details] CHECK CONSTRAINT [FK_Bird_Details_Products]
GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Tags] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tags] ([TagId])
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_Categories_Tags]
GO
ALTER TABLE [dbo].[Image_Product]  WITH CHECK ADD  CONSTRAINT [FK_Image_Product_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Image_Product] CHECK CONSTRAINT [FK_Image_Product_Products]
GO
ALTER TABLE [dbo].[New_Arrival]  WITH CHECK ADD  CONSTRAINT [FK_New_Arrival_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[New_Arrival] CHECK CONSTRAINT [FK_New_Arrival_Products]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Orders]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Payments] FOREIGN KEY([PaymentMethod])
REFERENCES [dbo].[Payments] ([PaymentId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Payments]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_StatusOrder] FOREIGN KEY([DeliverStatus])
REFERENCES [dbo].[StatusOrder] ([StatusOrderID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_StatusOrder]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_User1] FOREIGN KEY([OrderFromUser])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_User1]
GO
ALTER TABLE [dbo].[Product_Collection]  WITH CHECK ADD  CONSTRAINT [FK_Product_Collection_Collections] FOREIGN KEY([CollectionId])
REFERENCES [dbo].[Collections] ([CollectionID])
GO
ALTER TABLE [dbo].[Product_Collection] CHECK CONSTRAINT [FK_Product_Collection_Collections]
GO
ALTER TABLE [dbo].[Product_Collection]  WITH CHECK ADD  CONSTRAINT [FK_Product_Collection_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Product_Collection] CHECK CONSTRAINT [FK_Product_Collection_Products]
GO
ALTER TABLE [dbo].[Product_Tag]  WITH CHECK ADD  CONSTRAINT [FK_Product_Tag_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Product_Tag] CHECK CONSTRAINT [FK_Product_Tag_Products]
GO
ALTER TABLE [dbo].[Product_Tag]  WITH CHECK ADD  CONSTRAINT [FK_Product_Tag_Tags1] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tags] ([TagId])
GO
ALTER TABLE [dbo].[Product_Tag] CHECK CONSTRAINT [FK_Product_Tag_Tags1]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Products] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Products]
GO
ALTER TABLE [dbo].[Rate_Product]  WITH CHECK ADD  CONSTRAINT [FK_Rate_Product_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Rate_Product] CHECK CONSTRAINT [FK_Rate_Product_Products]
GO
ALTER TABLE [dbo].[Rate_Product]  WITH CHECK ADD  CONSTRAINT [FK_Rate_Product_User] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Rate_Product] CHECK CONSTRAINT [FK_Rate_Product_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_User] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_User]
GO
USE [master]
GO
ALTER DATABASE [BirdeePlatform] SET  READ_WRITE 
GO
