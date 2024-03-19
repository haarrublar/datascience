-- modify surname variable/attribute/column to have variable length of 150 from table persons7
ALTER TABLE persons7
ADD surname VARCHAR(150);

-- rename the attribute/column/variable surname to description from table persons7
ALTER TABLE persons7
RENAME COLUMN surname TO description;

-- modify surname variable/attribute/column to have variable length of 250 from table persons7
ALTER TABLE persons7
MODIFY COLUMN description VARCHAR(250);

-- remove description column/variable/attribute from table persons7
ALTER TABLE persons7
DROP COLUMN description;