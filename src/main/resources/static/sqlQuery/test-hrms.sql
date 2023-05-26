use hrms;

-- 사원테이블
drop table hr_employees; 
CREATE TABLE TEST_EMPLOYEES(
EMP_NO INT(10) AUTO_INCREMENT,
EMP_NAME VARCHAR(20) NOT NULL,
EMP_BIRTH_DAY DATE not NULL,
EMP_HIRE_DATE DATE not NULL,
EMP_EMAIL VARCHAR(50) not null UNIQUE,
EMP_PASSWORD VARCHAR(150) NOT null,
EMP_GENDER CHAR(1) not NULL,
EMP_SALARY INT(10),
EMP_PHONE VARCHAR(30),
EMP_MY_BOSS INT(10),
POS_CODE VARCHAR(10),
ROLE_CODE VARCHAR(10),
DEPT_CODE VARCHAR(10),
constraint PK_EMP_NO PRIMARY KEY (EMP_NO)
);

select * from test_employees;

insert into test_employees 
(EMP_NAME, EMP_BIRTH_DAY, EMP_HIRE_DATE, EMP_EMAIL, EMP_PASSWORD, EMP_GENDER)
values ("홍길동", "1990-11-21", "2015-04-23", "1@test.com", "1234", "M");

insert into test_employees 
(EMP_NAME, EMP_BIRTH_DAY, EMP_HIRE_DATE, EMP_EMAIL, EMP_PASSWORD, EMP_GENDER)
values ("전우치", "1989-08-13", "2014-07-03", "2@test.com", "1234", "M");

insert into test_employees 
(EMP_NAME, EMP_BIRTH_DAY, EMP_HIRE_DATE, EMP_EMAIL, EMP_PASSWORD, EMP_GENDER)
values ("춘향이", "1995-03-06", "2020-05-09", "3@test.com", "5678", "F");

insert into test_employees 
(EMP_NAME, EMP_BIRTH_DAY, EMP_HIRE_DATE, EMP_EMAIL, EMP_PASSWORD, EMP_GENDER)
values ("고길동", "1987-08-12", "2019-02-10", "4@test.com", "5678", "M");

insert into test_employees 
(EMP_NAME, EMP_BIRTH_DAY, EMP_HIRE_DATE, EMP_EMAIL, EMP_PASSWORD, EMP_GENDER)
values ("도우너", "2001-07-01", "2022-05-09", "5@test.com", "5678", "M");

insert into test_employees 
(EMP_NAME, EMP_BIRTH_DAY, EMP_HIRE_DATE, EMP_EMAIL, EMP_PASSWORD, EMP_GENDER)
values ("희동이", "1987-03-06", "2010-12-04", "6@test.com", "5678", "M");

insert into test_employees 
(EMP_NAME, EMP_BIRTH_DAY, EMP_HIRE_DATE, EMP_EMAIL, EMP_PASSWORD, EMP_GENDER)
values ("삐약이", "2002-01-08", "2023-02-22", "7@test.com", "5678", "F");

-- 사원 동호회 연결 테이블
drop table HR_EMP_CLUB; 
create table TEST_EMP_CLUB(
EC_INDEX INT(10) auto_increment,
EMP_JOIN_DATE DATETIME default CURRENT_TIMESTAMP,
EMP_NO INT(10),
CLUB_CODE INT(10),
constraint PK_EC_INDEX primary key (EC_INDEX)
);

select * from test_emp_club;

-- 동호회 테이블
drop table HR_CLUB; 
create table TEST_CLUB(
CLUB_CODE INT(10) AUTO_INCREMENT,
CLUB_NAME VARCHAR(30) not NULL,
CLUB_DATE DATETIME DEFAULT CURRENT_TIMESTAMP,
CLUB_PROFILE VARCHAR(150),
EMP_NO INT(10),
constraint PK_CLUB_CODE primary key (CLUB_CODE)
);

select * from test_club;

insert into test_club 
(club_NAME, EMP_NO)
values ("축구동호회", 1);

insert into test_club 
(club_NAME, EMP_NO)
values ("산악회", 2);

insert into test_club 
(club_NAME, EMP_NO)
values ("영화동호회", 3);

--메일 삽입 테스트용
 insert into hr_email (mail_to , mail_from, mail_title, mail_content)
 values(2,6,"결제부탁드립니다","테스트용메일입니다");

      	--  mail_to 수신자 mail_from 발신자 숫자만 바꿔서 발송할 것


-- 동호회 게시판
drop table HR_CLUB_BOARD; 
create table TEST_CLUB_BOARD(
CB_NO INT(10) auto_increment,
CB_TITLE VARCHAR(100),
CB_CONTENT VARCHAR(1000),
CB_DATE DATETIME default CURRENT_TIMESTAMP,
CB_URL VARCHAR(1000),
EMP_NO INT(10),
CLUB_CODE INT(10),
constraint PK_CB_NO primary key (CB_NO)
);

select * from test_club_board;

insert into test_club_board  
(CB_TITLE, CB_CONTENT, EMP_NO, CLUB_CODE)
values ("테스트제목1", "테스트내용1", 1, 1);

-- 동호회 게시판 댓글 테이블
drop table HR_CLUB_REPLY; 
create table TEST_CLUB_REPLY(
CLUB_REP_NO INT(10) AUTO_INCREMENT,
CLUB_REP_CONTENT VARCHAR(1000),
CLBU_REP_DATE DATETIME default CURRENT_TIMESTAMP,
CB_NO INT(10),
EMP_NO INT(10),
constraint PK_CLUB_REP_NO primary key (CLUB_REP_NO)
);

select *
from test_club_reply;
ALTER TABLE TEST_CLUB_REPLY CHANGE CLBU_REP_DATE CLUB_REP_DATE DATETIME default CURRENT_TIMESTAMP;

-- 외래키

alter TABLE TEST_EMP_CLUB add constraint FK_TEST_EMP_CLUB_EMP_NO
FOREIGN KEY (EMP_NO) REFERENCES TEST_EMPLOYEES(EMP_NO) on delete cascade;

alter TABLE TEST_EMP_CLUB add constraint FK_TEST_EMP_CLUB_CLUB_CODE
FOREIGN KEY (CLUB_CODE) REFERENCES TEST_CLUB(CLUB_CODE) on delete cascade;

alter TABLE TEST_CLUB add constraint FK_TEST_CLUB_EMP_NO
FOREIGN KEY (EMP_NO) REFERENCES TEST_EMPLOYEES(EMP_NO) on delete cascade;

alter TABLE TEST_CLUB_BOARD add constraint FK_TEST_CLUB_BOARD_EMP_NO
FOREIGN KEY (EMP_NO) REFERENCES TEST_EMPLOYEES(EMP_NO) on delete cascade;

alter TABLE TEST_CLUB_BOARD add constraint FK_TEST_CLUB_BOARD_CLUB_CODE
FOREIGN KEY (CLUB_CODE) REFERENCES TEST_CLUB(CLUB_CODE) on delete cascade;

alter TABLE TEST_CLUB_REPLY add constraint FK_TEST_CLUB_REPLY_EMP_NO
FOREIGN KEY (EMP_NO) REFERENCES TEST_EMPLOYEES(EMP_NO) on delete cascade;

alter TABLE TEST_CLUB_REPLY add constraint FK_TEST_CLUB_REPLY_CB_NO
FOREIGN KEY (CB_NO) REFERENCES TEST_CLUB_BOARD(CB_NO) on delete cascade;

