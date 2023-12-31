USE [master]
GO
/****** Object:  Database [Proyecto_servicios_web_2023]    Script Date: 28/06/2023 15:56:09 ******/
CREATE DATABASE [Proyecto_servicios_web_2023]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Proyecto_servicios_web_2023', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Proyecto_servicios_web_2023.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Proyecto_servicios_web_2023_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Proyecto_servicios_web_2023_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Proyecto_servicios_web_2023] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Proyecto_servicios_web_2023].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Proyecto_servicios_web_2023] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Proyecto_servicios_web_2023] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Proyecto_servicios_web_2023] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Proyecto_servicios_web_2023] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Proyecto_servicios_web_2023] SET ARITHABORT OFF 
GO
ALTER DATABASE [Proyecto_servicios_web_2023] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Proyecto_servicios_web_2023] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Proyecto_servicios_web_2023] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Proyecto_servicios_web_2023] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Proyecto_servicios_web_2023] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Proyecto_servicios_web_2023] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Proyecto_servicios_web_2023] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Proyecto_servicios_web_2023] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Proyecto_servicios_web_2023] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Proyecto_servicios_web_2023] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Proyecto_servicios_web_2023] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Proyecto_servicios_web_2023] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Proyecto_servicios_web_2023] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Proyecto_servicios_web_2023] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Proyecto_servicios_web_2023] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Proyecto_servicios_web_2023] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Proyecto_servicios_web_2023] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Proyecto_servicios_web_2023] SET RECOVERY FULL 
GO
ALTER DATABASE [Proyecto_servicios_web_2023] SET  MULTI_USER 
GO
ALTER DATABASE [Proyecto_servicios_web_2023] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Proyecto_servicios_web_2023] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Proyecto_servicios_web_2023] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Proyecto_servicios_web_2023] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Proyecto_servicios_web_2023] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Proyecto_servicios_web_2023] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Proyecto_servicios_web_2023', N'ON'
GO
ALTER DATABASE [Proyecto_servicios_web_2023] SET QUERY_STORE = OFF
GO
USE [Proyecto_servicios_web_2023]
GO
/****** Object:  Table [dbo].[tb_carrito]    Script Date: 28/06/2023 15:56:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_carrito](
	[id_carrito] [int] IDENTITY(1,1) NOT NULL,
	[id_usu] [int] NULL,
	[id_producto] [int] NULL,
	[cantidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_carrito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_categoriaProducto]    Script Date: 28/06/2023 15:56:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_categoriaProducto](
	[id_categoria] [int] IDENTITY(1,1) NOT NULL,
	[descripcion_cate] [varchar](100) NULL,
	[fechaRegistro_cate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_detalleOrden]    Script Date: 28/06/2023 15:56:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_detalleOrden](
	[id_detalle] [int] IDENTITY(1,1) NOT NULL,
	[id_orden] [int] NULL,
	[id_producto] [int] NULL,
	[cantidad_detalle] [int] NULL,
	[precio_detalle] [decimal](10, 2) NULL,
	[fechaDetalle] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_domicilio]    Script Date: 28/06/2023 15:56:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_domicilio](
	[id_domi] [int] IDENTITY(1,1) NOT NULL,
	[id_usu] [int] NULL,
	[departamento_domi] [varchar](50) NULL,
	[provincia_domi] [varchar](50) NULL,
	[distrito_domi] [varchar](50) NULL,
	[pais_domi] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_domi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_menu]    Script Date: 28/06/2023 15:56:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_menu](
	[id_menu] [int] IDENTITY(1,1) NOT NULL,
	[describcion_menu] [varchar](50) NOT NULL,
	[url_menu] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_menu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_menuEmpresarial]    Script Date: 28/06/2023 15:56:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_menuEmpresarial](
	[id_menuEmpre] [int] IDENTITY(1,1) NOT NULL,
	[describcion_menuEmpre] [varchar](50) NULL,
	[url_menuEmpre] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_menuEmpre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_metodoPago]    Script Date: 28/06/2023 15:56:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_metodoPago](
	[id_pago] [int] IDENTITY(1,1) NOT NULL,
	[nombre_pago] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_orden]    Script Date: 28/06/2023 15:56:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_orden](
	[id_orden] [int] IDENTITY(1,1) NOT NULL,
	[id_usu] [int] NULL,
	[id_pago] [int] NULL,
	[total] [decimal](10, 2) NULL,
	[id_domi] [int] NULL,
	[fechaOrden] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_orden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_permisos]    Script Date: 28/06/2023 15:56:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_permisos](
	[id_permiso] [int] IDENTITY(1,1) NOT NULL,
	[id_rol] [int] NULL,
	[id_menuEmpre] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_permiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_producto]    Script Date: 28/06/2023 15:56:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_producto](
	[id_producto] [int] IDENTITY(1,1) NOT NULL,
	[nombre_prod] [varchar](50) NULL,
	[marca_prod] [varchar](50) NULL,
	[precio_prod] [decimal](10, 2) NULL,
	[id_categoria] [int] NULL,
	[img_prod] [varchar](300) NULL,
	[stock_prod] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_rol]    Script Date: 28/06/2023 15:56:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_rol](
	[id_rol] [int] IDENTITY(1,1) NOT NULL,
	[nombre_rol] [varchar](50) NULL,
	[activar_rol] [int] NULL,
	[fechaRegistro_rol] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_submenu]    Script Date: 28/06/2023 15:56:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_submenu](
	[id_submenu] [int] IDENTITY(1,1) NOT NULL,
	[id_menu] [int] NOT NULL,
	[des_submene] [varchar](50) NOT NULL,
	[url_submenu] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_submenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_submenuEmpresarial]    Script Date: 28/06/2023 15:56:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_submenuEmpresarial](
	[id_submenuEmpre] [int] IDENTITY(1,1) NOT NULL,
	[id_menuEmpre] [int] NULL,
	[des_submenuEmpre] [varchar](50) NULL,
	[url_submenuEmpre] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_submenuEmpre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Usuario]    Script Date: 28/06/2023 15:56:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Usuario](
	[id_usu] [int] IDENTITY(1,1) NOT NULL,
	[email_usu] [varchar](50) NULL,
	[password_usu] [varchar](200) NULL,
	[nombre_usu] [varchar](50) NULL,
	[apellido_usu] [varchar](50) NULL,
	[estado_usu] [varchar](20) NULL,
	[usuario_usu] [varchar](50) NULL,
	[id_rol] [int] NULL,
	[nuevoUsuario_usu] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_usu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tb_categoriaProducto] ON 

INSERT [dbo].[tb_categoriaProducto] ([id_categoria], [descripcion_cate], [fechaRegistro_cate]) VALUES (1, N'Refrigeradoras', CAST(N'2023-06-02T19:40:08.303' AS DateTime))
INSERT [dbo].[tb_categoriaProducto] ([id_categoria], [descripcion_cate], [fechaRegistro_cate]) VALUES (2, N'Cocina', CAST(N'2023-06-02T19:40:40.227' AS DateTime))
INSERT [dbo].[tb_categoriaProducto] ([id_categoria], [descripcion_cate], [fechaRegistro_cate]) VALUES (3, N'Cuidado Personal', CAST(N'2023-06-02T19:40:53.640' AS DateTime))
INSERT [dbo].[tb_categoriaProducto] ([id_categoria], [descripcion_cate], [fechaRegistro_cate]) VALUES (4, N'Celulares', CAST(N'2023-06-02T19:41:09.083' AS DateTime))
INSERT [dbo].[tb_categoriaProducto] ([id_categoria], [descripcion_cate], [fechaRegistro_cate]) VALUES (5, N'Computo', CAST(N'2023-06-02T19:41:15.770' AS DateTime))
INSERT [dbo].[tb_categoriaProducto] ([id_categoria], [descripcion_cate], [fechaRegistro_cate]) VALUES (6, N'Televidores', CAST(N'2023-06-02T19:41:19.880' AS DateTime))
INSERT [dbo].[tb_categoriaProducto] ([id_categoria], [descripcion_cate], [fechaRegistro_cate]) VALUES (7, N'Videojuegos', CAST(N'2023-06-02T19:41:27.797' AS DateTime))
INSERT [dbo].[tb_categoriaProducto] ([id_categoria], [descripcion_cate], [fechaRegistro_cate]) VALUES (8, N'Camaras y Drones', CAST(N'2023-06-02T19:41:55.147' AS DateTime))
INSERT [dbo].[tb_categoriaProducto] ([id_categoria], [descripcion_cate], [fechaRegistro_cate]) VALUES (9, N'Ropa Hombre', CAST(N'2023-06-02T19:42:10.100' AS DateTime))
INSERT [dbo].[tb_categoriaProducto] ([id_categoria], [descripcion_cate], [fechaRegistro_cate]) VALUES (10, N'Ropa Mujer', CAST(N'2023-06-02T19:42:16.090' AS DateTime))
INSERT [dbo].[tb_categoriaProducto] ([id_categoria], [descripcion_cate], [fechaRegistro_cate]) VALUES (11, N'Abarrotes', CAST(N'2023-06-02T19:42:20.793' AS DateTime))
INSERT [dbo].[tb_categoriaProducto] ([id_categoria], [descripcion_cate], [fechaRegistro_cate]) VALUES (12, N'Bebidas', CAST(N'2023-06-02T19:42:24.863' AS DateTime))
INSERT [dbo].[tb_categoriaProducto] ([id_categoria], [descripcion_cate], [fechaRegistro_cate]) VALUES (13, N'Snacks', CAST(N'2023-06-02T19:42:28.713' AS DateTime))
SET IDENTITY_INSERT [dbo].[tb_categoriaProducto] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_detalleOrden] ON 

INSERT [dbo].[tb_detalleOrden] ([id_detalle], [id_orden], [id_producto], [cantidad_detalle], [precio_detalle], [fechaDetalle]) VALUES (5, 3, 10, 1, CAST(57.50 AS Decimal(10, 2)), CAST(N'2023-04-22T21:18:55.457' AS DateTime))
INSERT [dbo].[tb_detalleOrden] ([id_detalle], [id_orden], [id_producto], [cantidad_detalle], [precio_detalle], [fechaDetalle]) VALUES (6, 3, 11, 1, CAST(74.90 AS Decimal(10, 2)), CAST(N'2023-04-22T21:18:55.457' AS DateTime))
INSERT [dbo].[tb_detalleOrden] ([id_detalle], [id_orden], [id_producto], [cantidad_detalle], [precio_detalle], [fechaDetalle]) VALUES (7, 4, 6, 1, CAST(2000.00 AS Decimal(10, 2)), CAST(N'2023-05-22T21:18:55.457' AS DateTime))
INSERT [dbo].[tb_detalleOrden] ([id_detalle], [id_orden], [id_producto], [cantidad_detalle], [precio_detalle], [fechaDetalle]) VALUES (8, 4, 22, 1, CAST(1499.00 AS Decimal(10, 2)), CAST(N'2023-05-22T21:18:55.457' AS DateTime))
INSERT [dbo].[tb_detalleOrden] ([id_detalle], [id_orden], [id_producto], [cantidad_detalle], [precio_detalle], [fechaDetalle]) VALUES (9, 5, 10, 1, CAST(57.50 AS Decimal(10, 2)), CAST(N'2023-06-20T21:18:55.457' AS DateTime))
INSERT [dbo].[tb_detalleOrden] ([id_detalle], [id_orden], [id_producto], [cantidad_detalle], [precio_detalle], [fechaDetalle]) VALUES (10, 5, 6, 1, CAST(2000.00 AS Decimal(10, 2)), CAST(N'2023-06-20T21:18:55.457' AS DateTime))
INSERT [dbo].[tb_detalleOrden] ([id_detalle], [id_orden], [id_producto], [cantidad_detalle], [precio_detalle], [fechaDetalle]) VALUES (11, 6, 16, 1, CAST(599.00 AS Decimal(10, 2)), CAST(N'2023-06-21T21:18:55.457' AS DateTime))
INSERT [dbo].[tb_detalleOrden] ([id_detalle], [id_orden], [id_producto], [cantidad_detalle], [precio_detalle], [fechaDetalle]) VALUES (12, 6, 14, 1, CAST(899.00 AS Decimal(10, 2)), CAST(N'2023-06-21T21:18:55.457' AS DateTime))
INSERT [dbo].[tb_detalleOrden] ([id_detalle], [id_orden], [id_producto], [cantidad_detalle], [precio_detalle], [fechaDetalle]) VALUES (13, 7, 10, 1, CAST(57.50 AS Decimal(10, 2)), CAST(N'2023-06-22T21:18:55.457' AS DateTime))
INSERT [dbo].[tb_detalleOrden] ([id_detalle], [id_orden], [id_producto], [cantidad_detalle], [precio_detalle], [fechaDetalle]) VALUES (14, 7, 11, 1, CAST(74.90 AS Decimal(10, 2)), CAST(N'2023-06-22T21:18:55.457' AS DateTime))
INSERT [dbo].[tb_detalleOrden] ([id_detalle], [id_orden], [id_producto], [cantidad_detalle], [precio_detalle], [fechaDetalle]) VALUES (15, 8, 38, 4, CAST(21.90 AS Decimal(10, 2)), CAST(N'2023-06-22T22:27:17.607' AS DateTime))
INSERT [dbo].[tb_detalleOrden] ([id_detalle], [id_orden], [id_producto], [cantidad_detalle], [precio_detalle], [fechaDetalle]) VALUES (16, 9, 22, 2, CAST(1499.00 AS Decimal(10, 2)), CAST(N'2023-06-22T22:28:00.880' AS DateTime))
INSERT [dbo].[tb_detalleOrden] ([id_detalle], [id_orden], [id_producto], [cantidad_detalle], [precio_detalle], [fechaDetalle]) VALUES (17, 9, 23, 1, CAST(1799.00 AS Decimal(10, 2)), CAST(N'2023-06-22T22:28:00.880' AS DateTime))
INSERT [dbo].[tb_detalleOrden] ([id_detalle], [id_orden], [id_producto], [cantidad_detalle], [precio_detalle], [fechaDetalle]) VALUES (18, 9, 24, 1, CAST(2589.00 AS Decimal(10, 2)), CAST(N'2023-06-22T22:28:00.880' AS DateTime))
INSERT [dbo].[tb_detalleOrden] ([id_detalle], [id_orden], [id_producto], [cantidad_detalle], [precio_detalle], [fechaDetalle]) VALUES (1015, 1008, 6, 2, CAST(2000.00 AS Decimal(10, 2)), CAST(N'2023-06-23T15:48:18.947' AS DateTime))
INSERT [dbo].[tb_detalleOrden] ([id_detalle], [id_orden], [id_producto], [cantidad_detalle], [precio_detalle], [fechaDetalle]) VALUES (1016, 1009, 14, 1, CAST(899.00 AS Decimal(10, 2)), CAST(N'2023-06-23T15:49:15.073' AS DateTime))
INSERT [dbo].[tb_detalleOrden] ([id_detalle], [id_orden], [id_producto], [cantidad_detalle], [precio_detalle], [fechaDetalle]) VALUES (1017, 1009, 15, 1, CAST(1699.00 AS Decimal(10, 2)), CAST(N'2023-06-23T15:49:15.077' AS DateTime))
INSERT [dbo].[tb_detalleOrden] ([id_detalle], [id_orden], [id_producto], [cantidad_detalle], [precio_detalle], [fechaDetalle]) VALUES (1018, 1010, 7, 1, CAST(1540.00 AS Decimal(10, 2)), CAST(N'2023-06-23T17:30:07.957' AS DateTime))
INSERT [dbo].[tb_detalleOrden] ([id_detalle], [id_orden], [id_producto], [cantidad_detalle], [precio_detalle], [fechaDetalle]) VALUES (1019, 1011, 7, 1, CAST(1540.00 AS Decimal(10, 2)), CAST(N'2023-06-23T17:31:06.647' AS DateTime))
INSERT [dbo].[tb_detalleOrden] ([id_detalle], [id_orden], [id_producto], [cantidad_detalle], [precio_detalle], [fechaDetalle]) VALUES (1020, 1012, 6, 1, CAST(2000.00 AS Decimal(10, 2)), CAST(N'2023-06-23T17:32:18.277' AS DateTime))
INSERT [dbo].[tb_detalleOrden] ([id_detalle], [id_orden], [id_producto], [cantidad_detalle], [precio_detalle], [fechaDetalle]) VALUES (1021, 1013, 10, 1, CAST(57.50 AS Decimal(10, 2)), CAST(N'2023-06-23T23:12:13.640' AS DateTime))
INSERT [dbo].[tb_detalleOrden] ([id_detalle], [id_orden], [id_producto], [cantidad_detalle], [precio_detalle], [fechaDetalle]) VALUES (1022, 1013, 11, 1, CAST(74.90 AS Decimal(10, 2)), CAST(N'2023-06-23T23:12:13.640' AS DateTime))
INSERT [dbo].[tb_detalleOrden] ([id_detalle], [id_orden], [id_producto], [cantidad_detalle], [precio_detalle], [fechaDetalle]) VALUES (2015, 2008, 6, 1, CAST(2000.00 AS Decimal(10, 2)), CAST(N'2023-06-28T00:43:48.317' AS DateTime))
INSERT [dbo].[tb_detalleOrden] ([id_detalle], [id_orden], [id_producto], [cantidad_detalle], [precio_detalle], [fechaDetalle]) VALUES (2016, 2008, 7, 1, CAST(1540.00 AS Decimal(10, 2)), CAST(N'2023-06-28T00:43:48.320' AS DateTime))
INSERT [dbo].[tb_detalleOrden] ([id_detalle], [id_orden], [id_producto], [cantidad_detalle], [precio_detalle], [fechaDetalle]) VALUES (2017, 2009, 14, 2, CAST(899.00 AS Decimal(10, 2)), CAST(N'2023-06-28T10:13:40.840' AS DateTime))
INSERT [dbo].[tb_detalleOrden] ([id_detalle], [id_orden], [id_producto], [cantidad_detalle], [precio_detalle], [fechaDetalle]) VALUES (2018, 2010, 10, 2, CAST(57.50 AS Decimal(10, 2)), CAST(N'2023-06-28T15:25:58.930' AS DateTime))
INSERT [dbo].[tb_detalleOrden] ([id_detalle], [id_orden], [id_producto], [cantidad_detalle], [precio_detalle], [fechaDetalle]) VALUES (2019, 2010, 11, 1, CAST(74.90 AS Decimal(10, 2)), CAST(N'2023-06-28T15:25:58.937' AS DateTime))
INSERT [dbo].[tb_detalleOrden] ([id_detalle], [id_orden], [id_producto], [cantidad_detalle], [precio_detalle], [fechaDetalle]) VALUES (2020, 2011, 8, 1, CAST(4525.00 AS Decimal(10, 2)), CAST(N'2023-06-28T15:32:08.427' AS DateTime))
INSERT [dbo].[tb_detalleOrden] ([id_detalle], [id_orden], [id_producto], [cantidad_detalle], [precio_detalle], [fechaDetalle]) VALUES (2021, 2011, 15, 1, CAST(1699.00 AS Decimal(10, 2)), CAST(N'2023-06-28T15:32:08.433' AS DateTime))
SET IDENTITY_INSERT [dbo].[tb_detalleOrden] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_domicilio] ON 

INSERT [dbo].[tb_domicilio] ([id_domi], [id_usu], [departamento_domi], [provincia_domi], [distrito_domi], [pais_domi]) VALUES (1, 1, N'Lima', N'Lima', N'Puente Piedra', N'Peru')
SET IDENTITY_INSERT [dbo].[tb_domicilio] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_menu] ON 

INSERT [dbo].[tb_menu] ([id_menu], [describcion_menu], [url_menu]) VALUES (2, N'Novedades', N'#')
INSERT [dbo].[tb_menu] ([id_menu], [describcion_menu], [url_menu]) VALUES (3, N'Iniciar Sesion', N'/Inicio/IniciarSesion')
SET IDENTITY_INSERT [dbo].[tb_menu] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_menuEmpresarial] ON 

INSERT [dbo].[tb_menuEmpresarial] ([id_menuEmpre], [describcion_menuEmpre], [url_menuEmpre]) VALUES (1, N'Mantenimiento', N'#')
INSERT [dbo].[tb_menuEmpresarial] ([id_menuEmpre], [describcion_menuEmpre], [url_menuEmpre]) VALUES (2, N'Consultas', N'#')
INSERT [dbo].[tb_menuEmpresarial] ([id_menuEmpre], [describcion_menuEmpre], [url_menuEmpre]) VALUES (3, N'Reportes', N'#')
SET IDENTITY_INSERT [dbo].[tb_menuEmpresarial] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_metodoPago] ON 

INSERT [dbo].[tb_metodoPago] ([id_pago], [nombre_pago]) VALUES (1, N'credito')
INSERT [dbo].[tb_metodoPago] ([id_pago], [nombre_pago]) VALUES (2, N'paypal')
INSERT [dbo].[tb_metodoPago] ([id_pago], [nombre_pago]) VALUES (3, N'debito')
INSERT [dbo].[tb_metodoPago] ([id_pago], [nombre_pago]) VALUES (4, N'agora')
INSERT [dbo].[tb_metodoPago] ([id_pago], [nombre_pago]) VALUES (5, N'otro')
SET IDENTITY_INSERT [dbo].[tb_metodoPago] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_orden] ON 

INSERT [dbo].[tb_orden] ([id_orden], [id_usu], [id_pago], [total], [id_domi], [fechaOrden]) VALUES (3, 1, 1, CAST(132.40 AS Decimal(10, 2)), 1, CAST(N'2023-04-22T21:18:55.457' AS DateTime))
INSERT [dbo].[tb_orden] ([id_orden], [id_usu], [id_pago], [total], [id_domi], [fechaOrden]) VALUES (4, 1, 1, CAST(3499.00 AS Decimal(10, 2)), 1, CAST(N'2023-05-22T21:18:55.457' AS DateTime))
INSERT [dbo].[tb_orden] ([id_orden], [id_usu], [id_pago], [total], [id_domi], [fechaOrden]) VALUES (5, 1, 1, CAST(2057.50 AS Decimal(10, 2)), 1, CAST(N'2023-06-20T21:18:55.457' AS DateTime))
INSERT [dbo].[tb_orden] ([id_orden], [id_usu], [id_pago], [total], [id_domi], [fechaOrden]) VALUES (6, 1, 4, CAST(1498.00 AS Decimal(10, 2)), 1, CAST(N'2023-06-21T21:18:55.457' AS DateTime))
INSERT [dbo].[tb_orden] ([id_orden], [id_usu], [id_pago], [total], [id_domi], [fechaOrden]) VALUES (7, 1, 2, CAST(132.40 AS Decimal(10, 2)), 1, CAST(N'2023-06-22T21:18:55.457' AS DateTime))
INSERT [dbo].[tb_orden] ([id_orden], [id_usu], [id_pago], [total], [id_domi], [fechaOrden]) VALUES (8, 1, 1, CAST(87.60 AS Decimal(10, 2)), 1, CAST(N'2023-06-22T22:27:17.607' AS DateTime))
INSERT [dbo].[tb_orden] ([id_orden], [id_usu], [id_pago], [total], [id_domi], [fechaOrden]) VALUES (9, 1, 1, CAST(7386.00 AS Decimal(10, 2)), 1, CAST(N'2023-06-22T22:28:00.880' AS DateTime))
INSERT [dbo].[tb_orden] ([id_orden], [id_usu], [id_pago], [total], [id_domi], [fechaOrden]) VALUES (1008, 1, 1, CAST(4000.00 AS Decimal(10, 2)), 1, CAST(N'2023-06-23T15:48:18.923' AS DateTime))
INSERT [dbo].[tb_orden] ([id_orden], [id_usu], [id_pago], [total], [id_domi], [fechaOrden]) VALUES (1009, 1, 1, CAST(2598.00 AS Decimal(10, 2)), 1, CAST(N'2023-06-23T15:49:15.050' AS DateTime))
INSERT [dbo].[tb_orden] ([id_orden], [id_usu], [id_pago], [total], [id_domi], [fechaOrden]) VALUES (1010, 1, 1, CAST(1540.00 AS Decimal(10, 2)), 1, CAST(N'2023-06-23T17:30:07.933' AS DateTime))
INSERT [dbo].[tb_orden] ([id_orden], [id_usu], [id_pago], [total], [id_domi], [fechaOrden]) VALUES (1011, 1, 1, CAST(1540.00 AS Decimal(10, 2)), 1, CAST(N'2023-06-23T17:31:06.640' AS DateTime))
INSERT [dbo].[tb_orden] ([id_orden], [id_usu], [id_pago], [total], [id_domi], [fechaOrden]) VALUES (1012, 1, 1, CAST(2000.00 AS Decimal(10, 2)), 1, CAST(N'2023-06-23T17:32:18.270' AS DateTime))
INSERT [dbo].[tb_orden] ([id_orden], [id_usu], [id_pago], [total], [id_domi], [fechaOrden]) VALUES (1013, 1, 1, CAST(132.40 AS Decimal(10, 2)), 1, CAST(N'2023-06-23T23:12:13.620' AS DateTime))
INSERT [dbo].[tb_orden] ([id_orden], [id_usu], [id_pago], [total], [id_domi], [fechaOrden]) VALUES (2008, 1, 1, CAST(3540.00 AS Decimal(10, 2)), 1, CAST(N'2023-06-28T00:43:48.293' AS DateTime))
INSERT [dbo].[tb_orden] ([id_orden], [id_usu], [id_pago], [total], [id_domi], [fechaOrden]) VALUES (2009, 1, 1, CAST(1798.00 AS Decimal(10, 2)), 1, CAST(N'2023-06-28T10:13:40.823' AS DateTime))
INSERT [dbo].[tb_orden] ([id_orden], [id_usu], [id_pago], [total], [id_domi], [fechaOrden]) VALUES (2010, 1, 1, CAST(189.90 AS Decimal(10, 2)), 1, CAST(N'2023-06-28T15:25:58.907' AS DateTime))
INSERT [dbo].[tb_orden] ([id_orden], [id_usu], [id_pago], [total], [id_domi], [fechaOrden]) VALUES (2011, 1, 1, CAST(6224.00 AS Decimal(10, 2)), 1, CAST(N'2023-06-28T15:32:08.407' AS DateTime))
SET IDENTITY_INSERT [dbo].[tb_orden] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_permisos] ON 

INSERT [dbo].[tb_permisos] ([id_permiso], [id_rol], [id_menuEmpre]) VALUES (1, 2, 1)
INSERT [dbo].[tb_permisos] ([id_permiso], [id_rol], [id_menuEmpre]) VALUES (7, 2, 2)
INSERT [dbo].[tb_permisos] ([id_permiso], [id_rol], [id_menuEmpre]) VALUES (8, 2, 3)
INSERT [dbo].[tb_permisos] ([id_permiso], [id_rol], [id_menuEmpre]) VALUES (9, 3, 2)
SET IDENTITY_INSERT [dbo].[tb_permisos] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_producto] ON 

INSERT [dbo].[tb_producto] ([id_producto], [nombre_prod], [marca_prod], [precio_prod], [id_categoria], [img_prod], [stock_prod]) VALUES (6, N'Cocina Indurama', N'INDURAMA', CAST(2000.00 AS Decimal(10, 2)), 2, N'https://promart.vteximg.com.br/arquivos/img-blog-cocinaindurama.png?v=638096534046400000', 10)
INSERT [dbo].[tb_producto] ([id_producto], [nombre_prod], [marca_prod], [precio_prod], [id_categoria], [img_prod], [stock_prod]) VALUES (7, N'Cocina Mabe', N'MABE', CAST(1540.00 AS Decimal(10, 2)), 2, N'https://promart.vteximg.com.br/arquivos/img-blog-cocinaindurama.png?v=638096534046400000', 10)
INSERT [dbo].[tb_producto] ([id_producto], [nombre_prod], [marca_prod], [precio_prod], [id_categoria], [img_prod], [stock_prod]) VALUES (8, N'Cocina Electro', N'ELECTROLUZ', CAST(4525.00 AS Decimal(10, 2)), 2, N'https://promart.vteximg.com.br/arquivos/cocina-electrolux-1.jpg?v=638097817631600000', 9)
INSERT [dbo].[tb_producto] ([id_producto], [nombre_prod], [marca_prod], [precio_prod], [id_categoria], [img_prod], [stock_prod]) VALUES (9, N'Cocina Lg', N'LG', CAST(7858.00 AS Decimal(10, 2)), 2, N'	https://promart.vteximg.com.br/arquivos/img-blog-cocinalg.png?v=638096533965300000', 10)
INSERT [dbo].[tb_producto] ([id_producto], [nombre_prod], [marca_prod], [precio_prod], [id_categoria], [img_prod], [stock_prod]) VALUES (10, N'Limpiadora idratante', N'CERAVE', CAST(57.50 AS Decimal(10, 2)), 3, N'https://dcuk1cxrnzjkh.cloudfront.net/imagesproducto/023738L.jpg', 7)
INSERT [dbo].[tb_producto] ([id_producto], [nombre_prod], [marca_prod], [precio_prod], [id_categoria], [img_prod], [stock_prod]) VALUES (11, N'Crema idratante', N'CERAVE', CAST(74.90 AS Decimal(10, 2)), 3, N'https://dcuk1cxrnzjkh.cloudfront.net/imagesproducto/023735L.jpg', 9)
INSERT [dbo].[tb_producto] ([id_producto], [nombre_prod], [marca_prod], [precio_prod], [id_categoria], [img_prod], [stock_prod]) VALUES (12, N'Protector Solar', N'EUCERIN', CAST(119.90 AS Decimal(10, 2)), 3, N'https://dcuk1cxrnzjkh.cloudfront.net/imagesproducto/009064L.jpg', 10)
INSERT [dbo].[tb_producto] ([id_producto], [nombre_prod], [marca_prod], [precio_prod], [id_categoria], [img_prod], [stock_prod]) VALUES (13, N'Serum Facial', N'Roche-Posay', CAST(128.60 AS Decimal(10, 2)), 3, N'https://dcuk1cxrnzjkh.cloudfront.net/imagesproducto/030187L.jpg', 10)
INSERT [dbo].[tb_producto] ([id_producto], [nombre_prod], [marca_prod], [precio_prod], [id_categoria], [img_prod], [stock_prod]) VALUES (14, N'Honor X8A', N'HONOR', CAST(899.00 AS Decimal(10, 2)), 4, N'https://falabella.scene7.com/is/image/FalabellaPE/19684458_1?wid=240&hei=240&qlt=70&fmt=webp', 10)
INSERT [dbo].[tb_producto] ([id_producto], [nombre_prod], [marca_prod], [precio_prod], [id_categoria], [img_prod], [stock_prod]) VALUES (15, N'Galaxy A54', N'SAMSUNG', CAST(1699.00 AS Decimal(10, 2)), 4, N'https://falabella.scene7.com/is/image/FalabellaPE/19729700_2?wid=240&hei=240&qlt=70&fmt=webp', 9)
INSERT [dbo].[tb_producto] ([id_producto], [nombre_prod], [marca_prod], [precio_prod], [id_categoria], [img_prod], [stock_prod]) VALUES (16, N'Moto G22', N'MOTOROLA', CAST(599.00 AS Decimal(10, 2)), 4, N'https://s7d2.scene7.com/is/image/TottusPE/43037727_1?wid=240&hei=240&qlt=70&fmt=webp', 10)
INSERT [dbo].[tb_producto] ([id_producto], [nombre_prod], [marca_prod], [precio_prod], [id_categoria], [img_prod], [stock_prod]) VALUES (17, N'Redmi A2', N'XIAOMI', CAST(369.00 AS Decimal(10, 2)), 4, N'	https://s7d2.scene7.com/is/image/TottusPE/43040648_1?wid=240&hei=240&qlt=70&fmt=webp', 10)
INSERT [dbo].[tb_producto] ([id_producto], [nombre_prod], [marca_prod], [precio_prod], [id_categoria], [img_prod], [stock_prod]) VALUES (18, N'IPhone 11', N'APPLE', CAST(2349.00 AS Decimal(10, 2)), 4, N'https://falabella.scene7.com/is/image/FalabellaPE/18673445_2?wid=240&hei=240&qlt=70&fmt=webp', 10)
INSERT [dbo].[tb_producto] ([id_producto], [nombre_prod], [marca_prod], [precio_prod], [id_categoria], [img_prod], [stock_prod]) VALUES (19, N'Lapto Gamer', N'LENOVO', CAST(2799.00 AS Decimal(10, 2)), 5, N'https://falabella.scene7.com/is/image/FalabellaPE/882804918_2?wid=240&hei=240&qlt=70&fmt=webp', 10)
INSERT [dbo].[tb_producto] ([id_producto], [nombre_prod], [marca_prod], [precio_prod], [id_categoria], [img_prod], [stock_prod]) VALUES (20, N'Lapto Acer', N'ACER', CAST(2599.00 AS Decimal(10, 2)), 5, N'https://falabella.scene7.com/is/image/FalabellaPE/882730071_2?wid=240&hei=240&qlt=70&fmt=webp', 9)
INSERT [dbo].[tb_producto] ([id_producto], [nombre_prod], [marca_prod], [precio_prod], [id_categoria], [img_prod], [stock_prod]) VALUES (21, N'Tuf Dash', N'ASUS', CAST(4599.00 AS Decimal(10, 2)), 5, N'	https://s7d2.scene7.com/is/image/TottusPE/42913908_2?wid=240&hei=240&qlt=70&fmt=webp', 10)
INSERT [dbo].[tb_producto] ([id_producto], [nombre_prod], [marca_prod], [precio_prod], [id_categoria], [img_prod], [stock_prod]) VALUES (22, N'tv LED', N'THINQ', CAST(1499.00 AS Decimal(10, 2)), 6, N'https://s7d2.scene7.com/is/image/TottusPE/43075289_1?wid=240&hei=240&qlt=70&fmt=webp', 10)
INSERT [dbo].[tb_producto] ([id_producto], [nombre_prod], [marca_prod], [precio_prod], [id_categoria], [img_prod], [stock_prod]) VALUES (23, N'UHD 4K', N'THINQ', CAST(1799.00 AS Decimal(10, 2)), 6, N'https://falabella.scene7.com/is/image/FalabellaPE/19553402_01?wid=240&hei=240&qlt=70&fmt=webp', 10)
INSERT [dbo].[tb_producto] ([id_producto], [nombre_prod], [marca_prod], [precio_prod], [id_categoria], [img_prod], [stock_prod]) VALUES (24, N'Android 50', N'HYUNDAI', CAST(2589.00 AS Decimal(10, 2)), 6, N'https://falabella.scene7.com/is/image/FalabellaPE/882096599_01?wid=240&hei=240&qlt=70&fmt=webp', 10)
INSERT [dbo].[tb_producto] ([id_producto], [nombre_prod], [marca_prod], [precio_prod], [id_categoria], [img_prod], [stock_prod]) VALUES (25, N'Playstation 5 ', N'SONY', CAST(2849.00 AS Decimal(10, 2)), 7, N'https://falabella.scene7.com/is/image/FalabellaPE/…13895821_811420_1?wid=240&hei=240&qlt=70&fmt=webp', 10)
INSERT [dbo].[tb_producto] ([id_producto], [nombre_prod], [marca_prod], [precio_prod], [id_categoria], [img_prod], [stock_prod]) VALUES (26, N'FIFA 23', N'SONY', CAST(119.00 AS Decimal(10, 2)), 7, N'https://falabella.scene7.com/is/image/FalabellaPE/…13895907_811469_1?wid=240&hei=240&qlt=70&fmt=webp', 10)
INSERT [dbo].[tb_producto] ([id_producto], [nombre_prod], [marca_prod], [precio_prod], [id_categoria], [img_prod], [stock_prod]) VALUES (27, N'Zelda ', N'NINTENDO', CAST(229.00 AS Decimal(10, 2)), 7, N'https://falabella.scene7.com/is/image/FalabellaPE/…0460327_2677903_1?wid=240&hei=240&qlt=70&fmt=webp', 10)
INSERT [dbo].[tb_producto] ([id_producto], [nombre_prod], [marca_prod], [precio_prod], [id_categoria], [img_prod], [stock_prod]) VALUES (28, N'Super Mario', N'NINTENDO', CAST(199.00 AS Decimal(10, 2)), 7, N'	https://falabella.scene7.com/is/image/FalabellaPE/…14083512_878347_1?wid=240&hei=240&qlt=70&fmt=webp', 10)
INSERT [dbo].[tb_producto] ([id_producto], [nombre_prod], [marca_prod], [precio_prod], [id_categoria], [img_prod], [stock_prod]) VALUES (29, N'Eos T7', N'CANON', CAST(2799.00 AS Decimal(10, 2)), 8, N'https://falabella.scene7.com/is/image/FalabellaPE/…14368366_954154_1?wid=240&hei=240&qlt=70&fmt=webp', 10)
INSERT [dbo].[tb_producto] ([id_producto], [nombre_prod], [marca_prod], [precio_prod], [id_categoria], [img_prod], [stock_prod]) VALUES (30, N'Polo Deportivo', N'ALPHA FIR', CAST(79.00 AS Decimal(10, 2)), 9, N'https://falabella.scene7.com/is/image/FalabellaPE/117054085?wid=240&hei=240&qlt=70&fmt=webp', 10)
INSERT [dbo].[tb_producto] ([id_producto], [nombre_prod], [marca_prod], [precio_prod], [id_categoria], [img_prod], [stock_prod]) VALUES (31, N'Ropa elenex', N'ELENEX', CAST(79.90 AS Decimal(10, 2)), 9, N'https://falabella.scene7.com/is/image/FalabellaPE/…7726723_1875836_1?wid=240&hei=240&qlt=70&fmt=webp', 10)
INSERT [dbo].[tb_producto] ([id_producto], [nombre_prod], [marca_prod], [precio_prod], [id_categoria], [img_prod], [stock_prod]) VALUES (32, N'Casaca', N'UNIVERSITY', CAST(149.00 AS Decimal(10, 2)), 10, N'https://falabella.scene7.com/is/image/FalabellaPE/882672100_2?wid=240&hei=240&qlt=70&fmt=webp', 10)
INSERT [dbo].[tb_producto] ([id_producto], [nombre_prod], [marca_prod], [precio_prod], [id_categoria], [img_prod], [stock_prod]) VALUES (33, N'Vestido Rosa', N'GENERICO', CAST(189.00 AS Decimal(10, 2)), 10, N'	https://falabella.scene7.com/is/image/FalabellaPE/…9254843_2274866_1?wid=240&hei=240&qlt=70&fmt=webp', 10)
INSERT [dbo].[tb_producto] ([id_producto], [nombre_prod], [marca_prod], [precio_prod], [id_categoria], [img_prod], [stock_prod]) VALUES (34, N'Lentejas', N'TOTTUS', CAST(8.30 AS Decimal(10, 2)), 11, N'	https://s7d2.scene7.com/is/image/TottusPE/42276926_2?wid=240&hei=240&qlt=70&fmt=webp', 10)
INSERT [dbo].[tb_producto] ([id_producto], [nombre_prod], [marca_prod], [precio_prod], [id_categoria], [img_prod], [stock_prod]) VALUES (35, N'Frijol', N'TOTTUS', CAST(8.60 AS Decimal(10, 2)), 11, N'https://s7d2.scene7.com/is/image/TottusPE/42276929_2?wid=240&hei=240&qlt=70&fmt=webp', 10)
INSERT [dbo].[tb_producto] ([id_producto], [nombre_prod], [marca_prod], [precio_prod], [id_categoria], [img_prod], [stock_prod]) VALUES (36, N'Pop Corn', N'COSTENO', CAST(4.90 AS Decimal(10, 2)), 11, N'	https://s7d2.scene7.com/is/image/TottusPE/10167826_1?wid=240&hei=240&qlt=70&fmt=webp', 10)
INSERT [dbo].[tb_producto] ([id_producto], [nombre_prod], [marca_prod], [precio_prod], [id_categoria], [img_prod], [stock_prod]) VALUES (37, N'Tripack', N'COCA COLA', CAST(26.90 AS Decimal(10, 2)), 12, N'https://s7d2.scene7.com/is/image/TottusPE/41057709_1?wid=240&hei=240&qlt=70&fmt=webp', 10)
INSERT [dbo].[tb_producto] ([id_producto], [nombre_prod], [marca_prod], [precio_prod], [id_categoria], [img_prod], [stock_prod]) VALUES (38, N'Alcohol de limon', N'MIKES', CAST(21.90 AS Decimal(10, 2)), 12, N'	https://s7d2.scene7.com/is/image/TottusPE/42343802_1?wid=240&hei=240&qlt=70&fmt=webp', 10)
INSERT [dbo].[tb_producto] ([id_producto], [nombre_prod], [marca_prod], [precio_prod], [id_categoria], [img_prod], [stock_prod]) VALUES (39, N'LAYS ONDAS', N'LAYS', CAST(6.90 AS Decimal(10, 2)), 13, N'https://s7d2.scene7.com/is/image/TottusPE/42468762_1?wid=240&hei=240&qlt=70&fmt=webp', 10)
SET IDENTITY_INSERT [dbo].[tb_producto] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_rol] ON 

INSERT [dbo].[tb_rol] ([id_rol], [nombre_rol], [activar_rol], [fechaRegistro_rol]) VALUES (2, N'ADMINISTRADOR', 1, CAST(N'2023-05-05T22:06:59.097' AS DateTime))
INSERT [dbo].[tb_rol] ([id_rol], [nombre_rol], [activar_rol], [fechaRegistro_rol]) VALUES (3, N'VENDEDOR', 1, CAST(N'2023-05-05T22:09:35.547' AS DateTime))
INSERT [dbo].[tb_rol] ([id_rol], [nombre_rol], [activar_rol], [fechaRegistro_rol]) VALUES (5, N'EMPLEADO', 1, CAST(N'2023-05-05T22:11:42.137' AS DateTime))
INSERT [dbo].[tb_rol] ([id_rol], [nombre_rol], [activar_rol], [fechaRegistro_rol]) VALUES (8, N'COMPRADOR', 1, NULL)
SET IDENTITY_INSERT [dbo].[tb_rol] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_submenuEmpresarial] ON 

INSERT [dbo].[tb_submenuEmpresarial] ([id_submenuEmpre], [id_menuEmpre], [des_submenuEmpre], [url_submenuEmpre]) VALUES (1, 1, N'Producto', N'/Mantenimiento/ListaProducto')
INSERT [dbo].[tb_submenuEmpresarial] ([id_submenuEmpre], [id_menuEmpre], [des_submenuEmpre], [url_submenuEmpre]) VALUES (2, 1, N'Usuario', N'/Mantenimiento/ListaUsuario')
INSERT [dbo].[tb_submenuEmpresarial] ([id_submenuEmpre], [id_menuEmpre], [des_submenuEmpre], [url_submenuEmpre]) VALUES (3, 2, N'Producto', N'/Consulta/CONSULTAS')
INSERT [dbo].[tb_submenuEmpresarial] ([id_submenuEmpre], [id_menuEmpre], [des_submenuEmpre], [url_submenuEmpre]) VALUES (4, 2, N'Ventas', N'/Consulta/CONSULTAproducto')
INSERT [dbo].[tb_submenuEmpresarial] ([id_submenuEmpre], [id_menuEmpre], [des_submenuEmpre], [url_submenuEmpre]) VALUES (1003, 3, N'Producto', N'/Reporte/ResultadoInfo')
INSERT [dbo].[tb_submenuEmpresarial] ([id_submenuEmpre], [id_menuEmpre], [des_submenuEmpre], [url_submenuEmpre]) VALUES (2003, 3, N'Ordenes', N'/Reporte/index')
SET IDENTITY_INSERT [dbo].[tb_submenuEmpresarial] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_Usuario] ON 

INSERT [dbo].[tb_Usuario] ([id_usu], [email_usu], [password_usu], [nombre_usu], [apellido_usu], [estado_usu], [usuario_usu], [id_rol], [nuevoUsuario_usu]) VALUES (1, N'enmira@gmail.com', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', N'Rodolfo', N'alejos', N'activo', N'rodo', 2, 2)
INSERT [dbo].[tb_Usuario] ([id_usu], [email_usu], [password_usu], [nombre_usu], [apellido_usu], [estado_usu], [usuario_usu], [id_rol], [nuevoUsuario_usu]) VALUES (10, N'xx@ci', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', N'rodo', N'rodo', N'activo', N'rodo', 8, 1)
INSERT [dbo].[tb_Usuario] ([id_usu], [email_usu], [password_usu], [nombre_usu], [apellido_usu], [estado_usu], [usuario_usu], [id_rol], [nuevoUsuario_usu]) VALUES (11, N'rodolfo@cibertec.edu.pe', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', N'alberto', N'Espinoza', N'activo', N'rodo', 2, 2)
INSERT [dbo].[tb_Usuario] ([id_usu], [email_usu], [password_usu], [nombre_usu], [apellido_usu], [estado_usu], [usuario_usu], [id_rol], [nuevoUsuario_usu]) VALUES (12, N'mayra@gmail.com', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', N'mayra', N'Espinoza', N'activo', N'mayra1', 2, 2)
SET IDENTITY_INSERT [dbo].[tb_Usuario] OFF
GO
ALTER TABLE [dbo].[tb_categoriaProducto] ADD  DEFAULT (getdate()) FOR [fechaRegistro_cate]
GO
ALTER TABLE [dbo].[tb_rol] ADD  DEFAULT (getdate()) FOR [fechaRegistro_rol]
GO
ALTER TABLE [dbo].[tb_carrito]  WITH CHECK ADD FOREIGN KEY([id_producto])
REFERENCES [dbo].[tb_producto] ([id_producto])
GO
ALTER TABLE [dbo].[tb_carrito]  WITH CHECK ADD FOREIGN KEY([id_usu])
REFERENCES [dbo].[tb_Usuario] ([id_usu])
GO
ALTER TABLE [dbo].[tb_detalleOrden]  WITH CHECK ADD FOREIGN KEY([id_producto])
REFERENCES [dbo].[tb_producto] ([id_producto])
GO
ALTER TABLE [dbo].[tb_detalleOrden]  WITH CHECK ADD FOREIGN KEY([id_orden])
REFERENCES [dbo].[tb_orden] ([id_orden])
GO
ALTER TABLE [dbo].[tb_domicilio]  WITH CHECK ADD FOREIGN KEY([id_usu])
REFERENCES [dbo].[tb_Usuario] ([id_usu])
GO
ALTER TABLE [dbo].[tb_orden]  WITH CHECK ADD FOREIGN KEY([id_domi])
REFERENCES [dbo].[tb_domicilio] ([id_domi])
GO
ALTER TABLE [dbo].[tb_orden]  WITH CHECK ADD FOREIGN KEY([id_pago])
REFERENCES [dbo].[tb_metodoPago] ([id_pago])
GO
ALTER TABLE [dbo].[tb_orden]  WITH CHECK ADD FOREIGN KEY([id_usu])
REFERENCES [dbo].[tb_Usuario] ([id_usu])
GO
ALTER TABLE [dbo].[tb_permisos]  WITH CHECK ADD FOREIGN KEY([id_rol])
REFERENCES [dbo].[tb_rol] ([id_rol])
GO
ALTER TABLE [dbo].[tb_permisos]  WITH CHECK ADD  CONSTRAINT [FK_tb_permisos_tb_menuEmpresarial] FOREIGN KEY([id_menuEmpre])
REFERENCES [dbo].[tb_menuEmpresarial] ([id_menuEmpre])
GO
ALTER TABLE [dbo].[tb_permisos] CHECK CONSTRAINT [FK_tb_permisos_tb_menuEmpresarial]
GO
ALTER TABLE [dbo].[tb_permisos]  WITH CHECK ADD  CONSTRAINT [FK_tb_permisos_tb_permisos] FOREIGN KEY([id_permiso])
REFERENCES [dbo].[tb_permisos] ([id_permiso])
GO
ALTER TABLE [dbo].[tb_permisos] CHECK CONSTRAINT [FK_tb_permisos_tb_permisos]
GO
ALTER TABLE [dbo].[tb_producto]  WITH CHECK ADD  CONSTRAINT [FK_tb_producto_tb_categoriaProducto] FOREIGN KEY([id_categoria])
REFERENCES [dbo].[tb_categoriaProducto] ([id_categoria])
GO
ALTER TABLE [dbo].[tb_producto] CHECK CONSTRAINT [FK_tb_producto_tb_categoriaProducto]
GO
ALTER TABLE [dbo].[tb_submenu]  WITH CHECK ADD FOREIGN KEY([id_menu])
REFERENCES [dbo].[tb_menu] ([id_menu])
GO
ALTER TABLE [dbo].[tb_submenuEmpresarial]  WITH CHECK ADD FOREIGN KEY([id_menuEmpre])
REFERENCES [dbo].[tb_menuEmpresarial] ([id_menuEmpre])
GO
ALTER TABLE [dbo].[tb_Usuario]  WITH CHECK ADD  CONSTRAINT [FK_tb_Usuario_tb_rol] FOREIGN KEY([id_rol])
REFERENCES [dbo].[tb_rol] ([id_rol])
GO
ALTER TABLE [dbo].[tb_Usuario] CHECK CONSTRAINT [FK_tb_Usuario_tb_rol]
GO
ALTER TABLE [dbo].[tb_Usuario]  WITH CHECK ADD  CONSTRAINT [FK_tb_Usuario_tb_Usuario] FOREIGN KEY([id_usu])
REFERENCES [dbo].[tb_Usuario] ([id_usu])
GO
ALTER TABLE [dbo].[tb_Usuario] CHECK CONSTRAINT [FK_tb_Usuario_tb_Usuario]
GO
ALTER TABLE [dbo].[tb_Usuario]  WITH CHECK ADD  CONSTRAINT [FK_tb_Usuario_tb_Usuario1] FOREIGN KEY([id_usu])
REFERENCES [dbo].[tb_Usuario] ([id_usu])
GO
ALTER TABLE [dbo].[tb_Usuario] CHECK CONSTRAINT [FK_tb_Usuario_tb_Usuario1]
GO
/****** Object:  StoredProcedure [dbo].[proc_Actualizar]    Script Date: 28/06/2023 15:56:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   procedure [dbo].[proc_Actualizar](

@codigo_usu int,
@email_usu varchar(50),
@contrasena_usu varchar(200),
@nombre_usu varchar(50),
@apellido_usu varchar(50),
@estado_usu varchar(20),
@usuario_usu varchar(50),
@id_rol int,
@nuevo_esuario int

)
as
begin
update tb_Usuario
set email_usu=@email_usu,password_usu=@contrasena_usu,nombre_usu=@nombre_usu,apellido_usu=@apellido_usu,estado_usu=@estado_usu,usuario_usu=@usuario_usu,id_rol=@id_rol,nuevoUsuario_usu=@nuevo_esuario
where id_usu=@codigo_usu
end
GO
/****** Object:  StoredProcedure [dbo].[proc_ActualizarProducto]    Script Date: 28/06/2023 15:56:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[proc_ActualizarProducto]
(
@id_produc int,
@nombre_produc varchar(50),
@marca_produc varchar(50),
@precio_produc decimal(10,2),
@id_categoria int,
@img_producto varchar(300),
@stock_produc int
)
as
begin
update tb_producto
set nombre_prod=@nombre_produc,marca_prod=@marca_produc,precio_prod=@precio_produc,id_categoria=@id_categoria,img_prod=@img_producto,stock_prod=@stock_produc
where id_producto=@id_produc
end
GO
/****** Object:  StoredProcedure [dbo].[proc_AgregarProducto]    Script Date: 28/06/2023 15:56:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[proc_AgregarProducto]
(
@nombre_produc varchar(50),
@marca_produc varchar(50),
@precio_produc decimal(10,2),
@id_categoria int,
@img_producto varchar(300),
@stock_produc int

)
as
begin
insert tb_producto 
values(@nombre_produc,@marca_produc,@precio_produc,@id_categoria,@img_producto,@stock_produc)
end
GO
/****** Object:  StoredProcedure [dbo].[proc_AgregarUsuario]    Script Date: 28/06/2023 15:56:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[proc_AgregarUsuario](

@email_usu varchar(50),
@contrasena_usu varchar(200),
@nombre_usu varchar(50),
@apellido_usu varchar(50),
@estado_usu varchar(20),
@usuario_usu varchar(50),
@id_rol int,
@nuevo_esuario int
)
as
begin
insert tb_Usuario values(@email_usu,@contrasena_usu,@nombre_usu,@apellido_usu,@estado_usu,@usuario_usu,@id_rol,@nuevo_esuario)
end
GO
/****** Object:  StoredProcedure [dbo].[proc_buscarproducto]    Script Date: 28/06/2023 15:56:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[proc_buscarproducto]
(
@nombre varchar(60)
)
as
begin 
  select c.id_categoria from tb_producto b inner join tb_categoriaProducto c on b.id_categoria=c.id_categoria where nombre_prod like '%'+@nombre+'%'
end
GO
/****** Object:  StoredProcedure [dbo].[proc_EliminarProducto]    Script Date: 28/06/2023 15:56:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[proc_EliminarProducto]
(
@id_produc int
)
as
begin
delete from tb_producto where id_producto=@id_produc
end
GO
/****** Object:  StoredProcedure [dbo].[proc_EliminarUsuario]    Script Date: 28/06/2023 15:56:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[proc_EliminarUsuario]
(
@codigo_usu int

)
as
begin
delete from tb_Usuario where id_usu=@codigo_usu
end
GO
/****** Object:  StoredProcedure [dbo].[productoReporte]    Script Date: 28/06/2023 15:56:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[productoReporte]
as
begin
select p.id_producto,p.nombre_prod,p.marca_prod,p.precio_prod,c.descripcion_cate,p.stock_prod from tb_producto p
left join tb_categoriaProducto c on p.id_categoria=c.id_categoria
end
GO
/****** Object:  StoredProcedure [dbo].[Reporte]    Script Date: 28/06/2023 15:56:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   procedure [dbo].[Reporte]
(
@id int 
)
as
begin
select *,d.id_producto,d.cantidad_detalle from tb_orden o inner join tb_detalleOrden d on o.id_orden=d.id_orden where o.id_orden=@id
end
GO
/****** Object:  StoredProcedure [dbo].[ReporteCompras]    Script Date: 28/06/2023 15:56:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[ReporteCompras]
(
@id int 
)
as
begin
select o.id_orden,o.id_usu,mt.nombre_pago,o.total,d.precio_detalle,o.fechaOrden,p.nombre_prod,d.cantidad_detalle from tb_detalleOrden d inner join tb_producto p on d.id_producto=p.id_producto inner join
          tb_orden o  on  d.id_orden=o.id_orden inner join tb_metodoPago mt on o.id_pago=mt.id_pago where o.id_orden=@id 
end
GO
/****** Object:  StoredProcedure [dbo].[UsuarioReporte]    Script Date: 28/06/2023 15:56:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[UsuarioReporte]
as
begin
select u.id_usu,u.email_usu,u.nombre_usu,u.apellido_usu,r.nombre_rol from tb_Usuario u 
left join tb_rol r on u.id_rol=r.id_rol
end
GO
USE [master]
GO
ALTER DATABASE [Proyecto_servicios_web_2023] SET  READ_WRITE 
GO
