DROP TABLE IF EXISTS categories_recipes;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS recipes;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS ingredients;
DROP TABLE IF EXISTS ingredients_recipes;

-- CREATE TABLE USER
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(30) NOT NULL UNIQUE
) ENGINE=INNODB;

-- CREATE TABLE RECIPES
CREATE TABLE recipes (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    title VARCHAR(150),
    slug VARCHAR(150) NOT NULL UNIQUE,
    date DATETIME,
    duration INT,
    users_id INT,
        FOREIGN KEY (users_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=INNODB;

-- CREATE TABLE CATEGORIES
CREATE TABLE categories (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    title VARCHAR(150) NOT NULL
) ENGINE=INNODB;

-- CREATE TABLE CATEGORIES AND RECIPES
CREATE TABLE categories_recipes (
    recipe_id INT,
    category_id INT,
        FOREIGN KEY (recipe_id) REFERENCES recipes(id) ON DELETE CASCADE,
        FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE,
        PRIMARY KEY (recipe_id, category_id),
        UNIQUE (recipe_id, category_id)
) ENGINE=INNODB;

-- CREATE TABLE INGREDIENTS
CREATE TABLE ingredients (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(150)
) ENGINE=INNODB;

-- CREATE TABLE INGREDIENDS AND RECIPES
CREATE TABLE ingredients_recipes (
    recipe_id INT,
    ingredient_id INT,
    quantity INT,
    unity VARCHAR(20),
        FOREIGN KEY (recipe_id) REFERENCES recipes(id) ON DELETE CASCADE,
        FOREIGN KEY (ingredient_id) REFERENCES ingredients(id) ON DELETE CASCADE,
        PRIMARY KEY (recipe_id, ingredient_id),
        UNIQUE (recipe_id, ingredient_id)
) ENGINE=INNODB;