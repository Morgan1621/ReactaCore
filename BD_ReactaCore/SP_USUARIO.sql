USE ReactaCore;


-- SP_LISTAR_USUARIOS --
CREATE OR ALTER PROC SP_LISTAR_USUARIO
AS
BEGIN
    SELECT
        U.UsuarioId,
        U.Nombre,
        U.Correo,
        R.NombreRol,
        E.NombreEstado
    FROM Usuarios U
    INNER JOIN Roles R ON U.RolId = R.RolId
    INNER JOIN Estados E ON U.EstadoId = E.EstadoId;
END
GO

-- SP_INSERTAR_USUARIOS --
CREATE OR ALTER PROC SP_INSERTAR_USUARIOS
@Nombre   VARCHAR(50),   
@Correo   VARCHAR(100),  
@RolId    INT,          
@EstadoId INT            
AS
BEGIN
  BEGIN TRY
    BEGIN TRAN
        INSERT INTO Usuarios (Nombre, Correo, RolId, EstadoId)
        VALUES (@Nombre, @Correo, @RolId, @EstadoId)
    COMMIT
    PRINT 'USUARIO INSERTADO CORRECTAMENTE'
  END TRY
  BEGIN CATCH
    ROLLBACK
    PRINT 'ERROR AL INSERTAR USUARIO'
  END CATCH
END
GO

-- SP_EDITAR_USUARIO --
CREATE OR ALTER PROC SP_EDITAR_USUARIO
@UsuarioId INT,@Nombre VARCHAR(50),@Correo VARCHAR(100),@RolId INT,@EstadoId INT
AS
BEGIN
  BEGIN TRY
    BEGIN TRAN
      UPDATE Usuarios SET Nombre=@Nombre,Correo=@Correo,
      RolId=@RolId,EstadoId=@EstadoId WHERE UsuarioId=@UsuarioId
    COMMIT
    PRINT 'USUARIO EDITADO'
  END TRY
  BEGIN CATCH
    ROLLBACK
    PRINT 'ERROR AL EDITAR USUARIO'
  END CATCH
END
GO


-- SP_ELIMINAR_USUARIO --
CREATE OR ALTER PROC SP_ELIMINAR_USUARIO
@UsuarioId INT
AS
BEGIN
  BEGIN TRY
    BEGIN TRAN
      DELETE Usuarios WHERE UsuarioId=@UsuarioId
    COMMIT
    PRINT 'USUARIO ELIMINADO'
  END TRY
  BEGIN CATCH
    ROLLBACK
    PRINT 'ERROR AL ELIMINAR USUARIO'
  END CATCH
END
GO


-- SP_BUSCAR_USUARIO_POR_ID --
CREATE OR ALTER PROC SP_BUSCAR_USUARIO_POR_ID
(
    @UsuarioId INT
)
AS
BEGIN
    SELECT 
        U.UsuarioId,
        U.Nombre,
        U.Correo,
        R.NombreRol,
        E.NombreEstado
    FROM Usuarios U
    INNER JOIN Roles R ON U.RolId = R.RolId
    INNER JOIN Estados E ON U.EstadoId = E.EstadoId
    WHERE U.UsuarioId = @UsuarioId;
END
GO


-- SP_FILTRAR_USUARIO --
CREATE OR ALTER PROC SP_FILTRAR_USUARIO
(
    @Nombre VARCHAR(50) = NULL,
    @Correo VARCHAR(100) = NULL
)
AS
BEGIN
    SELECT 
        U.UsuarioId,
        U.Nombre,
        U.Correo,
        R.NombreRol,
        E.NombreEstado
    FROM Usuarios U
    INNER JOIN Roles R ON U.RolId = R.RolId
    INNER JOIN Estados E ON U.EstadoId = E.EstadoId
    WHERE (@Nombre IS NULL 
           OR U.Nombre LIKE '%' + @Nombre + '%')
      AND (@Correo IS NULL 
           OR U.Correo LIKE '%' + @Correo + '%');
END
GO

