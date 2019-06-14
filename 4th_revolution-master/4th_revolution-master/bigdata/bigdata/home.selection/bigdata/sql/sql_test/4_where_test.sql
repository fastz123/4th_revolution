CREATE TABLE CARD_TRAN_201311
(
	CMF CHAR(4) PRIMARY KEY NOT NULL,
	PARTY_NM CHAR(10) NOT NULL,
	SEG CHAR(10) NOT NULL,
	PIF_AMT DECIMAL(15,0),
	INST_AMT DECIMAL(15,0),
	OVRS_AMT DECIMAL(15,0),
	CASH_AMT DECIMAL(15,0)
);

select coalesce(OVRS_AMT,0) from card_tran_201311 where party_nm='임하영';

INSERT INTO CARD_TRAN_201311 VALUES ('2356', '김아름', 'PB', 1234041,null , 1301710, null);
INSERT INTO CARD_TRAN_201311 VALUES ('4570', '이선우', 'MASS', null,null , 524560, null);
INSERT INTO CARD_TRAN_201311 VALUES ('4563', '홍지은', 'MASS', 213570, null,null , 3700000);
INSERT INTO CARD_TRAN_201311 VALUES ('3266', '윤일상', 'MASS', 89641, null,null ,null );
INSERT INTO CARD_TRAN_201311 VALUES ('8904', '이동건', 'PB', 1278960, 500000, null,null );
INSERT INTO CARD_TRAN_201311 VALUES ('4678', '최혜연', 'MASS', 4567780, null,null ,null );
INSERT INTO CARD_TRAN_201311 VALUES ('1746', '임하영', 'PB', 7836100, 3213400, null,null );
INSERT INTO CARD_TRAN_201311 VALUES ('3120', '김지철', 'PB', null,null ,null ,null );
INSERT INTO CARD_TRAN_201311 VALUES ('8974', '강성범', 'MASS', 655456, null,null ,null );
INSERT INTO CARD_TRAN_201311 VALUES ('3255', '김지연', 'MASS', 213, null,null ,null );
INSERT INTO CARD_TRAN_201311 VALUES ('8977', '김지현', 'PB', 1300,null , 54000, 100000);

select * from card_tran_201311;

#cmf - 고객번호, party_nm - 이름, seg - 고객등급, pif_amt - 일시불, inst_amt - 할부사용금액,
#ovrs_amt - 해외사용금액, cash_amt - 현금서비스

#coalesce함수 사용

#1. cmd, 이름, 총 사용금액을 총 사용금액 기준 내림차순으로 출력하시오

select cmf,party_nm,(coalesce(PIF_AMT,0)+coalesce(ovrs_amt,0)+coalesce(PIF_AMT,0))as 총사용금액 from card_tran_201311 order by  총사용금액 desc; 

#2. 신규 무이자 할부 카드의 홍보대상 고객을 추출하시오

select party_nm from card_tran_201311 where INST_AMT is not null;

#3. pb고객을 대상으로 일시불사용금액의 1%를 캐시백해주는 캠페인을 진행하면 누가 얼마의 금액을 받을 것인가

select Party_nm, pif_amt*0.01 as 일시불사용금액 from card_tran_201311 where SEG='PB';

#4. 고객 등급별 총사용 금액을 추출하고 총사용금액 기준 내림차순 정렬

select SEG,sum(coalesce(PIF_AMT,0)+coalesce(ovrs_amt,0)+coalesce(PIF_AMT,0))as 총사용금액 from card_tran_201311 group by SEG;

#5. 사용금액이 가장 많은 서비스는

select sum(PIF_AMT),sum(INST_AMT),sum(OVRS_AMT),sum(CASH_AMT) from card_tran_201311;

#6. 사용횟수가 가장 많은 서비스는
select count(PIF_AMT),count(INST_AMT),count(OVRS_AMT),count(CASH_AMT) from card_tran_201311;
#7. pb 고객이 가장 많이 사용한 서비스는

select count(PIF_AMT),count(INST_AMT),count(OVRS_AMT),count(CASH_AMT) from card_tran_201311 where SEG='PB';







create table purchase_tran (
id int,
purchase_amt int,
purchase_cnt int,
last_amt int,
last_cnt int);

insert into purchase_tran values 
(145, 2000000, 12, 1231000, 21),
(455, 1273100, 1, 2237230, 22),
(463, 111463, 3, 214047, 1),
(324, 154769, 3, 7474663, 13),
(568, 25786652, 47, 1000047, 3),
(662, 106868, 1, 277763, 1),
(871, 9694470, 123, 798874, 2),
(460, 65650000, 1200, 6557741, 320),
(277, 5766300, 470, 57663000, 444),
(309, 5579800, 415, 2333000, 135);

select * from purchase_tran;
 
#1. 올해 구매금액이 1백만원 이상인 고객의 고객번호와 올해 구매금액을 추출하시오.

select id,purchase_amt from purchase_tran where purchase_amt>1000000;

#2. 작년 구매금액이 1백만원 이상 5천만원 이하인 고객의 고객 번호와 작년 구매금액을 출력하시오.

select id,last_amt from purchase_tran where last_amt>1000000 and last_amt<50000000;

#3. 올해 구입건수가 작년 구입건수 보다 많은 고객들의 고객번호, 올해구입건수, 작년구입건수를 출력하고 올래구입건수를 기준으로 오름차순 정렬하시오.

select id, purchase_cnt,last_cnt from purchase_tran where purchase_cnt>last_cnt order by purchase_cnt;

#4. 올해 건당 구입금액을 구하고 이름을 평균구매금액으로 출력하시오.

select id, (purchase_amt/purchase_cnt) as 평균구매금액 from purchase_tran;

#5. 올해와 작년의 구매건수 당 평균 구매금액을 구하시오

select id, (purchase_amt/purchase_cnt) as 평균구매금액, (last_amt/last_cnt) as 작년구매금액평균 from purchase_tran;





