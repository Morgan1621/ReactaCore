USE ReactaCore;

-- SP_LISTAR_INSCRIPCIONES --
CREATE OR ALTER PROC SP_LISTAR_INSCRIPCIONES
AS
BEGIN
    SELECT
        I.InscripcionId,
        U.Nombre AS NombreUsuario,
        U.Correo AS CorreoUsuario,
        E.NombreEvento,
        Es.NombreEstado AS EstadoInscripcion
    FROM Inscripciones I
    INNER JOIN Usuarios U ON I.UsuarioId = U.UsuarioId
    INNER JOIN Eventos E ON I.EventoId = E.EventoId
    INNER JOIN Estados Es ON I.EstadoId = Es.EstadoId
    ORDER BY I.InscripcionId;
END
GO


-- SP_INSERTAR_INSCRIPCION --
CREATE OR ALTER PROC SP_INSERTAR_INSCRIPCION
(
    @UsuarioId INT,
    @EventoId INT,
    @EstadoId INT
)
AS
BEGIN
    BEGIN TRY
        BEGIN TRAN
            INSERT INTO Inscripciones (UsuarioId, EventoId, EstadoId)
            VALUES (@UsuarioId, @EventoId, @EstadoId)
        COMMIT
        PRINT 'INSCRIPCION INSERTADA'
    END TRY
    BEGIN CATCH
        ROLLBACK
        PRINT 'ERROR AL INSERTAR INSCRIPCION'
    END CATCH
END
GO


-- SP_EDITAR_INSCRIPCION ---
CREATE OR ALTER PROC SP_EDITAR_INSCRIPCION
(
    @InscripcionId INT,
    @EstadoId INT
)
AS
BEGIN
    BEGIN TRY
        BEGIN TRAN
            UPDATE Inscripciones
            SET EstadoId = @EstadoId
            WHERE InscripcionId = @InscripcionId
        COMMIT
        PRINT 'INSCRIPCION EDITADA'
    END TRY
    BEGIN CATCH
        ROLLBACK
        PRINT 'ERROR AL EDITAR INSCRIPCION'
    END CATCH
END
GO


-- SP_ELIMINAR_INSCRIPCION --
CREATE OR ALTER PROC SP_ELIMINAR_INSCRIPCION
(
    @InscripcionId INT
)
AS
BEGIN
    BEGIN TRY
        BEGIN TRAN
            DELETE FROM Inscripciones WHERE InscripcionId = @InscripcionId
        COMMIT
        PRINT 'INSCRIPCION ELIMINADA'
    END TRY
    BEGIN CATCH
        ROLLBACK
        PRINT 'ERROR AL ELIMINAR INSCRIPCION'
    END CATCH
END
GO


-- SP_BUSCAR_INSCRIPCION_POR_ID --
CREATE OR ALTER PROC SP_BUSCAR_INSCRIPCION_POR_ID
(
    @InscripcionId INT
)
AS
SELECT * FROM Inscripciones WHERE InscripcionId = @InscripcionId
GO


-- SP_BUSCAR_INSCRIPCION_POR_ID --
CREATE OR ALTER PROC SP_BUSCAR_INSCRIPCION_POR_ID
(
    @UsuarioId INT = NULL,
    @EventoId INT = NULL
)
AS
SELECT * FROM Inscripciones
WHERE (@UsuarioId IS NULL OR UsuarioId = @UsuarioId)
  AND (@EventoId IS NULL OR EventoId = @EventoId)
GO



