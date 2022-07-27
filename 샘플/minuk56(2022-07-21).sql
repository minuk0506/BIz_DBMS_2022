USE schoolDB;

CREATE TABLE tbl_student(
	st_num	VARCHAR(5)	PRIMARY KEY,
	st_name	VARCHAR(20)	NOT NULL,
	st_dept	VARCHAR(20)	,
	st_grade	INT		,
	st_tel	VARCHAR(15)	NOT NULL,
	st_addr	VARCHAR(125)		
);

SELECT COUNT(*) FROM tbl_student;

CREATE TABLE tbl_subject(
sb_code	VARCHAR(5)	NOT NULL	PRIMARY KEY,
sb_name	VARCHAR(25)	NOT NULL	
);

drop table tbl_subject;
INSERT INTO tbl_subject(
sb_code,
sb_name
)values
('SB001', '국어'),
('SB002', '데이터베이스'),
('SB003', '미술'),
('SB004', '소프트웨어공학'),
('SB005', '수학'),
('SB006', '영어영문'),
('SB007', '음악');
SELECT * FROM tbl_subject;

-- 성적이 저장될 table
-- 학생정보와 과목정보가 함께 연동되어 점수를 관리
-- sc_seq 임의 칼럼을 만들어 PK 로 삼고
-- 학번과 과목코드가 동시에 같은 코드가 중복되지 않도록
-- UNIQUE(학번, 과목코드) 설정하였다
CREATE TABLE tbl_score(
	sc_seq	BIGINT PRIMARY KEY AUTO_INCREMENT,
	sc_stnum	VARCHAR(5)	NOT NULL	,
	sc_sbcode	VARCHAR(5)	NOT NULL	,
	sc_score	INT,
    UNIQUE(sc_stnum, sc_sbcode)
);
select * from tbl_score;
SELECT COUNT(*) FROM tbl_score;

-- tbl_score 데이터에서 점수가 70점 이하인 데이터만 추출
-- 학번순으로 리스트를 나열하기
-- Selection : 조건절(where)을 추가하여 조건에 맞는 데이터만 추출하기
select * from tbl_score
where sc_score <= 70
order by sc_stnum;

-- Projection
-- tbl_score 데이터에서 전체 데이터를 표시하되 과목코드, 점수 칼럼만 표시되도록 
-- table 많은 칼럼(속성 Attribute, 필드 field)이 있을경우
-- 필요한 칼럼만 나열하여 리스트를 보고자 할때
select sc_sbcode, sc_score from tbl_score;

-- tbl_score 데이터에서 점수가 50점 이상 70점 이하인 데이터
-- 과목코드와 점수만 보이도록
select sc_sbcode as '과목코드', sc_score as '점수' from tbl_score
where 50 <= sc_score AND sc_score <= 70
order by sc_score;

-- 범위를 지정할때 이상 AND 이하 일경우 BETWEEN 을 사용할 수 있다
select sc_sbcode as '과목코드', sc_score as '점수' from tbl_score
where sc_score BETWEEN 50 AND 70
order by sc_score;

-- 점수가 50이상 70이하인 데이터
-- tbl_subject table 과 연결하여
-- 과목코드, 과목명, 점수 칼럼이 보이도록
-- LEFT JOIN
select SB.sb_code as 과목코드, SB.sb_name as 과목명, SC.sc_score as 점수 from tbl_subject SB LEFT JOIN tbl_score SC
ON sb_code = sc_sbcode
where SC.sc_score between 50 and 70
order by SB.sb_code;
-- tbl_score 테이블에서 WHERE 조건에 맞는 데이터를 모두 Selection 하고
-- tbl_subject 테이블에서 ON 조건에 맞는 데이터들만 Selection 하라

-- EQ JOIN
select sb_code,sb_name, sc_score
from tbl_subject, tbl_score 
where sb_code = sc_sbcode AND sc_score between 50 and 70
order by sb_code;

-- 점수가 50 ~ 70 인 데이터를 Selection
-- 과목코드, 과목명, 점수를 표현
-- tbl_student table 을 JOIN 하고
-- 학번, 학생이름, 과목코드, 과목명, 점수를 Projection
-- 학번 순으로 정렬하기
select ST.st_num as 학번,
 ST.st_name as 학생이름,
 SB.sb_code as 과목코드,
 SB.sb_name as 과목명,
 SC.sc_score as 점수
