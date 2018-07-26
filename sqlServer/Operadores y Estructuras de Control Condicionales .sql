use DBRESERVA
---------------------------------------------
-- OPERADORES EN TRANSACT SQL 
---------------------------------------------
 /* OPERADOR DE ASIGNACIÓN (=) */
/*Ejemplo 1:  Definición de un valor para una variable.
Cálculo del área de un Círculo, almacenando el valor del radio
y de PI en sus variables respectivas.
*/
declare @pi float, @radio float, @area float
--Asignar valores
set @pi = 3.1415
set @radio = 7
--Encontrar el área del Círculo
set @area = @pi * Power(@radio,2)
select @area as 'Área'
go

/*Ejemplo 2: Establecer una relación entre un encabezado de una columna y una
 expresión que define valores para esa columna.

Capturar en una variable el correo electrónico del pasajero con código
 "P0000005", usando variables Transact-SQL y sentencia Select para mostrar el email.
*/

select * from pasajero;

declare @correo varchar(70)
select @correo = email from pasajero
where idpasajero='P0000005'
-- Mostramos el correo obtenido
select 'P0000005' as 'Código Pasajero',
	   @correo as 'Email'
go


/* OPERADORES ARITMÉTICOS (+, - , *, /, %) 
*/

/*Ejemplo 1: Operación con parentesis anidados.
Muestra el resultado de la expresión (2 * (4 + (5 - 3) ))/5,
utilizando la sentencia SELECT.
*/

DECLARE @MyNumber int;  
SET @MyNumber = (2 * (4 + (5 - 3) ))/5;  
Select '2 *(4 + (5 - 3) )/5' as 'Operación',
		@MyNumber as 'Resultado' ;  

/*Ejemplo 2: Operador de suma para sumar días a valores de fecha y hora.
En este ejemplo se suma un número de días a una fecha "datetime".
*/

DECLARE @startdate datetime, @adddays int;  
SET @startdate = 'May 10, 2017 8:00 AM';  
SET @adddays = 5;  
SELECT @startdate + 1.5 AS 'Start Date + 1.5 days',   
   @startdate + @adddays AS 'Start Date + ValueVariable'; 

/*Ejemplo 3: Operador módulo.
Mostrar todos los paises cuyo codigo sea par.
*/

Select * from PAIS

select * from pais WHERE idpais % 2 = 0

/* OPERADORES LÓGICOS 
(ALL, AND, ANY, BETWEEN, EXISTS, IN, LIKE, NOT,  OR, SOME)
OPERADORES DE COMPARACIÓN
( =, >, <, >= , <= , <> , != , !< , !> )
*/

/*Ejemplo 1: Operador AND  y Operador  , = ,>=, <=
Mostrar los pagos que sean del año 2014, su monto este entre 200 y 700 dolares.
*/

select * from PAGO;

select * from pago
where year(fecha) = '2014'
and monto >= 200 and monto <= 700 

go

/*Ejemplo 2: Operador NOT, BETWEEN
 Mostrar los pasajeros cuya letra inicial de su apellido paterno 
 No se encuentre entre A y C.
*/
select * from PASAJERO;

select apaterno, amaterno, nombre,num_documento from pasajero
where not left(apaterno,1) between 'A' and 'C'
order by apaterno asc, amaterno asc, nombre asc
go

/*Ejemplo 3: Operador EXIT
 Verificar si un determinado país fue  registrado o no  en su tabla origen.
*/

select * from pais;

declare @pais varchar(40)
set @pais='Ecuador' 
if exists(select idpais from pais where nombre=@pais)
     print 'País ya se encuentra registrado'
else
     print 'País no se encuentra registrado'
go

/* OPERADORES LÓGICO LIKE
OPERADORES DE CADENA:
Operadores de cadena de caracteres comodín
(%, _ , [ ], [^])
*/

/*Ejemplo 1: Operador LIKE  con comodín %  
1.1. Mostrar los pasajeros cuyo nombre inicie con la letra A.
% indica que después de A puede ir cualquier cadena de caracteres.
*/
select * from pasajero
where nombre like 'A%'
go
/*
1.2. Mostrar los pasajeros que tienen una cuenta de correo GMAIL
% se utiliza como post y prefijo, lo que indique que puede haber 
cualquier cadena de caractres antes y después de la cadena 'gmail'
*/
select * from pasajero
where email like '%gmail%'
go

