Prompt conectando como aegg_particiones_bdd
connect aegg_particiones_bdd/aegg@aeggbdd_s1;

Prompt creando tabla auto
-- Tabla particionada por lista - hash
-- El hash nos proporciona el beneficion del partition wise join 
create table auto (
  auto_id   number(10,0) not null,
  marca varchar2(40) not null,
  modelo varchar(40) not null,
  anio number(4,0) not null,
  num_serie varchar2(20) not null,
  tipo char(1) not null,
  precio number(9,2) not null,
  descuento number(9,2),
  foto blob not null,
  status_auto_id number(2,0) not null,
  agencia_id number(10,0) not null,
  cliente_id number(10,0) not null,
  constraint auto_pk primary key (auto_id),
  constraint auto_agencia_fk foreign key (agencia_id)
    references agencia(agencia_id),
  constraint auto_cliente_fk foreign key (cliente_id)
    references cliente(cliente_id)
) partition by list (tipo)
  subpartition by hash (cliente_id)
  subpartition template(
    subpartition auto_cliente_p1pA,
    subpartition auto_cliente_p1pB,
    subpartition auto_cliente_p2pA,
    subpartition auto_cliente_p2pB
  )
(
  partition auto_particular_p1 values ('P'),
  partition auto_particular_p2 values ('C')
) parallel;

Prompt insertando registros en auto
insert into auto values (
  1, 'Ford', 'Fiesta', '2004', 'M98U93843FGMFGDDFL', 'P', 
  230944.30, 50000.00, empty_blob(), 4, 2, 2);
insert into auto values (
  2, 'Mercedes', 'Bus', '2011', 'H9KDILAS03ALIDC93M', 'C', 
  130544.30, null, empty_blob(), 1, 1, 3);
insert into auto values (
  3, 'Ford', 'Fiesta', '2019', 'SO30SMNR93LA9SP4NCI', 'P', 
  230944.30, 50000.00, empty_blob(), 2, 4, 7);
insert into auto values (
  4, 'Nissan', 'Vento', '2013', '83HD0KFLS90C929SJS', 'P', 
  230944.30, 50000.00, empty_blob(), 3, 1, 5);
insert into auto values (
  5, 'BMW', 'X4', '2004', 'KS745NAL8NC93LSI1', 'P', 
  230944.30, 50000.00, empty_blob(), 5, 3, 9);
insert into auto values (
  6, 'Ferrari', 'Sport', '2022', 'LDSH49SNEISLNFERL0', 'C', 
  230944.30, 50000.00, empty_blob(), 2, 5, 4);

Prompt consultando particiones y subparticiones de auto
select table_name, partition_name, subpartition_name
from user_tab_subpartitions
where table_name = 'AUTO';