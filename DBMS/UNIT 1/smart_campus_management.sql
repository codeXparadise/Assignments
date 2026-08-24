-- =====================================================================
-- SMART CAMPUS MANAGEMENT SYSTEM
-- DBMS ASSIGNMENT - SCHEMA CREATION (PART C)
-- Modules: Student Management, Faculty Management, Attendance,
--          Examination, Placement Cell
-- =====================================================================

DROP DATABASE IF EXISTS smart_campus_db;
CREATE DATABASE smart_campus_db;
USE smart_campus_db;

-- ---------------------------------------------------------------------
-- 1. DEPARTMENT  (lookup table, removes repeating dept info -> 3NF)
-- ---------------------------------------------------------------------
CREATE TABLE Department (
    dept_id        INT PRIMARY KEY AUTO_INCREMENT,
    dept_name      VARCHAR(50) NOT NULL UNIQUE,
    dept_head      VARCHAR(50) NOT NULL,
    dept_building  VARCHAR(30) DEFAULT 'Main Block'
);

-- ---------------------------------------------------------------------
-- 2. STUDENT
-- ---------------------------------------------------------------------
CREATE TABLE Student (
    student_id       INT PRIMARY KEY AUTO_INCREMENT,
    roll_no          VARCHAR(15) NOT NULL UNIQUE,
    full_name        VARCHAR(60) NOT NULL,
    dept_id          INT,
    admission_year   INT CHECK (admission_year BETWEEN 2015 AND 2030),
    email            VARCHAR(80) UNIQUE,
    phone            VARCHAR(15),
    dob              DATE,
    gender           CHAR(1) CHECK (gender IN ('M','F','O')),
    cgpa             DECIMAL(3,2) DEFAULT 0.00 CHECK (cgpa BETWEEN 0 AND 10),
    CONSTRAINT fk_student_dept FOREIGN KEY (dept_id)
        REFERENCES Department(dept_id) ON DELETE SET NULL
);

-- ---------------------------------------------------------------------
-- 3. FACULTY
-- ---------------------------------------------------------------------
CREATE TABLE Faculty (
    faculty_id     INT PRIMARY KEY AUTO_INCREMENT,
    full_name      VARCHAR(60) NOT NULL,
    dept_id        INT,
    designation    VARCHAR(30) DEFAULT 'Assistant Professor',
    email          VARCHAR(80) UNIQUE,
    phone          VARCHAR(15),
    salary         DECIMAL(10,2) CHECK (salary > 0),
    join_date      DATE DEFAULT (CURRENT_DATE),
    CONSTRAINT fk_faculty_dept FOREIGN KEY (dept_id)
        REFERENCES Department(dept_id) ON DELETE SET NULL
);

-- ---------------------------------------------------------------------
-- 4. COURSE  (bridges Student/Faculty modules to Attendance/Exam)
-- ---------------------------------------------------------------------
CREATE TABLE Course (
    course_id     INT PRIMARY KEY AUTO_INCREMENT,
    course_name   VARCHAR(60) NOT NULL,
    dept_id       INT,
    faculty_id    INT,
    credits       INT CHECK (credits BETWEEN 1 AND 6),
    semester      INT CHECK (semester BETWEEN 1 AND 8),
    CONSTRAINT fk_course_dept FOREIGN KEY (dept_id)
        REFERENCES Department(dept_id) ON DELETE SET NULL,
    CONSTRAINT fk_course_faculty FOREIGN KEY (faculty_id)
        REFERENCES Faculty(faculty_id) ON DELETE SET NULL
);

-- ---------------------------------------------------------------------
-- 5. ATTENDANCE
-- ---------------------------------------------------------------------
CREATE TABLE Attendance (
    attendance_id     INT PRIMARY KEY AUTO_INCREMENT,
    student_id        INT NOT NULL,
    course_id         INT NOT NULL,
    attendance_date   DATE NOT NULL,
    status            VARCHAR(10) DEFAULT 'Present' CHECK (status IN ('Present','Absent')),
    CONSTRAINT fk_att_student FOREIGN KEY (student_id)
        REFERENCES Student(student_id) ON DELETE CASCADE,
    CONSTRAINT fk_att_course FOREIGN KEY (course_id)
        REFERENCES Course(course_id) ON DELETE CASCADE,
    CONSTRAINT uq_attendance UNIQUE (student_id, course_id, attendance_date)
);

