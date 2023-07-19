-- DATA READ 
SELECT * FROM recipes;

-- show all occurence between tables
SELECT * -- column to show
FROM recipes r -- main table
LEFT JOIN categories_recipes cr ON recipe_id = r.id;

-- show only used occurence used between 2 tables by id
SELECT * -- column to show
FROM recipes r -- main table
JOIN categories_recipes cr ON recipe_id = r.id; -- join table with condition

-- show only used occurence used between 3 tables by id
SELECT r.title AS titles, c.title AS categories 
FROM recipes r 
JOIN categories_recipes cr ON recipe_id = r.id
JOIN categories c ON c.id = cr.category_id;

-- show only used occurence used between 3 tables by id
SELECT r.title, ir.quantity, ir.unity, i.name AS ingredients
FROM recipes r
JOIN ingredients_recipes ir ON ir.recipe_id = r.id
JOIN ingredients i ON ir.ingredient_id = i.id;

-- show occurence with any condition on a table
SELECT *
FROM ingredients i
WHERE i.name = 'oeuf';

--  show occurence with any condition between 2 tables
SELECT *
FROM ingredients i
JOIN ingredients_recipes ir ON ir.ingredient_id = i.id
WHERE i.name = 'oeuf';

--  show occurence with any condition between 3 tables
SELECT r.title
FROM ingredients i
JOIN ingredients_recipes ir ON ir.ingredient_id = i.id
JOIN recipes r ON ir.recipe_id = r.id
WHERE i.name = 'oeuf'; -- WHERE recipe_id IS NULL