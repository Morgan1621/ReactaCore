USE ReactaCore;


-- SP_LISTAR_ORGANIZADORES --
CREATE OR ALTER PROC SP_LISTAR_ORGANIZADORES
AS
BEGIN
    SELECT 
        O.OrganizadorId,
        U.Nombre,
        U.Correo,
        E.NombreEstado
    FROM Organizadores O
    INNER JOIN Usuarios U ON O.UsuarioId = U.UsuarioId
    INNER JOIN Estados E ON U.EstadoId = E.EstadoId;
END
GO


-- SP_INSERTAR_ORGANIZADOR --
CREATE OR ALTER PROC SP_INSERTAR_ORGANIZADOR
(
    @UsuarioId INT
)
AS
BEGIN
    BEGIN TRY
        BEGIN TRAN
            INSERT INTO Organizadores (UsuarioId)
            VALUES (@UsuarioId)
        COMMIT
        PRINT 'ORGANIZADOR INSERTADO'
    END TRY
    BEGIN CATCH
        ROLLBACK
        PRINT 'ERROR AL INSERTAR ORGANIZADOR'
    END CATCH
END
GO


-- SP_EDITAR_ORGANIZADOR --
CREATE OR ALTER PROC SP_EDITAR_ORGANIZADOR
(
    @OrganizadorId INT,
    @UsuarioId INT
)
AS
BEGIN
    BEGIN TRY
        BEGIN TRAN
            UPDATE Organizadores
            SET UsuarioId = @UsuarioId
            WHERE OrganizadorId = @OrganizadorId
        COMMIT
        PRINT 'ORGANIZADOR EDITADO'
    END TRY
    BEGIN CATCH
        ROLLBACK
        PRINT 'ERROR AL EDITAR ORGANIZADOR'
    END CATCH
END
GO


-- SP_ELIMINAR_ORGANIZADOR --
CREATE OR ALTER PROC SP_ELIMINAR_ORGANIZADOR
(
    @OrganizadorId INT
)
AS
BEGIN
    BEGIN TRY
        BEGIN TRAN
            DELETE FROM Organizadores WHERE OrganizadorId = @OrganizadorId
        COMMIT
        PRINT 'ORGANIZADOR ELIMINADO'
    END TRY
    BEGIN CATCH
        ROLLBACK
        PRINT 'ERROR AL ELIMINAR ORGANIZADOR'
    END CATCH
END
GO


-- SP_BUSCAR_ORGANIZADOR_POR_ID --
CREATE OR ALTER PROC SP_BUSCAR_ORGANIZADOR_POR_ID
(
    @OrganizadorId INT
)
AS
BEGIN
    SELECT O.OrganizadorId, U.Nombre, U.Correo, E.NombreEstado
    FROM Organizadores O
    INNER JOIN Usuarios U ON O.UsuarioId = U.UsuarioId
    INNER JOIN Estados E ON U.EstadoId = E.EstadoId
    WHERE O.OrganizadorId = @OrganizadorId
END
GO


-- SP_FILTRAR_ORGANIZADOR --
CREATE OR ALTER PROC SP_FILTRAR_ORGANIZADOR
(
    @NombreUsuario VARCHAR(50) = NULL
)
AS
BEGIN
    SELECT O.OrganizadorId, U.Nombre, U.Correo
    FROM Organizadores O
    INNER JOIN Usuarios U ON O.UsuarioId = U.UsuarioId
    WHERE (@NombreUsuario IS NULL OR U.Nombre LIKE '%' + @NombreUsuario + '%')
END
GO




