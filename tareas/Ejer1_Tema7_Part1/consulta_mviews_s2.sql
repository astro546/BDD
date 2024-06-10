Prompt conectado a BD mview (aeggbdd_s2)
connect aegg_replica_bdd/aegg@aeggbdd_s2;

Prompt lanzando primera consulta
select owner,mview_name,master_link,updatable,refresh_method,refresh_mode
from user_mviews;

Prompt lanzando segunda consulta
select mview_name,last_refresh_type,last_refresh_date,last_refresh_end_time
from user_mviews;