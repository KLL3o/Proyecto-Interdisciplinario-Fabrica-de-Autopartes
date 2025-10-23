DELIMITER //

CREATE PROCEDURE FinalizarOrdenProduccion(
    IN p_id_orden INT
)
BEGIN
    DECLARE v_id_autoparte INT;
    DECLARE v_cantidad INT;

    SELECT id_autoparte, cantidad INTO v_id_autoparte, v_cantidad
    FROM OrdenProduccion
    WHERE id_orden = p_id_orden;

    UPDATE Autoparte
    SET stock_actual = stock_actual + v_cantidad
    WHERE id_autoparte = v_id_autoparte;

    UPDATE OrdenProduccion
    SET estado = 'Finalizada', fecha_fin = CURDATE()
    WHERE id_orden = p_id_orden;
END //

DELIMITER ;
