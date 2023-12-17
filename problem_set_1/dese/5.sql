SELECT "city", COUNT(*) AS "NumberOfPublicSchools" FROM "schools"
WHERE type = 'Public School' GROUP BY "city" HAVING COUNT(*) <= 3
ORDER BY "NumberOfPublicSchools" DESC, "city" ASC;
