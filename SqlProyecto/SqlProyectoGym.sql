create database GimnasioUH
use GimnasioUH

create table Usuarios(

Id_usuario int identity(10000,1) primary key,
Email nvarchar(50)not null unique,
Clave nvarchar(10)not null,
Nombre nvarchar(50)not null,
Tipo nvarchar(10)
)

SELECT u.Email, u.Clave, U.nombre, U.Tipo FROM Usuarios u

insert into Usuarios (Email, Clave, Nombre, Tipo) values ('Andry@uh.ac.cr', '123', 'Andry', 'Admin')
insert into Usuarios (Email, Clave, Nombre, Tipo) values ('Marce@uh.ac.cr', '456', 'Marce', 'Regular')

--Procedimientos almacenados de Usuarios

create procedure ConsultaUsuarios
as 
	begin
		select * from Usuarios
end
	exec ConsultaUsuarios

create procedure BorrarUsuarios
@email nvarchar(50)
as 
	begin
		delete Usuarios where Email = @email
end
	exec BorrarUsuarios 'Marce@uh.ac.cr'
	exec ConsultaUsuarios

create procedure IngresarUsuarios  --Modifico con alter
@email nvarchar(50),
@clave nvarchar(10),
@nombre nvarchar(50),
@tipo nvarchar(10) = 'Regular'
as
	begin
		insert into Usuarios(Email, Clave, Nombre, Tipo) values(@email, @clave, @nombre, @tipo)
end
	exec IngresarUsuarios 'Marce@uh.ac.cr', '456', 'Erick'
	exec ConsultaUsuarios

create procedure ValidarUsuario
@email nvarchar(50),
@clave nvarchar(10)
as
	begin
		select * from Usuarios where Email=@email and Clave=@clave
end
	exec ValidarUsuario 'Marce@uh.ac.cr', '456'

create procedure actualizarUsuarios 
	@email nvarchar (50),
	@clave nvarchar (10),
	@nombre nvarchar(50),
	@tipo nvarchar (10) = 'Regular'
	 as
	  begin
	   update Usuarios set email = @email, clave = @clave, nombre = @nombre, Tipo = @tipo
	  end

	  execute ingresarUsuarios
	  exec consultaUsuarios

create procedure ConsultarUsuariosFiltro
@email varchar (30)
	as
		begin
		 select * from Usuarios where email = @email
		end

		execute ConsultarUsuariosFiltro 'Andry@uh.ac.cr'

create table Clientes(

Id_clientes int identity(1,1) primary key,
Email varchar(30) not null unique,
Nombre nvarchar(50)not null,
Apellido nvarchar(50)not null,
Telefono varchar(8) not null,
Edad varchar(8) not null
)

insert into Clientes(Email, Nombre, Apellido, Telefono, Edad) values ('Aramy@uh.ac.cr', 'Aramy', 'Sandí', '88540079', '20')
insert into Clientes(Email, Nombre, Apellido, Telefono, Edad) values ('Windell@uh.ac.cr', 'Windell', 'Sandí', '60558900', '37')
select * from Clientes

create table Rutinas(

Nombre varchar(30),
Series varchar(30)
)

insert into Rutinas(Nombre, Series) values('Press banca', '8 x 12')
insert into Rutinas(Nombre, Series) values('Peso muerto', '8 x 12')
insert into Rutinas(Nombre, Series) values('Patada de mula', '8 x 12')
select * from Rutinas

SELECT r.Nombre, r.Series FROM Rutinas r

drop  table Mae_Factura
create table Mae_factura(

Nfactura int identity(1000,100) primary key,
Fecha date constraint Def_fecha default Getdate(),
Id_cliente int,
Total money,
Iva_total float,

constraint fk_cliente foreign key(Id_cliente) references Clientes(Id_clientes)
)

insert into Mae_factura(Id_cliente, Total, Iva_total) values(1, 3000, 500)
select * from Mae_factura 

drop table Det_factura
Create table Det_factura(

Id_factura int identity(1000,99) primary key,
Nfactura int,
Codigo_producto int,
Cantidad int,
Precio_unitario float,
Iva float,

constraint fk_nfactura foreign key(Nfactura) references Mae_factura(Nfactura)
)
insert into Det_factura(Codigo_producto, Cantidad, Precio_unitario, Iva) values(2, 3, 4500, 500)
select * from Det_factura

create table producto
(
   codigo int,
   descripcion varchar(100),
   precio int

)
insert into producto values (1,'camisa'),(2,'Pantalon')

select * from producto

--Procedimientos almacenados de producto y factura

create procedure selecproducto
@codigo int
as 
 begin 
 select codigo, descripcion, precio from producto where codigo = @codigo
 end

 exec selecproducto  2

exec MaeFactura 


