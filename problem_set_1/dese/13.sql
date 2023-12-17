SELECT "name", "city" FROM "schools"
WHERE "district_id" = (
    SELECT "id" FROM "districts"
    WHERE "state" = 'MA'
);
