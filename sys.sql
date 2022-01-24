alter session set "_ORACLE_SCRIPT"=true;

create user spring identified by spring;
grant connect, resource, create view to spring;
alter user spring default tablespace users quota unlimited on users;

alter user hr identified by hr account unlock;

select * from all_users
order by 1;