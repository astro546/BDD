Prompt conectando como aegg_particiones_bdd
connect aegg_particiones_bdd/aegg@aeggbdd_s1;

Prompt creando tablespaces
create tablespace autos_tbs_0
  datafile '/u01/app/oracle/oradata/AEGGBDD/aeggbdd_s1/autos_tbs_0.dbf'
  size 100m
  autoextend on next 50m
  maxsize 5120m;

create tablespace autos_tbs_1
  datafile '/u01/app/oracle/oradata/AEGGBDD/aeggbdd_s1/autos_tbs_1.dbf'
  size 10m
  autoextend on next 5m
  maxsize 50m;

create tablespace autos_tbs_2
  datafile '/u01/app/oracle/oradata/AEGGBDD/aeggbdd_s1/autos_tbs_2.dbf'
  size 10m
  autoextend on next 5m
  maxsize 50m;

create tablespace autos_tbs_3
  datafile '/u01/app/oracle/oradata/AEGGBDD/aeggbdd_s1/autos_tbs_3.dbf'
  size 10m
  autoextend on next 5m
  maxsize 50m;

create tablespace autos_tbs_4
  datafile '/u01/app/oracle/oradata/AEGGBDD/aeggbdd_s1/autos_tbs_4.dbf'
  size 10m
  autoextend on next 5m
  maxsize 50m;

create tablespace autos_tbs_5
  datafile '/u01/app/oracle/oradata/AEGGBDD/aeggbdd_s1/autos_tbs_5.dbf'
  size 10m
  autoextend on next 5m
  maxsize 50m;

Prompt conectando como aegg_particiones_bdd
connect sys/system@aeggbdd_s1 as sysdba;

alter user aegg_particiones_bdd quota unlimited on autos_tbs_0;
alter user aegg_particiones_bdd quota unlimited on autos_tbs_1;
alter user aegg_particiones_bdd quota unlimited on autos_tbs_2;
alter user aegg_particiones_bdd quota unlimited on autos_tbs_3;
alter user aegg_particiones_bdd quota unlimited on autos_tbs_4;
alter user aegg_particiones_bdd quota unlimited on autos_tbs_5;
alter user aegg_particiones_bdd default tablespace autos_tbs_0;