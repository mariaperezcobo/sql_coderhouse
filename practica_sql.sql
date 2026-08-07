create database retail_coder;

create table clientes (
id_clientes serial primary key,
email varchar(100) unique not null,
edad INT NOT NULL CHECK (edad >= 18)
);

create table productos (
id_productos serial primary key,
costo_productos decimal(10,2) check (costo_productos>0),
nombre_producto varchar(200)
);

create table ventas(
id_ventas serial primary key,
id_cliente int references clientes (id_clientes),
id_producto int references productos(id_productos),
fecha_venta DATE NOT NULL CHECK (fecha_venta <= CURRENT_DATE)
);



begin;

insert into clientes (email, edad)
values
('juan@gmail.com', 30),
('pablo@gmail.com',45),
('maria@gmail.com',36),
('manuel@gmail.com',33),
('ines@hotmail.com',47);

insert into productos (costo_productos, nombre_producto)
values
(3000, 'manzanas'),
(2500,'zanahorias'),
(8000, 'kiwi'),
(4500,'cherry'),
(3500,'cabutia');

commit;


begin;

INSERT INTO ventas (id_cliente, id_producto, fecha_venta)
VALUES
(1,1,'2026-08-01'),
(2,3,'2026-08-02'),
(3,2,'2026-08-03'),
(4,4,'2026-08-04'),
(5,2,'2026-08-05');

commit;

select *
from ventas;

select *
from productos;

update productos 
set costo_productos= costo_productos *1.1 where nombre_producto='kiwi';

delete from ventas 
where id_ventas=5;


