use STREAMING_CONSULTAS;

-- Jose A.
-- Todas las plataformas ordenadas por precio (mayor a menor)
select * from plataformas order by precio desc;

-- Jose A.
-- 	Mostrar las suscripc. que su estado sean activas
select * from suscripciones where estado='activa';

-- Jose A.
-- Contar cuantas plataf. tienen un precio superior a 8 (la columna sera platafs. caras) -- NO SE SI ESTO TA BIEN O NO
select id, nombre, url, count(precio) as 'Plataformas Caras', pais from plataformas where precio > 8.00;

-- Jose A.
-- Nombres y emails de usuarios con email acabado en medac.com
select nombre,email from usuarios where email = '%medac.com%';

-- Jose A.
-- ver los generos de series, sin repetir
select distinct genero from series;

-- Jose A.
-- VER LAS SUSCRIPCIONES EMPEZADAS EN ENERO DE CUALQUIER AÑO
select * from suscripciones where month(fecha_inicio)=1;

-- Jose A.
-- CONCATENAR nombre y apellido de usuarios en 1 sola columna en mayusculas llamada usuario
select id, upper(concat(nombre,'-',apellido)) as usuario, email, ciudad, fecha_registro from usuarios;

-- Jose A.
-- MUESTRA LA FECHA DE LANZAMIENTO MAS ANTIGUA DE UNA SERIE
select min(fecha_lanzamiento) from series;

-- Jose A.
-- Series con valoracion entre 8,5 y 9
select * from series where valoracion between 8.5 and 9.0;

-- Jose A.
-- CUANTAS PLATAF. HAY POR PAIS
select pais,count(pais) as n_plat from plataformas group by pais;

-- Jose A.
-- CUANTAS SERIES HAY POR GENERO
select genero, count(genero) as n_genero from series group by genero;

-- Jose A.
-- CUANTAS SUSCRIPCIONES HAY POR CADA TIPO DE PAGO
select tipo_pago, count(tipo_pago) as n_suscripc from suscripciones group by tipo_pago;

-- Jose A.
-- PRECIO TOTAL DE PLATAFORMAS POR PAIS
select pais,sum(precio) as prec_total from plataformas group by pais;

-- Jose A.
-- SUMA TOTAL DE TEMPORADAS POR PLAT.
select p.nombre,sum(s.temporadas) as total_tempor from series s
join plataformas p where p.id=s.id_plataforma group by p.nombre;

-- Jose A.
-- NOMBRE DE CADA SERIE Y NOMBRE PLAT QUE PERTENECEN INCLUSO SERIES Q NO TIENEN PLATAFS
select s.nombre,p.nombre from series s
left join plataformas p on p.id=s.id_plataforma order by s.nombre;

-- Jose A.
-- MUESTRA NOMBRE DE USUARIO Y SUSCRIP QUE TIENEN
select u.nombre, count(s.id_usuario) from usuarios u
join suscripciones s on s.id_usuario=u.id group by u.nombre;

-- Jose A.
-- DATOS DE SERIE CON MAS VALORACION
select * from series where valoracion = (select max(valoracion) from series);

-- Jose A.
-- Platfs con precio superior al precio medio
select * from plataformas where precio > (select avg(precio) from plataformas);

select * from series;
select * from plataformas;
select * from suscripciones;
select * from usuarios;