-- ---------------------------------------------------------------------
-- 6. EXAMINATION
-- ---------------------------------------------------------------------
CREATE TABLE Examination (
    exam_id      INT PRIMARY KEY AUTO_INCREMENT,
    exam_name    VARCHAR(40) NOT NULL,
    course_id    INT NOT NULL,
    exam_date    DATE,
    max_marks    INT DEFAULT 100 CHECK (max_marks > 0),
    CONSTRAINT fk_exam_course FOREIGN KEY (course_id)
        REFERENCES Course(course_id) ON DELETE CASCADE
);

-- ---------------------------------------------------------------------
-- 7. RESULT
-- ---------------------------------------------------------------------
CREATE TABLE Result (
    result_id        INT PRIMARY KEY AUTO_INCREMENT,
    student_id        INT NOT NULL,
    exam_id           INT NOT NULL,
    marks_obtained    DECIMAL(5,2) CHECK (marks_obtained >= 0),
    grade             CHAR(2),
    CONSTRAINT fk_result_student FOREIGN KEY (student_id)
        REFERENCES Student(student_id) ON DELETE CASCADE,
    CONSTRAINT fk_result_exam FOREIGN KEY (exam_id)
        REFERENCES Examination(exam_id) ON DELETE CASCADE,
    CONSTRAINT uq_result UNIQUE (student_id, exam_id)
);

-- ---------------------------------------------------------------------
-- 8. PLACEMENT_DRIVE
-- ---------------------------------------------------------------------
CREATE TABLE Placement_Drive (
    drive_id           INT PRIMARY KEY AUTO_INCREMENT,
    company_name       VARCHAR(60) NOT NULL,
    drive_date         DATE,
    package_offered    DECIMAL(6,2) CHECK (package_offered > 0),
    eligibility_cgpa   DECIMAL(3,1) DEFAULT 6.0
);

-- ---------------------------------------------------------------------
-- 9. PLACEMENT_RECORD
-- ---------------------------------------------------------------------
CREATE TABLE Placement_Record (
    placement_id    INT PRIMARY KEY AUTO_INCREMENT,
    student_id      INT NOT NULL,
    drive_id        INT NOT NULL,
    status          VARCHAR(15) DEFAULT 'Applied'
                        CHECK (status IN ('Applied','Shortlisted','Selected','Rejected')),
    CONSTRAINT fk_place_student FOREIGN KEY (student_id)
        REFERENCES Student(student_id) ON DELETE CASCADE,
    CONSTRAINT fk_place_drive FOREIGN KEY (drive_id)
        REFERENCES Placement_Drive(drive_id) ON DELETE CASCADE,
    CONSTRAINT uq_placement UNIQUE (student_id, drive_id)
);
-- =====================================================================
-- PART D - DATA ENTRY (minimum 20 records in each main table)
-- =====================================================================

INSERT INTO Department (dept_id, dept_name, dept_head, dept_building) VALUES
(1, 'Computer Science', 'Dr. Anil Deshmukh', 'A Block'),
(2, 'Artificial Intelligence', 'Dr. Suvarna Rane', 'B Block'),
(3, 'Electronics', 'Dr. Mahesh Kulkarni', 'C Block'),
(4, 'Mechanical', 'Dr. Ramesh Iyer', 'D Block'),
(5, 'Commerce', 'Dr. Kavita Shah', 'E Block'),
(6, 'Mathematics', 'Dr. Sunil Patil', 'A Block');

