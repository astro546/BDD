--@author: Ricardo Vega
--@Date: 30-may-2024
--@Description: Create function to manage blob's

Prompt function foto_f1 
create or replace function get_remote_foto_f1_by_id(p_auto_id in number) 
    return blob is 
    pragma autonomous_transaction;
    v_temp_foto blob;
begin 
    delete from ts_auto_f1;
    insert into ts_auto_f1(auto_id, foto) select auto_id, foto 
        from auto_f1 where auto_id = p_auto_id;
    select foto into v_temp_foto
    from ts_auto_f1
    where auto_id = p_auto_id;
    delete from ts_auto_f1;
    commit;
    return v_temp_foto;
exception 
    when others then 
        rollback;
        raise;
end;
/
show errors;

Prompt function pago_auto
create or replace function get_remote_r_pago_f1_by_id(p_cliente_id in number, 
    p_auto_id in number) return blob is
    pragma autonomous_transaction;
    v_temp_pdf blob;
begin
    delete from ts_pago_auto_fx;
    insert into ts_pago_auto_fx(cliente_id, auto_id, recibo_pago) select cliente_id,
        auto_id, recibo_pago from pago_auto_f1 where cliente_id = p_cliente_id;
    select recibo_pago into v_temp_pdf 
    from ts_pago_auto_fx
    where cliente_id = p_cliente_id;
    delete from ts_pago_auto_fx;
    commit;
    return v_temp_pdf;
exception
    when others then
        rollback;
        raise;
end;
/
show errors
