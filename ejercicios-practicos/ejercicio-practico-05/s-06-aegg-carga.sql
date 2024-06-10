--@Autor: Emiliano Guiterrez
--@Fecha creacion: 21/03/2024
--@Descripcion: Carga inicial en aegg-pc

Prompt conectando a S1 - aeggbdd_s1
connect consultora_bdd/consultora01#@aeggbdd_s1;

whenever sqlerror exit rollback;

Prompt limpiando
delete from f_aegg_pago_empleado_1;
delete from f_aegg_proyecto_pdf_1;
delete from f_aegg_proyecto_1;
delete from f_aegg_oficina_1;
delete from f_aegg_pais_1;
delete from f_aegg_empleado_2;

Prompt Cargando datos en s1
Prompt Cargando datos en pais_1
insert into f_aegg_pais_1 values (
  1, 'MX', 'MEXICO', 'A'
);

Prompt cargando datos en oficina_1
insert into f_aegg_oficina_1 values(
  1, 'OFCINA 1 DE CDMX', 1
);

Prompt cargando datos en empleado_2
insert into f_aegg_empleado_2 values(
  1,'JUAN','LOPEZ','LARA','LOLA890802KML','juang@m.com', null
);
insert into f_aegg_empleado_2 values(
  2,'CARLOS','BAEZ','AGUIRRE','BAAGCA982613','carlos@m.com', 1
);

Prompt cargando datos en proyecto_1
insert into f_aegg_proyecto_1 values(
  1, 'PROYECTO A', 'P00A', to_date('03/02/2009','DD/MM/YYYY'), to_date('31/12/2012','DD/MM/YYYY'), 1, 1
);

Prompt cargando datos en proyecto_pdf_1
insert into f_aegg_proyecto_pdf_1 values(
  1, 1, empty_blob(), 2
);

Prompt cargando datos en pagoemp_1
insert into f_aegg_pago_empleado_1 values(
  1, 1500.45, to_date('01/02/2017','DD/MM/YYYY'), 1, 1
);
insert into f_aegg_pago_empleado_1 values(
  2, 5490.45, to_date('01/08/2017','DD/MM/YYYY'), 3, 2
);

commit;

Prompt conectando a S2 - aeggbdd_s2
connect consultora_bdd/consultora01#@aeggbdd_s2;

whenever sqlerror exit rollback;

Prompt limpiando
delete from f_aegg_pago_empleado_2;
delete from f_aegg_proyecto_pdf_2;
delete from f_aegg_proyecto_2;
delete from f_aegg_proyecto_3;
delete from f_aegg_empleado_1;
delete from f_aegg_empleado_3;
delete from f_aegg_oficina_2;
delete from f_aegg_pais_2;

Prompt Cargando datos en s2
Prompt cargando datos en pais_2
insert into f_aegg_pais_2 values (
  2, 'JAP', 'JAPON', 'B'
);

Prompt cargando datos en oficina_2
insert into f_aegg_oficina_2 values (
  2, 'OFICINA 1 DE TOKIO', 2
);

Prompt cargando datos en empleado_3
insert into f_aegg_empleado_3 values (
  3, 'EVA', 'ZAVALA', 'CORTES', 'ZACOEV040423', 'eva@m.com', 1
);

Prompt cargando datos en empleado_1
insert into f_aegg_empleado_1 values (
  1, empty_blob(), 09933402
);
insert into f_aegg_empleado_1 values (
  2, empty_blob(), 04449321
);
insert into f_aegg_empleado_1 values (
  3, empty_blob(), 67382342
);

Prompt cargando datos en proyecto_2
insert into f_aegg_proyecto_2 values (
  2, 'PROYECTO B', 'P00B', to_date('14/01/2008','DD/MM/YYYY'), to_date('31/12/2013','DD/MM/YYYY'), 2, 2
);

Prompt cargando datos en proyecto_3
insert into f_aegg_proyecto_3 values (
  3, 'PROYECTO C', 'P00C', to_date('06/05/2008','DD/MM/YYYY'), null, 2, 3
);

Prompt cargando datos en proyecto_pdf_2
insert into f_aegg_proyecto_pdf_2 values (
  1, 2, empty_blob(), 4
);

Prompt cargando datos en pagoemp_2
insert into f_aegg_pago_empleado_2 values (
  3, 760.67, to_date('31/12/2016','DD/MM/YYYY'), 2, 3
);

commit;

Prompt Listo!!
exit
