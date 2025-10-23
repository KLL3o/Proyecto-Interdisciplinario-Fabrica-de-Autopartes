CREATE DATABASE FabricaAutopartes;
USE FabricaAutopartes;

CREATE TABLE Empleado (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    cargo VARCHAR(50),
    salario DECIMAL(10,2),
    fecha_ingreso DATE
);

CREATE TABLE Proveedor (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    cuit VARCHAR(20),
    telefono VARCHAR(30),
    direccion VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE MateriaPrima (
    id_materia INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    tipo VARCHAR(50),
    unidad_medida VARCHAR(20),
    stock_actual INT DEFAULT 0,
    id_proveedor INT,
    FOREIGN KEY (id_proveedor) REFERENCES Proveedor(id_proveedor)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

CREATE TABLE Autoparte (
    id_autoparte INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio_unitario DECIMAL(10,2),
    stock_actual INT DEFAULT 0
);

CREATE TABLE Cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    cuit VARCHAR(20),
    direccion VARCHAR(100),
    telefono VARCHAR(30),
    email VARCHAR(100)
);

CREATE TABLE PedidoCliente (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    id_cliente INT,
    total DECIMAL(10,2) DEFAULT 0,
    estado VARCHAR(30) DEFAULT 'Pendiente',
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

CREATE TABLE DetallePedido (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    id_autoparte INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2),
    FOREIGN KEY (id_pedido) REFERENCES PedidoCliente(id_pedido)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (id_autoparte) REFERENCES Autoparte(id_autoparte)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE OrdenProduccion (
    id_orden INT AUTO_INCREMENT PRIMARY KEY,
    fecha_inicio DATE,
    fecha_fin DATE,
    id_autoparte INT,
    cantidad INT,
    estado VARCHAR(30) DEFAULT 'En proceso',
    FOREIGN KEY (id_autoparte) REFERENCES Autoparte(id_autoparte)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

CREATE TABLE DetalleOrden (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_orden INT,
    id_materia INT,
    cantidad_usada INT,
    FOREIGN KEY (id_orden) REFERENCES OrdenProduccion(id_orden)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (id_materia) REFERENCES MateriaPrima(id_materia)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE Compra (
    id_compra INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    id_proveedor INT,
    total DECIMAL(10,2) DEFAULT 0,
    estado VARCHAR(30) DEFAULT 'Pendiente',
    FOREIGN KEY (id_proveedor) REFERENCES Proveedor(id_proveedor)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

CREATE TABLE DetalleCompra (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_compra INT,
    id_materia INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2),
    FOREIGN KEY (id_compra) REFERENCES Compra(id_compra)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (id_materia) REFERENCES MateriaPrima(id_materia)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);
