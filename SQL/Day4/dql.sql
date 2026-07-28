use companydb;
CREATE TABLE Employee (
 id INT PRIMARY KEY auto_increment,
 name VARCHAR(100),
 department VARCHAR(50),
 salary INT,
 city VARCHAR(50)
);

INSERT INTO Employee
VALUES
(101,'Sudhan','Developer',65000,'Chennai'),
(102,'Rahul','Tester',40000,'Madurai'),
(103,'Karthik','Developer',55000,'Chennai'),
(104,'Ajay','HR',35000,'Salem'),
(105,'Vijay','Manager',85000,'Coimbatore'),
(106,'Arun','Developer',60000,'Bangalore'),
(107,'Priya','Tester',45000,'Chennai'),
(108,'Divya','HR',30000,'Madurai'),
(109,'Surya','Developer',70000,'Salem'),
(110,'Anitha','Manager',90000,'Chennai');

select * from Employee;