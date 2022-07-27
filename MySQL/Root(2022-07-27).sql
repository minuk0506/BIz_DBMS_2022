Create DataBase firstDB;
Use firstDB;
Create User dbuser@'localhost' identified By '!Korea8080';
Grant All Privileges On firstDB.* To dbuser@'localhost';