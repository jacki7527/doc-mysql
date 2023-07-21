-- connection in line command
mysql -u root -p -h localhost;

-- DATABASE
SHOW DATABASES;
CREATE DATABASE dbname;
DROP DATABASE dbname;

-- TABLE
USE temp;
CREATE TABLE tableName(id INT PRIMARY KEY AUTO_INCREMENT, name TEXT);
DESCRIBE tableName;
TRUNCATE tableName;
DROP TABLE tableName;
ALTER TABLE tableName ADD COLUMN firstName TEXT;
ALTER TABLE tableName CHANGE name name VARCHAR(10);
ALTER TABLE tableName DROP name;

-- CRUD
INSERT INTO tableName (name, firstName) VALUES ('john', 'Doe'), ('Mr', 'Dupon');
SELECT * FROM tableName;
SELECT id, name FROM tableName;
UPDATE tableName SET name = 'modif' WHERE id = 2;
DELETE FROM tableName WHERE id = 2;

-- OTHERS
-- DEFAULT CHARACTER SET utf8;
-- DEFAULT COLLATE utf8_general_ci;
SET NAMES utf8;
SHOW FULL TABLES;
SHOW OPEN TABLES;
DESCRIBE tableName;
SHOW FIELDS FROM tableName;
