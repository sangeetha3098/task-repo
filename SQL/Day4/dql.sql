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
select name , department , salary from Employee;
select * from Employee;
select distinct city from Employee;
select * from Employee;
select * from Employee WHERE city= "Chennai";
select * from Employee WHERE salary > 60000;
select * from Employee WHERE salary <= 45000;
select * from Employee WHERE department = "Developer" AND city = "Chennai";
SELECT * FROM Employee WHERE City = 'Madurai' OR City = 'Salem';
select * from Employee WHERE name LIKE "a%";
select * from Employee WHERE name LIKE "%a";
select * from Employee WHERE name LIKE "%a%";
select * from Employee WHERE city IN ('Chennai', 'Salem');
select * from Employee WHERE salary BETWEEN 45000 AND 70000;
select * from Employee ORDER BY salary DESC;
select * from Employee ORDER BY name ASC;
select * from Employee LIMIT 5;
select * from Employee ORDER BY salary DESC LIMIT 3;