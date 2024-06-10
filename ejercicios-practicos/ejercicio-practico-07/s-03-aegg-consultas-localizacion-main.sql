--@Autor: Emiliano Gutierrez
--@Fecha creación: 23/04/2024
--@Descripción: Script encargado de realizar consultas con sinónimos
-- en ambas PDBs

prompt conectando a aeggbdd_s1
connect consultora_bdd/consultora01#@aeggbdd_s1

prompt Realizando conteo de registros
set serveroutput on
start s-03-aegg-consultas-localizacion.sql

prompt conectando a aeggbdd_s2
connect consultora_bdd/consultora01#@aeggbdd_s2

prompt Realizando conteo de registros
set serveroutput on
start s-03-aegg-consultas-localizacion.sql