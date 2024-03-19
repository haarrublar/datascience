-- get filter data (all data) from the table users with age = 15
SELECT * FROM hello_sql.users WHERE age=15;

-- get filter name from the table users such that their age = 15
SELECT name FROM hello_sql.users WHERE age=15;

-- get filter of unique/different ages from the table users with age = 15
SELECT DISTINCT age FROM hello_sql.users WHERE age=15;

-- get filter of unique/different names from the table users such that their age = 15
SELECT DISTINCT name FROM hello_sql.users WHERE age=15;