/* Debe que ordenar las tablas que NO TIENE RELACIÓN */
/* Primero creamos tablas libres de relaciones(tóxicas jaja) */
CREATE TABLE users(
	id int(255) auto_increment not null,
	name varchar(250) not null,
	surname varchar(250) not null,
	email varchar(250) not null,
	password varchar(250) not null,
	created_at date not null,
	updated_at date not null,
	CONSTRAINT pk_users PRIMARY KEY(id),
	CONSTRAINT uq_email UNIQUE(email)
)ENGINE=InnoDb;

CREATE TABLE categories(
	id int(255) auto_increment not null,
	name varchar(120),
	created_at date,
	updated_at date,
	CONSTRAINT pk_categories PRIMARY KEY(id)
)ENGINE=InnoDb;

CREATE TABLE blogs(
	id int(255) auto_increment not null,
	user_id int(255) not null,
	category_id int(255) not null,
	title varchar(150) not null,
	content MEDIUMTEXT,
	created_at date not null,
	updated_at date not null,
	CONSTRAINT pk_blogs PRIMARY KEY(id),
	CONSTRAINT fk_blogs_user FOREIGN KEY(user_id) REFERENCES users(id),
	CONSTRAINT fk_category FOREIGN KEY(category_id) REFERENCES categories(id) ON DELETE CASCADE SET NULL
)ENGINE=InnoDb;


/* Insertar nuevos registros */
INSERT INTO users VALUES(null,'Joey','Wheleer','joey@joey.com','hola123','2020-09-01','2020-09-02');
INSERT INTO users VALUES(null,'Seto','Kaiba','kaiba@kaiba.com','hola123','2020-09-01','2020-09-02');
INSERT INTO users VALUES(null,'Yugi','Muto','muto@muto.com','hola123','2020-09-01','2020-09-02');
INSERT INTO users VALUES(null,'Daniel','Go','dany@dany.com','hola123','2020-10-05','2020-12-22');

/* Insertar filas solo con ciertas columnas */
INSERT INTO users('email','password') VALUES('hola@hola.com','hola523'); 
INSERT INTO categories(name) VALUES('botella');

/* Mostrar todos los resultados */
SELECT * FROM users;
SELECT name FROM users;
SELECT name, surname,email FROM users;


/* AVANZADA */
SELECT name FROM users WHERE email='seto@seto.com';

/*Operadores Aritmeticos*/
SELECT name,(5*6) FROM users;
SELECT name as 'nombres' FROM users;
SELECT id,name FROM users ORDER BY id ASC;
SELECT id,name FROM users ORDER BY id DESC;

/* FUNCIONES MATEMÁTICAS */
SELECT ABS(7) AS 'OPERACIÓN' FROM users; #Valor Absoluto
SELECT CEIL(7.36) AS 'OPERACIÓN' FROM users; #Redondeo ALTO
SELECT FLOOR(7.36) AS 'OPERACIÓN' FROM users; #Redondeo BAJO
SELECT RAND() AS 'OPERACIÓN' FROM users; # Funciòn Aleatoria
SELECT ROUND(7.91,1) AS 'OPERACIÓN' FROM users; #Quitar decimal
SELECT TRUNCATE(8.506,2) AS 'OPERACIÓN' FROM users; #Truncar

/* FUNCIONES PARA CARÁCTERES */
SELECT UPPER(name) FROM users; #Poner Mayúsculas
SELECT LOWER(name) FROM users; #Poner Minúsculas
SELECT CONCAT(name,' ',surname) AS 'Nombre Completo' from users; #Concatenar
SELECT UPPER(CONCAT(name,' ',surname)) AS 'Nombre Completo' from users; #Concatenar los carácteres y con mayñusculas
SELECT LENGTH(CONCAT(name,' ',surname)) AS 'Nombre Completo' from users; #Longitud de caracteres
SELECT TRIM(CONCAT('   ',name,'     ','   ',surname)) AS 'NOMBRE COMPLETO' FROM users; #Quitar Espacios

/* Funciones para las fechas */
SELECT email,creted_at, CURDATE() as 'Fecha Actual' FROM users; # Mostrar la fecha Actual
SELECT email, DATEDIFF(created_at, CURDATE()) as 'Fecha Actual' FROM users; # Diferencia de Fechas(Calculando días)
SELECT email, DAYNAME(created_at) as 'Fecha Actual' FROM users; # Nombres de Días
SELECT email, DAYOFMONTH(created_at) as 'Fecha Actual' FROM users; # MES
SELECT email, DAYOFWEEK(created_at) as 'Fecha Actual' FROM users; # SEMANAS
SELECT email, DAYOFYEAR(created_at) as 'Fecha Actual' FROM users; # AÑOIS

SELECT email, MONTH(created_at) as 'Fecha Actual' FROM users;
SELECT email, MONTHNAME(created_at) as 'Fecha Actual' FROM users;

SELECT email, YEAR(created_at) as 'Fecha Actual' FROM users;

SELECT email, DAY(created_at) as 'Fecha Actual' FROM users;

SELECT email, HOUR(created_at) as 'Fecha Actual' FROM users;


SELECT email, CURTIME() as 'Fecha Actual' FROM users; # LA HORA ACTUAL
/* FORMATO AMERICANO */
SELECT email,DATE_FORMAT(created_at, "%d-%m-%Y") # Formato de la fecha sin nombres
SELECT email,DATE_FORMAT(created_at, "%D-%M-%Y") # Formato con NOMBRES de días, meses y año.

/* FUNCIONES GENERALES */
SELECT * from table;

SELECT email, ISNULL(surname) from users;
SELECT email, STRCMP('Hola','hola2') from users; # Mostrar la diferencia
SElECT version() from users;
SELECT user() from users;
SELECT  DISTINCT user() from users;
SELECT DISTINCT database() from users;
SELECT ifnull(name,'Este campo esta vacio') from categories;


/* CLAUSULA Y CONDICIONALES */
SELECT * from users WHERE email = "hola@gmail.com";

/* OPERADORES DE COMPARACION */
/**
	...
	Es distinto		!=
	Entre 			between A and B
	EN 				in
	Es nulo			is null
	No es nulo		is not null
	Como 			like
	no es Com 		not like
*/
# Operadores lógicos
/*
	Y 				AND
	O 				OR
	no  			NOT
*/
/*
	COMODINES
	cualquier cantidad de caracteres: 	%
	un caracter desconocido:			_
*/
SELECT * from users WHERE YEAR(created_at) = 2020;
 
 # Aquellos que no registraron en 2019
 SELECT * from users WHERE YEAR(created_at) != 2020 or isnull(created_at);

#Comodities
# Mostrar el email que contenga el apellido A
SElECT name, surname from users WHERE surname like 'A%' and password="hola123";