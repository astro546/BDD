--@Autor: Emiliano Guiterrez
--@Fecha creacion: 21/03/2024
--@Descripcion: Consulta de frgamentos creados en aegg-pc

Prompt Conectando a S1 - aeggbdd_s1
connect consultora_bdd/consultora01#@aeggbdd_s1;

Prompt mostrando lista de fragmentos
col table_name format a30
select table_name from user_tables;

Prompt Conectando a S2 - aeggbdd_s2
connect consultora_bdd/consultora01#@aeggbdd_s2;

Prompt mostrando lista de fragmentos
col table_name format a30
select table_name from user_tables;

Prompt Listo!!
exit