DELIMITER //

CREATE PROCEDURE RegistrarDetalleOrden(
    IN p_id_orden INT,
    IN p_id_materia INT,
    IN p_cantidad_usada INT
)
BEGIN
    INSERT INTO DetalleOrden (id_orden, id_materia, cantidad_usada)
    VALUES (p_id_orden, p_id_materia, p_cantidad_usada);

    UPDATE MateriaPrima
    SET stock_actual = stock_actual - p_cantidad_usada
    WHERE id_materia = p_id_materia;
END //

DELIMITER ;
