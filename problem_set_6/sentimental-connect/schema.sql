-- Users Table
CREATE TABLE Users (
    user_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    username VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(128) NOT NULL
);

-- Schools Table
CREATE TABLE Schools (
    school_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    type ENUM('Primary', 'Secondary', 'Higher Education') NOT NULL,
    location VARCHAR(255) NOT NULL,
    founded_year YEAR NOT NULL
);

-- Companies Table
CREATE TABLE Companies (
    company_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    industry ENUM('Technology', 'Education', 'Business') NOT NULL,
    location VARCHAR(255) NOT NULL
);

-- Connections Table
CREATE TABLE Connections (
    connection_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id_1 INT UNSIGNED NOT NULL,
    user_id_2 INT UNSIGNED NOT NULL,
    connected_on DATE NOT NULL,
    FOREIGN KEY (user_id_1) REFERENCES Users(user_id),
    FOREIGN KEY (user_id_2) REFERENCES Users(user_id)
);

-- UserSchools Table
CREATE TABLE UserSchools (
    affiliation_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED,
    school_id INT UNSIGNED,
    start_date DATE NOT NULL,
    end_date DATE,
    degree_type VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (school_id) REFERENCES Schools(school_id)
);

-- UserCompanies Table
CREATE TABLE UserCompanies (
    employment_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED,
    company_id INT UNSIGNED,
    start_date DATE NOT NULL,
    end_date DATE,
    title VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (company_id) REFERENCES Companies(company_id)
);


INSERT INTO Users (first_name, last_name, username, password) VALUES ('Claudine', 'Gay', 'claudine', 'password');
INSERT INTO Users (first_name, last_name, username, password) VALUES ('Reid', 'Hoffman', 'reid', 'password');

INSERT INTO Schools (name, type, location, founded_year) VALUES ('Harvard University', 'Higher Education', 'Cambridge, Massachusetts', 1636);

INSERT INTO Companies (name, industry, location) VALUES ('LinkedIn', 'Technology', 'Sunnyvale, California');

-- Assuming Claudine's user_id is 1 and Harvard's school_id is 1
INSERT INTO UserSchools (user_id, school_id, start_date, end_date, degree_type) VALUES (1, 1, '1993-01-01', '1998-12-31', 'PhD');

-- Assuming Reid's user_id is 2 and LinkedIn's company_id is 1
INSERT INTO UserCompanies (user_id, company_id, start_date, end_date, title) VALUES (2, 1, '2003-01-01', '2007-02-01', 'CEO and Chairman');
