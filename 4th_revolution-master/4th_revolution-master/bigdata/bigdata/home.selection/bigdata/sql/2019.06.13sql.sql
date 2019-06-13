
SELECT * FROM shopdb.membertbl;
use employees; 
show tables;
select * from dept_manager;
use shopdb;
select membername, memberaddress from membertbl;
select * from membertbl where membername='지운이';
show databases;
select * from membertbl;
create table test (id int);
show tables;
create table test1 ( id int, address char);
show tables;
select * from test1;
insert into test values (1);
select * from test;
insert into test (id) values (1);
insert into test1 (id, address) values (3, 's');
select * from test1;

use employees;
select * from shopdb.membertbl;
show tables;
select * from titles;
select first_name, last_name, gender -- 이름과 열을 가지고 옴.
from employees;

/*
select * from titles;
*/

show databases;
use employees;
show tables;
show table status;

describe employees;
select first_name, gender from employees;
select first_name as 이름, gender as 성별 from employees;

drop database if exists sqldb;
create database sqldb;
show databases;
use sqldb;
create table usertbl
( userid char(8) not null primary key,
 name varchar(10) not null,
 birthyear int not null,
 addr char(2) not null,
 mobile1 char(3),
 mobile2 char(8),
 height smallint,
 mdate date);
 
 show tables;
 
 create table buytbl (
 num int auto_increment not null primary key,
 userid char(8) not null,
 prodname char(6) not null,
 groupname char(4),
 price int not null,
 amount smallint not null,
 foreign key (userid) references usertbl(userid));

insert into usertbl values('LSG','이승기',1987,'서울','011','1111111',182,'2008-8-8');
insert into usertbl values('KBS','김범수',1979,'경남','011','2222222',173,'2012-4-4');
insert into usertbl values('KKH','김경호',1971,'전남','019','3333333',177,'2007-7-7');
insert into usertbl values('JYP','조용필',1950,'경기','011','4444444',166,'2009-4-4');
insert into usertbl values('SSK','성시경',1979,'서울',null,null,186,'2013-12-12');
insert into usertbl values('LJB','임재범',1963,'서울','016','6666666',182,'2009-9-9');
insert into usertbl values('YJS','윤종신',1969,'경남',null,null,170,'2005-5-5');
insert into usertbl values('EJW','은지원',1972,'경북','011','8888888',174,'2014-3-3');
insert into usertbl values('JKW','조관우',1965,'경기','018','9999999',172,'2010-10-10');
insert into usertbl values('BBK','바비킴',1973,'서울','010','0000000',176,'2013-5-5');

select * from usertbl;

insert into buytbl values(null, 'KBS', '운동화', null, 30, 2);
insert into buytbl values(null, 'KBS', '노트북', '전자', 1000, 1);
insert into buytbl values(null, 'JYP', '모니터', '전자', 200, 1);
insert into buytbl values(null, 'BBK', '모니터', '전자', 200, 5);
insert into buytbl values(null, 'KBS', '청바지', '의류', 50, 3);
insert into buytbl values(null, 'BBK', '메모리', '전자', 80, 10);
insert into buytbl values(null, 'SSK', '책', '서적', 15, 5);
insert into buytbl values(null, 'EJW', '책', '서적', 15, 2);
insert into buytbl values(null, 'EJW', '청바지', '의류', 30, 2);
insert into buytbl values(null, 'BBK', '운동화', null, 30, 2);
insert into buytbl values(null, 'EJW', '책', '서적', 15, 1);
insert into buytbl values(null, 'BBK', '운동화', null, 30, 2);

select * from buytbl;

select * from buytbl where price>50;

use sqldb;
show tables;

select * from usertbl where name='김경호';
select * from usertbl where birthyear>'1970' and height>=182;
select * from usertbl where height>=180 and height<=182;
select * from usertbl where addr='전남' or addr='경북' or addr='경남';
select name,height from usertbl where name like '김%';
select name,height from usertbl where name like '_종신';
select name,height from usertbl where height>177;
select name,height from usertbl where (height > (select height from usertbl where name='김경호'));
select name,height from usertbl where (height > all(select height from usertbl where addr='경남'));
select name,height from usertbl where (height > any(select height from usertbl where addr='경남'));
select * from usertbl where (height = any(select height from usertbl where addr='경남'));
select * from usertbl where (height in (select height from usertbl where addr='경남'));

