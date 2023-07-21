DROP TABLE posts;

-- create table text with column FULLTEXT
CREATE TABLE posts (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    title VARCHAR(255) NOT NULL,
    content LONGTEXT,
    online BOOLEAN DEFAULT 0,
    FULLTEXT (content, title)
) ENGINE = INNODB;

-- insert row
INSERT INTO posts (title, content) VALUES
    ('Lorem', 'Lorem ipsum raton dolor sit amet, consectetur adipisicing elit'),
    ('Lorem laveur', 'quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo'),
    ('Lorem raton', 'Duis aute raton irure dolor in reprehenderit in voluptate velit esse'),
    ('Lorem', 'sunt in culpa qui raton laveur officia deserunt mollit anim id est laborum');

-- show all rows
SELECT * FROM posts;

-- Searh in like
SELECT * 
FROM posts
WHERE content LIKE '%ato%';

-- Search in natural language
SELECT * 
FROM posts
WHERE MATCH(content, title) AGAINST ('Raton laveur' IN NATURAL LANGUAGE MODE);

-- Search in boolean content containing ration and laveur
SELECT * 
FROM posts
WHERE MATCH(content, title) AGAINST ('+Raton +laveur' IN BOOLEAN MODE);

-- Search in boolean content containing ration and without laveur
SELECT * 
FROM posts
WHERE MATCH(content, title) AGAINST ('+Raton -laveur' IN BOOLEAN MODE);


--  Search in boolean content containing ration and laveur using aggregation
SELECT *, 
    MATCH(content, title) AGAINST ('+Raton +laveur' IN BOOLEAN MODE) AS score
FROM posts
ORDER BY score DESC;

--  Search in boolean using aggregation and condition
SELECT *, 
    MATCH(content, title) AGAINST ('+Raton +laveur' IN BOOLEAN MODE) AS score
FROM posts
WHERE MATCH(content, title) AGAINST ('+Raton +laveur' IN BOOLEAN MODE);

-- show all stopped words
SELECT * FROM information_schema.`INNODB_FT_DEFAULT_STOPWORD`;