from tbl_score SC
LEFT JOIN tbl_student ST
ON SC.sc_stnum = ST.st_num 
LEFT JOIN  tbl_subject SB
ON SC.sc_sbcode = SB.sb_code
where SC.sc_score between 50 and 70
order by ST.st_num;


-- tbl_score table 의 데이터를 참조하여
-- 과목별 전체 총점을 구하시오
select sc_sbcode, sum(sc_score) as '총점' from tbl_score
group by sc_sbcode order by sum(sc_score);

-- GROUP BY, SUM, AVG 등 통계함수를 사용하여 Selection
select sc_sbcode, sum(sc_score) as '총점', AVG(sc_score) as 평균 from tbl_score
group by sc_sbcode order by sum(sc_score);

-- 과목명을 함께 Projection
-- 표준 SQL에서는 통계함수로 묶지 않은 칼럼은 group by에 넣어야한다
SELECT sc_sbcode as 과목코드,
	sb_name as 과목명,
	sum(sc_score) as 총점,
    avg(sc_score) as 평균
from tbl_score
left join tbl_subject
on sc_sbcode = sb_code
group by sc_sbcode, sb_name;

select sb_name, sum(sc_score) as 총점 from tbl_subject LEFT JOIN tbl_score
ON tbl_subject.sb_code = tbl_score.sc_sbcode
group by sb_name order by sum(sc_score);

-- 학생별로 총점 구하기
-- 학번, 이름, 총점, 평균 Projection
-- 학번순으로 정렬
select st_num as 학번,
	st_name as 이름,
	sum(sc_score) as 총점,
    avg(sc_score) as 평균
from tbl_student
left join tbl_score
on st_num = sc_stnum
group by st_num, st_name
order by st_num;

select st_num, st_name, sc_sbcode, sc_score
from tbl_student ST
left join tbl_score SC
on ST.st_num = SC.sc_stnum;
-- tbl_score 테이블에서 각 학생들의 SB002(데이터베이스) 과목 점수만
-- 학번		데이터베이스(SB002)점수
-- S0001	90	
-- S0002	70
select st_num, st_name, sc_sbcode, sc_score
from tbl_student ST
left join tbl_score SC
on ST.st_num = SC.sc_stnum
where sc_sbcode = 'SB002';

select sc_stnum, st_num,
	sum(if(sc_sbcode = 'SB001', sc_score,0)) as 국어,
    sum(if(sc_sbcode = 'SB002', sc_score,0)) as DB,
    sum(if(sc_sbcode = 'SB003', sc_score,0)) as 미술,
    sum(if(sc_sbcode = 'SB004', sc_score,0)) as 소프트웨어 공학
    sum(if(sc_sbcode = 'SB005', sc_score,0)) as 수학,
    sum(if(sc_sbcode = 'SB006', sc_score,0)) as 영어영문 ,
    sum(if(sc_sbcode = 'SB007', sc_score,0)) as 음악 
    from tbl_score
    left join tbl_student
on sc_stnum = st_num
group by sc_stnum;

select sc_stnum, st_name,
	sum(case when sc_sbcode = 'SB001' then sc_score else 0 end) as 국어,
    sum(case when sc_sbcode = 'SB002' then sc_score else 0 end) as DB ,
    sum(case when sc_sbcode = 'SB003' then sc_score else 0 end) as 미술 ,
    sum(case when sc_sbcode = 'SB004' then sc_score else 0 end) as 소프트웨어 공학,
    sum(case when sc_sbcode = 'SB005' then sc_score else 0 end) as 수학,
    sum(case when sc_sbcode = 'SB006' then sc_score else 0 end) as 영어영문,
    sum(case when sc_sbcode = 'SB007' then sc_score else 0 end) as 음악 
    from tbl_score
    left join tbl_student
on sc_stnum = st_num
group by sc_stnum,st_name;

/*
 제2정규화가 되어있는 데이터를 view 할대는 PIVOT으로 데이터를
펼쳐서 보는 것이 편리할 때가 많다
제2정규화가 된 데이터는 기준이 되는 키값을 중심으로 Row 방향으로
데이터가 저장되어 있다
이 데이터를 쉽게 보고서 등으로 만들때는 PIVOT을 하여
Column 방향으로 펼쳐서 보는 것이 편리하다
*/