-- Active: 1742205454130@@127.0.0.1@3306@schooldb
-- Active: 1742205454130@@127.0.0.1@3306@project
CREATE DATABASE `SchoolDB`;

USE `SchoolDB`; -- Ensure that the right database is selected for use

-- To check the current database in use
SELECT DATABASE(); 

--First we create a table for the students using their First and Last Name, Date of Birth and Email
-- Make sure to state studentID as primary key and auto-fill its value
-- Make sure to state UNIQUE by Email to make each singular

CREATE TABLE Students(

    studentID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Date_of_Birth DATE,
    Email VARCHAR(100) NOT NULL UNIQUE

);

--Add the data - Data present here has been generated using mockaroo.com

insert into Students (studentID, FirstName, LastName, Date_of_Birth, Email) values (1, 'Adelheid', 'Rivelon', '2009-02-05', 'arivelon0@spotify.com');
insert into Students (studentID, FirstName, LastName, Date_of_Birth, Email) values (2, 'Agace', 'Jovis', '2011-11-13', 'ajovis1@cafepress.com');
insert into Students (studentID, FirstName, LastName, Date_of_Birth, Email) values (3, 'Reynard', 'Timothy', '2012-02-12', 'rtimothy2@symantec.com');
insert into Students (studentID, FirstName, LastName, Date_of_Birth, Email) values (4, 'Mechelle', 'Bradnocke', '2010-04-21', 'mbradnocke3@youku.com');
insert into Students (studentID, FirstName, LastName, Date_of_Birth, Email) values (5, 'James', 'Braizier', '2012-05-15', 'jbraizier4@mapy.cz');
insert into Students (studentID, FirstName, LastName, Date_of_Birth, Email) values (6, 'Tomi', 'Capstaff', '2011-02-22', 'tcapstaff5@bandcamp.com');
insert into Students (studentID, FirstName, LastName, Date_of_Birth, Email) values (7, 'Tabby', 'McArdle', '2011-06-14', 'tmcardle6@w3.org');
insert into Students (studentID, FirstName, LastName, Date_of_Birth, Email) values (8, 'Gris', 'Benallack', '2007-09-28', 'gbenallack7@arstechnica.com');
insert into Students (studentID, FirstName, LastName, Date_of_Birth, Email) values (9, 'Ky', 'Quinney', '2011-05-24', 'kquinney8@usda.gov');
insert into Students (studentID, FirstName, LastName, Date_of_Birth, Email) values (10, 'Alfi', 'Morphew', '2010-07-02', 'amorphew9@kickstarter.com');
insert into Students (studentID, FirstName, LastName, Date_of_Birth, Email) values (11, 'Chic', 'Diviny', '2007-03-04', 'cdivinya@java.com');
insert into Students (studentID, FirstName, LastName, Date_of_Birth, Email) values (12, 'Mohandas', 'Passie', '2011-10-10', 'mpassieb@auda.org.au');


-- We create a second table for the courses with name, description and credits worth
-- Make sure to state coursetID as primary key and auto-fill its value
-- Make sure to state UNIQUE by both name and description as they cannot repeat

CREATE TABLE Courses(

    courseID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL UNIQUE,
    Course_description VARCHAR(400) NOT NULL UNIQUE,
    Credits INT NOT NULL

);

--Add the data - Data present here in this case filled by myself

insert into Courses (courseID, CourseName, Course_description, Credits) values (1, 'Biology', 'blah blah cells', 100);
insert into Courses (courseID, CourseName, Course_description, Credits) values (2, 'History', 'blah blah Rome', 90);
insert into Courses (courseID, CourseName, Course_description, Credits) values (3, 'Chemistry', 'blah blah anode', 100);
insert into Courses (courseID, CourseName, Course_description, Credits) values (4, 'Art', 'blah blah Monet', 80);
insert into Courses (courseID, CourseName, Course_description, Credits) values (5, 'Music', 'blah blah Chopin', 80);
insert into Courses (courseID, CourseName, Course_description, Credits) values (6, 'Physics', 'blah blah quarks', 100);


-- Make sure everything is correct in the table
SELECT * FROM Courses


