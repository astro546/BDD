connect control_medico/control_medico@aeggbdd_s1

Prompt ############## Ejemplo 1 #################
set linesize 100
explain plan
set statement_id ='s1' for
select m.nombre,c.fecha_cita
from medico m, cita c
where m.medico_id = c.medico_id
and consultorio='C-593';
select * from table(dbms_xplan.display);
Prompt #########################################

Prompt ############## Ejemplo 2 #################
explain plan for
select d.diagnostico_id, c.fecha_cita
from cita c
join diagnostico d on c.diagnostico_id = d.diagnostico_id
where d.clave like 'A85%';
select * from table(dbms_xplan.display);
Prompt #########################################

Prompt ############## Ejemplo 3 #################
explain plan for
select d.diagnostico_id, c.fecha_cita
from cita c
join diagnostico d on c.diagnostico_id = d.diagnostico_id
where d.clave like 'A85%'
and c.medico_id = 2286;
select * from table(dbms_xplan.display);
Prompt #########################################

Prompt ############## Ejemplo 4 con hint #################
create or replace index cita_medico_idx on cita(medico_id);
explain plan for
select /*+ ORDERED USE_NL(c) */ m.nombre,c.fecha_cita
from medico m, cita c
where c.medico_id = m.medico_id
and m.nombre like 'A%'
and c.consultorio ='A03';
select * from table(dbms_xplan.display);
Prompt #########################################

Prompt ############## Ejemplo 4 sin hint #################
create or replace index cita_medico_idx on cita(medico_id);
explain plan for
select m.nombre,c.fecha_cita
from medico m, cita c
where c.medico_id = m.medico_id
and m.nombre like 'A%'
and c.consultorio ='A03';
select * from table(dbms_xplan.display);
Prompt #########################################

-- #################### Ejemplos Hash ############
Prompt ############## Ejemplo 6 #################
explain plan for
select m.nombre,e.nombre
from especialidad e
join medico m
on m.especialidad_id = e.especialidad_id;
select * from table(dbms_xplan.display);
Prompt #########################################

-- #################### Ejemplos Merge Join ############
Prompt ############## Ejemplo  #################
explain plan for
select m.nombre,e.nombre
from especialidad e, medico m
where e.especialidad_id = m.especialidad_id
and m.nombre like 'A%';
Prompt #########################################

