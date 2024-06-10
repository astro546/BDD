--@Autor: Emiliano Gutierrez
--@Fecha creación: 25/04/2024
--@Descripción: Creacion de tablas temporales para empleado

-- El sitio 1 es el unico sitio que podira solicitar BLOBs de manera remota a empleado
Prompt Conectandose al sitio 1 
connect consultora_bdd/consultora01#@aeggbdd_s1;

-- Las tablas temporales solo se crean con los atributos del fragmento con blob
-- ya que los blobs iran solamente a esos fragmentos
Prompt creando tablas temporales para empleado
create global temporary table t_empleado_insert(
  empleado_id number(10,0) constraint t_aegg_insert_empleado_1_pk primary key,
  foto blob not null,
  num_cuenta varchar(18)
) on commit preserve rows;

create global temporary table t_empleado_update(
  empleado_id number(10,0) constraint t_aegg_update_empleado_1_pk primary key,
  foto blob not null,
  num_cuenta varchar(18)
) on commit preserve rows;

Prompt Listoo!!
