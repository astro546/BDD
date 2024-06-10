--@Autor: Emiliano Gutierrez
--@Fecha creación:
--@Descripción: Script principal - creación de triggers
clear screen
whenever sqlerror exit rollback;
prompt =====================================
prompt Creando triggers para rdvgbdd_s1
prompt =====================================
connect autos_bdd/autos_bdd@rdvgbdd_s1
@s-06-autos-trigger-pais.sql --el mismo para todos los nodos
@s-06-autos-rdvg-s1-trigger-sucursal.sql
@s-06-autos-rdvg-s1-trigger-auto.sql
@s-06-autos-rdvg-s1-trigger-auto-particular.sql
@s-06-autos-rdvg-s1-trigger-auto-carga.sql
@s-06-autos-trigger-historico-status-auto.sql --el mismo para todos los nodos
@s-06-autos-trigger-cliente.sql -- el mismo para todos
@s-06-autos-trigger-tarjeta-cliente.sql -- el mismo para todos
@s-06-autos-rdvg-s1-trigger-pago-auto.sql
--tablas replicadas
@s-06-autos-trigger-modelo.sql -- el mismo para todos
@s-06-autos-trigger-marca.sql -- el mismo para todos

prompt =====================================
prompt Creando triggers para rdvgbdd_s2
prompt =====================================
connect autos_bdd/autos_bdd@rdvgbdd_s2
@s-06-autos-trigger-pais.sql --el mismo para todos los nodos
@s-06-autos-rdvg-s2-trigger-sucursal.sql
@s-06-autos-rdvg-s2-trigger-auto.sql
@s-06-autos-rdvg-s2-trigger-auto-particular.sql
@s-06-autos-rdvg-s2-trigger-auto-carga.sql
@s-06-autos-trigger-historico-status-auto.sql --el mismo para todos los nodos
@s-06-autos-trigger-cliente.sql -- el mismo para todos
@s-06-autos-trigger-tarjeta-cliente.sql -- el mismo para todos
@s-06-autos-rdvg-s1-trigger-pago-auto.sql
--tablas replicadas
@s-06-autos-trigger-modelo.sql -- el mismo para todos
@s-06-autos-trigger-marca.sql -- el mismo para todos

prompt =====================================
prompt Creando triggers para aeggbdd_s1
prompt =====================================
connect autos_bdd/autos_bdd@aeggbdd_s1
@s-06-autos-trigger-pais.sql --el mismo para todos los nodos
@s-06-autos-rdvg-s1-trigger-sucursal.sql -- reutilizando script
@s-06-autos-rdvg-s1-trigger-auto.sql -- reutilizando script
@s-06-autos-rdvg-s1-trigger-auto-particular.sql --reutilizando script
@s-06-autos-rdvg-s1-trigger-auto-carga.sql --reutilizando script
@s-06-autos-trigger-historico-status-auto.sql --el mismo para todos los nodos
@s-06-autos-trigger-cliente.sql -- el mismo para todos
@s-06-autos-trigger-tarjeta-cliente.sql -- el mismo para todos
@s-06-autos-aegg-s1-trigger-pago-auto.sql --reutilizando script
--tablas replicadas
@s-06-autos-trigger-modelo.sql -- el mismo para todos
@s-06-autos-trigger-marca.sql -- el mismo para todos

prompt =====================================
prompt Creando triggers para aeggbdd_s2
prompt =====================================
connect autos_bdd/autos_bdd@aeggbdd_s2
@s-06-autos-trigger-pais.sql --el mismo para todos los nodos
@s-06-autos-rdvg-s1-trigger-sucursal.sql -- reutilizando script
@s-06-autos-aegg-s2-trigger-auto.sql -- aqui no se reutiliza por tener el dato BLOB
@s-06-autos-rdvg-s1-trigger-auto-particular.sql --reutilizando script
@s-06-autos-rdvg-s1-trigger-auto-carga.sql --reutilizando script
@s-06-autos-trigger-historico-status-auto.sql --el mismo para todos los nodos
@s-06-autos-trigger-cliente.sql -- el mismo para todos
@s-06-autos-trigger-tarjeta-cliente.sql -- el mismo para todos
@s-06-autos-aegg-s2-trigger-pago-auto.sql --reutilizando script
--tablas replicadas
@s-06-autos-trigger-modelo.sql -- el mismo para todos
@s-06-autos-trigger-marca.sql -- el mismo para todos
prompt Listo!
disconnect