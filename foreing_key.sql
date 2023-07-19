CREATE TABLE parent (
    id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL
) ENGINE=INNODB;

CREATE TABLE child (
    id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    parent_id INT,
        INDEX par_ind (parent_id),
        FOREIGN KEY (parent_id)
            REFERENCES parent(id)
) ENGINE=INNODB;

-- Insert a row 
INSERT INTO parent (id) VALUES ROW(1);

-- The insert operation is successful because parent_id 1 is present in the parent table.
INSERT INTO child (id, parent_id) VALUES ROW(1,1);

-- The operation fails because the specified parent_id value does not exist in the parent table.
INSERT INTO child (id,parent_id) VALUES ROW(2,2);

-- This operation fails because the record in the child table contains the referenced id (parent_id) value.
DELETE FROM parent WHERE id = 1;

-- UPDATE CASCADE referential action updated the child table, like this
CREATE TABLE child (
    id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    parent_id INT,
        FOREIGN KEY (parent_id) REFERENCES parent(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE -- CASCADE/ SET NULL/ SET DEFAULT/ RESTRICT
) ENGINE=INNODB;

INSERT INTO child (id,parent_id) VALUES ROW(1,1), ROW(2,1), ROW(3,1);

UPDATE parent SET id = 2 WHERE id = 1;

-- DELETE CASCADE referential action, delete records from the parent table where parent_id = 2; this deletes all records in the parent table.
DELETE FROM parent WHERE id = 2;
