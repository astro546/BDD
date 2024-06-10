Prompt conectando como aegg_particiones_bdd
connect aegg_particiones_bdd/aegg@aeggbdd_s1;


Prompt creando tabla agencia
-- Tabla particionada por lista
-- la clausula default es donde caen los valores que no estan en
-- las demas listas
create table agencia (
  agencia_id number(10,0) not null,
  nombre varchar(40) not null,
  clave varchar(8) not null,
  agencia_anexa_id number(10,0),
  constraint agencia_pk primary key (agencia_id) 
) partition by list (clave) (
  partition agencia_p1_ae values ('A','B','C','D','E'),
  partition agencia_p2_fj values ('F','G','H','I','J'),
  partition agencia_p3_ko values ('K','L','M','N','O'),
  partition agencia_p4_pt values ('P','Q','R','S','T'),
  partition agencia_p5_uz values (default)
);

Prompt insertando datos en agencia
insert into agencia values (1, 'Nissan San Antonio', 'A', null);
insert into agencia values (2, 'Toyota Santa Fe', 'F', null);
insert into agencia values (3, 'BMW San Angel', 'N', null);
insert into agencia values (4, 'Ford Satelite', 'S', null);
insert into agencia values (5, 'KIA Tlalnepantla', 'W', null);

Prompt consultando datos de particiones de la tabla
-- a.* es como poner solo el *, pero se pone a.* por el alias de la tabla
select a.*,'agencia_p1_ae' as nombre_particion
from agencia partition(agencia_p1_ae) a
union all
select a.*,'agencia_p2_fj' as nombre_particion
from agencia partition(agencia_p2_fj) a
union all
select a.*,'agencia_p3_ko' as nombre_particion
from agencia partition(agencia_p3_ko) a
union all
select a.*,'agencia_p4_pt' as nombre_particion
from agencia partition(agencia_p4_pt) a
union all
select a.*,'agencia_p5_uz' as nombre_particion
from agencia partition(agencia_p5_uz) a;