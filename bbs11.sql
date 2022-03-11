create table member (
    member_id varchar2(30) primary key,
    member_name varchar2(50),
    member_password varchar2(50),
    member_address varchar2(100)
);

create table notice (
    id number primary key,
    title varchar2(100),
    content varchar2(300),
    wdate date,
    hit number
);

drop table bbs purge;
create table bbs(
    bbs_id number primary key,
    bbs_title varchar2(100),
    bbs_content varchar2(300),
    bbs_writer varchar2(100),
    bbs_create_date date,
    bbs_hit number,
    bbs_image varchar2(100)
);

create sequence bbs_id_seq;

select * from cart;
drop table cart purge;
create table cart (
	no number primary key,
	product_nm varchar2(50),
	price number,
	qty number
);


insert into cart values( 1, '코드 스프링', 45000, 3);
insert into cart values( 2, '혼자 자바', 35000, 1);
insert into cart values( 3, '혼자 자바3', 35000, 1);
insert into cart values( 4, '혼자 자바4', 35000, 1);

commit;
  --drop table pet;
  --drop table adopt;
  create table pet(
    id number primary key,
    name varchar2(50),
    picture varchar2(100),
    age number,
    breed varchar2(100),
    --price number default 1000,
    location varchar2(100)
  );
  
  alter table pet add price number default 1000;
  
  create table adopt(
  	id number primary key,
  	price number
  );

insert into pet values( 0, 'Frieda','resources/images/scottish-terrier.jpeg', 3, 'Scottish Terrier','Lisco, Alabama');
insert into pet values( 1, 'Gina','resources/images/scottish-terrier.jpeg', 3, 'Scottish Terrier','Tooleville, West Virginia');
insert into pet values( 2, 'Collins','resources/images/french-bulldog.jpeg', 2, 'French Bulldog','Freeburn, Idaho');
insert into pet values( 3, 'Melissa','resources/images/boxer.jpeg', 2, 'Boxer','Camas, Pennsylvania');
insert into pet values( 4, 'Jeanine','resources/images/french-bulldog.jpeg', 2,'French Bulldog','Gerber, South Dakota');
insert into pet values( 5, 'Elvia','resources/images/french-bulldog.jpeg',3, 'French Bulldog','Innsbrook, Illinois');
insert into pet values( 6, 'Latisha','resources/images/golden-retriever.jpeg', 3, 'Golden Retriever','Soudan, Louisiana');
insert into pet values( 7, 'Coleman','resources/images/golden-retriever.jpeg', 3, 'Golden Retriever','Jacksonwald, Palau');
insert into pet values( 8, 'Nichole','resources/images/french-bulldog.jpeg', 2, 'French Bulldog','Honolulu, Hawaii');
insert into pet values( 9, 'Fran','resources/images/boxer.jpeg', 3, '"Boxer','Matheny, Utah');
insert into pet values( 10, 'Leonor','resources/images/boxer.jpeg',2,  'Boxer','Tyhee, Indiana');
insert into pet values( 11, 'Dean','resources/images/scottish-terrier.jpeg', 3, 'Scottish Terrier','Windsor, Montana');
insert into pet values( 12, 'Stevenson','resources/images/french-bulldog.jpeg', 3,'French Bulldog','Kingstowne, Nevada');
insert into pet values( 13, 'Kristina','resources/images/golden-retriever.jpeg', 4, 'Golden Retriever','Sultana, Massachusetts');
insert into pet values( 14, 'Ethel','resources/images/golden-retriever.jpeg', 2, 'Golden Retriever','Broadlands, Oregon');
insert into pet values( 15, 'Terry','resources/images/golden-retriever.jpeg', 2, 'Golden Retriever','Dawn, Wisconsin');
-- price column 추가.
update pet set price = (id+1) * 1000;

insert into adopt values (1, 100);
insert into adopt values (3, 200);

commit;

select * from pet;
select * from adopt;
delete from adopt where price = 9000;
commit;

create table todo (
	no number primary key,
	contents varchar2(100),
	todoyn char(1) default '0'
);

insert into todo values(1, 'java', '1');
insert into todo values(2, 'html', '1');
insert into todo values(3, 'javascript', '0');
insert into todo values(4, 'spring', '0');

create table users(
id       varchar2(8) primary key,
password varchar2(8),
name     varchar2(20),
role     varchar2(5));

insert into users values('admin','test','관리자','Admin');
insert into users values('user1','test','사용자1','User');
insert into users values('user2','test','사용자2','User');
insert into users values('user3','test','사용자3','User');
insert into users values('user4','test','사용자4','User');


commit;
select * from users
order by 1;

delete from users where role = 'user';
