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
INSERT INTO Marca (id, nombre) VALUES
(1, 'Fiat'),
(2, 'Ford'),
(3, 'Chevrolet'),
(4, 'Peugeot'),
(5, 'Renault'),
(6, 'Toyota');
INSERT INTO Piezas (id, nombre, codigo, tolerancia, peso) VALUES
(1, 'Bomba de Agua - Fiat Palio 1.4 (Marca Valeo)', NULL, NULL, NULL),
(2, 'Pastillas de Freno - Fiat Cronos/Argo (Fras-le)', NULL, NULL, NULL),
(3, 'Óptica Delantera - Fiat Uno Way (Depo)', NULL, NULL, NULL),
(4, 'Correa de Distribución - Fiat Siena 1.4 (Dayco)', NULL, NULL, NULL),
(5, 'Amortiguador Delantero - Fiat Argo (Monroe)', NULL, NULL, NULL),
(6, 'Filtro de Aire - Fiat Mobi (Mann)', NULL, NULL, NULL),
(7, 'Radiador - Fiat Punto 1.6 16v (Valeo)', NULL, NULL, NULL),
(8, 'Bujías Bosch Iridium - Fiat Fire (Bosch)', NULL, NULL, NULL),
(9, 'Bomba de Nafta - Fiat Uno/Palio (Magneti Marelli)', NULL, NULL, NULL),
(10, 'Termostato - Fiat Palio/Siena', NULL, NULL, NULL);
INSERT INTO Piezas (id, nombre, codigo, tolerancia, peso) VALUES
(11, 'Bujía Motorcraft SP-550 - Ford Ranger', NULL, NULL, NULL),
(12, 'Filtro de Aire - Ford Fiesta / Ka', NULL, NULL, NULL),
(13, 'Filtro de Aceite Motorcraft FL-910S', NULL, NULL, NULL),
(14, 'Pastillas de Freno - Ford Focus', NULL, NULL, NULL),
(15, 'Radiador de Agua - Ford Ranger', NULL, NULL, NULL),
(16, 'Amortiguadores Delanteros - Ford Ecosport', NULL, NULL, NULL),
(17, 'Motor de Arranque - Ford Ka', NULL, NULL, NULL),
(18, 'Alternador - Ford Focus II', NULL, NULL, NULL);
INSERT INTO Piezas (id, nombre, codigo, tolerancia, peso) VALUES
(19, 'Filtro de Aire – Chevrolet Corsa', NULL, NULL, NULL),
(20, 'Filtro de Aceite Chevrolet Cruze', NULL, NULL, NULL),
(21, 'Pastillas de Freno Onix / Prisma', NULL, NULL, NULL),
(22, 'Radiador Chevrolet S10', NULL, NULL, NULL),
(23, 'Amortiguador Delantero - Chevrolet Agile', NULL, NULL, NULL),
(24, 'Alternador Chevrolet Cruze', NULL, NULL, NULL),
(25, 'Bujías NGK / Denso - Chevrolet', NULL, NULL, NULL),
(26, 'Sensor MAP - Chevrolet Tracker', NULL, NULL, NULL),
(27, 'Kit de Embrague - Chevrolet Cruze', NULL, NULL, NULL),
(28, 'Batería 12V Chevrolet Spark / Agile', NULL, NULL, NULL);
INSERT INTO Piezas (id, nombre, codigo, tolerancia, peso) VALUES
(29, 'Filtro de Aceite Purflux - Peugeot', NULL, NULL, NULL),
(30, 'Bujías NGK Iridium - Peugeot', NULL, NULL, NULL),
(31, 'Filtro de Aire Mann-Filter - Peugeot', NULL, NULL, NULL),
(32, 'Pastillas de Freno TRW - Peugeot', NULL, NULL, NULL),
(33, 'Filtro de Cabina Bosch - Peugeot', NULL, NULL, NULL),
(34, 'Discos de Freno Brembo - Peugeot', NULL, NULL, NULL),
(35, 'Filtro de Nafta Mahle - Peugeot', NULL, NULL, NULL),
(36, 'Burro de Arranque Valeo - Peugeot', NULL, NULL, NULL),
(37, 'Alternador Valeo Original - Peugeot', NULL, NULL, NULL),
(38, 'Amortiguadores Monroe - Peugeot', NULL, NULL, NULL);
INSERT INTO Piezas (id, nombre, codigo, tolerancia, peso) VALUES
(39, 'Filtro de Aceite Purflux - Renault', NULL, NULL, NULL),
(40, 'Bujías Bosch Super Plus - Renault', NULL, NULL, NULL),
(41, 'Filtro de Aire Mann-Filter - Renault', NULL, NULL, NULL),
(42, 'Pastillas de Freno Fras-le - Renault', NULL, NULL, NULL),
(43, 'Filtro de Cabina Wix - Renault', NULL, NULL, NULL),
(44, 'Discos de Freno TRW - Renault', NULL, NULL, NULL),
(45, 'Filtro de Nafta Mahle - Renault', NULL, NULL, NULL),
(46, 'Burro de Arranque Valeo - Renault', NULL, NULL, NULL),
(47, 'Alternador Valeo Original - Renault', NULL, NULL, NULL),
(48, 'Amortiguadores Monroe - Renault', NULL, NULL, NULL);
INSERT INTO Piezas (id, nombre, codigo, tolerancia, peso) VALUES
(49, 'Filtro de Aceite Denso - Toyota', NULL, NULL, NULL),
(50, 'Bujías Denso Iridium - Toyota', NULL, NULL, NULL),
(51, 'Filtro de Aire Denso - Toyota', NULL, NULL, NULL),
(52, 'Pastillas de Freno TRW - Toyota', NULL, NULL, NULL),
(53, 'Filtro de Cabina Mann - Toyota', NULL, NULL, NULL),
(54, 'Discos de Freno Brembo - Toyota', NULL, NULL, NULL),
(55, 'Filtro de Nafta Toyota', NULL, NULL, NULL),
(56, 'Burro de Arranque Denso - Toyota', NULL, NULL, NULL),
(57, 'Alternador Denso 12V - Toyota', NULL, NULL, NULL),
(58, 'Amortiguadores Kayaba (KYB) - Toyota', NULL, NULL, NULL);
INSERT INTO Inventario (id, idPieza, stock, ubicacion) VALUES
(1, 1, 25, 'Depósito A - Estante 1'),
(2, 2, 40, 'Depósito A - Estante 1'),
(3, 3, 15, 'Depósito A - Estante 1'),
(4, 4, 30, 'Depósito A - Estante 1'),
(5, 5, 20, 'Depósito A - Estante 1'),
(6, 6, 35, 'Depósito A - Estante 1'),
(7, 7, 18, 'Depósito A - Estante 1'),
(8, 8, 50, 'Depósito A - Estante 1'),
(9, 9, 22, 'Depósito A - Estante 1'),
(10, 10, 12, 'Depósito A - Estante 1'),

