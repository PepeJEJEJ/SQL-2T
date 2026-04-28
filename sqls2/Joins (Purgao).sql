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

-- DNI y nombre del coordinador y el nombre de la asignatura que coordina
-- Unir la de coordinadores y asignaturas
select dni, nombre, descripcion from coordinadores c join asignaturas a on (c.asig=a.codigo);

-- Dni del profe y suma de los creditos que prepara
-- aca lo que hacemos es seleccionar
select dni, sum(a.creditos) from prepara p join asignaturas a on p.asignatura = a.codigo group by p.dni;

-- Left y rigth join
select * from profesores p left join imparte i on (p.dni=i.dni);
select * from profesores p right join imparte i on (p.dni=i.dni);

-- PURGADO:
-- INNER JOIN: solo profesores que imparten alguna asignatura
SELECT *
FROM profesores p
INNER JOIN imparte i 
    ON p.dni = i.dni;

-- LEFT JOIN: todos los profesores, impartan o no
SELECT *
FROM profesores p
LEFT JOIN imparte i 
    ON p.dni = i.dni;

-- RIGHT JOIN: todas las filas de imparte, aunque el profesor no exista
SELECT *
FROM profesores p
RIGHT JOIN imparte i 
    ON p.dni = i.dni;

-- CROSS JOIN: producto cartesiano (todas las combinaciones)
SELECT *
FROM profesores
CROSS JOIN asignaturas;

-- JOIN normal (equivalente a INNER JOIN)
SELECT *
FROM profesores p
JOIN imparte i
    ON p.dni = i.dni;
    
select dni, sum(creditos) from asignaturas a join imparte i on i.asignatura = a.codigo group by dni;

select * from profesores p left join imparte i on (p.dni=i.dni);
select * from imparte i right join profesores p on (p.dni=i.dni);

select * from prepara pr join profesores p on (pr.dni=p.dni);

/* NO SALE INTERSECT
SELECT id_producto FROM almacen1
INTERSECT
SELECT id_producto FROM almacen2;
MINUS / EXCEPT
SELECT id_producto FROM almacen1
MINUS
SELECT id_producto FROM almacen2;*/

-- subconsultas
select * from asignaturas where creditos > (select creditos from asignaturas where codigo = "PC");

select * from asignaturas;
-- Mostrar la descripción de las asignaturas que tengan el mayor número de créditos
select descripcion from asignaturas where creditos = (select max(creditos)from asignaturas);
-- MAX devuelve el valor MAXIMO de una columna de numeros

-- tambien se puede hacer asi:
select descripcion from asignaturas where creditos >= ALL (select creditos from asignaturas);

-- y asi tambien:
select * from asignaturas where creditos > any (select creditos from asignaturas);
