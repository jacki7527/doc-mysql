-- get distance of 2 points
SELECT title, ST_Distance_Sphere(
    location,
    (SELECT location FROM posts WHERE title = 'tamatave')
) AS distance
FROM posts
HAVING distance IS NOT NULL;

-- create a procedure getDistance
delimiter $
CREATE PROCEDURE getDistance()
BEGIN
    SELECT * FROM posts;
END$
delimiter ;
CALL getDistance();

-- create a procedure getDistance 2
DROP PROCEDURE getDistance;
delimiter $
CREATE PROCEDURE getDistance()
BEGIN
    SELECT title, ST_Distance_Sphere(
        location,
        (SELECT location FROM posts WHERE title = 'tamatave')
    ) AS distance
    FROM posts
    HAVING distance IS NOT NULL;
END$
delimiter ;
CALL getDistance();

-- create a procedure with parameter IN
DROP PROCEDURE getDistance;
delimiter $
CREATE PROCEDURE getDistance(IN origin VARCHAR(255))
BEGIN
    SELECT title, ST_Distance_Sphere(
        location,
        (SELECT location FROM posts WHERE title = origin)
    ) AS distance
    FROM posts
    HAVING distance IS NOT NULL;
END$
delimiter ;
CALL getDistance('sainte marie');

-- create a procedure with parameter IN AND OUT
DROP PROCEDURE getDistance;
delimiter $
CREATE PROCEDURE getClosesCity(
        IN origin VARCHAR(255),
        OUT closestCity VARCHAR(255)
    )
BEGIN
    SELECT subquery.title INTO closestCity FROM (
        SELECT title, ST_Distance_Sphere(
                location,
                (SELECT location FROM posts WHERE title = origin)
            ) AS distance
            FROM posts
            WHERE title != origin
            HAVING distance IS NOT NULL
            ORDER BY distance ASC
            LIMIT 1
         ) as subquery;
END$
delimiter ;
CALL getClosesCity('tamatave', @city);
SELECT @city;

-- create a procedure with parameter INOUT
DROP PROCEDURE getClosesCity;
delimiter $
CREATE PROCEDURE getClosesCity(
        INOUT origin VARCHAR(255)
    )
BEGIN
    SELECT subquery.title INTO origin FROM (
        SELECT title, ST_Distance_Sphere(
                location,
                (SELECT location FROM posts WHERE title = origin)
            ) AS distance
            FROM posts
            WHERE title != origin
            HAVING distance IS NOT NULL
            ORDER BY distance ASC
            LIMIT 1
         ) as subquery;
END$
delimiter ;
SET @city = 'tamatave';
CALL getClosesCity(@city);
SELECT @city;


-- all procedure status
SHOW PROCEDURE STATUS;
-- procedure status
SHOW PROCEDURE STATUS LIKE 'getDistance';

