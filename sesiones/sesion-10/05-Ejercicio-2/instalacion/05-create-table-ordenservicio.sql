-- Tema:        Ejercicio 2 - Etapa 4
-- Descripción: Crear tabla OrdenServicio
-- Autor:       [Tu nombre]

CREATE TABLE OrdenServicio (
    idOrden INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    idVehiculo INT NOT NULL,
    idServicio INT NOT NULL,
    FechaIngreso DATE NOT NULL,
    CostoServicio DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_OrdenServicio_Vehiculo FOREIGN KEY (idVehiculo) REFERENCES Vehiculo(idVehiculo),
    CONSTRAINT fk_OrdenServicio_Servicio FOREIGN KEY (idServicio) REFERENCES Servicio(idServicio)
);
