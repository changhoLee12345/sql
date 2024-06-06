
SELECT *
FROM   all_users
ORDER  BY username;

--oracle 11g.
ALTER USER hr identified BY hr account unlock;

ALTER USER dev identified BY '';

ALTER session SET "_ORACLE_SCRIPT" = TRUE;

CREATE USER jsp identified BY jsp;
grant CONNECT, RESOURCE TO jsp;
ALTER USER jsp DEFAULT tablespace users quota unlimited ON users;
grant CREATE view TO jsp;
CREATE USER jsp identified BY QAwsedrftg12;

ALTER USER prj identified BY prj;
ALTER USER dev identified BY dev;

grant
    SELECT ON hr.employees TO jsp;
