--@Autor: Emiliano Guiterrez
--@Fecha creacion: 21/03/2024
--@Descripcion: Consulta de restricciones de referencia

Prompt Mostrando lista de restricciones de referencia
col tabla_padre format a30
col tabla_hija format a30
col nombre_restriccion format a30
set linesize 200

select th.table_name tabla_hija, th.constraint_name nombre_restriccion,
  tp.table_name tabla_padre, th.constraint_type tipo_constraint
from user_constraints th, user_constraints tp
where th.constraint_type='R'
and th.r_constraint_name=tp.constraint_name
order by tabla_padre;

