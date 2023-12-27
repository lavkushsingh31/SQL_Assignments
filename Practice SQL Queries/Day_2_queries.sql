USE planetarygoods;

SELECT FirstName, LastName
FROM customers;

# order in query matters, not in the table
SELECT LastName, FirstName
FROM customers;

/* 
Datatypes in SQL
> INT
> FLOAT
> DOUBLE
> DECIMAL(M,D)
> VARCHAR
> DATE
> DATETIME
... any many varients of these
*/


SELECT City
from customers;

SELECT DISTINCT City
from customers;

SELECT DISTINCT City, State  # DISTINCT is applied to both City and State, and it gives uniue combination of both
from customers;

SELECT DISTINCT Category,Subcategory
FROM products;


# Alias - Temp or alternate name, lasts only for the duration of the query
# Does not modify the names in the database column
SELECT FirstName as Name
FROM customers;

SELECT concat(FirstName, " ", LastName) as FullName
FROM customers;

SELECT concat(FirstName, " ", LastName) as 'Full Name'
FROM customers;

SELECT concat(FirstName, " ", LastName) as "Name",
email as "Email", Address, City, Country
from customers;


# Expressions - Combinations of numbers and mathematical ssymbols
SELECT 3-4;

SELECT ProductName,
Category, Subcategory, Price, InStockQuantity,
Price*InStockQuantity as "Total Worth"
FROM products;

# Nulls - absence of a value or an unknown value
# Null is not equal to another null, 0 or empty string
# Nulls cannot be used with comparison operator, however it can be used with Arithmatic operators to result in nulls

SELECT FirstName, LastName, Address
FROM customers;

SELECT FirstName, LastName, Address
FROM customers
WHERE Address IS NULL;

SELECT FirstName, LastName, 
ifnull(Address, "ADDRESS NOT PROVIDED") as Address
FROM customers;

# Coalesce can also be used in place of ifnull
SELECT FirstName, LastName, 
coalesce(Address, "ADDRESS NOT PROVIDED") as Address
FROM customers;

# If we want to concat null cols without affecting the overall result

SELECT FirstName, LastName, 
		concat(coalesce(Address, ""), ",", City, ",", State, ",", Country) as FullAddress
FROM customers;


# Order by
# comes after from and where
# default is ascending

SELECT * 
FROM orders;

SELECT * 
FROM orders
ORDER BY OrderDate, TotalPaid DESC;

SELECT * 
FROM products
ORDER BY SupplierID, Category, ProductName;

SELECT * 
FROM products
ORDER BY Price desc; 

SELECT *
FROM products
ORDER BY Price desc
LIMIT 10;

# offset is used to skip that many records
SELECT *
FROM products
ORDER BY Price desc
LIMIT 10 OFFSET 5;

SELECT *
FROM orders
ORDER BY TotalPaid DESC
LIMIT 10;

SELECT ProductName, Price
FROM products
ORDER BY Price desc
LIMIT 5;

