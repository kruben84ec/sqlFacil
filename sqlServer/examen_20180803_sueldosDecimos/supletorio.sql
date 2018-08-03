use supletorio;
Drop table sueldos;
create table sueldos (
	sec [int] IDENTITY(1,1) NOT NULL,
	ci varchar(15),
	nombre varchar(50),
	direccion varchar(50),
	sueldo varchar(50),
	valorS decimal, 
	bono varchar(50),
	valorB decimal,
	decimo_tercero varchar(50),
	valorDT decimal,
	decimo_cuarto varchar(50),
	valorDC decimal,
	procesado int,
	 CONSTRAINT [PK_sueldos] PRIMARY KEY CLUSTERED 
(
	[sec] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

drop table personal;
create table personal (
	sec [int] IDENTITY(1,1) NOT NULL,
	ci varchar(15),
	nombre varchar(50),
	direccion varchar(50),
 CONSTRAINT [PK_idpersonal] PRIMARY KEY CLUSTERED 
(
	[sec] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

drop table sueldo;
create table sueldo (
	sec [int] IDENTITY(1,1) NOT NULL,
	sueldo varchar(50),
	valorS decimal,
	 CONSTRAINT [PK_sueldo] PRIMARY KEY CLUSTERED 
(
	[sec] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


DROP TABLE [dbo].[bono]
GO

/****** Object:  Table [dbo].[bono]    Script Date: 03/08/2018 04:20:13 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[bono](
	[sec] [int] IDENTITY(1,1) NOT NULL,
	[bono] [varchar](50) NULL,
	[valorB] [decimal](18, 0) NULL,
 CONSTRAINT [PK_bono] PRIMARY KEY CLUSTERED 
(
	[sec] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


drop table decimo_tercero;
create table decimo_tercero (
	[sec] [int] IDENTITY(1,1) NOT NULL,
	decimo_tercero varchar(50),
	valorDT decimal,
 CONSTRAINT [PK_decimo_tercero] PRIMARY KEY CLUSTERED 
(
	[sec] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
go



DROP TABLE [dbo].[decimo_cuarto]
GO

/****** Object:  Table [dbo].[decimo_cuarto]    Script Date: 03/08/2018 04:22:29 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[decimo_cuarto](
	[sec][int] IDENTITY(1,1) NOT NULL,
	[decimo_cuarto] [varchar](50) NULL,
	[valorDC] [decimal](18, 0) NULL,
 CONSTRAINT [PK_decimo_cuarto] PRIMARY KEY CLUSTERED  
(
	[sec] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO




  truncate table sueldo;
  TRUNCATE TABLE PERSONAL;
  truncate  table bono;
  truncate table decimo_cuarto;
  truncate table decimo_tercero;

insert into sueldos values ('1000','Chris','cotocollao', 'enero', 21, 'bono1', 15, 'dt1', 150, 'dc1', 180, 0);
insert into sueldos values ('2002','Ruben','carapungo', 'enero', 22, 'bono1', 14, 'dt1', 160, 'dc1', 190, 0);
insert into sueldos values ('1005','Katty','chone', 'enero', 32, 'bono1', 12, 'dt1', 10, 'dc1', 190, 0);
insert into sueldos values ('2006','Elizabeth','Pichincha', 'enero', 33, 'bono1', 9, 'dt1', 140, 'dc1', 330, 0);


select * from sueldos;
  
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
      ,[sueldo]
      ,[valorS]
      ,[bono]
      ,[valorB]
      ,[decimo_tercero]
      ,[valorDT]
      ,[decimo_cuarto]
      ,[valorDC]
      ,[procesado]
  FROM [sueldos];
open cursor1
declare 
	@ci varchar(15),
	@nombre varchar(50),
	@direccion varchar(50),
	@sueldo varchar(50),
	@valorS decimal, 
	@bono varchar(50),
	@valorB decimal,
	@decimo_tercero varchar(50),
	@valorDT decimal,
	@decimo_cuarto varchar(50),
	@valorDC decimal,
	@procesado int
 fetch next from cursor1 into
  	@ci ,
	@nombre,
	@direccion,
	@sueldo,
	@valorS , 
	@bono ,
	@valorB ,
	@decimo_tercero,
	@valorDT,
	@decimo_cuarto ,
	@valorDC ,
	@procesado
	while (@@fetch_status = 0 )
	begin
	INSERT INTO PERSONAL VALUES (
	@ci ,
	@nombre,
	@direccion
	);

	INSERT INTO sueldo VALUES
	(
    @sueldo,
	@valorS 
	);

	INSERT INTO BONO VALUES
	(
	@bono ,
	@valorB 
	);

	INSERT INTO decimo_tercero VALUES 
	(
	@decimo_tercero,
	@valorDT
	);

	INSERT INTO decimo_cuarto VALUES
	(
	@decimo_cuarto ,
	@valorDC 
	);

	UPDATE  SUELDOS  SET  procesado = 1 WHERE CI = @CI;
	fetch next from cursor1 into 
	@ci ,
	@nombre,
	@direccion,
	@sueldo,
	@valorS , 
	@bono ,
	@valorB ,
	@decimo_tercero,
	@valorDT,
	@decimo_cuarto ,
	@valorDC ,
	@procesado
	end;
	close cursor1;
	deallocate cursor1;
end
go
exec prueba;



insert into sueldos values ('100','david','cotocollao', 'enero', 20, 'bono1', 10, 'dt1', 10, 'dc1', 10, 0);
insert into sueldos values ('200','bryan','carapungo', 'enero', 20, 'bono1', 10, 'dt1', 10, 'dc1', 10, 0);

exec prueba

select * from sueldos;
select * from personal;
select * from sueldo;
select * from bono;
select * from decimo_tercero;
select * from decimo_cuarto;