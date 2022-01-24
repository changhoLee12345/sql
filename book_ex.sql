create sequence seq_board;

drop table tbl_board purge;
create table tbl_board (
 bno number(10,0),
 title varchar2(200) not null,
 content varchar2(2000) not null,
 writer varchar2(50) not null,
 regdate date default sysdate,
 updatedate date default sysdate
);

alter table tbl_board add constraint pk_board
primary key(bno);

insert into tbl_board(bno, title, content, writer)
values(seq_board.nextval, '�׽�Ʈ ����', '�׽�Ʈ ����', 'user00');

select * from tbl_board order by 1;
delete from tbl_board where bno < 100;

insert into tbl_board(bno, title, content, writer)
select seq_board.nextval, title, content, writer from tbl_board;


select * from tbl_board where bno < 100;

select rn, bno, title, content
from (
        select /*+ INDEX_DESC (tbl_board pk_board) */ rownum rn, bno, title, content
        from tbl_board
        where rownum <= 20
) where rn > 0;

select /*+ INDEX_ASC (tbl_board pk_board) */* from tbl_board where bno > 0 and bno < 100;

