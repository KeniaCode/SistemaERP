﻿CREATE DATABASE SistemaERP;

USE SistemaERP;
Drop table Categoria;
Drop table Cliente;
drop table Producto;
Drop table Vendedor;
Drop table Venta;

create table Cliente (
dpi char(16),
nombre char(40) not null,
apellidos char(40) not null,
nit char(12) not null,
telefono numeric(8) not null,
primary key (dpi)
);

create table Categoria(
id int identity(1,1),
nombre varchar(45) not null
primary key (id)
);

create table Producto(
id int Identity(1,1),
nombre varchar(40) not null,
id_categoria int not null,
precio real not null,
cantidad int not null,
descripcion varchar(200) not null,
primary key(id),
foreign key(id_categoria) references Categoria(id)
);

create table Vendedor
(
dpi char(16),
nombre char(40) not null,
apellidos char(40) not null,
nit char(12) not null,
telefono numeric(8) not null,
email char(40) not null,
direccion char(40) not null,
fechaNac date not null,
fechaAlta date not null,
primary key (dpi)
);


create table Venta 
( 
numeroVenta int identity(1,1),
fechaVenta date not null,
clientedpi char(16) not null,
vendedordpi char(16) not null,
primary key(numeroVenta),
foreign key(clientedpi) references Cliente(dpi) ON DELETE CASCADE, 
foreign key(vendedordpi) references Vendedor(dpi) ON DELETE CASCADE

);


create table Detalle
(
numeroVenta int not null,
idProducto int not null,
cantidad int not null,
foreign key(numeroVenta) references Venta(numeroVenta) on delete cascade,
foreign key(idProducto) references Producto(id) on delete cascade,
primary key(numeroVenta, idProducto)
);

insert into Cliente values('2616501300304','Erick Roberto', 'Tejaxun Xicon', '1211222-4',78331339);
insert into Cliente values('2618221542156','Wilder Emmanuel', 'Siguantay Gonzalez', '585858-4',4546542);

insert into Producto values('Griferia 1/2 Plg', 1 , 39.99,100,'Griferia marca Helbert 1/2 pulgada economico');
