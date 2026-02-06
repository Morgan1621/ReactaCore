CREATE DATABASE ReactaCore;

USE ReactaCore;


CREATE TABLE Estados (
EstadoId INT IDENTITY(1,1) PRIMARY KEY,
NombreEstado VARCHAR(50)
);


CREATE TABLE Roles (
RolId INT IDENTITY(1,1) PRIMARY KEY,
NombreRol VARCHAR (50),
EstadoId INT,
FOREIGN KEY (EstadoId) REFERENCES Estados(EstadoId)
);


CREATE TABLE Usuarios (
UsuarioId INT IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(50),
Correo VARCHAR(100),
RolId INT,
EstadoId INT,
FOREIGN KEY (RolId) REFERENCES Roles(RolId),
FOREIGN KEY (EstadoId) REFERENCES Estados(EstadoId)
);


CREATE TABLE Categorias (
CategoriaId INT IDENTITY(1,1) PRIMARY KEY,
NombreCategoria VARCHAR(50),
EstadoId INT,
FOREIGN KEY (EstadoId) REFERENCES Estados(EstadoId)
);


CREATE TABLE Organizadores (
OrganizadorId INT IDENTITY(1,1) PRIMARY KEY,
UsuarioId INT,
FOREIGN KEY (UsuarioId) REFERENCES Usuarios(UsuarioId)
);


CREATE TABLE Eventos (
EventoId INT IDENTITY(1,1) PRIMARY KEY,
NombreEvento VARCHAR(100),
Fecha DATE,
CategoriaId INT,
OrganizadorId INT,
EstadoId INT,
FOREIGN KEY (CategoriaId) REFERENCES Categorias(CategoriaId),
FOREIGN KEY (OrganizadorId) REFERENCES Organizadores(OrganizadorId),
FOREIGN KEY (EstadoId) REFERENCES Estados(EstadoId)
);


CREATE TABLE Ponentes (
PonenteId INT IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR (50),
EstadoId INT,
FOREIGN KEY (EstadoId) REFERENCES Estados(EstadoId)
);


CREATE TABLE EventoPonente (
EventoId INT,
PonenteId INT,
PRIMARY KEY (EventoId, PonenteId),
FOREIGN KEY (EventoId) REFERENCES Eventos(EventoId),
FOREIGN KEY (PonenteId) REFERENCES Ponentes(PonenteId)
);


CREATE TABLE Inscripciones (
InscripcionId INT IDENTITY(1,1) PRIMARY KEY,
UsuarioId INT,
EventoId INT,
EstadoId INT,
FOREIGN KEY (UsuarioId) REFERENCES Usuarios(UsuarioId),
FOREIGN KEY (EventoId) REFERENCES Eventos(EventoId),
FOREIGN KEY (EstadoId) REFERENCES Estados(EstadoId)
);


CREATE TABLE MetodosPago (
MetodoPagoId INT IDENTITY(1,1) PRIMARY KEY,
NombreMetodo VARCHAR(50)
);


CREATE TABLE Pagos (
PagoId INT IDENTITY(1,1) PRIMARY KEY,
InscripcionId INT,
MetodoPagoId INT,
Monto DECIMAL(8,2),
EstadoId INT,
FOREIGN KEY (InscripcionId) REFERENCES Inscripciones(InscripcionId),
FOREIGN KEY (MetodoPagoId) REFERENCES MetodosPago(MetodoPagoId),
FOREIGN KEY (EstadoId) REFERENCES Estados(EstadoId)
);


CREATE TABLE Asistentes (
AsistenteId INT IDENTITY(1,1) PRIMARY KEY,
InscripcionId INT,
EstadoId INT,
FOREIGN KEY (InscripcionId) REFERENCES Inscripciones(InscripcionId),
FOREIGN KEY (EstadoId) REFERENCES Estados(EstadoId)
);


CREATE TABLE Asistencia (
AsistenciaId INT IDENTITY(1,1) PRIMARY KEY,
AsistenteId INT,
Asistio BIT,
FOREIGN KEY (AsistenteId) REFERENCES Asistentes(AsistenteId)
);


CREATE TABLE PlantillaCertificado (
PlantillaId INT IDENTITY(1,1) PRIMARY KEY,
NombrePlantilla VARCHAR(50),
EstadoId INT,
FOREIGN KEY (EstadoId) REFERENCES Estados(EstadoId)
);


CREATE TABLE Certificados (
CertificadoId INT IDENTITY(1,1) PRIMARY KEY,
AsistenteId INT,
PlantillaId INT,
FechaEmision DATE,
FOREIGN KEY (AsistenteId) REFERENCES Asistentes(AsistenteId),
FOREIGN KEY (PlantillaId) REFERENCES PlantillaCertificado(PlantillaId)
);


CREATE TABLE Notificaciones (
NotificacionId INT IDENTITY(1,1) PRIMARY KEY,
UsuarioId INT,
Mensaje VARCHAR(100),
Fecha DATETIME,
FOREIGN KEY (UsuarioId) REFERENCES Usuarios(UsuarioId)
);


CREATE TABLE Comentarios (
ComentarioId INT IDENTITY(1,1) PRIMARY KEY,
UsuarioId INT,
EventoId INT,
Comentario VARCHAR(200),
Fecha DATETIME,
FOREIGN KEY (UsuarioId) REFERENCES Usuarios(UsuarioId),
FOREIGN KEY (EventoId) REFERENCES Eventos(EventoId)
);


CREATE TABLE Bitacora (
BitacoraId INT IDENTITY(1,1) PRIMARY KEY,
UsuarioId INT,
Accion VARCHAR(100),
Fecha DATETIME,
FOREIGN KEY (UsuarioId) REFERENCES Usuarios(UsuarioId)
);


