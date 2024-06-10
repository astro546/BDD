connect aegg_replica_bdd/aegg@aeggbdd_s1;

Prompt consultando mlogs desde el diccionario de datos
select log_owner, master, log_table, primary_key
  filter_columns, last_purge_date
from user_mview_logs;