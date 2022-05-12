SELECT *
FROM   tab
order by tname;

ALTER session SET "_ORACLE_SCRIPT" = TRUE;

CREATE USER prj identified BY prj;
grant CONNECT, RESOURCE, CREATE view TO prj;
grant debug connect session to prj;
ALTER USER prj DEFAULT tablespace users quota unlimited ON users;

ALTER USER hr identified BY hr account unlock;

SELECT *
FROM   all_users
ORDER  BY 1;

ALTER session SET "_ORACLE_SCRIPT" = TRUE;

CREATE USER hr identified BY hr;
CREATE USER bbs identified BY bbs DEFAULT tablespace users temporary tablespace temp;

grant CONNECT, RESOURCE TO bbs;
grant CONNECT, dba TO book_ex;

ALTER USER bbs DEFAULT tablespace users quota unlimited ON users;

grant
    SELECT , UPDATE, DELETE, CREATE ON hr.emp TO prj;

SELECT *
FROM   all_users
ORDER  BY 1;
