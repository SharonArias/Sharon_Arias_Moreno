-- script de creacion de base de datos universidad-- tabla facultades
DROP DATABASE universidad;
Hola mundo

CREATE DATABASE universidad;

\c universidad

CREATE TABLE facultades(
codfacultad char(2),
nomfacultad varchar(30)
);
--
-- tabla materias
CREATE TABLE materias(
codmateria char(2),
nommateria varchar(30),
credmateria smallint
);
--
-- tabla profesores
CREATE TABLE profesores(
nomprofesor varchar(30)
);
--
-- tabla barrios
CREATE TABLE barrios(
codbarrio char(3),
nombarrio varchar(30),
estbarrio smallint
);
--
-- tabla decanos
CREATE TABLE decanos(
iddecano char(4),
nomdecano varchar(30),
facultad char(2)
);
--
-- tabla programas
CREATE TABLE programas(
codprograma char(2),
nomprograma varchar(30),
facultad char(2)
);
--
-- tabla estudiantes
CREATE TABLE estudiantes(
codestudiante char(2),
nomestudiante varchar(30),
edaestudiante smallint,
fechestudiante date,
sexestudiante char(1),
barrio char(3),
programa char(2)
);
--
-- adicionar atributo
ALTER TABLE estudiantes ADD column ciudad char(5);

-- tabla regnotas
CREATE TABLE regnotas(
estudiante char(4),
materia char(2),
profesor char(4),
parcial1 decimal(3,1),
parcial2 decimal(3,1),
efinal decimal(3,1),
nfinal decimal(3,1),
estado char(1)
);
-- 
-- tabla promedios
CREATE TABLE promedios(
nomestudiante varchar(30),
promestudiante decimal(4,2)
);
--
-- tabla ciudades
CREATE TABLE ciudades (
codciudad char(5) not null PRIMARY KEY,
nomciudad varchar(30)
);

-- adicionar atributo en la tabla profesores
ALTER TABLE profesores ADD COLUMN idprofesor char(5);

-- =================================================
-- INTEGRIDAD (RESTRICCIONES)
-- =================================================
-- INTEGRIDAD DE UNICIDAD:tuplas únicas
-- =================================================
-- LLAVES PRIMARIAS
-- Tabla facultades
-- creacion de llave primaria por defecto
ALTER TABLE facultades ADD PRIMARY KEY (codfacultad);

-- El sistema le crea a la restriccion un nombre por defecto: facultades_pkey 
-- Con este nombre se puede eliminar la llave primaria asi:

ALTER TABLE facultades DROP CONSTRAINT facultades_pkey;
--
-- creacion de llave primaria como restriccion
ALTER TABLE facultades ADD CONSTRAINT pk_codfacultad PRIMARY KEY (codfacultad);
--
-- tabla materias
ALTER TABLE materias ADD PRIMARY KEY (codmateria);
--
-- tabla profesores
ALTER TABLE profesores ADD PRIMARY KEY(idprofesor);
--
-- tabla barrios
ALTER TABLE barrios ADD PRIMARY KEY(codbarrio);
--
-- tabla decanos
ALTER TABLE decanos ADD PRIMARY KEY(iddecano);
--
-- tabla programas
ALTER TABLE programas ADD PRIMARY KEY(codprograma);
--
-- tabla estudiantes
ALTER TABLE estudiantes ADD PRIMARY KEY(codestudiante);
--
-- tabla regnotas
ALTER TABLE  regnotas ADD PRIMARY KEY(estudiante,materia);
--
-- tabla promedios
ALTER TABLE  promedios ADD PRIMARY KEY(nomestudiante);

-- ======================================================
-- INTEGRIDAD REFERENCIAL:el valor de una llave foranea debe existir antes 
-- como valor de una llave primaria o candidata a la cual referencia
--=======================================================
-- LLAVES FORANEAS
--===============================================
-- tabla decanos
-- Creacion llave foranea por defecto

ALTER TABLE decanos ADD FOREIGN KEY(facultad) REFERENCES facultades(codfacultad);

-- El sistema le asigna a la restriccion de llave foranea  el nombre: decanos_facultad_fkey 
-- Con este nombre se puede eliminar la llave foranea

ALTER TABLE decanos DROP CONSTRAINT decanos_facultad_fkey;
-- Creacion llave foranea como restriccion

