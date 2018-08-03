use examen;
/****** Object:  Table [dbo].[concepto]    Script Date: 02/08/2018 10:52:30 p. m. ******/
DROP TABLE [dbo].[concepto]
GO
/****** Object:  Table [dbo].[concepto]    Script Date: 02/08/2018 10:52:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[concepto](
	[idconcepto] [int] IDENTITY(1,1) NOT NULL,
	[cod] [char](30) NULL,
	[nombre] [char](30) NULL,
	[valor] [decimal](18, 2) NULL,
 CONSTRAINT [PK_concepto] PRIMARY KEY CLUSTERED 
(
	[idconcepto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[datos]    Script Date: 02/08/2018 10:53:01 p. m. ******/
DROP TABLE [dbo].[datos]
GO

/****** Object:  Table [dbo].[datos]    Script Date: 02/08/2018 10:53:01 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[datos](
	[ci] [char](15) NULL,
	[nombre] [char](30) NULL,
	[dirrecion] [char](30) NULL,
	[telef] [char](10) NULL,
	[mes] [int] NULL,
	[codConep_1] [int] NULL,
	[nombreConepto1] [char](30) NULL,
	[valores] [decimal](18, 2) NULL,
	[codConep_2] [int] NULL,
	[nombreConepto2] [char](30) NULL,
	[valores2] [decimal](18, 2) NULL,
	[codConep_3] [int] NULL,
	[nombreConepto3] [char](30) NULL,
	[valores3] [decimal](18, 2) NULL,
	[fechaInicio] [date] NULL,
	[fechaFin] [date] NULL
) ON [PRIMARY]
GO



/****** Object:  Table [dbo].[empleados]    Script Date: 02/08/2018 10:53:29 p. m. ******/
DROP TABLE [dbo].[empleados]
GO

/****** Object:  Table [dbo].[empleados]    Script Date: 02/08/2018 10:53:29 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[empleados](
	[idempleado] [int] IDENTITY(1,1) NOT NULL,
	[ci] [char](15) NULL,
	[nombre] [char](30) NULL,
	[direccion] [char](30) NULL,
	[telefono] [char](10) NULL,
 CONSTRAINT [PK_empelados] PRIMARY KEY CLUSTERED 
(
	[idempleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



/****** Object:  Table [dbo].[liquidacion]    Script Date: 02/08/2018 10:53:53 p. m. ******/
DROP TABLE [dbo].[liquidacion]
GO

