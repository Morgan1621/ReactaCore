
USE ReactaCore;



      ---INSERTAR---
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




         ---EDITAR---
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



      ---ELIMINAR---
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




      ---BUSCAR PONENTE POR ID---
CREATE OR ALTER PROC SP_BUSCAR_PONENTE_POR_ID
(
    @PonenteId INT
)
AS
SELECT * FROM Ponentes WHERE PonenteId = @PonenteId
GO




          ---FILTRAR PONENTE---
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

