ALTER PROCEDURE usp_eliminarPelicula
    @p_idPelicula int
AS
BEGIN

    DECLARE @ErrCodigo varchar(10),
			@ErrMensaje varchar(200),
	
			@NombrePelicula varchar(200)

    -- Validación de la Pelicula: Revisamos primero si el idPelicula existe en la tabla
			
	SELECT
		@NombrePelicula = Nombre
	FROM Pelicula
	WHERE idPelicula = @p_idPelicula
	
	IF @NombrePelicula IS NULL BEGIN
		
		SELECT 	@ErrCodigo = '000001',
				@ErrMensaje = 'La pelicula no existe'
		
		SELECT	@ErrCodigo as ErrCodigo,
				@ErrMensaje as ErrMensaje
		
		RETURN
	END

    UPDATE Pelicula
    SET Activo = 0
    WHERE idPelicula = @p_idPelicula

    SELECT 	@ErrCodigo = '000000',
			@ErrMensaje = 'Eliminación correcta'
		
	SELECT	@ErrCodigo as ErrCodigo,
			@ErrMensaje as ErrMensaje
	

END