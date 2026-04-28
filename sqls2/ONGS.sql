Drop Database if exists ONGS;
Create Database ONGS;
Use ONGS;

create table asociacion (
	CIF char (9) Primary Key,
    denominacion varchar (20) not null,
    direccion varchar (50),
    provincia varchar (15),
	tipo enum ("Ecologista", "Integración", "Desarrollo"),
	utilidadpublica enum ("SI", "No")
);

create table socio (
	DNI char (9) Primary Key,
    nombre varchar (30),
    direccion varchar (50),
    provincia varchar (15),
    fecha_alta date not null,
	cuota_mensual decimal (7,5) not null,
	aportacion_anual decimal (7,5),
	CIF varchar(20),
    constraint fk_socio_asociacion
	foreign key (CIF) references asociacion(CIF)
	on delete set null
	on update cascade
);
-- Char=Fijo
-- Varchar=variable
create table trabajador (
	DNI varchar (9) Primary Key,
    nombre varchar (30) not null,
    fingreso date,
	tipo enum ("Asalariado", "Voluntario"),
    irpf int check (irpf >= 0 & irpf <= 100),
	pagos decimal check (pagos <= 0),
	profesion varchar (30),
	horas int(3) check (horas >= 0 & horas <= 300),
	edad int(3) check (edad >= 0 & edad <= 100)
);
-- Check=COMPRUEBA UN REQUISITO 
create table proyecto (
	id int Primary Key auto_increment,
    pais varchar (20),
    zona varchar (30),
    objetivo varchar (100)
);

create table trabaja (
    DNI char(9),
    id_proyecto int,
	primary key (DNI, id_proyecto),
	foreign key (DNI) references trabajador(DNI)
	on delete set null,
    foreign key (id_proyecto) references proyecto(id)
	on delete set null
   	on update cascade
);