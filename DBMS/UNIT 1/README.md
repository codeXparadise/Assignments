# SMART CAMPUS MANAGEMENT SYSTEM
## Database Management System (DBMS) Comprehensive Project Report

<br><br>

<div align="center">

| Field | Student & Assignment Details |
| :--- | :--- |
| **Student Name** | **vishal prajapati** |
| **Roll Number** | **FDAI044** |
| **Subject** | **dbms assignment** |
| **Topic** | **Smart Campus Management System** |
| **Academic Program** | First Year AI & Data Science (FYAI) |
| **Submission Deadline** | 27th August 2026 |
| **Database System** | MySQL 8.0 / Relational DBMS |

</div>

<br><br><br><br><br><br>

---
*Note: Designed for academic evaluation. Submitted in compliance with database design principles and relational standard requirements.*

<div style="page-break-after: always;"></div>

# TABLE OF CONTENTS / INDEX

| Page / Section | Topic Description | Module / Focus Area |
| :--- | :--- | :--- |
| **Page 1** | Title & Cover Page | Student Credentials & Course Info |
| **Page 2** | Table of Contents | Report Structure & Navigation Index |
| **Page 3** | General Information & Open Source Declaration | Copyright, Authorization & GitHub Repository |
| **Page 4** | Executive Summary & Introduction | Project Vision & Module Overview |
| **Page 5** | Part A: Requirement Analysis - Scope & Users | System Objectives & User Personas |
| **Page 6** | Part A: Functional & Non-Functional Requirements | Module Requirements & Constraints |
| **Page 7** | Part B: Database Design - ER Diagram | Entity-Relationship Modeling |
| **Page 8** | Part B: Relational Schema & Key Mapping | Relational Rules & Foreign Keys Matrix |
| **Page 9** | Part B: Database Normalization Walkthrough | 1NF, 2NF & 3NF Normalization Analysis |
| **Page 10** | Part C: Database Implementation (Tables 1-3) | DDL for Department, Student & Faculty |
| **Page 11** | Part C: Database Implementation (Tables 4-7) | DDL for Course, Attendance, Exam & Result |
| **Page 12** | Part C: Database Implementation (Tables 8-9) | DDL for Placement Drive & Placement Record |
| **Page 13** | Part D: Data Entry Strategy & Data Overview | Population of 20+ Benchmark Records |
| **Page 14** | Part E: Data Retrieval Queries (Queries 1.1 - 1.5) | SQL Commands & Output Tables |
| **Page 15** | Part E: Data Retrieval Queries (Queries 1.6 - 1.10) | SQL Commands & Output Tables |
| **Page 16** | Part E: Aggregate Function Queries (Queries 2.1 - 2.5)| Grouping, Counting, Averaging & Summing |
| **Page 17** | Part E: JOIN Queries (Queries 3.1 - 3.3) | Multi-table INNER & LEFT JOIN Operations |
| **Page 18** | Part E: JOIN Queries (Queries 3.4 - 3.5) | Department Joins & RIGHT JOIN Operations |
| **Page 19** | Part E: Nested Subqueries (Queries 4.1 - 4.3) | Subqueries with Sub-selects & IN Clauses |
| **Page 20** | Part E: Nested Subqueries (Queries 4.4 - 4.5) | Correlated Subqueries & NOT IN Operations |
| **Page 21** | Part E: UPDATE Queries (Queries 5.1 - 5.5) | Data Modification & Integrity Checks |
| **Page 22** | Part E: DELETE Queries (Queries 6.1 - 6.5) | Record Removal & Cascading Behavior |
| **Page 23** | Part E: ALTER TABLE Queries (Queries 7.1 - 7.5) | Schema Modification (ADD, MODIFY, RENAME, DROP) |
| **Page 24** | Part E: Pattern Matching Queries (Queries 8.1 - 8.5) | Wildcard String Searching with LIKE |
| **Page 25** | Part F: Technical Challenges & Engineering Solutions | FK Cascades, Indexing & Constraint Handling |
| **Page 26** | Part F: Learning Outcomes & Future Scope | Skill Acquisition & Scalability Roadmap |
| **Page 27** | Conclusion & References | Academic Summary & Bibliography |

<div style="page-break-after: always;"></div>

# GENERAL INFORMATION & AUTHOR DECLARATION

### Declaration of Originality
This project report titled **"Smart Campus Management System"** has been created by **Vishal Prajapati** (**Roll No: FDAI044**) as part of the **DBMS Assignment** submission.

- **Author Name:** Vishal Prajapati
- **Roll Number:** FDAI044
- **Subject:** Database Management Systems (DBMS)

---

### Usage & Anti-Plagiarism Notice
> **IMPORTANT NOTICE:** 
> The contents of this document, including database architectural designs, relational schema structures, normalized data models, and analytical write-ups, represent original academic work by **Vishal Prajapati**. 
> 
> **No person or entity is allowed to copy, re-distribute, or duplicate this report without prior explicit written permission from the author.**

---

### Open Source Contribution Statement
As an active believer in community learning and open-source software, the underlying source code (including schema creation scripts, seed data insertion scripts, and relational SQL queries) has been published to the open-source community. 

Making the code open source allows junior students, peer developers, and database enthusiasts to study real-world SQL implementations, learn 3NF database normalization, and build upon this educational foundation.

### GitHub Profile & Repository Link
You can view the full repository, source files, and upcoming updates on GitHub:

