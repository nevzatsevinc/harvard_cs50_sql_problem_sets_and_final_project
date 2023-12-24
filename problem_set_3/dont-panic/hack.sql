UPDATE "users" SET password = '982c0381c279d139fd221fce974916e7' WHERE "username" = 'admin';


DELETE FROM "user_logs" WHERE "old_username" = 'admin';

INSERT INTO "user_logs" ("type", "old_username", "new_username", "old_password", "new_password")
SELECT 'update', 'admin', 'admin', NULL, ( SELECT "password" FROM "users" WHERE "username" = 'emily33');
