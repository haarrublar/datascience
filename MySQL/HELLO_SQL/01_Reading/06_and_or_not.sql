-- get filtered data (all data) from the table users where the email is not 'sara@gmail.com' 
SELECT * FROM hello_sql.users WHERE NOT email = 'sara@gmail.com';

-- get filtered data (all data) from the table users where the email is not 'sara@gmail.com' and age is "15"
SELECT * FROM hello_sql.users WHERE NOT email = 'sara@gmail.com' AND  age = '15';

-- get filtered data (all data) from the table users where the email is not 'sara@gmail.com' or age is '15'
SELECT * FROM hello_sql.users WHERE NOT email = 'sara@gmail.com' OR  age = '15';
