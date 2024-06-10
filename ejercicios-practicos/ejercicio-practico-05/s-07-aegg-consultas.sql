Prompt conectandose a s1
connect consultora_bdd/consultora01#@aeggbdd_s1

Prompt contando registros en s1
select
  (select count(*) from f_aegg_pais_1) as pais_1,
  (select count(*) from f_aegg_oficina_1) as oficina_1,
  (select count(*) from f_aegg_empleado_2) as empleado_2,
  (select count(*) from f_aegg_proyecto_1) as proyecto_1,
  (select count(*) from f_aegg_proyecto_pdf_1) as proyecto_pdf_1,
  (select count(*) from f_aegg_pago_empleado_1) as pagoemp_1
from dual;

Prompt conectandose a s2
connect consultora_bdd/consultora01#@aeggbdd_s2

Prompt contando registros en s2
select
  (select count(*) from f_aegg_pais_2) as pais_2,
  (select count(*) from f_aegg_oficina_2) as oficina_2,
  (select count(*) from f_aegg_empleado_1) as empleado_1,
  (select count(*) from f_aegg_empleado_3) as empleado_3,
  (select count(*) from f_aegg_proyecto_2) as proyecto_2,
  (select count(*) from f_aegg_proyecto_3) as proyecto_3,
  (select count(*) from f_aegg_proyecto_pdf_2) as proyecto_pdf_2,
  (select count(*) from f_aegg_pago_empleado_2) as pagoemp_2
from dual;

Prompt Listo!!
exit
