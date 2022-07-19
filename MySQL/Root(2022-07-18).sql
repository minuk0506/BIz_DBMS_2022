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
 
 insert into tbl_address(
 a_seq,
 a_name
 )value(
 1,
 "홍길동"
 );
 
 select * from tbl_address;
 select * from tbl_address where a_seq = 3;
 
--  UPDATE tbl_address
-- SET
-- a_seq = <{a_seq: }>,
-- a_name = <{a_name: }>,
-- a_tel = <{a_tel: }>,
-- a_address = <{a_address: }>
-- WHERE a_seq = <{expr}>;

-- delete from tbl_address
-- where a_seq = #{a_seq}

/*
DROP TABLE : TABLE 삭제하기
DELETE FROM [table] : 데이터만 전체 삭제하기
TRUNCATE TABLE [table] : DROP 후에 다시 CREATE
*/
truncate table tbl_address;
select * from tbl_address;
select count(*) from tbl_address;

select * from tbl_address
where a_name = '학생이름';
/*
DELETE FROM tbl_address
WHERE a_name = '학생이름';
*/
DELETE FROM tbl_address
WHERE a_seq = 50;
DELETE FROM tbl_address
WHERE a_seq = 189;

-- a_name 칼럼의 데이터가 야유신인 데이터만 추출
select * from tbl_address
where a_name = '야유신';

-- 중간문자열 검색
-- a_name 칼럼에 '유'가 포함된 모든 데이터
SELECT * FROM tbl_address
where a_name LIKE '%유%';

-- a_name 칼럼의 데이터가 '유'로 시작되는 데이터
select * from tbl_address
where a_name LIKE '유%';

-- a_name 칼럼의 데이터가 '유'로 끝나는 데이터
select * from tbl_address
where a_name LIKE '%유';

-- LIKE 연산자는 index 도 적용이 안되고 full text 검사
-- 전체데이터를 처음부터 순서대로 비교하여 검색
-- WHERE 절에서 사용하는 연산자중에 가장 성능이 낮다

-- mybatis 의 mapper에서 사용하는 MySQL코드
-- SELECT * FROM tbl_address
-- WHERE a_name LIKE CONCAT('%',#{a_name},'%');

-- mybatis 의 mapper에서 사용하는 Oracle코드
-- select * from tbl_address
-- where a_name LIKE '%' || #{a_name} || '%'

-- 데이터의 출력 개수를 제한하는 키워드
select * from tbl_address
LIMIT 10;
-- OFFSET 앞에서부터 건너뛰고 출력하기
select * from tbl_address
LIMIT 10 OFFSET 10;
/*
LIMIT 와 OFFSET 은 SELECT 명령문의 어떠한 절보다
먼저 실행이 된다
그러한 이유로 다음 코드는 전체 데이터 중에서 앞에서 10개의 데이터를 추출하고
추출된 데이터 중에서 WHERE 절을 실행하여
조건에 맞는 데이터를 찾는다
*/
SELECT * FROM tbl_address
WHERE a_name = '%유%'
LIMIT 10;
/*
검색 기능과 Pagination 기능을 동시에 구현하기 위해서
Sub Query 를 사용한다
내부의 SELECT 에서 조건에 맞는 데이터를 추출하고
바깥쪽의 SELECT 에서 LIMIT OFFSET 를 설정한다
*/
SELECT * FROM
(
select * from tbl_address
where a_name LIKE '%유%'
) AS SUB
LIMIT 10 OFFSET 10;