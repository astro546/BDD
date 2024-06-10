--@Autor: Emiliano Gutierrez
--@Fecha creación: 23/04/2024
--@Descripción: Script de ejecución para crear de vistas
-- en ambas PDBs

prompt conectándose a aeggbdd_s1
connect consultora_bdd/consultora01#@aeggbdd_s1

Prompt creando vistas en aeggbdd_s1
@s-04-aegg-def-vistas.sql

Prompt conectándose a aeggbdd_s2
connect consultora_bdd/consultora01#@aeggbdd_s2

Prompt creando vistas en aeggbdd_s2
@s-04-aegg-def-vistas.sql

Prompt Listo!