--vistas

--TODO agrgar soporte para blobs despues
create or replace view  auto as
 select c1.auto_id,marca,modelo,anio,num_serie,tipo,precio,descuento,agencia_id,cliente_id
 from auto_1 c1 
 join (
 	select * from auto_2
 	union all
 	select * from auto_3
 	union all
 	select * from auto_4
 ) q on c1.auto_id = q.auto_id;

create or replace view auto_carga as
  select * from auto_carga_1;

create or replace view auto_particular as
  select * from auto_particular_1
  union all
  select * from auto_particular_2;

create or replace view agencia as
  select * from agencia_1
  union all
  select * from agencia_2;

create or replace view cliente as
  select c1.cliente_id,c1.num_tarjeta,nombre,ap_paterno,ap_materno,
    num_identificacion,email
  from cliente_1 c1 join (
    select * from cliente_2
    union all
    select * from cliente_3
  ) r on r.cliente_id = c1.cliente_id;

--test
Prompt consultando
Prompt auto
select count(*) from auto;
Prompt auto_carga
select count(*) from auto_carga;
Prompt auto_particular
select count(*) from auto_particular;
Prompt agencia
select count(*) from agencia;
Prompt cliente
select count(*) from cliente;
