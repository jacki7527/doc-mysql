DROP USER 'readonly'@'%';

-- new database user
CREATE USER 'readonly'@'%' IDENTIFIED BY '0000';

-- show all user in database
SELECT * FROM mysql.user;

-- add permission to an user
GRANT SELECT ON tuto.posts TO 'readonly'@'%';

-- show user permission
SHOW GRANTS FOR 'readonly'@'%';

-- delete user permission
REVOKE SELECT ON tuto.posts FROM 'readonly'@'%';

SHOW GRANTS FOR 'readonly'@'%';

-- create table users
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255)
);