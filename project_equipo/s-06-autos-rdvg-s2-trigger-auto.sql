Prompt creando trigger para auto en rdvgbdd_s2
create or replace trigger t_dml_auto 
  instead of insert or update or delete on auto
declare
  v_count number;
begin
  case 
    when inserting then
      select count(*) into v_count
      from sucursal_f3
      where sucursal_id = :new.sucursal_id;

      if v_count > 0 then
        insert into auto_f3 values(
          :new.auto_id,
          :new.anio,
          :new.num_serie,
          :new.tipo,
          :new.precio,
          :new.fecha_status,
          :new.sucursal_id,
          :new.status_auto_id,
          :new.modelo_id);
      else
        select count(*) into v_count
        from sucursal_f2
        where sucursal_id = :new.sucursal_id;

        if v_count > 0 then
          insert into auto_f2 values(
            :new.auto_id,
            :new.anio,
            :new.num_serie,
            :new.tipo,
            :new.precio,
            :new.fecha_status,
            :new.sucursal_id,
            :new.status_auto_id,
            :new.modelo_id);
        else
          raise_application_error(-20020,
          'Error de integridad para el campo sucursal_id :'
          || :new.sucursal_id
          || ' No se encontró el registro padre en sucursal'); 
        end if;
      end if;

      insert into ts_auto_f1
      values (:new.auto_id, :new.foto);

      insert into auto_f1
        select * from ts_auto_f1
        where auto_id = :new.auto_id;

      delete from ts_auto_f1
      where auto_id = :new.auto_id;

    when updating then 
      raise_application_error(-20030,
      'Esta prohibido actualizar la tabla auto');

    when deleting then 
      select count(*) into v_count
      from sucursal_f3
      where sucursal_id = :old.sucursal_id;

      if v_count > 0 then
        delete from auto_f3
        where auto_id = :old.auto_id;

      else
        select count(*) into v_count
        from sucursal_f2
        where sucursal_id = :old.sucursal_id;

        if v_count > 0 then
          delete from auto_f2
          where auto_id = :old.auto_id;
        else
          raise_application_error(-20020,
          'Error de integridad para el campo sucursal_id :'
          || :new.sucursal_id
          || ' No se encontró el registro padre en sucursal'); 
        end if;
      end if;

      delete from auto_f1
      where auto_id = :old.auto_id;
      
  end case;
end;
/
show errors