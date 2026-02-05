USE ReactaCore;


            --- INSERTAR ---
CREATE OR ALTER PROC SP_INSERTAR_PAGO
(
    @InscripcionId INT,
    @MetodoPagoId INT,
    @Monto DECIMAL(8,2),
    @EstadoId INT
)
AS
BEGIN
    BEGIN TRY
        BEGIN TRAN

        INSERT INTO Pagos (InscripcionId, MetodoPagoId, Monto, EstadoId)
        VALUES (@InscripcionId, @MetodoPagoId, @Monto, @EstadoId)

        COMMIT
        PRINT 'PAGO INSERTADO'
    END TRY
    BEGIN CATCH
        ROLLBACK
        PRINT ERROR_MESSAGE()
    END CATCH
END
GO



         --- EDITAR ---
CREATE OR ALTER PROC SP_EDITAR_PAGO
(
    @PagoId INT,
    @MetodoPagoId INT,
    @Monto DECIMAL(8,2),
    @EstadoId INT
)
AS
BEGIN
    BEGIN TRY
        BEGIN TRAN

        UPDATE Pagos
        SET MetodoPagoId = @MetodoPagoId,
            Monto = @Monto,
            EstadoId = @EstadoId
        WHERE PagoId = @PagoId

        COMMIT
        PRINT 'PAGO EDITADO'
    END TRY
    BEGIN CATCH
        ROLLBACK
        PRINT ERROR_MESSAGE()
    END CATCH
END
GO



         --- ELIMINAR ---
CREATE OR ALTER PROC SP_ELIMINAR_PAGO
(
    @PagoId INT
)
AS
BEGIN
    BEGIN TRY
        BEGIN TRAN

        DELETE FROM Pagos
        WHERE PagoId = @PagoId

        COMMIT
        PRINT 'PAGO ELIMINADO'
    END TRY
    BEGIN CATCH
        ROLLBACK
        PRINT ERROR_MESSAGE()
    END CATCH
END
GO


          --- BUSCAR ---
CREATE OR ALTER PROC SP_BUSCAR_PAGO_ID
(
    @PagoId INT
)
AS
BEGIN
    SELECT *
    FROM Pagos
    WHERE PagoId = @PagoId
END
GO



           --- FILTRAR ---
CREATE OR ALTER PROC SP_FILTRAR_PAGO
(
    @MetodoPagoId INT,
    @EstadoId INT
)
AS
BEGIN
    SELECT *
    FROM Pagos
    WHERE MetodoPagoId = @MetodoPagoId
       OR EstadoId = @EstadoId
END
GO
