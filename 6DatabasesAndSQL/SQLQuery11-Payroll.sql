CREATE DATABASE "payroll";
GO
USE "payroll";

CREATE TABLE "Employee" (
	"Id" INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	"JobId" INT NOT NULL,
	"FirstName" VARCHAR(50) NOT NULL,
	"LastName" VARCHAR(50) NOT NULL,
	"HireDate" DATE
);

CREATE TABLE "Job" (
	"Id" INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	"Title" VARCHAR(50) NOT NULL,
	"Department" VARCHAR(50) NOT NULL,
	"SalaryId" INT NOT NULL,
);

CREATE TABLE "Salary" (
	"Id" INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	"HourlyRate" MONEY NOT NULL
);

CREATE TABLE "Payroll" (
	"Payday" DATE NOT NULL,
	"EmployeeId" INT NOT NULL,
	"HoursWorked" INT NOT NULL
);

-- Modify Tables
ALTER TABLE Employee ADD FOREIGN KEY ("JobId") REFERENCES Job(Id);
ALTER TABLE Payroll ADD FOREIGN KEY ("EmployeeId") REFERENCES Employee(Id);
ALTER TABLE Job ADD FOREIGN KEY ("SalaryId") REFERENCES Salary(Id);

-- Add Content
INSERT INTO Salary VALUES
	(19.50),
	(20.00),
	(20.50),
	(21.50),
	(21.50);
SELECT * FROM Salary;

INSERT INTO Job VALUES
	('AR Director', 'Accounting', 2),
	('HR Director', 'Human Resources', 4),
	('Developer', 'IT', 5),
	('Customer Service Manager', 'Operations', 3),
	('Sales Manager', 'Sales and Marketing', 1);
SELECT * FROM Job;

INSERT INTO Employee VALUES
	(1, 'Sam',     'Smith',    '2018-11-28'),
	(1, 'Amanda',  'James',	   '2020-04-01'),
	(1, 'David',   'McGrath',  '2021-12-11'),
	(1, 'Valerie', 'Ringer',   '2014-07-31'),
	(1, 'Andrea',  'Antivilo', '2018-02-04');
SELECT * FROM Employee;

INSERT INTO Payroll VALUES
	('2023-06-07', 1, 40),
	('2023-06-07', 2, 25),
	('2023-06-07', 3, 38),
	('2023-06-07', 4, 22),
	('2023-06-07', 5, 34);
SELECT * FROM Payroll;

-- Do Something with this
SELECT Employee.FirstName AS 'First Name',
		Employee.LastName AS 'Last Name',
		Payroll.HoursWorked AS 'Hours',
		Salary.HourlyRate AS 'Rate',
		Payroll.HoursWorked * Salary.HourlyRate AS 'Total Pay'
	FROM Employee
		INNER JOIN Payroll ON Employee.Id = Payroll.EmployeeId
		INNER JOIN Job ON Employee.JobId = Job.Id
		INNER JOIN Salary ON Job.SalaryId = Salary.Id;