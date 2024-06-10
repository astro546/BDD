--@Autor:          Jorge A. Rodriguez C
--@Fecha creación:  dd/mm/yyyy
--@Descripción:  Replicación empleando vistas mateializadas

whenever sqlerror exit rollback;

Prompt creando usuario aegg_replica_bdd y configurando privilegios

Prompt conectando en aeggbdd_s1
connect sys/system@aeggbdd_s1 as sysdba
@s-01-creacion-usuario.sql
--no requiere privilegios para crear mviews al ser la BD master.
--no requiere crear ligas

Prompt conectando en aeggbdd_s2
connect sys/system@aeggbdd_s2 as sysdba
@s-01-creacion-usuario.sql
grant create materialized view to aegg_replica_bdd;
grant alter any materialized view to aegg_replica_bdd;
--privilegios para ligas
grant create database link to aegg_replica_bdd;
grant create public database link to aegg_replica_bdd; 

--elimina la liga pública en caso de existir para que pueda ser creada
--posteriormente.
declare
  v_count number;
begin
  select count(*) into v_count
  from all_db_links
  where db_link ='AEGGBDD_S1_MASTER.FI.UNAM';

  if v_count > 0 then
    execute immediate 'drop public database link aeggbdd_s1_master.fi.unam';
  end if;
end;
/

Prompt creando tablas y ligas

Prompt conectando en aeggbdd_s1 - Master Database
connect aegg_replica_bdd/aegg@aeggbdd_s1
@s-02-autos-ddl.sql
-- no se requieren ligas aqui.

Prompt conectando en aeggbdd_s2  - Mview  Database
connect aegg_replica_bdd/aegg@aeggbdd_s2
--no se requiere crear DDL aqui 

--liga administrativa
create public database link aeggbdd_s1_master.fi.unam using 'AEGGBDD_S1';

--liga privada, no requiere hacer uso de  USING ni del usuario si 
-- el usuario existe en los 2 nodos.
create database link aeggbdd_s1_master.fi.unam connect to aegg_replica_bdd
  identified by aegg;
--create database link jrcbd_s1_master.fi.unam;



--Insertando datos unicamente el jrcbd_s1 (master database)
Prompt conectando en jrcbd_s1
connect aegg_replica_bdd/aegg@aeggbdd_s1

@s-03-cliente.sql
@s-03-status_auto.sql
@s-03-agencia.sql
@s-03-auto_1.sql
@s-03-auto_2.sql
@s-03-auto_3.sql
@s-03-historico_status_auto_1.sql
@s-03-historico_status_auto_2.sql
@s-03-historico_status_auto_3.sql
@s-03-historico_status_auto_4.sql
@s-03-orden_compra_1.sql
@s-03-orden_compra_2.sql
@s-03-pago_auto_1.sql
@s-03-pago_auto_2.sql
@s-03-pago_auto_3.sql

commit;
Prompt Listo
disconnect







