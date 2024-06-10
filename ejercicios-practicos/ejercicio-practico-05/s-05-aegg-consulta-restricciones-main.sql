--@Autor: Emiliano Guiterrez
--@Fecha creacion: 21/03/2024
--@Descripcion: Consulta de restricciones de referencia en aegg-pc

Prompt Conectando a S1 - aeggbdd_s1
connect consultora_bdd/consultora01#@aeggbdd_s1

Prompt ejecutando la consulta en s1
@s-05-aegg-consulta-restricciones.sql

Prompt Conectando a S2 - aeggbdd_s2
connect consultora_bdd/consultora01#@aeggbdd_s2

Prompt ejecutando la consulta en s2
@s-05-aegg-consulta-restricciones.sql

Prompt Listo!!!
exit