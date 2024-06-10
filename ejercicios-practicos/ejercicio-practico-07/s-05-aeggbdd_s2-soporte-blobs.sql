--@Autor: Emiliano Gutierrez
--@Fecha creación: 23/04/2024
--@Descripción: Definición de vistas para manejo de blobs en la PDB aeggbdd_s2

Prompt conectandose aeggbdd_s2
connect consultora_bdd/consultora01#@aeggbdd_s2;

prompt ------------------------------------------------------
Prompt Paso 1 - Creando vistas para fragmentos locales con blobs
create or replace view v_proyecto_pdf_2 as
  select num_pdf, proyecto_id, archivo_pdf, tamanio  
  from proyecto_pdf_2;

create or replace view empleado as 
  select e1.empleado_id, 
  e2.nombre, 
  e2.ap_paterno, 
  e2.ap_materno, 
  e2.rfc, 
  e1.foto, 
  e1.num_cuenta, 
  e2.email, 
  e2.jefe_id 
  from empleado_1 e1
  join (
    select empleado_id, nombre, ap_paterno, ap_materno, rfc, email, jefe_id 
    from empleado_2
    union all
    select empleado_id, nombre, ap_paterno, ap_materno, rfc, email, jefe_id 
    from empleado_3
  ) e2
  on e1.empleado_id = e2.empleado_id;
prompt ------------------------------------------------------

prompt ------------------------------------------------------
Prompt Paso 2 - Creando tipos para las vistas con blobs remotas
create type pdf_type as object(
  num_pdf number(1,0),
  proyecto_id number(10,0),
  archivo_pdf blob,
  tamanio number(10,2)
);
/
show errors;
prompt ------------------------------------------------------

prompt ------------------------------------------------------
Prompt Paso 3 - Creando objetos table para las vistas con blobs remotas
create type pdf_table as table of pdf_type;
/
show errors;
prompt ------------------------------------------------------

prompt ------------------------------------------------------
Prompt Paso 4 - creando tablas temporales para vistas que involucran blobs remotos
create global temporary table t_aegg_proyecto_pdf_1(
  num_pdf number(1,0),
  proyecto_id number(10,0),
  archivo_pdf blob,
  tamanio number(10,2),
  constraint t_aegg_proyecto_pdf_1_pk primary key (num_pdf, proyecto_id)
) on commit preserve rows;
prompt ------------------------------------------------------

prompt ------------------------------------------------------
Prompt Paso 5 - Creando funcion con estrategia 1 para vistas que involucran blobs remotos
create or replace function get_remote_pdf return pdf_table pipelined is pragma autonomous_transaction;
  v_temp_pdf blob;
  begin

    -- Inicia txn autonoma 1
    -- Asegura que no haya registros
    delete from t_aegg_proyecto_pdf_1;

    -- Inserta los datos del fragmento remoto a la tabla temporal
    insert into t_aegg_proyecto_pdf_1 select * from proyecto_pdf_1;
  
    commit;
    -- termina txn autonoma 1

    -- Obtiene los registros de la tabla temporal y los regresa como
    -- objetos tipo pdf_type
    for cur in (select * from t_aegg_proyecto_pdf_1)
    loop
      pipe row(pdf_type(cur.num_pdf, cur.proyecto_id, cur.archivo_pdf, cur.tamanio));
    end loop;

    -- Inicia txn autonoma 2
    -- Elimina los registros de la tabla temporal una vez que han sido obtenidos
    delete from t_aegg_proyecto_pdf_1;

    commit;
    -- Termina txn autonoma 2

    return;

  exception
    when others then
      rollback;
  end;
  /
show errors;
prompt ------------------------------------------------------

prompt ------------------------------------------------------
Prompt Paso 6 Creando funcion con estrategia 2 para vistas que involucran blobs remotos
create or replace function get_remote_pdf_by_id(
  v_pdf_id in number,
  v_proyecto_id in number
) return blob is
pragma autonomous_transaction;
  v_temp_pdf blob;
begin
  --inicia txn autónoma 1
  --asegura que no haya registros
  delete from t_aegg_proyecto_pdf_1;

  --inserta un solo registro obtenido del fragmento remoto a la tabla temporal.
  insert into t_aegg_proyecto_pdf_1 
  select * from proyecto_pdf_1 
  where num_pdf = v_pdf_id and proyecto_id = v_proyecto_id;

  --obtiene el registro de la tabla temporal y lo regresa como blob
  select archivo_pdf into v_temp_pdf
  from t_aegg_proyecto_pdf_1 
  where num_pdf = v_pdf_id and proyecto_id = v_proyecto_id;

  --elimina los registros de la tabla temporal una vez que han sido obtenidos.
  delete from t_aegg_proyecto_pdf_1;
  --termina txn autónoma 1.
  commit;

  return v_temp_pdf;

exception
  when others then
    rollback;
  raise;

end;
/
show errors;
prompt ------------------------------------------------------

prompt ------------------------------------------------------
Prompt Paso 7 Crear las vistas con datos blob remotos empleando estrategia 1
create or replace view proyecto_pdf_e1 as
  select num_pdf, proyecto_id, archivo_pdf, tamanio 
  from proyecto_pdf_2
  union all 
  select num_pdf, proyecto_id, archivo_pdf, tamanio 
  from table (get_remote_pdf);
prompt ------------------------------------------------------

prompt ------------------------------------------------------
Prompt Paso 8 Crear las vistas con datos blob remotos empleando estrategia 2
create or replace view proyecto_pdf_e2 as
  select num_pdf, proyecto_id, archivo_pdf, tamanio 
  from proyecto_pdf_2
  union all
  select num_pdf, proyecto_id, 
  get_remote_pdf_by_id(num_pdf, proyecto_id), tamanio
  from proyecto_pdf_1;
prompt ------------------------------------------------------

prompt ------------------------------------------------------
Prompt Paso 9 Crear un sinonimo con el nombre global del fragmento que apunte a la estrategia 2
create or replace synonym proyecto_pdf for proyecto_pdf_e2;
prompt ------------------------------------------------------

Prompt Listo!
exit