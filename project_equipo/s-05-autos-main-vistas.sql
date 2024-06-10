--@author: Ricardo Vega
--@Date: 30-may-2024
--@Description: Main create views on PDB's

clear screen
whenever sqlerror exit rollback;
-------------rdvgbdd_s1----------------------
connect autos_bdd/autos_bdd@rdvgbdd_s1 
Prompt ===============================
Prompt Creando vistas en rdvgbdd_s1
Prompt ===============================
Prompt Vistas sin manejo de blobs 
@s-05-autos-vistas.sql 

Prompt Creando tablas temporales 
@s-05-autos-tablas-temporales13.sql 

Prompt Creando funciones para manejo de blobs 
@s-05-autos-funciones-blob13.sql 

Prompt Creando vistas con soporte para blobs 
@s-05-autos-rdvgbdd-s1-vistas-blob.sql

-------------rdvgbdd_s2----------------------
connect autos_bdd/autos_bdd@rdvgbdd_s2
Prompt ===============================
Prompt Creando vistas en rdvgbdd_s2
Prompt ===============================
Prompt Vistas sin manejo de blobs 
@s-05-autos-vistas.sql 

Prompt Creando tablas temporales 
@s-05-autos-tablas-temporales13.sql 

Prompt Creando funciones para manejo de blobs 
@s-05-autos-funciones-blob13.sql 

Prompt Creando vistas con soporte para blobs 
@s-05-autos-rdvgbdd-s2-vistas-blob.sql

-------------aeggbdd_s1----------------------
connect autos_bdd/autos_bdd@aeggbdd_s1 
Prompt ===============================
Prompt Creando vistas en aeggbdd_s1
Prompt ===============================
Prompt Vistas sin manejo de blobs 
@s-05-autos-vistas.sql 

Prompt Creando tablas temporales 
@s-05-autos-tablas-temporales13.sql 

Prompt Creando funciones para manejo de blobs 
@s-05-autos-funciones-blob13.sql 

Prompt Creando vistas con soporte para blobs 
@s-05-autos-aeggbdd-s1-vistas-blob.sql

-------------aeggbdd_s2----------------------
connect autos_bdd/autos_bdd@aeggbdd_s2
Prompt ===============================
Prompt Creando vistas en aeggbdd_s2
Prompt ===============================
Prompt Vistas sin manejo de blobs 
@s-05-autos-vistas.sql 

Prompt Creando tablas temporales 
@s-05-autos-tablas-temporales4.sql 

Prompt Creando funciones para manejo de blobs 
@s-05-autos-funciones-blob4.sql 

Prompt Creando vistas con soporte para blobs 
@s-05-autos-aeggbdd-s2-vistas-blob.sql

Prompt vistas listos!!!