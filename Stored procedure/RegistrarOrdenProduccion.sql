DELIMITER //

CREATE PROCEDURE RegistrarOrdenProduccion(
    IN p_id_autoparte INT,
    IN p_fecha_inicio DATE,
    IN p_fecha_fin DATE,
    IN p_cantidad INT,
    IN p_estado VARCHAR(30)
)
BEGIN
    INSERT INTO OrdenProduccion (fecha_inicio, fecha_fin, id_autoparte, cantidad, estado)
    VALUES (p_fecha_inicio, p_fecha_fin, p_id_autoparte, p_cantidad, p_estado);
END //

DELIMITER ;
