Prompt conectandose a BD master (aeggbdd_s1)
connect aegg_replica_bdd@aeggbdd_s1;

Prompt creando vistas materializadas
create materialized view log on agencia with primary key (clave);
create materialized view log on auto with primary key (tipo);
create materialized view log on cliente;

-- Se agregan cliente_id y agencia_id al mlog de auto
-- porque son columnas usadas en las subconsultas de mv_cliente,
-- ademas de que en esa consulta auto no es la tabla principal
alter materialized view log on auto add (cliente_id);
alter materialized view log on auto add (agencia_id);