--@Autor: Emiliano Gutierrez
--@Fecha creación: 23/04/2024
--@Descripción: Consultas de localizacion usando sinonimos

prompt Conectando a sitio 1
connect consultora_bdd/consultora01#@aeggbdd_s1;

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
  dbms_output.put_line('Realizando consultas empleando sinonimos');
  dbms_output.put_line('============================');

  dbms_output.put_line('Consultando tabla: Pais');
  select count(*) as into v_num_paises
  from (
    select pais_id
    from pais_1
    union all
    select pais_id
    from pais_2
  ) q1;

  dbms_output.put_line('Consultando tabla: Oficina');
  select count(*) as into v_num_oficinas
  from (
    select oficina_id
    from oficina_1
    union all
    select oficina_id
    from oficina_2
  ) q2;

  dbms_output.put_line('Consultando tabla: Proyecto');
  select count(*) as into v_num_proyectos
  from (
    select proyecto_id
    from proyecto_1
    union all
    select proyecto_id
    from proyecto_2
    union all
    select proyecto_id
    from proyecto_3
  ) q3;

  dbms_output.put_line('Consultando tabla: ProyectoPDF');
  select count(*) as into v_num_pdfs
  from (
    select num_pdf
    from proyecto_pdf_1
    union all 
    select num_pdf
    from proyecto_pdf_2
  ) q4;

  dbms_output.put_line('Consultando tabla: Empleado');
  select count(*) as into v_num_empleados
  from (
    select e1.empleado_id
    from empleado_1 e1
    join (
      select empleado_id
      from empleado_2
      union all 
      select empleado_id
      from empleado_3
    ) e2
    on e1.empleado_id = e2.empleado_id
  ) q5;

  dbms_output.put_line('Consultando tabla: PagoEmpleado');
  select count(*) as into v_num_pagos
  from (
    select pago_empleado_id
    from pago_empleado_1
    union all
    select pago_empleado_id
    from pago_empleado_2
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