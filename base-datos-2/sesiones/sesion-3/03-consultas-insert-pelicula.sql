SELECT * FROM Clasificacion
SELECT * FROM Genero
SELECT * FROM Pelicula
SELECT * FROM Funcion

INSERT INTO Pelicula	(idClasificacion, idGenero, Nombre, Duracion, Director,
						AnioEstreno, Activo)
						
VALUES 					(5,	9, 'Scary Movie', 120, 'Alejandro Ruiz',
						2026, 1)
						
EXECUTE sp_insertarPelicula 20, 9, 'Scary Movie 2. La venganza de alguien', 120, 'Alejandro Ruiz', 2027