Prompt conectandose a aeggbdd_s1 como SYS
connect sys@aeggbdd_s1 as sysdba;

Prompt creando usuario consultora_bdd en aeggbdd_s1
create user consultora_bdd identified by consultora01# quota unlimited on users;
grant create session, create table, create procedure, create sequence to consultora_bdd;

Prompt conectandose a aeggbdd_s2 como SYS
connect sys@aeggbdd_s2 as sysdba;

Prompt creando usuario consultora_bdd en aeggbdd_s2
create user consultora_bdd identified by consultora01# quota unlimited on users;
grant create session, create table, create procedure, create sequence to consultora_bdd;

Prompt Listo!!
exit