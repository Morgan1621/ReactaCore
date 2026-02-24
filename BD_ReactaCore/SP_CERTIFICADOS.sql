
USE ReactaCore;
Go

-- SP LISTAR CERTIFICADOS --

CREATE OR ALTER PROC SP_LISTAR_CERTIFICADOS
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        c.CertificadoId,
        c.FechaEmision,

        a.AsistenteId,
        a.InscripcionId,

        pc.PlantillaId,
        pc.NombrePlantilla
    FROM Certificados c
    INNER JOIN Asistentes a
        ON c.AsistenteId = a.AsistenteId
    INNER JOIN PlantillaCertificado pc
        ON c.PlantillaId = pc.PlantillaId
END;
GO



-- SP INSERTAR CERTIFICADOS

CREATE OR ALTER PROC SP_INSERTAR_CERTIFICADO
(
    @AsistenteId INT,
    @PlantillaId INT,
    @FechaEmision DATE
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRAN;

			INSERT INTO Certificados (
				AsistenteId,
				PlantillaId,
				FechaEmision
			)
			VALUES (
				@AsistenteId,
				@PlantillaId,
				@FechaEmision
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

-- SP EDITAR CERTIFICADOS --

CREATE OR ALTER PROC SP_EDITAR_CERTIFICADO
(
    @CertificadoId INT,
    @AsistenteId INT,
    @PlantillaId INT,
    @FechaEmision DATE
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRAN;

			UPDATE Certificados
			SET AsistenteId = @AsistenteId,
				PlantillaId = @PlantillaId,
				FechaEmision = @FechaEmision
			WHERE CertificadoId = @CertificadoId;

        COMMIT;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK;
        THROW;
    END CATCH
END;
GO


-- SP ELIMINAR CERTIFICADOS --

CREATE OR ALTER PROC SP_ELIMINAR_CERTIFICADO
(
    @CertificadoId INT
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRAN;

			DELETE FROM Certificados
			WHERE CertificadoId = @CertificadoId;

        COMMIT;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK;
        THROW;
    END CATCH
END;
GO


-- SP BUSCAR POR ID --

CREATE OR ALTER PROC SP_BUSCAR_CERTIFICADO_POR_ID
(
    @CertificadoId INT
)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        c.CertificadoId,
        c.FechaEmision,

        a.AsistenteId,
        a.InscripcionId,

        pc.PlantillaId,
        pc.NombrePlantilla
    FROM Certificados c
    INNER JOIN Asistentes a
        ON c.AsistenteId = a.AsistenteId
    INNER JOIN PlantillaCertificado pc
        ON c.PlantillaId = pc.PlantillaId
    WHERE c.CertificadoId = @CertificadoId;
END;
GO


-- SP FILTRAR CERTIFICADOS --

CREATE OR ALTER PROC SP_FILTRAR_CERTIFICADOS
(
    @AsistenteId INT = NULL,
    @PlantillaId INT = NULL,
    @FechaEmision DATE = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        c.CertificadoId,
        c.FechaEmision,

        a.AsistenteId,
        a.InscripcionId,

        pc.PlantillaId,
        pc.NombrePlantilla
    FROM Certificados c
    INNER JOIN Asistentes a
        ON c.AsistenteId = a.AsistenteId
    INNER JOIN PlantillaCertificado pc
        ON c.PlantillaId = pc.PlantillaId
    WHERE (@AsistenteId IS NULL OR c.AsistenteId = @AsistenteId)
      AND (@PlantillaId IS NULL OR c.PlantillaId = @PlantillaId)
      AND (@FechaEmision IS NULL OR c.FechaEmision = @FechaEmision);
END;
GO
