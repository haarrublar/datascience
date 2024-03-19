-- insert values 8, 'Maria', and 'Lopez' to the variables/columns user_id, name, surname respectively in the table users.
INSERT INTO hello_sql.users (user_id, name, surname) VALUES (8, 'Maria', 'Lopez');

-- insert values 'Paco', and 'Perez' to the variables/columns name, surname respectively in the table users.
INSERT INTO hello_sql.users (name, surname) VALUES ('Paco', 'Perez');

-- insert values 11, 'EL', and 'Merma' to the variables/columns user_id, name, surname respectively in the table users.
INSERT INTO users (user_id, name, surname) VALUES (11, 'El', 'Merma')



/*
Necessary to create Mauredev example
*/

/*
INSERT
*/

INSERT INTO dni (dni_number, user_id) VALUES (111,1)
INSERT INTO dni (dni_number, user_id) VALUES (123,2)
INSERT INTO dni (dni_number, user_id) VALUES (456,3)
INSERT INTO dni (dni_number) VALUES (567);


INSERT INTO companies (name) VALUES ('MoureDEV')
INSERT INTO companies (name) VALUES ('Apple')
INSERT INTO companies (name) VALUES ('Google');

UPDATE users SET company_id = 1 WHERE user_id = 1
UPDATE users SET company_id = 2 WHERE user_id = 3
UPDATE users SET company_id = 3 WHERE user_id = 4
UPDATE users SET company_id = 7 WHERE user_id = 7;


INSERT INTO languages (name) VALUES ('Swift')
INSERT INTO languages (name) VALUES ('Kotlin')
INSERT INTO languages (name) VALUES ('JavaScript')
INSERT INTO languages (name) VALUES ('Java')
INSERT INTO languages (name) VALUES ('Python')
INSERT INTO languages (name) VALUES ('C#')
INSERT INTO companies (name) VALUES ('COBOL');

INSERT INTO users_languages (user_id, language_id) VALUES (1,1)
INSERT INTO users_languages (user_id, language_id) VALUES (1,2)
INSERT INTO users_languages (user_id, language_id) VALUES (1,5)
INSERT INTO users_languages (user_id, language_id) VALUES (2,3)
INSERT INTO users_languages (user_id, language_id) VALUES (2,5);
