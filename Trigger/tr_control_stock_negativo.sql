DELIMITER //

CREATE TRIGGER tr_control_stock_negativo_autoparte
BEFORE UPDATE ON Autoparte
FOR EACH ROW
BEGIN
    IF NEW.stock_actual < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Stock insuficiente en Autoparte';
    END IF;
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER tr_control_stock_negativo_materia
BEFORE UPDATE ON MateriaPrima
FOR EACH ROW
BEGIN
    IF NEW.stock_actual < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Stock insuficiente en Materia Prima';
    END IF;
END //

DELIMITER ;
