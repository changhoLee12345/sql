
SELECT *
FROM   all_users
ORDER  BY username;

--oracle 11g.
ALTER USER hr identified BY hr account unlock;

ALTER USER prj identified BY prj;

ALTER session SET "_ORACLE_SCRIPT" = TRUE;

CREATE USER jsp identified BY "!QAZ2wsx3edc";
grant CONNECT, RESOURCE TO jsp;
ALTER USER jsp DEFAULT tablespace users quota unlimited ON users;
grant CREATE view TO jsp;

grant SELECT ON hr.employees TO jsp;
