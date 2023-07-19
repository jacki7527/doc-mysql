START TRANSACTION;
    SELECT * FROM recipes;
    DELETE FROM recipes WHERE id = 1;
    SELECT * FROM recipes;
ROLLBACK;
COMMIT;

SELECT * FROM recipes;