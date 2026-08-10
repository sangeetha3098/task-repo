create database Company_DB ;
use company_db;
CREATE TABLE Employees (
id int primary key auto_increment,
name varchar(50),
department varchar(100),
salary int,
city varchar(100)
);

CREATE TABLE Department (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(50) NOT NULL
);

CREATE TABLE City (
    city_id INT PRIMARY KEY AUTO_INCREMENT,
    city_name VARCHAR(50)
);

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(100) ,
    salary DECIMAL(10,2),
    dept_id INT,
    city_id INT,

    FOREIGN KEY (dept_id) REFERENCES Department(dept_id),
    FOREIGN KEY (city_id) REFERENCES City(city_id)
);

alter table Employee ADD age int;
alter table Employee RENAME COLUMN age to userage;
alter table Employee MODIFY salary int;
alter table Employee Drop column emp_name;

Rename table Employees to EmployeeDetail;
ALTER TABLE Employee
ADD emp_name VARCHAR(100);

INSERT INTO Employee (emp_name, salary, dept_id, city_id)
VALUES
('Rahul Singh', 50000.00, 1, 1),
('Priya Sharma', 45000.00, 2, 2),
('Arun Kumar', 60000.00, 1, 3),
('Sneha Reddy', 55000.00, 3, 4),
('Vijay Kumar', 70000.00, 4, 1),
('Anjali Verma', 48000.00, 2, 3),
('Karthik Raj', 62000.00, 1, 2),
('Meena Devi', 53000.00, 3, 1),
('Ramesh Gupta', 58000.00, 4, 4),
('Divya Nair', 51000.00, 2, 2),
('Suresh Babu', 67000.00, 1, 3),
('Kavya Sri', 49000.00, 3, 1),
('Manoj Kumar', 72000.00, 4, 2),
('Lakshmi Priya', 56000.00, 2, 4),
('Ajith Kumar', 65000.00, 1, 1);

INSERT INTO Department (dept_name)
VALUES
('IT'),
('HR'),
('Finance'),
('Marketing');

INSERT INTO City (city_name)
VALUES
('Chennai'),
('Bangalore'),
('Hyderabad'),
('Pondicherry');

UPDATE Employee
SET salary = salary + 5000
WHERE dept_id = (
    SELECT dept_id
    FROM Department
    WHERE dept_name = 'IT'
);

UPDATE Employee
SET city_id = (
    SELECT city_id
    FROM City
    WHERE city_name = 'Chennai'
)
WHERE dept_id = (
    SELECT dept_id
    FROM Department
    WHERE dept_name = 'HR'
);

SET SQL_SAFE_UPDATES = 0;
DELETE FROM Employee
WHERE salary < 20000;

SELECT
    e.emp_id,
    e.emp_name,
    e.salary,
    d.dept_name,
    c.city_name
FROM Employee e
JOIN Department d
ON e.dept_id = d.dept_id
JOIN City c
ON e.city_id = c.city_id
WHERE e.salary > 40000
  AND e.salary < 60000
  AND c.city_name = 'Chennai';
  
  SELECT *
FROM Employee
ORDER BY salary DESC
LIMIT 5;

SELECT *
FROM Employee
ORDER BY salary ASC
LIMIT 3;

SELECT *
FROM Employee
WHERE emp_name LIKE 'A%';

SELECT
    e.emp_id,
    e.emp_name,
    e.salary,
    d.dept_name,
    c.city_name
FROM Employee e
JOIN Department d
ON e.dept_id = d.dept_id
JOIN City c
ON e.city_id = c.city_id
WHERE c.city_name IN ('Chennai', 'Salem', 'Madurai');

SELECT
    COUNT(*) AS total_employees,
    SUM(salary) AS total_salary,
    AVG(salary) AS average_salary,
    MAX(salary) AS highest_salary,
    MIN(salary) AS lowest_salary
FROM Employee;

SELECT
    department AS department,
    COUNT(*) AS employee_count
FROM EmployeeDetail
GROUP BY department;

SELECT
    city,
    AVG(salary) AS average_salary
FROM EmployeeDetail
GROUP BY city;

SELECT
    department AS department,
    COUNT(*) AS employee_count
FROM EmployeeDetail
GROUP BY department
HAVING COUNT(*) > 3;

SELECT
    city,
    AVG(salary) AS average_salary
FROM EmployeeDetail
GROUP BY city
HAVING AVG(salary) > 45000;

SELECT *
FROM EmployeeDetail
WHERE salary > (
    SELECT AVG(salary)
    FROM EmployeeDetail
);

SELECT *
FROM EmployeeDetail
WHERE department = (
    SELECT department
    FROM EmployeeDetail
    WHERE name = 'Rahul'
);



