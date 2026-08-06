use normal_db;

CREATE TABLE Departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100)
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100)
);

CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100),
    department_id INT,
    course_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

INSERT INTO Departments (department_name) VALUES
('Computer Science'),
('Electronics'),
('Mechanical');


INSERT INTO Courses (course_name) VALUES
('Java'),
('DBMS'),
('Python');


INSERT INTO Students (student_name, department_id, course_id) VALUES
('Alice', 1, 1),
('Bob', 2, 2),
('Charlie', 1, 3),
('David', 3, 2),
('Eva', 2, 1);

SELECT * FROM Departments;
SELECT * FROM Courses;
SELECT * FROM Students;

SELECT
    s.student_id,
    s.student_name,
    d.department_name,
    c.course_name
FROM Students s
INNER JOIN Departments d
ON s.department_id = d.department_id
INNER JOIN Courses c
ON s.course_id = c.course_id;

SELECT
    s.student_id,
    s.student_name,
    d.department_name,
    c.course_name
FROM Students s
LEFT JOIN Departments d
ON s.department_id = d.department_id
LEFT JOIN Courses c
ON s.course_id = c.course_id;

SELECT
    s.student_name,
    d.department_name
FROM Students s
RIGHT JOIN Departments d
ON s.department_id = d.department_id;