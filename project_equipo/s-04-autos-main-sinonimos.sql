--@author: Ricardo Vega
--@Date: 30-may-2024
--@Description: Main script to create and validate synonym

clear screen
whenever sqlerror exit rollback;

connect autos_bdd/autos_bdd@rdvgbdd_s1 
Prompt ===============================
Prompt Creando sinonimos en rdvgbdd_s1
Prompt ===============================
@s-04-autos-rdvgbdd-s1-sinonimos.sql 
@s-04-autos-valida-sinonimos.sql  

connect autos_bdd/autos_bdd@rdvgbdd_s2
Prompt ===============================
Prompt Creando sinonimos en rdvgbdd_s2
Prompt ===============================
@s-04-autos-rdvgbdd-s2-sinonimos.sql 
@s-04-autos-valida-sinonimos.sql  

connect autos_bdd/autos_bdd@aeggbdd_s1 
Prompt ===============================
Prompt Creando sinonimos en aeggbdd_s1
Prompt ===============================
@s-04-autos-aeggbdd-s1-sinonimos.sql 
@s-04-autos-valida-sinonimos.sql  

connect autos_bdd/autos_bdd@aeggbdd_s2
Prompt ===============================
Prompt Creando sinonimos en aeggbdd_s2
Prompt ===============================
@s-04-autos-aeggbdd-s2-sinonimos.sql 
@s-04-autos-valida-sinonimos.sql   