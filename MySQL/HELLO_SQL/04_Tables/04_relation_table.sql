/*
This tables are created to relate tables withtin the same database. The was databases are related is through tables
*/

/*
table 1:1 relation:
one-to-one is a relationship where each record in one table is related to exactly one record in another table, and vice versa.

- user_id column is the FOREIGN KEY of the PRIMARY KEY dni_id from table users.
- one user_id just may have one dni_id. one dni_id just may be related to one user_id
*/

CREATE TABLE dni (
	dni_id INT AUTO_INCREMENT PRIMARY KEY,
    dni_number INT NOT NULL,
    user_id INT,
    UNIQUE (dni_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);


/*
table 1:N relation:
"one-to-many" is a relationship relationship, where one record in table A can have multiple related records in table B, but each record in table B is related to only one record in table A.

- company_id just admits one unique (not prepeated) value in table companies (PRIMARY KEY)
- company_id is added to users table as FOREIGN KEY, and admits that any register have one or more value related to company_id
*/

CREATE table companies (
    company_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- in case the attribute company_id is not created in table users use ADD. If created company_id type in users and companies table must be the same for having a relation. 
ALTER TABLE users
MODIFY COLUMN company_id INT; -- there is need to change the data type. Both for relate each other needs to have the same structure and data type

-- when a FOREIGN KEY is not created from the begining use FOREIGN KEY command referencing where the foreign key comes from (companies table)
-- SQL automatically creates a name for that constraint. If the FOREIGN NAME needs a specific name it is use to name those starting by "fk_".
ALTER TABLE users
ADD CONSTRAINT fk_companies -- this "ADD CONSTRAINT" is for creating a constraint after a table is created
FOREIGN KEY (company_id) REFERENCES companies(company_id);




/*
N:M relation:
many-to-many is a relationship where each record in one table can be related to many records in another table, and vice versa. 

- the intermedium table as is usually called is regularly named concatenating both tables names: table1table2 or table1_table2
*/

CREATE TABLE languages (
	language_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- need to create a table that relates N table with M table (intermedium table) for relating users and languages table.
-- set two FOREIGN KEYS from both tables to relate: users and languages.
CREATE TABLE users_languages (
	users_languages_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    language_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (language_id) REFERENCES languages(language_id),
    UNIQUE (user_id, language_id)
);

