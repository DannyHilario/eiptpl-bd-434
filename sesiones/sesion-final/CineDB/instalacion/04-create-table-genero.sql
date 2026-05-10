-- Tema:        CineDB - Sesión Final
-- Descripción: Crear tabla Genero
-- Autor:       [Tu nombre]

CREATE TABLE Genero (
    idGenero INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Activo BIT NOT NULL DEFAULT 1
);
