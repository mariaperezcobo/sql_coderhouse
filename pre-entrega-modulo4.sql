select * from clientes;
select * from productos;
select * from ventas;
select * from categorias;
;




--para unir ventas y productos
select *
from ventas v
join productos p
on v.id_producto = p.id_productos;


--rentabilidad por categoria (para sumar ventas por categorias y listar las ventas totales de cada categoria)
select 
c.nombre_categoria,
count (v.id_producto) as unidades_vendidas, --para contar cant de unidades vendidas
sum (v.precio_venta) as ingreso_total, --para ver ingreso total
sum (v.precio_venta - p.costo_productos) as rentabilidad --calcula precio de venta menos costo del producto
from ventas v --de la tabla ventas que esta unida a productos por di_producto que esta unida a categorias por id_categorias
join productos p
on v.id_producto = p.id_productos
join categorias c 
on p.categoria = c.id_categoria
group by nombre_categoria --agrupa por categoria
having sum(v.precio_venta ) > 1000000; --y solo muestra categorias con ingresos mayores a 1mm



--clientes escurridizos (usar left join para clientes sin ventas)
select  
c.id_clientes,--  muestra el ID de los clientes que no tienen ventas
c.email --  muestra el email de esos clientes 
from clientes c 
left join ventas v
on c.id_clientes = v.id_cliente  -- relaciona clientes con ventas mediante el ID del cliente
WHERE COALESCE(v.id_cliente, 0) = 0; -- muestra los que no tienen venta


--top de compras por clientes
select 
c.email,	--queda con el mail del cliente
p.nombre_producto,
max (v.fecha_venta) as ultima_compra --queda con la fecha d ela ultima compra

from clientes c --de la tabla clientes
join ventas v --que une con venta spor id de cliente
on c.id_clientes = v.id_cliente
join productos p --que une con productos por id del producto
on v.id_producto = p.id_productos 
group by --agrupa por cliente
    c.id_clientes,
c.email,
p.nombre_producto 

HAVING COUNT(*) = (
    SELECT MAX(cantidad) -- obtiene la mayor cantidad de compras
    FROM (
        SELECT COUNT(*) AS cantidad -- cuenta cuántas veces compró cada producto
        FROM ventas v2
        WHERE v2.id_cliente = c.id_clientes -- toma las ventas del cliente actual
        GROUP BY v2.id_producto -- agrupa las ventas por producto
    ) AS compras
);



--calculos auxiliares.. no leer
create table categorias (
id_categoria serial primary key,
nombre_categoria varchar(200) not null unique);

SELECT DISTINCT categoria
FROM productos;

alter table categorias
alter column nombre_categoria type varchar(200);

insert into categorias (nombre_categoria)
values
('TV Y ACCESORIOS DE TV'),
('articulos de computación');

alter table ventas 
ADD COLUMN precio_venta DECIMAL(10,2);

UPDATE productos
SET categoria = 2
WHERE id_productos = 6;

insert into ventas()


ALTER TABLE productos
ALTER COLUMN categoria TYPE INTEGER
USING categoria::INTEGER;
