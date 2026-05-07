
-- 1CREATE DATABASE

CREATE DATABASE StudentsDB;
USE StudentsDB;

-- CREATE TABLES

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    Age INT,
    City VARCHAR(50)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50),
    Duration VARCHAR(20)
);

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);


-- INSERT SAMPLE DATA

INSERT INTO Students VALUES
(1, 'Aarav', 21, 'Chennai'),
(2, 'Meera', 22, 'Bangalore'),
(3, 'Karthik', 23, 'Hyderabad'),
(4, 'Divya', 21, 'Delhi');

INSERT INTO Courses VALUES
(101, 'Data Analytics', '3 Months'),
(102, 'Python Programming', '2 Months'),
(103, 'SQL Basics', '1 Month');

INSERT INTO Enrollments VALUES
(1001, 1, 101, '2025-05-10'),
(1002, 2, 102, '2025-06-01'),
(1003, 3, 103, '2025-06-15');

select  e.EnrollmentID,s.StudentName, c.CourseName from enrollments e
	inner join students  s on e.StudentID = s.StudentID
    inner join courses c on e.CourseID = c.CourseID;

select* from courses , Enrollments,students;

select  e.EnrollmentID,s.StudentName, c.CourseName from enrollments e
	left join students  s on e.StudentID = s.StudentID
    left join courses c on e.CourseID = c.CourseID;
    
select round(123.4567,2);
select abs(-2000);
select mod(25,4);

select concat(StudentName,' ','from',' ',City) as Full_Description from students;
select StudentName, length(StudentName) as Name_Length from students;
select CourseName, replace(CourseName,'SQL','Database') as Updataed_Coursename from courses;
select StudentName, substring(StudentName,1, 3) as Sub_Str from students;
select StudentName, upper(StudentName) as Name_Length from students;
select StudentName, lower(StudentName) as Name_Length from students;

select now();
select datediff('2025-06-01' , '2025-05-10') as Diff_Date;
select EnrollmentDate ,date_add(EnrollmentDate, interval 10 day) as Due_Date from enrollments;
