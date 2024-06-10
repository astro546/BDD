Prompt conectando como aegg_particiones_bdd
connect aegg_particiones_bdd/aegg@aeggbdd_s1;

Prompt creando tabla pago_auto
-- Tabla particionada por rango-rango
-- Las particiones automaticas se activan gracias a la clausula interval,
-- pero hay una particion inicial por default
-- numtoyminininterval(6,'MONTH') hace intervalos de 6 meses
create table pago_auto (
  num_pago number(3,0) not null,
  orden_compra_id number(10,0) not null,
  fecha_pago date,
  importe number(10,2),
  constraint pago_auto_pk primary key (num_pago, orden_compra_id)
) partition by range (fecha_pago)
  interval(numtoyminterval(6,'MONTH'))
subpartition by range (num_pago)
subpartition template (
  subpartition pago_auto_num_pago_1 values less than (7), 
  subpartition pago_auto_num_pago_2 values less than (13), 
  subpartition pago_auto_num_pago_3 values less than (19) 
)
(partition pago_auto_periodo_ini values less than (to_date('01-01-2011','dd-mm-yyyy')));

Prompt insertando datos en pago_auto
insert into pago_auto values (
  1, 1, to_date('05-03-2011','dd-mm-yyyy'), 9423.90);
insert into pago_auto values (
  2, 4, to_date('23-08-2011','dd-mm-yyyy'), 9543.90);
insert into pago_auto values (
  3, 3, to_date('11-04-2012','dd-mm-yyyy'), 4357.90);
insert into pago_auto values (
  4, 7, to_date('05-03-2010','dd-mm-yyyy'), 5049.90);
insert into pago_auto values (
  8, 8, to_date('15-08-2012','dd-mm-yyyy'), 0976.90);
insert into pago_auto values (
  16, 5, to_date('21-02-2013','dd-mm-yyyy'), 0854.90);

Prompt consultando datos de pago_auto
select table_name, partition_name, subpartition_name
from user_tab_subpartitions
where table_name = 'PAGO_AUTO';