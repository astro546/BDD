--@Autor:          Jorge A. Rodríguez C
--@Fecha creación:  dd/mm/yyyy
--@Descripción:     script de validación Práctica 06 - Consultora BDD

whenever sqlerror exit rollback
set serveroutput on
set verify off

--
-- Configurar las siguientes variables en caso de ser necesario
--

--usuario de la práctica
define p_usuario=consultora_bdd

--password de la practica
define p_usr_pwd=consultora01#

--nombre de la pdb correspondiente al sitio 1
define p_pdb1=aeggbdd_s1

-- nombre de la pdb correspondiente al sitio 2
define p_pdb2=aeggbdd_s2

--iniciales empleadas para nombrar fragmentos
define p_iniciales=AEGG


--- ============= Las siguientes configuraciones ya no requieren cambiarse====

Prompt =========================================================
Prompt Iniciando validador - Práctica 6
Prompt Presionar Enter si los valores configurados son correctos.
Prompt De lo contario editar el script s-05-validador-main.sql
Prompt O en su defecto proporcionar nuevos valores
Prompt =========================================================

Prompt Datos de Entrada:
accept p_usuario default '&&p_usuario' prompt '1. Proporcionar el nombre de usuario [&&p_usuario]: '
accept p_usr_pwd default '&&p_usr_pwd' prompt '2. Proporcionar password del usuario &&p_usuario [configurado en script]: ' hide
accept p_pdb1 default '&&p_pdb1' prompt '3. Nombre del sitio 1 (PDB 1). [&&p_pdb1]: '
accept p_pdb2 default '&&p_pdb2' prompt '4. Nombre del sitio 2 (PDB 2). [&&p_pdb2]: '
accept p_iniciales default '&&p_iniciales' prompt '5. Iniciales para nombrar fragmentos [&&p_iniciales]: '

--crea Objetos

define p_validador=s-05p-validador-crea-spv.plb

start &&p_validador &&p_pdb1 &&p_usuario &&p_usr_pwd
start &&p_validador &&p_pdb2 &&p_usuario &&p_usr_pwd

--ejecuta procedimientos
exec spv_print_header
host sha256sum &&p_validador

start s-05-validador-ejecuta-spv.sql &&p_pdb1 &&p_usuario &&p_usr_pwd 1 &&p_iniciales
start s-05-validador-ejecuta-spv.sql &&p_pdb2 &&p_usuario &&p_usr_pwd 2 &&p_iniciales

Prompt Lista de PDFs:
!ls -l /tmp/bdd/p06/*.pdf

exec spv_print_ok('Validación concluida');

Prompt Listo!.
exit