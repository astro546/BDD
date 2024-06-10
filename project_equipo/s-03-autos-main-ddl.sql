--@author: Ricardo Vega
--@Date: 30-may-2024
--@Description: Main DDL

clear screen
whenever sqlerror exit rollback;

connect autos_bdd/autos_bdd@rdvgbdd_s1 
Prompt ===============================
Prompt Creando fragmentos en rdvgbdd_s1
Prompt ===============================
@s-03-autos-rdvgbdd-s1-ddl.sql 

connect autos_bdd/autos_bdd@rdvgbdd_s2
Prompt ===============================
Prompt Creando fragmentos en rdvgbdd_s2
Prompt ===============================
@s-03-autos-rdvgbdd-s2-ddl.sql

connect autos_bdd/autos_bdd@aeggbdd_s1 
Prompt ===============================
Prompt Creando fragmentos en aeggbdd_s1
Prompt ===============================
@s-03-autos-aeggbdd-s1-ddl.sql 

connect autos_bdd/autos_bdd@aeggbdd_s2
Prompt ===============================
Prompt Creando fragmentos en aeggbdd_s2
Prompt ===============================
@s-03-autos-aeggbdd-s2-ddl.sql 

Prompt Fragmentos listos!!!