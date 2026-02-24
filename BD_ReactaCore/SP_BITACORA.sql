USE ReactaCore
GO

-- SP LISTAR BITACORA --

CREATE OR ALTER PROC SP_LISTAR_BITACORA
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        b.BitacoraId,
        b.Accion,
        b.Fecha,

        u.UsuarioId,
        u.Nombre AS NombreUsuario,
        u.Correo
    FROM Bitacora b
    INNER JOIN Usuarios u
        ON b.UsuarioId = u.UsuarioId

END;
GO

-- EXEC SP_LISTAR_BITACORA


-- SP INSERTAR BITACORA --

CREATE OR ALTER PROC SP_INSERTAR_BITACORA
(
    @UsuarioId INT,
    @Accion    VARCHAR(100),
    @Fecha     DATETIME
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRAN;

        INSERT INTO Bitacora (
            UsuarioId,
            Accion,
            Fecha
        )
        VALUES (
            @UsuarioId,
            @Accion,
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

-- SP EDITAR BITACORA --

CREATE OR ALTER PROC SP_EDITAR_BITACORA
(
    @BitacoraId INT,
    @Accion     VARCHAR(100),
    @Fecha      DATETIME
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRAN;

        UPDATE Bitacora
        SET Accion = @Accion,
            Fecha  = @Fecha
        WHERE BitacoraId = @BitacoraId;

        COMMIT;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK;
        THROW;
    END CATCH
END;
GO


-- SP ELIMINAR BITACORA --

CREATE OR ALTER PROC SP_ELIMINAR_BITACORA
(
    @BitacoraId INT
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRAN;

        DELETE FROM Bitacora
        WHERE BitacoraId = @BitacoraId;

        COMMIT;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK;
        THROW;
    END CATCH
END;
GO


-- SP BUSCAR BITACORA POR ID -- 

CREATE OR ALTER PROC SP_BUSCAR_BITACORA_POR_ID
(
    @BitacoraId INT
)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        b.BitacoraId,
        b.Accion,
        b.Fecha,

        u.UsuarioId,
        u.Nombre AS NombreUsuario,
        u.Correo
    FROM Bitacora b
    INNER JOIN Usuarios u
        ON b.UsuarioId = u.UsuarioId
    WHERE b.BitacoraId = @BitacoraId;
END;
GO


-- SP FILTRAR BITACORA --

CREATE OR ALTER PROC SP_FILTRAR_BITACORA
(
    @UsuarioId INT = NULL,
    @Accion    VARCHAR(100) = NULL,
    @Fecha     DATE = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        b.BitacoraId,
        b.Accion,
        b.Fecha,

        u.UsuarioId,
        u.Nombre AS NombreUsuario
    FROM Bitacora b
    INNER JOIN Usuarios u
        ON b.UsuarioId = u.UsuarioId
    WHERE (@UsuarioId IS NULL OR b.UsuarioId = @UsuarioId)
      AND (@Accion IS NULL OR b.Accion LIKE '%' + @Accion + '%')
      AND (@Fecha IS NULL OR CAST(b.Fecha AS DATE) = @Fecha)
    ORDER BY b.Fecha DESC;
END;
GO