/*Ejemplo 2: Operador LIKE  con comodín _ , [ ] , % 
Mostrar los pasajeros cuyo segundo carácter de su nombre sea la letra A, O ó U.
_ indica que un caracter puede ser cualquiera este caso el primer caracter de la
cadena, con [AOU] especifica que cualquiera de los caracteres dentro de los 
corchetes puede ser el segundo caracter de la cadena y con % se especifica que puede 
ir cualquier cadena después.
*/
select * from pasajero
where nombre like '_[AOU]%'
go

/*Ejemplo 3: Operador LIKE  con comodín _ , [^ ] , % 
Mostrar los pasajeros cuyo segundo carácter de su nombre no sea la letra A, O ó U.
con [^AOU] especifica que el segundo caracter no puede ser ningún caracter de los
que está dentro de los corchetes.
*/

select * from pasajero
where nombre like '_[^AOU]%'
go

/* OPERADORES DE CADENA:
Operadores de concatenación de cadenas
(+, +=)
*/

/*Ejemplo 1: Combinar los tipos de datos varchar y date con el operador +
Mostrar un mensaje con la fecha de nacimiento, nombre y apellido del pasajero.
Nota: Sólo se puede concatenar cadenas del mismo tipo.
*/

select * from PASAJERO

SELECT ('Fecha de nacimiento del pasajero ' + nombre + SPACE(1) + apaterno +  SPACE(1)+
		 CONVERT(varchar(12), fecha_nacimiento, 101)  ) 'Fecha Nacimiento del Pasajero'
FROM PASAJERO  
GO  

/*Ejemplo 2: += Asignación de concatenación de cadenas
Asiganar a la primera letra del nombre el apellido paterno del pasajero P0000005
Nota: El operador += no se puede utilizar sin una variable. 
*/
select * from PASAJERO;

DECLARE @v1 varchar(40)  
select  @v1 = left(nombre,1) from PASAJERO
where idpasajero='P0000005' 
select @v1 +=  apaterno from PASAJERO
where idpasajero='P0000005'
PRINT @v1 ; 

/* OPERADORES COMPUESTOS 
( += , -= , *= , /= , %= , &= , ^= , |= )
Ejemplos:
 */ 

DECLARE @x1 int = 27;  
SET @x1 += 2 ;  
SELECT @x1 AS Added_2;  

DECLARE @x2 int = 27;  
SET @x2 -= 2 ;  
SELECT @x2 AS Subtracted_2;

DECLARE @x3 int = 27;  
SET @x3 *= 2 ;  
SELECT @x3 AS Multiplied_by_2;

DECLARE @x4 int = 27;  
SET @x4 /= 2 ;  
SELECT @x4 AS Divided_by_2;

DECLARE @x5 int = 27;  
SET @x5 %= 2 ;  
SELECT @x5 AS Modulo_of_27_divided_by_2;  

DECLARE @x6 int = 9;  
SET @x6 &= 13 ;  
SELECT @x6 AS Bitwise_AND;  

DECLARE @x7 int = 27;  
SET @x7 ^= 2 ;  
SELECT @x7 AS Bitwise_Exclusive_OR;

DECLARE @x8 int = 27;  
SET @x8 |= 2 ;  
SELECT @x8 AS Bitwise_OR;

/* OPERADOR DE RESOLUCIÓN DE ÁMBITO ::
Se muestra cómo usar el operador de resolución de ámbito para 
obtener acceso al miembro GetRoot() del tipo hierarchyid.
 */ 
 DECLARE @hid hierarchyid;  
SELECT @hid = hierarchyid::GetRoot();  
PRINT @hid.ToString();  


/* OPERADORES UNARIOS
( + , -, ~ )
 */ 
 

