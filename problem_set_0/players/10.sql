SELECT "first_name" AS 'First Name', "last_name" AS 'Last Name', "birth_year" AS 'Year of Birth', "height" AS 'Height in Inches'
FROM "players" WHERE "height" > 72 AND "birth_year" > 1980
ORDER BY "birth_year", "height";
