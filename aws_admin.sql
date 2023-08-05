create user book_ex identified by book_ex;
grant connect, resource to book_ex;
alter user book_ex default tablespace users quota unlimited on users;
