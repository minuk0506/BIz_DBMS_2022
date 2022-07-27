use schooldb;
create table tbl_books(
	b_isbn bigint primary key,
    b_name varchar(20),
    b_pub varchar(5),
    b_author varchar(5),
    b_date date,
    b_page int,
    b_price int
    );
    
create table tbl_company(
    c_bpub varchar(5),
    c_name varchar(5),
    c_dae varchar(5),
    c_tel bigint,
    c_addr varchar(100)
    );
    
   
create table tbl_author(
    a_bauthor varchar(5),
    a_name varchar(5),
    a_tel bigint,
    a_addr varchar(100)
    );
    
    insert into tbl_books(
b_isbn,b_name,b_pub,b_author)value("9791162540093","책fa1qwe","C0143","A0110"
    );
    
  insert into tbl_company(
c_bpub,c_name,c_dae)value("C0143","출판사sg","홍길동qe"
    );
    
  insert into tbl_author(
a_bauthor,a_name,a_tel)value("A0110","작가이름c","13556158"
    );
    
select count(*) from tbl_books, tbl_company, tbl_author;

select * from tbl_books
where b_name = "책faewfwe";

update tbl_books
set
b_price = "50000"
where b_isbn = "9791162540090";

select * from tbl_books
order by b_date;

select count(*) from tbl_books
group by b_pub;

select avg(b_price), b_pub from tbl_books
group by b_pub;

select * from tbl_books
where b_price >= "50000";
select * from tbl_author;
select b_isbn,b_name,c_name,c_dae,a_name,a_tel from tbl_books as B, tbl_company as C, tbl_author as A
where B.b_pub = C.c_bpub AND B.b_author = A.a_bauthor;

select b_isbn,b_name,c_name,c_dae,a_name,a_tel from tbl_books as B
left join tbl_company as C
on B.b_pub = C.c_bpub
left join tbl_author as A
on B.b_author = A.a_bauthor
group by b_isbn;

select b_isbn,b_name,c_name,c_dae,a_name,a_tel,b_date from tbl_books as B
left join tbl_company as C
on B.b_pub = C.c_bpub
left join tbl_author as A
on B.b_author = A.a_bauthor
where b_date < "2022-07-24"
group by b_isbn;

select * from tbl_author;

select a_bauthor from tbl_author
where a_name = "작가이름a";

update tbl_author
set
a_tel = "010-3782-9014"
where a_bauthor = "A0014";
