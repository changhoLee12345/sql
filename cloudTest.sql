select * from tab;

select * from member;

alter table member rename column mail to email;

select * from tbl_board order by 1 desc;

drop table tbl_reply purge;

create sequence reply_seq;
create table tbl_reply (
 reply_no int primary key,
 bno int not null,
 content varchar2(300) not null,
 writer varchar2(100) not null,
 create_date date default sysdate
);

select * from tbl_reply;

create table BOOK_INFO (
 book_code varchar2(20) primary key,
 book_title varchar2(30),
 book_author varchar2(50),
 book_press varchar2(50),
 book_price number
);

insert into book_info values('B0001', '�̰����ڹٴ�', '���ڹ�','�ڹ����ǻ�',1000);
insert into book_info values('C0001', '�̰��̾���', '�达','�ſ����ǻ�',2000);

select * from book_info;



