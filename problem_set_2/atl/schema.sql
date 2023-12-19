CREATE TABLE "passengers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "airlines" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "concourse" TEXT CHECK(Concourse IN ('A', 'B', 'C', 'D', 'E', 'F', 'T')) NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "flights" (
    "id" INTEGER,
    "flight_number" TEXT NOT NULL,
    "airline_id" INTEGER NOT NULL,
    "departure_air_code" TEXT NOT NULL,
    "arrivel_air_code" TEXT NOT NULL,
    "departure_date" DATETIME NOT NULL,
    "arrivel_date" DATETIME NOT NULL,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("airline_id") REFERENCES "airlines"("id")
);

CREATE TABLE "checkins" (
    "id" INTEGER,
    "passenger_id" INTEGER NOT NULL,
    "flight_id" INTEGER NOT NULL,
    "checkin_date" DATETIME NOT NULL,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("passenger_id") REFERENCES "passengers"("id"),
    FOREIGN KEY ("flight_id") REFERENCES "flights"("id")
);

-- Inserting sample passenger
INSERT INTO "passengers" ("first_name", "last_name", "age") VALUES ('Amelia', 'Earhart', 39);

-- Inserting sample airline
INSERT INTO "airlines" ("name", "concourse") VALUES ('Delta', 'A');
-- Note: Additional rows should be added for concourses B, C, D, and T.

-- Inserting sample flight
INSERT INTO "flights" ("flight_number", "airline_id", "departure_air_code", "arrivel_air_code", "departure_date", "arrivel_date")
VALUES ('300', (SELECT "id" FROM "airlines" WHERE "name" = 'Delta'), 'ATL', 'BOS', '2023-08-03 18:46', '2023-08-03 21:09');

-- Inserting sample check-in
INSERT INTO "checkins" ("passenger_id", "flight_id", "checkin_date")
VALUES (
    (SELECT "id" FROM "passengers" WHERE "first_name" = 'Amelia' AND "last_name" = 'Earhart'),
    (SELECT "id" FROM "flights" WHERE "flight_number" = '300'), '2023-08-03 15:03');
