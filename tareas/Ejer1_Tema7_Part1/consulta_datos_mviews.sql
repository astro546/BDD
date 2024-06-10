Prompt conectando a BD mview (aeggbdd_s2)
connect aegg_replica_bdd/aegg@aeggbdd_s2;

Prompt comprobando cambios en mv_auto
select auto_id, marca, modelo, anio, num_serie, tipo
from mv_auto
where agencia_id = 475;
select auto_id, precio, descuento, agencia_id, cliente_id 
from mv_auto
where agencia_id = 475;

Prompt comprobando cambios en mv_cliente
select cliente_id, nombre
from mv_cliente
where cliente_id = 88;

Prompt comprobando cambios en mv_agencia
select agencia_id, clave
from mv_agencia
where agencia_id = 190;
