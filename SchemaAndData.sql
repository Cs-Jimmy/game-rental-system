USE [master]
GO
/****** Object:  Database [gamev4]    Script Date: 7/18/2025 4:10:37 PM ******/
CREATE DATABASE [gamev4]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'gamev4', FILENAME = N'D:\Program Files\MSSQL16.SQLEXPRESS\MSSQL\DATA\gamev4.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'gamev4_log', FILENAME = N'D:\Program Files\MSSQL16.SQLEXPRESS\MSSQL\DATA\gamev4_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [gamev4] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [gamev4].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [gamev4] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [gamev4] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [gamev4] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [gamev4] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [gamev4] SET ARITHABORT OFF 
GO
ALTER DATABASE [gamev4] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [gamev4] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [gamev4] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [gamev4] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [gamev4] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [gamev4] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [gamev4] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [gamev4] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [gamev4] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [gamev4] SET  DISABLE_BROKER 
GO
ALTER DATABASE [gamev4] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [gamev4] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [gamev4] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [gamev4] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [gamev4] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [gamev4] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [gamev4] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [gamev4] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [gamev4] SET  MULTI_USER 
GO
ALTER DATABASE [gamev4] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [gamev4] SET DB_CHAINING OFF 
GO
ALTER DATABASE [gamev4] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [gamev4] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [gamev4] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [gamev4] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [gamev4] SET QUERY_STORE = ON
GO
ALTER DATABASE [gamev4] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [gamev4]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 7/18/2025 4:10:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[userID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdminActions]    Script Date: 7/18/2025 4:10:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminActions](
	[userID] [int] NOT NULL,
	[GameID] [int] NOT NULL,
	[ActionType] [varchar](50) NULL,
	[ActionDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC,
	[GameID] ASC,
	[ActionDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 7/18/2025 4:10:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[userID] [int] NOT NULL,
	[points] [int] NULL,
	[FriendCount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientPayments]    Script Date: 7/18/2025 4:10:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientPayments](
	[RetailID] [int] NOT NULL,
	[TransactionDate] [date] NULL,
	[PaymentID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[RetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Friends]    Script Date: 7/18/2025 4:10:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Friends](
	[FriendID] [int] NOT NULL,
	[ClientID] [int] NULL,
	[created_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[FriendID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Game]    Script Date: 7/18/2025 4:10:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Game](
	[GameID] [int] NOT NULL,
	[Title] [varchar](100) NULL,
	[Category] [varchar](50) NULL,
	[Description] [text] NULL,
	[ReleaseYear] [int] NULL,
	[Quantity] [int] NULL,
	[PricePerDay] [decimal](10, 2) NULL,
	[Rating] [decimal](3, 2) NULL,
	[VendorID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[GameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invites]    Script Date: 7/18/2025 4:10:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invites](
	[Inviter] [int] NULL,
	[Invitee] [int] NULL,
	[InviteID] [int] NOT NULL,
	[InviteDate] [date] NULL,
	[invitation_status] [varchar](20) NULL,
	[InviteeEmail] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[InviteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentDetails]    Script Date: 7/18/2025 4:10:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentDetails](
	[PaymentID] [int] NOT NULL,
	[TotalCharge] [decimal](10, 2) NULL,
	[PaymentStatus] [varchar](20) NULL,
	[PaymentMethod] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rental]    Script Date: 7/18/2025 4:10:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rental](
	[RentID] [int] NOT NULL,
	[ClientID] [int] NULL,
	[GameID] [int] NULL,
	[RentalDate] [date] NULL,
	[DueDate] [date] NULL,
	[RentStatus] [varchar](20) NULL,
	[TotalCharge] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[RentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Retail]    Script Date: 7/18/2025 4:10:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Retail](
	[RentID] [int] NOT NULL,
	[ClientID] [int] NOT NULL,
	[TotalCharge] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[RentID] ASC,
	[ClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 7/18/2025 4:10:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[ReviewID] [int] NOT NULL,
	[ReviewDate] [date] NULL,
	[Rating] [decimal](2, 1) NULL,
	[ClientID] [int] NULL,
	[GameID] [int] NULL,
	[ReviewDetails] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SuperVision]    Script Date: 7/18/2025 4:10:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SuperVision](
	[SuperVisor] [int] NOT NULL,
	[Supervisee] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SuperVisor] ASC,
	[Supervisee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplies]    Script Date: 7/18/2025 4:10:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplies](
	[vendorID] [int] NOT NULL,
	[GameID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[vendorID] ASC,
	[GameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/18/2025 4:10:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userID] [int] NOT NULL,
	[Name] [varchar](100) NULL,
	[BirthDay] [date] NULL,
	[Age] [int] NULL,
	[Email] [varchar](100) NULL,
	[phone_number] [varchar](20) NULL,
	[status] [varchar](20) NULL,
	[RegistrationDate] [date] NULL,
	[Role] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendor]    Script Date: 7/18/2025 4:10:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendor](
	[vendorID] [int] NOT NULL,
	[name] [varchar](100) NULL,
	[payment_method] [varchar](50) NULL,
	[address] [varchar](200) NULL,
	[contact_info] [varchar](100) NULL,
	[phone_number] [varchar](20) NULL,
	[Email] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[vendorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VendorDeals]    Script Date: 7/18/2025 4:10:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendorDeals](
	[vendorID] [int] NOT NULL,
	[PaymentID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[vendorID] ASC,
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Client] ([userID], [points], [FriendCount]) VALUES (99, NULL, NULL)
INSERT [dbo].[Client] ([userID], [points], [FriendCount]) VALUES (101, NULL, NULL)
INSERT [dbo].[Client] ([userID], [points], [FriendCount]) VALUES (102, NULL, NULL)
INSERT [dbo].[Client] ([userID], [points], [FriendCount]) VALUES (103, NULL, NULL)
INSERT [dbo].[Client] ([userID], [points], [FriendCount]) VALUES (104, NULL, NULL)
INSERT [dbo].[Client] ([userID], [points], [FriendCount]) VALUES (105, NULL, NULL)
INSERT [dbo].[Client] ([userID], [points], [FriendCount]) VALUES (106, NULL, NULL)
INSERT [dbo].[Client] ([userID], [points], [FriendCount]) VALUES (107, NULL, NULL)
INSERT [dbo].[Client] ([userID], [points], [FriendCount]) VALUES (108, NULL, NULL)
INSERT [dbo].[Client] ([userID], [points], [FriendCount]) VALUES (109, NULL, NULL)
INSERT [dbo].[Client] ([userID], [points], [FriendCount]) VALUES (110, NULL, NULL)
INSERT [dbo].[Client] ([userID], [points], [FriendCount]) VALUES (120, NULL, NULL)
INSERT [dbo].[Client] ([userID], [points], [FriendCount]) VALUES (222, NULL, NULL)
INSERT [dbo].[Client] ([userID], [points], [FriendCount]) VALUES (287, NULL, NULL)
INSERT [dbo].[Client] ([userID], [points], [FriendCount]) VALUES (328, NULL, NULL)
INSERT [dbo].[Client] ([userID], [points], [FriendCount]) VALUES (2399, NULL, NULL)
INSERT [dbo].[Client] ([userID], [points], [FriendCount]) VALUES (23313, NULL, NULL)
INSERT [dbo].[Client] ([userID], [points], [FriendCount]) VALUES (33312, NULL, NULL)
INSERT [dbo].[Client] ([userID], [points], [FriendCount]) VALUES (327819, NULL, NULL)
INSERT [dbo].[Client] ([userID], [points], [FriendCount]) VALUES (432442, NULL, NULL)
INSERT [dbo].[Client] ([userID], [points], [FriendCount]) VALUES (784893, NULL, NULL)
GO
INSERT [dbo].[Game] ([GameID], [Title], [Category], [Description], [ReleaseYear], [Quantity], [PricePerDay], [Rating], [VendorID]) VALUES (1, N'The Last Legend', NULL, NULL, 2014, NULL, NULL, NULL, NULL)
INSERT [dbo].[Game] ([GameID], [Title], [Category], [Description], [ReleaseYear], [Quantity], [PricePerDay], [Rating], [VendorID]) VALUES (2, N'Space Raiders', NULL, NULL, 2016, NULL, NULL, NULL, NULL)
INSERT [dbo].[Game] ([GameID], [Title], [Category], [Description], [ReleaseYear], [Quantity], [PricePerDay], [Rating], [VendorID]) VALUES (3, N'Puzzle Master', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Game] ([GameID], [Title], [Category], [Description], [ReleaseYear], [Quantity], [PricePerDay], [Rating], [VendorID]) VALUES (4, N'Shadow Core', NULL, NULL, 2000, NULL, NULL, NULL, NULL)
INSERT [dbo].[Game] ([GameID], [Title], [Category], [Description], [ReleaseYear], [Quantity], [PricePerDay], [Rating], [VendorID]) VALUES (5, N'Galactic Wars', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Game] ([GameID], [Title], [Category], [Description], [ReleaseYear], [Quantity], [PricePerDay], [Rating], [VendorID]) VALUES (6, N'Mystic Quest', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Game] ([GameID], [Title], [Category], [Description], [ReleaseYear], [Quantity], [PricePerDay], [Rating], [VendorID]) VALUES (7, N'Frozen Horizon', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Game] ([GameID], [Title], [Category], [Description], [ReleaseYear], [Quantity], [PricePerDay], [Rating], [VendorID]) VALUES (8, N'Cyber Storm', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Game] ([GameID], [Title], [Category], [Description], [ReleaseYear], [Quantity], [PricePerDay], [Rating], [VendorID]) VALUES (9, N'Rift Breaker', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Game] ([GameID], [Title], [Category], [Description], [ReleaseYear], [Quantity], [PricePerDay], [Rating], [VendorID]) VALUES (10, N'Arcade Nights', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Game] ([GameID], [Title], [Category], [Description], [ReleaseYear], [Quantity], [PricePerDay], [Rating], [VendorID]) VALUES (11, N'genshin', NULL, NULL, 2015, NULL, NULL, NULL, 2222)
INSERT [dbo].[Game] ([GameID], [Title], [Category], [Description], [ReleaseYear], [Quantity], [PricePerDay], [Rating], [VendorID]) VALUES (14, N'Echo Rise', NULL, NULL, NULL, NULL, NULL, NULL, 201)
INSERT [dbo].[Game] ([GameID], [Title], [Category], [Description], [ReleaseYear], [Quantity], [PricePerDay], [Rating], [VendorID]) VALUES (15, N'Solar Blade', NULL, NULL, NULL, NULL, NULL, NULL, 201)
INSERT [dbo].[Game] ([GameID], [Title], [Category], [Description], [ReleaseYear], [Quantity], [PricePerDay], [Rating], [VendorID]) VALUES (16, N'Iron Wave', NULL, NULL, NULL, NULL, NULL, NULL, 202)
INSERT [dbo].[Game] ([GameID], [Title], [Category], [Description], [ReleaseYear], [Quantity], [PricePerDay], [Rating], [VendorID]) VALUES (17, N'Storm Net', NULL, NULL, NULL, NULL, NULL, NULL, 202)
INSERT [dbo].[Game] ([GameID], [Title], [Category], [Description], [ReleaseYear], [Quantity], [PricePerDay], [Rating], [VendorID]) VALUES (18, N'Glass Rift', NULL, NULL, NULL, NULL, NULL, NULL, 203)
INSERT [dbo].[Game] ([GameID], [Title], [Category], [Description], [ReleaseYear], [Quantity], [PricePerDay], [Rating], [VendorID]) VALUES (19, N'Nova Speed', NULL, NULL, NULL, NULL, NULL, NULL, 204)
INSERT [dbo].[Game] ([GameID], [Title], [Category], [Description], [ReleaseYear], [Quantity], [PricePerDay], [Rating], [VendorID]) VALUES (20, N'Silent Flame', NULL, NULL, NULL, NULL, NULL, NULL, 204)
INSERT [dbo].[Game] ([GameID], [Title], [Category], [Description], [ReleaseYear], [Quantity], [PricePerDay], [Rating], [VendorID]) VALUES (21, N'Void Engine', NULL, NULL, NULL, NULL, NULL, NULL, 205)
INSERT [dbo].[Game] ([GameID], [Title], [Category], [Description], [ReleaseYear], [Quantity], [PricePerDay], [Rating], [VendorID]) VALUES (22, N'Gravity Cut', NULL, NULL, NULL, NULL, NULL, NULL, 206)
INSERT [dbo].[Game] ([GameID], [Title], [Category], [Description], [ReleaseYear], [Quantity], [PricePerDay], [Rating], [VendorID]) VALUES (23, N'Battle Code', NULL, NULL, 2024, NULL, NULL, NULL, 207)
INSERT [dbo].[Game] ([GameID], [Title], [Category], [Description], [ReleaseYear], [Quantity], [PricePerDay], [Rating], [VendorID]) VALUES (24, N'Neon Dust', NULL, NULL, 2024, NULL, NULL, NULL, 207)
INSERT [dbo].[Game] ([GameID], [Title], [Category], [Description], [ReleaseYear], [Quantity], [PricePerDay], [Rating], [VendorID]) VALUES (25, N'Fire Chamber', NULL, NULL, 2023, NULL, NULL, NULL, 208)
INSERT [dbo].[Game] ([GameID], [Title], [Category], [Description], [ReleaseYear], [Quantity], [PricePerDay], [Rating], [VendorID]) VALUES (26, N'Echo Burn', NULL, NULL, 2022, NULL, NULL, NULL, 209)
INSERT [dbo].[Game] ([GameID], [Title], [Category], [Description], [ReleaseYear], [Quantity], [PricePerDay], [Rating], [VendorID]) VALUES (27, N'Digital Spin', NULL, NULL, NULL, NULL, NULL, NULL, 210)
INSERT [dbo].[Game] ([GameID], [Title], [Category], [Description], [ReleaseYear], [Quantity], [PricePerDay], [Rating], [VendorID]) VALUES (28, N'Static Zone', NULL, NULL, NULL, NULL, NULL, NULL, 211)
INSERT [dbo].[Game] ([GameID], [Title], [Category], [Description], [ReleaseYear], [Quantity], [PricePerDay], [Rating], [VendorID]) VALUES (60, N'chessgame', NULL, NULL, 2007, NULL, NULL, NULL, 13)
INSERT [dbo].[Game] ([GameID], [Title], [Category], [Description], [ReleaseYear], [Quantity], [PricePerDay], [Rating], [VendorID]) VALUES (122, N'super mario', NULL, NULL, 1987, NULL, NULL, NULL, 8923)
INSERT [dbo].[Game] ([GameID], [Title], [Category], [Description], [ReleaseYear], [Quantity], [PricePerDay], [Rating], [VendorID]) VALUES (666, N'subway', NULL, NULL, 1999, NULL, NULL, NULL, 8310934)
INSERT [dbo].[Game] ([GameID], [Title], [Category], [Description], [ReleaseYear], [Quantity], [PricePerDay], [Rating], [VendorID]) VALUES (47834, N'Horror story', NULL, NULL, 2013, NULL, NULL, NULL, 231)
INSERT [dbo].[Game] ([GameID], [Title], [Category], [Description], [ReleaseYear], [Quantity], [PricePerDay], [Rating], [VendorID]) VALUES (361236, N'valorant', NULL, NULL, 2019, NULL, NULL, NULL, 93021)
INSERT [dbo].[Game] ([GameID], [Title], [Category], [Description], [ReleaseYear], [Quantity], [PricePerDay], [Rating], [VendorID]) VALUES (8934089, N'Neon Skies', NULL, NULL, 1996, NULL, NULL, NULL, 314)
GO
INSERT [dbo].[Rental] ([RentID], [ClientID], [GameID], [RentalDate], [DueDate], [RentStatus], [TotalCharge]) VALUES (326, 287, 361236, CAST(N'2025-03-11' AS Date), NULL, NULL, NULL)
INSERT [dbo].[Rental] ([RentID], [ClientID], [GameID], [RentalDate], [DueDate], [RentStatus], [TotalCharge]) VALUES (1001, 101, 1, CAST(N'2025-05-01' AS Date), NULL, NULL, NULL)
INSERT [dbo].[Rental] ([RentID], [ClientID], [GameID], [RentalDate], [DueDate], [RentStatus], [TotalCharge]) VALUES (1002, 102, 1, CAST(N'2025-05-02' AS Date), NULL, NULL, NULL)
INSERT [dbo].[Rental] ([RentID], [ClientID], [GameID], [RentalDate], [DueDate], [RentStatus], [TotalCharge]) VALUES (1003, 103, 1, CAST(N'2025-05-03' AS Date), NULL, NULL, NULL)
INSERT [dbo].[Rental] ([RentID], [ClientID], [GameID], [RentalDate], [DueDate], [RentStatus], [TotalCharge]) VALUES (1004, 101, 2, CAST(N'2025-05-01' AS Date), NULL, NULL, NULL)
INSERT [dbo].[Rental] ([RentID], [ClientID], [GameID], [RentalDate], [DueDate], [RentStatus], [TotalCharge]) VALUES (1005, 104, 2, CAST(N'2025-05-03' AS Date), NULL, NULL, NULL)
INSERT [dbo].[Rental] ([RentID], [ClientID], [GameID], [RentalDate], [DueDate], [RentStatus], [TotalCharge]) VALUES (1006, 101, 3, CAST(N'2025-05-04' AS Date), NULL, NULL, NULL)
INSERT [dbo].[Rental] ([RentID], [ClientID], [GameID], [RentalDate], [DueDate], [RentStatus], [TotalCharge]) VALUES (1007, 105, 4, CAST(N'2025-05-05' AS Date), NULL, NULL, NULL)
INSERT [dbo].[Rental] ([RentID], [ClientID], [GameID], [RentalDate], [DueDate], [RentStatus], [TotalCharge]) VALUES (1008, 106, 4, CAST(N'2025-05-06' AS Date), NULL, NULL, NULL)
INSERT [dbo].[Rental] ([RentID], [ClientID], [GameID], [RentalDate], [DueDate], [RentStatus], [TotalCharge]) VALUES (1009, 107, 4, CAST(N'2025-05-07' AS Date), NULL, NULL, NULL)
INSERT [dbo].[Rental] ([RentID], [ClientID], [GameID], [RentalDate], [DueDate], [RentStatus], [TotalCharge]) VALUES (1010, 108, 5, CAST(N'2025-05-05' AS Date), NULL, NULL, NULL)
INSERT [dbo].[Rental] ([RentID], [ClientID], [GameID], [RentalDate], [DueDate], [RentStatus], [TotalCharge]) VALUES (1011, 109, 5, CAST(N'2025-05-06' AS Date), NULL, NULL, NULL)
INSERT [dbo].[Rental] ([RentID], [ClientID], [GameID], [RentalDate], [DueDate], [RentStatus], [TotalCharge]) VALUES (1012, 110, 6, CAST(N'2025-05-07' AS Date), NULL, NULL, NULL)
INSERT [dbo].[Rental] ([RentID], [ClientID], [GameID], [RentalDate], [DueDate], [RentStatus], [TotalCharge]) VALUES (1013, 101, 8, CAST(N'2025-04-10' AS Date), NULL, NULL, NULL)
INSERT [dbo].[Rental] ([RentID], [ClientID], [GameID], [RentalDate], [DueDate], [RentStatus], [TotalCharge]) VALUES (1014, 102, 9, CAST(N'2025-05-05' AS Date), NULL, NULL, NULL)
INSERT [dbo].[Rental] ([RentID], [ClientID], [GameID], [RentalDate], [DueDate], [RentStatus], [TotalCharge]) VALUES (1021, 101, 14, CAST(N'2025-04-01' AS Date), NULL, NULL, NULL)
INSERT [dbo].[Rental] ([RentID], [ClientID], [GameID], [RentalDate], [DueDate], [RentStatus], [TotalCharge]) VALUES (1022, 102, 15, CAST(N'2025-04-05' AS Date), NULL, NULL, NULL)
INSERT [dbo].[Rental] ([RentID], [ClientID], [GameID], [RentalDate], [DueDate], [RentStatus], [TotalCharge]) VALUES (1023, 103, 14, CAST(N'2025-04-08' AS Date), NULL, NULL, NULL)
INSERT [dbo].[Rental] ([RentID], [ClientID], [GameID], [RentalDate], [DueDate], [RentStatus], [TotalCharge]) VALUES (1024, 104, 16, CAST(N'2025-04-10' AS Date), NULL, NULL, NULL)
INSERT [dbo].[Rental] ([RentID], [ClientID], [GameID], [RentalDate], [DueDate], [RentStatus], [TotalCharge]) VALUES (1025, 105, 17, CAST(N'2025-04-12' AS Date), NULL, NULL, NULL)
INSERT [dbo].[Rental] ([RentID], [ClientID], [GameID], [RentalDate], [DueDate], [RentStatus], [TotalCharge]) VALUES (1026, 106, 18, CAST(N'2025-04-15' AS Date), NULL, NULL, NULL)
INSERT [dbo].[Rental] ([RentID], [ClientID], [GameID], [RentalDate], [DueDate], [RentStatus], [TotalCharge]) VALUES (1027, 101, 19, CAST(N'2025-04-03' AS Date), NULL, NULL, NULL)
INSERT [dbo].[Rental] ([RentID], [ClientID], [GameID], [RentalDate], [DueDate], [RentStatus], [TotalCharge]) VALUES (1028, 102, 20, CAST(N'2025-04-07' AS Date), NULL, NULL, NULL)
INSERT [dbo].[Rental] ([RentID], [ClientID], [GameID], [RentalDate], [DueDate], [RentStatus], [TotalCharge]) VALUES (2333, 432442, 8934089, CAST(N'2025-01-14' AS Date), NULL, NULL, NULL)
INSERT [dbo].[Rental] ([RentID], [ClientID], [GameID], [RentalDate], [DueDate], [RentStatus], [TotalCharge]) VALUES (23621, 33312, 122, CAST(N'2025-05-16' AS Date), NULL, NULL, NULL)
INSERT [dbo].[Rental] ([RentID], [ClientID], [GameID], [RentalDate], [DueDate], [RentStatus], [TotalCharge]) VALUES (32687, 2399, 60, CAST(N'2025-05-05' AS Date), NULL, NULL, NULL)
INSERT [dbo].[Rental] ([RentID], [ClientID], [GameID], [RentalDate], [DueDate], [RentStatus], [TotalCharge]) VALUES (432432, 222, 666, CAST(N'2025-05-16' AS Date), NULL, NULL, NULL)
INSERT [dbo].[Rental] ([RentID], [ClientID], [GameID], [RentalDate], [DueDate], [RentStatus], [TotalCharge]) VALUES (999922, 23313, 11, CAST(N'2025-04-02' AS Date), NULL, NULL, NULL)
INSERT [dbo].[Rental] ([RentID], [ClientID], [GameID], [RentalDate], [DueDate], [RentStatus], [TotalCharge]) VALUES (3232334, 328, 47834, CAST(N'2025-02-25' AS Date), NULL, NULL, NULL)
GO
INSERT [dbo].[Users] ([userID], [Name], [BirthDay], [Age], [Email], [phone_number], [status], [RegistrationDate], [Role]) VALUES (99, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([userID], [Name], [BirthDay], [Age], [Email], [phone_number], [status], [RegistrationDate], [Role]) VALUES (101, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([userID], [Name], [BirthDay], [Age], [Email], [phone_number], [status], [RegistrationDate], [Role]) VALUES (102, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([userID], [Name], [BirthDay], [Age], [Email], [phone_number], [status], [RegistrationDate], [Role]) VALUES (103, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([userID], [Name], [BirthDay], [Age], [Email], [phone_number], [status], [RegistrationDate], [Role]) VALUES (104, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([userID], [Name], [BirthDay], [Age], [Email], [phone_number], [status], [RegistrationDate], [Role]) VALUES (105, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([userID], [Name], [BirthDay], [Age], [Email], [phone_number], [status], [RegistrationDate], [Role]) VALUES (106, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([userID], [Name], [BirthDay], [Age], [Email], [phone_number], [status], [RegistrationDate], [Role]) VALUES (107, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([userID], [Name], [BirthDay], [Age], [Email], [phone_number], [status], [RegistrationDate], [Role]) VALUES (108, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([userID], [Name], [BirthDay], [Age], [Email], [phone_number], [status], [RegistrationDate], [Role]) VALUES (109, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([userID], [Name], [BirthDay], [Age], [Email], [phone_number], [status], [RegistrationDate], [Role]) VALUES (110, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([userID], [Name], [BirthDay], [Age], [Email], [phone_number], [status], [RegistrationDate], [Role]) VALUES (120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([userID], [Name], [BirthDay], [Age], [Email], [phone_number], [status], [RegistrationDate], [Role]) VALUES (123, N'jim', NULL, NULL, N'jim@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([userID], [Name], [BirthDay], [Age], [Email], [phone_number], [status], [RegistrationDate], [Role]) VALUES (222, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([userID], [Name], [BirthDay], [Age], [Email], [phone_number], [status], [RegistrationDate], [Role]) VALUES (287, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([userID], [Name], [BirthDay], [Age], [Email], [phone_number], [status], [RegistrationDate], [Role]) VALUES (328, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([userID], [Name], [BirthDay], [Age], [Email], [phone_number], [status], [RegistrationDate], [Role]) VALUES (2399, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([userID], [Name], [BirthDay], [Age], [Email], [phone_number], [status], [RegistrationDate], [Role]) VALUES (23313, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([userID], [Name], [BirthDay], [Age], [Email], [phone_number], [status], [RegistrationDate], [Role]) VALUES (33312, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([userID], [Name], [BirthDay], [Age], [Email], [phone_number], [status], [RegistrationDate], [Role]) VALUES (327819, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([userID], [Name], [BirthDay], [Age], [Email], [phone_number], [status], [RegistrationDate], [Role]) VALUES (432442, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([userID], [Name], [BirthDay], [Age], [Email], [phone_number], [status], [RegistrationDate], [Role]) VALUES (784893, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Vendor] ([vendorID], [name], [payment_method], [address], [contact_info], [phone_number], [Email]) VALUES (201, N'VendorX', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Vendor] ([vendorID], [name], [payment_method], [address], [contact_info], [phone_number], [Email]) VALUES (202, N'VendorY', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Vendor] ([vendorID], [name], [payment_method], [address], [contact_info], [phone_number], [Email]) VALUES (203, N'VendorZ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Vendor] ([vendorID], [name], [payment_method], [address], [contact_info], [phone_number], [Email]) VALUES (204, N'Vendor guy', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Vendor] ([vendorID], [name], [payment_method], [address], [contact_info], [phone_number], [Email]) VALUES (205, N'Vendor ghost', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Vendor] ([vendorID], [name], [payment_method], [address], [contact_info], [phone_number], [Email]) VALUES (206, N'Vendor zombie', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Vendor] ([vendorID], [name], [payment_method], [address], [contact_info], [phone_number], [Email]) VALUES (207, N'CoolVendor', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Vendor] ([vendorID], [name], [payment_method], [address], [contact_info], [phone_number], [Email]) VALUES (208, N'SadVendor', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Vendor] ([vendorID], [name], [payment_method], [address], [contact_info], [phone_number], [Email]) VALUES (209, N'ImAVendor', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Vendor] ([vendorID], [name], [payment_method], [address], [contact_info], [phone_number], [Email]) VALUES (210, N'VendorMultiA', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Vendor] ([vendorID], [name], [payment_method], [address], [contact_info], [phone_number], [Email]) VALUES (211, N'VendorMultiB', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Vendor] ([vendorID], [name], [payment_method], [address], [contact_info], [phone_number], [Email]) VALUES (223, N'jimidw', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Vendor] ([vendorID], [name], [payment_method], [address], [contact_info], [phone_number], [Email]) VALUES (231, N'HorrorArcade', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Vendor] ([vendorID], [name], [payment_method], [address], [contact_info], [phone_number], [Email]) VALUES (314, N'Neon Arcade', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Vendor] ([vendorID], [name], [payment_method], [address], [contact_info], [phone_number], [Email]) VALUES (2222, N'GalaxyGames', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Vendor] ([vendorID], [name], [payment_method], [address], [contact_info], [phone_number], [Email]) VALUES (8798, N'jimwqw', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Vendor] ([vendorID], [name], [payment_method], [address], [contact_info], [phone_number], [Email]) VALUES (8923, N'GamePlanet', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Vendor] ([vendorID], [name], [payment_method], [address], [contact_info], [phone_number], [Email]) VALUES (43344, N'sam', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Vendor] ([vendorID], [name], [payment_method], [address], [contact_info], [phone_number], [Email]) VALUES (64864, N'jim', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Vendor] ([vendorID], [name], [payment_method], [address], [contact_info], [phone_number], [Email]) VALUES (93021, N'Fun', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Vendor] ([vendorID], [name], [payment_method], [address], [contact_info], [phone_number], [Email]) VALUES (4739848, N'fewljif', NULL, NULL, NULL, NULL, NULL)
GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[AdminActions]  WITH CHECK ADD FOREIGN KEY([GameID])
REFERENCES [dbo].[Game] ([GameID])
GO
ALTER TABLE [dbo].[AdminActions]  WITH CHECK ADD FOREIGN KEY([GameID])
REFERENCES [dbo].[Game] ([GameID])
GO
ALTER TABLE [dbo].[AdminActions]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[Admin] ([userID])
GO
ALTER TABLE [dbo].[AdminActions]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[Admin] ([userID])
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[ClientPayments]  WITH CHECK ADD FOREIGN KEY([PaymentID])
REFERENCES [dbo].[PaymentDetails] ([PaymentID])
GO
ALTER TABLE [dbo].[ClientPayments]  WITH CHECK ADD FOREIGN KEY([PaymentID])
REFERENCES [dbo].[PaymentDetails] ([PaymentID])
GO
ALTER TABLE [dbo].[Friends]  WITH CHECK ADD FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([userID])
GO
ALTER TABLE [dbo].[Friends]  WITH CHECK ADD FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([userID])
GO
ALTER TABLE [dbo].[Invites]  WITH CHECK ADD FOREIGN KEY([Invitee])
REFERENCES [dbo].[Client] ([userID])
GO
ALTER TABLE [dbo].[Invites]  WITH CHECK ADD FOREIGN KEY([Invitee])
REFERENCES [dbo].[Client] ([userID])
GO
ALTER TABLE [dbo].[Invites]  WITH CHECK ADD FOREIGN KEY([Inviter])
REFERENCES [dbo].[Client] ([userID])
GO
ALTER TABLE [dbo].[Invites]  WITH CHECK ADD FOREIGN KEY([Inviter])
REFERENCES [dbo].[Client] ([userID])
GO
ALTER TABLE [dbo].[Rental]  WITH CHECK ADD FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([userID])
GO
ALTER TABLE [dbo].[Rental]  WITH CHECK ADD FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([userID])
GO
ALTER TABLE [dbo].[Rental]  WITH CHECK ADD FOREIGN KEY([GameID])
REFERENCES [dbo].[Game] ([GameID])
GO
ALTER TABLE [dbo].[Rental]  WITH CHECK ADD FOREIGN KEY([GameID])
REFERENCES [dbo].[Game] ([GameID])
GO
ALTER TABLE [dbo].[Retail]  WITH CHECK ADD FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([userID])
GO
ALTER TABLE [dbo].[Retail]  WITH CHECK ADD FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([userID])
GO
ALTER TABLE [dbo].[Retail]  WITH CHECK ADD FOREIGN KEY([RentID])
REFERENCES [dbo].[Rental] ([RentID])
GO
ALTER TABLE [dbo].[Retail]  WITH CHECK ADD FOREIGN KEY([RentID])
REFERENCES [dbo].[Rental] ([RentID])
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([userID])
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([userID])
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD FOREIGN KEY([GameID])
REFERENCES [dbo].[Game] ([GameID])
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD FOREIGN KEY([GameID])
REFERENCES [dbo].[Game] ([GameID])
GO
ALTER TABLE [dbo].[SuperVision]  WITH CHECK ADD FOREIGN KEY([SuperVisor])
REFERENCES [dbo].[Admin] ([userID])
GO
ALTER TABLE [dbo].[SuperVision]  WITH CHECK ADD FOREIGN KEY([Supervisee])
REFERENCES [dbo].[Admin] ([userID])
GO
ALTER TABLE [dbo].[SuperVision]  WITH CHECK ADD FOREIGN KEY([SuperVisor])
REFERENCES [dbo].[Admin] ([userID])
GO
ALTER TABLE [dbo].[SuperVision]  WITH CHECK ADD FOREIGN KEY([Supervisee])
REFERENCES [dbo].[Admin] ([userID])
GO
ALTER TABLE [dbo].[Supplies]  WITH CHECK ADD FOREIGN KEY([GameID])
REFERENCES [dbo].[Game] ([GameID])
GO
ALTER TABLE [dbo].[Supplies]  WITH CHECK ADD FOREIGN KEY([GameID])
REFERENCES [dbo].[Game] ([GameID])
GO
ALTER TABLE [dbo].[Supplies]  WITH CHECK ADD FOREIGN KEY([vendorID])
REFERENCES [dbo].[Vendor] ([vendorID])
GO
ALTER TABLE [dbo].[Supplies]  WITH CHECK ADD FOREIGN KEY([vendorID])
REFERENCES [dbo].[Vendor] ([vendorID])
GO
ALTER TABLE [dbo].[VendorDeals]  WITH CHECK ADD FOREIGN KEY([PaymentID])
REFERENCES [dbo].[PaymentDetails] ([PaymentID])
GO
ALTER TABLE [dbo].[VendorDeals]  WITH CHECK ADD FOREIGN KEY([PaymentID])
REFERENCES [dbo].[PaymentDetails] ([PaymentID])
GO
ALTER TABLE [dbo].[VendorDeals]  WITH CHECK ADD FOREIGN KEY([vendorID])
REFERENCES [dbo].[Vendor] ([vendorID])
GO
ALTER TABLE [dbo].[VendorDeals]  WITH CHECK ADD FOREIGN KEY([vendorID])
REFERENCES [dbo].[Vendor] ([vendorID])
GO
USE [master]
GO
ALTER DATABASE [gamev4] SET  READ_WRITE 
GO
