CREATE TABLE marca (
    id INT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE Operarios (
    id INT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE Piezas (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    codigo VARCHAR(50),
    tolerancia DECIMAL(10,4),
    peso DECIMAL(10,2)
);

CREATE TABLE Materiales (
    id INT PRIMARY KEY,
    tipo VARCHAR(100),
    stock INT,
    unidad VARCHAR(20)
);

CREATE TABLE Maquinas (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    modelo VARCHAR(100),
    estado VARCHAR(50),
    ultimaRevision DATE
);

CREATE TABLE Produccion (
    id INT PRIMARY KEY,
    idmarca INT,
    tipoPieza INT,
    cantidad INT,
    fecha DATE,
    turno VARCHAR(20),
    operario INT,
    FOREIGN KEY (idmarca) REFERENCES marca(id),
    FOREIGN KEY (tipoPieza) REFERENCES Piezas(id),
    FOREIGN KEY (operario) REFERENCES Operarios(id)
);

CREATE TABLE Calidad (
    id INT PRIMARY KEY,
    idProduccion INT,
    resultado VARCHAR(50),
    observaciones TEXT,
    inspector VARCHAR(100),
    FOREIGN KEY (idProduccion) REFERENCES Produccion(id)
);

CREATE TABLE Mantenimiento (
    id INT PRIMARY KEY,
    idMaquina INT,
    fecha DATE,
    tipo VARCHAR(100),
    tecnico VARCHAR(100),
    estado VARCHAR(50),
    FOREIGN KEY (idMaquina) REFERENCES Maquinas(id)
);

CREATE TABLE Inventario (
    id INT PRIMARY KEY,
    idPieza INT,
    stock INT,
    ubicacion VARCHAR(100),
    FOREIGN KEY (idPieza) REFERENCES Piezas(id)
);
