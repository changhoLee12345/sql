create table member (
    member_id varchar2(30) primary key,
    member_name varchar2(50),
    member_password varchar2(50),
    member_address varchar2(100)
);

create sequence notice_seq;
drop table notice purge;
create table notice (
    id number primary key,
    title varchar2(100),
    content varchar2(300),
    wdate date,
    hit number
);

create sequence bbs_id_seq;
drop table bbs purge;
create table bbs(
    bbs_id number primary key,
    bbs_title varchar2(100),
    bbs_content varchar2(300),
    bbs_writer varchar2(100),
    bbs_create_date date,
    bbs_hit number,
    bbs_image varchar2(100)
);

insert into notice
select notice_seq.nextval, '공지사항 유의'||notice_seq.currval, '공지사항을 잘 지켜주시기 바랍니다'||notice_seq.currval, wdate, 0 from notice;

select * from notice;
