SELECT * FROM tab;

select * from emp
order by 1 desc;

CREATE TABLE emp AS
    SELECT * FROM employees;

grant
    SELECT , UPDATE, DELETE, INSERT ON emp TO prj;

SELECT * FROM emp ORDER BY 1 DESC;

INSERT INTO emp
    SELECT employees_seq.nextval
          ,first_name
          ,last_name
          ,email
          ,phone_number
          ,hire_date
          ,job_id
          ,salary
          ,commission_pct
          ,manager_id
          ,department_id
    FROM   employees;

SELECT *
FROM   (SELECT ROWNUM rn, a.* FROM (SELECT * FROM employees ORDER BY 1) a) b
WHERE  b.rn >= 1
AND    b.rn <= 10;

SELECT * FROM emp;

SELECT * FROM fileboard;

CREATE TABLE comments(id NUMBER, NAME VARCHAR2(100), contents VARCHAR2(300));

CREATE TABLE id_repository(VALUE NUMBER, NAME VARCHAR2(30));

drop TABLE fileboard purge;
CREATE TABLE fileboard(num NUMBER primary key
                      ,author VARCHAR2(100)
                      ,title VARCHAR2(300)
                      ,filename1 VARCHAR2(100)
                      ,filename2 VARCHAR2(100)
                      ,filename3 VARCHAR2(100)
                      ,DAY DATE);
SELECT * FROM fileboard;

CREATE TABLE product_item(product_code VARCHAR2(10) primary key
                         ,product_name VARCHAR2(300)
                         ,product_desc VARCHAR2(2000)
                         ,product_image VARCHAR2(300)
                         ,product_price NUMBER
                         ,like_it NUMBER(2, 1)
                         ,sale_price NUMBER);

SELECT * FROM product_item ORDER BY 1;

UPDATE product_item
SET    product_desc = '<img alt="" src="/javaScript/Upload/bakery4.PNG" style="height:393px; width:284px" />'
WHERE  product_code = 'P111113';

SELECT * FROM product_item;

CREATE TABLE goods(prod_code VARCHAR2(10) primary key
                  ,prod_name VARCHAR2(100)
                  ,prod_desc VARCHAR2(1000)
                  ,prod_image VARCHAR2(100)
                  ,prod_price NUMBER
                  ,sale_price NUMBER
                  ,like_it NUMBER(3, 1));
INSERT INTO goods
VALUES
    ('p001', '�����⿬���극��', '����� �ܿ� �����⸦ ��� �ø��� ������ ������ ����÷����� �������� ��Ϻ극��', 'bakery1.PNG', 5000, 4000, 4.0);
INSERT INTO goods
VALUES
    ('p002', '������ ����', '����� �ܿ� �����⸦ �ø��� ���̽����� �÷���ũ������ ǳ�̸� ���� ��Ų ������ ����', 'bakery2.PNG', 6000, 5000, 4.5);
INSERT INTO goods
VALUES
    ('p003', '������ ũ����', '������ ǳ�̰� ���� �������� ũ���� ���忡 ���庼, ����, �׸��� ����� �ܿ� ������� ��ȭ�� ���� ������� ���� ����Ʈ', 'bakery3.PNG', 7000, 6000, 3.0);
INSERT INTO goods
VALUES
    ('p004', '���ǳ� ũ����', '�÷��� ũ���ð� ���ǳӺ��̽�, �Ƹ�� �긮Ʋ�� �Ƹ�彽���̽�, ���̽�ũ���� �ö� ũ������ �߰��Ͽ� ���⿡ ���� ���� �ִ� �÷����� ũ����', 'bakery4.PNG', 8000, 7000, 3.5);
SELECT * FROM goods;