CREATE DATABASE "dbZoo";

USE "dbZoo";

CREATE TABLE "animalia" (
	"animaliaId" INT PRIMARY KEY NOT NULL IDENTITY(1, 1),
	"animaliaType" VARCHAR(30) NOT NULL
);

INSERT INTO "animalia"
	("animaliaType")
	VALUES
	('vertebrate'),
	('invertebrate')
;

SELECT * FROM "animalia";

CREATE TABLE "class" (
	"classId" INT PRIMARY KEY NOT NULL IDENTITY(100, 1),
	"classType" VARCHAR(50) NOT NULL
);

INSERT INTO "class"
	("classType")
	VALUES
	('bird'),
	('reptilian'),
	('mammal'),
	('arthropod'),
	('fish'),
	('worm'),
	('cnidaria'),
	('echinoderm')
;

SELECT * FROM "class";

UPDATE "class" SET "classType" = 'birds' WHERE "classType" = 'bird';

-- Replace bird into birds in the result (does not affect actual data)
SELECT REPLACE("classType", 'bird', 'birds') FROM "class";

SELECT "classType" FROM "class" WHERE "classType" = 'birds';
SELECT UPPER("classType") FROM "class" WHERE "classType" = 'birds';
SELECT LOWER("classType") FROM "class" WHERE "classType" = 'birds';

CREATE TABLE "people" (
	"personId" INT PRIMARY KEY NOT NULL IDENTITY(1, 1),
	"firstName" VARCHAR(50) NOT NULL,
	"lastName" VARCHAR(50) NOT NULL,
	"contact" VARCHAR(50) NOT NULL
);

INSERT INTO "people"
	("firstName", "lastName", "contact")
	VALUES
	('bob',   'smith',  '123-456-7890'),
	('mart',  'ann',    '123-456-7890'),
	('tex',	  'burns',  '123-456-7890'),
	('gerry', 'kerns',  '123-456-7890'),
	('sally', 'fields', '123-456-7890')
;

SELECT "firstName", "lastName", "contact" FROM "people" WHERE "personId" BETWEEN 2 AND 5;
SELECT "firstName", "lastName", "contact" FROM "people" WHERE "lastName" LIKE 'ke%'; -- Starts with 'ke'
SELECT "firstName", "lastName", "contact" FROM "people" WHERE "lastName" LIKE '_u%s'; -- First char anything, second 'u' and last is 's'

UPDATE "people" SET "firstName" = 'mars' WHERE "firstName" = 'bob';

SELECT "firstName", "lastName", "contact" FROM "people" WHERE "firstName" LIKE 'm%' ORDER BY "lastName";
SELECT "firstName" AS 'First Name',
	"lastName" AS 'Last Name',
	"contact" AS 'Phone #'
	FROM "people" WHERE "firstName" LIKE 'm%' ORDER BY "lastName";

DELETE FROM "people" WHERE "lastName" = 'smith';

DROP TABLE "people";


CREATE TABLE "orders" (
	"orderId" INT PRIMARY KEY NOT NULL IDENTITY(1, 1),
	"orderType" VARCHAR(50) NOT NULL
);
CREATE TABLE "care" (
	"careId" VARCHAR(50) PRIMARY KEY NOT NULL,
	"careType" VARCHAR(50) NOT NULL,
	"careSpecialist" INT NOT NULL
);
CREATE TABLE "nutrition" (
	"nutritionId" INT PRIMARY KEY NOT NULL IDENTITY(2200, 1),
	"nutritionType" VARCHAR(50) NOT NULL,
	"nutritionCost" MONEY NOT NULL
);
CREATE TABLE "habitat" (
	"habitatId" INT PRIMARY KEY NOT NULL IDENTITY(5000, 1),
	"habitatType" VARCHAR(50) NOT NULL,
	"habitatCost" MONEY NOT NULL
);
CREATE TABLE "specialist" (
	"specialistId" INT PRIMARY KEY NOT NULL IDENTITY(1, 1),
	"specialistFirstName" VARCHAR(50) NOT NULL,
	"specialistLastName" VARCHAR(50) NOT NULL,
	"specialistContact" VARCHAR(50) NOT NULL
);
USE "dbZoo";

INSERT INTO "orders" (orderType) VALUES
	('carnivore'), ('herbivore'), ('omnivore');
SELECT * FROM "orders";

INSERT INTO "care" ("careId", "careType", "careSpecialist") VALUES
	('care_0', 'replace the straw',				1),
	('care_1', 'repair or replace broken toys', 4),
	('care_2', 'bottle feed vitamins',			1),
	('care_3', 'human contact_pet subject',		2),
	('care_4', 'clean up animal waste',			1),
	('care_5', 'move subject to exercise pen',	3),
	('care_6', 'drain and refill aquarium',		1),
	('care_7', 'extensive dental work',			3)
