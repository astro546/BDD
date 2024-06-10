Prompt conectando como aegg_particiones_bdd
connect aegg_particiones_bdd/aegg@aeggbdd_s1;

Prompt creando tabla status_auto
create table status_auto(
    status_auto_id    number(2, 0)    not null,
    clave             varchar2(20)    not null,
    descripcion       varchar2(40)    not null,
    constraint status_auto_pk primary key (status_auto_id)
);

Prompt insertando datos en status_auto
insert into status_auto (status_auto_id, clave, descripcion) values (1, 'EN TRANSITO', 'EN CAMINO A LA AGENCIA');
insert into status_auto (status_auto_id, clave, descripcion) values (2, 'EN AGENCIA', 'DISPONIBLE EN LA AGENCIA PARA VENTA');
insert into status_auto (status_auto_id, clave, descripcion) values (3, 'APARTADO', 'EL CLIENTE HA REALIZADO UN DEPOSITO');
insert into status_auto (status_auto_id, clave, descripcion) values (4, 'VENDIDO', 'EL CARRO SE HA VENDIDO');
insert into status_auto (status_auto_id, clave, descripcion) values (5, 'DEFECTUOSO', 'AUTOS NUEVOS CON DEFECTOS');
insert into status_auto (status_auto_id, clave, descripcion) values (6, 'EN REPARACION', 'PARA AUTOS VENDIDOS EN REPARACION');