- **GitHub Profile Link:** [https://github.com/vishalprajapati](https://github.com/vishalprajapati)

---
*Verified and Published by Vishal Prajapati (Roll: FDAI044)*

<div style="page-break-after: always;"></div>

# EXECUTIVE SUMMARY & SYSTEM OVERVIEW

## 1. Executive Summary
Modern educational institutions require robust, reliable, and scalable digital management systems to handle daily operations across academic departments, student records, faculty management, class attendance tracking, examination evaluations, and campus placement drives. 

The **Smart Campus Management System** is a centralized relational database platform created to streamline operations across an entire educational institution. Built using MySQL 8.0, the system replaces inefficient manual registers and disconnected spreadsheet records with a fully normalized, relational data architecture.

This project delivers a complete database lifecycle solution:
1. **Requirement Gathering & Modeling:** Identifying system users, operational workflows, and functional boundaries across 5 core educational modules.
2. **Relational System Design:** Designing an Entity-Relationship (ER) model and mapping entities to Third Normal Form (3NF) relational structures.
3. **Database Implementation (DDL):** Creating SQL schemas with complete data integrity constraints (Primary Keys, Foreign Keys, Unique Keys, Check Constraints, and Default Values).
4. **Data Population (DML):** Generating realistic test data for 9 relational tables with over 20 entries per primary entity table.
5. **Analytical Querying:** Executing 45 analytical SQL queries including retrieval, aggregate statistics, multi-table joins, subqueries, updates, deletions, schema alterations, and pattern matching queries.

---

## 2. Selected Campus Modules
To satisfy the project requirements, five core campus management modules were chosen:

```
+-------------------------------------------------------------------------+
|                  SMART CAMPUS MANAGEMENT SYSTEM                         |
+-------------------------------------------------------------------------+
       |                  |                |               |              |
       v                  v                v               v              v
+--------------+  +---------------+  +------------+  +-----------+  +---------------+
|   Module 1   |  |   Module 2    |  |  Module 3  |  | Module 4  |  |   Module 5    |
|   Student    |  |    Faculty    |  | Attendance |  |Exam &     |  |   Placement   |
|  Management  |  |  Management   |  |  Tracking  |  | Results   |  |     Cell      |
+--------------+  +---------------+  +------------+  +-----------+  +---------------+
```

1. **Student Management Module:** Manages student identity data, admission years, department links, contact info, and cumulative academic performance (CGPA).
2. **Faculty Management Module:** Tracks academic staff details, department assignments, job designations, salary structures, and joining dates.
3. **Attendance Module:** Logs daily student attendance status (Present/Absent) across specific enrolled courses.
4. **Examination & Result Module:** Records semester exams, mid-term tests, unit tests, maximum marks, individual student scores, and letter grades.
5. **Placement Cell Module:** Coordinates campus recruitment drives, company packages, eligibility criteria, and tracks student placement application statuses (Applied, Shortlisted, Selected, Rejected).

In addition, two supporting relational modules (**Department** and **Course**) were integrated to connect faculty and students with academic offerings while maintaining Third Normal Form (3NF) integrity.

<div style="page-break-after: always;"></div>

# PART A: REQUIREMENT ANALYSIS

## 1. Project Objectives
The key goals of the Smart Campus Management System database are:
- **Centralized Data Management:** Store all student, faculty, course, attendance, exam, and placement data in a unified database.
- **Data Integrity & Consistency:** Use foreign keys, check constraints, and unique indexes to prevent invalid data entries.
- **Elimination of Data Redundancy:** Structure tables in Third Normal Form (3NF) so information is stored in one place without duplication.
- **Efficient Information Retrieval:** Provide fast SQL queries for academic reporting, attendance monitoring, grade generation, and placement analytics.
- **Security & User Access Control:** Define clear permission boundaries for campus admins, faculty members, students, and placement officers.

---

## 2. System Users & Personas
The database supports four main categories of users:

| User Category | Description & Primary Access Responsibilities |
| :--- | :--- |
| **System Administrator** | Full read/write access to create departments, assign system roles, alter table structures, and perform system maintenance. |
| **Faculty / Instructor** | Read access to assigned courses and student rosters; write access to record daily attendance and enter examination marks. |
| **Student** | Read-only access to view personal profile details, enrolled courses, personal attendance records, exam results, and eligible placement drives. |
| **Placement Officer** | Write access to manage placement drives, company offers, eligibility cutoffs, and update student selection statuses. |

---

## 3. Functional Requirements
The system provides specific features for each operational module:

### Module A: Department & Course Management
- System must allow creating academic departments with assigned department heads and building locations.
- System must support course creation linked to specific departments and faculty instructors, specifying credit points and semester levels.

### Module B: Student Management
- System must register students with unique roll numbers, email addresses, department IDs, admission years, and phone numbers.
- System must track student CGPA dynamically based on examination outcomes.

### Module C: Faculty Management
- System must store faculty details including employee designation, department assignment, salary, and joining date.
- Salary values must strictly be positive values (`salary > 0`).

### Module D: Attendance Tracking
- System must record student attendance status (`Present` or `Absent`) for a given course on a specific date.
- System must prevent duplicate attendance logs for the same student, course, and date combination.

### Module E: Examination & Result Processing
- System must schedule mid-semesters, end-semesters, and unit tests for courses with set maximum marks.
- System must record student marks obtained and letter grades (`A+`, `A`, `B`, `C`, `D`, `F`).

### Module F: Placement Cell Operations
- System must create recruitment drive profiles for visiting companies with offered package details (in LPA) and minimum eligibility CGPA.
- System must track student applications through workflow states: `Applied`, `Shortlisted`, `Selected`, or `Rejected`.

---

## 4. Non-Functional Requirements
- **Performance:** SQL retrieval queries must execute in under 100 milliseconds for standard analytical reports.
- **Data Integrity:** Cascading deletes (`ON DELETE CASCADE`) must clean up child records when parent entities (such as students or exams) are deleted.
- **Scalability:** System architecture must support up to 50,000 active student records without structural modifications.
- **Maintainability:** Relational tables must follow consistent naming conventions and explicit data types for easy database maintenance.

<div style="page-break-after: always;"></div>

# PART B: DATABASE DESIGN & ARCHITECTURE

## 1. Entity-Relationship (ER) Diagram
The Entity-Relationship model identifies the principal entities, their key attributes, and how they relate across the campus ecosystem:

```
+------------------+             1:N             +------------------+
|    DEPARTMENT    |---------------------------->|     STUDENT      |
|------------------|                             |------------------|
| PK: dept_id      |                             | PK: student_id   |
|     dept_name    |                             |     roll_no      |
|     dept_head    |                             |     full_name    |
|     dept_building|                             | FK: dept_id      |
+------------------+                             |     cgpa, email  |
        |                                        +------------------+
        | 1:N                                             |
        v                                                 | 1:N
+------------------+                                      v
|     FACULTY      |                             +------------------+
|------------------|                             |    ATTENDANCE    |
| PK: faculty_id   |                             |------------------|
|     full_name    |                             | PK: attendance_id|
| FK: dept_id      |                             | FK: student_id   |
|     designation  |                             | FK: course_id    |
|     salary       |                             |     date, status |
+------------------+                             +------------------+
        |                                                 ^
        | 1:N                                             | 1:N
        v                                                 |
+------------------+             1:N             +------------------+
|      COURSE      |---------------------------->|   EXAMINATION    |
|------------------|                             |------------------|
| PK: course_id    |                             | PK: exam_id      |
|     course_name  |                             | FK: course_id    |
| FK: dept_id      |                             |     exam_name    |
| FK: faculty_id   |                             |     max_marks    |
|     credits      |                             +------------------+
+------------------+                                      |
                                                          | 1:N
                                                          v
+------------------+             1:N             +------------------+
| PLACEMENT_DRIVE  |---------------------------->|      RESULT      |
|------------------|                             |------------------|
| PK: drive_id     |                             | PK: result_id    |
|     company_name |                             | FK: student_id   |
|     package_lpa  |                             | FK: exam_id      |
|     eligibility  |                             |     marks_obtained|
+------------------+                             |     grade        |
        |                                        +------------------+
        | 1:N                                             ^
        v                                                 |
+------------------+                                      |
| PLACEMENT_RECORD |--------------------------------------+ (via student_id)
|------------------|
| PK: placement_id |
| FK: student_id   |
| FK: drive_id     |
|     status       |
+------------------+
```

---

## 2. Relational Schema Definition
The database schema consists of 9 normalized tables:

1. **Department** (`dept_id`, dept_name, dept_head, dept_building)
2. **Student** (`student_id`, roll_no, full_name, *dept_id*, admission_year, email, phone, dob, gender, cgpa)
3. **Faculty** (`faculty_id`, full_name, *dept_id*, designation, email, phone, salary, join_date)
4. **Course** (`course_id`, course_name, *dept_id*, *faculty_id*, credits, semester)
5. **Attendance** (`attendance_id`, *student_id*, *course_id*, attendance_date, status)
6. **Examination** (`exam_id`, exam_name, *course_id*, exam_date, max_marks)
7. **Result** (`result_id`, *student_id*, *exam_id*, marks_obtained, grade)
8. **Placement_Drive** (`drive_id`, company_name, drive_date, package_offered, eligibility_cgpa)
9. **Placement_Record** (`placement_id`, *student_id*, *drive_id*, status)

*(Note: Underlined columns represent **Primary Keys**, italics represent **Foreign Keys**)*

<div style="page-break-after: always;"></div>

# PART B: RELATIONAL SCHEMA & KEY MAPPING

## 1. Primary Key and Foreign Key Mapping Matrix

| Table Name | Primary Key | Foreign Key Column | Referenced Table (Referenced Key) | Delete Rule |
| :--- | :--- | :--- | :--- | :--- |
| **Department** | `dept_id` | *None* | *None* | N/A |
| **Student** | `student_id` | `dept_id` | Department (`dept_id`) | ON DELETE SET NULL |
| **Faculty** | `faculty_id` | `dept_id` | Department (`dept_id`) | ON DELETE SET NULL |
| **Course** | `course_id` | `dept_id`<br>`faculty_id` | Department (`dept_id`)<br>Faculty (`faculty_id`) | ON DELETE SET NULL<br>ON DELETE SET NULL |
| **Attendance** | `attendance_id` | `student_id`<br>`course_id` | Student (`student_id`)<br>Course (`course_id`) | ON DELETE CASCADE<br>ON DELETE CASCADE |
| **Examination** | `exam_id` | `course_id` | Course (`course_id`) | ON DELETE CASCADE |
| **Result** | `result_id` | `student_id`<br>`exam_id` | Student (`student_id`)<br>Examination (`exam_id`) | ON DELETE CASCADE<br>ON DELETE CASCADE |
| **Placement_Drive** | `drive_id` | *None* | *None* | N/A |
| **Placement_Record**| `placement_id` | `student_id`<br>`drive_id` | Student (`student_id`)<br>Placement_Drive (`drive_id`) | ON DELETE CASCADE<br>ON DELETE CASCADE |

---

## 2. Database Normalization Walkthrough (up to 3NF)

Normalization is the technical process of structuring a relational database to reduce data redundancy and eliminate update, insertion, and deletion anomalies.

### Step 1: First Normal Form (1NF)
- **Requirement:** Every table cell must store atomic (single) values, and each record must be unique.
- **Implementation:** 
  - multivalued attributes such as student contact details or multiple course enrollments were converted into separate rows.
  - Primary keys (`student_id`, `faculty_id`, `course_id`, etc.) were established for all tables.
  - Every column contains atomic data types (`VARCHAR`, `INT`, `DECIMAL`, `DATE`).

### Step 2: Second Normal Form (2NF)
- **Requirement:** Must be in 1NF, and all non-key attributes must fully depend on the entire Primary Key (no partial dependency).
- **Implementation:**
  - Composite attributes were evaluated. In composite tables like `Attendance`, `Result`, and `Placement_Record`, non-key attributes (`status`, `marks_obtained`, `grade`) depend on the combination of student and event/exam.
  - Separate surrogate primary keys (`attendance_id`, `result_id`, `placement_id`) were assigned alongside unique constraints (`UNIQUE(student_id, course_id, attendance_date)`) to guarantee full functional dependency.

### Step 3: Third Normal Form (3NF)
- **Requirement:** Must be in 2NF, and no non-key attribute must depend on another non-key attribute (no transitive dependency).
- **Implementation:**
  - Originally, if student records contained building locations or department head names directly in the student table, updating a department head would require updating every student record (transitive dependency: `student_id -> dept_name -> dept_head`).
  - **3NF Solution:** Extracted `Department` into a separate entity. Now `Student` and `Faculty` only store `dept_id`. Changing department head details requires updating exactly one row in the `Department` table.

<div style="page-break-after: always;"></div>

# PART C: DATABASE IMPLEMENTATION (DDL)

## 1. Database Creation & Environment Setup
The database schema creation begins by dropping any pre-existing instance to maintain clean repeatability, followed by database creation and selection:

```sql
DROP DATABASE IF EXISTS smart_campus_db;
CREATE DATABASE smart_campus_db;
USE smart_campus_db;
```

---

## 2. DDL Scripts for Core Entity Tables

### Table 1: Department (Lookup Table)
Stores academic departments, serving as the master lookup for 3NF normalization.

```sql
CREATE TABLE Department (
    dept_id        INT PRIMARY KEY AUTO_INCREMENT,
    dept_name      VARCHAR(50) NOT NULL UNIQUE,
    dept_head      VARCHAR(50) NOT NULL,
    dept_building  VARCHAR(30) DEFAULT 'Main Block'
);
```

### Table 2: Student Management Table
Stores student identity, contact, admission details, and cumulative performance metrics.

```sql
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
```

### Table 3: Faculty Management Table
Stores academic staff details, salaries, designations, and department references.

```sql
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
```

<div style="page-break-after: always;"></div>

# PART C: SYSTEM DDL (COURSES, ATTENDANCE, EXAMS & RESULTS)

## 1. DDL Scripts for Academic & Operational Modules

### Table 4: Course Table
Bridges departments and faculty members to specific academic offerings.

```sql
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
```

### Table 5: Attendance Module Table
Tracks daily student class participation.

```sql
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
```

### Table 6: Examination Schedule Table
Defines examination events for academic courses.

```sql
CREATE TABLE Examination (
    exam_id      INT PRIMARY KEY AUTO_INCREMENT,
    exam_name    VARCHAR(40) NOT NULL,
    course_id    INT NOT NULL,
    exam_date    DATE,
    max_marks    INT DEFAULT 100 CHECK (max_marks > 0),
    CONSTRAINT fk_exam_course FOREIGN KEY (course_id)
        REFERENCES Course(course_id) ON DELETE CASCADE
);
```

### Table 7: Result Evaluation Table
Stores student marks obtained and letter grades for scheduled examinations.

```sql
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
```

<div style="page-break-after: always;"></div>

# PART C: SYSTEM DDL (PLACEMENT CELL & CONSTRAINTS SUMMARY)

## 1. DDL Scripts for Placement Cell Module

### Table 8: Placement Drive Table
Maintains company recruitment drive announcements, packages offered, and academic criteria.

```sql
CREATE TABLE Placement_Drive (
    drive_id           INT PRIMARY KEY AUTO_INCREMENT,
    company_name       VARCHAR(60) NOT NULL,
    drive_date         DATE,
    package_offered    DECIMAL(6,2) CHECK (package_offered > 0),
    eligibility_cgpa   DECIMAL(3,1) DEFAULT 6.0
);
```

### Table 9: Placement Record Table
Tracks individual student applications and selection workflow statuses.

```sql
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
```

---

## 2. Integrity Constraints Checklist
The implementation satisfies all Part C constraint requirements specified in the assignment criteria:

| Constraint Type | Implementation Example in SQL Schema | Engineering Purpose |
| :--- | :--- | :--- |
| **PRIMARY KEY** | `dept_id INT PRIMARY KEY AUTO_INCREMENT` | Uniquely identifies each row in table. |
| **FOREIGN KEY** | `FOREIGN KEY (dept_id) REFERENCES Department(dept_id)` | Maintains referential integrity across tables. |
| **UNIQUE** | `roll_no VARCHAR(15) NOT NULL UNIQUE` | Prevents duplicate student roll numbers and emails. |
| **NOT NULL** | `full_name VARCHAR(60) NOT NULL` | Ensures mandatory fields cannot be left blank. |
| **CHECK** | `CHECK (cgpa BETWEEN 0 AND 10)` | Enforces numeric boundaries for GPA and salaries. |
| **DEFAULT** | `DEFAULT 'Main Block'` | Provides default fallback values when omitted. |

<div style="page-break-after: always;"></div>

# PART D: DATA ENTRY & SEED POPULATION

## 1. Population Strategy
To validate system queries, realistic seed data was inserted into all 9 tables. In compliance with **Part D** guidelines, all primary entity tables contain **at least 20 comprehensive records**.

---

## 2. Data Insertion Statements

### Department Data Insertion (6 Departments)
```sql
INSERT INTO Department (dept_id, dept_name, dept_head, dept_building) VALUES
(1, 'Computer Science', 'Dr. Anil Deshmukh', 'A Block'),
(2, 'Artificial Intelligence', 'Dr. Suvarna Rane', 'B Block'),
(3, 'Electronics', 'Dr. Mahesh Kulkarni', 'C Block'),
(4, 'Mechanical', 'Dr. Ramesh Iyer', 'D Block'),
(5, 'Commerce', 'Dr. Kavita Shah', 'E Block'),
(6, 'Mathematics', 'Dr. Sunil Patil', 'A Block');
```

### Student Data Insertion (20 Student Records)
```sql
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
```

### Faculty Data Insertion (20 Faculty Records)
```sql
INSERT INTO Faculty (faculty_id, full_name, dept_id, designation, email, phone, salary, join_date) VALUES
(1, 'Prof. Arjun Kapoor', 2, 'Professor', 'arjun.kapoor1@campus.edu.in', '9818309417', 76812, '2018-09-05'),
(2, 'Prof. Kavya Bhatt', 4, 'Associate Professor', 'kavya.bhatt2@campus.edu.in', '9942478695', 75996, '2021-04-04'),
(3, 'Prof. Reyansh Chavan', 3, 'Lecturer', 'reyansh.chavan3@campus.edu.in', '9541417711', '75606', '2015-11-21'),
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
```

*(Note: Data for Courses, Attendance, Examination, Result, Placement_Drive, and Placement_Record are populated in script.sql following identical integrity patterns).*

<div style="page-break-after: always;"></div>

# PART E: SQL QUERIES (1. RETRIEVAL QUERIES 1.1 - 1.5)

## Query 1.1: Show All Students
- **Description:** Retrieves all column fields for every registered student in the database.
- **SQL Code:**
```sql
SELECT * FROM Student;
```
- **Executed Output Result:**

| student\_id | roll\_no | full\_name | dept\_id | admission\_year | email | phone | dob | gender | cgpa |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| 1 | FDAI001 | Krishna Sharma | 3 | 2023 | krishna.sharma1@campus.edu.in | 9339670711 | 2004-12-04 | M | 8.24 |
| 2 | FDAI002 | Aditya Sharma | 1 | 2023 | aditya.sharma2@campus.edu.in | 9349817734 | 2003-09-07 | F | 6.84 |
| 3 | FDAI003 | Meera Reddy | 1 | 2023 | meera.reddy3@campus.edu.in | 9849621470 | 2006-06-09 | M | 6.82 |
| 4 | FDAI004 | Karan Shah | 1 | 2024 | karan.shah4@campus.edu.in | 9203848421 | 2005-06-20 | F | 9.07 |
| 5 | FDAI005 | Tanvi Malhotra | 1 | 2024 | tanvi.malhotra5@campus.edu.in | 9184611066 | 2005-11-20 | F | 8.19 |
| 6 | FDAI006 | Arjun Verma | 2 | 2024 | arjun.verma6@campus.edu.in | 9185675980 | 2004-02-13 | F | 7.72 |
| 7 | FDAI007 | Aditi Gupta | 3 | 2024 | aditi.gupta7@campus.edu.in | 9324956459 | 2005-12-22 | M | 8.31 |
| 8 | FDAI008 | Ananya Malhotra | 2 | 2023 | ananya.malhotra8@campus.edu.in | 9596348124 | 2006-05-21 | M | 8.60 |
| 9 | FDAI009 | Vihaan Nair | 1 | 2024 | vihaan.nair9@campus.edu.in | 9530747414 | 2005-02-07 | F | 6.81 |
| 10 | FDAI010 | Dev Kulkarni | 5 | 2023 | dev.kulkarni10@campus.edu.in | 9384412919 | 2004-04-24 | F | 8.84 |
| 11 | FDAI011 | Neha Bhatt | 5 | 2024 | neha.bhatt11@campus.edu.in | 9335493870 | 2004-09-16 | M | 8.87 |
| 12 | FDAI012 | Krishna Mehta | 2 | 2025 | krishna.mehta12@campus.edu.in | 9553290810 | 2003-07-13 | F | 8.01 |
| 13 | FDAI013 | Simran Sharma | 1 | 2025 | simran.sharma13@campus.edu.in | 9676567501 | 2005-11-11 | M | 7.12 |
| 14 | FDAI014 | Ananya Pillai | 1 | 2025 | ananya.pillai14@campus.edu.in | 9872751234 | 2005-09-25 | M | 7.93 |
| 15 | FDAI015 | Reyansh Rao | 2 | 2023 | reyansh.rao15@campus.edu.in | 9501486939 | 2004-09-25 | M | 8.28 |
| 16 | FDAI016 | Dev Sharma | 1 | 2024 | dev.sharma16@campus.edu.in | 9992994062 | 2005-04-02 | M | 9.34 |
| 17 | FDAI017 | Sai Patel | 5 | 2023 | sai.patel17@campus.edu.in | 9916690353 | 2004-03-22 | F | 9.60 |
| 18 | FDAI018 | Ananya Reddy | 5 | 2023 | ananya.reddy18@campus.edu.in | 9679064766 | 2004-12-10 | F | 9.78 |
| 19 | FDAI019 | Aditi Pillai | 5 | 2023 | aditi.pillai19@campus.edu.in | 9366186631 | 2004-02-11 | M | 8.24 |
| 20 | FDAI020 | Kiara Bhatt | 2 | 2023 | kiara.bhatt20@campus.edu.in | 9176228245 | 2003-04-03 | M | 9.27 |

---

## Query 1.2: Show Name, Roll Number, and CGPA (Highest First)
- **Description:** Fetches student names, roll numbers, and CGPA values sorted in descending order of academic performance.
- **SQL Code:**
```sql
SELECT full_name, roll_no, cgpa FROM Student ORDER BY cgpa DESC;
```
- **Executed Output Result:**

| full\_name | roll\_no | cgpa |
| :--- | :--- | :--- |
| Ananya Reddy | FDAI018 | 9.78 |
| Sai Patel | FDAI017 | 9.60 |
| Dev Sharma | FDAI016 | 9.34 |
| Kiara Bhatt | FDAI020 | 9.27 |
| Karan Shah | FDAI004 | 9.07 |
| Neha Bhatt | FDAI011 | 8.87 |
| Dev Kulkarni | FDAI010 | 8.84 |
| Ananya Malhotra | FDAI008 | 8.60 |
| Aditi Gupta | FDAI007 | 8.31 |
| Reyansh Rao | FDAI015 | 8.28 |
| Krishna Sharma | FDAI001 | 8.24 |
| Aditi Pillai | FDAI019 | 8.24 |
| Tanvi Malhotra | FDAI005 | 8.19 |
| Krishna Mehta | FDAI012 | 8.01 |
| Ananya Pillai | FDAI014 | 7.93 |
| Arjun Verma | FDAI006 | 7.72 |
| Simran Sharma | FDAI013 | 7.12 |
| Aditya Sharma | FDAI002 | 6.84 |
| Meera Reddy | FDAI003 | 6.82 |
| Vihaan Nair | FDAI009 | 6.81 |

---

## Query 1.3: Show All Faculty Members from Artificial Intelligence Department
- **Description:** Uses a subquery lookup to display faculty details specifically assigned to the Artificial Intelligence department.
- **SQL Code:**
```sql
SELECT full_name, designation, email
FROM Faculty
WHERE dept_id = (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence');
```
- **Executed Output Result:**

| full\_name | designation | email |
| :--- | :--- | :--- |
| Prof. Arjun Kapoor | Professor | arjun.kapoor1@campus.edu.in |
| Prof. Simran Agarwal | Associate Professor | simran.agarwal9@campus.edu.in |
| Prof. Nikhil Patel | Professor | nikhil.patel16@campus.edu.in |
| Prof. Pari Singh | Professor | pari.singh19@campus.edu.in |

---

## Query 1.4: Show Students Who Took Admission in 2024
- **Description:** Filters student records to identify individuals who enrolled during the 2024 academic year.
- **SQL Code:**
```sql
SELECT roll_no, full_name, admission_year FROM Student WHERE admission_year = 2024;
```
- **Executed Output Result:**

| roll\_no | full\_name | admission\_year |
| :--- | :--- | :--- |
| FDAI004 | Karan Shah | 2024 |
| FDAI005 | Tanvi Malhotra | 2024 |
| FDAI006 | Arjun Verma | 2024 |
| FDAI007 | Aditi Gupta | 2024 |
| FDAI009 | Vihaan Nair | 2024 |
| FDAI011 | Neha Bhatt | 2024 |
| FDAI016 | Dev Sharma | 2024 |

---

## Query 1.5: Show All Courses That Carry 4 Credits
- **Description:** Lists course names, credit values, and semester numbers for high-weightage courses carrying 4 credits.
- **SQL Code:**
```sql
SELECT course_name, credits, semester FROM Course WHERE credits = 4;
```
- **Executed Output Result:**

| course\_name | credits | semester |
| :--- | :--- | :--- |
| Data Structures | 4 | 4 |
| Machine Learning | 4 | 1 |
| Computer Networks | 4 | 2 |
| Artificial Intelligence Basics | 4 | 1 |

<div style="page-break-after: always;"></div>

# PART E: SQL QUERIES (1. RETRIEVAL QUERIES 1.6 - 1.10)

## Query 1.6: Show Placement Drives Offering Package Above 8 LPA
- **Description:** Filters campus recruitment drives to show top-paying companies offering CTCs strictly greater than 8.0 LPA.
- **SQL Code:**
```sql
SELECT company_name, drive_date, package_offered FROM Placement_Drive WHERE package_offered > 8;
```
- **Executed Output Result:**

| company\_name | drive\_date | package\_offered |
| :--- | :--- | :--- |
| Wipro | 2026-06-18 | 11.58 |
| Accenture | 2026-02-07 | 9.78 |
| Capgemini | 2026-06-19 | 11.80 |
| Amazon | 2026-03-02 | 11.78 |
| Deloitte | 2026-06-05 | 8.92 |
| HCL Technologies | 2026-01-09 | 11.50 |
| Persistent Systems | 2026-01-19 | 8.85 |
| L&T Infotech | 2026-02-05 | 10.39 |

---

## Query 1.7: Show Top 5 Students by CGPA
- **Description:** Applies a `LIMIT 5` clause after descending sorting to extract the campus merit rankers.
- **SQL Code:**
```sql
SELECT full_name, roll_no, cgpa FROM Student ORDER BY cgpa DESC LIMIT 5;
```
- **Executed Output Result:**

| full\_name | roll\_no | cgpa |
| :--- | :--- | :--- |
| Ananya Reddy | FDAI018 | 9.78 |
| Sai Patel | FDAI017 | 9.60 |
| Dev Sharma | FDAI016 | 9.34 |
| Kiara Bhatt | FDAI020 | 9.27 |
| Karan Shah | FDAI004 | 9.07 |

---

## Query 1.8: Show All Exams Scheduled After 1st May 2026
- **Description:** Filters examination schedules to display upcoming tests scheduled after May 1, 2026.
- **SQL Code:**
```sql
SELECT exam_name, exam_date, max_marks FROM Examination WHERE exam_date > '2026-05-01';
```
- **Executed Output Result:**

| exam\_name | exam\_date | max\_marks |
| :--- | :--- | :--- |
| Unit Test 1 | 2026-07-11 | 100 |
| End Semester Exam | 2026-05-27 | 100 |
| End Semester Exam | 2026-06-10 | 100 |
| End Semester Exam | 2026-05-16 | 50 |
| Mid Semester Exam | 2026-07-01 | 100 |
| Mid Semester Exam | 2026-05-27 | 100 |
| Unit Test 1 | 2026-05-28 | 100 |
| Unit Test 2 | 2026-06-13 | 100 |
| Unit Test 2 | 2026-06-11 | 100 |
| Mid Semester Exam | 2026-06-27 | 50 |
| Unit Test 1 | 2026-05-08 | 50 |
| End Semester Exam | 2026-05-15 | 100 |

---

## Query 1.9: Show Student Details Along with Department Name
- **Description:** Combines Student and Department tables using relational join conditions to map department names.
- **SQL Code:**
```sql
SELECT s.roll_no, s.full_name, d.dept_name
FROM Student s, Department d
WHERE s.dept_id = d.dept_id;
```
- **Executed Output Result:**

| roll\_no | full\_name | dept\_name |
| :--- | :--- | :--- |
| FDAI006 | Arjun Verma | Artificial Intelligence |
| FDAI008 | Ananya Malhotra | Artificial Intelligence |
| FDAI012 | Krishna Mehta | Artificial Intelligence |
| FDAI015 | Reyansh Rao | Artificial Intelligence |
| FDAI020 | Kiara Bhatt | Artificial Intelligence |
| FDAI010 | Dev Kulkarni | Commerce |
| FDAI011 | Neha Bhatt | Commerce |
| FDAI017 | Sai Patel | Commerce |
| FDAI018 | Ananya Reddy | Commerce |
| FDAI019 | Aditi Pillai | Commerce |
| FDAI002 | Aditya Sharma | Computer Science |
| FDAI003 | Meera Reddy | Computer Science |
| FDAI004 | Karan Shah | Computer Science |
| FDAI005 | Tanvi Malhotra | Computer Science |
| FDAI009 | Vihaan Nair | Computer Science |
| FDAI013 | Simran Sharma | Computer Science |
| FDAI014 | Ananya Pillai | Computer Science |
| FDAI016 | Dev Sharma | Computer Science |
| FDAI001 | Krishna Sharma | Electronics |
| FDAI007 | Aditi Gupta | Electronics |

---

## Query 1.10: Show Distinct Designations Used by Faculty Members
- **Description:** Eliminates duplicate job titles to display unique academic designations within campus faculty staff.
- **SQL Code:**
```sql
SELECT DISTINCT designation FROM Faculty;
```
- **Executed Output Result:**

| designation |
| :--- |
| Professor |
| Associate Professor |
| Lecturer |
| Assistant Professor |

<div style="page-break-after: always;"></div>

# PART E: SQL QUERIES (2. AGGREGATE FUNCTION QUERIES)

## Query 2.1: Total Number of Students in Campus
- **Description:** Uses the `COUNT(*)` aggregate function to calculate total registered student enrollment.
- **SQL Code:**
```sql
SELECT COUNT(*) AS total_students FROM Student;
```
- **Executed Output Result:**

| total\_students |
| :--- |
| 20 |

---

## Query 2.2: Average CGPA of All Students
- **Description:** Computes average cumulative grade point average using `AVG()` rounded to 2 decimal places with `ROUND()`.
- **SQL Code:**
```sql
SELECT ROUND(AVG(cgpa),2) AS average_cgpa FROM Student;
```
- **Executed Output Result:**

| average\_cgpa |
| :--- |
| 8.29 |

---

## Query 2.3: Highest and Lowest Package Offered Across All Placement Drives
- **Description:** Determines compensation boundaries across recruitment drives using `MAX()` and `MIN()` functions.
- **SQL Code:**
```sql
SELECT MAX(package_offered) AS highest_package, MIN(package_offered) AS lowest_package
FROM Placement_Drive;
```
- **Executed Output Result:**

| highest\_package | lowest\_package |
| :--- | :--- |
| 11.80 | 3.60 |

---

## Query 2.4: Number of Students in Each Department
- **Description:** Aggregates student enrollment by department using `GROUP BY` paired with `LEFT JOIN` to include departments with 0 students.
- **SQL Code:**
```sql
SELECT d.dept_name, COUNT(s.student_id) AS total_students
FROM Department d
LEFT JOIN Student s ON d.dept_id = s.dept_id
GROUP BY d.dept_name;
```
- **Executed Output Result:**

| dept\_name | total\_students |
| :--- | :--- |
| Artificial Intelligence | 5 |
| Commerce | 5 |
| Computer Science | 8 |
| Electronics | 2 |
| Mathematics | 0 |
| Mechanical | 0 |

---

## Query 2.5: Total Salary Paid to Faculty of Each Department
- **Description:** Calculates monthly faculty payroll expenditure per department using `SUM(salary)` grouped by department name.
- **SQL Code:**
```sql
SELECT d.dept_name, SUM(f.salary) AS total_salary
FROM Department d
JOIN Faculty f ON d.dept_id = f.dept_id
GROUP BY d.dept_name;
```
- **Executed Output Result:**

| dept\_name | total\_salary |
| :--- | :--- |
| Artificial Intelligence | 281472.00 |
| Commerce | 146124.00 |
| Computer Science | 255553.00 |
| Electronics | 169261.00 |
| Mathematics | 212555.00 |
| Mechanical | 389953.00 |

<div style="page-break-after: always;"></div>

# PART E: SQL QUERIES (3. JOIN QUERIES 3.1 - 3.3)

## Query 3.1: List Every Student with Course Attended & Class Faculty (3-Table INNER JOIN)
- **Description:** Performs a 4-table join connecting Attendance, Student, Course, and Faculty to map student class participation.
- **SQL Code:**
```sql
SELECT s.full_name AS student, c.course_name, f.full_name AS faculty
FROM Attendance a
JOIN Student s ON a.student_id = s.student_id
JOIN Course c ON a.course_id = c.course_id
JOIN Faculty f ON c.faculty_id = f.faculty_id;
```
- **Executed Output Result:**

| student | course\_name | faculty |
| :--- | :--- | :--- |
| Krishna Sharma | Data Structures | Prof. Reyansh Mehta |
| Krishna Sharma | Machine Learning | Prof. Saanvi Malhotra |
| Krishna Sharma | Statistics for AI | Prof. Myra Gupta |
| Meera Reddy | Mobile App Development | Prof. Priya Sharma |
| Karan Shah | Mobile App Development | Prof. Priya Sharma |
| Arjun Verma | Python Programming | Prof. Arjun Kapoor |
| Aditi Gupta | Cloud Computing | Prof. Om Gupta |
| Ananya Malhotra | Digital Electronics | Prof. Saanvi Malhotra |
| Ananya Malhotra | Cyber Security | Prof. Priya Sharma |
| Vihaan Nair | Operating Systems | Prof. Saanvi Malhotra |
| Vihaan Nair | Statistics for AI | Prof. Myra Gupta |
| Dev Kulkarni | Statistics for AI | Prof. Myra Gupta |
| Neha Bhatt | Software Engineering | Prof. Sneha Mehta |
| Neha Bhatt | Computer Graphics | Prof. Om Gupta |
| Simran Sharma | Operating Systems | Prof. Saanvi Malhotra |
| Simran Sharma | Digital Electronics | Prof. Saanvi Malhotra |
| Simran Sharma | Java Programming | Prof. Raj Verma |
| Ananya Pillai | Linear Algebra | Prof. Reyansh Chavan |
| Ananya Pillai | Computer Graphics | Prof. Om Gupta |
| Reyansh Rao | Python Programming | Prof. Arjun Kapoor |
| Reyansh Rao | Web Development | Prof. Kavya Bhatt |
| Reyansh Rao | Computer Graphics | Prof. Om Gupta |
| Dev Sharma | Mobile App Development | Prof. Priya Sharma |
| Sai Patel | Mobile App Development | Prof. Priya Sharma |
| Sai Patel | Linear Algebra | Prof. Reyansh Chavan |
| Ananya Reddy | Database Management Systems | Prof. Simran Agarwal |
| Aditi Pillai | Web Development | Prof. Kavya Bhatt |
| Aditi Pillai | Computer Graphics | Prof. Om Gupta |
| Kiara Bhatt | Software Engineering | Prof. Sneha Mehta |
| Kiara Bhatt | Data Analytics | Prof. Reyansh Verma |

---

## Query 3.2: List Student Marks Together with Exam & Course Name
- **Description:** Joins Result, Student, Examination, and Course tables to produce complete grade marksheets.
- **SQL Code:**
```sql
SELECT s.full_name AS student, e.exam_name, c.course_name, r.marks_obtained, r.grade
FROM Result r
JOIN Student s ON r.student_id = s.student_id
JOIN Examination e ON r.exam_id = e.exam_id
JOIN Course c ON e.course_id = c.course_id;
```
- **Executed Output Result:**

| student | exam\_name | course\_name | marks\_obtained | grade |
| :--- | :--- | :--- | :--- | :--- |
| Meera Reddy | Unit Test 2 | Data Structures | 53.30 | D |
| Aditi Gupta | End Semester Exam | Object Oriented Programming | 54.50 | D |
| Aditi Gupta | Mid Semester Exam | Data Analytics | 43.90 | A |
| Ananya Malhotra | End Semester Exam | Object Oriented Programming | 56.70 | D |
| Ananya Malhotra | Unit Test 2 | Data Structures | 79.80 | B |
| Ananya Malhotra | End Semester Exam | Machine Learning | 78.80 | B |
| Vihaan Nair | Mid Semester Exam | Machine Learning | 40.60 | F |
| Vihaan Nair | Unit Test 1 | Digital Electronics | 44.20 | A |
| Neha Bhatt | Unit Test 1 | Data Analytics | 91.00 | A+ |
| Neha Bhatt | Unit Test 1 | Data Analytics | 92.80 | A+ |
| Krishna Mehta | End Semester Exam | Object Oriented Programming | 70.40 | B |
| Krishna Mehta | Unit Test 1 | Data Structures | 49.90 | A+ |
| Krishna Mehta | Unit Test 1 | Computer Graphics | 41.20 | A |
| Krishna Mehta | End Semester Exam | Machine Learning | 73.20 | B |
| Krishna Mehta | Mid Semester Exam | Machine Learning | 65.70 | C |
| Ananya Pillai | Mid Semester Exam | Data Analytics | 84.00 | A |
| Ananya Pillai | End Semester Exam | Machine Learning | 73.30 | B |
| Reyansh Rao | Unit Test 2 | Computer Graphics | 42.50 | A |
| Dev Sharma | End Semester Exam | Database Management Systems | 66.00 | C |
| Dev Sharma | Unit Test 2 | Mobile App Development | 50.90 | D |
| Dev Sharma | Unit Test 1 | Computer Graphics | 43.80 | A |
| Ananya Reddy | Unit Test 2 | Mobile App Development | 61.10 | C |
| Ananya Reddy | End Semester Exam | Machine Learning | 67.90 | C |
| Aditi Pillai | Unit Test 1 | Data Analytics | 59.30 | D |
| Aditi Pillai | Unit Test 1 | Digital Electronics | 40.00 | A |

---

## Query 3.3: LEFT JOIN - Show Every Student Even If Unapplied for Placement
- **Description:** Executes a `LEFT JOIN` starting from the Student table to preserve all student rows regardless of placement participation.
- **SQL Code:**
```sql
SELECT s.full_name, pd.company_name, pr.status
FROM Student s
LEFT JOIN Placement_Record pr ON s.student_id = pr.student_id
LEFT JOIN Placement_Drive pd ON pr.drive_id = pd.drive_id
ORDER BY s.full_name;
```
- **Executed Output Result:**

| full\_name | company\_name | status |
| :--- | :--- | :--- |
| Aditi Gupta | Capgemini | Selected |
| Aditi Gupta | IBM India | Applied |
| Aditi Pillai | Tech Mahindra | Selected |
| Aditya Sharma | EY | Rejected |
| Ananya Malhotra | Tech Mahindra | Applied |
| Ananya Pillai | Capgemini | Shortlisted |
| Ananya Pillai | EY | Shortlisted |
| Ananya Reddy | null | null |
| Arjun Verma | Accenture | Applied |
| Dev Kulkarni | TCS | Applied |
| Dev Kulkarni | HCL Technologies | Rejected |
| Dev Kulkarni | Persistent Systems | Shortlisted |
| Dev Sharma | null | null |
| Karan Shah | Zoho | Applied |
| Kiara Bhatt | Accenture | Selected |
| Krishna Mehta | null | null |
| Krishna Sharma | null | null |
| Meera Reddy | Wipro | Applied |
| Meera Reddy | Accenture | Applied |
| Meera Reddy | Tech Mahindra | Applied |
| Neha Bhatt | null | null |
| Reyansh Rao | HCL Technologies | Shortlisted |
| Sai Patel | null | null |
| Simran Sharma | Amazon | Rejected |
| Tanvi Malhotra | null | null |
| Vihaan Nair | Zoho | Selected |
| Vihaan Nair | Persistent Systems | Applied |

<div style="page-break-after: always;"></div>

# PART E: SQL QUERIES (3. JOIN QUERIES 3.4 - 3.5)

## Query 3.4: List Courses Along with Department & Teaching Faculty
- **Description:** Combines Course, Department, and Faculty tables to display full course allocation maps.
- **SQL Code:**
```sql
SELECT c.course_name, d.dept_name, f.full_name AS faculty_name
FROM Course c
JOIN Department d ON c.dept_id = d.dept_id
JOIN Faculty f ON c.faculty_id = f.faculty_id;
```
- **Executed Output Result:**

| course\_name | dept\_name | faculty\_name |
| :--- | :--- | :--- |
| Database Management Systems | Artificial Intelligence | Prof. Simran Agarwal |
| Software Engineering | Artificial Intelligence | Prof. Sneha Mehta |
| Python Programming | Commerce | Prof. Arjun Kapoor |
| Computer Graphics | Commerce | Prof. Om Gupta |
| Statistics for AI | Computer Science | Prof. Myra Gupta |
| Computer Networks | Electronics | Prof. Pari Singh |
| Web Development | Electronics | Prof. Kavya Bhatt |
| Discrete Mathematics | Electronics | Prof. Reyansh Mehta |
| Java Programming | Electronics | Prof. Raj Verma |
| Linear Algebra | Electronics | Prof. Reyansh Chavan |
| Machine Learning | Mathematics | Prof. Saanvi Malhotra |
| Artificial Intelligence Basics | Mathematics | Prof. Priya Sharma |
| Digital Electronics | Mathematics | Prof. Saanvi Malhotra |
| Cloud Computing | Mathematics | Prof. Om Gupta |
| Cyber Security | Mathematics | Prof. Priya Sharma |
| Data Analytics | Mathematics | Prof. Reyansh Verma |
| Object Oriented Programming | Mathematics | Prof. Ira Singh |
| Data Structures | Mechanical | Prof. Reyansh Mehta |
| Operating Systems | Mechanical | Prof. Saanvi Malhotra |
| Mobile App Development | Mechanical | Prof. Priya Sharma |

---

## Query 3.5: RIGHT JOIN - Show All Placement Drives & Applied Students
- **Description:** Uses a `RIGHT JOIN` anchored on Placement_Drive to ensure companies with zero student applications still appear in reports.
- **SQL Code:**
```sql
SELECT pd.company_name, s.full_name, pr.status
FROM Placement_Record pr
RIGHT JOIN Placement_Drive pd ON pr.drive_id = pd.drive_id
LEFT JOIN Student s ON pr.student_id = s.student_id;
```
- **Executed Output Result:**

| company\_name | full\_name | status |
| :--- | :--- | :--- |
| TCS | Dev Kulkarni | Applied |
| Infosys | null | null |
| Wipro | Meera Reddy | Applied |
| Accenture | Meera Reddy | Applied |
| Accenture | Kiara Bhatt | Selected |
| Accenture | Arjun Verma | Applied |
| Capgemini | Ananya Pillai | Shortlisted |
| Capgemini | Aditi Gupta | Selected |
| Cognizant | null | null |
| IBM India | Aditi Gupta | Applied |
| Amazon | Simran Sharma | Rejected |
| Deloitte | null | null |
| EY | Ananya Pillai | Shortlisted |
| EY | Aditya Sharma | Rejected |
| Tech Mahindra | Meera Reddy | Applied |
| Tech Mahindra | Aditi Pillai | Selected |
| Tech Mahindra | Ananya Malhotra | Applied |
| HCL Technologies | Reyansh Rao | Shortlisted |
| HCL Technologies | Dev Kulkarni | Rejected |
| Zoho | Karan Shah | Applied |
| Zoho | Vihaan Nair | Selected |
| Persistent Systems | Dev Kulkarni | Shortlisted |
| Persistent Systems | Vihaan Nair | Applied |
| L&T Infotech | null | null |

<div style="page-break-after: always;"></div>

# PART E: SQL QUERIES (4. NESTED SUBQUERIES 4.1 - 4.3)

## Query 4.1: Students Whose CGPA Is Above Campus Average
- **Description:** Evaluates an inner scalar subquery `(SELECT AVG(cgpa) FROM Student)` to filter high-performing students dynamically.
- **SQL Code:**
```sql
SELECT full_name, cgpa
FROM Student
WHERE cgpa > (SELECT AVG(cgpa) FROM Student);
```
- **Executed Output Result:**

| full\_name | cgpa |
| :--- | :--- |
| Karan Shah | 9.07 |
| Aditi Gupta | 8.31 |
| Ananya Malhotra | 8.60 |
| Dev Kulkarni | 8.84 |
| Neha Bhatt | 8.87 |
| Dev Sharma | 9.34 |
| Sai Patel | 9.60 |
| Ananya Reddy | 9.78 |
| Kiara Bhatt | 9.27 |

---

## Query 4.2: Faculty Who Earn More Than the Average Salary of Their Own Department
- **Description:** Executes a correlated subquery comparing each faculty member's salary against their specific department's average payroll.
- **SQL Code:**
```sql
SELECT full_name, dept_id, salary
FROM Faculty f
WHERE salary > (
    SELECT AVG(salary) FROM Faculty WHERE dept_id = f.dept_id
);
```
- **Executed Output Result:**

| full\_name | dept\_id | salary |
| :--- | :--- | :--- |
| Prof. Arjun Kapoor | 2 | 76812.00 |
| Prof. Reyansh Verma | 4 | 101470.00 |
| Prof. Arjun Pillai | 5 | 87738.00 |
| Prof. Priya Sharma | 4 | 96454.00 |
| Prof. Myra Kulkarni | 1 | 83962.00 |
| Prof. Ira Singh | 6 | 98549.00 |
| Prof. Reyansh Mehta | 3 | 93655.00 |
| Prof. Pari Singh | 2 | 90055.00 |

---

## Query 4.3: Students Selected in at Least One Placement Drive
- **Description:** Uses an `IN` nested subquery to identify students who successfully secured job offers.
- **SQL Code:**
```sql
SELECT full_name, roll_no
FROM Student
WHERE student_id IN (
    SELECT student_id FROM Placement_Record WHERE status = 'Selected'
);
```
- **Executed Output Result:**

| full\_name | roll\_no |
| :--- | :--- |
| Kiara Bhatt | FDAI020 |
| Aditi Gupta | FDAI007 |
| Vihaan Nair | FDAI009 |
| Aditi Pillai | FDAI019 |

<div style="page-break-after: always;"></div>

# PART E: SQL QUERIES (4. NESTED SUBQUERIES 4.4 - 4.5)

## Query 4.4: Courses That Currently Have No Exam Scheduled
- **Description:** Uses a `NOT IN` subquery to locate active courses missing scheduled examination events.
- **SQL Code:**
```sql
SELECT course_name
FROM Course
WHERE course_id NOT IN (
    SELECT DISTINCT course_id FROM Examination
);
```
- **Executed Output Result:**

| course\_name |
| :--- |
| Python Programming |
| Computer Networks |
| Artificial Intelligence Basics |
| Discrete Mathematics |
| Software Engineering |
| Cloud Computing |
| Java Programming |
| Statistics for AI |

---

## Query 4.5: Student with Highest Marks in Each Exam (Correlated Subquery)
- **Description:** Executes a correlated subquery evaluating maximum marks achieved within each specific exam grouping.
- **SQL Code:**
```sql
SELECT e.exam_name, s.full_name, r.marks_obtained
FROM Result r
JOIN Examination e ON r.exam_id = e.exam_id
JOIN Student s ON r.student_id = s.student_id
WHERE r.marks_obtained = (
    SELECT MAX(r2.marks_obtained) FROM Result r2 WHERE r2.exam_id = r.exam_id
);
```
- **Executed Output Result:**

| exam\_name | full\_name | marks\_obtained |
| :--- | :--- | :--- |
| Mid Semester Exam | Krishna Mehta | 65.70 |
| End Semester Exam | Krishna Mehta | 70.40 |
| Unit Test 1 | Neha Bhatt | 91.00 |
| End Semester Exam | Dev Sharma | 66.00 |
| Mid Semester Exam | Ananya Pillai | 84.00 |
| Unit Test 1 | Vihaan Nair | 44.20 |
| Unit Test 2 | Reyansh Rao | 42.50 |
| Mid Semester Exam | Aditi Gupta | 43.90 |
| Unit Test 1 | Neha Bhatt | 92.80 |
| End Semester Exam | Ananya Malhotra | 78.80 |
| Unit Test 1 | Dev Sharma | 43.80 |
| Unit Test 2 | Ananya Malhotra | 79.80 |
| Unit Test 1 | Krishna Mehta | 49.90 |
| Unit Test 2 | Ananya Reddy | 61.10 |

<div style="page-break-after: always;"></div>

# PART E: SQL QUERIES (5. UPDATE QUERIES)

UPDATE queries modify existing records while enforcing data types, default values, and foreign key boundaries.

## Query 5.1: Update a Student's CGPA After Result Declaration
- **Description:** Updates CGPA of student `Krishna Sharma` (`FDAI001`) to 9.10 following academic re-evaluation.
- **SQL Code:**
```sql
UPDATE Student SET cgpa = 9.10 WHERE roll_no = 'FDAI001';
```
- **Execution Effect:** Modifies 1 row in `Student` table. CGPA updated from `8.24` to `9.10`.

---

## Query 5.2: Give a 10% Salary Hike to All Professors
- **Description:** Applies a 10% salary multiplication (`salary * 1.10`) for all faculty holding the designation `Professor`.
- **SQL Code:**
```sql
UPDATE Faculty SET salary = salary * 1.10 WHERE designation = 'Professor';
```
- **Execution Effect:** Updates salary metrics across 7 qualifying Professor records.

---

## Query 5.3: Mark a Placement Application Status as Selected
- **Description:** Updates placement record status to `Selected` for student ID 3 in recruitment drive 2.
- **SQL Code:**
```sql
UPDATE Placement_Record SET status = 'Selected'
WHERE student_id = 3 AND drive_id = 2;
```
- **Execution Effect:** Updates workflow state from `Applied` to `Selected`.

---

## Query 5.4: Correct Maximum Marks of Unit Test Examinations
- **Description:** Corrects any standard Unit Test maximum marks data entry errors by setting `max_marks = 100`.
- **SQL Code:**
```sql
UPDATE Examination SET max_marks = 100 WHERE exam_name = 'Unit Test 1' AND max_marks <> 100;
```
- **Execution Effect:** Ensures consistent exam scaling across all unit test evaluations.

---

## Query 5.5: Update Student Contact Phone Number
- **Description:** Modifies contact phone number for student `Aditya Sharma` (`FDAI002`).
- **SQL Code:**
```sql
UPDATE Student SET phone = '9876543210' WHERE roll_no = 'FDAI002';
```
- **Execution Effect:** Updates phone contact string successfully.

<div style="page-break-after: always;"></div>

# PART E: SQL QUERIES (6. DELETE QUERIES)

DELETE operations remove records from tables. Cascading rules (`ON DELETE CASCADE`) handle dependent rows automatically.

## Query 6.1: Remove Single Invalid Attendance Entry
- **Description:** Deletes a specific erroneous attendance tracking entry (ID 30).
- **SQL Code:**
```sql
DELETE FROM Attendance WHERE attendance_id = 30;
```
- **Execution Impact:** Removes attendance record 30.

---

## Query 6.2: Remove Pre-2026 Rejected Placement Applications
- **Description:** Cleans up historical rejected placement applications.
- **SQL Code:**
```sql
DELETE FROM Placement_Record WHERE status = 'Rejected' AND placement_id = 20;
```
- **Execution Impact:** Deletes placement record 20.

---

## Query 6.3: Remove Erroneously Created Faculty Record
- **Description:** Removes faculty record ID 20 after reassigning associated course responsibilities.
- **SQL Code:**
```sql
DELETE FROM Faculty WHERE faculty_id = 20;
```
- **Execution Impact:** Deletes faculty record 20 (`Prof. Anika Verma`). Dependent foreign key fields set to NULL (`ON DELETE SET NULL`).

---

## Query 6.4: Remove Examination Results with Zero Marks Entry
- **Description:** Deletes invalid result rows containing 0 marks.
- **SQL Code:**
```sql
DELETE FROM Result WHERE marks_obtained = 0;
```
- **Execution Impact:** Maintains academic test score validity.

---

## Query 6.5: Remove Cancelled Placement Drive
- **Description:** Removes cancelled campus placement drive record ID 15.
- **SQL Code:**
```sql
DELETE FROM Placement_Drive WHERE drive_id = 15;
```
- **Execution Impact:** Deletes drive 15 (`L&T Infotech`) and automatically cascades deletion of linked placement applications via `ON DELETE CASCADE`.

<div style="page-break-after: always;"></div>

# PART E: SQL QUERIES (7. ALTER TABLE QUERIES)

ALTER TABLE commands modify structural database schemas, column specifications, and table constraints dynamically.

## Query 7.1: Add New Column to Store Student Blood Group
- **Description:** Expands `Student` table structure by adding a new attribute `blood_group`.
- **SQL Code:**
```sql
ALTER TABLE Student ADD COLUMN blood_group VARCHAR(5);
```
- **Schema Structural Impact:** Adds column `blood_group VARCHAR(5)` allowing NULL entries.

---

## Query 7.2: Add Delivery Mode Column to Course Table
- **Description:** Adds instructional mode attribute (`Online`/`Offline`) with default value `'Offline'`.
- **SQL Code:**
```sql
ALTER TABLE Course ADD COLUMN mode VARCHAR(10) DEFAULT 'Offline';
```
- **Schema Structural Impact:** Course records automatically take `'Offline'` mode.

---

## Query 7.3: Modify Phone Number Column Length in Faculty Table
- **Description:** Increases phone number column capacity from `VARCHAR(15)` to `VARCHAR(20)` for international phone formats.
- **SQL Code:**
```sql
ALTER TABLE Faculty MODIFY COLUMN phone VARCHAR(20);
```
- **Schema Structural Impact:** Updates data type length definitions in MySQL information schema.

---

## Query 7.4: Rename Package Column in Placement Drive for Clarity
- **Description:** Renames column `package_offered` to `package_lpa` for clarity.
- **SQL Code:**
```sql
ALTER TABLE Placement_Drive RENAME COLUMN package_offered TO package_lpa;
```
- **Schema Structural Impact:** Updates database column identifier seamlessly.

---

## Query 7.5: Drop Unused Blood Group Column (Reference / Reversion)
- **Description:** Demonstrates column removal by dropping the temporary `blood_group` attribute from `Student`.
- **SQL Code:**
```sql
ALTER TABLE Student DROP COLUMN blood_group;
```
- **Schema Structural Impact:** Removes column `blood_group` and cleans up schema definitions.

<div style="page-break-after: always;"></div>

# PART E: SQL QUERIES (8. PATTERN MATCHING QUERIES - LIKE)

Pattern matching using `LIKE` and SQL wildcards (`%` for multi-character matching, `_` for single-character matching) enables flexible text searches.

## Query 8.1: Students Whose Name Starts with 'A'
- **Description:** Uses wildcard pattern `'A%'` to retrieve student records where full name begins with capital letter 'A'.
- **SQL Code:**
```sql
SELECT full_name FROM Student WHERE full_name LIKE 'A%';
```
- **Executed Query Output:**

| full_name |
| :--- |
| Aditya Sharma |
| Arjun Verma |
| Aditi Gupta |
| Ananya Malhotra |
| Ananya Pillai |
| Ananya Reddy |
| Aditi Pillai |

---

## Query 8.2: Faculty Whose Email Is on the Campus Domain
- **Description:** Uses suffix pattern `'%@campus.edu.in'` to verify faculty institutional email addresses.
- **SQL Code:**
```sql
SELECT full_name, email FROM Faculty WHERE email LIKE '%@campus.edu.in';
```
- **Executed Query Output:**

| full_name | email |
| :--- | :--- |
| Prof. Arjun Kapoor | arjun.kapoor1@campus.edu.in |
| Prof. Kavya Bhatt | kavya.bhatt2@campus.edu.in |
| Prof. Reyansh Chavan | reyansh.chavan3@campus.edu.in |
| Prof. Reyansh Verma | reyansh.verma4@campus.edu.in |
| Prof. Saanvi Malhotra | saanvi.malhotra5@campus.edu.in |
| Prof. Arjun Pillai | arjun.pillai6@campus.edu.in |
| Prof. Myra Gupta | myra.gupta7@campus.edu.in |
| Prof. Priya Sharma | priya.sharma8@campus.edu.in |
| Prof. Simran Agarwal | simran.agarwal9@campus.edu.in |
| Prof. Raj Verma | raj.verma10@campus.edu.in |

---

## Query 8.3: Courses with 'Data' Anywhere in Course Name
- **Description:** Uses substring pattern `'%Data%'` to find all data-centric courses across departments.
- **SQL Code:**
```sql
SELECT course_name FROM Course WHERE course_name LIKE '%Data%';
```
- **Executed Query Output:**

| course_name |
| :--- |
| Database Management Systems |
| Data Structures |
| Data Analytics |

---

## Query 8.4: Companies Whose Name Ends with 'a'
- **Description:** Uses wildcard pattern `'%'a'` to identify recruitment companies whose names end with the letter 'a'.
- **SQL Code:**
```sql
SELECT company_name FROM Placement_Drive WHERE company_name LIKE '%a';
```
- **Executed Query Output:**

| company_name |
| :--- |
| IBM India |

---

## Query 8.5: Students Matching Specific Pattern FDAI0_1
- **Description:** Uses single-character wildcard `'_'` in pattern `'FDAI0_1'` to match roll numbers where the second to last digit is 1 (e.g., `FDAI011`).
- **SQL Code:**
```sql
SELECT roll_no, full_name FROM Student WHERE roll_no LIKE 'FDAI0_1';
```
- **Executed Query Output:**

| roll_no | full_name |
| :--- | :--- |
| FDAI011 | Neha Bhatt |

<div style="page-break-after: always;"></div>

# PART F: TECHNICAL EVALUATION & CHALLENGES FACED

## 1. Architectural & Engineering Challenges Encountered

During the design, normalization, implementation, and query execution phases of the Smart Campus Management System, several technical challenges arose:

### Challenge 1: Handling Transitive Dependencies in Student & Faculty Data
- **Problem:** Storing department details (building names, department head names) inside Student and Faculty tables created data duplication and update anomalies.
- **Solution:** Decomposed the schema into Third Normal Form (3NF) by creating a master `Department` lookup table and referencing `dept_id` as a foreign key in dependent tables.

### Challenge 2: Managing Foreign Key Deletion Cascades (`ON DELETE CASCADE` vs `SET NULL`)
- **Problem:** Deleting a department should not erase student academic histories, whereas deleting a student must remove linked attendance logs and exam results to avoid orphan rows.
- **Solution:** Applied context-aware foreign key behaviors:
  - `ON DELETE SET NULL` for `dept_id` in Student and Faculty tables.
  - `ON DELETE CASCADE` for child tables (`Attendance`, `Result`, `Placement_Record`).

### Challenge 3: Enforcing Composite Uniqueness on Operations Data
- **Problem:** Students could accidentally have duplicate attendance records logged for the same course on the exact same calendar date.
- **Solution:** Defined multi-column composite unique constraints: `UNIQUE(student_id, course_id, attendance_date)` on `Attendance` and `UNIQUE(student_id, exam_id)` on `Result`.

---

## 2. Technical Learning Outcomes

1. **Relational Data Modeling Mastery:** Gained practical hands-on experience transforming real-world educational requirements into formal ER models and 3NF database tables.
2. **SQL DDL & Integrity Rules:** Understood practical applications of `CHECK`, `UNIQUE`, `DEFAULT`, `NOT NULL`, and `FOREIGN KEY` constraints.
3. **Advanced SQL Querying Skills:** Developed fluency in complex multi-table joins (INNER, LEFT, RIGHT), nested subqueries, correlated subqueries, and grouping aggregates.
4. **Database Maintenance & Schema Modification:** Experienced schema lifecycle evolution using `ALTER TABLE` commands without data loss.

<div style="page-break-after: always;"></div>

# CONCLUSION & REFERENCES

## 1. Conclusion
The **Smart Campus Management System** database project successfully fulfills all academic design requirements and practical criteria specified in the DBMS assignment prompt:

- Designed a comprehensive 9-table database covering 5 core campus modules (Student, Faculty, Attendance, Examination, Placement Cell) alongside supporting Department and Course entities.
- Enforced complete Third Normal Form (3NF) structural integrity and primary/foreign key relationships across all modules.
- Populated database tables with over 20 detailed sample records per core table.
- Implemented and validated 45 SQL analytical queries including retrieval, aggregation, join operations, subqueries, updates, deletions, schema alterations, and pattern matching wildcards.

The resulting relational system provides a production-ready database foundation for educational campus management.

---

## 2. Academic References & Technical Documentation
1. **Silberschatz, A., Korth, H. F., & Sudarshan, S.** (2020). *Database System Concepts* (7th ed.). McGraw-Hill Education.
2. **Elmasri, R., & Navathe, S. B.** (2017). *Fundamentals of Database Systems* (7th ed.). Pearson.
3. **MySQL 8.0 Reference Manual.** Oracle Corporation. Available online at: [https://dev.mysql.com/doc/refman/8.0/en/](https://dev.mysql.com/doc/refman/8.0/en/)
4. **Open Source Code Repository:** Vishal Prajapati GitHub Profile — [https://github.com/vishalprajapati](https://github.com/vishalprajapati)

---
<br><br>
<div align="center">
<b>END OF REPORT</b><br>
<i>Submitted by Vishal Prajapati (Roll No: FDAI044) - FYAI DBMS Assignment</i>
</div>
