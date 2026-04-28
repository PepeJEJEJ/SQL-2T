USE TiendaTecnologia;

-- Pepe
-- 1) Listado con todos los productos, mostrando para cada uno el id_fab, el id_producto, la descripción y el precio.
select id_fab,id_producto,descripcion,precio from productos;

-- Pepe
-- 2) Listado de todos los pedidos realizados por el cliente 2, extrayendo toda la información.
select * from pedidos where id_cliente=2; -- '' es texto y numeros es numeros

-- Pepe
-- 3) Consultar todos los datos de los productos de más de 100 €.
select * from productos where precio>100;

-- Pepe
-- 4) Listado de clientes de Madrid o Barcelona.
select * from clientes where ciudad in ('Madrid','Barcelona');

-- Pepe
-- 5) Obtener el precio medio de los productos del fabricante con id_fab = '1'.
select id_fab,avg(precio) as precio_medio from productos where id_fab=1 group by id_fab;


-- Pepe
-- 6) Consultar la fecha del pedido más antiguo.
select min(fecha_pedido) as pedido_mas_antiguo from pedidos;

-- Pepe
-- 7) Consultar los diferentes paises que existen en los fabricantes (sin repetir)
select distinct pais from fabricantes;

-- Pepe
-- 8) Obtén los pedidos realizados entre el 1 de enero de 2024 y el 5 de febrero de 2024.
select * from pedidos where fecha_pedido between '2024-01-01' and '2024-02-05';

-- Pepe
-- 9) Muestra una lista de los clientes con su nombre completo (direccion + ciudad) concatenados en un solo campo.
select id_cliente,nombre,concat(direccion,' - ',ciudad, " y su nombre es ", nombre) as nombre_completo from clientes;

-- Pepe
-- 10) Muestra cuantos fabricantes hay en cada país
select pais,count(*) as total_fabricantes from fabricantes group by pais;

-- Pepe
-- 11) Muestra en otra columna llamada precio_con_iva todos los datos de los productos, suma el iva 21%.
select id_producto,descripcion,precio,round(precio*1.21,2) as precio_con_iva from productos;

-- Pepe
-- 12) Producto más caro
select * from productos order by precio desc limit 1;

-- Pepe
-- 13) Cliente con más pedidos
select c.id_cliente,c.nombre,count(*) as total_pedidos from clientes c join pedidos p on c.id_cliente=p.id_cliente group by c.id_cliente,c.nombre order by total_pedidos desc limit 1;

-- Pepe
-- 14) Mostrar los productos ordenados por precio de mayor a menor
select * from productos order by precio desc;

-- Pepe
-- 15) Mostrar los clientes ordenados por ciudad alfabéticamente
select * from clientes order by ciudad asc;

-- Pepe
-- 16) Mostrar solo los 5 productos más baratos
select * from productos order by precio asc limit 5;

-- Pepe
-- 17) Mostrar cuántos productos hay por fabricante
select id_fab,count(*) as total_productos from productos group by id_fab; -- contar los productos por categoria

-- Pepe
-- 18) Mostrar solo los fabricantes que tengan más de 1 producto
select id_fab,count(*) as total_productos from productos group by id_fab having count(*)>1;

-- Pepe
-- 19) Mostrar clientes cuyo nombre empiece por “A”
select * from clientes where nombre like 'A%';

-- Pepe
-- 20) Mostrar productos cuyo nombre contenga la palabra “Portátil”
select * from productos where descripcion like '%Portátil%';

-- Pepe
-- 21) Convertir nombres de clientes a mayúsculas
select id_cliente,upper(nombre) as nombre_mayus,direccion,ciudad from clientes;

-- Pepe
-- 22) Convertir descripciones de productos a minúsculas
select id_producto,lower(descripcion) as descripcion_minus,precio from productos;

-- Pepe
-- 23) Nombre + dirección en mayúsculas en una columna llamada "Nombre_Completo"
select id_cliente,upper(concat(nombre,' - ',direccion)) as nombre_completo from clientes;

-- Pepe
-- 24) Cambiar el formato de los nombres de productos para que comiencen con "Producto:" seguido de su descripción. Crear un alias Producto_Descripcion.
select concat('Producto: ',descripcion) as producto_descripcion,id_producto,precio from productos;

-- Pepe
-- 25) Extraer las tres primeras letras del nombre de cada país  de fabricantes:
select pais,substring(pais,1,3) as prefijo from fabricantes;

-- Pepe
-- 26) Reemplazar "Calle" por "Avda." en las direcciones de cliente
select id_cliente,nombre,replace(direccion,'Calle','Avda.') as direccion_modificada from clientes;

-- Pepe
-- 27) Calcular cuántos días han pasado desde cada pedido hasta hoy (función SYSDATE):
select n_pedido,fecha_pedido,datediff(sysdate(),fecha_pedido) as dias_transcurridos from pedidos;

-- Pepe
-- 28) Obtener la última fecha del mes en que se realizó cada pedido (función LAST_DAY):
select n_pedido,fecha_pedido,last_day(fecha_pedido) as ultimo_dia_mes from pedidos;

-- Pepe
-- 29) Asignar un estado personalizado a los pedidos dependiendo de su estado actual, 'Finalizado', 'Anulado' o 'En Gestión' (expresión CASE):
select n_pedido,estado,case when estado='Completado' then 'Finalizado' when estado='Cancelado' then 'Anulado' else 'En Gestión' end as estado_personalizado from pedidos;

-- Pepe
-- 30) Obtener los pedidos realizados en 2023.
select * from pedidos where year(fecha_pedido)=2023;

-- Pepe
-- 31) Elevar el precio de cada producto al cuadrado
select id_producto,precio,pow(precio,2) as precio_cuadrado from productos;

-- Pepe
-- 32) Redondear el precio de cada producto a 1 decimal
select id_producto,round(precio,1) as precio_redondeado from productos;

-- Pepe
-- 33) Extraer el año de las fechas de pedido:
select n_pedido,year(fecha_pedido) as anio from pedidos;

-- Pepe
-- 34) Calcular cuántos pedidos se hicieron en un año específico (por ejemplo, 2024):
select count(*) as total_pedidos_2024 from pedidos where year(fecha_pedido)=2024;

-- Pepe
-- 35) Invertir el nombre de los clientes:
select id_cliente,nombre,reverse(nombre) as nombre_invertido from clientes;

-- Pepe
-- 36) Mostrar la longitud de cada nombre de cliente
select id_cliente,nombre,length(nombre) as longitud from clientes;

-- Pepe
-- 37) Mostrar solo los 4 primeros caracteres del nombre del cliente
select id_cliente,substring(nombre,1,4) as nombre_4 from clientes;

-- Pepe
-- 38) Mostrar “CARO” para productos => 500 o “BARATO” según el precio
select id_producto,descripcion,precio,case when precio>=500 then 'CARO' else 'BARATO' end as categoria from productos;

-- Pepe
-- 39) Cantidad total de productos vendidos por cada producto
select id_producto,sum(cant) as total_vendido from detalles_pedido dp group by id_producto;

-- Pepe
-- 40) Número de clientes por cada ciudad (Añade algo a la consulta para mostrar solo las ciudades que tengan más de un cliente)
select ciudad,count(*) as num_clientes from clientes group by ciudad having count(*)>1;

insert into clientes (nombre, direccion, ciudad, telefono, email) values
('Pepe Arganda', 'Calle Huelma', 'Madrid', '123456789', 'carlos.fernandez@medac.es');
select * from clientes;

select ciudad, count(*) from clientes group by ciudad;