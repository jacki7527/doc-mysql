-- AGGREGATS avg(x) count(*) count(X) group_concat(x) group_concat(x, y) max(x) min(x) sum(x) total(x)

-- get the number of occurences
SELECT COUNT(*) FROM recipes;

-- get the number of occurences grouped by a column
SELECT COUNT(*), duration FROM recipes
GROUP BY duration;

-- get the number of occurences grouped by a column with condition
SELECT COUNT(*) AS count, duration FROM recipes
GROUP BY duration
HAVING count >= 2;

-- sum all row in a column
SELECT SUM(duration) AS sum_duration FROM recipes;

-- concat all row in a column
SELECT GROUP_CONCAT(title) AS sum_duration FROM recipes;

-- concat all row in a column with separator
SELECT GROUP_CONCAT(' ', title) AS sum_duration FROM recipes;

-- concat all row in a column
SELECT i.name, COUNT(ir.recipe_id) as count
FROM ingredients i
LEFT JOIN ingredients_recipes ir ON ir.ingredient_id = i.id
GROUP BY i.name;

-- count row in a column and filter by value of other column
SELECT i.name, COUNT(ir.recipe_id) as count
FROM ingredients i
LEFT JOIN ingredients_recipes ir ON ir.ingredient_id = i.id
LEFT JOIN recipes r ON ir.recipe_id = r.id
GROUP BY i.name
ORDER BY count DESC; --ASC

-- count row in a column and filter by value of other column
SELECT i.name, COUNT(ir.recipe_id) as count
FROM ingredients i
LEFT JOIN ingredients_recipes ir ON ir.ingredient_id = i.id
LEFT JOIN recipes r ON ir.recipe_id = r.id
GROUP BY i.name
ORDER BY count DESC, i.name ASC; 

-- limit of the result
SELECT i.name, COUNT(ir.recipe_id) as count
FROM ingredients i
LEFT JOIN ingredients_recipes ir ON ir.ingredient_id = i.id
LEFT JOIN recipes r ON ir.recipe_id = r.id
GROUP BY i.name
ORDER BY count DESC, i.name ASC
LIMIT 3;

-- offset of the result limit
SELECT i.name, COUNT(ir.recipe_id) as count
FROM ingredients i
LEFT JOIN ingredients_recipes ir ON ir.ingredient_id = i.id
LEFT JOIN recipes r ON ir.recipe_id = r.id
GROUP BY i.name
ORDER BY count DESC, i.name ASC
LIMIT 3 OFFSET 3;



SELECT i.name, COUNT(ir.recipe_id) as count, r.duration
FROM ingredients i
LEFT JOIN ingredients_recipes ir ON ir.ingredient_id = i.id
LEFT JOIN recipes r ON ir.recipe_id = r.id
GROUP BY i.name, r.duration;
