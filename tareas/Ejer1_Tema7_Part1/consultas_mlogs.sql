Prompt conectando a aeggbdd_s1
connect aegg_replica_bdd/aegg@aeggbdd_s1;

Prompt consultando mlog de cliente
select cliente_id,snaptime$$,dmltype$$
from mlog$_cliente;

Prompt consultando mlog de auto
select tipo,cliente_id,agencia_id,snaptime$$,dmltype$$
from mlog$_auto;

Prompt consultando mlog de agencia
select clave,snaptime$$,dmltype$$
from mlog$_agencia;