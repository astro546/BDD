--@Autor: Jorge Rodriguez
--@Fecha creación: 22/04/2024
--@Descripción: Carga y Export de archivos PDF en el sitio AEGGBDD_S1

whenever sqlerror exit rollback;

--ruta donde se ubicarán los archivos PDFs
define p_pdf_path='/tmp/bdd/p06'
set verify off

Prompt Limpiando y creando directorio en &p_pdf_path
!rm -rf &p_pdf_path
!mkdir -p &p_pdf_path

Prompt cambiando permisos al directorio pdf
!chmod 777 &p_pdf_path

-- Se asume que los PDFs se encuentran en el mismo directorio donde se
-- ejecuta este script, es decir en /unam-bdd/ejercicios-practicos/ep-06, se realiza la copia
-- de los PDFs y se cambian los permisos
Prompt copiando PDFs
!cp m_archivo_*.pdf &p_pdf_path

Prompt cambiando permisos de los PDFs
!chmod 755 &p_pdf_path/m_archivo_*.pdf

Prompt conectando a aeggbdd_s1 como SYS 
accept p_sys_password default 'system' prompt 'Password de sys [system]: ' hide
connect sys@aeggbdd_s1/&p_sys_password as sysdba

Prompt creando un objeto DIRECTORY para acceder al directorio &p_pdf_path
create or replace directory tmp_dir as '&p_pdf_path';
grant read,write on directory tmp_dir to consultora_bdd;

Prompt conectando a aeggbdd_s2 como SYS 
accept p_sys_password default 'system' prompt 'Password de sys [system]: ' hide
connect sys@aeggbdd_s2/&p_sys_password as sysdba

Prompt creando un objeto DIRECTORY para acceder al directorio &p_pdf_path
create or replace directory tmp_dir as '&p_pdf_path';
grant read,write on directory tmp_dir to consultora_bdd;

------------------ Cargando datos en aeggbdd_s1 ----------------------
Prompt conectando a aeggbdd_s1 con usuario consultora_bdd para cargar datos binarios
connect consultora_bdd/consultora01#@aeggbdd_s1

/*
* En este sitio se cargarán los siguientes archivos.
* F_JRC_PROYECTO_PDF_1
*
* NUM_PDF PROYECTO_ID ARCHIVO_PDF
* ======= =========== =============
* 1 1 m_archivo_4.pdf
*/

Prompt ejecutando procedimientos para hacer import/export de datos BLOB
@s-00-carga-blob-en-bd.sql
@s-00-guarda-blob-en-archivo.sql

Prompt cargando datos binarios en aeggbdd_s1
begin
carga_blob_en_bd('TMP_DIR','m_archivo_4.pdf','f_aegg_proyecto_pdf_1',
'archivo_pdf','proyecto_id','1','num_pdf','1');
end;
/

Prompt mostrando el tamaño de los objetos BLOB en BD.
select proyecto_id,num_pdf,dbms_lob.getlength(archivo_pdf) as longitud
from f_aegg_proyecto_pdf_1
where proyecto_id = 1
and num_pdf = 1;

Prompt salvando datos BLOB en directorio TMP_DIR
begin
guarda_blob_en_archivo('TMP_DIR','m_export_archivo_4.pdf',
'f_aegg_proyecto_pdf_1','archivo_pdf','proyecto_id','1','num_pdf','1');
end;
/

Prompt mostrando el contenido del directorio para validar la existencia del archivo.
!ls -l &p_pdf_path/m_export_archivo_*.pdf


------------------ Cargando datos en aeggbdd_s2 ----------------------
Prompt conectando a aeggbdd_s2 con usuario consultora_bdd para cargar datos binarios
connect consultora_bdd/consultora01#@aeggbdd_s2

Prompt ejecutando procedimientos para hacer import/export de datos BLOB
@s-00-carga-blob-en-bd.sql
@s-00-guarda-blob-en-archivo.sql

Prompt cargando datos binarios en aeggbdd_s2
begin
carga_blob_en_bd('TMP_DIR','m_archivo_5.pdf','f_aegg_proyecto_pdf_2','archivo_pdf','proyecto_id','2','num_pdf','1');
carga_blob_en_bd('TMP_DIR','m_archivo_1.pdf','f_aegg_empleado_1',
'foto','empleado_id','1', null, null);
carga_blob_en_bd('TMP_DIR','m_archivo_2.pdf','f_aegg_empleado_1',
'foto','empleado_id','2', null, null);
carga_blob_en_bd('TMP_DIR','m_archivo_3.pdf','f_aegg_empleado_1',
'foto','empleado_id','3', null, null);
end;
/

Prompt mostrando el tamaño de los objetos BLOB en BD de proyecto pdf
select proyecto_id,num_pdf,dbms_lob.getlength(archivo_pdf) as longitud
from f_aegg_proyecto_pdf_2
where proyecto_id = 2
and num_pdf = 1;

Prompt mostrando el tamaño de los BLOBS en BD de empleado
select empleado_id, dbms_lob.getlength(foto) as longitud
from f_aegg_empleado_1;

Prompt salvando datos BLOB en directorio TMP_DIR
begin
guarda_blob_en_archivo('TMP_DIR','m_export_archivo_5.pdf',
'f_aegg_proyecto_pdf_2','archivo_pdf','proyecto_id','2','num_pdf','1');
guarda_blob_en_archivo('TMP_DIR','m_export_archivo_1.pdf','f_aegg_empleado_1',
'foto','empleado_id','1', null, null);
guarda_blob_en_archivo('TMP_DIR','m_export_archivo_2.pdf','f_aegg_empleado_1',
'foto','empleado_id','2', null, null);
guarda_blob_en_archivo('TMP_DIR','m_export_archivo_3.pdf','f_aegg_empleado_1',
'foto','empleado_id','3', null, null);
end;
/

Prompt mostrando el contenido del directorio para validar la existencia del archivo.
!ls -l &p_pdf_path/m_export_archivo_*.pdf

Prompt listoo!!