use mydb;

show tables;

select * from tbl_food;

CREATE TABLE tbl_address(
 a_seq BIGINT auto_increment primary key,
 a_name VARCHAR(20) NOT NULL,
 a_tel VARCHAR(30),
 a_address VARCHAR(125)
 );
 DROP TABLE tbl_address;
 
 -- Data Create : 테이블에 데이터를 추가 하기
 insert into tbl_address(a_name, a_tel, a_addr)
    value('홍길동','0101111111','광주' );
-- Data 가져오기, 선택하기, Fetch 하기
 select * from tbl_address;
 update;
 
 delete;
 
 insert into tbl_address(
 a_seq,
 a_name
 )value(
 1,
 "홍길동"
 );
 
 select * from tbl_address;
 select * from tbl_address where a_seq = 3;