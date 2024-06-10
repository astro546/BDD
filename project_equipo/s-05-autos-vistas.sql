--@author: Ricardo Vega
--@Date: 30-may-2024
--@Description: Create views to tables without columns of type blob

Prompt view pais 
create or replace view pais as 
    select * from pais_f1
    union all 
    select * from pais_f2;

Prompt view sucursal
create or replace view sucursal as 
    select * from sucursal_f1
    union all 
    select * from sucursal_f2
    union all 
    select * from sucursal_f3;

Prompt view Historico_status_auto
create or replace view Historico_status_auto as 
    select * from HISTORICO_STATUS_AUTO_F1
    union all 
    select * from HISTORICO_STATUS_AUTO_F2;

Prompt view Cliente 
create or replace view cliente as 
    select * from cliente_f1
    union all 
    select * from cliente_f2
    union all 
    select * from cliente_f3;

Prompt view Auto_carga 
create or replace view auto_carga as 
    select * from auto_carga_f1
    union all 
    select * from auto_carga_f2;

Prompt view auto_particular 
create or replace view auto_particular as 
    select * from auto_particular_f1
    union all 
    select * from auto_particular_f2;

Prompt view marca 
create or replace view marca as 
    select * from marca_r1;

Prompt view modelo 
create or replace view modelo as 
    select * from modelo_r1;

Prompt view Tarjeta 
create or replace view tarjeta_cliente as 
    select tf1.cliente_id, tf2.num_tarjeta, tf1.anio_expira, tf1.mes_expira, 
    tf2.codigo_seguridad, tf1.tipo 
    from tarjeta_cliente_f1 tf1, tarjeta_cliente_f2 tf2 
    where tf1.cliente_id=tf2.cliente_id;
