-- USER3 2022-05-26

INSERT INTO tbl_student(st_num, st_name, st_grade, st_addr, st_tel);

CREATE TABLE tbl_user(
    username VARCHAR2(10) PRIMARY KEY,
    password VARCHAR2(128) NOT NULL,
    name NVARCHAR2(20),
    email VARCHAR2(125),
    role VARCHAR2(10)
);