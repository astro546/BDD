-- Script para el sitio 1
-- R = Pais(pais_id, clave, nombre), T = Oficina(*)
-- Ai = pais_id = 1

Prompt select R U T where Ai
select * from(
  select r.pais_id, r.clave
  from f_aegg_pais_1 r 
  union all 
  select t.oficina_id, t.nombre
  from f_aegg_oficina_1 t
) q
where q.pais_id = 1;


Prompt select R where Ai union all select T where Ai
select pais_id, clave
from f_aegg_pais_1 
where pais_id = 1
union all
select oficina_id, nombre 
from f_aegg_oficina_1 
where pais_id = 1;