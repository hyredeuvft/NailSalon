USE [master]
GO
/****** Object:  Database [BeautySalon]    Script Date: 10.11.2023 19:20:52 ******/
CREATE DATABASE [BeautySalon]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BeautySalon', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\BeautySalon.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BeautySalon_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\BeautySalon_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BeautySalon] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BeautySalon].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BeautySalon] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BeautySalon] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BeautySalon] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BeautySalon] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BeautySalon] SET ARITHABORT OFF 
GO
ALTER DATABASE [BeautySalon] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BeautySalon] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BeautySalon] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BeautySalon] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BeautySalon] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BeautySalon] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BeautySalon] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BeautySalon] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BeautySalon] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BeautySalon] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BeautySalon] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BeautySalon] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BeautySalon] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BeautySalon] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BeautySalon] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BeautySalon] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BeautySalon] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BeautySalon] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BeautySalon] SET  MULTI_USER 
GO
ALTER DATABASE [BeautySalon] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BeautySalon] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BeautySalon] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BeautySalon] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BeautySalon] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BeautySalon] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BeautySalon] SET QUERY_STORE = ON
GO
ALTER DATABASE [BeautySalon] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BeautySalon]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 10.11.2023 19:20:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[IdCategory] [tinyint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
	[Description] [nvarchar](250) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[IdCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryProduct]    Script Date: 10.11.2023 19:20:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryProduct](
	[IdCategoryProduct] [tinyint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_CategoryProduct] PRIMARY KEY CLUSTERED 
(
	[IdCategoryProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 10.11.2023 19:20:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[IdClient] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](30) NOT NULL,
	[FirstName] [nvarchar](30) NOT NULL,
	[Patronymic] [nvarchar](30) NULL,
	[Birthday] [date] NOT NULL,
	[RegistrationDate] [date] NOT NULL,
	[GenderCode] [nchar](1) NOT NULL,
	[Phone] [char](11) NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[IdClient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 10.11.2023 19:20:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[IdEmployee] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](30) NOT NULL,
	[FirstName] [nvarchar](30) NOT NULL,
	[Patronymic] [nvarchar](30) NOT NULL,
	[Birthday] [date] NOT NULL,
	[PassportSeries] [char](4) NULL,
	[PassportNumber] [char](6) NULL,
	[GenderCode] [nchar](1) NOT NULL,
	[Phone] [char](11) NOT NULL,
	[Email] [varchar](50) NULL,
	[Login] [varchar](10) NOT NULL,
	[Password] [varchar](10) NOT NULL,
	[IdSpecialization] [tinyint] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[IdEmployee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 10.11.2023 19:20:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[GenderCode] [nchar](1) NOT NULL,
	[Title] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[GenderCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 10.11.2023 19:20:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[IdOrder] [int] IDENTITY(1,1) NOT NULL,
	[IdClient] [int] NULL,
	[SaleDate] [datetime] NOT NULL,
	[FinalCost] [decimal](8, 2) NOT NULL,
	[IsPerformed] [bit] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[IdOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 10.11.2023 19:20:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[IdOrderProduct] [int] IDENTITY(1,1) NOT NULL,
	[IdOrder] [int] NOT NULL,
	[IdProduct] [int] NOT NULL,
	[Quantity] [smallint] NOT NULL,
	[PreliminaryCost] [decimal](7, 2) NOT NULL,
 CONSTRAINT [PK_OrderProduct] PRIMARY KEY CLUSTERED 
(
	[IdOrderProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderService]    Script Date: 10.11.2023 19:20:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderService](
	[IdOrderService] [int] IDENTITY(1,1) NOT NULL,
	[IdOrder] [int] NOT NULL,
	[IdService] [int] NOT NULL,
	[IdEmployee] [int] NOT NULL,
 CONSTRAINT [PK_OrderService] PRIMARY KEY CLUSTERED 
(
	[IdOrderService] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 10.11.2023 19:20:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[IdProduct] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
	[Cost] [decimal](6, 2) NOT NULL,
	[IdCategoryProduct] [tinyint] NOT NULL,
	[QuantityInStock] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[IdProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 10.11.2023 19:20:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[IdService] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[IdCategory] [tinyint] NOT NULL,
	[Description] [nvarchar](250) NULL,
	[Cost] [decimal](7, 2) NOT NULL,
	[DurationInMinute] [smallint] NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[IdService] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specialization]    Script Date: 10.11.2023 19:20:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specialization](
	[IdSpecialization] [tinyint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
	[Salary] [decimal](8, 2) NOT NULL,
 CONSTRAINT [PK_Specialization] PRIMARY KEY CLUSTERED 
(
	[IdSpecialization] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([IdCategory], [Title], [Description]) VALUES (1, N'Маникюр', N'направлено на создание образов и изменение внешнего вида')
INSERT [dbo].[Category] ([IdCategory], [Title], [Description]) VALUES (2, N'Покрытие', NULL)
INSERT [dbo].[Category] ([IdCategory], [Title], [Description]) VALUES (3, N'Укрепление', NULL)
INSERT [dbo].[Category] ([IdCategory], [Title], [Description]) VALUES (4, N'Педикюр', NULL)
INSERT [dbo].[Category] ([IdCategory], [Title], [Description]) VALUES (5, N'Подология', NULL)
INSERT [dbo].[Category] ([IdCategory], [Title], [Description]) VALUES (6, N'SPA-уход', NULL)
INSERT [dbo].[Category] ([IdCategory], [Title], [Description]) VALUES (7, N'Дизайны', NULL)
INSERT [dbo].[Category] ([IdCategory], [Title], [Description]) VALUES (8, N'Дополнительные услуги', NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[CategoryProduct] ON 

INSERT [dbo].[CategoryProduct] ([IdCategoryProduct], [Title]) VALUES (1, N'Очищающие средства')
INSERT [dbo].[CategoryProduct] ([IdCategoryProduct], [Title]) VALUES (2, N'Тонизирующие средства')
INSERT [dbo].[CategoryProduct] ([IdCategoryProduct], [Title]) VALUES (3, N'Увлажняющие средства')
INSERT [dbo].[CategoryProduct] ([IdCategoryProduct], [Title]) VALUES (4, N'Краска для волос')
INSERT [dbo].[CategoryProduct] ([IdCategoryProduct], [Title]) VALUES (5, N'Средства для покраски волос')
INSERT [dbo].[CategoryProduct] ([IdCategoryProduct], [Title]) VALUES (6, N'Маникюрные принадлежности')
INSERT [dbo].[CategoryProduct] ([IdCategoryProduct], [Title]) VALUES (7, N'Педикюрные принадлежности')
INSERT [dbo].[CategoryProduct] ([IdCategoryProduct], [Title]) VALUES (8, N'Средства для волос')
SET IDENTITY_INSERT [dbo].[CategoryProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([IdClient], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [GenderCode], [Phone]) VALUES (1, N'Медведев', N'Павел', N'Антонович', CAST(N'1966-02-07' AS Date), CAST(N'2016-07-15' AS Date), N'м', N'89151307441')
INSERT [dbo].[Client] ([IdClient], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [GenderCode], [Phone]) VALUES (2, N'Рыжов', N'Иван', N'Павлович', CAST(N'1976-01-23' AS Date), CAST(N'2023-01-07' AS Date), N'м', N'89159622537')
INSERT [dbo].[Client] ([IdClient], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [GenderCode], [Phone]) VALUES (3, N'Максимов', N'Георгий', N'Романович', CAST(N'1980-06-10' AS Date), CAST(N'2016-01-16' AS Date), N'м', N'89157965659')
INSERT [dbo].[Client] ([IdClient], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [GenderCode], [Phone]) VALUES (4, N'Хромов', N'Даниль', N'Николаевич', CAST(N'1998-03-18' AS Date), CAST(N'2023-09-06' AS Date), N'м', N'89150072654')
INSERT [dbo].[Client] ([IdClient], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [GenderCode], [Phone]) VALUES (5, N'Волков', N'Артём', N'Тимофеевич', CAST(N'1994-04-12' AS Date), CAST(N'2023-04-29' AS Date), N'ж', N'89159553978')
INSERT [dbo].[Client] ([IdClient], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [GenderCode], [Phone]) VALUES (6, N'Белоусов', N'Марк', N'Васильевич', CAST(N'1977-12-11' AS Date), CAST(N'2015-07-08' AS Date), N'м', N'89154109584')
INSERT [dbo].[Client] ([IdClient], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [GenderCode], [Phone]) VALUES (7, N'Матвеев', N'Дмитрий', N'Глебович', CAST(N'1985-08-09' AS Date), CAST(N'2015-09-25' AS Date), N'м', N'89157184775')
INSERT [dbo].[Client] ([IdClient], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [GenderCode], [Phone]) VALUES (8, N'Ковалев', N'Глеб', N'Филиппович', CAST(N'1990-09-20' AS Date), CAST(N'2016-09-28' AS Date), N'м', N'89158295843')
INSERT [dbo].[Client] ([IdClient], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [GenderCode], [Phone]) VALUES (9, N'Ильин', N'Кирилл', N'Ильич', CAST(N'1996-01-05' AS Date), CAST(N'2016-07-15' AS Date), N'м', N'89159918707')
INSERT [dbo].[Client] ([IdClient], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [GenderCode], [Phone]) VALUES (10, N'Лебедев', N'Артемий', N'Андреевич', CAST(N'1980-02-03' AS Date), CAST(N'2022-07-02' AS Date), N'м', N'89151706649')
INSERT [dbo].[Client] ([IdClient], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [GenderCode], [Phone]) VALUES (11, N'Морозов', N'Максим', N'Максимович', CAST(N'1989-02-13' AS Date), CAST(N'2015-01-14' AS Date), N'м', N'89155783430')
INSERT [dbo].[Client] ([IdClient], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [GenderCode], [Phone]) VALUES (12, N'Андреев', N'Михаил', N'Русланович', CAST(N'1992-06-12' AS Date), CAST(N'2023-09-26' AS Date), N'м', N'89155984311')
INSERT [dbo].[Client] ([IdClient], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [GenderCode], [Phone]) VALUES (13, N'Кондрашов', N'Адам', N'Ильич', CAST(N'2010-01-09' AS Date), CAST(N'2017-10-05' AS Date), N'м', N'89151318380')
INSERT [dbo].[Client] ([IdClient], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [GenderCode], [Phone]) VALUES (14, N'Гончаров', N'Тимур', N'Львович', CAST(N'1982-06-05' AS Date), CAST(N'2020-11-07' AS Date), N'м', N'89156012506')
INSERT [dbo].[Client] ([IdClient], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [GenderCode], [Phone]) VALUES (15, N'Соколов', N'Михаил', N'Миронович', CAST(N'2005-01-03' AS Date), CAST(N'2019-06-30' AS Date), N'м', N'89158442745')
INSERT [dbo].[Client] ([IdClient], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [GenderCode], [Phone]) VALUES (16, N'Фадеева', N'Елизавета', N'Кирилловна', CAST(N'1980-09-22' AS Date), CAST(N'2019-11-28' AS Date), N'ж', N'89154378591')
INSERT [dbo].[Client] ([IdClient], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [GenderCode], [Phone]) VALUES (17, N'Васильева', N'Елизавета', N'Артёмовна', CAST(N'1994-10-04' AS Date), CAST(N'2023-04-28' AS Date), N'ж', N'89152266061')
INSERT [dbo].[Client] ([IdClient], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [GenderCode], [Phone]) VALUES (18, N'Денисова', N'Александра', N'Александровна', CAST(N'1997-03-23' AS Date), CAST(N'2019-04-24' AS Date), N'ж', N'89156292354')
INSERT [dbo].[Client] ([IdClient], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [GenderCode], [Phone]) VALUES (19, N'Федотова', N'Ульяна', N'Ивановна', CAST(N'1960-06-27' AS Date), CAST(N'2016-02-19' AS Date), N'ж', N'89159847300')
INSERT [dbo].[Client] ([IdClient], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [GenderCode], [Phone]) VALUES (20, N'Лебедева', N'Виктория', N'Владимировна', CAST(N'2001-07-27' AS Date), CAST(N'2020-03-25' AS Date), N'ж', N'89153859766')
INSERT [dbo].[Client] ([IdClient], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [GenderCode], [Phone]) VALUES (21, N'Воробьева', N'Вероника', N'Владиславовна', CAST(N'1961-10-24' AS Date), CAST(N'2015-06-14' AS Date), N'ж', N'89159260987')
INSERT [dbo].[Client] ([IdClient], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [GenderCode], [Phone]) VALUES (22, N'Голубева', N'Полина', N'Степановна', CAST(N'1992-08-06' AS Date), CAST(N'2022-04-21' AS Date), N'ж', N'89151684126')
INSERT [dbo].[Client] ([IdClient], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [GenderCode], [Phone]) VALUES (23, N'Лукьянова', N'Алина', N'Тимуровна', CAST(N'1982-10-14' AS Date), CAST(N'2022-10-25' AS Date), N'ж', N'89151184182')
INSERT [dbo].[Client] ([IdClient], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [GenderCode], [Phone]) VALUES (24, N'Галкина', N'Сафия', N'Елисеевна', CAST(N'1962-06-12' AS Date), CAST(N'2022-11-03' AS Date), N'ж', N'89156844514')
INSERT [dbo].[Client] ([IdClient], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [GenderCode], [Phone]) VALUES (25, N'Астахова', N'Марьям', N'Васильевна', CAST(N'2010-10-03' AS Date), CAST(N'2022-05-03' AS Date), N'ж', N'89154143919')
INSERT [dbo].[Client] ([IdClient], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [GenderCode], [Phone]) VALUES (26, N'Логинова', N'София', N'Ивановна', CAST(N'1972-02-22' AS Date), CAST(N'2021-02-21' AS Date), N'ж', N'89158759020')
INSERT [dbo].[Client] ([IdClient], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [GenderCode], [Phone]) VALUES (27, N'Федосеева', N'Тамара', N'Александровна', CAST(N'1995-08-04' AS Date), CAST(N'2019-09-03' AS Date), N'ж', N'89154965880')
INSERT [dbo].[Client] ([IdClient], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [GenderCode], [Phone]) VALUES (28, N'Фролова', N'Василиса', N'Александровна', CAST(N'2009-06-10' AS Date), CAST(N'2017-03-31' AS Date), N'ж', N'89156591746')
INSERT [dbo].[Client] ([IdClient], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [GenderCode], [Phone]) VALUES (29, N'Соколова', N'София', N'Николаевна', CAST(N'1995-01-17' AS Date), CAST(N'2020-09-21' AS Date), N'ж', N'89156046237')
INSERT [dbo].[Client] ([IdClient], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [GenderCode], [Phone]) VALUES (30, N'Гришина', N'Валерия', N'Ивановна', CAST(N'1994-05-31' AS Date), CAST(N'2016-06-22' AS Date), N'ж', N'89151302613')
INSERT [dbo].[Client] ([IdClient], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [GenderCode], [Phone]) VALUES (31, N'Фомина', N'Милана', N'Романовна', CAST(N'1982-04-13' AS Date), CAST(N'2021-10-09' AS Date), N'ж', N'89150058863')
INSERT [dbo].[Client] ([IdClient], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [GenderCode], [Phone]) VALUES (32, N'Малышева', N'Ульяна', N'Данииловна', CAST(N'1984-09-06' AS Date), CAST(N'2015-09-21' AS Date), N'ж', N'89152269720')
INSERT [dbo].[Client] ([IdClient], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [GenderCode], [Phone]) VALUES (33, N'Петрова', N'Мария', N'Ильинична', CAST(N'1980-05-04' AS Date), CAST(N'2020-03-25' AS Date), N'ж', N'89153595866')
INSERT [dbo].[Client] ([IdClient], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [GenderCode], [Phone]) VALUES (34, N'Попова', N'Таисия', N'Ярославовна', CAST(N'1971-02-06' AS Date), CAST(N'2020-12-12' AS Date), N'ж', N'89159625766')
INSERT [dbo].[Client] ([IdClient], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [GenderCode], [Phone]) VALUES (35, N'Орехова', N'Софья', N'Данииловна', CAST(N'1971-09-17' AS Date), CAST(N'2017-07-24' AS Date), N'ж', N'89156265890')
INSERT [dbo].[Client] ([IdClient], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [GenderCode], [Phone]) VALUES (36, N'Яковлева', N'Злата', N'Георгиевна', CAST(N'1991-10-17' AS Date), CAST(N'2017-05-14' AS Date), N'ж', N'89152709912')
INSERT [dbo].[Client] ([IdClient], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [GenderCode], [Phone]) VALUES (37, N'Ильинская', N'Амелия', N'Ильинична', CAST(N'2001-10-28' AS Date), CAST(N'2021-11-24' AS Date), N'ж', N'89156295955')
INSERT [dbo].[Client] ([IdClient], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [GenderCode], [Phone]) VALUES (38, N'Михайлова', N'Алиса', N'Елисеевна', CAST(N'2007-06-01' AS Date), CAST(N'2018-12-19' AS Date), N'ж', N'89151849517')
INSERT [dbo].[Client] ([IdClient], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [GenderCode], [Phone]) VALUES (39, N'Румянцева', N'Александра', N'Тимофеевна', CAST(N'2011-10-21' AS Date), CAST(N'2015-09-27' AS Date), N'ж', N'89153372373')
INSERT [dbo].[Client] ([IdClient], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [GenderCode], [Phone]) VALUES (40, N'Архипова', N'Елизавета', N'Тимофеевна', CAST(N'1991-06-20' AS Date), CAST(N'2021-12-23' AS Date), N'ж', N'89155455588')
INSERT [dbo].[Client] ([IdClient], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [GenderCode], [Phone]) VALUES (41, N'Цветкова', N'Полина', N'Артёмовна', CAST(N'1968-06-13' AS Date), CAST(N'2019-09-17' AS Date), N'ж', N'89150779238')
INSERT [dbo].[Client] ([IdClient], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [GenderCode], [Phone]) VALUES (42, N'Горелова', N'Аиша', N'Фёдоровна', CAST(N'1981-03-31' AS Date), CAST(N'2023-05-23' AS Date), N'ж', N'89151336508')
INSERT [dbo].[Client] ([IdClient], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [GenderCode], [Phone]) VALUES (43, N'Романова', N'Полина', N'Михайловна', CAST(N'2001-05-24' AS Date), CAST(N'2018-02-14' AS Date), N'ж', N'89153507333')
INSERT [dbo].[Client] ([IdClient], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [GenderCode], [Phone]) VALUES (44, N'Щеглова', N'Элина', N'Фёдоровна', CAST(N'1990-10-08' AS Date), CAST(N'2015-07-17' AS Date), N'ж', N'89157833715')
INSERT [dbo].[Client] ([IdClient], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [GenderCode], [Phone]) VALUES (45, N'Колесникова', N'Алина', N'Николаевна', CAST(N'1982-07-10' AS Date), CAST(N'2017-08-30' AS Date), N'ж', N'89158281575')
INSERT [dbo].[Client] ([IdClient], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [GenderCode], [Phone]) VALUES (46, N'Царева', N'Мирослава', N'Ильинична', CAST(N'1980-01-03' AS Date), CAST(N'2020-06-04' AS Date), N'ж', N'89151836914')
INSERT [dbo].[Client] ([IdClient], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [GenderCode], [Phone]) VALUES (47, N'Кудряшова', N'Софья', N'Егоровна', CAST(N'1983-02-09' AS Date), CAST(N'2023-01-23' AS Date), N'ж', N'89157400839')
INSERT [dbo].[Client] ([IdClient], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [GenderCode], [Phone]) VALUES (48, N'Шубина', N'Анна', N'Михайловна', CAST(N'1990-04-26' AS Date), CAST(N'2023-06-04' AS Date), N'ж', N'89152299448')
INSERT [dbo].[Client] ([IdClient], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [GenderCode], [Phone]) VALUES (49, N'Клюева', N'Екатерина', N'Ивановна', CAST(N'1979-01-05' AS Date), CAST(N'2021-04-17' AS Date), N'ж', N'89156642308')
INSERT [dbo].[Client] ([IdClient], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [GenderCode], [Phone]) VALUES (50, N'Борисова', N'Кира', N'Филипповна', CAST(N'2000-09-13' AS Date), CAST(N'2015-02-04' AS Date), N'ж', N'89158207450')
INSERT [dbo].[Client] ([IdClient], [LastName], [FirstName], [Patronymic], [Birthday], [RegistrationDate], [GenderCode], [Phone]) VALUES (52, N'Александров', N'Евгений', N'Даниилович', CAST(N'2000-12-12' AS Date), CAST(N'2019-05-23' AS Date), N'м', N'84599663022')
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (1, N'Морозов', N'Платон', N'Иванович', CAST(N'1976-06-23' AS Date), N'4944', N'978671', N'м', N'89153275610', N'', N'1', N'1', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (2, N'Бирюков', N'Тимур', N'Григорьевич', CAST(N'1980-07-26' AS Date), N'9984', N'569536', N'м', N'89151482611', N'', N'sporx', N'2708', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (3, N'Соболев', N'Даниил', N'Яковлевич', CAST(N'1983-10-25' AS Date), N'6254', N'670411', N'м', N'89150533243', N'', N'tmacn', N'2928', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (4, N'Иванов', N'Кирилл', N'Егорович', CAST(N'1973-08-27' AS Date), N'7109', N'390177', N'м', N'89155309629', N'', N'qvvtb', N'2116', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (5, N'Михайлов', N'Илья', N'Тимурович', CAST(N'1999-01-29' AS Date), N'4749', N'479483', N'м', N'89155651864', N'qwerty', N'guemt', N'2995', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (6, N'Никольский', N'Артём', N'Георгиевич', CAST(N'1986-10-03' AS Date), N'4660', N'887925', N'м', N'89151227431', N'', N'kurpe', N'249', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (7, N'Комаров', N'Даниил', N'Иванович', CAST(N'1999-11-04' AS Date), N'6517', N'467656', N'м', N'89159581918', N'', N'xnxwm', N'1024', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (8, N'Покровский', N'Мирон', N'Александрович', CAST(N'1971-03-10' AS Date), N'8022', N'780601', N'м', N'89155851141', N'', N'wxlkf', N'1646', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (9, N'Прохоров', N'Даниил', N'Романович', CAST(N'2002-02-28' AS Date), N'4941', N'674071', N'м', N'89151699239', N'', N'jddji', N'4117', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (10, N'Александров', N'Тимофей', N'Даниилович', CAST(N'1982-03-11' AS Date), N'7394', N'435583', N'м', N'89156210634', N'', N'bdfkk', N'1629', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (11, N'Громов', N'Константин', N'Сергеевич', CAST(N'1970-06-19' AS Date), N'7307', N'548685', N'м', N'89158268444', N'', N'knigr', N'270', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (12, N'Фокин', N'Илья', N'Дамирович', CAST(N'1972-01-04' AS Date), N'4703', N'492938', N'м', N'89153915422', N'', N'ihhdq', N'2045', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (13, N'Калинин', N'Адам', N'Артемьевич', CAST(N'2003-10-01' AS Date), N'3116', N'928360', N'м', N'89159242546', N'', N'bjddw', N'3305', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (14, N'Рыжов', N'Михаил', N'Андреевич', CAST(N'1973-10-24' AS Date), N'8914', N'801287', N'м', N'89156822177', N'', N'rnvpp', N'2789', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (15, N'Горюнов', N'Михаил', N'Тимофеевич', CAST(N'1992-01-26' AS Date), N'6735', N'521541', N'м', N'89159484934', N'', N'lqueb', N'844', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (16, N'Смирнов', N'Павел', N'Филиппович', CAST(N'1990-06-30' AS Date), N'3312', N'947144', N'м', N'89152596822', N'', N'wbizd', N'1135', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (17, N'Дьяконов', N'Максим', N'Петрович', CAST(N'1997-11-22' AS Date), N'8103', N'334327', N'м', N'89154600171', N'', N'xwegq', N'2824', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (18, N'Ананьев', N'Максим', N'Михайлович', CAST(N'1994-11-18' AS Date), N'3384', N'846181', N'м', N'89155407188', N'', N'udsds', N'2508', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (19, N'Серебряков', N'Даниэль', N'Семёнович', CAST(N'1984-04-28' AS Date), N'4021', N'923006', N'м', N'89153753097', N'', N'fmgro', N'3609', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (20, N'Бородин', N'Максим', N'Александрович', CAST(N'1989-01-21' AS Date), N'6540', N'730709', N'м', N'89155604922', N'', N'ixzkv', N'884', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (21, N'Шаров', N'Роман', N'Маркович', CAST(N'1984-12-18' AS Date), N'5905', N'708619', N'м', N'89159340168', N'', N'sjmty', N'3064', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (22, N'Романов', N'Георгий', N'Гордеевич', CAST(N'1986-02-06' AS Date), N'5534', N'440074', N'м', N'89150841722', N'', N'lzlem', N'1274', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (23, N'Белоусов', N'Андрей', N'Никитич', CAST(N'1974-11-20' AS Date), N'7804', N'959861', N'м', N'89159840813', N'', N'crttk', N'2598', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (24, N'Колесников', N'Тимофей', N'Иванович', CAST(N'1983-03-22' AS Date), N'7346', N'331862', N'м', N'89158377501', N'', N'owpmu', N'2329', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (25, N'Карасев', N'Пётр', N'Владиславович', CAST(N'1979-10-20' AS Date), N'6122', N'728536', N'м', N'89154655232', N'', N'dfsep', N'4098', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (26, N'Андреева', N'Василиса', N'Данииловна', CAST(N'1997-11-01' AS Date), N'8856', N'918348', N'ж', N'89152730961', N'', N'pdjaz', N'4184', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (27, N'Хохлова', N'Диана', N'Артуровна', CAST(N'1973-02-02' AS Date), N'7970', N'401322', N'ж', N'89155593727', N'', N'rkqhm', N'3989', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (28, N'Шишкина', N'Серафима', N'Максимовна', CAST(N'1980-08-24' AS Date), N'8422', N'758341', N'ж', N'89155431556', N'', N'wjvgp', N'2565', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (29, N'Воронова', N'Софья', N'Юрьевна', CAST(N'1972-09-17' AS Date), N'8273', N'436918', N'ж', N'89151143576', N'', N'ikutu', N'2158', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (30, N'Миронова', N'Вера', N'Ильинична', CAST(N'1998-07-30' AS Date), N'9537', N'622971', N'ж', N'89154984693', N'', N'urfcf', N'3522', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (31, N'Тихомирова', N'Анна', N'Глебовна', CAST(N'2001-11-02' AS Date), N'9056', N'500691', N'ж', N'89154352627', N'', N'vivvf', N'4329', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (32, N'Иванова', N'Маргарита', N'Тимуровна', CAST(N'1971-06-25' AS Date), N'7209', N'665034', N'ж', N'89157132792', N'', N'nbyoj', N'3092', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (33, N'Сидорова', N'Мария', N'Евгеньевна', CAST(N'1994-03-25' AS Date), N'9432', N'438099', N'ж', N'89151726484', N'', N'xqdku', N'3793', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (34, N'Волкова', N'Милана', N'Александровна', CAST(N'2004-03-12' AS Date), N'5699', N'408141', N'ж', N'89158235267', N'', N'ghzza', N'3943', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (35, N'Тимофеева', N'Полина', N'Тимуровна', CAST(N'1987-03-07' AS Date), N'6071', N'371211', N'ж', N'89150296478', N'', N'babzl', N'4338', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (36, N'Попова', N'Милана', N'Романовна', CAST(N'1992-02-07' AS Date), N'5919', N'933019', N'ж', N'89159246175', N'', N'urqtl', N'4292', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (37, N'Королева', N'Аиша', N'Гордеевна', CAST(N'1981-08-25' AS Date), N'8925', N'910890', N'ж', N'89154799648', N'', N'rfqoo', N'857', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (38, N'Анисимова', N'Марьям', N'Григорьевна', CAST(N'1974-11-12' AS Date), N'6275', N'377697', N'ж', N'89157109877', N'', N'dsqfu', N'564', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (39, N'Серебрякова', N'Ольга', N'Сергеевна', CAST(N'1985-04-16' AS Date), N'6397', N'672305', N'ж', N'89159654336', N'', N'mhpxa', N'4842', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (40, N'Павлова', N'Александра', N'Эмировна', CAST(N'1991-05-25' AS Date), N'4713', N'951152', N'ж', N'89156097841', N'', N'uonsj', N'1875', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (41, N'Борисова', N'Юлия', N'Семёновна', CAST(N'2004-05-07' AS Date), N'3940', N'649777', N'ж', N'89152029504', N'', N'hqglx', N'2044', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (42, N'Постникова', N'Анастасия', N'Александровна', CAST(N'1973-06-20' AS Date), N'5135', N'346500', N'ж', N'89152420299', N'', N'kjasq', N'3584', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (43, N'Богомолова', N'Амина', N'Дамировна', CAST(N'1983-07-05' AS Date), N'9802', N'579704', N'ж', N'89156560923', N'', N'nvsmo', N'3163', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (44, N'Алексеева', N'Агния', N'Олеговна', CAST(N'1978-02-13' AS Date), N'4960', N'319564', N'ж', N'89153231744', N'', N'ahspn', N'3999', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (45, N'Филатова', N'Елизавета', N'Николаевна', CAST(N'1997-12-22' AS Date), N'8453', N'410996', N'ж', N'89155690733', N'', N'xkyzi', N'3599', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (46, N'Корнилова', N'Марьяна', N'Степановна', CAST(N'1970-11-03' AS Date), N'8110', N'718393', N'ж', N'89158600502', N'', N'jgxou', N'1463', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (47, N'Кузьмина', N'Анастасия', N'Георгиевна', CAST(N'2001-06-06' AS Date), N'7540', N'321948', N'ж', N'89155814050', N'', N'qrxne', N'4305', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (48, N'Кузнецова', N'Юлия', N'Дамировна', CAST(N'1994-01-22' AS Date), N'4920', N'553600', N'ж', N'89157354704', N'', N'dgrct', N'1998', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (49, N'Суханова', N'Виктория', N'Александровна', CAST(N'1988-08-09' AS Date), N'3975', N'358338', N'ж', N'89157334764', N'', N'bnwee', N'427', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (50, N'Козлова', N'Марьям', N'Ярославовна', CAST(N'1990-04-20' AS Date), N'4887', N'661008', N'ж', N'89152458570', N'', N'wujtg', N'745', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (51, N'Кычев', N'Валентин', N'Валентинович', CAST(N'2000-03-18' AS Date), NULL, NULL, N'м', N'89485948268', NULL, N'11', N'1234', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (52, N'dsdsdsd', N'dsdsd', N'sdsds', CAST(N'2023-11-06' AS Date), NULL, NULL, N'ж', N'78956220122', NULL, N'123', N'1', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (53, N'Бахвалова', N'Анна', N'Алексеевна', CAST(N'2004-08-28' AS Date), NULL, NULL, N'ж', N'8999999999 ', NULL, N'12', N'12', NULL)
INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [GenderCode], [Phone], [Email], [Login], [Password], [IdSpecialization]) VALUES (54, N'Алексеева', N'Александра', N'Александровна', CAST(N'2001-01-01' AS Date), N'1234', N'654321', N'ж', N'84510002369', N'qwerty@mail.ru', N'gt8u', N'7541', NULL)
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
INSERT [dbo].[Gender] ([GenderCode], [Title]) VALUES (N'ж', N'Женский')
INSERT [dbo].[Gender] ([GenderCode], [Title]) VALUES (N'м', N'Мужской')
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([IdOrder], [IdClient], [SaleDate], [FinalCost], [IsPerformed]) VALUES (1, 1, CAST(N'2023-10-12T00:00:00.000' AS DateTime), CAST(1500.00 AS Decimal(8, 2)), 0)
INSERT [dbo].[Order] ([IdOrder], [IdClient], [SaleDate], [FinalCost], [IsPerformed]) VALUES (3, 33, CAST(N'2023-10-29T00:00:00.000' AS DateTime), CAST(140.00 AS Decimal(8, 2)), 0)
INSERT [dbo].[Order] ([IdOrder], [IdClient], [SaleDate], [FinalCost], [IsPerformed]) VALUES (4, 1, CAST(N'2023-10-29T18:00:16.233' AS DateTime), CAST(19328.00 AS Decimal(8, 2)), 1)
INSERT [dbo].[Order] ([IdOrder], [IdClient], [SaleDate], [FinalCost], [IsPerformed]) VALUES (5, 27, CAST(N'2023-10-01T00:00:00.000' AS DateTime), CAST(8200.00 AS Decimal(8, 2)), 1)
INSERT [dbo].[Order] ([IdOrder], [IdClient], [SaleDate], [FinalCost], [IsPerformed]) VALUES (6, 1, CAST(N'2023-10-29T18:00:48.240' AS DateTime), CAST(22486.00 AS Decimal(8, 2)), 1)
INSERT [dbo].[Order] ([IdOrder], [IdClient], [SaleDate], [FinalCost], [IsPerformed]) VALUES (7, 30, CAST(N'2023-10-30T00:00:00.000' AS DateTime), CAST(10000.00 AS Decimal(8, 2)), 0)
INSERT [dbo].[Order] ([IdOrder], [IdClient], [SaleDate], [FinalCost], [IsPerformed]) VALUES (8, 1, CAST(N'2023-10-29T00:00:00.000' AS DateTime), CAST(11759.00 AS Decimal(8, 2)), 0)
INSERT [dbo].[Order] ([IdOrder], [IdClient], [SaleDate], [FinalCost], [IsPerformed]) VALUES (10, 1, CAST(N'2023-11-10T16:04:18.160' AS DateTime), CAST(5962.00 AS Decimal(8, 2)), 1)
INSERT [dbo].[Order] ([IdOrder], [IdClient], [SaleDate], [FinalCost], [IsPerformed]) VALUES (11, 8, CAST(N'2023-11-10T16:53:55.903' AS DateTime), CAST(26400.00 AS Decimal(8, 2)), 1)
INSERT [dbo].[Order] ([IdOrder], [IdClient], [SaleDate], [FinalCost], [IsPerformed]) VALUES (12, 29, CAST(N'2023-11-10T16:54:12.257' AS DateTime), CAST(12988.00 AS Decimal(8, 2)), 1)
INSERT [dbo].[Order] ([IdOrder], [IdClient], [SaleDate], [FinalCost], [IsPerformed]) VALUES (13, 30, CAST(N'2023-11-10T16:54:40.600' AS DateTime), CAST(2750.00 AS Decimal(8, 2)), 1)
INSERT [dbo].[Order] ([IdOrder], [IdClient], [SaleDate], [FinalCost], [IsPerformed]) VALUES (14, 14, CAST(N'2023-11-10T16:55:13.080' AS DateTime), CAST(35825.00 AS Decimal(8, 2)), 1)
INSERT [dbo].[Order] ([IdOrder], [IdClient], [SaleDate], [FinalCost], [IsPerformed]) VALUES (15, 10, CAST(N'2023-11-10T00:00:00.000' AS DateTime), CAST(5912.00 AS Decimal(8, 2)), 1)
INSERT [dbo].[Order] ([IdOrder], [IdClient], [SaleDate], [FinalCost], [IsPerformed]) VALUES (16, 12, CAST(N'2023-11-29T00:00:00.000' AS DateTime), CAST(700.00 AS Decimal(8, 2)), 0)
INSERT [dbo].[Order] ([IdOrder], [IdClient], [SaleDate], [FinalCost], [IsPerformed]) VALUES (17, 17, CAST(N'2023-11-30T00:00:00.000' AS DateTime), CAST(12000.00 AS Decimal(8, 2)), 0)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderProduct] ON 

INSERT [dbo].[OrderProduct] ([IdOrderProduct], [IdOrder], [IdProduct], [Quantity], [PreliminaryCost]) VALUES (1, 3, 7, 2, CAST(6736.00 AS Decimal(7, 2)))
INSERT [dbo].[OrderProduct] ([IdOrderProduct], [IdOrder], [IdProduct], [Quantity], [PreliminaryCost]) VALUES (2, 3, 6, 1, CAST(3444.00 AS Decimal(7, 2)))
INSERT [dbo].[OrderProduct] ([IdOrderProduct], [IdOrder], [IdProduct], [Quantity], [PreliminaryCost]) VALUES (3, 3, 5, 1, CAST(4070.00 AS Decimal(7, 2)))
INSERT [dbo].[OrderProduct] ([IdOrderProduct], [IdOrder], [IdProduct], [Quantity], [PreliminaryCost]) VALUES (4, 4, 7, 3, CAST(10104.00 AS Decimal(7, 2)))
INSERT [dbo].[OrderProduct] ([IdOrderProduct], [IdOrder], [IdProduct], [Quantity], [PreliminaryCost]) VALUES (5, 4, 10, 2, CAST(1202.00 AS Decimal(7, 2)))
INSERT [dbo].[OrderProduct] ([IdOrderProduct], [IdOrder], [IdProduct], [Quantity], [PreliminaryCost]) VALUES (6, 4, 11, 1, CAST(4867.00 AS Decimal(7, 2)))
INSERT [dbo].[OrderProduct] ([IdOrderProduct], [IdOrder], [IdProduct], [Quantity], [PreliminaryCost]) VALUES (7, 4, 9, 1, CAST(2155.00 AS Decimal(7, 2)))
INSERT [dbo].[OrderProduct] ([IdOrderProduct], [IdOrder], [IdProduct], [Quantity], [PreliminaryCost]) VALUES (8, 6, 14, 1, CAST(4587.00 AS Decimal(7, 2)))
INSERT [dbo].[OrderProduct] ([IdOrderProduct], [IdOrder], [IdProduct], [Quantity], [PreliminaryCost]) VALUES (9, 6, 15, 1, CAST(2388.00 AS Decimal(7, 2)))
INSERT [dbo].[OrderProduct] ([IdOrderProduct], [IdOrder], [IdProduct], [Quantity], [PreliminaryCost]) VALUES (10, 6, 13, 1, CAST(4374.00 AS Decimal(7, 2)))
INSERT [dbo].[OrderProduct] ([IdOrderProduct], [IdOrder], [IdProduct], [Quantity], [PreliminaryCost]) VALUES (11, 6, 18, 1, CAST(2071.00 AS Decimal(7, 2)))
INSERT [dbo].[OrderProduct] ([IdOrderProduct], [IdOrder], [IdProduct], [Quantity], [PreliminaryCost]) VALUES (12, 6, 17, 1, CAST(2175.00 AS Decimal(7, 2)))
INSERT [dbo].[OrderProduct] ([IdOrderProduct], [IdOrder], [IdProduct], [Quantity], [PreliminaryCost]) VALUES (13, 6, 20, 1, CAST(2238.00 AS Decimal(7, 2)))
INSERT [dbo].[OrderProduct] ([IdOrderProduct], [IdOrder], [IdProduct], [Quantity], [PreliminaryCost]) VALUES (14, 6, 19, 1, CAST(3153.00 AS Decimal(7, 2)))
INSERT [dbo].[OrderProduct] ([IdOrderProduct], [IdOrder], [IdProduct], [Quantity], [PreliminaryCost]) VALUES (15, 8, 10, 4, CAST(2404.00 AS Decimal(7, 2)))
INSERT [dbo].[OrderProduct] ([IdOrderProduct], [IdOrder], [IdProduct], [Quantity], [PreliminaryCost]) VALUES (16, 8, 9, 1, CAST(2155.00 AS Decimal(7, 2)))
INSERT [dbo].[OrderProduct] ([IdOrderProduct], [IdOrder], [IdProduct], [Quantity], [PreliminaryCost]) VALUES (17, 10, 3, 1, CAST(4462.00 AS Decimal(7, 2)))
INSERT [dbo].[OrderProduct] ([IdOrderProduct], [IdOrder], [IdProduct], [Quantity], [PreliminaryCost]) VALUES (18, 11, 6, 1, CAST(3444.00 AS Decimal(7, 2)))
INSERT [dbo].[OrderProduct] ([IdOrderProduct], [IdOrder], [IdProduct], [Quantity], [PreliminaryCost]) VALUES (19, 11, 5, 1, CAST(4070.00 AS Decimal(7, 2)))
INSERT [dbo].[OrderProduct] ([IdOrderProduct], [IdOrder], [IdProduct], [Quantity], [PreliminaryCost]) VALUES (20, 11, 3, 3, CAST(13386.00 AS Decimal(7, 2)))
INSERT [dbo].[OrderProduct] ([IdOrderProduct], [IdOrder], [IdProduct], [Quantity], [PreliminaryCost]) VALUES (21, 12, 10, 2, CAST(1202.00 AS Decimal(7, 2)))
INSERT [dbo].[OrderProduct] ([IdOrderProduct], [IdOrder], [IdProduct], [Quantity], [PreliminaryCost]) VALUES (22, 12, 9, 2, CAST(4310.00 AS Decimal(7, 2)))
INSERT [dbo].[OrderProduct] ([IdOrderProduct], [IdOrder], [IdProduct], [Quantity], [PreliminaryCost]) VALUES (23, 12, 8, 2, CAST(2806.00 AS Decimal(7, 2)))
INSERT [dbo].[OrderProduct] ([IdOrderProduct], [IdOrder], [IdProduct], [Quantity], [PreliminaryCost]) VALUES (24, 12, 12, 1, CAST(4670.00 AS Decimal(7, 2)))
INSERT [dbo].[OrderProduct] ([IdOrderProduct], [IdOrder], [IdProduct], [Quantity], [PreliminaryCost]) VALUES (25, 14, 5, 1, CAST(4070.00 AS Decimal(7, 2)))
INSERT [dbo].[OrderProduct] ([IdOrderProduct], [IdOrder], [IdProduct], [Quantity], [PreliminaryCost]) VALUES (26, 14, 12, 2, CAST(9340.00 AS Decimal(7, 2)))
INSERT [dbo].[OrderProduct] ([IdOrderProduct], [IdOrder], [IdProduct], [Quantity], [PreliminaryCost]) VALUES (27, 14, 13, 1, CAST(4374.00 AS Decimal(7, 2)))
INSERT [dbo].[OrderProduct] ([IdOrderProduct], [IdOrder], [IdProduct], [Quantity], [PreliminaryCost]) VALUES (28, 14, 15, 1, CAST(2388.00 AS Decimal(7, 2)))
INSERT [dbo].[OrderProduct] ([IdOrderProduct], [IdOrder], [IdProduct], [Quantity], [PreliminaryCost]) VALUES (29, 14, 19, 1, CAST(3153.00 AS Decimal(7, 2)))
INSERT [dbo].[OrderProduct] ([IdOrderProduct], [IdOrder], [IdProduct], [Quantity], [PreliminaryCost]) VALUES (30, 15, 6, 1, CAST(3444.00 AS Decimal(7, 2)))
INSERT [dbo].[OrderProduct] ([IdOrderProduct], [IdOrder], [IdProduct], [Quantity], [PreliminaryCost]) VALUES (31, 15, 7, 1, CAST(368.00 AS Decimal(7, 2)))
SET IDENTITY_INSERT [dbo].[OrderProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderService] ON 

INSERT [dbo].[OrderService] ([IdOrderService], [IdOrder], [IdService], [IdEmployee]) VALUES (1, 4, 3, 1)
INSERT [dbo].[OrderService] ([IdOrderService], [IdOrder], [IdService], [IdEmployee]) VALUES (2, 5, 3, 1)
INSERT [dbo].[OrderService] ([IdOrderService], [IdOrder], [IdService], [IdEmployee]) VALUES (3, 5, 2, 1)
INSERT [dbo].[OrderService] ([IdOrderService], [IdOrder], [IdService], [IdEmployee]) VALUES (4, 6, 1, 1)
INSERT [dbo].[OrderService] ([IdOrderService], [IdOrder], [IdService], [IdEmployee]) VALUES (5, 8, 2, 1)
INSERT [dbo].[OrderService] ([IdOrderService], [IdOrder], [IdService], [IdEmployee]) VALUES (6, 10, 1, 1)
INSERT [dbo].[OrderService] ([IdOrderService], [IdOrder], [IdService], [IdEmployee]) VALUES (7, 11, 3, 19)
INSERT [dbo].[OrderService] ([IdOrderService], [IdOrder], [IdService], [IdEmployee]) VALUES (8, 11, 4, 19)
INSERT [dbo].[OrderService] ([IdOrderService], [IdOrder], [IdService], [IdEmployee]) VALUES (9, 11, 9, 19)
INSERT [dbo].[OrderService] ([IdOrderService], [IdOrder], [IdService], [IdEmployee]) VALUES (10, 13, 12, 27)
INSERT [dbo].[OrderService] ([IdOrderService], [IdOrder], [IdService], [IdEmployee]) VALUES (11, 13, 12, 27)
INSERT [dbo].[OrderService] ([IdOrderService], [IdOrder], [IdService], [IdEmployee]) VALUES (12, 13, 12, 27)
INSERT [dbo].[OrderService] ([IdOrderService], [IdOrder], [IdService], [IdEmployee]) VALUES (13, 13, 12, 27)
INSERT [dbo].[OrderService] ([IdOrderService], [IdOrder], [IdService], [IdEmployee]) VALUES (14, 13, 12, 27)
INSERT [dbo].[OrderService] ([IdOrderService], [IdOrder], [IdService], [IdEmployee]) VALUES (15, 13, 13, 27)
INSERT [dbo].[OrderService] ([IdOrderService], [IdOrder], [IdService], [IdEmployee]) VALUES (16, 13, 13, 27)
INSERT [dbo].[OrderService] ([IdOrderService], [IdOrder], [IdService], [IdEmployee]) VALUES (17, 13, 14, 27)
INSERT [dbo].[OrderService] ([IdOrderService], [IdOrder], [IdService], [IdEmployee]) VALUES (18, 13, 17, 27)
INSERT [dbo].[OrderService] ([IdOrderService], [IdOrder], [IdService], [IdEmployee]) VALUES (19, 13, 1, 27)
INSERT [dbo].[OrderService] ([IdOrderService], [IdOrder], [IdService], [IdEmployee]) VALUES (20, 14, 11, 43)
INSERT [dbo].[OrderService] ([IdOrderService], [IdOrder], [IdService], [IdEmployee]) VALUES (21, 14, 10, 43)
INSERT [dbo].[OrderService] ([IdOrderService], [IdOrder], [IdService], [IdEmployee]) VALUES (22, 14, 9, 43)
INSERT [dbo].[OrderService] ([IdOrderService], [IdOrder], [IdService], [IdEmployee]) VALUES (23, 14, 13, 43)
INSERT [dbo].[OrderService] ([IdOrderService], [IdOrder], [IdService], [IdEmployee]) VALUES (24, 14, 18, 43)
INSERT [dbo].[OrderService] ([IdOrderService], [IdOrder], [IdService], [IdEmployee]) VALUES (25, 14, 17, 43)
INSERT [dbo].[OrderService] ([IdOrderService], [IdOrder], [IdService], [IdEmployee]) VALUES (26, 15, 4, 27)
INSERT [dbo].[OrderService] ([IdOrderService], [IdOrder], [IdService], [IdEmployee]) VALUES (27, 15, 4, 27)
INSERT [dbo].[OrderService] ([IdOrderService], [IdOrder], [IdService], [IdEmployee]) VALUES (28, 15, 1, 27)
INSERT [dbo].[OrderService] ([IdOrderService], [IdOrder], [IdService], [IdEmployee]) VALUES (29, 16, 3, 27)
SET IDENTITY_INSERT [dbo].[OrderService] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([IdProduct], [Title], [Cost], [IdCategoryProduct], [QuantityInStock]) VALUES (1, N'Пенка для умывания ', CAST(845.00 AS Decimal(6, 2)), 4, 200)
INSERT [dbo].[Product] ([IdProduct], [Title], [Cost], [IdCategoryProduct], [QuantityInStock]) VALUES (2, N'Мицеллярная вода', CAST(1459.00 AS Decimal(6, 2)), 1, 883)
INSERT [dbo].[Product] ([IdProduct], [Title], [Cost], [IdCategoryProduct], [QuantityInStock]) VALUES (3, N'Гель для умывания', CAST(3462.00 AS Decimal(6, 2)), 1, 928)
INSERT [dbo].[Product] ([IdProduct], [Title], [Cost], [IdCategoryProduct], [QuantityInStock]) VALUES (4, N'Гидрофильное масло', CAST(4111.00 AS Decimal(6, 2)), 1, 429)
INSERT [dbo].[Product] ([IdProduct], [Title], [Cost], [IdCategoryProduct], [QuantityInStock]) VALUES (5, N'Скраб ', CAST(4070.00 AS Decimal(6, 2)), 1, 948)
INSERT [dbo].[Product] ([IdProduct], [Title], [Cost], [IdCategoryProduct], [QuantityInStock]) VALUES (6, N'АЛТАЙСКИЙ ЭЛИКСИР', CAST(3444.00 AS Decimal(6, 2)), 2, 177)
INSERT [dbo].[Product] ([IdProduct], [Title], [Cost], [IdCategoryProduct], [QuantityInStock]) VALUES (7, N'АПИЛАК', CAST(368.00 AS Decimal(6, 2)), 2, 100)
INSERT [dbo].[Product] ([IdProduct], [Title], [Cost], [IdCategoryProduct], [QuantityInStock]) VALUES (8, N'АПИЛАК ГРИНДЕКС', CAST(1403.00 AS Decimal(6, 2)), 2, 70)
INSERT [dbo].[Product] ([IdProduct], [Title], [Cost], [IdCategoryProduct], [QuantityInStock]) VALUES (9, N'ВЕЛСОН', CAST(2155.00 AS Decimal(6, 2)), 2, 280)
INSERT [dbo].[Product] ([IdProduct], [Title], [Cost], [IdCategoryProduct], [QuantityInStock]) VALUES (10, N'КЕДРОВИТ', CAST(601.00 AS Decimal(6, 2)), 2, 931)
INSERT [dbo].[Product] ([IdProduct], [Title], [Cost], [IdCategoryProduct], [QuantityInStock]) VALUES (11, N'КОФЕИН БЕНЗОАТ НАТРИЯ', CAST(4867.00 AS Decimal(6, 2)), 2, 708)
INSERT [dbo].[Product] ([IdProduct], [Title], [Cost], [IdCategoryProduct], [QuantityInStock]) VALUES (12, N'МЕЛАКСЕН', CAST(4670.00 AS Decimal(6, 2)), 2, 593)
INSERT [dbo].[Product] ([IdProduct], [Title], [Cost], [IdCategoryProduct], [QuantityInStock]) VALUES (13, N'Шампунь', CAST(4374.00 AS Decimal(6, 2)), 8, 980)
INSERT [dbo].[Product] ([IdProduct], [Title], [Cost], [IdCategoryProduct], [QuantityInStock]) VALUES (14, N'Кондиционер', CAST(4587.00 AS Decimal(6, 2)), 8, 333)
INSERT [dbo].[Product] ([IdProduct], [Title], [Cost], [IdCategoryProduct], [QuantityInStock]) VALUES (15, N'Маска для волос', CAST(2388.00 AS Decimal(6, 2)), 8, 804)
INSERT [dbo].[Product] ([IdProduct], [Title], [Cost], [IdCategoryProduct], [QuantityInStock]) VALUES (16, N'Эссенция для волос', CAST(1854.00 AS Decimal(6, 2)), 8, 63)
INSERT [dbo].[Product] ([IdProduct], [Title], [Cost], [IdCategoryProduct], [QuantityInStock]) VALUES (17, N'Масло для волос ', CAST(2175.00 AS Decimal(6, 2)), 8, 741)
INSERT [dbo].[Product] ([IdProduct], [Title], [Cost], [IdCategoryProduct], [QuantityInStock]) VALUES (18, N'Сыворотка для волос ', CAST(2071.00 AS Decimal(6, 2)), 8, 466)
INSERT [dbo].[Product] ([IdProduct], [Title], [Cost], [IdCategoryProduct], [QuantityInStock]) VALUES (19, N'Филлер для волос', CAST(3153.00 AS Decimal(6, 2)), 8, 111)
INSERT [dbo].[Product] ([IdProduct], [Title], [Cost], [IdCategoryProduct], [QuantityInStock]) VALUES (20, N'Спрей для волос', CAST(2238.00 AS Decimal(6, 2)), 8, 509)
INSERT [dbo].[Product] ([IdProduct], [Title], [Cost], [IdCategoryProduct], [QuantityInStock]) VALUES (21, N'Маникюрные ножницы', CAST(100.00 AS Decimal(6, 2)), 6, 12000)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([IdService], [Title], [IdCategory], [Description], [Cost], [DurationInMinute]) VALUES (1, N'Мужской классический маникюр', 1, N'Мужской классический маникюр', CAST(1000.00 AS Decimal(7, 2)), 20)
INSERT [dbo].[Service] ([IdService], [Title], [IdCategory], [Description], [Cost], [DurationInMinute]) VALUES (2, N'Маникюр классический без покрытия ', 1, N'Маникюр', CAST(800.00 AS Decimal(7, 2)), 40)
INSERT [dbo].[Service] ([IdService], [Title], [IdCategory], [Description], [Cost], [DurationInMinute]) VALUES (3, N'Покрытие база + топ', 2, N'Покрытие', CAST(700.00 AS Decimal(7, 2)), 70)
INSERT [dbo].[Service] ([IdService], [Title], [IdCategory], [Description], [Cost], [DurationInMinute]) VALUES (4, N'Маникюр классический', 1, N'Стандарт', CAST(300.00 AS Decimal(7, 2)), 30)
INSERT [dbo].[Service] ([IdService], [Title], [IdCategory], [Description], [Cost], [DurationInMinute]) VALUES (5, N'Полировка ногтей', 2, N'Полировка ногтей', CAST(500.00 AS Decimal(7, 2)), 60)
INSERT [dbo].[Service] ([IdService], [Title], [IdCategory], [Description], [Cost], [DurationInMinute]) VALUES (6, N'Укрепление акриловой пудрой 1 ногтя', 3, N'Укрепление акриловой пудрой 1 ногтя', CAST(50.00 AS Decimal(7, 2)), 5)
INSERT [dbo].[Service] ([IdService], [Title], [IdCategory], [Description], [Cost], [DurationInMinute]) VALUES (7, N'Педикюр классический/аппаратный', 4, N'Педикюр классический/аппаратный', CAST(1150.00 AS Decimal(7, 2)), 40)
INSERT [dbo].[Service] ([IdService], [Title], [IdCategory], [Description], [Cost], [DurationInMinute]) VALUES (8, N'Детский педикюр (до 7 лет)', 4, N'Детский педикюр (до 7 лет)', CAST(500.00 AS Decimal(7, 2)), 30)
INSERT [dbo].[Service] ([IdService], [Title], [IdCategory], [Description], [Cost], [DurationInMinute]) VALUES (9, N'Установка корректировки ногтей (титановая нить)', 5, N'Установка корректировки ногтей (титановая нить)', CAST(4500.00 AS Decimal(7, 2)), 120)
INSERT [dbo].[Service] ([IdService], [Title], [IdCategory], [Description], [Cost], [DurationInMinute]) VALUES (10, N'Коррекция титановой нити', 4, N'Коррекция титановой нити', CAST(3000.00 AS Decimal(7, 2)), 60)
INSERT [dbo].[Service] ([IdService], [Title], [IdCategory], [Description], [Cost], [DurationInMinute]) VALUES (11, N'Уход за руками/ногами (10 мин.)', 6, N'Уход за руками/ногами (10 мин.)', CAST(600.00 AS Decimal(7, 2)), 20)
INSERT [dbo].[Service] ([IdService], [Title], [IdCategory], [Description], [Cost], [DurationInMinute]) VALUES (12, N'Простой (1 палец)', 7, N'Простой (1 палец)', CAST(100.00 AS Decimal(7, 2)), 5)
INSERT [dbo].[Service] ([IdService], [Title], [IdCategory], [Description], [Cost], [DurationInMinute]) VALUES (13, N'Cложный (1 палец)', 7, N'Cложный (1 палец)', CAST(300.00 AS Decimal(7, 2)), 24)
INSERT [dbo].[Service] ([IdService], [Title], [IdCategory], [Description], [Cost], [DurationInMinute]) VALUES (14, N'Втирка', 7, N'Втирка', CAST(50.00 AS Decimal(7, 2)), 2)
INSERT [dbo].[Service] ([IdService], [Title], [IdCategory], [Description], [Cost], [DurationInMinute]) VALUES (15, N'Наращивание 1 ногтя', 8, N'Наращивание 1 ногтя', CAST(350.00 AS Decimal(7, 2)), 20)
INSERT [dbo].[Service] ([IdService], [Title], [IdCategory], [Description], [Cost], [DurationInMinute]) VALUES (16, N'Ремонт ногтей (акрил, гель)', 8, N'Ремонт ногтей (акрил, гель)', CAST(200.00 AS Decimal(7, 2)), 10)
INSERT [dbo].[Service] ([IdService], [Title], [IdCategory], [Description], [Cost], [DurationInMinute]) VALUES (17, N'Снятие лака', 8, N'Снятие лака', CAST(100.00 AS Decimal(7, 2)), 10)
INSERT [dbo].[Service] ([IdService], [Title], [IdCategory], [Description], [Cost], [DurationInMinute]) VALUES (18, N'Услуга в 8 рук', 8, N'Услуга в 8 рук', CAST(4000.00 AS Decimal(7, 2)), 120)
INSERT [dbo].[Service] ([IdService], [Title], [IdCategory], [Description], [Cost], [DurationInMinute]) VALUES (19, N'Укрепление натуральных ногтей на свою длину', 3, N'Укрепление натуральных ногтей на свою длину', CAST(2000.00 AS Decimal(7, 2)), 30)
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
SET IDENTITY_INSERT [dbo].[Specialization] ON 

INSERT [dbo].[Specialization] ([IdSpecialization], [Title], [Salary]) VALUES (1, N'Директор', CAST(150000.00 AS Decimal(8, 2)))
INSERT [dbo].[Specialization] ([IdSpecialization], [Title], [Salary]) VALUES (2, N'Администратор', CAST(78000.00 AS Decimal(8, 2)))
INSERT [dbo].[Specialization] ([IdSpecialization], [Title], [Salary]) VALUES (3, N'Продавец', CAST(45000.00 AS Decimal(8, 2)))
INSERT [dbo].[Specialization] ([IdSpecialization], [Title], [Salary]) VALUES (4, N'Мастер маникюра', CAST(55000.00 AS Decimal(8, 2)))
INSERT [dbo].[Specialization] ([IdSpecialization], [Title], [Salary]) VALUES (5, N'Мастер педикюра', CAST(60000.00 AS Decimal(8, 2)))
INSERT [dbo].[Specialization] ([IdSpecialization], [Title], [Salary]) VALUES (6, N'Колорист', CAST(64000.00 AS Decimal(8, 2)))
INSERT [dbo].[Specialization] ([IdSpecialization], [Title], [Salary]) VALUES (7, N'Парикмахер', CAST(57000.00 AS Decimal(8, 2)))
INSERT [dbo].[Specialization] ([IdSpecialization], [Title], [Salary]) VALUES (8, N'Мастер перманентного макияжа', CAST(80000.00 AS Decimal(8, 2)))
INSERT [dbo].[Specialization] ([IdSpecialization], [Title], [Salary]) VALUES (9, N'Татуировщик', CAST(80000.00 AS Decimal(8, 2)))
INSERT [dbo].[Specialization] ([IdSpecialization], [Title], [Salary]) VALUES (10, N'SPA-специалист', CAST(60000.00 AS Decimal(8, 2)))
INSERT [dbo].[Specialization] ([IdSpecialization], [Title], [Salary]) VALUES (11, N'Массажист', CAST(40000.00 AS Decimal(8, 2)))
INSERT [dbo].[Specialization] ([IdSpecialization], [Title], [Salary]) VALUES (12, N'Визажист', CAST(50000.00 AS Decimal(8, 2)))
INSERT [dbo].[Specialization] ([IdSpecialization], [Title], [Salary]) VALUES (13, N'Косметолог', CAST(70000.00 AS Decimal(8, 2)))
SET IDENTITY_INSERT [dbo].[Specialization] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Client]    Script Date: 10.11.2023 19:20:53 ******/
ALTER TABLE [dbo].[Client] ADD  CONSTRAINT [IX_Client] UNIQUE NONCLUSTERED 
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Employee]    Script Date: 10.11.2023 19:20:53 ******/
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [IX_Employee] UNIQUE NONCLUSTERED 
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_SaleDate]  DEFAULT (getdate()) FOR [SaleDate]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_IsPerformed]  DEFAULT ((0)) FOR [IsPerformed]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Gender] FOREIGN KEY([GenderCode])
REFERENCES [dbo].[Gender] ([GenderCode])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_Gender]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Gender] FOREIGN KEY([GenderCode])
REFERENCES [dbo].[Gender] ([GenderCode])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Gender]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Specialization] FOREIGN KEY([IdSpecialization])
REFERENCES [dbo].[Specialization] ([IdSpecialization])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Specialization]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Client] FOREIGN KEY([IdClient])
REFERENCES [dbo].[Client] ([IdClient])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Client]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Order] FOREIGN KEY([IdOrder])
REFERENCES [dbo].[Order] ([IdOrder])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Order]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Product] FOREIGN KEY([IdProduct])
REFERENCES [dbo].[Product] ([IdProduct])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Product]
GO
ALTER TABLE [dbo].[OrderService]  WITH CHECK ADD  CONSTRAINT [FK_OrderService_Employee] FOREIGN KEY([IdEmployee])
REFERENCES [dbo].[Employee] ([IdEmployee])
GO
ALTER TABLE [dbo].[OrderService] CHECK CONSTRAINT [FK_OrderService_Employee]
GO
ALTER TABLE [dbo].[OrderService]  WITH CHECK ADD  CONSTRAINT [FK_OrderService_Order] FOREIGN KEY([IdOrder])
REFERENCES [dbo].[Order] ([IdOrder])
GO
ALTER TABLE [dbo].[OrderService] CHECK CONSTRAINT [FK_OrderService_Order]
GO
ALTER TABLE [dbo].[OrderService]  WITH CHECK ADD  CONSTRAINT [FK_OrderService_Service] FOREIGN KEY([IdService])
REFERENCES [dbo].[Service] ([IdService])
GO
ALTER TABLE [dbo].[OrderService] CHECK CONSTRAINT [FK_OrderService_Service]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_CategoryProduct] FOREIGN KEY([IdCategoryProduct])
REFERENCES [dbo].[CategoryProduct] ([IdCategoryProduct])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_CategoryProduct]
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_Category] FOREIGN KEY([IdCategory])
REFERENCES [dbo].[Category] ([IdCategory])
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_Service_Category]
GO
USE [master]
GO
ALTER DATABASE [BeautySalon] SET  READ_WRITE 
GO
