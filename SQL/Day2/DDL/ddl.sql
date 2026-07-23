CREATE DATABASE CompanyDB;
SHOW DATABASES;
USE CompanyDB;

CREATE TABLE Employees(
emp_id int primary key auto_increment,
emp_name varchar(50),
department varchar(50),
salary int,
city varchar(200),
created_by varchar(50)  default"Admin",
created_at date,
updated_by varchar(50),
updated_at date

);

DESC Employees;

ALTER TABLE Employees ADD (
email varchar(200),
phone int,
experience varchar(50)
);

DESC Employees;

ALTER TABLE Employees MODIFY salary bigint , MODIFY phone bigint;
DESC Employees;
ALTER TABLE Employees RENAME COLUMN emp_name to employee_name; 
ALTER TABLE Employees RENAME COLUMN city to location;
DESC Employees;
ALTER TABLE Employees DROP COLUMN experience , DROP COLUMN email;
DESC Employees;
RENAME TABLE Employees to EmployeeDetails;
DESC EmployeeDetails;


CREATE TABLE Students(
student_id int primary key auto_increment,
student_name varchar(50),
course varchar(100),
age int,
city varchar(100)
);


DESC Students;
ALTER TABLE Students ADD COLUMN mobile int;
DESC Students;
TRUNCATE TABLE Students;
DROP TABLE Students;
DROP TABLE EmployeeDetails;
DROP DATABASE companydb;