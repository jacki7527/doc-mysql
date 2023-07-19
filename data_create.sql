-- DATA CREATE
INSERT INTO categories (title) VALUES ('plat'), ('dessert'), ('gateau');
INSERT INTO users (name, email) VALUES ('john doe', 'john@mail.mg');
INSERT INTO recipes (title, slug, duration, users_id) VALUES 
    ('soupe', 'soupe', 10, 1),
    ('madeleine', 'madeleine', 3, 1);
INSERT INTO categories_recipes (recipe_id, category_id) VALUES
    (1, 1),
    (2, 2),
    (2, 3);
INSERT INTO ingredients (name) VALUES
    ('sucre'),
    ('farine'),
    ('levure chimique'),
    ('beure'),
    ('lait'),
    ('oeuf');
INSERT INTO ingredients_recipes (recipe_id, ingredient_id, quantity, unity) VALUES 
    (2, 1, 150, 'gramme'),
    (2, 2, 100, 'gramme'),
    (2, 3, 250, 'gramme'),
    (2, 4, 100, 'gramme'),
    (2, 5, 50, 'gramme'),
    (2, 6, 3, NULL);