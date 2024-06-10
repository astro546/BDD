create user aegg_replica_bdd identified by replica01 quota unlimited on users;

grant create session, 
create materialized view, 
create table, 
create procedure, 
create sequence, 
alter any materialized view,
create database link, 
create public database link to aegg_replica_bdd;