; SELECT * FROM "care";

INSERT INTO "nutrition" ("nutritionType", "nutritionCost") VALUES
	('raw fish',				  1500),
	('living rodents',			  1500),
	('mixture of fruit and rice', 1500),
	('warm of bottle of milk',	  1500),
	('syringe fed broth',		  1500),
	('lard and seed mix',		  1500),
	('aphids',					  1500),
	('vitamins and marrow',		  1500)
; SELECT * FROM "nutrition";

INSERT INTO "habitat" ("habitatType", "habitatCost") VALUES
	('tundra',							  40000),
	('grassy knoll with trees',			  40000),
	('10ft pond and rocks',				  40000),
	('icy aquarium with snowy facade',	  40000),
	('short grass, shade and moat',		  40000),
	('netted forest atrium',			  40000),
	('jungle vines and winding branches', 40000),
	('cliff with shaded cave',			  40000)
; SELECT * FROM "habitat";

INSERT INTO "specialist" ("specialistContact", "specialistFirstName", "specialistLastName") VALUES
	('384-576-2899', 'margaret', 'nguyen'),
	('384-784-4856', 'mary',	 'fischer'),
	('385-475-3944', 'arnold',	 'holden'),
	('384-485-4855', 'kem',		 'byesan'),
	('768-288-3749', 'delmonte', 'fyedo')
; SELECT * FROM "specialist";

CREATE TABLE "species" (
	"speciesId" INT PRIMARY KEY NOT NULL IDENTITY(1, 1),
	"speciesName" VARCHAR(50) NOT NULL,
	"speciesAnimalia" INT NOT NULL CONSTRAINT "fk_animiliaId" FOREIGN KEY REFERENCES "animalia"("animaliaId") ON UPDATE CASCADE ON DELETE CASCADE,
	"speciesClass" INT NOT NULL CONSTRAINT "fk_classId" FOREIGN KEY REFERENCES "class"("classId") ON UPDATE CASCADE ON DELETE CASCADE,
	"speciesOrder" INT NOT NULL CONSTRAINT "fk_orderId" FOREIGN KEY REFERENCES "orders"("orderId") ON UPDATE CASCADE ON DELETE CASCADE,
	"speciesHabitat" INT NOT NULL CONSTRAINT "fk_habitatId" FOREIGN KEY REFERENCES "habitat"("habitatId") ON UPDATE CASCADE ON DELETE CASCADE,
	"speciesNutrition" INT NOT NULL CONSTRAINT "fk_nutritionId" FOREIGN KEY REFERENCES "nutrition"("nutritionId") ON UPDATE CASCADE ON DELETE CASCADE,
	"speciesCare" VARCHAR(50) NOT NULL CONSTRAINT "fk_careId" FOREIGN KEY REFERENCES "care"("careId") ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO "species" ("speciesName", "speciesAnimalia", "speciesClass", "speciesOrder", "speciesHabitat", "speciesNutrition", "speciesCare") VALUES
	('name',	  1, 102, 3, 5007, 2200, 'care_1'),
	('jaquar',    1, 102, 1, 5007, 2200, 'care_4'),
	('penguin',   1, 100, 1, 5003, 2200, 'care_6'),
	('ghost bat', 1, 102, 1, 5007, 2200, 'care_2'),
	('chicken',	  1, 100, 3, 5001, 2200, 'care_0'),
	('panda',	  1, 102, 3, 5006, 2200, 'care_4'),
	('bobcat',	  1, 102, 1, 5001, 2200, 'care_5'),
	('grey wolf', 1, 102, 1, 5000, 2200, 'care_4')
; SELECT * FROM "species";

SELECT * FROM "species" WHERE "speciesName" = 'chicken';

SELECT a1.speciesName, a2.animaliaType,
	a3.classType, orders.orderType, a5.habitatType,
	a6.nutritionType, a7.careType
	FROM "species" a1
	INNER JOIN "animalia" a2 ON a2.animaliaId = a1.speciesAnimalia
	INNER JOIN "class" a3 ON a3.classId = a1.speciesClass
	INNER JOIN "orders" ON orders.orderId = a1.speciesOrder
	INNER JOIN "habitat" a5 ON a5.habitatId = a1.speciesHabitat
	INNER JOIN "nutrition" a6 ON a6.nutritionId = a1.speciesNutrition
	INNER JOIN "care" a7 ON a7.careId = a1.speciesCare
	WHERE speciesName = 'chicken';

SELECT species.speciesName, habitat.habitatType,  habitat.habitatType,
	nutrition.nutritionType, nutrition.nutritionCost
	FROM species
	INNER JOIN habitat ON habitat.habitatId = species.speciesHabitat
	INNER JOIN nutrition ON nutrition.nutritionId = species.speciesNutrition
	WHERE speciesName = 'ghost bat';

DROP TABLE species, animalia, care, class, habitat, nutrition, orders, specialist;

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES species)
	DROP TABLE species, animalia, care, class, habitat, nutrition, orders, specialist;

