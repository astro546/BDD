--@author: Ricardo Vega
--@Date: 29-may-2024
--@Description: Script main to manage binary files

clear screen
whenever sqlerror exit rollback;

connect autos_bdd/autos_bdd@rdvgbdd_s1 
Prompt ===============================
Prompt Configurando soporte BLOB para rdvgbdd_s1
Prompt ===============================
@s-07-autos-configuracion-soporte-blobs.sql

connect autos_bdd/autos_bdd@rdvgbdd_s2
Prompt ===============================
Prompt Configurando soporte BLOB para rdvgbdd_s2
Prompt ===============================
@s-07-autos-configuracion-soporte-blobs.sql

connect autos_bdd/autos_bdd@aeggbdd_s1 
Prompt ===============================
Prompt Configurando soporte BLOB para aeggbdd_s1
Prompt ===============================
@s-07-autos-configuracion-soporte-blobs.sql

connect autos_bdd/autos_bdd@aeggbdd_s2
Prompt ===============================
Prompt Configurando soporte BLOB para aeggbdd_s2
Prompt ===============================
@s-07-autos-configuracion-soporte-blobs.sql

Prompt listos!!!
disconnect