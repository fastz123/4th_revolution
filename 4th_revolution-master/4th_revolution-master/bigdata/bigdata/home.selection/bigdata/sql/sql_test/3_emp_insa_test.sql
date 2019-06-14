CREATE TABLE EMP
(
	ID CHAR(3) PRIMARY KEY NOT NULL,
	“POSITION” CHAR(10) NOT NULL,
	PARTY_NM CHAR(10) NOT NULL,
	MANAGER_ID CHAR(10) NOT NULL,
	TEAM_NM CHAR(10) NOT NULL,
	GRADE CHAR(10) NOT NULL
);

INSERT INTO EMP VALUES ('650', '대리', '이재훈', '1270', '마케팅부', '1');
INSERT INTO EMP VALUES ('540', '과장', '장성수', '3221', '리스크부', '2');
INSERT INTO EMP VALUES ('210', '차장', '문보미', '3914', '인사팀', '3');
INSERT INTO EMP VALUES ('347', '차장', '정호천', '3942', '기획팀', '3');
INSERT INTO EMP VALUES ('970', '부장', '김영성', '3221', '리스크부', '2');
INSERT INTO EMP VALUES ('345', '대리', '오윤경', '1270', '마케팅부', '2');
INSERT INTO EMP VALUES ('711', '과장', '이재중', '3914', '인사팀', '2');

1. 어떤 직급이 있는지?
2. 직급에 따라 어떤 고과를 받았는가
3. 인사고과 주는 사람 구하기
4. 인사고과를 몇명이 주고 있는가


