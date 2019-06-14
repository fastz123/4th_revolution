select cast('2020-10-19 12:35:29.123' AS date ) as 'Date';
select cast('2020-10-19 12:35:29.123' as time) as time;
select cast('2020-10-19 12:35:29.123' as datetime) as datetime;

use sqldb;
set @myVar1 = 5;
set @myVar2 = 3;
set @myVar3 = 4.25;
set @myVar4 = '가수 이름==>';

select @myVar1;
select @myVar2+@myVar3;

select @myVar4, Name from usertbl Where height>180;
set @myVar1 = 3;
prepare myquery	from 'select name, height from usertbl order by height Limit ?';
Execute myquery using @myVar1;

use sqldb;

select avg(amount) as '평균 구매 개수' from buytbl;
select cast(avg(amount) as signed integer) as '평균구매개수' from buytbl;

select cast('2020$12$12' as date);
select cast('2020/12/12' as date);
select cast('2020%12%12' as date);

SELECT num, CONCAT(CAST(price AS CHAR(10)), 'X', CAST(amount AS CHAR(4)) ,'=' ) AS '단가X수
량',price*amount AS '구매액' FROM buyTbl ;

CREATE TABLE PERF
(
	CUST_ID CHAR(5) PRIMARY KEY NOT NULL,
	CUST_NM CHAR(10) NOT NULL,
	CUST_BIRTH DATE,
	VISIT_CNT DECIMAL(15,0),
	SALES_AMT DECIMAL(15,0),
	SALES_CNT DECIMAL(15,0)
);

INSERT INTO PERF VALUES ('56456', '모형건', '1982-01-24', 123, 3700000, 24);
INSERT INTO PERF VALUES ('65412', '이상훈', '1984-05-10', 23, 467200, 14);
INSERT INTO PERF VALUES ('23472', '이상희', '1978-02-27', 117, 2237065, 23);
INSERT INTO PERF VALUES ('27896', '모영길', '1982-05-11', 37, 123721, 2);
INSERT INTO PERF VALUES ('35478', '강주혁', '1983-09-10', 86, 830000, 30);
INSERT INTO PERF VALUES ('78693', '이선우', '1977-07-07', 103, 1789023, 7);

select * from perf;

#1. 고객 구매금액을 기준으로 내림차순으로 정렬해서 이름, 아이디, 생년월일, 총구매금액을 출력하시오

select cust_nm,cust_id,cust_birth,sales_amt from perf order by sales_amt;

#2. 고객 연령과 방문횟수를 비교하시오


#3. 방문횟수가 가장 많은 고객의 이름을 출력하시오

select cust_nm from perf where VISIT_CNT= (select max(visit_cnt) from perf);

#4. 1980년 이전 출생한 고객을 출력하시오.

select * from perf where cust_birth<'1980-01-01';

#5. 평균 방문횟수, 평균구입금액, 평균 구입상품 수를 구하시오

select avg(VISIT_CNT),avg(SALES_AMT),avg(SALES_CNT) from perf;

# 6. 방문 당 구매금액이 가장 큰 고객의 이름을 구하시오

select cust_nm from perf where (SALES_AMT/SALES_CNT) = (select max(sales_amt/SALES_CNT) from perf);
