
--Una librería almacena los datos de sus libros en una tabla denominada "libros" y controla las 
--actualizaciones del precio de los libros almacenando en la tabla "control" el nombre del usuario, 
--la fecha, el precio anterior y el nuevo.

--Eliminamos las tablas:

 drop table control;
 drop table libros;
 
--Creamos las tablas con las siguientes estructuras:

 create table libros(
  codigo number(6),
  titulo varchar2(40),
  autor varchar2(30),
  editorial varchar2(20),
  precio number(6,2)
 );

 create table control(
  usuario varchar2(30),
  fecha date,
  codigo number(6),
  precioanterior number(6,2),
  precionuevo number(6,2)
 );

select * from libros;
select *from control;


--Ingresamos algunos registros en "libros":

 insert into libros values(100,'Uno','Richard Bach','Planeta',25);
 insert into libros values(103,'El aleph','Borges','Emece',28);
 insert into libros values(105,'Matematica estas ahi','Paenza','Nuevo siglo',12);
 insert into libros values(120,'Aprenda PHP','Molina Mario','Nuevo siglo',55);
 insert into libros values(145,'Alicia en el pais de las maravillas','Carroll','Planeta',35);


--Creamos un trigger a nivel de fila que se dispara "antes" que se ejecute un "update" sobre el campo "precio" 
--de la tabla "libros". En el cuerpo del disparador se debe ingresar en la tabla "control", 
--el nombre del usuario que realizó la actualización, la fecha, el código del libro que ha sido modificado, 
--el precio anterior y el nuevo:
/*CREATE OR REPLACE
TRIGGER ACTUALIZA_PRECIOS_LIBROS
 BEFORE UPDATE OF PRECIO ON LIBROS 
FOR EACH ROW 
BEGIN
  insert into hr.control values(TO_CHAR(user),TO_DATE(sysdate), :new.codigo, :old.precio, :new.precio);
END;
*/


--Actualizamos el precio del libro con código 100:

 update libros set precio=150 where codigo=100;
 select *from libros;
 
--Veamos lo que se almacenó en "control" al dispararse el trigger:
 select *from control;
 
--Los campos "precioanterior" y "precionuevo" de la tabla "control" almacenaron los valores de ":old.precio" y ":new.precio" 
--respectivamente.

--Actualizamos varios registros:
 update libros set precio=precio+precio*0.1 where editorial='Planeta';
 select *from libros;

 --Veamos lo que se almacenó en "control" al dispararse el trigger:
 select *from control;
--Los campos "precioanterior" y "precionuevo" de la tabla "control" almacenaron los valores de ":old.precio" y ":new.precio" 
--respectivamente de cada registro afectado por la actualización.
--Modificamos la editorial de un libro:

 update libros set editorial='Sudamericana' where editorial='Planeta';

--El trigger no se disparó, pues fue definido para actualizaciones del campo "precio" unicamente.
 select *from control;
 
 
--------------------------------------------------------------------------------------------------------------------------- 
---------------------------------------------------------------------------------------------------------------------------

--Creamos un disparador para múltiples eventos, que se dispare al ejecutar "insert", "update" y "delete" sobre "libros". 
--En el cuerpo del trigger se realiza la siguiente acción: se almacena el nombre del usuario, la fecha y los antiguos y viejos valores de "precio":
/*
CREATE OR REPLACE
TRIGGER TRIG_MULT
 BEFORE INSERT OR DELETE OR UPDATE ON LIBROS 
FOR EACH ROW 
BEGIN
  insert into control values(user,sysdate,:old.codigo,:old.precio,:new.precio);
  
  IF INSERTING THEN
    DBMS_OUTPUT.PUT_LINE (TO_CHAR(USER) || ' ESTA INSERTANDO');
  ELSIF DELETING THEN
    DBMS_OUTPUT.PUT_LINE (TO_CHAR(USER) || ' ESTA BORRANDO');
  ELSIF UPDATING THEN
    DBMS_OUTPUT.PUT_LINE (TO_CHAR(USER) || ' ESTA ACTUALIZANDO');
  END IF;
  
END;
*/

--Ingresamos un registro:

 insert into libros values (150,'El gato con botas','Anonimo','Emece',21);

 --Veamos lo que se almacenó en "control":
 select *from control;

 --Resultado:

--USUARIO		FECHA		CODIGO		PRECIOANTERIOR		PRECIONUEVO
-----------------------------------------------------------------------------------
--SYSTEM		20/03/08						21                     
--La sentencia disparadora fue una inserción, por lo tanto, los campos ":old.codigo" y ":old.precio" contienen "null", así que en "codigo" y en "precioanterior" se almacena "null"; el único campo con valor diferente de "null" es "precionuevo" correspondiente al valor de ":new.precio".

--Actualizamos el campo "precio" de un libro:

 update libros set precio=12 where codigo=103;

 --Veamos lo que se almacenó en "control":
 select *from control;
--Resultado:

--USUARIO		FECHA		CODIGO		PRECIOANTERIOR		PRECIONUEVO
-----------------------------------------------------------------------------------
--SYSTEM		20/03/08	103		28			12

 ---------------------------------------------------------------------------------------------------------------------
 -- VISUALIZAR LOS TRIGGERS
 select * from user_triggers;
 
 
 