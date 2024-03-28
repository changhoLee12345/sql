-------------------------------------------------------
-- spring jdbc user security --
drop table users purge;
create table users (
 username varchar2(50) not null primary key,
 password varchar2(50) not null,
 enabled char(1) default '1');
 
create table authorities (
 username varchar2(50) not null,
 authority varchar2(50) not null,
 constraint fk_authorities_users foreign key(username) references users(username)
);

create unique index ix_auth_username on authorities(username, authority);

insert into users (username, password) values('user00', 'pw00');
insert into users (username, password) values('member00', 'pw00');
insert into users (username, password) values('admin00', 'pw00');

insert into authorities (username, authority) values('user00', 'ROLE_USER');
insert into authorities (username, authority) values('member00', 'ROLE_MANAGER');
insert into authorities (username, authority) values('admin00', 'ROLE_MANAGER');
insert into authorities (username, authority) values('admin00', 'ROLE_ADMIN');

select * from users;
select * from authorities;

-------------------- user table 을 사용하기 ----------------------------
drop table tbl_member purge;
create table tbl_member (
 userid varchar2(50) not null primary key,
 userpw varchar2(100) not null,
 username varchar2(100) not null,
 regdate date default sysdate,
 updatedate date default sysdate,
 enabled char(1) default '1');

drop table tbl_member_auth purge;
create table tbl_member_auth (
 userid varchar2(50) not null,
 auth varchar2(50) not null,
 constraint fk_member_auth foreign key(userid) references tbl_member(userid)
);

select * from tbl_member;
select * from tbl_member_auth;

select mem.userid, userpw, username, enabled, regdate, updatedate, auth
from   tbl_member mem
left outer join tbl_member_auth auth
on mem.userid = auth.userid
where mem.userid = 'user5';

create table persistent_logins (
 username varchar(64) not null,
 series varchar(64) primary key,
 token varchar(64) not null,
 last_used timestamp not null);

select * from hr.employees;


------------------------------------ jsp 수업용 테이블 및 데이터 생성.
--사원정보 테이블.
create table employee (
 emp_no number primary key, -- 사원번호
 emp_name varchar2(50) not null, --사원명
 email varchar2(30) not null, --이메일
 phone varchar2(10) not null, --연락처
 hire_date date default sysdate, --입사일자
 salary number default 100,
 department varchar2(30) not null, --부서
 create_date date default sysdate
);

insert into employee (emp_no, emp_name, email, phone, salary, department, hire_date)
values(108, '홍길동', 'hong@mail.com', '234-5678', 200, '인사', to_date('2023-01-05', 'yyyy-mm-dd'));
insert into employee (emp_no, emp_name, email, phone, salary, department)
values(102, '김사원', 'kim@mail.com', '234-5679', 300, '총무');
insert into employee (emp_no, emp_name, email, phone, salary, department)
values(103, '최주임', 'choi@mail.com', '234-5978', 400, '개발');

select * from employee;

update employee
set salary = salary + 50
where emp_no = 101;

select *
from employee
--where department = '인사'
order by 1 desc
;

select department, count(*) from employee
group by department
; --78건.

delete from employee where emp_no = 208;

insert into employee(emp_no
           ,emp_name
           ,email
           ,phone
           ,hire_date
           ,salary
           ,department)
select emp_no+100 --(select max(emp_no)+1 from employee)
           ,emp_name
           ,email
           ,phone
           ,hire_date
           ,salary
           ,department
from employee; -- 30건 이상 데이터 생성.

--페이징. 페이지당 5개씩 출력.
--78건 > 16페이지
-- 1페이지: 5건, 사원번호 기준으로..
-- 1page: 1 ~ 5, 2page: 6 ~ 10
select emp_no
      ,emp_name
      ,email
      ,phone
      ,hire_date
      ,salary
      ,department
from (select rownum rn, a.*
      from (select *
            from employee
            where department = nvl(:dept, department)
            order by emp_no) a ) b
where b.rn > (:page -1 ) * 5 and b.rn <= (:page)*5;


select * from employee
where department = nvl('개발', department) ;

select rn 
      ,emp_no
      ,emp_name
      ,email
      ,phone
      ,hire_date
      ,salary
      ,department
from (select /*+ INDEX_DESC(e SYS_C008368) */ 
      rownum rn, e.*
      from employee e
      where rownum <= 10) a
where rn > 0;

drop table tbl_board purge;
create table tbl_board (
 board_no number,
 title varchar2(50) not null,
 content varchar2(300) not null,
 writer varchar2(20) not null,
 view_cnt number default 0,
 create_date date default sysdate
);
alter table tbl_board add constraint board_pk primary key (board_no);
alter table tbl_board add update_date date default sysdate;

create sequence board_seq;

