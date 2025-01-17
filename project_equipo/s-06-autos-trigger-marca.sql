Prompt creando trigger de marca
create or replace trigger t_dml_marca
instead of insert or update or delete on marca
declare
v_count number;
begin
  case
    when inserting then
      v_count := 0;
      --replica local
      insert into marca_r1(marca_id,clave,descripcion,activo)
      values (:new.marca_id,:new.clave,:new.descripcion,:new.activo);
      v_count := v_count + sql%rowcount;
      --replica 2
      insert into marca_r2(marca_id,clave,descripcion,activo)
      values (:new.marca_id,:new.clave,:new.descripcion,:new.activo);
      v_count := v_count + sql%rowcount;
      --replica 3
      insert into marca_r3(marca_id,clave,descripcion,activo)
      values (:new.marca_id,:new.clave,:new.descripcion,:new.activo);
      v_count := v_count + sql%rowcount;
      --replica 4
      insert into marca_r4(marca_id,clave,descripcion,activo)
      values (:new.marca_id,:new.clave,:new.descripcion,:new.activo);
      v_count := v_count + sql%rowcount;
      if v_count <> 4 then
        raise_application_error(-20040,
        'Número incorrecto de registros insertados en tabla replicada: '
        ||v_count);
      end if;

    when deleting then
      v_count := 0;
      --replica local
      delete from marca_r1 where marca_id = :old.marca_id;
      v_count := v_count + sql%rowcount;
      --replica 2
      delete from marca_r2 where marca_id = :old.marca_id;
      v_count := v_count + sql%rowcount;
      --replica 3
      delete from marca_r3 where marca_id = :old.marca_id;
      v_count := v_count + sql%rowcount;
      --replica 4
      delete from marca_r4 where marca_id = :old.marca_id;
      v_count := v_count + sql%rowcount;
      if v_count <> 4 then
        raise_application_error(-20040,
        'Número incorrecto de registros eliminados en tabla replicada: '
        ||v_count);
      end if;
      
    when updating then
      --replica local
      v_count := 0;
      update marca_r1 set 
      marca_id = :new.marca_id,
      clave = :new.clave,
      descripcion =:new.descripcion,
      activo =:new.activo
      where marca_id = :old.marca_id;
      v_count := v_count + sql%rowcount;
      --replica 2
      update marca_r2 set 
      marca_id = :new.marca_id,
      clave = :new.clave,
      descripcion =:new.descripcion,
      activo =:new.activo
      where marca_id = :old.marca_id;
      v_count := v_count + sql%rowcount;
      --replica 3
      update marca_r3 set 
      marca_id = :new.marca_id,
      clave = :new.clave,
      descripcion =:new.descripcion,
      activo =:new.activo
      where marca_id = :old.marca_id;
      v_count := v_count + sql%rowcount;
      --replica 4
      update marca_r4 set 
      marca_id = :new.marca_id,
      clave = :new.clave,
      descripcion =:new.descripcion,
      activo =:new.activo
      where marca_id = :old.marca_id;
      v_count := v_count + sql%rowcount;

  end case;

  if v_count <> 4 then
    raise_application_error(-20040,
    'Número incorrecto de registros actualizados en tabla replicada: '
    ||v_count);
  end if;
end;
/
show errors