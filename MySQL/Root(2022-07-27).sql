Create DataBase firstDB;
Use firstDB;
Create User dbuser@'localhost' identified By '!Korea8080';
Grant All Privileges On firstDB.* To dbuser@'localhost';

use schooldb;
select * from tbl_author;

update tbl_author
set
a_tel = "010-3782-9014"
where a_bauthortbl_address = "A0014";