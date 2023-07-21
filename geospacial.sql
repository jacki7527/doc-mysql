ALTER TABLE posts ADD COLUMN location POINT;

-- reinit table post
TRUNCATE posts;

-- insert rows
INSERT INTO posts (title, location) VALUES 
    ('tamatave', ST_GeomFromText('POINT(-21.044750 55.262840)')),
    ('sainte marie', ST_GeomFromText('POINT(2.101150 13.205420)')),
    ('nosy be', ST_GeomFromText('POINT(51.987190 20.796160)'));

 -- distance between 2 points
SELECT ST_Distance_Sphere (
    (SELECT location FROM posts WHERE title = 'tamatave'),
    (SELECT location FROM posts WHERE title = 'sainte marie')
) AS distance;

 -- distance between 2 points in unity
SELECT CONCAT(ROUND(
    ST_Distance_Sphere (
        (SELECT location FROM posts WHERE title = 'tamatave'),
        (SELECT location FROM posts WHERE title = 'sainte marie')
    ) / 1000
), ' km' ) AS distance;