insert into tbl_board(board_no, title, content, writer)
values(board_seq.nextval, 'title11', 'content1', 'user01');
insert into tbl_board(board_no, title, content, writer)
values(board_seq.nextval, 'test1', 'nice content 1', 'user02');
insert into tbl_board(board_no, title, content, writer)
values(board_seq.nextval, 'good', 'good content', 'user03');
insert into tbl_board(board_no, title, content, writer)
values(board_seq.nextval, 'every', 'every content', 'user01');


insert into tbl_board (board_no, title, content, writer)
select board_seq.nextval, title||board_seq.currval, content||board_seq.currval, writer
from tbl_board;

select board_no
      ,title
      ,content
      ,writer
      ,view_cnt
      ,create_date
      ,update_date
from (select /*+ INDEX(b board_pk)*/
      rownum rn, b.* 
      from tbl_board b
      where writer = nvl(:writer, writer)
      and   title like '%'||:title||'%'
      and   rownum <= :page * 5
      ) a
where rn > (:page - 1) * 5;

select board_no
      ,title
      ,content
      ,writer
      ,view_cnt
      ,create_date
      ,update_date
from (select /*+ INDEX(b board_pk)*/
      rownum rn, b.* 
      from tbl_board b
      where title like 'test%' or writer like 'test%'
      and   rownum <= :page * 5
      ) a
where rn > (:page - 1) * 5;


select count(*)
from tbl_board;

commit;

select * from tbl_board
order by 1 desc;

delete from tbl_board
where board_no in (9, 23, 12);


create table tbl_member (
 id varchar2(10) primary key,
 pw varchar2(10) not null,
 name varchar2(100) not null,
 auth varchar2(10) default 'user'
);

insert into tbl_member(id, pw, name) values ('user01', '1111', '홍길동');
insert into tbl_member(id, pw, name) values ('user02', '1111', '김민규');
insert into tbl_member(id, pw, name, auth) values ('admin', '1111', '관리자', 'admin');

commit;

select * from tbl_member;

select * from tab;

drop table tbl_reply purge;
create table tbl_reply (
 reply_no number,
 board_no number not null,
 reply varchar2(100) not null,
 replyer varchar2(20) not null,
 reply_date date default sysdate
);

alter table tbl_reply add constraint reply_pk primary key (reply_no);

create sequence reply_seq;

insert into tbl_reply (reply_no, board_no, reply, replyer)
values(reply_seq.nextval, 157, 'reply test', 'user03');
insert into tbl_reply (reply_no, board_no, reply, replyer)
values(reply_seq.nextval, 157, 'reply test2', 'user02');
insert into tbl_reply (reply_no, board_no, reply, replyer)
values(reply_seq.nextval, 157, 'reply test3', 'user01');

insert into tbl_reply (reply_no, board_no, reply, replyer)
select reply_seq.nextval, 157, '157 reply', replyer
from tbl_reply;

select * from tbl_reply
where 1=1--board_no != 157
order by 1 desc;

select board_no, count(*) 
from tbl_reply
where 1=1--board_no = 521
group by board_no
;

update tbl_reply
set board_no = 521;

select rn
      ,reply_no
      ,reply
      ,replyer
      ,reply_date
      ,board_no
from (select /*+ INDEX_DESC(r reply_pk)*/rownum rn
            ,r.*
      from tbl_reply r
      where board_no = :bno
      and   rownum <= :page * 5) a
where a.rn > (:page - 1) * 5;

select /*+ INDEX_DESC(r reply_pk)*/rownum rn
    ,r.*
    ,to_char(r.reply_date,'yyyy-mm-dd hh24:mi:ss')
from tbl_reply r
where board_no = 521;

create table tbl_center (
 id number,
 center_name varchar2(200),
 sido varchar2(100)
);

select * from tbl_center
order by 1;

------------------------
create table cart (
	no number primary key,
	porduct_nm varchar2(50),
	price number,
	qty number
);

insert into cart values( 1, '코드 스프링', 45000, 3);
insert into cart values( 2, '혼자 자바', 35000, 1);

commit;


  --drop table pet;
  --drop table adopt;
  create table pet(
    id number primary key,
    name varchar2(50),
    picture varchar2(100),
    age number,
    breed varchar2(100),
    location varchar2(100)
  );
  
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

insert into adopt values (1, 100);
insert into adopt values (3, 200);

commit;

select * from pet;
select * from adopt;

create table todo (
	no number primary key,
	contents varchar2(100),
	todoyn char(1) default '0'
);

insert into todo values(1, 'java', '1');
insert into todo values(2, 'html', '1');
insert into todo values(3, 'javascript', '0');
insert into todo values(4, 'spring', '0');

commit;

create table users(
id       varchar2(8) primary key,
password varchar2(8),
name     varchar2(20),
role     varchar2(5));

insert into users values('test','test123','관리자','Admin');
insert into users values('user1','user1','사용자','User');

commit;






