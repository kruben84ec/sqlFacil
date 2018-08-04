use supletorio;

Drop table datos;
create table datos (
	sec [int] IDENTITY(1,1) NOT NULL,
	ci char(15),
	nombre char(30),
	direccion char(30),
	telefono char(10),
	nivel int,
	fechaIni date,
	fechaFin date,
	hemisemestre int,
	materia1 char(30),
	notaM11 decimal(18,2),
	notaM12 decimal(18,2),
	notaM13 decimal(18,2),
	materia2 char(30),
	notaM21 decimal(18,2),
	notaM22 decimal(18,2),
	notaM23 decimal(18,2),
	 CONSTRAINT [PK_datos] PRIMARY KEY CLUSTERED 
(
	[sec] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

DROP TABLE [dbo].[notas]
GO

/****** Object:  Table [dbo].[notas]    Script Date: 03/08/2018 08:04:12 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[notas](
	[sec] [int] IDENTITY(1,1) NOT NULL,
	[hemisemestre] [int] NULL,
	[materia1] [char](30) NULL,
	[notaM11] [decimal](18, 2) NULL,
	[notaM12] [decimal](18, 2) NULL,
	[notaM13] [decimal](18, 2) NULL,
 CONSTRAINT [PK_notas] PRIMARY KEY CLUSTERED 
(
	[sec] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[nivel]    Script Date: 03/08/2018 08:04:55 a. m. ******/
DROP TABLE [dbo].[nivel]
GO

/****** Object:  Table [dbo].[nivel]    Script Date: 03/08/2018 08:04:55 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[nivel](
	[sec] [int] IDENTITY(1,1) NOT NULL,
	[nivel] [int] NULL,
	[fechaIni] [date] NULL,
	[fechaFin] [date] NULL,
 CONSTRAINT [PK_nivel] PRIMARY KEY CLUSTERED 
(
	[sec] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



/****** Object:  Table [dbo].[estudiante]    Script Date: 03/08/2018 08:05:13 a. m. ******/
DROP TABLE [dbo].[estudiante]
GO

/****** Object:  Table [dbo].[estudiante]    Script Date: 03/08/2018 08:05:13 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[estudiante](
	[sec] [int] IDENTITY(1,1) NOT NULL,
	[ci] [char](15) NULL,
	[nombre] [char](30) NULL,
	[direccion] [char](30) NULL,
	[telefono] [char](10) NULL,
 CONSTRAINT [PK_estudiante] PRIMARY KEY CLUSTERED 
(
	[sec] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
DROP TABLE [dbo].[libreta]
GO

/****** Object:  Table [dbo].[libreta]    Script Date: 03/08/2018 09:01:59 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[libreta](
	[sec] [int] IDENTITY(1,1) NOT NULL,
	[idestudainte] [int] NULL,
	[idnivel] [int] NULL,
	[cidnotas] [int] NULL,
 CONSTRAINT [PK_libreta] PRIMARY KEY CLUSTERED 
(
	[sec] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO





TRUNCATE TABLE DATOS;
TRUNCATE TABLE ESTUDIANTE;
TRUNCATE TABLE NIVEL;
TRUNCATE TABLE NOTAS;
truncate table libreta;

INSERT INTO DATOS VALUES ('124569','JUAN','LA GASCA','2252555',1,'2018-07-01','2018-09-13',1,'BASE DE DATOS 3',20,19,17,'SISTEMAS OPERATIVOS ',15,11,20);
INSERT INTO DATOS VALUES ('12469','KATTY','LA GASCA1','2292555',2,'2018-06-01','2018-10-13',2,'BASE 2',15,14,13,'SISTEMAS HIDARULICOS ',15,11,20);
INSERT INTO DATOS VALUES ('128569','MAGY','LA GASCA2','2122555',3,'2018-05-01','2018-11-13',1,'MINENERIA',10,19,17,'SISTEMAS PUERTOS ',15,11,20);
INSERT INTO DATOS VALUES ('129569','ANDREA','LA GASCA3','2922555',4,'2018-04-01','2018-12-13',2,'OPERATIVO',10,19,17,'OPTATIVA1 ',15,11,20);
INSERT INTO DATOS VALUES ('124569','RAQUEL','LA GASCA3','2722555',1,'2018-03-01','2019-01-13',2,'DESARROLLO',14,19,17,'SISTEMAS OPERATIVOS ',15,11,20);
INSERT INTO DATOS VALUES ('121569','MARIA','LA GASCA4','2229555',2,'2018-02-01','2018-07-13',1,'COMINICACION',12,19,17,'COMUNICACION ',15,11,20);
INSERT INTO DATOS VALUES ('122569','CARLOS','LAS CASAS','2228555',3,'2019-01-01','2019-09-13',2,'SOCIALES',20,14,17,'CONTABILIDAD  ',15,11,20);
INSERT INTO DATOS VALUES ('1288569','CHRIS','FLORIDA','2222575',5,'2018-02-01','2018-09-13',1,'CONTABILIDAD',20,10,17,'SOCIALES ',15,11,20);
INSERT INTO DATOS VALUES ('12869','RUBEN','CARCELEN','2222515',6,'2018-03-01','2018-09-13',2,'INGENIERIA',20,10,17,'INGENIERIA  ',15,11,20);
INSERT INTO DATOS VALUES ('128569','MARTHA','CARAPUNGO','1222555',7,'2018-04-01','2018-09-13',1,'FISICA',20,08,17,'SISTEMAS OPERATIVOS ',15,11,20);

select * from datos;
 
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
      ,[telefono]
      ,[nivel]
      ,[fechaIni]
      ,[fechaFin]
      ,[hemisemestre]
      ,[materia1]
      ,[notaM11]
      ,[notaM12]
      ,[notaM13]
      ,[materia2]
      ,[notaM21]
      ,[notaM22]
      ,[notaM23]
  FROM datos;
  open cursor1
declare 
	@ci char(15),
	@nombre char(30),
	@direccion char(30),
	@telefono char(10),
	@nivel int,
	@fechaIni date,
	@fechaFin date,
	@hemisemestre int,
	@materia1 char(30),
	@notaM11 decimal(18,2),
	@notaM12 decimal(18,2),
	@notaM13 decimal(18,2),
	@materia2 char(30),
	@notaM21 decimal(18,2),
	@notaM22 decimal(18,2),
	@notaM23 decimal(18,2)
	 fetch next from cursor1 into
 @ci
 ,@nombre
 ,@direccion
 ,@telefono
 ,@nivel
 ,@fechaIni
 ,@fechaFin
 ,@hemisemestre
 ,@materia1
 ,@notaM11
 ,@notaM12
 ,@notaM13
 ,@materia2
 ,@notaM21
 ,@notaM22
 ,@notaM23
 	while (@@fetch_status = 0 )
	begin
	INSERT INTO  estudiante VALUES (
	 @ci
 ,@nombre
 ,@direccion
 ,@telefono
	);
	INSERT INTO  NIVEL VALUES 
	(
	@nivel
 ,@fechaIni
 ,@fechaFin
	);

	INSERT INTO NOTAS VALUES (
 @hemisemestre
 ,@materia1
 ,@notaM11
 ,@notaM12
 ,@notaM13
	);

		INSERT INTO NOTAS VALUES (
 @hemisemestre
 ,@materia2
 ,@notaM21
 ,@notaM22
 ,@notaM23
	);

	 fetch next from cursor1 into
 @ci
 ,@nombre
 ,@direccion
 ,@telefono
 ,@nivel
 ,@fechaIni
 ,@fechaFin
 ,@hemisemestre
 ,@materia1
 ,@notaM11
 ,@notaM12
 ,@notaM13
 ,@materia2
 ,@notaM21
 ,@notaM22
 ,@notaM23
 end;
	close cursor1;
	deallocate cursor1;

	declare cursor2 cursor for
SELECT 
e.sec as  idestudainte,
n.sec as idnivel,
t.sec as idnotas
FROM DATOS D 
INNER JOIN estudiante E  ON D.CI= E.CI
INNER JOIN NIVEL N  ON D.nivel= N.NIVEL AND D.fechaIni = N.fechaIni  AND d.fechaFin=n.fechaFin
INNER JOIN NOTAS  t  ON D.hemisemestre= t.hemisemestre and d.materia1=t.materia1 
union all
SELECT 
e.sec as  idestudainte,
n.sec as idnivel,
t.sec as idnotas
FROM DATOS D 
INNER JOIN estudiante E  ON D.CI= E.CI
INNER JOIN NIVEL N  ON D.nivel= N.NIVEL AND D.fechaIni = N.fechaIni  AND d.fechaFin=n.fechaFin
INNER JOIN NOTAS  t  ON D.hemisemestre= t.hemisemestre and d.materia2=t.materia1 
open cursor2
declare 
	@idestudainte int,
	@idnivel int,
	@cidnotas int
 fetch next from cursor2 into
 	@idestudainte,
	@idnivel,
	@cidnotas 
	while (@@fetch_status = 0 )
	begin
	insert into libreta values(
 	@idestudainte,
	@idnivel,
	@cidnotas 
	);
 fetch next from cursor2 into
 	@idestudainte,
	@idnivel,
	@cidnotas 
	end;
	close cursor2;
	deallocate cursor2;



end
go

INSERT INTO DATOS VALUES ('7777','alfonso','FLORIDA','2222575',5,'2018-02-01','2018-09-13',1,'CONTABILIDAD',20,20,17,'SOCIALES ',20,11,20);
INSERT INTO DATOS VALUES ('12869','maite','CARCELEN','2222515',6,'2018-03-01','2018-09-13',2,'INGENIERIA',20,20,17,'INGENIERIA  ',15,20,20);
INSERT INTO DATOS VALUES ('128569','jose','CARAPUNGO','1222555',7,'2018-04-01','2018-09-13',1,'FISICA',20,20,17,'SISTEMAS OPERATIVOS ',15,20,20);

exec prueba;



SELECT * FROM estudiante;
SELECT * FROM nivel;
SELECT * FROM NOTAS;
select * from libreta;

select 
l.idestudainte,
l.idnivel,
l.cidnotas,
E.nombre,
E.ci,
t.materia1,
t.notaM11,
t.notaM12,
t.notaM13
 from libreta l
INNER JOIN estudiante E on l.[idestudainte] = e.sec
INNER JOIN nivel n on l.[idnivel] = n.sec
INNER JOIN notas t  on l.[cidnotas] = t.sec
where
e.ci in ('128569 ')
Group by 
l.idestudainte,
l.idnivel,
l.cidnotas,
E.nombre,
E.ci,
t.materia1,
t.notaM11,
t.notaM12,
t.notaM13
;


