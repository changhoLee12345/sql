create table users(
id       varchar2(8) primary key,
password varchar2(8),
name     varchar2(20),
role     varchar2(5));

insert into users values('test','test123','관리자','Admin');
insert into users values('user1','user1','홍길동','User');
insert into users values('test','test123','관리자','Admin');
insert into users values('user1','user1','홍길동','User');

commit;

create table member (
 id varchar2(10) primary key,
 name varchar2(100) not null,
 passwd varchar2(10) not null,
 email varchar2(30) not null
);
insert into member values ('user1' ,'사용자1', '1234', 'user1@email');
