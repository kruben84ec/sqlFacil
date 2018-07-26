SELECT * FROM PERSONA;

CREATE TABLE comprasProducto (
idCompras int primary key not null,
codigo varchar2(50),
idPersona int,
nombreProducto varchar2(50),
cantidad int,
precio numeric,
impuesto numeric,
fechaCompra date
);

truncate table comprasProducto;

insert into comprasProducto (codigo, idpersona,nombreProducto,cantidad,precio,impuesto,fechaCompra) values ('codigo',2,'producto1',1,200,212, '04/08/2015');

select * from comprasProducto;

drop sequence idComprasProducto;

CREATE SEQUENCE idComprasProducto
START WITH 1
INCREMENT BY 1;

CREATE TRIGGER comprasProductoTriger
BEFORE INSERT ON comprasProducto
FOR EACH ROW
BEGIN
SELECT idComprasProducto.NEXTVAL INTO :NEW.idcompras FROM DUAL;
END;
