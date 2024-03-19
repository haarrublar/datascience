-- reterive all the dni table data and the one matched with the users table with the same users_id
SELECT * FROM users
RIGHT JOIN dni ON users.user_id = dni.user_id; 

-- Filter the right join retreving just the name and dni_number variables/columns. If users does not have a dni_null the value is null
SELECT name, dni_number FROM users
RIGHT JOIN dni ON users.user_id = dni.user_id;

-- In this case the table is different when the join order changes. Retreives all dni values and the ones where dni_id and users_id match. 
SELECT name, dni_number FROM dni
RIGHT JOIN users ON users.user_id = dni.user_id;

SELECT users.name, languages.name FROM users
RIGHT JOIN users_languages ON users.user_id = users_languages.user_id
RIGHT JOIN languages ON languages.language_id = users_languages.language_id;