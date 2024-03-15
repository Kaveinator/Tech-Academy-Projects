/* To Reset Highlight and Run this
USE master;
GO
DROP DATABASE "School";
*/
CREATE DATABASE "School"; -- Req 331.1: Create a School Database.
GO
USE "School";

-- Init
CREATE TABLE Class ( -- Req 331.2: Create a Classes Table
	"Id" INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	"Name" VARCHAR(50) NOT NULL
);
CREATE TABLE Student ( -- Req 331.3: Create a Students Table
	"Id" INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	"Name" VARCHAR(50) NOT NULL,
	"ClassId" INT NOT NULL,
	"InstructorId" INT NOT NULL
);
CREATE TABLE Instructor ( -- Req 331.4: Create a Instructors Table
	"Id" INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	"Name" VARCHAR(50) NOT NULL
);

-- Req331.5: Apply Foreign Keys to Students
ALTER TABLE Student ADD FOREIGN KEY (ClassId) REFERENCES Class(Id);
ALTER TABLE Student ADD FOREIGN KEY (InstructorId) REFERENCES Instructor(Id);

-- Populate
INSERT INTO Class VALUES -- Req 331.6: Add Classes
	('Software Developer Boot Camp'),
	('C# Boot Camp');
SELECT * FROM Class;

INSERT INTO Instructor VALUES -- Req 331.8: Add Instructors (Warn: Needed to be done before 331.7 to avoid errors)
	('Professor Rachel Thompson'),
	('Dr. Michael Davis');
SELECT * FROM Instructor; -- Req 331.11: Display Instructors

INSERT INTO Student VALUES -- Req 331.7: Add Students
	('Kaveman', 1, 1),
	('Emily Johnson', 1, 1),
    ('Jamal Patel', 1, 1),
    ('Olivia Rodriguez', 1, 1),
    ('Ethan Nguyen', 1, 1),
    ('Sophia Carter', 1, 1);
SELECT * FROM Student;

WITH Individual AS ( -- Req 331.9 - Assign half of students to other class
    SELECT TOP 50 PERCENT *
    FROM Student
) UPDATE Individual SET ClassId = 2;
WITH Individual AS ( -- Req 331.10 - Assign half of students to other instructor
    SELECT TOP 50 PERCENT *
    FROM Student
) UPDATE Individual SET InstructorId = 2;
SELECT * FROM Student ORDER BY "Name" ASC; -- Req 331.12 - Order students by name alphabetically

SELECT Class.Name AS 'Class', -- Req 331.13 - Display classes, students and instructors assigned to each
		Instructor.Name AS 'Instructor',
		Student.Name AS 'Student'
	FROM Student
	INNER JOIN Class ON Student.ClassId = Class.Id
	INNER JOIN Instructor ON Student.InstructorId = Instructor.Id;