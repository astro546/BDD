Prompt function pago_auto
create or replace function get_remote_r_pago_f1_by_id(p_cliente_id in number, 
    p_auto_id in number) return blob is
    pragma autonomous_transaction;
    v_temp_pdf blob;
begin
    delete from ts_pago_auto_f4;
    insert into ts_pago_auto_f4(cliente_id, auto_id, recibo_pago) select cliente_id,
        auto_id, recibo_pago from pago_auto_f1 where cliente_id = p_cliente_id;
    select recibo_pago into v_temp_pdf 
    from ts_pago_auto_f4
    where cliente_id = p_cliente_id;
    delete from ts_pago_auto_f4;
    commit;
    return v_temp_pdf;
exception
    when others then
        rollback;
        raise;
end;
/
show errors
