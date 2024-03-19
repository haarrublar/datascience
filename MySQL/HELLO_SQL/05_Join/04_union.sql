
-- For implementing a union you need to do a left and right union at the time, and union both tables.
SELECT users.user_id AS u_user_id, dni.user_id AS d_user_id
FROM users
LEFT JOIN dni ON users.user_id = dni.user_id
UNION
SELECT users.user_id AS u_user_id, dni.user_id AS d_user_id
FROM users
right JOIN dni ON users.user_id = dni.user_id;