-- Tema:        Evidencia 3 - Consultas Simples
-- Descripción: Crear tabla Comanda (tabla desnormalizada de tickets de restaurante)
-- Autor:       [Tu nombre]

CREATE TABLE Comanda (
    idComanda INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    FechaComanda DATE NOT NULL,
    Cliente VARCHAR(100) NOT NULL,
    Mesero VARCHAR(100) NOT NULL,
    Mesa INT NOT NULL,
    MedioPago VARCHAR(30) NOT NULL,
    TotalPagado DECIMAL(10, 2) NOT NULL
);
