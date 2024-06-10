Prompt creando trigger para tarjeta_cliente
create or replace trigger t_dml_tarjeta
instead of insert or update or delete on tarjeta_cliente
begin
  case 
    when inserting then 
      insert into tarjeta_cliente_f2 values(
        :new.cliente_id, :new.num_tarjeta, :new.codigo_seguridad);
      insert into tarjeta_cliente_f1 values(
        :new.cliente_id, :new.anio_expira, :new.mes_expira, :new.tipo);

    when updating then 
      update tarjeta_cliente_f2 set
        cliente_id = :new.cliente_id,
        num_tarjeta = :new.num_tarjeta,
        codigo_seguridad = :new.codigo_seguridad
      where cliente_id = :old.cliente_id;
      update tarjeta_cliente_f1 set
        cliente_id = :new.cliente_id,
        anio_expira = :new.anio_expira,
        mes_expira = :new.mes_expira,
        tipo = :new.tipo
      where cliente_id = :old.cliente_id;

    when deleting then 
      delete from tarjeta_cliente_f2 where cliente_id = :old.cliente_id;
      delete from tarjeta_cliente_f1 where cliente_id = :old.cliente_id;
      
  end case;
end;
/
show errors