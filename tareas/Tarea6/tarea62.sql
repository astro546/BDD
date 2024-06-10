-- Script para el sitio 1
-- R = Pais, S = Oficina
-- C = pais_id, clave
-- A = pais_id B = clave

Prompt proyeccion C de R U S
select res.pais_id, res.clave
from (
  select pais_id, clave
  from f_aegg_pais_1 r
  union 
  select oficina_id, nombre
  from f_aegg_oficina_1 s
) res;

Prompt proyeccion A de R union Proyeccion B de S
select pais_id from f_aegg_pais_1
union
select oficina_id from f_aegg_oficina_1;