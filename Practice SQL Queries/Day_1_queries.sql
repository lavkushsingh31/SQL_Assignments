USE planetarygoods;
SELECT database();

SELECT *
FROM customers;

SELECT *
FROM customers
LIMIT 10;

SELECT FirstName, LastName, Country
FROM customers
WHERE Country='USA' OR Country='Mexico';

SELECT FirstName, LastName, Country
FROM customers
WHERE country IN ('USA', 'Mexico');

SELECT *
FROM products;

SELECT *
FROM products
WHERE ProductName = 'Space Adventure Puzzle';

-- This is comment in SQL
# This is another way of writing comments
/* 
This is also a comment in SQL, however this is a multiline comment
*/