PRINT 'Hello World!';

DECLARE @myVariable INT;
SET @myVariable = 6;
PRINT @myVariable;

DECLARE @var1 INT, @var2 INT;
SET @var1 = 3;
SET @var2 = 5;

PRINT 'Having fun with' + ' TSQL and MS SQL Server!';
PRINT 'I have ' + CONVERT(VARCHAR(50), @var1) + ' dollars...';
PRINT CHAR(9) + 'I have ' + CONVERT(VARCHAR(50), @var1) + CHAR(13) +' dollars...';
PRINT 'Variable 1 = ' + CONVERT(VARCHAR(5), @var1) + CHAR(13) + ' Variable 2 = ' + CONVERT(VARCHAR(5), @var2);
PRINT 'Variable 1 = ' + CONVERT(VARCHAR(5), @var1) + CHAR(13) + ' Variable 2 = ' + CONVERT(VARCHAR(5), @var2) + CHAR(13) + 'Total: ';
PRINT @var1 + @var2;

IF @var1 <= 3 BEGIN
	PRINT 'Variable 1 <= ' + CONVERT(VARCHAR(5), @var1) + CHAR(13);
	END
ELSE BEGIN
	PRINT 'Variable 1 is not < ' + CONVERT(VARCHAR(5), @var1) + CHAR(13);
	END

IF @var1 != 3 BEGIN
	PRINT 'Variable 1 is NOT ' + CONVERT(VARCHAR(5), @var1) + CHAR(13);
	END
ELSE BEGIN
	PRINT 'Variable 1 is not < '+ CONVERT(VARCHAR(5), @var1) + CHAR(13);
	END

SET @var1 = 3
SET @var2 = 5

IF @var1 < 2 BEGIN
	PRINT '@Var1 < 2'
	END
ELSE IF @var1 > 1 AND @var1 < 3 BEGIN
	PRINT '@var1 > 1 AND @var1 < 3'
	END
ELSE IF @var1 = 4 OR @var1 < 6 BEGIN
	PRINT '@var1 = 4 OR @var1 <6'
	END
ELSE PRINT '@var1 does not qualify!'

/* This is a silent message */

DROP DATABASE "ZooTest2";

CREATE DATABASE "ZooTest2";

USE "ZooTest2";

