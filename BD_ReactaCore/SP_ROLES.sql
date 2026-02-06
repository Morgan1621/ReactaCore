USE ReactaCore;


-- SP_LISTAR_ROLES --
CREATE OR ALTER PROC SP_LISTAR_ROLES
AS
BEGIN
    SELECT 
        R.RolId,
        R.NombreRol,
        E.NombreEstado
    FROM Roles R
    INNER JOIN Estados E ON R.EstadoId = E.EstadoId
END
GO


-- SP_INSERTAR_ROLES --
CREATE OR ALTER PROC SP_INSERTAR_ROLES
(
    @NombreRol VARCHAR(50),
    @EstadoId INT
)
AS
BEGIN
    BEGIN TRY
        BEGIN TRAN
            INSERT INTO Roles (NombreRol, EstadoId)
            VALUES (@NombreRol, @EstadoId)
        COMMIT
        PRINT 'ROL INSERTADO CORRECTAMENTE'
    END TRY
    BEGIN CATCH
        ROLLBACK
        PRINT 'ERROR AL INSERTAR ROL: ' + CAST(ERROR_NUMBER() AS VARCHAR)
    END CATCH
END
GO

-- SP_EDITAR_ROLES --
CREATE OR ALTER PROC SP_EDITAR_ROLES
(
    @RolId INT,
    @NombreRol VARCHAR(50),
    @EstadoId INT
)
AS
BEGIN
    UPDATE Roles
    SET NombreRol = @NombreRol,
        EstadoId = @EstadoId
    WHERE RolId = @RolId
END
GO


-- SP_ELIMINAR_ROLES --
CREATE OR ALTER PROC SP_ELIMINAR_ROLES
@RolId INT
AS
BEGIN
  BEGIN TRY
    BEGIN TRAN
      DELETE FROM Roles
      WHERE RolId = @RolId
    COMMIT
    PRINT 'ROL ELIMINADO CORRECTAMENTE'
  END TRY
  BEGIN CATCH
    ROLLBACK
    PRINT 'ERROR AL ELIMINAR ROL'
  END CATCH
END
GO





-- SP_BUSCAR_ROLES_ID --
CREATE OR ALTER PROC SP_BUSCAR_ROLES_ID
@RolId INT
AS
BEGIN
  BEGIN TRY
    SELECT 
        R.RolId,
        R.NombreRol,
        E.NombreEstado
    FROM Roles R
    LEFT JOIN Estados E ON R.EstadoId = E.EstadoId
    WHERE R.RolId = @RolId
  END TRY
  BEGIN CATCH
    PRINT 'ERROR AL BUSCAR ROL'
  END CATCH
END
GO



-- SP_FILTRAR_ROLES --
CREATE OR ALTER PROC SP_FILTRAR_ROLES
@NombreRol VARCHAR(50) = NULL,
@EstadoId INT = NULL
AS
BEGIN
    SELECT 
        R.RolId,
        R.NombreRol,
        E.NombreEstado
    FROM Roles R
    INNER JOIN Estados E
        ON R.EstadoId = E.EstadoId
    WHERE
        (@NombreRol IS NULL OR R.NombreRol LIKE '%' + @NombreRol + '%')
    AND (@EstadoId IS NULL OR R.EstadoId = @EstadoId)
END
GO


