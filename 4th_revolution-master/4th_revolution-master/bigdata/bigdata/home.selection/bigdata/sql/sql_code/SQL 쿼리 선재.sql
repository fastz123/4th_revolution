SELECT * FROM shopdb.membertbl;
-- shopdb를 불러오기
use employees;
-- employees DB 활성화
show tables;
-- 큰 범위의 data 종류를 보여주는 명령어(show)
select * from dept_manager;
-- dept_manager 불러오기
use shopdb;
-- shopdb 활성화(작업중인 DB를 이동시 입력)
select membername, memberaddress from membertbl;
-- membertbl의 membername, memberaddress column을 가져오기
select * from membertbl where membername = '지운이';
-- membertbl 에서 membername = '지운이' 인 raw 출력

show databases;
-- database 종류 출력

select * from membertbl;
-- membertbl 출력
create table test(id int);
-- 이름이 test이고 column이 int인 table을 만들기
show tables;
-- test table 확인
create table test1 (id int, address char);
show tables;
select * from test1;
show test1;
-- show는 특정 table 출력 불가능

insert into test values(1);
insert into test (id) values(2);
insert into test1 (id, address) values (3, 's');
-- test table에 values 값 추가(default = values 값 안의 순차대로 입력)
select * from test;
select * from test1;

use employees;
select * from shopdb.membertbl;
-- employees를 사용하고 있지만 다른 DB의 정보에 접근하기
show tables;
select * from titles;
select first_name, last_name, gender from employees;

/*
select * from titles;
블록 주석 만들기
*/

show databases;
use employees;
show tables;
show table status;
-- table data 확인 like info()

describe employees;
-- 특정 table 에 대한 구조 확인
select first_name, gender from employees;
select first_name 이름, gender 성별 from employees;
-- employees table의 first_name과 gender column의 이름을 변경
select * from employees.employees;

drop database if exists sqldb;
create database sqldb;
show databases;
-- 새로운 DB 만들기

use sqldb;
create table usertbl 
( userid char(8) not null primary key, 
usename varchar(10) not null,
birthyear int not null,
addr char(2) not null,
mobile1 char(3), 
mobile2 char(8),
height smallint,
mdate date);
show tables;
select * from usertbl;

create table buytbl 
( num int auto_increment not null primary key,
userid char(8) not null,
prodname char(6) not null, 
groupname char(4),
price int not null,
amount smallint not null,
foreign key (userid) refErences usertbl(userid));
-- DB안에 usertbl 이라는 table을 만들고 column들의 성질을 결정
-- foreign key 다른 table의 column을 가져와서 auto_increment 에 대입
-- refErences = foreign key를 가져올 table 경로를 지정

insert into usertbl values('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8');
insert into usertbl values('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012-4-4');
insert into usertbl values('KKH', '김경호', 1971, '전남', '019', '3333333', 177, '2007-7-7');
insert into usertbl values('JYP', '조용필', 1950, '경기', '011', '4444444', 166, '2009-4-4');
insert into usertbl values('SSK', '성시경', 1979, '서울', NULL, NULL, 186, '2013-12-12');
insert into usertbl values('LJB', '임재범', 1963, '서울', '016', '6666666', 182, '2009-9-9');
insert into usertbl values('YJS', '윤종신', 1969, '경남', NULL, NULL, 170, '2005-5-5');
insert into usertbl values('EJW', '은지원', 1972, '경북', '011', '8888888', 174, '2014-3-3');
insert into usertbl values('JKW', '조관우', 1965, '경기', '018', '9999999', 172, '2010-10-10');
insert into usertbl values('BBK', '바비킴', 1973, '서울', '010', '0000000', 176, '2013-5-5');
select * from usertbl;
-- DELETE FROM `sqldb`.`usertbl` WHERE (`userid` = 'EJW');

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