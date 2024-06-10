Prompt conectandose a BD mview (aeggbdd_s2)
connect aegg_replica_bdd/aegg@aeggbdd_s2;

Prompt creando mv_agencia
create materialized view mv_agencia 
refresh fast with primary key as 
  select * from agencia@aeggbdd_s1_master
  where substr(clave,1,1) between 'A' and 'F';

Prompt creando mv_auto 
-- Many to One Subquerie
-- mlog de agencia va a incluir clave
create materialized view mv_auto
refresh fast with primary key as
  select 
    auto_id,
    marca,
    modelo,
    anio, 
    num_serie,
    tipo,
    precio, 
    descuento,
    agencia_id,
    cliente_id
  from auto@aeggbdd_s1_master au
  where au.tipo='P'
  and exists(
    select 1
    from agencia@aeggbdd_s1_master ag
    where au.agencia_id = ag.agencia_id
    and substr(clave,1,1) between 'A' and 'F'
  );


Prompt creando mv_cliente
--La segunda consulta tiene un Many to Many subquerie
-- mlog de auto va a incluir tipo, cliente_id y agencia_id
create materialized view mv_cliente
refresh fast with primary key as
  select * from cliente@aeggbdd_s1_master c
  where c.email like '%.gov'
  union 
  select * from cliente@aeggbdd_s1_master c
  where exists(
    select 1
    from auto@aeggbdd_s1_master a
    where a.tipo='P'
    and c.cliente_id = a.cliente_id
    and exists(
      select 1
      from agencia@aeggbdd_s1_master ag
      where a.agencia_id = ag.agencia_id
      and substr(clave,1,1) between 'A' and 'F'
    )
  );
  

