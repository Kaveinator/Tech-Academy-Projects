CREATE PROCEDURE dbo.uspGetAddress2 @City NVARCHAR(30)
AS

SELECT * FROM Person.Address
	WHERE City LIKE @City + '%';
GO

EXEC dbo.uspGetAddress2 @City = 'New';