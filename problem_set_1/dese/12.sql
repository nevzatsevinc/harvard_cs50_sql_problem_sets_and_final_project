SELECT
      "districts"."name",
      "expenditures"."per_pupil_expenditure",
      "staff_evaluations"."exemplary"
FROM "expenditures"

JOIN "districts" ON "expenditures"."district_id" = "districts"."id"
JOIN "staff_evaluations" ON "staff_evaluations"."district_id" = "districts"."id"

WHERE "expenditures"."per_pupil_expenditure" > (
      SELECT AVG("expenditures"."per_pupil_expenditure") FROM "expenditures"
)
AND "staff_evaluations"."exemplary" > (
      SELECT AVG("staff_evaluations"."exemplary") FROM "staff_evaluations"
)
AND "districts"."id" IN (
      SELECT "id" FROM "districts" WHERE type = 'Public School District'
)
ORDER BY "staff_evaluations"."exemplary" DESC, "expenditures"."per_pupil_expenditure" DESC;
