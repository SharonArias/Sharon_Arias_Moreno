\c postgres
DROP DATABASE mascotlandia;
CREATE DATABASE mascotlandia;
Hola mundo
\c mascotlandia

-- =================================================
-- =================================================

---- tabla veterinaria
CREATE TABLE veterinaria(
nitveterinaria int,
nomveterinaria varchar(30),
dirveterinaria varchar(30),
telveterinaria int,
ciuveterinaria varchar (20),
gerenveterinaria varchar(30)
);


---- tabla empleados
CREATE TABLE empleados(
idempleado int,
nomempleado varchar(30),
apeempleado varchar(30),
cargempleado varchar(20),
dirempleado varchar(50),
telempleado int,
especialidad varchar(30),
nitveterinaria int
);

---- tabla servicio
CREATE TABLE servicio(
idservicio int,
tiposervicio varchar(20),
tiemposervicio int,
costoservicio INT,
veterinaria int
);

---- tabla historiaclinica
CREATE TABLE historiaclinica(
codhc int,
fechaconsuhc date,
consultahc varchar(50),
tratamientohc varchar(50),
medicacionhc varchar(50),
diagnosticohc varchar(50),
pesohc int,
tama?ohc int,
fechasalida DATE,
mascota int
);

---- tabla mascotas
CREATE TABLE mascotas(
idmascota int,
nom_mascota varchar(15),
raza_mascota varchar(15),
fech_nacimiento_mascota date,
especie_mascota varchar(15),
sexo_mascota char(1),
color_mascota varchar(15),
veterinaria int,
propietario int,
historiaclinica int
);

---- tabla propietario
CREATE TABLE propietario(
idpropietario int,
nom_propietario varchar(30),
apell_propietario varchar(30),
genero_propietario char(1),
dire_propietario varchar(20),
telpropietario int
);

-- =================================================
-- =================================================

-- LLAVES PRIMARIAS

---- tabla veterinaria
ALTER TABLE veterinaria ADD PRIMARY KEY (nitveterinaria);

---- tabla empleados
ALTER TABLE empleados ADD PRIMARY KEY (idempleado);

---- tabla servicio
ALTER TABLE servicio ADD PRIMARY KEY (idservicio);

---- tabla historiaclinica
ALTER TABLE historiaclinica ADD PRIMARY KEY (codhc);

---- tabla mascota
ALTER TABLE mascotas ADD PRIMARY KEY (idmascota);

---- tabla propietario
ALTER TABLE propietario ADD PRIMARY KEY (idpropietario);

-- =================================================
-- =================================================

-- LLAVES FORANEAS

---- tabla empleados
ALTER TABLE empleados ADD FOREIGN KEY(nitveterinaria) REFERENCES veterinaria(nitveterinaria);

---- tabla servicio
ALTER TABLE servicio ADD FOREIGN KEY(veterinaria) REFERENCES veterinaria(nitveterinaria);

---- tabla historiaclinica
ALTER TABLE historiaclinica ADD FOREIGN KEY(idmascota) REFERENCES mascotas(idmascota);

---- tabla mascota
ALTER TABLE mascotas ADD FOREIGN KEY(veterinaria) REFERENCES veterinaria(nitveterinaria);

ALTER TABLE mascotas ADD FOREIGN KEY(propietario) REFERENCES propietario(idpropietario);

ALTER TABLE mascotas ADD FOREIGN KEY(historiaclinica) REFERENCES historiaclinica(codhc);

-- =================================================
-- =================================================

-- NOT NULL para llaves

---- tabla veterinaria
ALTER TABLE veterinaria ALTER COLUMN nitveterinaria SET NOT NULL;

---- tabla empleados
ALTER TABLE empleados ALTER COLUMN idempleado SET NOT NULL;

---- tabla servicio
ALTER TABLE servicio ALTER COLUMN idservicio SET NOT NULL;

---- tabla historiaclinica
ALTER TABLE historiaclinica ALTER COLUMN codhc SET NOT NULL;

---- tabla mascota
ALTER TABLE mascotas ALTER COLUMN idmascota SET NOT NULL;

---- tabla propietario
ALTER TABLE propietario ALTER COLUMN idpropietario SET NOT NULL;

INSERT INTO veterinaria(nitveterinaria,nomveterinaria, dirveterinaria, telveterinaria, ciuveterinaria, gerenveterinaria)
VALUES(5050,'MASCOTLANDIA','carera 11 #54-36', 7325689, 'pasto', 'DANILO YAMUEZ');

--====================================================================================
---DATOS EMPLEADOS
--====================================================================================
INSERT INTO empleados(idempleado,nomempleado,apeempleado,cargoempleo,dirempleo,telempleado,especialidad)
VALUES
(1,'CAMILO', 'BRAVO', 'AUXILIAR', 'carrera 11 #4-25', '315875325', 'FRACTURAS'),
(2,'','ALFONSO' , 'BRAVO', 'AUXILIAR', 'carrera 11 #4-25', '315875325', 'FRACTURAS'),
(3,'ANDRES', 'BRAVO',' AUXILIAR', 'carrera 11 #4-25', '315875325', 'FRACTURAS'),
(4,'BENITO', 'BRAVO', 'AUXILIAR', 'carrera 11 #4-25', '315875325', 'FRACTURAS'),
(5,'LUCAS', 'BRAVO', 'AUXILIAR', 'carrera 11 #4-25', '315875325', 'FRACTURAS'),
(6,'MATEO', 'BRAVO', 'AUXILIAR', 'carrera 11 #4-25', '315875325', 'FRACTURAS'),
(7,'JUAN', 'BRAVO', 'AUXILIAR', 'carrera 11 #4-25', '315875325', 'FRACTURAS'),
(8,'BERNARDO', 'BRAVO', 'AUXILIAR', 'carrera 11 #4-25', '315875325', 'FRACTURAS'),
(9,'MARIA', 'BRAVO', 'AUXILIAR', 'carrera 11 #4-25', '315875325', 'FRACTURAS'),
(10,'MARCELA', 'BRAVO', 'AUXILIAR', 'carrera 11 #4-25', '315875325', 'FRACTURAS');

