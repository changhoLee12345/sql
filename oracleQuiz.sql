select * from tab;

select *
from board_tbl
order by board_no desc;

select * from quiz;

--1. add first
--2. add SECOND
--3. add third

--a321ba6e18e27479b467f669291cd8667adc876a;

select *
from tab;

select * 
from tbl_books;

select *
from tbl_cart;

insert into tbl_cart values(1, '���׸��� ��Ƽ����', 1200, 2);
insert into tbl_cart values(2, '�ɳ� ��ũ�����', 1500, 2);
insert into tbl_cart values(3, '�ڽ�Ÿ��ī ������', 1800, 2);
insert into tbl_cart values(4, '��ī�󱸾� ��ġ�ڵ�帳', 2200, 2);
insert into tbl_cart values(5, '��������佺', 3200, 2);
insert into tbl_cart values(6, '��Ƽ���Ǿ� ����ü��', 3300, 2);

select *
from emp
order by 1;

delete from emp
where emp_name = 'kildongHong';


create table tbl_books (
 book_code char(4) primary key, --�����ڵ�
 book_title varchar2(50) not null, --������
 author varchar2(100) not null, --����
 company varchar2(100) not null, --���ǻ�
 price number not null, --�ǸŰ���
 create_date date default sysdate
);

insert into tbl_books
values('B001', '���� �а� ���� ������', '�տ���', '����', 15300, sysdate);
insert into tbl_books
values('B002', '���� ������� ����', '�����', 'â��', 14400, sysdate);
insert into tbl_books
values('B003', '��Ʃ��, ������ ź��', '��ũ ����', '��������', 22500, sysdate);
insert into tbl_books
values('B004', '���� �� ����', '�ص�� ��þ', 'RH�ڸ���', 23400, sysdate);
insert into tbl_books
values('B005', '�����ʹ�', '�ɾ���', '��', 13500, sysdate);



