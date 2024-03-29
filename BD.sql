USE [master]
GO
/****** Object:  Database [SistVentaNet]    Script Date: 27-11-2019 0:40:12 ******/
CREATE DATABASE [SistVentaNet]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SistVentaNet', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\SistVentaNet.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SistVentaNet_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\SistVentaNet_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SistVentaNet] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SistVentaNet].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SistVentaNet] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SistVentaNet] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SistVentaNet] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SistVentaNet] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SistVentaNet] SET ARITHABORT OFF 
GO
ALTER DATABASE [SistVentaNet] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SistVentaNet] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SistVentaNet] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SistVentaNet] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SistVentaNet] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SistVentaNet] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SistVentaNet] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SistVentaNet] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SistVentaNet] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SistVentaNet] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SistVentaNet] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SistVentaNet] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SistVentaNet] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SistVentaNet] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SistVentaNet] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SistVentaNet] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SistVentaNet] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SistVentaNet] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SistVentaNet] SET  MULTI_USER 
GO
ALTER DATABASE [SistVentaNet] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SistVentaNet] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SistVentaNet] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SistVentaNet] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SistVentaNet] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SistVentaNet] SET QUERY_STORE = OFF
GO
USE [SistVentaNet]
GO
/****** Object:  Table [dbo].[articulo]    Script Date: 27-11-2019 0:40:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[articulo](
	[idarticulo] [int] IDENTITY(1,1) NOT NULL,
	[idcategoria] [int] NOT NULL,
	[codigo] [varchar](50) NULL,
	[nombre] [varchar](100) NOT NULL,
	[precio_venta] [decimal](11, 2) NOT NULL,
	[stock] [int] NOT NULL,
	[descripcion] [varchar](255) NULL,
	[imagen] [varchar](20) NULL,
	[estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idarticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categoria]    Script Date: 27-11-2019 0:40:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoria](
	[idcategoria] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](255) NULL,
	[estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idcategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle_ingreso]    Script Date: 27-11-2019 0:40:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_ingreso](
	[iddetalle_ingreso] [int] IDENTITY(1,1) NOT NULL,
	[idingreso] [int] NOT NULL,
	[idarticulo] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio] [decimal](11, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iddetalle_ingreso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle_venta]    Script Date: 27-11-2019 0:40:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_venta](
	[iddetalle_venta] [int] IDENTITY(1,1) NOT NULL,
	[idventa] [int] NOT NULL,
	[idarticulo] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio] [decimal](11, 2) NOT NULL,
	[descuento] [decimal](11, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iddetalle_venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ingreso]    Script Date: 27-11-2019 0:40:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ingreso](
	[idingreso] [int] IDENTITY(1,1) NOT NULL,
	[idproveedor] [int] NOT NULL,
	[idusuario] [int] NOT NULL,
	[tipo_comprobante] [varchar](20) NOT NULL,
	[serie_comprobante] [varchar](7) NULL,
	[num_comprobante] [varchar](10) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[impuesto] [decimal](4, 2) NOT NULL,
	[total] [decimal](11, 2) NOT NULL,
	[estado] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idingreso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[persona]    Script Date: 27-11-2019 0:40:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[persona](
	[idpersona] [int] IDENTITY(1,1) NOT NULL,
	[tipo_persona] [varchar](20) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[tipo_documento] [varchar](20) NULL,
	[num_documento] [varchar](20) NULL,
	[direccion] [varchar](70) NULL,
	[telefono] [varchar](20) NULL,
	[email] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idpersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rol]    Script Date: 27-11-2019 0:40:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rol](
	[idrol] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[descripcion] [varchar](255) NULL,
	[estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idrol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 27-11-2019 0:40:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[idusuario] [int] IDENTITY(1,1) NOT NULL,
	[idrol] [int] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[tipo_documento] [varchar](20) NULL,
	[num_documento] [varchar](20) NULL,
	[direccion] [varchar](70) NULL,
	[telefono] [varchar](20) NULL,
	[email] [varchar](50) NOT NULL,
	[clave] [varbinary](max) NOT NULL,
	[estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idusuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[venta]    Script Date: 27-11-2019 0:40:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[venta](
	[idventa] [int] IDENTITY(1,1) NOT NULL,
	[idcliente] [int] NOT NULL,
	[idusuario] [int] NOT NULL,
	[tipo_comprobante] [varchar](20) NOT NULL,
	[serie_comprobante] [varchar](7) NULL,
	[num_comprobante] [varchar](10) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[impuesto] [decimal](4, 2) NOT NULL,
	[total] [decimal](11, 2) NOT NULL,
	[estado] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idventa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[articulo] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[categoria] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[rol] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[usuario] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[articulo]  WITH CHECK ADD FOREIGN KEY([idcategoria])
REFERENCES [dbo].[categoria] ([idcategoria])
GO
ALTER TABLE [dbo].[detalle_ingreso]  WITH CHECK ADD FOREIGN KEY([idarticulo])
REFERENCES [dbo].[articulo] ([idarticulo])
GO
ALTER TABLE [dbo].[detalle_ingreso]  WITH CHECK ADD FOREIGN KEY([idingreso])
REFERENCES [dbo].[ingreso] ([idingreso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[detalle_venta]  WITH CHECK ADD FOREIGN KEY([idarticulo])
REFERENCES [dbo].[articulo] ([idarticulo])
GO
ALTER TABLE [dbo].[detalle_venta]  WITH CHECK ADD FOREIGN KEY([idventa])
REFERENCES [dbo].[venta] ([idventa])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ingreso]  WITH CHECK ADD FOREIGN KEY([idproveedor])
REFERENCES [dbo].[persona] ([idpersona])
GO
ALTER TABLE [dbo].[ingreso]  WITH CHECK ADD FOREIGN KEY([idusuario])
REFERENCES [dbo].[usuario] ([idusuario])
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD FOREIGN KEY([idrol])
REFERENCES [dbo].[rol] ([idrol])
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD FOREIGN KEY([idcliente])
REFERENCES [dbo].[persona] ([idpersona])
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD FOREIGN KEY([idusuario])
REFERENCES [dbo].[usuario] ([idusuario])
GO
/****** Object:  StoredProcedure [dbo].[articulo_activar]    Script Date: 27-11-2019 0:40:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento Activar
create proc [dbo].[articulo_activar]
@idarticulo integer
as
update articulo set estado=1
where idarticulo=@idarticulo
GO
/****** Object:  StoredProcedure [dbo].[articulo_actualizar]    Script Date: 27-11-2019 0:40:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Procedimiento Actualizar
create proc [dbo].[articulo_actualizar]
@idarticulo integer,
@idcategoria integer,
@codigo varchar(50),
@nombre varchar(50),
@precio_venta decimal(11,2),
@stock integer,
@descripcion varchar(255),
@imagen varchar(20)
as
update articulo set idcategoria=@idcategoria,codigo=@codigo,
nombre=@nombre,precio_venta=@precio_venta,stock=@stock,
descripcion=@descripcion,imagen=@imagen
where idarticulo=@idarticulo
GO
/****** Object:  StoredProcedure [dbo].[articulo_buscar]    Script Date: 27-11-2019 0:40:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento Buscar
create proc [dbo].[articulo_buscar]
@valor varchar(50)
as
select a.idarticulo as ID,a.idcategoria,c.nombre as Categoria,
a.codigo as Codigo,a.nombre as Nombre,a.precio_venta as Precio_Venta,
a.stock as Stock,a.descripcion as Descripcion,a.imagen as Imagen,
a.estado as Estado
from articulo a inner join categoria c on a.idcategoria=c.idcategoria
where a.nombre like '%' +@valor + '%' Or a.descripcion like '%' +@valor + '%'
order by a.nombre asc
GO
/****** Object:  StoredProcedure [dbo].[articulo_desactivar]    Script Date: 27-11-2019 0:40:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento Desactivar
create proc [dbo].[articulo_desactivar]
@idarticulo integer
as
update articulo set estado=0
where idarticulo=@idarticulo
GO
/****** Object:  StoredProcedure [dbo].[articulo_eliminar]    Script Date: 27-11-2019 0:40:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento Eliminar
create proc [dbo].[articulo_eliminar]
@idarticulo integer
as
delete from articulo
where idarticulo=@idarticulo
GO
/****** Object:  StoredProcedure [dbo].[articulo_existe]    Script Date: 27-11-2019 0:40:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Procedimiento existe
create proc [dbo].[articulo_existe]
@valor varchar(100),
@existe bit output
as
if exists (select nombre from articulo where nombre = ltrim(rtrim(@valor)))
	begin
		set @existe=1
	end
else
	begin
		set @existe=0
	end
GO
/****** Object:  StoredProcedure [dbo].[articulo_insertar]    Script Date: 27-11-2019 0:40:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Procedimiento Insertar
create proc [dbo].[articulo_insertar]
@idcategoria integer,
@codigo varchar(50),
@nombre varchar(100),
@precio_venta decimal(11,2),
@stock integer,
@descripcion varchar(255),
@imagen varchar(20)
as
insert into articulo (idcategoria,codigo,nombre,precio_venta,stock,descripcion,imagen)
values (@idcategoria,@codigo,@nombre,@precio_venta,@stock,@descripcion,@imagen)
GO
/****** Object:  StoredProcedure [dbo].[articulo_listar]    Script Date: 27-11-2019 0:40:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Procedimiento Listar
create proc [dbo].[articulo_listar]
as
select a.idarticulo as ID,a.idcategoria,c.nombre as Categoria,
a.codigo as Codigo,a.nombre as Nombre,a.precio_venta as Precio_Venta,
a.stock as Stock,a.descripcion as Descripcion,a.imagen as Imagen,
a.estado as Estado
from articulo a inner join categoria c on a.idcategoria=c.idcategoria
order by a.idarticulo desc
GO
/****** Object:  StoredProcedure [dbo].[categoria_activar]    Script Date: 27-11-2019 0:40:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Procedimiento Activar
create proc [dbo].[categoria_activar]
@idcategoria int
as
update categoria set estado=1
where idcategoria=@idcategoria
GO
/****** Object:  StoredProcedure [dbo].[categoria_actualizar]    Script Date: 27-11-2019 0:40:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento Actualizar
create proc [dbo].[categoria_actualizar]
@idcategoria int,
@nombre varchar(50),
@descripcion varchar(255)
as
update categoria set nombre=@nombre,descripcion=@descripcion
where idcategoria=@idcategoria
GO
/****** Object:  StoredProcedure [dbo].[categoria_buscar]    Script Date: 27-11-2019 0:40:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento Buscar
create proc [dbo].[categoria_buscar]
@valor varchar(50)
as
select idcategoria as ID,nombre as Nombre,descripcion as Descripcion,estado as Estado
from categoria
where nombre like '%' + @valor + '%' Or descripcion like '%' + @valor + '%'
order by nombre asc
GO
/****** Object:  StoredProcedure [dbo].[categoria_desactivar]    Script Date: 27-11-2019 0:40:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento Desactivar
create proc [dbo].[categoria_desactivar]
@idcategoria int
as
update categoria set estado=0
where idcategoria=@idcategoria
GO
/****** Object:  StoredProcedure [dbo].[categoria_eliminar]    Script Date: 27-11-2019 0:40:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento Eliminar
create proc [dbo].[categoria_eliminar]
@idcategoria int
as
delete from categoria
where idcategoria=@idcategoria
GO
/****** Object:  StoredProcedure [dbo].[categoria_existe]    Script Date: 27-11-2019 0:40:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[categoria_existe]
@valor varchar(100),
@existe bit output
as
	if exists (select nombre from categoria where nombre = ltrim(rtrim(@valor)))
		begin
		 set @existe=1
		end
	else
		begin
		 set @existe=0
		end
GO
/****** Object:  StoredProcedure [dbo].[categoria_insertar]    Script Date: 27-11-2019 0:40:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Procedimiento Insertar
create proc [dbo].[categoria_insertar]
@nombre varchar(50),
@descripcion varchar(255)
as
insert into categoria (nombre,descripcion) values (@nombre,@descripcion)
GO
/****** Object:  StoredProcedure [dbo].[categoria_listar]    Script Date: 27-11-2019 0:40:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento Listar
create proc [dbo].[categoria_listar]
as
select idcategoria as ID,nombre as Nombre,descripcion as Descripcion,estado as Estado
from categoria
order by idcategoria desc
GO
/****** Object:  StoredProcedure [dbo].[categoria_seleccionar]    Script Date: 27-11-2019 0:40:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[categoria_seleccionar]
as
select idcategoria, nombre from categoria
where estado=1
GO
/****** Object:  StoredProcedure [dbo].[rol_listar]    Script Date: 27-11-2019 0:40:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[rol_listar]
as
select idrol, nombre from rol
where estado=1
GO
/****** Object:  StoredProcedure [dbo].[usuario_activar]    Script Date: 27-11-2019 0:40:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento Activar
create proc [dbo].[usuario_activar]
@idusuario integer
as
update usuario set estado=1
where idusuario=@idusuario
GO
/****** Object:  StoredProcedure [dbo].[usuario_actualizar]    Script Date: 27-11-2019 0:40:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento Actualizar
create proc [dbo].[usuario_actualizar]
@idusuario integer,
@idrol integer,
@nombre varchar(100),
@tipo_documento varchar(20),
@num_documento varchar(20),
@direccion varchar(70),
@telefono varchar(20),
@email varchar(50),
@clave varchar(50)
as
if @clave<>''
update usuario set idrol=@idrol,nombre=@nombre,tipo_documento=@tipo_documento,
num_documento=@num_documento,direccion=@direccion,telefono=@telefono,
email=@email,clave=HASHBYTES('SHA2_256', @clave)
where idusuario=@idusuario;
else
update usuario set idrol=@idrol,nombre=@nombre,tipo_documento=@tipo_documento,
num_documento=@num_documento,direccion=@direccion,telefono=@telefono,
email=@email
where idusuario=@idusuario;
GO
/****** Object:  StoredProcedure [dbo].[usuario_buscar]    Script Date: 27-11-2019 0:40:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento Buscar
create proc [dbo].[usuario_buscar]
@valor varchar(50)
as
select u.idusuario as ID,u.idrol, r.nombre as Rol,u.nombre as Nombre,
u.tipo_documento as Tipo_Documento,u.num_documento as Num_Documento,
u.direccion as Direccion,u.telefono as Telefono,u.email as Email,
u.estado as Estado
 from usuario u inner join rol r on u.idrol=r.idrol
 where u.nombre like '%' +@valor + '%' Or u.email like '%' +@valor + '%'
 order by u.nombre asc
GO
/****** Object:  StoredProcedure [dbo].[usuario_desactivar]    Script Date: 27-11-2019 0:40:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento Desactivar
create proc [dbo].[usuario_desactivar]
@idusuario integer
as
update usuario set estado=0
where idusuario=@idusuario
GO
/****** Object:  StoredProcedure [dbo].[usuario_eliminar]    Script Date: 27-11-2019 0:40:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Procedimiento Eliminar
create proc [dbo].[usuario_eliminar]
@idusuario integer
as
delete from usuario
where idusuario=@idusuario
GO
/****** Object:  StoredProcedure [dbo].[usuario_existe]    Script Date: 27-11-2019 0:40:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Procedimiento existe
create proc [dbo].[usuario_existe]
@valor varchar(100),
@existe bit output
as
	if exists (select email from usuario where email = ltrim(rtrim(@valor)))
		begin
		 set @existe=1
		end
	else
		begin
		 set @existe=0
		end
GO
/****** Object:  StoredProcedure [dbo].[usuario_insertar]    Script Date: 27-11-2019 0:40:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento Insertar
create proc [dbo].[usuario_insertar]
@idrol integer,
@nombre varchar(100),
@tipo_documento varchar(20),
@num_documento varchar(20),
@direccion varchar(70),
@telefono varchar(20),
@email varchar(50),
@clave varchar(50)
as
insert into usuario (idrol,nombre,tipo_documento,num_documento,direccion,telefono,email,clave)
values (@idrol,@nombre,@tipo_documento,@num_documento,@direccion,@telefono,@email,HASHBYTES('SHA2_256',@clave))
GO
/****** Object:  StoredProcedure [dbo].[usuario_listar]    Script Date: 27-11-2019 0:40:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Procedimiento Listar
create proc [dbo].[usuario_listar]
as
select u.idusuario as ID,u.idrol, r.nombre as Rol,u.nombre as Nombre,
u.tipo_documento as Tipo_Documento,u.num_documento as Num_Documento,
u.direccion as Direccion,u.telefono as Telefono,u.email as Email,
u.estado as Estado
 from usuario u inner join rol r on u.idrol=r.idrol
 order by u.idusuario desc
GO
/****** Object:  StoredProcedure [dbo].[usuario_login]    Script Date: 27-11-2019 0:40:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usuario_login]
@email varchar(50),
@clave varchar (50)
as
select
u.idusuario,u.idrol,r.nombre as rol,u.nombre,u.estado
from usuario u inner join rol r on u.idrol=r.idrol
where u.email=@email and u.clave=HASHBYTES('SHA2_256',@clave)
GO
USE [master]
GO
ALTER DATABASE [SistVentaNet] SET  READ_WRITE 
GO