(11, 11, 40, 'Depósito A - Estante 2'),
(12, 12, 28, 'Depósito A - Estante 2'),
(13, 13, 35, 'Depósito A - Estante 2'),
(14, 14, 18, 'Depósito A - Estante 2'),
(15, 15, 26, 'Depósito A - Estante 2'),
(16, 16, 19, 'Depósito A - Estante 2'),
(17, 17, 14, 'Depósito A - Estante 2'),
(18, 18, 22, 'Depósito A - Estante 2'),

(19, 19, 45, 'Depósito A - Estante 3'),
(20, 20, 33, 'Depósito A - Estante 3'),
(21, 21, 27, 'Depósito A - Estante 3'),
(22, 22, 18, 'Depósito A - Estante 3'),
(23, 23, 24, 'Depósito A - Estante 3'),
(24, 24, 15, 'Depósito A - Estante 3'),
(25, 25, 30, 'Depósito A - Estante 3'),
(26, 26, 20, 'Depósito A - Estante 3'),
(27, 27, 12, 'Depósito A - Estante 3'),
(28, 28, 17, 'Depósito A - Estante 3'),

(29, 29, 32, 'Depósito A - Estante 4'),
(30, 30, 45, 'Depósito A - Estante 4'),
(31, 31, 20, 'Depósito A - Estante 4'),
(32, 32, 16, 'Depósito A - Estante 4'),
(33, 33, 18, 'Depósito A - Estante 4'),
(34, 34, 22, 'Depósito A - Estante 4'),
(35, 35, 27, 'Depósito A - Estante 4'),
(36, 36, 14, 'Depósito A - Estante 4'),
(37, 37, 26, 'Depósito A - Estante 4'),
(38, 38, 19, 'Depósito A - Estante 4'),

(39, 39, 34, 'Depósito A - Estante 5'),
(40, 40, 29, 'Depósito A - Estante 5'),
(41, 41, 25, 'Depósito A - Estante 5'),
(42, 42, 20, 'Depósito A - Estante 5'),
(43, 43, 15, 'Depósito A - Estante 5'),
(44, 44, 18, 'Depósito A - Estante 5'),
(45, 45, 22, 'Depósito A - Estante 5'),
(46, 46, 12, 'Depósito A - Estante 5'),
(47, 47, 28, 'Depósito A - Estante 5'),
(48, 48, 16, 'Depósito A - Estante 5'),

