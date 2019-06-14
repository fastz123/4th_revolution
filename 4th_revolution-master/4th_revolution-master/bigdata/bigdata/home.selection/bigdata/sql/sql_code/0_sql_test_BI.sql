


sales database 생성


sales database 선택


test table 생성
test column 생성 - datatype -  DECIMAL(5,3)


값 10.5 입력

test테이블 출력

값 입력 - 12.55555

칼럼 추가  `test_fl` - FLOAT(5,3) NULL after test

값 입력 - test_fl : 14.55555 / test : 16.55555

test table 삭제


###########
-- LECTURE: Creating a Table

sales 테이블 생성
	purchase_number - INT  ,
    date_of_purchase - DATE NOT NULL,     
    customer_id - INT,
    item_code - VARCHAR(10) NOT NULL


-- EXERCISE 1: Creating a Table
customers 테이블 생성
    customer_id - INT,
    first_name - varchar(255),
    last_name - varchar(255),
    email_address - varchar(255),
    number_of_complaints - int

sales 테이블의 purchase_number를 primary key로 지정 - 2가지 방범/ not null로 지정/ auto_increment로 지정
customers 테이블의 customer_id를 primary key로 지정



-- EXERCISE 1: PRIMARY KEY Constraint


items 테이블 생성, primary key - item_id
    item_id - VARCHAR(255),
    item - VARCHAR(255),
    unit_price - NUMERIC(10 , 2 ),
    company_id - VARCHAR(255),


companies 테이블 생성, primary key - company_id
    company_id - VARCHAR(255),
    company_name - VARCHAR(255),
    headquarters_phone_number - INT(12),






customers 테이블 값 추가 - 'John', 'Mackinley', 'M', 'john.mckinley@365careers.com', 0

customers 테이블 값 추가 - first_name, last_name, gender -> 'Peter', 'Figaro', 'M'




###########
-- LECTURE: SELECT - FROM

employees database 선택


first_name, last_name 출력

  
###########
-- LECTURE: WHERE

이름이  'Denis'인 데이터 출력
    

###########
-- LECTURE: AND

이름이 'Denis' 이고 남성인 데이터 출력
    


###########
-- LECTURE: OR

이름이 'Denis' 또는  'Elvis'인 데이터 출력



###########
-- LECTURE: IN / NOT IN

이름이 'Cathie' , 'Mark', 'Nathan'에 해당하는 row출력

이름이 'Cathie' , 'Mark', 'Nathan'에 해당하지 않는 row출력

###########
-- LECTURE: LIKE / NOT LIKE 

이름이 Mar로 시작하는 row출력

이름이 ar로 끝나는 row출력

이름이 Mar로 시작하고 4글자인 row출력

이름에 jack을 포한하는 row를 출력
    

fire_date이 '1990-01-01' 과 '2000-01-01' 사이인 row출력

    
salary가 66000과 70000 사이인 row출력
 
 이름이 null인 row출력
 
 이름이 null이 아닌 row출력

    
이름이 'Mark'가 아닌 row를 출력
    
hire_date이 '2000-01-01' 이후인 데이터 출력
    
hire_date이 '1985-02-01'이전인 데이터 출력

hire_date이 '1985-02-01'이전이고 남성인인 데이터 출력
    
salary가 150000  이상인 데이터 출력


중복없는 입사일자 데이터 출력

중복없는 이름 출력
    

###########
-- LECTURE: Introduction to Aggregate Functions    
    
사원번호 갯수를 출력
    
    
이름 칼럼 값의 총 합 출력

중복없는 이름의 갯수 출력

-- EXERCISE 1: Introduction to Aggregate Functions

연봉 100000이상인 사람의 총 수
    
메니저인 사람의 총 수 출력


이름으로 오름차순 정렬 후 하위 10개 이름 출력

이름으로 내림차순 정렬 후 하위 10개 이름 출력

성울 선순위, 이름을 차순위로 내림차순 정렬

연봉 상위 100명 이름 출력

중복 이름이 100 이상인 이름 목록 출력

평균 연봉이 120000 이상인 직원 번호와 평균 임금 출력
###########
-- LECTURE: WHERE vs HAVING - Part I

중복 이름이 200번 이상이면서 1999-01-01 이후에 입사한 사람의 이름과 중복된 이름의 갯수 출력



use employees;

employees에 데이터 삽입
	emp_no,
	birth_date,
	first_name,
	last_name,
	gender,
	hire_date

	999901,
    '1986-04-21',
    'John',
    'Smith',
    'M',
    '2011-01-01'
    
    '1973-3-26',
    999902,
    'Patricia',
    'Lawrence',
    'F',
    '2005-01-01'
    
    999903,
    '1977-09-14',
    'Johnathan',
    'Creek',
    'M',
    '1999-01-01'
    
employees 내림차순 상위 10개 출력


titles에 데이터 입력
	emp_no,
    title,
    from_date

	999903,
    'Senior Engineer',
    '1997-10-01'
    
employees 내림차순 상위 10개 출력

 
dept_emp에 데이터 입력
	emp_no,
    dept_no,
    from_date,
    to_date

	999903,
    'd005',
    '1997-10-01',
    '9999-01-01'


###########
-- LECTURE: Inserting Data INTO a New Table
use employees;

CREATE TABLE departments_dup 
(
    dept_no CHAR(4) NOT NULL,
    dept_name VARCHAR(40) NOT NULL
);

departments의 데이터를 departments-dup에 삽입하시오



-- LECTURE: The UPDATE Statement - Part I


USE employees;

emp_no = 999901e데이터를 수정하시오

update employees set (

first_name = 'Stella',
last_name = 'Parkinson',
birth_date = '1990-12-31',
gender = 'F') where emp_no = 999901;

emp_no 기준 내림차순으로 상위 10개를 출력하시오


###########


-- EXERCISE 1: The UPDATE Statement - Part II

departments에서 dept_no가 'd010'인 데이터의 dept_name을 'data analysis'로 수정하시오




-- LECTURE: The DELETE Statement - Part I

USE employees;


SELECT 
    *
FROM
    titles
WHERE
    emp_no = 999903;
    
    
employees 테이블에서 emp_no가 999903인 데이터를 삭제하시오



SELECT 
    *
FROM
    employees
WHERE
    emp_no = 999903;
    
    

###########
-- LECTURE: The DELETE Statement - Part II

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;


departments_dup의 모든 데이터를 삭제하시오




departments에서 dept_no가 'd010'인 데이터를 삭제하시오



###########
-- LECTURE: COUNT()

SELECT 
    *
FROM
    salaries
ORDER BY salary DESC
LIMIT 10; 

SELECT 
    COUNT(salary)
FROM
    salaries;   

salaries테이블에서 입사일자 총 갯수합합을 산출하시오


salaries테이블에서 중복없는 입사일자 총 합을 산출하시오

    
salaries 테이블의 총데이터 갯수를 구하시오


dept_emp에서 중복없는 dept_no의 갯수를 구하시오



salaries에서 salary의 총 합을 구하시오.

    
'1997-01-01'일 이후의 salary의 총합을 구하시오.



###########
-- LECTURE: MIN() and MAX()

salaries에서 salary최대값을 구하시오.


salaries에서 salary최소값을 구하시오


salaries에서 salary 평균값을 구하시오


salaries에서 salary 반올림한 평균값을 구하시오.