INSERT INTO empleados(idempleado, nomempleado, apeempleado, cargempleado, dirempleado, telempleado, especialidad, veterinaria) VALUES (11, 'Andres', 'Gomez', 'Limpieza', 'calle20 33-12', 74123455, 'caninos',5050);
INSERT INTO empleados(idempleado, nomempleado, apeempleado, cargempleado, dirempleado, telempleado, especialidad, veterinaria) VALUES (12, 'Juan', 'Lopez', 'vacunacion', 'calle14 30-10', 75163451, 'caninos', 5050);
INSERT INTO empleados(idempleado, nomempleado, apeempleado, cargempleado, dirempleado, telempleado, especialidad, veterinaria) VALUES (13, 'Carlos', 'Sanchez', 'vacunacion', 'calle5 13-30', 75123771, 'felinos', 5050);
INSERT INTO empleados(idempleado, nomempleado, apeempleado, cargempleado, dirempleado, telempleado, especialidad, veterinaria) VALUES (14, 'Manuel', 'Flores', 'Limpieza', 'calle34 15-30', 77522171, 'felinos', 5050);
INSERT INTO empleados(idempleado, nomempleado, apeempleado, cargempleado, dirempleado, telempleado, especialidad, veterinaria) VALUES (15, 'Jose', 'Medina', 'vacunacion', 'calle10 20-10', 75145751, 'caninos', 5050);
INSERT INTO empleados(idempleado, nomempleado, apeempleado, cargempleado, dirempleado, telempleado, especialidad, veterinaria) VALUES (16, 'Paula', 'Torres', 'Limpieza', 'calle11 25-10', 78129751, 'caninos', 5050);
INSERT INTO empleados(idempleado, nomempleado, apeempleado, cargempleado, dirempleado, telempleado, especialidad, veterinaria) VALUES (17, 'Daniela', 'Ramirez', 'Limpieza', 'calle31 15-10', 70129751, 'caninos', 5050);
INSERT INTO empleados(idempleado, nomempleado, apeempleado, cargempleado, dirempleado, telempleado, especialidad, veterinaria) VALUES (18, 'Sofia', 'Alvarez', 'Cirugia', 'calle21 25-10', 75625751, 'caninos', 5050);
INSERT INTO empleados(idempleado, nomempleado, apeempleado, cargempleado, dirempleado, telempleado, especialidad, veterinaria) VALUES (19, 'Lucas', 'Diaz', 'Cirugia', 'calle22 22-10', 75625987, 'caninos', 5050);
INSERT INTO empleados(idempleado, nomempleado, apeempleado, cargempleado, dirempleado, telempleado, especialidad, veterinaria) VALUES (20, 'Mateo', 'Rosa', 'Cirugia', 'calle23 23-10', 75005987, 'felinos', 5050);

INSERT INTO empleados(idempleado,nomempleado,apeempleado,cargempleado,dirempleado,telempleado,especialidad,nitveterinaria)
VALUES(41,'david','melo','urgencias','crra14 #17-02',7433247,'anestesiolog?a',5050);

INSERT INTO empleados(idempleado,nomempleado,apeempleado,cargempleado,dirempleado,telempleado,especialidad,nitveterinaria)
VALUES(42,'alejandro','bastidas','atencion al cliente','crra15 #16-48',7433248,'ninguna',5050);

INSERT INTO empleados(idempleado,nomempleado,apeempleado,cargempleado,dirempleado,telempleado,especialidad,nitveterinaria)
VALUES(43,'jorge','ortega','cl?nico','crra14 #17-03',7433249,'cardiolog?a veterinaria',5050);

INSERT INTO empleados(idempleado,nomempleado,apeempleado,cargempleado,dirempleado,telempleado,especialidad,nitveterinaria)
VALUES(44,'arturo','fernandez','caja','crra15 #16-49',7433250,'contaduria',5050);

INSERT INTO empleados(idempleado,nomempleado,apeempleado,cargempleado,dirempleado,telempleado,especialidad,nitveterinaria)
VALUES(45,'luis','cuastusa','cl?nico','crra14 #17-04',7433251,'anestesiolog?a',5050);

INSERT INTO empleados(idempleado,nomempleado,apeempleado,cargempleado,dirempleado,telempleado,especialidad,nitveterinaria)
VALUES(46,'emilio','hurtado','urgencias','crra15 #16-50',7433252,'cardiolog?a veterinaria',5050);

INSERT INTO empleados(idempleado,nomempleado,apeempleado,cargempleado,dirempleado,telempleado,especialidad,nitveterinaria)
VALUES(47,'andres','arias','cl?nico','crra14 #17-05',7433253,'cirug?a',5050);

INSERT INTO empleados(idempleado,nomempleado,apeempleado,cargempleado,dirempleado,telempleado,especialidad,nitveterinaria)
VALUES(48,'julian','aroca','director','crra15 #16-51',7433254,'administracion',5050);

INSERT INTO empleados(idempleado,nomempleado,apeempleado,cargempleado,dirempleado,telempleado,especialidad,nitveterinaria)
VALUES(49,'liliana','bola?os','urgencias','crra14 #17-06',7433255,'cirug?a',5050);

INSERT INTO empleados(idempleado,nomempleado,apeempleado,cargempleado,dirempleado,telempleado,especialidad,nitveterinaria)
VALUES(50,'carmen','vallejos','secretaria','crra15 #16-52',7433256,'contaduria',5050);

INSERT INTO empleados(idempleado,nomempleado,apeempleado,cargempleado,dirempleado,telempleado,especialidad)
VALUES
(21, 'ANDRES','CORDOBA','ayudante','carrera 25 #23-89',7589845,'fracturas'),
(22, 'CARLOS','CORDOBA','ayudante','carrera 25 #23-89',7589845,'fracturas'),
(23, 'ALEX','CORDOBA','ayudante','carrera 25 #23-89',7589845,'fracturas'),
(24, 'DANIEL','CORDOBA','ayudante','carrera 25 #23-89',7589845,'fracturas'),
(25, 'NOHEMY','CORDOBA','ayudante','carrera 25 #23-89',7589845,'fracturas'),
(26, 'JOSE','CORDOBA','ayudante','carrera 25 #23-89',7589845,'fracturas'),
(27, 'WILLIAM','CORDOBA','ayudante','carrera 25 #23-89',7589845,'fracturas'),
(28, 'JAVIER','CORDOBA','ayudante','carrera 25 #23-89',7589845,'fracturas'),
(29, 'LEIDY','CORDOBA','ayudante','carrera 25 #23-89',7589845,'fracturas'),
(30, 'MAURICIO','CORDOBA','ayudante','carrera 25 #23-89',7589845,'fracturas');
INSERT INTO empleados(idempleado,nomempleado,apeempleado,cargempleado,dirempleado,telempleado,especialidad,nitveterinaria) VALUES(51,'Andres','Torres','Medicina Preventiva','Tamasagra-calle-20',87654321,'Medicina Preventiva',5050);
INSERT INTO empleados(idempleado,nomempleado,apeempleado,cargempleado,dirempleado,telempleado,especialidad,nitveterinaria) VALUES(52,'Leidy','Caicedo','Medicina Interna','calle 20 No 25A-23',987654321,'Medicina Interna',5050);
INSERT INTO empleados(idempleado,nomempleado,apeempleado,cargempleado,dirempleado,telempleado,especialidad,nitveterinaria) VALUES(53,'Yina','Quenoran','Consulta','calle 30 No 25A-24',7654321,'Consulta',5050);
INSERT INTO empleados(idempleado,nomempleado,apeempleado,cargempleado,dirempleado,telempleado,especialidad,nitveterinaria) VALUES(54,'Yeison','Caratar','Etolog?a','calle 40 No 25A-25',987654321,'Etolog?a',5050);
INSERT INTO empleados(idempleado,nomempleado,apeempleado,cargempleado,dirempleado,telempleado,especialidad,nitveterinaria) VALUES(55,'Dayana','Burbano','Est?tica','calle 22 No 25A-26',12345678,'Est?tica',5050);
INSERT INTO empleados(idempleado,nomempleado,apeempleado,cargempleado,dirempleado,telempleado,especialidad,nitveterinaria) VALUES(56,'Camila','Ordo?es','Medicina Preventiva','calle 20 No 25A-27',65432167,'Medicina Preventiva',5050);
INSERT INTO empleados(idempleado,nomempleado,apeempleado,cargempleado,dirempleado,telempleado,especialidad,nitveterinaria) VALUES(57,'Dania','Chazatar','Consulta','calle 25 No 25A-28',987654320,'Consulta',5050);
INSERT INTO empleados(idempleado,nomempleado,apeempleado,cargempleado,dirempleado,telempleado,especialidad,nitveterinaria) VALUES(58,'Maria','Jaramillo','Est?tica','calle 20 No 25A-29',98754321,'Est?tica',5050);
INSERT INTO empleados(idempleado,nomempleado,apeempleado,cargempleado,dirempleado,telempleado,especialidad,nitveterinaria) VALUES(59,'Anyela','Tez','Cirug?a','calle 50 No 25A-30',87654309,'Cirug?a',5050);
INSERT INTO empleados(idempleado,nomempleado,apeempleado,cargempleado,dirempleado,telempleado,especialidad,nitveterinaria) VALUES(60,'Mayerly','Sanchez','Medicina Interna','calle 28 No 25A-31',909870087,'Medicina Interna',5050);

