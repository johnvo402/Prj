CREATE DATABASE LOGIN_TEST_DB;
USE LOGIN_TEST_DB;
CREATE TABLE Users(
username varchar(10),
password varchar(32)
)
--INSERT DATA INTO Users Table
INSERT INTO Users VALUES('user01','e10adc3949ba59abbe56e057f20f883e'); 
--e10adc3949ba59abbe56e057f20f883e = 123456
--CREATE PROCEDURE FOR CHECK LOGIN
CREATE PROCEDURE CheckLogin
@username varchar(10),
@password varchar(32)
AS
SELECT username
FROM Users
WHERE username = @username AND password = @password;
EXEC CheckLogin @username = 'user01', @password = 'e10adc3949ba59abbe56e057f20f883e'