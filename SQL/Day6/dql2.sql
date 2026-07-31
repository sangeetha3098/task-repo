use companydb;
CREATE TABLE EmployeeData (
 id INT PRIMARY KEY auto_increment,
 name VARCHAR(100),
 department VARCHAR(50),
 salary INT,
 city VARCHAR(50),
 created_by VARCHAR(50),
 created_at Date,
 updated_by VARCHAR(50),
 updated_at Date
);

USE companydb;

INSERT INTO EmployeeData
(name, department, salary, city, created_by, created_at, updated_by, updated_at)
VALUES
('Arun Kumar', 'IT', 55000, 'Chennai', 'Admin', '2026-07-01', 'Admin', '2026-07-01'),
('Priya Sharma', 'HR', 48000, 'Pondicherry', 'Admin', '2026-07-02', 'Admin', '2026-07-02'),
('Rahul Raj', 'Finance', 62000, 'Chennai', 'Admin', '2026-07-03', 'Manager', '2026-07-05'),
('Divya S', 'IT', 70000, 'Bangalore', 'Admin', '2026-07-04', 'Admin', '2026-07-04'),
('Karthik M', 'Marketing', 45000, 'Salem', 'Admin', '2026-07-05', 'HR', '2026-07-07'),
('Sneha R', 'IT', 65000, 'Pondicherry', 'Admin', '2026-07-06', 'Admin', '2026-07-06'),
('Vijay Kumar', 'Sales', 52000, 'Chennai', 'Admin', '2026-07-07', 'Manager', '2026-07-10'),
('Anitha P', 'HR', 47000, 'Coimbatore', 'Admin', '2026-07-08', 'Admin', '2026-07-08'),
('Suresh B', 'Finance', 58000, 'Madurai', 'Admin', '2026-07-09', 'Manager', '2026-07-12'),
('Meena K', 'IT', 72000, 'Bangalore', 'Admin', '2026-07-10', 'Admin', '2026-07-10'),
('Ajay R', 'Sales', 49000, 'Salem', 'Admin', '2026-07-11', 'HR', '2026-07-13'),
('Lakshmi V', 'Marketing', 56000, 'Chennai', 'Admin', '2026-07-12', 'Admin', '2026-07-12'),
('Dinesh K', 'IT', 68000, 'Coimbatore', 'Admin', '2026-07-13', 'Manager', '2026-07-15'),
('Pooja S', 'Finance', 61000, 'Pondicherry', 'Admin', '2026-07-14', 'Admin', '2026-07-14'),
('Manoj T', 'HR', 50000, 'Madurai', 'Admin', '2026-07-15', 'HR', '2026-07-17'),
('Swetha N', 'Marketing', 54000, 'Chennai', 'Admin', '2026-07-16', 'Admin', '2026-07-16'),
('Naveen P', 'IT', 75000, 'Bangalore', 'Admin', '2026-07-17', 'Manager', '2026-07-20'),
('Keerthana R', 'Sales', 46000, 'Salem', 'Admin', '2026-07-18', 'Admin', '2026-07-18'),
('Mohan S', 'Finance', 63000, 'Chennai', 'Admin', '2026-07-19', 'Manager', '2026-07-22'),
('Harini M', 'IT', 59000, 'Pondicherry', 'Admin', '2026-07-20', 'Admin', '2026-07-20');


ALTER TABLE EmployeeData ADD COLUMN email VARCHAR(100);
ALTER TABLE EmployeeData MODIFY salary bigint ;
ALTER TABLE EmployeeData RENAME COLUMN city to location; 
UPDATE EmployeeData SET salary = 75000 WHERE id = 3;
UPDATE EmployeeData SET department = "Marketing" WHERE id=3;
UPDATE EmployeeData SET salary = 60000, location="Banglore" WHERE id=3;

DELETE FROM EmployeeData WHERE id=2;
SELECT location
FROM EmployeeData
WHERE location = 'Pondicherry';
DELETE FROM EmployeeData
WHERE id IN (6, 14, 20);
select * from EmployeeData;

Select name , salary from EmployeeData ;
Select * from EmployeeData WHERE salary > 40000;
SELECT Department, MAX(Salary) AS Highest_Salary FROM EmployeeData GROUP BY department;
SELECT Department, MIN(Salary) AS Lowest_Salary FROM EmployeeData GROUP BY department;
SELECT Department, COUNT(*) AS Total_Employees FROM EmployeeData GROUP BY department;
SELECT department, COUNT(*) AS total_employees FROM EmployeeData GROUP BY department HAVING COUNT(*) > 2;
SELECT location, AVG(salary) AS average_salary FROM EmployeeData GROUP BY location HAVING AVG(salary) > 50000;
SELECT department, SUM(salary) AS total_salary FROM EmployeeData GROUP BY department HAVING SUM(salary) > 200000;

