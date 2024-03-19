
-- set an alias after filtering the names and ini_data from the table users with 20 < age < 30
-- both quotation marks in mysql are allowed
SELECT name, ini_date AS "init_date" FROM hello_sql.users WHERE age BETWEEN 20 AND 30
SELECT name, ini_date AS 'init_date' FROM hello_sql.users WHERE age BETWEEN 20 AND 30

