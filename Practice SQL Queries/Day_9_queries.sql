USE quantum_tutors;

/*
Sub-queries

SELECT column
FROM table
WHERE column_name OPERATOR 
(
	SUB-QUERY
)

SUB-QUERY can be anywhere, i.e. at column or table's place
*/

SELECT first_name, last_name, contact_number, email
FROM customers
WHERE customer_id IN (
	SELECT customer_id FROM customers WHERE country = 'USA'
);

SELECT CONCAT(C.first_name, " ", C.last_name) as CustomerName, SUM(P.Amount) as TotalPaid
FROM customers C 
INNER JOIN payments P USING (customer_id)
INNER JOIN enrollments E USING (customer_id)
INNER JOIN courses CO USING (course_id)
WHERE CO.course_id IN (
	SELECT course_id FROM courses WHERE category = 'Physics'
)
GROUP BY CustomerName;


SELECT C.customer_id, CONCAT(C.first_name, " ", C.last_name) as CustomerName, SUM(P.Amount) as TotalPaid
FROM customers C
INNER JOIN payments P USING (customer_id)
WHERE customer_id IN (
	SELECT customer_id
	FROM enrollments
	WHERE course_id IN (
		SELECT course_id FROM courses WHERE category = 'Physics'
	)
)
GROUP BY C.customer_id, CustomerName
;

# Example of Non-corrleated sub query
SELECT title, price
FROM courses
WHERE Price > (
	SELECT AVG(Price) FROM courses
);


# Example of Corrleated sub query, outer query is dependent of the inner sub query
SELECT C1.title, C1.price, C1.Category
FROM courses C1
WHERE C1.Price > (
	SELECT AVG(C2.Price) FROM courses C2 WHERE C1.category = C2.category
);

SELECT AVG(price) FROM courses where category = 'Physics';

SELECT title, Price
FROM courses
WHERE price = (
	select Max(price) from courses
);

SELECT C1.Title, C1.Price, C1.Category
FROM courses C1
WHERE C1.price = (
	select Max(C2.price) from courses C2 where C1.Category = C2.category
);

# EXIST and NOT EXIST
SELECT first_name, last_name
FROM customers C
WHERE EXISTS (
	SELECT * FROM enrollments E 
    WHERE E.customer_id = C.customer_id
);

SELECT first_name, last_name
FROM customers C
WHERE NOT EXISTS (
	SELECT * FROM enrollments E 
    WHERE E.customer_id = C.customer_id
);

SELECT I.instructor_id, I.first_name, I.last_name
FROM instructors I
WHERE NOT EXISTS (
	SELECT * FROM courses C WHERE I.instructor_id = C.instructor_id
);

# Any and All keywords

SELECT course_id, Title, Price
FROM courses
WHERE price > ANY(
	SELECT price from courses where category = 'Physics'
);

SELECT course_id, Title, Price
FROM courses
WHERE price > ALL(
	SELECT price from courses where category = 'Physics'
);

# Top performing instructors
SELECT I.instructor_id, I.first_name, I.last_name
FROM instructors I
WHERE I.instructor_id IN (
	SELECT C.instructor_id FROM courses C
    INNER JOIN reviews R USING (course_id)
    WHERE R.rating > 4
);

# Top performing instructors - Another method
SELECT I.instructor_id, I.first_name, I.last_name
FROM instructors I
WHERE 4 >= ALL(
	SELECT rating FROM reviews R 
);


SELECT C.instructor_id, 
		(SELECT CONCAT(first_name , " ",last_name)
        FROM instructors I 
        WHERE C.instructor_id = I.instructor_id) as Instructor_Name, 
        AVG(R.rating) as Average_Rating
FROM courses C
INNER JOIN reviews R USING (course_id)
GROUP BY instructor_id
HAVING Average_Rating > 3.5;

DELETE FROM courses
WHERE course_id NOT IN (
	SELECT DISTINCT course_id FROM (
		SELECT * FROM enrollments 
    ) tmptbl 
);

SELECT * FROM enrollments;

DELETE FROM reviews
WHERE course_id NOT IN (
	SELECT course_id FROM (
		SELECT * FROM courses
    ) tmptbl
);

