USE [master]
GO
/****** Object:  Database [bdLoteria]    Script Date: 09/21/2024 22:05:37 ******/
CREATE DATABASE [bdLoteria] ON  PRIMARY 
( NAME = N'bdLoteria', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\bdLoteria.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'bdLoteria_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\bdLoteria_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [bdLoteria] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bdLoteria].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bdLoteria] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [bdLoteria] SET ANSI_NULLS OFF
GO
ALTER DATABASE [bdLoteria] SET ANSI_PADDING OFF
GO
ALTER DATABASE [bdLoteria] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [bdLoteria] SET ARITHABORT OFF
GO
ALTER DATABASE [bdLoteria] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [bdLoteria] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [bdLoteria] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [bdLoteria] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [bdLoteria] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [bdLoteria] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [bdLoteria] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [bdLoteria] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [bdLoteria] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [bdLoteria] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [bdLoteria] SET  DISABLE_BROKER
GO
ALTER DATABASE [bdLoteria] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [bdLoteria] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [bdLoteria] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [bdLoteria] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [bdLoteria] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [bdLoteria] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [bdLoteria] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [bdLoteria] SET  READ_WRITE
GO
ALTER DATABASE [bdLoteria] SET RECOVERY FULL
GO
ALTER DATABASE [bdLoteria] SET  MULTI_USER
GO
ALTER DATABASE [bdLoteria] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [bdLoteria] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'bdLoteria', N'ON'
GO
USE [bdLoteria]
GO
/****** Object:  Table [dbo].[registroIngreso]    Script Date: 09/21/2024 22:05:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[registroIngreso](
	[id_registroIngreso] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NULL,
	[fechaIngreso] [datetime2](7) NULL,
 CONSTRAINT [PK_registroIngreso] PRIMARY KEY CLUSTERED 
(
	[id_registroIngreso] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pasarelaPago]    Script Date: 09/21/2024 22:05:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[pasarelaPago](
	[id_pasarelaPago] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NOT NULL,
	[estado] [varchar](50) NOT NULL,
	[monto] [float] NOT NULL,
 CONSTRAINT [PK_pasarelaPago] PRIMARY KEY CLUSTERED 
(
	[id_pasarelaPago] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[estadoCuenta]    Script Date: 09/21/2024 22:05:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estadoCuenta](
	[id_estadoCuenta] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NOT NULL,
	[saldoDisponible] [float] NULL,
 CONSTRAINT [PK_estadoCuenta] PRIMARY KEY CLUSTERED 
(
	[id_estadoCuenta] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 09/21/2024 22:05:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[nombres] [varchar](100) NOT NULL,
	[apellidos] [varchar](100) NOT NULL,
	[dni] [varchar](10) NOT NULL,
	[fechaNacimiento] [date] NOT NULL,
	[id_tipoDocumento] [int] NOT NULL,
	[email] [varchar](150) NOT NULL,
	[direccion] [varchar](150) NOT NULL,
	[id_departamento] [int] NOT NULL,
	[id_provincia] [int] NOT NULL,
	[id_distrito] [int] NOT NULL,
	[codigoPostal] [varchar](10) NULL,
	[contrasena] [varchar](350) NOT NULL,
	[celular] [varchar](50) NOT NULL,
	[id_tipoUsuario] [int] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON
INSERT [dbo].[Usuario] ([id_usuario], [nombres], [apellidos], [dni], [fechaNacimiento], [id_tipoDocumento], [email], [direccion], [id_departamento], [id_provincia], [id_distrito], [codigoPostal], [contrasena], [celular], [id_tipoUsuario]) VALUES (1, N'ronny', N'chomba', N'44699394', CAST(0xBC120B00 AS Date), 1, N'crey15@hotmail.com', N'dir1', 6, 1, 1, N'060101', N'12341321', N'976359272', 1)
INSERT [dbo].[Usuario] ([id_usuario], [nombres], [apellidos], [dni], [fechaNacimiento], [id_tipoDocumento], [email], [direccion], [id_departamento], [id_provincia], [id_distrito], [codigoPostal], [contrasena], [celular], [id_tipoUsuario]) VALUES (2, N'nico', N'de chomba', N'44699395', CAST(0xBC120B00 AS Date), 1, N'crey153@hotmail.com', N'dir4', 6, 1, 1, N'060101', N'888888', N'976359288', 1)
INSERT [dbo].[Usuario] ([id_usuario], [nombres], [apellidos], [dni], [fechaNacimiento], [id_tipoDocumento], [email], [direccion], [id_departamento], [id_provincia], [id_distrito], [codigoPostal], [contrasena], [celular], [id_tipoUsuario]) VALUES (3, N'alex', N'horna de chomba', N'44699396', CAST(0xBC120B00 AS Date), 1, N'crey1533@hotmail.com', N'dir4', 6, 1, 1, N'060101', N'123123', N'976359280', 2)
INSERT [dbo].[Usuario] ([id_usuario], [nombres], [apellidos], [dni], [fechaNacimiento], [id_tipoDocumento], [email], [direccion], [id_departamento], [id_provincia], [id_distrito], [codigoPostal], [contrasena], [celular], [id_tipoUsuario]) VALUES (4, N'jimmy', N'linares de chomba', N'44699397', CAST(0xBC120B00 AS Date), 1, N'crey18@hotmail.com', N'dir4', 6, 1, 1, N'060101', N'22222', N'976359546', 3)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
/****** Object:  Table [dbo].[ubigeo_peru_provinces]    Script Date: 09/21/2024 22:05:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ubigeo_peru_provinces](
	[id] [varchar](4) NOT NULL,
	[name] [varchar](45) NOT NULL,
	[department_id] [varchar](2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0101', N'Chachapoyas', N'01')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0102', N'Bagua', N'01')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0103', N'Bongará', N'01')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0104', N'Condorcanqui', N'01')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0105', N'Luya', N'01')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0106', N'Rodríguez de Mendoza', N'01')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0107', N'Utcubamba', N'01')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0201', N'Huaraz', N'02')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0202', N'Aija', N'02')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0203', N'Antonio Raymondi', N'02')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0204', N'Asunción', N'02')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0205', N'Bolognesi', N'02')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0206', N'Carhuaz', N'02')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0207', N'Carlos Fermín Fitzcarrald', N'02')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0208', N'Casma', N'02')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0209', N'Corongo', N'02')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0210', N'Huari', N'02')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0211', N'Huarmey', N'02')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0212', N'Huaylas', N'02')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0213', N'Mariscal Luzuriaga', N'02')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0214', N'Ocros', N'02')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0215', N'Pallasca', N'02')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0216', N'Pomabamba', N'02')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0217', N'Recuay', N'02')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0218', N'Santa', N'02')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0219', N'Sihuas', N'02')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0220', N'Yungay', N'02')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0301', N'Abancay', N'03')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0302', N'Andahuaylas', N'03')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0303', N'Antabamba', N'03')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0304', N'Aymaraes', N'03')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0305', N'Cotabambas', N'03')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0306', N'Chincheros', N'03')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0307', N'Grau', N'03')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0401', N'Arequipa', N'04')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0402', N'Camaná', N'04')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0403', N'Caravelí', N'04')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0404', N'Castilla', N'04')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0405', N'Caylloma', N'04')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0406', N'Condesuyos', N'04')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0407', N'Islay', N'04')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0408', N'La Uniòn', N'04')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0501', N'Huamanga', N'05')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0502', N'Cangallo', N'05')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0503', N'Huanca Sancos', N'05')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0504', N'Huanta', N'05')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0505', N'La Mar', N'05')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0506', N'Lucanas', N'05')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0507', N'Parinacochas', N'05')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0508', N'Pàucar del Sara Sara', N'05')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0509', N'Sucre', N'05')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0510', N'Víctor Fajardo', N'05')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0511', N'Vilcas Huamán', N'05')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0601', N'Cajamarca', N'06')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0602', N'Cajabamba', N'06')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0603', N'Celendín', N'06')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0604', N'Chota', N'06')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0605', N'Contumazá', N'06')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0606', N'Cutervo', N'06')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0607', N'Hualgayoc', N'06')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0608', N'Jaén', N'06')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0609', N'San Ignacio', N'06')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0610', N'San Marcos', N'06')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0611', N'San Miguel', N'06')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0612', N'San Pablo', N'06')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0613', N'Santa Cruz', N'06')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0701', N'Prov. Const. del Callao', N'07')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0801', N'Cusco', N'08')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0802', N'Acomayo', N'08')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0803', N'Anta', N'08')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0804', N'Calca', N'08')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0805', N'Canas', N'08')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0806', N'Canchis', N'08')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0807', N'Chumbivilcas', N'08')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0808', N'Espinar', N'08')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0809', N'La Convención', N'08')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0810', N'Paruro', N'08')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0811', N'Paucartambo', N'08')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0812', N'Quispicanchi', N'08')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0813', N'Urubamba', N'08')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0901', N'Huancavelica', N'09')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0902', N'Acobamba', N'09')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0903', N'Angaraes', N'09')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0904', N'Castrovirreyna', N'09')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0905', N'Churcampa', N'09')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0906', N'Huaytará', N'09')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'0907', N'Tayacaja', N'09')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1001', N'Huánuco', N'10')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1002', N'Ambo', N'10')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1003', N'Dos de Mayo', N'10')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1004', N'Huacaybamba', N'10')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1005', N'Huamalíes', N'10')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1006', N'Leoncio Prado', N'10')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1007', N'Marañón', N'10')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1008', N'Pachitea', N'10')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1009', N'Puerto Inca', N'10')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1010', N'Lauricocha ', N'10')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1011', N'Yarowilca ', N'10')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1101', N'Ica ', N'11')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1102', N'Chincha ', N'11')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1103', N'Nasca ', N'11')
GO
print 'Processed 100 total records'
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1104', N'Palpa ', N'11')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1105', N'Pisco ', N'11')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1201', N'Huancayo ', N'12')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1202', N'Concepción ', N'12')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1203', N'Chanchamayo ', N'12')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1204', N'Jauja ', N'12')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1205', N'Junín ', N'12')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1206', N'Satipo ', N'12')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1207', N'Tarma ', N'12')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1208', N'Yauli ', N'12')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1209', N'Chupaca ', N'12')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1301', N'Trujillo ', N'13')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1302', N'Ascope ', N'13')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1303', N'Bolívar ', N'13')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1304', N'Chepén ', N'13')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1305', N'Julcán ', N'13')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1306', N'Otuzco ', N'13')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1307', N'Pacasmayo ', N'13')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1308', N'Pataz ', N'13')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1309', N'Sánchez Carrión ', N'13')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1310', N'Santiago de Chuco ', N'13')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1311', N'Gran Chimú ', N'13')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1312', N'Virú ', N'13')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1401', N'Chiclayo ', N'14')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1402', N'Ferreñafe ', N'14')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1403', N'Lambayeque ', N'14')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1501', N'Lima ', N'15')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1502', N'Barranca ', N'15')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1503', N'Cajatambo ', N'15')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1504', N'Canta ', N'15')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1505', N'Cañete ', N'15')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1506', N'Huaral ', N'15')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1507', N'Huarochirí ', N'15')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1508', N'Huaura ', N'15')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1509', N'Oyón ', N'15')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1510', N'Yauyos ', N'15')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1601', N'Maynas ', N'16')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1602', N'Alto Amazonas ', N'16')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1603', N'Loreto ', N'16')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1604', N'Mariscal Ramón Castilla ', N'16')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1605', N'Requena ', N'16')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1606', N'Ucayali ', N'16')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1607', N'Datem del Marañón ', N'16')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1608', N'Putumayo', N'16')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1701', N'Tambopata ', N'17')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1702', N'Manu ', N'17')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1703', N'Tahuamanu ', N'17')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1801', N'Mariscal Nieto ', N'18')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1802', N'General Sánchez Cerro ', N'18')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1803', N'Ilo ', N'18')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1901', N'Pasco ', N'19')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1902', N'Daniel Alcides Carrión ', N'19')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'1903', N'Oxapampa ', N'19')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'2001', N'Piura ', N'20')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'2002', N'Ayabaca ', N'20')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'2003', N'Huancabamba ', N'20')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'2004', N'Morropón ', N'20')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'2005', N'Paita ', N'20')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'2006', N'Sullana ', N'20')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'2007', N'Talara ', N'20')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'2008', N'Sechura ', N'20')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'2101', N'Puno ', N'21')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'2102', N'Azángaro ', N'21')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'2103', N'Carabaya ', N'21')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'2104', N'Chucuito ', N'21')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'2105', N'El Collao ', N'21')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'2106', N'Huancané ', N'21')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'2107', N'Lampa ', N'21')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'2108', N'Melgar ', N'21')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'2109', N'Moho ', N'21')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'2110', N'San Antonio de Putina ', N'21')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'2111', N'San Román ', N'21')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'2112', N'Sandia ', N'21')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'2113', N'Yunguyo ', N'21')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'2201', N'Moyobamba ', N'22')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'2202', N'Bellavista ', N'22')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'2203', N'El Dorado ', N'22')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'2204', N'Huallaga ', N'22')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'2205', N'Lamas ', N'22')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'2206', N'Mariscal Cáceres ', N'22')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'2207', N'Picota ', N'22')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'2208', N'Rioja ', N'22')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'2209', N'San Martín ', N'22')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'2210', N'Tocache ', N'22')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'2301', N'Tacna ', N'23')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'2302', N'Candarave ', N'23')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'2303', N'Jorge Basadre ', N'23')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'2304', N'Tarata ', N'23')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'2401', N'Tumbes ', N'24')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'2402', N'Contralmirante Villar ', N'24')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'2403', N'Zarumilla ', N'24')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'2501', N'Coronel Portillo ', N'25')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'2502', N'Atalaya ', N'25')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'2503', N'Padre Abad ', N'25')
INSERT [dbo].[ubigeo_peru_provinces] ([id], [name], [department_id]) VALUES (N'2504', N'Purús', N'25')
/****** Object:  Table [dbo].[ubigeo_peru_districts]    Script Date: 09/21/2024 22:05:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ubigeo_peru_districts](
	[id] [varchar](6) NOT NULL,
	[name] [varchar](45) NULL,
	[province_id] [varchar](4) NULL,
	[department_id] [varchar](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010101', N'Chachapoyas', N'0101', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010102', N'Asunción', N'0101', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010103', N'Balsas', N'0101', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010104', N'Cheto', N'0101', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010105', N'Chiliquin', N'0101', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010106', N'Chuquibamba', N'0101', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010107', N'Granada', N'0101', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010108', N'Huancas', N'0101', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010109', N'La Jalca', N'0101', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010110', N'Leimebamba', N'0101', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010111', N'Levanto', N'0101', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010112', N'Magdalena', N'0101', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010113', N'Mariscal Castilla', N'0101', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010114', N'Molinopampa', N'0101', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010115', N'Montevideo', N'0101', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010116', N'Olleros', N'0101', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010117', N'Quinjalca', N'0101', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010118', N'San Francisco de Daguas', N'0101', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010119', N'San Isidro de Maino', N'0101', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010120', N'Soloco', N'0101', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010121', N'Sonche', N'0101', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010201', N'Bagua', N'0102', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010202', N'Aramango', N'0102', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010203', N'Copallin', N'0102', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010204', N'El Parco', N'0102', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010205', N'Imaza', N'0102', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010206', N'La Peca', N'0102', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010301', N'Jumbilla', N'0103', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010302', N'Chisquilla', N'0103', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010303', N'Churuja', N'0103', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010304', N'Corosha', N'0103', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010305', N'Cuispes', N'0103', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010306', N'Florida', N'0103', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010307', N'Jazan', N'0103', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010308', N'Recta', N'0103', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010309', N'San Carlos', N'0103', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010310', N'Shipasbamba', N'0103', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010311', N'Valera', N'0103', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010312', N'Yambrasbamba', N'0103', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010401', N'Nieva', N'0104', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010402', N'El Cenepa', N'0104', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010403', N'Río Santiago', N'0104', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010501', N'Lamud', N'0105', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010502', N'Camporredondo', N'0105', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010503', N'Cocabamba', N'0105', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010504', N'Colcamar', N'0105', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010505', N'Conila', N'0105', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010506', N'Inguilpata', N'0105', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010507', N'Longuita', N'0105', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010508', N'Lonya Chico', N'0105', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010509', N'Luya', N'0105', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010510', N'Luya Viejo', N'0105', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010511', N'María', N'0105', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010512', N'Ocalli', N'0105', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010513', N'Ocumal', N'0105', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010514', N'Pisuquia', N'0105', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010515', N'Providencia', N'0105', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010516', N'San Cristóbal', N'0105', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010517', N'San Francisco de Yeso', N'0105', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010518', N'San Jerónimo', N'0105', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010519', N'San Juan de Lopecancha', N'0105', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010520', N'Santa Catalina', N'0105', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010521', N'Santo Tomas', N'0105', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010522', N'Tingo', N'0105', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010523', N'Trita', N'0105', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010601', N'San Nicolás', N'0106', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010602', N'Chirimoto', N'0106', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010603', N'Cochamal', N'0106', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010604', N'Huambo', N'0106', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010605', N'Limabamba', N'0106', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010606', N'Longar', N'0106', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010607', N'Mariscal Benavides', N'0106', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010608', N'Milpuc', N'0106', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010609', N'Omia', N'0106', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010610', N'Santa Rosa', N'0106', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010611', N'Totora', N'0106', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010612', N'Vista Alegre', N'0106', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010701', N'Bagua Grande', N'0107', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010702', N'Cajaruro', N'0107', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010703', N'Cumba', N'0107', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010704', N'El Milagro', N'0107', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010705', N'Jamalca', N'0107', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010706', N'Lonya Grande', N'0107', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'010707', N'Yamon', N'0107', N'01')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020101', N'Huaraz', N'0201', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020102', N'Cochabamba', N'0201', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020103', N'Colcabamba', N'0201', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020104', N'Huanchay', N'0201', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020105', N'Independencia', N'0201', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020106', N'Jangas', N'0201', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020107', N'La Libertad', N'0201', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020108', N'Olleros', N'0201', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020109', N'Pampas Grande', N'0201', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020110', N'Pariacoto', N'0201', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020111', N'Pira', N'0201', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020112', N'Tarica', N'0201', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020201', N'Aija', N'0202', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020202', N'Coris', N'0202', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020203', N'Huacllan', N'0202', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020204', N'La Merced', N'0202', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020205', N'Succha', N'0202', N'02')
GO
print 'Processed 100 total records'
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020301', N'Llamellin', N'0203', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020302', N'Aczo', N'0203', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020303', N'Chaccho', N'0203', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020304', N'Chingas', N'0203', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020305', N'Mirgas', N'0203', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020306', N'San Juan de Rontoy', N'0203', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020401', N'Chacas', N'0204', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020402', N'Acochaca', N'0204', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020501', N'Chiquian', N'0205', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020502', N'Abelardo Pardo Lezameta', N'0205', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020503', N'Antonio Raymondi', N'0205', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020504', N'Aquia', N'0205', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020505', N'Cajacay', N'0205', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020506', N'Canis', N'0205', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020507', N'Colquioc', N'0205', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020508', N'Huallanca', N'0205', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020509', N'Huasta', N'0205', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020510', N'Huayllacayan', N'0205', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020511', N'La Primavera', N'0205', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020512', N'Mangas', N'0205', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020513', N'Pacllon', N'0205', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020514', N'San Miguel de Corpanqui', N'0205', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020515', N'Ticllos', N'0205', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020601', N'Carhuaz', N'0206', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020602', N'Acopampa', N'0206', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020603', N'Amashca', N'0206', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020604', N'Anta', N'0206', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020605', N'Ataquero', N'0206', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020606', N'Marcara', N'0206', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020607', N'Pariahuanca', N'0206', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020608', N'San Miguel de Aco', N'0206', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020609', N'Shilla', N'0206', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020610', N'Tinco', N'0206', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020611', N'Yungar', N'0206', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020701', N'San Luis', N'0207', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020702', N'San Nicolás', N'0207', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020703', N'Yauya', N'0207', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020801', N'Casma', N'0208', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020802', N'Buena Vista Alta', N'0208', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020803', N'Comandante Noel', N'0208', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020804', N'Yautan', N'0208', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020901', N'Corongo', N'0209', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020902', N'Aco', N'0209', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020903', N'Bambas', N'0209', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020904', N'Cusca', N'0209', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020905', N'La Pampa', N'0209', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020906', N'Yanac', N'0209', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'020907', N'Yupan', N'0209', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021001', N'Huari', N'0210', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021002', N'Anra', N'0210', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021003', N'Cajay', N'0210', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021004', N'Chavin de Huantar', N'0210', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021005', N'Huacachi', N'0210', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021006', N'Huacchis', N'0210', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021007', N'Huachis', N'0210', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021008', N'Huantar', N'0210', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021009', N'Masin', N'0210', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021010', N'Paucas', N'0210', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021011', N'Ponto', N'0210', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021012', N'Rahuapampa', N'0210', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021013', N'Rapayan', N'0210', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021014', N'San Marcos', N'0210', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021015', N'San Pedro de Chana', N'0210', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021016', N'Uco', N'0210', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021101', N'Huarmey', N'0211', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021102', N'Cochapeti', N'0211', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021103', N'Culebras', N'0211', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021104', N'Huayan', N'0211', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021105', N'Malvas', N'0211', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021201', N'Caraz', N'0212', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021202', N'Huallanca', N'0212', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021203', N'Huata', N'0212', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021204', N'Huaylas', N'0212', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021205', N'Mato', N'0212', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021206', N'Pamparomas', N'0212', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021207', N'Pueblo Libre', N'0212', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021208', N'Santa Cruz', N'0212', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021209', N'Santo Toribio', N'0212', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021210', N'Yuracmarca', N'0212', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021301', N'Piscobamba', N'0213', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021302', N'Casca', N'0213', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021303', N'Eleazar Guzmán Barron', N'0213', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021304', N'Fidel Olivas Escudero', N'0213', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021305', N'Llama', N'0213', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021306', N'Llumpa', N'0213', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021307', N'Lucma', N'0213', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021308', N'Musga', N'0213', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021401', N'Ocros', N'0214', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021402', N'Acas', N'0214', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021403', N'Cajamarquilla', N'0214', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021404', N'Carhuapampa', N'0214', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021405', N'Cochas', N'0214', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021406', N'Congas', N'0214', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021407', N'Llipa', N'0214', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021408', N'San Cristóbal de Rajan', N'0214', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021409', N'San Pedro', N'0214', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021410', N'Santiago de Chilcas', N'0214', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021501', N'Cabana', N'0215', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021502', N'Bolognesi', N'0215', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021503', N'Conchucos', N'0215', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021504', N'Huacaschuque', N'0215', N'02')
GO
print 'Processed 200 total records'
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021505', N'Huandoval', N'0215', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021506', N'Lacabamba', N'0215', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021507', N'Llapo', N'0215', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021508', N'Pallasca', N'0215', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021509', N'Pampas', N'0215', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021510', N'Santa Rosa', N'0215', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021511', N'Tauca', N'0215', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021601', N'Pomabamba', N'0216', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021602', N'Huayllan', N'0216', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021603', N'Parobamba', N'0216', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021604', N'Quinuabamba', N'0216', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021701', N'Recuay', N'0217', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021702', N'Catac', N'0217', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021703', N'Cotaparaco', N'0217', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021704', N'Huayllapampa', N'0217', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021705', N'Llacllin', N'0217', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021706', N'Marca', N'0217', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021707', N'Pampas Chico', N'0217', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021708', N'Pararin', N'0217', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021709', N'Tapacocha', N'0217', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021710', N'Ticapampa', N'0217', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021801', N'Chimbote', N'0218', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021802', N'Cáceres del Perú', N'0218', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021803', N'Coishco', N'0218', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021804', N'Macate', N'0218', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021805', N'Moro', N'0218', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021806', N'Nepeña', N'0218', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021807', N'Samanco', N'0218', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021808', N'Santa', N'0218', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021809', N'Nuevo Chimbote', N'0218', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021901', N'Sihuas', N'0219', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021902', N'Acobamba', N'0219', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021903', N'Alfonso Ugarte', N'0219', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021904', N'Cashapampa', N'0219', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021905', N'Chingalpo', N'0219', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021906', N'Huayllabamba', N'0219', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021907', N'Quiches', N'0219', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021908', N'Ragash', N'0219', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021909', N'San Juan', N'0219', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'021910', N'Sicsibamba', N'0219', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'022001', N'Yungay', N'0220', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'022002', N'Cascapara', N'0220', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'022003', N'Mancos', N'0220', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'022004', N'Matacoto', N'0220', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'022005', N'Quillo', N'0220', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'022006', N'Ranrahirca', N'0220', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'022007', N'Shupluy', N'0220', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'022008', N'Yanama', N'0220', N'02')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030101', N'Abancay', N'0301', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030102', N'Chacoche', N'0301', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030103', N'Circa', N'0301', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030104', N'Curahuasi', N'0301', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030105', N'Huanipaca', N'0301', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030106', N'Lambrama', N'0301', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030107', N'Pichirhua', N'0301', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030108', N'San Pedro de Cachora', N'0301', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030109', N'Tamburco', N'0301', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030201', N'Andahuaylas', N'0302', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030202', N'Andarapa', N'0302', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030203', N'Chiara', N'0302', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030204', N'Huancarama', N'0302', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030205', N'Huancaray', N'0302', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030206', N'Huayana', N'0302', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030207', N'Kishuara', N'0302', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030208', N'Pacobamba', N'0302', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030209', N'Pacucha', N'0302', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030210', N'Pampachiri', N'0302', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030211', N'Pomacocha', N'0302', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030212', N'San Antonio de Cachi', N'0302', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030213', N'San Jerónimo', N'0302', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030214', N'San Miguel de Chaccrampa', N'0302', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030215', N'Santa María de Chicmo', N'0302', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030216', N'Talavera', N'0302', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030217', N'Tumay Huaraca', N'0302', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030218', N'Turpo', N'0302', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030219', N'Kaquiabamba', N'0302', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030220', N'José María Arguedas', N'0302', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030301', N'Antabamba', N'0303', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030302', N'El Oro', N'0303', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030303', N'Huaquirca', N'0303', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030304', N'Juan Espinoza Medrano', N'0303', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030305', N'Oropesa', N'0303', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030306', N'Pachaconas', N'0303', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030307', N'Sabaino', N'0303', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030401', N'Chalhuanca', N'0304', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030402', N'Capaya', N'0304', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030403', N'Caraybamba', N'0304', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030404', N'Chapimarca', N'0304', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030405', N'Colcabamba', N'0304', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030406', N'Cotaruse', N'0304', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030407', N'Ihuayllo', N'0304', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030408', N'Justo Apu Sahuaraura', N'0304', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030409', N'Lucre', N'0304', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030410', N'Pocohuanca', N'0304', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030411', N'San Juan de Chacña', N'0304', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030412', N'Sañayca', N'0304', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030413', N'Soraya', N'0304', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030414', N'Tapairihua', N'0304', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030415', N'Tintay', N'0304', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030416', N'Toraya', N'0304', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030417', N'Yanaca', N'0304', N'03')
GO
print 'Processed 300 total records'
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030501', N'Tambobamba', N'0305', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030502', N'Cotabambas', N'0305', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030503', N'Coyllurqui', N'0305', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030504', N'Haquira', N'0305', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030505', N'Mara', N'0305', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030506', N'Challhuahuacho', N'0305', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030601', N'Chincheros', N'0306', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030602', N'Anco_Huallo', N'0306', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030603', N'Cocharcas', N'0306', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030604', N'Huaccana', N'0306', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030605', N'Ocobamba', N'0306', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030606', N'Ongoy', N'0306', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030607', N'Uranmarca', N'0306', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030608', N'Ranracancha', N'0306', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030609', N'Rocchacc', N'0306', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030610', N'El Porvenir', N'0306', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030611', N'Los Chankas', N'0306', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030701', N'Chuquibambilla', N'0307', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030702', N'Curpahuasi', N'0307', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030703', N'Gamarra', N'0307', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030704', N'Huayllati', N'0307', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030705', N'Mamara', N'0307', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030706', N'Micaela Bastidas', N'0307', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030707', N'Pataypampa', N'0307', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030708', N'Progreso', N'0307', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030709', N'San Antonio', N'0307', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030710', N'Santa Rosa', N'0307', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030711', N'Turpay', N'0307', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030712', N'Vilcabamba', N'0307', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030713', N'Virundo', N'0307', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'030714', N'Curasco', N'0307', N'03')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040101', N'Arequipa', N'0401', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040102', N'Alto Selva Alegre', N'0401', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040103', N'Cayma', N'0401', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040104', N'Cerro Colorado', N'0401', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040105', N'Characato', N'0401', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040106', N'Chiguata', N'0401', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040107', N'Jacobo Hunter', N'0401', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040108', N'La Joya', N'0401', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040109', N'Mariano Melgar', N'0401', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040110', N'Miraflores', N'0401', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040111', N'Mollebaya', N'0401', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040112', N'Paucarpata', N'0401', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040113', N'Pocsi', N'0401', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040114', N'Polobaya', N'0401', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040115', N'Quequeña', N'0401', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040116', N'Sabandia', N'0401', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040117', N'Sachaca', N'0401', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040118', N'San Juan de Siguas', N'0401', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040119', N'San Juan de Tarucani', N'0401', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040120', N'Santa Isabel de Siguas', N'0401', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040121', N'Santa Rita de Siguas', N'0401', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040122', N'Socabaya', N'0401', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040123', N'Tiabaya', N'0401', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040124', N'Uchumayo', N'0401', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040125', N'Vitor', N'0401', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040126', N'Yanahuara', N'0401', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040127', N'Yarabamba', N'0401', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040128', N'Yura', N'0401', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040129', N'José Luis Bustamante Y Rivero', N'0401', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040201', N'Camaná', N'0402', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040202', N'José María Quimper', N'0402', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040203', N'Mariano Nicolás Valcárcel', N'0402', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040204', N'Mariscal Cáceres', N'0402', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040205', N'Nicolás de Pierola', N'0402', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040206', N'Ocoña', N'0402', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040207', N'Quilca', N'0402', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040208', N'Samuel Pastor', N'0402', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040301', N'Caravelí', N'0403', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040302', N'Acarí', N'0403', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040303', N'Atico', N'0403', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040304', N'Atiquipa', N'0403', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040305', N'Bella Unión', N'0403', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040306', N'Cahuacho', N'0403', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040307', N'Chala', N'0403', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040308', N'Chaparra', N'0403', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040309', N'Huanuhuanu', N'0403', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040310', N'Jaqui', N'0403', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040311', N'Lomas', N'0403', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040312', N'Quicacha', N'0403', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040313', N'Yauca', N'0403', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040401', N'Aplao', N'0404', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040402', N'Andagua', N'0404', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040403', N'Ayo', N'0404', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040404', N'Chachas', N'0404', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040405', N'Chilcaymarca', N'0404', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040406', N'Choco', N'0404', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040407', N'Huancarqui', N'0404', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040408', N'Machaguay', N'0404', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040409', N'Orcopampa', N'0404', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040410', N'Pampacolca', N'0404', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040411', N'Tipan', N'0404', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040412', N'Uñon', N'0404', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040413', N'Uraca', N'0404', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040414', N'Viraco', N'0404', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040501', N'Chivay', N'0405', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040502', N'Achoma', N'0405', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040503', N'Cabanaconde', N'0405', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040504', N'Callalli', N'0405', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040505', N'Caylloma', N'0405', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040506', N'Coporaque', N'0405', N'04')
GO
print 'Processed 400 total records'
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040507', N'Huambo', N'0405', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040508', N'Huanca', N'0405', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040509', N'Ichupampa', N'0405', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040510', N'Lari', N'0405', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040511', N'Lluta', N'0405', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040512', N'Maca', N'0405', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040513', N'Madrigal', N'0405', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040514', N'San Antonio de Chuca', N'0405', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040515', N'Sibayo', N'0405', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040516', N'Tapay', N'0405', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040517', N'Tisco', N'0405', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040518', N'Tuti', N'0405', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040519', N'Yanque', N'0405', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040520', N'Majes', N'0405', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040601', N'Chuquibamba', N'0406', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040602', N'Andaray', N'0406', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040603', N'Cayarani', N'0406', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040604', N'Chichas', N'0406', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040605', N'Iray', N'0406', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040606', N'Río Grande', N'0406', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040607', N'Salamanca', N'0406', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040608', N'Yanaquihua', N'0406', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040701', N'Mollendo', N'0407', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040702', N'Cocachacra', N'0407', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040703', N'Dean Valdivia', N'0407', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040704', N'Islay', N'0407', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040705', N'Mejia', N'0407', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040706', N'Punta de Bombón', N'0407', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040801', N'Cotahuasi', N'0408', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040802', N'Alca', N'0408', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040803', N'Charcana', N'0408', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040804', N'Huaynacotas', N'0408', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040805', N'Pampamarca', N'0408', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040806', N'Puyca', N'0408', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040807', N'Quechualla', N'0408', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040808', N'Sayla', N'0408', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040809', N'Tauria', N'0408', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040810', N'Tomepampa', N'0408', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'040811', N'Toro', N'0408', N'04')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050101', N'Ayacucho', N'0501', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050102', N'Acocro', N'0501', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050103', N'Acos Vinchos', N'0501', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050104', N'Carmen Alto', N'0501', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050105', N'Chiara', N'0501', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050106', N'Ocros', N'0501', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050107', N'Pacaycasa', N'0501', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050108', N'Quinua', N'0501', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050109', N'San José de Ticllas', N'0501', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050110', N'San Juan Bautista', N'0501', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050111', N'Santiago de Pischa', N'0501', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050112', N'Socos', N'0501', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050113', N'Tambillo', N'0501', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050114', N'Vinchos', N'0501', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050115', N'Jesús Nazareno', N'0501', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050116', N'Andrés Avelino Cáceres Dorregaray', N'0501', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050201', N'Cangallo', N'0502', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050202', N'Chuschi', N'0502', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050203', N'Los Morochucos', N'0502', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050204', N'María Parado de Bellido', N'0502', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050205', N'Paras', N'0502', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050206', N'Totos', N'0502', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050301', N'Sancos', N'0503', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050302', N'Carapo', N'0503', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050303', N'Sacsamarca', N'0503', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050304', N'Santiago de Lucanamarca', N'0503', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050401', N'Huanta', N'0504', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050402', N'Ayahuanco', N'0504', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050403', N'Huamanguilla', N'0504', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050404', N'Iguain', N'0504', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050405', N'Luricocha', N'0504', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050406', N'Santillana', N'0504', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050407', N'Sivia', N'0504', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050408', N'Llochegua', N'0504', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050409', N'Canayre', N'0504', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050410', N'Uchuraccay', N'0504', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050411', N'Pucacolpa', N'0504', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050412', N'Chaca', N'0504', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050501', N'San Miguel', N'0505', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050502', N'Anco', N'0505', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050503', N'Ayna', N'0505', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050504', N'Chilcas', N'0505', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050505', N'Chungui', N'0505', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050506', N'Luis Carranza', N'0505', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050507', N'Santa Rosa', N'0505', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050508', N'Tambo', N'0505', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050509', N'Samugari', N'0505', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050510', N'Anchihuay', N'0505', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050511', N'Oronccoy', N'0505', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050601', N'Puquio', N'0506', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050602', N'Aucara', N'0506', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050603', N'Cabana', N'0506', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050604', N'Carmen Salcedo', N'0506', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050605', N'Chaviña', N'0506', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050606', N'Chipao', N'0506', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050607', N'Huac-Huas', N'0506', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050608', N'Laramate', N'0506', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050609', N'Leoncio Prado', N'0506', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050610', N'Llauta', N'0506', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050611', N'Lucanas', N'0506', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050612', N'Ocaña', N'0506', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050613', N'Otoca', N'0506', N'05')
GO
print 'Processed 500 total records'
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050614', N'Saisa', N'0506', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050615', N'San Cristóbal', N'0506', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050616', N'San Juan', N'0506', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050617', N'San Pedro', N'0506', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050618', N'San Pedro de Palco', N'0506', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050619', N'Sancos', N'0506', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050620', N'Santa Ana de Huaycahuacho', N'0506', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050621', N'Santa Lucia', N'0506', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050701', N'Coracora', N'0507', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050702', N'Chumpi', N'0507', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050703', N'Coronel Castañeda', N'0507', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050704', N'Pacapausa', N'0507', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050705', N'Pullo', N'0507', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050706', N'Puyusca', N'0507', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050707', N'San Francisco de Ravacayco', N'0507', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050708', N'Upahuacho', N'0507', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050801', N'Pausa', N'0508', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050802', N'Colta', N'0508', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050803', N'Corculla', N'0508', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050804', N'Lampa', N'0508', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050805', N'Marcabamba', N'0508', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050806', N'Oyolo', N'0508', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050807', N'Pararca', N'0508', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050808', N'San Javier de Alpabamba', N'0508', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050809', N'San José de Ushua', N'0508', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050810', N'Sara Sara', N'0508', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050901', N'Querobamba', N'0509', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050902', N'Belén', N'0509', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050903', N'Chalcos', N'0509', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050904', N'Chilcayoc', N'0509', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050905', N'Huacaña', N'0509', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050906', N'Morcolla', N'0509', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050907', N'Paico', N'0509', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050908', N'San Pedro de Larcay', N'0509', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050909', N'San Salvador de Quije', N'0509', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050910', N'Santiago de Paucaray', N'0509', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'050911', N'Soras', N'0509', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'051001', N'Huancapi', N'0510', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'051002', N'Alcamenca', N'0510', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'051003', N'Apongo', N'0510', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'051004', N'Asquipata', N'0510', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'051005', N'Canaria', N'0510', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'051006', N'Cayara', N'0510', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'051007', N'Colca', N'0510', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'051008', N'Huamanquiquia', N'0510', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'051009', N'Huancaraylla', N'0510', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'051010', N'Hualla', N'0510', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'051011', N'Sarhua', N'0510', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'051012', N'Vilcanchos', N'0510', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'051101', N'Vilcas Huaman', N'0511', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'051102', N'Accomarca', N'0511', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'051103', N'Carhuanca', N'0511', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'051104', N'Concepción', N'0511', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'051105', N'Huambalpa', N'0511', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'051106', N'Independencia', N'0511', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'051107', N'Saurama', N'0511', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'051108', N'Vischongo', N'0511', N'05')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060101', N'Cajamarca', N'0601', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060102', N'Asunción', N'0601', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060103', N'Chetilla', N'0601', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060104', N'Cospan', N'0601', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060105', N'Encañada', N'0601', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060106', N'Jesús', N'0601', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060107', N'Llacanora', N'0601', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060108', N'Los Baños del Inca', N'0601', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060109', N'Magdalena', N'0601', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060110', N'Matara', N'0601', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060111', N'Namora', N'0601', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060112', N'San Juan', N'0601', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060201', N'Cajabamba', N'0602', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060202', N'Cachachi', N'0602', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060203', N'Condebamba', N'0602', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060204', N'Sitacocha', N'0602', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060301', N'Celendín', N'0603', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060302', N'Chumuch', N'0603', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060303', N'Cortegana', N'0603', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060304', N'Huasmin', N'0603', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060305', N'Jorge Chávez', N'0603', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060306', N'José Gálvez', N'0603', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060307', N'Miguel Iglesias', N'0603', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060308', N'Oxamarca', N'0603', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060309', N'Sorochuco', N'0603', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060310', N'Sucre', N'0603', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060311', N'Utco', N'0603', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060312', N'La Libertad de Pallan', N'0603', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060401', N'Chota', N'0604', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060402', N'Anguia', N'0604', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060403', N'Chadin', N'0604', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060404', N'Chiguirip', N'0604', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060405', N'Chimban', N'0604', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060406', N'Choropampa', N'0604', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060407', N'Cochabamba', N'0604', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060408', N'Conchan', N'0604', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060409', N'Huambos', N'0604', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060410', N'Lajas', N'0604', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060411', N'Llama', N'0604', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060412', N'Miracosta', N'0604', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060413', N'Paccha', N'0604', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060414', N'Pion', N'0604', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060415', N'Querocoto', N'0604', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060416', N'San Juan de Licupis', N'0604', N'06')
GO
print 'Processed 600 total records'
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060417', N'Tacabamba', N'0604', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060418', N'Tocmoche', N'0604', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060419', N'Chalamarca', N'0604', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060501', N'Contumaza', N'0605', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060502', N'Chilete', N'0605', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060503', N'Cupisnique', N'0605', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060504', N'Guzmango', N'0605', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060505', N'San Benito', N'0605', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060506', N'Santa Cruz de Toledo', N'0605', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060507', N'Tantarica', N'0605', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060508', N'Yonan', N'0605', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060601', N'Cutervo', N'0606', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060602', N'Callayuc', N'0606', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060603', N'Choros', N'0606', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060604', N'Cujillo', N'0606', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060605', N'La Ramada', N'0606', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060606', N'Pimpingos', N'0606', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060607', N'Querocotillo', N'0606', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060608', N'San Andrés de Cutervo', N'0606', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060609', N'San Juan de Cutervo', N'0606', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060610', N'San Luis de Lucma', N'0606', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060611', N'Santa Cruz', N'0606', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060612', N'Santo Domingo de la Capilla', N'0606', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060613', N'Santo Tomas', N'0606', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060614', N'Socota', N'0606', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060615', N'Toribio Casanova', N'0606', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060701', N'Bambamarca', N'0607', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060702', N'Chugur', N'0607', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060703', N'Hualgayoc', N'0607', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060801', N'Jaén', N'0608', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060802', N'Bellavista', N'0608', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060803', N'Chontali', N'0608', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060804', N'Colasay', N'0608', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060805', N'Huabal', N'0608', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060806', N'Las Pirias', N'0608', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060807', N'Pomahuaca', N'0608', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060808', N'Pucara', N'0608', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060809', N'Sallique', N'0608', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060810', N'San Felipe', N'0608', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060811', N'San José del Alto', N'0608', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060812', N'Santa Rosa', N'0608', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060901', N'San Ignacio', N'0609', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060902', N'Chirinos', N'0609', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060903', N'Huarango', N'0609', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060904', N'La Coipa', N'0609', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060905', N'Namballe', N'0609', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060906', N'San José de Lourdes', N'0609', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'060907', N'Tabaconas', N'0609', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'061001', N'Pedro Gálvez', N'0610', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'061002', N'Chancay', N'0610', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'061003', N'Eduardo Villanueva', N'0610', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'061004', N'Gregorio Pita', N'0610', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'061005', N'Ichocan', N'0610', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'061006', N'José Manuel Quiroz', N'0610', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'061007', N'José Sabogal', N'0610', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'061101', N'San Miguel', N'0611', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'061102', N'Bolívar', N'0611', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'061103', N'Calquis', N'0611', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'061104', N'Catilluc', N'0611', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'061105', N'El Prado', N'0611', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'061106', N'La Florida', N'0611', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'061107', N'Llapa', N'0611', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'061108', N'Nanchoc', N'0611', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'061109', N'Niepos', N'0611', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'061110', N'San Gregorio', N'0611', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'061111', N'San Silvestre de Cochan', N'0611', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'061112', N'Tongod', N'0611', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'061113', N'Unión Agua Blanca', N'0611', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'061201', N'San Pablo', N'0612', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'061202', N'San Bernardino', N'0612', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'061203', N'San Luis', N'0612', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'061204', N'Tumbaden', N'0612', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'061301', N'Santa Cruz', N'0613', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'061302', N'Andabamba', N'0613', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'061303', N'Catache', N'0613', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'061304', N'Chancaybaños', N'0613', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'061305', N'La Esperanza', N'0613', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'061306', N'Ninabamba', N'0613', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'061307', N'Pulan', N'0613', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'061308', N'Saucepampa', N'0613', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'061309', N'Sexi', N'0613', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'061310', N'Uticyacu', N'0613', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'061311', N'Yauyucan', N'0613', N'06')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'070101', N'Callao', N'0701', N'07')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'070102', N'Bellavista', N'0701', N'07')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'070103', N'Carmen de la Legua Reynoso', N'0701', N'07')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'070104', N'La Perla', N'0701', N'07')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'070105', N'La Punta', N'0701', N'07')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'070106', N'Ventanilla', N'0701', N'07')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'070107', N'Mi Perú', N'0701', N'07')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080101', N'Cusco', N'0801', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080102', N'Ccorca', N'0801', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080103', N'Poroy', N'0801', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080104', N'San Jerónimo', N'0801', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080105', N'San Sebastian', N'0801', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080106', N'Santiago', N'0801', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080107', N'Saylla', N'0801', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080108', N'Wanchaq', N'0801', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080201', N'Acomayo', N'0802', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080202', N'Acopia', N'0802', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080203', N'Acos', N'0802', N'08')
GO
print 'Processed 700 total records'
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080204', N'Mosoc Llacta', N'0802', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080205', N'Pomacanchi', N'0802', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080206', N'Rondocan', N'0802', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080207', N'Sangarara', N'0802', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080301', N'Anta', N'0803', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080302', N'Ancahuasi', N'0803', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080303', N'Cachimayo', N'0803', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080304', N'Chinchaypujio', N'0803', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080305', N'Huarocondo', N'0803', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080306', N'Limatambo', N'0803', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080307', N'Mollepata', N'0803', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080308', N'Pucyura', N'0803', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080309', N'Zurite', N'0803', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080401', N'Calca', N'0804', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080402', N'Coya', N'0804', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080403', N'Lamay', N'0804', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080404', N'Lares', N'0804', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080405', N'Pisac', N'0804', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080406', N'San Salvador', N'0804', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080407', N'Taray', N'0804', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080408', N'Yanatile', N'0804', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080501', N'Yanaoca', N'0805', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080502', N'Checca', N'0805', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080503', N'Kunturkanki', N'0805', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080504', N'Langui', N'0805', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080505', N'Layo', N'0805', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080506', N'Pampamarca', N'0805', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080507', N'Quehue', N'0805', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080508', N'Tupac Amaru', N'0805', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080601', N'Sicuani', N'0806', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080602', N'Checacupe', N'0806', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080603', N'Combapata', N'0806', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080604', N'Marangani', N'0806', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080605', N'Pitumarca', N'0806', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080606', N'San Pablo', N'0806', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080607', N'San Pedro', N'0806', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080608', N'Tinta', N'0806', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080701', N'Santo Tomas', N'0807', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080702', N'Capacmarca', N'0807', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080703', N'Chamaca', N'0807', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080704', N'Colquemarca', N'0807', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080705', N'Livitaca', N'0807', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080706', N'Llusco', N'0807', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080707', N'Quiñota', N'0807', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080708', N'Velille', N'0807', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080801', N'Espinar', N'0808', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080802', N'Condoroma', N'0808', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080803', N'Coporaque', N'0808', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080804', N'Ocoruro', N'0808', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080805', N'Pallpata', N'0808', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080806', N'Pichigua', N'0808', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080807', N'Suyckutambo', N'0808', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080808', N'Alto Pichigua', N'0808', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080901', N'Santa Ana', N'0809', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080902', N'Echarate', N'0809', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080903', N'Huayopata', N'0809', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080904', N'Maranura', N'0809', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080905', N'Ocobamba', N'0809', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080906', N'Quellouno', N'0809', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080907', N'Kimbiri', N'0809', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080908', N'Santa Teresa', N'0809', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080909', N'Vilcabamba', N'0809', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080910', N'Pichari', N'0809', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080911', N'Inkawasi', N'0809', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080912', N'Villa Virgen', N'0809', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080913', N'Villa Kintiarina', N'0809', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'080914', N'Megantoni', N'0809', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'081001', N'Paruro', N'0810', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'081002', N'Accha', N'0810', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'081003', N'Ccapi', N'0810', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'081004', N'Colcha', N'0810', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'081005', N'Huanoquite', N'0810', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'081006', N'Omachaç', N'0810', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'081007', N'Paccaritambo', N'0810', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'081008', N'Pillpinto', N'0810', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'081009', N'Yaurisque', N'0810', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'081101', N'Paucartambo', N'0811', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'081102', N'Caicay', N'0811', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'081103', N'Challabamba', N'0811', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'081104', N'Colquepata', N'0811', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'081105', N'Huancarani', N'0811', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'081106', N'Kosñipata', N'0811', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'081201', N'Urcos', N'0812', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'081202', N'Andahuaylillas', N'0812', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'081203', N'Camanti', N'0812', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'081204', N'Ccarhuayo', N'0812', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'081205', N'Ccatca', N'0812', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'081206', N'Cusipata', N'0812', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'081207', N'Huaro', N'0812', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'081208', N'Lucre', N'0812', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'081209', N'Marcapata', N'0812', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'081210', N'Ocongate', N'0812', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'081211', N'Oropesa', N'0812', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'081212', N'Quiquijana', N'0812', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'081301', N'Urubamba', N'0813', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'081302', N'Chinchero', N'0813', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'081303', N'Huayllabamba', N'0813', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'081304', N'Machupicchu', N'0813', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'081305', N'Maras', N'0813', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'081306', N'Ollantaytambo', N'0813', N'08')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'081307', N'Yucay', N'0813', N'08')
GO
print 'Processed 800 total records'
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090101', N'Huancavelica', N'0901', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090102', N'Acobambilla', N'0901', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090103', N'Acoria', N'0901', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090104', N'Conayca', N'0901', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090105', N'Cuenca', N'0901', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090106', N'Huachocolpa', N'0901', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090107', N'Huayllahuara', N'0901', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090108', N'Izcuchaca', N'0901', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090109', N'Laria', N'0901', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090110', N'Manta', N'0901', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090111', N'Mariscal Cáceres', N'0901', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090112', N'Moya', N'0901', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090113', N'Nuevo Occoro', N'0901', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090114', N'Palca', N'0901', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090115', N'Pilchaca', N'0901', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090116', N'Vilca', N'0901', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090117', N'Yauli', N'0901', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090118', N'Ascensión', N'0901', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090119', N'Huando', N'0901', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090201', N'Acobamba', N'0902', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090202', N'Andabamba', N'0902', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090203', N'Anta', N'0902', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090204', N'Caja', N'0902', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090205', N'Marcas', N'0902', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090206', N'Paucara', N'0902', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090207', N'Pomacocha', N'0902', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090208', N'Rosario', N'0902', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090301', N'Lircay', N'0903', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090302', N'Anchonga', N'0903', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090303', N'Callanmarca', N'0903', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090304', N'Ccochaccasa', N'0903', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090305', N'Chincho', N'0903', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090306', N'Congalla', N'0903', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090307', N'Huanca-Huanca', N'0903', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090308', N'Huayllay Grande', N'0903', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090309', N'Julcamarca', N'0903', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090310', N'San Antonio de Antaparco', N'0903', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090311', N'Santo Tomas de Pata', N'0903', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090312', N'Secclla', N'0903', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090401', N'Castrovirreyna', N'0904', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090402', N'Arma', N'0904', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090403', N'Aurahua', N'0904', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090404', N'Capillas', N'0904', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090405', N'Chupamarca', N'0904', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090406', N'Cocas', N'0904', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090407', N'Huachos', N'0904', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090408', N'Huamatambo', N'0904', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090409', N'Mollepampa', N'0904', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090410', N'San Juan', N'0904', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090411', N'Santa Ana', N'0904', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090412', N'Tantara', N'0904', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090413', N'Ticrapo', N'0904', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090501', N'Churcampa', N'0905', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090502', N'Anco', N'0905', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090503', N'Chinchihuasi', N'0905', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090504', N'El Carmen', N'0905', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090505', N'La Merced', N'0905', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090506', N'Locroja', N'0905', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090507', N'Paucarbamba', N'0905', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090508', N'San Miguel de Mayocc', N'0905', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090509', N'San Pedro de Coris', N'0905', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090510', N'Pachamarca', N'0905', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090511', N'Cosme', N'0905', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090601', N'Huaytara', N'0906', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090602', N'Ayavi', N'0906', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090603', N'Córdova', N'0906', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090604', N'Huayacundo Arma', N'0906', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090605', N'Laramarca', N'0906', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090606', N'Ocoyo', N'0906', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090607', N'Pilpichaca', N'0906', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090608', N'Querco', N'0906', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090609', N'Quito-Arma', N'0906', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090610', N'San Antonio de Cusicancha', N'0906', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090611', N'San Francisco de Sangayaico', N'0906', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090612', N'San Isidro', N'0906', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090613', N'Santiago de Chocorvos', N'0906', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090614', N'Santiago de Quirahuara', N'0906', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090615', N'Santo Domingo de Capillas', N'0906', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090616', N'Tambo', N'0906', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090701', N'Pampas', N'0907', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090702', N'Acostambo', N'0907', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090703', N'Acraquia', N'0907', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090704', N'Ahuaycha', N'0907', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090705', N'Colcabamba', N'0907', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090706', N'Daniel Hernández', N'0907', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090707', N'Huachocolpa', N'0907', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090709', N'Huaribamba', N'0907', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090710', N'Ñahuimpuquio', N'0907', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090711', N'Pazos', N'0907', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090713', N'Quishuar', N'0907', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090714', N'Salcabamba', N'0907', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090715', N'Salcahuasi', N'0907', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090716', N'San Marcos de Rocchac', N'0907', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090717', N'Surcubamba', N'0907', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090718', N'Tintay Puncu', N'0907', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090719', N'Quichuas', N'0907', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090720', N'Andaymarca', N'0907', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090721', N'Roble', N'0907', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090722', N'Pichos', N'0907', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'090723', N'Santiago de Tucuma', N'0907', N'09')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100101', N'Huanuco', N'1001', N'10')
GO
print 'Processed 900 total records'
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100102', N'Amarilis', N'1001', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100103', N'Chinchao', N'1001', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100104', N'Churubamba', N'1001', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100105', N'Margos', N'1001', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100106', N'Quisqui (Kichki)', N'1001', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100107', N'San Francisco de Cayran', N'1001', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100108', N'San Pedro de Chaulan', N'1001', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100109', N'Santa María del Valle', N'1001', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100110', N'Yarumayo', N'1001', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100111', N'Pillco Marca', N'1001', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100112', N'Yacus', N'1001', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100113', N'San Pablo de Pillao', N'1001', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100201', N'Ambo', N'1002', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100202', N'Cayna', N'1002', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100203', N'Colpas', N'1002', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100204', N'Conchamarca', N'1002', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100205', N'Huacar', N'1002', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100206', N'San Francisco', N'1002', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100207', N'San Rafael', N'1002', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100208', N'Tomay Kichwa', N'1002', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100301', N'La Unión', N'1003', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100307', N'Chuquis', N'1003', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100311', N'Marías', N'1003', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100313', N'Pachas', N'1003', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100316', N'Quivilla', N'1003', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100317', N'Ripan', N'1003', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100321', N'Shunqui', N'1003', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100322', N'Sillapata', N'1003', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100323', N'Yanas', N'1003', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100401', N'Huacaybamba', N'1004', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100402', N'Canchabamba', N'1004', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100403', N'Cochabamba', N'1004', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100404', N'Pinra', N'1004', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100501', N'Llata', N'1005', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100502', N'Arancay', N'1005', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100503', N'Chavín de Pariarca', N'1005', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100504', N'Jacas Grande', N'1005', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100505', N'Jircan', N'1005', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100506', N'Miraflores', N'1005', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100507', N'Monzón', N'1005', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100508', N'Punchao', N'1005', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100509', N'Puños', N'1005', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100510', N'Singa', N'1005', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100511', N'Tantamayo', N'1005', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100601', N'Rupa-Rupa', N'1006', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100602', N'Daniel Alomía Robles', N'1006', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100603', N'Hermílio Valdizan', N'1006', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100604', N'José Crespo y Castillo', N'1006', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100605', N'Luyando', N'1006', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100606', N'Mariano Damaso Beraun', N'1006', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100607', N'Pucayacu', N'1006', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100608', N'Castillo Grande', N'1006', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100609', N'Pueblo Nuevo', N'1006', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100610', N'Santo Domingo de Anda', N'1006', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100701', N'Huacrachuco', N'1007', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100702', N'Cholon', N'1007', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100703', N'San Buenaventura', N'1007', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100704', N'La Morada', N'1007', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100705', N'Santa Rosa de Alto Yanajanca', N'1007', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100801', N'Panao', N'1008', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100802', N'Chaglla', N'1008', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100803', N'Molino', N'1008', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100804', N'Umari', N'1008', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100901', N'Puerto Inca', N'1009', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100902', N'Codo del Pozuzo', N'1009', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100903', N'Honoria', N'1009', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100904', N'Tournavista', N'1009', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'100905', N'Yuyapichis', N'1009', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'101001', N'Jesús', N'1010', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'101002', N'Baños', N'1010', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'101003', N'Jivia', N'1010', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'101004', N'Queropalca', N'1010', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'101005', N'Rondos', N'1010', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'101006', N'San Francisco de Asís', N'1010', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'101007', N'San Miguel de Cauri', N'1010', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'101101', N'Chavinillo', N'1011', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'101102', N'Cahuac', N'1011', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'101103', N'Chacabamba', N'1011', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'101104', N'Aparicio Pomares', N'1011', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'101105', N'Jacas Chico', N'1011', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'101106', N'Obas', N'1011', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'101107', N'Pampamarca', N'1011', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'101108', N'Choras', N'1011', N'10')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'110101', N'Ica', N'1101', N'11')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'110102', N'La Tinguiña', N'1101', N'11')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'110103', N'Los Aquijes', N'1101', N'11')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'110104', N'Ocucaje', N'1101', N'11')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'110105', N'Pachacutec', N'1101', N'11')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'110106', N'Parcona', N'1101', N'11')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'110107', N'Pueblo Nuevo', N'1101', N'11')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'110108', N'Salas', N'1101', N'11')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'110109', N'San José de Los Molinos', N'1101', N'11')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'110110', N'San Juan Bautista', N'1101', N'11')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'110111', N'Santiago', N'1101', N'11')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'110112', N'Subtanjalla', N'1101', N'11')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'110113', N'Tate', N'1101', N'11')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'110114', N'Yauca del Rosario', N'1101', N'11')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'110201', N'Chincha Alta', N'1102', N'11')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'110202', N'Alto Laran', N'1102', N'11')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'110203', N'Chavin', N'1102', N'11')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'110204', N'Chincha Baja', N'1102', N'11')
GO
print 'Processed 1000 total records'
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'110205', N'El Carmen', N'1102', N'11')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'110206', N'Grocio Prado', N'1102', N'11')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'110207', N'Pueblo Nuevo', N'1102', N'11')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'110208', N'San Juan de Yanac', N'1102', N'11')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'110209', N'San Pedro de Huacarpana', N'1102', N'11')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'110210', N'Sunampe', N'1102', N'11')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'110211', N'Tambo de Mora', N'1102', N'11')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'110301', N'Nasca', N'1103', N'11')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'110302', N'Changuillo', N'1103', N'11')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'110303', N'El Ingenio', N'1103', N'11')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'110304', N'Marcona', N'1103', N'11')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'110305', N'Vista Alegre', N'1103', N'11')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'110401', N'Palpa', N'1104', N'11')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'110402', N'Llipata', N'1104', N'11')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'110403', N'Río Grande', N'1104', N'11')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'110404', N'Santa Cruz', N'1104', N'11')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'110405', N'Tibillo', N'1104', N'11')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'110501', N'Pisco', N'1105', N'11')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'110502', N'Huancano', N'1105', N'11')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'110503', N'Humay', N'1105', N'11')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'110504', N'Independencia', N'1105', N'11')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'110505', N'Paracas', N'1105', N'11')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'110506', N'San Andrés', N'1105', N'11')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'110507', N'San Clemente', N'1105', N'11')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'110508', N'Tupac Amaru Inca', N'1105', N'11')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120101', N'Huancayo', N'1201', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120104', N'Carhuacallanga', N'1201', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120105', N'Chacapampa', N'1201', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120106', N'Chicche', N'1201', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120107', N'Chilca', N'1201', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120108', N'Chongos Alto', N'1201', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120111', N'Chupuro', N'1201', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120112', N'Colca', N'1201', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120113', N'Cullhuas', N'1201', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120114', N'El Tambo', N'1201', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120116', N'Huacrapuquio', N'1201', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120117', N'Hualhuas', N'1201', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120119', N'Huancan', N'1201', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120120', N'Huasicancha', N'1201', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120121', N'Huayucachi', N'1201', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120122', N'Ingenio', N'1201', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120124', N'Pariahuanca', N'1201', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120125', N'Pilcomayo', N'1201', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120126', N'Pucara', N'1201', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120127', N'Quichuay', N'1201', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120128', N'Quilcas', N'1201', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120129', N'San Agustín', N'1201', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120130', N'San Jerónimo de Tunan', N'1201', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120132', N'Saño', N'1201', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120133', N'Sapallanga', N'1201', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120134', N'Sicaya', N'1201', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120135', N'Santo Domingo de Acobamba', N'1201', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120136', N'Viques', N'1201', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120201', N'Concepción', N'1202', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120202', N'Aco', N'1202', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120203', N'Andamarca', N'1202', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120204', N'Chambara', N'1202', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120205', N'Cochas', N'1202', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120206', N'Comas', N'1202', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120207', N'Heroínas Toledo', N'1202', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120208', N'Manzanares', N'1202', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120209', N'Mariscal Castilla', N'1202', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120210', N'Matahuasi', N'1202', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120211', N'Mito', N'1202', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120212', N'Nueve de Julio', N'1202', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120213', N'Orcotuna', N'1202', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120214', N'San José de Quero', N'1202', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120215', N'Santa Rosa de Ocopa', N'1202', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120301', N'Chanchamayo', N'1203', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120302', N'Perene', N'1203', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120303', N'Pichanaqui', N'1203', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120304', N'San Luis de Shuaro', N'1203', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120305', N'San Ramón', N'1203', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120306', N'Vitoc', N'1203', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120401', N'Jauja', N'1204', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120402', N'Acolla', N'1204', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120403', N'Apata', N'1204', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120404', N'Ataura', N'1204', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120405', N'Canchayllo', N'1204', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120406', N'Curicaca', N'1204', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120407', N'El Mantaro', N'1204', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120408', N'Huamali', N'1204', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120409', N'Huaripampa', N'1204', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120410', N'Huertas', N'1204', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120411', N'Janjaillo', N'1204', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120412', N'Julcán', N'1204', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120413', N'Leonor Ordóñez', N'1204', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120414', N'Llocllapampa', N'1204', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120415', N'Marco', N'1204', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120416', N'Masma', N'1204', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120417', N'Masma Chicche', N'1204', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120418', N'Molinos', N'1204', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120419', N'Monobamba', N'1204', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120420', N'Muqui', N'1204', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120421', N'Muquiyauyo', N'1204', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120422', N'Paca', N'1204', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120423', N'Paccha', N'1204', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120424', N'Pancan', N'1204', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120425', N'Parco', N'1204', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120426', N'Pomacancha', N'1204', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120427', N'Ricran', N'1204', N'12')
GO
print 'Processed 1100 total records'
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120428', N'San Lorenzo', N'1204', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120429', N'San Pedro de Chunan', N'1204', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120430', N'Sausa', N'1204', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120431', N'Sincos', N'1204', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120432', N'Tunan Marca', N'1204', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120433', N'Yauli', N'1204', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120434', N'Yauyos', N'1204', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120501', N'Junin', N'1205', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120502', N'Carhuamayo', N'1205', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120503', N'Ondores', N'1205', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120504', N'Ulcumayo', N'1205', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120601', N'Satipo', N'1206', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120602', N'Coviriali', N'1206', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120603', N'Llaylla', N'1206', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120604', N'Mazamari', N'1206', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120605', N'Pampa Hermosa', N'1206', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120606', N'Pangoa', N'1206', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120607', N'Río Negro', N'1206', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120608', N'Río Tambo', N'1206', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120609', N'Vizcatan del Ene', N'1206', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120701', N'Tarma', N'1207', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120702', N'Acobamba', N'1207', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120703', N'Huaricolca', N'1207', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120704', N'Huasahuasi', N'1207', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120705', N'La Unión', N'1207', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120706', N'Palca', N'1207', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120707', N'Palcamayo', N'1207', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120708', N'San Pedro de Cajas', N'1207', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120709', N'Tapo', N'1207', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120801', N'La Oroya', N'1208', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120802', N'Chacapalpa', N'1208', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120803', N'Huay-Huay', N'1208', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120804', N'Marcapomacocha', N'1208', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120805', N'Morococha', N'1208', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120806', N'Paccha', N'1208', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120807', N'Santa Bárbara de Carhuacayan', N'1208', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120808', N'Santa Rosa de Sacco', N'1208', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120809', N'Suitucancha', N'1208', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120810', N'Yauli', N'1208', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120901', N'Chupaca', N'1209', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120902', N'Ahuac', N'1209', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120903', N'Chongos Bajo', N'1209', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120904', N'Huachac', N'1209', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120905', N'Huamancaca Chico', N'1209', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120906', N'San Juan de Iscos', N'1209', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120907', N'San Juan de Jarpa', N'1209', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120908', N'Tres de Diciembre', N'1209', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'120909', N'Yanacancha', N'1209', N'12')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130101', N'Trujillo', N'1301', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130102', N'El Porvenir', N'1301', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130103', N'Florencia de Mora', N'1301', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130104', N'Huanchaco', N'1301', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130105', N'La Esperanza', N'1301', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130106', N'Laredo', N'1301', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130107', N'Moche', N'1301', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130108', N'Poroto', N'1301', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130109', N'Salaverry', N'1301', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130110', N'Simbal', N'1301', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130111', N'Victor Larco Herrera', N'1301', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130201', N'Ascope', N'1302', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130202', N'Chicama', N'1302', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130203', N'Chocope', N'1302', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130204', N'Magdalena de Cao', N'1302', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130205', N'Paijan', N'1302', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130206', N'Rázuri', N'1302', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130207', N'Santiago de Cao', N'1302', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130208', N'Casa Grande', N'1302', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130301', N'Bolívar', N'1303', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130302', N'Bambamarca', N'1303', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130303', N'Condormarca', N'1303', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130304', N'Longotea', N'1303', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130305', N'Uchumarca', N'1303', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130306', N'Ucuncha', N'1303', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130401', N'Chepen', N'1304', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130402', N'Pacanga', N'1304', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130403', N'Pueblo Nuevo', N'1304', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130501', N'Julcan', N'1305', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130502', N'Calamarca', N'1305', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130503', N'Carabamba', N'1305', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130504', N'Huaso', N'1305', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130601', N'Otuzco', N'1306', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130602', N'Agallpampa', N'1306', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130604', N'Charat', N'1306', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130605', N'Huaranchal', N'1306', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130606', N'La Cuesta', N'1306', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130608', N'Mache', N'1306', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130610', N'Paranday', N'1306', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130611', N'Salpo', N'1306', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130613', N'Sinsicap', N'1306', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130614', N'Usquil', N'1306', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130701', N'San Pedro de Lloc', N'1307', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130702', N'Guadalupe', N'1307', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130703', N'Jequetepeque', N'1307', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130704', N'Pacasmayo', N'1307', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130705', N'San José', N'1307', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130801', N'Tayabamba', N'1308', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130802', N'Buldibuyo', N'1308', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130803', N'Chillia', N'1308', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130804', N'Huancaspata', N'1308', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130805', N'Huaylillas', N'1308', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130806', N'Huayo', N'1308', N'13')
GO
print 'Processed 1200 total records'
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130807', N'Ongon', N'1308', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130808', N'Parcoy', N'1308', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130809', N'Pataz', N'1308', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130810', N'Pias', N'1308', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130811', N'Santiago de Challas', N'1308', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130812', N'Taurija', N'1308', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130813', N'Urpay', N'1308', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130901', N'Huamachuco', N'1309', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130902', N'Chugay', N'1309', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130903', N'Cochorco', N'1309', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130904', N'Curgos', N'1309', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130905', N'Marcabal', N'1309', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130906', N'Sanagoran', N'1309', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130907', N'Sarin', N'1309', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'130908', N'Sartimbamba', N'1309', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'131001', N'Santiago de Chuco', N'1310', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'131002', N'Angasmarca', N'1310', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'131003', N'Cachicadan', N'1310', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'131004', N'Mollebamba', N'1310', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'131005', N'Mollepata', N'1310', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'131006', N'Quiruvilca', N'1310', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'131007', N'Santa Cruz de Chuca', N'1310', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'131008', N'Sitabamba', N'1310', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'131101', N'Cascas', N'1311', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'131102', N'Lucma', N'1311', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'131103', N'Marmot', N'1311', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'131104', N'Sayapullo', N'1311', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'131201', N'Viru', N'1312', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'131202', N'Chao', N'1312', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'131203', N'Guadalupito', N'1312', N'13')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'140101', N'Chiclayo', N'1401', N'14')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'140102', N'Chongoyape', N'1401', N'14')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'140103', N'Eten', N'1401', N'14')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'140104', N'Eten Puerto', N'1401', N'14')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'140105', N'José Leonardo Ortiz', N'1401', N'14')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'140106', N'La Victoria', N'1401', N'14')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'140107', N'Lagunas', N'1401', N'14')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'140108', N'Monsefu', N'1401', N'14')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'140109', N'Nueva Arica', N'1401', N'14')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'140110', N'Oyotun', N'1401', N'14')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'140111', N'Picsi', N'1401', N'14')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'140112', N'Pimentel', N'1401', N'14')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'140113', N'Reque', N'1401', N'14')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'140114', N'Santa Rosa', N'1401', N'14')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'140115', N'Saña', N'1401', N'14')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'140116', N'Cayalti', N'1401', N'14')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'140117', N'Patapo', N'1401', N'14')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'140118', N'Pomalca', N'1401', N'14')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'140119', N'Pucala', N'1401', N'14')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'140120', N'Tuman', N'1401', N'14')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'140201', N'Ferreñafe', N'1402', N'14')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'140202', N'Cañaris', N'1402', N'14')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'140203', N'Incahuasi', N'1402', N'14')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'140204', N'Manuel Antonio Mesones Muro', N'1402', N'14')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'140205', N'Pitipo', N'1402', N'14')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'140206', N'Pueblo Nuevo', N'1402', N'14')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'140301', N'Lambayeque', N'1403', N'14')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'140302', N'Chochope', N'1403', N'14')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'140303', N'Illimo', N'1403', N'14')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'140304', N'Jayanca', N'1403', N'14')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'140305', N'Mochumi', N'1403', N'14')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'140306', N'Morrope', N'1403', N'14')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'140307', N'Motupe', N'1403', N'14')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'140308', N'Olmos', N'1403', N'14')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'140309', N'Pacora', N'1403', N'14')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'140310', N'Salas', N'1403', N'14')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'140311', N'San José', N'1403', N'14')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'140312', N'Tucume', N'1403', N'14')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150101', N'Lima', N'1501', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150102', N'Ancón', N'1501', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150103', N'Ate', N'1501', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150104', N'Barranco', N'1501', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150105', N'Breña', N'1501', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150106', N'Carabayllo', N'1501', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150107', N'Chaclacayo', N'1501', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150108', N'Chorrillos', N'1501', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150109', N'Cieneguilla', N'1501', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150110', N'Comas', N'1501', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150111', N'El Agustino', N'1501', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150112', N'Independencia', N'1501', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150113', N'Jesús María', N'1501', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150114', N'La Molina', N'1501', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150115', N'La Victoria', N'1501', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150116', N'Lince', N'1501', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150117', N'Los Olivos', N'1501', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150118', N'Lurigancho', N'1501', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150119', N'Lurin', N'1501', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150120', N'Magdalena del Mar', N'1501', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150121', N'Pueblo Libre', N'1501', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150122', N'Miraflores', N'1501', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150123', N'Pachacamac', N'1501', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150124', N'Pucusana', N'1501', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150125', N'Puente Piedra', N'1501', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150126', N'Punta Hermosa', N'1501', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150127', N'Punta Negra', N'1501', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150128', N'Rímac', N'1501', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150129', N'San Bartolo', N'1501', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150130', N'San Borja', N'1501', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150131', N'San Isidro', N'1501', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150132', N'San Juan de Lurigancho', N'1501', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150133', N'San Juan de Miraflores', N'1501', N'15')
GO
print 'Processed 1300 total records'
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150134', N'San Luis', N'1501', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150135', N'San Martín de Porres', N'1501', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150136', N'San Miguel', N'1501', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150137', N'Santa Anita', N'1501', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150138', N'Santa María del Mar', N'1501', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150139', N'Santa Rosa', N'1501', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150140', N'Santiago de Surco', N'1501', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150141', N'Surquillo', N'1501', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150142', N'Villa El Salvador', N'1501', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150143', N'Villa María del Triunfo', N'1501', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150201', N'Barranca', N'1502', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150202', N'Paramonga', N'1502', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150203', N'Pativilca', N'1502', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150204', N'Supe', N'1502', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150205', N'Supe Puerto', N'1502', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150301', N'Cajatambo', N'1503', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150302', N'Copa', N'1503', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150303', N'Gorgor', N'1503', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150304', N'Huancapon', N'1503', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150305', N'Manas', N'1503', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150401', N'Canta', N'1504', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150402', N'Arahuay', N'1504', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150403', N'Huamantanga', N'1504', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150404', N'Huaros', N'1504', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150405', N'Lachaqui', N'1504', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150406', N'San Buenaventura', N'1504', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150407', N'Santa Rosa de Quives', N'1504', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150501', N'San Vicente de Cañete', N'1505', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150502', N'Asia', N'1505', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150503', N'Calango', N'1505', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150504', N'Cerro Azul', N'1505', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150505', N'Chilca', N'1505', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150506', N'Coayllo', N'1505', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150507', N'Imperial', N'1505', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150508', N'Lunahuana', N'1505', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150509', N'Mala', N'1505', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150510', N'Nuevo Imperial', N'1505', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150511', N'Pacaran', N'1505', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150512', N'Quilmana', N'1505', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150513', N'San Antonio', N'1505', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150514', N'San Luis', N'1505', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150515', N'Santa Cruz de Flores', N'1505', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150516', N'Zúñiga', N'1505', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150601', N'Huaral', N'1506', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150602', N'Atavillos Alto', N'1506', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150603', N'Atavillos Bajo', N'1506', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150604', N'Aucallama', N'1506', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150605', N'Chancay', N'1506', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150606', N'Ihuari', N'1506', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150607', N'Lampian', N'1506', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150608', N'Pacaraos', N'1506', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150609', N'San Miguel de Acos', N'1506', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150610', N'Santa Cruz de Andamarca', N'1506', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150611', N'Sumbilca', N'1506', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150612', N'Veintisiete de Noviembre', N'1506', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150701', N'Matucana', N'1507', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150702', N'Antioquia', N'1507', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150703', N'Callahuanca', N'1507', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150704', N'Carampoma', N'1507', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150705', N'Chicla', N'1507', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150706', N'Cuenca', N'1507', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150707', N'Huachupampa', N'1507', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150708', N'Huanza', N'1507', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150709', N'Huarochiri', N'1507', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150710', N'Lahuaytambo', N'1507', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150711', N'Langa', N'1507', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150712', N'Laraos', N'1507', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150713', N'Mariatana', N'1507', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150714', N'Ricardo Palma', N'1507', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150715', N'San Andrés de Tupicocha', N'1507', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150716', N'San Antonio', N'1507', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150717', N'San Bartolomé', N'1507', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150718', N'San Damian', N'1507', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150719', N'San Juan de Iris', N'1507', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150720', N'San Juan de Tantaranche', N'1507', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150721', N'San Lorenzo de Quinti', N'1507', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150722', N'San Mateo', N'1507', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150723', N'San Mateo de Otao', N'1507', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150724', N'San Pedro de Casta', N'1507', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150725', N'San Pedro de Huancayre', N'1507', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150726', N'Sangallaya', N'1507', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150727', N'Santa Cruz de Cocachacra', N'1507', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150728', N'Santa Eulalia', N'1507', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150729', N'Santiago de Anchucaya', N'1507', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150730', N'Santiago de Tuna', N'1507', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150731', N'Santo Domingo de Los Olleros', N'1507', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150732', N'Surco', N'1507', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150801', N'Huacho', N'1508', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150802', N'Ambar', N'1508', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150803', N'Caleta de Carquin', N'1508', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150804', N'Checras', N'1508', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150805', N'Hualmay', N'1508', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150806', N'Huaura', N'1508', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150807', N'Leoncio Prado', N'1508', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150808', N'Paccho', N'1508', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150809', N'Santa Leonor', N'1508', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150810', N'Santa María', N'1508', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150811', N'Sayan', N'1508', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150812', N'Vegueta', N'1508', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150901', N'Oyon', N'1509', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150902', N'Andajes', N'1509', N'15')
GO
print 'Processed 1400 total records'
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150903', N'Caujul', N'1509', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150904', N'Cochamarca', N'1509', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150905', N'Navan', N'1509', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'150906', N'Pachangara', N'1509', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'151001', N'Yauyos', N'1510', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'151002', N'Alis', N'1510', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'151003', N'Allauca', N'1510', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'151004', N'Ayaviri', N'1510', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'151005', N'Azángaro', N'1510', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'151006', N'Cacra', N'1510', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'151007', N'Carania', N'1510', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'151008', N'Catahuasi', N'1510', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'151009', N'Chocos', N'1510', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'151010', N'Cochas', N'1510', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'151011', N'Colonia', N'1510', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'151012', N'Hongos', N'1510', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'151013', N'Huampara', N'1510', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'151014', N'Huancaya', N'1510', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'151015', N'Huangascar', N'1510', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'151016', N'Huantan', N'1510', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'151017', N'Huañec', N'1510', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'151018', N'Laraos', N'1510', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'151019', N'Lincha', N'1510', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'151020', N'Madean', N'1510', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'151021', N'Miraflores', N'1510', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'151022', N'Omas', N'1510', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'151023', N'Putinza', N'1510', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'151024', N'Quinches', N'1510', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'151025', N'Quinocay', N'1510', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'151026', N'San Joaquín', N'1510', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'151027', N'San Pedro de Pilas', N'1510', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'151028', N'Tanta', N'1510', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'151029', N'Tauripampa', N'1510', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'151030', N'Tomas', N'1510', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'151031', N'Tupe', N'1510', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'151032', N'Viñac', N'1510', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'151033', N'Vitis', N'1510', N'15')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160101', N'Iquitos', N'1601', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160102', N'Alto Nanay', N'1601', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160103', N'Fernando Lores', N'1601', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160104', N'Indiana', N'1601', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160105', N'Las Amazonas', N'1601', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160106', N'Mazan', N'1601', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160107', N'Napo', N'1601', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160108', N'Punchana', N'1601', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160110', N'Torres Causana', N'1601', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160112', N'Belén', N'1601', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160113', N'San Juan Bautista', N'1601', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160201', N'Yurimaguas', N'1602', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160202', N'Balsapuerto', N'1602', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160205', N'Jeberos', N'1602', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160206', N'Lagunas', N'1602', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160210', N'Santa Cruz', N'1602', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160211', N'Teniente Cesar López Rojas', N'1602', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160301', N'Nauta', N'1603', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160302', N'Parinari', N'1603', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160303', N'Tigre', N'1603', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160304', N'Trompeteros', N'1603', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160305', N'Urarinas', N'1603', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160401', N'Ramón Castilla', N'1604', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160402', N'Pebas', N'1604', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160403', N'Yavari', N'1604', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160404', N'San Pablo', N'1604', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160501', N'Requena', N'1605', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160502', N'Alto Tapiche', N'1605', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160503', N'Capelo', N'1605', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160504', N'Emilio San Martín', N'1605', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160505', N'Maquia', N'1605', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160506', N'Puinahua', N'1605', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160507', N'Saquena', N'1605', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160508', N'Soplin', N'1605', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160509', N'Tapiche', N'1605', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160510', N'Jenaro Herrera', N'1605', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160511', N'Yaquerana', N'1605', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160601', N'Contamana', N'1606', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160602', N'Inahuaya', N'1606', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160603', N'Padre Márquez', N'1606', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160604', N'Pampa Hermosa', N'1606', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160605', N'Sarayacu', N'1606', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160606', N'Vargas Guerra', N'1606', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160701', N'Barranca', N'1607', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160702', N'Cahuapanas', N'1607', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160703', N'Manseriche', N'1607', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160704', N'Morona', N'1607', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160705', N'Pastaza', N'1607', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160706', N'Andoas', N'1607', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160801', N'Putumayo', N'1608', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160802', N'Rosa Panduro', N'1608', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160803', N'Teniente Manuel Clavero', N'1608', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'160804', N'Yaguas', N'1608', N'16')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'170101', N'Tambopata', N'1701', N'17')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'170102', N'Inambari', N'1701', N'17')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'170103', N'Las Piedras', N'1701', N'17')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'170104', N'Laberinto', N'1701', N'17')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'170201', N'Manu', N'1702', N'17')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'170202', N'Fitzcarrald', N'1702', N'17')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'170203', N'Madre de Dios', N'1702', N'17')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'170204', N'Huepetuhe', N'1702', N'17')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'170301', N'Iñapari', N'1703', N'17')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'170302', N'Iberia', N'1703', N'17')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'170303', N'Tahuamanu', N'1703', N'17')
GO
print 'Processed 1500 total records'
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'180101', N'Moquegua', N'1801', N'18')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'180102', N'Carumas', N'1801', N'18')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'180103', N'Cuchumbaya', N'1801', N'18')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'180104', N'Samegua', N'1801', N'18')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'180105', N'San Cristóbal', N'1801', N'18')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'180106', N'Torata', N'1801', N'18')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'180201', N'Omate', N'1802', N'18')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'180202', N'Chojata', N'1802', N'18')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'180203', N'Coalaque', N'1802', N'18')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'180204', N'Ichuña', N'1802', N'18')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'180205', N'La Capilla', N'1802', N'18')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'180206', N'Lloque', N'1802', N'18')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'180207', N'Matalaque', N'1802', N'18')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'180208', N'Puquina', N'1802', N'18')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'180209', N'Quinistaquillas', N'1802', N'18')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'180210', N'Ubinas', N'1802', N'18')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'180211', N'Yunga', N'1802', N'18')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'180301', N'Ilo', N'1803', N'18')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'180302', N'El Algarrobal', N'1803', N'18')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'180303', N'Pacocha', N'1803', N'18')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'190101', N'Chaupimarca', N'1901', N'19')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'190102', N'Huachon', N'1901', N'19')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'190103', N'Huariaca', N'1901', N'19')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'190104', N'Huayllay', N'1901', N'19')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'190105', N'Ninacaca', N'1901', N'19')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'190106', N'Pallanchacra', N'1901', N'19')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'190107', N'Paucartambo', N'1901', N'19')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'190108', N'San Francisco de Asís de Yarusyacan', N'1901', N'19')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'190109', N'Simon Bolívar', N'1901', N'19')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'190110', N'Ticlacayan', N'1901', N'19')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'190111', N'Tinyahuarco', N'1901', N'19')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'190112', N'Vicco', N'1901', N'19')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'190113', N'Yanacancha', N'1901', N'19')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'190201', N'Yanahuanca', N'1902', N'19')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'190202', N'Chacayan', N'1902', N'19')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'190203', N'Goyllarisquizga', N'1902', N'19')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'190204', N'Paucar', N'1902', N'19')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'190205', N'San Pedro de Pillao', N'1902', N'19')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'190206', N'Santa Ana de Tusi', N'1902', N'19')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'190207', N'Tapuc', N'1902', N'19')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'190208', N'Vilcabamba', N'1902', N'19')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'190301', N'Oxapampa', N'1903', N'19')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'190302', N'Chontabamba', N'1903', N'19')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'190303', N'Huancabamba', N'1903', N'19')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'190304', N'Palcazu', N'1903', N'19')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'190305', N'Pozuzo', N'1903', N'19')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'190306', N'Puerto Bermúdez', N'1903', N'19')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'190307', N'Villa Rica', N'1903', N'19')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'190308', N'Constitución', N'1903', N'19')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200101', N'Piura', N'2001', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200104', N'Castilla', N'2001', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200105', N'Catacaos', N'2001', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200107', N'Cura Mori', N'2001', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200108', N'El Tallan', N'2001', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200109', N'La Arena', N'2001', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200110', N'La Unión', N'2001', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200111', N'Las Lomas', N'2001', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200114', N'Tambo Grande', N'2001', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200115', N'Veintiseis de Octubre', N'2001', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200201', N'Ayabaca', N'2002', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200202', N'Frias', N'2002', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200203', N'Jilili', N'2002', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200204', N'Lagunas', N'2002', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200205', N'Montero', N'2002', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200206', N'Pacaipampa', N'2002', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200207', N'Paimas', N'2002', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200208', N'Sapillica', N'2002', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200209', N'Sicchez', N'2002', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200210', N'Suyo', N'2002', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200301', N'Huancabamba', N'2003', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200302', N'Canchaque', N'2003', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200303', N'El Carmen de la Frontera', N'2003', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200304', N'Huarmaca', N'2003', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200305', N'Lalaquiz', N'2003', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200306', N'San Miguel de El Faique', N'2003', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200307', N'Sondor', N'2003', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200308', N'Sondorillo', N'2003', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200401', N'Chulucanas', N'2004', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200402', N'Buenos Aires', N'2004', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200403', N'Chalaco', N'2004', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200404', N'La Matanza', N'2004', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200405', N'Morropon', N'2004', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200406', N'Salitral', N'2004', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200407', N'San Juan de Bigote', N'2004', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200408', N'Santa Catalina de Mossa', N'2004', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200409', N'Santo Domingo', N'2004', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200410', N'Yamango', N'2004', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200501', N'Paita', N'2005', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200502', N'Amotape', N'2005', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200503', N'Arenal', N'2005', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200504', N'Colan', N'2005', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200505', N'La Huaca', N'2005', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200506', N'Tamarindo', N'2005', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200507', N'Vichayal', N'2005', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200601', N'Sullana', N'2006', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200602', N'Bellavista', N'2006', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200603', N'Ignacio Escudero', N'2006', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200604', N'Lancones', N'2006', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200605', N'Marcavelica', N'2006', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200606', N'Miguel Checa', N'2006', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200607', N'Querecotillo', N'2006', N'20')
GO
print 'Processed 1600 total records'
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200608', N'Salitral', N'2006', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200701', N'Pariñas', N'2007', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200702', N'El Alto', N'2007', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200703', N'La Brea', N'2007', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200704', N'Lobitos', N'2007', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200705', N'Los Organos', N'2007', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200706', N'Mancora', N'2007', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200801', N'Sechura', N'2008', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200802', N'Bellavista de la Unión', N'2008', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200803', N'Bernal', N'2008', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200804', N'Cristo Nos Valga', N'2008', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200805', N'Vice', N'2008', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'200806', N'Rinconada Llicuar', N'2008', N'20')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210101', N'Puno', N'2101', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210102', N'Acora', N'2101', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210103', N'Amantani', N'2101', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210104', N'Atuncolla', N'2101', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210105', N'Capachica', N'2101', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210106', N'Chucuito', N'2101', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210107', N'Coata', N'2101', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210108', N'Huata', N'2101', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210109', N'Mañazo', N'2101', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210110', N'Paucarcolla', N'2101', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210111', N'Pichacani', N'2101', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210112', N'Plateria', N'2101', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210113', N'San Antonio', N'2101', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210114', N'Tiquillaca', N'2101', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210115', N'Vilque', N'2101', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210201', N'Azángaro', N'2102', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210202', N'Achaya', N'2102', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210203', N'Arapa', N'2102', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210204', N'Asillo', N'2102', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210205', N'Caminaca', N'2102', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210206', N'Chupa', N'2102', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210207', N'José Domingo Choquehuanca', N'2102', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210208', N'Muñani', N'2102', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210209', N'Potoni', N'2102', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210210', N'Saman', N'2102', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210211', N'San Anton', N'2102', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210212', N'San José', N'2102', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210213', N'San Juan de Salinas', N'2102', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210214', N'Santiago de Pupuja', N'2102', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210215', N'Tirapata', N'2102', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210301', N'Macusani', N'2103', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210302', N'Ajoyani', N'2103', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210303', N'Ayapata', N'2103', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210304', N'Coasa', N'2103', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210305', N'Corani', N'2103', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210306', N'Crucero', N'2103', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210307', N'Ituata', N'2103', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210308', N'Ollachea', N'2103', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210309', N'San Gaban', N'2103', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210310', N'Usicayos', N'2103', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210401', N'Juli', N'2104', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210402', N'Desaguadero', N'2104', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210403', N'Huacullani', N'2104', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210404', N'Kelluyo', N'2104', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210405', N'Pisacoma', N'2104', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210406', N'Pomata', N'2104', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210407', N'Zepita', N'2104', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210501', N'Ilave', N'2105', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210502', N'Capazo', N'2105', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210503', N'Pilcuyo', N'2105', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210504', N'Santa Rosa', N'2105', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210505', N'Conduriri', N'2105', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210601', N'Huancane', N'2106', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210602', N'Cojata', N'2106', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210603', N'Huatasani', N'2106', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210604', N'Inchupalla', N'2106', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210605', N'Pusi', N'2106', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210606', N'Rosaspata', N'2106', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210607', N'Taraco', N'2106', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210608', N'Vilque Chico', N'2106', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210701', N'Lampa', N'2107', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210702', N'Cabanilla', N'2107', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210703', N'Calapuja', N'2107', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210704', N'Nicasio', N'2107', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210705', N'Ocuviri', N'2107', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210706', N'Palca', N'2107', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210707', N'Paratia', N'2107', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210708', N'Pucara', N'2107', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210709', N'Santa Lucia', N'2107', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210710', N'Vilavila', N'2107', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210801', N'Ayaviri', N'2108', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210802', N'Antauta', N'2108', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210803', N'Cupi', N'2108', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210804', N'Llalli', N'2108', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210805', N'Macari', N'2108', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210806', N'Nuñoa', N'2108', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210807', N'Orurillo', N'2108', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210808', N'Santa Rosa', N'2108', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210809', N'Umachiri', N'2108', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210901', N'Moho', N'2109', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210902', N'Conima', N'2109', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210903', N'Huayrapata', N'2109', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'210904', N'Tilali', N'2109', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'211001', N'Putina', N'2110', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'211002', N'Ananea', N'2110', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'211003', N'Pedro Vilca Apaza', N'2110', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'211004', N'Quilcapuncu', N'2110', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'211005', N'Sina', N'2110', N'21')
GO
print 'Processed 1700 total records'
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'211101', N'Juliaca', N'2111', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'211102', N'Cabana', N'2111', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'211103', N'Cabanillas', N'2111', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'211104', N'Caracoto', N'2111', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'211105', N'San Miguel', N'2111', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'211201', N'Sandia', N'2112', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'211202', N'Cuyocuyo', N'2112', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'211203', N'Limbani', N'2112', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'211204', N'Patambuco', N'2112', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'211205', N'Phara', N'2112', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'211206', N'Quiaca', N'2112', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'211207', N'San Juan del Oro', N'2112', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'211208', N'Yanahuaya', N'2112', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'211209', N'Alto Inambari', N'2112', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'211210', N'San Pedro de Putina Punco', N'2112', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'211301', N'Yunguyo', N'2113', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'211302', N'Anapia', N'2113', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'211303', N'Copani', N'2113', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'211304', N'Cuturapi', N'2113', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'211305', N'Ollaraya', N'2113', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'211306', N'Tinicachi', N'2113', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'211307', N'Unicachi', N'2113', N'21')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220101', N'Moyobamba', N'2201', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220102', N'Calzada', N'2201', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220103', N'Habana', N'2201', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220104', N'Jepelacio', N'2201', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220105', N'Soritor', N'2201', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220106', N'Yantalo', N'2201', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220201', N'Bellavista', N'2202', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220202', N'Alto Biavo', N'2202', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220203', N'Bajo Biavo', N'2202', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220204', N'Huallaga', N'2202', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220205', N'San Pablo', N'2202', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220206', N'San Rafael', N'2202', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220301', N'San José de Sisa', N'2203', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220302', N'Agua Blanca', N'2203', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220303', N'San Martín', N'2203', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220304', N'Santa Rosa', N'2203', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220305', N'Shatoja', N'2203', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220401', N'Saposoa', N'2204', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220402', N'Alto Saposoa', N'2204', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220403', N'El Eslabón', N'2204', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220404', N'Piscoyacu', N'2204', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220405', N'Sacanche', N'2204', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220406', N'Tingo de Saposoa', N'2204', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220501', N'Lamas', N'2205', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220502', N'Alonso de Alvarado', N'2205', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220503', N'Barranquita', N'2205', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220504', N'Caynarachi', N'2205', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220505', N'Cuñumbuqui', N'2205', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220506', N'Pinto Recodo', N'2205', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220507', N'Rumisapa', N'2205', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220508', N'San Roque de Cumbaza', N'2205', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220509', N'Shanao', N'2205', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220510', N'Tabalosos', N'2205', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220511', N'Zapatero', N'2205', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220601', N'Juanjuí', N'2206', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220602', N'Campanilla', N'2206', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220603', N'Huicungo', N'2206', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220604', N'Pachiza', N'2206', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220605', N'Pajarillo', N'2206', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220701', N'Picota', N'2207', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220702', N'Buenos Aires', N'2207', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220703', N'Caspisapa', N'2207', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220704', N'Pilluana', N'2207', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220705', N'Pucacaca', N'2207', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220706', N'San Cristóbal', N'2207', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220707', N'San Hilarión', N'2207', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220708', N'Shamboyacu', N'2207', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220709', N'Tingo de Ponasa', N'2207', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220710', N'Tres Unidos', N'2207', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220801', N'Rioja', N'2208', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220802', N'Awajun', N'2208', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220803', N'Elías Soplin Vargas', N'2208', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220804', N'Nueva Cajamarca', N'2208', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220805', N'Pardo Miguel', N'2208', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220806', N'Posic', N'2208', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220807', N'San Fernando', N'2208', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220808', N'Yorongos', N'2208', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220809', N'Yuracyacu', N'2208', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220901', N'Tarapoto', N'2209', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220902', N'Alberto Leveau', N'2209', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220903', N'Cacatachi', N'2209', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220904', N'Chazuta', N'2209', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220905', N'Chipurana', N'2209', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220906', N'El Porvenir', N'2209', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220907', N'Huimbayoc', N'2209', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220908', N'Juan Guerra', N'2209', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220909', N'La Banda de Shilcayo', N'2209', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220910', N'Morales', N'2209', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220911', N'Papaplaya', N'2209', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220912', N'San Antonio', N'2209', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220913', N'Sauce', N'2209', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'220914', N'Shapaja', N'2209', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'221001', N'Tocache', N'2210', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'221002', N'Nuevo Progreso', N'2210', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'221003', N'Polvora', N'2210', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'221004', N'Shunte', N'2210', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'221005', N'Uchiza', N'2210', N'22')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'230101', N'Tacna', N'2301', N'23')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'230102', N'Alto de la Alianza', N'2301', N'23')
GO
print 'Processed 1800 total records'
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'230103', N'Calana', N'2301', N'23')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'230104', N'Ciudad Nueva', N'2301', N'23')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'230105', N'Inclan', N'2301', N'23')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'230106', N'Pachia', N'2301', N'23')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'230107', N'Palca', N'2301', N'23')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'230108', N'Pocollay', N'2301', N'23')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'230109', N'Sama', N'2301', N'23')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'230110', N'Coronel Gregorio Albarracín Lanchipa', N'2301', N'23')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'230111', N'La Yarada los Palos', N'2301', N'23')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'230201', N'Candarave', N'2302', N'23')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'230202', N'Cairani', N'2302', N'23')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'230203', N'Camilaca', N'2302', N'23')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'230204', N'Curibaya', N'2302', N'23')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'230205', N'Huanuara', N'2302', N'23')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'230206', N'Quilahuani', N'2302', N'23')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'230301', N'Locumba', N'2303', N'23')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'230302', N'Ilabaya', N'2303', N'23')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'230303', N'Ite', N'2303', N'23')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'230401', N'Tarata', N'2304', N'23')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'230402', N'Héroes Albarracín', N'2304', N'23')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'230403', N'Estique', N'2304', N'23')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'230404', N'Estique-Pampa', N'2304', N'23')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'230405', N'Sitajara', N'2304', N'23')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'230406', N'Susapaya', N'2304', N'23')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'230407', N'Tarucachi', N'2304', N'23')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'230408', N'Ticaco', N'2304', N'23')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'240101', N'Tumbes', N'2401', N'24')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'240102', N'Corrales', N'2401', N'24')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'240103', N'La Cruz', N'2401', N'24')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'240104', N'Pampas de Hospital', N'2401', N'24')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'240105', N'San Jacinto', N'2401', N'24')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'240106', N'San Juan de la Virgen', N'2401', N'24')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'240201', N'Zorritos', N'2402', N'24')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'240202', N'Casitas', N'2402', N'24')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'240203', N'Canoas de Punta Sal', N'2402', N'24')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'240301', N'Zarumilla', N'2403', N'24')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'240302', N'Aguas Verdes', N'2403', N'24')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'240303', N'Matapalo', N'2403', N'24')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'240304', N'Papayal', N'2403', N'24')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'250101', N'Calleria', N'2501', N'25')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'250102', N'Campoverde', N'2501', N'25')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'250103', N'Iparia', N'2501', N'25')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'250104', N'Masisea', N'2501', N'25')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'250105', N'Yarinacocha', N'2501', N'25')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'250106', N'Nueva Requena', N'2501', N'25')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'250107', N'Manantay', N'2501', N'25')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'250201', N'Raymondi', N'2502', N'25')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'250202', N'Sepahua', N'2502', N'25')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'250203', N'Tahuania', N'2502', N'25')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'250204', N'Yurua', N'2502', N'25')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'250301', N'Padre Abad', N'2503', N'25')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'250302', N'Irazola', N'2503', N'25')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'250303', N'Curimana', N'2503', N'25')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'250304', N'Neshuya', N'2503', N'25')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'250305', N'Alexander Von Humboldt', N'2503', N'25')
INSERT [dbo].[ubigeo_peru_districts] ([id], [name], [province_id], [department_id]) VALUES (N'250401', N'Purus', N'2504', N'25')
/****** Object:  Table [dbo].[ubigeo_peru_departments]    Script Date: 09/21/2024 22:05:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ubigeo_peru_departments](
	[id] [varchar](2) NOT NULL,
	[name] [varchar](45) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[ubigeo_peru_departments] ([id], [name]) VALUES (N'01', N'Amazonas')
INSERT [dbo].[ubigeo_peru_departments] ([id], [name]) VALUES (N'02', N'Áncash')
INSERT [dbo].[ubigeo_peru_departments] ([id], [name]) VALUES (N'03', N'Apurímac')
INSERT [dbo].[ubigeo_peru_departments] ([id], [name]) VALUES (N'04', N'Arequipa')
INSERT [dbo].[ubigeo_peru_departments] ([id], [name]) VALUES (N'05', N'Ayacucho')
INSERT [dbo].[ubigeo_peru_departments] ([id], [name]) VALUES (N'06', N'Cajamarca')
INSERT [dbo].[ubigeo_peru_departments] ([id], [name]) VALUES (N'07', N'Callao')
INSERT [dbo].[ubigeo_peru_departments] ([id], [name]) VALUES (N'08', N'Cusco')
INSERT [dbo].[ubigeo_peru_departments] ([id], [name]) VALUES (N'09', N'Huancavelica')
INSERT [dbo].[ubigeo_peru_departments] ([id], [name]) VALUES (N'10', N'Huánuco')
INSERT [dbo].[ubigeo_peru_departments] ([id], [name]) VALUES (N'11', N'Ica')
INSERT [dbo].[ubigeo_peru_departments] ([id], [name]) VALUES (N'12', N'Junín')
INSERT [dbo].[ubigeo_peru_departments] ([id], [name]) VALUES (N'13', N'La Libertad')
INSERT [dbo].[ubigeo_peru_departments] ([id], [name]) VALUES (N'14', N'Lambayeque')
INSERT [dbo].[ubigeo_peru_departments] ([id], [name]) VALUES (N'15', N'Lima')
INSERT [dbo].[ubigeo_peru_departments] ([id], [name]) VALUES (N'16', N'Loreto')
INSERT [dbo].[ubigeo_peru_departments] ([id], [name]) VALUES (N'17', N'Madre de Dios')
INSERT [dbo].[ubigeo_peru_departments] ([id], [name]) VALUES (N'18', N'Moquegua')
INSERT [dbo].[ubigeo_peru_departments] ([id], [name]) VALUES (N'19', N'Pasco')
INSERT [dbo].[ubigeo_peru_departments] ([id], [name]) VALUES (N'20', N'Piura')
INSERT [dbo].[ubigeo_peru_departments] ([id], [name]) VALUES (N'21', N'Puno')
INSERT [dbo].[ubigeo_peru_departments] ([id], [name]) VALUES (N'22', N'San Martín')
INSERT [dbo].[ubigeo_peru_departments] ([id], [name]) VALUES (N'23', N'Tacna')
INSERT [dbo].[ubigeo_peru_departments] ([id], [name]) VALUES (N'24', N'Tumbes')
INSERT [dbo].[ubigeo_peru_departments] ([id], [name]) VALUES (N'25', N'Ucayali')
/****** Object:  Table [dbo].[tipoUsuario]    Script Date: 09/21/2024 22:05:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tipoUsuario](
	[id_tipoUsuario] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](200) NULL,
 CONSTRAINT [PK_tipoUsuario] PRIMARY KEY CLUSTERED 
(
	[id_tipoUsuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tipoUsuario] ON
INSERT [dbo].[tipoUsuario] ([id_tipoUsuario], [descripcion]) VALUES (1, N'Cliente')
INSERT [dbo].[tipoUsuario] ([id_tipoUsuario], [descripcion]) VALUES (2, N'Vendedor')
INSERT [dbo].[tipoUsuario] ([id_tipoUsuario], [descripcion]) VALUES (3, N'Administrador')
SET IDENTITY_INSERT [dbo].[tipoUsuario] OFF
/****** Object:  Table [dbo].[tipoDocumento]    Script Date: 09/21/2024 22:05:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tipoDocumento](
	[id_tipoDocumento] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_tipoDocumento] PRIMARY KEY CLUSTERED 
(
	[id_tipoDocumento] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tipoDocumento] ON
INSERT [dbo].[tipoDocumento] ([id_tipoDocumento], [descripcion]) VALUES (1, N'DNI')
INSERT [dbo].[tipoDocumento] ([id_tipoDocumento], [descripcion]) VALUES (2, N'CARNET DE EXTRANJERIA')
SET IDENTITY_INSERT [dbo].[tipoDocumento] OFF
/****** Object:  StoredProcedure [dbo].[sp_verificarExistenciaEmail]    Script Date: 09/21/2024 22:05:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_verificarExistenciaEmail](
     @email VARCHAR(150)     
)
as
BEGIN
    
        select COUNT(*) 
        from Usuario 
        where email= @email
        
    
END
GO
/****** Object:  StoredProcedure [dbo].[sp_verificarExistenciaDni]    Script Date: 09/21/2024 22:05:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_verificarExistenciaDni](
     @dni VARCHAR(20)     
)
as
BEGIN
    
        select COUNT(*) 
        from Usuario 
        where dni = @dni
        
    
END
GO
/****** Object:  StoredProcedure [dbo].[sp_traerTipoUsuario]    Script Date: 09/21/2024 22:05:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_traerTipoUsuario] 
as
BEGIN
    
    select * from tipoUsuario
    
END
GO
/****** Object:  StoredProcedure [dbo].[sp_nuevoRegistroIngreso]    Script Date: 09/21/2024 22:05:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_nuevoRegistroIngreso](
     @id_usuario int,
     @fechaIngreso datetime2(7)
)
as
BEGIN
    
        -- Insertar el nuevo usuario
        INSERT INTO registroIngreso (id_usuario,fechaIngreso )
        VALUES (@id_usuario,@fechaIngreso);
    
END
GO
/****** Object:  StoredProcedure [dbo].[sp_nuevaPasarelaPago]    Script Date: 09/21/2024 22:05:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_nuevaPasarelaPago](@id_usuario int,
     @estado varchar(50),
     @monto float)
as
BEGIN
    
    insert into pasarelaPago(id_usuario,estado,monto) values (@id_usuario,@estado,@monto)
    
END
GO
/****** Object:  StoredProcedure [dbo].[sp_modificarEstadoCuenta]    Script Date: 09/21/2024 22:05:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_modificarEstadoCuenta](
     @id_usuario int,
     @nuevoMonto float     
)
as
BEGIN
    
        
        update estadocuenta
        set
        saldoDisponible=@nuevoMonto
        where id_usuario = @id_usuario
    
END
GO
/****** Object:  StoredProcedure [dbo].[sp_listarUsuarioPorDni]    Script Date: 09/21/2024 22:05:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_listarUsuarioPorDni] @dni as varchar(50)
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Usuario where dni = @dni
END
GO
/****** Object:  StoredProcedure [dbo].[sp_listarUsuario]    Script Date: 09/21/2024 22:05:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_listarUsuario] 
AS
BEGIN
	
	SET NOCOUNT ON;

    
	SELECT * from Usuario 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_listarTipoDocumento]    Script Date: 09/21/2024 22:05:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_listarTipoDocumento]
AS
BEGIN
	
	
	SET NOCOUNT ON;

    select * from tipoDocumento
    
END
GO
/****** Object:  StoredProcedure [dbo].[sp_listarProvinciasPorDepartamento]    Script Date: 09/21/2024 22:05:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_listarProvinciasPorDepartamento] 
		@id_departamento int

AS
BEGIN
	
	SET NOCOUNT ON;

    select * from ubigeo_peru_provinces where department_id = @id_departamento;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_listarDistritoPorProvinciayDepartamento]    Script Date: 09/21/2024 22:05:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_listarDistritoPorProvinciayDepartamento] 
		@id_departamento int,
		@id_provincia int

AS
BEGIN
	
	SET NOCOUNT ON;

    select * 
    from ubigeo_peru_districts 
    where department_id = @id_departamento and province_id = @id_provincia
END
GO
/****** Object:  StoredProcedure [dbo].[sp_listarDepartamentos]    Script Date: 09/21/2024 22:05:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_listarDepartamentos]
AS
BEGIN

	SET NOCOUNT ON;

	select * from ubigeo_peru_departments
END
GO
/****** Object:  StoredProcedure [dbo].[sp_crearUsuarioNuevo]    Script Date: 09/21/2024 22:05:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_crearUsuarioNuevo](
     @dni VARCHAR(20),
     @nombres VARCHAR(100),
     @apellidos VARCHAR(100),
     @fechaNacimiento DATE,
     @id_tipoDocumento int,
     @email VARCHAR(150),
     @direccion VARCHAR(150),
     @id_departamento int,
     @id_provincia int,
     @id_distrito int,
     @codigoPostal VARCHAR(50),
     @contrasena VARCHAR(350),
     @celular VARCHAR(50),
     @id_tipoUsuario int
)
as
BEGIN
    
        -- Insertar el nuevo usuario
        INSERT INTO usuario ( nombres,apellidos,fechaNacimiento,dni,id_tipoDocumento,email,
        direccion,id_departamento,id_provincia,id_distrito,codigoPostal,contrasena,celular,id_tipoUsuario)
        VALUES (@nombres,@apellidos,@fechaNacimiento,@dni,@id_tipoDocumento,@email,
        @direccion,@id_departamento,@id_provincia,@id_distrito,@codigoPostal,@contrasena,@celular,@id_tipoUsuario);
    
END
GO
/****** Object:  StoredProcedure [dbo].[sp_consultaEstadoCuenta]    Script Date: 09/21/2024 22:05:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_consultaEstadoCuenta](
     @id_usuario int     
)
as
BEGIN
    
        
        select saldoDisponible from estadoCuenta where id_usuario=@id_usuario;
    
END
GO
/****** Object:  Default [DF__ubigeo_per__name__060DEAE8]    Script Date: 09/21/2024 22:05:38 ******/
ALTER TABLE [dbo].[ubigeo_peru_districts] ADD  DEFAULT (NULL) FOR [name]
GO
/****** Object:  Default [DF__ubigeo_pe__provi__07020F21]    Script Date: 09/21/2024 22:05:38 ******/
ALTER TABLE [dbo].[ubigeo_peru_districts] ADD  DEFAULT (NULL) FOR [province_id]
GO
/****** Object:  Default [DF__ubigeo_pe__depar__07F6335A]    Script Date: 09/21/2024 22:05:38 ******/
ALTER TABLE [dbo].[ubigeo_peru_districts] ADD  DEFAULT (NULL) FOR [department_id]
GO
