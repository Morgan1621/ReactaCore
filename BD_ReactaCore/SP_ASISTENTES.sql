USE ReactaCore;


-- SP_LISTAR_ASISTENTES --

CREATE OR ALTER PROC SP_LISTAR_ASISTENTES
AS
BEGIN
    SELECT 
        A.AsistenteId,
        A.InscripcionId,
        E.NombreEstado
    FROM Asistentes A
    INNER JOIN Estados E
        ON A.EstadoId = E.EstadoId
END
GO



-- SP_INSERTAR_ASISTENTE --
CREATE OR ALTER PROC SP_INSERTAR_ASISTENTE
(
    @InscripcionId INT,
    @EstadoId INT
)
AS
BEGIN
    BEGIN TRY
        BEGIN TRAN

        INSERT INTO Asistentes (InscripcionId, EstadoId)
        VALUES (@InscripcionId, @EstadoId)

        COMMIT
        PRINT 'ASISTENTE INSERTADO'
    END TRY
    BEGIN CATCH
        ROLLBACK
        PRINT ERROR_MESSAGE()
    END CATCH
END
GO


-- SP_EDITAR_ASISTENTE --
CREATE OR ALTER PROC SP_EDITAR_ASISTENTE
(
    @AsistenteId INT,
    @EstadoId INT
)
AS
BEGIN
    BEGIN TRY
        BEGIN TRAN

        UPDATE Asistentes
        SET EstadoId = @EstadoId
        WHERE AsistenteId = @AsistenteId

        COMMIT
        PRINT 'ASISTENTE EDITADO'
    END TRY
    BEGIN CATCH
        ROLLBACK
        PRINT ERROR_MESSAGE()
    END CATCH
END
GO


-- SP_ELIMINAR_ASISTENTE --
CREATE OR ALTER PROC SP_ELIMINAR_ASISTENTE
(
    @AsistenteId INT
)
AS
BEGIN
    BEGIN TRY
        BEGIN TRAN

        DELETE FROM Asistentes
        WHERE AsistenteId = @AsistenteId

        COMMIT
        PRINT 'ASISTENTE ELIMINADO'
    END TRY
    BEGIN CATCH
        ROLLBACK
        PRINT ERROR_MESSAGE()
    END CATCH
END
GO
 

-- SP_BUSCAR_ASISTENTE_ID --
CREATE OR ALTER PROC SP_BUSCAR_ASISTENTE_ID
(
    @AsistenteId INT
)
AS
BEGIN
    SELECT *
    FROM Asistentes
    WHERE AsistenteId = @AsistenteId
END
GO


-- SP_FILTRAR_ASISTENTE --
CREATE OR ALTER PROC SP_FILTRAR_ASISTENTE
(
    @InscripcionId INT,
    @EstadoId INT
)
AS
BEGIN
    SELECT *
    FROM Asistentes
    WHERE InscripcionId = @InscripcionId
       OR EstadoId = @EstadoId
END
GO




