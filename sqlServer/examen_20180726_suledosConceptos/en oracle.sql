-- Creamos la tabla datos de roles de pago.
create table datos(
    primaria int primary key not null,
    ci char (15),
    nombre char (30),
    direccion char (30),
    telefono char (10),
    
    mes int,
    fecha_inicio date,
    fecha_fin date,
    
    cod_con1 int,
    nom_con1 char(30),
    valor_con1 decimal,
    
    
    cod_con2 int,
    nom_con2 char(30),
    valor_con2 decimal,
    
    
    cod_con3 int,
    nom_con3 char(30),
    valor_con3 decimal
    );
    
    
    
    
    
insert into datos values
('1','1234567890','tacuri','cotocollao','2801667','201601','01/01/2016','30/01/2016','1',
'sueldo','400,0','2','bono','200,0','3','comision','50,0');  

insert into datos values
('2','1234569876','cliente1','cotocollao','2801667','201602','01/01/2016','30/01/2016','1',
'sueldo','400,0','2','bono','200,0','3','comision','50,0');  

insert into datos values
('3','12345676532','cliente2','cotocollao','2801667','201603','01/03/2016','30/03/2016','1',
'sueldo','400,0','2','bono','200,0','3','comision','50,0');  

insert into datos values
('4','1234561478','cliente3','cotocollao','2801667','201604','01/04/2016','30/04/2016','1',
'sueldo','400,0','2','bono','200,0','3','comision','50,0');  

insert into datos values
('5','1234562587','cliente4','calderon','2801667','201605','01/05/2016','30/05/2016','1',
'sueldo','400,0','2','bono','200,0','3','comision','50,0');  

insert into datos values
('6','1234566853','cliente5','moran','2801667','201606','01/06/2016','30/06/2016','1',
'sueldo','400,0','2','bono','200,0','3','comision','50,0');  

insert into datos values
('8','1234568562','ecristina','sambiza','2801667','201701','01/01/2017','30/01/2017','1',
'sueldo','400,0','2','bono','200,0','3','comision','50,0');  

insert into datos values
('9','5632567890','silvia','cocha','2801667','201603','01/03/2016','30/03/2016','1',
'sueldo','400,0','2','bono','200,0','3','comision','50,0');  

insert into datos values
('10','8521467890','ramon','carapungo','2801667','201605','01/05/2016','30/05/2016','1',
'sueldo','400,0','2','bono','200,0','3','comision','50,0');  


-- Tabla Empleado
Create table empleado(
    sec int primary key not null,
    ci char (15) ,
    nombre char (30),
    direccion char (30),
    telefono char (10)
    );
    
-- Conceptos de pago.
Create table concepto(
    cod_con int primary key not null,
    nom_con char(30),
    valor_con decimal
    );
    
Create table reporte(
    cod_reporte int primary key not null,
    sec int,
    cod_con int,
    mes int,
    fecha_inicio date,
    fecha_fin date,
    CONSTRAINT CLI_FK1 foreign key(sec) references empleado(sec),
    CONSTRAINT CLI_FK2 foreign key(cod_con) references concepto(cod_con)
   );
   
    
create or replace
procedure pasarDatos
is
begin
DECLARE
CURSOR cursor1
IS

select  ci,nombre,direccion,telefono,mes,fecha_inicio,fecha_fin,cod_con1,nom_con1,valor_con1,cod_con2,nom_con2,valor_con2,cod_con3,nom_con3,valor_con3
            from datos;
            registro cursor1%ROWTYPE;
            secdf int not null := 1;
            sec_concepto int not null := 1;
            sec_reporte int not null := 1;
            sec_empleado int not null := 1;
             ex number;
      BEGIN 
          OPEN cursor1;  
          LOOP
          FETCH cursor1 into registro;
          EXIT WHEN cursor1%NOTFOUND;
          
            insert into empleado values(sec_empleado,registro.ci, registro.nombre, registro.direccion, registro.telefono);
            sec_empleado:=sec_empleado+1;
            insert into concepto values(sec_concepto, registro.nom_con1, registro.valor_con1);
            sec_concepto:=sec_concepto+1;
        if  (registro.cod_con2 is not null)  then
            insert into concepto values(sec_concepto, registro.nom_con2, registro.valor_con2);
            sec_concepto:=sec_concepto+1;
        end if;   
        if  (registro.cod_con3 is not null)  then
            insert into concepto values(sec_concepto, registro.nom_con3, registro.valor_con3);
            sec_concepto:=sec_concepto+1;
        end if;  
          
      END LOOP;
    CLOSE cursor1;
END;
end;

begin
pasarDatos;
end;

select * from DATOS;

insert into datos values
('11','1724585760','Freddy','carapungo','2801667','201605','01/05/2016','30/05/2016','1',
'sueldo','400,0','2','bono','200,0','3','comision','50,0');  

select * from EMPLEADO;
select * from concepto;

truncate table datos;
truncate table EMPLEADO;
truncate table concepto;

select * from reporte;