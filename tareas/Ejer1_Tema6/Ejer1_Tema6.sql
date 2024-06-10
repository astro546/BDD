create or replace procedure concPesimista(p_prod_id number) is
v_existencias number;
begin
  begin
    select existencias into v_existencias
    from productos
    where prod_id = p_prod_id
    for update;
    --commit;

    exception
    when others then
      rollback;
  end;
end;
/
show errors;

create or replace procedure concOptimista(
  modo boolean, 
  p_prod_id number,
  p_cantidad number) is 
  v_existencias number;
  t_existencias number;
  v_actualizados number;
begin
  loop
    select existencias into v_existencias
    from productos
    where prod_id = p_prod_id;

    if modo then
      t_existencias := v_existencias + p_cantidad;
    else
      t_existencias := v_existencias - p_cantidad;
    end if;

    update productos
    set existencias = t_existencias
    where prod_id = p_prod_id
    and existencias = v_existencias;

    v_actualizados := sql%rowcount;
    if v_actualizados > 0 then
      exit;
    else
      null;
    end if;
  end loop;
end;
/
show errors;