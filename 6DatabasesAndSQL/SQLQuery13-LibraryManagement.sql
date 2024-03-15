/* To Reset Highlight and Run this
USE master; -- Avoids "In Use" errors
GO			-- Ensure it runs, then drop db
DROP DATABASE "LibraryManagement";
*/
CREATE DATABASE "LibraryManagement";
GO
USE "LibraryManagement";

-- Req 334.1, 334.2 - Init
CREATE TABLE LibraryBranch ( -- Done
	Id INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	Name VARCHAR(50) NOT NULL,
	Address VARCHAR(50) NOT NULL
);
CREATE TABLE Borrower ( -- Done
	CardNumber BIGINT NOT NULL PRIMARY KEY,
	Name VARCHAR(50) NOT NULL,
	Address VARCHAR(50) NOT NULL,
	PhoneNumber VARCHAR(15) NOT NULL
);

CREATE TABLE Publisher ( -- Done
	Name VARCHAR(50) NOT NULL UNIQUE,
	Address VARCHAR(50) NOT NULL,
	PhoneNumber VARCHAR(14) NOT NULL
);
CREATE TABLE Book ( -- Done
	Id INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	Title VARCHAR(50) NOT NULL,
	PublisherName VARCHAR(50) NOT NULL REFERENCES Publisher(Name)
);
CREATE TABLE BookAuthor ( -- Done
	BookId INT NOT NULL FOREIGN KEY REFERENCES Book(Id),
	Name VARCHAR(50) NOT NULL
);


CREATE TABLE BookCopy ( -- Done
	BookId INT NOT NULL REFERENCES Book(Id),
	BranchId INT NOT NULL REFERENCES LibraryBranch(Id),
	NumberOfCopies INT NOT NULL
);
CREATE TABLE BookLoan ( -- Done
	BookId INT NOT NULL REFERENCES Book(Id),
	BranchId INT NOT NULL REFERENCES LibraryBranch(Id),
	CardNumber BIGINT NOT NULL REFERENCES Borrower(CardNumber),
	CheckedOut DATE NOT NULL,
	ReturnDate DATE NOT NULL
);

-- Add Data
INSERT INTO LibraryBranch VALUES -- Req 334.3a - Add libraries
    ('Sharpstown Library', '123 Main Street'),
    ('Springfield Library', '456 Oak Avenue'),
    ('Lakeside Library', '789 Maple Lane'),
    ('Riverdale Library', '321 Elm Street'),
    ('Hillside Library', '567 Pine Street'),
    ('Woodland Library', '890 Cedar Avenue');
SELECT * FROM LibraryBranch;
INSERT INTO Borrower VALUES -- Req 334.3b - Add borrowers
    (5487219346, 'Sarah Johnson',		'125 Main Street',	'(555) 123-4567'),
    (3167894052, 'David Martinez',		'458 Oak Avenue',	'(555) 234-5678'),
    (8901732465, 'Emily Wilson',		'790 Maple Lane',	'(555) 345-6789'),
    (7025481396, 'Michael Brown',		'320 Elm Street',	'(555) 456-7890'),
    (4219056783, 'Jessica Lee',			'565 Pine Street',	'(555) 567-8901'),
    (1856247903, 'Christopher Taylor',	'892 Cedar Avenue', '(555) 678-9012'),
    (6348702195, 'Ashley Nguyen',		'130 Main Street',	'(555) 789-0123'),
    (9453826170, 'Daniel Rodriguez',	'460 Oak Avenue',	'(555) 890-1234');
SELECT * FROM Borrower;
INSERT INTO Publisher VALUES -- Req 334.3c - Add Publishers
	('BookWorld Publications',		'123 Book Street',		 '(555) 123-4567'),
	('Novelty Press',				'456 Story Avenue',		 '(555) 234-5678'),
	('PrintWorks Inc',				'789 Paper Lane',		 '(555) 345-6789'),
	('Boundless Books',				'321 Binding Boulevard', '(555) 456-7890'),
	('Literary Legends Publishing', '567 Prose Parkway',	 '(555) 567-8901'),
	('Inkwell Press',				'890 Pen Street',		 '(555) 678-9012'),
	('PageTurner Publishers',		'234 Novel Road',		 '(555) 789-0123'),
	('Cover to Cover Publishing',	'876 Jacket Lane',		 '(555) 890-1234'),
	('StoryCraft Books',			'543 Narrative Street',  '(555) 901-2345'),
	('Paperback Press',				'210 Paperback Lane',	 '(555) 012-3456');
