-- Tema:        CineDB - Sesión Final
-- Descripción: Crear tabla Boleto
-- Autor:       [Tu nombre]

CREATE TABLE Boleto (
    idBoleto INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    idFuncion INT NOT NULL,
    idCliente INT NOT NULL,
    FechaPago DATE NOT NULL,
    HoraPago TIME NOT NULL,
    CONSTRAINT fk_Boleto_Funcion FOREIGN KEY (idFuncion) REFERENCES Funcion(idFuncion),
    CONSTRAINT fk_Boleto_Cliente FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);
