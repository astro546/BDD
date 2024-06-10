--@Autor: Emiliano Gutierrez
--@Fecha creación: 23/04/2024
--@Descripción: Creación de sinónimos

Prompt conectandose a aeggbdd_s1
connect consultora_bdd/consultora01#@aeggbdd_s1

Prompt creando sinónimos en aeggbdd_s1
Prompt creando sinonimos de pais
create or replace synonym pais_1 for f_aegg_pais_1;
create or replace synonym pais_2 for f_aegg_pais_2@aeggbdd_s2;

Prompt creando sinonimos de oficina
create or replace synonym oficina_1 for f_aegg_oficina_1;
create or replace synonym oficina_2 for f_aegg_oficina_2@aeggbdd_s2 ;

Prompt creando sinonimos de proyecto
create or replace synonym proyecto_1 for f_aegg_proyecto_1;
create or replace synonym proyecto_2 for f_aegg_proyecto_2@aeggbdd_s2;
create or replace synonym proyecto_3 for f_aegg_proyecto_3@aeggbdd_s2;

Prompt creando sinonimos de proyecto_pdf
create or replace synonym proyecto_pdf_1 for f_aegg_proyecto_pdf_1;
create or replace synonym proyecto_pdf_2 for f_aegg_proyecto_pdf_2@aeggbdd_s2;

Prompt creando sinonimos de empleado
create or replace synonym empleado_1 for f_aegg_empleado_1@aeggbdd_s2;
create or replace synonym empleado_2 for f_aegg_empleado_2;
create or replace synonym empleado_3 for f_aegg_empleado_3@aeggbdd_s2;

Prompt creando sinonimos de pago_empleado
create or replace synonym pago_empleado_1 for f_aegg_pago_empleado_1;
create or replace synonym pago_empleado_2 for f_aegg_pago_empleado_2@aeggbdd_s2 ;

Prompt conectandose a aeggbdd_s2
connect consultora_bdd/consultora01#@aeggbdd_s2

Prompt creando sinónimos en jrcbdd_s2
Prompt creando sinonimos de pais
create or replace synonym pais_1 for f_aegg_pais_1@aeggbdd_s1;
create or replace synonym pais_2 for f_aegg_pais_2;

Prompt creando sinonimos de oficina
create or replace synonym oficina_1 for f_aegg_oficina_1@aeggbdd_s1;
create or replace synonym oficina_2 for f_aegg_oficina_2;

Prompt creando sinonimos de proyecto
create or replace synonym proyecto_1 for f_aegg_proyecto_1@aeggbdd_s1;
create or replace synonym proyecto_2 for f_aegg_proyecto_2;
create or replace synonym proyecto_3 for f_aegg_proyecto_3;

Prompt creando sinonimos de proyecto_pdf
create or replace synonym proyecto_pdf_1 for f_aegg_proyecto_pdf_1@aeggbdd_s1;
create or replace synonym proyecto_pdf_2 for f_aegg_proyecto_pdf_2;

Prompt creando sinonimos de empleado
create or replace synonym empleado_1 for f_aegg_empleado_1;
create or replace synonym empleado_2 for f_aegg_empleado_2@aeggbdd_s1;
create or replace synonym empleado_3 for f_aegg_empleado_3;

Prompt creando sinonimos de pago_empleado
create or replace synonym pago_empleado_1 for f_aegg_pago_empleado_1@aeggbdd_s1;
create or replace synonym pago_empleado_2 for f_aegg_pago_empleado_2;

Prompt Listo!
exit