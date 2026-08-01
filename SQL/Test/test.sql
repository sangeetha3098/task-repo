CREATE DATABASE Test;
use Test;

CREATE TABLE Employee (
id int primary key auto_increment,
name varchar(50),
department varchar(100),
salary int,
city varchar(100),
created_by varchar(50),
created_at date,
updated_by varchar(50),
updated_at date
);



INSERT INTO Employee
(name, department, salary, city, created_by, created_at, updated_by, updated_at)
VALUES
('Arun Kumar', 'IT', 55000, 'Chennai', 'Admin', '2026-07-01', 'Admin', '2026-07-01'),
('Priya Sharma', 'HR', 48000, 'Pondicherry', 'Admin', '2026-07-02', 'Admin', '2026-07-02'),
('Rahul Raj', 'Finance', 62000, 'Chennai', 'Admin', '2026-07-03', 'Manager', '2026-07-05'),
('Divya S', 'IT', 70000, 'Bangalore', 'Admin', '2026-07-04', 'Admin', '2026-07-04'),
('Karthik M', 'Marketing', 45000, 'Salem', 'Admin', '2026-07-05', 'HR', '2026-07-07');
SELECT * FROM Employee WHERE name = 'Rahul Raj';
DELETE FROM Employee WHERE id = 3;
SELECT * FROM Employee WHERE department = 'IT';
SELECT * FROM Employee WHERE salary > 50000;
SELECT * FROM Employee WHERE salary < 50000;
SELECT * FROM Employee WHERE salary >= 60000;
SELECT * FROM Employee WHERE salary <= 45000;
SELECT * FROM Employee WHERE city != 'Chennai';
SELECT * FROM Employee WHERE department = 'IT' AND city = 'Chennai';
SELECT * FROM Employee WHERE department = 'HR' OR department = 'Finance';
SELECT * FROM Employee WHERE city IN ('Chennai', 'Salem', 'Pondicherry');
SELECT * FROM Employee WHERE salary BETWEEN 45000 AND 70000;
SELECT * FROM Employee WHERE name LIKE 'A%';
SELECT * FROM Employee ORDER BY salary DESC LIMIT 1;
SELECT * FROM Employee ORDER BY salary ASC LIMIT 1;
SELECT * FROM Employee ORDER BY salary DESC LIMIT 5;
SELECT * FROM Employee ORDER BY name ASC;
SELECT * FROM Employee WHERE salary > 50000;
SELECT department, COUNT(*) AS total_employees FROM Employee GROUP BY department HAVING COUNT(*) > 1;
SELECT COUNT(*) AS total_employees FROM Employee;
SELECT SUM(salary) AS total_salary FROM Employee;
SELECT AVG(salary) AS average_salary FROM Employee;
SELECT MAX(salary) AS highest_salary FROM Employee;
SELECT MIN(salary) AS lowest_salary FROM Employee;
SELECT department, COUNT(*) AS employee_count, SUM(salary) AS total_salary, AVG(salary) AS average_salary FROM Employee GROUP BY department;
SELECT department, COUNT(*) AS employee_count FROM Employee GROUP BY department HAVING COUNT(*) > 3;

SELECT department, AVG(salary) AS average_salary FROM Employee GROUP BY department HAVING AVG(salary) > 50000;