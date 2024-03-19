


-- JOIN must be with the condition ON to perform the join to set a join rule and avoid confusive outputs.
-- incorrect prompt
SELECT * FROM users
INNER JOIN dni;


-- joining related data (intersection) in between both tables

/*
1:1 JOIN
*/

-- retrieve data from table users and dni with the same user id.
SELECT * FROM users
JOIN dni
-- INNER JOIN dni  -- JOIN and INNER JOIN are the same commands
ON users.user_id = dni.user_id;

-- retrieve data from table users and dni with the same user id descendently ordered by age
SELECT * FROM users
JOIN dni
ON users.user_id = dni.user_id
ORDER BY age DESC;

-- retrieve name, dni_number from table users and dni with the same user id descendently ordered by age
SELECT name, dni_number FROM users
JOIN dni
ON users.user_id = dni.user_id
ORDER BY age DESC;

/*
1:N JOIN. In this cases there are repeatead elements due to the relation both tables have.
*/

-- retrieve data from table users and dni with the same user id
SELECT * FROM users
JOIN companies
ON users.company_id = companies.company_id;

-- it does not matter the join order as shown running this command. However, it is usual to join from left to right.
SELECT * FROM companies
JOIN users
ON users.company_id = companies.company_id;

-- specific columns/variables request from the table based on the condition set in the JOIN command 
SELECT companies.name, users.name FROM users
JOIN companies
ON users.company_id = companies.company_id;

/*
N:M Relation. In this case, we need the intermediate table for table1 and table2 usually called 'table1table2.sql' for relating each of the tables where the FOREIGN KEYS of both tables are assigned to more than one value. 
*/

-- this is the order we may JOIN N:M related tables: table1 JOIN table1table2 JOIN table2
SELECT users.name, languages.name FROM users
JOIN users_languages ON users.user_id = users_languages.user_id
JOIN languages ON languages.language_id = users_languages.language_id;

-- nevertheless JOINING tables in different order does not affect the result
SELECT * FROM users_languages
JOIN users ON users.user_id = users_languages.user_id -- we join users table to the intermediate table
JOIN languages ON languages.language_id = users_languages.language_id; -- we join languages table to the intermediate table

-- retrieve each user's name along with their known programming language from the users and languages tables, using the users_languages table as an intermediary.
SELECT users.name, languages.name FROM users_languages
JOIN users ON users.user_id = users_languages.user_id
JOIN languages ON languages.language_id = users_languages.language_id;

