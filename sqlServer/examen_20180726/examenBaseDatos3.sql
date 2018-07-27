use examen;
TRUNCATE TABLE DATOS;


INSERT INTO DATOS  VALUES('10015','JUAN','LA GASCA','202530',2801,01,'SUELDO',500,02,'COMISIONES',100,03,'BONO',50 ,'2018-01-01','2018-01-31');
INSERT INTO DATOS  VALUES('10030','PEDRO','AMERICA','2020',2802,01,'SUELDO',600,04,'TRANSPORTE',30,0,' ',0 ,'','');
INSERT INTO DATOS  VALUES('17200','LUIS','AMERICA','2322',2802,01,'SUELDO',650,03,'BONO',100,05,'HORAS EXTRAS',30 ,'2018-02-01','2018-02-15');





SELECT * FROM datos;

truncate table EMPLEADOS;
truncate table CONCEPTO;

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
	 INSERT INTO concepto values (@codConep_1, @nombreConepto1, @valores);
	 INSERT INTO concepto values ( @codConep_2, @nombreConepto2, @valores2);
	 INSERT INTO concepto values ( @codConep_3, @nombreConepto3, @valores3);
	 --- Liquidaciones
	 INSERT INTO liquidacion values(@ci, @codConep_1, @fechaInicio, @fechaFin);
	 INSERT INTO liquidacion values(@ci, @codConep_2, @fechaInicio, @fechaFin);
	 INSERT INTO liquidacion values(@ci, @codConep_3, @fechaInicio, @fechaFin);
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




SELECT * FROM EMPLEADOS;
SELECT * FROM CONCEPTO;
SELECT * FROM LIQUIDACION;
