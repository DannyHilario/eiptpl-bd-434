CREATE VIEW vw_PeliculasClasificacionGenero
AS
SELECT
	P.idPelicula,
	C.Nombre as Clasificacion,
	G.Nombre as Genero,
	P.Nombre as Pelicula,
	P.Duracion,
	P.Director,
	P.AnioEstreno
FROM Pelicula P
INNER JOIN Genero G ON P.idGenero = G.idGenero
INNER JOIN Clasificacion C ON P.idClasificacion = C.idClasificacion