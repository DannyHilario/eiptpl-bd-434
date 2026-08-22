-- Ejercicio 1

SELECT
	UPPER(Nombre) as NombreMayusculas,
	UPPER(PrimerApellido) as PrimerApellidoMayusculas,
	UPPER(SegundoApellido) as SegundoApellidoMayusculas
FROM Cliente

--Ejercicio 2

SELECT
	Nombre,
	LOWER(Nombre) as PeliculaMinusculas
FROM Pelicula

--Ejercicio 3

SELECT
	PrimerApellido,
	SUBSTRING(PrimerApellido, 1, 3) as Codigo
FROM Cliente

-- Ejercicio 4

SELECT
	Director,
	LEN(Director) as Cantidad
FROM Pelicula
ORDER BY LEN(Director) DESC

-- Ejercicio 5

SELECT
	Precio,
	ROUND(Precio/3,2) as MontoPorPersona
FROM Funcion

-- Ejercicio 6

SELECT
	Nombre,
	Duracion,
	CAST(Duracion as varchar(10)) + ' min' as DuracionTexto,
	CONCAT(CAST(Duracion as varchar(10)), ' min') as DuracionTexto2
FROM Pelicula

-- Ejercicio 7

SELECT
	Precio,
	CAST(Precio as INT) as PrecioEntero
FROM Funcion

-- Ejercicio 8

SELECT
	-- Nombre,
	-- Director,
	-- CAST(AnioEstreno as varchar(10)) as AnioTexto,
	Nombre + ' dirigida por ' + Director + ' (' + CAST(AnioEstreno as varchar(10)) + ')'
FROM Pelicula

-- Ejercicio 9

SELECT
	--FechaPago,
	--HoraPago,
	--CAST(FechaPago as varchar(11)) as FechaPagoTexto,
	--CAST(HoraPago as varchar(10)) as HoraPagoTexto,
	'Compra realizada el ' + CAST(FechaPago as varchar(11)) + ' a las ' + SUBSTRING(CAST(HoraPago as varchar(11)), 1, 5)
FROM Boleto

-- Ejercicio 10

SELECT
	Nombre,
	PrimerApellido,
	SUBSTRING(Nombre, 1, 1) as InicialNombre,
	SUBSTRING(PrimerApellido, 1, 1) as InicialPrimerApellido,
	SUBSTRING(Nombre, 1, 1) + '.' + SUBSTRING(PrimerApellido, 1, 1) + '.' as Solucion
FROM Cliente