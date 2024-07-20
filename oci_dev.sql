-----------------------------------------------------
--------------- jsp 수업진행할 때 사용할 sql ------------
-----------------------------------------------------
-- 11g, 21c 사용.
select * from tab;

select * from employee;

select * from tbl_members;

select * from tbl_board;

select /*+ INDEX_DESC(b BOARD_PK) */ b.*
from   tbl_board b;
-----------------------------------------------------------------------
-----------------------------------------------------------------------
drop table tbl_swim_class purge;
create table tbl_swim_lecture (
 mem_id varchar2(10) not null,
 swim_code char(2) not null,
 creation_date date default sysdate
);
insert into tbl_swim_lecture values('user01', 'B1', sysdate);
insert into tbl_swim_lecture values('user02', 'B1', sysdate);
insert into tbl_swim_lecture values('user03', 'M1', sysdate);
insert into tbl_swim_lecture values('user04', 'M1', sysdate);
insert into tbl_swim_lecture values('user05', 'S1', sysdate);
insert into tbl_swim_lecture values('user06', 'S1', sysdate);

select * from tbl_swim_lecture;
select mem_id
      ,s.swim_code
      ,s.swim_name
      ,s.coach
      ,s.swim_fee
      ,sl.creation_date
from tbl_swim_lecture sl
join tbl_swim s
on sl.swim_code = s.swim_code
where s.enabled = 'Y';

create table tbl_swim (
 swim_code char(2) primary key, -- B1, B2, B3, M1, M2, M3
 swim_name varchar2(30) not null,
 coach varchar2(100) not null, -- 강사이름.
 swim_fee number not null,
 enabled char(1) default 'Y' --사용여부
);
insert into tbl_swim values('B1', '기초반1', '김강사', 10000, 'Y');
insert into tbl_swim values('M1', '중급반1', '김중급', 20000, 'Y');
insert into tbl_swim values('S1', '상급반1', '김상급', 30000, 'Y');
select * from tbl_swim;

drop table tbl_auth purge;
create table tbl_auth (
 mem_id varchar2(10),
 auth varchar2(10) not null,
 enabled char(1) default 'Y'
);
alter table tbl_auth add constraint fk_mem_id
foreign key (mem_id) references tbl_member(mem_id);

insert into tbl_auth
values('user01', 'USER', 'Y');
insert into tbl_auth
values('user02', 'USER', 'Y');
insert into tbl_auth
values('admin', 'ADMIN', 'Y');

select *
from tbl_auth;

select *
from tbl_member;

select *
from tbl_auth a
right join tbl_member m
on a.mem_id = m.mem_id;

create table tbl_member (
 mem_id varchar2(10),
 mem_name varchar2(50) not null,
 mem_pw varchar2(100) not null,
 mem_phone varchar2(20),
 creation_date date default sysdate
);
alter table tbl_member add constraint member_pk primary key (mem_id);
alter table tbl_board add update_date date default sysdate;

insert into tbl_member (mem_id, mem_name, mem_pw, mem_phone)
values('user01', '사용자1', '0000', '010-9999-8888');
insert into tbl_member (mem_id, mem_name, mem_pw, mem_phone)
values('user02', '사용자2', '0000', '010-8888-7777');
insert into tbl_member (mem_id, mem_name, mem_pw, mem_phone)
values('admin', '관리자', '0000', '010-8888-7777');

select * from tbl_member;

select *
from tbl_member m
where not exists (select 1 
                  from tbl_auth a
                  where m.mem_id = a.mem_id);

-----------------------------------------------------------------------
-----------------------------------------------------------------------
drop table tbl_board purge;
create table tbl_board (
 board_no number,
 title varchar2(50) not null,
 content varchar2(300) not null,
 writer varchar2(20) not null,
 view_cnt number default 0,
 create_date date default sysdate
);
alter table tbl_board add constraint board_pk primary key (board_no);
alter table tbl_board add update_date date default sysdate;

