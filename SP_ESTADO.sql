
USE ReactaCore;


    ---INSERTAR---
CREATE OR ALTER PROC SP_INSERTAR_ESTADO
@NombreEstado VARCHAR(50)
AS
BEGIN
  BEGIN TRY
    BEGIN TRAN
      INSERT INTO Estados VALUES (@NombreEstado)
    COMMIT
    PRINT 'ESTADO INSERTADO'
  END TRY
  BEGIN CATCH
    ROLLBACK
    PRINT 'ERROR AL INSERTAR ESTADO ' + CAST(ERROR_NUMBER() AS VARCHAR)
  END CATCH
END
GO

EXEC SP_EDITAR_ESTADO
@EstadoId = 1,
@NombreEstado = 'Activo Editado';

SELECT * FROM Estados WHERE EstadoId = 1;



           ---EDITAR---
CREATE OR ALTER PROC SP_EDITAR_ESTADO
@EstadoId INT,@NombreEstado VARCHAR(50)
AS
BEGIN
  BEGIN TRY
    BEGIN TRAN
      UPDATE Estados SET NombreEstado=@NombreEstado WHERE EstadoId=@EstadoId
    COMMIT
    PRINT 'ESTADO EDITADO'
  END TRY
  BEGIN CATCH
    ROLLBACK
    PRINT 'ERROR AL EDITAR ESTADO'
  END CATCH
END
GO

EXEC SP_EDITAR_ESTADO
@EstadoId = 1,
@NombreEstado = 'Activo';

SELECT * FROM Estados WHERE EstadoId = 1;




          ---ELIMINAR---
CREATE OR ALTER PROC SP_ELIMINAR_ESTADO
@EstadoId INT
AS
BEGIN
  BEGIN TRY
    BEGIN TRAN
      DELETE Estados WHERE EstadoId=@EstadoId
    COMMIT
    PRINT 'ESTADO ELIMINADO'
  END TRY
  BEGIN CATCH
    ROLLBACK
    PRINT 'ERROR AL ELIMINAR ESTADO'
  END CATCH
END
GO


       ---BUSCAR---
CREATE OR ALTER PROC SP_BUSCAR_ESTADO_POR_ID
(
    @EstadoId INT
)
AS
BEGIN
    SELECT 
        EstadoId,
        NombreEstado
    FROM Estados
    WHERE EstadoId = @EstadoId;
END
GO

EXEC SP_BUSCAR_ESTADO_POR_ID @EstadoId = 1;



         ---FILTRAR---
CREATE OR ALTER PROC SP_FILTRAR_ESTADO
(
    @NombreEstado VARCHAR(50) = NULL
)
AS
BEGIN
    SELECT 
        EstadoId,
        NombreEstado
    FROM Estados
    WHERE (@NombreEstado IS NULL 
           OR NombreEstado LIKE '%' + @NombreEstado + '%');
END
GO

EXEC SP_FILTRAR_ESTADO @NombreEstado = 'Act';





