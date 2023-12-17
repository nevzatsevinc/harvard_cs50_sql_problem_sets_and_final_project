SELECT "teams"."name", SUM("performances"."H") AS "total hits"
FROM "teams"
JOIN "performances" ON "teams"."id" = "performances"."team_id" AND teams.year = "performances"."year"
WHERE "teams"."year" = 2001
GROUP BY "teams"."name"
ORDER BY SUM("performances"."H") DESC
LIMIT 5;
