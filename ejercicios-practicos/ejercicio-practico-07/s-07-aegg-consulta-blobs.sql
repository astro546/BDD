--@Autor: Emiliano Gutierrez
--@Fecha creación: 24/04/2024
--@Descripción: Consultas para validar vistas con columnas BLOB

Prompt Conectandose a aeggbdd_s1
connect consultora_bdd/consultora01#@aeggbdd_s1;

Prompt proyecto_pdf estrategia 1
select num_pdf, proyecto_id, 
dbms_lob.getlength(archivo_pdf) as longitud
from proyecto_pdf_e1;

Prompt proyecto_pdf estrategia 2
select num_pdf, proyecto_id, 
dbms_lob.getlength(archivo_pdf) as longitud
from proyecto_pdf_e2;

Prompt proyecto_pdf sinonimo
select num_pdf, proyecto_id, 
dbms_lob.getlength(archivo_pdf) as longitud
from proyecto_pdf;

Prompt empleado estrategia 1
select empleado_id, dbms_lob.getlength(foto) as longitud
from empleado_e1;

Prompt empleado estrategia 2
select empleado_id, dbms_lob.getlength(emp_foto) as longitud
from empleado_e2;

Prompt empleado sinonimo
select empleado_id, dbms_lob.getlength(emp_foto) as longitud
from empleado;

Prompt Conectandose a aeggbdd_s2
connect consultora_bdd/consultora01#@aeggbdd_s2;

Prompt proyecto_pdf estrategia 1
select num_pdf, proyecto_id, 
dbms_lob.getlength(archivo_pdf) as longitud
from proyecto_pdf_e1;

Prompt proyecto_pdf estrategia 2
select num_pdf, proyecto_id, 
dbms_lob.getlength(archivo_pdf) as longitud
from proyecto_pdf_e2;

Prompt empleado acceso local a los BLOBS
select empleado_id, dbms_lob.getlength(foto) as longitud
from empleado;

Prompt Listoo!!
exit