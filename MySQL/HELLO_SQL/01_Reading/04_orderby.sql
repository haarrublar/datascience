-- get data (ascendent by default) ordered by age
SELECT * FROM hello_sql.users ORDER BY age;

-- get data ascendently ordered by age (same as the previous code).
SELECT * FROM hello_sql.users ORDER BY age ASC;

-- get data descendently ordered by age
SELECT * FROM hello_sql.users ORDER BY age DESC;

-- get data (all data) filtered by email = 'sara@gmail.com' descendently ordered by age
SELECT * FROM hello_sql.users WHERE email = 'sara@gmail.com' ORDER BY age DESC;

-- get names filtered by email = 'sara@gmail.com' descendently ordered by age
SELECT name FROM hello_sql.users WHERE email = 'sara@gmail.com' ORDER BY age DESC;