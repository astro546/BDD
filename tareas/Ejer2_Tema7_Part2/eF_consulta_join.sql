Prompt conectando como aegg_paralelo_bdd
connect aegg_paralelo_bdd/aegg@aeggbdd_s1;

Prompt consulta con partial partition wise join y DOP = 4
explain plan for 
select /*+ parallel(4) */
d.distancia_id, c.nombre, d.distancia
from distancias d, distancias_corredores c
where d.distancia_id = c.distancia_id
and d.fecha_dist between '27-May-2010' and '03-Mar-2015';

select * from table(dbms_xplan.display);