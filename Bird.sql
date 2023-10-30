USE [master]
GO

-- Check if the database exists
IF DB_ID('BirdStore') IS NOT NULL
BEGIN
    -- Close all existing connections to the database
    ALTER DATABASE BirdStore SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    
    -- Drop the database
    DROP DATABASE BirdStore;
END
GO
/****** Object:  Database [BirdStore]    Script Date: 7/29/2023 3:32:53 PM ******/
CREATE DATABASE [BirdStore]
GO

ALTER DATABASE [BirdStore] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BirdStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BirdStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BirdStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BirdStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BirdStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BirdStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [BirdStore] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BirdStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BirdStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BirdStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BirdStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BirdStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BirdStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BirdStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BirdStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BirdStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BirdStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BirdStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BirdStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BirdStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BirdStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BirdStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BirdStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BirdStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BirdStore] SET  MULTI_USER 
GO
ALTER DATABASE [BirdStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BirdStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BirdStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BirdStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BirdStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BirdStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BirdStore] SET QUERY_STORE = OFF
GO
USE [BirdStore]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 7/29/2023 3:32:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](45) NOT NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NULL,
	[LastUpdatedTime] [datetime] NULL,
 CONSTRAINT [PK_tblcart] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/29/2023 3:32:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblcategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 7/29/2023 3:32:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](45) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Phone] [varchar](20) NOT NULL,
	[Address] [nvarchar](400) NOT NULL,
	[OrderTime] [datetime] NULL,
	[Message] [nvarchar](400) NULL,
	[Status] [varchar](20) NULL,
	[Comment] [nvarchar](200) NULL,
	[LastUpdatedTime] [datetime] NULL,
	[ShippingMode] [bit] NULL,
	[ShippingFee] [float] NULL,
	[Shipper] [varchar](45) NULL,
	[ShippingStatus] [varchar](20) NULL,
	[ShippedTime] [datetime] NULL,
 CONSTRAINT [PK_tblorder] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 7/29/2023 3:32:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
	[Price] [float] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_tblorder_detail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/29/2023 3:32:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](400) NULL,
	[Quantity] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[CategoryID] [int] NULL,
	[Avatar] [varchar](5000) NULL,
	[Status] [bit] NOT NULL,
	[isDelete] [bit] NULL,
 CONSTRAINT [PK_tblproduct] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/29/2023 3:32:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Username] [varchar](45) NOT NULL,
	[Email] [varchar](320) NOT NULL,
	[Role] [varchar](50) NOT NULL,
	[Password] [varchar](59) NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Gender] [tinyint] NULL,
	[Phone] [varchar](20) NOT NULL,
	[Yob] [int] NULL,
	[Address] [nvarchar](400) NULL,
	[Avatar] [varchar](1000) NULL,
	[Enabled] [bit] NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 
