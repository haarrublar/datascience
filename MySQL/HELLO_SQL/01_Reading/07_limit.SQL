-- get the tree first data from the table users.
SELECT * FROM hello_sql.users LIMIT 2;

-- get the two first data from the table users where the email is not 'sara@gmail.com' or age is 15.
SELECT * FROM hello_sql.users WHERE NOT email = 'sara@gmail.com' OR  age = '15' LIMIT 2;
