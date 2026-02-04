USE ReactaCore;



         ---INSERTAR---
CREATE OR ALTER PROC SP_INSERTAR_CATEGORIA
(
    @NombreCategoria VARCHAR(50),
    @EstadoId INT
)
AS
BEGIN
    BEGIN TRY
        BEGIN TRAN
            INSERT INTO Categorias (NombreCategoria, EstadoId)
            VALUES (@NombreCategoria, @EstadoId)
        COMMIT
        PRINT 'CATEGORIA INSERTADA'
    END TRY
    BEGIN CATCH
        ROLLBACK
        PRINT 'ERROR AL INSERTAR CATEGORIA'
    END CATCH
END
GO



            ---EDITAR---
CREATE OR ALTER PROC SP_EDITAR_CATEGORIA
(
    @CategoriaId INT,
    @NombreCategoria VARCHAR(50),
    @EstadoId INT
)
AS
BEGIN
    BEGIN TRY
        BEGIN TRAN
            UPDATE Categorias
            SET NombreCategoria = @NombreCategoria,
                EstadoId = @EstadoId
            WHERE CategoriaId = @CategoriaId
        COMMIT
        PRINT 'CATEGORIA EDITADA'
    END TRY
    BEGIN CATCH
        ROLLBACK
        PRINT 'ERROR AL EDITAR CATEGORIA'
    END CATCH
END
GO


          ---ELIMINAR---
CREATE OR ALTER PROC SP_ELIMINAR_CATEGORIA
(
    @CategoriaId INT
)
AS
BEGIN
    BEGIN TRY
        BEGIN TRAN
            DELETE FROM Categorias WHERE CategoriaId = @CategoriaId
        COMMIT
        PRINT 'CATEGORIA ELIMINADA'
    END TRY
    BEGIN CATCH
        ROLLBACK
        PRINT 'ERROR AL ELIMINAR CATEGORIA'
    END CATCH
END
GO



              ---BUSCAR---
CREATE OR ALTER PROC SP_BUSCAR_CATEGORIA_POR_ID
(
    @CategoriaId INT
)
AS
BEGIN
    SELECT C.CategoriaId, C.NombreCategoria, E.NombreEstado
    FROM Categorias C
    INNER JOIN Estados E ON C.EstadoId = E.EstadoId
    WHERE C.CategoriaId = @CategoriaId
END
GO



              ---FILTRAR---
CREATE OR ALTER PROC SP_FILTRAR_CATEGORIA
(
    @NombreCategoria VARCHAR(50) = NULL,
    @EstadoId INT = NULL
)
AS
BEGIN
    SELECT C.CategoriaId, C.NombreCategoria, E.NombreEstado
    FROM Categorias C
    INNER JOIN Estados E ON C.EstadoId = E.EstadoId
    WHERE (@NombreCategoria IS NULL OR C.NombreCategoria LIKE '%' + @NombreCategoria + '%')
      AND (@EstadoId IS NULL OR C.EstadoId = @EstadoId)
END
GO
