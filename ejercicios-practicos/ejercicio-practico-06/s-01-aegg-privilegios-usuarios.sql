--@Autor: Emiliano Guiterrez
--@Fecha creacion: 22/04/2024
--@Descripcion: Creacion de usuarios

Prompt conectandose al sitio 1
connect sys/system@aeggbdd_s1 as sysdba

Prompt otorgando permisos
grant create database link, create procedure to consultora_bdd;

Prompt conectandose al sitio 2
connect sys/system@aeggbdd_s2 as sysdba

Prompt otorgando permisos
grant create database link, create procedure to consultora_bdd;