GO
CREATE PROCEDURE "createZooDB"
AS
BEGIN
	CREATE TABLE "animalia" (
		"animaliaId" INT PRIMARY KEY NOT NULL IDENTITY(1, 1),
		"animaliaType" VARCHAR(50) NOT NULL
	);
	CREATE TABLE "class" (
		"classId" INT PRIMARY KEY NOT NULL IDENTITY(100, 1),
		"classType" VARCHAR(50) NOT NULL
	);
	CREATE TABLE "orders" (
		"orderId" INT PRIMARY KEY NOT NULL IDENTITY(1, 1),
		"orderType" VARCHAR(50) NOT NULL
	);
	CREATE TABLE "care" (
		"careId" VARCHAR(50) PRIMARY KEY NOT NULL,
		"careType" VARCHAR(50) NOT NULL,
		"careSpecialist" INT NOT NULL
	);
	CREATE TABLE "nutrition" (
		"nutritionId" INT PRIMARY KEY NOT NULL IDENTITY(2200, 1),
		"nutritionType" VARCHAR(50) NOT NULL,
		"nutritionCost" MONEY NOT NULL
	);
	CREATE TABLE "habitat" (
		"habitatId" INT PRIMARY KEY NOT NULL IDENTITY(5000, 1),
		"habitatType" VARCHAR(50) NOT NULL,
		"habitatCost" MONEY NOT NULL
	);
	CREATE TABLE "specialist" (
		"specialistId" INT PRIMARY KEY NOT NULL IDENTITY(1, 1),
		"specialistFirstName" VARCHAR(50) NOT NULL,
		"specialistLastName" VARCHAR(50) NOT NULL,
		"specialistContact" VARCHAR(50) NOT NULL
	);
	CREATE TABLE "species" (
		"speciesId" INT PRIMARY KEY NOT NULL IDENTITY(1, 1),
		"speciesName" VARCHAR(50) NOT NULL,
		"speciesAnimalia" INT NOT NULL CONSTRAINT "fk_animiliaId" FOREIGN KEY REFERENCES "animalia"("animaliaId") ON UPDATE CASCADE ON DELETE CASCADE,
		"speciesClass" INT NOT NULL CONSTRAINT "fk_classId" FOREIGN KEY REFERENCES "class"("classId") ON UPDATE CASCADE ON DELETE CASCADE,
		"speciesOrder" INT NOT NULL CONSTRAINT "fk_orderId" FOREIGN KEY REFERENCES "orders"("orderId") ON UPDATE CASCADE ON DELETE CASCADE,
		"speciesHabitat" INT NOT NULL CONSTRAINT "fk_habitatId" FOREIGN KEY REFERENCES "habitat"("habitatId") ON UPDATE CASCADE ON DELETE CASCADE,
		"speciesNutrition" INT NOT NULL CONSTRAINT "fk_nutritionId" FOREIGN KEY REFERENCES "nutrition"("nutritionId") ON UPDATE CASCADE ON DELETE CASCADE,
		"speciesCare" VARCHAR(50) NOT NULL CONSTRAINT "fk_careId" FOREIGN KEY REFERENCES "care"("careId") ON UPDATE CASCADE ON DELETE CASCADE
	);

	INSERT INTO "animalia"
		("animaliaType")
		VALUES
		('vertebrate'),
		('invertebrate')
	; SELECT * FROM "animalia";

	INSERT INTO "class"
		("classType")
		VALUES
		('bird'),
		('reptilian'),
		('mammal'),
		('arthropod'),
		('fish'),
		('worm'),
		('cnidaria'),
		('echinoderm')
	; SELECT * FROM "class";

	INSERT INTO "orders" (orderType) VALUES
		('carnivore'), ('herbivore'), ('omnivore')
	; SELECT * FROM "orders";

	INSERT INTO "care" ("careId", "careType", "careSpecialist") VALUES
		('care_0', 'replace the straw',				1),
		('care_1', 'repair or replace broken toys', 4),
		('care_2', 'bottle feed vitamins',			1),
		('care_3', 'human contact_pet subject',		2),
		('care_4', 'clean up animal waste',			1),
		('care_5', 'move subject to exercise pen',	3),
		('care_6', 'drain and refill aquarium',		1),
		('care_7', 'extensive dental work',			3)
	; SELECT * FROM "care";

	INSERT INTO "nutrition" ("nutritionType", "nutritionCost") VALUES
		('raw fish',				  1500),
		('living rodents',			  1500),
		('mixture of fruit and rice', 1500),
		('warm of bottle of milk',	  1500),
		('syringe fed broth',		  1500),
		('lard and seed mix',		  1500),
		('aphids',					  1500),
		('vitamins and marrow',		  1500)
	; SELECT * FROM "nutrition";

	INSERT INTO "habitat" ("habitatType", "habitatCost") VALUES
		('tundra',							  40000),
		('grassy knoll with trees',			  40000),
		('10ft pond and rocks',				  40000),
		('icy aquarium with snowy facade',	  40000),
		('short grass, shade and moat',		  40000),
		('netted forest atrium',			  40000),
		('jungle vines and winding branches', 40000),
		('cliff with shaded cave',			  40000)
	; SELECT * FROM "habitat";

	INSERT INTO "specialist" ("specialistContact", "specialistFirstName", "specialistLastName") VALUES
		('384-576-2899', 'margaret', 'nguyen'),
		('384-784-4856', 'mary',	 'fischer'),
		('385-475-3944', 'arnold',	 'holden'),
		('384-485-4855', 'kem',		 'byesan'),
		('768-288-3749', 'delmonte', 'fyedo')
	; SELECT * FROM "specialist";

	INSERT INTO "species" ("speciesName", "speciesAnimalia", "speciesClass", "speciesOrder", "speciesHabitat", "speciesNutrition", "speciesCare") VALUES
		('name',	  1, 102, 3, 5007, 2200, 'care_1'),
		('jaquar',    1, 102, 1, 5007, 2200, 'care_4'),
		('penguin',   1, 100, 1, 5003, 2200, 'care_6'),
		('ghost bat', 1, 102, 1, 5007, 2200, 'care_2'),
		('chicken',	  1, 100, 3, 5001, 2200, 'care_0'),
		('panda',	  1, 102, 3, 5006, 2200, 'care_4'),
		('bobcat',	  1, 102, 1, 5001, 2200, 'care_5'),
		('grey wolf', 1, 102, 1, 5000, 2200, 'care_4')
	; SELECT * FROM "species";

	SELECT a1.speciesName, a2.animaliaType,
		a3.classType, orders.orderType, a5.habitatType,
		a6.nutritionType, a7.careType
		FROM "species" a1
		INNER JOIN "animalia" a2 ON a2.animaliaId = a1.speciesAnimalia
		INNER JOIN "class" a3 ON a3.classId = a1.speciesClass
		INNER JOIN "orders" ON orders.orderId = a1.speciesOrder
		INNER JOIN "habitat" a5 ON a5.habitatId = a1.speciesHabitat
		INNER JOIN "nutrition" a6 ON a6.nutritionId = a1.speciesNutrition
		INNER JOIN "care" a7 ON a7.careId = a1.speciesCare
		WHERE speciesName = 'chicken';

	SELECT species.speciesName, habitat.habitatType,  habitat.habitatType,
		nutrition.nutritionType, nutrition.nutritionCost
		FROM species
		INNER JOIN habitat ON habitat.habitatId = species.speciesHabitat
		INNER JOIN nutrition ON nutrition.nutritionId = species.speciesNutrition
		WHERE speciesName = 'ghost bat';
