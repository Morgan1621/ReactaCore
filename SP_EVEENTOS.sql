USE ReactaCore;


          ---INSERTAR---
CREATE OR ALTER PROC SP_INSERTAR_EVENTO
(
    @NombreEvento VARCHAR(100),
    @Fecha DATE,
    @CategoriaId INT,
    @OrganizadorId INT,
    @EstadoId INT
)
AS
BEGIN
    BEGIN TRY
        BEGIN TRAN
            INSERT INTO Eventos (NombreEvento, Fecha, CategoriaId, OrganizadorId, EstadoId)
            VALUES (@NombreEvento, @Fecha, @CategoriaId, @OrganizadorId, @EstadoId)
        COMMIT
        PRINT 'EVENTO INSERTADO'
    END TRY
    BEGIN CATCH
        ROLLBACK
        PRINT 'ERROR AL INSERTAR EVENTO'
    END CATCH
END
GO



             ---EDITAR---
CREATE OR ALTER PROC SP_EDITAR_EVENTO
(
    @EventoId INT,
    @NombreEvento VARCHAR(100),
    @Fecha DATE,
    @CategoriaId INT,
    @OrganizadorId INT,
    @EstadoId INT
)
AS
BEGIN
    BEGIN TRY
        BEGIN TRAN
            UPDATE Eventos
            SET NombreEvento = @NombreEvento,
                Fecha = @Fecha,
                CategoriaId = @CategoriaId,
                OrganizadorId = @OrganizadorId,
                EstadoId = @EstadoId
            WHERE EventoId = @EventoId
        COMMIT
        PRINT 'EVENTO EDITADO'
    END TRY
    BEGIN CATCH
        ROLLBACK
        PRINT 'ERROR AL EDITAR EVENTO'
    END CATCH
END
GO


          ---ELIMINAR---
CREATE OR ALTER PROC SP_ELIMINAR_EVENTO
(
    @EventoId INT
)
AS
BEGIN
    BEGIN TRY
        BEGIN TRAN
            DELETE FROM Eventos WHERE EventoId = @EventoId
        COMMIT
        PRINT 'EVENTO ELIMINADO'
    END TRY
    BEGIN CATCH
        ROLLBACK
        PRINT 'ERROR AL ELIMINAR EVENTO'
    END CATCH
END
GO



          ---BUSCAR---
CREATE OR ALTER PROC SP_BUSCAR_EVENTO_POR_ID
(
    @EventoId INT
)
AS
BEGIN
    SELECT EV.EventoId, EV.NombreEvento, EV.Fecha,
           C.NombreCategoria, U.Nombre AS Organizador, ES.NombreEstado
    FROM Eventos EV
    INNER JOIN Categorias C ON EV.CategoriaId = C.CategoriaId
    INNER JOIN Organizadores O ON EV.OrganizadorId = O.OrganizadorId
    INNER JOIN Usuarios U ON O.UsuarioId = U.UsuarioId
    INNER JOIN Estados ES ON EV.EstadoId = ES.EstadoId
    WHERE EV.EventoId = @EventoId
END
GO



           ---FILTRAR---
CREATE OR ALTER PROC SP_FILTRAR_EVENTO
(
    @NombreEvento VARCHAR(100) = NULL,
    @CategoriaId INT = NULL
)
AS
BEGIN
    SELECT EV.EventoId, EV.NombreEvento, EV.Fecha,
           C.NombreCategoria, ES.NombreEstado
    FROM Eventos EV
    INNER JOIN Categorias C ON EV.CategoriaId = C.CategoriaId
    INNER JOIN Estados ES ON EV.EstadoId = ES.EstadoId
    WHERE (@NombreEvento IS NULL OR EV.NombreEvento LIKE '%' + @NombreEvento + '%')
      AND (@CategoriaId IS NULL OR EV.CategoriaId = @CategoriaId)
END
GO
