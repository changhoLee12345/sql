select * from tab;

select * from goods;

select * from members;

select * from category;

select * from boards;

insert into boards (bbsnum,title,contents,ref,user_no,reg_date,readcount,re_step,password_yn,prod_no)
 values(BOARDS_SEQ.nextval,'test','test',Boards_seq.currval,'user1',sysdate,0,0,nvl(null,'n'),'P202112001');
 
select BOARDS_SEQ.nextval from dual; 