Prompt Prompt conectandose a BD mview (aeggbdd_s2)
connect aegg_replica_bdd/aegg@aeggbdd_s2

Prompt consultando datos del ultimo refresh
select * from user_mview_refresh_times;

Prompt consultando datos del job encargado del refresh
select job,log_user,last_date,next_date,total_time
from user_jobs;

select broken,interval,failures, what
from user_jobs;