DROP DATABASE IF NOT EXISTS gimnasio_db;
CREATE DATABASE gimnasio_db;
USE gimnasio_db;

CREATE TABLE gimnasio (
    id_gimnasio INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion TEXT,
    telefono VARCHAR(30)
);

CREATE TABLE culturistas (
    id_culturista INT AUTO_INCREMENT PRIMARY KEY,
    numero_socio VARCHAR(50),
    dni VARCHAR(20),
    nombre VARCHAR(50),
    telefono VARCHAR(30)
);

CREATE TABLE administrador (
    id_admin INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    edad INT,
    telefono VARCHAR(30)
);

CREATE TABLE empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    telefono VARCHAR(30),
    id_admin_supervisor INT,
    FOREIGN KEY (id_admin_supervisor) REFERENCES administrador(id_admin)
);

CREATE TABLE categoria_suplemento (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    descripcion TEXT
);

CREATE TABLE suplementos (
    id_suplemento INT AUTO_INCREMENT PRIMARY KEY,
    id_categoria INT,
    id_gimnasio INT,
    nombre VARCHAR(200) NOT NULL,
    marca VARCHAR(120),
    precio DECIMAL(10,2),
    stock INT,
    descripcion TEXT,
    sabores TEXT,
    lote DATE,
    FOREIGN KEY (id_categoria) REFERENCES categoria_suplemento(id_categoria),
    FOREIGN KEY (id_gimnasio) REFERENCES gimnasio(id_gimnasio)
);

CREATE TABLE ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_culturista INT,
    id_empleado INT,
    fecha DATE,
    total DECIMAL(10,2),
    FOREIGN KEY (id_culturista) REFERENCES culturistas(id_culturista),
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
);

CREATE TABLE venta_items (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT,
    id_suplemento INT,
    cantidad INT,
    precio_unitario DECIMAL(10,2),
    FOREIGN KEY (id_venta) REFERENCES ventas(id_venta),
    FOREIGN KEY (id_suplemento) REFERENCES suplementos(id_suplemento)
);

CREATE TABLE compras (
    id_compra INT AUTO_INCREMENT PRIMARY KEY,
    proveedor VARCHAR(200),
    fecha DATE,
    total DECIMAL(10,2)
);

CREATE TABLE compra_items (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_compra INT,
    id_suplemento INT,
    cantidad INT,
    precio_unitario DECIMAL(10,2),
    FOREIGN KEY (id_compra) REFERENCES compras(id_compra),
    FOREIGN KEY (id_suplemento) REFERENCES suplementos(id_suplemento)
);

INSERT INTO categoria_suplemento (id_categoria, nombre, descripcion) VALUES
(1,'Creatina','Creatinas monohidratadas y variantes'),
(2,'Proteina','Proteínas en polvo, aisladas, mezclas'),
(3,'Rendimiento','Pre-entreno, beta-alanina, BCAA, EAA, NO'),
(4,'Ganancia','Mass gainers, glutamina, HMB, ZMA'),
(5,'Quema y Definicion','Termogenicos, carnitina, CLA, te verde'),
(6,'Salud y Recuperacion','Multivitaminicos, Omega-3, magnesio, D3, probioticos'),
(7,'Snacks y Formatos','Barritas, RTD, gomitas, mantequillas');

INSERT INTO gimnasio (id_gimnasio, nombre, direccion, telefono) VALUES
(1,'Gimnasio Central', 'Av. Principal 123', '+54-11-1234-5678');

INSERT INTO administrador (id_admin, nombre, edad, telefono) VALUES
(1,'María Perez', 34, '+54-11-4000-0000');

INSERT INTO empleados (id_empleado, nombre, telefono, id_admin_supervisor) VALUES
(1,'Juan Gomez', '+54-11-4111-2222', 1);

INSERT INTO culturistas (id_culturista, numero_socio, dni, nombre, telefono) VALUES
(1,'S-0001','12345678','Federico Lopez','+54-9-11-5555-6666'),
(2,'S-0002','87654321','Camila Ruiz','+54-9-11-7777-8888');

