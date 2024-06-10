Prompt conectando como aegg_paralelo_bdd
connect aegg_paralelo_bdd/aegg@aeggbdd_s1;

Prompt creando tabla con 4 particiones
create table ventas (
  venta_id number(10,0) primary key,
  categoria varchar2(20) not null,
  producto_id number(10) not null,
  cantidad number(3) not null,
  precio_unit number(9,2) not null,
  precio_total number(9,2) not null
) partition by list (categoria) (
  partition v_electronicos values ('Electronica'),
  partition v_blanca values ('Linea Blanca'),
  partition v_comida values ('Comida'),
  partition v_others values (default)
);