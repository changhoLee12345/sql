select * from tab;

-- create table.
drop table prod_tbl purge;
create table prod_tbl (
 prod_no number primary key,
 prod_name varchar2(300) not null,
 prod_desc varchar2(500) not null,
 prod_content varchar2(4000),
 creation_date date default sysdate,
 --code char(1) CHECK(code in ('A','B')),
 ord_no number not null);
 
create sequence prod_seq;

select *
from prod_tbl
order by ord_no;

delete from prod_tbl;

create table tbl_student (
 std_no varchar2(20) primary key,
 std_name varchar2(200) not null,
 phone varchar2(20),
 bld_type varchar2(10),
 create_date date default sysdate);

create sequence prod_seq; -- 시퀀스.
drop table template_prod purge;
create table template_prod (
 prod_no number,
 prod_code varchar2(30),
 prod_name varchar2(200),
 prod_desc varchar2(300),
 prod_content varchar2(4000),
 prod_img1 varchar2(100),
 prod_img2 varchar2(100),
 prod_img3 varchar2(100),
 attribute1 varchar2(100), --속성1 미정의 상태로 추후 사용할 칼럼.
 attribute2 varchar2(100), --속성2 미정의 상태로 추후 사용할 칼럼.
 attribute3 varchar2(100), --속성3 미정의 상태로 추후 사용할 칼럼.
 attribute4 varchar2(100), --속성4 미정의 상태로 추후 사용할 칼럼.
 attribute5 varchar2(100), --속성5 미정의 상태로 추후 사용할 칼럼.
 creation_date date default sysdate,
 trial_no varchar2(20) -- 2024-06-29-13-12(년-월-일-시-분)
);

select *
from template_prod
order by 1;

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

insert into tbl_cart values(1, '과테말라 안티구아', 1200, 2);
insert into tbl_cart values(2, '케냐 오크라톡신', 1500, 2);
insert into tbl_cart values(3, '코스타리카 따라주', 1800, 2);
insert into tbl_cart values(4, '니카라구아 더치핸드드립', 2200, 2);
insert into tbl_cart values(5, '브라질산토스', 3200, 2);
insert into tbl_cart values(6, '에티오피아 예가체프', 3300, 2);

select *
from emp
order by 1;

delete from emp
where emp_name = 'kildongHong';


create table tbl_books (
 book_code char(4) primary key, --도서코드
 book_title varchar2(50) not null, --도서명
 author varchar2(100) not null, --저자
 company varchar2(100) not null, --출판사
 price number not null, --판매가격
 create_date date default sysdate
);

insert into tbl_books
values('B001', '나는 읽고 쓰고 버린다', '손웅정', '난다', 15300, sysdate);
insert into tbl_books
values('B002', '숲속 재봉사의 옷장', '최향랑', '창비', 14400, sysdate);
insert into tbl_books
values('B003', '유튜브, 제국의 탄생', '마크 버겐', '현대지성', 22500, sysdate);
insert into tbl_books
values('B004', '상자 속 우주', '앤드류 폰첸', 'RH코리아', 23400, sysdate);
insert into tbl_books
values('B005', '프레너미', '심아진', '강', 13500, sysdate);



