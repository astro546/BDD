Prompt conectando como aegg_paralelo_bdd
connect aegg_paralelo_bdd/aegg@aeggbdd_s1;

Prompt creando tabla padre
create table distancias (
  distancia_id number(6,0) primary key,
  fecha_dist date not null,
  distancia number(6,0) not null
);


Prompt creando tabla hija
create table distancias_corredores(
  corredor_id number(10,0) primary key,
  distancia_id number(6,0) not null,
  nombre varchar2(30) not null,
  constraint distancia_corredor_fk foreign key (distancia_id) references distancias(distancia_id)
) partition by hash (distancia_id) partitions 4;