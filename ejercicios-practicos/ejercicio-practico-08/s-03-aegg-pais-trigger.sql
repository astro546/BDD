--@Autor: Emiliano Gutierrez
--@Fecha creación: 25/04/2024
--@Descripción: Creacion de trigger para pais

create or replace trigger t_dml_pais
instead of insert or update or delete on pais
declare
begin
  case 
    when inserting then
      if :new.region = 'A' then
        insert into pais_1(pais_id, clave, nombre, region) values
        (:new.pais_id, :new.clave, :new.nombre, :new.region);

      elsif :new.region = 'B' then
        insert into pais_2(pais_id, clave, nombre, region) values
        (:new.pais_id, :new.clave, :new.nombre, :new.region);

      else
        raise_application_error(-20001,
        'Valor incorrecto para el campo region : '
        || :new.region
        || ' Solo se permiten los valores A , B ');
      end if;

    when updating then
      if :new.region = 'A' and :old.region = 'A' then
        update pais_1 
        set pais_id = :new.pais_id, 
        clave = :new.clave,
        nombre = :new.nombre,
        region = :new.region
        where pais_id = :new.pais_id;

      elsif :new.region = 'B' and :old.region = 'B' then
        update pais_2 
        set pais_id = :new.pais_id, 
        clave = :new.clave,
        nombre = :new.nombre,
        region = :new.region
        where pais_id = :old.pais_id;

      elsif :new.region = 'A' and :old.region = 'B' then
        delete from pais_2 where pais_id = :old.pais_id;
        insert into pais_1 (pais_id, clave, nombre, region) values
        (:new.pais_id, :new.clave, :new.nombre, :new.region);

      elsif :new.region = 'B' and :old.region = 'A' then
        delete from pais_1 where pais_id = :old.pais_id;
        insert into pais_2 (pais_id, clave, nombre, region) values
        (:new.pais_id, :new.clave, :new.nombre, :new.region);

      else
        raise_application_error(-20001,
        'Valor incorrecto para el campo region : '
        || :new.region
        || ' Solo se permiten los valores A , B ');
      end if;

    when deleting then
      if :old.region = 'A' then
        delete from pais_1 where pais_id = :old.pais_id;

      elsif :old.region = 'B' then
        delete from pais_2 where pais_id = :old.pais_id;

      else
        raise_application_error(-20001,
        'Valor incorrecto para el campo region : '
        || :old.region
        || ' Solo se permiten los valores A , B ');
      end if;

  end case;
end;
/