(49, 49, 38, 'Depósito A - Estante 6'),
(50, 50, 24, 'Depósito A - Estante 6'),
(51, 51, 33, 'Depósito A - Estante 6'),
(52, 52, 19, 'Depósito A - Estante 6'),
(53, 53, 26, 'Depósito A - Estante 6'),
(54, 54, 14, 'Depósito A - Estante 6'),
(55, 55, 22, 'Depósito A - Estante 6'),
(56, 56, 17, 'Depósito A - Estante 6'),
(57, 57, 30, 'Depósito A - Estante 6'),
(58, 58, 21, 'Depósito A - Estante 6');
INSERT INTO Produccion (id, idMarca, tipoPieza, cantidad, fecha, turno, operario) VALUES
(1, 1, 1, 10, '2025-01-10', 'Mañana', 1),
(2, 1, 2, 12, '2025-01-10', 'Tarde', 1),
(3, 1, 3, 8, '2025-01-11', 'Noche', 1),
(4, 1, 4, 15, '2025-01-12', 'Mañana', 1),
(5, 1, 5, 6, '2025-01-12', 'Tarde', 1),
(6, 1, 6, 14, '2025-01-13', 'Noche', 1),
(7, 1, 7, 7, '2025-01-13', 'Mañana', 1),
(8, 1, 8, 18, '2025-01-14', 'Tarde', 1),
(9, 1, 9, 10, '2025-01-14', 'Noche', 1),
(10, 1, 10, 9, '2025-01-15', 'Mañana', 1),

(11, 2, 11, 17, '2025-01-15', 'Tarde', 1),
(12, 2, 12, 12, '2025-01-16', 'Noche', 1),
(13, 2, 13, 20, '2025-01-17', 'Mañana', 1),
(14, 2, 14, 11, '2025-01-17', 'Tarde', 1),
(15, 2, 15, 8, '2025-01-18', 'Noche', 1),
(16, 2, 16, 9, '2025-01-18', 'Mañana', 1),
(17, 2, 17, 13, '2025-01-19', 'Tarde', 1),
(18, 2, 18, 14, '2025-01-19', 'Noche', 1),

(19, 3, 19, 15, '2025-01-20', 'Mañana', 1),
(20, 3, 20, 10, '2025-01-20', 'Tarde', 1),
(21, 3, 21, 18, '2025-01-21', 'Noche', 1),
(22, 3, 22, 7, '2025-01-21', 'Mañana', 1),
(23, 3, 23, 9, '2025-01-22', 'Tarde', 1),
(24, 3, 24, 6, '2025-01-22', 'Noche', 1),
(25, 3, 25, 14, '2025-01-23', 'Mañana', 1),
(26, 3, 26, 11, '2025-01-23', 'Tarde', 1),
(27, 3, 27, 5, '2025-01-24', 'Noche', 1),
(28, 3, 28, 10, '2025-01-24', 'Mañana', 1),

(29, 4, 29, 8, '2025-01-25', 'Tarde', 1),
(30, 4, 30, 13, '2025-01-25', 'Noche', 1),
(31, 4, 31, 16, '2025-01-26', 'Mañana', 1),
(32, 4, 32, 10, '2025-01-26', 'Tarde', 1),
(33, 4, 33, 7, '2025-01-27', 'Noche', 1),
(34, 4, 34, 12, '2025-01-27', 'Mañana', 1),
(35, 4, 35, 9, '2025-01-28', 'Tarde', 1),
(36, 4, 36, 11, '2025-01-28', 'Noche', 1),
(37, 4, 37, 15, '2025-01-29', 'Mañana', 1),
(38, 4, 38, 6, '2025-01-29', 'Tarde', 1),

(39, 5, 39, 14, '2025-01-30', 'Noche', 1),
(40, 5, 40, 8, '2025-01-30', 'Mañana', 1),
(41, 5, 41, 11, '2025-01-31', 'Tarde', 1),
(42, 5, 42, 9, '2025-01-31', 'Noche', 1),
(43, 5, 43, 16, '2025-02-01', 'Mañana', 1),
(44, 5, 44, 5, '2025-02-01', 'Tarde', 1),
(45, 5, 45, 7, '2025-02-02', 'Noche', 1),
(46, 5, 46, 13, '2025-02-02', 'Mañana', 1),
(47, 5, 47, 8, '2025-02-03', 'Tarde', 1),
(48, 5, 48, 20, '2025-02-03', 'Noche', 1),

(49, 6, 49, 18, '2025-02-04', 'Mañana', 1),
(50, 6, 50, 12, '2025-02-04', 'Tarde', 1),
(51, 6, 51, 15, '2025-02-05', 'Noche', 1),
(52, 6, 52, 9, '2025-02-05', 'Mañana', 1),
(53, 6, 53, 11, '2025-02-06', 'Tarde', 1),
(54, 6, 54, 7, '2025-02-06', 'Noche', 1),
(55, 6, 55, 10, '2025-02-07', 'Mañana', 1),
(56, 6, 56, 13, '2025-02-07', 'Tarde', 1),
(57, 6, 57, 19, '2025-02-08', 'Noche', 1),
(58, 6, 58, 8, '2025-02-08', 'Mañana', 1);

