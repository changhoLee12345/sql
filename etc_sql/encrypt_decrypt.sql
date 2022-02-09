-- D:\app\leadon\product\11.2.0\dbhome_1\RDBMS\ADMIN
-- sys 권한으로 실행.
--@dbmsobtk.sql
--@prvtobtk.plb

grant execute on dbms_crypto to hr;

grant execute on dbms_obfuscation_toolkit to hr;

-- hr 권한으로 실행해보기.
select pkg_encrypt_decrypt.encrypt(v_input_string => 'passwd', v_key => 'testsecretkey')
from dual;

select pkg_encrypt_decrypt.decrypt(v_input_string => 'F8924985326D846D', v_key => 'testsecretkey')
from dual;

create table login_test
as
select employee_id id, first_name name, '1234' passwd
from employees;

select * from login_test
order by 1 desc;

delete from login_test
where id=500;
