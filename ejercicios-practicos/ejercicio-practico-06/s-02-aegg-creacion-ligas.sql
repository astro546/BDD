--@Autor: Emiliano Guiterrez
--@Fecha creacion: 22/04/2024
--@Descripcion: Creacion de ligas

prompt Creando liga en aeggbdd_s1 hacia aeggbdd_s2
connect consultora_bdd/consultora01#@aeggbdd_s1
create database link aeggbdd_s2.fi.unam using 'AEGGBDD_S2';

prompt Creando liga en aeggbdd_s2 hacia aeggbdd_s1
connect consultora_bdd/consultora01#@aeggbdd_s2
create database link aeggbdd_s1.fi.unam using 'AEGGBDD_S1';

prompt Listoo!!
exit
