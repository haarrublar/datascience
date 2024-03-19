
/*
UPDATE always written with WHERE statement.
*/

-- set the age equals to 11 for the register with user_id = 11 from the table users. 
/*
In this case there is an error. The age variable type is INT not STRING.
*/
UPDATE hello_sql.users SET age = '21' WHERE user_id = 11;

-- The age variable was INT type. CAREFULL!
UPDATE hello_sql.users SET age = 21, ini_date = '2020-10-12' WHERE user_id = 11;