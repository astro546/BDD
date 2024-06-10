--@Autor: Emiliano Gutierrez
--@Fecha creación: 25/04/2024
--@Descripción: Creacion de trigger para empleado para el sitio 1

create or replace trigger t_dml_empleado
instead of insert or update or delete on empleado
declare
begin
  case 
    when inserting then
      if substr(:new.rfc,1,1) between 'A' and 'Z' then

        if substr(:new.rfc,1,1) between 'A' and 'M' then
          insert into empleado_2 
          (empleado_id, nombre, ap_paterno, ap_materno, rfc, email)
          values (:new.empleado_id, :new.nombre, :new.ap_paterno, :new.ap_materno, :new.rfc, :new.email);

        elsif substr(:new.rfc,1,1) between 'N' and 'Z' then
          insert into empleado_3 
          (empleado_id, nombre, ap_paterno, ap_materno, rfc, email)
          values (:new.empleado_id, :new.nombre, :new.ap_paterno, :new.ap_materno, :new.rfc, :new.email);
        end if;

        insert into t_empleado_insert
        (empleado_id, foto, num_cuenta)
        values (:new.empleado_id, :new.foto, :new.num_cuenta);

        insert into empleado_1
          select * from t_empleado_insert
          where empleado_id = :new.empleado_id;
        
        delete from t_empleado_insert
        where empleado_id = :new.empleado_id;

      else 
        raise_application_error(-20001,
        'Valor incorrecto para el campo rfc : '
        || :new.rfc
        || ' el formato del rfc es incorrecto, debe de iniciar con una letra');
      end if;
      
    when updating then
      raise_application_error(-20002,
      'Esta prohibido actualizar la tabla empleado'); 

    when deleting then 
      if substr(:old.rfc,1,1) between 'A' and 'Z' then

        if substr(:old.rfc,1,1) between 'A' and 'M' then
          delete from empleado_2 where empleado_id = :old.empleado_id;

        elsif substr(:old.rfc,1,1) between 'N' and 'Z' then
          delete from empleado_3 where empleado_id = :old.empleado_id;
        end if;

        delete from empleado_1 where empleado_id = :old.empleado_id;

      else 
        raise_application_error(-20001,
        'Valor incorrecto para el campo rfc : '
        || :old.rfc
        || ' el formato del rfc es incorrecto, debe de iniciar con una letra');
      end if;

  end case;
end;
/