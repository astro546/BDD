--@author: Ricardo Vega
--@Date: 30-may-2024
--@Description: Create function to manage blob's

Prompt Creando vistas que requieren acceso remoto 
Prompt Auto 
create or replace view auto as 
    select q1.auto_id, q1.anio, q1.num_serie, q1.tipo, q1.precio, 
        get_remote_foto_f1_by_id(q1.auto_id) as foto,
        q1.fecha_status, q1.sucursal_id, q1.status_auto_id, q1.modelo_id 
    from (
        select * from auto_f2
        union all 
        select * from auto_f3
    ) q1;

Prompt pago_auto
create or replace view pago_auto as 
    select q1.* 
    from (
        select p1.cliente_id, p1.auto_id, p1.fecha_pago, p1.importe,
        get_remote_r_pago_f1_by_id(p1.cliente_id, p1.auto_id) as recibo_pago
        from pago_auto_f1 p1
        union all 
        select p2.cliente_id, p2.auto_id, p2.fecha_pago, p2.importe,
        get_remote_r_pago_f1_by_id(p2.cliente_id, p2.auto_id) as recibo_pago
        from pago_auto_f2 p2
        union all 
        select p3.cliente_id, p3.auto_id, p3.fecha_pago, p3.importe,
        get_remote_r_pago_f1_by_id(p3.cliente_id, p3.auto_id) as recibo_pago                
        from pago_auto_f3 p3
    )q1;