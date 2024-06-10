--@author: Ricardo Vega
--@Date: 30-may-2024
--@Description: Synonym for rdvgbdd_s1

Prompt Validando sinonimos para pais 
select 
    (select count(*) from pais_f1) pais_f1,
    (select count(*) from pais_f2) pais_f2
from dual;

Prompt Validando sinonimos para sucursal
select 
    (select count(*) from sucursal_f1) sucursal_f1,
    (select count(*) from sucursal_f2) sucursal_f2,
    (select count(*) from sucursal_f3) sucursal_f3
from dual;

Prompt Validando sinonimos para auto
select 
    (select count(*) from auto_f1) auto_f1,
    (select count(*) from auto_f2) auto_f2,
    (select count(*) from auto_f3) auto_f3
from dual;

Prompt Validando sinonimos para auto_particular
select 
    (select count(*) from auto_particular_f1) auto_particular_f1,
    (select count(*) from auto_particular_f2) auto_particular_f2
from dual;

Prompt Validando sinonimos para auto_carga
select 
    (select count(*) from auto_carga_f1) auto_carga_f1,
    (select count(*) from auto_carga_f2) auto_carga_f2
from dual;

Prompt Validando sinonimos para Historico_status_auto
select 
    (select count(*) from HISTORICO_STATUS_AUTO_F1) HISTORICO_STATUS_AUTO_F1,
    (select count(*) from HISTORICO_STATUS_AUTO_F2) HISTORICO_STATUS_AUTO_F2
from dual;

Prompt Validando sinonimos para marca 
select 
    (select count(*) from marca_r1) marca_r1,
    (select count(*) from marca_r2) marca_r2,
    (select count(*) from marca_r3) marca_r3,
    (select count(*) from marca_r4) marca_r4
from dual;

Prompt Validando sinonimos para modelo 
select 
    (select count(*) from modelo_r1) modelo_r1,
    (select count(*) from modelo_r2) modelo_r2,
    (select count(*) from modelo_r3) modelo_r3,
    (select count(*) from modelo_r4) modelo_r4
from dual;

Prompt Validando sinonimos para cliente 
select 
    (select count(*) from cliente_f1) cliente_f1,
    (select count(*) from cliente_f2) cliente_f2,
    (select count(*) from cliente_f3) cliente_f3
from dual;

Prompt Validando sinonimos para tarjeta_cliente
select 
    (select count(*) from tarjeta_cliente_f1) tarjeta_cliente_f1,
    (select count(*) from tarjeta_cliente_f2) tarjeta_cliente_f2
from dual;

Prompt Validando sinonimos para pago_auto
select
    (select count(*) from pago_auto_f1) pago_auto_f1,
    (select count(*) from pago_auto_f2) pago_auto_f2,
    (select count(*) from pago_auto_f3) pago_auto_f3
from dual;