END

GO
USE ZooTest2;
EXECUTE [dbo].[createZooDB];

GO
CREATE PROC getANIMAL_INFO
@animalName VARCHAR(50)
AS
BEGIN
	SELECT a1.speciesName, a2.animaliaType,
		a3.classType, orders.orderType, a5.habitatType,
		a6.nutritionType, a7.careType
		FROM "species" a1
		INNER JOIN "animalia" a2 ON a2.animaliaId = a1.speciesAnimalia
		INNER JOIN "class" a3 ON a3.classId = a1.speciesClass
		INNER JOIN "orders" ON orders.orderId = a1.speciesOrder
		INNER JOIN "habitat" a5 ON a5.habitatId = a1.speciesHabitat
		INNER JOIN "nutrition" a6 ON a6.nutritionId = a1.speciesNutrition
		INNER JOIN "care" a7 ON a7.careId = a1.speciesCare
		WHERE speciesName = @animalName;
END;

EXECUTE [dbo].getANIMAL_INFO 'chicken';

/* Part 10 */
DECLARE @animalName VARCHAR(50)
DECLARE @errorString VARCHAR(100)
DECLARE @results AS VARCHAR(5)

SET @animalName = 'ja guar'
SET @errorString = 'There are no ' + @animalName + '''s found at this zoo.'

BEGIN TRY
SET @results = (SELECT COUNT(tbl_species.species_name) FROM tbl_species WHERE species_name = @animalName)
	IF @results = 0
		BEGIN
		RAISERROR(@errorString, 16, 1)
		RETURN
		END
	ELSE IF @results = 1
		BEGIN
		SELECT
			a1.species_name, a2.animalia_type, a3.class_type, a4.order_type, a5.habitat_type, a6.nutrition_type,
			a7.care_type
			FROM species al
			INNER JOIN anamillia a2 ON a2.animalia_id = a1.species_animalia
			INNER JOIN tbl_class a3 ON a3.class_id = a1.species_class
			INNER JOIN tbl_order a4 ON a4.order_id = a1.species_order
			INNER JOIN tbl_habitat a5 ON a5.habitat_id = a1.species_habitat
			INNER JOIN tbl_nutrition a6 ON a6.nutrition_id=al.species_nutrition
			INNER JOIN tbl_care a7 ON a7.care_id= a1.species_care
			WHERE a1.species_name = @animalName;
		END

END TRY



USE "dbZoo";
GO;

/* Helpfull when getting "in use" errors
SELECT * FROM sys.sysprocesses WHERE dbid = DB_ID('dbZoo');
KILL <sid>
*/

DECLARE @totalHab MONEY,
	@totalNut MONEY,
	@results MONEY
;
SET @totalHab = (SELECT SUM(habitatCost) FROM habitat);
SET @totalNut = (SELECT SUM(nutritionCost) FROM nutrition);
SET @results = @totalHab + @totalNut;

PRINT(
	CONVERT(VARCHAR(50), @totalHab) + CHAR(9) + ' - The Total Habitat Cost' + CHAR(13) + 
	CONVERT(VARCHAR(50), @totalNut) + CHAR(9) + ' - The Total Nutrition Cost' + CHAR(13) + '----------' + CHAR(13) +
	CONVERT(VARCHAR(50), @results)
);

BEGIN CATCH
	SELECT @errorString = ERROR_MESSAGE()
	RAISEERROR (@errorString, 10, 1);
END CATCH BEGIN END