CREATE OR REPLACE PROCEDURE actualizar_saldos IS

BEGIN

    -- Actualiza los saldos directamente restando los pagos

    UPDATE clientes c

    SET saldo = saldo - (

        SELECT SUM(p.monto_pagado)

        FROM pagos p

        WHERE p.id_cliente = c.id_cliente

    )

    WHERE EXISTS (

        SELECT 1

        FROM pagos p

        WHERE p.id_cliente = c.id_cliente

    );
 
    COMMIT;

END actualizar_saldos;
