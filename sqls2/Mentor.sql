Drop Database if exists Mentor;
Create Database Mentor;
use Mentor;

create table ALUMNO (
    codigo int Primary Key auto_increment,
    Nombre varchar(100),
    Email varchar(100) unique,
    Dirección varchar(50),
    Tfno int,
    Español varchar(50)
);

create table AULA (
    codigo int Primary Key auto_increment,
    Nombre varchar(100),
    Dirección varchar(50)
);

create table ADMIN_AULA (
    DNI int Primary Key auto_increment,
    Nombre varchar(100),
    Email varchar(100),
    Dirección varchar(50)
);

create table TUTOR (
    DNI int Primary Key auto_increment,
    Nombre varchar(100),
    Email varchar(100)
);

create table CURSO (
    nombre varchar(100) primary key,
    url varchar(100),
    libro varchar(100)
);

create table LIBRO (
    nombre varchar(100) primary key
);

create table ALUMNO_PERTENECE_AULA (
    Codigo int,
    Email varchar(100),
    foreign key (Codigo) references AULA(codigo),
    foreign key (Email) references ALUMNO(Email)
);

create table ADMIN_AULA_ADMINISTRA_AULA (
    codigo int,
    DNI int,
    foreign key (codigo) references AULA(codigo),
    foreign key (DNI) references ADMIN_AULA(DNI)
);

create table MATRICULA (
    Email varchar(100),
    nombre varchar(100),
    f_ini date,
    f_fin date,
    foreign key (Email) references ALUMNO(Email),
    foreign key (nombre) references CURSO(nombre)
);

create table COORDINA (
    DNI int,
    nombre varchar(100),
    foreign key (DNI) references TUTOR(DNI),
    foreign key (nombre) references CURSO(nombre)
);

create table TUTORIZA (
    DNI int,
    nombre varchar(100),
    foreign key (DNI) references TUTOR(DNI),
    foreign key (nombre) references CURSO(nombre)
);