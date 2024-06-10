--@author: Ricardo Vega
--@Date: 1-june-2024
--@Description: Script presentation 5

create or replace procedure sp_elimina_datos is 
    v_count_tmp number(5,0);
    v_count_tot number(5,0);
begin 
    dbms_output.put_line('Eliminando datos');
    delete from tarjeta_cliente;
    delete from pago_auto;
    delete from cliente;
    delete from auto_particular;
    delete from auto_carga;
    delete from historico_status_auto;
    delete from auto;
    update sucursal_f1 set sucursal_anexa_id = null;
    update sucursal_f2 set sucursal_anexa_id = null;
    update sucursal_f3 set sucursal_anexa_id = null;
    delete from sucursal;
    delete from pais;
    delete from modelo;
    delete from marca; 

    select count(*) into v_count_tmp
    from tarjeta_cliente;
    v_count_tot := v_count_tot + v_count_tmp;

    select count(*) into v_count_tmp
    from pago_auto;
    v_count_tot := v_count_tot + v_count_tmp;

    select count(*) into v_count_tmp
    from cliente;
    v_count_tot := v_count_tot + v_count_tmp;

    select count(*) into v_count_tmp
    from auto_particular;
    v_count_tot := v_count_tot + v_count_tmp;

    select count(*) into v_count_tmp
    from auto_carga;
    v_count_tot := v_count_tot + v_count_tmp;

    select count(*) into v_count_tmp
    from historico_status_auto;
    v_count_tot := v_count_tot + v_count_tmp;

    select count(*) into v_count_tmp
    from auto;
    v_count_tot := v_count_tot + v_count_tmp;

    select count(*) into v_count_tmp
    from sucursal;
    v_count_tot := v_count_tot + v_count_tmp;

    select count(*) into v_count_tmp
    from pais;
    v_count_tot := v_count_tot + v_count_tmp;

    select count(*) into v_count_tmp
    from modelo;
    v_count_tot := v_count_tot + v_count_tmp;

    select count(*) into v_count_tmp
    from marca;
    v_count_tot := v_count_tot + v_count_tmp;

    if v_count_tot = 0 then 
        dbms_output.put_line('Eliminacion correcta. ');
        dbms_output.put_line('Haciendo commit. ');
        commit;
    else 
        raise_application_error(-20200, 'No se pudieron eliminar algunos datos');
    end if;
exception 
    when others then 
        dbms_output.put_line('Errores al eliminar datos');
        dbms_output.put_line('Haciendo rollback');
        raise;
        rollback;
end;
/
show errors 



