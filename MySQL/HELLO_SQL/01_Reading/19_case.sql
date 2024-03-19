
/*
The CASE-END statement equivalente to the THEN-ELSE statement is used in SQL as the IF-ELIF-ELSE statement in other programming languages.
This CASE-END statement is ALWAYS used with WHEN-ELSE as follows:
 - WHEN (case_1) THEN (result_1)
 - WHEN (case_2) THEN (result_2)
 - WHEN (case_n) THEN (result_n)
*/

-- get the data (all data) from the table users, and create a new table based on the conditions on age (age > 18 and age = 18) column/variable.
SELECT *,
CASE
	WHEN age > 18 THEN 'Adult'
    WHEN age = 18 THEN 'FRESH ADULT'
    ELSE 'Minor'
END AS 'ADULT OR MINOR?'
FROM hello_sql.users;

-- get the data (all data) from the table users, and create a new table based on the conditions on age (age > 17) column/variable
SELECT *,
CASE
	WHEN age > 17 THEN True
    ELSE False
END AS 'ADULT OR MINOR?'
FROM hello_sql.users;