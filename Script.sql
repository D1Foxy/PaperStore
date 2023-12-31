USE [master]
GO
/****** Object:  Database [PaperStore]    Script Date: 20.06.2023 21:08:47 ******/
CREATE DATABASE [PaperStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PaperStore', FILENAME = N'C:\Users\foxdi\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\PaperStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PaperStore_log', FILENAME = N'C:\Users\foxdi\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\PaperStore.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PaperStore] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PaperStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PaperStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PaperStore] SET ANSI_NULLS ON 
GO
ALTER DATABASE [PaperStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PaperStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PaperStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [PaperStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PaperStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PaperStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PaperStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PaperStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PaperStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PaperStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PaperStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PaperStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PaperStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PaperStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PaperStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PaperStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PaperStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PaperStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PaperStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PaperStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PaperStore] SET RECOVERY FULL 
GO
ALTER DATABASE [PaperStore] SET  MULTI_USER 
GO
ALTER DATABASE [PaperStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PaperStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PaperStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PaperStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PaperStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PaperStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PaperStore] SET QUERY_STORE = OFF
GO
USE [PaperStore]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 20.06.2023 21:08:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ArticleNumber] [nvarchar](100) NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Unit] [nvarchar](max) NOT NULL,
	[Cost] [decimal](19, 2) NOT NULL,
	[Manufacturer] [nvarchar](max) NOT NULL,
	[Suppler] [nvarchar](max) NOT NULL,
	[Category] [nvarchar](max) NOT NULL,
	[QuantityInStock] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Photo] [varchar](max) NOT NULL,
	[Status] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 20.06.2023 21:08:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 20.06.2023 21:08:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] NOT NULL,
	[Surname] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Patronymic] [nvarchar](100) NOT NULL,
	[Login] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Role] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [ArticleNumber], [Name], [Unit], [Cost], [Manufacturer], [Suppler], [Category], [QuantityInStock], [Description], [Photo], [Status]) VALUES (10, N'А12Т4', N'Пушок', N'шт.', CAST(14.00 AS Decimal(19, 2)), N'ИП Овасапян Р.А.', N'стройхозторг26.рф', N'Туалетная бумага', 550, N'Туалетная бумага "Пушок" 1/30шт', N'A112T1.png', N'готов')
INSERT [dbo].[Product] ([Id], [ArticleNumber], [Name], [Unit], [Cost], [Manufacturer], [Suppler], [Category], [QuantityInStock], [Description], [Photo], [Status]) VALUES (11, N'G598Y6', N'Богатырская', N'шт.', CAST(11.60 AS Decimal(19, 2)), N'ИП Овасапян Р.А.', N'стройхозторг26.рф', N'Туалетная бумага', 1600, N'Туалетная бумага "Богатырская" 1/40шт', N'G598Y6.png', N'не готов')
INSERT [dbo].[Product] ([Id], [ArticleNumber], [Name], [Unit], [Cost], [Manufacturer], [Suppler], [Category], [QuantityInStock], [Description], [Photo], [Status]) VALUES (12, N'F746E6', N'Ласка', N'шт.', CAST(9.40 AS Decimal(19, 2)), N'ИП Овасапян Р.А.', N'стройхозторг26.рф', N'Туалетная бумага', 515, N'Туалетная бумага "Ласка" 1/50шт', N'F746E6.png', N'готов')
INSERT [dbo].[Product] ([Id], [ArticleNumber], [Name], [Unit], [Cost], [Manufacturer], [Suppler], [Category], [QuantityInStock], [Description], [Photo], [Status]) VALUES (13, N'D830R5', N'Парнас ', N'шт.', CAST(22.50 AS Decimal(19, 2)), N'ИП Овасапян Р.А.', N'Himsklad.com', N'Бумажные салфетки', 100, N'Бумажные салфетки "Парнас" 1/50шт', N'D830R5.png', N'готов')
INSERT [dbo].[Product] ([Id], [ArticleNumber], [Name], [Unit], [Cost], [Manufacturer], [Suppler], [Category], [QuantityInStock], [Description], [Photo], [Status]) VALUES (14, N'B538G6', N'Эврика', N'шт.', CAST(30.00 AS Decimal(19, 2)), N'ИП Овасапян Р.А.', N'Himsklad.com', N'Бумажные салфетки', 670, N'Бумажные салфетки "Элита" 1/50шт', N'B538G6.png', N'готов')
INSERT [dbo].[Product] ([Id], [ArticleNumber], [Name], [Unit], [Cost], [Manufacturer], [Suppler], [Category], [QuantityInStock], [Description], [Photo], [Status]) VALUES (15, N'D648N7', N'Орион', N'шт.', CAST(15.50 AS Decimal(19, 2)), N'ИП Овасапян Р.А.', N'Himsklad.com', N'Бумажные салфетки', 355, N'Бумажные салфетки "Орион" 1/50шт', N'D648N7.png', N'готов')
INSERT [dbo].[Product] ([Id], [ArticleNumber], [Name], [Unit], [Cost], [Manufacturer], [Suppler], [Category], [QuantityInStock], [Description], [Photo], [Status]) VALUES (16, N'F735B6', N'"Без названия"', N'шт.', CAST(50.00 AS Decimal(19, 2)), N'ИП Овасапян Р.А.', N'Himsklad.com', N'Бумажные салфетки', 450, N'Бумажные салфетки ""Без названия" 1/50шт', N'', N'готов')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'Менеджер')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (2, N'Администратор')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Login], [Password], [Role]) VALUES (1, N'Руденко', N'Наталья', N'Александровна', N'1', N'1', 1)
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Login], [Password], [Role]) VALUES (2, N'Григорьева', N'Алла', N'Арсентьевна', N'2', N'2', 1)
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Login], [Password], [Role]) VALUES (3, N'Овасапян', N'Рубен', N'Арамаисович', N'3', N'3', 2)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tmp_ms_x__3C991142727CA6D5]    Script Date: 20.06.2023 21:08:47 ******/
ALTER TABLE [dbo].[Product] ADD UNIQUE NONCLUSTERED 
(
	[ArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([Role])
REFERENCES [dbo].[Role] ([Id])
GO
USE [master]
GO
ALTER DATABASE [PaperStore] SET  READ_WRITE 
GO
