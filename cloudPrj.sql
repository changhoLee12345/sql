select * from tab;

create table cart (
	no number primary key,
	product_nm varchar2(50),
	price number,
	qty number
);

insert into cart values( 1, '코드 스프링', 45000, 3);
insert into cart values( 2, '혼자 자바', 35000, 1);

commit;
select * from cart;

-----------------------------------------------------------------------------------------------------


drop table tbl_users purge;
create table tbl_users (
user_id varchar2(100) primary key,
user_pw varchar2(10) not null,
user_name varchar2(100) not null,
user_birth date,
user_phone varchar2(20),
user_addr varchar2(100)
);
insert into tbl_users (user_id, user_pw, user_name, user_birth)
values('user1', '1111', 'Hong', to_date('2005-01-01','yyyy-mm-dd'));

insert into tbl_users (user_id, user_pw, user_name, user_birth)
values('user3', '1111', 'Park', '1995-01-01');

insert into tbl_users (user_id, user_pw, user_name, user_birth)
values('user2','1111','Hwang',to_date('1995-01-01','yyyy-mm-dd'));

select * from tbl_users;

update tbl_users
set    user_pw = '2222',
       user_phone = '010-1111-2222',
       user_addr = 'Daegu 100'
where user_id = 'user3';

update tbl_users
				 set    user_pw = '3333',
				        user_addr = 'Seoul 100'
				where user_id = 'user3';

delete from tbl_users where user_id = 'user2';

commit;
rollback;

create table tbl_board (
  brd_no number primary key,
  brd_title varchar2(100) not null,
  brd_writer varchar2(10) not null, -- user1, user2
  brd_content varchar2(100) not null,
  create_date date default sysdate,
  click_cnt number default 0);
create sequence board_seq;
insert into tbl_board (brd_no, brd_title, brd_content, brd_writer)
values (board_seq.nextval, 'title test'||board_seq.currval, 'content test', 'user1');

update tbl_board
set    brd_content = 'modify content'
where brd_no = 5;

delete from tbl_board 
where brd_no = 7;

select * from tbl_board where brd_no = 3;

update tbl_board
set    click_cnt = click_cnt + 1
where brd_no = 3;

drop table prod_info purge;
create table prod_info (
 prod_code char(4) primary key,
 prod_name varchar2(100) not null,
 prod_desc varchar2(500),
 rct_price number default 1000,
 sale_price number default 2000,
 safe_qty number default 5,
 create_date date default sysdate,
 update_date date default sysdate
);
insert into prod_info (prod_code, prod_name, prod_desc) values('P001', '노트북1', '좋은노트북입니다.1');

select * from prod_info;

create sequence txn_seq;
create table in_out_txn (
 txn_id number primary key,
 prod_code char(4) not null,
 qty number not null,
 txn_date date default sysdate
 );
insert into in_out_txn values(txn_seq.nextval, 'P001', 10, sysdate);
insert into in_out_txn values(txn_seq.nextval, 'P001', -5, sysdate);
insert into in_out_txn values(txn_seq.nextval, 'P001', -3, sysdate);

insert into in_out_txn values(txn_seq.nextval, 'P011', 9, sysdate);
insert into in_out_txn values(txn_seq.nextval, 'P011', -5, sysdate);
insert into in_out_txn values(txn_seq.nextval, 'P012', 9, sysdate);
insert into in_out_txn values(txn_seq.nextval, 'P012', -5, sysdate);
insert into in_out_txn values(txn_seq.nextval, 'P013', 9, sysdate);
insert into in_out_txn values(txn_seq.nextval, 'P013', -5, sysdate);
insert into in_out_txn values(txn_seq.nextval, 'P015', 9, sysdate);
insert into in_out_txn values(txn_seq.nextval, 'P015', -5, sysdate);
insert into in_out_txn values(txn_seq.nextval, 'P016', 9, sysdate);
insert into in_out_txn values(txn_seq.nextval, 'P016', -5, sysdate);
insert into in_out_txn values(txn_seq.nextval, 'P017', 9, sysdate);
insert into in_out_txn values(txn_seq.nextval, 'P017', -5, sysdate);
insert into in_out_txn values(txn_seq.nextval, 'P018', 9, sysdate);
insert into in_out_txn values(txn_seq.nextval, 'P018', -5, sysdate);
insert into in_out_txn values(txn_seq.nextval, 'P019', 9, sysdate);
insert into in_out_txn values(txn_seq.nextval, 'P019', -5, sysdate);
select * from in_out_txn;

select * from (
    select rownum rn, prod_code, qty
    from (
        select prod_code, sum(qty) qty
        from in_out_txn
        group by prod_code
        --having sum(qty) > 0
        order by prod_code
    ) a
    where rownum <= 10
) b
where rn > 5
;

select count(*) from (
select  prod_code from in_out_txn group by prod_code
having sum(qty) > 0);

select * from prod_info order by 1;


