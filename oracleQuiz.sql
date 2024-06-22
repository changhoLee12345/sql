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



