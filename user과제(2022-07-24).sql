use mydb;
drop table tbl_books;
drop table tbl_publisher;
drop table tbl_author;

-- Table 생성문
create table tbl_books(
b_isbn bigint primary key,
b_name varchar(30),
b_pub varchar(5) Unique Key not null,
b_author varchar(5) Unique Key not null,
b_date date,
b_strdate varchar(10),
b_page int,
b_price int
);

create table tbl_publisher(
p_code varchar(5),
p_name varchar(30),
p_rep varchar(5),
p_tel varchar(15),
p_addr varchar(100),
CONSTRAINT p_code
FOREIGN KEY (p_code) 
REFERENCES tbl_books (b_pub)
ON UPDATE CASCADE
ON DELETE CASCADE
);

create table tbl_author(
a_code varchar(5),
a_author varchar(5),
a_tel varchar(15),
a_addr varchar(100),
CONSTRAINT a_code
FOREIGN KEY (a_code) 
REFERENCES tbl_books (b_author)
ON UPDATE CASCADE
ON DELETE CASCADE
);

-- 데이터 insert문

insert into tbl_books(
b_isbn, b_name, b_pub, b_author,
b_date, b_strdate, b_page, b_price
)value( "90000010", "책", "c0010", "a0010",
"2022-07-03", "2022-07-03", "17", "7003000" );

insert into tbl_publisher(
p_code, p_name, p_rep, p_tel, p_addr )value(
"c0010","글","이","070-4556-7878","순천");

insert into tbl_author(
a_code, a_author, a_tel, a_addr )value(
"a0010","글","070-4556-7878","순천");

select * from tbl_books;
select * from tbl_publisher;
select * from tbl_author;

-- join을 이용해 결과 view 확인
select
b_isbn as ISBN,
b_name as 도서명,
p_name as 출판사명,
p_rep as 출판사대표,
a_author as 저자,
a_tel as 저자연락처,
b_strdate as 출판일,
b_price as 가격,
b_page as 페이지
from tbl_books as B
left join tbl_publisher as P
on B.b_pub = P.p_code
left join tbl_author as A
on B.b_author = A.a_code;
