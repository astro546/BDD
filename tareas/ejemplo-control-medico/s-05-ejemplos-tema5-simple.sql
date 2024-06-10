clear screen
connect control_medico/control_medico@aeggbdd_s1
Prompt ############## Ejemplo 1 #################
create index paciente_nombre_idx on paciente(nombre);
explain plan for 
select nombre from paciente order by nombre;
select plan_table_output from table(dbms_xplan.display);
-- Index Full Scan
Prompt #########################################

Prompt ############## Ejemplo 2 #################
explain plan for 
select nombre from paciente;
select plan_table_output from table(dbms_xplan.display);
-- Index Fast Full Scan
Prompt #########################################

Prompt ############## Ejemplo 3 #################
explain plan for 
select curp from paciente order by nombre;
select plan_table_output from table(dbms_xplan.display);
-- Index Full Scan
Prompt #########################################

Prompt ############## Ejemplo 4 #################
explain plan for 
select paciente_id from paciente where paciente_id > 5;
select plan_table_output from table(dbms_xplan.display);
Prompt #########################################

Prompt ############## Ejemplo 5 #################
explain plan for 
select nombre from paciente where nombre like 'A%';
select plan_table_output from table(dbms_xplan.display);
Prompt #########################################

Prompt ############## Ejemplo 6 #################
explain plan for 
select curp from paciente where nombre like 'A%';
select plan_table_output from table(dbms_xplan.display);
Prompt #########################################

Prompt ############## Ejemplo 7 #################
explain plan for 
select nombre from paciente where nombre = 'Steven';
select plan_table_output from table(dbms_xplan.display);
Prompt #########################################

Prompt ############## Ejemplo 8 #################
drop index paciente_nombre_idx;
explain plan for 
select nombre from paciente where nombre like 'A%';
select plan_table_output from table(dbms_xplan.display);
Prompt #########################################

Prompt ############## Ejemplo 9 #################
explain plan for 
select paciente_id from paciente where paciente_id = 5;
select plan_table_output from table(dbms_xplan.display);
Prompt #########################################

Prompt ############## Ejemplo 10 #################
explain plan for 
select nombre from paciente where paciente_id = 5;
select plan_table_output from table(dbms_xplan.display);
Prompt #########################################

Prompt ############## Ejemplo 11 #################
explain plan for 
select nombre from paciente where paciente_id > 5;
select plan_table_output from table(dbms_xplan.display);
Prompt #########################################

Prompt ############## Ejemplo 12 #################
create index paciente_nombre_idx on paciente(nombre);
explain plan for 
select nombre, curp from paciente order by nombre;
select plan_table_output from table(dbms_xplan.display);
Prompt #########################################

Prompt ############## Ejemplo 13 #################
explain plan for 
select nombre, curp from paciente;
select plan_table_output from table(dbms_xplan.display);
Prompt #########################################

Prompt ############## Ejemplo 14 #################
explain plan for 
select paciente_id, nombre from paciente order by nombre;
select plan_table_output from table(dbms_xplan.display);
Prompt #########################################

Prompt ############## Ejemplo 15 #################
explain plan for 
select paciente_id, nombre from paciente;
select plan_table_output from table(dbms_xplan.display);
Prompt #########################################

Prompt ############## Ejemplo 16 #################
create index paciente_email_genero_idx on paciente(genero,email);
create index paciente_curp_seguro_idx on paciente(curp, num_seguro);
explain plan for 
select paciente_id, genero, email, curp, num_seguro from paciente;
select plan_table_output from table(dbms_xplan.display);
Prompt #########################################

Prompt ############## Ejemplo 17 #################
create index paciente_ocupacion_idx on paciente(ocupacion);
explain plan for 
select paciente_id, genero, email, curp, num_seguro, ocupacion from paciente;
select plan_table_output from table(dbms_xplan.display);
Prompt #########################################

drop index paciente_curp_seguro_idx;
Prompt ############## Ejemplo 18 #################
create index paciente_ocupacion_idx on paciente(ocupacion);
explain plan for 
select ocupacion from paciente;
select plan_table_output from table(dbms_xplan.display);
Prompt #########################################

Prompt ############## Ejemplo 19 #################
explain plan for 
select genero from paciente order by email;
select plan_table_output from table(dbms_xplan.display);
Prompt #########################################