create sequence board_seq;

insert into tbl_board(board_no, title, content, writer)
values(board_seq.nextval, 'title11', 'content1', 'user01');
insert into tbl_board(board_no, title, content, writer)
values(board_seq.nextval, 'test1', 'nice content 1', 'user02');
insert into tbl_board(board_no, title, content, writer)
values(board_seq.nextval, 'good', 'good content', 'user03');
insert into tbl_board(board_no, title, content, writer)
values(board_seq.nextval, 'every', 'every content', 'user01');

select *
from (
      select /*+ INDEX(b BOARD_PK) */ rownum rn, b.*
      from tbl_board b
      where rownum <= (:page * 5)
     ) a
where rn > (:page - 1 )* 5;

select a.*
from   (select rownum rn, b.*
        from tbl_board b
        where rownum <= (:page * 5)
        order by b.board_no) a
where 1=1
and   rn > (:page - 1) * 5;

-- title: today, content: nice, writer: user01
insert into tbl_board (board_no, title, content, writer)
select board_seq.nextval, title, content, writer
from tbl_board;
--git form연습.
SELECT /*+ INDEX_DESC(tbl_board SYS_C0031805) */
 *
FROM   tbl_board
WHERE  board_no > 0;

UPDATE tbl_board
SET    writer = CASE MOD(board_no, 4)
                    WHEN 0 THEN 'user0'
                    WHEN 1 THEN 'user1'
                    WHEN 2 THEN 'user2'
                    ELSE 'user3'
                END
WHERE  board_no > 0;

SELECT /*+ FULL(tbl_board) */
 ROWNUM rn
,board_no
,title
FROM   tbl_board
WHERE  board_no > 0
ORDER  BY board_no;

SELECT rn
      ,board_no
      ,title
      ,content
FROM   (SELECT /*+ INDEX_DESC(tbl_board SYS_C0031805) */
         ROWNUM rn
        ,board_no
        ,title
        ,content
        FROM   tbl_board
        WHERE  ROWNUM <= 20)
WHERE  rn > 10;

--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
--여러건 넣기.
INSERT INTO tbl_board
    (board_no
    ,title
    ,content
    ,writer)
    SELECT board_seq.nextval
          ,title
          ,content
          ,writer
    FROM   tbl_board;
SELECT COUNT(*)
FROM   tbl_board;

INSERT INTO tbl_board
    (board_no
    ,title
    ,content
    ,writer)
VALUES
    (board_seq.nextval
    ,'title' || board_seq.currval
    ,'content' || board_seq.currval
    ,'writer' || board_seq.currval);

SELECT *
FROM   tbl_board
ORDER  BY 1 DESC;

DELETE FROM tbl_board
WHERE  board_no > 500;

drop TABLE tbl_reply purge;
CREATE sequence reply_seq;
CREATE TABLE tbl_reply(reply_no INT primary key
                      ,bno INT NOT NULL
                      ,content VARCHAR2(300) NOT NULL
                      ,writer VARCHAR2(100) NOT NULL
                      ,create_date DATE DEFAULT SYSDATE);
SELECT *
FROM   tbl_reply;
INSERT INTO tbl_reply
VALUES
    (reply_seq.nextval
    ,3813048
    ,'test reply'
    ,'user01'
    ,SYSDATE);


drop table cart purge;
create table tbl_cart (
	no number primary key,
	product_nm varchar2(50),
	price number,
	qty number
);
insert into tbl_cart values(1, '과테말라 안티구아', 1200, 2);
insert into tbl_cart values(2, '케냐 오크라톡신', 1500, 2);
insert into tbl_cart values(3, '코스타리카 따라주', 1800, 2);
insert into tbl_cart values(4, '니카라구아 더치핸드드립', 2200, 2);
insert into tbl_cart values(5, '브라질산토스', 3200, 2);
insert into tbl_cart values(6, '에티오피아 예가체프', 3300, 2);
