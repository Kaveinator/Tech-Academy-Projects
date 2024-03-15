USE ZooTest2;

CREATE TABLE "animalia" (
	"animaliaId" INT PRIMARY KEY NOT NULL IDENTITY(1, 1),
	"animaliaType" VARCHAR(30) NOT NULL
);

INSERT INTO "animalia"
	("animaliaType")
	VALUES
	('vertebrate'),
	('invertebrate')
; SELECT * FROM "animalia";

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
; SELECT * FROM "class";

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

/* End insert */

SELECT speciesName FROM species INNER JOIN nutrition a1 ON species.speciesNutrition = a1.nutritionId
	WHERE speciesNutrition BETWEEN 2202 AND 2206;

SELECT * FROM specialist;
SELECT * FROM species;
SELECT * FROM nutrition;
SELECT * FROM care;

SELECT specialistFirstName, specialistLastName, specialistContact
	FROM specialist
		INNER JOIN species ON species.speciesId = 3
		INNER JOIN care ON care.careId = species.speciesCare
	WHERE care.careSpecialist = specialist.specialistId;

/* Step 10 */
DECLARE @animalName VARCHAR(50)
DECLARE @errorString VARCHAR(100)
DECLARE @results AS VARCHAR(5)

USE ZooTest2;

SET @animalName = 'ja guar'
SET @errorString = 'There are no ' + @animalName + '''s found at this zoo.'

BEGIN TRY
SET @results = (SELECT COUNT(species.speciesName) FROM species WHERE speciesName = @animalName)
	IF @results = 0
		BEGIN
		RAISERROR(@errorString, 16, 1)
		RETURN
	END
	ELSE IF @results = 1 BEGIN
		SELECT
			a1.speciesName, a2.animaliaType, a3.classType, a4.orderType, a5.habitatType, a6.nutritionType,
			a7.careType
			FROM species a1
			INNER JOIN animalia a2 ON a2.animaliaId = a1.speciesAnimalia
			INNER JOIN class a3 ON a3.classId = a1.speciesClass
			INNER JOIN orders a4 ON a4.orderId = a1.speciesOrder
			INNER JOIN habitat a5 ON a5.habitatId = a1.speciesHabitat
			INNER JOIN nutrition a6 ON a6.nutritionType = a1.speciesNutrition
			INNER JOIN care a7 ON a7.careId = a1.speciesCare
			WHERE a1.speciesName = @animalName;
	END
END TRY
BEGIN CATCH
	SELECT @errorString = ERROR_MESSAGE()
	RAISERROR(@errorString, 10, 1);
END CATCH

USE [ZooTest2]
GO
/* Object: Stored Procedure [dbo].[getANIMAL_INFO]
 * Script Date: 2/6/2020 4:22:54 PM */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--ALTER PROC [dbo].getANIMAL_INFO
CREATE PROC [dbo].getANIMAL_INFO
@animalName VARCHAR(50)
AS
BEGIN
	DECLARE @errorString VARCHAR(100)
	DECLARE @results AS VARCHAR(5)
	SET @errorString = 'There are no ' + @animalName + '''s found at this zoo.';
	BEGIN TRY
		SET @results = (SELECT COUNT(species.speciesName) FROM species WHERE speciesName = @animalName)
		IF @results = 0 BEGIN
			RAISERROR (@errorString, 16, 1)
			RETURN
		END
		ELSE IF @results = 1 BEGIN
		SELECT a1.speciesName, a2.animaliaType, a3.classType, a4.orderType, a5.habitatType, a6.nutritionType,a7.careType
			FROM species a1
				INNER JOIN animalia a2 ON a2.animaliaId = a1.speciesAnimalia
				INNER JOIN class a3 ON a3.classId = a1.speciesClass
				INNER JOIN orders a4 ON a4.orderId = a1.speciesOrder
				INNER JOIN habitat a5 ON a5.habitatId = a1.speciesHabitat
				INNER JOIN nutrition a6 ON a6.nutritionId = a1.speciesNutrition
				INNER JOIN care a7 ON a7.careId = a1.speciesCare
			WHERE a1.speciesName = @animalName
		;
		END
	END TRY
	BEGIN CATCH
		SELECT @errorString = ERROR_MESSAGE()
		RAISERROR(@errorString, 10, 1)
	END CATCH
END


/* Helpful when getting "in use" errors
SELECT * FROM sys.sysprocesses WHERE dbid = DB_ID('dbZoo');
KILL 53
KILL 61
KILL 68
*/

DECLARE @totalHab MONEY,
	@totalNut MONEY
;
SET @totalHab = (SELECT SUM(habitatCost) FROM habitat);
SET @totalNut = (SELECT SUM(nutritionCost) FROM nutrition);
SET @results = @totalHab + @totalNut;

PRINT(
	CONVERT(VARCHAR(50), @totalHab) + CHAR(9) + ' - The Total Habitat Cost' + CHAR(13) + 
	CONVERT(VARCHAR(50), @totalNut) + CHAR(9) + ' - The Total Nutrition Cost' + CHAR(13) + '----------' + CHAR(13) +
	CONVERT(VARCHAR(50), @results)
);