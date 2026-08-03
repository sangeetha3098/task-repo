create database normal_db;
use normal_db;

create table Election (

id int primary key auto_increment,
election_name varchar(100),
election_date date,
election_type varchar(50)

);

create table Constituency (
    constituency_id int primary key auto_increment,
    constituency_name varchar(100)
    
);

create table PollingBooth (
    booth_id INT PRIMARY KEY AUTO_INCREMENT,
    booth_name VARCHAR(100),
    booth_address VARCHAR(255),
    constituency_id INT,
    FOREIGN KEY (constituency_id)
    REFERENCES Constituency(constituency_id)
);

create table Voter (
    voter_id INT PRIMARY KEY AUTO_INCREMENT,
    voter_card_no VARCHAR(30) UNIQUE,
    voter_name VARCHAR(100),
    gender VARCHAR(10),
    dob DATE,
    phone VARCHAR(15),
    address VARCHAR(255),
    booth_id INT,
    FOREIGN KEY (booth_id)
    REFERENCES PollingBooth(booth_id)
);

INSERT INTO Election (election_name, election_date, election_type)
VALUES
('Lok Sabha Election 2024', '2024-04-19', 'General'),
('State Assembly Election 2026', '2026-05-10', 'State'),
('Local Body Election 2025', '2025-09-15', 'Local');

INSERT INTO Constituency (constituency_name)
VALUES
('Puducherry'),
('Villianur'),
('Lawspet'),
('Muthialpet'),
('Oulgaret');

INSERT INTO PollingBooth (booth_name, booth_address, constituency_id)
VALUES
('Booth 101', 'Government School, Puducherry', 1),
('Booth 102', 'Community Hall, Villianur', 2),
('Booth 103', 'Municipal Office, Lawspet', 3),
('Booth 104', 'Govt Higher Secondary School, Muthialpet', 4),
('Booth 105', 'Panchayat Office, Oulgaret', 5);

INSERT INTO Voter
(voter_card_no, voter_name, gender, dob, phone, address, booth_id)
VALUES
('TNV1001', 'Arun Kumar', 'Male', '1995-06-15', '9876543210', 'Puducherry', 1),
('TNV1002', 'Priya', 'Female', '1998-08-20', '9876543211', 'Villianur', 2),
('TNV1003', 'Rahul', 'Male', '1992-11-05', '9876543212', 'Lawspet', 3),
('TNV1004', 'Divya', 'Female', '1997-03-12', '9876543213', 'Muthialpet', 4),
('TNV1005', 'Karthik', 'Male', '1990-09-28', '9876543214', 'Oulgaret', 5),
('TNV1006', 'Meena', 'Female', '1996-12-18', '9876543215', 'Puducherry', 1),
('TNV1007', 'Suresh', 'Male', '1989-01-25', '9876543216', 'Villianur', 2),
('TNV1008', 'Anitha', 'Female', '1994-05-30', '9876543217', 'Lawspet', 3),
('TNV1009', 'Vignesh', 'Male', '1993-07-14', '9876543218', 'Muthialpet', 4),
('TNV1010', 'Lakshmi', 'Female', '1999-10-08', '9876543219', 'Oulgaret', 5);

select * from Voter;

CREATE TABLE Doctor (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    doctor_name VARCHAR(100),
    specialization VARCHAR(100),
    phone VARCHAR(15),
    experience INT
);

CREATE TABLE Patient (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_name VARCHAR(100),
    gender VARCHAR(10),
    dob DATE,
    phone VARCHAR(15),
    address VARCHAR(255)
);

CREATE TABLE Appointment (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    appointment_time TIME,
    status VARCHAR(20),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id)
);

CREATE TABLE Treatment (
    treatment_id INT PRIMARY KEY AUTO_INCREMENT,
    appointment_id INT,
    diagnosis VARCHAR(255),
    treatment_details VARCHAR(255),
    medicine VARCHAR(100),
    FOREIGN KEY (appointment_id) REFERENCES Appointment(appointment_id)
);

INSERT INTO Doctor (doctor_name, specialization, phone, experience)
VALUES
('Dr. Ravi Kumar', 'Cardiologist', '9876543210', 12),
('Dr. Meena', 'Dermatologist', '9876543211', 8),
('Dr. Arun', 'Orthopedic', '9876543212', 10),
('Dr. Priya', 'Pediatrician', '9876543213', 6),
('Dr. Karthik', 'Neurologist', '9876543214', 15);

INSERT INTO Patient (patient_name, gender, dob, phone, address)
VALUES
('Suresh', 'Male', '1995-05-15', '9000000001', 'Chennai'),
('Lakshmi', 'Female', '1998-08-20', '9000000002', 'Puducherry'),
('Rahul', 'Male', '1992-11-10', '9000000003', 'Villupuram'),
('Anitha', 'Female', '2000-01-18', '9000000004', 'Cuddalore'),
('Vignesh', 'Male', '1996-07-22', '9000000005', 'Salem'),
('Divya', 'Female', '1994-12-05', '9000000006', 'Madurai'),
('Karthik', 'Male', '1997-09-14', '9000000007', 'Trichy'),
('Priya', 'Female', '1993-03-28', '9000000008', 'Coimbatore');

INSERT INTO Appointment
(patient_id, doctor_id, appointment_date, appointment_time, status)
VALUES
(1, 1, '2026-08-01', '09:00:00', 'Completed'),
(2, 2, '2026-08-01', '10:00:00', 'Completed'),
(3, 3, '2026-08-02', '11:30:00', 'Pending'),
(4, 4, '2026-08-02', '02:00:00', 'Completed'),
(5, 5, '2026-08-03', '03:15:00', 'Completed'),
(6, 1, '2026-08-03', '10:30:00', 'Pending'),
(7, 2, '2026-08-04', '11:00:00', 'Completed'),
(8, 3, '2026-08-04', '04:00:00', 'Cancelled');

