USE ReactaCore;

-- SP_LISTAR_PONENTES_POR_EVENTO --
CREATE OR ALTER PROC SP_LISTAR_PONENTES_POR_EVENTO
AS
BEGIN
    SELECT
        EP.EventoId,
        E.NombreEvento,
        P.PonenteId,
        P.Nombre AS NombrePonente,
        Es.NombreEstado AS EstadoPonente
    FROM EventoPonente EP
    INNER JOIN Eventos E ON EP.EventoId = E.EventoId
    INNER JOIN Ponentes P ON EP.PonenteId = P.PonenteId
    INNER JOIN Estados Es ON P.EstadoId = Es.EstadoId
    ORDER BY EP.EventoId, P.PonenteId;
END
GO


-- SP_INSERTAR_EVENTOPONENTE --
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


-- SP_ELIMINAR_EVENTOPONENTE --
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


-- SP_BUSCAR_EVENTOPONENTE --
CREATE OR ALTER PROC SP_BUSCAR_EVENTOPONENTE
(
    @EventoId INT
)
AS
SELECT * FROM EventoPonente WHERE EventoId = @EventoId
GO
