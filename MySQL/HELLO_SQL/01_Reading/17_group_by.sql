-- get a grouped column made of the maximum ages per group from the tables users
SELECT MAX(age) FROM hello_sql.users GROUP BY age;

-- get grouped columns by age, and count how many records exist for each one.
SELECT COUNT(age), age FROM hello_sql.users GROUP BY age;

-- get grouped columns by age and count the number of records for each age group, ordering ages in ascending order.
SELECT COUNT(age), age FROM hello_sql.users GROUP BY age ORDER BY age ASC;

-- get columns by age > 15 and count the number of records for each age group, ordering ages in ascending order.
SELECT COUNT(age), age FROM hello_sql.users WHERE age > 15 GROUP BY age ORDER BY age ASC;