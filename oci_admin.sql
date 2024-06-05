
select * from all_users order by username;

--oracle 11g.
alter user hr identified by hr account unlock;

alter user dev identified by '';

alter session set "_ORACLE_SCRIPT" = true;

create user jsp identified by jsp;
grant connect, resource to jsp;
alter user jsp default tablespace users quota unlimited on users;
grant create view to jsp;

alter user prj identified by prj;
alter user dev identified by dev;


grant select on hr.employees to jsp;