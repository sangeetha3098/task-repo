use dml_db;

select * from employees;

select * from employees where salary > (select avg(salary) from employees);

select * from employees where salary >= (select max(salary) from employees);

select * from employees where salary <= (select min(salary) from employees);

select * from employees where department = ( select department from employees where name = "Priya");

select * from employees where department IN  (select department from employees where salary > 40000);

select * from employees where salary < (select max(Salary) from employees);

select * from employees where salary > (select min(Salary) from employees);