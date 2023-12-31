USE [master]
GO
/****** Object:  Database [repair_equipment]    Script Date: 20-Dec-23 12:15:30 AM ******/
CREATE DATABASE [repair_equipment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'repair_equipment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.ADMIN\MSSQL\DATA\repair_equipment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'repair_equipment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.ADMIN\MSSQL\DATA\repair_equipment_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [repair_equipment] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [repair_equipment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [repair_equipment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [repair_equipment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [repair_equipment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [repair_equipment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [repair_equipment] SET ARITHABORT OFF 
GO
ALTER DATABASE [repair_equipment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [repair_equipment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [repair_equipment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [repair_equipment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [repair_equipment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [repair_equipment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [repair_equipment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [repair_equipment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [repair_equipment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [repair_equipment] SET  DISABLE_BROKER 
GO
ALTER DATABASE [repair_equipment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [repair_equipment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [repair_equipment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [repair_equipment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [repair_equipment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [repair_equipment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [repair_equipment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [repair_equipment] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [repair_equipment] SET  MULTI_USER 
GO
ALTER DATABASE [repair_equipment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [repair_equipment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [repair_equipment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [repair_equipment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [repair_equipment] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [repair_equipment] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [repair_equipment] SET QUERY_STORE = ON
GO
ALTER DATABASE [repair_equipment] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [repair_equipment]
GO
/****** Object:  Table [dbo].[client]    Script Date: 20-Dec-23 12:15:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[client](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[surname] [nvarchar](20) NULL,
	[name] [nvarchar](15) NULL,
	[patronymic] [nvarchar](25) NULL,
	[phone] [nvarchar](11) NULL,
 CONSTRAINT [PK_client] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[crash_reason]    Script Date: 20-Dec-23 12:15:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crash_reason](
	[id] [int] NOT NULL,
	[name] [nvarchar](250) NULL,
 CONSTRAINT [PK_crash_reason] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[crash_type]    Script Date: 20-Dec-23 12:15:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crash_type](
	[id] [int] NOT NULL,
	[name] [nvarchar](255) NULL,
 CONSTRAINT [PK_crash_type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employee]    Script Date: 20-Dec-23 12:15:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[surname] [nvarchar](20) NULL,
	[name] [nvarchar](15) NULL,
	[patronymic] [nvarchar](25) NULL,
	[login] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[post_id] [int] NULL,
 CONSTRAINT [PK_employee] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[equipment]    Script Date: 20-Dec-23 12:15:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[equipment](
	[id] [int] NOT NULL,
	[name] [nvarchar](100) NULL,
	[equipment_type_id] [int] NULL,
	[serial_number] [float] NULL,
	[salary] [decimal](18, 2) NULL,
	[description] [nvarchar](255) NULL,
 CONSTRAINT [PK_equipment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[equipment_type]    Script Date: 20-Dec-23 12:15:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[equipment_type](
	[id] [int] NOT NULL,
	[name] [nvarchar](100) NULL,
 CONSTRAINT [PK_equipment_type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[material]    Script Date: 20-Dec-23 12:15:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[material](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[salary] [decimal](18, 2) NULL,
 CONSTRAINT [PK_material] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[material_list]    Script Date: 20-Dec-23 12:15:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[material_list](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[material_id] [int] NULL,
	[count] [int] NULL,
	[order_id] [int] NULL,
 CONSTRAINT [PK_material_list] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 20-Dec-23 12:15:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NULL,
	[equipment_id] [int] NULL,
	[crash_type_id] [int] NULL,
	[client_id] [int] NULL,
	[employee_id] [int] NULL,
	[status_id] [int] NULL,
	[description_crash] [nvarchar](250) NULL,
	[priority_order_id] [int] NULL,
	[crash_reason_id] [int] NULL,
	[additional_info] [nvarchar](250) NULL,
	[time_of_completion] [int] NULL,
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_material]    Script Date: 20-Dec-23 12:15:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_material](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[material_id] [int] NULL,
	[order_id] [int] NULL,
	[salary] [decimal](18, 2) NULL,
	[count] [int] NULL,
 CONSTRAINT [PK_order_material] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[post]    Script Date: 20-Dec-23 12:15:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[post](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_post] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[priority_order]    Script Date: 20-Dec-23 12:15:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[priority_order](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_priority_order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[status]    Script Date: 20-Dec-23 12:15:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_status] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[client] ON 

INSERT [dbo].[client] ([id], [surname], [name], [patronymic], [phone]) VALUES (0, N'Володин', N'Максим', N'Михайлович', N'88005553535')
INSERT [dbo].[client] ([id], [surname], [name], [patronymic], [phone]) VALUES (1, N'Иванов', N'Иван', N'Владимирович', N'89123345682')
INSERT [dbo].[client] ([id], [surname], [name], [patronymic], [phone]) VALUES (2, N'Семенова', N'Анна', N'Михайловна', N'89195467891')
INSERT [dbo].[client] ([id], [surname], [name], [patronymic], [phone]) VALUES (3, N'Попова', N'Елизавета', N'Германовна', N'89229850926')
INSERT [dbo].[client] ([id], [surname], [name], [patronymic], [phone]) VALUES (4, N'Авдеева', N'Мария', N'Никитина', N'89991269706')
INSERT [dbo].[client] ([id], [surname], [name], [patronymic], [phone]) VALUES (5, N'Гусев', N'Федор', N'Егорович', N'89048438744')
INSERT [dbo].[client] ([id], [surname], [name], [patronymic], [phone]) VALUES (6, N'Акимов', N'Александр', N'Артемович', N'89027933316')
INSERT [dbo].[client] ([id], [surname], [name], [patronymic], [phone]) VALUES (7, N'Козина', N'Арина', N'Тихоновна', N'89923066900')
SET IDENTITY_INSERT [dbo].[client] OFF
GO
INSERT [dbo].[crash_reason] ([id], [name]) VALUES (1, N'Перегрев устройства')
INSERT [dbo].[crash_reason] ([id], [name]) VALUES (2, N'Изменения цветов изображения на ноутбуке')
INSERT [dbo].[crash_reason] ([id], [name]) VALUES (3, N'Пропал звук')
INSERT [dbo].[crash_reason] ([id], [name]) VALUES (4, N'Не работает клавиатура на ноутбуке')
INSERT [dbo].[crash_reason] ([id], [name]) VALUES (5, N'Расплылось изображение на мониторе ноутбука')
INSERT [dbo].[crash_reason] ([id], [name]) VALUES (6, N'Ноутбук упал на твердое основание')
INSERT [dbo].[crash_reason] ([id], [name]) VALUES (7, N'Принтер не захватывает бумагу')
INSERT [dbo].[crash_reason] ([id], [name]) VALUES (8, N'Устройство не заряжается')
INSERT [dbo].[crash_reason] ([id], [name]) VALUES (9, N'Нечеткая печать или печать со светлыми полосами')
INSERT [dbo].[crash_reason] ([id], [name]) VALUES (10, N'Аккумулятор перестал держать заряд')
GO
INSERT [dbo].[crash_type] ([id], [name]) VALUES (1, N'низкое напряжение питающей сети')
INSERT [dbo].[crash_type] ([id], [name]) VALUES (2, N'замыкание в обмотках трансформатора')
INSERT [dbo].[crash_type] ([id], [name]) VALUES (3, N'повреждение свечи зажигания')
INSERT [dbo].[crash_type] ([id], [name]) VALUES (4, N'поломка стартера')
INSERT [dbo].[crash_type] ([id], [name]) VALUES (5, N'перегрев с последующим выключением')
INSERT [dbo].[crash_type] ([id], [name]) VALUES (6, N'перегрев')
INSERT [dbo].[crash_type] ([id], [name]) VALUES (7, N'засор поверхности водоохладителя')
INSERT [dbo].[crash_type] ([id], [name]) VALUES (8, N'не включается')
INSERT [dbo].[crash_type] ([id], [name]) VALUES (9, N'отсутвие инициализации')
INSERT [dbo].[crash_type] ([id], [name]) VALUES (10, N'Гул после включения резака')
INSERT [dbo].[crash_type] ([id], [name]) VALUES (11, N'Дежурная дуга не поджигает рабочую')
INSERT [dbo].[crash_type] ([id], [name]) VALUES (12, N'Нечеткий снимок ренгеновского аппарата')
INSERT [dbo].[crash_type] ([id], [name]) VALUES (13, N'Не работают кнопки')
INSERT [dbo].[crash_type] ([id], [name]) VALUES (14, N'замена делатей')
INSERT [dbo].[crash_type] ([id], [name]) VALUES (15, N'внешний дефект')
GO
SET IDENTITY_INSERT [dbo].[employee] ON 

INSERT [dbo].[employee] ([id], [surname], [name], [patronymic], [login], [password], [post_id]) VALUES (1, N'Сухарев', N'Роман', N'Олегович', N'loginDEsar2018', N'UI$3fdgd', 2)
INSERT [dbo].[employee] ([id], [surname], [name], [patronymic], [login], [password], [post_id]) VALUES (2, N'Орлова', N'Арина', N'Кирилловна', N'loginDEudz2018', N'jfFE93ffs', 3)
INSERT [dbo].[employee] ([id], [surname], [name], [patronymic], [login], [password], [post_id]) VALUES (3, N'Морозов', N'Марк', N'Миронович', N'loginDEvdj2019', N'srgeQgr!', 1)
INSERT [dbo].[employee] ([id], [surname], [name], [patronymic], [login], [password], [post_id]) VALUES (4, N'Карпов', N'Илья', N'Львович', N'loginDEtol2019', N'gWrshr$', 1)
INSERT [dbo].[employee] ([id], [surname], [name], [patronymic], [login], [password], [post_id]) VALUES (5, N'Фомин', N'Иван', N'Евгеньевич', N'loginDEdwi2018', N'gggh&3r', 1)
INSERT [dbo].[employee] ([id], [surname], [name], [patronymic], [login], [password], [post_id]) VALUES (6, N'Румянцева', N'Софья', N'Данииловна', N'loginDEufs2018', N'fgtu^1h', 1)
INSERT [dbo].[employee] ([id], [surname], [name], [patronymic], [login], [password], [post_id]) VALUES (7, N'Кириллов', N'Егор', N'Артемович', N'loginDEvdj2017', N'srgeQgr2!', 1)
INSERT [dbo].[employee] ([id], [surname], [name], [patronymic], [login], [password], [post_id]) VALUES (8, N'Михаил', N'Лев', N'Романович', N'loginDEdwi2020', N'gggh&3rvb', 1)
SET IDENTITY_INSERT [dbo].[employee] OFF
GO
INSERT [dbo].[equipment] ([id], [name], [equipment_type_id], [serial_number], [salary], [description]) VALUES (1, N'Аппарат свар.п/автомат  MIG500', 1, 203062865, CAST(40000.00 AS Decimal(18, 2)), N'Описания нет')
INSERT [dbo].[equipment] ([id], [name], [equipment_type_id], [serial_number], [salary], [description]) VALUES (2, N'Аппарат сварочный ММА, Pico 180 EWM', 1, 674753796, CAST(30000.00 AS Decimal(18, 2)), N'Описания нет')
INSERT [dbo].[equipment] ([id], [name], [equipment_type_id], [serial_number], [salary], [description]) VALUES (3, N'Газонокосилка-робот HUSQVARNA Automower 315X', 2, 726165087, CAST(100000.00 AS Decimal(18, 2)), N'Описания нет')
INSERT [dbo].[equipment] ([id], [name], [equipment_type_id], [serial_number], [salary], [description]) VALUES (4, N'Газонокосилка STIHL RMA 339.0+AK30+AL101', 2, 662065979, CAST(45000.00 AS Decimal(18, 2)), N'Описания нет')
INSERT [dbo].[equipment] ([id], [name], [equipment_type_id], [serial_number], [salary], [description]) VALUES (5, N'Источник питания MasterTig-3000MLS', 3, 746618528, CAST(60000.00 AS Decimal(18, 2)), N'Описания нет')
INSERT [dbo].[equipment] ([id], [name], [equipment_type_id], [serial_number], [salary], [description]) VALUES (6, N'Компрессор КВ-12/8', 4, 104850386, CAST(70000.00 AS Decimal(18, 2)), N'Описания нет')
INSERT [dbo].[equipment] ([id], [name], [equipment_type_id], [serial_number], [salary], [description]) VALUES (7, N'Компрессор СБ 4/С-100 LB 50 с ременным приводом', 4, 136797546, CAST(55000.00 AS Decimal(18, 2)), N'Описания нет')
INSERT [dbo].[equipment] ([id], [name], [equipment_type_id], [serial_number], [salary], [description]) VALUES (8, N'Ноутбук ASUS  17.3"', 5, 964578776, CAST(54000.00 AS Decimal(18, 2)), N'Описания нет')
INSERT [dbo].[equipment] ([id], [name], [equipment_type_id], [serial_number], [salary], [description]) VALUES (9, N'Ноутбук НР Pavilion 15-eg0008ur 15.6', 5, 629023323, CAST(52000.00 AS Decimal(18, 2)), N'Описания нет')
INSERT [dbo].[equipment] ([id], [name], [equipment_type_id], [serial_number], [salary], [description]) VALUES (10, N'Плазматрон для механизированной резки Р-160', 6, 806292393, CAST(120400.00 AS Decimal(18, 2)), N'Описания нет')
INSERT [dbo].[equipment] ([id], [name], [equipment_type_id], [serial_number], [salary], [description]) VALUES (11, N'Плазматрон для механизированной резки Р-80', 6, 888736868, CAST(108000.00 AS Decimal(18, 2)), N'Описания нет')
INSERT [dbo].[equipment] ([id], [name], [equipment_type_id], [serial_number], [salary], [description]) VALUES (12, N'Рентгеновский аппарат "АРИНА-3"', 7, 650463268, CAST(465000.00 AS Decimal(18, 2)), N'Описания нет')
INSERT [dbo].[equipment] ([id], [name], [equipment_type_id], [serial_number], [salary], [description]) VALUES (13, N'Рентгеновский аппарат "Памир-300"', 7, 616868552, CAST(672000.00 AS Decimal(18, 2)), N'Описания нет')
INSERT [dbo].[equipment] ([id], [name], [equipment_type_id], [serial_number], [salary], [description]) VALUES (14, N'Сварочный аппарат 1200Вт', 1, 936003323, CAST(34000.00 AS Decimal(18, 2)), N'Описания нет')
INSERT [dbo].[equipment] ([id], [name], [equipment_type_id], [serial_number], [salary], [description]) VALUES (15, N'Сканер НР Scanjet Enterprise Flow N7000 snw1', 8, 586159584, CAST(24000.00 AS Decimal(18, 2)), N'Описания нет')
INSERT [dbo].[equipment] ([id], [name], [equipment_type_id], [serial_number], [salary], [description]) VALUES (16, N'Рентгеновский аппарат МАРТ-250 (№376)', 7, 439628935, CAST(611000.00 AS Decimal(18, 2)), N'Описания нет')
INSERT [dbo].[equipment] ([id], [name], [equipment_type_id], [serial_number], [salary], [description]) VALUES (17, N'Пылесос KARCHER NT 65/2 65л', 9, 230800292, CAST(32000.00 AS Decimal(18, 2)), N'Описания нет')
INSERT [dbo].[equipment] ([id], [name], [equipment_type_id], [serial_number], [salary], [description]) VALUES (18, N'АВД с электродвигателем Посейдон E30-500-30 (ВНА-500-30)', 10, 686197567, CAST(92000.00 AS Decimal(18, 2)), N'Описания нет')
INSERT [dbo].[equipment] ([id], [name], [equipment_type_id], [serial_number], [salary], [description]) VALUES (19, N'Кондиционер Daikin FTXF71A/RXF71A', 11, 372546013, CAST(28000.00 AS Decimal(18, 2)), N'Описания нет')
INSERT [dbo].[equipment] ([id], [name], [equipment_type_id], [serial_number], [salary], [description]) VALUES (20, N'Кондиционер Daikin FTXF50A/RXF50B', 11, 333681196, CAST(29000.00 AS Decimal(18, 2)), N'Описания нет')
GO
INSERT [dbo].[equipment_type] ([id], [name]) VALUES (1, N'Сварочный аппарат')
INSERT [dbo].[equipment_type] ([id], [name]) VALUES (2, N'Газонокосилка')
INSERT [dbo].[equipment_type] ([id], [name]) VALUES (3, N'Источник питания')
INSERT [dbo].[equipment_type] ([id], [name]) VALUES (4, N'Компрессор')
INSERT [dbo].[equipment_type] ([id], [name]) VALUES (5, N'Ноутбук')
INSERT [dbo].[equipment_type] ([id], [name]) VALUES (6, N'Плазматрон')
INSERT [dbo].[equipment_type] ([id], [name]) VALUES (7, N'Рентгеновский аппарат')
INSERT [dbo].[equipment_type] ([id], [name]) VALUES (8, N'Сканер')
INSERT [dbo].[equipment_type] ([id], [name]) VALUES (9, N'Пылесос')
INSERT [dbo].[equipment_type] ([id], [name]) VALUES (10, N'Водоструйный аппарат высокого давления')
INSERT [dbo].[equipment_type] ([id], [name]) VALUES (11, N'Кондиционер')
GO
INSERT [dbo].[material] ([id], [name], [salary]) VALUES (1, N'Свеча зажигания', CAST(500.00 AS Decimal(18, 2)))
INSERT [dbo].[material] ([id], [name], [salary]) VALUES (2, N'Стартер ', CAST(2000.00 AS Decimal(18, 2)))
INSERT [dbo].[material] ([id], [name], [salary]) VALUES (3, N'запорный клапан', CAST(700.00 AS Decimal(18, 2)))
INSERT [dbo].[material] ([id], [name], [salary]) VALUES (4, N'водоохладитель', CAST(4000.00 AS Decimal(18, 2)))
INSERT [dbo].[material] ([id], [name], [salary]) VALUES (5, N'масло Errecom PAG 100', CAST(1500.00 AS Decimal(18, 2)))
INSERT [dbo].[material] ([id], [name], [salary]) VALUES (6, N'блок питания для ноутбука', CAST(4000.00 AS Decimal(18, 2)))
INSERT [dbo].[material] ([id], [name], [salary]) VALUES (7, N'процессор для ноутбука', CAST(9000.00 AS Decimal(18, 2)))
INSERT [dbo].[material] ([id], [name], [salary]) VALUES (8, N'сопло плазменное', CAST(15000.00 AS Decimal(18, 2)))
INSERT [dbo].[material] ([id], [name], [salary]) VALUES (9, N'электрод для горелки', CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[material] ([id], [name], [salary]) VALUES (10, N'рентгеновская трубка', CAST(100000.00 AS Decimal(18, 2)))
INSERT [dbo].[material] ([id], [name], [salary]) VALUES (11, N'блок питания для ренгена', CAST(150000.00 AS Decimal(18, 2)))
INSERT [dbo].[material] ([id], [name], [salary]) VALUES (12, N'Полусинтетическое моторное масло', CAST(2000.00 AS Decimal(18, 2)))
INSERT [dbo].[material] ([id], [name], [salary]) VALUES (13, N'вилка сцепления', CAST(1700.00 AS Decimal(18, 2)))
INSERT [dbo].[material] ([id], [name], [salary]) VALUES (14, N'фильтр для кондиционера', CAST(1000.00 AS Decimal(18, 2)))
INSERT [dbo].[material] ([id], [name], [salary]) VALUES (15, N'пильный диск', CAST(1600.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[material_list] ON 

INSERT [dbo].[material_list] ([id], [material_id], [count], [order_id]) VALUES (1, 7, 1, 1)
INSERT [dbo].[material_list] ([id], [material_id], [count], [order_id]) VALUES (2, 1, 5, 3)
INSERT [dbo].[material_list] ([id], [material_id], [count], [order_id]) VALUES (3, 8, 3, 7)
INSERT [dbo].[material_list] ([id], [material_id], [count], [order_id]) VALUES (4, 6, 2, 1)
SET IDENTITY_INSERT [dbo].[material_list] OFF
GO
SET IDENTITY_INSERT [dbo].[order] ON 

INSERT [dbo].[order] ([id], [date], [equipment_id], [crash_type_id], [client_id], [employee_id], [status_id], [description_crash], [priority_order_id], [crash_reason_id], [additional_info], [time_of_completion]) VALUES (1, CAST(N'2023-12-07' AS Date), 8, 8, 6, 4, 1, N'После удара по ноутбуку, перестал включатся', 1, 8, N'Удар был в районе тача', 3)
INSERT [dbo].[order] ([id], [date], [equipment_id], [crash_type_id], [client_id], [employee_id], [status_id], [description_crash], [priority_order_id], [crash_reason_id], [additional_info], [time_of_completion]) VALUES (2, CAST(N'2023-12-07' AS Date), 1, 1, 5, 3, 2, N'Не запускается', 1, 1, N'Починить батарею', 5)
INSERT [dbo].[order] ([id], [date], [equipment_id], [crash_type_id], [client_id], [employee_id], [status_id], [description_crash], [priority_order_id], [crash_reason_id], [additional_info], [time_of_completion]) VALUES (3, CAST(N'2023-12-07' AS Date), 9, 6, 6, 5, 1, N'Не заряжается', 3, 6, N'Проблема в охлаждении', 4)
INSERT [dbo].[order] ([id], [date], [equipment_id], [crash_type_id], [client_id], [employee_id], [status_id], [description_crash], [priority_order_id], [crash_reason_id], [additional_info], [time_of_completion]) VALUES (4, CAST(N'2023-12-19' AS Date), 2, 2, 2, 5, 2, N'все плохо', 1, 2, N'', 4)
INSERT [dbo].[order] ([id], [date], [equipment_id], [crash_type_id], [client_id], [employee_id], [status_id], [description_crash], [priority_order_id], [crash_reason_id], [additional_info], [time_of_completion]) VALUES (5, CAST(N'2023-12-19' AS Date), 3, 3, 3, 5, 2, N'помогите', 3, 3, N'', 7)
INSERT [dbo].[order] ([id], [date], [equipment_id], [crash_type_id], [client_id], [employee_id], [status_id], [description_crash], [priority_order_id], [crash_reason_id], [additional_info], [time_of_completion]) VALUES (6, CAST(N'2023-12-19' AS Date), 3, 3, 3, 3, 2, N'тест', 1, 3, N'', 2)
INSERT [dbo].[order] ([id], [date], [equipment_id], [crash_type_id], [client_id], [employee_id], [status_id], [description_crash], [priority_order_id], [crash_reason_id], [additional_info], [time_of_completion]) VALUES (7, CAST(N'2023-12-19' AS Date), 1, 1, 2, 6, 2, N'тест два', 1, 1, N'Непонятно', 4)
SET IDENTITY_INSERT [dbo].[order] OFF
GO
INSERT [dbo].[post] ([id], [name]) VALUES (1, N'Исполнитель')
INSERT [dbo].[post] ([id], [name]) VALUES (2, N'Менеджер')
INSERT [dbo].[post] ([id], [name]) VALUES (3, N'Директор')
GO
INSERT [dbo].[priority_order] ([id], [name]) VALUES (1, N'Высокий')
INSERT [dbo].[priority_order] ([id], [name]) VALUES (2, N'Средний')
INSERT [dbo].[priority_order] ([id], [name]) VALUES (3, N'Низкий')
GO
INSERT [dbo].[status] ([id], [name]) VALUES (1, N'Отремонтирован')
INSERT [dbo].[status] ([id], [name]) VALUES (2, N'В ремонте')
GO
ALTER TABLE [dbo].[employee]  WITH CHECK ADD  CONSTRAINT [FK_employee_post] FOREIGN KEY([post_id])
REFERENCES [dbo].[post] ([id])
GO
ALTER TABLE [dbo].[employee] CHECK CONSTRAINT [FK_employee_post]
GO
ALTER TABLE [dbo].[equipment]  WITH CHECK ADD  CONSTRAINT [FK_equipment_equipment_type] FOREIGN KEY([equipment_type_id])
REFERENCES [dbo].[equipment_type] ([id])
GO
ALTER TABLE [dbo].[equipment] CHECK CONSTRAINT [FK_equipment_equipment_type]
GO
ALTER TABLE [dbo].[material_list]  WITH CHECK ADD  CONSTRAINT [FK_material_list_material] FOREIGN KEY([material_id])
REFERENCES [dbo].[material] ([id])
GO
ALTER TABLE [dbo].[material_list] CHECK CONSTRAINT [FK_material_list_material]
GO
ALTER TABLE [dbo].[material_list]  WITH CHECK ADD  CONSTRAINT [FK_material_list_order] FOREIGN KEY([order_id])
REFERENCES [dbo].[order] ([id])
GO
ALTER TABLE [dbo].[material_list] CHECK CONSTRAINT [FK_material_list_order]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_client] FOREIGN KEY([client_id])
REFERENCES [dbo].[client] ([id])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_client]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_crash_reason] FOREIGN KEY([crash_reason_id])
REFERENCES [dbo].[crash_reason] ([id])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_crash_reason]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_crash_type] FOREIGN KEY([crash_type_id])
REFERENCES [dbo].[crash_type] ([id])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_crash_type]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_employee] FOREIGN KEY([employee_id])
REFERENCES [dbo].[employee] ([id])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_employee]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_equipment] FOREIGN KEY([equipment_id])
REFERENCES [dbo].[equipment] ([id])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_equipment]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_priority_order] FOREIGN KEY([priority_order_id])
REFERENCES [dbo].[priority_order] ([id])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_priority_order]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_status] FOREIGN KEY([status_id])
REFERENCES [dbo].[status] ([id])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_status]
GO
ALTER TABLE [dbo].[order_material]  WITH CHECK ADD  CONSTRAINT [FK_order_material_material] FOREIGN KEY([material_id])
REFERENCES [dbo].[material] ([id])
GO
ALTER TABLE [dbo].[order_material] CHECK CONSTRAINT [FK_order_material_material]
GO
ALTER TABLE [dbo].[order_material]  WITH CHECK ADD  CONSTRAINT [FK_order_material_order] FOREIGN KEY([order_id])
REFERENCES [dbo].[order] ([id])
GO
ALTER TABLE [dbo].[order_material] CHECK CONSTRAINT [FK_order_material_order]
GO
USE [master]
GO
ALTER DATABASE [repair_equipment] SET  READ_WRITE 
GO
