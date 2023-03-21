select * from tab;

select * from book_info
order by 1;

select * from tbl_board;
select board_seq.nextval from dual;
insert into tbl_board values(board_seq.nextval, 'test', 'test', 'user01', to_date('2022-01-01','yyyy-mm-dd'), 0, null);
