USE ReactaCore;

INSERT INTO Estados (NombreEstado) VALUES
('Activo'),
('Inactivo'),
('Pendiente'),
('Cancelado'),
('Completado');
GO



INSERT INTO Roles (NombreRol, EstadoId) VALUES
('Administrador', 1),
('Organizador', 1),
('Ponente', 1),
('Participante', 1),
('Invitado', 2);
GO

INSERT INTO Usuarios (Nombre, Correo, RolId, EstadoId) VALUES
('Liz Perez', 'liz@mail.com', 1, 1),
('Ross Lopez', 'ross@mail.com', 2, 1),
('Mcnus Ruiz', 'mcnus@mail.com', 4, 1),
('Kevin Torres', 'kevin@mail.com', 4, 1),
('Luis Gomez', 'luis@mail.com', 5, 2);
GO

INSERT INTO Categorias (NombreCategoria, EstadoId) VALUES
('Tecnología', 1),
('Salud', 1),
('Educación', 1),
('Negocios', 1),
('Arte', 2);
GO

INSERT INTO Organizadores (UsuarioId) VALUES
(2);
GO


INSERT INTO Eventos (NombreEvento, Fecha, CategoriaId, OrganizadorId, EstadoId) VALUES
('Conferencia de IA', '2026-03-10', 1, 1, 1),
('Foro de Emprendedores', '2026-04-05', 4, 1, 1),
('Taller de Programación', '2026-02-20', 1, 1, 5),
('Seminario de Salud', '2026-05-15', 2, 1, 3),
('Expo Creativa', '2026-06-01', 5, 1, 1);
GO


INSERT INTO Ponentes (Nombre, EstadoId) VALUES
('Dr. Alberto Reyes', 1),
('Ing. Sofia Mora', 1),
('Lic. Pedro Cruz', 1),
('MSc. Laura Díaz', 1),
('Coach Roberto León', 2);
GO


INSERT INTO EventoPonente (EventoId, PonenteId) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 2),
(4, 4);
GO


INSERT INTO Inscripciones (UsuarioId, EventoId, EstadoId) VALUES
(3, 1, 1),
(4, 1, 1),
(3, 2, 1),
(4, 3, 3),
(5, 4, 2);
GO


INSERT INTO MetodosPago (NombreMetodo) VALUES
('Tarjeta de Crédito'),
('Transferencia'),
('PayPal'),
('Efectivo'),
('Criptomoneda');
GO

INSERT INTO Pagos (InscripcionId, MetodoPagoId, Monto, EstadoId) VALUES
(1, 1, 50.00, 1),
(2, 3, 50.00, 1),
(3, 2, 40.00, 1),
(4, 4, 0.00, 3),
(5, 1, 30.00, 2);
GO

INSERT INTO Asistentes (InscripcionId, EstadoId) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 3),
(5, 2);
GO

INSERT INTO Asistencia (AsistenteId, Asistio) VALUES
(1, 1),
(2, 1),
(3, 0),
(4, 0),
(5, 1);
GO

INSERT INTO PlantillaCertificado (NombrePlantilla, EstadoId) VALUES
('Plantilla Básica', 1),
('Plantilla Profesional', 1),
('Plantilla Premium', 1),
('Plantilla Corporativa', 2),
('Plantilla Especial', 1);
GO

INSERT INTO Certificados (AsistenteId, PlantillaId, FechaEmision) VALUES
(1, 2, '2026-03-11'),
(2, 1, '2026-03-11'),
(3, 3, '2026-04-06'),
(5, 1, '2026-05-16'),
(4, 2, '2026-02-21');
GO


INSERT INTO Notificaciones (UsuarioId, Mensaje, Fecha) VALUES
(3, 'Su inscripción fue confirmada', GETDATE()),
(4, 'Nuevo evento disponible', GETDATE()),
(2, 'Tiene un nuevo participante', GETDATE()),
(1, 'Reporte mensual generado', GETDATE()),
(5, 'Pago pendiente', GETDATE());
GO


INSERT INTO Comentarios (UsuarioId, EventoId, Comentario, Fecha) VALUES
(3, 1, 'Excelente conferencia', GETDATE()),
(4, 1, 'Muy buenos ponentes', GETDATE()),
(3, 2, 'Contenido interesante', GETDATE()),
(5, 4, 'No pude asistir', GETDATE()),
(4, 3, 'Buen taller práctico', GETDATE());
GO


INSERT INTO Bitacora (UsuarioId, Accion, Fecha) VALUES
(1, 'Creó evento', GETDATE()),
(2, 'Editó perfil', GETDATE()),
(3, 'Se inscribió a evento', GETDATE()),
(4, 'Realizó pago', GETDATE()),
(5, 'Canceló inscripción', GETDATE());
GO
