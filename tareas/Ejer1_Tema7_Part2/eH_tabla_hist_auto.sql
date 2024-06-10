Prompt conectando como aegg_particiones_bdd
connect aegg_particiones_bdd/aegg@aeggbdd_s1;

Prompt creando tabla historico_status_auto
-- tabla particionada por rango-hash
-- Las subparticiones se hicieron por hash por la distribucion
-- equitativa y aleatoria
create table historico_status_auto (
  historico_status_auto_id number(10,0) not null,
  fecha_status date not null,
  status_auto_id number(2,0) not null,
  auto_id number(10,0) not null,
  constraint historico_pk primary key (historico_status_auto_id),
  constraint status_auto_fk foreign key (status_auto_id)
    references status_auto(status_auto_id),
  constraint auto_historico_fk foreign key (auto_id)
    references auto(auto_id)
) partition by range (fecha_status)
  interval(numtoyminterval(1,'YEAR'))
subpartition by hash (historico_status_auto_id)
subpartition template(
  subpartition h_p1 tablespace autos_tbs_1,
  subpartition h_p2 tablespace autos_tbs_2,
  subpartition h_p3 tablespace autos_tbs_3,
  subpartition h_p4 tablespace autos_tbs_4,
  subpartition h_p5 tablespace autos_tbs_5
)
(partition h_antigua values less than (to_date('01-01-2010','dd-mm-yyyy')));

Prompt insertando registros en historico_status_auto
insert into historico_status_auto values (
  1, to_date('29-01-2011','dd-mm-yyyy'), 3, 6);
insert into historico_status_auto values (
  2, to_date('17-10-2012','dd-mm-yyyy'), 1, 3);
insert into historico_status_auto values (
  3, to_date('19-07-2013','dd-mm-yyyy'), 2, 1);
insert into historico_status_auto values (
  10, to_date('08-11-2010','dd-mm-yyyy'), 5, 3);
insert into historico_status_auto values (
  100, to_date('17-10-2010','dd-mm-yyyy'), 4, 4);
insert into historico_status_auto values (
  1000, to_date('19-07-2014','dd-mm-yyyy'), 1, 2);

Prompt consultando datos de historico_status_auto
select table_name, partition_name, subpartition_name
from user_tab_subpartitions
where table_name = 'HISTORICO_STATUS_AUTO';