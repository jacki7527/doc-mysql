-- PARTITION (reveiw several times)

CREATE TABLE IF NOT EXISTS sales (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    year INTEGER,
    country VARCHAR(255),
    product VARCHAR(255),
    profit INTEGER
);

INSERT INTO sales (year, country, product, profit)
VALUES
  (2000,'Finland','Computer'  ,  1500),
  (2000,'Finland','Phone'     ,   100),
  (2001,'Finland','Phone'     ,    10),
  (2000,'India'  ,'Calculator',    75),
  (2000,'India'  ,'Calculator',    75),
  (2000,'India'  ,'Computer'  ,  1200),
  (2000,'USA'    ,'Calculator',    75),
  (2000,'USA'    ,'Computer'  ,  1500),
  (2001,'USA'    ,'Calculator',    50),
  (2001,'USA'    ,'Computer'  ,  1500),
  (2001,'USA'    ,'Computer'  ,  1200),
  (2001,'USA'    ,'TV'        ,   150),
  (2001,'USA'    ,'TV'        ,   100);

-- step 1 sum
SELECT * FROM sales;

-- step 2 sum
SELECT SUM(profit) AS 'total' 
FROM sales;

-- step 3 sum
SELECT *, SUM(profit) AS 'total' 
FROM sales;

-- step 4 sum
SELECT 
  *,
  SUM(profit) OVER () AS 'total_country'
FROM sales;

-- step 5 sum
SELECT 
  *,
  SUM(profit) OVER (PARTITION BY country) AS 'total_country'
FROM sales;

-- Partition
SELECT 
  *,
  SUM(profit) OVER w AS 'total_country'
FROM sales
WINDOW w AS (PARTITION BY country);

-- trick 1 sum
SELECT 
  *,
  SUM(profit) OVER (ORDER BY profit DESC ROWS BETWEEN CURRENT ROW AND 1 FOLLOWING) AS 'total_country'
FROM sales;

-- trick 2 sum and row
SELECT 
  *,
  SUM(profit) OVER (PARTITION BY country) AS 'total_country',
  ROW_NUMBER() OVER (PARTITION BY country) AS 'row_number'
FROM sales;

-- trick 2 sum and row Ordered by
SELECT 
  *,
  SUM(profit) OVER (PARTITION BY country) AS 'total_country',
  ROW_NUMBER() OVER (PARTITION BY country ORDER BY profit ASC) AS 'row_number'
FROM sales;

-- trick top 3 of products
SELECT * FROM (
    SELECT 
    *,
    SUM(profit) OVER (PARTITION BY country) AS 'total_country',
    ROW_NUMBER() OVER (PARTITION BY country) AS 'row_number'
    FROM sales
) as t
WHERE t.row_number <= 3;

-- rank take care the row number egality (execo) with hole
SELECT 
  *,
  SUM(profit) OVER (PARTITION BY country) AS 'total_country',
  RANK() OVER (PARTITION BY country ORDER BY profit ASC) AS 'rank'
FROM sales;

-- dense rank take care the row number egality (execo) without hole
SELECT 
  *,
  SUM(profit) OVER (PARTITION BY country ORDER BY profit DESC) AS 'total_country',
  DENSE_RANK() OVER (PARTITION BY country ORDER BY profit DESC) AS 'rank'
FROM sales;



