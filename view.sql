-- VIRTUAL TABLE
CREATE VIEW recipes_with_ingredients
AS 
    SELECT r.title, GROUP_CONCAT(' ', i.name) AS ingredeients
    FROM recipes r
    LEFT JOIN ingredients_recipes ir ON ir.recipe_id = r.id
    LEFT JOIN ingredients i ON ir.ingredient_id = i.id
    GROUP BY r.title;

SELECT * FROM recipes_with_ingredients;
SELECT * 
FROM recipes_with_ingredients
WHERE ingredeients LIKE '%farine%';

-- DROP VIEW recipes_with_ingredients;