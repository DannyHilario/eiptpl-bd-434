/*
 * Crear un procedimiento almacenado que, dado el id de un cliente, devuelva su nombre completo.
 * Si el cliente no existe, entonces deberá escribir "Cliente NO EXISTENTE"
 * 
 */

CREATE PROCEDURE sp_obtenerNombreCliente
	@p_idCliente int
AS
BEGIN
	
	DECLARE	@PrimerApellido varchar(50),
			@SegundoApellido varchar(50),
			@Nombre varchar(100)
			
			
	SELECT
		@PrimerApellido = PrimerApellido,
		@SegundoApellido = SegundoApellido,
		@Nombre  = Nombre
	FROM Cliente
	WHERE idCliente = @p_idCliente
	
	IF @PrimerApellido IS NOT NULL BEGIN
		
		SELECT @PrimerApellido + ' ' + @SegundoApellido + ' ' + @Nombre
		
	END
	
	ELSE BEGIN
		
		SELECT 'El cliente no existe'
		
	END
	
END
