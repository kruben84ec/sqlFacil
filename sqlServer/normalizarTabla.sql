create table datos_ventas (
	sec int,
	ci varchar(15),
	nombre varchar(50),
	direccion varchar(50),
	codprod1 varchar(5),
	nombreprod1 varchar(300),
	cantidad1 int,
	precio1 decimal,
	iva1 decimal,
	codprod2 varchar(5),
	nombreprod2 varchar(300),
	cantidad2 int,
	precio2 decimal,
	iva2 decimal
);
go

create table cliente (
	sec2 int,
	sec1 int,
	ci varchar(15),
	nombre varchar(50),
	direccion varchar(50)
);
go

create table producto (
	sec2 int,
	sec1 int,
	codprod1 varchar(5),
	nombreprod1 varchar(300),
	cantidad1 int,
	precio1 decimal,
	iva1 decimal,
);
go


create procedure prueba
as
begin

	set nocount on;
	delete from cliente
	delete from producto

	declare cursor1 cursor for
	select *
	from datos_ventas

	open cursor1

	declare 
		@vsec int,
		@vci varchar(15),
		@vnombre varchar(50),
		@vdireccion varchar(50),
		@vcodprod1 varchar(5),
		@vnombreprod1 varchar(300),
		@vcantidad1 int,
		@vprecio1 decimal,
		@viva1 decimal,
		@vcodprod2 varchar(5),
		@vnombreprod2 varchar(300),
		@vcantidad2 int,
		@vprecio2 decimal,
		@viva2 decimal,
		@cont1 int,
		@cont2 int
		set @cont1 = 1;
		set @cont2 = 1;
	fetch next from cursor1 into @vsec, @vci, @vnombre, @vdireccion, @vcodprod1, @vnombreprod1, @vcantidad1, @vprecio1, @viva1, @vcodprod2, @vnombreprod2, @vcantidad2, @vprecio2, @viva2 
	while (@@fetch_status = 0 )
	begin
		insert into cliente values (@cont1, @vsec, @vci, @vnombre, @vdireccion);
		insert into producto values (@cont2, @vsec, @vcodprod1, @vnombreprod1, @vcantidad1, @vprecio1, @viva1);
		insert into producto values (@cont2+1, @vsec, @vcodprod2, @vnombreprod2, @vcantidad2, @vprecio2, @viva2);
		set @cont1 = @cont1 + 1
		set @cont2 = @cont2 + 2
		/*lectura de la siguiente fila del cursor*/
		fetch next from cursor1 into @vsec, @vci, @vnombre, @vdireccion, @vcodprod1, @vnombreprod1, @vcantidad1, @vprecio1, @viva1, @vcodprod2, @vnombreprod2, @vcantidad2, @vprecio2, @viva2
	end

	close cursor1

	deallocate cursor1

end
go

insert into datos_ventas values (1,'123','david','cotocollao', 'p1', 'prod1', 10, 20, 0.5, 'p2', 'prod2', 30, 40, 0.3);
insert into datos_ventas values (2,'456','bryan','carapungo', 'p3', 'prod3', 50, 60, 0.7, 'p4', 'prod4', 70, 89, 0.5);
go

select * from datos_ventas;

exec prueba

select * from cliente;

select * from producto;