Prompt ############## Ejemplo 20 #################
explain plan for 
select genero from paciente where genero like 'a%';
select plan_table_output from table(dbms_xplan.display);
Prompt #########################################
drop index paciente_email_genero_idx;
-- drop index paciente_ocupacion_idx;

Prompt ############## Ejemplo 21 #################
explain plan for
select ocupacion from paciente where nombre like 'A%';
select plan_table_output from table(dbms_xplan.display);
Prompt #########################################

Prompt ############## Ejemplo 22 #################
explain plan for
select nombre from paciente where ocupacion like 'A%';
select plan_table_output from table(dbms_xplan.display);
Prompt #########################################

Prompt ############## Ejemplo 23 #################
explain plan for
select curp from paciente where nombre = 'Steven';
select plan_table_output from table(dbms_xplan.display);
Prompt #########################################

Prompt ############## Ejemplo 24 #################
explain plan for
select curp from paciente 
where paciente_id = 100
and nombre = 'Steven';
select plan_table_output from table(dbms_xplan.display);
-- no importa el orden de los predicados
-- agregando mas indices indexados o no indexados se obtiene el mismo resultado
Prompt #########################################

Prompt ############## Ejemplo 25 #################
explain plan for
select paciente_id from paciente 
where nombre = 'Steven'
and paciente_id > 100;
select plan_table_output from table(dbms_xplan.display);
-- Da lo mismo si agregamos tanto columna indexada como no indexadas
-- Da lo mismo si agregamos predicados con columnas no indexadas
Prompt #########################################

Prompt ############## Ejemplo 26 #################
create index paciente_curp on paciente(curp);
explain plan for
select paciente_id, nombre from paciente 
where nombre = 'Steven'
and paciente_id > 100
and ocupacion like 'S%'
and nombre = 'Steven'
and curp like 'C%';
select plan_table_output from table(dbms_xplan.display);
-- Da lo mismo si agregamos una columna indexada
Prompt #########################################

Prompt ############## Ejemplo 27 #################
create index paciente_curp on paciente(curp);
explain plan for
select paciente_id, nombre from paciente 
where nombre = 'Steven'
and paciente_id = 100
and ocupacion like 'S%'
and nombre = 'Steven'
and curp like 'C%';
select plan_table_output from table(dbms_xplan.display);
Prompt #########################################

Prompt ############## Ejemplo 28 #################
explain plan for
select curp from paciente 
where nombre = 'Steven'
and paciente_id > 100
and ocupacion = 'A'
and curp like 'b%'
and fecha_inicio_vigencia > to_date('05/05/2011');
select plan_table_output from table(dbms_xplan.display);
Prompt #########################################

Prompt ############## Ejemplo 29 #################
explain plan for
select curp from paciente 
where substr(nombre,1,1) = 'B';
select plan_table_output from table(dbms_xplan.display);
-- Da lo mismo si en lugar de = ponemos un operador between
Prompt #########################################

Prompt ############## Ejemplo 30 #################
explain plan for
select curp from paciente 
where substr(curp,1,1) = 'B';
select plan_table_output from table(dbms_xplan.display);
-- Da lo mismo si agregamos una columna indexada
Prompt #########################################

Prompt ############## Ejemplo 31 #################
explain plan for
select sum(paciente_id) from paciente;
select plan_table_output from table(dbms_xplan.display);
Prompt #########################################

Prompt ############## Ejemplo 32 #################
create index paciente_ap_pat_ix on paciente(ap_paterno);
explain plan for
select nombre, ap_paterno 
from paciente 
where nombre like '%mario%' order by 2;
select plan_table_output from table(dbms_xplan.display);
Prompt #########################################

Prompt ############## Ejemplo 33 #################
explain plan for
select 1 from paciente where 1 = 0;
select plan_table_output from table(dbms_xplan.display);
Prompt #########################################

Prompt ############## Ejemplo 34 #################
drop index paciente_nombre_idx;
create unique index paciente_curp_uk on paciente(upper(curp)); 
explain plan for
select nombre, curp 
from paciente where upper(curp) like 'ZOMOJA7809%';
select plan_table_output from table(dbms_xplan.display);
Prompt #########################################

Prompt ############## Ejemplo 35 #################
explain plan for
select p.paciente_id, p.nombre
from paciente p join cita c
on p.paciente_id = c.paciente_id
where p.paciente_id > 500
and c.consultorio in ('C-388', 'C-028');
select plan_table_output from table(dbms_xplan.display);
Prompt #########################################






