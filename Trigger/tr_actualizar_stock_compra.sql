DELIMITER //

CREATE TRIGGER tr_actualizar_stock_compra
AFTER INSERT ON DetalleCompra
FOR EACH ROW
BEGIN
    UPDATE MateriaPrima
    SET stock_actual = stock_actual + NEW.cantidad
    WHERE id_materia = NEW.id_materia;
END //

DELIMITER ;
