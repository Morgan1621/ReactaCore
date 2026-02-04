USE ReactaCore;



              --- INSERTAR ---
CREATE OR ALTER PROC SP_INSERTAR_EVENTOPONENTE
(
    @EventoId INT,
    @PonenteId INT
)
AS
BEGIN
    BEGIN TRY
        BEGIN TRAN
            INSERT INTO EventoPonente (EventoId, PonenteId)
            VALUES (@EventoId, @PonenteId)
        COMMIT
        PRINT 'EVENTO–PONENTE INSERTADO'
    END TRY
    BEGIN CATCH
        ROLLBACK
        PRINT 'ERROR AL INSERTAR EVENTO–PONENTE'
    END CATCH
END
GO

         --- ELIMINAR ---
CREATE OR ALTER PROC SP_ELIMINAR_EVENTOPONENTE
(
    @EventoId INT,
    @PonenteId INT
)
AS
BEGIN
    BEGIN TRY
        BEGIN TRAN
            DELETE FROM EventoPonente
            WHERE EventoId = @EventoId AND PonenteId = @PonenteId
        COMMIT
        PRINT 'EVENTO–PONENTE ELIMINADO'
    END TRY
    BEGIN CATCH
        ROLLBACK
        PRINT 'ERROR AL ELIMINAR EVENTO–PONENTE'
    END CATCH
END
GO



             --- BUSCAR ---
CREATE OR ALTER PROC SP_BUSCAR_EVENTOPONENTE
(
    @EventoId INT
)
AS
SELECT * FROM EventoPonente WHERE EventoId = @EventoId
GO
