-- Script para el sitio 1
-- R = pais, S = oficina

Prompt proyeccion de un join
select r.pais_id, s.oficina_id
from f_aegg_pais_1 r
join f_aegg_oficina_1 s on r.pais_id = s.pais_id;

Prompt join de proyecciones
select r.pais_id, s.oficina_id
from (
  select pais_id from f_aegg_pais_1 
) r join (
  select pais_id, oficina_id from f_aegg_oficina_1
) s on r.pais_id = s.pais_id;
