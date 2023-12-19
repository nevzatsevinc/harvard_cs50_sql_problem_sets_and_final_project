CREATE TABLE "users" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "username" TEXT UNIQUE NOT NULL,
    "password" TEXT NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "schools" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "type" TEXT CHECK(Type IN ('Elementary School', 'Middle School', 'High School', 'Lower School', 'Upper School', 'College', 'University')) NOT NULL,
    "location" TEXT NOT NULL,
    "founded_year" INTEGER,
    PRIMARY KEY ("id")
);

CREATE TABLE "companies" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "industry" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    PRIMARY KEY ("id")
);



CREATE TABLE "connections_schools" (
    "user_id" INTEGER NOT NULL,
    "school_id" INTEGER NOT NULL,
    "start_date" DATE NOT NULL,
    "end_date" DATE,
    "degree" TEXT,
    PRIMARY KEY("user_id", "school_id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("school_id") REFERENCES "schools"("id")
);

CREATE TABLE "connections_companies" (
    "user_id" INTEGER NOT NULL,
    "company_id" INTEGER NOT NULL,
    "start_date" DATE NOT NULL,
    "end_date" DATE,
    "title" TEXT NOT NULL,
    PRIMARY KEY("user_id", "company_id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("company_id") REFERENCES "companies"("id")
);

CREATE TABLE "connections_people" (
    "user_id_1" INTEGER NOT NULL,
    "user_id_2" INTEGER NOT NULL,
    PRIMARY KEY("user_id_1", "user_id_2"),
    FOREIGN KEY("user_id_1") REFERENCES "users"("id"),
    FOREIGN KEY("user_id_2") REFERENCES "users"("id"),
    CHECK("user_id_1" != "user_id_2")
);

INSERT INTO "users" ("first_name", "last_name", "username", "password")
VALUES ('Claudine', 'Gay', 'claudine', 'password');

INSERT INTO "users" ("first_name", "last_name", "username", "password")
VALUES ('Reid', 'Hoffman', 'reid', 'password');

INSERT INTO "schools" ("name", "type", "location", "founded_year")
VALUES ('Harvard University', 'University', 'Cambridge, Massachusetts', 1636);

INSERT INTO "companies" ("name", "industry", "location")
VALUES ('LinkedIn', 'Technology', 'Sunnyvale, California');

INSERT INTO "connections_schools" ("user_id", "school_id", "start_date", "end_date", "degree")
VALUES (1, 1, '1993-01-01', '1998-12-31', 'PhD');

INSERT INTO "connections_companies" ("user_id", "company_id", "start_date", "end_date", "title")
VALUES (2, 1, '2003-01-01', '2007-02-01', 'CEO and Chairman');
