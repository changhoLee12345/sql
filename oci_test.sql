select * from tab
order by tname;

--procedure ��������.
--��ǰ���̺��� ��ǰ������ Ȱ���ؼ� ��ٱ����� ��ǰ�� ������ ��...�ֹ������� �ֹ��������� ����� �۾��� ����. 
create table tbl_product  (
  product_no number,
  product_name varchar2(100) not null,
  product_desc varchar2(300) not null,
  price number not null,
  sale_price number,
  like_it number default 0,
  creation_date date default sysdate
);
alter table tbl_product add primary key (product_no);
create sequence product_seq;

insert into tbl_product (product_no, product_name, product_desc, price, sale_price)
values(product_seq.nextval, '����2000', '�𳪹��� ���� 2000�� �����ϴ�', 2000, 1800);
insert into tbl_product (product_no, product_name, product_desc, price, sale_price)
values(product_seq.nextval, '���콺5000', '���̼��� ���콺�� 5000�� �����ϴ�', 5000, 4000);
insert into tbl_product (product_no, product_name, product_desc, price, sale_price)
values(product_seq.nextval, '���찳1000', '�𳪹��� ���찳 1000�� �����ϴ�', 1000, 900);
insert into tbl_product (product_no, product_name, product_desc, price, sale_price)
values(product_seq.nextval, '����2000', '�𳪹��� ���� 2000�� �����ϴ�', 2000, 1500);

select *
from tbl_product
order by 1;

delete from tbl_product
where product_no = 4;

drop table tbl_cart purge;
create table tbl_cart (
 cart_no number, 
 product_no number not null,
 qty number default 1,
 user_id varchar2(20) not null,
 creation_date date default sysdate
);
create sequence cart_seq;

insert into tbl_cart (cart_no, product_no, qty, user_id)
values(cart_seq.nextval, 1,2,'user01');
insert into tbl_cart (cart_no, product_no, qty, user_id)
values(cart_seq.nextval, 2,3,'user01');
insert into tbl_cart (cart_no, product_no, qty, user_id)
values(cart_seq.nextval, 3,1,'user01');

select *
from tbl_cart
where user_id = 'user01';

delete from tbl_cart
where user_id = 'user01';

delete from order_details;
delete from purchase_order;

select *
from order_details;

select po.order_no, po.order_status, po.address_to, od.order_detail_no, od.product_no, pd.product_name, od.qty, od.order_price
from purchase_order po
join order_details od
on po.order_no = od.order_no
join tbl_product pd
on pd.product_no = od.product_no
order  by od.order_detail_no;
--PP202406001
--�ֹ�����.
drop table purchase_order purge;
create table purchase_order (
 order_no varchar2(10), --P202406001
 user_id varchar2(10) not null,
 address_to varchar2(100) not null,
 order_status varchar2(20) not null, --�ֹ�, ���, �Ϸ�
 order_date date default sysdate
);
alter table purchase_order add constraint order_pk primary key (order_no);

drop table order_details purge;
create table order_details (
 order_detail_no number,
 order_no varchar2(10), --P202406001
 product_no number not null,
 qty number not null,
 order_price number,
 creation_date date default sysdate
);
create sequence order_details_seq;
alter table order_details add constraint odetail_pk primary key (order_detail_no);

drop table tbl_member purge;
create table tbl_member (
  member_id varchar2(20),
  member_pw varchar2(10) not null,
  member_nm varchar2(100) not null,
  responsibility varchar2(10) default 'User',
  phone varchar2(20),
  creation_date date default sysdate
);
insert into tbl_member (member_id, member_pw, member_nm)
values('user01','1111','User1');
insert into tbl_member (member_id, member_pw, member_nm)
values('user02','1111','User2');
insert into tbl_member (member_id, member_pw, member_nm)
values('user03','1111','User3');
insert into tbl_member (member_id, member_pw, member_nm, responsibility)
values('user04','1111','User4', 'Admin');

select *
from tbl_member;

--git form����.
select /*+ INDEX_DESC(tbl_board SYS_C0031805) */
*
from tbl_board
where board_no > 0;

update tbl_board
set writer = case mod(board_no, 4) when 0 then 'user0'
                                   when 1 then 'user1'
                                   when 2 then 'user2'
                                   else 'user3'
             end
where board_no > 0;

select /*+ FULL(tbl_board) */
rownum rn, board_no, title
from tbl_board
where board_no > 0
order by board_no;

