USE BD_FinanCore;
GO

DECLARE @respuesta VARCHAR(200);

EXEC usp_RegistrarTransferencia 
    @id_cuenta_origen = 1,
    @numero_cuenta_destino = '191-00029910-0-01',
    @monto = 500.00,
    @glosa = 'Prueba exitosa en SSMS',
    @id_usuario = 1,
    @mensaje = @respuesta OUTPUT;

SELECT @respuesta AS Resultado;
SELECT id_cuenta, numero_cuenta, moneda, saldo_actual FROM tb_cuentas;
SELECT * FROM tb_movimientos;

DECLARE @respuesta_error VARCHAR(200);

EXEC usp_RegistrarTransferencia 
    @id_cuenta_origen = 1,
    @numero_cuenta_destino = '191-00029910-0-01',
    @monto = 50000.00,
    @glosa = 'Prueba de fallo por saldo insuficiente',
    @id_usuario = 1,
    @mensaje = @respuesta_error OUTPUT;

SELECT @respuesta_error AS Resultado;
SELECT id_cuenta, numero_cuenta, moneda, saldo_actual FROM tb_cuentas;