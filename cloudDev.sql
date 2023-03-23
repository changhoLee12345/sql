select * from tab;

select * from tbl_notice order by 1;
select notice_id, to_char(notice_date, 'rrrr-mm-dd hh24:mi:ss') ndate from tbl_notice
order by notice_id;


select * from cart order by 1;

insert into cart values(3,'product3', 3000, 3);
insert into cart values(4,'product4', 4000, 4);
insert into cart values(5,'product5', 5000, 5);
insert into cart values(6,'product6', 6000, 6);

create table product (
 pd_id number primary key,
 pd_name varchar2(1000) not null,
 pd_price number,
 attribute1 varchar2(300)
);
insert into product values(1, '코드 스프링', 1000, null);
insert into product values(2, '혼자 자바', 2000, null);
insert into product values(3, 'product3', 3000, null);
insert into product values(4, 'product4', 4000, null);
insert into product values(5, 'product5', 4000, null);
insert into product values(6, 'product6', 4000, null);

select * from product;

create table sales (
 sales_no number primary key,
 sales_info varchar2(1000),
 sales_sum number
);
select * from sales;

select max(sales_no)+1 from sales;

create sequence orders_seq;
create table sale_orders (
 order_no number primary key,
 sales_no number not null,
 pd_id number not null,
 quantity number
);
select * from sale_orders;

insert into sales values(10001, 'total sale', 20000);

insert into sale_orders
select orders_seq.nextval, 10001, p.pd_id, c.qty from cart c join product p
on c.product_nm = p.pd_name
where no in (1,3,5);

select *
from sales s 
join sale_orders o 
on s.sales_no = o.sales_no
join product p
on o.pd_id = p.pd_id
where s.sales_no  = 10001;



