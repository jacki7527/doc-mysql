-- Non finalised

CREATE TABLE IF NOT EXISTS r_categories (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(50) NOT NULL,
    parent_id INT,
        FOREIGN KEY (parent_id) REFERENCES categories(id)
        ON DELETE CASCADE
);

DELETE FROM categories;

INSERT INTO r_categories
VALUES 
    (1, 'mammifere', NULL),
    (2 ,'chien', 1),
    (3 ,'chat', 1),
    (4 ,'singe', 1),
    (5 ,'gorille', 4),
    (6 ,'chimpanze', 4),
    (7 ,'chiba', 2),
    (8 ,'corgi', 2),
    (9 ,'labador', 2),
    (10 ,'poisson', NULL),
    (11 ,'requin', 10),
    (12 ,'requin blanc', 11),
    (13 ,'grand requin blanc', 12),
    (14 ,'petit requin blanc', 12),
    (15 ,'requin marteau', 11),
    (16 ,'requin tigre', 11),
    (17 ,'poisson rouge', 10),
    (18 ,'poisson chat', 10);


WITH RECURSIVE temptable AS (
    SELECT * FROM categories WHERE id 14
    UNION ALL
    SELECT * FROM categories, temptable WHERE id = temptable.parent_id
)
SELECT * FROM temptable;





