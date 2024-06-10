Prompt conectando como sys
connect sys/system@aeggbdd_s1 as sysdba

Prompt creando usuario aegg_particiones_bdd
create user aegg_paralelo_bdd identified by aegg quota unlimited on users;

Prompt otorgando permisosa aegg_particiones_bdd
grant create session, create table, create tablespace to aegg_paralelo_bdd;