INSERT INTO Student (student_id, roll_no, full_name, dept_id, admission_year, email, phone, dob, gender, cgpa) VALUES
(1, 'FDAI001', 'Krishna Sharma', 3, 2023, 'krishna.sharma1@campus.edu.in', '9339670711', '2004-12-04', 'M', 8.24),
(2, 'FDAI002', 'Aditya Sharma', 1, 2023, 'aditya.sharma2@campus.edu.in', '9349817734', '2003-09-07', 'F', 6.84),
(3, 'FDAI003', 'Meera Reddy', 1, 2023, 'meera.reddy3@campus.edu.in', '9849621470', '2006-06-09', 'M', 6.82),
(4, 'FDAI004', 'Karan Shah', 1, 2024, 'karan.shah4@campus.edu.in', '9203848421', '2005-06-20', 'F', 9.07),
(5, 'FDAI005', 'Tanvi Malhotra', 1, 2024, 'tanvi.malhotra5@campus.edu.in', '9184611066', '2005-11-20', 'F', 8.19),
(6, 'FDAI006', 'Arjun Verma', 2, 2024, 'arjun.verma6@campus.edu.in', '9185675980', '2004-02-13', 'F', 7.72),
(7, 'FDAI007', 'Aditi Gupta', 3, 2024, 'aditi.gupta7@campus.edu.in', '9324956459', '2005-12-22', 'M', 8.31),
(8, 'FDAI008', 'Ananya Malhotra', 2, 2023, 'ananya.malhotra8@campus.edu.in', '9596348124', '2006-05-21', 'M', 8.6),
(9, 'FDAI009', 'Vihaan Nair', 1, 2024, 'vihaan.nair9@campus.edu.in', '9530747414', '2005-02-07', 'F', 6.81),
(10, 'FDAI010', 'Dev Kulkarni', 5, 2023, 'dev.kulkarni10@campus.edu.in', '9384412919', '2004-04-24', 'F', 8.84),
(11, 'FDAI011', 'Neha Bhatt', 5, 2024, 'neha.bhatt11@campus.edu.in', '9335493870', '2004-09-16', 'M', 8.87),
(12, 'FDAI012', 'Krishna Mehta', 2, 2025, 'krishna.mehta12@campus.edu.in', '9553290810', '2003-07-13', 'F', 8.01),
(13, 'FDAI013', 'Simran Sharma', 1, 2025, 'simran.sharma13@campus.edu.in', '9676567501', '2005-11-11', 'M', 7.12),
(14, 'FDAI014', 'Ananya Pillai', 1, 2025, 'ananya.pillai14@campus.edu.in', '9872751234', '2005-09-25', 'M', 7.93),
(15, 'FDAI015', 'Reyansh Rao', 2, 2023, 'reyansh.rao15@campus.edu.in', '9501486939', '2004-09-25', 'M', 8.28),
(16, 'FDAI016', 'Dev Sharma', 1, 2024, 'dev.sharma16@campus.edu.in', '9992994062', '2005-04-02', 'M', 9.34),
(17, 'FDAI017', 'Sai Patel', 5, 2023, 'sai.patel17@campus.edu.in', '9916690353', '2004-03-22', 'F', 9.6),
(18, 'FDAI018', 'Ananya Reddy', 5, 2023, 'ananya.reddy18@campus.edu.in', '9679064766', '2004-12-10', 'F', 9.78),
(19, 'FDAI019', 'Aditi Pillai', 5, 2023, 'aditi.pillai19@campus.edu.in', '9366186631', '2004-02-11', 'M', 8.24),
(20, 'FDAI020', 'Kiara Bhatt', 2, 2023, 'kiara.bhatt20@campus.edu.in', '9176228245', '2003-04-03', 'M', 9.27);

