CREATE TABLE "meteorites" (
    "id" INTEGER,
    "name" TEXT,
    "class" TEXT,
    "mass" REAL,
    "discovery" TEXT,
    "year" INTEGER,
    "lat" REAL,
    "long" REAL,
    PRIMARY KEY ("id")
);


--Import data from meteorites.csv into meteorites table
.mode csv
.import meteorites.csv meteorites_temp


--Apply cleaning and transformations
DELETE
FROM "meteorites_temp" WHERE "nametype" = 'Relict';

UPDATE "meteorites_temp"
SET "mass" = NULLIF("mass", ''),
    "year" = NULLIF("year", ''),
    "lat" = NULLIF("lat", ''),
    "long" = NULLIF("long", '');

UPDATE "meteorites_temp"
SET "mass" = ROUND("mass", 2),
    "lat" = ROUND("lat", 2),
    "long" = ROUND("long", 2);


CREATE TABLE sorted_temp AS
SELECT ROW_NUMBER() OVER (ORDER BY "year", "name") AS new_id,  -- New ID based on sorting
       "name",
       "class",
       "mass",
       "discovery",
       "year",
       "lat",
       "long"
FROM "meteorites_temp";

-- Copy the sorted data into the main meteorites table
-- We're not copying the 'id' from meteorites_temp but using the new_id
INSERT INTO "meteorites" ("id", "name", "class", "mass", "discovery", "year", "lat", "long")
SELECT "new_id", "name", "class", "mass", "discovery", "year", "lat", "long" FROM sorted_temp;

-- Clean up: Drop the temporary tables
DROP TABLE "meteorites_temp";
DROP TABLE "sorted_temp";
