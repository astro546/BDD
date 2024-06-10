--@Autor: Emiliano Gutierrez
--@Fecha creación: 25/04/2024
--@Descripción: Otorgacion de permisos

Prompt conectadose al sitio 1 como sys
connect sys/system@aeggbdd_s1 as sysdba;

Prompt otorgando permiso de crear trigger
grant create trigger to consultora_bdd

Prompt conectadose al sitio 2 como sys
connect sys/system@aeggbdd_s2 as sysdba;

Prompt otorgando permiso de crear trigger
grant create trigger to consultora_bdd;

Prompt Listoo!!