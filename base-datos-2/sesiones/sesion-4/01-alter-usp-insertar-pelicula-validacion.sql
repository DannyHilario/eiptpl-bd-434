ALTER PROCEDURE usp_insertarPelicula
	@p_idClasificacion int,
	@p_idGenero int,
	@p_Nombre varchar(200),
	@p_Duracion int,
	@p_Director varchar(150),
	@p_AnioEstreno int,
	@p_Activo bit
AS
BEGIN
	
	DECLARE @ErrCodigo varchar(10),
			@ErrMensaje varchar(200),
	
			@NombreClasificacion varchar(10),
			@NombreGenero varchar(50),

			@AnioMaximo int

	SET @AnioMaximo = 2100 -- HARDCODE
			
			
	-- Validación de la Clasificacion: Revisamos primero si el idClasificacion existe en la tabla
			
	SELECT
		@NombreClasificacion = Nombre
	FROM Clasificacion
	WHERE idClasificacion = @p_idClasificacion
	
	IF @NombreClasificacion IS NULL BEGIN
		
		SELECT 	@ErrCodigo = '000001',
				@ErrMensaje = 'La clasificacion no existe'
		
		SELECT	@ErrCodigo as ErrCodigo,
				@ErrMensaje as ErrMensaje
		
		RETURN
	END

	-- Validación del Genero: Revisamos primero si el idGenero existe en la tabla

	SELECT
		@NombreGenero = Nombre
	FROM Genero
	WHERE idGenero = @p_idGenero

	IF @NombreGenero IS NULL BEGIN
		
		SELECT 	@ErrCodigo = '000002',
				@ErrMensaje = 'El género no existe'
		
		SELECT	@ErrCodigo as ErrCodigo,
				@ErrMensaje as ErrMensaje
		
		RETURN
	END

	-- Validación del campo Duración: Debería ser un número positivo

	IF @p_Duracion <= 0 BEGIN
		
		SELECT 	@ErrCodigo = '000003',
				@ErrMensaje = 'La duración debe ser un número entero positivo'
		
		SELECT	@ErrCodigo as ErrCodigo,
				@ErrMensaje as ErrMensaje
		
		RETURN

	END

	-- Validación del campo Año de estreno: Debería ser un número positivo

	IF @p_AnioEstreno <= 0 OR @p_AnioEstreno >= @AnioMaximo BEGIN
		
		SELECT 	@ErrCodigo = '000004',
				@ErrMensaje = 'El año de estreno debe estar entre 1 y 2100'
		
		SELECT	@ErrCodigo as ErrCodigo,
				@ErrMensaje as ErrMensaje
		
		RETURN

	END
	
	INSERT INTO Pelicula (idClasificacion, idGenero, Nombre, Duracion, Director, AnioEstreno, Activo)	
	VALUES (
		@p_idClasificacion, 
		@p_idGenero, 
		@p_Nombre,
		@p_Duracion,
		@p_Director,
		@p_AnioEstreno,
		@p_Activo
	)

	SELECT 	@ErrCodigo = '000000',
			@ErrMensaje = 'Inserción correcta'
		
	SELECT	@ErrCodigo as ErrCodigo,
			@ErrMensaje as ErrMensaje
	
END
