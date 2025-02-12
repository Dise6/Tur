USE [master]
GO
/****** Object:  Database [Tur Base Aldonin]    Script Date: 03.06.2024 13:37:13 ******/
CREATE DATABASE [Tur Base Aldonin]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Tur Base Aldonin', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Tur Base Aldonin.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'Tur Base Aldonin_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Tur Base Aldonin_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Tur Base Aldonin] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Tur Base Aldonin].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Tur Base Aldonin] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Tur Base Aldonin] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Tur Base Aldonin] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Tur Base Aldonin] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Tur Base Aldonin] SET ARITHABORT OFF 
GO
ALTER DATABASE [Tur Base Aldonin] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Tur Base Aldonin] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Tur Base Aldonin] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Tur Base Aldonin] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Tur Base Aldonin] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Tur Base Aldonin] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Tur Base Aldonin] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Tur Base Aldonin] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Tur Base Aldonin] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Tur Base Aldonin] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Tur Base Aldonin] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Tur Base Aldonin] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Tur Base Aldonin] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Tur Base Aldonin] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Tur Base Aldonin] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Tur Base Aldonin] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Tur Base Aldonin] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Tur Base Aldonin] SET RECOVERY FULL 
GO
ALTER DATABASE [Tur Base Aldonin] SET  MULTI_USER 
GO
ALTER DATABASE [Tur Base Aldonin] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Tur Base Aldonin] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Tur Base Aldonin] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Tur Base Aldonin] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Tur Base Aldonin]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 03.06.2024 13:37:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[code] [nchar](2) NOT NULL,
	[Name] [nvarchar](100) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 03.06.2024 13:37:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[CountOfStars] [int] NULL,
	[CountryCode] [nchar](2) NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelComment]    Script Date: 03.06.2024 13:37:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelComment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[HotelId] [int] NULL,
	[Text] [nvarchar](max) NULL,
	[Author] [nvarchar](100) NULL,
	[GreationDate] [datetime] NULL,
 CONSTRAINT [PK_HotelComment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelImage]    Script Date: 03.06.2024 13:37:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelImage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[HotelId] [int] NULL,
	[ImageSource] [varbinary](100) NULL,
 CONSTRAINT [PK_HotelImage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelofTour]    Script Date: 03.06.2024 13:37:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelofTour](
	[HotelId] [int] NOT NULL,
	[TourId] [int] NOT NULL,
 CONSTRAINT [PK_HotelofTour] PRIMARY KEY CLUSTERED 
(
	[HotelId] ASC,
	[TourId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tour]    Script Date: 03.06.2024 13:37:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tour](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TicketCount] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ImagePrewiew] [varbinary](max) NULL,
	[Price] [money] NOT NULL,
	[IsActual] [bit] NOT NULL,
 CONSTRAINT [PK_Tour] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 03.06.2024 13:37:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeofTour]    Script Date: 03.06.2024 13:37:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeofTour](
	[TourId] [int] NOT NULL,
	[TypeId] [int] NOT NULL,
 CONSTRAINT [PK_TypeofTour] PRIMARY KEY CLUSTERED 
(
	[TourId] ASC,
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Country] ([code], [Name]) VALUES (N'ch', N'Китай')
INSERT [dbo].[Country] ([code], [Name]) VALUES (N'en', N'Англия')
INSERT [dbo].[Country] ([code], [Name]) VALUES (N'ru', N'Россия')
GO
SET IDENTITY_INSERT [dbo].[Hotel] ON 

INSERT [dbo].[Hotel] ([id], [Name], [CountOfStars], [CountryCode]) VALUES (1, N'Космос', 5, N'ru')
INSERT [dbo].[Hotel] ([id], [Name], [CountOfStars], [CountryCode]) VALUES (2, N'Украина', 5, N'ru')
INSERT [dbo].[Hotel] ([id], [Name], [CountOfStars], [CountryCode]) VALUES (3, NULL, NULL, N'ru')
INSERT [dbo].[Hotel] ([id], [Name], [CountOfStars], [CountryCode]) VALUES (4, N'Four Seasons', 5, N'ru')
INSERT [dbo].[Hotel] ([id], [Name], [CountOfStars], [CountryCode]) VALUES (5, N'Тереза', 5, N'ch')
INSERT [dbo].[Hotel] ([id], [Name], [CountOfStars], [CountryCode]) VALUES (6, N'', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Hotel] OFF
GO
SET IDENTITY_INSERT [dbo].[HotelComment] ON 

INSERT [dbo].[HotelComment] ([id], [HotelId], [Text], [Author], [GreationDate]) VALUES (17, 1, N'Замечательный', N'Иванов Иван', CAST(N'2024-02-17T00:00:00.000' AS DateTime))
INSERT [dbo].[HotelComment] ([id], [HotelId], [Text], [Author], [GreationDate]) VALUES (18, 2, N'Лучший отель', N'Джон Дое', CAST(N'2024-02-17T00:00:00.000' AS DateTime))
INSERT [dbo].[HotelComment] ([id], [HotelId], [Text], [Author], [GreationDate]) VALUES (19, 3, N'Есть к чему стремиться', N'Мария', CAST(N'2024-02-17T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[HotelComment] OFF
GO
INSERT [dbo].[HotelofTour] ([HotelId], [TourId]) VALUES (1, 14)
INSERT [dbo].[HotelofTour] ([HotelId], [TourId]) VALUES (2, 16)
INSERT [dbo].[HotelofTour] ([HotelId], [TourId]) VALUES (4, 17)
INSERT [dbo].[HotelofTour] ([HotelId], [TourId]) VALUES (5, 18)
GO
SET IDENTITY_INSERT [dbo].[Tour] ON 

INSERT [dbo].[Tour] ([id], [TicketCount], [Name], [Description], [ImagePrewiew], [Price], [IsActual]) VALUES (14, 127, N'Болгарское наследие', NULL, NULL, 35700.0000, 1)
INSERT [dbo].[Tour] ([id], [TicketCount], [Name], [Description], [ImagePrewiew], [Price], [IsActual]) VALUES (16, 92, N'Волшебный Восток', NULL, NULL, 77100.0000, 1)
INSERT [dbo].[Tour] ([id], [TicketCount], [Name], [Description], [ImagePrewiew], [Price], [IsActual]) VALUES (17, 72, N'Город с большими огнями', NULL, NULL, 93300.0000, 1)
INSERT [dbo].[Tour] ([id], [TicketCount], [Name], [Description], [ImagePrewiew], [Price], [IsActual]) VALUES (18, 143, N'Город четырех ветров', NULL, NULL, 72500.0000, 0)
SET IDENTITY_INSERT [dbo].[Tour] OFF
GO
SET IDENTITY_INSERT [dbo].[Type] ON 

INSERT [dbo].[Type] ([id], [Name], [Description]) VALUES (1, N'международынй', NULL)
INSERT [dbo].[Type] ([id], [Name], [Description]) VALUES (2, N'внутренний', NULL)
INSERT [dbo].[Type] ([id], [Name], [Description]) VALUES (3, N'специализированный детский', NULL)
INSERT [dbo].[Type] ([id], [Name], [Description]) VALUES (4, N'лечебно-оздоровитеьный', NULL)
INSERT [dbo].[Type] ([id], [Name], [Description]) VALUES (5, N'культурно-исторический', NULL)
SET IDENTITY_INSERT [dbo].[Type] OFF
GO
INSERT [dbo].[TypeofTour] ([TourId], [TypeId]) VALUES (14, 1)
INSERT [dbo].[TypeofTour] ([TourId], [TypeId]) VALUES (16, 2)
INSERT [dbo].[TypeofTour] ([TourId], [TypeId]) VALUES (17, 3)
INSERT [dbo].[TypeofTour] ([TourId], [TypeId]) VALUES (18, 4)
GO
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Hotel_Country] FOREIGN KEY([CountryCode])
REFERENCES [dbo].[Country] ([code])
GO
ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [FK_Hotel_Country]
GO
ALTER TABLE [dbo].[HotelComment]  WITH CHECK ADD  CONSTRAINT [FK_HotelComment_Hotel] FOREIGN KEY([HotelId])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[HotelComment] CHECK CONSTRAINT [FK_HotelComment_Hotel]
GO
ALTER TABLE [dbo].[HotelImage]  WITH CHECK ADD  CONSTRAINT [FK_HotelImage_Hotel] FOREIGN KEY([HotelId])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[HotelImage] CHECK CONSTRAINT [FK_HotelImage_Hotel]
GO
ALTER TABLE [dbo].[HotelofTour]  WITH CHECK ADD  CONSTRAINT [FK_HotelofTour_Hotel] FOREIGN KEY([HotelId])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[HotelofTour] CHECK CONSTRAINT [FK_HotelofTour_Hotel]
GO
ALTER TABLE [dbo].[HotelofTour]  WITH CHECK ADD  CONSTRAINT [FK_HotelofTour_Tour] FOREIGN KEY([TourId])
REFERENCES [dbo].[Tour] ([id])
GO
ALTER TABLE [dbo].[HotelofTour] CHECK CONSTRAINT [FK_HotelofTour_Tour]
GO
ALTER TABLE [dbo].[TypeofTour]  WITH CHECK ADD  CONSTRAINT [FK_TypeofTour_Tour1] FOREIGN KEY([TourId])
REFERENCES [dbo].[Tour] ([id])
GO
ALTER TABLE [dbo].[TypeofTour] CHECK CONSTRAINT [FK_TypeofTour_Tour1]
GO
ALTER TABLE [dbo].[TypeofTour]  WITH CHECK ADD  CONSTRAINT [FK_TypeofTour_Type1] FOREIGN KEY([TypeId])
REFERENCES [dbo].[Type] ([id])
GO
ALTER TABLE [dbo].[TypeofTour] CHECK CONSTRAINT [FK_TypeofTour_Type1]
GO
USE [master]
GO
ALTER DATABASE [Tur Base Aldonin] SET  READ_WRITE 
GO
