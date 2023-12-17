SELECT "year", ROUND(AVG("salary"), 2) AS "average salary"
FROM "Salaries"
GROUP BY "year"
ORDER BY "year" DESC;
