# DDL - Data Defination Language (Create/Alter/Delete operations)
SHOW DATABASES;

CREATE DATABASE newdatabase;
USE newdatabase;

SHOW TABLES;

/*
CREATE TABLE tablename (
	column1 datatype constraint,
    column2 datatype constraint,
    ...
)
*/

CREATE TABLE customers (
	customerID INT PRIMARY KEY AUTO_INCREMENT,
    firstname varchar(255),
    lastname varchar(255),
    contact varchar(255),
    email varchar(255),
    address varchar(255),
    city varchar(255),
    state varchar(255),
    country varchar(255),
    registration varchar(255) NOT NULL
);

SHOW TABLES;
DESCRIBE customers;   # 'DESC tablename' also works
DESC customers;

# Primary Key (can be defined either at the time of defining cols, or at the end of the table 

CREATE TABLE test (
	id INT,
    fname varchar(255),
    lname  varchar(255),
    address  varchar(255),
    PRIMARY KEY (id, fname)
);

DESC test;

# Foreign Keys
/*
CREATE TABLE tablename (
	column1 datatype constraint,
    column2 datatype constraint,
    ...
    FOREIGN KEY (column_name_of_this_table) REFERENCES other_tablename(columnname_of__other_table)
) */

CREATE TABLE test2 (
	order_id INT PRIMARY KEY AUTO_INCREMENT,
    id INT,
    cust_fname VARCHAR(255),
    cust_lname VARCHAR(255),
    cust_qty INT,
    FOREIGN KEY (id) REFERENCES test (id)
);

# copying the data from one table to another
/*
CREATE TABLE tablename AS 
SELECT * FROM tablename_to_copy
*/

# copy table structure with data
CREATE TABLE customers_copy_data AS 
SELECT * FROM customers;
SELECT * FROM customers_copy_data;

# copying table structure only
CREATE TABLE customers_copy_structure LIKE customers;
SELECT * FROM customers_copy_structure;

# copying specific records/rows
CREATE TABLE customers_copy_Lav AS 
SELECT * FROM customers
WHERE firstname LIKE 'Lav%';
SELECT * FROM customers_copy_Lav;

/* Alter table queries
Adding columns, constraints
Modifying column
Dropping column
renaming tables
*/

#creating a dummy table 
CREATE TABLE cust_data AS 
SELECT * FROM quantum_tutors.customers;

SELECT * FROM cust_data;

#adding a feild
ALTER TABLE cust_data 
ADD BIO VARCHAR(255);

#adding a feild with constraint
ALTER TABLE cust_data 
ADD NationalID VARCHAR(255) NOT NULL;
DESC cust_data;

# adding column after a specific column
ALTER TABLE cust_data
ADD FingerprintID INT AFTER BIO;
DESC cust_data;

# adding column at first position
ALTER TABLE cust_data
ADD UNIQUE_ID INT FIRST;
DESC cust_data;

# adding column
DESC quantum_tutors.courses;
ALTER TABLE quantum_tutors.courses
ADD CourseDuration FLOAT NOT NULL;
DESC quantum_tutors.courses;

# Drop columns
DESC cust_data;
ALTER TABLE cust_data
DROP column BIO;
DESC cust_data;

# Drop multiple columns (you can omit 'column' keyword from drop
DESC cust_data;
ALTER TABLE cust_data
DROP FingerprintID, DROP NationalID;
DESC cust_data;

# Modifying the datatype
DESC cust_data;
ALTER TABLE cust_data
MODIFY column contact_number INT;
DESC cust_data;


# Modifying the contraint
DESC cust_data;
ALTER TABLE cust_data
MODIFY column contact_number INT NOT NULL;
DESC cust_data;

SELECT * FROM cust_data;
# Modifying the multiple cols at once
DESC cust_data;
ALTER TABLE cust_data
MODIFY column first_name varchar(50),
MODIFY column last_name varchar(50);
DESC cust_data;

DESC quantum_tutors.courses;
ALTER TABLE quantum_tutors.courses
MODIFY instructor_id int NOT NULL;
DESC quantum_tutors.courses;

DESC quantum_tutors.courses;
ALTER TABLE quantum_tutors.courses
MODIFY category VARCHAR(500),
MODIFY title VARCHAR(500);
DESC quantum_tutors.courses;

# Drop query
# DROP DATABASE databasename
# DROP TABLE tablename

CREATE DATABASE db_drop;
DROP DATABASE db_drop;
DROP TABLE test2;

CREATE DATABASE IF NOT EXISTS dropdb;
DROP DATABASE IF EXISTS dropdb;
DROP TABLE IF EXISTS test2;

# TRUNCATE - if you want to remove records but the table
TRUNCATE TABLE customers_copy_data;

TRUNCATE TABLE quantum_tutors.payments;

# Dropping table with foreign key constrains
/* ALTER TABLE related_table_name
DROP FOREIGN KEY foreignkey_namel;
*/

# or 

/*
SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE table_name;

SET FOREIGN_KEY_CHECKS = 1;
*/


DROP TABLE quantum_tutors.instructors;
/*
Error Code: 3730. Cannot drop table 'instructors' referenced by a foreign key constraint 
'courses_ibfk_1' on table 'courses'.
*/

ALTER TABLE quantum_tutors.courses
DROP FOREIGN KEY courses_ibfk_1;
DROP TABLE quantum_tutors.instructors;

# or you can get the constraint names using the below command
SELECT CONSTRAINT_NAME 
FROM information_schema.KEY_COLUMN_USAGE 
WHERE TABLE_SCHEMA = 'DBNAME' 
AND TABLE_NAME = 'TABLENAME' 
AND REFERENCED_TABLE_NAME = 'TABLENAMETODELETE';

# Rename TABLE 
RENAME TABLE cust_data TO customer_data_renamed;
