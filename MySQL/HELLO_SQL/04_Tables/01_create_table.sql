
/*
create a table called "persons" with columns/attributes as follows:
- id type integer
- name type string long 100 characters
- age type integer
- email type string long 50 characters
- created type data
*/
CREATE TABLE persons ( -- the conditions are called CONSTRAINT and define the data type and structure
	id INT,
    name VARCHAR(100),
    age INT,
    email VARCHAR(50),
    created DATE
); 

-- create table with constraints

-- set name variable/column/attribute without nulls values
CREATE TABLE persons2 (
	id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    age INT,
    email VARCHAR(50),
    created DATE
); 

-- set id variable/column/attribute without nulls values.
-- set id variable/column/attribute with unique not repeated values
CREATE TABLE persons3 (
	id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    age INT,
    email VARCHAR(50),
    created DATETIME,
    UNIQUE(id) -- this flield does not admit repeated elements
); 

/*
Primary keys must contain UNIQUE values, and cannot contain NULL values.
*/

-- set id variable/column/attribute as the primary key (reference )
CREATE TABLE persons4 (
	id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    age INT,
    email VARCHAR(50),
    created DATETIME,
    PRIMARY KEY (id) -- id field is the reference in the database 
); 

-- restrict age variable/column/attribute to storage just values greater than 18
CREATE TABLE persons5 (
	id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    age INT,
    email VARCHAR(50),
    created DATETIME,
    PRIMARY KEY (id), -- id field is the reference in the database 
    CHECK(age>=18) -- condition over the data allowed in the table
); 

-- when empty the created variable/column/attribute set as default the system time
CREATE TABLE persons6 (
	id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    age INT,
    email VARCHAR(50),
    created DATETIME DEFAULT CURRENT_TIMESTAMP(), -- check the system time
    PRIMARY KEY (id), -- id field is the reference in the database 
    CHECK(age>=18) -- condition over the data allowed in the table
); 

-- set the id variable/column/attribute to auto increment its value by 1 when that value is not provided
CREATE TABLE persons7 (
	id INT NOT NULL AUTO_INCREMENT, -- the database increment the value automatically
    name VARCHAR(100) NOT NULL,
    age INT,
    email VARCHAR(50),
    created DATETIME DEFAULT CURRENT_TIMESTAMP(), -- check the system time
    PRIMARY KEY (id), -- id field is the reference in the database 
    CHECK(age>=18) -- condition over the data allowed in the table
); 