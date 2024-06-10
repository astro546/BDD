--@author: Ricardo Vega
--@Date: 29-may-2024
--@Description: Script main to manage binary files

clear screen
set serveroutput on 

Prompt ============================
Prompt Preparando carga de datos 
Prompt ============================

Prompt => Seleccionar la PDB local para insertar datos 
Prompt => Para PDB remota, asegurarse que los archivos existan 

connect autos_bdd/autos_bdd@&pdb 

Prompt => Personalizando el formato de fechas 
alter session set nls_date_format='yyyy-mm-dd hh24:mi:ss';

Prompt => Si ocurre un error, se saldrá y hará rollback
whenever sqlerror exit rollback

Pause => Presionar Enter para iniciar extraccion de datos binarios, Ctrl-C para cancelar

Prompt Invocando shell script para extraccion de binarios 
!chmod +x s-08-autos-presentacion-3.sh 
!sh s-08-autos-presentacion-3.sh 

Prompt =======================================================
Prompt ¿ Listo para iniciar con la carga ?
Prompt =======================================================
Pause => Presiona Enter para iniciar, Ctrl-C para cancelar 

Prompt => Realizando limpieza dental ..........

set feedback off 
delete from tarjeta_cliente;
delete from pago_auto;
delete from cliente;
delete from auto_particular;
delete from auto_carga;
delete from historico_status_auto;
delete from auto;
update sucursal_f1 set sucursal_anexa_id = null;
update sucursal_f2 set sucursal_anexa_id = null;
update sucursal_f3 set sucursal_anexa_id = null;
delete from sucursal;
delete from pais;
delete from modelo;
delete from marca; 
set feedback on 

Prompt => Insertando datos .........

set feedback off 

Prompt => Insertando paises 
    @carga-inicial/pais_ame.sql 
    @carga-inicial/pais_eur.sql 

Prompt => Insertando Marcas 
    @carga-inicial/marca.sql 

Prompt => Insertando Modelos 
    @carga-inicial/modelo.sql 

Prompt => Insertando sucursal - parte1
    @carga-inicial/sucursal_1.sql

Prompt => Insertando sucursal - parte2 
    @carga-inicial/sucursal_2.sql

Prompt => Insertando autos - parte1
    @carga-inicial/auto_1.sql

Prompt => Insertando autos - parte2
    @carga-inicial/auto_2.sql

Prompt => Insertando autos particulares
    @carga-inicial/auto_particular.sql 

Prompt => Insertando autos carga 
    @carga-inicial/auto_carga.sql 

Prompt => Insertando Historio status auto - parte 1
    @carga-inicial/historico_status_auto_1.sql

Prompt => Insertando Historio status auto - parte 2
    @carga-inicial/historico_status_auto_2.sql

Prompt => Insertando Historio status auto - parte 3
    @carga-inicial/historico_status_auto_3.sql

Prompt => Insertando clientes 
    @carga-inicial/cliente.sql 

Prompt => Insertando Pagos de auto - parte 1
    @carga-inicial/pago_auto_1.sql 

Prompt => Insertando Pagos de auto - parte 2
    @carga-inicial/pago_auto_2.sql 

Prompt => Insertando Tarjetas
    @carga-inicial/tarjeta_cliente.sql 

set feedback on 
Prompt => Carga exitosa. Realizando commit
--commit;
exit;
