Prompt creando trigger para pais
create or replace trigger t_dml_pais 
  instead of insert or update or delete on pais
begin
  case 

    when inserting then 
      if :new.region = 'AME' then
        insert into pais_f1 (pais_id, nombre, clave, region)
        values (:new.pais_id, :new.nombre, :new.clave, :new.region);
      elsif :new.region = 'EUR' then
        insert into pais_f2 (pais_id, nombre, clave, region)
        values (:new.pais_id, :new.nombre, :new.clave, :new.region);
      else
        raise_application_error(-20010,
       'Valor incorrecto para el campo region : '
       || :new.region
       || ' Solo se permiten los valores AME, EUR ');
      end if;

    when updating then 
      if :new.region = 'AME' and :old.region = 'AME' then
        update pais_f1 set
          pais_id = :new.pais_id,
          nombre = :new.nombre,
          clave = :new.clave,
          region = :new.region
        where pais_id = :old.pais_id;
      elsif :new.region = 'AME' and :old.region = 'EUR' then
        delete from pais_f2 where pais_id = :old.pais_id;
        insert into pais_f1 (pais_id, nombre, clave, region)
        values (:new.pais_id, :new.nombre, :new.clave, :new.region);
      elsif :new.region = 'EUR' and :old.region = 'EUR' then
        update pais_f2 set
          pais_id = :new.pais_id,
          nombre = :new.nombre,
          clave = :new.clave,
          region = :new.region
        where pais_id = :old.pais_id;
      elsif :new.region = 'EUR' and :old.region = 'AME' then
        delete from pais_f1 where pais_id = :old.pais_id;
        insert into pais_f2 (pais_id, nombre, clave, region)
        values (:new.pais_id, :new.nombre, :new.clave, :new.region);
      else
        raise_application_error(-20010,
       'Valor incorrecto para el campo region : '
       || :new.region
       || ' Solo se permiten los valores AME, EUR ');
      end if;

    when deleting then 
      if :old.region = 'AME' then
        delete from pais_f1 where pais_id = :old.pais_id;
      elsif :old.region = 'EUR' then
        delete from pais_f2 where pais_id = :old.pais_id;
      else
        raise_application_error(-20010,
       'Valor incorrecto para el campo region : '
       || :new.region
       || ' Solo se permiten los valores AME, EUR ');
      end if;
     
  end case;
end;
/
show errors