--@author: Ricardo Vega
--@Date: 29-may-2024
--@Description: Create a user in each PDB

clear screen 
whenever sqlerror exit rollback;
set serveroutput on 

Prompt Iniciando creacion de usuarios 
accept syspass char prompt 'Proporcione password de sys: ' hide

Prompt =================================
Prompt Creando usuario en rdvgbdd_s1
Prompt =================================
connect sys/&&syspass@rdvgbdd_s1 as sysdba;
@s-01-autos-usuario.sql 

Prompt =================================
Prompt Creando usuario en rdvgbdd_s2
Prompt =================================
connect sys/&&syspass@rdvgbdd_s2 as sysdba;
@s-01-autos-usuario.sql 

Prompt =================================
Prompt Creando usuario en aeggbdd_s1
Prompt =================================
connect sys/&&syspass@aeggbdd_s1 as sysdba;
@s-01-autos-usuario.sql 

Prompt =================================
Prompt Creando usuario en aeggbdd_s2
Prompt =================================
connect sys/&&syspass@aeggbdd_s2 as sysdba;
@s-01-autos-usuario.sql 

Prompt Creacion usuarios lista
disconnect