INSERT INTO Treatment
(appointment_id, diagnosis, treatment_details, medicine)
VALUES
(1, 'High Blood Pressure', 'BP monitored and advised diet control', 'Amlodipine'),
(2, 'Skin Allergy', 'Prescribed anti-allergy tablets', 'Cetirizine'),
(3, 'Knee Pain', 'Recommended physiotherapy sessions', 'Diclofenac'),
(4, 'Viral Fever', 'Rest and hydration advised', 'Paracetamol'),
(5, 'Migraine', 'Neurological evaluation completed', 'Sumatriptan'),
(6, 'Chest Pain', 'ECG and blood tests recommended', 'Aspirin'),
(7, 'Acne', 'Topical cream prescribed', 'Benzoyl Peroxide'),
(8, 'Back Pain', 'Appointment cancelled before treatment', 'None');

CREATE TABLE Department (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100)
);

CREATE TABLE Faculty (
    faculty_id INT PRIMARY KEY AUTO_INCREMENT,
    faculty_name VARCHAR(100),
    designation VARCHAR(100),
    phone VARCHAR(15),
    department_id INT,
    FOREIGN KEY (department_id)
    REFERENCES Department(department_id)
);

CREATE TABLE Student (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100),
    gender VARCHAR(10),
    dob DATE,
    phone VARCHAR(15),
    department_id INT,
    FOREIGN KEY (department_id)
    REFERENCES Department(department_id)
);

CREATE TABLE Course (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100),
    credits INT,
    department_id INT,
    faculty_id INT,
    FOREIGN KEY (department_id)
    REFERENCES Department(department_id),
    FOREIGN KEY (faculty_id)
    REFERENCES Faculty(faculty_id)
);

CREATE TABLE Attendance (
    attendance_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    attendance_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (student_id)
    REFERENCES Student(student_id),
    FOREIGN KEY (course_id)
    REFERENCES Course(course_id)
);

CREATE TABLE Examination (
    exam_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    exam_name VARCHAR(100),
    marks INT,
    result VARCHAR(20),
    FOREIGN KEY (student_id)
    REFERENCES Student(student_id),
    FOREIGN KEY (course_id)
    REFERENCES Course(course_id)
);

INSERT INTO Department (department_name)
VALUES
('Computer Science'),
('Information Technology'),
('Electronics and Communication'),
('Mechanical Engineering'),
('Civil Engineering');

INSERT INTO Faculty (faculty_name, designation, phone, department_id)
VALUES
('Dr. Ravi Kumar', 'Professor', '9876543210', 1),
('Dr. Meena', 'Associate Professor', '9876543211', 2),
('Mr. Arun', 'Assistant Professor', '9876543212', 3),
('Mrs. Priya', 'Lecturer', '9876543213', 4),
('Dr. Karthik', 'Professor', '9876543214', 5),
('Ms. Divya', 'Assistant Professor', '9876543215', 1),
('Mr. Suresh', 'Lecturer', '9876543216', 2);

INSERT INTO Student (student_name, gender, dob, phone, department_id)
VALUES
('Arun Kumar', 'Male', '2003-04-12', '9000000001', 1),
('Priya', 'Female', '2004-07-18', '9000000002', 2),
('Rahul', 'Male', '2003-09-25', '9000000003', 3),
('Anitha', 'Female', '2004-01-10', '9000000004', 4),
('Karthik', 'Male', '2003-11-15', '9000000005', 5),
('Divya', 'Female', '2004-05-20', '9000000006', 1),
('Suresh', 'Male', '2003-02-28', '9000000007', 2),
('Meena', 'Female', '2004-08-08', '9000000008', 3),
('Vignesh', 'Male', '2003-10-30', '9000000009', 4),
('Lakshmi', 'Female', '2004-12-15', '9000000010', 5);

INSERT INTO Course (course_name, credits, department_id, faculty_id)
VALUES
('Database Management System', 4, 1, 1),
('Web Technology', 3, 2, 2),
('Digital Electronics', 4, 3, 3),
('Thermodynamics', 3, 4, 4),
('Structural Engineering', 4, 5, 5),
('Data Structures', 4, 1, 6),
('Software Engineering', 3, 2, 7);

INSERT INTO Attendance (student_id, course_id, attendance_date, status)
VALUES
(1, 1, '2026-08-01', 'Present'),
(2, 2, '2026-08-01', 'Absent'),
(3, 3, '2026-08-01', 'Present'),
(4, 4, '2026-08-01', 'Present'),
(5, 5, '2026-08-01', 'Absent'),
(6, 6, '2026-08-02', 'Present'),
(7, 7, '2026-08-02', 'Present'),
(8, 3, '2026-08-02', 'Absent'),
(9, 4, '2026-08-02', 'Present'),
(10, 5, '2026-08-02', 'Present');

INSERT INTO Examination (student_id, course_id, exam_name, marks, result) VALUES
(1, 1, 'Mid Semester', 88, 'Pass'),
(2, 2, 'Mid Semester', 75, 'Pass'),
(3, 3, 'Mid Semester', 92, 'Pass'),
(4, 4, 'Mid Semester', 68, 'Pass'),
(5, 5, 'Mid Semester', 40, 'Fail'),
(6, 6, 'Mid Semester', 81, 'Pass'),
(7, 7, 'Mid Semester', 79, 'Pass'),
(8, 3, 'Mid Semester', 56, 'Pass'),
(9, 4, 'Mid Semester', 63, 'Pass'),
(10, 5, 'Mid Semester', 91, 'Pass');