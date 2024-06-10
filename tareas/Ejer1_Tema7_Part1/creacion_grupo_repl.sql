Prompt conectandose a BD mview (aeggbdd_s2)
connect aegg_replica_bdd/aegg@aeggbdd_s2

Prompt creando grupo de replicacion con mv_agencia y mv_auto
begin
  dbms_refresh.make(
    name                 => 'agencia_auto_cliente_g1',
    list                 => 'mv_agencia, mv_auto',
    next_date            => sysdate,
    interval             => 'sysdate + 1/(24*60)',
    refresh_after_errors => false
  );
end;
/

Prompt añadiendo mv_cliente al grupo de replicacion
begin
  dbms_refresh.add(
    name => 'agencia_auto_cliente_g1',
    list => 'mv_cliente',
    lax => false --true si la vista va a realizar cambio de grupo.
  );
end;
/