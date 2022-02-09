SELECT * FROM tab;

ALTER session SET "_ORACLE_SCRIPT" = TRUE;

CREATE USER prj identified BY prj;
grant CONNECT, RESOURCE, CREATE view TO prj;
ALTER USER prj DEFAULT tablespace users quota unlimited ON users;

ALTER USER hr identified BY hr account unlock;

SELECT * FROM all_users ORDER BY 1;

ALTER session SET "_ORACLE_SCRIPT" = TRUE;

CREATE USER bbs identified BY bbs;
CREATE USER book_ex identified BY book_ex DEFAULT tablespace users temporary tablespace temp;

grant CONNECT, RESOURCE TO bbs;
grant CONNECT, dba TO book_ex;

ALTER USER book_ex DEFAULT tablespace users quota unlimited ON users;

grant select, update, delete, create on hr.emp to prj;
