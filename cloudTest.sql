select * from tab;

-- members table.
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

select * from member;
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

-- book_info table.
create table BOOK_INFO (
 book_code varchar2(20) primary key,
 book_title varchar2(30),
 book_author varchar2(50),
 book_press varchar2(50),
 book_price number
);

insert into book_info values('B0001', '이것이자바다', '김자바','자바출판사',1000);
insert into book_info values('B0002', '이것이자바다', '김자바','자바출판사',1000);
insert into book_info values('C0001', '이것이씨다', '김씨','매우출판사',2000);

select * from book_info where book_code = 'B0001';
select * from book_info;

select * from book_info
where 1 = 1
and book_title = '이것이자바다' or book_author = '김씨';

delete from book_info where book_code like 'Groucho%';

-- book_file table.
create table book_file (
 file_no number primary key,
 book_code varchar2(50),
 book_image varchar2(50),
 book_path varchar2(50)
);
select * from book_file;
delete from book_file where book_code like 'Groucho%';

-- tbl_notice table.
create sequence notice_seq;
create table tbl_notice (
 notice_id number primary key,
 notice_writer varchar2(100) not null,
 notice_title varchar2(100) not null,
 notice_subject varchar2(1000) not null,
 notice_date date,
 hit_count number default 0,
 attach_file varchar2(100),
 attach_dir varchar2(100)
);

select notice_seq.nextval from dual;
insert into tbl_notice (notice_id, notice_writer, notice_title, notice_subject, notice_date)
values(1, 'user1', 'sample title', 'sample subject', sysdate);

insert into tbl_notice (notice_id, notice_writer, notice_title, notice_subject, notice_date)
select notice_seq.nextval, 'writer'||notice_seq.currval, 'title'||notice_seq.currval, 'subject'||notice_seq.currval, sysdate
from tbl_notice;

select b.notice_id, b.notice_writer, b.notice_title, b.notice_date, b.hit_count from
(
    select rownum rn, a.* from 
    (select n.* 
     from tbl_notice n
     where 1 = 1
     --and notice_writer like '%writer3%'
     --and notice_title like '%title3%'
     --and notice_subject like '%subject31%'
     order by 1) a
    where rownum <= (1*10)
) b
where b.rn >= (1*10-9);

select * from tbl_notice
where notice_id = 1;

update tbl_notice
set notice_writer = case mod(notice_id , 4) when 1 then 'user1' 
                                            when 2 then 'user2'
                                            when 3 then 'user3'
                                            else 'user4'
                    end
where notice_id > 10;
select * from tbl_notice order by 1;

-- center_info table.
drop table center_info purge;
create table center_info (
 id number,
 center_name varchar2(100),
 center_type varchar2(50),
 facility_name varchar2(100),
 org varchar2(100),
 phone_number varchar2(20),
 sido varchar2(40),
 sigungu varchar2(40),
 address varchar2(100),
 lat varchar2(20),
 lng varchar2(20),
 zip_code varchar2(10),
 created_at varchar2(30),
 updated_at varchar2(30)
);

delete from center_info where id is not null;
commit;
select * from center_info order by 1;
insert into center_info (id, center_name, center_type, facility_name, org, phone_number, sido, sigungu, address, lat, lng, zip_code, created_at, updated_at)
values(1,'centername','centertype','facilityname','org','phone-number','sido','sigungu','address','lat','lng','zipcode','createdat','updatedat');




