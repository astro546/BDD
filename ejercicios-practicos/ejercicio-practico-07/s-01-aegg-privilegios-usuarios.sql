--@Autor: Emiliano Gutierrez
--@Fecha creación: 23/04/2024
--@Descripción: Otorgacion de permisos de creacion de sinonimos

Prompt conectandose a aeggbdd_s1
connect sys@aeggbdd_s1 as sysdba;

grant create type, create procedure, create view, create synonym to consultora_bdd;

Prompt conectandose a aeggbdd_s2
connect sys@aeggbdd_s2 as sysdba;

grant create type, create procedure, create view, create synonym to consultora_bdd;

prompt Listoo!!
exit