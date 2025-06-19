-----------------------------------------------------
--------------- jsp 수업진행할 때 사용할 sql ------------
-----------------------------------------------------
-- 11g, 21c 사용.
select * from tab;
-----------------------------------------------------------

--           tbl_member table.
-----------------------------------------------------------
create table tbl_member (
  member_id varchar2(30),
  member_name varchar2(100) not null,
  password varchar2(10) not null,
  email varchar2(50),
  authority varchar2(10) default 'User',
  creation_date date default sysdate
);
alter table tbl_member add constraint pk_member primary key (member_id);
insert into tbl_member (member_id, member_name, password) values('user01', '사용자1', '1111');

select *
from tbl_member;
-----------------------------------------------------------

--    tbl_board
-----------------------------------------------------------
drop table tbl_board purge;
create sequence board_seq;

create table tbl_board (
 board_no number,
 title varchar2(50) not null,
 content varchar2(300) not null,
 writer varchar2(20) not null,
 view_cnt number default 0,
 creation_date date default sysdate,
 last_update_date date default sysdate
);
alter table tbl_board add constraint pk_board primary key (board_no);
alter table tbl_board add image varchar2(100);


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
      select /*+ INDEX(b PK_BOARD) */ rownum rn, b.*
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


SELECT /*+ INDEX_DESC(b pk_board) */
 *
FROM   tbl_board b
WHERE  board_no > 0;

commit;

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

-----------------------------------------------------------
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
-----------------------------------------------------------

--      tbl_reply
-----------------------------------------------------------
drop TABLE tbl_reply purge;
CREATE sequence reply_seq;
CREATE TABLE tbl_reply(reply_no number
                      ,board_no number NOT NULL
                      ,reply VARCHAR2(300) NOT NULL
                      ,replyer VARCHAR2(100) NOT NULL
                      ,reply_date DATE DEFAULT SYSDATE);
alter table tbl_reply add constraint pk_reply primary key (reply_no);

SELECT *
FROM   tbl_reply;

INSERT INTO tbl_reply
VALUES
    (reply_seq.nextval
    ,3813048
    ,'test reply'
    ,'user01'
    ,SYSDATE);
-----------------------------------------------------------

--           cart table.
-----------------------------------------------------------
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
-----------------------------------------------------------
