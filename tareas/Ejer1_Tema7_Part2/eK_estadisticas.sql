Prompt conectando como sys
connect sys/system@aeggbdd_s1 as sysdba;

Prompt empezando recoleccion de estadisticas
begin
  dbms_stats.gather_table_stats (
    ownname => 'AEGG_PARTICIONES_BDD',
    tabname => 'CLIENTE',
    degree => 2
  );
  dbms_stats.gather_table_stats (
    ownname => 'AEGG_PARTICIONES_BDD',
    tabname => 'ORDEN_COMPRA',
    degree => 2
  );
  dbms_stats.gather_table_stats (
    ownname => 'AEGG_PARTICIONES_BDD',
    tabname => 'STATUS_AUTO',
    degree => 2
  );
  dbms_stats.gather_table_stats (
    ownname => 'AEGG_PARTICIONES_BDD',
    tabname => 'AGENCIA',
    degree => 2
  );
  dbms_stats.gather_table_stats (
    ownname => 'AEGG_PARTICIONES_BDD',
    tabname => 'AUTO',
    degree => 2
  );
  dbms_stats.gather_table_stats (
    ownname => 'AEGG_PARTICIONES_BDD',
    tabname => 'HISTORICO_STATUS_AUTO',
    degree => 2
  );
  dbms_stats.gather_table_stats (
    ownname => 'AEGG_PARTICIONES_BDD',
    tabname => 'PAGO_AUTO',
    degree => 2
  );
end;
/

Prompt consultando estadisticas
col table_name format A30
select table_name,num_rows,blocks,empty_blocks,avg_row_len,last_analyzed
from dba_tab_statistics
where owner ='AEGG_PARTICIONES_BDD'
and num_rows is not null;

Prompt conectando como aegg_particiones_bdd
connect aegg_particiones_bdd/aegg@aeggbdd_s1;

Prompt consultando datos de las particiones de las tablas
select table_name, partition_name, subpartition_count, num_rows
from user_tab_partitions
where num_rows is not null;