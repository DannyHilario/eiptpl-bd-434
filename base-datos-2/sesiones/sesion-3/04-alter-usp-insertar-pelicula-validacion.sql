ALTER PROCEDURE usp_insertarPelicula
	@p_idClasificacion int,
	@p_idGenero int,
	@p_Nombre varchar(200),
	@p_Duracion int,
	@p_Director varchar(150),
	@p_AnioEstreno int
AS
BEGIN
	
	DECLARE @ErrCodigo varchar(10),
			@ErrMensaje varchar(200),
	
			@NombreClasificacion varchar(10),
			@NombreGenero varchar(50)
			
			
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
	
	SELECT 'Se saltó el IF'
	
END
