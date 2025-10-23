DELIMITER //

CREATE PROCEDURE RegistrarCompraProveedor(
    IN p_id_proveedor INT,
    IN p_fecha DATE,
    IN p_estado VARCHAR(30),
    IN p_id_materia INT,
    IN p_cantidad INT,
    IN p_precio DECIMAL(10,2)
)
BEGIN
    DECLARE v_total DECIMAL(10,2);
    DECLARE v_id_compra INT;

    SET v_total = p_cantidad * p_precio;

    INSERT INTO Compra (fecha, id_proveedor, total, estado)
    VALUES (p_fecha, p_id_proveedor, v_total, p_estado);

    SET v_id_compra = LAST_INSERT_ID();

    INSERT INTO DetalleCompra (id_compra, id_materia, cantidad, precio_unitario)
    VALUES (v_id_compra, p_id_materia, p_cantidad, p_precio);

    UPDATE MateriaPrima
    SET stock_actual = stock_actual + p_cantidad
    WHERE id_materia = p_id_materia;
END //

DELIMITER ;
