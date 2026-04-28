USE `profesores`;

select * from asignaturas;
select * from coordinadores;
select * from imparte;
select * from prepara;
select * from profesores;

-- 1. Muestra los datos de la asignatura y el dni del profe que la imparte
-- Aquí seleccionamos el dni del profesor y la descripción de la asignatura. 
-- Para ello hacemos un JOIN entre asignaturas (a) e imparte (i), 
-- relacionando a.codigo con i.asignatura.
select i.dni, a.descripcion from asignaturas a join imparte i on a.codigo=i.asignatura;

-- 2. Muestra los datos de los profes que imparten alguna asignatura
-- Aquí seleccionamos todas las columnas de profesores (p) y de imparte (i). 
-- Para ello hacemos un JOIN entre ambas tablas usando el dni como clave común.
select * from profesores p join imparte i on p.dni=i.dni;

select * from profesores, asignaturas;
select * from profesores cross join imparte;

-- 3. Suma de créditos que imparte cada profesor según su DNI
-- Aquí calculamos la suma total de créditos que imparte cada profesor.
-- Unimos asignaturas (a) con imparte (i) usando el código de la asignatura.
-- Agrupamos por dni para obtener la suma por profesor.
select i.dni, sum(a.creditos) as total_creditos from asignaturas a join imparte i on a.codigo = i.asignatura group by i.dni;

-- 4. Mostrar el nombre de los profesores y cuántas asignaturas imparte cada uno
-- Aquí mostramos el nombre del profesor y cuántas asignaturas imparte.
-- Unimos profesores (p) con imparte (i) usando el dni.
-- Contamos cuántas asignaturas tiene cada profesor.
select p.nombre, count(i.asignatura) as num_asignaturas from profesores p join imparte i on p.dni = i.dni group by p.nombre;

-- 5. Mostrar el nombre del profesor y la descripción de la asignatura que imparte
-- Aquí mostramos el nombre del profesor y la descripción de cada asignatura que imparte.
-- Unimos profesores (p), imparte (i) y asignaturas (a) mediante el dni y el código de asignatura.
select p.nombre, a.descripcion from profesores p join imparte i on p.dni = i.dni join asignaturas a on a.codigo = i.asignatura;

<<<<<<< HEAD
-- DNI y nombre del coordinador y el nombre de la asignatura que coordina
-- Unir la de coordinadores y asignaturas
select dni, nombre, descripcion from coordinadores c join asignaturas a on (c.asig=a.codigo);
=======


-- Joins varios:
select *
from profesores p
inner join imparte i on p.dni = i.dni;

select *
from profesores p
left join imparte i on p.dni = i.dni;

select *
from profesores p
right join imparte i on p.dni = i.dni;

select *
from profesores
cross join asignaturas;

on p.dni = i.dni

from profesores p
join imparte i
>>>>>>> 523873917a11f64e6f12a8f4caa2a838aedf8781
