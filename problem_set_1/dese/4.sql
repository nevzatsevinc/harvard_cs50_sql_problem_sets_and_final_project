SELECT "city", COUNT(*) AS "NumberOfPublicSchools" FROM "schools"
WHERE type = 'Public School' GROUP BY "city"
ORDER BY "NumberOfPublicSchools" DESC, "city" ASC LIMIT 10;
