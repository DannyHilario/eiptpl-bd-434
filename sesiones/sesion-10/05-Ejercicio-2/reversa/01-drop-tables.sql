-- Tema:        Reversa Ejercicio 2 - Etapa 4
-- Descripción: Eliminar tablas en orden inverso a las llaves foráneas
-- Autor:       [Tu nombre]

-- Paso 1: OrdenServicio primero — depende de Vehiculo y de Servicio
DROP TABLE IF EXISTS OrdenServicio;

-- Paso 2: Vehiculo — depende de Cliente; ya no tiene dependientes
DROP TABLE IF EXISTS Vehiculo;

-- Paso 3: Servicio — ya no tiene dependientes tras eliminar OrdenServicio
DROP TABLE IF EXISTS Servicio;

-- Paso 4: Cliente — ya no tiene dependientes tras eliminar Vehiculo
DROP TABLE IF EXISTS Cliente;
