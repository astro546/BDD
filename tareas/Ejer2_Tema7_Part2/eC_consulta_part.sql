Prompt conectando como aegg_paralelo_bdd
connect aegg_paralelo_bdd/aegg@aeggbdd_s1;

Prompt realizando consulta sin paralelismo
explain plan for 
select venta_id, categoria, producto_id, cantidad
from ventas
where categoria in ('Linea Blanca', 'Electronica');

select * from table(dbms_xplan.display);


Prompt realizando consulta con paralelismo DOP=4
explain plan for 
select /*+ parallel(4) */
venta_id, categoria, producto_id, cantidad
from ventas
where categoria in ('Linea Blanca', 'Electronica');

select * from table(dbms_xplan.display);