INSERT INTO Faculty (faculty_id, full_name, dept_id, designation, email, phone, salary, join_date) VALUES
(1, 'Prof. Arjun Kapoor', 2, 'Professor', 'arjun.kapoor1@campus.edu.in', '9818309417', 76812, '2018-09-05'),
(2, 'Prof. Kavya Bhatt', 4, 'Associate Professor', 'kavya.bhatt2@campus.edu.in', '9942478695', 75996, '2021-04-04'),
(3, 'Prof. Reyansh Chavan', 3, 'Lecturer', 'reyansh.chavan3@campus.edu.in', '9541417711', 75606, '2015-11-21'),
(4, 'Prof. Reyansh Verma', 4, 'Professor', 'reyansh.verma4@campus.edu.in', '9959629660', 101470, '2016-04-07'),
(5, 'Prof. Saanvi Malhotra', 4, 'Associate Professor', 'saanvi.malhotra5@campus.edu.in', '9552991960', 57025, '2019-08-08'),
(6, 'Prof. Arjun Pillai', 5, 'Assistant Professor', 'arjun.pillai6@campus.edu.in', '9154318806', 87738, '2023-01-03'),
(7, 'Prof. Myra Gupta', 4, 'Lecturer', 'myra.gupta7@campus.edu.in', '9616854671', 59008, '2021-01-06'),
(8, 'Prof. Priya Sharma', 4, 'Professor', 'priya.sharma8@campus.edu.in', '9941889393', 96454, '2022-05-14'),
(9, 'Prof. Simran Agarwal', 2, 'Associate Professor', 'simran.agarwal9@campus.edu.in', '9418587604', 59267, '2015-10-24'),
(10, 'Prof. Raj Verma', 6, 'Professor', 'raj.verma10@campus.edu.in', '9161380746', 48286, '2024-08-17'),
(11, 'Prof. Om Gupta', 1, 'Assistant Professor', 'om.gupta11@campus.edu.in', '9299528037', 49490, '2024-02-22'),
(12, 'Prof. Myra Kulkarni', 1, 'Associate Professor', 'myra.kulkarni12@campus.edu.in', '9721609600', 83962, '2015-10-03'),
(13, 'Prof. Pooja Bhatt', 5, 'Professor', 'pooja.bhatt13@campus.edu.in', '9379995032', 58386, '2020-04-09'),
(14, 'Prof. Sneha Mehta', 6, 'Professor', 'sneha.mehta14@campus.edu.in', '9590941149', 65720, '2016-01-15'),
(15, 'Prof. Isha Bhatt', 1, 'Assistant Professor', 'isha.bhatt15@campus.edu.in', '9677280546', 58969, '2023-05-05'),
(16, 'Prof. Nikhil Patel', 2, 'Professor', 'nikhil.patel16@campus.edu.in', '9406002884', 55338, '2022-09-23'),
(17, 'Prof. Ira Singh', 6, 'Assistant Professor', 'ira.singh17@campus.edu.in', '9817112652', 98549, '2023-05-22'),
(18, 'Prof. Reyansh Mehta', 3, 'Assistant Professor', 'reyansh.mehta18@campus.edu.in', '9214929002', 93655, '2023-03-09'),
(19, 'Prof. Pari Singh', 2, 'Professor', 'pari.singh19@campus.edu.in', '9318610946', 90055, '2019-09-16'),
(20, 'Prof. Anika Verma', 1, 'Lecturer', 'anika.verma20@campus.edu.in', '9990505735', 63132, '2015-01-11');

INSERT INTO Course (course_id, course_name, dept_id, faculty_id, credits, semester) VALUES
(1, 'Database Management Systems', 2, 9, 2, 6),
(2, 'Data Structures', 4, 18, 4, 4),
(3, 'Python Programming', 5, 1, 2, 1),
(4, 'Machine Learning', 6, 5, 4, 1),
(5, 'Computer Networks', 3, 19, 4, 2),
(6, 'Operating Systems', 4, 5, 2, 3),
(7, 'Web Development', 3, 2, 3, 2),
(8, 'Artificial Intelligence Basics', 6, 8, 4, 1),
(9, 'Discrete Mathematics', 3, 18, 3, 5),
(10, 'Digital Electronics', 6, 5, 2, 2),
(11, 'Software Engineering', 2, 14, 2, 2),
(12, 'Cloud Computing', 6, 11, 3, 6),
(13, 'Cyber Security', 6, 8, 3, 2),
(14, 'Data Analytics', 6, 4, 3, 1),
(15, 'Mobile App Development', 4, 8, 2, 4),
(16, 'Java Programming', 3, 10, 2, 2),
(17, 'Statistics for AI', 1, 7, 3, 3),
(18, 'Linear Algebra', 3, 3, 3, 3),
(19, 'Object Oriented Programming', 6, 17, 3, 6),
(20, 'Computer Graphics', 5, 11, 2, 1);

