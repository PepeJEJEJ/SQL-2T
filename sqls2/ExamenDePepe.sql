USE TiendaTecnologia;


-- Pepe
-- 1.
select * from Productos order by Precio;

-- Pepe
-- 2.
select * from Pedidos where (Estado%'Pendiente');

-- Pepe
-- 3.
select Id_fab, Id_categoria, Descripcion, Precio, Existencias as Productos_Caros from Productos where Precio>500;

-- Pepe
-- 4.
select Nombre from Clientes where Telefono %('56');

-- Pepe
-- 5.
select Estado from Pedidos;

-- Pepe
-- 6.
select * from Pedidos where month (01);

-- Pepe
-- 7.
select Id_cliente, Nombre, upper(concat(Direccion,'-',Ciudad)), Telefono, Email as Ubicacion from Clientes ;