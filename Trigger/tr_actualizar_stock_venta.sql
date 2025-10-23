DELIMITER //

CREATE TRIGGER tr_actualizar_stock_venta
AFTER INSERT ON DetallePedido
FOR EACH ROW
BEGIN
    UPDATE Autoparte
    SET stock_actual = stock_actual - NEW.cantidad
    WHERE id_autoparte = NEW.id_autoparte;
END //

DELIMITER ;
