-- get filtered data (all data) from table users ending in "gmail.com"  
SELECT * FROM hello_sql.users WHERE email LIKE '%gmail.com';

-- get filtered data (all data) from table users starting in "sara"  
SELECT * FROM hello_sql.users WHERE email LIKE 'sara%';

-- get filtered data (all data) from table users containing "@".   
SELECT * FROM hello_sql.users WHERE email LIKE '%@%';