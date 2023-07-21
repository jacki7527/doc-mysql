ALTER TABLE posts ADD COLUMN author JSON;

INSERT INTO posts (title, author) VALUES ('titre de test', '{"age":30, "name": "Jane"}');

SELECT * FROM posts;

UPDATE posts SET author = JSON_SET(author, '$.age', author->'$.age' + 2) WHERE id = 4;

SELECT title, author->"$.age"
FROM posts
WHERE author > 0;