SELECT * FROM Publisher;
INSERT INTO Book VALUES -- Req 334.3d - Add books
	('The Lost Tribe', 'BookWorld Publications'),
	('Echoes of Time', 'BookWorld Publications'),
	('Lost Realmsy', 'Novelty Press'),
	('Ink Symphony', 'PrintWorks Inc'),
	('Boundless Odyssey', 'Boundless Books'),
	('The Odyssey', 'Literary Legends Publishing'),
	('The Legacy', 'Inkwell Press'),
	('Pages of Wonder', 'PageTurner Publishers'),
	('Covered Secrets', 'Cover to Cover Publishing'),
	('Crafted Tales', 'StoryCraft Books'),
	('Paperback Chronicles', 'Paperback Press'),
	('Whispers Beyond', 'BookWorld Publications'),
	('Fictional Echoes', 'Novelty Press'),
	('Artistic Imprints', 'PrintWorks Inc'),
	('Unbounded Horizons', 'Boundless Books'),
	('Mythical Encounters', 'Literary Legends Publishing'),
	('The Writer''s Journey', 'Inkwell Press'),
	('Turning Leaves', 'PageTurner Publishers'),
	('Undercover Worlds', 'Cover to Cover Publishing'),
	('Untold Narratives', 'StoryCraft Books');
SELECT * FROM Book;
INSERT INTO BookAuthor VALUES -- Req 334.3e - 10 different author names
	(1,  'John/Jane Doe'),
	(2,  'Allison Moore'),
	(3,  'Allison Moore'),
	(4,  'Benjamin Hayes'),
	(5,  'Benjamin Hayes'),
	(6,  'Benjamin Hayes'),
	(7,  'David Carter'),
	(8,  'Emma Thompson'),
	(9,  'Emma Thompson'),
	(10, 'Frederick Anderson'),
	(11, 'Frederick Anderson'),
	(12, 'Grace Mitchell'),
	(13, 'Grace Mitchell'),
	(14, 'Henry Evans'),
	(15, 'Henry Evans'),
	(16, 'Isabella Reed'),
	(17, 'Isabella Reed'),
	(18, 'James Wright'),
	(19, 'James Wright'),
	(20, 'Katherine Scott');
SELECT * FROM BookAuthor;
INSERT INTO BookCopy VALUES -- Req 334.3f - Insert # of copies
	(1,  1, 4),
	(1,  2, 4),
	(2,  2, 3),
	(3,  6, 5),
	(4,  4, 4),
	(5,  1, 2),
	(6,  5, 3),
	(7,  3, 5),
	(8,  2, 3),
	(9,  6, 4),
	(10, 1, 5),
	(11, 4, 2),
	(12, 5, 2),
	(13, 2, 3),
	(14, 3, 4),
	(15, 1, 2),
	(16, 6, 5),
	(17, 4, 4),
	(18, 5, 3),
	(19, 2, 5),
	(20, 3, 3);
SELECT * FROM BookCopy;
INSERT INTO BookLoan VALUES -- Req 334.3g - Insert BookLoans
	(1,  3, 9453826170, '2024-03-15', '2024-03-29'),
	(2,  2, 3167894052, '2024-01-29', '2024-02-12'),
	(3,  6, 5487219346, '2024-02-05', '2024-02-19'),
	(4,  4, 7025481396, '2024-01-22', '2024-02-05'),
	(5,  1, 6348702195, '2024-03-05', '2024-03-19'),
	(6,  5, 8901732465, '2024-01-01', '2024-01-15'),
	(7,  3, 1856247903, '2024-02-19', '2024-03-04'),
	(8,  2, 4219056783, '2024-02-26', '2024-03-11'),
	(9,  6, 5487219346, '2024-03-01', '2024-03-15'),
	(10, 1, 9453826170, '2024-03-12', '2024-03-26'),
	(11, 4, 3167894052, '2024-02-02', '2024-02-16'),
	(12, 5, 7025481396, '2024-02-28', '2024-03-13'),
	(13, 2, 8901732465, '2024-03-07', '2024-03-21'),
	(14, 3, 4219056783, '2024-02-10', '2024-02-24'),
	(15, 1, 6348702195, '2024-01-17', '2024-01-31'),
	(16, 6, 1856247903, '2024-03-09', '2024-03-23'),
	(17, 4, 3167894052, '2024-01-25', '2024-02-08'),
	(18, 5, 7025481396, '2024-02-23', '2024-03-08'),
	(19, 2, 4219056783, '2024-03-14', '2024-03-28'),
	(20, 3, 8901732465, '2024-01-08', '2024-01-22');
