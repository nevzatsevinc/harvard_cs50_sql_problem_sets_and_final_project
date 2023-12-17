SELECT "teams"."name", ROUND(AVG("salaries"."salary"), 2) AS "average salary"
FROM "salaries"
JOIN "teams" ON "salaries"."team_id" = "teams"."id" AND "salaries"."year" = "teams"."year"
WHERE "salaries"."year" = 2001
GROUP BY "teams"."name"
ORDER BY AVG("salaries"."salary") ASC
LIMIT 5;
