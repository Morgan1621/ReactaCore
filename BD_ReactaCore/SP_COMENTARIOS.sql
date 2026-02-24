

-- SP LISTAR COMENTARIOS --

CREATE OR ALTER PROC SP_LISTAR_COMENTARIOS
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        c.ComentarioId,
        c.Comentario,
        c.Fecha,

        u.UsuarioId,
        u.Nombre        AS NombreUsuario,

        e.EventoId,
        e.NombreEvento
    FROM Comentarios c
    INNER JOIN Usuarios u
        ON c.UsuarioId = u.UsuarioId
    INNER JOIN Eventos e
        ON c.EventoId = e.EventoId

END;
GO

--EXEC SP_LISTAR_COMENTARIOS


-- SP INSERTAR COMENTARIO --

CREATE OR ALTER PROC SP_INSERTAR_COMENTARIO
(
    @UsuarioId INT,
    @EventoId INT,
    @Comentario VARCHAR(200),
    @Fecha DATETIME
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRAN;

        INSERT INTO Comentarios (
            UsuarioId,
            EventoId,
            Comentario,
            Fecha
        )
        VALUES (
            @UsuarioId,
            @EventoId,
            @Comentario,
            @Fecha
        );

        COMMIT;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK;
        THROW;
    END CATCH
END;
GO


-- SP EDITAR COMENTARIO --

CREATE OR ALTER PROC SP_EDITAR_COMENTARIO
(
    @ComentarioId INT,
    @Comentario VARCHAR(200),
    @Fecha DATETIME
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRAN;

        UPDATE Comentarios
        SET Comentario = @Comentario,
            Fecha      = @Fecha
        WHERE ComentarioId = @ComentarioId;

        COMMIT;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK;
        THROW;
    END CATCH
END;
GO

-- SP ELIMINAR COMENTARIO --

CREATE OR ALTER PROC SP_ELIMINAR_COMENTARIO
(
    @ComentarioId INT
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRAN;

        DELETE FROM Comentarios
        WHERE ComentarioId = @ComentarioId;

        COMMIT;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK;
        THROW;
    END CATCH
END;
GO


-- SP BUSCAR COMENTARIOS POR ID --

CREATE OR ALTER PROC SP_BUSCAR_COMENTARIO_POR_ID
(
    @ComentarioId INT
)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        c.ComentarioId,
        c.Comentario,
        c.Fecha,

        u.UsuarioId,
        u.Nombre AS NombreUsuario,

        e.EventoId,
        e.NombreEvento
    FROM Comentarios c
    INNER JOIN Usuarios u
        ON c.UsuarioId = u.UsuarioId
    INNER JOIN Eventos e
        ON c.EventoId = e.EventoId
    WHERE c.ComentarioId = @ComentarioId;
END;
GO

-- SP FILTRAR COMENTARIOS -- 

CREATE OR ALTER PROC SP_FILTRAR_COMENTARIOS
(
    @UsuarioId INT = NULL,
    @EventoId INT = NULL,
    @Fecha DATE = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        c.ComentarioId,
        c.Comentario,
        c.Fecha,

        u.UsuarioId,
        u.Nombre AS NombreUsuario,

        e.EventoId,
        e.NombreEvento
    FROM Comentarios c
    INNER JOIN Usuarios u
        ON c.UsuarioId = u.UsuarioId
    INNER JOIN Eventos e
        ON c.EventoId = e.EventoId
    WHERE (@UsuarioId IS NULL OR c.UsuarioId = @UsuarioId)
      AND (@EventoId IS NULL OR c.EventoId = @EventoId)
      AND (@Fecha IS NULL OR CAST(c.Fecha AS DATE) = @Fecha)
    ORDER BY c.Fecha DESC;
END;
GO



