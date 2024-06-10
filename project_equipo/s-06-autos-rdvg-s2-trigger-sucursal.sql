Prompt creando trigger para sucursal en rdvgbdd_s2
create or replace trigger t_dml_sucursal
  instead of insert or update or delete on sucursal
declare
  v_count number;
begin
  case
    when inserting then
      if substr(:new.clave,1,5) = '00000' then
        insert into sucursal_f1 values (:new.sucursal_id, :new.nombre, :new.clave, :new.sucursal_anexa_id, :new.pais_id);
      else

        select count(*) into v_count
        from pais_f2
        where pais_id = :new.pais_id;

        if v_count > 0 then
          insert into sucursal_f3 values (:new.sucursal_id, :new.nombre, :new.clave, :new.sucursal_anexa_id, :new.pais_id);

        else
          select count(*) into v_count
          from pais_f1
          where pais_id = :new.pais_id;

          if v_count > 0 then
            insert into sucursal_f2 values (:new.sucursal_id, :new.nombre, :new.clave, :new.sucursal_anexa_id, :new.pais_id);
          else
            raise_application_error(-20020,
            'Error de integridad para el campo pais_id :'
            || :new.pais_id
            || ' No se encontró el registro padre en pais'); 
          end if;
        end if;
      end if;
      
    when updating then
      raise_application_error(-20030,
      'Esta prohibido actualizar la tabla sucursal');

    when deleting then
      if substr(:old.clave,1,5) = '00000' then
        delete from sucursal_f1 where sucursal_id = :old.sucursal_id; 
      else
        select count(*) into v_count
        from pais_f2
        where pais_id = :old.pais_id;

        if v_count > 0 then
          delete from sucursal_f3 where sucursal_id = :old.sucursal_id; 

        else
          select count(*) into v_count
          from pais_f1
          where pais_id = :old.pais_id;

          if v_count > 0 then
            delete from sucursal_f2 where sucursal_id = :old.sucursal_id; 
          else
            raise_application_error(-20020,
            'Error de integridad para el campo pais_id :'
            || :new.pais_id
            || ' No se encontró el registro padre en pais'); 
          end if;
        end if;
      end if;
  end case;
end;
/
show errors