Prompt creando trigger para pago_auto en aeggbdd_s2
create or replace trigger t_dml_pago_auto
instead of insert or update or delete on pago_auto
declare
  v_count number;
begin
  case 
    when inserting then 
      select count(*) into v_count
      from cliente_f3
      where cliente_id = :new.cliente_id;

      if v_count > 0 then
        insert into pago_auto_f3 values (
          :new.cliente_id,
          :new.auto_id,
          :new.fecha_pago,
          :new.importe,
          :new.recibo_pago);
      
      else
        select count(*) into v_count
        from cliente_f1
        where cliente_id = :new.cliente_id;

        if v_count > 0 then
          insert into ti_pago_auto_f4 values (
            :new.cliente_id,
            :new.auto_id,
            :new.fecha_pago,
            :new.importe,
            :new.recibo_pago);
          insert into pago_auto_f1 (select * from ti_pago_auto_f4);
          delete from ti_pago_auto_f4 where cliente_id = :new.cliente_id 
          and auto_id = :new.auto_id;

        else 
          select count(*) into v_count
          from cliente_f2
          where cliente_id = :new.cliente_id;

          if v_count > 0 then
            insert into ti_pago_auto_f4 values (
              :new.cliente_id,
              :new.auto_id,
              :new.fecha_pago,
              :new.importe,
              :new.recibo_pago);
          insert into pago_auto_f2 (select * from ti_pago_auto_f4);
          delete from ti_pago_auto_f4 where cliente_id = :new.cliente_id 
          and auto_id = :new.auto_id;

          else
            raise_application_error(-20020,
            'Error de integridad para el campo cliente_id :'
            || :new.cliente_id
            || ' No se encontró el registro padre en cliente'); 
          end if;
        end if;
      end if;

    when updating then 
      raise_application_error(-20002,
      'Esta prohibido actualizar la tabla pago_auto'); 

    when deleting then 
      select count(*) into v_count
      from cliente_f3
      where cliente_id = :old.cliente_id;

      if v_count > 0 then
        delete from pago_auto_f3 
        where cliente_id = :old.cliente_id
        and auto_id = :old.auto_id;
      
      else
        select count(*) into v_count
        from cliente_f1
        where cliente_id = :old.cliente_id;

        if v_count > 0 then
          delete from pago_auto_f1 
          where cliente_id = :old.cliente_id
          and auto_id = :old.auto_id;

        else 
          select count(*) into v_count
          from cliente_f2
          where cliente_id = :old.cliente_id;

          if v_count > 0 then
            delete from pago_auto_f2 
            where cliente_id = :old.cliente_id
            and auto_id = :old.auto_id;

          else
            raise_application_error(-20020,
            'Error de integridad para el campo cliente_id :'
            || :old.cliente_id
            || ' No se encontró el registro padre en cliente'); 
          end if;
        end if;
      end if;

  end case;
end;
/
show errors