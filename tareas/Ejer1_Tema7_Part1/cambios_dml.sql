Prompt conectando a aeggbdd_s1
connect aegg_replica_bdd/aegg@aeggbdd_s1;

Prompt realizando eliminaciones
delete from auto where agencia_id = 475;


Prompt realizando inserciones
insert into auto 
values (300, 'Ford', 'Fiesta', '2024', 'NF984H3ML43G48303JLN', 'P', 750320.90, null, empty_blob(), sysdate, 1, 475, 73);

insert into auto 
values (1398, 'Ferrari', 'Italia', '2009', 'BHJ09HFJ943G483F9435', 'P', 980350.90, null, empty_blob(), sysdate, 3, 475, 539);


Prompt realizando actualizaciones
update cliente 
set nombre = 'Maximiliano'
where cliente_id = 88;

update agencia
set clave = 'DF-432-L'
where agencia_id = 190;

update auto
set precio = 600000.50
where auto_id = 755;

commit;