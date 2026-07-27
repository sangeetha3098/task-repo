CREATE DATABASE dml_db;
USE dml_db;

CREATE TABLE Employees (
id int primary key auto_increment,
name varchar(50),
department varchar(100),
salary int,
city varchar(100)
);

DESC Employees;
SELECT * FROM Employees;
DESC Employees;
INSERT INTO Employees (id , name , department , salary , city) VALUES (1,"Priya","IT",25000,"Chennai"),(2,"Riya","IT",25000,"Chennai"),(3,"Nagu","IT",25000,"Chennai"),(4,"Prem","IT",25000,"Chennai"),(5,"Muge","IT",25000,"Chennai");
CREATE TABLE Students (
    student_id int Primary key auto_increment,
    student_name varchar(100),
    course varchar(100),
    age int,
    city varchar(100)
);
INSERT INTO Students (student_id, student_name, course, age, city)
VALUES
(101, 'Sangeetha', 'B.Tech IT', 22, 'Chennai'),
(102, 'Rahul', 'B.Sc Computer Science', 21, 'Bangalore'),
(103, 'Priya', 'MCA', 23, 'Coimbatore'),
(104, 'Arun', 'B.E Mechanical', 22, 'Madurai'),
(105, 'Divya', 'B.Com', 20, 'Salem'),
(106, 'Karthik', 'BCA', 21, 'Puducherry'),
(107, 'Meena', 'MBA', 24, 'Chennai'),
(108, 'Vijay', 'B.E Electronics', 22, 'Vellore');
SELECT * FROM Students;

UPDATE Employees SET salary = 75000 , department="Developer" WHERE id=3;
SELECT * FROM Employees;
UPDATE Employees SET department = "Team Lead" , city="Bangalore" WHERE id=2;
SELECT * FROM Employees;
DELETE FROM Employees WHERE id=5;
UPDATE Employees SET salary= salary + 10000 WHERE department="Developer" ;
SELECT * FROM Employees WHERE department = 'Developer';
