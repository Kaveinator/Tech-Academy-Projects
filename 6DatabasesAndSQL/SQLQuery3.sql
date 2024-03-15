CREATE DATABASE "UserDB";
--DROP DATABASE "UserDB";
USE "UserDB";

-- Init
CREATE TABLE "Vendor" (
	"VendorId" INT PRIMARY KEY NOT NULL IDENTITY(1, 1),
	"VendorName" VARCHAR(25) NOT NULL UNIQUE,
	"RestockAccessCode" VARCHAR(32) NOT NULL, -- VARCHAR 32 was assummed for an MD5 hash (which is not prefered for DBs)
	"AccessEnabled" BIT NOT NULL DEFAULT 0,
);
--DROP TABLE "Vendor";

CREATE TABLE "InventoryItem" (
	"ItemUPC" BIGINT NOT NULL UNIQUE,
	"ItemName" VARCHAR(50) NOT NULL
);
--DROP TABLE "InventoryItem";

/* Was going to add location, but requirements already met
CREATE TABLE "InventoryLocation" (
	"LocationId" INT NOT NULL UNIQUE,
	"LocationName" VARCHAR(50) NOT NULL
);*/

CREATE TABLE "Inventory" (
	"InstanceId" INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	"OwnerId"	 INT NOT NULL CONSTRAINT "fk_OwnerId" FOREIGN KEY REFERENCES Vendor(VendorId),
	"ItemUPC"	 BIGINT NOT NULL CONSTRAINT "fk_ItemUPC" FOREIGN KEY REFERENCES InventoryItem(ItemUPC),
	"Count"		 INT NOT NULL DEFAULT 1
);
--DROP TABLE "Inventory";

-- Add Data
DECLARE @dummyHash VARCHAR(32);
SET @dummyHash = '<OTPHash>';
INSERT INTO Vendor(VendorName, RestockAccessCode, AccessEnabled) VALUES
	('Lenovo', @dummyHash, 1),
	('Apple', @dummyHash, 1),
	('Samsung', @dummyHash, 1),
	('HP', @dummyHash, 1),
	('Google', @dummyHash, 1);
SELECT * FROM Vendor;

INSERT INTO InventoryItem(ItemUPC, ItemName) VALUES
	(712345678904, 'Legion Pro 5'),
	(71234567890412, 'Galaxy S24'),
	(07123456, 'Touchscreen Laptop'),
	(71234567890412345, 'IdeaPad Slim 3'),
	(10705632085940, 'Curved Monitor'),
	(71234567890413, 'MacBook Air M3'),
	(07123457, 'iPad Pro M2'),
	(10705632085941, 'Chromebook');
SELECT * FROM InventoryItem;

INSERT INTO Inventory(OwnerId, ItemUPC, "Count") VALUES
	(1, 712345678904, 2000),
	(3, 71234567890412, 2000),
	(4, 07123456, 2000),
	(1, 71234567890412345, 2000),
	(3, 10705632085940, 2000),
	(2, 71234567890413, 2000),
	(2, 07123457, 2000),
	(5, 10705632085941, 2000);
SELECT * FROM Inventory;

-- List all items
SELECT Vendor.VendorName AS 'Make',
	InventoryItem.ItemName AS 'Model'
	FROM Vendor
	INNER JOIN Inventory ON Vendor.VendorId = Inventory.OwnerId
	INNER JOIN InventoryItem ON Inventory.ItemUPC = InventoryItem.ItemUPC
;