Prompt conectandose a BD mview (aeggbdd_s2)
connect aegg_replica_bdd/aegg@aeggbdd_s2

begin
  dbms_refresh.destroy(
    name                 => 'agencia_auto_cliente_g1'
  );
end;
/

Prompt eliminando vistas materializadas
drop materialized view mv_agencia;
drop materialized view mv_auto;
drop materialized view mv_cliente;

Prompt conectandose a BD master
connect aegg_replica_bdd/aegg@aeggbdd_s1

Prompt eliminando mlogs
drop materialized view log on agencia;
drop materialized view log on auto;
drop materialized view log on cliente;

Prompt eliminando tablas
drop table historico_status_auto;
drop table status_auto;
drop table auto;
drop table agencia;
drop table pago_auto;
drop table orden_compra;
drop table cliente;

