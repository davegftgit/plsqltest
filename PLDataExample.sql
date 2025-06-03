CREATE OR REPLACE PROCEDURE actualizar_saldos IS
BEGIN
    -- Recorre todos los clientes que tienen pagos registrados
    FOR rec IN (
        SELECT p.id_cliente, SUM(p.monto_pagado) AS total_pagado
        FROM pagos p
        GROUP BY p.id_cliente
    ) LOOP
        -- Actualiza el saldo en la tabla clientes
        UPDATE clientes
        SET saldo = saldo - rec.total_pagado
        WHERE id_cliente = rec.id_cliente;
    END LOOP;
 
    COMMIT;
END actualizar_saldos
