-- 여기는 school DB 화면
-- DataBase 생성 : schoolDB 이름으로 생성
-- root에서만 DataBase 생성이 가능하게 설정되어있음
CREATE DATABASE schoolDB;
USE schoolDB;

-- 사용자 등록
-- 사용자 등록을 할때 @'%' 를 지정하면 원격접속이 가능하다
-- 하지만 원격접속을 허용하면 DB 보안에 매우 취약해 질 수 있다
-- 가급적 특별한 경우가 아니면 @'localhost'로 지정하는 것이 좋다
CREATE USER minuk56@'localhost' identified by '!Korea8080';
-- minuk56에게 schoolDB 에 접근할 수 있는 권한 부여
GRANT ALL PRIVILEGES ON schoolDB.* TO minuk56@'localhost';
flush privileges;

-- 학사정보 테이블 명세를 참조하여 tbl_student table 생성
CREATE TABLE tbl_student(
	st_num	VARCHAR(5)	PRIMARY KEY,
	st_name	VARCHAR(20)	NOT NULL,
	st_dept	VARCHAR(20)	,
	st_grade	INT		,
	st_tel	VARCHAR(15)	NOT NULL,
	st_addr	VARCHAR(125)		
);
DROP TABLE tbl_student;

-- 현재 root 외 등록된 사용자에게 DB 전체에 대한 권한을 부여하기(학습 편의성)
GRANT ALL PRIVILEGES ON *.* TO minuk@'localhost';
-- 권한을 부여한 후에 적용시키기
FLUSH PRIVILEGES;