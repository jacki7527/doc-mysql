DROP TABLE posts;

-- create table posts
CREATE TABLE posts (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    title VARCHAR(255) NOT NULL,
    content LONGTEXT,
    online BOOLEAN DEFAULT 0,
    published_at DATETIME,
    created_at DATETIME NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE = INNODB;



-- insert row with column datetime format
INSERT INTO posts (title, published_at) VALUES ('Hello World', '2023-06-01 12:00');
 
-- show rows
SELECT * FROM posts;

-- update row and check the autoupdatecolumn update_at
UPDATE posts SET published_at = NOW() WHERE id = 1;

SHOW VARIABLES LIKE 'character_set_server';

-- DATETIME
SELECT title, published_at FROM posts;
    -- year
SELECT title, YEAR(published_at) FROM posts;
    -- year from now
SELECT title, YEAR(published_at) FROM posts WHERE DAY(published_at) > NOW();
    -- month
SELECT title, MONTH(published_at) FROM posts;
    -- day
SELECT title, DAY(published_at) FROM posts;
    -- time
SELECT title, TIME(published_at) FROM posts;
    -- hour
SELECT title, HOUR(published_at) FROM posts;
    -- minute
SELECT title, MINUTE(published_at) FROM posts;
    -- duration
SELECT title, TIMEDIFF(NOW(), published_at) FROM posts;
-- timezone server default
SELECT @@global.time_zone, @@session.time_zone;
-- set time zone gap
SET time_zone = '+00:00';
-- check time zone gap
SELECT @@global.time_zone, @@session.time_zone;
-- hour gap between server and user
SELECT TIMEDIFF(NOW(), CONVERT_TZ(NOW(), @@session.time_zone, '+00:00'));




