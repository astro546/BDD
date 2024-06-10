Prompt creando trigger de auto_particular en rdvgbdd_s2
create or replace trigger t_dml_auto_particular 
instead of insert or update or delete on auto_particular
declare
  v_count number;
begin
  case 
    when inserting then 
      select count(*) into v_count
      from auto_f3
      where auto_id = :new.auto_id;

      if v_count > 0 then
        insert into auto_particular_f2 values (
          :new.auto_id, :new.num_cilindros, :new.num_pasajeros, :new.clase);
      
      else
        select count(*) into v_count
        from auto_f2
        where auto_id = :new.auto_id;

        if v_count > 0 then
          insert into auto_particular_f1 values (
            :new.auto_id, :new.num_cilindros, :new.num_pasajeros, :new.clase);
        
        else
          raise_application_error(-20020,
          'Error de integridad para el campo auto_id :'
          || :new.auto_id
          || ' No se encontró el registro padre en auto'); 
        end if;
      end if;

    when updating then 
      raise_application_error(-20030,
      'Esta prohibido actualizar la tabla auto_particular');

    when deleting then 
      select count(*) into v_count
      from auto_f3
      where auto_id = :old.auto_id;

      if v_count > 0 then
        delete from auto_particular_f2
        where auto_id = :old.auto_id;
      
      else
        select count(*) into v_count
        from auto_f2
        where auto_id = :old.auto_id;

        if v_count > 0 then
          delete from auto_particular_f1
          where auto_id = :old.auto_id;
        
        else
          raise_application_error(-20020,
          'Error de integridad para el campo auto_id :'
          || :old.auto_id
          || ' No se encontró el registro padre en auto'); 
        end if;
      end if;
     
  end case;
end;
/
show errors