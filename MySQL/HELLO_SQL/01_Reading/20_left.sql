-- retreive the data (all data) where the name starts with the 's' letter from the table users
SELECT * FROM users
WHERE LEFT(name,1) = 's'