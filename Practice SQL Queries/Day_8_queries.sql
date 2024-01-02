/*
Data Manupulation Language - DML

Insert new record
update existing record
delete the record
*/

/*
INSERT INTO table_name (column1, column2, column3,...)
VALUES (value1, value2, value3,...);
*/
use quantum_tutors;

-- Specifying Columns in Order
INSERT INTO customers (first_name, last_name, contact_number, 
			email, registration_date)
VALUES ('John', 'Smith', '123-456-7890', 'john.smith@example.com', 
			CURDATE());
            
SELECT CURDATE();

-- Missing NOT NULL Column (Error)
INSERT INTO customers (first_name, last_name, contact_number, 
			email, registration_date)
VALUES ('Jane', 'Dillon', '555-555-5555', 'jane.dillon@example.com',
			CURDATE());
            
DESC customers;

-- Skipping Column Clause
INSERT INTO customers
VALUES (NULL, 'John', 'Dsa', '123-456-7890', 'john.Dsa@example.com', 
	'123 Main Street', 'New York City', 'NY', 'USA', CURDATE());
    
-- Not specifying all values
INSERT INTO customers (first_name, last_name, contact_number, 
		email, registration_date)
VALUES ('Jane', 'Dillon', '555-555-5555', 'jane.dillon@example.com',
		CURDATE());

SELECT * FROM customers;

DESC admins;
INSERT INTO admins (first_name, last_name, contact_number, email, password) 
VALUES ('New', 'Admin', '+91999999999', 'new.admin@gmail.com', 'securepassword');
SELECT * FROM admins;

/*
INSERT INTO table_name (column1, column2, column3,...)
VALUES
(value1_row1, value2_row1, value3_row1,...),
(value1_row2, value2_row2, value3_row2,...),
...;
*/

DESC courses;
ALTER TABLE courses
DROP column sub_category;

INSERT INTO courses (title, subtitle, description, price, 
			instructor_id, category, url, publish_date)
VALUES
('Astrophysics Basics', 'Introduction to Cosmos', 'A foundational course on astrophysics.', 99.99, 1, 'Science',  'https://courses-website.com/astrophysics', '2023-08-24'),
('Martian Geography', 'Understanding Mars', 'An in-depth dive into the geography of Mars.', 119.99, 2, 'Geography', 'https://courses-website.com/martian-geography', '2023-08-25');

DESC instructors;
INSERT INTO instructors VALUES 
(NULL, 'Hannah', 'Davis', 'Expert in Quantum Physics with over 10 years of research experience.', '+123-456-7890', 'hannah.davis@quantumtutors.com','54 Quantum Lane', 'Physicstown', 'Knowledgeland', 'Academia'),
(NULL,'Chris', 'Evans', 'Mathematician with a passion for pure math and its applications.', '+234-567-8901', 'chris.evans@quantumtutors.com','78 Algebra Ave','Mathville', 'Calculand', 'Academia'),
(NULL,'Diana', 'Watson', 'A chemist specializing in organic chemistry and biochemistry.', '+345-678-9012', 'diana.watson@quantumtutors.com','101 Molecule Manor','Chemical City', 'Reactionland', 'Academia');

SELECT *
FROM instructors;

# Inserting records from another table
/*
INSERT INTO table2 (column1, column2, column3,...)
SELECT column1, column2, column3,... 
FROM table1
WHERE condition;
*/

CREATE TABLE highspendingstudents (
	customer_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    amount FLOAT
);

INSERT INTO highspendingstudents (customer_id, first_name, last_name, amount)
SELECT C.customer_id, C.first_name, C.last_name, P.amount
FROM customers C
INNER JOIN payments P
USING (customer_id)
WHERE P.amount>150;

SELECT * FROM highspendingstudents;

# UPDATE statement
/*
UPDATE table_name
SET col1 = val1, col2 = val2
WHERE condition;
*/

UPDATE courses
SET title = 'Basics of Quantum Mechanics 101'
WHERE course_id = (
	SELECT course_id FROM (
		SELECT * FROM courses WHERE title = 'Basics of Quantum Mechanics') temp);

# Error Code: 1093. You can't specify target table 'courses' for update in FROM clause



SELECT course_id FROM courses 
WHERE title = 'Basics of Quantum Mechanics';

UPDATE courses
SET price = price * 1.10
WHERE course_id = 1;
SELECT * FROM courses;

