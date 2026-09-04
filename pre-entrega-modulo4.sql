select * from clientes;
select * from productos;
select * from ventas;
;

insert INTO productos (nombre_producto, costo_productos, id_productos, categoria)
values ('Play',1500000, 6, 'TV Y ACCESORIOS DE TV');

insert INTO clientes (id_clientes, email, edad)
values (6,'jose@gmail.com', 36);
    

UPDATE ventas
SET fecha_venta = '2026-06-02'
WHERE id_ventas = 12;

UPDATE ventas
SET fecha_venta = '2026-04-04'
WHERE id_ventas = 13;
UPDATE ventas
SET fecha_venta = '2026-03-10'
WHERE id_ventas = 14;

UPDATE ventas
SET fecha_venta = '2026-02-15'
WHERE id_ventas = 15;

UPDATE ventas
SET fecha_venta = '2026-03-20'
WHERE id_ventas = 11;

UPDATE productos
SET nombre_producto = 'MOUSE',
    costo_productos = 15000
WHERE id_productos = 5;

update productos 
set categoria ='TV Y ACCESORIOS DE TV'
where id_productos =4;

INSERT INTO ventas (id_producto, id_cliente)
VALUES
(6, 2),
(4, 5),
(4, 1),
(6, 3),
(1, 4);

alter table ventas 
add column fecha_venta date;

--para unir ventas y productos
select *
from ventas v
join productos p
on v.id_producto = p.id_productos;


--rentabilidad por categoria (para sumar ventas por categorias y listar las ventas totales de cada categoria)
select 
p.categoria,
sum (p.costo_productos) as ventas_totales
from ventas v
join productos p
on v.id_producto = p.id_productos
group by p.categoria;


--clientes escurridizos (usar left join para clientes sin ventas)
select  
c.id_clientes,
c.email
from clientes c 
left join ventas v
on c.id_clientes = v.id_cliente 
WHERE COALESCE(v.id_cliente, 0) = 0;


--top de compras por clientes
select 
c.email,
p.nombre_producto,
max (v.fecha_venta) as ultima_compra,
count (*) as cantidad_compras
from clientes c
join ventas v
on c.id_clientes = v.id_cliente
join productos p
on v.id_producto = p.id_productos 
group by 
    c.id_clientes,
c.email,
p.nombre_producto 

HAVING COUNT(*) = (
    SELECT MAX(cantidad)
    FROM (
        SELECT COUNT(*) AS cantidad
        FROM ventas v2
        WHERE v2.id_cliente = c.id_clientes
        GROUP BY v2.id_producto
    ) AS compras
);
