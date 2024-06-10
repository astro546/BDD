--@Autor: Emiliano Guiterrez
--@Fecha creacion: 21/03/2024
--@Descripcion: Ejecucion de scripts de creacion de objetos

Prompt Conectando a S1 - aeggbdd_s1
connect consultora_bdd/consultora01#@aeggbdd_s1

Prompt ejecutando la consulta en s1
@s-02-aegg-s1-ddl.sql

Prompt Conectando a S2 - aeggbdd_s2
connect consultora_bdd/consultora01#@aeggbdd_s2

Prompt ejecutando la consulta en s1
@s-02-aegg-s2-ddl.sql

Prompt Listo!!!
exit