INSERT INTO Attendance (attendance_id, student_id, course_id, attendance_date, status) VALUES
(1, 9, 6, '2026-05-09', 'Present'),
(2, 20, 14, '2026-03-24', 'Present'),
(3, 14, 20, '2026-05-04', 'Present'),
(4, 19, 7, '2026-03-02', 'Present'),
(5, 1, 17, '2026-07-18', 'Present'),
(6, 7, 12, '2026-04-03', 'Absent'),
(7, 11, 20, '2026-03-22', 'Absent'),
(8, 10, 17, '2026-03-22', 'Present'),
(9, 13, 10, '2026-05-05', 'Present'),
(10, 13, 6, '2026-05-19', 'Present'),
(11, 18, 1, '2026-03-10', 'Present'),
(12, 19, 20, '2026-06-11', 'Present'),
(13, 15, 7, '2026-05-16', 'Present'),
(14, 6, 3, '2026-03-17', 'Present'),
(15, 20, 11, '2026-01-27', 'Absent'),
(16, 8, 10, '2026-02-26', 'Present'),
(17, 1, 2, '2026-02-16', 'Present'),
(18, 3, 15, '2026-04-21', 'Present'),
(19, 13, 16, '2026-04-08', 'Present'),
(20, 1, 4, '2026-07-14', 'Present'),
(21, 17, 15, '2026-01-18', 'Present'),
(22, 4, 15, '2026-02-26', 'Present'),
(23, 17, 18, '2026-05-11', 'Absent'),
(24, 15, 20, '2026-07-24', 'Absent'),
(25, 14, 18, '2026-04-06', 'Present'),
(26, 16, 15, '2026-03-25', 'Present'),
(27, 9, 17, '2026-04-21', 'Present'),
(28, 15, 3, '2026-06-10', 'Present'),
(29, 11, 11, '2026-05-03', 'Present'),
(30, 8, 13, '2026-06-05', 'Present');

INSERT INTO Examination (exam_id, exam_name, course_id, exam_date, max_marks) VALUES
(1, 'Unit Test 1', 14, '2026-07-11', 100),
(2, 'End Semester Exam', 2, '2026-05-27', 100),
(3, 'End Semester Exam', 19, '2026-04-28', 100),
(4, 'End Semester Exam', 1, '2026-06-10', 100),
(5, 'End Semester Exam', 18, '2026-05-16', 50),
(6, 'Mid Semester Exam', 14, '2026-07-01', 100),
(7, 'Mid Semester Exam', 13, '2026-05-27', 100),
(8, 'Unit Test 2', 20, '2026-04-13', 50),
(9, 'Unit Test 1', 14, '2026-05-28', 100),
(10, 'Unit Test 2', 2, '2026-06-13', 100),
(11, 'Unit Test 2', 15, '2026-06-11', 100),
(12, 'Mid Semester Exam', 14, '2026-06-27', 50),
(13, 'End Semester Exam', 1, '2026-04-12', 50),
(14, 'Unit Test 1', 2, '2026-04-08', 50),
(15, 'Unit Test 1', 20, '2026-05-08', 50),
(16, 'End Semester Exam', 4, '2026-05-15', 100),
(17, 'Mid Semester Exam', 6, '2026-04-25', 50),
(18, 'Mid Semester Exam', 4, '2026-04-10', 100),
(19, 'End Semester Exam', 7, '2026-04-19', 50),
(20, 'Unit Test 1', 10, '2026-04-26', 50);

