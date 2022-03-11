alter session set "_ORACLE_SCRIPT"=true;

create user spring identified by spring;
grant connect, resource, create view to spring;
alter user spring default tablespace users quota unlimited on users;

alter user hr identified by hr account unlock;

select * from all_users
order by 1;

alter session set "_ORACLE_SCRIPT"=true;

create user yderp identified by yderp;
create user book_ex identified by book_ex
default tablespace users
temporary tablespace temp;

grant connect, resource to bbs;
grant connect, dba to book_ex;

alter user book_ex default tablespace users quota unlimited on users;
