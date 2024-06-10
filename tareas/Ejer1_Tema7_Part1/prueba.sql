Prompt 1ra consulta
select a.auto_id, a.num_serie, a.agencia_id, a.cliente_id
from auto a
where exists (
	select 1
	from agencia ag
	where a.agencia_id = ag.agencia_id
	and clave = 'LC-904-W')
and exists (
  select 1 
  from cliente c
  where a.cliente_id = c.cliente_id
  and nombre = 'Sofia')
union
select a.auto_id, a.num_serie, a.agencia_id, a.cliente_id
from auto a
where a.num_serie like '%0';

Prompt 2da consulta
select a.auto_id, a.num_serie, a.agencia_id, a.cliente_id
from auto a
where exists (
	select 1
	from agencia ag
	where a.agencia_id = ag.agencia_id
	and clave = 'LC-904-W'
  and exists (
    select 1 
    from cliente c
    where a.cliente_id = c.cliente_id
    and nombre = 'Sofia'))
union
select a.auto_id, a.num_serie, a.agencia_id, a.cliente_id
from auto a
where a.num_serie like '%0';
					