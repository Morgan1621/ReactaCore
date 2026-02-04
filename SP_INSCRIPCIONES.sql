USE ReactaCore;



          --- INSERTAR ---
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

             --- EDITAR ---
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


             --- ELIMINAR ---
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




          --- BUSCAR ---
CREATE OR ALTER PROC SP_BUSCAR_INSCRIPCION_POR_ID
(
    @InscripcionId INT
)
AS
SELECT * FROM Inscripciones WHERE InscripcionId = @InscripcionId
GO



         --- FILTRAR ---
CREATE OR ALTER PROC SP_FILTRAR_INSCRIPCION
(
    @UsuarioId INT = NULL,
    @EventoId INT = NULL
)
AS
SELECT * FROM Inscripciones
WHERE (@UsuarioId IS NULL OR UsuarioId = @UsuarioId)
  AND (@EventoId IS NULL OR EventoId = @EventoId)
GO
