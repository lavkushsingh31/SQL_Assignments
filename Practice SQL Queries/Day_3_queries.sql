use planetarygoods;

SELECT *
FROM customers
WHERE Country = 'USA';

/*
Arithmatic Operators
+
-
/
*
%

Comparison Operators
=
<>  or !=   #this is "not equal to" operator
<
>
<=
>=

LOGICAL Operators
AND
OR
NOT

*/


SELECT Category, Subcategory, Price,
(Price - (Price*0.1)) as Discounted_Price
FROM products;

SELECT Category, Subcategory, Price,
Price*0.1 as Discount,
Price-Discount as Final_Price
FROM products;


# Orders where the tax amount is more than 5% of the final total
SELECT * 
FROM orderdetails
WHERE Tax > (FinalTotal*0.08);

# how many products in the "Accessories" category are priced under $30?
select *
from products
where category = 'Accessories' and Price<30;

# Products in "Accessories" or "Optics" category where quantity is less than 20
SELECT *
FROM products
WHERE InStockQuantity <20 AND (category = 'Accessories' or category = 'Optics');

# Products in "Accessories" or "Optics" category where quantity is less than 20
SELECT *
FROM products
WHERE InStockQuantity <20 AND (category in ('Accessories','Optics'));

select concat(FirstName, " ",LastName) as Full_Name, Email, Country
from customers
Where country in ('USA', 'Canada', 'Mexico');

SELECT *
FROM products
WHERE category in ('Accessories','Optics');

# Between - both the limits are inclusive, mostly used with numbers and dates
SELECT *
FROM orders
WHERE Orderdate BETWEEN '2023-01-01' AND '2023-02-01';

# between also works with text, used alphabets to specify text ranges
SELECT *
FROM products
WHERE category BETWEEN 'A' and 'C';

SELECT * 
FROM products
WHERE (category = 'Home Decor') AND (Price BETWEEN 20 AND 100);

SELECT *
FROM customers
WHERE FirstName LIKE 'A%';

SELECT *
FROM customers
WHERE FirstName LIKE '_o%';   # second char is o

SELECT *
FROM products
WHERE productName LIKE "%5!%%" ESCAPE "!";

SELECT *
FROM products
WHERE productName LIKE "Star%";

SELECT *
FROM customers
WHERE address IS NULL;

# Counting null values
SELECT COUNT(*)
FROM customers
WHERE address IS NULL;
