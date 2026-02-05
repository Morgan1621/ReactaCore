USE ReactaCore;


-- SP_LISTAR_PAGOS --
CREATE OR ALTER PROC SP_LISTAR_PAGOS
AS
BEGIN
    SELECT
        P.PagoId,
        U.Nombre AS NombreUsuario,
        U.Correo AS CorreoUsuario,
        Ev.NombreEvento,
        MP.NombreMetodo AS MetodoPago,
        P.Monto,
        Es.NombreEstado AS EstadoPago
    FROM Pagos P
    INNER JOIN Inscripciones I ON P.InscripcionId = I.InscripcionId
    INNER JOIN Usuarios U ON I.UsuarioId = U.UsuarioId
    INNER JOIN Eventos Ev ON I.EventoId = Ev.EventoId
    INNER JOIN MetodosPago MP ON P.MetodoPagoId = MP.MetodoPagoId
    INNER JOIN Estados Es ON P.EstadoId = Es.EstadoId
    ORDER BY P.PagoId;
END
GO


-- SP_INSERTAR_PAGO --
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


-- SP_EDITAR_PAGO --
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


-- SP_ELIMINAR_PAGO --
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


-- SP_BUSCAR_PAGO_ID --
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


-- SP_FILTRAR_PAGO --
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