select name,mdate from usertbl order by mdate;

select name,height from usertbl order by name,height desc;

select distinct addr from usertbl;

use employees;
select emp_no,hire_date from employees order by hire_date;

select emp_no from employees order by hire_date limit 5;
use sqldb;
create table buytbl2(
select * from buytbl
);

select * from buytbl2;
#group by
select userid,sum(amount) from buytbl group by userid;
select userid as 아이디, sum(amount) as 총구매개수 from buytbl group by userid;

select userid 아이디, avg(amount) 구매량평균 from buytbl group by userid;

select * from buytbl;

select userid 아이디, sum(amount*price) 총구매금액 from buytbl group by userid order by 총구매금액;

select max(height) 최대키 ,min(height) 최소키 from usertbl;

#가장키큰사람이름과 키 뽑기
select name,height from usertbl where height = (select max(height) from usertbl) or height = (select min(height) from usertbl);
select name,height from usertbl where height in ((select max(height) from usertbl),(select min(height) from usertbl));

select name,height from usertbl where height = (select max(height) from usertbl) or height = (select min(height) from usertbl);

select count(*) from usertbl;
select count(*) from usertbl where mobile1 is not null and mobile2 is not null;
select count(mobile1) from usertbl;
#아이디별 총 구매금액
select userid,sum(amount*price) as tm from buytbl group by userid;
#아이디별 총 구매금액이 1000 이상인 데이터 // group by시 조건은 having으로 해주어야함
select userid,sum(amount*price) as  tm from buytbl group by userid having tm>1000;

create table testtbl1 (id int,username char(3), age int);
show tables;

drop table testtbl1;

insert into testtbl1 values(1, '홍길동', 25);
insert into testtbl1(id,username) values (2,'설현');
insert into testtbl1(username,age,id) values('초아',26,3);
select * from testtbl1;

create table testtbl2(
id int auto_increment primary key,
username char(3),
age int
);

insert into testtbl2 values(null,'지민',25);
insert into testtbl2 values(null,'유나',22);
insert into testtbl2 values(null,'유경',21);

select * from testtbl2;

use sqldb;
create table testtbl5(
select emp_no,first_name,last_name from employees.employees
);

select * from testtbl5;

create table testtbl4(
id int, fname varchar(50), lname varchar(50)
);

insert into testtbl4
select emp_no,first_name,last_name
from employees.employees;


#데이터 수정

select * from testtbl4 where fname='Parto';
update testtbl4 set lname='없음' where fname='Parto';

select * from buytbl;

update buytbl set price = price*1.5;
update buytbl set price = price*1/1.5;

#데이터 삭제
select * from testtbl4 where fname='Aamer';
delete from testtbl4 where fname='Aamer';

select count(*) from testtbl4 where fname='Parto';
delete from testtbl4 where fname='Parto' limit 100;

/*--------------------------------2019-06-13--------------------------------------------*/


create database webdb;
use webdb;
show databases;

create table pet(
name varchar(20),
owner varchar(20),
species varchar(20),
sex char(1),
birth date,
death date
);
show tables;

drop table pet;

insert into pet values('Fluffy','Harold','cat','f','1999-02-04',null);
load data local infile 'C:/Users/user/pet_table.txt' into table pet;

select * from pet;

select * from pet where name='Bowser';
select * from pet where birth >= '1998-01-01';
select * from pet where species='dog' and sex='f';
select * from pet where species='snake' or species='bird';
select name,birth from pet;
select name,birth from pet order by birth;
select name,birth from pet order by birth desc;
select name from pet where death is not null;
select name from pet where death is null;
set sql_safe_updates=0;
update pet set death=null where death='0000-00-00';
select * from pet where name like 'b%';
select * from pet where name like '%fy';

select * from pet where name like '%w%';

select * from pet where name like '_____';
select * from pet where name regexp '^b';
select * from pet where name regexp 'fy$';
select *from pet;
#drop table pet;

update pet set species='dog' where name='claws';
update pet set species='pig' where birth<'1990-01-01'
