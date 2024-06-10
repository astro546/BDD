--@author: Ricardo Vega
--@Date: 29-may-2024
--@Description: Create datalink for PDB

clear screen 
whenever sqlerror exit rollback;

connect autos_bdd/autos_bdd@rdvgbdd_s1 
Prompt ===============================
Prompt Creando ligas en rdvgbdd_s1 
Prompt ===============================

Prompt PDB local 
create database link rdvgbdd_s2.fi.unam using 'RDVGBDD_S2';
Prompt PDB remotas
create database link aeggbdd_s1.fi.unam using 'AEGGBDD_S1';
create database link aeggbdd_s2.fi.unam using 'AEGGBDD_S2';

connect autos_bdd/autos_bdd@rdvgbdd_s2
Prompt ===============================
Prompt Creando ligas en rdvgbdd_s2
Prompt ===============================

Prompt PDB local 
create database link rdvgbdd_s1.fi.unam using 'RDVGBDD_S1';
Prompt PDB remotas
create database link aeggbdd_s1.fi.unam using 'AEGGBDD_S1';
create database link aeggbdd_s2.fi.unam using 'AEGGBDD_S2';

connect autos_bdd/autos_bdd@aeggbdd_s1
Prompt ===============================
Prompt Creando ligas en aeggbdd_s1
Prompt ===============================

Prompt PDB local 
create database link aeggbdd_s2.fi.unam using 'AEGGBDD_S2';
Prompt PDB remotas
create database link rdvgbdd_s1.fi.unam using 'RDVGBDD_S1';
create database link rdvgbdd_s2.fi.unam using 'RDVGBDD_S2';

connect autos_bdd/autos_bdd@aeggbdd_s2
Prompt ===============================
Prompt Creando ligas en aeggbdd_s2
Prompt ===============================

Prompt PDB local 
create database link aeggbdd_s1.fi.unam using 'AEGGBDD_S1';
Prompt PDB remotas
create database link rdvgbdd_s1.fi.unam using 'RDVGBDD_S1';
create database link rdvgbdd_s2.fi.unam using 'RDVGBDD_S2';

Prompt Creacion ligas!
disconnect