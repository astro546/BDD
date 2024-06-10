Prompt conectandose a BD mview (aeggbdd_s2)
connect aegg_replica_bdd/aegg@aeggbdd_s2

begin
  dbms_refresh.destroy(
    name                 => 'agencia_auto_cliente_g1'
  );
end;
/

drop materialized view mv_agencia;
drop materialized view mv_auto;
drop materialized view mv_cliente;

Prompt conectandose a BD master
connect aegg_replica_bdd/aegg@aeggbdd_s1

drop materialized view log on agencia;
drop materialized view log on auto;
drop materialized view log on cliente;

Prompt volviendo a crear mlogs
start creacion_mlogs.sql

Prompt volviendo a crear mviews
start creacion_v_mat.sql

Prompt volviendo a hacer cambios dml
start cambios_dml.sql

Prompt volviendo a crear grupos de replicacion
start creacion_grupo_repl.sql