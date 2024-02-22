
select * from all_users order by username;

--oracle 11g.
alter user hr identified by hr account unlock;

alter user dev identified by '';

alter session set "_ORACLE_SCRIPT" = true;

create user book_ex identified by book_ex;
grant connect, resource to book_ex;
alter user book_ex default tablespace users quota unlimited on users;

alter user prj identified by prj;
alter user dev identified by dev;


grant select on hr.employees to book_ex;