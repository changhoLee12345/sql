create user javacafe identified by H1q2w3e4r5tR;

grant connect, resource to javacafe;

alter user javacafe default tablespace data quota unlimited on users;