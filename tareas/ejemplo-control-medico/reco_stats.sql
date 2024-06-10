whenever sqlerror exit rollback
begin
  dbms_stats.gather_schema_stats(
    ownname => 'CONTROL_MEDICO',
    degree => 2
  );
end;
/
