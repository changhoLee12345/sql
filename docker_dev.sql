select * from tab;

select * from tbl_board order by bno desc;
select * from tbl_attach;

create table tbl_sample1(col1 varchar2(500));
drop table tbl_sample2 purge;
create table tbl_sample2(col2 varchar2(50));

select * from tbl_reply
order by 1 desc;

select * from tbl_reply where bno = 2490387
order by 1;

insert into tbl_reply (rno, bno, reply, replyer)
select seq_reply.nextval, bno, reply, replyer from tbl_reply where bno = 2490387;


select rno, bno, reply, replyer, replydate, updatedate
from (
    select /*+INDEX(tbl_reply idx_reply) */
    rownum rn, bno, rno, reply, replyer, replyDate, updatedate
    from tbl_reply
    where bno = 3
    and rno > 0
    and rownum <= 10
) where rn >= 1;

select /*+ INDEX_DESC(tbl_board pk_board) */
*
from tbl_board
where bno > 0;

select /*+ INDEX_ASC(tbl_board pk_board) */ *
from tbl_board 
where bno > 0;

select rn, bno, title, content, writer, regdate, updatedate
from (
    select /*+ INDEX_DESC(tbl_board pk_board) */ rownum rn, bno, title, content, writer, regdate, updatedate
    from tbl_board
    where rownum <= 20 
)
where rn > 10
--order by bno
;

select * from (
  select /*+INDEX_DESC(tbl_board pk_board) */
         rownum rn, bno, title, content, writer, regdate, updatedate
  from tbl_board
  where (title like '%test%' or content like '%test%')
  and   rownum <= 20
)
where rn > 10;

update tbl_board
set writer = case mod(bno, 4) when 0 then 'user00' 
                              when 1 then 'user01'
                              when 2 then 'user02'
                              when 3 then 'user03'
             end
where bno > 0;

select count(*) from tbl_board 
where bno > 0;

insert into tbl_board (bno, title, content, writer)
select seq_board.nextval, title, content, writer 
from tbl_board;

select * from tbl_board 
order by bno desc;

select to_char(replydate,'rrrr/mm/dd hh24:mi:ss') from tbl_reply order by 1 desc;
select sysdate,to_char(sysdate,'rrrr/mm/dd hh24:mi:ss')  from dual;

insert into tbl_reply (rno, bno, reply, replyer)
values(seq_reply.nextval, 2490385, 'reply'||seq_reply.currval, 'replyer2');

create table tbl_attach (
  uuid varchar2(100) not null,
  uploadPath varchar2(200) not null,
  fileName varchar2(100) not null,
  fileType char(1) default 'I',
  bno number(10,0)
);
alter table tbl_attach add constraint pk_attach primary key (uuid);
alter table tbl_attach add constraint fk_board_attach foreign key (bno) references tbl_board(bno);

-----------------------------------------------
-----------------------------------------------
create sequence seq_board;
create table tbl_board (
 bno number(10,0),
 title varchar2(200) not null,
 content varchar2(2000) not null,
 writer varchar2(50) not null,
 regdate date default sysdate,
 updatedate date default sysdate);
alter table tbl_board add constraint pk_board primary key(bno);

insert into tbl_board (bno, title, content, writer)
values(seq_board.nextval, 'test title', 'test content', 'user01');

select * from tbl_board order by 1 desc;

-----------------------------------------------
-----------------------------------------------
create sequence seq_reply;
create table tbl_reply (
  rno number(10,0),
  bno number(10,0) not null,
  reply varchar2(1000) not null,
  replyer varchar2(50) not null,
  replydate date default sysdate,
  updatedate date default sysdate
);
alter table tbl_reply add constraint pk_reply primary key(rno);
alter table tbl_reply add constraint fk_reply_board foreign key (bno) references tbl_board (bno);
create index idx_reply on tbl_reply (bno desc, rno asc);
-----------------------------------------------
-----------------------------------------------


--T20230213(3강의장)
create table product (
 product_code varchar2(10) primary key,
 product_name varchar2(100) not null, --상품명
 product_desc varchar2(1000) not null,
 product_price number not null,
 sale_price number,
 like_it number(3,1),
 image varchar2(100)
);
insert into product values('P2023001', '과테말라 안티구아','과테말라 안티구아 맛있는 커피입니다', 5000, 4500, 4.5, '과테말라 안티구아.jpg');
insert into product values('P2023002', '니카라구아 아라비카','니카라구아 아라비카 맛있는 커피입니다', 5500, 4500, 4.0, '니카라구아 아라비카.jpg');
insert into product values('P2023003', '브라질산토스','브라질산토스 맛있는 커피입니다', 6000, 5000, 3.5, '브라질산토스.jpg');
insert into product values('P2023004', '에티오피아 예가체프','에티오피아 예가체프 맛있는 커피입니다', 4000, 3500, 4.0, '에티오피아 예가체프.jpg');
insert into product values('P2023005', '케냐 오크라톡신','케냐 오크라톡신 맛있는 커피입니다', 4500, 3000, 3.0, '케냐 오크라톡신.jpg');
insert into product values('P2023006', '코스타리카 따라주','코스타리카 따라주 맛있는 커피입니다', 3000, 2500, 5.0, '코스타리카 따라주.jpg');
