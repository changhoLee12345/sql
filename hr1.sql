select * from tab;

select * from emp order by 1 desc;

insert into emp
select EMPLOYEES_SEQ.nextval, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id from employees;

select * from (select rownum rn, a.* from (select * from employees order by 1) a) b
where b.rn >= 1 and b.rn <= 10
;

select * from emp;

select * from fileboard;

create table comments (
id number,
name varchar2(100),
contents varchar2(300)
);

create table id_repository (
value number,
name varchar2(30)
);

drop table fileboard purge;
create table fileboard (
 num number primary key,
 author varchar2(100),
 title varchar2(300),
 filename1 varchar2(100),
 filename2 varchar2(100),
 filename3 varchar2(100),
 day date
);
select * from fileboard;

create table product_item(
 product_code varchar2(10) primary key,
 product_name varchar2(300),
 product_desc varchar2(2000),
 product_image varchar2(300),
 product_price number,
 like_it number(2,1),
 sale_price number
);

select * from product_item order by 1;

update product_item
set product_desc = '<img alt="" src="/javaScript/Upload/bakery4.PNG" style="height:393px; width:284px" />'
where product_code = 'P111113';

select * from product_item;

create table goods (
 prod_code varchar2(10) primary key,
 prod_name varchar2(100),
 prod_desc varchar2(1000),
 prod_image varchar2(100),
 prod_price number,
 sale_price number,
 like_it number(3,1)
);
insert into goods values('p001','�����⿬���극��', '����� �ܿ� �����⸦ ��� �ø��� ������ ������ ����÷����� �������� ��Ϻ극��','bakery1.PNG',5000,4000,4.0);
insert into goods values('p002','������ ����','����� �ܿ� �����⸦ �ø��� ���̽����� �÷���ũ������ ǳ�̸� ���� ��Ų ������ ����','bakery2.PNG',6000,5000,4.5);
insert into goods values('p003','������ ũ����','������ ǳ�̰� ���� �������� ũ���� ���忡 ���庼, ����, �׸��� ����� �ܿ� ������� ��ȭ�� ���� ������� ���� ����Ʈ','bakery3.PNG',7000,6000,3.0);
insert into goods values('p004','���ǳ� ũ����','�÷��� ũ���ð� ���ǳӺ��̽�, �Ƹ�� �긮Ʋ�� �Ƹ�彽���̽�, ���̽�ũ���� �ö� ũ������ �߰��Ͽ� ���⿡ ���� ���� �ִ� �÷����� ũ����','bakery4.PNG',8000,7000,3.5);
select * from goods;



