Drop Database if exists Comercial;
Create Database Comercial;
use Comercial;

create table Clientes (
	DNI int Primary Key,
    Nombre varchar (150),
    Apellidos varchar (20),
    Direccion varchar (20),
	F_Nac date not null
);

create table Producto (
	Codigo int Primary Key,
    Nombre varchar (150),
    precio decimal(3,2)
);

create table Proveedor (
	NIF int Primary Key,
    Nombre varchar (150),
	Direccion varchar (20)
);

create table Clientes_Compra_Producto (
    DNI int,
    Codigo int,
    F_Compra date not null,
    cantidad int not null,
    foreign key (DNI) references Clientes (DNI),
    foreign key (Codigo) references Producto (Codigo)
);

create table Producto_Suministra_Proveedor (
    Codigo int,
    NIF int,
    F_Compra date not null,
    cantidad int not null,
    foreign key (Codigo) references Producto (Codigo),
    foreign key (NIF) references Proveedor (NIF)
);
