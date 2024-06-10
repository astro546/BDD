-- Script para el sitio 1
-- R = pais, S = oficina

Prompt Proyeccion de un producto cruz
select r.pais_id, s.oficina_id
from f_aegg_pais_1 r, f_aegg_oficina_1 s;

Prompt producto cruz de proyecciones
select r.pais_id, s.oficina_id from (
  select pais_id from f_aegg_pais_1
) r
,
(
  select oficina_id from f_aegg_oficina_1
) s;