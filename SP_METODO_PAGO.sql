USE ReactaCore;


        --- INSERTAR ---
CREATE OR ALTER PROC SP_INSERTAR_METODOPAGO
(
    @NombreMetodo VARCHAR(50)
)
AS
BEGIN
    BEGIN TRY
        BEGIN TRAN
            INSERT INTO MetodosPago (NombreMetodo)
            VALUES (@NombreMetodo)
        COMMIT
        PRINT 'METODO DE PAGO INSERTADO'
    END TRY
    BEGIN CATCH
        ROLLBACK
        PRINT 'ERROR AL INSERTAR METODO DE PAGO'
    END CATCH
END
GO



      --- EDITAR ---
CREATE OR ALTER PROC SP_EDITAR_METODOPAGO
(
    @MetodoPagoId INT,
    @NombreMetodo VARCHAR(50)
)
AS
BEGIN
    BEGIN TRY
        BEGIN TRAN
            UPDATE MetodosPago
            SET NombreMetodo = @NombreMetodo
            WHERE MetodoPagoId = @MetodoPagoId
        COMMIT
        PRINT 'METODO DE PAGO EDITADO'
    END TRY
    BEGIN CATCH
        ROLLBACK
        PRINT 'ERROR AL EDITAR METODO DE PAGO'
    END CATCH
END
GO



          --- ELIMINAR ---
CREATE OR ALTER PROC SP_ELIMINAR_METODOPAGO
(
    @MetodoPagoId INT
)
AS
BEGIN
    BEGIN TRY
        BEGIN TRAN
            DELETE FROM MetodosPago WHERE MetodoPagoId = @MetodoPagoId
        COMMIT
        PRINT 'METODO DE PAGO ELIMINADO'
    END TRY
    BEGIN CATCH
        ROLLBACK
        PRINT 'ERROR AL ELIMINAR METODO DE PAGO'
    END CATCH
END
GO



               -- BUSCAR ---
CREATE OR ALTER PROC SP_BUSCAR_METODOPAGO_POR_ID
(
    @MetodoPagoId INT
)
AS
SELECT * FROM MetodosPago WHERE MetodoPagoId = @MetodoPagoId
GO



             --- FILTRAR ---
CREATE OR ALTER PROC SP_FILTRAR_METODOPAGO
(
    @NombreMetodo VARCHAR(50)
)
AS
SELECT * FROM MetodosPago
WHERE NombreMetodo LIKE '%' + @NombreMetodo + '%'
GO
