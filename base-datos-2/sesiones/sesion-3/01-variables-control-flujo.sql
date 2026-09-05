-- Lenguaje T-SQL

-- Variables

DECLARE @Numero int,
		@Numero2 int,
		@Suma int
		
SET @Numero = 7
SET @Numero2 = 13
SET @Suma = @Numero + @Numero2

PRINT @Suma
SELECT @Suma
		
IF @Suma > 10 BEGIN

	PRINT 'El numero es mayor a 10'
	
END
ELSE BEGIN
	
	PRINT 'El numero es menor o igual a 10'

END

SELECT * FROM Cliente WHERE idCliente = 6

EXECUTE usp_obtenerNombreCliente 8




