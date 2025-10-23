DELIMITER //

CREATE PROCEDURE ConsultarInventario()
BEGIN
    SELECT 'Autopartes' AS tipo, id_autoparte AS id, nombre, stock_actual
    FROM Autoparte
    UNION ALL
    SELECT 'Materia Prima', id_materia, nombre, stock_actual
    FROM MateriaPrima;
END //

DELIMITER ;
