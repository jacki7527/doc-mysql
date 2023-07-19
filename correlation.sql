-- CORELATION QUERY (SUB QUERY)
SELECT *, (
    SELECT COUNT(*) FROM ingredients_recipes
) AS total
FROM recipes;
SELECT r.title
FROM (
    SELECT * FROM recipes
) r;