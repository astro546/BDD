Prompt conectando a BD master (aeggbdd_s1)
connect aegg_replica_bdd/aegg@aeggbdd_s1;

Prompt consultado datos sobre mviews
select r.mview_id,r.owner,r.name,r.mview_site,
  r.can_use_log,r.refresh_method,
  v.master,v.mview_last_refresh_time, l.log_table
from user_registered_mviews r
join user_base_table_mviews v
on r.mview_id = v.mview_id
left join user_mview_logs l
on l.master = v.master;