-- We create a last table for the courses with foreign keys being primary keys from other tables, adding date and grade
-- Make sure to state coursetID as primary key and auto-fill its value
-- We do not need to add the UNIQUE keyword as studentID and courseID are already unique as of being primary in other tables
CREATE TABLE Enrollment(

    EnrollmentID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    studentID INT, 
    courseID INT, 
    Enrollment_Date DATE,
    Grade INT,
    
-- We make sure to establish relationships with other tables
    CONSTRAINT studentID
    FOREIGN KEY (studentID)
    REFERENCES Students(studentID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,

    CONSTRAINT courseID 
    FOREIGN KEY (courseID)
    REFERENCES Courses(courseID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

--Add the data - Data present here has been generated using mockaroo.com
INSERT INTO Enrollment(StudentID,CourseID,Enrollment_Date, Grade) VALUES(1, 3, '2025-03-17', 4 );
INSERT INTO Enrollment(StudentID,CourseID,Enrollment_Date, Grade) VALUES(2, 1, '2025-03-15', 3 );
INSERT INTO Enrollment(StudentID,CourseID,Enrollment_Date, Grade) VALUES(3, 5, '2025-02-17', 5 );
INSERT INTO Enrollment(StudentID,CourseID,Enrollment_Date, Grade) VALUES(4, 6, '2024-03-27', 3 );
INSERT INTO Enrollment(StudentID,CourseID,Enrollment_Date, Grade) VALUES(5, 1, '2023-01-17', 3 );
INSERT INTO Enrollment(StudentID,CourseID,Enrollment_Date, Grade) VALUES(7, 2, '2023-03-17', 5 );
INSERT INTO Enrollment(StudentID,CourseID,Enrollment_Date, Grade) VALUES(8, 4, '2021-03-17', 2 );
INSERT INTO Enrollment(StudentID,CourseID,Enrollment_Date, Grade) VALUES(9, 1, '2022-03-01', 6 );
INSERT INTO Enrollment(StudentID,CourseID,Enrollment_Date, Grade) VALUES(10, 2, '2020-02-17', 4 );
INSERT INTO Enrollment(StudentID,CourseID,Enrollment_Date, Grade) VALUES(11, 3, '2023-03-17', 3 );
INSERT INTO Enrollment(StudentID,CourseID,Enrollment_Date, Grade) VALUES(12, 1, '2021-03-15', 5 );
INSERT INTO Enrollment(StudentID,CourseID,Enrollment_Date, Grade) VALUES(6, 3, '2023-02-17', 4 );
INSERT INTO Enrollment(StudentID,CourseID,Enrollment_Date, Grade) VALUES(8, 2, '2024-03-27', 5 );
INSERT INTO Enrollment(StudentID,CourseID,Enrollment_Date, Grade) VALUES(10, 1, '2021-01-17', 3 );
INSERT INTO Enrollment(StudentID,CourseID,Enrollment_Date, Grade) VALUES(12, 2, '2023-03-17', 2 );
INSERT INTO Enrollment(StudentID,CourseID,Enrollment_Date, Grade) VALUES(2, 3, '2022-03-17', 4 );
INSERT INTO Enrollment(StudentID,CourseID,Enrollment_Date, Grade) VALUES(3, 6, '2020-03-01', 3 );
INSERT INTO Enrollment(StudentID,CourseID,Enrollment_Date, Grade) VALUES(5, 2, '2024-02-17', 3 );


--Make sure each table is filled correctly
SELECT * FROM Enrollment;
SELECT * FROM Students;
SELECT * FROM Courses;


-- We change the grade of a specific student using the UPDATE query
UPDATE enrollment SET
Grade = 3
WHERE studentID = 12 AND courseID = 2;

-- Using INNER JOIN we can view a table with the students name, course name and their grade for it
SELECT Students.LastName, Courses.CourseName, Enrollment.Grade
FROM Enrollment
INNER JOIN Students ON Enrollment.studentID=Students.studentID
INNER JOIN Courses ON Enrollment.courseID=Courses.courseID;

--To create a stored procedure for enrollment we use DELIMITER to freely use semicolons in the syntax
--We establish parameters to enroll existing students to specific courses at a specific date

DELIMITER $$
CREATE PROCEDURE `EnrollStudent`(IN student INT, course INT, IN enrolmentdate DATE)
BEGIN
INSERT INTO Enrollment(StudentID, CourseID,Enrollment_Date)
VALUES(student,course,enrolmentdate);
END$$
DELIMITER $$
--We call on the procedure
CALL `EnrollStudent` (1, 1, '2025-03-19');

--We create a second procedure to update the grade of the enrolled student in a specific course
-- I made it to simulate that upon enrollment student does not have a grade which can be added later using the procedure below
DELIMITER $$
CREATE PROCEDURE `GradeStudent`(IN student INT, course INT, IN Graded INT)
BEGIN
UPDATE Enrollment SET
Grade = Graded
WHERE studentID = student AND courseID = course;
END$$
DELIMITER $$
--We call on the procedure
CALL `GradeStudent` (1, 1, 4);

-- Categorising students based on their grade in the course using studentID and courseID for identification

SELECT studentID, courseID, Grade,  
    CASE 
        WHEN Grade = 6 THEN 'First Class'
        WHEN Grade = 5 THEN 'Second Class - Upper Division'
        WHEN Grade = 4 THEN 'Second Class - Lower Division'
        WHEN Grade = 3 THEN 'Pass Class'
        WHEN Grade = 2 THEN 'Fail'
    END AS category   
FROM Enrollment

--To make it look presentable we can combine it with the INNER JOIN query 
--to present the students last name, name of the course and the category rather than IDs and the grade itself

SELECT Students.LastName, Courses.CourseName,
    CASE 
        WHEN Grade = 6 THEN 'First Class'
        WHEN Grade = 5 THEN 'Second Class - Upper Division'
        WHEN Grade = 4 THEN 'Second Class - Lower Division'
        WHEN Grade = 3 THEN 'Pass Class'
        WHEN Grade = 2 THEN 'Fail'
    END AS category   
FROM Enrollment
INNER JOIN Students ON Enrollment.studentID=Students.studentID
INNER JOIN Courses ON Enrollment.courseID=Courses.courseID;
