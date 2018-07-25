-- CREACION TABLA
create table datos_ventas (
	sec 		int primary key not null,
	ci 		VARCHAR2(15),
	nombre 		VARCHAR2(30),
	direccion 	VARCHAR2(30),

	codP1 		VARCHAR2(10),
	nombprod1 	varchar(300),
	cant1 		int,
	pu1 		numeric,
	imp1 		numeric,

	codp2 		varchar(5),
	nomp2 		varchar(300),
	cant2 		int,
	pu2 		numeric,
	imp2 		numeric,
	fecha 		date,
	estado 		int
);

create table cliente (
	sec 		int primary key not null,
	ci 		VARCHAR2(15),
	nombre 		VARCHAR2(30),
	direccion 	VARCHAR2(30)
);

create table producto (
	codP1 		VARCHAR2(10) primary key not null,
	nombprod 	varchar(300),
	pu 		numeric,
	imp 		numeric
);

create table cab_fact (
seccf int primary key not null,
	sec 		int,
	fecha 		date
);

alter table cab_fact
  add constraint fk1
  foreign key (sec)
  references cliente (sec);

create table det_fact (
  	secdf 	int primary key not null,
  	seccf 	int,
  	cant 	int,
  	codP1 	VARCHAR2(10)
);
  
alter table det_fact
  add constraint fk3
  foreign key (seccf)
  references cab_fact (seccf);

alter table det_fact
  add constraint fk2
  foreign key (codP1)
  references producto (codP1);

create or replace
procedure pasarDatos
is
begin
      DECLARE
          CURSOR cursor1
          IS
            select sec, ci, nombre, direccion, fecha, codP1, nombprod1, cant1, pu1, imp1, codp2, nomp2, cant2, pu2, imp2, estado
            from datos_ventas;
      -- asiganamos variables
            registro cursor1%ROWTYPE;
            sec1 int not null := 1;
            seccf1 int not null := 1;
            secdf1 int not null := 1;
      BEGIN 
          OPEN cursor1;
       -- bucle para recorrer todo el cursor     
          LOOP
       -- se asegura que este dentro de los registros 
          FETCH cursor1 into registro;
       -- manera de salir : mientras no hayan registros se acaba bucle   
          EXIT WHEN cursor1%NOTFOUND;
          insert into cliente values(registro.sec, registro.ci, registro.nombre, registro.direccion);
          insert into producto values(registro.codP1, registro.nombprod1, registro.pu1, registro.imp1);
          insert into producto values(registro.codP2, registro.nomp2,  registro.pu2, registro.imp2);
          insert into cab_fact values(seccf1, registro.sec, registro.fecha);
          insert into det_fact values(secdf1, seccf1, registro.cant1, registro.codP1);
          insert into det_fact values(secdf1+1, seccf1, registro.cant2, registro.codp2);
          seccf1 := seccf1 + 1;
          secdf1 := secdf1 + 2;
          END LOOP;
          CLOSE cursor1;
      END;
end;

insert into datos_ventas values (1,'123','david','cotocollao', 'p1', 'prod1', 10, 20, 0.5, 'p2', 'prod2', 30, 40, 0.3, '04/08/2015', 0);
insert into datos_ventas values (2,'456','bryan','carapungo', 'p3', 'prod3', 50, 60, 0.7, 'p4', 'prod4', 70, 89, 0.5, '04/08/2015', 0);

select * from datos_ventas;

begin
pasarDatos;
end;

select * from cliente;
select * from producto;
select * from cab_fact;
select * from det_fact;