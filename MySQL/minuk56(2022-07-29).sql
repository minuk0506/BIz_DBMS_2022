use schooldb;

drop table tbl_users;
drop table tbl_authorities;

select * from tbl_users;
select * from tbl_authorities;

update tbl_users
set realname = "홍길동",
nickname = "사용자",
tel = "010-0101-0111",
email = "hong@kong.com"
where username = "minuk";