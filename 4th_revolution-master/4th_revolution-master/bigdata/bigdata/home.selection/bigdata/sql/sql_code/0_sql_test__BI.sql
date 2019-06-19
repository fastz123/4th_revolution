

# sales database 생성





# sales database 선택





# test table 생성
# test column 생성 - datatype -  DECIMAL(5,3)




# 값 10.5 입력




# test테이블 출력




# 값 입력 - 12.55555




## 칼럼 추가  `test_fl` - FLOAT(5,3) NULL AFTER `test`





## 값 입력 - test_fl : 14.55555 / test : 16.55555




## test table 삭제




/*
sales 테이블 생성
	purchase_number - INT  ,
    date_of_purchase - DATE NOT NULL,     
    customer_id - INT,
    item_code - VARCHAR(10) NOT NULL
 */   
    
create table sales (
purchase_number  INT  auto_increment primary key,
date_of_purchase  DATE NOT NULL,     
customer_id  INT,
item_code  VARCHAR(10) NOT NULL
);




/*
customers 테이블 생성
    customer_id - INT,
    first_name - varchar(255),
    last_name - varchar(255),
    email_address - varchar(255),
    number_of_complaints - int
*/
    
    
create table customers (
	customer_id  INT,
    first_name  varchar(255),
    last_name  varchar(255),
    email_address  varchar(255),
    number_of_complaints  int
);


## sales 테이블의 purchase_number를 primary key로 지정 - 2가지 방범/ not null로 지정/ auto_increment로 지정
## customers 테이블의 customer_id를 primary key로 지정


create table customers (
	customer_id  INT primary key,
    first_name  varchar(255),
    last_name  varchar(255),
    email_address  varchar(255),
    number_of_complaints  int
    );

create table customers (
	customer_id int, 
    first_name  varchar(255),
    last_name  varchar(255),
    email_address  varchar(255),
    number_of_complaints  int,
    primary key(customer_id)
    );
    

#  customers table에 customer_id에 primary key 제약조건 추가



#  sales 테이블에  purchase_number 칼럼에에 primary key 제약조건 추가



# customers, sales 테이블의 정보 확인





items 테이블 생성, 
	
	primary key - item_id
    item_id - VARCHAR(255),
    item - VARCHAR(255),
    unit_price - NUMERIC(10 , 2 ),
    company_id - VARCHAR(255),
    
    create table items(
    
    item_id  VARCHAR(255) primary key,
    item  VARCHAR(255),
    unit_price  NUMERIC(10 , 2 ),
    company_id  VARCHAR(255)
    );


companies 테이블 생성, 
	primary key - company_id
    company_id - VARCHAR(255),
    company_name - VARCHAR(255),
    headquarters_phone_number - INT(12),
    
    create table companies(
		company_id  VARCHAR(255),
		company_name  VARCHAR(255),
		headquarters_phone_number  INT(12),
        primary key(company_id)
        );
    



## alter - customers테이블 - email_address - unique key로 지정



## customers table에 외래키를 추가하고 삭제 시 자동 없데이트 옵션



## customers테이블 gender column를 추가 - enum('M', 'F')



## customers 테이블 값 추가 - '01', 'John', 'Mackinley', 'M', 'john.mckinley@365careers.com', 0



## customers 테이블 값 추가 - customer_id, first_name, last_name, gender, email_address -> 2, 'Peter', 'Figaro', 'M', 'sss@hotmail.com'




## companies table의 company_name을 not null로 추가



/*
alter table companies add constraint not null(company_name);

alter table companies modify column company_name not null;

ALTER TABLE customers
CHANGE COLUMN number_of_complaints number_of_complaints INT DEFAULT 0;
*/

## company_name을 varchar(200), null로 변경




## employees database 선택




## first_name, last_name 출력




## first_name이  'Denis'인 데이터 출력



    
# 이름이 'Denis' 이고 남성인 데이터 출력
    



## 이름이 'Denis' 또는  'Elvis'인 데이터 출력




## 이름이 'Cathie' , 'Mark', 'Nathan'에 해당하는 row출력 - in 사용




## 이름이 'Cathie' , 'Mark', 'Nathan'에 해당하지 않는 row출력




## 이름이 Mar로 시작하는 row출력




## 이름이 ar로 끝나는 row출력




## 이름이 Mar로 시작하고 4글자인 row출력





# 이름에 jack을 포한하는 row를 출력



    

# hire_date이 '1990-01-01' 과 '2000-01-01' 사이인 row출력



    
# salary가 66000과 70000 사이인 row출력



 
# 이름이 null인 row출력



 
 # 이름이 null이 아닌 row출력




    
# salary가 150000  이상인 데이터 출력



# 중복없는 title 데이터 출력


 
    
# 사원번호 갯수를 출력


    

# 중복없는 이름의 갯수 출력




# 연봉 100000이상인 사람의 총 수
    



# 메니저인 사람의 총 수 출력




# 성울 선순위, 이름을 차순위로 내림차순 정렬




# 연봉 상위 100명  출력




#중복 이름이 100 이상인 이름 목록 출력




# 평균 연봉이 120000 이상인 직원 번호와 평균 임금 출력




# 중복 이름이 200번 이상인 사람의 이름과 중복된 이름의 갯수 출력




## departments에서 dept_no가 'd010'인 데이터의 dept_name을 'data analysis'로 수정하시오




    
## employees 테이블에서 emp_no가 999903인 데이터를 삭제하시오




## departments에서 dept_no가 'd010'인 데이터를 삭제하시오




