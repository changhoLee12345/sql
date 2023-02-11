select * from tab;

create table tbl_sample1(col1 varchar2(500));
drop table tbl_sample2 purge;
create table tbl_sample2(col2 varchar2(50));

select * from tbl_reply
order by 1 desc;

create index idx_reply on tbl_reply (bno desc, rno asc);

select rno, bno, reply, replyer, replydate, updatedate
from (
    select /*+INDEX(tbl_reply idx_reply) */
    rownum rn, bno, rno, reply, replyer, replyDate, updatedate
    from tbl_reply
    where bno = 3
    and rno > 0
    and rownum <= 10
) where rn >= 1;

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
             end;
where bno > 0;

select count(*) from tbl_board 
where bno > 0;

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


insert into tbl_board (bno, title, content, writer)
select seq_board.nextval, title, content, writer 
from tbl_board;

select * from tbl_board 
order by 1 desc;

select to_char(replydate,'rrrr/mm/dd hh24:mi:ss') from tbl_reply order by 1 desc;
select sysdate,to_char(sysdate,'rrrr/mm/dd hh24:mi:ss')  from dual;

select * from tbl_reply;
insert into tbl_reply (rno, bno, reply, replyer)
values(seq_reply.nextval, 3, 'reply'||seq_reply.currval, 'replyer2');
