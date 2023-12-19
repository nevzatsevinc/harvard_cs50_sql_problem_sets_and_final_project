CREATE TABLE ingredients (
    'id' INTEGER,
    "name" TEXT,
    "price_per_unit" REAL,
    "unit" TEXT,
    PRIMARY KEY ("id")
);

CREATE TABLE donuts (
    "id" INTEGER,
    "name" TEXT,
    "is_gluten_free" BOOLEAN,
    "price" REAL,
    PRIMARY KEY ("id")
);

CREATE TABLE donut_ingredients (
    "donut_id" INTEGER,
    "ingredient_id" INTEGER,
    PRIMARY KEY ("donut_id", "ingredient_id"),
    FOREIGN KEY ("donut_id") REFERENCES "donuts"("id"),
    FOREIGN KEY ("ingredient_id") REFERENCES "ingredients"("id")
);

CREATE TABLE customers (
    "id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT,
    PRIMARY KEY ("id")
);

CREATE TABLE orders (
    "id" INTEGER,
    "customer_id" INTEGER,
    PRIMARY KEY ("id")
    FOREIGN KEY ("customer_id") REFERENCES "customers"("id")
);

CREATE TABLE order_donuts (
    "order_id" INTEGER,
    "donut_id" INTEGER,
    "quantity" INTEGER,
    PRIMARY KEY ("order_id", "donut_id"),
    FOREIGN KEY ("order_id") REFERENCES "orders"("id"),
    FOREIGN KEY ("donut_id") REFERENCES "donuts"("id")
);



INSERT INTO ingredients ("name", "price_per_unit", "unit") VALUES ('Cocoa', 5.00, 'one pound');
INSERT INTO ingredients ("name", "price_per_unit", "unit") VALUES ('Sugar', 2.00, 'one pound');

INSERT INTO donuts ("name", "is_gluten_free", "price") VALUES ('Belgian Dark Chocolate', 0, 4.00);
INSERT INTO donuts ("name", "is_gluten_free", "price") VALUES ('Back-To-School Sprinkles', 0, 4.00);

INSERT INTO customers ("first_name", "last_name") VALUES ('Luis', 'Singh');

INSERT INTO orders ("customer_id") VALUES ((SELECT "id" FROM "customers" WHERE "first_name" = 'Luis' AND "last_name" = 'Singh'));

INSERT INTO order_donuts ("order_id", "donut_id", "quantity") VALUES (1, 1, 3);
INSERT INTO order_donuts ("order_id", "donut_id", "quantity") VALUES (1, 2, 2);

INSERT INTO donut_ingredients ("donut_id", "ingredient_id") VALUES (1, (SELECT "id" FROM "ingredients" WHERE "name" = 'Cocoa'));
INSERT INTO donut_ingredients ("donut_id", "ingredient_id") VALUES (1, (SELECT "id" FROM "ingredients" WHERE "name" = 'Flour'));
INSERT INTO donut_ingredients ("donut_id", "ingredient_id") VALUES (1, (SELECT "id" FROM "ingredients" WHERE "name" = 'Buttermilk'));
INSERT INTO donut_ingredients ("donut_id", "ingredient_id") VALUES (1, (SELECT "id" FROM "ingredients" WHERE "name" = 'Sugar'));

INSERT INTO donut_ingredients ("donut_id", "ingredient_id") VALUES (2, (SELECT "id" FROM "ingredients" WHERE "name" = 'Flour'));
INSERT INTO donut_ingredients ("donut_id", "ingredient_id") VALUES (2, (SELECT "id" FROM "ingredients" WHERE "name" = 'Buttermilk'));
INSERT INTO donut_ingredients ("donut_id", "ingredient_id") VALUES (2, (SELECT "id" FROM "ingredients" WHERE "name" = 'Sugar'));

