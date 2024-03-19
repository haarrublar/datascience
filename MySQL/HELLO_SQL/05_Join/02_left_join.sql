-- reterive all the users table data and the one matched with the dni table with the same users_id
SELECT * FROM users
LEFT JOIN dni ON users.user_id = dni.user_id;

-- Filter the left join retreving just the name and dni_number variables/columns. If users does not have a dni_null the value is null
SELECT name, dni_number FROM users
LEFT JOIN dni ON users.user_id = dni.user_id;

-- In this case the table is different when the join order changes. Retreives all dni values and the ones where dni_id and users_id match. 
SELECT name, dni_number FROM dni
LEFT JOIN users ON users.user_id = dni.user_id;

SELECT users.name, languages.name FROM users
LEFT JOIN users_languages ON users.user_id = users_languages.user_id
LEFT JOIN languages ON languages.language_id = users_languages.language_id;