/*Ejemplo 1: Usar el operador de suma unaria con un valor negativo.
Se muestra el uso de la suma unaria con una expresión negativa 
y la función ABS() en la misma expresión negativa. 
Nota: La suma unaria no afecta a la expresión, pero la función ABS 
devuelve el valor positivo de la expresión.
*/
DECLARE @Num1 int;  
SET @Num1 = -6;  
SELECT + @Num1 AS 'SumaUnaria', ABS(@Num1) 'ValorAbsoluto';  
GO 

/*Ejemplo 2: Cambiar una variable a un valor negativo.
*/
DECLARE @Num1 int;  
SET @Num1 = 5;  
SELECT @Num1 AS VariableValue, -@Num1 AS NegativeValue;  
GO  

/*Ejemplo 3: La consulta siguiente realiza la operación NOT bit a bit en las columnas
idpago e idreserva de la tabla pago.
El operador ~ (NOT bit a bit) solo se puede utilizar en expresiones de cualquiera de 
los tipos de datos de la categoría del tipo de datos entero.
Devuelve los bits complementarios del número.
*/

SELECT idpago, idreserva  FROM PAGO
SELECT ~ idpago, ~ idreserva  
FROM pago;  
go

------------------------------------------------------
--- ESTRUCTURA DE CONTROL (CONDICIONAL)
-----------------------------------------------------
/*
IF ELSE en TRANSACT-SQL
*/

select * from pais
/*Ejemplo 1:
Implementar un Script que permita insertar un nuevo registro en la tabla país,
en caso se registre duplicidad en el nombre de un país mostrar un mensaje de
 “país ya registrado”, caso contrario insertar dicho registro y  mostrar 
 un mensaje de “País registrado Correctamente”.
*/
declare @idpais char(4)='0012',
@nombre varchar(30)='Colombia'

if exists(select * from pais where nombre=@nombre)
begin
      print 'País ya Registrado'
end
else
begin
      insert into pais
      values (@idpais,@nombre)
      print 'País Registrado Correctamente'
      end
go
select * from pais

/*Ejemplo 2:
Implementar un Script que permita Mostrar el mensaje de No hay Pasajeros en este país,
solo cuando el total de pasajeros asignados a un determinado País no tenga registros en la tabla pasajero.
Caso contrarios determinar cuántos pasajeros tiene dicho país.*/

declare @nombre char(40)='Bolivia'

if (select count(*) from pasajero pas
      left join pais pai on pas.idpais=pai.idpais
      group by pai.nombre
      having pai.nombre=@nombre) is null
begin
      print 'No hay Pasajeros en este País'
end
else
begin
      declare @total int
      select @total=count(*)
      from pasajero pas left join pais pai
      on pas.idpais=pai.idpais
      group by pai.nombre
      having pai.nombre=@nombre

      print 'El País ' + @nombre + 'Tiene '  +
      cast(@total as char(2)) + ' Pasajero'
end
go

/*
CASE en TRANSACT-SQL
*/

/*Ejemplo 1:
Implementar un Script que permita mostrar la fecha en texto registrada en la tabla RESERVA.
 2014-10-01 = 01 Octubre 2014
*/

select *,
cast(day(fecha) as char(2)) +
case month(fecha)
     when 1 then ' Enero '
     when 2 then ' Febrero '
     when 3 then ' Marzo '
     when 4 then ' Abril '
     when 5 then ' Mayo '
     when 6 then ' Junio '
     when 7 then ' Julio '
     when 8 then ' Agosto '
     when 9 then ' Septiembre '
     when 10 then ' Octubre '
     when 11 then ' Noviembre '
     when 12 then ' Diciembre '
end
+ cast(year(fecha) as char(4)) as [Fecha]
from reserva
go


/*Ejemplo 2:
Implementar un Script que permita mostrar el número total de pasajeros por país
 y el mensaje “NO CUENTA” solo a los países cuyo número de pasajeros sea cero.
*/
select pai.nombre, count(pas.idpasajero)as [Total Pasajeros],
case
     when count(pas.idpasajero)=0 then 'NO CUENTA'
     else ''
     end as [Mensaje]
from pais pai left join pasajero pas
on pai.idpais=pas.idpais
group by pai.nombre
go
