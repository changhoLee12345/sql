create user yderp identified by yderp;

grant connect, resource to yderp;

select tablespace_name, status, contents from dba_tablespaces;

select file_name, bytes, status from dba_data_files;