INSERT INTO suplementos (id_suplemento, id_categoria, id_gimnasio, nombre, marca, precio, stock, descripcion, sabores, lote) VALUES
(1,1,1,'Creatina Monohidratada Micronizada','Nutricost',1599.00,50,'Creatina micronizada 300g','Frambuesa azul, Ponche de frutas, Sandía, Piña con mango, Sin sabor','2025-01-10'),
(2,1,1,'Creatina en Polvo','Cellucor',1799.00,30,'Creatina en polvo 300g','Sandía, Ponche de frutas','2025-01-12'),
(3,1,1,'Recharge Creatina Monohidratada','Legion',1999.00,40,'Creatina micronizada','Frambuesa azul, Ponche de frutas, Uva, Fresa con kiwi, Limonada de fresa, Sandía, Sin sabor','2025-01-15'),
(4,2,1,'Gold Standard 100% Whey Protein','Optimum Nutrition',7499.00,20,'Proteína en polvo 2.27kg','Chocolate doble, Helado de vainilla, Fresas con crema, Cereal frutado, Chocolate con mantequilla de maní, Crema de banana, Roll de canela, Café, Galletas con crema','2025-01-18'),
(5,2,1,'ISO 100 Hydrolyzed Whey Protein Isolate','Dymatize',8999.00,15,'Aislado hidrolizado 1.6kg','Torta de cumpleaños, Cereal frutado, Chocolate, Frutilla, Chocolate con mantequilla de maní, Vainilla, Cereal de cacao, Cereal con canela','2025-01-20'),
(6,2,1,'Syntha-6 Whey Protein Matrix','BSN',6999.00,18,'Mezcla de proteínas','Batido de chocolate, Helado de vainilla, Batido de frutilla, Torta Cold Stone','2025-01-22'),
(7,3,1,'Pre-entreno X','MarcaX',2799.00,25,'Pre-entreno con cafeína','Sin sabor','2025-01-25'),
(8,4,1,'Mass Gainer 5kg','MarcaY',12999.00,8,'Gainer para aumento de masa','Sin sabor','2025-01-28'),
(9,5,1,'Termogénico Z','MarcaZ',3499.00,30,'Termogénico para definición','Sin sabor','2025-02-01'),
(10,6,1,'Omega-3 1000mg','HealthCo',1199.00,60,'Aceite de pescado - 120 cápsulas','Sin sabor','2025-02-03'),
(11,7,1,'Barrita Proteica','SnackFit',399.00,120,'Barrita de proteína 60g','Sin sabor','2025-02-05'),
(12,3,1,'BCAA + EAA','MarcaBCAA',2999.00,40,'Aminoácidos ramificados y esenciales','Sin sabor','2025-02-07'),
(13,3,1,'Beta-Alanina','MarcaBeta',1499.00,50,'Beta-alanina para rendimiento','Sin sabor','2025-02-10'),
(14,6,1,'Multivitamínico Deportivo','MarcaVit',799.00,100,'Vitaminas y minerales','Sin sabor','2025-02-12'),
(15,6,1,'Colágeno Hidrolizado','MarcaCol',1299.00,80,'Colágeno para piel y articulaciones','Sin sabor','2025-02-14'),
(16,6,1,'Probióticos','MarcaPro',999.00,70,'Salud intestinal','Sin sabor','2025-02-16'),
(17,7,1,'Batido Vegano RTD','MarcaVeg',699.00,60,'Proteína lista para tomar','Chocolate, Vainilla, Fresa','2025-02-18'),
(18,7,1,'Mantequilla Proteica de Maní','MarcaNut',499.00,90,'Snack proteico','Sin sabor','2025-02-20'),
(19,3,1,'Óxido Nítrico','MarcaNO',1599.00,35,'Vasodilatador','Sin sabor','2025-02-22'),
(20,5,1,'Termogénico Avanzado','MarcaThermo',3999.00,25,'Quemador de grasa','Sin sabor','2025-02-25'),
(21,3,1,'Cafeína Pura','MarcaCafe',799.00,60,'Energía y enfoque','Sin sabor','2025-02-28'),
(22,3,1,'Rhodiola Rosea','MarcaRho',899.00,40,'Adaptógeno','Sin sabor','2025-03-02'),
(23,3,1,'Ashwagandha','MarcaAsh',999.00,50,'Reducción de estrés','Sin sabor','2025-03-05');

INSERT INTO ventas (id_venta, id_culturista, id_empleado, total, fecha) VALUES
(1, 1, 1, 3198.00, '2025-03-10');

INSERT INTO venta_items (id_item, id_venta, id_suplemento, cantidad, precio_unitario) VALUES
(1, 1, 1, 2, 1599.00);

INSERT INTO compras (id_compra, proveedor, fecha, total) VALUES
(1,'Proveedor Central','2025-01-05',12000.00),
(2,'Proveedor Fitness','2025-02-01',18000.00);

INSERT INTO compra_items (id_item, id_compra, id_suplemento, cantidad, precio_unitario) VALUES
(1,1,1,50,1599.00),
(2,1,2,30,1799.00),
(3,2,4,20,7499.00),
(4,2,5,15,8999.00);