ALTER TABLE decanos ADD CONSTRAINT fk_facultad FOREIGN KEY (facultad) REFERENCES facultades(codfacultad);
-- 
-- tabla programas
ALTER TABLE programas ADD FOREIGN KEY(facultad) REFERENCES facultades(codfacultad);
--
-- tabla estudiantes
ALTER TABLE estudiantes ADD FOREIGN KEY(barrio) REFERENCES barrios(codbarrio);
ALTER TABLE estudiantes ADD FOREIGN KEY(programa) REFERENCES  programas(codprograma);
ALTER TABLE estudiantes ADD FOREIGN KEY(ciudad) REFERENCES  ciudades(codciudad);
--
-- tabla regnotas
ALTER TABLE regnotas ADD FOREIGN KEY(estudiante) REFERENCES estudiantes(codestudiante);
ALTER TABLE regnotas ADD FOREIGN KEY(materia)  REFERENCES materias(codmateria);
ALTER TABLE regnotas ADD FOREIGN KEY(profesor)  REFERENCES profesores(idprofesor);

--
-- tabla promedios
ALTER TABLE promedios ADD FOREIGN KEY(nomestudiante) REFERENCES estudiantes(codestudiante);


-- RESTRICCIONES DE ATRIBUTOS:limitación a los valores que pueden recibir los atributos
-- de una tabla:
-- ============================================================================
-- NOT NULL: que los atributos no pueden ser nulos, es decir quedar vacios.
-- Es obligatorio para las llaves primarias y candidatas y recomendable para llaves foráneas
-- ============================================================================
-- Al crear una llave primaria, este modificador not null automaticamente se coloca en el atributo
-- o atributos que forman la llave primaria
-- =========================================
-- not null para llaves foraneas
-- tabla decanos
ALTER TABLE decanos ALTER COLUMN facultad SET NOT NULL;

-- tabla programas
ALTER TABLE programas ALTER COLUMN facultad SET NOT NULL;

-- tabla estudiantes
ALTER TABLE  estudiantes ALTER COLUMN nomestudiante SET NOT NULL;
ALTER TABLE  estudiantes ALTER COLUMN barrio SET NOT NULL;
ALTER TABLE  estudiantes ALTER COLUMN programa SET NOT NULL;

-- tabla regnotas
ALTER TABLE regnotas ALTER COLUMN estudiante SET NOT NULL;
ALTER TABLE regnotas ALTER COLUMN materia SET NOT NULL;
ALTER TABLE regnotas ALTER COLUMN profesor SET NOT NULL;




-- ======================================================
-- SET DEFAULT <valor>:Asigna un valor por defecto 
-- si al atributo no se le ingresa ningun valor
-- recomendable para atributos numericos
-- ==================================================
-- tabla estudiantes
ALTER TABLE estudiantes ALTER COLUMN  edaestudiante SET DEFAULT 0;
-- tabla regnotas
ALTER TABLE regnotas ALTER COLUMN parcial1 SET DEFAULT  0;
ALTER TABLE regnotas ALTER COLUMN parcial2 SET DEFAULT 0;
ALTER TABLE regnotas ALTER COLUMN efinal SET DEFAULT 0;
ALTER TABLE regnotas ALTER COLUMN nfinal SET DEFAULT 0;
-- =========================================================
-- CONSTRAINTS EN ATRIBUTOS
-- =========================================================
-- CHECK:permite validar los valores de un atributo para que de este modo,
-- estos reciban los valores que se especifican en el check
-- ==========================================================
-- tabla estudiantes
ALTER TABLE estudiantes ADD CONSTRAINT chk_sexestudiante CHECK(sexestudiante='F' or sexestudiante='M');
ALTER TABLE estudiantes ADD CONSTRAINT chk_edaestudiante CHECK(edaestudiante>=0);
--
-- tabla regnotas
ALTER TABLE regnotas ADD CONSTRAINT chk_parcial1 CHECK(parcial1>=0 and parcial1<=5.0);
ALTER TABLE regnotas ADD CONSTRAINT chk_parcial2 CHECK(parcial2 between 0 and 5.0);
ALTER TABLE regnotas ADD CONSTRAINT chk_efinal CHECK(efinal between 0 and 5.0);
ALTER TABLE regnotas ADD CONSTRAINT chk_nfinal CHECK(nfinal>=0 and nfinal <=5.0);
ALTER TABLE regnotas ADD CONSTRAINT chk_estado CHECK(estado in ('A','R'));
-- ===========================================================================
-- LLAVES CANDIDATAS:Es un atributo o conjunto de atributos cuyos valores no
-- se repiten y que puede ser llave primaria 
-- ===========================================================================
-- tabla estudiantes
ALTER TABLE estudiantes ADD CONSTRAINT ck_nomestudiante UNIQUE(nomestudiante);
-- eliminar llave unica
ALTER TABLE estudiantes DROP CONSTRAINT ck_nomestudiante;