USE ReactaCore;


          ---INSERTAR--
CREATE OR ALTER PROC SP_INSERTAR_ROL
@NombreRol VARCHAR(50),@EstadoId INT
AS
BEGIN
  BEGIN TRY
    BEGIN TRAN
      INSERT INTO Roles VALUES (@NombreRol,@EstadoId)
    COMMIT
    PRINT 'ROL INSERTADO'
  END TRY
  BEGIN CATCH
    ROLLBACK
    PRINT 'ERROR AL INSERTAR ROL'
  END CATCH
END
GO



        ---EDITAR---
CREATE OR ALTER PROC SP_EDITAR_ROL
@RolId INT,@NombreRol VARCHAR(50),@EstadoId INT
AS
BEGIN
  BEGIN TRY
    BEGIN TRAN
      UPDATE Roles SET NombreRol=@NombreRol,EstadoId=@EstadoId WHERE RolId=@RolId
    COMMIT
    PRINT 'ROL EDITADO'
  END TRY
  BEGIN CATCH
    ROLLBACK
    PRINT 'ERROR AL EDITAR ROL'
  END CATCH
END
GO


         ---ELIMINAR---
CREATE OR ALTER PROC SP_ELIMINAR_ROL
@RolId INT
AS
BEGIN
  BEGIN TRY
    BEGIN TRAN
      DELETE Roles WHERE RolId=@RolId
    COMMIT
    PRINT 'ROL ELIMINADO'
  END TRY
  BEGIN CATCH
    ROLLBACK
    PRINT 'ERROR AL ELIMINAR ROL'
  END CATCH
END
GO


     ---BUSCAR---
CREATE OR ALTER PROC SP_BUSCAR_ROL_POR_ID
(
    @RolId INT
)
AS
BEGIN
    SELECT 
        R.RolId,
        R.NombreRol,
        E.NombreEstado
    FROM Roles R
    INNER JOIN Estados E ON R.EstadoId = E.EstadoId
    WHERE R.RolId = @RolId;
END
GO


         ---FILTRAR---
CREATE OR ALTER PROC SP_FILTRAR_ROL
(
    @NombreRol VARCHAR(50) = NULL,
    @EstadoId INT = NULL
)
AS
BEGIN
    SELECT 
        R.RolId,
        R.NombreRol,
        E.NombreEstado
    FROM Roles R
    INNER JOIN Estados E ON R.EstadoId = E.EstadoId
    WHERE (@NombreRol IS NULL 
           OR R.NombreRol LIKE '%' + @NombreRol + '%')
      AND (@EstadoId IS NULL 
           OR R.EstadoId = @EstadoId);
END
GO

 