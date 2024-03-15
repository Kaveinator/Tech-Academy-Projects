-- Step 323
SELECT DISTINCT Person.StateProvince.CountryRegionCode FROM Person.StateProvince;

-- Step 324
SELECT TOP 3 Person.StateProvince.CountryRegionCode FROM Person.StateProvince;

-- Step 325
SELECT MIN(Person.Address.PostalCode) AS 'Min',
	MAX(Person.Address.PostalCode) AS 'Max'
	FROM Person.Address;

-- Step 326
SELECT * FROM Person.Address
	WHERE Person.Address.City LIKE 'Port%';

-- Step 327
SELECT * FROM Person.Address
	WHERE Person.Address.City LIKE 'T[abcdefghijklmnopqrstuvwxyz]%';

-- Step 328: Search through postal/zip codes in Oregon
SELECT * FROM Person.Address
	WHERE Person.Address.PostalCode BETWEEN CONVERT(NVARCHAR(30), 97001) AND CONVERT(NVARCHAR(30), 97920);