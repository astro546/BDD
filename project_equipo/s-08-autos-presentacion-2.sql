--@author: Ricardo Vega
--@Date: 29-may-2024
--@Description: Script main to manage binary files

clear screen
whenever sqlerror exit rollback;

connect autos_bdd/autos_bdd@rdvgbdd_s1 
Prompt ===============================
Prompt Cargando catalogos replicados en rdvgbdd_s1
Prompt ===============================
delete from STATUS_AUTO;
@carga-inicial/status_auto.sql 

connect autos_bdd/autos_bdd@rdvgbdd_s2
Prompt ===============================
Prompt Cargando catalogos replicados en rdvgbdd_s2
Prompt ===============================
delete from STATUS_AUTO;
@carga-inicial/status_auto.sql 

connect autos_bdd/autos_bdd@aeggbdd_s1 
Prompt ===============================
Prompt Cargando catalogos replicados en aeggbdd_s1
Prompt ===============================
delete from STATUS_AUTO;
@carga-inicial/status_auto.sql 

connect autos_bdd/autos_bdd@aeggbdd_s2
Prompt ===============================
Prompt Cargando catalogos replicados en aeggbdd_s2
Prompt ===============================
delete from STATUS_AUTO;
@carga-inicial/status_auto.sql 

Prompt Haciendo commit de todos los datos 
commit;

Prompt listos!!!
disconnect