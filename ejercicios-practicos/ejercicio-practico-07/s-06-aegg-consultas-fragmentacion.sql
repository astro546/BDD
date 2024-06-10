--@Autor: Emiliano Gutierrez
--@Fecha creación: 23/04/2024
--@Descripción: Consultas de cada relacion global

Prompt conectandose a s1
connect consultora_bdd/consultora01#@aeggbdd_s1

Prompt contando registros en s1
select
  (select count(*) from pais) as pais,
  (select count(*) from oficina) as oficina,
  (select count(*) from empleado) as empleado,
  (select count(*) from proyecto) as proyecto,
  (select count(*) from proyecto_pdf) as proyecto_pdf,
  (select count(*) from pago_emp) as pago_emp
from dual;

Prompt conectandose a s2
connect consultora_bdd/consultora01#@aeggbdd_s2

Prompt contando registros en s2
select
  (select count(*) from pais) as pais,
  (select count(*) from oficina) as oficina,
  (select count(*) from empleado) as empleado,
  (select count(*) from proyecto) as proyecto,
  (select count(*) from proyecto_pdf) as proyecto_pdf,
  (select count(*) from pago_emp) as pago_emp
from dual;

Prompt Listo!!
exit
