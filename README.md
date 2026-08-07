Proyecto Retail - Base de Datos PostgreSQL
Descripción del proyecto

Este proyecto consiste en el diseño y desarrollo de una base de datos para una tienda retail. El objetivo es organizar la información de clientes, productos y ventas, reemplazando un registro manual por una estructura relacional que permita almacenar, consultar y modificar los datos de forma ordenada.

La base de datos fue desarrollada utilizando PostgreSQL e incluye la creación de tablas, claves primarias, claves foráneas y restricciones de integridad para asegurar la calidad de la información almacenada.

Modelo de datos

El proyecto contiene las siguientes entidades principales:

Clientes
ID de cliente (Primary Key)
Email
Edad

Productos
ID de producto (Primary Key)
Nombre del producto
Costo del producto

Ventas
ID de venta (Primary Key)
ID de cliente (Foreign Key)
ID de producto (Foreign Key)
Fecha de venta

Las relaciones entre las tablas permiten vincular cada venta con un cliente y un producto determinado.

Contenido del archivo SQL

El archivo retail_coder.sql incluye:

Creación de la base de datos.
Creación de las tablas del modelo.
Definición de claves primarias y foráneas.
Restricciones CHECK para validar los datos ingresados.
Inserción de datos de prueba mediante transacciones (BEGIN / COMMIT).
Consultas de validación.
Actualización de registros mediante UPDATE.
Eliminación de registros mediante DELETE.
Ejecución del proyecto

Para ejecutar el proyecto:

Abrir PostgreSQL mediante DBeaver u otra herramienta de administración.
Crear la base de datos ejecutando el script retail_coder.sql.
Ejecutar las sentencias del archivo en orden.
Verificar la creación de tablas y los datos cargados mediante consultas SQL.
Tecnologías utilizadas
PostgreSQL
DBeaver
SQL
GitHub
