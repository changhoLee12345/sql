select * from tab;

select * from members;

insert into members values('admin','1234','°ü¸®ÀÚ','admin@email.com','Admin','','',sysdate);
update members set responsibility='User' where id ='user1';
alter table member rename column mail to email;

select * from tbl_board order by 1 ;

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

insert into book_info values('B0001', '?´ê²ƒì´?ë°”ë‹¤', 'ê¹??ë°?','?ë°”ì¶œ?Œ?‚¬',1000);
insert into book_info values('B0001', '?´ê²ƒì´?ë°”ë‹¤', 'ê¹??ë°?','?ë°”ì¶œ?Œ?‚¬',1000);
insert into book_info values('C0001', '?´ê²ƒì´?”¨?‹¤', 'ê¹??”¨','ë§¤ìš°ì¶œíŒ?‚¬',2000);

select * from book_info order by book_code;
delete from book_info where book_code like 'Groucho%';

create table book_file (
 file_no number primary key,
 book_code varchar2(50),
 book_image varchar2(50),
 book_path varchar2(50)
);
select * from book_file;
delete from book_file where book_code like 'Groucho%';

create table members (
 id varchar(10) primary key,
 passwd varchar2(10),
 name varchar2(30),
 email varchar2(30),
 responsibility varchar2(10),
 pfileName varchar2(50),
 ofileName varchar2(50),
 cdate date
);
insert into members values('user1','1234','username','email.com','user',null,null,sysdate);

drop table genesis purge;
create table genesis (
 member_order varchar2(3) primary key,
 member_name varchar2(100),
 col1 char(1) default 'N',
 col2 char(1) default 'N',
 col3 char(1) default 'N',
 col4 char(1) default 'N',
 col5 char(1) default 'N',
 col6 char(1) default 'N',
 col7 char(1) default 'N',
 col8 char(1) default 'N',
 col9 char(1) default 'N',
 col10 char(1) default 'N',
 col11 char(1) default 'N',
 col12 char(1) default 'N',
 col13 char(1) default 'N',
 col14 char(1) default 'N',
 col15 char(1) default 'N'
);

insert into genesis(member_order, member_name)
values('1-1', '?´ì°½í˜¸');
insert into genesis(member_order, member_name)
values('1-2', 'ê¹??´?ƒ');
insert into genesis(member_order, member_name)
values('1-3', 'ê¹??ƒ?˜¸');
insert into genesis(member_order, member_name)
values('1-4', 'ë§ˆë™?¼');
insert into genesis(member_order, member_name)
values('1-5', 'ë°°ë‹¤?°');
insert into genesis(member_order, member_name)
values('1-6', '?´ì¢…ê²½');
insert into genesis(member_order, member_name)
values('1-7', '? •?ˆ˜?™˜');

insert into genesis(member_order, member_name)
values('2-1', 'ìµœì‹ ?• ');
insert into genesis(member_order, member_name)
values('2-2', 'ê³½ë??˜');
insert into genesis(member_order, member_name)
values('2-3', '?†ëª…êµ­');
insert into genesis(member_order, member_name)
values('2-4', '?„?ƒì¤?');
insert into genesis(member_order, member_name)
values('2-5', '?´?‚¬?˜„');
insert into genesis(member_order, member_name)
values('2-6', '?†¡?ƒœ?•˜');
insert into genesis(member_order, member_name)
values('2-7', 'ê¶Œì˜?š´');
insert into genesis(member_order, member_name)
values('2-8', 'ìµœì„ ?—´');

insert into genesis(member_order, member_name)
values('3-1', 'ê¹?ì§??˜');
insert into genesis(member_order, member_name)
values('3-2', 'ê¹?ì£¼ì—°');
insert into genesis(member_order, member_name)
values('3-3', 'ê¹???ê²?');
insert into genesis(member_order, member_name)
values('3-4', 'ë¬¸í¬?˜');
insert into genesis(member_order, member_name)
values('3-5', '?‚¨?†Œ?˜œ');
insert into genesis(member_order, member_name)
values('3-6', 'ìµœìœ ì§?');
insert into genesis(member_order, member_name)
values('3-7', 'ê¹?ì§??˜„');

select * from genesis
order by member_order;

update genesis   set col1 = 'Y'   where member_order = '1-1';
update genesis set col2 = 'Y' where member_order = '11';

