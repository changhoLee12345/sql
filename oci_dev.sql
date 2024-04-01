select * from tab;

select * from employee;

select * from tbl_members;

select * from tbl_board;

select /*+ INDEX_DESC(b BOARD_PK) */ b.*
from   tbl_board b;
