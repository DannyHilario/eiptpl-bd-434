SELECT *
FROM Alumno;

SELECT Nombre, Edad
FROM Alumno
WHERE Edad >= 30;

SELECT	idAlumno as ClaveAlumno,
		PrimerApellido + ' ' + SegundoApellido + ' ' + Nombre as NombreCompleto,
		Edad,
		Sexo
FROM Alumno
WHERE Edad = 21 AND Sexo = 'H';