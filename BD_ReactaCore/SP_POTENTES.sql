USE ReactaCore;


-- SP_LISTAR_PONENTES --
CREATE OR ALTER PROC SP_LISTAR_PONENTES
AS
BEGIN
    SELECT
        P.PonenteId,
        P.Nombre,
        E.NombreEstado
    FROM Ponentes P
    LEFT JOIN Estados E ON P.EstadoId = E.EstadoId;
END
GO

-- SP_INSERTAR_PONENTE --
CREATE OR ALTER PROC SP_INSERTAR_PONENTE
(
    @Nombre VARCHAR(50),
    @EstadoId INT
)
AS
BEGIN
    BEGIN TRY
        BEGIN TRAN
            INSERT INTO Ponentes (Nombre, EstadoId)
            VALUES (@Nombre, @EstadoId)
        COMMIT
        PRINT 'PONENTE INSERTADO'
    END TRY
    BEGIN CATCH
        ROLLBACK
        PRINT 'ERROR AL INSERTAR PONENTE'
    END CATCH
END
GO


-- SP_EDITAR_PONENTE --
CREATE OR ALTER PROC SP_EDITAR_PONENTE
(
    @PonenteId INT,
    @Nombre VARCHAR(50),
    @EstadoId INT
)
AS
BEGIN
    BEGIN TRY
        BEGIN TRAN
            UPDATE Ponentes
            SET Nombre = @Nombre,
                EstadoId = @EstadoId
            WHERE PonenteId = @PonenteId
        COMMIT
        PRINT 'PONENTE EDITADO'
    END TRY
    BEGIN CATCH
        ROLLBACK
        PRINT 'ERROR AL EDITAR PONENTE'
    END CATCH
END
GO


 -- SP_ELIMINAR_PONENTE --
CREATE OR ALTER PROC SP_ELIMINAR_PONENTE
(
    @PonenteId INT
)
AS
BEGIN
    BEGIN TRY
        BEGIN TRAN
            DELETE FROM Ponentes WHERE PonenteId = @PonenteId
        COMMIT
        PRINT 'PONENTE ELIMINADO'
    END TRY
    BEGIN CATCH
        ROLLBACK
        PRINT 'ERROR AL ELIMINAR PONENTE'
    END CATCH
END
GO


-- SP_BUSCAR_PONENTE_POR_ID --
CREATE OR ALTER PROC SP_BUSCAR_PONENTE_POR_ID
(
    @PonenteId INT
)
AS
SELECT * FROM Ponentes WHERE PonenteId = @PonenteId
GO


-- SP_FILTRAR_PONENTE --
CREATE OR ALTER PROC SP_FILTRAR_PONENTE
(
    @Nombre VARCHAR(50) = NULL,
    @EstadoId INT = NULL
)
AS
SELECT * FROM Ponentes
WHERE (@Nombre IS NULL OR Nombre LIKE '%' + @Nombre + '%')
  AND (@EstadoId IS NULL OR EstadoId = @EstadoId)
GO


