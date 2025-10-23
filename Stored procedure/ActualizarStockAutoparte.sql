DELIMITER //

CREATE PROCEDURE ActualizarStockAutoparte(
    IN p_id_autoparte INT,
    IN p_nuevo_stock INT
)
BEGIN
    UPDATE Autoparte
    SET stock_actual = p_nuevo_stock
    WHERE id_autoparte = p_id_autoparte;
END //

DELIMITER ;
