--@author: Ricardo Vega
--@Date: 30-may-2024
--@Description: Create temporal table to manage object type blob

Prompt Elimando tablas en caso de existir 
declare     
    cursor cur_tablas is 
        select table_name 
        from user_tables
        where table_name in ('TI_AUTO_F1', 'TS_AUTO_F1') 
        or table_name in ('TI_PAGO_AUTO_FX', 'TS_PAGO_AUTO_FX');
begin 
    for r in cur_tablas loop 
    execute immediate 'drop table ' || r.table_name;
    end loop;
end;
/
show errors 

Prompt Temporal auto 
create global temporary table ti_auto_f1(
    auto_id number(10,0) constraint ti_auto_f1_pk primary key,
    foto blob not null
) on commit preserve rows;

create global temporary table ts_auto_f1(
    auto_id number(10,0) constraint ts_auto_f1_pk primary key,
    foto blob not null 
) on commit preserve rows;

Prompt Temporal pago_auto
create global temporary table ti_pago_auto_fx(
    cliente_id number(10,0),
    auto_id number(10,0),
    fecha_pago date not null, 
    importe number(8,2) not null, 
    recibo_pago blob not null,
    constraint ti_pago_auto_fx_pk primary key(cliente_id, auto_id)
) on commit preserve rows;

create global temporary table ts_pago_auto_fx(
    cliente_id number(10,0),
    auto_id number(10,0),
    recibo_pago blob not null,
    constraint ts_pago_auto_fx_pk primary key(cliente_id, auto_id)
) on commit preserve rows;
