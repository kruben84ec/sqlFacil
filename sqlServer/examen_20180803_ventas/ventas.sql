USE EXAMEN;
drop table datos_ventas;
create table datos_ventas (
	sec  [int] IDENTITY(1,1) NOT NULL,
	ci varchar(15),
	nombre varchar(50),
	direccion varchar(50),
	codprod1 varchar(5),
	nombreprod1 varchar(300),
	cantidad1 int,
	precio1 decimal,
	iva1 decimal,
	codprod2 varchar(5),
	nombreprod2 varchar(300),
	cantidad2 int,
	precio2 decimal,
	iva2 decimal,
 CONSTRAINT [PK_datos_ventas] PRIMARY KEY CLUSTERED 
(
	[sec] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

DROP TABLE [dbo].[CLIENTES]
GO

/****** Object:  Table [dbo].[CLIENTES]    Script Date: 03/08/2018 05:07:23 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CLIENTES](
	[sec] [int] IDENTITY(1,1) NOT NULL,
	[ci] [varchar](15) NULL,
	[nombre] [varchar](50) NULL,
	[direccion] [varchar](50) NULL,
 CONSTRAINT [PK_CLIENTES] PRIMARY KEY CLUSTERED 
(
	[sec] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[PRODUCTOS]    Script Date: 03/08/2018 05:09:21 a. m. ******/
DROP TABLE [dbo].[PRODUCTOS]
GO

/****** Object:  Table [dbo].[PRODUCTOS]    Script Date: 03/08/2018 05:09:21 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PRODUCTOS](
	[sec] [int] IDENTITY(1,1) NOT NULL,
	[codprod1] [varchar](5) NULL,
	[nombreprod1] [varchar](300) NULL,
	[precio1] [decimal](18, 0) NULL,
	[iva1] [decimal](18, 0) NULL,
 CONSTRAINT [PK_PRODUCTOS] PRIMARY KEY CLUSTERED 
(
	[sec] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



/****** Object:  Table [dbo].[ventas]    Script Date: 03/08/2018 05:09:38 a. m. ******/
DROP TABLE [dbo].[ventas]
GO

/****** Object:  Table [dbo].[ventas]    Script Date: 03/08/2018 05:09:38 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ventas](
	[sec] [int] IDENTITY(1,1) NOT NULL,
	[idcliente] [int] NULL,
	[idproductos] [int] NULL,
	[cantidad1] [int] NULL,
 CONSTRAINT [PK_ventas] PRIMARY KEY CLUSTERED 
(
	[sec] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


truncate table datos_ventas;
truncate table clientes;
truncate table productos;
truncate table ventas;

insert into datos_ventas values ('123','katty','cotocollao', 'p1', 'prod1', 10, 20, 0.5, 'p2', 'prod2', 30, 40, 0.3);
insert into datos_ventas values ('4568','andrea','carapungo', 'p4', 'prod3', 50, 60, 0.7, 'p4', 'prod4', 70, 89, 0.5);


select * from datos_ventas;
  
DROP PROCEDURE prueba
GO  


create procedure prueba
as
begin
set nocount on;
declare cursor1 cursor for
SELECT 
       [ci]
      ,[nombre]
      ,[direccion]
      ,[codprod1]
      ,[nombreprod1]
      ,[cantidad1]
      ,[precio1]
      ,[iva1]
      ,[codprod2]
      ,[nombreprod2]
      ,[cantidad2]
      ,[precio2]
      ,[iva2]
  FROM [datos_ventas];
open cursor1
declare 
   @ci varchar(15),
	@nombre varchar(50),
	@direccion varchar(50),
	@codprod1 varchar(5),
	@nombreprod1 varchar(300),
	@cantidad1 int,
	@precio1 decimal,
	@iva1 decimal,
	@codprod2 varchar(5),
	@nombreprod2 varchar(300),
	@cantidad2 int,
	@precio2 decimal,
	@iva2 decimal
 fetch next from cursor1 into
  @ci 
 ,@nombre 
 ,@direccion 
 ,@codprod1 
 ,@nombreprod1 
 ,@cantidad1 
 ,@precio1 
 ,@iva1 
 ,@codprod2 
 ,@nombreprod2 
 ,@cantidad2 
 ,@precio2
 	,@iva2
	while (@@fetch_status = 0 )
	begin
	INSERT INTO CLIENTES VALUES (
  @ci 
 ,@nombre 
 ,@direccion 
	);

	insert into PRODUCTOS values 
	(
		@codprod1 
		,@nombreprod1 
		,@precio1 
		,@iva1 
	);
		insert into PRODUCTOS values 
	(
		@codprod2
		,@nombreprod2
		,@precio2 
		,@iva2
	);
	
	fetch next from cursor1 into 
  @ci 
 ,@nombre 
 ,@direccion 
 ,@codprod1 
 ,@nombreprod1 
 ,@cantidad1 
 ,@precio1 
 ,@iva1 
 ,@codprod2 
 ,@nombreprod2 
 ,@cantidad2 
 ,@precio2
 ,@iva2
	end;
	close cursor1;
	deallocate cursor1;

declare cursor2 cursor for
select
c.sec as idcliente,
p.sec as idproductos,
dv.cantidad1
from datos_ventas dv
INNER JOIN clientes C on dv.ci = C.ci
INNER JOIN productos P on dv.codprod1=p.codprod1 AND dv.precio1 = p.precio1
union all
select
c.sec as idcliente,
p.sec as idproductos,
dv.cantidad2
from datos_ventas dv
INNER JOIN clientes C on dv.ci = C.ci
INNER JOIN productos P on dv.codprod2=p.codprod1 AND dv.precio2 = p.precio1;
open cursor2
declare 
	@idcliente int,
	@idproductos int,
	@cantidad1_v int
 fetch next from cursor2 into
 	@idcliente,
	@idproductos,
	@cantidad1_v 
	while (@@fetch_status = 0 )
	begin
	insert into ventas values(
	@idcliente,
	@idproductos,
	@cantidad1_v 
	);
 fetch next from cursor2 into
 	@idcliente,
	@idproductos,
	@cantidad1_v 
	end;
	close cursor2;
	deallocate cursor2;

end
go
exec prueba;







select * from clientes;
select * from productos;
select * from ventas;

select 
c.ci,
c.nombre,
c.direccion,
v.cantidad1,
p.nombreprod1,
p.precio1,
p.iva1
 from ventas v
inner join CLIENTES c on v.idcliente = c.sec
inner join PRODUCTOS p on v.idproductos = p.sec
;


