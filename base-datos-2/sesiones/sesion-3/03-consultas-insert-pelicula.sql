SELECT * FROM Clasificacion
SELECT * FROM Genero
SELECT * FROM Pelicula where idPelicula = 30
SELECT 
	idPelicula, Nombre, Activo
FROM Pelicula 
WHERE Director = 'Alejandro Ruiz'
order by idPelicula DESC
SELECT * FROM Funcion order by idFuncion DESC
SELECT * FROM TipoSala
SELECT * FROM Sala

EXECUTE sp_eliminarPelicula 33

SELECT * FROM Pelicula where idPelicula = 30
SELECT * FROM Funcion WHERE idFuncion = 90
SELECT * FROM Boleto where idFuncion = 90

DELETE FROM Pelicula
WHERE idPelicula = 30

SELECT * FROM Boleto
where idFuncion = 90


select * from vw_PeliculasClasificacionGenero

INSERT INTO Pelicula	(idClasificacion, idGenero, Nombre, Duracion, Director,
						AnioEstreno, Activo)
						
VALUES 					(5,	9, 'Scary Movie', 120, 'Alejandro Ruiz',
						2026, 1)
						
EXECUTE sp_insertarPelicula 4, 9, 'Scary Movie 3. La venganza de alguien otra vez claro que si', 185, 'Alejandro Ruiz', 2028, 0

EXECUTE sp_insertarPelicula 1, 16, 'Scary Movie 4. La venganza de Ale vs Sama', 20, 'Alejandro Ruiz', 2025, 1