--importar
copy empleados from'C:\bd1\empleados.csv'(delimiter ',' , formart 'csv', encoding 'UTF- 8');

SELECT idempleado,nomempleado,apeempleado,cargempleado FROM empleados;



--====================================================================================
---DATOS SERVICIOS
--====================================================================================

INSERT INTO servicios(idservicios,tiposervicio,tiemposervicio,costoservicio,nitveterinaria)
VALUES
(1,'ESTERILIZACION','03:00:00', 3000000, 5050),
(2,'ESTERILIZACION','03:00:00', 3000000, 5050),
(3,'ESTERILIZACION','03:00:00', 30000, 5050, ),
(4,'ESTERILIZACION','03:00:00', 500000, 5050, ),
(5,'OPERACION','03:00:00', 500000, 5050, ),
(6,'OPERACION','03:00:00', 500000, 5050, ),
(7,'OPERACION','03:00:00', 500000, 5050, ),
(8,'OPERACION','03:00:00', 500000, 5050, ),
(9,'OPERACION','03:00:00', 500000, 5050, ),
(10,'OPERACION','03:00:00', 500000, 5050, );
INSERT INTO servicio(idservicio, tiposervicio, tiemposervicio, costoservicio, veterinaria) VALUES (11, 'VIP', 60 , 50000, 5050);
INSERT INTO servicio(idservicio, tiposervicio, tiemposervicio, costoservicio, veterinaria) VALUES (12, 'VIP1', 75, 51000, 5050);
INSERT INTO servicio(idservicio, tiposervicio, tiemposervicio, costoservicio, veterinaria) VALUES (13, 'economico', 15, 10000, 5050);
INSERT INTO servicio(idservicio, tiposervicio, tiemposervicio, costoservicio, veterinaria) VALUES (14, 'Premium', 120, 100000, 5050);
INSERT INTO servicio(idservicio, tiposervicio, tiemposervicio, costoservicio, veterinaria) VALUES (15, 'Premium1', 120, 110000, 5050);
INSERT INTO servicio(idservicio, tiposervicio, tiemposervicio, costoservicio, veterinaria) VALUES (16, 'Premium2', 120, 120000,5050);
INSERT INTO servicio(idservicio, tiposervicio, tiemposervicio, costoservicio, veterinaria) VALUES (17, 'VIP2', 120, 52000, 5050);
INSERT INTO servicio(idservicio, tiposervicio, tiemposervicio, costoservicio, veterinaria) VALUES (18, 'economico1', 30, 11000, 5050);
INSERT INTO servicio(idservicio, tiposervicio, tiemposervicio, costoservicio, veterinaria) VALUES (19, 'economico2', 45, 12000, 5050);
INSERT INTO servicio(idservicio, tiposervicio, tiemposervicio, costoservicio, veterinaria) VALUES (20, 'economico2', 45, 12000, 5050);
INSERT INTO servicio(idservicio,tiposervicio,tiemposervicio,costoservicio,veterinaria)
VALUES(41,'peluqueria',4,10000,5050);

INSERT INTO servicio(idservicio,tiposervicio,tiemposervicio,costoservicio,veterinaria)
VALUES(42,'ecografia',8,12000,5050);

INSERT INTO servicio(idservicio,tiposervicio,tiemposervicio,costoservicio,veterinaria)
VALUES(43,'radiologia digital',6,14000,5050);

INSERT INTO servicio(idservicio,tiposervicio,tiemposervicio,costoservicio,veterinaria)
VALUES(44,'oftamologia',4,16000,5050);

INSERT INTO servicio(idservicio,tiposervicio,tiemposervicio,costoservicio,veterinaria)
VALUES(45,'cirujia tejidos',5,18000,5050);

INSERT INTO servicio(idservicio,tiposervicio,tiemposervicio,costoservicio,veterinaria)
VALUES(46,'cirujia laser',4,20000,5050);

INSERT INTO servicio(idservicio,tiposervicio,tiemposervicio,costoservicio,veterinaria)
VALUES(47,'dermatologia',2,22000,5050);

INSERT INTO servicio(idservicio,tiposervicio,tiemposervicio,costoservicio,veterinaria)
VALUES(48,'reproduccion',4,24000,5050);

INSERT INTO servicio(idservicio,tiposervicio,tiemposervicio,costoservicio,veterinaria)
VALUES(49,'medicina felina',2,26000,5050);

INSERT INTO servicio(idservicio,tiposervicio,tiemposervicio,costoservicio,veterinaria)
VALUES(50,'guarderia',12,28000,5050);

INSERT INTO servicios(idservicio,tiposervicio,tiemposervicio,costoservicio,nitveterinaria)
VALUES
(21,'esterilizacion','02',300000,5050),
(22,'Estetica','02',50000,5050),
(23,'Imagenologia','02',200000,5050),
(24,'esterilizacion','02',300000,5050),
(25,'Imagenologia','02',200000,5050),
(26,'Cirugia','02',500000,5050),
(27,'esterilizacion','02',300000,5050),
(28,'Imagenologia','02',200000,5050),
(29,'esterilizacion','02',300000,5050),
(30,'Imagenologia','02',200000,5050);

INSERT INTO servicio(idservicio,tiposervicio,tiemposervicio,costoservicio) VALUES(51,'Medicina Preventiva',51,51000);
INSERT INTO servicio(idservicio,tiposervicio,tiemposervicio,costoservicio) VALUES(52,'Medicina Interna',52,52000);
INSERT INTO servicio(idservicio,tiposervicio,tiemposervicio,costoservicio) VALUES(53,'Consulta',53,53000);
INSERT INTO servicio(idservicio,tiposervicio,tiemposervicio,costoservicio) VALUES(54,'Cirugia',54,54000);
INSERT INTO servicio(idservicio,tiposervicio,tiemposervicio,costoservicio) VALUES(55,'Imagenolog?a',55,55000);
INSERT INTO servicio(idservicio,tiposervicio,tiemposervicio,costoservicio) VALUES(56,'Etolog?a',56,56000);
INSERT INTO servicio(idservicio,tiposervicio,tiemposervicio,costoservicio) VALUES(57,'An?lisis cl?nico',57,57000);
INSERT INTO servicio(idservicio,tiposervicio,tiemposervicio,costoservicio) VALUES(58,'Venta de Alimentos',58,58000);
INSERT INTO servicio(idservicio,tiposervicio,tiemposervicio,costoservicio) VALUES(59,'vacunas',59,59000);
INSERT INTO servicio(idservicio,tiposervicio,tiemposervicio,costoservicio) VALUES(60,'Venta de Accesorios',60,60000);


