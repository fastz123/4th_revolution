create database webdb;
use webdb;
show databases;
show tables;

create table pet (
name varchar(20),
owner varchar(20),
species varchar(20),
sex char(1),
birth date,
death date);

show tables;

drop table pet;

insert ignore into pet values ('Claws', 'Gwen','cat', 'm', '1994-03-17', null);
insert ignore into pet values ('Buffy', 'Harold','dog', 'f', '1989-05-13', null);
insert ignore into pet values ('Fang', 'Benny','dog', 'm', '1990-08-27', null); 
insert ignore into pet values ('Bowser', 'Diane','dog', 'm', '1979-08-31', '1995-17-29'); 
insert ignore into pet values ('Chirpy', 'Gwen','bird', 'f', '1998-09-11', null); 
insert ignore into pet values ('Whistler', 'Gwen','bird','m' '1997-12-09', null);
insert ignore into pet values ('Slim', 'Benny','snake', 'm', '1996-04-29', null); 
 
 select * from pet;
load data local infile '‪C:/Temp/pettb.txt' into table pet;

select * from pet;

select * from pet where name ='Bowser';

select * from pet where birth >= '1998-01-01';

select * from pet where species = 'dog' and sex = 'f';

select * from pet where species = 'snake' or species='bird';

select name, birth from pet;

select name, birth from pet order by birth;

select name, birth from pet order by birth desc;

select name from pet where death is not null;

select name from pet where death is null;

select * from pet where name like 'b%';

select * from pet where name like '%fy';

select * from pet where name like '%w%';

select * from pet where name like '_____';

select * from pet where name regexp '^b';

select * from pet where name regexp 'fy$';

select count(*) from pet;
select * from pet;
update pet set species='dog' where name='claws';
select * from pet;

set sql_safe_updates = 0;

update pet set species = 'pig' where birth < '1990-01-01';
select * from pet;

use sqldb;
select name, height from usertbl where name like '_종신';

select name, height from usertbl where height > 177;

-- 김경호 보다 키가 큰 사람들..

select name, height from usertbl 
	where height > (select height from usertbl
					where name='김경호');
                    
-- 주소가 경남인 사람의 키 보다 큰 사람들.. 이름, 키..

select name, height from usertbl
	where height > (select height from usertbl 
                    where addr='경남');
                    
select name, height from usertbl
	where height > all(select height from usertbl 
                    where addr='경남');

select name, height from usertbl
	where height > any(select height from usertbl 
                    where addr='경남');
                    
--  경남에 거주하는 사람의 키와 동일한 사람들(키, 이름)..

select name, height from usertbl
	where height in (select height from usertbl
				where addr='경남');
                
select * from usertbl;

-- 이름과 가입일자 출력/ 가입일자 기준 오름차순정렬

select name, mdate from usertbl order by mdate;

select name, mdate from usertbl order by mdate desc;

select name, height from usertbl 
		order by name asc , height desc;
        
-- 주소가 중복되지 않는 
use sqldb;
select distinct addr from usertbl;

/*
-- employee db에서 employee table의 emp_no, 
-- hire_date를 출력하되 hire_date 오름차순으로 */

show databases;
use employees;
select emp_no, hire_date from employees
	order by hire_date asc;
    
-- 입사시기가 가장 오래된 5명, emp_no, hire_date
select emp_no, hire_date from employees
	order by hire_date asc limit 5;
    
select emp_no, hire_date from employees
	order by hire_date asc limit 10, 10;

use sqldb;
create table buytbl2 (select * from buytbl);
select * from buytbl2;
show tables;

create table buytbl3 (select userid, 
              prodname from buytbl);
select * from buytbl3;

select * from buytbl;
select * from usertbl;

-- group by
select userid, sum(amount) from buytbl 
		group by userid;
        
-- 칼럼명을 아이디, 총구매개수
select userid 아이디, sum(amount) 총구매개수
    from buytbl group by userid;
    
select userid 아이디, avg(amount) 평균구매개수
	from buytbl group by userid;
    
select * from buytbl;

select userid 아이디, sum(amount*price) 총구매금액
	from buytbl group by userid;
    
select userid 아이디, sum(amount*price) 총구매금액
	from buytbl group by userid order by 총구매금액;
    
select max(height), min(height) from usertbl;

select name, height from usertbl where
	height = (select max(height) from usertbl) or
    height = (select min(height) from usertbl);
    
select name, height from usertbl where
	height in ((select max(height) from usertbl),
    (select min(height) from usertbl));

select count(*) from usertbl;

select count(*) as 전화번호등록자수  from usertbl 
         where mobile1 is not null;
         
select count(mobile1) as 전화번호등록자수 
	from usertbl;
         



select * from usertbl;
/*
1. 아이디별별 총구매금액 
2. 아이디별 총구매금액이 1000 이상인 데이터*/
select * from buytbl;

select userid, sum(price*amount) as tm 
from buytbl group by userid;

select userid, sum(price*amount) as tm
from buytbl
group by userid
having tm > 1000;
-- group by 시 조건은 having ( where는 안 됨)

select userid, sum(price*amount) as tm
from buytbl
group by userid
having tm > 1000
order by tm;
;
    
-- table 조작

-- testtbl1: id(int), username(char(3)), age(int)

use sqldb;

create table testtbl1 (id int, username char(3)
 , age int);
 
insert into testtbl1 values (1, '홍길동', 25);
insert into testtbl1(id, username) 
				values (2, '설현');
insert into testtbl1(username, age, id) 
     values ('초아', 26, 3);

select * from testtbl1;

create table testtbl2(
id int auto_increment primary key,
username char(3),
age int);

insert into testtbl2 values (null, '지민', 25);
insert into testtbl2 values (null, '유나', 22);
insert into testtbl2 values (null, '유경', 21);
select * from testtbl2;

use sqldb;

-- 대량 데이터 테이블 생성
create table testtbl5
   (select emp_no, first_name, last_name 
   from employees.employees);
   
create table testtbl4(
id int, fname varchar(50), lname varchar(50));
insert into testtbl4 
select emp_no, first_name, last_name
from employees.employees;

-- 데이터 수정

select * from testtbl4 where fname='Parto';

update testtbl4
set lname = '없음'
where fname='Parto';

use sqldb;
select * from buytbl;

update buytbl set price = price*1.5;
select * from buytbl;

-- 데이터 삭제
select * from testtbl4 where fname='Aamer';
delete from testtbl4 where fname='Aamer';

select count(*) from testtbl4 where fname='Parto';
delete from testtbl4 where fname='Parto' limit 100;