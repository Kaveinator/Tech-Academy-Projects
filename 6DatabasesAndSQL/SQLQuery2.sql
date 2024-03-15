PRINT 'Hello World!';

-- Set var and use it
DECLARE @myVariable INT;
SET @myVariable = 6;
PRINT @myVariable;

DECLARE @var1 INT, @var2 INT;
SET @var1 = 3;
SET @var1 = 5;
PRINT 'Having fun with' + ' TQL and MS-SQL Server!';
PRINT char(9) + 'I have ' + CONVERT(VARCHAR, @var1) + CHAR(13) + ' dollars';

DECLARE @var3 INT, @var4 INT;
SET @var3 = 7;
SET @var4 = 4;
PRINT 'Variable 1 = ' + CONVERT(VARCHAR, @var3) + CHAR(13) + 'Variable 2 = ' + CONVERT(VARCHAR(5), @var4);
PRINT 'Total: ' + CONVERT(VARCHAR, @var3 + @var4);

IF @var3 < 2 BEGIN
	PRINT '@var3 ' + CONVERT(VARCHAR, @var3) + '< 2';
	END
ELSE IF @var3 > 1 AND @var3 < 3 BEGIN
	PRINT CONVERT(VARCHAR, @var3) + ' > 1 AND ' + CONVERT(VARCHAR, @var3) + ' < 3';
	END
ELSE IF @var3 = 4 OR @var3 < 6 BEGIN
	PRINT CONVERT(VARCHAR, @var3) + ' = 4 OR ' + CONVERT(VARCHAR, @var3) + ' < 6';
	END
ELSE BEGIN
	PRINT CONVERT(VARCHAR, @var3) + ' does not qualify';
	END

/* A comment */
-- Also a comment