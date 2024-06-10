--@Autor: Emiliano Gutierrez
--@Fecha creación: 25/04/2024
--@Descripción: Creacion de trigger para pais en ambos sitios

Prompt creando triggers en S1
connect consultora_bdd/consultora01#@aeggbdd_s1

Prompt creando trigger para pais
@s-03-aegg-pais-trigger.sql
show errors

Prompt creando trigger para oficina
@s-03-aegg-oficina-n1-trigger.sql
show errors

Prompt creando trigger para empleado
@s-03-aegg-empleado-n1-trigger.sql
show errors

Prompt creando triggers en S2
connect consultora_bdd/consultora01#@aeggbdd_s2

Prompt creando trigger para pais
@s-03-aegg-pais-trigger.sql
show errors

Prompt creando trigger para oficina
@s-03-aegg-oficina-n2-trigger.sql
show errors

Prompt creando trigger para empleado
@s-03-aegg-empleado-n2-trigger.sql
show errors

Prompt Listo!
exit