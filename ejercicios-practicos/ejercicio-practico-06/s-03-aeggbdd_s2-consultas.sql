--@Autor: Emiliano Guiterrez
--@Fecha creacion: 22/04/2024
--@Descripcion: Comprobacion de consultas para comprobar liga de s2 a s1

prompt Conectando a sitio 1
connect consultora_bdd/consultora01#@aeggbdd_s2;

-- Se habilita el envio de mensajes a la consola
set serveroutput on;

declare
  v_num_paises number;
  v_num_oficinas number;
  v_num_proyectos number;
  v_num_pdfs number;
  v_num_empleados number;
  v_num_pagos number;

begin
  dbms_output.put_line('Realizando consultas empleando liga de s1 a s2');
  dbms_output.put_line('============================');

  dbms_output.put_line('Consultando tabla: Pais');
  select count(*) as into v_num_paises
  from (
    select pais_id
    from f_aegg_pais_2
    union all
    select pais_id
    from f_aegg_pais_1@aeggbdd_s1.fi.unam
  ) q1;

  dbms_output.put_line('Consultando tabla: Oficina');
  select count(*) as into v_num_oficinas
  from (
    select oficina_id
    from f_aegg_oficina_2
    union all
    select oficina_id
    from f_aegg_oficina_1@aeggbdd_s1.fi.unam
  ) q2;

  dbms_output.put_line('Consultando tabla: Proyecto');
  select count(*) as into v_num_proyectos
  from (
    select proyecto_id
    from f_aegg_proyecto_1@aeggbdd_s1.fi.unam
    union all
    select proyecto_id
    from f_aegg_proyecto_2
    union all
    select proyecto_id
    from f_aegg_proyecto_3
  ) q3;

  dbms_output.put_line('Consultando tabla: ProyectoPDF');
  select count(*) as into v_num_pdfs
  from (
    select num_pdf
    from f_aegg_proyecto_pdf_2
    union all 
    select num_pdf
    from f_aegg_proyecto_pdf_1@aeggbdd_s1.fi.unam
  ) q4;

  dbms_output.put_line('Consultando tabla: Empleado');
  select count(*) as into v_num_empleados
  from (
    select e1.empleado_id
    from f_aegg_empleado_1 e1
    join (
      select empleado_id
      from f_aegg_empleado_2@aeggbdd_s1.fi.unam
      union all 
      select empleado_id
      from f_aegg_empleado_3
    ) e2
    on e1.empleado_id = e2.empleado_id
  ) q5;

  dbms_output.put_line('Consultando tabla: PagoEmpleado');
  select count(*) as into v_num_pagos
  from (
    select pago_empleado_id
    from f_aegg_pago_empleado_2
    union all
    select pago_empleado_id
    from f_aegg_pago_empleado_1@aeggbdd_s1.fi.unam
  ) q6;

  dbms_output.put_line('============================');
  dbms_output.put_line('Resultado del conteo de registros');
  dbms_output.put_line('Paises:     '||v_num_paises);
  dbms_output.put_line('Oficinas:   '||v_num_oficinas);
  dbms_output.put_line('Proyecto:   '||v_num_proyectos);
  dbms_output.put_line('PDFs:       '||v_num_pdfs);
  dbms_output.put_line('Empleados:  '||v_num_empleados);
  dbms_output.put_line('Pagos:      '||v_num_pagos);
end;
/

Prompt listoo!!
exit