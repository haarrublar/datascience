-- retreive the data (all data) where the email is 'sara@gmail.com' or age > 15 but not both from the tables users
SELECT * FROM users
WHERE (email = 'sara@gmail.com' AND age <= 15) OR (email <> 'sara@gmail.com' AND age > 15)