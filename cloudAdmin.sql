
select * from all_users order by user_id;

alter user dev identified by '';

alter session set "_ORACLE_SCRIPT" = true;

create user proj identified by proj;
grant connect, resource to proj;
alter user proj default tablespace users quota unlimited on users;