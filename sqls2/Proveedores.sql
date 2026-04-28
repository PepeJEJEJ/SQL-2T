Drop Database if exists proveedores;
Create Database proveedores;
use proveedores;

create table Proveedor (
	codigo int Primary Key auto_increment,
    ciudad varchar (150),
    provincia varchar (20),
    direccion varchar (20)
);

create table Categoria (
	codigo int Primary Key auto_increment,
    nombre varchar (100) not Null
);

create table Pieza (
	codigo int Primary Key auto_increment,
    nombre varchar (100) not Null,
    color varchar (100),
    precio decimal(3,2),
    categoria int,
    foreign key (Categoria) references Categoria (codigo) -- La Foreign key
);

create table Proveedor_Suministra_Pieza (
	id_proveedor int,
    id_pieza int,
    cantidad int not null,
    fecha date not null,
    primary key (id_proveedor, id_pieza, fecha),
    foreign key (id_proveedor) references Proveedor (codigo),
	foreign key (id_pieza) references Pieza (codigo)
);

/*Proveedor(codigo_proveedor PK, ciudad, provincia, direccion)
Pieza(codigo_pieza PK, nombre, color, precio)
Categoria(codigo_categoria PK, nombre)
Proveedor_Suministra_Pieza(codigo_proveedor FK, codigo_pieza FK, cantidad, fecha)
Pieza_Pertenece_Categoria(codigo_pieza FK, codigo_categoria FK)*/