SELECT "name" FROM "districts"
JOIN "expenditures" ON "districts"."id" = "expenditures"."district_id"
GROUP BY "name"
ORDER BY "pupils" ASC
LIMIT 1;
