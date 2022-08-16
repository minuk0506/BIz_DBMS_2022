use mydb;
drop table tbl_users;
drop table tbl_authorities;
drop table tbl_todolist;
select * from tbl_authorities;
select * from tbl_users;
select * from tbl_todolist;

update tbl_users
set enabled = true
where username = '123';


create database myTODO;
use mytodo;

CREATE TABLE IF NOT EXISTS tbl_users (
		username VARCHAR(20) PRIMARY KEY,
		password VARCHAR(255) NOT NULL,
		Enabled BOOLEAN DEFAULT FALSE,
		AccountNonExpired BOOLEAN DEFAULT TRUE,
		AccountNonLocked BOOLEAN DEFAULT TRUE,
		CredentialsNonExpired BOOLEAN DEFAULT TRUE,

		email VARCHAR(30),
		tel VARCHAR(15),
		realname VARCHAR(20),
		nickname VARCHAR(20)
		);
        
        CREATE TABLE IF NOT EXISTS tbl_authorities (
		seq BIGINT AUTO_INCREMENT PRIMARY KEY,
		username VARCHAR(20),
		authority VARCHAR(20)
		);
    CREATE TABLE IF NOT EXISTS tbl_todoList (
 			seq BIGINT AUTO_INCREMENT PRIMARY KEY,
 			username VARCHAR(20),
 			date VARCHAR(20),
 			time VARCHAR(20),
 			todo VARCHAR(100),
 			compDate VARCHAR(20),
			compTime VARCHAR(20),
			comp int(1)
 		);
    insert into tbl_todolist(
    username, todo, date, time) value (
    "minuk", "h", "20220809", "1111");
    
    
	select todo from tbl_todoList
 	left join tbl_users
 	on tbl_todoList.username = tbl_users.username;
    
    create table tbl_users(
    username VARCHAR(20) PRIMARY KEY,
	password VARCHAR(255) NOT NULL,
	enabled BOOLEAN DEFAULT FALSE,
	accountNonExpired BOOLEAN DEFAULT FALSE,
	accountNonLocked BOOLEAN DEFAULT FALSE,
	credentialsNonExpired BOOLEAN DEFAULT FALSE,

	realname VARCHAR(20),
	nickname VARCHAR(20)
    );
    show tables;
