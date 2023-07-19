-- CALCULATED COLUMN WHEN ACTION IS SET
ALTER TABLE ingredients ADD COLUMN usage_count INT DEFAULT 0;

DROP TRIGGER update_usage_count_ingredients_linked;
SELECT * FROM ingredients;

SHOW TRIGGERS;
UPDATE ingredients
SET usage_count = 2
WHERE id = 1;

CREATE TRIGGER update_usage_count_ingredients_linked
BEFORE INSERT ON ingredients
FOR EACH ROW
    SET NEW.usage_count = NEW.usage_count + 1;




-- WHERE NEW.email != OLD.mail