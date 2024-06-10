create or replace function aleatorio(
    p_str_inicial in varchar2,
    p_extension   in varchar2,
    p_val_min     in number,
    p_val_max     in number
) return varchar2 is 

v_str_ret varchar2(50);
v_val_ale number(5,0);

begin 
    v_val_ale := round(dbms_random.value(p_val_min, p_val_max),0);
    v_str_ret := p_str_inicial || v_val_ale || p_extension;
    return v_str_ret;
end;
/
show errors