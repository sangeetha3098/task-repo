use companydb;

CREATE TABLE EmployeeDetails (
 id INT PRIMARY KEY auto_increment,
 name VARCHAR(100),
 department VARCHAR(50),
 salary INT,
 city VARCHAR(50)
);

INSERT INTO EmployeeDetails
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

SELECT Department FROM EmployeeDetails GROUP BY Department;
SELECT Department, COUNT(*) AS Total_Employees FROM EmployeeDetails GROUP BY department;
SELECT Department, SUM(Salary) AS Total_Salary FROM EmployeeDetails GROUP BY department;
SELECT Department, AVG(Salary) AS Average_Salary FROM EmployeeDetails GROUP BY department;
SELECT Department, MAX(Salary) AS Highest_Salary FROM EmployeeDetails GROUP BY department;
SELECT Department, MIN(Salary) AS Lowest_Salary FROM EmployeeDetails GROUP BY department;

SELECT City, COUNT(*) AS Total_Employees FROM EmployeeDetails GROUP BY City;
SELECT City, MAX(Salary) AS Highest_Salary FROM EmployeeDetails GROUP BY City;
SELECT City, MIN(Salary) AS Lowest_Salary FROM EmployeeDetails GROUP BY City;
SELECT City, AVG(Salary) AS Average_Salary FROM EmployeeDetails GROUP BY City;
SELECT City, COUNT(*) AS Total_Employees, MAX(Salary) AS Highest_Salary, MIN(Salary) AS Lowest_Salary, AVG(Salary) AS Average_Salary FROM EmployeeDetails GROUP BY City ORDER BY Highest_Salary DESC;
SELECT Department, COUNT(*) AS Employee_Count, SUM(Salary) AS Total_Salary FROM EmployeeDetails GROUP BY Department ORDER BY Total_Salary DESC;
SELECT Department, City, COUNT(*) AS Employee_Count, AVG(Salary) AS Average_Salary FROM EmployeeDetails GROUP BY Department, City;

SELECT Department FROM EmployeeDetails GROUP BY Department;
SELECT Department, COUNT(*) AS Total_Employees FROM EmployeeDetails GROUP BY department;
SELECT Department, SUM(Salary) AS Total_Salary FROM EmployeeDetails GROUP BY department;
SELECT Department, AVG(Salary) AS Average_Salary FROM EmployeeDetails GROUP BY department;
SELECT Department, MAX(Salary) AS Highest_Salary FROM EmployeeDetails GROUP BY department;
SELECT Department, MIN(Salary) AS Lowest_Salary FROM EmployeeDetails GROUP BY department;
SELECT Department, SUM(Salary) AS Total_Salary FROM EmployeeDetails GROUP BY department ORDER BY Total_Salary DESC LIMIT 3;