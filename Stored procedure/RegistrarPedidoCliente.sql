DELIMITER //

CREATE PROCEDURE RegistrarPedidoCliente(
    IN p_id_cliente INT,
    IN p_fecha DATE,
    IN p_estado VARCHAR(30),
    IN p_id_autoparte INT,
    IN p_cantidad INT
)
BEGIN
    DECLARE v_precio DECIMAL(10,2);
    DECLARE v_total DECIMAL(10,2);
    DECLARE v_id_pedido INT;

    SELECT precio_unitario INTO v_precio
    FROM Autoparte
    WHERE id_autoparte = p_id_autoparte;

    SET v_total = v_precio * p_cantidad;

    INSERT INTO PedidoCliente (fecha, id_cliente, total, estado)
    VALUES (p_fecha, p_id_cliente, v_total, p_estado);

    SET v_id_pedido = LAST_INSERT_ID();

    INSERT INTO DetallePedido (id_pedido, id_autoparte, cantidad, precio_unitario)
    VALUES (v_id_pedido, p_id_autoparte, p_cantidad, v_precio);

    UPDATE Autoparte
    SET stock_actual = stock_actual - p_cantidad
    WHERE id_autoparte = p_id_autoparte;
END //

DELIMITER ;
