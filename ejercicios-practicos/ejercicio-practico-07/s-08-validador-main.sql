--@Autor:           Jorge Rodriguez
--@Fecha creación:  dd/mm/yyyy
--@Descripción:     Practica 7 - Validador - Main

--Modificar las siguientes 6 variables en caso de ser necesario.
--En scripts reales no debeń incluirse passwords. Solo se hace para
--propósitos de pruebas y evitar escribirlos cada vez que se quiera ejecutar 
--el proceso de validación de la práctica (propósitos académicos).

--
-- Nombre del usuario empleado en esta práctica
--
define p_usuario='consultora_bdd'

--
-- Password del usuario empleado en esta práctica
--
define p_usuario_pass='consultora01#'

--
-- Password del usuario sys
--
define p_sys_password='system'

--
-- Nombre de la PDB 1
--
define p_pdb1='aeggbdd_s1'

--
-- Nombre de la PDB 2
--
define p_pdb2='aeggbdd_s2'

--
-- Estrategia de fragmentacion para PAGO_EMPLEADO:
-- E: Fragmentación a partir de EMPLEADO
-- P: Fragmentación a partir de PROYECTO
define p_fr_pago='E'


--- ============= Las siguientes configuraciones ya no requieren cambiarse====

whenever sqlerror exit rollback
set verify off
set feedback off

Prompt =========================================================
Prompt Iniciando validador - Práctica 7
Prompt Presionar Enter si los valores configurados son correctos.
Prompt De lo contario editar el script s-08-validador-main.sql
Prompt O en su defecto proporcionar nuevos valores
Prompt =========================================================

Prompt Datos de Entrada:
accept p_sys_pwd default '&&p_sys_password' prompt '1. Proporcionar el password de SYS [&&p_sys_password]: '
accept p_usuario default '&&p_usuario' prompt '1. Proporcionar el nombre de usuario [&&p_usuario]: '
accept p_usuario_pass default '&&p_usuario_pass' prompt '2. Proporcionar password del usuario &&p_usuario [&&p_usuario_pass]: '
accept p_pdb1 default &&p_pdb1 prompt '3. Nombre del sitio 1 (PDB 1). [&&p_pdb1]: '
accept p_pdb2 default &&p_pdb2 prompt '4. Nombre del sitio 2 (PDB 2). [&&p_pdb2]: '

Prompt Indicar la estrategia de fragmentación para la tabla PAGO_EMPLEADO:
prompt E - Con respecto a EMPLEADO 
Prompt P - Con respecto a PROYECTO
accept p_fr_pago default '&&p_fr_pago' prompt 'Indicar valor [&&p_fr_pago]: '

define p_script_validador='s-08p-validador-transparencia.plb'

--ejecuta validacion en pdb1
start &&p_script_validador &&p_sys_pwd &&p_pdb1 &&p_usuario &&p_usuario_pass &&p_fr_pago 1

--ejecuta validacion en pdb2
start &&p_script_validador &&p_sys_pwd &&p_pdb2 &&p_usuario &&p_usuario_pass &&p_fr_pago 2

exit