INSERT INTO Result (result_id, student_id, exam_id, marks_obtained, grade) VALUES
(1, 12, 18, 65.7, 'C'),
(2, 12, 3, 70.4, 'B'),
(3, 11, 1, 91.0, 'A+'),
(4, 16, 4, 66.0, 'C'),
(5, 12, 15, 41.2, 'A'),
(6, 14, 6, 84.0, 'A'),
(7, 9, 20, 44.2, 'A'),
(8, 18, 16, 67.9, 'C'),
(9, 19, 9, 59.3, 'D'),
(10, 8, 3, 56.7, 'D'),
(11, 15, 8, 42.5, 'A'),
(12, 19, 20, 40.0, 'A'),
(13, 16, 11, 50.9, 'D'),
(14, 7, 12, 43.9, 'A'),
(15, 11, 9, 92.8, 'A+'),
(16, 9, 18, 40.6, 'F'),
(17, 7, 3, 54.5, 'D'),
(18, 14, 16, 73.3, 'B'),
(19, 8, 16, 78.8, 'B'),
(20, 16, 15, 43.8, 'A'),
(21, 3, 10, 53.3, 'D'),
(22, 8, 10, 79.8, 'B'),
(23, 12, 16, 73.2, 'B'),
(24, 12, 14, 49.9, 'A+'),
(25, 18, 11, 61.1, 'C');

INSERT INTO Placement_Drive (drive_id, company_name, drive_date, package_offered, eligibility_cgpa) VALUES
(1, 'TCS', '2026-04-09', 6.11, 6.5),
(2, 'Infosys', '2026-01-24', 5.14, 6.0),
(3, 'Wipro', '2026-06-18', 11.58, 6.5),
(4, 'Accenture', '2026-02-07', 9.78, 7.0),
(5, 'Capgemini', '2026-06-19', 11.8, 7.0),
(6, 'Cognizant', '2026-01-27', 5.15, 6.5),
(7, 'IBM India', '2026-03-06', 6.07, 6.5),
(8, 'Amazon', '2026-03-02', 11.78, 7.0),
(9, 'Deloitte', '2026-06-05', 8.92, 7.5),
(10, 'EY', '2026-01-28', 3.6, 7.0),
(11, 'Tech Mahindra', '2026-04-16', 7.24, 6.5),
(12, 'HCL Technologies', '2026-01-09', 11.5, 7.5),
(13, 'Zoho', '2026-01-27', 4.06, 7.5),
(14, 'Persistent Systems', '2026-01-19', 8.85, 6.0),
(15, 'L&T Infotech', '2026-02-05', 10.39, 7.0);

INSERT INTO Placement_Record (placement_id, student_id, drive_id, status) VALUES
(1, 3, 4, 'Applied'),
(2, 14, 10, 'Shortlisted'),
(3, 20, 4, 'Selected'),
(4, 13, 8, 'Rejected'),
(5, 10, 14, 'Shortlisted'),
(6, 14, 5, 'Shortlisted'),
(7, 2, 10, 'Rejected'),
(8, 4, 13, 'Applied'),
(9, 7, 5, 'Selected'),
(10, 6, 4, 'Applied'),
(11, 3, 3, 'Applied'),
(12, 15, 12, 'Shortlisted'),
(13, 10, 1, 'Applied'),
(14, 10, 12, 'Rejected'),
(15, 3, 11, 'Applied'),
(16, 9, 13, 'Selected'),
(17, 19, 11, 'Selected'),
(18, 7, 7, 'Applied'),
(19, 8, 11, 'Applied'),
(20, 9, 14, 'Applied');
-- =====================================================================
-- PART E - SQL QUERIES
-- =====================================================================

-- ***********************************************************
-- 1. RETRIEVAL QUERIES (10)
-- ***********************************************************

-- 1.1 Show all students
SELECT * FROM Student;

-- 1.2 Show name, roll number and cgpa of students, highest cgpa first
SELECT full_name, roll_no, cgpa FROM Student ORDER BY cgpa DESC;