--====================================================================================
---DATOS HSITORIA CLINICA 
--====================================================================================
INSERT INTO historiaclinica(codhistoriaclinica,idmascota,fechistoriaclinica,consulhistoriaclinica,trathistoriaclinica,medihistoriaclinica,diaghistoriaclinica,
pesohistoriaclinica,tamhistoriaclinica,salidahistoriaclinica)
VALUES
(1, 0001,'4/05/2020','ENFERMO', 'ENFERMO', 'ASPIRINA', 'CIEGO', '35K', 'MEDIANO','5/05/2020'),
(2, 0002,'4/05/2020','ENFERMO','ENFERMO', 'ASPIRINA', 'CIEGO', '35K', 'MEDIANO','5/05/2020'),
(3, 0003,'4/05/2020','ENFERMO','AUXILIAR', 'ASPIRINA', 'CIEGO', '35K', 'MEDIANO','5/05/2020'),
(4, 0004,'4/05/2020','ENFERMO', 'AUXILIAR', 'ASPIRINA', 'CIEGO', '35K', 'MEDIANO','5/05/2020'),
(5, 0005,'4/05/2020','ENFERMO', 'AUXILIAR', 'ASPIRINA', 'CIEGO', '35K', 'MEDIANO','5/05/2020'),
(6, 0006,'4/05/2020','ENFERMO', 'AUXILIAR', 'ASPIRINA', 'CIEGO', '35K', 'MEDIANO','5/05/2020'),
(7, 0007,'4/05/2020','ENFERMO', 'AUXILIAR', 'ASPIRINA', 'DOLOR ESTOMAGO', '35K', 'MEDIANO','5/05/2020'),
(8, 0008,'4/05/2020','ENFERMO', 'AUXILIAR', 'ASPIRINA', 'DOLOR ESTOMAGO', '35K', 'MEDIANO','5/05/2020'),
(9, 0009,'4/05/2020','ENFERMO', 'AUXILIAR', 'ASPIRINA', 'DOLOR ESTOMAGO', '35K', 'MEDIANO','5/05/2020'),
(10, 0010,'4/05/2020','ENFERMO', 'AUXILIAR', 'ASPIRINA', 'DOLOR ESTOMAGO', '35K', 'MEDIANO','5/05/2020');

INSERT INTO historiaclinica(codhc, fechaconsuhc, consultahc, tratamientohc, medicacionhc, diagnosticohc, pesohc, tama?ohc, fechasalida, mascota ) VALUES (11, '17/12/2019', 'rotura ligamento cruzado', 'tratamiento quir?rgico', 'Ninguno', 'necesita un tratamiento quir?rgico ', 25, 55, '17/12/2019', 11);
INSERT INTO historiaclinica(codhc, fechaconsuhc, consultahc, tratamientohc, medicacionhc, diagnosticohc, pesohc, tama?ohc, fechasalida, mascota  ) VALUES (12, '18/12/2019', 'Falta de apetito', 'tratamiento alimenticio', 'Ninguno', 'estomago debil', 20, 50, '18/12/2019', 12);
INSERT INTO historiaclinica(codhc, fechaconsuhc, consultahc, tratamientohc, medicacionhc, diagnosticohc, pesohc, tama?ohc, fechasalida, mascota  ) VALUES (13, '19/12/2019', 'estado de animo', 'tratamiento basico', 'Ninguno', 'falta de atencion ', 27, 50, '19/12/2019', 13);
INSERT INTO historiaclinica(codhc, fechaconsuhc, consultahc, tratamientohc, medicacionhc, diagnosticohc, pesohc, tama?ohc, fechasalida, mascota  ) VALUES (14, '20/12/2019', 'estado de animo', 'tratamiento basico', 'Ninguno', 'falta de atencion ', 10, 30, '20/12/2019', 14);
INSERT INTO historiaclinica(codhc, fechaconsuhc, consultahc, tratamientohc, medicacionhc, diagnosticohc, pesohc, tama?ohc, fechasalida, mascota  ) VALUES (15, '21/12/2019', 'rotura ligamento', 'tratamiento quir?rgico', 'Ninguno', 'tratamiento quir?rgico ', 28, 57, '21/12/2019', 15);
INSERT INTO historiaclinica(codhc, fechaconsuhc, consultahc, tratamientohc, medicacionhc, diagnosticohc, pesohc, tama?ohc, fechasalida, mascota  ) VALUES (16, '21/12/2019', 'obstruccion garganta', 'tratamiento cirugia', 'vitaminas', 'inflamcion garganta', 24, '52', '22/12/2019',16);
INSERT INTO historiaclinica(codhc, fechaconsuhc, consultahc, tratamientohc, medicacionhc, diagnosticohc, pesohc, tama?ohc, fechasalida, mascota  ) VALUES (17, '22/12/2019', 'rabia', 'ninguno ', 'vacuna', 'falta de sus vacunas', 20, 55, '22/12/2019',17);
INSERT INTO historiaclinica(codhc, fechaconsuhc, consultahc, tratamientohc, medicacionhc, diagnosticohc, pesohc, tama?ohc, fechasalida, mascota  ) VALUES (18, '23/12/2019', 'alergia', 'ninguno ', 'vitaminas', 'falta de vitaminas', 15, 50, '23/12/2019', 18);
INSERT INTO historiaclinica(codhc, fechaconsuhc, consultahc, tratamientohc, medicacionhc, diagnosticohc, pesohc, tama?ohc, fechasalida, mascota  ) VALUES (19, '24/12/2019', 'epilepsia canina', 'ninguno ', 'farmaco', 'ataque epilecticos', 28, 56, '25/12/2019', 19);
INSERT INTO historiaclinica(codhc, fechaconsuhc, consultahc, tratamientohc, medicacionhc, diagnosticohc, pesohc, tama?ohc, fechasalida, mascota  ) VALUES (20, '25/12/2019', 'epilepsia canina', ' ninguno', 'farmaco', 'ataque epilecticos', 30, 50, '27/12/2019', 20);
INSERT INTO historiaclinica(codhc,fechaconsuhc,consultahc,tratamientohc,medicacionhc,diagnosticohc,pesohc,tama?ohc,fechasalida,mascota)
VALUES(11458,'12/02/2020','dolor cabeza','ibuprofeno animal','ibuprofeno animal','bueno',5,125,'13/02/2020',4114);

INSERT INTO historiaclinica(codhc,fechaconsuhc,consultahc,tratamientohc,medicacionhc,diagnosticohc,pesohc,tama?ohc,fechasalida,mascota)
VALUES(11460,'24/03/2020','fastidio comer','lavado gastrico','lavado gastrico','grave',9,60,'25/03/2020',4224);

INSERT INTO historiaclinica(codhc,fechaconsuhc,consultahc,tratamientohc,medicacionhc,diagnosticohc,pesohc,tama?ohc,fechasalida,mascota)
VALUES(11462,'19/05/2019','diarrea','pastas antidiarreicas','pastas antidiarreicas','leve',4,95,'29/05/2019',4334);

