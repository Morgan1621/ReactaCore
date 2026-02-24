
-- SP LISTAR NOTIFICACIONES

CREATE OR ALTER PROC SP_LISTAR_NOTIFICACIONES
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        n.NotificacionId,
        u.UsuarioId,
        u.Nombre,
        n.Mensaje,
		U.Correo,
        n.Fecha

    FROM Notificaciones n
    INNER JOIN Usuarios u
        ON n.UsuarioId = u.UsuarioId
    
END;
GO

-- EXEC SP_LISTAR_NOTIFICACIONES

-- SP INSERTAR

CREATE OR ALTER PROC SP_INSERTAR_NOTIFICACION
(
    @UsuarioId INT,
    @Mensaje   VARCHAR(100),
    @Fecha     DATETIME
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRAN;

        INSERT INTO Notificaciones (
            UsuarioId,
            Mensaje,
            Fecha
        )
        VALUES (
            @UsuarioId,
            @Mensaje,
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


-- SP EDITAR --

CREATE OR ALTER PROC SP_EDITAR_NOTIFICACION
(
    @NotificacionId INT,
    @Mensaje VARCHAR(100),
    @Fecha DATETIME
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRAN;

        UPDATE Notificaciones
        SET Mensaje = @Mensaje,
            Fecha   = @Fecha
        WHERE NotificacionId = @NotificacionId;

        COMMIT;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK;
        THROW;
    END CATCH
END;
GO


-- SP ELIMINAR --

CREATE OR ALTER PROC SP_ELIMINAR_NOTIFICACION
(
    @NotificacionId INT
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRAN;

        DELETE FROM Notificaciones
        WHERE NotificacionId = @NotificacionId;

        COMMIT;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK;
        THROW;
    END CATCH
END;
GO


-- SP BUSCAR POR ID --

CREATE OR ALTER PROC SP_BUSCAR_NOTIFICACION_POR_ID
(
    @NotificacionId INT
)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        n.NotificacionId,
        n.Mensaje,
        n.Fecha,

        u.UsuarioId,
        u.Nombre,
        u.Correo
    FROM Notificaciones n
    INNER JOIN Usuarios u
        ON n.UsuarioId = u.UsuarioId
    WHERE n.NotificacionId = @NotificacionId;
END;
GO


-- SP FILTRAR NOTIFICACIONES --

CREATE OR ALTER PROC SP_FILTRAR_NOTIFICACIONES
(
    @UsuarioId INT = NULL,
    @Fecha     DATE = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        n.NotificacionId,
        n.Mensaje,
        n.Fecha,

        u.UsuarioId,
        u.Nombre
    FROM Notificaciones n
    INNER JOIN Usuarios u
        ON n.UsuarioId = u.UsuarioId
    WHERE (@UsuarioId IS NULL OR n.UsuarioId = @UsuarioId)
      AND (@Fecha IS NULL OR CAST(n.Fecha AS DATE) = @Fecha)
    ORDER BY n.Fecha DESC;
END;
GO

