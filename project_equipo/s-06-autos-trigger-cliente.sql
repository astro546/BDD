Prompt creando trigger para cliente
create or replace trigger t_dml_cliente
instead of insert or update or delete on cliente
begin
  case 
    when inserting then 
      if substr(upper(:new.ap_paterno),1,1) between 'A' and 'Z' then 
        if substr(upper(:new.ap_paterno),1,1) between 'A' and 'I' then 
          insert into cliente_f1 values (
            :new.cliente_id,
            :new.nombre,
            :new.ap_paterno,
            :new.ap_materno,
            :new.num_identificacion,
            :new.email);
        
        elsif substr(upper(:new.ap_paterno),1,1) between 'J' and 'Q' then
          insert into cliente_f2 values (
            :new.cliente_id,
            :new.nombre,
            :new.ap_paterno,
            :new.ap_materno,
            :new.num_identificacion,
            :new.email);

        elsif substr(upper(:new.ap_paterno),1,1) between 'R' and 'Z' then
          insert into cliente_f3 values (
            :new.cliente_id,
            :new.nombre,
            :new.ap_paterno,
            :new.ap_materno,
            :new.num_identificacion,
            :new.email);
        end if;

      else
        raise_application_error(-20010,
        'Valor incorrecto para el campo ap_paterno : '
        || :new.ap_paterno
        || ' el formato del apellido paterno es incorrecto, debe de iniciar con una letra');
      end if;
        
    when updating then 
      if substr(upper(:new.ap_paterno),1,1) between 'A' and 'Z' then
        if substr(upper(:new.ap_paterno),1,1) between 'A' and 'I' and substr(:old.ap_paterno,1,1) between 'A' and 'I' then
          update cliente_f1 set
            cliente_id = :new.cliente_id,
            nombre = :new.nombre,
            ap_paterno = :new.ap_paterno,
            ap_materno = :new.ap_materno,
            num_identificacion = :new.num_identificacion,
            email = :new.email
          where cliente_id = :old.cliente_id;

        elsif substr(upper(:new.ap_paterno),1,1) between 'A' and 'I' and substr(:old.ap_paterno,1,1) between 'J' and 'Q' then
          delete from cliente_f2 where cliente_id = :old.cliente_id;
          insert into cliente_f1 values (
            :new.cliente_id,
            :new.nombre,
            :new.ap_paterno,
            :new.ap_materno,
            :new.num_identificacion,
            :new.email);

        elsif substr(upper(:new.ap_paterno),1,1) between 'A' and 'I' and substr(:old.ap_paterno,1,1) between 'R' and 'Z' then
          delete from cliente_f3 where cliente_id = :old.cliente_id;
          insert into cliente_f1 values (
            :new.cliente_id,
            :new.nombre,
            :new.ap_paterno,
            :new.ap_materno,
            :new.num_identificacion,
            :new.email);
            
        elsif substr(upper(:new.ap_paterno),1,1) between 'J' and 'Q' and substr(:old.ap_paterno,1,1) between 'A' and 'I' then
          delete from cliente_f1 where cliente_id = :old.cliente_id;
          insert into cliente_f2 values (
            :new.cliente_id,
            :new.nombre,
            :new.ap_paterno,
            :new.ap_materno,
            :new.num_identificacion,
            :new.email);

        elsif substr(upper(:new.ap_paterno),1,1) between 'J' and 'Q' and substr(:old.ap_paterno,1,1) between 'J' and 'Q' then
          update cliente_f2 set
            cliente_id = :new.cliente_id,
            nombre = :new.nombre,
            ap_paterno = :new.ap_paterno,
            ap_materno = :new.ap_materno,
            num_identificacion = :new.num_identificacion,
            email = :new.email
          where cliente_id = :old.cliente_id;

        elsif substr(upper(:new.ap_paterno),1,1) between 'J' and 'Q' and substr(:old.ap_paterno,1,1) between 'R' and 'Z' then
          delete from cliente_f3 where cliente_id = :old.cliente_id;
          insert into cliente_f2 values (
            :new.cliente_id,
            :new.nombre,
            :new.ap_paterno,
            :new.ap_materno,
            :new.num_identificacion,
            :new.email);

        elsif substr(upper(:new.ap_paterno),1,1) between 'R' and 'Z' and substr(:old.ap_paterno,1,1) between 'A' and 'I' then
          delete from cliente_f1 where cliente_id = :old.cliente_id;
          insert into cliente_f3 values (
            :new.cliente_id,
            :new.nombre,
            :new.ap_paterno,
            :new.ap_materno,
            :new.num_identificacion,
            :new.email);

        elsif substr(upper(:new.ap_paterno),1,1) between 'R' and 'Z' and substr(:old.ap_paterno,1,1) between 'J' and 'Q' then
          delete from cliente_f2 where cliente_id = :old.cliente_id;
          insert into cliente_f3 values (
            :new.cliente_id,
            :new.nombre,
            :new.ap_paterno,
            :new.ap_materno,
            :new.num_identificacion,
            :new.email);

        elsif substr(upper(:new.ap_paterno),1,1) between 'R' and 'Z' and substr(:old.ap_paterno,1,1) between 'R' and 'Z' then
          update cliente_f3 set
            cliente_id = :new.cliente_id,
            nombre = :new.nombre,
            ap_paterno = :new.ap_paterno,
            ap_materno = :new.ap_materno,
            num_identificacion = :new.num_identificacion,
            email = :new.email
          where cliente_id = :old.cliente_id;
        end if;

      else
        raise_application_error(-20010,
        'Valor incorrecto para el campo ap_paterno : '
        || :new.ap_paterno
        || ' el formato del apellido paterno es incorrecto, debe de iniciar con una letra');
      end if;

    when deleting then 
      if substr(upper(:old.ap_paterno),1,1) between 'A' and 'Z' then 
        if substr(upper(:old.ap_paterno),1,1) between 'A' and 'I' then 
          delete from cliente_f1 where cliente_id = :old.cliente_id;
        
        elsif substr(upper(:old.ap_paterno),1,1) between 'J' and 'Q' then
          delete from cliente_f2 where cliente_id = :old.cliente_id;

        elsif substr(upper(:old.ap_paterno),1,1) between 'R' and 'Z' then
          delete from cliente_f3 where cliente_id = :old.cliente_id;
        end if;

      else
        raise_application_error(-20010,
        'Valor incorrecto para el campo ap_paterno : '
        || :new.ap_paterno
        || ' el formato del apellido paterno es incorrecto, debe de iniciar con una letra');
      end if;
  end case;
end;
/
show errors