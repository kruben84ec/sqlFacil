create table facturas
  (
    ci        number,
    nombre    varchar2(20),
    direccion varchar2(20),
    fecha date,
    cd_producto1     varchar2(20),
    nombre_producto1 varchar2(20),
    precio1          number,
    cantidad1        number,
    cd_producto2     varchar2(20),
    nombre_producto2 varchar2(20),
    precio2          number,
    cantidad2        number
  );
--tablas a usar
drop table facturas

CREATE TABLE cliente
  (
    "ci"        VARCHAR2(10),
    "nombre"    VARCHAR2(50),
    "direccion" varchar2(50),
    primary key("ci")
  );
CREATE TABLE producto
  (
    "cod_producto" VARCHAR2(50),
    "nombre"       VARCHAR2(50),
    "precio"       number,
    primary key ("cod_producto")
  );


CREATE TABLE factura
  (
    "num_factura" number,
    "ci"          VARCHAR2(10),
    "fecha" date,
    primary key ("num_factura"),
    foreign key("ci") references cliente("ci")
  );
CREATE TABLE detalle
  (
    "num_detalle"  number,
    "num_factura"  number,
    "cod_producto" VARCHAR2(50),
    "cantidad"     int,
    primary key("num_detalle")
  );
  
  drop table detalle
--ingreso de datos
INSERT
INTO facturas VALUES
  (
    '100',
    'A',
    'D1',
    '01/01/2016',
    'P1',
    'PROD1',
    '10',
    '1',
    'P2',
    'PROD2',
    '15',
    '3'
  );
INSERT
INTO facturas VALUES
  (
    '200',
    'B',
    'D2',
    '10/01/2016',
    'P2',
    'PROD2',
    '15',
    '1',
    'P3',
    'PROD3',
    '20',
    '2'
  );
INSERT
INTO facturas VALUES
  (
    '300',
    'C',
    'D3',
    '15/01/2016',
    'P1',
    'PROD1',
    '10',
    '3',
    null,
    null,
    null,
    null
  );
INSERT
INTO facturas VALUES
  (
    '100',
    'A',
    'D1',
    '20/01/2016',
    'P3',
    'PROD3',
    '20',
    '5',
    'P1',
    'PROD1',
    '10',
    '4'
  );
---creacion de cursores
--para la tabla de cliente
DECLARE
  CURSOR cursor_cliente
  IS
    SELECT distinct ci,nombre,direccion FROM facturas;
  
  salida_cliente cursor_cliente%rowtype;
BEGIN
  OPEN cursor_cliente;
  FETCH cursor_cliente INTO salida_cliente;
  
  while cursor_cliente%found
  loop
    insert
    into cliente values
      (
        salida_cliente.ci,
        salida_cliente.nombre,
        salida_cliente.direccion
      );
    fetch cursor_cliente INTO salida_cliente;
  end loop;
  CLOSE cursor_cliente;
END;
select * from facturas;
select * from cliente;
--para la tabla de producto
DECLARE
  CURSOR cursor_producto
  IS
    SELECT DISTINCT cd_producto1,
      nombre_producto1,
      precio1
    FROM facturas
    order by cd_producto1;
  
  salida_producto cursor_producto%rowtype;
BEGIN
  OPEN cursor_producto ;
  FETCH cursor_producto INTO salida_producto;
  
  while cursor_producto%found
  loop
    insert
    into producto values
      (
        salida_producto.cd_producto1,
        salida_producto.nombre_producto1,
        salida_producto.precio1
      );
    FETCH cursor_producto INTO salida_producto;
  end loop;
  close cursor_producto;
END;
select * from producto;
---vamos con la tabla de factura


CREATE SEQUENCE secuencia_factura START WITH 1 INCREMENT BY 1 ;
drop sequence secuencia_factura

delete from factura
  DELETE FROM detalle
  
  declare
  cursor cursor_detalle1
  is
    select rownum as id_factura, cd_producto1, cantidad1 from facturas
  
  union
  
  select rownum as id_factura, cd_producto2,cantidad2 from facturas;
  
  salida_detalle cursor_detalle1%rowtype;
  temporal INTEGER:=1;
begin
  open cursor_detalle1;
  fetch cursor_detalle1 into salida_detalle;
  
  while cursor_detalle1%found
  loop
  
  IF salida_detalle.cd_producto1 IS NOT NULL THEN
      insert
      into detalle values
        (
          temporal,
          salida_detalle.id_factura,
          salida_detalle.cd_producto1,
          salida_detalle.cantidad1
        );
        temporal:= temporal+1;
  END IF;
    
      FETCH cursor_detalle1 INTO salida_detalle;
--    delete from detalle where "cantidad" IS null ;
  end loop;
  close cursor_detalle1;
  
end;
  /
  --ahora para detalle vamos a unir los productos con el detalle factura  y ahi poder insertarlos en la tabla se tratara de ver si se puede hacer la secuencia ciclica es decir que llegue a un valor y de ahi me ingrese si no que dios no ayude 
  
select * from detalle
select * from facturas
DELETE FROM DETALLE