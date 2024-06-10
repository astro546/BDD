Prompt creando los fragmentos para aggbdd_s2

Prompt creando tabla pais_2
create table f_aegg_pais_2 (
  pais_id number(5,0) not null,
  clave varchar(5) not null,
  nombre varchar(40) not null,
  region char(1) not null,
  constraint pais_pk primary key (pais_id)
);

Prompt creando tabla oficina_2
create table f_aegg_oficina_2(
  oficina_id number(5,0) not null,
  nombre varchar(40) not null,
  oficina_anexa_id number(5,0) null,
  pais_id number(5,0) not null,
  constraint oficina_2_pk primary key (oficina_id),
  constraint oficina_2_pais_id_fk foreign key (pais_id) references f_aegg_pais_2(pais_id) 
);

Prompt creando tabla empleado_1
create table f_aegg_empleado_1(
  empleado_id number(10,0) not null,
  foto blob not null,
  num_cuenta varchar(18) not null,
  constraint empleado_1_pk primary key (empleado_id)
);

Prompt creando tabla empleado_3
create table f_aegg_empleado_3(
  empleado_id number(10,0) not null,
  nombre varchar(40) not null,
  ap_paterno varchar(49) not null,
  ap_materno varchar(49) null,
  rfc varchar(13) not null,
  email varchar(40) null,
  jefe_id number(10,0) null,
  constraint empleado_3_pk primary key (empleado_id),
  constraint empleado_3_jefe_id foreign key (jefe_id) references f_aegg_empleado_1(empleado_id)
);

Prompt creando tabla proyecto_2
create table f_aegg_proyecto_2(
  proyecto_id number(10,0),
  nombre varchar(100) not null,
  clave varchar(5) not null,
  fecha_inicio date not null,
  fecha_fin date null,
  oficina_id number(5,0) not null,
  responsable_id number(10,0) not null,
  constraint proyecto_2_pk primary key (proyecto_id),
  constraint proyecto_2_oficina_id foreign key (oficina_id) references f_aegg_oficina_2(oficina_id),
  constraint proyecto_2_empleado_id foreign key (responsable_id) references f_aegg_empleado_1(empleado_id)
);

create table f_aegg_proyecto_3(
  proyecto_id number(10,0),
  nombre varchar(100) not null,
  clave varchar(5) not null,
  fecha_inicio date not null,
  fecha_fin date null,
  oficina_id number(5,0) not null,
  responsable_id number(10,0) not null,
  constraint proyecto_3_pk primary key (proyecto_id),
  constraint proyecto_3_oficina_id foreign key (oficina_id) references f_aegg_oficina_2(oficina_id),
  constraint proyecto_3_empleado_id foreign key (responsable_id) references f_aegg_empleado_1(empleado_id)
);

Prompt creando tabla proyecto_pdf_2
create table f_aegg_proyecto_pdf_2(
  num_pdf number(1,0),
  proyecto_id number(10,0),
  archivo_pdf blob not null,
  tamano number(10,2) not null,
  constraint proyecto_pdf_2_pk primary key (num_pdf, proyecto_id),
);

Prompt creando tabla pagoemp_2
create table f_aegg_pago_empleado_2(
  pago_empleado_id number(10,0),
  importe number(10,2) not null,
  fecha_pago date not null,
  proyecto_id number(10,0) not null,
  empleado_id number(10,0) not null,
  constraint pagoemp_2_pk primary key (pago_empleado_id),
  constraint pagoemp_2_empleado_id foreign key (empleado_id) references f_aegg_empleado_3(empleado_id)
);


