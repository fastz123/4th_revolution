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

select cust_id,cust_nm,cust_birth,sales_amt from perf order by sales_amt desc;

2. 고객 연령과 방문횟수를 비교하시오

3. 방문횟수가 가장 많은 고객의 이름을 출력하시오

4. 1980년 이전 출생한 고객을 출력하시오.

5. 평균 방문횟수, 평균구입금액, 평균 구입상품 수를 구하시오

6. 방문 당 구매금액이 가장 큰 고객의 이름을 구하시오