create procedure MaeFactura
 
  @cliente varchar(20),
  @total money
  as 

  begin
  DECLARE @FECHA datetime
  SET @fecha = GETDATE()
    insert into mae_factura (fecha,Id_cliente,total) values (@FECHA,@cliente,@total)
  
  end

  exec MaeFactura  1, 6000

  create procedure DetFactura

  @codigo int,
  @cantidad int,
  @precio money
  as 

  begin
    Declare @id int
	set @id = (select top 1 Id_cliente from Mae_factura order by Id_cliente desc)
    insert into det_factura (Id_factura,Codigo_producto,cantidad,Precio_unitario) values (@id,@codigo,@cantidad,@precio)
  
  end

--Procedimientos almacenados para mostrar cantones y distritos

create procedure mostrarCantones
	@provincia varchar (30)
		as
			begin
				select canton from Cantones where provincia = @provincia
			end
exec mostrarCantones 'Alajuela'
select canton from Cantones where provincia = 'Heredia'

create procedure mostrarDistritos
	@cantones varchar (30)
		as
			begin
				select Distrito from Distritos where canton = @cantones
			end
exec mostrarDistritos 'Alajuela'

create table Provincias(
provincia varchar(30),
CONSTRAINT PK_Provincia PRIMARY KEY (provincia)
)

INSERT INTO Provincias (provincia) 
values ('San Jose'),
		('Alajuela'),
		('Cartago'),
		('Heredia'),
		('Guanacaste'),
		('Puntarenas'),
		('Limon')


create table Cantones(
provincia varchar(30),
canton varchar(30),
CONSTRAINT PK_Canton PRIMARY KEY (canton),
CONSTRAINT FK_Provincia FOREIGN KEY (provincia) REFERENCES Provincias(provincia)
)

INSERT INTO Cantones (provincia, canton) 
values ('San Jose','San Jose'),('San Jose','Escazu'),('San Jose','Desamparados'),('San Jose','Puriscal'),('San Jose','Tarrazu'),
('Alajuela','Alajuela'),('Alajuela','San Ramon'),('Alajuela','Grecia'),('Alajuela','San Mateo'),('Alajuela','Atenas'),
('Cartago','La Union'),('Cartago','Jimenez'),('Cartago','Turrialba'),('Cartago','Alvarado'),('Cartago','Oreamuno'),
('Heredia','San Isidro'),('Heredia','Belen'),('Heredia','Flores'),('Heredia','San Pablo'),('Heredia','Sarapiqui'),
('Guanacaste','Liberia'),('Guanacaste','Nicoya'),('Guanacaste','Santa Cruz'),('Guanacaste','Bagaces'),('Guanacaste','Carrillo'),
('Puntarenas','Esparza'),('Puntarenas','Buenos Aires'),('Puntarenas','Montes de Oro'),('Puntarenas','Osa'),('Puntarenas','Quepos'),
('Limon','Pococi'),('Limon','Siquirres'),('Limon','Talamanca'),('Limon','Matina'),('Limon','Guacimo')

create table Distritos(
canton varchar(30),
cod_distrito int,
distrito varchar(30),
CONSTRAINT PK_cod_distrito PRIMARY KEY (cod_distrito),
CONSTRAINT FK_canton FOREIGN KEY (canton) REFERENCES Cantones(canton)
)

INSERT INTO Distritos (canton, cod_distrito, distrito)
values ('San Jose',1001,'Carmen'),('San Jose',1002,'Merced'),('San Jose',1003,'Hospital'),('Escazu',1004,'Escazu'),('Escazu',1005,'San Antonio'),
('Escazu',1006,'San Rafael'),('Desamparados',1007,'Desamparados'),('Desamparados',1008,'San Miguel'),('Desamparados',1009,'San Juan de Dios'),('Puriscal',1010,'Santiago'),
('Puriscal',1011,'Mercedes Sur'),('Puriscal',1012,'Barbacoas'),('Tarrazu',1013,'San Marcos'),('Tarrazu',1014,'San Lorenzo'),('Tarrazu',1015,'San Carlos')

INSERT INTO Distritos (canton, cod_distrito, distrito)
values('Alajuela',2001,'Alajuela'),('Alajuela',2002,'San Jose'),('Alajuela',2003,'Carrizal'),('San Ramon',2004,'San Rafael'),
('San Ramon',2005,'San Isidro'),('San Ramon',2006,'angeles'),('Grecia',2007,'San Isidro'),('Grecia',2008,'San Jose'),('Grecia',2009,'San Roque'),
('San Mateo',2010,'Desmonte'),('San Mateo',2011,'Jesus Maria'),('San Mateo',2012,'Labrador'),('Atenas',2013,'Mercedes'),('Atenas',2014,'San Isidro'),
('Atenas',2015,'Concepcion')

