\c postgres
Hola mundo
DROP DATABASE hiperautos;
CREATE DATABASE hiperautos;
\c hiperautos

-- =================================================
-- =================================================

---- tabla hiperautos
CREATE TABLE hiperautos(
nomhiperautos varchar(30),
nithiperautos int,
sedehiperautos varchar(30)
);


---- tabla sucursales
CREATE TABLE sucursales(
codsucursales int,
nomsucursales varchar(30),
dirsucursales varchar(50),
ciudsucursales varchar(30),
nithiperautos int
);

---- tabla almacen
CREATE TABLE almacen(
codalmacen int,
respalmacen  varchar(30),
codesucursales int
);

---- tabla piezas
CREATE TABLE pieza(
codpieza int,
nompieza varchar(30),
codalmacen int,
cantpieza int,
cantmin_pieza int
);

---- tabla almapieza
CREATE TABLE almapieza(
codpieza int,
codalmacen int
);

---- tabla concesionarios
CREATE TABLE concesionario(
codconcesionario int,
nomconcesionario varchar(50),
dirconcesionario varchar(50),
ciudconcesionario  varchar(50)
);


---- tabla pedidos
CREATE TABLE pedido(
codpedido int,
cantpiezas_pedido varchar(30),
tipo varchar(30),
razonpedido varchar(30),
fechaenvio_pedido date,
fechapedido date,
codconcesionario int,
codsucursales int
);

-- =================================================
-- =================================================

-- LLAVES PRIMARIAS

---- tabla hiperautos
ALTER TABLE hiperautos ADD PRIMARY KEY (nithiperautos);

---- tabla sucursales
ALTER TABLE sucursales ADD PRIMARY KEY (codsucursales);

---- tabla almacen
ALTER TABLE almacen ADD PRIMARY KEY (codalmacen);

---- tabla pieza
ALTER TABLE pieza ADD PRIMARY KEY (codpieza);

---- tabla consecionarios
ALTER TABLE concesionario ADD PRIMARY KEY (codconcesionario ); 

---- tabla pedidos
ALTER TABLE pedido ADD PRIMARY KEY (codpedido);

-- =================================================
-- =================================================

-- LLAVES FORANEAS

---- tabla sucursales
ALTER TABLE sucursales ADD FOREIGN KEY(nithiperautos) REFERENCES hiperautos(nithiperautos);

---- tabla almacen
ALTER TABLE almacen ADD FOREIGN KEY(codesucursales) REFERENCES sucursales(codsucursales);

---- tabla almapieza
ALTER TABLE almapieza ADD FOREIGN KEY(codpieza) REFERENCES pieza(codpieza);
ALTER TABLE almapieza ADD FOREIGN KEY(codalmacen) REFERENCES almacen(codalmacen);

---- tabla pieza
ALTER TABLE pieza ADD FOREIGN KEY(codalmacen ) REFERENCES almacen(codalmacen );

--- tabla concesionario
ALTER TABLE pedido ADD FOREIGN KEY(codconcesionario ) REFERENCES concesionario(codconcesionario);
ALTER TABLE pedido ADD FOREIGN KEY(codsucursales) REFERENCES sucursales(codsucursales);


-- =================================================
-- =================================================

-- NOT NULL para llaves

---- tabla hiperautos
ALTER TABLE hiperautos  ALTER COLUMN nithiperautos SET NOT NULL;

---- tabla sucursales
ALTER TABLE sucursales ALTER COLUMN codsucursales SET NOT NULL;

---- tabla almacen
ALTER TABLE almacen ALTER COLUMN codalmacen SET NOT NULL;

---- tabla pieza
ALTER TABLE pieza  ALTER COLUMN codpieza SET NOT NULL;

---- tabla consecionarios
ALTER TABLE concesionario ALTER COLUMN codconcesionario SET NOT NULL;

---- tabla pedidos
ALTER TABLE pedido ALTER COLUMN codpedido SET NOT NULL;

---- datos hiperautos
INSERT INTO hiperautos(nomhiperautos,nithiperautos,sedehiperautos)
VALUES('HIPERAUTOS',123456789, 'ALEMANIA');

--====================================================================================
---DATOS SURCUSALES
--====================================================================================


INSERT INTO sucursales (codsucursales,nomsucursales,dirsucursales,ciudsucursales,nithiperautos)
VALUES
(001,'HIPERAUTOS','calle 8 #56-74', 'FRANCIA', 123456789),
(002,'HIPERAUTOS','calle 15 #45-65', 'ESPANIA', 123456789),
(003,'HIPERAUTOS','calle 12 #50-84','GRECIA', 123456789),
(004,'HIPERAUTOS','calle 9 #79-96', 'ITALIA', 123456789),
(005,'HIPERAUTOS','calle 10 #56-54', 'SUECIA', 123456789);


--==================================================================================
---DATOS ALMAPIEZA
--====================================================================================
INSERT INTO pieza (codpieza, codalmacen)
VALUES
(12,006),
(13,007),
(14,008),
(15,009),
(16,0010);

--====================================================================================
---DATOS ALMACEN
--====================================================================================
INSERT INTO almacen (codalmacen,respalmacen ,codesucursales)
VALUES
(006,'CAMILO CEBALLOS', 001),
(007,'ANDRES CRUZ', 002),
(008,'ALEX MORENO', 003),
(009,'SANDRA SILVA', 004),
(0010,'MARIA CEBALLOS', 005);

--==================================================================================
---DATOS PIEZAS
--====================================================================================
INSERT INTO pieza (codpieza,nompieza, codalmacen,cantpieza, cantmin_pieza)
VALUES
(12,'AMORTIGUADORES',006,500,100),
(13,'FAROS',007,400,200),
(14,'PASTILLAS FRENOS',008,200,80),
(15,'LIMPIABRISAS',009,500,150),
(16,'VALVULAS',0010,600,120);



--==================================================================================
---DATOS CONCESIONARIOS
--====================================================================================
INSERT INTO concesionario (codconcesionario,nomconcesionario,dirconcesionario,ciudconcesionario)
VALUES
(18,'AUTOPARIS', 'AV 6# 6-89','PARIS'),
(19,'AUTOMADRID','AV 5# 5-69','MADRID'),
(20,'AUTOATENAS', 'AV 9# 2-89','ATENAS'),
(21,'AUTOROMA','AV 4# 9-39','ROMA'),
(22,'AUTOESTOCOLMO','AV 6# 8-69','ESTOCOLMO');

--==================================================================================
---DATOS PEDIDOS
--====================================================================================
INSERT INTO pedido (codpedido,cantpiezas_pedido,tipo,razonpedido,fechaenvio_pedido,fechapedido,codconcesionario,codsucursales)
VALUES
(011,400,'REPOSICION','REPUESTOS','10-03-2018', '03-03-2018',18,001),
(012,400,'PEDIDO PROGRAMADO','PIEZAS TERMINADAS','10-02-2018' ,'01-02-2018',19 ,002),
(013,400,'PEDIDO ABIERTO','PIEZAS TERMINADAS','18-04-2018', '06-04-2018' ,20 ,003),
(014,400,'PEDIDO NORMAL','PIEZAS TERMINADAS','20-05-2018', '10-05-2018', 21, 004),
(015,400,'PEDIDO NORMAL','PIEZAS TERMINADAS','10-04-2018', '04-04-2018', 22, 005);
