DELIMITER //

CREATE TRIGGER tr_aumento_autoparte_finalizacion
AFTER UPDATE ON OrdenProduccion
FOR EACH ROW
BEGIN
    IF NEW.estado = 'Finalizada' AND OLD.estado <> 'Finalizada' THEN
        UPDATE Autoparte
        SET stock_actual = stock_actual + NEW.cantidad
        WHERE id_autoparte = NEW.id_autoparte;
    END IF;
END //

DELIMITER ;
