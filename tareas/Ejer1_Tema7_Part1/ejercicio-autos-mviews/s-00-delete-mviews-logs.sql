
Prompt ==> Eliminando mlogs
connect jrc_replica_bdd/jorge@jrcbd_s1

declare
  cursor cur_mlogs is
    select master
    from user_mview_logs; 
begin
  for r in cur_mlogs loop
    execute immediate 'drop materialized view log on '||r.master;
  end loop;
end;
/


Prompt ==> Eliminando vistas materializadas
connect jrc_replica_bdd/jorge@jrcbd_s2

declare
  cursor cur_mlogs is
    select mview_name
    from user_mviews; 
begin
  for r in cur_mlogs loop
    execute immediate 'drop materialized view  '||r.mview_name;
  end loop;
end;
/

Prompt ==> Eliminando grupos de refresh

declare
  cursor cur_refresh_grp is
    select rname
    from user_refresh; 
begin
  for r in cur_refresh_grp loop
    dbms_refresh.destroy(r.rname);
  end loop;
end;
/



Prompt Listo!
disconnect