INSERT INTO historiaclinica(codhc,fechaconsuhc,consultahc,tratamientohc,medicacionhc,diagnosticohc,pesohc,tama?ohc,fechasalida,mascota)
VALUES(11464,'25/01/2020','vomito','lavado gastrico','lavado gastrico','normal',5,84,'26/01/2020',4444);

INSERT INTO historiaclinica(codhc,fechaconsuhc,consultahc,tratamientohc,medicacionhc,diagnosticohc,pesohc,tama?ohc,fechasalida,mascota)
VALUES(11466,'13/05/2019','extre?imiento','revision,'ninguno','bueno',8,69,'14/05/2019',4554);

INSERT INTO historiaclinica(codhc,fechaconsuhc,consultahc,tratamientohc,medicacionhc,diagnosticohc,pesohc,tama?ohc,fechasalida,mascota)
VALUES(11468,'12/07/2019','dolor cabeza','ibuprofeno animal','ibuprofeno animal','grave',9,60,'13/07/2019',4664);

INSERT INTO historiaclinica(codhc,fechaconsuhc,consultahc,tratamientohc,medicacionhc,diagnosticohc,pesohc,tama?ohc,fechasalida,mascota)
VALUES(11470,'29/01/2020','fastidio comer','lavado gastrico','lavado gastrico','leve',7,51,'30/01/2020',4774);

INSERT INTO historiaclinica(codhc,fechaconsuhc,consultahc,tratamientohc,medicacionhc,diagnosticohc,pesohc,tama?ohc,fechasalida,mascota)
VALUES(11472,'18/11/2019','diarrea','pastas antidiarreicas','pastas antidiarreicas','normal',4,42,'19/11/2019',4884);

INSERT INTO historiaclinica(codhc,fechaconsuhc,consultahc,tratamientohc,medicacionhc,diagnosticohc,pesohc,tama?ohc,fechasalida,mascota)
VALUES(11474,'14/06/2019','vomito','lavado gastrico','lavado gastrico','bueno',6,33,'15/06/2019',4994);

INSERT INTO historiaclinica(codhc,fechaconsuhc,consultahc,tratamientohc,medicacionhc,diagnosticohc,pesohc,tama?ohc,fechasalida,mascota)
VALUES(11476,'21/01/2020','extre?imiento','revision','ninguno','grave',4,25,'22/01/2020',5104);

INSERT INTO historiaclinica(codhc,fechaconsuhc,consultahc,tratamientohc,medicacionhc,diagnosticohc,pesohc,tama?ohc,fechasalida,mascota)
VALUES(11478,'27/11/2019','dolor cabeza',ibuprofeno animal','ibuprofeno animal','leve',5,16,'28/11/2019',5214);

INSERT INTO historiaclinica(codhc,fechaconsuhc,consultahc,tratamientohc,medicacionhc,diagnosticohc,fechasalida,idmascota)
VALUES
(21,'2020-01-22','Cirugia','cono en el cuello','ibuprofeno animal','fractura','2020-01-22',21),
(22,'2020-02-15','esterilizacion','cono en el cuello','ibuprofeno animal','esterilizacion','2020-02-15',22),
(23,'2020-03-12','Imagenologia','reposo','laxante','llenura','2020-03-12',23),
(24,'2020-04-11','Cirugia','vendajes','ibuprofeno animal','fractura','2020-04-11',24),
(25,'2020-05-12','Imagenologia','reposo','relajante muscular','golpe','2020-05-12',25),
(26,'2020-06-22','esterilizacion','cono en el cuello','ibuprofeno animal','esterilizacion','2020-06-22',26),
(27,'2020-07-22','Cirugia','cono en el cuello','ibuprofeno animal','fractura','2020-07-22',27),
(28,'2020-08-08','Cirugia','cono en el cuello','ibuprofeno animal','fractura','2020-08-22',28),
(29,'2020-09-22','Imagenologia','cono en el cuello','ibuprofeno animal','emoragia','2020-09-22',29),
(30,'2020-10-30','Cirugia','cono en el cuello','ibuprofeno animal','fractura','2020-10-22',30);


INSERT INTO historiaclinica(codhc,fechaconsuhc,consultahc,tratamientohc,medicacionhc,diagnosticohc,pesohc,tama?ohc,fechasalida,mascota) VALUES(51,'06/05/2020',' ESTERILIZACI?N',' evitar tener cachorros','Reposo','Diagn?stico Estrat?gico',11,20,'15/05/2020',51);
INSERT INTO historiaclinica(codhc,fechaconsuhc,consultahc,tratamientohc,medicacionhc,diagnosticohc,pesohc,tama?ohc,fechasalida,mascota) VALUES(52,'07/05/2020',' Cirugia',' tratamiento para evitar enfermedades','terapia','Diagn?stico Interno',15,23,'16/05/2020',52);
INSERT INTO historiaclinica(codhc,fechaconsuhc,consultahc,tratamientohc,medicacionhc,diagnosticohc,pesohc,tama?ohc,fechasalida,mascota) VALUES(53,'08/06/2020',' Imagenolog?a',' Detecci?n de anomalias','terapia','Diagn?stico Externo',7,26,'17/06/2020',53);
INSERT INTO historiaclinica(codhc,fechaconsuhc,consultahc,tratamientohc,medicacionhc,diagnosticohc,pesohc,tama?ohc,fechasalida,mascota) VALUES(54,'09/06/2020',' vacunas',' evitar enfermedades','Medicamentos','Diagn?stico Interno',9,51,'18/06/2020',54);
INSERT INTO historiaclinica(codhc,fechaconsuhc,consultahc,tratamientohc,medicacionhc,diagnosticohc,pesohc,tama?ohc,fechasalida,mascota) VALUES(55,'10/07/2020',' Etolog?a',' tratamiento de terapia','Antibi?ticos','Diagn?stico Externo',11,29,'19/07/2020',55);
INSERT INTO historiaclinica(codhc,fechaconsuhc,consultahc,tratamientohc,medicacionhc,diagnosticohc,pesohc,tama?ohc,fechasalida,mascota) VALUES(56,'11/07/2020',' Est?tica',' tratamiento estetico','cuidado personal','Diagn?stico Externo',13,32,'20/07/2020',56);
INSERT INTO historiaclinica(codhc,fechaconsuhc,consultahc,tratamientohc,medicacionhc,diagnosticohc,pesohc,tama?ohc,fechasalida,mascota) VALUES(57,'12/08/2020',' Etolog?a',' tratamiento de terapia','Antibi?ticos','Diagn?stico Externo',15,35,'21/08/2020',57);
INSERT INTO historiaclinica(codhc,fechaconsuhc,consultahc,tratamientohc,medicacionhc,diagnosticohc,pesohc,tama?ohc,fechasalida,mascota) VALUES(58,'13/08/2020',' Cirugia',' tratamiento antienfermedades','Reposo','Diagn?stico Interno',17,38,'22/08/2020',58);
INSERT INTO historiaclinica(codhc,fechaconsuhc,consultahc,tratamientohc,medicacionhc,diagnosticohc,pesohc,tama?ohc,fechasalida,mascota) VALUES(59,'14/09/2020',' vacunas',' tratamiento de reposo','antibi?ticos','Diagn?stico Interno',19,41,'23/09/2020',59);
INSERT INTO historiaclinica(codhc,fechaconsuhc,consultahc,tratamientohc,medicacionhc,diagnosticohc,pesohc,tama?ohc,fechasalida,mascota) VALUES(60,'15/09/2020',' Imagenolog?a',' tratamiento procedimental para enfermedades','reposo','Diagn?stico Externo',21,44,'24/09/2020',60);


--====================================================================================
---DATOS MASCOTA
--====================================================================================

INSERT INTO mascota(idmascota,idpropietario,idPersona,nitveterinaria,nommascota,codhistoriamascota,razamascota,fechanacimascota,especmascota,sexmascota,colmascota)
VALUES

(1, 1111, 10578956,5050,'CANDY',0001, 'PITBULL', '5/05/2000', 'PERRO', 'MACHO', 'NEGRO'),
(2, 1111,10578956,5050,'CANDY',0002,'PITBULL', '5/05/2000', 'PERRO', 'MACHO', 'NEGRO'),
(4, 1111,10578956,5050,'CANDY',0004, 'PITBULL', '5/05/2000', 'PERRO', 'MACHO', 'NEGRO'),
(5, 1111,10578956,5050,'CANDY',0005, 'PITBULL', '5/05/2000', 'PERRO', 'MACHO', 'NEGRO'),
(6, 1111,10578956,5050,'CANDY',0006, 'PITBULL', '5/05/2000', 'PERRO','MACHO','NEGRO'),
(7, 1111,10578956,5050,'CANDY',0007, 'PITBULL', '5/05/2000', 'PERRO', 'MACHO', 'NEGRO'),
(8, 1111,10578956,5050,'CANDY',0008, 'PITBULL', '5/05/2000', 'PERRO', 'MACHO','NEGRO'),
(9, 1111,10578956,5050,'CANDY',0009, 'PITBULL', '5/05/2000', 'PERRO', 'MACHO', 'NEGRO'),
(10, 1111,10578956,5050,'CANDY',0010, 'PITBULL', '5/05/2000', 'PERRO', 'MACHO', 'NEGRO');
INSERT INTO mascotas(idmascota, nom_mascota, raza_mascota, fech_nacimiento_mascota , especie_mascota, sexo_mascota, color_mascota, propietario, veterinaria) VALUES (11, 'paco', 'pastor aleman' , '10/11/2017', 'perro', 'm', 'blanco', 11, 5050);
INSERT INTO mascotas(idmascota, nom_mascota, raza_mascota, fech_nacimiento_mascota , especie_mascota, sexo_mascota, color_mascota, propietario, veterinaria) VALUES (12, 'alf', 'pastor aleman' , '10/11/2016', 'perro', 'm', 'negro', 12, 5050);
INSERT INTO mascotas(idmascota, nom_mascota, raza_mascota, fech_nacimiento_mascota , especie_mascota, sexo_mascota, color_mascota, propietario, veterinaria) VALUES (13, 'loqui', 'labrador' , '8/6/2018', 'perro', 'm', 'cafe claro', 13, 5050);
INSERT INTO mascotas(idmascota, nom_mascota, raza_mascota, fech_nacimiento_mascota , especie_mascota, sexo_mascota, color_mascota, propietario, veterinaria) VALUES (14, 'copo', 'poodle' , '4/5/2017', 'perro', 'h', 'blanco', 14, 5050);
INSERT INTO mascotas(idmascota, nom_mascota, raza_mascota, fech_nacimiento_mascota , especie_mascota, sexo_mascota, color_mascota, propietario, veterinaria) VALUES (15, 'princesa', 'poodle' , '1/7/2018', 'perro', 'h', 'cafe claro', 15, 5050);
INSERT INTO mascotas(idmascota, nom_mascota, raza_mascota, fech_nacimiento_mascota , especie_mascota, sexo_mascota, color_mascota, propietario, veterinaria) VALUES (16, 'nieve', 'poodle' , '1/5/2019', 'perro', 'h', 'blanco', 16, 5050);
INSERT INTO mascotas(idmascota, nom_mascota, raza_mascota, fech_nacimiento_mascota , especie_mascota, sexo_mascota, color_mascota, propietario, veterinaria) VALUES (17, 'ares', 'husky' , '1/1/2018', 'perro', 'm', 'blanco', 17, 5050);
INSERT INTO mascotas(idmascota, nom_mascota, raza_mascota, fech_nacimiento_mascota , especie_mascota, sexo_mascota, color_mascota, propietario, veterinaria) VALUES (18, 'axel', 'galgo' , '11/9/2018', 'perro', 'm', 'blanco', 18, 5050);
INSERT INTO mascotas(idmascota, nom_mascota, raza_mascota, fech_nacimiento_mascota , especie_mascota, sexo_mascota, color_mascota, propietario, veterinaria) VALUES (19, 'mia', 'pomerania' , '10/1/2017', 'perro', 'h', 'blanco', 19, 5050);
INSERT INTO mascotas(idmascota, nom_mascota, raza_mascota, fech_nacimiento_mascota , especie_mascota, sexo_mascota, color_mascota, propietario, veterinaria) VALUES (20, 'boby', 'doberman' , '19/8/2017', 'perro', 'm', 'negro', 20, 5050);
INSERT INTO mascotas(idmascota,nom_mascota,raza_mascota,fech_nacimiento_mascota,especie_mascota,sexo_mascota,color_mascota,veterinaria,propietario,historiaclinica)
VALUES(4114,'manchas','angora','12/05/2019','gato','m','negro',5050,41114,11458);

INSERT INTO mascotas(idmascota,nom_mascota,raza_mascota,fech_nacimiento_mascota,especie_mascota,sexo_mascota,color_mascota,veterinaria,propietario,historiaclinica)
VALUES(4224,'sosa','pastor aleman','24/03/2019','perro','h','caf?',5050,42224,11460);

INSERT INTO mascotas(idmascota,nom_mascota,raza_mascota,fech_nacimiento_mascota,especie_mascota,sexo_mascota,color_mascota,veterinaria,propietario,historiaclinica)
VALUES(4334,'miss','persa','19/02/2019','gato','h','blanco',5050,43334,11462);

INSERT INTO mascotas(idmascota,nom_mascota,raza_mascota,fech_nacimiento_mascota,especie_mascota,sexo_mascota,color_mascota,veterinaria,propietario,historiaclinica)
VALUES(4444,'simon','bengala','17/08/2019','gato','m','marron',5050,44444,11464);

INSERT INTO mascotas(idmascota,nom_mascota,raza_mascota,fech_nacimiento_mascota,especie_mascota,sexo_mascota,color_mascota,veterinaria,propietario,historiaclinica)
VALUES(4554,'max','bulldog','15/03/2018','perro','m','amarillo',5050,45554,11466);

INSERT INTO mascotas(idmascota,nom_mascota,raza_mascota,fech_nacimiento_mascota,especie_mascota,sexo_mascota,color_mascota,veterinaria,propietario,historiaclinica)
VALUES(4664,'pancha','siames','12/05/2019','gato','h','negro',5050,46664,11468);

INSERT INTO mascotas(idmascota,nom_mascota,raza_mascota,fech_nacimiento_mascota,especie_mascota,sexo_mascota,color_mascota,veterinaria,propietario,historiaclinica)
VALUES(4774,'karla','beagle','24/03/2019','perro','h','caf?',5050,47774,11470);

INSERT INTO mascotas(idmascota,nom_mascota,raza_mascota,fech_nacimiento_mascota,especie_mascota,sexo_mascota,color_mascota,veterinaria,propietario,historiaclinica)
VALUES(4884,'pacho','persa','19/02/2019','gato','m','blanco',5050,48884,11472);

INSERT INTO mascotas(idmascota,nom_mascota,raza_mascota,fech_nacimiento_mascota,especie_mascota,sexo_mascota,color_mascota,veterinaria,propietario,historiaclinica)
VALUES(4994,'zeus','pug','17/08/2019','perro','m','marron',5050,49994,11474);

INSERT INTO mascotas(idmascota,nom_mascota,raza_mascota,fech_nacimiento_mascota,especie_mascota,sexo_mascota,color_mascota,veterinaria,propietario,historiaclinica)
VALUES(5104,'jonasa','angora','15/03/2018','gato','h','amarillo',5050,51104,11476);

INSERT INTO mascotas
(idmascota,nom_mascota,especie_mascota,raza_mascota,sexo_mascota,color_mascota,tama?o_mascota,peso_mascota,fech_nacimiento_mascota,nitveterinaria,idpropietario)
VALUES
(21,'FIDO','perro','pastor aleman','M','plateado con negro',40,20,'2020-01-12',123456789,21),
(22,'MANOLO','gato','bengala','M','negro y cafe',20,10,'2020-02-18',123456789,22),
(23,'PICACHU','hamster','ruso','M','plateado',5,1,'2019-12-25',123456789,23),
(24,'RODO','loro','cariamarillo','M','amarillo con azul',20,3,'2020-01-12',123456789,24),
(25,'BONY','perro','Jack Russell terrier','E','blanco con cafe',30,30,'2018-01-10',123456789,25),
(26,'PACO','gato','maine coon','M','plateado gris y negro',20,15,'2018-02-18',123456789,26),
(27,'PICHU','hamster','ruso','M','plateado',5,1,'2019-12-25',123456789,23),
(28,'RINA','loro','Lori Arcoiris','E','multicolor',15,2,'2020-01-12',123456789,28),
(29,'PITA','perro','chow chow','E','negro',30,32,'2020-01-12',123456789,29),
(30,'pepe','gato','europeo de pelo corto','M','negro y blano',20,15,'2020-02-18',123456789,30);

INSERT INTO mascotas(idmascota,nom_mascota,raza_mascota,fech_nacimiento_mascota,especie_mascota,sexo_mascota,color_mascota,veterinaria,propietario,codhclinica) VALUES(51,'Max',' bulldog','06/05/2019 ','perro','M','Negro',5050,51,51);
INSERT INTO mascotas(idmascota,nom_mascota,raza_mascota,fech_nacimiento_mascota,especie_mascota,sexo_mascota,color_mascota,veterinaria,propietario,codhclinica) VALUES(52,'Bruno',' persa','10/06/2019 ','Gato','F','Cafe',5050,52,52);
INSERT INTO mascotas(idmascota,nom_mascota,raza_mascota,fech_nacimiento_mascota,especie_mascota,sexo_mascota,color_mascota,veterinaria,propietario,codhclinica) VALUES(53,'Tarzan',' Coon','14/08/2019 ','Gato','M','Blanco',5050,53,53);
INSERT INTO mascotas(idmascota,nom_mascota,raza_mascota,fech_nacimiento_mascota,especie_mascota,sexo_mascota,color_mascota,veterinaria,propietario,codhclinica) VALUES(54,'Zeus',' siam?s','17/10/2019 ','Gato','F','Gris',5050,54,54);
INSERT INTO mascotas(idmascota,nom_mascota,raza_mascota,fech_nacimiento_mascota,especie_mascota,sexo_mascota,color_mascota,veterinaria,propietario,codhclinica) VALUES(55,'Sult?n',' persa','20/01/2019 ','Gato','M','Tomate',5050,55,55);
INSERT INTO mascotas(idmascota,nom_mascota,raza_mascota,fech_nacimiento_mascota,especie_mascota,sexo_mascota,color_mascota,veterinaria,propietario,codhclinica) VALUES(56,'Lucas',' Boxer','24/09/2019 ','perro','F','Cafe',5050,56,56);
INSERT INTO mascotas(idmascota,nom_mascota,raza_mascota,fech_nacimiento_mascota,especie_mascota,sexo_mascota,color_mascota,veterinaria,propietario,codhclinica) VALUES(57,'Nieve',' cochin','27/07/2019 ','Gallina','M','Azul',5050,57,57);
INSERT INTO mascotas(idmascota,nom_mascota,raza_mascota,fech_nacimiento_mascota,especie_mascota,sexo_mascota,color_mascota,veterinaria,propietario,codhclinica) VALUES(58,'Rex',' Brahma','30/11/2019 ','Gallina','F','Blanco',5050,58,58);
INSERT INTO mascotas(idmascota,nom_mascota,raza_mascota,fech_nacimiento_mascota,especie_mascota,sexo_mascota,color_mascota,veterinaria,propietario,codhclinica) VALUES(59,'Lucky',' Labrador','01/12/2019 ','perro','M','Negro',5050,59,59);
INSERT INTO mascotas(idmascota,nom_mascota,raza_mascota,fech_nacimiento_mascota,especie_mascota,sexo_mascota,color_mascota,veterinaria,propietario,codhclinica) VALUES(60,'Lucifer',' Boxer','04/02/2019 ','perro','F','Gris',5050,60,60);


--====================================================================================
---DATOS PROPIETARIO
--====================================================================================
INSERT INTO propietario(idpropietario,nom_propietario,apell_propietario,genero_propietario,dire_propietario,telpropietario)
VALUES

(1,'CAMILO','ROSERO', 'MASCULINO', 'carera 25 #4-25', '315875325'),
(2,'ALFONSO','ROSERO', 'MASCULINO', 'carera 25 #4-25', '315875325'),
(3,'ANDRES','NARVAEZ','MASCULINO', 'carera 56 #4-25', '315875325'),
(4,'BENITO','POTOSI', 'MASCULINO', 'carera 89 #4-25', '315875325'),
(5,'LUCAS','MU?EZ', 'MASCULINO', 'carera 9 #4-25', '315875325'),
(6,'MATEO','LOPEZ', 'MASCULINO', 'carera 32 #4-25', '315875325'),
(7,'JUAN','LOPEZ', 'MASCULINO', 'carera 25 #4-25', '315875325'),
(8,'BERNARDO','MORENO', 'MASCULINO', 'carera 21 #4-25', '315875325'),
(9,'MARIA','MORENO', 'MASCULINO', 'carera 21 #4-25', '315875325'),
(10,'MARCELA','MORENO', 'MASCULINO', 'carera 12 #4-25', '315875325');
INSERT INTO propietario(idpropietario, nom_propietario, apell_propietario, genero_propietario, dire_propietario, telpropietario) VALUES (11, 'Carlos', 'Charfuelan', 'm', 'calle20 21-3', 71234327);
INSERT INTO propietario(idpropietario, nom_propietario, apell_propietario, genero_propietario, dire_propietario, telpropietario) VALUES (12, 'Daniel', 'Luna', 'm', 'calle2 2-13', 71884327);
INSERT INTO propietario(idpropietario, nom_propietario, apell_propietario, genero_propietario, dire_propietario, telpropietario) VALUES (13, 'valentina', 'Rios', 'f', 'calle12 23-1', 70884327);
INSERT INTO propietario(idpropietario, nom_propietario, apell_propietario, genero_propietario, dire_propietario, telpropietario) VALUES (14, 'valeria', 'ortiz', 'f', 'calle2 3-1', 75484327);
INSERT INTO propietario(idpropietario, nom_propietario, apell_propietario, genero_propietario, dire_propietario, telpropietario) VALUES (15, 'felipe', 'molina', 'm', 'calle6 8-1', 70384327);
INSERT INTO propietario(idpropietario, nom_propietario, apell_propietario, genero_propietario, dire_propietario, telpropietario) VALUES (16, 'Anderson', 'morales', 'm', 'calle1 8-13', 70381217);
INSERT INTO propietario(idpropietario, nom_propietario, apell_propietario, genero_propietario, dire_propietario, telpropietario) VALUES (17, 'Camilo', 'silva', 'm', 'calle11 3-3', 77781212);
INSERT INTO propietario(idpropietario, nom_propietario, apell_propietario, genero_propietario, dire_propietario, telpropietario) VALUES (18, 'Julieta', 'Aguirre', 'f', 'calle12 13-3', 71781212);
INSERT INTO propietario(idpropietario, nom_propietario, apell_propietario, genero_propietario, dire_propietario, telpropietario) VALUES (19, 'Luis', 'Burbano', 'm', 'calle10 19-4', 74381212);
INSERT INTO propietario(idpropietario, nom_propietario, apell_propietario, genero_propietario, dire_propietario, telpropietario) VALUES (20, 'Juan', 'Paz', 'm', 'calle8 1-14', 78781212);
INSERT INTO propietario(idpropietario,nom_propietario,apell_propietario,genero_propietario,dire_propietario,telpropietario)
VALUES(41114,'leonor','cuastusa','f','crra14 #17-02',745485);

INSERT INTO propietario(idpropietario,nom_propietario,apell_propietario,genero_propietario,dire_propietario,telpropietario)
VALUES(42224,'vanessa','hurtado','f','crra15 #16-48',745486);

INSERT INTO propietario(idpropietario,nom_propietario,apell_propietario,genero_propietario,dire_propietario,telpropietario)
VALUES(43334,'diana','arias','f','crra14 #17-03	745487);

INSERT INTO propietario(idpropietario,nom_propietario,apell_propietario,genero_propietario,dire_propietario,telpropietario)
VALUES(44444,'juan','aroca','m','crra15 #16-49',745488);

INSERT INTO propietario(idpropietario,nom_propietario,apell_propietario,genero_propietario,dire_propietario,telpropietario)
VALUES(45554,'fernanda','bola?os','f','crra14 #17-04',745489);

INSERT INTO propietario(idpropietario,nom_propietario,apell_propietario,genero_propietario,dire_propietario,telpropietario)
VALUES(46664,'hernando','vallejos','m','crra15 #16-50',745490);

INSERT INTO propietario(idpropietario,nom_propietario,apell_propietario,genero_propietario,dire_propietario,telpropietario)
VALUES(47774,'arturo','cuastusa','m','crra14 #17-05',745491);


INSERT INTO propietario(idpropietario,nom_propietario,apell_propietario,genero_propietario,dire_propietario,telpropietario)
VALUES(48884,'luis','hurtado','m','crra15 #16-51',745492);


INSERT INTO propietario(idpropietario,nom_propietario,apell_propietario,genero_propietario,dire_propietario,telpropietario)
VALUES(49994,'emilio','arias','m','crra14 #17-06',745493);

INSERT INTO propietario(idpropietario,nom_propietario,apell_propietario,genero_propietario,dire_propietario,telpropietario)
VALUES(51104,'carmen','aroca','f','crra15 #16-52',745494);

INSERT INTO propietarios(idpropietario,nom_propietario,apell_propietario,genero_propietario,dire_propietario,telpropietario)
VALUES
(21, 'CARLOS','CORDOBA','M','carrera 25 #23-89',7589845),
(22, 'ANDRES','CORDOBA','M','carrera 25 #23-89',7589845),
(23, 'ALEX','CORDOBA','M','carrera 25 #23-89',7589845),
(24, 'DANIEL','CORDOBA','M','carrera 25 #23-89',7589845),
(25, 'NOHEMY','CORDOBA','F','carrera 25 #23-89',7589845),
(26, 'JOSE','CORDOBA','M','carrera 25 #23-89',7589845),
(27, 'WILLIAM','CORDOBA','M','carrera 25 #23-89',7589845),
(28, 'JAVIER','CORDOBA','M','carrera 25 #23-89',7589845),
(29, 'LEIDY','CORDOBA','F','carrera 25 #23-89',7589845),
(30, 'MAURICIO','CORDOBA','M','carrera 25 #23-89',7589845);

INSERT INTO propietario(idpropietario,nom_propietario,apell_propietario,genero_propietario,dire_propietario,telpropietario) VALUES(51,'Marlon',' Quenoran','M','Calle 16A Nro 16-70',765643338);
INSERT INTO propietario(idpropietario,nom_propietario,apell_propietario,genero_propietario,dire_propietario,telpropietario) VALUES(52,'Alex',' Rodr?gues','M','Calle 19B Nro 11-30',865465342);
INSERT INTO propietario(idpropietario,nom_propietario,apell_propietario,genero_propietario,dire_propietario,telpropietario) VALUES(53,'Estiven',' Gonz?les','M','Calle 21 Nro 17-32',99765443);
INSERT INTO propietario(idpropietario,nom_propietario,apell_propietario,genero_propietario,dire_propietario,telpropietario) VALUES(54,'Jhonatan',' P?rez','M','Calle 24 Nro 19-04',543243218);
INSERT INTO propietario(idpropietario,nom_propietario,apell_propietario,genero_propietario,dire_propietario,telpropietario) VALUES(55,'Luis',' G?mez','M','Calle 16A Nro 22-15',356678098);
INSERT INTO propietario(idpropietario,nom_propietario,apell_propietario,genero_propietario,dire_propietario,telpropietario) VALUES(56,'Felipe',' Mart?nes','M','Calle 25 Nro 21-54',09879543);
INSERT INTO propietario(idpropietario,nom_propietario,apell_propietario,genero_propietario,dire_propietario,telpropietario) VALUES(57,'Yeison',' Zambrano','M','Calle 27 Nro 12-45',654334237);
INSERT INTO propietario(idpropietario,nom_propietario,apell_propietario,genero_propietario,dire_propietario,telpropietario) VALUES(58,'Amanda',' Ortega','F','Calle 11B Nro 47-73',544345768);
INSERT INTO propietario(idpropietario,nom_propietario,apell_propietario,genero_propietario,dire_propietario,telpropietario) VALUES(59,'Franci',' Chazatar','F','Calle 30A Nro 14-61',878898966);
INSERT INTO propietario(idpropietario,nom_propietario,apell_propietario,genero_propietario,dire_propietario,telpropietario) VALUES(60,'Leidy',' Torres','F','Calle 17 Nro 30-17',313446885);

