CREATE VIEW vw_ReporteFunciones
AS
SELECT F.idFuncion, P.Nombre AS Pelicula,
    S.Nombre AS Sala, TS.Descripcion AS TipoSala,
    F.Fecha, F.Hora, F.Precio
FROM Funcion AS F
    INNER JOIN Pelicula AS P ON P.idPelicula = F.idPelicula
    INNER JOIN Sala AS S ON S.idSala = F.idSala
    INNER JOIN TipoSala AS TS ON TS.idTipoSala = S.idTipoSala
    INNER JOIN Clasificacion AS CL ON CL.idClasificacion = P.idClasificacion