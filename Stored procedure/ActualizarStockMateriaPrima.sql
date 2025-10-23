DELIMITER //

CREATE PROCEDURE ActualizarStockMateriaPrima(
    IN p_id_materia INT,
    IN p_nuevo_stock INT
)
BEGIN
    UPDATE MateriaPrima
    SET stock_actual = p_nuevo_stock
    WHERE id_materia = p_id_materia;
END //

DELIMITER ;
