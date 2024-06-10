Prompt Conectandose a aeggbdd_s1
connect consultora_bdd/consultora01#@aeggbdd_s1;

Prompt eliminando sinonimos del sitio 1
drop synonym proyecto_pdf;

Prompt eliminando vistas del sitio 1
drop view proyecto_pdf_e1;
drop view proyecto_pdf_e2;

Prompt eliminando tipos del sitio 1
drop type pdf_type force;

Prompt Conectandose a aeggbdd_s2
connect consultora_bdd/consultora01#@aeggbdd_s2;

Prompt eliminando sinonimos del sitio 2
drop synonym proyecto_pdf;

Prompt eliminando vistas del sitio 2
drop view proyecto_pdf_e1;
drop view proyecto_pdf_e2;

Prompt eliminando tipos del sitio 2
drop type pdf_type force;

Prompt Listo. Volver a correr s-05-aeggbdd_s1-soporte-blobs.sql y s-05-aeggbdd_s2-soporte-blobs.sql