/****** Object:  Table [dbo].[liquidacion]    Script Date: 02/08/2018 10:53:53 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[liquidacion](
	[idliquidacion] [int] IDENTITY(1,1) NOT NULL,
	[idconcepto] [int] NULL,
	[idempleado] [int] NULL,
	[mes] [int] NULL,
	[fechaInicio] [date] NULL,
	[fechaFin] [date] NULL,
 CONSTRAINT [PK_liquidacion] PRIMARY KEY CLUSTERED 
(
	[idliquidacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO














TRUNCATE TABLE DATOS;


INSERT INTO DATOS  VALUES('10015','JUAN','LA GASCA','202530',2801,01,'SUELDO',500,02,'COMISIONES',100,03,'BONO',50 ,'2018-01-01','2018-01-31');
INSERT INTO DATOS  VALUES('10030','PEDRO','AMERICA','2020',2802,01,'SUELDO',600,04,'TRANSPORTE',30,0,' ',0 ,'','');
INSERT INTO DATOS  VALUES('17200','LUIS','AMERICA','2322',2802,01,'SUELDO',650,03,'BONO',100,05,'HORAS EXTRAS',30 ,'2018-02-01','2018-02-15');





SELECT * FROM datos;

truncate table EMPLEADOS;
truncate table CONCEPTO;
truncate table liquidacion;
	declare llenarTablas cursor for
	SELECT 
	ci 
      , nombre 
      , dirrecion 
      , telef 
      , mes 
      , codConep_1 
      , nombreConepto1 
      , valores 
      , codConep_2 
      , nombreConepto2 
      , valores2 
      , codConep_3 
      , nombreConepto3 
      , valores3 
      , fechaInicio 
      , fechaFin 
	from datos;
	open llenarTablas
	declare 
       @ci   char (15)  ,
       @nombre   char (30)  ,
       @dirrecion   char (30)  ,
       @telef   char (10)  ,
       @mes   int   ,
       @codConep_1   int   ,
       @nombreConepto1   char (30)  ,
       @valores   decimal (18, 2)  ,
       @codConep_2   int   ,
       @nombreConepto2   char (30)  ,
       @valores2   decimal (18, 2)  ,
       @codConep_3   int   ,
       @nombreConepto3   char (30)  ,
       @valores3   decimal (18, 2)  ,
       @fechaInicio   date   ,
       @fechaFin   date   
		/*jorge.e.gordillo@gmail.com*/
	fetch next from llenarTablas into 
	   @ci ,
       @nombre,
       @dirrecion ,
       @telef ,
       @mes,
       @codConep_1 ,
       @nombreConepto1 ,
       @valores,
       @codConep_2 ,
       @nombreConepto2 ,
       @valores2,
       @codConep_3 ,
       @nombreConepto3 ,
       @valores3  ,
       @fechaInicio,
       @fechaFin
	while (@@fetch_status = 0 )
	begin
	--- Empleados
	 INSERT INTO empleados values (@ci, @nombre, @dirrecion, @telef);
	 --- Conceptos
	 IF (@codConep_1 = 0)
	 PRINT  '--- CONCEPETO 1  NO VALIDO---';
	 ELSE
	 BEGIN 
	 INSERT INTO concepto values (@codConep_1, @nombreConepto1, @valores);
	 END ;
	 IF (@codConep_2 = 0)
	 PRINT  '--- CONCEPETO 2  NO VALIDO---';
	 ELSE
	 BEGIN 
	 INSERT INTO concepto values (@codConep_2, @nombreConepto2, @valores2);
	 END ;
	 IF (@codConep_3 = 0)
	 PRINT  '--- CONCEPETO 2  NO VALIDO---';
	 ELSE
	 BEGIN 
	 INSERT INTO concepto values (@codConep_3, @nombreConepto3, @valores3);
	 END ;

	fetch next from  llenarTablas into  
	 @ci ,
       @nombre,
       @dirrecion ,
       @telef ,
       @mes,
       @codConep_1 ,
       @nombreConepto1 ,
       @valores,
       @codConep_2 ,
       @nombreConepto2 ,
       @valores2,
       @codConep_3 ,
       @nombreConepto3 ,
       @valores3  ,
       @fechaInicio,
       @fechaFin
	end;
	close llenarTablas;
	deallocate llenarTablas;


	declare llenarLiquidacion cursor for
	select 
      c.idconcepto,
      e.idempleado,
      d.mes,
      d.fechainicio,
      d.fechafin
	from concepto c
	INNER join datos d 
	ON 
	c.cod=d.codConep_1  AND
	c.nombre = d.nombreConepto1  AND 
	c.valor= d.valores
	INNER JOIN empleados e
	ON d.ci = e.ci
	union all
	select 
      c.idconcepto,
      e.idempleado,
      d.mes,
      d.fechainicio,
      d.fechafin
	from concepto c
	INNER join datos d 
	ON 
	c.cod=d.codConep_2  AND
	c.nombre = d.nombreConepto2  AND 
	c.valor= d.valores2
	INNER JOIN empleados e
	ON d.ci = e.ci
	union all
	select 
	c.idconcepto,
	e.idempleado,
      d.mes,
	d.fechainicio,
	d.fechafin
	from concepto c
	INNER join datos d 
	ON 
	c.cod=d.codConep_3  AND
	c.nombre = d.nombreConepto3  AND 
	c.valor= d.valores3
	INNER JOIN empleados e
	ON d.ci = e.ci
	open llenarLiquidacion
	declare
	@idconcepto   int  , 
	@idempleado  int  , 
	@mes_l   int  , 
	@fechaInicio_l   date   ,
	@fechaFin_l   date 
   fetch next from llenarLiquidacion into 
   	@idconcepto , 
	@idempleado, 
	@mes_l , 
	@fechaInicio_l,
	@fechaFin_l  
	while (@@fetch_status = 0 )
	begin
	insert into liquidacion
	values
	(
	@idconcepto , 
	@idempleado, 
	@mes_l , 
	@fechaInicio_l,
	@fechaFin_l  
	);
	fetch next from  llenarLiquidacion into  
   	@idconcepto , 
	@idempleado, 
	@mes_l , 
	@fechaInicio_l,
	@fechaFin_l 
	end;
	close llenarLiquidacion;
	deallocate llenarLiquidacion;
SELECT * FROM EMPLEADOS;
SELECT * FROM CONCEPTO;
SELECT * FROM LIQUIDACION;

SELECT * FROM LIQUIDACION L
INNER JOIN CONCEPTO C ON L.IDCONCEPTO = C.IDCONCEPTO 
INNER JOIN EMPLEADOS E ON L.IDEMPLEADO = E.IDEMPLEADO; 
;
