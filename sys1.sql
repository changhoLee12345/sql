alter session set "_ORACLE_SCRIPT"=true;

create user bbs identified by bbs;
create user book_ex identified by book_ex
default tablespace users
temporary tablespace temp;

grant connect, resource to bbs;
grant connect, dba to book_ex;

alter user bbs default tablespace users quota unlimited on users;