GO
INSERT [dbo].[Category] ([ID], [Name]) VALUES (1, N'Chim Cảnh')
GO
INSERT [dbo].[Category] ([ID], [Name]) VALUES (2,N'Chim giống')
GO
INSERT [dbo].[Category] ([ID], [Name]) VALUES (3, N'Cám chim')
GO
INSERT [dbo].[Category] ([ID], [Name]) VALUES (4, N'Hạt')
GO
INSERT [dbo].[Category] ([ID], [Name]) VALUES (5,N'Cám tăng trưởng')
GO
INSERT [dbo].[Category] ([ID], [Name]) VALUES (6,N'Máng nước')  
GO
INSERT [dbo].[Category] ([ID], [Name]) VALUES (6,N'Máng thức ăn')  
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 
GO
INSERT [dbo].[Order] ([ID], [Username], [Name], [Phone], [Address], [OrderTime], [Message], [Status], [Comment], [LastUpdatedTime], [ShippingMode], [ShippingFee], [Shipper], [ShippingStatus], [ShippedTime]) VALUES (1, N'duyduc', N'Hoàng Thiện', N'09348984112', N'Thu Duc City', CAST(N'2023-06-15T16:01:40.000' AS DateTime), NULL, N'SUCCESSFUL', N'', CAST(N'2023-06-15T16:01:40.000' AS DateTime), 1, 10000, N'hoangthiennn', NULL, CAST(N'2023-07-19T15:15:12.890' AS DateTime))
GO
INSERT [dbo].[Order] ([ID], [Username], [Name], [Phone], [Address], [OrderTime], [Message], [Status], [Comment], [LastUpdatedTime], [ShippingMode], [ShippingFee], [Shipper], [ShippingStatus], [ShippedTime]) VALUES (2, N'duyduc', N'Messi', N'09765464645', N'Thu Duc City', CAST(N'2023-05-14T16:01:40.000' AS DateTime), NULL, N'SUCCESSFUL', NULL, CAST(N'2023-05-14T16:01:40.000' AS DateTime), 1, 20000, N'hoangthienn', NULL, CAST(N'2023-07-22T15:45:46.740' AS DateTime))
GO
INSERT [dbo].[Order] ([ID], [Username], [Name], [Phone], [Address], [OrderTime], [Message], [Status], [Comment], [LastUpdatedTime], [ShippingMode], [ShippingFee], [Shipper], [ShippingStatus], [ShippedTime]) VALUES (9, N'duyduc', N'Nguyễn Tấn', N'0934968395', N'Thu Duc City', CAST(N'2023-07-17T16:28:04.660' AS DateTime), NULL, N'ORDERED', N'', CAST(N'2023-07-17T16:28:04.660' AS DateTime), 1, 20000, NULL, NULL, NULL)
GO
INSERT [dbo].[Order] ([ID], [Username], [Name], [Phone], [Address], [OrderTime], [Message], [Status], [Comment], [LastUpdatedTime], [ShippingMode], [ShippingFee], [Shipper], [ShippingStatus], [ShippedTime]) VALUES (10, N'passersby', N'Guest', N'', N'', CAST(N'2023-07-22T16:17:35.947' AS DateTime), NULL, N'SUCCESSFUL', N'Buy at showroom.', CAST(N'2023-07-22T16:17:35.947' AS DateTime), 0, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[Order] ([ID], [Username], [Name], [Phone], [Address], [OrderTime], [Message], [Status], [Comment], [LastUpdatedTime], [ShippingMode], [ShippingFee], [Shipper], [ShippingStatus], [ShippedTime]) VALUES (11, N'user0934914124', N'user', N'0934914124', N'', CAST(N'2023-06-22T16:19:44.063' AS DateTime), NULL, N'SUCCESSFUL', N'Buy at showroom.', CAST(N'2023-07-22T16:19:44.063' AS DateTime), 0, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[Order] ([ID], [Username], [Name], [Phone], [Address], [OrderTime], [Message], [Status], [Comment], [LastUpdatedTime], [ShippingMode], [ShippingFee], [Shipper], [ShippingStatus], [ShippedTime]) VALUES (12, N'duyduc', N'Ronaldo', N'0934968395', N'Thu Duc City', CAST(N'2023-08-22T16:23:21.603' AS DateTime), N'h', N'CANCELLED', NULL, CAST(N'2023-07-22T16:23:21.603' AS DateTime), 1, 20000, NULL, NULL, NULL)
GO
INSERT [dbo].[Order] ([ID], [Username], [Name], [Phone], [Address], [OrderTime], [Message], [Status], [Comment], [LastUpdatedTime], [ShippingMode], [ShippingFee], [Shipper], [ShippingStatus], [ShippedTime]) VALUES (13, N'duyduc', N'Quang Hải', N'0934968395', N'Thu Duc City', CAST(N'2023-07-26T14:12:53.060' AS DateTime), N'', N'ORDERED', NULL, CAST(N'2023-07-26T14:12:53.060' AS DateTime), 1, 20000, NULL, NULL, NULL)
GO
INSERT [dbo].[Order] ([ID], [Username], [Name], [Phone], [Address], [OrderTime], [Message], [Status], [Comment], [LastUpdatedTime], [ShippingMode], [ShippingFee], [Shipper], [ShippingStatus], [ShippedTime]) VALUES (14, N'duyduc', N'Tan Nguyễn', N'0356970686', N'Thanh Xuan  25 Q12', CAST(N'2023-01-26T14:15:24.610' AS DateTime), N'', N'SUCCESSFUL', N'', CAST(N'2023-07-26T14:15:24.610' AS DateTime), 1, 20000, NULL, NULL, NULL)
GO
INSERT [dbo].[Order] ([ID], [Username], [Name], [Phone], [Address], [OrderTime], [Message], [Status], [Comment], [LastUpdatedTime], [ShippingMode], [ShippingFee], [Shipper], [ShippingStatus], [ShippedTime]) VALUES (15, N'duyduc', N'Duy Đức', N'0934968395', N'Thu Duc City', CAST(N'2023-01-26T14:20:34.053' AS DateTime), NULL, N'SUCCESSFUL', NULL, CAST(N'2023-07-26T14:20:34.053' AS DateTime), 1, 20000, N'hoangthien', NULL, CAST(N'2023-07-26T14:26:27.053' AS DateTime))
GO
INSERT [dbo].[Order] ([ID], [Username], [Name], [Phone], [Address], [OrderTime], [Message], [Status], [Comment], [LastUpdatedTime], [ShippingMode], [ShippingFee], [Shipper], [ShippingStatus], [ShippedTime]) VALUES (16, N'user0356970696', N'Tấn', N'0356970696', N'', CAST(N'2023-08-26T14:21:31.487' AS DateTime), NULL, N'SUCCESSFUL', N'Buy at showroom.', CAST(N'2023-07-26T14:21:31.487' AS DateTime), 0, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[Order] ([ID], [Username], [Name], [Phone], [Address], [OrderTime], [Message], [Status], [Comment], [LastUpdatedTime], [ShippingMode], [ShippingFee], [Shipper], [ShippingStatus], [ShippedTime]) VALUES (17, N'user0356970686', N'Quyet Tran', N'0356970686', N'', CAST(N'2023-09-26T14:33:15.947' AS DateTime), NULL, N'SUCCESSFUL', N'Buy at showroom.', CAST(N'2023-07-26T14:33:15.947' AS DateTime), 0, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[Order] ([ID], [Username], [Name], [Phone], [Address], [OrderTime], [Message], [Status], [Comment], [LastUpdatedTime], [ShippingMode], [ShippingFee], [Shipper], [ShippingStatus], [ShippedTime]) VALUES (18, N'passersby', N'Thien Hoang', N'0356970693', N'Thanh Xuan 12', CAST(N'2023-10-26T14:34:39.900' AS DateTime), NULL, N'SUCCESSFUL', N'', CAST(N'2023-07-26T14:34:39.900' AS DateTime), 1, 20000, NULL, NULL, NULL)
GO
INSERT [dbo].[Order] ([ID], [Username], [Name], [Phone], [Address], [OrderTime], [Message], [Status], [Comment], [LastUpdatedTime], [ShippingMode], [ShippingFee], [Shipper], [ShippingStatus], [ShippedTime]) VALUES (19, N'user0356970686', N'Quyet Tran', N'0356970686', N'', CAST(N'2023-07-26T14:40:28.730' AS DateTime), NULL, N'SUCCESSFUL', N'Buy at showroom.', CAST(N'2023-07-26T14:40:28.730' AS DateTime), 0, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[Order] ([ID], [Username], [Name], [Phone], [Address], [OrderTime], [Message], [Status], [Comment], [LastUpdatedTime], [ShippingMode], [ShippingFee], [Shipper], [ShippingStatus], [ShippedTime]) VALUES (20, N'user0356976999', N'Transforme', N'0356976999', N'25 TX ', CAST(N'2023-07-26T14:41:56.420' AS DateTime), NULL, N'SUCCESSFUL', N'Buy at showroom.', CAST(N'2023-07-26T14:41:56.420' AS DateTime), 0, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[Order] ([ID], [Username], [Name], [Phone], [Address], [OrderTime], [Message], [Status], [Comment], [LastUpdatedTime], [ShippingMode], [ShippingFee], [Shipper], [ShippingStatus], [ShippedTime]) VALUES (21, N'user0356970689', N'Minh Tuán', N'0356970689', N'23 Thạnh Xuân', CAST(N'2023-07-26T14:43:56.373' AS DateTime), NULL, N'SUCCESSFUL', N'', CAST(N'2023-07-26T14:43:56.373' AS DateTime), 1, 20000, NULL, NULL, NULL)
GO
INSERT [dbo].[Order] ([ID], [Username], [Name], [Phone], [Address], [OrderTime], [Message], [Status], [Comment], [LastUpdatedTime], [ShippingMode], [ShippingFee], [Shipper], [ShippingStatus], [ShippedTime]) VALUES (22, N'duyduc', N'Anh Đức', N'0934968395', N'Thu Duc City', CAST(N'2023-07-26T14:44:43.850' AS DateTime), N'', N'ORDERED', NULL, CAST(N'2023-07-26T14:44:43.850' AS DateTime), 1, 20000, NULL, NULL, NULL)
GO
INSERT [dbo].[Order] ([ID], [Username], [Name], [Phone], [Address], [OrderTime], [Message], [Status], [Comment], [LastUpdatedTime], [ShippingMode], [ShippingFee], [Shipper], [ShippingStatus], [ShippedTime]) VALUES (23, N'duyduc', N'Anh Đức', N'0934968395', N'Thu Duc City', CAST(N'2023-07-26T14:44:49.257' AS DateTime), N'', N'ORDERED', NULL, CAST(N'2023-07-26T14:44:49.257' AS DateTime), 1, 20000, NULL, NULL, NULL)
GO
INSERT [dbo].[Order] ([ID], [Username], [Name], [Phone], [Address], [OrderTime], [Message], [Status], [Comment], [LastUpdatedTime], [ShippingMode], [ShippingFee], [Shipper], [ShippingStatus], [ShippedTime]) VALUES (24, N'duyduc', N'Anh Đức', N'0934968395', N'Thu Duc City', CAST(N'2023-07-26T14:44:53.457' AS DateTime), N'', N'ORDERED', NULL, CAST(N'2023-07-26T14:44:53.457' AS DateTime), 1, 20000, NULL, NULL, NULL)
GO
INSERT [dbo].[Order] ([ID], [Username], [Name], [Phone], [Address], [OrderTime], [Message], [Status], [Comment], [LastUpdatedTime], [ShippingMode], [ShippingFee], [Shipper], [ShippingStatus], [ShippedTime]) VALUES (25, N'duyduc', N'Anh Đức', N'0934968395', N'Thu Duc City', CAST(N'2023-07-26T16:28:14.740' AS DateTime), N'           ', N'CANCELLED', NULL, CAST(N'2023-07-26T16:28:14.740' AS DateTime), 1, 20000, NULL, NULL, NULL)
GO
INSERT [dbo].[Order] ([ID], [Username], [Name], [Phone], [Address], [OrderTime], [Message], [Status], [Comment], [LastUpdatedTime], [ShippingMode], [ShippingFee], [Shipper], [ShippingStatus], [ShippedTime]) VALUES (26, N'passersby', N'Khách vãng lai', N'', N'', CAST(N'2023-07-26T16:35:38.497' AS DateTime), NULL, N'SUCCESSFUL', N'Buy at showroom.', CAST(N'2023-07-26T16:35:38.497' AS DateTime), 0, 1000000001, NULL, NULL, NULL)
GO
INSERT [dbo].[Order] ([ID], [Username], [Name], [Phone], [Address], [OrderTime], [Message], [Status], [Comment], [LastUpdatedTime], [ShippingMode], [ShippingFee], [Shipper], [ShippingStatus], [ShippedTime]) VALUES (27, N'passersby', N'Quyet', N'0356976960', N'tx 25', CAST(N'2023-07-26T16:40:28.463' AS DateTime), NULL, N'ORDERED', NULL, CAST(N'2023-07-26T16:40:28.463' AS DateTime), 1, 20000, NULL, NULL, NULL)
GO
INSERT [dbo].[Order] ([ID], [Username], [Name], [Phone], [Address], [OrderTime], [Message], [Status], [Comment], [LastUpdatedTime], [ShippingMode], [ShippingFee], [Shipper], [ShippingStatus], [ShippedTime]) VALUES (28, N'passersby', N'Khách vãng lai', N'', N'', CAST(N'2023-07-26T16:40:55.413' AS DateTime), NULL, N'ORDERED', N'message 1', CAST(N'2023-07-26T16:40:55.413' AS DateTime), 0, 0, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Price], [Quantity]) VALUES (7, 1, 4, 129000, 4)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Price], [Quantity]) VALUES (8, 2, 3, 120000, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Price], [Quantity]) VALUES (9, 9, 3, 149000, 4)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Price], [Quantity]) VALUES (10, 10, 4, 59000, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Price], [Quantity]) VALUES (11, 10, 7, 139000, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Price], [Quantity]) VALUES (12, 11, 10, 299000, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Price], [Quantity]) VALUES (13, 11, 9, 499000, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Price], [Quantity]) VALUES (14, 12, 7, 139000, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Price], [Quantity]) VALUES (15, 12, 8, 89000, 16)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Price], [Quantity]) VALUES (16, 13, 4, 59000, 2)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Price], [Quantity]) VALUES (17, 13, 7, 139000, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Price], [Quantity]) VALUES (18, 14, 9, 499000, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Price], [Quantity]) VALUES (19, 14, 10, 299000, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Price], [Quantity]) VALUES (20, 15, 4, 59000, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Price], [Quantity]) VALUES (21, 15, 7, 139000, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Price], [Quantity]) VALUES (22, 15, 8, 89000, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Price], [Quantity]) VALUES (23, 16, 4, 59000, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Price], [Quantity]) VALUES (24, 16, 7, 139000, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Price], [Quantity]) VALUES (25, 16, 8, 89000, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Price], [Quantity]) VALUES (26, 16, 10, 299000, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Price], [Quantity]) VALUES (27, 17, 4, 59000, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Price], [Quantity]) VALUES (28, 17, 7, 139000, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Price], [Quantity]) VALUES (29, 17, 8, 89000, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Price], [Quantity]) VALUES (30, 18, 8, 89000, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Price], [Quantity]) VALUES (31, 18, 9, 499000, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Price], [Quantity]) VALUES (32, 18, 10, 299000, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Price], [Quantity]) VALUES (33, 19, 7, 139000, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Price], [Quantity]) VALUES (34, 19, 21, 150000, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Price], [Quantity]) VALUES (35, 19, 23, 1212, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Price], [Quantity]) VALUES (36, 20, 4, 59000, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Price], [Quantity]) VALUES (37, 20, 7, 139000, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Price], [Quantity]) VALUES (38, 21, 7, 139000, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Price], [Quantity]) VALUES (39, 21, 4, 59000, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Price], [Quantity]) VALUES (40, 22, 4, 59000, 3)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Price], [Quantity]) VALUES (41, 23, 9, 499000, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Price], [Quantity]) VALUES (42, 24, 8, 89000, 2)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Price], [Quantity]) VALUES (43, 25, 10, 299000, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Price], [Quantity]) VALUES (44, 25, 11, 69000, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Price], [Quantity]) VALUES (45, 25, 7, 139000, 2)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Price], [Quantity]) VALUES (46, 25, 9, 499000, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Price], [Quantity]) VALUES (47, 25, 4, 59000, 2)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Price], [Quantity]) VALUES (48, 25, 8, 89000, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Price], [Quantity]) VALUES (49, 26, 4, 59000, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Price], [Quantity]) VALUES (50, 26, 7, 139000, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Price], [Quantity]) VALUES (51, 27, 4, 59000, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Price], [Quantity]) VALUES (52, 27, 10, 299000, 1)
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Price], [Quantity]) VALUES (53, 28, 10, 299000, 1)
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 
GO
INSERT [dbo].[Product] ([ID], [Name], [Description], [Quantity], [Price], [CategoryID], [Avatar], [Status], [isDelete]) VALUES (3, N'Chim trưởng thành', N'Bộ cốc được làm từ chất liệu sứ cao cấp với lớp men phủ bóng màu trắng sứ siêu nhẵn mịn.Dễ dàng chùi rửa sau mỗi lần sử dụng.Trên thân cốc được in họa tiết tháp Eiffel màu nâu mang phong cách cổ điển.Kích thước bộ cốc cao 21 cm. Đường kính miệng cốc là 7 cm', 999, 149000, 2, N'https://shopquatructuyen.com/wp-content/uploads/2018/07/bo-coc-su-thap-eiffel-2.jpg', 1, 0)
GO
INSERT [dbo].[Product] ([ID], [Name], [Description], [Quantity], [Price], [CategoryID], [Avatar], [Status], [isDelete]) VALUES (4, N'Vẹt xanh', N'Hộp Đựng Bút Totoro Siêu Dễ Thương - Hộp Đựng Đồ Dùng Học Tập. Hộp bút in hình dễ thương. Chất liệu da PU, lót vải bố bên trong. Khóa may chắc chắn.', 999, 59000, 1, N'https://salt.tikicdn.com/cache/750x750/ts/product/a4/d3/bc/accd80f0b82a0a1a38bd3b667ff11114.jpg', 1, 0)
GO
INSERT [dbo].[Product] ([ID], [Name], [Description], [Quantity], [Price], [CategoryID], [Avatar], [Status], [isDelete]) VALUES (7, N'Chim Cu Gáy', N'Cốc sứ nốt nhạc được làm từ chất liệu sứ cao cấp với men trắng bóng.Trên thân cốc được in họa tiết đàn piano, nốt nhạc với màu đen tương phản rất đẹp mắt.Cốc sứ nốt nhạc đi kèm với nắp gỗ và thìa inox. Thể tích khoảng 400 ml.', 999, 139000, 2, N'https://shopquatructuyen.com/wp-content/uploads/2018/09/coc-tu-khuay-1.jpg', 1, 0)
GO
INSERT [dbo].[Product] ([ID], [Name], [Description], [Quantity], [Price], [CategoryID], [Avatar], [Status], [isDelete]) VALUES (8, N'Chích chòe than', N'Cốc phát sáng làm từ chất liệu nhựa cứng. Sản phẩm dùng pin. Có chức năng tự động sáng khi rót nước. Khi hết nước cốc sẽ tự tắt. Đèn Led phát sáng đổi màu liên tục', 999, 89000, 2, N'https://shopquatructuyen.com/wp-content/uploads/2020/10/con-quay-mezmotop-4.jpg', 1, 0)
GO
INSERT [dbo].[Product] ([ID], [Name], [Description], [Quantity], [Price], [CategoryID], [Avatar], [Status], [isDelete]) VALUES (9, N'Sáo đầu trắng', N'Đồng hồ cổ để bàn được là theo phong cách cổ điển với chất liệu kim loại được sơn màu vàng đồng nhuốm màu thời gian. Trông chiếc đồng hồ tưởng chừng rất cũ kỹ nhưng thực ra lại không phải như vậy. Thiết kế cổ điển cùng với màu sắc giả cổ đã tôn lên vẻ cổ kính cho chiếc đồng hồ này.', 999, 499000, 2, N'https://shopquatructuyen.com/wp-content/uploads/2018/08/dong-ho-dan-tuong-diy-clocl-1.jpg', 1, 0)
GO
INSERT [dbo].[Product] ([ID], [Name], [Description], [Quantity], [Price], [CategoryID], [Avatar], [Status], [isDelete]) VALUES (10, N'Chim họa mi bổi', N'Trò chơi Sudoku được làm từ gỗ tự nhiên. Trong một bộ trò chơi có rất nhiều bài khác nhau để bạn giải mã.  Khi không dùng tới bạn có thể gấp hộp gỗ lại rất gọn gàng.', 999, 299000, 1, N'https://shopquatructuyen.com/wp-content/uploads/2019/05/tuong-nguoi-nhen-spiderman-1.jpg', 1, 0)
GO
INSERT [dbo].[Product] ([ID], [Name], [Description], [Quantity], [Price], [CategoryID], [Avatar], [Status], [isDelete]) VALUES (11, N'Sáo đầu trắng', N'Trò chơi xếp gỗ được làm từ chất liệu gỗ tự nhiên, rất an toàn với trẻ em. Đây là một trò chơi trí tuệ, thúc đẩy phát triển khả năng tư duy của trẻ.', 999, 69000, 2, N'https://shopquatructuyen.com/wp-content/uploads/2018/11/con-lac-dao-dong-vinh-cuu-1.jpg', 1, 0)
GO
INSERT [dbo].[Product] ([ID], [Name], [Description], [Quantity], [Price], [CategoryID], [Avatar], [Status], [isDelete]) VALUES (12, N'Đồng hồ báo thức cổ điển', N'Đồng hồ báo thức được làm theo phong cách cổ điển, được làm bằng chất liệu kim loại sơn màu đen mờ. Khi nhìn vào bạn tưởng như chúng vô cùng cũ kỹ nhưng không phải như bạn đang suy nghĩ. Thiết kế mang đậm phong cách cổ điển từ màu sắc cho tới các họa tiết trang trí bên trong với phong cách Vintage.', 999, 250000, 3, N'https://shopquatructuyen.com/wp-content/uploads/2019/05/dong-ho-bao-thuc-den-led-2.jpg', 1, 0)
GO
INSERT [dbo].[Product] ([ID], [Name], [Description], [Quantity], [Price], [CategoryID], [Avatar], [Status], [isDelete]) VALUES (13, N'Đồng hồ xe đạp 2 mặt', N'Đồng hồ cổ để bàn được là theo phong cách cổ điển với chất liệu kim loại được sơn màu vàng đồng nhuốm màu thời gian. Trông chiếc đồng hồ tưởng chừng rất cũ kỹ nhưng thực ra lại không phải như vậy. Thiết kế cổ điển cùng với màu sắc giả cổ đã tôn lên vẻ cổ kính cho chiếc đồng hồ này.', 999, 250000, 3, N'https://shopquatructuyen.com/wp-content/uploads/2019/04/mo-hinh-dong-ho-thap-big-ben-1.jpg', 1, 0)
GO
INSERT [dbo].[Product] ([ID], [Name], [Description], [Quantity], [Price], [CategoryID], [Avatar], [Status], [isDelete]) VALUES (14, N'Đèn ngủ gà con', N'Đèn ngủ gà con', 999, 250000, 4, N'https://shopquatructuyen.com/wp-content/uploads/2019/04/den-ngu-led-long-kinh-2.jpg', 1, 0)
GO
INSERT [dbo].[Product] ([ID], [Name], [Description], [Quantity], [Price], [CategoryID], [Avatar], [Status], [isDelete]) VALUES (16, N'Đèn ngủ heo con', N'Đèn ngủ heo con được làm từ chất liệu nhựa ABS rất bền và an toàn. Có 2 mẫu để bạn lựa chọn: hình heo và hình gấu trúc', 999, 249000, 4, N'https://shopquatructuyen.com/wp-content/uploads/2019/05/den-chieu-sao-2.jpg', 1, 0)
GO
INSERT [dbo].[Product] ([ID], [Name], [Description], [Quantity], [Price], [CategoryID], [Avatar], [Status], [isDelete]) VALUES (17, N'Đèn chiếu sao', N'Đèn chiếu sao là một loại đèn ngủ đặc biệt. Nó có thể chiếu lên trần, tường phòng của bạn hình trăng sao, hình đôi tình nhân, …Với cấu tạo cũng tương đối đơn giản. Vỏ ngoài được làm từ chất liệu nhựa. Bên trong là những chiếc đèn Led có nhiều màu, một cơ cấu bánh răng có thể quay xung quanh trục. Nhờ bộ phận này mà thân đèn bên trên có thể quay 360 độ.', 999, 239000, 4, N'https://shopquatructuyen.com/wp-content/uploads/2019/07/khung-anh-go-xe-dap-3.jpg', 1, 0)
GO
INSERT [dbo].[Product] ([ID], [Name], [Description], [Quantity], [Price], [CategoryID], [Avatar], [Status], [isDelete]) VALUES (18, N'Khung ảnh để bàn xoay ngang', N'- Khung ảnh dùng để trang trí, để các bức ảnh Kỷ niệm trong các phòng ngủ, phòng khách, trang trí góc làm việc, học tập', 999, 111000, 5, N'https://salt.tikicdn.com/cache/750x750/ts/product/82/b5/fe/332f9481c036b59bb79dad27142c6781.png.webp', 1, 0)
GO
INSERT [dbo].[Product] ([ID], [Name], [Description], [Quantity], [Price], [CategoryID], [Avatar], [Status], [isDelete]) VALUES (19, N'Khung ảnh bằng khen', N'Viền khung nhựa Hàn Quốc cao cấp giả gỗ Composite siêu bền, siêu nhẹ, -Tấm lót bằng gỗ MDF chống ẩm mốc, đảm bảo cho khung và ảnh được an toàn và bền đẹp trong khoảng thời gian lâu nhất. - có gắn móc treo ngang dọc tùy chỉnh', 999, 32000, 5, N'https://salt.tikicdn.com/cache/750x750/ts/product/97/b0/1e/b6f9a7650d6748d0edf592b72459b60d.PNG.webp', 1, 0)
GO
INSERT [dbo].[Product] ([ID], [Name], [Description], [Quantity], [Price], [CategoryID], [Avatar], [Status], [isDelete]) VALUES (20, N'Khung ảnh xoay 360 độ', N'Khung ảnh dùng để trang trí, để các bức ảnh Kỷ niệm trong các phòng ngủ, phòng khách, trang trí góc làm việc, học tập', 999, 140000, 5, N'https://shopquatructuyen.com/wp-content/uploads/2019/04/chien-binh-giu-but-1.jpg', 1, 0)
GO
INSERT [dbo].[Product] ([ID], [Name], [Description], [Quantity], [Price], [CategoryID], [Avatar], [Status], [isDelete]) VALUES (21, N'Hộp bút gỗ ngăn kéo', N'Hộp bút gỗ ngăn kéo được làm từ chất liệu gỗ thông siêu nhẹ với những đường vân gỗ đẹp mắt. Màu gỗ đặc trưng là màu vàng nhạt nguyên bản, không sơn màu. Chiếc hộp bút này được chia làm 2 khoang chính. Khoang để bút và khoang ngăn kéo. Khoang để bút được thiết kế rất thông minh. Bạn hoàn toàn có thể thay đổi kích thước các ô để bút tùy theo nhu cầu thực tế của mình. Chỉ bằng thao tác đơn giản là rú', 999, 150000, 6, N'https://shopquatructuyen.com/wp-content/uploads/2018/08/hop-but-dong-ho-cat-1.jpg', 1, 0)
GO
INSERT [dbo].[Product] ([ID], [Name], [Description], [Quantity], [Price], [CategoryID], [Avatar], [Status], [isDelete]) VALUES (22, N'Hộp bút đồng hồ cát', N'Hộp bút đồng hồ cát được làm từ chất liệu gỗ thông, có trọng lượng rất nhẹ. Hai chiếc đồng hồ cát được làm từ thủy tinh. Bên trong là những hạt cát màu sắc bắt mắt. Kích thước của sản phẩm có chiều dài 16,5 cm, chiều cao 10,5 cm. Thiết kế chắc chắn và không tốn nhiều diện tích. Rất thích hợp với những chiếc bàn học, bàn làm việc có kích thước nhỏ gọn, không quá rộng.', 999, 95000, 6, N'https://salt.tikicdn.com/cache/750x750/ts/product/6f/1a/50/393ce427cd6c290d7ce0e255bce63059.jpg.webp', 0, 1)
GO
INSERT [dbo].[Product] ([ID], [Name], [Description], [Quantity], [Price], [CategoryID], [Avatar], [Status], [isDelete]) VALUES (23, N'Cốc Sứ 12', N'HAojvn jbe n ejbv jsbjwev', 999, 1212, 1, N'https://th.bing.com/th/id/OIP.8qiFh7N_DhzGOOiYZIC5QwHaHa?pid=ImgDet&rs=1', 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[User] ([Username], [Email], [Role], [Password], [Name], [Gender], [Phone], [Yob], [Address], [Avatar], [Enabled]) VALUES (N'duyduc', N'duyduc@gmail.com', N'CUSTOMER', N'123456', N'Duy Đức', 1, N'0934968395', 2002, N'Thu Duc City', NULL, 1)
GO
INSERT [dbo].[User] ([Username], [Email], [Role], [Password], [Name], [Gender], [Phone], [Yob], [Address], [Avatar], [Enabled]) VALUES (N'hoangthien', N'thien@gmail.com', N'SHIPPER', N'123456', N'Hoàng Thiện', 1, N'0987391600', 2002, N'quang ngai', NULL, 1)
GO
INSERT [dbo].[User] ([Username], [Email], [Role], [Password], [Name], [Gender], [Phone], [Yob], [Address], [Avatar], [Enabled]) VALUES (N'hoangthienn', N'thienn@gmail.com', N'SHIPPER', N'1', N'thienn', 1, N'0987391601', 2002, N'quangngai', NULL, 1)
GO
INSERT [dbo].[User] ([Username], [Email], [Role], [Password], [Name], [Gender], [Phone], [Yob], [Address], [Avatar], [Enabled]) VALUES (N'hoangthiennn', N'thiennn@gmail.com', N'SHIPPER', N'1', N'thiennn', 1, N'0987391602', 2002, N'quangngai', NULL, 1)
GO
INSERT [dbo].[User] ([Username], [Email], [Role], [Password], [Name], [Gender], [Phone], [Yob], [Address], [Avatar], [Enabled]) VALUES (N'passersby', N'passersby@gmail.com', N'CUSTOMER', N'123456', N'Passersby', 1, N'0900000000', 2002, N'quangngai', NULL, 1)
GO
INSERT [dbo].[User] ([Username], [Email], [Role], [Password], [Name], [Gender], [Phone], [Yob], [Address], [Avatar], [Enabled]) VALUES (N'quyettran', N'quyet2@gmail.com', N'STAFF', N'123456', N'Quyết Trần', 1, N'0897844555', 2002, N'12th District', NULL, 1)
GO
INSERT [dbo].[User] ([Username], [Email], [Role], [Password], [Name], [Gender], [Phone], [Yob], [Address], [Avatar], [Enabled]) VALUES (N'tannguyen', N'van59116@gmail.com', N'ADMIN', N'123456', N'Tấn Nguyễn', 1, N'0124121241', 2002, N'quangngai', NULL, 1)
GO
INSERT [dbo].[User] ([Username], [Email], [Role], [Password], [Name], [Gender], [Phone], [Yob], [Address], [Avatar], [Enabled]) VALUES (N'user0356970686', N'user0356970686@gifthommie.com', N'CUSTOMER', N'123456', N'Quyet Tran', NULL, N'0356970686', NULL, N'', NULL, 1)
GO
INSERT [dbo].[User] ([Username], [Email], [Role], [Password], [Name], [Gender], [Phone], [Yob], [Address], [Avatar], [Enabled]) VALUES (N'user0356970689', N'user0356970689@gifthommie.com', N'CUSTOMER', N'123456', N'Minh Tuán', NULL, N'0356970689', NULL, N'23 Thạnh Xuân', NULL, 1)
GO
INSERT [dbo].[User] ([Username], [Email], [Role], [Password], [Name], [Gender], [Phone], [Yob], [Address], [Avatar], [Enabled]) VALUES (N'user0356970696', N'user0356970696@gifthommie.com', N'CUSTOMER', N'123456', N'Tấn', NULL, N'0356970696', NULL, N'', NULL, 1)
GO
INSERT [dbo].[User] ([Username], [Email], [Role], [Password], [Name], [Gender], [Phone], [Yob], [Address], [Avatar], [Enabled]) VALUES (N'user0356976999', N'user0356976999@gifthommie.com', N'CUSTOMER', N'123456', N'Transforme', NULL, N'0356976999', NULL, N'25 TX ', NULL, 1)
GO
INSERT [dbo].[User] ([Username], [Email], [Role], [Password], [Name], [Gender], [Phone], [Yob], [Address], [Avatar], [Enabled]) VALUES (N'user0934914124', N'user0934914124@gifthommie.com', N'CUSTOMER', N'123456', N'Wfqf', NULL, N'0934914124', NULL, N'', NULL, 1)
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Shipping_Mode]  DEFAULT ((0)) FOR [ShippingMode]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_enabled]  DEFAULT ((1)) FOR [Enabled]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Product]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_User] FOREIGN KEY([Username])
REFERENCES [dbo].[User] ([Username])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_User]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Orders_User] FOREIGN KEY([Username])
REFERENCES [dbo].[User] ([Username])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Orders_User]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Shipper_Order_User] FOREIGN KEY([Shipper])
REFERENCES [dbo].[User] ([Username])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Shipper_Order_User]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Orders]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
USE [master]
GO
ALTER DATABASE [BirdStore] SET  READ_WRITE 
GO
