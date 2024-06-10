Prompt conectando como aegg_particiones_bdd
connect aegg_particiones_bdd/aegg@aeggbdd_s1;

Prompt creando tabla cliente
create table cliente (
  cliente_id number(10,0),
  nombre varchar2(40),
  ap_materno varchar2(40),
  ap_paterno varchar2(40),
  num_identificacion varchar(18),
  email varchar(500),
  constraint cliente_pk primary key (cliente_id)
) partition by hash(cliente_id) (
  partition cliente_p1,
  partition cliente_p2,
  partition cliente_p3
) parallel;

Prompt creando tabla orden_compra
create table orden_compra (
  orden_compra_id number(10,0),
  fecha_compra date,
  num_cuenta_banco varchar2(50),
  cliente_id number(10,0) not null,
  constraint orden_compra_pk primary key (orden_compra_id),
  constraint compra_cliente_fk foreign key (cliente_id) 
    references cliente(cliente_id)
) partition by reference(compra_cliente_fk);

Prompt insertando datos en cliente
insert into cliente (cliente_id, nombre, ap_paterno, ap_materno, num_identificacion, email) values (1, 'Emiliano', 'Gutierrez', 'Galicia','HD983DLSD43M98UF4F', 'oloroco1@hotmail.com');
insert into cliente (cliente_id, nombre, ap_paterno, ap_materno, num_identificacion, email) values (2, 'Bonnibelle', 'Sprowle', 'Romei', 'uq55tH9cw3Y0fv52MX', 'bromei0@plala.or.jp');
insert into cliente (cliente_id, nombre, ap_paterno, ap_materno, num_identificacion, email) values (3, 'Letty', 'Kybird', 'D'' Angelo', 'y5kIVjlKiTm4O669n4', 'ldangelo1@boston.com');
insert into cliente (cliente_id, nombre, ap_paterno, ap_materno, num_identificacion, email) values (4, 'Evelyn', 'Carr', 'O''Loughlin', '75swfxq2Cr7R8te56e', 'eoloughlin2@cnet.com');
insert into cliente (cliente_id, nombre, ap_paterno, ap_materno, num_identificacion, email) values (5, 'Rivalee', 'Petrasso', 'Filipiak', 'w7w2Y72Ve51fiH8Ko9', 'rfilipiak3@mit.edu');
insert into cliente (cliente_id, nombre, ap_paterno, ap_materno, num_identificacion, email) values (6, 'Traver', 'Peizer', 'Bill', 'HLr6DjayC8ycD8G00t', 'tbill4@opensource.org');
insert into cliente (cliente_id, nombre, ap_paterno, ap_materno, num_identificacion, email) values (7, 'Faye', 'Cray', 'Matysiak', 'N9QZwV1S0a3eJOoo2G', 'fmatysiak5@taobao.com');
insert into cliente (cliente_id, nombre, ap_paterno, ap_materno, num_identificacion, email) values (8, 'Hobart', 'Tutchell', 'Whatson', 'S5Ouq3C0sEw5tcIS0r', 'hwhatson6@uol.com.br');
insert into cliente (cliente_id, nombre, ap_paterno, ap_materno, num_identificacion, email) values (9, 'Isidor', 'Isted', 'McClintock', 'S1nYI17OuO01f0PFx1', 'imcclintock7@ed.gov');
insert into cliente (cliente_id, nombre, ap_paterno, ap_materno, num_identificacion, email) values (10, 'Eadith', 'Jiranek', 'Toohey', 'gBv004e5IWdHW5ZOU8', 'etoohey8@soup.io');


Prompt insertando datos en orden compra
insert into orden_compra (orden_compra_id, fecha_compra, num_cuenta_banco, cliente_id) values (1, to_date('26-05-2024','dd-mm-yyyy'), 'FM49-38UR-439R-8U34', 1 );
insert into orden_compra (orden_compra_id, fecha_compra, num_cuenta_banco, cliente_id) values (2, to_date('29-09-2023','dd-mm-yyyy'), '1098-3053-1521-3081', 6);
insert into orden_compra (orden_compra_id, fecha_compra, num_cuenta_banco, cliente_id) values (3, to_date('18-07-2023','dd-mm-yyyy'), '5474-8803-5397-0607', 1);
insert into orden_compra (orden_compra_id, fecha_compra, num_cuenta_banco, cliente_id) values (4, to_date('05-02-2024','dd-mm-yyyy'), '6495-8851-4117-7552', 2);
insert into orden_compra (orden_compra_id, fecha_compra, num_cuenta_banco, cliente_id) values (5, to_date('30-09-2023','dd-mm-yyyy'), '4526-6351-9714-3341', 2);
insert into orden_compra (orden_compra_id, fecha_compra, num_cuenta_banco, cliente_id) values (6, to_date('20-11-2023','dd-mm-yyyy'), '6792-8711-5896-5150', 8);
insert into orden_compra (orden_compra_id, fecha_compra, num_cuenta_banco, cliente_id) values (7, to_date('20-08-2023','dd-mm-yyyy'), '2166-8588-1654-8324', 1);
insert into orden_compra (orden_compra_id, fecha_compra, num_cuenta_banco, cliente_id) values (8, to_date('31-05-2023','dd-mm-yyyy'), '5986-6077-9459-7253', 8);
insert into orden_compra (orden_compra_id, fecha_compra, num_cuenta_banco, cliente_id) values (9, to_date('08-01-2024','dd-mm-yyyy'), '3005-8081-8509-0194', 10);
insert into orden_compra (orden_compra_id, fecha_compra, num_cuenta_banco, cliente_id) values (10, to_date('18-09-2023','dd-mm-yyyy'), '1108-2530-9622-2315', 10);

Prompt consultando datos en cliente
select c.*,'cliente_p1' as nombre_particion
from cliente partition(cliente_p1) c
union all
select c.*,'cliente_p2' as nombre_particion
from cliente partition(cliente_p2) c
union all
select c.*,'cliente_p3' as nombre_particion
from cliente partition(cliente_p3) c;

Prompt consultando datos en orden_compra
select o.*,'cliente_p1' as nombre_particion
from orden_compra partition(cliente_p1) o
union all
select o.*,'cliente_p2' as nombre_particion
from orden_compra partition(cliente_p2) o
union all
select o.*,'cliente_p3' as nombre_particion
from orden_compra partition(cliente_p3) o;