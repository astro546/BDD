--@Autor: Emiliano Gutierrez
--@Fecha creación: 25/04/2024
--@Descripción: Creacion de trigger para oficina en el sitio 1

create or replace trigger t_dml_oficina
instead of insert or update or delete on oficina
declare
  v_count number;
begin
  case 
    when inserting then
      select count(*) into v_count
      from pais_1
      where pais_id = :new.pais_id;

      if v_count > 0 then
        insert into oficina_1 
        (oficina_id, nombre, oficina_anexa_id, pais_id)
        values (:new.oficina_id, :new.nombre, :new.oficina_anexa_id, :new.pais_id);
      
      else
        select count(*) into v_count
        from pais_2
        where pais_id = :new.pais_id;

        if v_count > 0 then
          insert into oficina_2 
          (oficina_id, nombre, oficina_anexa_id, pais_id)
          values (:new.oficina_id, :new.nombre, :new.oficina_anexa_id, :new.pais_id);

        else
          raise_application_error(-20001,
          'Error de integridad para el campo oficina_id :'
          || :new.oficina_id
          || ' No se encontró el registro padre en pais'); 
        end if;
      end if;

    when updating then
      raise_application_error(-20030,
      'Esta prohibido actualizar la tabla oficina');

    when deleting then 
      select count(*) into v_count
      from pais_1
      where pais_id = :old.pais_id;

      if v_count > 0 then
        delete from oficina_1 where oficina_id = :old.oficina_id;
      
      else
        select count(*) into v_count
        from pais_2
        where pais_id = :old.pais_id;

        if v_count > 0 then
          delete from oficina_2 where oficina_id = :old.oficina_id;

        else
          raise_application_error(-20001,
          'Error de integridad para el campo oficina_id :'
          || :old.oficina_id
          || ' No se encontró el registro padre en pais'); 
        end if;
      end if;
    
  end case;
end;
/