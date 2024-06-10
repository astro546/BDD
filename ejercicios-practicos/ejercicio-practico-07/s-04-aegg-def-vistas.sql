--@Autor: Emiliano Gutierrez
--@Fecha creación: 23/04/2024
--@Descripción: Creacion de vistas

-- No se crean vistas para proyecto_pdf y empleado
-- ya que tienen columnas de tipo BLOB

Prompt creando vista para pais
create or replace view pais as
  select *
  from pais_1
  union all
  select *
  from pais_2;

Prompt creando vista para oficina
create or replace view oficina as
  select *
  from oficina_1
  union all
  select *
  from oficina_2;

Prompt creando vista para proyecto
create or replace view proyecto as
  select *
  from proyecto_1
  union all
  select *
  from proyecto_2
  union all
  select *
  from proyecto_3;

Prompt creando vista para pago_emp
create or replace view pago_empleado as
  select *
  from pago_empleado_1
  union all
  select *
  from pago_empleado_2;