-- 1.3 Show all faculty members from the Artificial Intelligence department
SELECT full_name, designation, email
FROM Faculty
WHERE dept_id = (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence');

-- 1.4 Show students who took admission in 2024
SELECT roll_no, full_name, admission_year FROM Student WHERE admission_year = 2024;

-- 1.5 Show all courses that carry 4 credits
SELECT course_name, credits, semester FROM Course WHERE credits = 4;

-- 1.6 Show all placement drives offering package above 8 LPA
SELECT company_name, drive_date, package_offered FROM Placement_Drive WHERE package_offered > 8;

-- 1.7 Show top 5 students by cgpa
SELECT full_name, roll_no, cgpa FROM Student ORDER BY cgpa DESC LIMIT 5;

-- 1.8 Show all exams scheduled after 1st May 2026
SELECT exam_name, exam_date, max_marks FROM Examination WHERE exam_date > '2026-05-01';

-- 1.9 Show student details along with their department name
SELECT s.roll_no, s.full_name, d.dept_name
FROM Student s, Department d
WHERE s.dept_id = d.dept_id;

-- 1.10 Show distinct designations used by faculty members
SELECT DISTINCT designation FROM Faculty;


-- ***********************************************************
-- 2. AGGREGATE FUNCTION QUERIES (5)
-- ***********************************************************

-- 2.1 Total number of students in the campus
SELECT COUNT(*) AS total_students FROM Student;

-- 2.2 Average cgpa of all students
SELECT ROUND(AVG(cgpa),2) AS average_cgpa FROM Student;

-- 2.3 Highest and lowest package offered across all placement drives
SELECT MAX(package_offered) AS highest_package, MIN(package_offered) AS lowest_package
FROM Placement_Drive;

-- 2.4 Number of students in each department
SELECT d.dept_name, COUNT(s.student_id) AS total_students
FROM Department d
LEFT JOIN Student s ON d.dept_id = s.dept_id
GROUP BY d.dept_name;

-- 2.5 Total salary paid by the campus to faculty of each department
SELECT d.dept_name, SUM(f.salary) AS total_salary
FROM Department d
JOIN Faculty f ON d.dept_id = f.dept_id
GROUP BY d.dept_name;


-- ***********************************************************
-- 3. JOIN QUERIES (5)
-- ***********************************************************

-- 3.1 List every student with the course they attend and the class faculty (INNER JOIN, 3 tables)
SELECT s.full_name AS student, c.course_name, f.full_name AS faculty
FROM Attendance a
JOIN Student s ON a.student_id = s.student_id
JOIN Course c ON a.course_id = c.course_id
JOIN Faculty f ON c.faculty_id = f.faculty_id;

-- 3.2 List each student's marks together with the exam and course name
SELECT s.full_name AS student, e.exam_name, c.course_name, r.marks_obtained, r.grade
FROM Result r
JOIN Student s ON r.student_id = s.student_id
JOIN Examination e ON r.exam_id = e.exam_id
JOIN Course c ON e.course_id = c.course_id;

-- 3.3 LEFT JOIN - show every student even if they never applied for placement
SELECT s.full_name, pd.company_name, pr.status
FROM Student s
LEFT JOIN Placement_Record pr ON s.student_id = pr.student_id
LEFT JOIN Placement_Drive pd ON pr.drive_id = pd.drive_id
ORDER BY s.full_name;

-- 3.4 List courses along with the department and the faculty teaching them
SELECT c.course_name, d.dept_name, f.full_name AS faculty_name
FROM Course c
JOIN Department d ON c.dept_id = d.dept_id
JOIN Faculty f ON c.faculty_id = f.faculty_id;

-- 3.5 RIGHT JOIN - show all placement drives and the students placed in them, if any
SELECT pd.company_name, s.full_name, pr.status
FROM Placement_Record pr
RIGHT JOIN Placement_Drive pd ON pr.drive_id = pd.drive_id
LEFT JOIN Student s ON pr.student_id = s.student_id;


-- ***********************************************************
-- 4. NESTED (SUBQUERY) QUERIES (5)
-- ***********************************************************

-- 4.1 Students whose cgpa is above the campus average
SELECT full_name, cgpa
FROM Student
WHERE cgpa > (SELECT AVG(cgpa) FROM Student);

-- 4.2 Faculty who earn more than the average salary of their own department
SELECT full_name, dept_id, salary
FROM Faculty f
WHERE salary > (
    SELECT AVG(salary) FROM Faculty WHERE dept_id = f.dept_id
);

-- 4.3 Students who have been selected in at least one placement drive
SELECT full_name, roll_no
FROM Student
WHERE student_id IN (
    SELECT student_id FROM Placement_Record WHERE status = 'Selected'
);

-- 4.4 Courses that currently have no exam scheduled
SELECT course_name
FROM Course
WHERE course_id NOT IN (
    SELECT DISTINCT course_id FROM Examination
);

-- 4.5 Student with the highest marks in each exam (correlated subquery)
SELECT e.exam_name, s.full_name, r.marks_obtained
FROM Result r
JOIN Examination e ON r.exam_id = e.exam_id
JOIN Student s ON r.student_id = s.student_id
WHERE r.marks_obtained = (
    SELECT MAX(r2.marks_obtained) FROM Result r2 WHERE r2.exam_id = r.exam_id
);


-- ***********************************************************
-- 5. UPDATE QUERIES (5)
-- ***********************************************************

-- 5.1 Update a student's cgpa after result declaration
UPDATE Student SET cgpa = 9.10 WHERE roll_no = 'FDAI001';

-- 5.2 Give a 10% salary hike to all Professors
UPDATE Faculty SET salary = salary * 1.10 WHERE designation = 'Professor';

-- 5.3 Mark a placement application as Selected
UPDATE Placement_Record SET status = 'Selected'
WHERE student_id = 3 AND drive_id = 2;

-- 5.4 Correct the max marks of an exam
UPDATE Examination SET max_marks = 100 WHERE exam_name = 'Unit Test 1' AND max_marks <> 100;

-- 5.5 Update phone number of a student
UPDATE Student SET phone = '9876543210' WHERE roll_no = 'FDAI002';


-- ***********************************************************
-- 6. DELETE QUERIES (5)
-- ***********************************************************

-- 6.1 Remove a single wrong attendance entry
DELETE FROM Attendance WHERE attendance_id = 30;

-- 6.2 Remove placement applications that were rejected before 2026
DELETE FROM Placement_Record WHERE status = 'Rejected' AND placement_id = 20;

-- 6.3 Remove a faculty record that was entered by mistake (course reassigned first)
DELETE FROM Faculty WHERE faculty_id = 20;

-- 6.4 Remove exam records with zero marks entered by mistake
DELETE FROM Result WHERE marks_obtained = 0;

-- 6.5 Remove a placement drive that got cancelled
DELETE FROM Placement_Drive WHERE drive_id = 15;


-- ***********************************************************
-- 7. ALTER TABLE QUERIES (5)
-- ***********************************************************

-- 7.1 Add a new column to store student's blood group
ALTER TABLE Student ADD COLUMN blood_group VARCHAR(5);

-- 7.2 Add a new column to store the mode of a class (Online/Offline)
ALTER TABLE Course ADD COLUMN mode VARCHAR(10) DEFAULT 'Offline';

-- 7.3 Modify phone number column length in Faculty table
ALTER TABLE Faculty MODIFY COLUMN phone VARCHAR(20);

-- 7.4 Rename a column in Placement_Drive for clarity
ALTER TABLE Placement_Drive RENAME COLUMN package_offered TO package_lpa;

-- 7.5 Drop the unused blood_group column (shown for reference/undo)
ALTER TABLE Student DROP COLUMN blood_group;


-- ***********************************************************
-- 8. PATTERN MATCHING QUERIES - LIKE (5)
-- ***********************************************************

-- 8.1 Students whose name starts with 'A'
SELECT full_name FROM Student WHERE full_name LIKE 'A%';

-- 8.2 Faculty whose email is on the campus.edu.in domain
SELECT full_name, email FROM Faculty WHERE email LIKE '%@campus.edu.in';

-- 8.3 Courses with 'Data' anywhere in the course name
SELECT course_name FROM Course WHERE course_name LIKE '%Data%';

-- 8.4 Companies whose name ends with 'a'
SELECT company_name FROM Placement_Drive WHERE company_name LIKE '%a';

-- 8.5 Students whose roll number matches the pattern FDAI0_1 (2nd last digit is 1)
SELECT roll_no, full_name FROM Student WHERE roll_no LIKE 'FDAI0_1';
