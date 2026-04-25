-- Tema:        Ejercicio 2 - Etapa 4
-- Descripción: Crear tabla Servicio
-- Autor:       [Tu nombre]

CREATE TABLE Servicio (
    idServicio INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Descripcion VARCHAR(100) NOT NULL,
    Costo DECIMAL(10,2) NOT NULL,
    Activo BIT NOT NULL DEFAULT 1
);
