--@author: Ricardo Vega
--@Date: 29-may-2024
--@Description: Create a user to project BDD

declare 
    v_registros number(1,0);
begin
    select count(*) into v_registros
    from dba_users
    where lower(username) = 'autos_bdd';
    if v_registros > 0 then 
        execute immediate 'drop user autos_bdd cascade';
    end if;
end;
/
show errors

Prompt Creando usuario 
create user autos_bdd identified by autos_bdd quota unlimited on users;
grant create session, create table, create any index, create procedure to autos_bdd;
grant create sequence, create database link to autos_bdd;
grant create synonym, create view, create trigger to autos_bdd;
grant create any directory to autos_bdd;