USE ViajeYA

-- Tabla Cliente
CREATE TABLE Cliente (
    idCliente INT IDENTITY(1,1) PRIMARY KEY,
    PrimerApellido VARCHAR(50) NOT NULL,
    SegundoApellido VARCHAR(50) NOT NULL,
    Nombre VARCHAR(50) NOT NULL
);

-- Tabla Pais
CREATE TABLE Pais (
    idPais INT IDENTITY(1,1) PRIMARY KEY,
    NombrePais VARCHAR(100) NOT NULL UNIQUE
);

-- Tabla TipoPaquete
CREATE TABLE TipoPaquete (
    idTipoPaquete INT IDENTITY(1,1) PRIMARY KEY,
    NombrePaquete VARCHAR(100) NOT NULL,
    PrecioActual DECIMAL(10,2) NOT NULL,
    CONSTRAINT CHK_PrecioActual CHECK (PrecioActual > 0)
);

-- Tabla Destino
CREATE TABLE Destino (
    idDestino INT IDENTITY(1,1) PRIMARY KEY,
    idPais INT NOT NULL,
    idTipoPaquete INT NOT NULL,
    NombreDestino VARCHAR(100) NOT NULL,
    CONSTRAINT FK_Destino_Pais 
        FOREIGN KEY (idPais) 
        REFERENCES Pais(idPais)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT FK_Destino_TipoPaquete 
        FOREIGN KEY (idTipoPaquete) 
        REFERENCES TipoPaquete(idTipoPaquete)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Tabla Reservacion
CREATE TABLE Reservacion (
    idReservacion INT IDENTITY(1,1) PRIMARY KEY,
    idCliente INT NOT NULL,
    idDestino INT NOT NULL,
    FechaSalida DATE NOT NULL,
    NumeroNoches INT NOT NULL,
    PrecioAlMomento DECIMAL(10,2) NOT NULL,
    TotalAPagar DECIMAL(10,2) NOT NULL,
    CONSTRAINT FK_Reservacion_Cliente 
        FOREIGN KEY (idCliente) 
        REFERENCES Cliente(idCliente)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT FK_Reservacion_Destino 
        FOREIGN KEY (idDestino) 
        REFERENCES Destino(idDestino)
        ON DELETE NO ACTION
        ON UPDATE CASCADE,
    CONSTRAINT CHK_NumeroNoches CHECK (NumeroNoches > 0),
    CONSTRAINT CHK_PrecioAlMomento CHECK (PrecioAlMomento > 0),
    CONSTRAINT CHK_TotalAPagar CHECK (TotalAPagar > 0)
);