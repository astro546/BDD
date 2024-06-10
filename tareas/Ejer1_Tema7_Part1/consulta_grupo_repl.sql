Prompt Prompt conectandose a BD mview (aeggbdd_s2)
connect aegg_replica_bdd/aegg@aeggbdd_s2

Prompt consultando datos del grupo de replicacion
select rowner,rname,refgroup,job,implicit_destroy,
next_date,interval,broken
from user_refresh;

