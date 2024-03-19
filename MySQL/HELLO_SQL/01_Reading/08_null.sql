-- get filtered data (all data) from the table users with null email.
SELECT * FROM hello_sql.users WHERE email IS NULL;

-- get filtered data (all data) from the table users with email not null.
SELECT * FROM hello_sql.users WHERE email IS NOT NULL;

-- get filtered data (all data) from the table users with email not null and age is 15.
SELECT * FROM hello_sql.users WHERE email IS NOT NULL AND age = 15;

-- get name, surname and age from the table users. If the age is null then the new age is shown as 0. The resultant column for that modification is called 
SELECT name, surname, IFNULL(age, 0) AS age FROM users;