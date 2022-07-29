use schooldb;
-- MySQL 의 BOOLEAN type
-- 실제 테이블 상에는 BOOLEAN type 이 없고
-- tinyint type 으로 컬럼이 생성된다
-- 이 값은 0과 1의 값을 가지며 Java 에서 select 를 하면
-- 1은 true 로 0 은 false 로 자동 형 변환 된다
create table tbl_users(
	username varchar(20) primary key,
	password varchar(20) not null,
	isEnabled boolean default false,
	isAccountNonExpired boolean default true,
	isAccountNonLocked boolean default true,
	isCredentialsNonExpired boolean default true,

	email varchar(30),
	tel varchar(15),
	realname varchar(20),
	nickname varchar(20)
);
drop table tbl_users;
drop table tbl_authorities;
select * from tbl_users;
select * from tbl_authorities;
-- Spring Security 에서 사용하는 권한테이블
-- 한 user 에게 여러가지 복합적인 권한을 부여하기 위하여
-- 사용하는 보조 테이블 
create table tbl_authorities(
	seq bigint auto_increment primary key,
    username varchar(20),
    authority varchar(20)
);

desc tbl_user;