-- *** The Lost Letter ***
-- Find the sender
SELECT * FROM "addresses" WHERE "address" = '900 Somerville Avenue';

-- Find type of address
SELECT "type" FROM "addresses" WHERE "address" = '900 Somerville Avenue';

-- Search 2 Finnegan Street
SELECT * FROM "addresses" WHERE "address" LIKE '2 Fin%';

-- Find the Package
SELECT * FROM "packages" WHERE "from_address_id" = (
    SELECT "id" FROM "addresses" WHERE "address" = '900 Somerville Avenue'
) AND "to_address_id" = (
    SELECT "id" FROM "addresses" WHERE "address" LIKE '2 Fin%'
);

-- Find the scans of the package
SELECT * FROM "scans" WHERE "package_id" = (SELECT "id" FROM "packages" WHERE "from_address_id" = (
    SELECT "id" FROM "addresses" WHERE "address" = '900 Somerville Avenue'
) AND "to_address_id" = (
    SELECT "id" FROM "addresses" WHERE "address" LIKE '2 Fin%'
));

-- Find address id
SELECT "address_id" FROM "scans" WHERE "package_id" = (SELECT "id" FROM "packages" WHERE "from_address_id" = (
    SELECT "id" FROM "addresses" WHERE "address" = '900 Somerville Avenue'
) AND "to_address_id" = (
    SELECT "id" FROM "addresses" WHERE "address" LIKE '2 Fin%'
)
AND "action" = 'Drop'
);

-- Find the receivers address
SELECT "address" FROM "addresses" WHERE "id" = (
    SELECT "address_id" FROM "scans" WHERE "package_id" = (
        SELECT "id" FROM "packages" WHERE "from_address_id" = (
            SELECT "id" FROM "addresses" WHERE "address" = '900 Somerville Avenue'
        ) AND "to_address_id" = (
            SELECT "id" FROM "addresses" WHERE "address" LIKE '2 Fin%'
        ) AND "action" = 'Drop'
    )
);



-- *** The Devious Delivery ***
-- Find the package
SELECT * FROM "packages" WHERE "from_address_id" IS NULL;

-- Find the contents of the Devious Delivery
SELECT "contents" FROM "packages" WHERE "from_address_id" IS NULL;

-- Look at scans
SELECT * FROM "scans" WHERE "package_id" = (SELECT "id" FROM "packages" WHERE "from_address_id" IS NULL);

-- Find the Devious Delivery info
SELECT * FROM "addresses" WHERE "id" = (SELECT "address_id" FROM "scans" WHERE "package_id" = (SELECT "id" FROM "packages" WHERE "from_address_id" IS NULL) AND "action" = 'Drop');

-- Type of the Devious Delivery address
SELECT "type" FROM "addresses" WHERE "id" = (SELECT "address_id" FROM "scans" WHERE "package_id" = (SELECT "id" FROM "packages" WHERE "from_address_id" IS NULL) AND "action" = 'Drop');



-- *** The Forgotten Gift ***
-- Find the sender
SELECT * FROM "addresses" WHERE "address" = '109 Tileston Street';

-- Find the receiver
SELECT * FROM "addresses" WHERE "address" = '728 Maple Place';

-- Find the package
SELECT * FROM "packages" WHERE "from_address_id" = (
    SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street'
) AND "to_address_id" = (
    SELECT "id" FROM "addresses" WHERE "address" = '728 Maple Place'
);

-- Find contents of the package
SELECT "contents" FROM "packages" WHERE "from_address_id" = (
    SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street'
) AND "to_address_id" = (
    SELECT "id" FROM "addresses" WHERE "address" = '728 Maple Place'
);

-- Name of the driver
SELECT "name" FROM "drivers" WHERE "id" = (
    SELECT "driver_id" FROM "scans" WHERE "package_id" = (
        SELECT "id" FROM "packages" WHERE "from_address_id" = (
            SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street'
        ) AND "to_address_id" = (
            SELECT "id" FROM "addresses" WHERE "address" = '728 Maple Place'
        )
    ) ORDER BY "timestamp" DESC LIMIT 1
);
