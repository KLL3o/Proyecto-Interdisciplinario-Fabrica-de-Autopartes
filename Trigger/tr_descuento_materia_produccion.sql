DELIMITER //

CREATE TRIGGER tr_descuento_materia_produccion
AFTER INSERT ON DetalleOrden
FOR EACH ROW
BEGIN
    UPDATE MateriaPrima
    SET stock_actual = stock_actual - NEW.cantidad_usada
    WHERE id_materia = NEW.id_materia;
END //

DELIMITER ;
