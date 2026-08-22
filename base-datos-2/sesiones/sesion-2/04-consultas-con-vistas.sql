SELECT * FROM Pelicula
SELECT * FROM Clasificacion
SELECT * FROM Genero

SELECT
	idGenero,
	COUNT(Nombre) as Cantidad
FROM Pelicula
GROUP BY idGenero

SELECT
	P.idPelicula,
	C.Nombre as NombreClasificacion,
	G.Nombre as NombreGenero,
	P.Nombre as NombrePelicula,
	P.Duracion,
	P.Director,
	P.AnioEstreno
FROM Pelicula P
INNER JOIN Genero G ON P.idGenero = G.idGenero
INNER JOIN Clasificacion C ON P.idClasificacion = C.idClasificacion

SELECT * from vw_PeliculasClasificacionGenero


-- Sin vistas

SELECT
	G.Nombre,
	COUNT(P.idPelicula) as Cantidad
FROM Pelicula P
INNER JOIN Genero G ON P.idGenero = G.idGenero
INNER JOIN Clasificacion C ON P.idClasificacion = C.idClasificacion
GROUP BY G.Nombre

-- Con vistas

SELECT
	Genero,
	COUNT(idPelicula) as Cantidad
FROM vw_PeliculasClasificacionGenero
GROUP BY Genero


-- ============================================================
-- CONSULTA 13 — INNER JOIN entre cinco tablas
-- Detalle completo de cada función: sala, tipo de sala,
-- precio y película proyectada.
-- Temas: INNER JOIN encadenado con cinco tablas
-- ============================================================
SELECT F.idFuncion, P.Nombre AS Pelicula,
    S.Nombre AS Sala, TS.Descripcion AS TipoSala,
    F.Fecha, F.Hora, F.Precio
FROM Funcion AS F
    INNER JOIN Pelicula AS P ON P.idPelicula = F.idPelicula
    INNER JOIN Sala AS S ON S.idSala = F.idSala
    INNER JOIN TipoSala AS TS ON TS.idTipoSala = S.idTipoSala
    INNER JOIN Clasificacion AS CL ON CL.idClasificacion = P.idClasificacion
ORDER BY F.Fecha, F.Hora

SELECT * FROM vw_ReporteFunciones