INSERT INTO Distritos (canton, cod_distrito, distrito)
values('La Union',3001,'Tres Rios'),('La Union',3002,'San Diego'),('La Union',3003,'San Juan'),('Jimenez',3004,'Juan Viñas'),
('Jimenez',3005,'Tucurrique'),('Jimenez',3006,'Pejibaye'),('Turrialba',3007,'Peralta'),('Turrialba',3008,'Santa Cruz'),('Turrialba',3009,'Santa Teresita'),
('Alvarado',3010,'Pacayas'),('Alvarado',3011,'Cervantes'),('Alvarado',3012,'Capellades'),('Oreamuno',3013,'San Rafael'),('Oreamuno',3014,'Cot'),
('Oreamuno',3015,'Potrero Cerrado')

INSERT INTO Distritos (canton, cod_distrito, distrito)
values('San Isidro',4001,'San Jose'),('San Isidro',4002,'Concepcion'),('San Isidro',4003,'San Francisco'),('Belen',4004,'San Antonio'),
('Belen',4005,'La Ribera'),('Belen',4006,'La Asuncion'),('Flores',4007,'San Joaquin'),('Flores',4008,'Barrantes'),('Flores',4009,'Llorente'),
('San Pablo',4010,'San Pablo'),('San Pablo',4011,'Rincon de Sabanilla'),('Sarapiqui',4012,'Puerto Viejo'),('Sarapiqui',4013,'La Virgen'),
('Sarapiqui',4014,'Las Horquetas')

INSERT INTO Distritos (canton, cod_distrito, distrito)
values('Liberia',5001,'Mayorga'),('Liberia',5002,'Nacascolo'),('Liberia',5003,'Curubande'),('Nicoya',5004,'Nicoya'),('Nicoya',5005,'Mansion'),
('Nicoya',5006,'San Antonio'),('Santa Cruz',5007,'Diria'),('Santa Cruz',5008,'Cabo Velas'),('Santa Cruz',5009,'Tamarindo'),('Bagaces',5010,'Bagaces'),
('Bagaces',5011,'La Fortuna'),('Bagaces',5012,'Mogote'),('Carrillo',5013,'Filadelfia'),('Carrillo',5014,'Palmira'),('Carrillo',5015,'Sardinal')

INSERT INTO Distritos (canton, cod_distrito, distrito)
values('Esparza',6001,'San Rafael'),('Esparza',6002,'San Jeronimo'),('Esparza',6003,'Caldera'),('Buenos Aires',6004,'Buenos Aires'),('Buenos Aires',6005,'Volcan'),
('Buenos Aires',6006,'Potrero Grande'),('Montes de Oro',6007,'Miramar'),('Montes de Oro',6008,'La Union'),('Montes de Oro',6009,'San Isidro'),('Osa',6010,'Puerto Cortes'),
('Osa',6011,'Palmar'),('Osa',6012,'Sierpe'),('Quepos',6013,'Quepos'),('Quepos',6014,'Savegre'),('Quepos',6015,'Naranjito')

INSERT INTO Distritos (canton, cod_distrito, distrito)
values('Pococi',7001,'Cariari'),('Pococi',7002,'Colorado'),('Pococi',7003,'La Colonia'),('Siquirres',7004,'Siquirres'),('Siquirres',7005,'Pacuarito'),
('Siquirres',7006,'Florida'),('Talamanca',7007,'Sixaola'),('Talamanca',7008,'Cahuita'),('Talamanca',7009,'Telire'),('Matina',7010,'Matina'),
('Matina',7011,'Batan'),('Matina',7012,'Carrandi'),('Guacimo',7013,'Guacimo'),('Guacimo',7014,'Mercedes'),('Guacimo',7015,'Pocora')

select * from distritos

drop table Direccion
create table Direccion(
email varchar(30) unique,
provincia varchar(30),
canton varchar(30),
cod_distrito int,
distrito varchar(30),
comentarios nvarchar(200),

CONSTRAINT FK_email2 FOREIGN KEY (email) REFERENCES Clientes(Email),
CONSTRAINT PK_comentarios PRIMARY KEY (comentarios),
CONSTRAINT FK_provincia2 FOREIGN KEY (provincia) REFERENCES Provincias(provincia),
CONSTRAINT FK_canton2 FOREIGN KEY (canton) REFERENCES Cantones(canton),
CONSTRAINT FK_Cod_distrito FOREIGN KEY (cod_distrito) REFERENCES Distritos(cod_distrito)
)

INSERT INTO Direccion (email, provincia, canton, cod_distrito, distrito, comentarios) 
values ('Aramy@uh.ac.cr', 'Alajuela','Alajuela', 2001, 'Alajuela', 'Frente al mercado central'),
	   ('Windell@uh.ac.cr','San Jose','San Jose', 1001, 'Carmen', 'Frente a la Muni')

select * from Direccion

SELECT c.email, c.nombre, c.apellido, c.telefono, d.provincia, d.canton, d.distrito, d.comentarios 
from Clientes c inner join Direccion d on d.email = c.email 




