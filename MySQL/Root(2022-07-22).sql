drop database schooldb;
-- export 된 DataBase import 하기
-- export 된 DataBase 와 같은 이름으로
-- DataBase 생성
create database schooldb;
use schooldb;
select * from tbl_student;
desc tbl_student;