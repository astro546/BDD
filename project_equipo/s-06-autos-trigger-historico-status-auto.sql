Prompt creando trigger para historico_status

create or replace trigger t_dml_historico_status
instead of insert or update or delete on historico_status_auto
begin
  case 
    when inserting then 
      if :new.fecha_status <= to_date('2010-12-31 23:59:59', 'yyyy-mm-dd hh24:mi:ss') then
        insert into historico_status_auto_f1 values (
          :new.historico_status_id, :new.fecha_status, :new.status_auto_id, :new.auto_id);
      elsif :new.fecha_status > to_date('2010-12-31 23:59:59', 'yyyy-mm-dd hh24:mi:ss') then
        insert into historico_status_auto_f2 values (
          :new.historico_status_id, :new.fecha_status, :new.status_auto_id, :new.auto_id);
      else
        raise_application_error(-20010,
        'Valor incorrecto para el campo fecha_status : '
        || :new.fecha_status
        || ' el formato de la fecha es incorrecto');
      end if;

    when updating then 
      if :new.fecha_status <= to_date('2010-12-31 23:59:59', 'yyyy-mm-dd hh24:mi:ss') and :old.fecha_status <= to_date('2010-12-31 23:59:59', 'yyyy-mm-dd hh24:mi:ss') then
        update historico_status_auto_f1 set
          historico_status_id = :new.historico_status_id,
          fecha_status = :new.fecha_status,
          status_auto_id = :new.status_auto_id,
          auto_id = :new.auto_id
        where historico_status_id = :old.historico_status_id;

      elsif :new.fecha_status <= to_date('2010-12-31 23:59:59', 'yyyy-mm-dd hh24:mi:ss') and :old.fecha_status > to_date('2010-12-31 23:59:59', 'yyyy-mm-dd hh24:mi:ss') then
        delete from historico_status_auto_f2 where historico_status_id = :old.historico_status_id;
        insert into historico_status_auto_f1 values (
          :new.historico_status_id, :new.fecha_status, :new.status_auto_id, :new.auto_id);

      elsif :new.fecha_status > to_date('2010-12-31 23:59:59', 'yyyy-mm-dd hh24:mi:ss') and :old.fecha_status > to_date('2010-12-31 23:59:59', 'yyyy-mm-dd hh24:mi:ss') then
        update historico_status_auto_f2 set
          historico_status_id = :new.historico_status_id,
          fecha_status = :new.fecha_status,
          status_auto_id = :new.status_auto_id,
          auto_id = :new.auto_id
        where historico_status_id = :old.historico_status_id;

      elsif :new.fecha_status > to_date('2010-12-31 23:59:59', 'yyyy-mm-dd hh24:mi:ss') and :old.fecha_status <= to_date('2010-12-31 23:59:59', 'yyyy-mm-dd hh24:mi:ss') then
        delete from historico_status_auto_f1 where historico_status_id = :old.historico_status_id;
        insert into historico_status_auto_f2 values (
          :new.historico_status_id, :new.fecha_status, :new.status_auto_id, :new.auto_id);
        
      else 
        raise_application_error(-20010,
        'Valor incorrecto para el campo fecha_status : '
        || :new.fecha_status
        || ' el formato de la fecha es incorrecto');

      end if;

    when deleting then 
      if :old.fecha_status <= to_date('2010-12-31 23:59:59', 'yyyy-mm-dd hh24:mi:ss') then
        delete from historico_status_auto_f1 where historico_status_id = :old.historico_status_id;
      elsif :old.fecha_status > to_date('2010-12-31 23:59:59', 'yyyy-mm-dd hh24:mi:ss') then
        delete from historico_status_auto_f2 where historico_status_id = :old.historico_status_id;
      else
        raise_application_error(-20010,
        'Valor incorrecto para el campo fecha_status : '
        || :new.fecha_status
        || ' el formato de la fecha es incorrecto');
      end if;
  end case;
end;
/
show errors