CREATE DATABASE `YourDatabaseNameHere`;
CREATE USER 'YourUsernameHere'@'localhost' IDENTIFIED BY 'YourNewPasswordHere';
GRANT ALL PRIVILEGES ON `YourDatabaseHere`.* TO 'YourUsernameHere'@'localhost';
GRANT ALL PRIVILEGES ON *.* TO 'YourUsernameHere'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
SHOW DATABASES;
exit