SELECT * FROM BookLoan;

-- Step 335
SELECT * FROM (
	(BookLoan FULL OUTER JOIN Borrower ON BookLoan.CardNumber = Borrower.CardNumber)
	FULL OUTER JOIN Book ON BookLoan.BookId = Book.Id
);

-- Req 337.1a - How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"
/* Before making a procedure trying to make the query work
SELECT Book.Title, BookCopy.NumberOfCopies, LibraryBranch.Name FROM BookCopy
	INNER JOIN LibraryBranch ON LibraryBranch.Name = 'Sharpstown Library'
	INNER JOIN Book ON Book.Id = BookCopy.BookId
WHERE Book.Title = 'The Lost Tribe';*/
GO
--DROP PROCEDURE FindAllCopiesInBranch;
CREATE PROCEDURE FindAllCopiesInBranch
    @bookTitle VARCHAR(50),
    @libraryBranch VARCHAR(50)
AS
BEGIN
    SELECT Book.Title, BookCopy.NumberOfCopies, LibraryBranch.Name FROM BookCopy
		INNER JOIN LibraryBranch ON LibraryBranch.Id = BookCopy.BranchId
		INNER JOIN Book ON Book.Id = BookCopy.BookId
	WHERE Book.Title = @bookTitle AND LibraryBranch.Name = @libraryBranch;
END;
GO;
EXEC FindAllCopiesInBranch 'The Lost Tribe', 'Sharpstown Library';


-- Req 337.1b - How many copies of the book titled "The Lost Tribe" are owned by each library branch
/* Before making a procedure trying to make the query work
SELECT Book.Title, BookCopy.NumberOfCopies, LibraryBranch.Name FROM BookCopy
	INNER JOIN LibraryBranch ON LibraryBranch.Id = BookCopy.BranchId
	INNER JOIN Book ON Book.Id = BookCopy.BookId
WHERE Book.Title = 'The Lost Tribe';*/
GO
CREATE PROCEDURE FindAllCopies
    @bookTitle VARCHAR(50)
AS
BEGIN
    SELECT Book.Title, BookCopy.NumberOfCopies, LibraryBranch.Name FROM BookCopy
		INNER JOIN LibraryBranch ON LibraryBranch.Id = BookCopy.BranchId
		INNER JOIN Book ON Book.Id = BookCopy.BookId
	WHERE Book.Title = @bookTitle;
END;
GO;
EXEC FindAllCopies 'The Lost Tribe';
-- Req 337.1c - Retrieve the names of all borrowers who do not have any books checked out
/* Before making a procedure trying to make the query work
SELECT Borrower.Name FROM Borrower
	LEFT JOIN BookLoan ON BookLoan.CardNumber = Borrower.CardNumber;
SELECT Borrower.Name FROM Borrower
	WHERE NOT EXISTS (
		SELECT 1 FROM BookLoan WHERE Borrower.CardNumber = BookLoan.CardNumber
	);*/
GO
CREATE PROCEDURE GetUsersWithNoBooksCheckedOut
AS
BEGIN
    SELECT Borrower.Name FROM Borrower
    WHERE NOT EXISTS (
		SELECT 1 FROM BookLoan WHERE Borrower.CardNumber = BookLoan.CardNumber
	);
END;
GO;
EXEC GetUsersWithNoBooksCheckedOut;

SELECT * FROM Book;
SELECT * FROM LibraryBranch;
SELECT * FROM BookCopy;
SELECT DISTINCT(BookLoan.CardNumber) FROM BookLoan ORDER BY BookLoan.CardNumber;
INSERT INTO Borrower VALUES (1234567890, 'John Doe', '2134 Main Street', '(555) 765-4321'); -- Insert user that doesn't have anything checked out
SELECT * FROM Borrower;