select rn, board_no, title, content
from (
    select /*+ INDEX_DESC(tbl_board SYS_C0031805) */
    rownum rn, board_no, title, content
    from tbl_board
    where rownum <= 20
) where rn > 10;

--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
--������ �ֱ�.
insert into tbl_board (board_no, title, content, writer)
select board_seq.nextval, title, content, writer from tbl_board;
select count(*) from tbl_board;

insert into tbl_board (board_no, title, content, writer)
values(board_seq.nextval, 'title'||board_seq.currval, 'content'||board_seq.currval, 'writer'||board_seq.currval);

select * from tbl_board order by 1 desc;

delete from tbl_board where board_no > 500;

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
insert into tbl_reply 
values(reply_seq.nextval, 3813048, 'test reply', 'user01', sysdate);

--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
-- book_info table.
drop table book_info purge;
create table BOOK_INFO (
 book_code varchar2(20) primary key,
 book_title varchar2(300),
 book_author varchar2(500),
 book_press varchar2(50),
 book_price number
);
alter table book_info add (book_desc varchar2(1000));
insert into book_info values('B0001', '��������������ö��', '��ö��','�̾߱�',21000, '��������������ö�� ���� ����ֽ��ϴ�');
insert into book_info values('B0002', '����ö�иŴ�', '��ö��','����Ÿ����',23000, '����ö�иŴ� ���� ����ֽ��ϴ�');
insert into book_info values('B0003', 'ȣ���������Ǹ���', '��ױ۷θ�','�ڹ����ǻ�',15500, 'ȣ���������Ǹ��� ���� ����ֽ��ϴ�');
insert into book_info values('B0004', '�η��ǿ���', '������','�迵��',10000, '�η��ǿ��� ���� ����ֽ��ϴ�');
insert into book_info values('B0005', '��������Ե��ư��°�', '������','�׸���',22000, '��������Ե��ư��°� ���� ����ֽ��ϴ�');
insert into book_info values('B0006', '���������ذ��ǿ����̴�', 'Ȳ����','�ð���',11000, '���������ذ��ǿ����̴� ���� ����ֽ��ϴ�');

insert into book_file values(1, 'B0001', '��������������ö��.png', 'bookImages');
insert into book_file values(2, 'B0002', '����ö�иŴ�.png', 'bookImages');
insert into book_file values(3, 'B0003', 'ȣ���������Ǹ���.png', 'bookImages');
insert into book_file values(4, 'B0004', '�η��ǿ���.png', 'bookImages');
insert into book_file values(5, 'B0005', '��������Ե��ư��°�.png', 'bookImages');
insert into book_file values(6, 'B0006', '���������ذ��ǿ����̴�.png', 'bookImages');

-- book_file table.
create table book_file (
 file_no number primary key,
 book_code varchar2(50),
 book_image varchar2(50),
 book_path varchar2(50)
);

--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
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

select * from members order by 1;

alter table member rename column mail to email;
alter table members add (phone_number varchar2(20));
alter table members add (addr varchar2(100));

insert into members values('user6','1234','�����6','user6@email','User','member6.png',null,sysdate,'010-1111-2222','Daegu, jungangno-6');

select * from members order by 1;

delete from members where responsibility='User';
update members
set pfilename = 'admin1.png'
where pfilename is null;

select * from tbl_board order by 1 ;

--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
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
    select rownum rn, a.* 
    from (select n.*
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

select * from tbl_notice order by 1 desc;

delete from tbl_notice where notice_id = 484;
commit;

--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------

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

select * from center_info
order by id;
--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------

drop table genesis purge;
create table genesis (
 member_order varchar2(3) primary key,
 member_name varchar2(100),
 col1 char(1) default 'N',
 col2 char(1) default 'N',
 col3 char(1) default 'N',
 col4 char(1) default 'N',
 col5 char(1) default 'N',
 col6 char(1) default 'N',
 col7 char(1) default 'N',
 col8 char(1) default 'N',
 col9 char(1) default 'N',
 col10 char(1) default 'N',
 col11 char(1) default 'N',
 col12 char(1) default 'N',
 col13 char(1) default 'N',
 col14 char(1) default 'N',
 col15 char(1) default 'N'
);

select * from genesis
order by member_order;

update genesis   set col1 = 'Y'   where member_order = '1-1';
update genesis set col2 = 'Y' where member_order = '11';

---------------------------------------
create table cart (
	no number primary key,
	product_nm varchar2(50),
	price number,
	qty number
);

insert into cart values( 1, '�ڵ� ������', 45000, 3);
insert into cart values( 2, 'ȥ�� �ڹ�', 35000, 1);

commit;

